@interface DMMigrationDeferredExitManager
+ (id)_serialQueue;
- (BOOL)_isDeferringExit;
- (id)_deferralDuration;
- (void)_exitClean;
- (void)_resetGlobalState;
- (void)cancelDeferredExitWithConnection:(id)a3;
- (void)deferExitWithConnection:(id)a3;
- (void)migrationDidEnd;
- (void)migrationDidStart;
@end

@implementation DMMigrationDeferredExitManager

+ (id)_serialQueue
{
  if (_serialQueue_onceToken != -1) {
    dispatch_once(&_serialQueue_onceToken, &__block_literal_global);
  }
  v2 = (void *)_serialQueue_serialQueue;

  return v2;
}

uint64_t __46__DMMigrationDeferredExitManager__serialQueue__block_invoke()
{
  _isMigrating_onSerialQueue = 0;
  _shouldDefer_onSerialQueue = 0;
  v0 = (void *)_transaction_onSerialQueue;
  _transaction_onSerialQueue = 0;

  v1 = (void *)_transactionIdentifier_onSerialQueue;
  _transactionIdentifier_onSerialQueue = 0;

  _serialQueue_serialQueue = (uint64_t)dispatch_queue_create("com.apple.datamigrator.deferredExitManager", 0);

  return MEMORY[0x1F41817F8]();
}

- (void)migrationDidStart
{
  v2 = +[DMMigrationDeferredExitManager _serialQueue];
  dispatch_sync(v2, &__block_literal_global_4);
}

void __51__DMMigrationDeferredExitManager_migrationDidStart__block_invoke()
{
  _DMLogFunc(v0, 7, @"migrationDidStart");
  _isMigrating_onSerialQueue = 1;
}

- (void)migrationDidEnd
{
  v3 = +[DMMigrationDeferredExitManager _serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__DMMigrationDeferredExitManager_migrationDidEnd__block_invoke;
  block[3] = &unk_1E6C1E0D0;
  block[4] = self;
  dispatch_sync(v3, block);
}

void __49__DMMigrationDeferredExitManager_migrationDidEnd__block_invoke(uint64_t a1)
{
  _DMLogFunc(v1, 7, @"migrationDidEnd");
  _isMigrating_onSerialQueue = 0;
  if (_shouldDefer_onSerialQueue == 1)
  {
    _shouldDefer_onSerialQueue = 0;
    uint64_t v3 = os_transaction_create();
    v4 = (void *)_transaction_onSerialQueue;
    _transaction_onSerialQueue = v3;

    v5 = [MEMORY[0x1E4F29128] UUID];
    v6 = [v5 UUIDString];

    objc_storeStrong((id *)&_transactionIdentifier_onSerialQueue, v6);
    v7 = [*(id *)(a1 + 32) _deferralDuration];
    dispatch_time_t v8 = dispatch_time(0, 1000000000 * [v7 unsignedIntegerValue]);
    v9 = +[DMMigrationDeferredExitManager _serialQueue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __49__DMMigrationDeferredExitManager_migrationDidEnd__block_invoke_2;
    v12[3] = &unk_1E6C1E0A8;
    uint64_t v10 = *(void *)(a1 + 32);
    id v13 = v6;
    uint64_t v14 = v10;
    id v11 = v6;
    dispatch_after(v8, v9, v12);
  }
}

void __49__DMMigrationDeferredExitManager_migrationDidEnd__block_invoke_2(uint64_t a1)
{
  if (_transaction_onSerialQueue
    && [(id)_transactionIdentifier_onSerialQueue isEqualToString:*(void *)(a1 + 32)])
  {
    _DMLogFunc(v1, 7, @"deferred exit did timeout. will end transaction and exit");
    uint64_t v3 = (void *)_transaction_onSerialQueue;
    _transaction_onSerialQueue = 0;

    v4 = (void *)_transactionIdentifier_onSerialQueue;
    _transactionIdentifier_onSerialQueue = 0;

    v5 = *(void **)(a1 + 40);
    [v5 _exitClean];
  }
  else
  {
    _DMLogFunc(v1, 7, @"deferred exit timer fired for stale transaction");
  }
}

- (void)deferExitWithConnection:(id)a3
{
  if ([a3 hasEntitlement:@"com.apple.datamigrator.deferexit"])
  {
    v4 = +[DMMigrationDeferredExitManager _serialQueue];
    dispatch_sync(v4, &__block_literal_global_20);
  }
  else
  {
    _DMLogFunc(v3, 3, @"deferExitWithConnection: client not entitled");
  }
}

void __58__DMMigrationDeferredExitManager_deferExitWithConnection___block_invoke()
{
  if (_isMigrating_onSerialQueue == 1)
  {
    _DMLogFunc(v0, 7, @"deferExitWithConnection: will defer exit when migration completes");
    _shouldDefer_onSerialQueue = 1;
  }
  else
  {
    _DMLogFunc(v0, 3, @"deferExitWithConnection: not migrating");
  }
}

- (void)cancelDeferredExitWithConnection:(id)a3
{
  if ([a3 hasEntitlement:@"com.apple.datamigrator.deferexit"])
  {
    v5 = +[DMMigrationDeferredExitManager _serialQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__DMMigrationDeferredExitManager_cancelDeferredExitWithConnection___block_invoke;
    block[3] = &unk_1E6C1E0D0;
    block[4] = self;
    dispatch_sync(v5, block);
  }
  else
  {
    _DMLogFunc(v3, 3, @"cancelDeferredExitWithConnection: client not entitled");
  }
}

void __67__DMMigrationDeferredExitManager_cancelDeferredExitWithConnection___block_invoke(uint64_t a1)
{
  _shouldDefer_onSerialQueue = 0;
  if (_transaction_onSerialQueue)
  {
    _DMLogFunc(v1, 7, @"cancelDeferredExitWithConnection: will end transaction and exit");
    uint64_t v3 = (void *)_transaction_onSerialQueue;
    _transaction_onSerialQueue = 0;

    v4 = (void *)_transactionIdentifier_onSerialQueue;
    _transactionIdentifier_onSerialQueue = 0;

    v5 = *(void **)(a1 + 32);
    [v5 _exitClean];
  }
  else
  {
    _DMLogFunc(v1, 7, @"cancelDeferredExitWithConnection: no transaction to end");
  }
}

- (void)_resetGlobalState
{
  v2 = +[DMMigrationDeferredExitManager _serialQueue];
  dispatch_sync(v2, &__block_literal_global_40);
}

void __51__DMMigrationDeferredExitManager__resetGlobalState__block_invoke()
{
  _isMigrating_onSerialQueue = 0;
  _shouldDefer_onSerialQueue = 0;
  uint64_t v0 = (void *)_transaction_onSerialQueue;
  _transaction_onSerialQueue = 0;

  uint64_t v1 = (void *)_transactionIdentifier_onSerialQueue;
  _transactionIdentifier_onSerialQueue = 0;
}

- (id)_deferralDuration
{
  return &unk_1F35EE198;
}

- (void)_exitClean
{
}

- (BOOL)_isDeferringExit
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v2 = +[DMMigrationDeferredExitManager _serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__DMMigrationDeferredExitManager__isDeferringExit__block_invoke;
  block[3] = &unk_1E6C1E0F8;
  block[4] = &v5;
  dispatch_sync(v2, block);

  LOBYTE(v2) = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

uint64_t __50__DMMigrationDeferredExitManager__isDeferringExit__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = _shouldDefer_onSerialQueue & 1 | (_transaction_onSerialQueue != 0);
  return result;
}

@end