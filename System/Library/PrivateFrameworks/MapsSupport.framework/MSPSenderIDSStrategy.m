@interface MSPSenderIDSStrategy
+ (double)_etaRefreshIntervalForState:(id)a3;
- (BOOL)_needToSendETARefreshFor:(id)a3 state:(id)a4;
- (BOOL)setState:(id)a3 forEvent:(unint64_t)a4;
- (MSPSenderIDSStrategy)initWithGroupSession:(id)a3;
- (NSMutableDictionary)capabilitiesByParticipant;
- (NSMutableDictionary)lastETAUpdateDates;
- (NSMutableDictionary)participantsByCapabilities;
- (id)_filteredParticipantsForState:(id)a3 event:(unint64_t)a4;
- (void)_sendCompatibleInstancesOfState:(id)a3 to:(id)a4;
- (void)_sendDestinationReachedUpdate:(id)a3 to:(id)a4;
- (void)_sendETAUpdate:(id)a3 to:(id)a4;
- (void)_sendETAUpdateIfNeededTo:(id)a3;
- (void)_sendResumingToNextDestinationUpdate:(id)a3 to:(id)a4;
- (void)_sendRouteUpdate:(id)a3 to:(id)a4;
- (void)_sendStoppedUpdate:(id)a3 to:(id)a4;
- (void)_sendTrafficUpdate:(id)a3 to:(id)a4;
- (void)_sendUpdatedWaypoints:(id)a3 to:(id)a4;
- (void)addParticipants:(id)a3;
- (void)fetchCapabilitiesForParticipants:(id)a3 completion:(id)a4;
- (void)setCapabilitiesByParticipant:(id)a3;
- (void)setLastETAUpdateDates:(id)a3;
- (void)setParticipantsByCapabilities:(id)a3;
@end

@implementation MSPSenderIDSStrategy

- (MSPSenderIDSStrategy)initWithGroupSession:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MSPSenderIDSStrategy;
  v6 = [(MSPSenderStrategy *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_groupSession, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    lastETAUpdateDates = v7->_lastETAUpdateDates;
    v7->_lastETAUpdateDates = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    participantsByCapabilities = v7->_participantsByCapabilities;
    v7->_participantsByCapabilities = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    capabilitiesByParticipant = v7->_capabilitiesByParticipant;
    v7->_capabilitiesByParticipant = v12;
  }
  return v7;
}

- (id)_filteredParticipantsForState:(id)a3 event:(unint64_t)a4
{
  v4 = (void *)[(NSMutableSet *)self->super._participants copy];

  return v4;
}

- (BOOL)setState:(id)a3 forEvent:(unint64_t)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v38.receiver = self;
  v38.super_class = (Class)MSPSenderIDSStrategy;
  if ([(MSPSenderStrategy *)&v38 setState:v6 forEvent:a4])
  {
    v7 = [(MSPSenderIDSStrategy *)self _filteredParticipantsForState:v6 event:a4];
    if ([v7 count])
    {
      switch(a4)
      {
        case 0uLL:
          v13 = MSPGetSharedTripLog();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            if (self)
            {
              v14 = NSString;
              objc_super v15 = self;
              v16 = [v14 stringWithFormat:@"%@<%p>", objc_opt_class(), v15];
            }
            else
            {
              v16 = @"<nil>";
            }
            *(_DWORD *)buf = 138543362;
            v41 = v16;
            _os_log_impl(&dword_1B87E5000, v13, OS_LOG_TYPE_INFO, "[%{public}@] - will immediately attempt to send initial state waypoints/route", buf, 0xCu);
          }
          if ([(id)objc_opt_class() _supportsEvent:3]) {
            [(MSPSenderIDSStrategy *)self _sendUpdatedWaypoints:v6 to:v7];
          }
          if ([(id)objc_opt_class() _supportsEvent:5]) {
            goto LABEL_26;
          }
          break;
        case 1uLL:
          v17 = MSPGetSharedTripLog();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            if (self)
            {
              v18 = NSString;
              v19 = self;
              v20 = [v18 stringWithFormat:@"%@<%p>", objc_opt_class(), v19];
            }
            else
            {
              v20 = @"<nil>";
            }
            participants = self->super._participants;
            v22 = v20;
            uint64_t v23 = [(NSMutableSet *)participants count];
            v24 = self->super._participants;

            *(_DWORD *)buf = 138543875;
            v41 = v20;
            __int16 v42 = 2048;
            uint64_t v43 = v23;
            __int16 v44 = 2113;
            v45 = v24;
            _os_log_impl(&dword_1B87E5000, v17, OS_LOG_TYPE_INFO, "[%{public}@] - restoring state, resetting lastETAUpdateDate for %lu participants (%{private}@)", buf, 0x20u);
          }
          v25 = [MEMORY[0x1E4F1C9C8] date];
          long long v34 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          id v26 = v7;
          uint64_t v27 = [v26 countByEnumeratingWithState:&v34 objects:v39 count:16];
          if (v27)
          {
            uint64_t v28 = v27;
            uint64_t v29 = *(void *)v35;
            do
            {
              for (uint64_t i = 0; i != v28; ++i)
              {
                if (*(void *)v35 != v29) {
                  objc_enumerationMutation(v26);
                }
                uint64_t v31 = *(void *)(*((void *)&v34 + 1) + 8 * i);
                v32 = [(MSPSenderIDSStrategy *)self lastETAUpdateDates];
                [v32 setObject:v25 forKeyedSubscript:v31];
              }
              uint64_t v28 = [v26 countByEnumeratingWithState:&v34 objects:v39 count:16];
            }
            while (v28);
          }

          break;
        case 2uLL:
        case 4uLL:
          [(MSPSenderIDSStrategy *)self _sendETAUpdateIfNeededTo:v7];
          break;
        case 3uLL:
          [(MSPSenderIDSStrategy *)self _sendUpdatedWaypoints:v6 to:v7];
          break;
        case 5uLL:
LABEL_26:
          [(MSPSenderIDSStrategy *)self _sendRouteUpdate:v6 to:v7];
          break;
        case 6uLL:
          [(MSPSenderIDSStrategy *)self _sendTrafficUpdate:v6 to:v7];
          break;
        case 7uLL:
          [(MSPSenderIDSStrategy *)self _sendDestinationReachedUpdate:v6 to:v7];
          break;
        case 8uLL:
          [(MSPSenderIDSStrategy *)self _sendResumingToNextDestinationUpdate:v6 to:v7];
          break;
        case 9uLL:
          [(MSPSenderIDSStrategy *)self _sendStoppedUpdate:v6 to:v7];
          break;
        default:
          break;
      }
    }
    else if ([(NSMutableSet *)self->super._participants count])
    {
      v9 = MSPGetSharedTripLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = NSString;
        v11 = self;
        v12 = [v10 stringWithFormat:@"%@<%p>", objc_opt_class(), v11];

        *(_DWORD *)buf = 138543362;
        v41 = v12;
        _os_log_impl(&dword_1B87E5000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] - no participants left for event after filtering", buf, 0xCu);
      }
      BOOL v8 = 0;
      goto LABEL_38;
    }
    BOOL v8 = 1;
LABEL_38:

    goto LABEL_39;
  }
  BOOL v8 = 0;
LABEL_39:

  return v8;
}

+ (double)_etaRefreshIntervalForState:(id)a3
{
  return -1.0;
}

- (BOOL)_needToSendETARefreshFor:(id)a3 state:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(MSPSenderIDSStrategy *)self lastETAUpdateDates];
  v9 = [v8 objectForKeyedSubscript:v6];

  if (v9)
  {
    [(id)objc_opt_class() _etaRefreshIntervalForState:v7];
    if (v10 < 0.0)
    {
      v11 = MSPGetSharedTripLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        if (self)
        {
          v12 = NSString;
          v13 = self;
          v14 = [v12 stringWithFormat:@"%@<%p>", objc_opt_class(), v13];
        }
        else
        {
          v14 = @"<nil>";
        }
        *(_DWORD *)buf = 138543619;
        long long v37 = v14;
        __int16 v38 = 2113;
        id v39 = v6;
        uint64_t v31 = "[%{public}@] _needToSendETARefresh for %{private}@: NO, interval is < 0";
        v32 = v11;
        os_log_type_t v33 = OS_LOG_TYPE_INFO;
        uint32_t v34 = 22;
LABEL_25:
        _os_log_impl(&dword_1B87E5000, v32, v33, v31, buf, v34);

        goto LABEL_26;
      }
      goto LABEL_26;
    }
    double v19 = v10;
    [v9 timeIntervalSinceNow];
    double v21 = -v20;
    double v22 = v19 + v20;
    uint64_t v23 = MSPGetSharedTripLog();
    v11 = v23;
    if (v22 > 0.0)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        if (self)
        {
          id v26 = NSString;
          uint64_t v27 = self;
          v14 = [v26 stringWithFormat:@"%@<%p>", objc_opt_class(), v27];
        }
        else
        {
          v14 = @"<nil>";
        }
        *(_DWORD *)buf = 138544131;
        long long v37 = v14;
        __int16 v38 = 2113;
        id v39 = v6;
        __int16 v40 = 2048;
        double v41 = v21;
        __int16 v42 = 2048;
        double v43 = v22;
        uint64_t v31 = "[%{public}@] _needToSendETARefresh for %{private}@: NO, too soon since previous (%#.1lfs since last update"
              ", %#.1lfs to go)";
        v32 = v11;
        os_log_type_t v33 = OS_LOG_TYPE_DEFAULT;
        uint32_t v34 = 42;
        goto LABEL_25;
      }
LABEL_26:
      BOOL v15 = 0;
      goto LABEL_27;
    }
    BOOL v15 = 1;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      if (self)
      {
        v24 = NSString;
        v25 = self;
        v18 = [v24 stringWithFormat:@"%@<%p>", objc_opt_class(), v25];
      }
      else
      {
        v18 = @"<nil>";
      }
      *(_DWORD *)buf = 138543875;
      long long v37 = v18;
      __int16 v38 = 2113;
      id v39 = v6;
      __int16 v40 = 2048;
      double v41 = v21;
      uint64_t v28 = "[%{public}@] _needToSendETARefresh for %{private}@: YES, last update %#.1lfs ago";
      BOOL v15 = 1;
      uint64_t v29 = v11;
      uint32_t v30 = 32;
LABEL_22:
      _os_log_impl(&dword_1B87E5000, v29, OS_LOG_TYPE_INFO, v28, buf, v30);
    }
  }
  else
  {
    v11 = MSPGetSharedTripLog();
    BOOL v15 = 1;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      if (self)
      {
        v16 = NSString;
        v17 = self;
        v18 = [v16 stringWithFormat:@"%@<%p>", objc_opt_class(), v17];
      }
      else
      {
        v18 = @"<nil>";
      }
      *(_DWORD *)buf = 138543619;
      long long v37 = v18;
      __int16 v38 = 2113;
      id v39 = v6;
      uint64_t v28 = "[%{public}@] _needToSendETARefresh for %{private}@: YES, no ETA updates sent at all yet";
      BOOL v15 = 1;
      uint64_t v29 = v11;
      uint32_t v30 = 22;
      goto LABEL_22;
    }
  }
LABEL_27:

  return v15;
}

- (void)_sendETAUpdateIfNeededTo:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self->super._state;
  id v6 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v4, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = (void *)[v4 copy];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        if ([(MSPSenderIDSStrategy *)self _needToSendETARefreshFor:v12 state:v5]) {
          [v6 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v9);
  }

  if ([v6 count])
  {
    v13 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      if (self)
      {
        v14 = NSString;
        BOOL v15 = self;
        v16 = [v14 stringWithFormat:@"%@<%p>", objc_opt_class(), v15];
      }
      else
      {
        v16 = @"<nil>";
      }
      uint64_t v17 = [v6 count];
      *(_DWORD *)buf = 138543618;
      v24 = v16;
      __int16 v25 = 2048;
      uint64_t v26 = v17;
      _os_log_impl(&dword_1B87E5000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] %lu participants need an ETA update", buf, 0x16u);
    }
    v18 = (void *)[v6 copy];
    [(MSPSenderIDSStrategy *)self _sendETAUpdate:v5 to:v18];
  }
}

- (void)addParticipants:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:v4];
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  id v7 = [(MSPSenderIDSStrategy *)self capabilitiesByParticipant];
  uint64_t v8 = [v7 allKeys];
  uint64_t v9 = [v6 setWithArray:v8];
  [v5 minusSet:v9];

  if ([v5 count])
  {
    uint64_t v10 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      if (self)
      {
        v11 = NSString;
        uint64_t v12 = self;
        v13 = [v11 stringWithFormat:@"%@<%p>", objc_opt_class(), v12];
      }
      else
      {
        v13 = @"<nil>";
      }
      *(_DWORD *)buf = 138543875;
      v18 = v13;
      __int16 v19 = 2048;
      uint64_t v20 = [v5 count];
      __int16 v21 = 2113;
      long long v22 = v5;
      _os_log_impl(&dword_1B87E5000, v10, OS_LOG_TYPE_INFO, "[%{public}@] Need to fetch capabilities for %lu handles: %{private}@", buf, 0x20u);
    }
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __40__MSPSenderIDSStrategy_addParticipants___block_invoke;
    v15[3] = &unk_1E617C600;
    v15[4] = self;
    id v16 = v4;
    [(MSPSenderIDSStrategy *)self fetchCapabilitiesForParticipants:v5 completion:v15];
  }
  v14.receiver = self;
  v14.super_class = (Class)MSPSenderIDSStrategy;
  [(MSPSenderStrategy *)&v14 addParticipants:v4];
}

void __40__MSPSenderIDSStrategy_addParticipants___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __40__MSPSenderIDSStrategy_addParticipants___block_invoke_2;
  v12[3] = &unk_1E617C5D8;
  v12[4] = *(void *)(a1 + 32);
  [v3 enumerateKeysAndObjectsUsingBlock:v12];
  id v4 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = *(void **)(a1 + 32);
    if (v5)
    {
      id v6 = NSString;
      id v7 = v5;
      uint64_t v8 = [v6 stringWithFormat:@"%@<%p>", objc_opt_class(), v7];
    }
    else
    {
      uint64_t v8 = @"<nil>";
    }
    uint64_t v9 = [*(id *)(a1 + 40) count];
    *(_DWORD *)buf = 138543875;
    objc_super v14 = v8;
    __int16 v15 = 2048;
    uint64_t v16 = v9;
    __int16 v17 = 2113;
    id v18 = v3;
    _os_log_impl(&dword_1B87E5000, v4, OS_LOG_TYPE_INFO, "[%{public}@] Did fetch capabilities for %lu handles: %{private}@", buf, 0x20u);
  }
  uint64_t v10 = *(void **)(a1 + 32);
  v11 = [v3 allKeys];
  [v10 didFetchCapabilitiesForParticipants:v11];
}

void __40__MSPSenderIDSStrategy_addParticipants___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * v10);
        uint64_t v12 = [*(id *)(a1 + 32) capabilitiesByParticipant];
        [v12 setObject:v6 forKeyedSubscript:v5];

        v13 = [*(id *)(a1 + 32) participantsByCapabilities];
        id v14 = [v13 objectForKeyedSubscript:v11];

        if (!v14)
        {
          id v14 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
          __int16 v15 = [*(id *)(a1 + 32) participantsByCapabilities];
          [v15 setObject:v14 forKeyedSubscript:v11];
        }
        [v14 addObject:v5];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
}

- (void)fetchCapabilitiesForParticipants:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __68__MSPSenderIDSStrategy_fetchCapabilitiesForParticipants_completion___block_invoke;
    v7[3] = &unk_1E617C628;
    id v8 = v6;
    +[MSPSharedTripReceiverCapabilities fetchReceiverCapabilitiesForDestinations:v5 completion:v7];
  }
}

uint64_t __68__MSPSenderIDSStrategy_fetchCapabilitiesForParticipants_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_sendCompatibleInstancesOfState:(id)a3 to:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && [v7 count])
  {
    uint64_t v29 = v8;
    uint32_t v30 = v6;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v37 objects:v45 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v38 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v37 + 1) + 8 * i);
          __int16 v15 = [(MSPSenderIDSStrategy *)self capabilitiesByParticipant];
          long long v16 = [v15 objectForKeyedSubscript:v14];

          if (!v16)
          {
            long long v17 = MSPGetSharedTripLog();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
            {
              if (self)
              {
                long long v18 = NSString;
                long long v19 = self;
                uint64_t v20 = [v18 stringWithFormat:@"%@<%p>", objc_opt_class(), v19];
              }
              else
              {
                uint64_t v20 = @"<nil>";
              }
              *(_DWORD *)buf = 138543619;
              __int16 v42 = v20;
              __int16 v43 = 2113;
              uint64_t v44 = v14;
              _os_log_impl(&dword_1B87E5000, v17, OS_LOG_TYPE_FAULT, "[%{public}@] have not yet fetched capabilties for %{private}@", buf, 0x16u);
            }
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v37 objects:v45 count:16];
      }
      while (v11);
    }

    uint64_t v21 = [(MSPSenderIDSStrategy *)self participantsByCapabilities];
    long long v22 = (void *)[v21 copy];

    id v23 = objc_alloc(MEMORY[0x1E4F1CA60]);
    v24 = [(MSPSenderIDSStrategy *)self participantsByCapabilities];
    __int16 v25 = objc_msgSend(v23, "initWithCapacity:", objc_msgSend(v24, "count"));

    uint64_t v26 = self->_groupSession;
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __59__MSPSenderIDSStrategy__sendCompatibleInstancesOfState_to___block_invoke;
    v31[3] = &unk_1E617C650;
    id v32 = v9;
    os_log_type_t v33 = self;
    id v34 = v25;
    id v6 = v30;
    id v35 = v30;
    long long v36 = v26;
    uint64_t v27 = v26;
    id v28 = v25;
    [v22 enumerateKeysAndObjectsUsingBlock:v31];

    id v8 = v29;
  }
}

void __59__MSPSenderIDSStrategy__sendCompatibleInstancesOfState_to___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1BA9C28D0]();
  id v8 = (void *)[v6 mutableCopy];
  [v8 intersectSet:*(void *)(a1 + 32)];
  if ([v8 count])
  {
    int v9 = *(unsigned __int8 *)(*(void *)(a1 + 40) + 24);
    uint64_t v10 = [*(id *)(a1 + 48) objectForKeyedSubscript:v5];
    uint64_t v11 = (void *)v10;
    if (v9)
    {
      if (!v10)
      {
        uint64_t v11 = [*(id *)(a1 + 56) instanceCompatibleWithReceiverCapabilities:v5];
        [*(id *)(a1 + 48) setObject:v11 forKeyedSubscript:v5];
      }
      MSPGetSharedTripVirtualReceiverLog();
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v13 = *(void *)(a1 + 40);
      uint64_t v14 = NSString;
      __int16 v15 = [v8 allObjects];
      long long v16 = [v15 componentsJoinedByString:@", "];
      long long v17 = [v14 stringWithFormat:@"TO:(%@)", v16];
      objc_msgSend(v11, "_msp_logWithCategory:type:object:prefix:", v12, 1, v13, v17);
    }
    else
    {
      if (!v10)
      {
        long long v18 = [*(id *)(a1 + 56) instanceCompatibleWithReceiverCapabilities:v5];
        uint64_t v11 = [v18 data];

        [*(id *)(a1 + 48) setObject:v11 forKeyedSubscript:v5];
      }
      long long v19 = *(void **)(a1 + 64);
      uint64_t v20 = [v5 idsSendMessageOptions];
      id v26 = 0;
      [v19 sendChunkedMessage:v11 to:v8 options:v20 error:&v26];
      id v12 = v26;

      if (v12)
      {
        uint64_t v21 = MSPGetSharedTripLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          long long v22 = *(void **)(a1 + 40);
          if (v22)
          {
            id v23 = NSString;
            id v24 = v22;
            __int16 v25 = [v23 stringWithFormat:@"%@<%p>", objc_opt_class(), v24];
          }
          else
          {
            __int16 v25 = @"<nil>";
          }
          *(_DWORD *)buf = 138543618;
          id v28 = v25;
          __int16 v29 = 2114;
          id v30 = v12;
          _os_log_impl(&dword_1B87E5000, v21, OS_LOG_TYPE_ERROR, "[%{public}@] error sending compatible state: %{public}@", buf, 0x16u);
        }
      }
    }
  }
}

- (void)_sendUpdatedWaypoints:(id)a3 to:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v7 count])
  {
    id v8 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if (self)
      {
        int v9 = NSString;
        uint64_t v10 = self;
        uint64_t v11 = [v9 stringWithFormat:@"%@<%p>", objc_opt_class(), v10];
      }
      else
      {
        uint64_t v11 = @"<nil>";
      }
      *(_DWORD *)buf = 138543362;
      long long v38 = v11;
      _os_log_impl(&dword_1B87E5000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] _sendUpdatedWaypoints", buf, 0xCu);
    }
    id v12 = (void *)[v6 copy];
    if ([v12 hasWaypointInfos])
    {
      [v12 stripForSendingUpdatedWaypoints];
      id v13 = objc_alloc_init(MEMORY[0x1E4F64A30]);
      [v12 setSenderInfo:v13];

      uint64_t v14 = [(MSPSharedTripGroupSession *)self->_groupSession initiatorDisplayName];
      __int16 v15 = [v12 senderInfo];
      [v15 setFromDisplayName:v14];

      long long v16 = MSPGetSharedTripLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        long long v17 = NSString;
        long long v18 = self;
        long long v19 = [v17 stringWithFormat:@"%@<%p>", objc_opt_class(), v18];

        uint64_t v20 = [v12 mspDescription];
        *(_DWORD *)buf = 138543618;
        long long v38 = v19;
        __int16 v39 = 2112;
        long long v40 = v20;
        _os_log_impl(&dword_1B87E5000, v16, OS_LOG_TYPE_INFO, "[%{public}@] will send state %@", buf, 0x16u);
      }
      if ([v6 hasEtaInfo])
      {
        uint64_t v21 = [v6 etaInfo];
        int v22 = [v21 hasEtaTimestamp];

        if (v22)
        {
          id v31 = v6;
          id v23 = [MEMORY[0x1E4F1C9C8] date];
          long long v32 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          id v24 = v7;
          uint64_t v25 = [v24 countByEnumeratingWithState:&v32 objects:v36 count:16];
          if (v25)
          {
            uint64_t v26 = v25;
            uint64_t v27 = *(void *)v33;
            do
            {
              uint64_t v28 = 0;
              do
              {
                if (*(void *)v33 != v27) {
                  objc_enumerationMutation(v24);
                }
                uint64_t v29 = *(void *)(*((void *)&v32 + 1) + 8 * v28);
                id v30 = [(MSPSenderIDSStrategy *)self lastETAUpdateDates];
                [v30 setObject:v23 forKeyedSubscript:v29];

                ++v28;
              }
              while (v26 != v28);
              uint64_t v26 = [v24 countByEnumeratingWithState:&v32 objects:v36 count:16];
            }
            while (v26);
          }

          id v6 = v31;
        }
      }
      [(MSPSenderIDSStrategy *)self _sendCompatibleInstancesOfState:v12 to:v7];
    }
  }
}

- (void)_sendDestinationReachedUpdate:(id)a3 to:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v7 count])
  {
    id v8 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if (self)
      {
        int v9 = NSString;
        uint64_t v10 = self;
        uint64_t v11 = [v9 stringWithFormat:@"%@<%p>", objc_opt_class(), v10];
      }
      else
      {
        uint64_t v11 = @"<nil>";
      }
      *(_DWORD *)buf = 138543362;
      uint64_t v20 = v11;
      _os_log_impl(&dword_1B87E5000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] _sendDestinationReachedUpdate", buf, 0xCu);
    }
    id v12 = (void *)[v6 copy];
    id v13 = [v12 destinationWaypointInfo];

    if (v13)
    {
      [v12 stripForSendingArrival];
      uint64_t v14 = MSPGetSharedTripLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        if (self)
        {
          __int16 v15 = NSString;
          long long v16 = self;
          long long v17 = [v15 stringWithFormat:@"%@<%p>", objc_opt_class(), v16];
        }
        else
        {
          long long v17 = @"<nil>";
        }
        long long v18 = [v12 mspDescription];
        *(_DWORD *)buf = 138543618;
        uint64_t v20 = v17;
        __int16 v21 = 2112;
        int v22 = v18;
        _os_log_impl(&dword_1B87E5000, v14, OS_LOG_TYPE_INFO, "[%{public}@] will send state %@", buf, 0x16u);
      }
      [(MSPSenderIDSStrategy *)self _sendCompatibleInstancesOfState:v12 to:v7];
    }
  }
}

- (void)_sendResumingToNextDestinationUpdate:(id)a3 to:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v7 count])
  {
    id v8 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if (self)
      {
        int v9 = NSString;
        uint64_t v10 = self;
        uint64_t v11 = [v9 stringWithFormat:@"%@<%p>", objc_opt_class(), v10];
      }
      else
      {
        uint64_t v11 = @"<nil>";
      }
      *(_DWORD *)buf = 138543362;
      uint64_t v20 = v11;
      _os_log_impl(&dword_1B87E5000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] _sendResumingToNextDestinationUpdate", buf, 0xCu);
    }
    id v12 = (void *)[v6 copy];
    id v13 = [v12 destinationWaypointInfo];

    if (v13)
    {
      [v12 stripForSendingResuming];
      uint64_t v14 = MSPGetSharedTripLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        if (self)
        {
          __int16 v15 = NSString;
          long long v16 = self;
          long long v17 = [v15 stringWithFormat:@"%@<%p>", objc_opt_class(), v16];
        }
        else
        {
          long long v17 = @"<nil>";
        }
        long long v18 = [v12 mspDescription];
        *(_DWORD *)buf = 138543618;
        uint64_t v20 = v17;
        __int16 v21 = 2112;
        int v22 = v18;
        _os_log_impl(&dword_1B87E5000, v14, OS_LOG_TYPE_INFO, "[%{public}@] will send state %@", buf, 0x16u);
      }
      [(MSPSenderIDSStrategy *)self _sendCompatibleInstancesOfState:v12 to:v7];
    }
  }
}

- (void)_sendStoppedUpdate:(id)a3 to:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v7 count])
  {
    id v8 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if (self)
      {
        int v9 = NSString;
        uint64_t v10 = self;
        uint64_t v11 = [v9 stringWithFormat:@"%@<%p>", objc_opt_class(), v10];
      }
      else
      {
        uint64_t v11 = @"<nil>";
      }
      *(_DWORD *)buf = 138543362;
      int v22 = v11;
      _os_log_impl(&dword_1B87E5000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] _sendStoppedUpdate", buf, 0xCu);
    }
    id v12 = (void *)[v6 copy];
    if ([v12 hasGroupIdentifier] && objc_msgSend(v12, "hasClosed"))
    {
      [v12 stripForSendingStoppedSharing];
      id v13 = objc_alloc_init(MEMORY[0x1E4F64A30]);
      [v12 setSenderInfo:v13];

      uint64_t v14 = [(MSPSharedTripGroupSession *)self->_groupSession initiatorDisplayName];
      __int16 v15 = [v12 senderInfo];
      [v15 setFromDisplayName:v14];

      long long v16 = MSPGetSharedTripLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        long long v17 = NSString;
        long long v18 = self;
        long long v19 = [v17 stringWithFormat:@"%@<%p>", objc_opt_class(), v18];

        uint64_t v20 = [v12 mspDescription];
        *(_DWORD *)buf = 138543618;
        int v22 = v19;
        __int16 v23 = 2112;
        id v24 = v20;
        _os_log_impl(&dword_1B87E5000, v16, OS_LOG_TYPE_INFO, "[%{public}@] will send state %@", buf, 0x16u);
      }
      [(MSPSenderIDSStrategy *)self _sendCompatibleInstancesOfState:v12 to:v7];
    }
  }
}

- (void)_sendETAUpdate:(id)a3 to:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v7 count])
  {
    id v8 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if (self)
      {
        int v9 = NSString;
        uint64_t v10 = self;
        uint64_t v11 = [v9 stringWithFormat:@"%@<%p>", objc_opt_class(), v10];
      }
      else
      {
        uint64_t v11 = @"<nil>";
      }
      *(_DWORD *)buf = 138543362;
      long long v33 = v11;
      _os_log_impl(&dword_1B87E5000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] _sendETAUpdate", buf, 0xCu);
    }
    id v12 = (void *)[v6 copy];
    if ([v12 etaInfosCount])
    {
      [v12 stripForSendingUpdatedETA];
      id v13 = MSPGetSharedTripLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        if (self)
        {
          uint64_t v14 = NSString;
          __int16 v15 = self;
          long long v16 = [v14 stringWithFormat:@"%@<%p>", objc_opt_class(), v15];
        }
        else
        {
          long long v16 = @"<nil>";
        }
        long long v17 = [v12 mspDescription];
        *(_DWORD *)buf = 138543619;
        long long v33 = v16;
        __int16 v34 = 2113;
        long long v35 = v17;
        _os_log_impl(&dword_1B87E5000, v13, OS_LOG_TYPE_INFO, "[%{public}@] will send state %{private}@", buf, 0x16u);
      }
      id v26 = v6;

      long long v18 = [MEMORY[0x1E4F1C9C8] date];
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v19 = v7;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v28;
        do
        {
          uint64_t v23 = 0;
          do
          {
            if (*(void *)v28 != v22) {
              objc_enumerationMutation(v19);
            }
            uint64_t v24 = *(void *)(*((void *)&v27 + 1) + 8 * v23);
            uint64_t v25 = [(MSPSenderIDSStrategy *)self lastETAUpdateDates];
            [v25 setObject:v18 forKeyedSubscript:v24];

            ++v23;
          }
          while (v21 != v23);
          uint64_t v21 = [v19 countByEnumeratingWithState:&v27 objects:v31 count:16];
        }
        while (v21);
      }

      [(MSPSenderIDSStrategy *)self _sendCompatibleInstancesOfState:v12 to:v19];
      id v6 = v26;
    }
  }
}

- (void)_sendRouteUpdate:(id)a3 to:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v7 count])
  {
    id v8 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if (self)
      {
        int v9 = NSString;
        uint64_t v10 = self;
        uint64_t v11 = [v9 stringWithFormat:@"%@<%p>", objc_opt_class(), v10];
      }
      else
      {
        uint64_t v11 = @"<nil>";
      }
      *(_DWORD *)buf = 138543362;
      uint64_t v20 = v11;
      _os_log_impl(&dword_1B87E5000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] _sendRouteUpdate", buf, 0xCu);
    }
    id v12 = (void *)[v6 copy];
    id v13 = [v12 routeInfo];

    if (v13)
    {
      [v12 stripForSendingUpdatedRoute];
      uint64_t v14 = MSPGetSharedTripLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        if (self)
        {
          __int16 v15 = NSString;
          long long v16 = self;
          long long v17 = [v15 stringWithFormat:@"%@<%p>", objc_opt_class(), v16];
        }
        else
        {
          long long v17 = @"<nil>";
        }
        long long v18 = [v12 mspDescription];
        *(_DWORD *)buf = 138543618;
        uint64_t v20 = v17;
        __int16 v21 = 2112;
        uint64_t v22 = v18;
        _os_log_impl(&dword_1B87E5000, v14, OS_LOG_TYPE_INFO, "[%{public}@] will send state %@", buf, 0x16u);
      }
      [(MSPSenderIDSStrategy *)self _sendCompatibleInstancesOfState:v12 to:v7];
    }
  }
}

- (void)_sendTrafficUpdate:(id)a3 to:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v7 count])
  {
    id v8 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if (self)
      {
        int v9 = NSString;
        uint64_t v10 = self;
        uint64_t v11 = [v9 stringWithFormat:@"%@<%p>", objc_opt_class(), v10];
      }
      else
      {
        uint64_t v11 = @"<nil>";
      }
      *(_DWORD *)buf = 138543362;
      uint64_t v20 = v11;
      _os_log_impl(&dword_1B87E5000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] _sendTrafficUpdate", buf, 0xCu);
    }
    id v12 = (void *)[v6 copy];
    id v13 = [v12 routeInfo];

    if (v13)
    {
      [v12 stripForSendingUpdatedTraffic];
      uint64_t v14 = MSPGetSharedTripLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        if (self)
        {
          __int16 v15 = NSString;
          long long v16 = self;
          long long v17 = [v15 stringWithFormat:@"%@<%p>", objc_opt_class(), v16];
        }
        else
        {
          long long v17 = @"<nil>";
        }
        long long v18 = [v12 mspDescription];
        *(_DWORD *)buf = 138543618;
        uint64_t v20 = v17;
        __int16 v21 = 2112;
        uint64_t v22 = v18;
        _os_log_impl(&dword_1B87E5000, v14, OS_LOG_TYPE_INFO, "[%{public}@] will send state %@", buf, 0x16u);
      }
      [(MSPSenderIDSStrategy *)self _sendCompatibleInstancesOfState:v12 to:v7];
    }
  }
}

- (NSMutableDictionary)lastETAUpdateDates
{
  return self->_lastETAUpdateDates;
}

- (void)setLastETAUpdateDates:(id)a3
{
}

- (NSMutableDictionary)participantsByCapabilities
{
  return self->_participantsByCapabilities;
}

- (void)setParticipantsByCapabilities:(id)a3
{
}

- (NSMutableDictionary)capabilitiesByParticipant
{
  return self->_capabilitiesByParticipant;
}

- (void)setCapabilitiesByParticipant:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_capabilitiesByParticipant, 0);
  objc_storeStrong((id *)&self->_participantsByCapabilities, 0);
  objc_storeStrong((id *)&self->_lastETAUpdateDates, 0);

  objc_storeStrong((id *)&self->_groupSession, 0);
}

@end