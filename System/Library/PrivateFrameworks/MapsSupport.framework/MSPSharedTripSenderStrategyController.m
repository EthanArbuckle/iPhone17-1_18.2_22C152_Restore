@interface MSPSharedTripSenderStrategyController
+ (void)updateGroupSessionStorage:(id)a3 fromController:(id)a4;
- (BOOL)_enableVirtualReceivers;
- (BOOL)addLiveParticipants:(id)a3;
- (BOOL)addParticipants:(id)a3 forServiceName:(id)a4;
- (BOOL)removeLiveParticipant:(id)a3;
- (BOOL)removeParticipant:(id)a3 forServiceName:(id)a4 reason:(unint64_t)a5;
- (BOOL)removeParticipant:(id)a3 reason:(unint64_t)a4;
- (MSPSharedTripSenderStrategyController)initWithGroupSession:(id)a3 messageStrategyDelegate:(id)a4;
- (id)_createMinimalSenderForServiceName:(id)a3;
- (id)_createMinimalSenderWithMapsClass:(Class)a3 messagesClass:(Class)a4 serviceName:(id)a5;
- (id)_currentLiveSender:(BOOL)a3;
- (id)_currentMinimalSenderForServiceName:(id)a3 createIfNeeded:(BOOL)a4;
- (id)_currentSendersByServiceName;
- (void)_performBlockWithMinimalSenders:(id)a3;
- (void)_updateGroupSessionStorage:(id)a3;
- (void)performWithAllMinimalSenders:(id)a3;
- (void)performWithVirtualSenders:(BOOL)a3 block:(id)a4;
- (void)removeLiveParticipants:(id)a3;
- (void)restoreFromGroupSessionStorage:(id)a3;
- (void)setState:(id)a3 forEvent:(unint64_t)a4;
@end

@implementation MSPSharedTripSenderStrategyController

- (MSPSharedTripSenderStrategyController)initWithGroupSession:(id)a3 messageStrategyDelegate:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)MSPSharedTripSenderStrategyController;
  v9 = [(MSPSharedTripSenderStrategyController *)&v24 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_groupSession, a3);
    objc_storeWeak((id *)&v10->_messageStrategyDelegate, v8);
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:4];
    senderStrategiesByServiceName = v10->_senderStrategiesByServiceName;
    v10->_senderStrategiesByServiceName = (NSMutableDictionary *)v11;

    v13 = [MEMORY[0x1E4F64860] sharedPlatform];
    int v14 = [v13 isInternalInstall];

    if (v14)
    {
      v15 = MSPGetSharedTripLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v16 = NSString;
        v17 = v10;
        v18 = [v16 stringWithFormat:@"%@<%p>", objc_opt_class(), v17];

        *(_DWORD *)buf = 138543362;
        v26 = v18;
        _os_log_impl(&dword_1B87E5000, v15, OS_LOG_TYPE_INFO, "[%{public}@] Virtual Senders are supported", buf, 0xCu);
      }
      uint64_t v19 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:4];
      virtualSenderStrategiesByServiceName = v10->_virtualSenderStrategiesByServiceName;
      v10->_virtualSenderStrategiesByServiceName = (NSMutableDictionary *)v19;

      v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      nestedVirtualReceiverEnablement = v10->_nestedVirtualReceiverEnablement;
      v10->_nestedVirtualReceiverEnablement = v21;
    }
  }

  return v10;
}

- (BOOL)addParticipants:(id)a3 forServiceName:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MSPSharedTripSenderStrategyController *)self _currentMinimalSenderForServiceName:v7 createIfNeeded:1];
  v9 = MSPGetSharedTripLog();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (v10)
    {
      if (self)
      {
        uint64_t v11 = NSString;
        v12 = self;
        v13 = [v11 stringWithFormat:@"%@<%p>", objc_opt_class(), v12];
      }
      else
      {
        v13 = @"<nil>";
      }
      v17 = NSString;
      id v18 = v8;
      uint64_t v19 = v13;
      v20 = [v17 stringWithFormat:@"%@<%p>", objc_opt_class(), v18];

      *(_DWORD *)buf = 138544131;
      v23 = v13;
      __int16 v24 = 2113;
      id v25 = v6;
      __int16 v26 = 2114;
      id v27 = v7;
      __int16 v28 = 2114;
      v29 = v20;
      _os_log_impl(&dword_1B87E5000, v9, OS_LOG_TYPE_INFO, "[%{public}@] addParticipants %{private}@ to %{public}@/%{public}@", buf, 0x2Au);
    }
    [v8 addParticipants:v6];
  }
  else
  {
    if (v10)
    {
      if (self)
      {
        int v14 = NSString;
        v15 = self;
        v16 = [v14 stringWithFormat:@"%@<%p>", objc_opt_class(), v15];
      }
      else
      {
        v16 = @"<nil>";
      }
      *(_DWORD *)buf = 138543875;
      v23 = v16;
      __int16 v24 = 2113;
      id v25 = v6;
      __int16 v26 = 2114;
      id v27 = v7;
      _os_log_impl(&dword_1B87E5000, v9, OS_LOG_TYPE_INFO, "[%{public}@] addParticipants %{private}@ no sender for %{public}@", buf, 0x20u);
    }
  }

  return v8 != 0;
}

- (BOOL)removeParticipant:(id)a3 forServiceName:(id)a4 reason:(unint64_t)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = [(MSPSharedTripSenderStrategyController *)self _currentMinimalSenderForServiceName:v9 createIfNeeded:1];
  uint64_t v11 = v10;
  if (v10)
  {
    int v12 = [v10 removeParticipant:v8 forReason:a5];
    v13 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      if (self)
      {
        int v14 = NSString;
        v15 = self;
        v16 = [v14 stringWithFormat:@"%@<%p>", objc_opt_class(), v15];
      }
      else
      {
        v16 = @"<nil>";
      }
      if (v12) {
        v20 = "yes";
      }
      else {
        v20 = "no";
      }
      v21 = NSString;
      id v22 = v11;
      v23 = v16;
      __int16 v24 = [v21 stringWithFormat:@"%@<%p>", objc_opt_class(), v22];

      *(_DWORD *)buf = 138544387;
      id v27 = v16;
      __int16 v28 = 2113;
      id v29 = v8;
      __int16 v30 = 2080;
      v31 = v20;
      __int16 v32 = 2114;
      id v33 = v9;
      __int16 v34 = 2114;
      v35 = v24;
      _os_log_impl(&dword_1B87E5000, v13, OS_LOG_TYPE_INFO, "[%{public}@] removeParticipant %{private}@ %s from %{public}@/%{public}@", buf, 0x34u);
    }
  }
  else
  {
    v13 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      if (self)
      {
        v17 = NSString;
        id v18 = self;
        uint64_t v19 = [v17 stringWithFormat:@"%@<%p>", objc_opt_class(), v18];
      }
      else
      {
        uint64_t v19 = @"<nil>";
      }
      *(_DWORD *)buf = 138543618;
      id v27 = v19;
      __int16 v28 = 2114;
      id v29 = v9;
      _os_log_impl(&dword_1B87E5000, v13, OS_LOG_TYPE_INFO, "[%{public}@] removeParticipant no sender for %{public}@", buf, 0x16u);
    }
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (BOOL)removeParticipant:(id)a3 reason:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__MSPSharedTripSenderStrategyController_removeParticipant_reason___block_invoke;
  v9[3] = &unk_1E617E8F8;
  id v7 = v6;
  id v10 = v7;
  uint64_t v11 = self;
  int v12 = &v14;
  unint64_t v13 = a4;
  [(MSPSharedTripSenderStrategyController *)self _performBlockWithMinimalSenders:v9];
  LOBYTE(a4) = *((unsigned char *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return a4;
}

void __66__MSPSharedTripSenderStrategyController_removeParticipant_reason___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([v5 removeParticipant:a1[4] forReason:a1[7]])
  {
    id v7 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = (void *)a1[5];
      if (v8)
      {
        id v9 = NSString;
        id v10 = v8;
        uint64_t v11 = [v9 stringWithFormat:@"%@<%p>", objc_opt_class(), v10];
      }
      else
      {
        uint64_t v11 = @"<nil>";
      }
      int v12 = v11;
      uint64_t v13 = a1[4];
      id v14 = v5;
      if (v14)
      {
        v15 = [NSString stringWithFormat:@"%@<%p>", objc_opt_class(), v14];
      }
      else
      {
        v15 = @"<nil>";
      }

      *(_DWORD *)buf = 138544131;
      char v17 = v12;
      __int16 v18 = 2113;
      uint64_t v19 = v13;
      __int16 v20 = 2114;
      id v21 = v6;
      __int16 v22 = 2114;
      v23 = v15;
      _os_log_impl(&dword_1B87E5000, v7, OS_LOG_TYPE_INFO, "[%{public}@] removeParticipant %{private}@ from %{public}@/%{public}@", buf, 0x2Au);
    }
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
}

- (BOOL)addLiveParticipants:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(MSPSharedTripSenderStrategyController *)self _currentLiveSender:1];
  [v5 addParticipants:v4];
  id v6 = MSPGetSharedTripLog();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      if (self)
      {
        id v8 = NSString;
        id v9 = self;
        id v10 = [v8 stringWithFormat:@"%@<%p>", objc_opt_class(), v9];
      }
      else
      {
        id v10 = @"<nil>";
      }
      id v14 = NSString;
      id v15 = v5;
      uint64_t v13 = v10;
      uint64_t v16 = [v14 stringWithFormat:@"%@<%p>", objc_opt_class(), v15];

      *(_DWORD *)buf = 138543875;
      uint64_t v19 = v10;
      __int16 v20 = 2113;
      id v21 = v4;
      __int16 v22 = 2114;
      v23 = v16;
      _os_log_impl(&dword_1B87E5000, v6, OS_LOG_TYPE_INFO, "[%{public}@] addLiveParticipants %{private}@ to %{public}@", buf, 0x20u);

LABEL_12:
    }
  }
  else if (v7)
  {
    if (self)
    {
      uint64_t v11 = NSString;
      int v12 = self;
      uint64_t v13 = [v11 stringWithFormat:@"%@<%p>", objc_opt_class(), v12];
    }
    else
    {
      uint64_t v13 = @"<nil>";
    }
    *(_DWORD *)buf = 138543619;
    uint64_t v19 = v13;
    __int16 v20 = 2113;
    id v21 = v4;
    _os_log_impl(&dword_1B87E5000, v6, OS_LOG_TYPE_INFO, "[%{public}@] addLiveParticipants %{private}@ no live sender", buf, 0x16u);
    goto LABEL_12;
  }

  return v5 != 0;
}

- (BOOL)removeLiveParticipant:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(MSPSharedTripSenderStrategyController *)self _currentLiveSender:0];
  int v6 = [v5 removeParticipant:v4 forReason:0];
  BOOL v7 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    if (self)
    {
      id v8 = NSString;
      id v9 = self;
      id v10 = [v8 stringWithFormat:@"%@<%p>", objc_opt_class(), v9];
    }
    else
    {
      id v10 = @"<nil>";
    }
    uint64_t v11 = v10;
    if (v6) {
      int v12 = "yes";
    }
    else {
      int v12 = "no";
    }
    id v13 = v5;
    if (v13)
    {
      id v14 = [NSString stringWithFormat:@"%@<%p>", objc_opt_class(), v13];
    }
    else
    {
      id v14 = @"<nil>";
    }

    *(_DWORD *)buf = 138544131;
    char v17 = v11;
    __int16 v18 = 2113;
    id v19 = v4;
    __int16 v20 = 2080;
    id v21 = v12;
    __int16 v22 = 2114;
    v23 = v14;
    _os_log_impl(&dword_1B87E5000, v7, OS_LOG_TYPE_INFO, "[%{public}@] removeLiveParticipant %{private}@ %s from %{public}@", buf, 0x2Au);
  }
  return v6;
}

- (void)removeLiveParticipants:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(MSPSharedTripSenderStrategyController *)self _currentLiveSender:0];
  [v5 removeParticipants:v4];
  int v6 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    if (self)
    {
      BOOL v7 = NSString;
      id v8 = self;
      id v9 = [v7 stringWithFormat:@"%@<%p>", objc_opt_class(), v8];
    }
    else
    {
      id v9 = @"<nil>";
    }
    id v10 = v9;
    id v11 = v5;
    if (v11)
    {
      int v12 = [NSString stringWithFormat:@"%@<%p>", objc_opt_class(), v11];
    }
    else
    {
      int v12 = @"<nil>";
    }

    *(_DWORD *)buf = 138543875;
    id v14 = v10;
    __int16 v15 = 2113;
    id v16 = v4;
    __int16 v17 = 2114;
    __int16 v18 = v12;
    _os_log_impl(&dword_1B87E5000, v6, OS_LOG_TYPE_INFO, "[%{public}@] removeLiveParticipants %{private}@ from %{public}@", buf, 0x20u);
  }
}

- (void)setState:(id)a3 forEvent:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __59__MSPSharedTripSenderStrategyController_setState_forEvent___block_invoke;
  id v11 = &unk_1E617E920;
  id v12 = v6;
  unint64_t v13 = a4;
  id v7 = v6;
  [(MSPSharedTripSenderStrategyController *)self performWithAllMinimalSenders:&v8];
  -[MSPSenderIDSStrategy setState:forEvent:](self->_liveSender, "setState:forEvent:", v7, a4, v8, v9, v10, v11);
  [(MSPSenderIDSStrategy *)self->_virtualLiveSender setState:v7 forEvent:a4];
}

uint64_t __59__MSPSharedTripSenderStrategyController_setState_forEvent___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setState:*(void *)(a1 + 32) forEvent:*(void *)(a1 + 40)];
}

+ (void)updateGroupSessionStorage:(id)a3 fromController:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    if (a1)
    {
      uint64_t v9 = NSString;
      id v10 = a1;
      id v11 = [v9 stringWithFormat:@"%@<%p>", objc_opt_class(), v10];
    }
    else
    {
      id v11 = @"<nil>";
    }
    id v12 = "will update from controller";
    if (!v6) {
      id v12 = "no strategy controller to update from";
    }
    *(_DWORD *)buf = 138543618;
    id v14 = v11;
    __int16 v15 = 2080;
    id v16 = v12;
    _os_log_impl(&dword_1B87E5000, v8, OS_LOG_TYPE_INFO, "[%{public}@] updateGroupSessionStorage clearing storage, %s", buf, 0x16u);
  }
  [v7 clearMinimalStrategyIdentifiers];
  [v7 clearMessageStrategyIdentifiers];
  [v7 clearSmsStrategyIdentifiers];
  [v7 clearLiveStrategyIdentifiers];
  [v6 _updateGroupSessionStorage:v7];
}

- (void)restoreFromGroupSessionStorage:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    if (self)
    {
      id v6 = NSString;
      id v7 = self;
      uint64_t v8 = [v6 stringWithFormat:@"%@<%p>", objc_opt_class(), v7];
    }
    else
    {
      uint64_t v8 = @"<nil>";
    }
    *(_DWORD *)buf = 138543362;
    id v16 = v8;
    _os_log_impl(&dword_1B87E5000, v5, OS_LOG_TYPE_INFO, "[%{public}@] restoreFromGroupStorage", buf, 0xCu);
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __72__MSPSharedTripSenderStrategyController_restoreFromGroupSessionStorage___block_invoke;
  v13[3] = &unk_1E617E828;
  id v9 = v4;
  id v14 = v9;
  [(MSPSharedTripSenderStrategyController *)self _performBlockWithMinimalSenders:v13];
  if ([v9 liveStrategyIdentifiersCount])
  {
    id v10 = (void *)MEMORY[0x1E4F6AB90];
    id v11 = [v9 liveStrategyIdentifiers];
    id v12 = objc_msgSend(v10, "_msp_IDSIdentifiersFor:", v11);

    [(MSPSenderLiveStrategy *)self->_liveSender addParticipants:v12];
  }
}

void __72__MSPSharedTripSenderStrategyController_restoreFromGroupSessionStorage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  if ([v5 isEqualToString:@"Maps"]
    && [*(id *)(a1 + 32) minimalStrategyIdentifiersCount])
  {
    if (![*(id *)(a1 + 32) minimalStrategyIdentifiersCount]) {
      goto LABEL_12;
    }
    id v6 = (void *)MEMORY[0x1E4F6AB90];
    id v7 = [*(id *)(a1 + 32) minimalStrategyIdentifiers];
    uint64_t v8 = objc_msgSend(v6, "_msp_IDSIdentifiersFor:", v7);
  }
  else
  {
    if ([v5 isEqualToString:@"iMessage"]
      && ([*(id *)(a1 + 32) messageStrategyIdentifiers],
          id v9 = objc_claimAutoreleasedReturnValue(),
          v9,
          v9))
    {
      uint64_t v10 = [*(id *)(a1 + 32) messageStrategyIdentifiers];
    }
    else
    {
      id v11 = [*(id *)(a1 + 32) smsStrategyIdentifiers];

      if (!v11) {
        goto LABEL_12;
      }
      uint64_t v10 = [*(id *)(a1 + 32) smsStrategyIdentifiers];
    }
    uint64_t v8 = (void *)v10;
  }
  [v12 addParticipants:v8];

LABEL_12:
}

- (void)_updateGroupSessionStorage:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    if (self)
    {
      id v6 = NSString;
      id v7 = self;
      uint64_t v8 = [v6 stringWithFormat:@"%@<%p>", objc_opt_class(), v7];
    }
    else
    {
      uint64_t v8 = @"<nil>";
    }
    *(_DWORD *)buf = 138543362;
    id v16 = v8;
    _os_log_impl(&dword_1B87E5000, v5, OS_LOG_TYPE_INFO, "[%{public}@] updateGroupSessionStorage", buf, 0xCu);
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__MSPSharedTripSenderStrategyController__updateGroupSessionStorage___block_invoke;
  v13[3] = &unk_1E617E828;
  id v14 = v4;
  id v9 = v4;
  [(MSPSharedTripSenderStrategyController *)self _performBlockWithMinimalSenders:v13];
  uint64_t v10 = [(MSPSenderStrategy *)self->_liveSender participants];
  id v11 = [v10 allObjects];
  id v12 = (void *)[v11 mutableCopy];
  [v9 setLiveStrategyIdentifiers:v12];
}

void __68__MSPSharedTripSenderStrategyController__updateGroupSessionStorage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a3;
  id v5 = [a2 participants];
  id v6 = [v5 allObjects];
  id v7 = (void *)[v6 mutableCopy];

  if ([v10 isEqualToString:@"Maps"])
  {
    [*(id *)(a1 + 32) setMinimalStrategyIdentifiers:v7];
  }
  else
  {
    int v8 = [v10 isEqualToString:@"iMessage"];
    id v9 = *(void **)(a1 + 32);
    if (v8) {
      [v9 setMessageStrategyIdentifiers:v7];
    }
    else {
      [v9 setSmsStrategyIdentifiers:v7];
    }
  }
}

- (id)_currentMinimalSenderForServiceName:(id)a3 createIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(MSPSharedTripSenderStrategyController *)self _currentSendersByServiceName];
  int v8 = [v7 objectForKeyedSubscript:v6];
  if (!v8 && v4)
  {
    int v8 = [(MSPSharedTripSenderStrategyController *)self _createMinimalSenderForServiceName:v6];
    [v7 setObject:v8 forKeyedSubscript:v6];
  }

  return v8;
}

- (id)_createMinimalSenderForServiceName:(id)a3
{
  id v4 = a3;
  [(MSPSharedTripSenderStrategyController *)self _enableVirtualReceivers];
  uint64_t v5 = objc_opt_class();
  id v6 = [(MSPSharedTripSenderStrategyController *)self _createMinimalSenderWithMapsClass:v5 messagesClass:objc_opt_class() serviceName:v4];

  return v6;
}

- (id)_createMinimalSenderWithMapsClass:(Class)a3 messagesClass:(Class)a4 serviceName:(id)a5
{
  id v8 = a5;
  if ([v8 isEqualToString:@"Maps"])
  {
    id v9 = (void *)[[a3 alloc] initWithGroupSession:self->_groupSession];
  }
  else
  {
    if ([v8 isEqualToString:@"iMessage"]) {
      uint64_t v10 = 3;
    }
    else {
      uint64_t v10 = 2;
    }
    id v11 = [a4 alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_messageStrategyDelegate);
    id v9 = (void *)[v11 initWithDelegate:WeakRetained capabilityType:v10 serviceName:v8];
  }

  return v9;
}

- (id)_currentLiveSender:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(MSPSharedTripSenderStrategyController *)self _enableVirtualReceivers])
  {
    p_liveSender = (void **)&self->_liveSender;
    liveSender = (MSPSenderVirtualLiveStrategy *)self->_liveSender;
    if (liveSender) {
      BOOL v8 = 1;
    }
    else {
      BOOL v8 = !v3;
    }
    if (v8) {
      goto LABEL_11;
    }
    id v7 = off_1E617C148;
    goto LABEL_10;
  }
  p_liveSender = (void **)&self->_virtualLiveSender;
  liveSender = self->_virtualLiveSender;
  if (!liveSender && v3)
  {
    id v7 = off_1E617C160;
LABEL_10:
    uint64_t v9 = [objc_alloc(*v7) initWithGroupSession:self->_groupSession];
    uint64_t v10 = *p_liveSender;
    *p_liveSender = (void *)v9;

    liveSender = (MSPSenderVirtualLiveStrategy *)*p_liveSender;
  }
LABEL_11:

  return liveSender;
}

- (void)performWithAllMinimalSenders:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70__MSPSharedTripSenderStrategyController_performWithAllMinimalSenders___block_invoke;
  v9[3] = &unk_1E617E948;
  id v5 = v4;
  id v10 = v5;
  [(MSPSharedTripSenderStrategyController *)self performWithVirtualSenders:0 block:v9];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__MSPSharedTripSenderStrategyController_performWithAllMinimalSenders___block_invoke_2;
  v7[3] = &unk_1E617E948;
  id v8 = v5;
  id v6 = v5;
  [(MSPSharedTripSenderStrategyController *)self performWithVirtualSenders:1 block:v7];
}

uint64_t __70__MSPSharedTripSenderStrategyController_performWithAllMinimalSenders___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _performBlockWithMinimalSenders:*(void *)(a1 + 32)];
}

uint64_t __70__MSPSharedTripSenderStrategyController_performWithAllMinimalSenders___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 _performBlockWithMinimalSenders:*(void *)(a1 + 32)];
}

- (void)_performBlockWithMinimalSenders:(id)a3
{
  id v4 = a3;
  id v5 = [(MSPSharedTripSenderStrategyController *)self _currentSendersByServiceName];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__MSPSharedTripSenderStrategyController__performBlockWithMinimalSenders___block_invoke;
  v7[3] = &unk_1E617E970;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:v7];
}

uint64_t __73__MSPSharedTripSenderStrategyController__performBlockWithMinimalSenders___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)performWithVirtualSenders:(BOOL)a3 block:(id)a4
{
  BOOL v4 = a3;
  nestedVirtualReceiverEnablement = self->_nestedVirtualReceiverEnablement;
  id v7 = (void (**)(id, MSPSharedTripSenderStrategyController *))a4;
  uint64_t v8 = [(NSMutableArray *)nestedVirtualReceiverEnablement count];
  uint64_t v9 = self->_nestedVirtualReceiverEnablement;
  id v10 = [NSNumber numberWithBool:v4];
  [(NSMutableArray *)v9 addObject:v10];

  v7[2](v7, self);
  id v11 = self->_nestedVirtualReceiverEnablement;

  [(NSMutableArray *)v11 removeObjectAtIndex:v8];
}

- (BOOL)_enableVirtualReceivers
{
  v2 = [(NSMutableArray *)self->_nestedVirtualReceiverEnablement lastObject];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (id)_currentSendersByServiceName
{
  BOOL v3 = [(MSPSharedTripSenderStrategyController *)self _enableVirtualReceivers];
  uint64_t v4 = 24;
  if (v3) {
    uint64_t v4 = 40;
  }
  id v5 = *(Class *)((char *)&self->super.isa + v4);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nestedVirtualReceiverEnablement, 0);
  objc_storeStrong((id *)&self->_virtualLiveSender, 0);
  objc_storeStrong((id *)&self->_virtualSenderStrategiesByServiceName, 0);
  objc_storeStrong((id *)&self->_liveSender, 0);
  objc_storeStrong((id *)&self->_senderStrategiesByServiceName, 0);
  objc_destroyWeak((id *)&self->_messageStrategyDelegate);

  objc_storeStrong((id *)&self->_groupSession, 0);
}

@end