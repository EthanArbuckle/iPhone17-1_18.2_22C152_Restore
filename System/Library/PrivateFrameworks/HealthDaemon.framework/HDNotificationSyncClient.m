@interface HDNotificationSyncClient
- (BOOL)markPendingNotificationInstructionsAsProcessed:(id)a3 error:(id *)a4;
- (BOOL)obliterateNotificationInstructionsWithError:(id *)a3;
- (BOOL)sendNewDeviceNotificationWithMessageKind:(int64_t)a3 error:(id *)a4;
- (BOOL)sendNotificationInstruction:(id)a3 criteria:(id)a4 error:(id *)a5;
- (HDNotificationInstructionManager)instructionManager;
- (HDNotificationSyncClient)initWithProfile:(id)a3 clientIdentifier:(id)a4 queue:(id)a5;
- (HDNotificationSyncClientDelegate)delegate;
- (HDPendingNotificationInstructions)_pendingNotificationInstructionsForAction:(void *)a3 error:;
- (NSDate)unitTest_currentDate;
- (NSString)clientIdentifier;
- (NSString)description;
- (id)diagnosticDescription;
- (id)notificationHoldInstructionsWithError:(id *)a3;
- (id)pendingNotificationDismissInstructionsWithError:(id *)a3;
- (id)pendingNotificationSendInstructionsWithError:(id *)a3;
- (void)_currentDate;
- (void)fakeReceivedNotificationInstruction:(id)a3 sendingDeviceInfo:(id)a4 criteria:(id)a5 completion:(id)a6;
- (void)notificationInstructionManager:(id)a3 didInsertNotificationInstruction:(id)a4;
- (void)profileDidBecomeReady:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setUnitTest_currentDate:(id)a3;
@end

@implementation HDNotificationSyncClient

- (HDNotificationSyncClient)initWithProfile:(id)a3 clientIdentifier:(id)a4 queue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HDNotificationSyncClient;
  v11 = [(HDNotificationSyncClient *)&v19 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_profile, v8);
    uint64_t v13 = [v9 copy];
    clientIdentifier = v12->_clientIdentifier;
    v12->_clientIdentifier = (NSString *)v13;

    objc_storeStrong((id *)&v12->_queue, a5);
    v12->_lock._os_unfair_lock_opaque = 0;
    v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    lock_messageIdentifiersInFlight = v12->_lock_messageIdentifiersInFlight;
    v12->_lock_messageIdentifiersInFlight = v15;

    [v8 registerProfileReadyObserver:v12 queue:v12->_queue];
    v17 = [MEMORY[0x1E4F65CF8] sharedDiagnosticManager];
    [v17 addObject:v12];
  }
  return v12;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@:%p client:%@>", objc_opt_class(), self, self->_clientIdentifier];
}

- (HDNotificationInstructionManager)instructionManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v5 = [WeakRetained notificationSyncManager];
  v6 = [v5 notificationInstructionManager];

  if (!v6)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"HDNotificationSyncClient.m", 74, @"Invalid parameter not satisfying: %@", @"manager" object file lineNumber description];
  }

  return (HDNotificationInstructionManager *)v6;
}

- (void)profileDidBecomeReady:(id)a3
{
  id v4 = [(HDNotificationSyncClient *)self instructionManager];
  [v4 registerObserver:self forClientIdentifier:self->_clientIdentifier queue:self->_queue];
}

- (void)notificationInstructionManager:(id)a3 didInsertNotificationInstruction:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x1E4F29F80];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F80], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    id v8 = objc_opt_class();
    id v9 = v8;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    int v12 = 138543874;
    uint64_t v13 = v8;
    __int16 v14 = 2114;
    id v15 = WeakRetained;
    __int16 v16 = 2114;
    id v17 = v5;
    _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifying delegate %{public}@ of new instruction %{public}@", (uint8_t *)&v12, 0x20u);
  }
  id v11 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v11, "notificationSyncClient:didReceiveInstructionWithAction:", self, objc_msgSend(v5, "action"));
}

- (id)pendingNotificationDismissInstructionsWithError:(id *)a3
{
  return -[HDNotificationSyncClient _pendingNotificationInstructionsForAction:error:]((uint64_t)self, 1, a3);
}

- (HDPendingNotificationInstructions)_pendingNotificationInstructionsForAction:(void *)a3 error:
{
  if (a1)
  {
    uint64_t v25 = 0;
    v26 = &v25;
    uint64_t v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__18;
    v29 = __Block_byref_object_dispose__18;
    id v30 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v6 = [(id)a1 instructionManager];
    uint64_t v7 = *(void *)(a1 + 16);
    v23[4] = &v25;
    id v24 = 0;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __76__HDNotificationSyncClient__pendingNotificationInstructionsForAction_error___block_invoke;
    v23[3] = &unk_1E62F57E0;
    char v8 = [v6 enumerateValidNotificationInstructionsForClientIdentifier:v7 action:a2 error:&v24 enumerationBlock:v23];
    id v9 = v24;

    if (v8)
    {
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
      id v10 = (void *)v26[5];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __76__HDNotificationSyncClient__pendingNotificationInstructionsForAction_error___block_invoke_2;
      v22[3] = &unk_1E62F5808;
      v22[4] = a1;
      id v11 = objc_msgSend(v10, "hk_filter:", v22);
      id v12 = objc_alloc(MEMORY[0x1E4F1CAD0]);
      uint64_t v13 = [v11 allKeys];
      __int16 v14 = (void *)[v12 initWithArray:v13];

      id v15 = objc_alloc(MEMORY[0x1E4F1CAD0]);
      __int16 v16 = [v11 allValues];
      id v17 = (void *)[v15 initWithArray:v16];

      [*(id *)(a1 + 40) unionSet:v14];
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 32));
      uint64_t v18 = [[HDPendingNotificationInstructions alloc] initWithAction:a2 instructions:v17];
    }
    else
    {
      id v19 = v9;
      v20 = v19;
      if (v19)
      {
        if (a3) {
          *a3 = v19;
        }
        else {
          _HKLogDroppedError();
        }
      }

      uint64_t v18 = 0;
    }

    _Block_object_dispose(&v25, 8);
  }
  else
  {
    uint64_t v18 = 0;
  }

  return v18;
}

- (id)pendingNotificationSendInstructionsWithError:(id *)a3
{
  return -[HDNotificationSyncClient _pendingNotificationInstructionsForAction:error:]((uint64_t)self, 3, a3);
}

uint64_t __76__HDNotificationSyncClient__pendingNotificationInstructionsForAction_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [HDPendingNotificationInstruction alloc];
  id v5 = [v3 messageIdentifier];
  v6 = [v3 categoryIdentifier];
  uint64_t v7 = [v3 sendingDeviceName];
  char v8 = [(HDPendingNotificationInstruction *)v4 initWithMessageIdentifier:v5 categoryIdentifier:v6 sendingDeviceName:v7];
  id v9 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v10 = [v3 messageIdentifier];

  [v9 setObject:v8 forKeyedSubscript:v10];
  return 1;
}

uint64_t __76__HDNotificationSyncClient__pendingNotificationInstructionsForAction_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) containsObject:a2] ^ 1;
}

- (BOOL)markPendingNotificationInstructionsAsProcessed:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if ([v7 action] == 2)
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"HDNotificationSyncClient.m", 145, @"Invalid parameter not satisfying: %@", @"pendingNotificationInstructions.action != HKNotificationInstructionActionHold" object file lineNumber description];
  }
  char v8 = [(HDNotificationSyncClient *)self instructionManager];
  id v9 = [v7 messageIdentifiers];
  id v18 = 0;
  char v10 = [v8 invalidateNotificationInstructionsWithMessageIdentifiers:v9 error:&v18];
  id v11 = v18;

  if (v10)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    lock_messageIdentifiersInFlight = self->_lock_messageIdentifiersInFlight;
    __int16 v14 = [v7 messageIdentifiers];
    [(NSMutableSet *)lock_messageIdentifiersInFlight minusSet:v14];

    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    id v15 = v11;
    if (v15)
    {
      if (a4) {
        *a4 = v15;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  return v10;
}

- (id)notificationHoldInstructionsWithError:(id *)a3
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__18;
  __int16 v14 = __Block_byref_object_dispose__18;
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v5 = [(HDNotificationSyncClient *)self instructionManager];
  clientIdentifier = self->_clientIdentifier;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__HDNotificationSyncClient_notificationHoldInstructionsWithError___block_invoke;
  v9[3] = &unk_1E62F57E0;
  v9[4] = &v10;
  LODWORD(a3) = [v5 enumerateValidNotificationInstructionsForClientIdentifier:clientIdentifier action:2 error:a3 enumerationBlock:v9];

  if (a3) {
    id v7 = (void *)[(id)v11[5] copy];
  }
  else {
    id v7 = 0;
  }
  _Block_object_dispose(&v10, 8);

  return v7;
}

uint64_t __66__HDNotificationSyncClient_notificationHoldInstructionsWithError___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v3 = [a2 categoryIdentifier];
  [v2 addObject:v3];

  return 1;
}

- (BOOL)sendNotificationInstruction:(id)a3 criteria:(id)a4 error:(id *)a5
{
  id v7 = (void *)MEMORY[0x1E4F2B860];
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [v7 sharedBehavior];
  id v11 = NSString;
  uint64_t v12 = [v10 currentDeviceDisplayName];
  uint64_t v13 = [v10 currentDeviceProductType];
  __int16 v14 = [v10 currentOSBuild];
  uint64_t v25 = [v11 stringWithFormat:@"%@;%@;%@", v12, v13, v14];

  id v15 = [HDNotificationInstructionMessage alloc];
  __int16 v16 = -[HDNotificationSyncClient _currentDate](self);
  uint64_t v17 = [v9 action];
  clientIdentifier = self->_clientIdentifier;
  id v19 = [v9 categoryIdentifier];
  v20 = [v9 expirationDate];

  v21 = [(HDNotificationInstructionMessage *)v15 initWithCreationDate:v16 sendingDeviceInfo:v25 action:v17 clientIdentifier:clientIdentifier categoryIdentifier:v19 expirationDate:v20 criteria:v8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v23 = [WeakRetained notificationSyncManager];
  LOBYTE(v20) = [v23 sendNotificationInstructionMessage:v21 error:a5];

  return (char)v20;
}

- (void)_currentDate
{
  if (a1)
  {
    v2 = (void *)a1[7];
    if (v2)
    {
      a1 = v2;
    }
    else
    {
      a1 = [MEMORY[0x1E4F1C9C8] date];
    }
    uint64_t v1 = vars8;
  }
  return a1;
}

- (BOOL)sendNewDeviceNotificationWithMessageKind:(int64_t)a3 error:(id *)a4
{
  id v7 = [MEMORY[0x1E4F2B860] sharedBehavior];
  id v8 = NSString;
  id v9 = [v7 currentDeviceProductType];
  uint64_t v10 = [v7 currentOSBuild];
  id v11 = [v8 stringWithFormat:@"%@;%@", v9, v10];

  uint64_t v12 = -[HDNotificationSyncClient _currentDate](self);
  uint64_t v13 = [v12 dateByAddingTimeInterval:2592000.0];

  __int16 v14 = [HDNotificationInstructionMessage alloc];
  id v15 = -[HDNotificationSyncClient _currentDate](self);
  __int16 v16 = [(HDNotificationInstructionMessage *)v14 initWithCreationDate:v15 sendingDeviceInfo:v11 action:3 clientIdentifier:self->_clientIdentifier categoryIdentifier:@"DataAvailableOnNewDevice" expirationDate:v13 criteria:0];

  self = (HDNotificationSyncClient *)((char *)self + 8);
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.isa);
  id v18 = [WeakRetained notificationSyncManager];
  char v19 = [v18 sendNotificationInstructionMessage:v16 error:a4];

  id v20 = objc_loadWeakRetained((id *)&self->super.isa);
  v21 = [v20 daemon];
  v22 = [v21 healthAppNewDeviceNotificationService];
  LOBYTE(a4) = [v22 sendNewDeviceNotificationWithMessageKind:a3 error:a4];

  return a4 | v19;
}

- (void)fakeReceivedNotificationInstruction:(id)a3 sendingDeviceInfo:(id)a4 criteria:(id)a5 completion:(id)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v29 = a6;
  id v27 = a5;
  id v10 = a4;
  id v11 = a3;
  v26 = [HDNotificationInstruction alloc];
  v28 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v25 = [v28 UUIDString];
  uint64_t v12 = -[HDNotificationSyncClient _currentDate](self);
  uint64_t v13 = -[HDNotificationSyncClient _currentDate](self);
  __int16 v14 = -[HDNotificationSyncClient _currentDate](self);
  uint64_t v15 = [v11 action];
  clientIdentifier = self->_clientIdentifier;
  uint64_t v17 = [v11 categoryIdentifier];
  id v18 = [v11 expirationDate];

  LOBYTE(v24) = 0;
  char v19 = [(HDNotificationInstruction *)v26 initWithMessageIdentifier:v25 creationDate:v12 receivedDate:v13 modificationDate:v14 sendingDeviceName:v10 sendingDeviceInfo:v10 action:v15 clientIdentifier:clientIdentifier categoryIdentifier:v17 expirationDate:v18 criteria:v27 isInvalid:v24];

  _HKInitializeLogging();
  id v20 = (void *)*MEMORY[0x1E4F29F80];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F80], OS_LOG_TYPE_ERROR))
  {
    v22 = v20;
    *(_DWORD *)buf = 138543618;
    id v31 = (id)objc_opt_class();
    __int16 v32 = 2114;
    v33 = v19;
    id v23 = v31;
    _os_log_error_impl(&dword_1BCB7D000, v22, OS_LOG_TYPE_ERROR, "[%{public}@] Faking received instruction: %{public}@", buf, 0x16u);
  }
  v21 = [(HDNotificationSyncClient *)self instructionManager];
  [v21 insertNotificationInstruction:v19 completion:v29];
}

- (BOOL)obliterateNotificationInstructionsWithError:(id *)a3
{
  id v4 = [(HDNotificationSyncClient *)self instructionManager];
  LOBYTE(a3) = [v4 obliterateNotificationInstructionsWithError:a3];

  return (char)a3;
}

- (id)diagnosticDescription
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"%@\n", self];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSMutableSet count](self->_lock_messageIdentifiersInFlight, "count"));
  [v3 appendFormat:@"Message Identifiers In-Flight (%@)\n", v5];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v6 = self->_lock_messageIdentifiersInFlight;
  uint64_t v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        [v3 appendFormat:@"\t-%@", *(void *)(*((void *)&v13 + 1) + 8 * i)];
      }
      uint64_t v8 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  os_unfair_lock_unlock(p_lock);
  id v11 = (void *)[v3 copy];

  return v11;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (HDNotificationSyncClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HDNotificationSyncClientDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSDate)unitTest_currentDate
{
  return self->_unitTest_currentDate;
}

- (void)setUnitTest_currentDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitTest_currentDate, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lock_messageIdentifiersInFlight, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);

  objc_destroyWeak((id *)&self->_profile);
}

@end