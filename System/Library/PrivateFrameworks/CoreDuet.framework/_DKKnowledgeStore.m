@interface _DKKnowledgeStore
+ (id)_knowledgeStoreWithStoreDirectory:(uint64_t)a3 readOnly:;
+ (id)knowledgeStore;
+ (id)knowledgeStoreDisabledError;
+ (id)knowledgeStoreWithDirectReadOnlyAccess;
+ (id)knowledgeStoreWithDirectReadOnlyAccessWithXPCStore:(id)a3 storeDirectory:(id)a4;
+ (id)knowledgeStoreWithDirectReadWriteAccess;
+ (id)userKnowledgeStore;
+ (id)userKnowledgeStoreWithDirectReadOnlyAccess;
+ (id)userKnowledgeStoreWithDirectReadWriteAccess;
+ (uint64_t)isDisabled;
+ (void)isDisabled;
- (BOOL)deleteObjects:(id)a3 error:(id *)a4;
- (BOOL)deleteRemoteState:(id *)a3;
- (BOOL)isSyncPolicyDisabledForFeature:(unint64_t)a3 transportType:(int64_t)a4;
- (BOOL)saveObjects:(id)a3 error:(id *)a4;
- (BOOL)synchronizeWithError:(id *)a3;
- (BOOL)synchronizeWithUrgency:(unint64_t)a3 client:(id)a4 error:(id *)a5;
- (_DKKnowledgeStore)init;
- (_DKKnowledgeStore)initWithKnowledgeStoreHandle:(id)a3 readOnly:(BOOL)a4;
- (id)_sanitizeObjectsBeforeSaving:(id *)a1;
- (id)deviceUUID;
- (id)executeQuery:(id)a3 error:(id *)a4;
- (id)knowledgeSynchronizingHandleWithError:(id *)a1;
- (id)sourceDeviceIdentityFromObject:(id)a3 error:(id *)a4;
- (id)sourceDeviceIdentityWithError:(id *)a3;
- (unint64_t)deleteAllEventsInEventStream:(id)a3 error:(id *)a4;
- (unint64_t)deleteAllEventsMatchingPredicate:(id)a3 error:(id *)a4;
- (void)deleteAllEventsInEventStream:(id)a3 responseQueue:(id)a4 withCompletion:(id)a5;
- (void)deleteAllEventsMatchingPredicate:(id)a3 responseQueue:(id)a4 withCompletion:(id)a5;
- (void)deleteObjects:(id)a3 responseQueue:(id)a4 withCompletion:(id)a5;
- (void)deviceUUID;
- (void)disableSyncPolicyForFeature:(unint64_t)a3 transportType:(int64_t)a4;
- (void)executeQuery:(id)a3 responseQueue:(id)a4;
- (void)executeQuery:(id)a3 responseQueue:(id)a4 withCompletion:(id)a5;
- (void)saveObjects:(id)a3 responseQueue:(id)a4 withCompletion:(id)a5;
- (void)saveObjects:(id)a3 tracker:(id)a4 responseQueue:(id)a5 withCompletion:(id)a6;
- (void)synchronizeWithUrgency:(unint64_t)a3 client:(id)a4 responseQueue:(id)a5 completion:(id)a6;
@end

@implementation _DKKnowledgeStore

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultQueue, 0);
  objc_storeStrong((id *)&self->_privacyEnforcer, 0);
  objc_storeStrong((id *)&self->_rateLimitEnforcer, 0);
  objc_storeStrong((id *)&self->_knowledgeStoreHandle, 0);
}

+ (id)knowledgeStoreWithDirectReadOnlyAccess
{
  v3 = +[_DKXPCKnowledgeStore XPCKnowledgeStore];
  v4 = +[_CDPaths knowledgeDirectory];
  v5 = [a1 knowledgeStoreWithDirectReadOnlyAccessWithXPCStore:v3 storeDirectory:v4];

  return v5;
}

+ (id)knowledgeStoreWithDirectReadOnlyAccessWithXPCStore:(id)a3 storeDirectory:(id)a4
{
  return +[_DKKnowledgeStore _knowledgeStoreWithStoreDirectory:readOnly:]((uint64_t)a1, a4, 1);
}

+ (id)_knowledgeStoreWithStoreDirectory:(uint64_t)a3 readOnly:
{
  id v4 = a2;
  v5 = (objc_class *)self;
  v6 = +[_DKKnowledgeStorage storageWithDirectory:v4 readOnly:a3];

  if (v6)
  {
    v7 = (void *)[[v5 alloc] initWithKnowledgeStoreHandle:v6 readOnly:a3];
  }
  else
  {
    BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v8) {
      +[_DKKnowledgeStore _knowledgeStoreWithStoreDirectory:readOnly:](v8, v9, v10, v11, v12, v13, v14, v15);
    }
    v7 = 0;
  }

  return v7;
}

+ (id)knowledgeStore
{
  v3 = +[_DKXPCKnowledgeStore XPCKnowledgeStore];
  id v4 = (void *)[objc_alloc((Class)a1) initWithKnowledgeStoreHandle:v3 readOnly:0];

  return v4;
}

- (_DKKnowledgeStore)initWithKnowledgeStoreHandle:(id)a3 readOnly:(BOOL)a4
{
  id v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_DKKnowledgeStore;
  BOOL v8 = [(_DKKnowledgeStore *)&v17 init];
  if (v8)
  {
    if (!a4)
    {
      uint64_t v9 = +[_DKRateLimitPolicyEnforcer rateLimitPolicyEnforcer];
      rateLimitEnforcer = v8->_rateLimitEnforcer;
      v8->_rateLimitEnforcer = (_DKRateLimitPolicyEnforcer *)v9;

      uint64_t v11 = +[_DKPrivacyPolicyEnforcer privacyPolicyEnforcer];
      privacyEnforcer = v8->_privacyEnforcer;
      v8->_privacyEnforcer = (_DKPrivacyPolicyEnforcer *)v11;
    }
    uint64_t v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.coreduet.knowledgestore", v13);
    defaultQueue = v8->_defaultQueue;
    v8->_defaultQueue = (OS_dispatch_queue *)v14;

    objc_storeStrong((id *)&v8->_knowledgeStoreHandle, a3);
  }

  return v8;
}

- (void)saveObjects:(id)a3 tracker:(id)a4 responseQueue:(id)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = (OS_dispatch_queue *)a5;
  id v13 = a6;
  if (!+[_DKKnowledgeStore isDisabled]())
  {
    v20 = _os_activity_create(&dword_18ECEB000, "Duet: saveObjects async", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    block.opaque[0] = 0;
    block.opaque[1] = 0;
    os_activity_scope_enter(v20, &block);
    os_activity_scope_leave(&block);

    v21 = (void *)MEMORY[0x192FB2F20]();
    v19 = -[_DKKnowledgeStore _sanitizeObjectsBeforeSaving:]((id *)&self->super.isa, v10);
    if ([v19 count])
    {

      if (self) {
        knowledgeStoreHandle = self->_knowledgeStoreHandle;
      }
      else {
        knowledgeStoreHandle = 0;
      }
      defaultQueue = v12;
      if (!v12) {
        defaultQueue = self->_defaultQueue;
      }
      [(_DKKnowledgeQuerying *)knowledgeStoreHandle saveObjects:v19 tracker:v11 responseQueue:defaultQueue withCompletion:v13];
      id v10 = 0;
    }
    else
    {
      if (v13)
      {
        v24 = v12;
        if (!v12) {
          v24 = self->_defaultQueue;
        }
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __70___DKKnowledgeStore_saveObjects_tracker_responseQueue_withCompletion___block_invoke_2;
        v29[3] = &unk_1E560D950;
        id v30 = v13;
        v25 = v29;
        v26 = v24;
        v27 = (void *)os_transaction_create();
        block.opaque[0] = MEMORY[0x1E4F143A8];
        block.opaque[1] = 3221225472;
        v34 = __cd_dispatch_async_capture_tx_block_invoke;
        v35 = &unk_1E560D978;
        id v36 = v27;
        id v37 = v25;
        id v28 = v27;
        dispatch_async(v26, &block);
      }
    }
    goto LABEL_17;
  }
  if (v13)
  {
    dispatch_queue_t v14 = v12;
    if (!v12) {
      dispatch_queue_t v14 = self->_defaultQueue;
    }
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __70___DKKnowledgeStore_saveObjects_tracker_responseQueue_withCompletion___block_invoke;
    v31[3] = &unk_1E560D950;
    id v32 = v13;
    uint64_t v15 = v31;
    v16 = v14;
    objc_super v17 = (void *)os_transaction_create();
    block.opaque[0] = MEMORY[0x1E4F143A8];
    block.opaque[1] = 3221225472;
    v34 = __cd_dispatch_async_capture_tx_block_invoke;
    v35 = &unk_1E560D978;
    id v36 = v17;
    id v37 = v15;
    id v18 = v17;
    dispatch_async(v16, &block);

    v19 = v32;
LABEL_17:
  }
}

- (id)_sanitizeObjectsBeforeSaving:(id *)a1
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    id v4 = [a1[2] filterObjectsByEnforcingRateLimit:v3];
    a1 = [a1[3] enforcePrivacy:v4];
    uint64_t v5 = [a1 count];
    if (v5 != [v3 count])
    {
      v6 = +[_CDLogging knowledgeChannel];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        int v9 = 134218240;
        uint64_t v10 = [v3 count];
        __int16 v11 = 2048;
        uint64_t v12 = [a1 count];
        _os_log_impl(&dword_18ECEB000, v6, OS_LOG_TYPE_INFO, "Save of %lu objects filtered/sanitized to %lu objects.", (uint8_t *)&v9, 0x16u);
      }
    }
    if (![a1 count])
    {
      id v7 = +[_CDLogging knowledgeChannel];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_18ECEB000, v7, OS_LOG_TYPE_INFO, "Early out because no valid objects were provided.", (uint8_t *)&v9, 2u);
      }
    }
  }

  return a1;
}

- (id)executeQuery:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (+[_DKKnowledgeStore isDisabled]())
  {
    if (a4)
    {
      +[_DKKnowledgeStore knowledgeStoreDisabledError]();
      id v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    BOOL v8 = _os_activity_create(&dword_18ECEB000, "Duet: executeQuery sync", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    v11.opaque[0] = 0;
    v11.opaque[1] = 0;
    os_activity_scope_enter(v8, &v11);
    os_activity_scope_leave(&v11);

    if (self) {
      knowledgeStoreHandle = self->_knowledgeStoreHandle;
    }
    else {
      knowledgeStoreHandle = 0;
    }
    id v7 = [(_DKKnowledgeQuerying *)knowledgeStoreHandle executeQuery:v6 error:a4];
  }

  return v7;
}

- (void)executeQuery:(id)a3 responseQueue:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  int v9 = (OS_dispatch_queue *)a4;
  id v10 = a5;
  if (+[_DKKnowledgeStore isDisabled]())
  {
    if (v10)
    {
      defaultQueue = v9;
      if (!v9) {
        defaultQueue = self->_defaultQueue;
      }
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __63___DKKnowledgeStore_executeQuery_responseQueue_withCompletion___block_invoke;
      v19[3] = &unk_1E560D950;
      id v20 = v10;
      uint64_t v12 = v19;
      uint64_t v13 = defaultQueue;
      dispatch_queue_t v14 = (void *)os_transaction_create();
      block.opaque[0] = MEMORY[0x1E4F143A8];
      block.opaque[1] = 3221225472;
      v22 = __cd_dispatch_async_capture_tx_block_invoke;
      v23 = &unk_1E560D978;
      id v24 = v14;
      id v25 = v12;
      id v15 = v14;
      dispatch_async(v13, &block);
    }
  }
  else
  {
    v16 = _os_activity_create(&dword_18ECEB000, "Duet: executeQuery async", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    block.opaque[0] = 0;
    block.opaque[1] = 0;
    os_activity_scope_enter(v16, &block);
    os_activity_scope_leave(&block);

    if (self) {
      knowledgeStoreHandle = self->_knowledgeStoreHandle;
    }
    else {
      knowledgeStoreHandle = 0;
    }
    id v18 = v9;
    if (!v9) {
      id v18 = self->_defaultQueue;
    }
    [(_DKKnowledgeQuerying *)knowledgeStoreHandle executeQuery:v8 responseQueue:v18 withCompletion:v10];
  }
}

+ (uint64_t)isDisabled
{
  self;
  uint64_t v0 = _os_feature_enabled_impl();
  if (v0 && _os_feature_enabled_impl())
  {
    v1 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v1, OS_LOG_TYPE_FAULT)) {
      +[_DKKnowledgeStore isDisabled]();
    }
  }
  return v0;
}

+ (id)knowledgeStoreDisabledError
{
  v5[1] = *MEMORY[0x1E4F143B8];
  self;
  uint64_t v0 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v4 = *MEMORY[0x1E4F28568];
  v5[0] = @"Knowledge store has been decomissioned";
  v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  v2 = [v0 errorWithDomain:@"com.apple.coreduet.knowledge" code:10 userInfo:v1];

  return v2;
}

+ (id)userKnowledgeStore
{
  id v3 = +[_DKXPCKnowledgeStore XPCUserKnowledgeStore];
  uint64_t v4 = (void *)[objc_alloc((Class)a1) initWithKnowledgeStoreHandle:v3 readOnly:0];

  return v4;
}

+ (id)userKnowledgeStoreWithDirectReadOnlyAccess
{
  id v3 = +[_DKXPCKnowledgeStore XPCUserKnowledgeStore];
  uint64_t v4 = +[_CDPaths userKnowledgeDirectory];
  uint64_t v5 = [a1 knowledgeStoreWithDirectReadOnlyAccessWithXPCStore:v3 storeDirectory:v4];

  return v5;
}

+ (id)userKnowledgeStoreWithDirectReadWriteAccess
{
  id v3 = +[_CDPaths userKnowledgeDirectory];
  uint64_t v4 = +[_DKKnowledgeStore _knowledgeStoreWithStoreDirectory:readOnly:]((uint64_t)a1, v3, 0);

  return v4;
}

+ (id)knowledgeStoreWithDirectReadWriteAccess
{
  id v3 = +[_CDPaths knowledgeDirectory];
  uint64_t v4 = +[_DKKnowledgeStore _knowledgeStoreWithStoreDirectory:readOnly:]((uint64_t)a1, v3, 0);

  return v4;
}

- (_DKKnowledgeStore)init
{
  id v3 = +[_DKXPCKnowledgeStore XPCKnowledgeStore];
  uint64_t v4 = [(_DKKnowledgeStore *)self initWithKnowledgeStoreHandle:v3 readOnly:0];

  return v4;
}

- (BOOL)saveObjects:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (+[_DKKnowledgeStore isDisabled]())
  {
    if (a4)
    {
      +[_DKKnowledgeStore knowledgeStoreDisabledError]();
      char v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
    id v8 = _os_activity_create(&dword_18ECEB000, "Duet: saveObjects sync", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    v13.opaque[0] = 0;
    v13.opaque[1] = 0;
    os_activity_scope_enter(v8, &v13);
    os_activity_scope_leave(&v13);

    int v9 = (void *)MEMORY[0x192FB2F20]();
    id v10 = -[_DKKnowledgeStore _sanitizeObjectsBeforeSaving:]((id *)&self->super.isa, v6);
    if ([v10 count])
    {

      if (self) {
        knowledgeStoreHandle = self->_knowledgeStoreHandle;
      }
      else {
        knowledgeStoreHandle = 0;
      }
      char v7 = [(_DKKnowledgeQuerying *)knowledgeStoreHandle saveObjects:v10 error:a4];
      id v6 = 0;
    }
    else
    {
      char v7 = 1;
    }
  }
  return v7;
}

- (void)saveObjects:(id)a3 responseQueue:(id)a4 withCompletion:(id)a5
{
}

- (BOOL)deleteObjects:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (+[_DKKnowledgeStore isDisabled]())
  {
    if (a4)
    {
      +[_DKKnowledgeStore knowledgeStoreDisabledError]();
      char v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
    id v8 = _os_activity_create(&dword_18ECEB000, "Duet: deleteObjects sync", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    v11.opaque[0] = 0;
    v11.opaque[1] = 0;
    os_activity_scope_enter(v8, &v11);
    os_activity_scope_leave(&v11);

    if ([v6 count])
    {
      [(_DKRateLimitPolicyEnforcer *)self->_rateLimitEnforcer creditForDeletion:v6];
      char v7 = [(_DKKnowledgeQuerying *)self->_knowledgeStoreHandle deleteObjects:v6 error:a4];
    }
    else
    {
      int v9 = +[_CDLogging knowledgeChannel];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        LOWORD(v11.opaque[0]) = 0;
        _os_log_impl(&dword_18ECEB000, v9, OS_LOG_TYPE_INFO, "Early out because no valid objects were provided.", (uint8_t *)&v11, 2u);
      }

      char v7 = 1;
    }
  }

  return v7;
}

- (void)deleteObjects:(id)a3 responseQueue:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  int v9 = (OS_dispatch_queue *)a4;
  id v10 = a5;
  if (+[_DKKnowledgeStore isDisabled]())
  {
    if (v10)
    {
      defaultQueue = v9;
      if (!v9) {
        defaultQueue = self->_defaultQueue;
      }
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __64___DKKnowledgeStore_deleteObjects_responseQueue_withCompletion___block_invoke;
      v27[3] = &unk_1E560D950;
      id v28 = v10;
      uint64_t v12 = v27;
      os_activity_scope_state_s v13 = defaultQueue;
      dispatch_queue_t v14 = (void *)os_transaction_create();
      block.opaque[0] = MEMORY[0x1E4F143A8];
      block.opaque[1] = 3221225472;
      id v30 = __cd_dispatch_async_capture_tx_block_invoke;
      v31 = &unk_1E560D978;
      id v32 = v14;
      id v33 = v12;
      id v15 = v14;
      dispatch_async(v13, &block);

      v16 = v28;
LABEL_16:
    }
  }
  else
  {
    objc_super v17 = _os_activity_create(&dword_18ECEB000, "Duet: deleteObjects async", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    block.opaque[0] = 0;
    block.opaque[1] = 0;
    os_activity_scope_enter(v17, &block);
    os_activity_scope_leave(&block);

    if ([v8 count])
    {
      [(_DKRateLimitPolicyEnforcer *)self->_rateLimitEnforcer creditForDeletion:v8];
      id v18 = v9;
      if (!v9) {
        id v18 = self->_defaultQueue;
      }
      [(_DKKnowledgeQuerying *)self->_knowledgeStoreHandle deleteObjects:v8 responseQueue:v18 withCompletion:v10];
    }
    else
    {
      v19 = +[_CDLogging knowledgeChannel];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        LOWORD(block.opaque[0]) = 0;
        _os_log_impl(&dword_18ECEB000, v19, OS_LOG_TYPE_INFO, "Early out because no valid objects were provided.", (uint8_t *)&block, 2u);
      }

      if (v10)
      {
        id v20 = v9;
        if (!v9) {
          id v20 = self->_defaultQueue;
        }
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __64___DKKnowledgeStore_deleteObjects_responseQueue_withCompletion___block_invoke_14;
        v25[3] = &unk_1E560D950;
        id v26 = v10;
        v21 = v25;
        v22 = v20;
        v23 = (void *)os_transaction_create();
        block.opaque[0] = MEMORY[0x1E4F143A8];
        block.opaque[1] = 3221225472;
        id v30 = __cd_dispatch_async_capture_tx_block_invoke;
        v31 = &unk_1E560D978;
        id v32 = v23;
        id v33 = v21;
        id v24 = v23;
        dispatch_async(v22, &block);

        v16 = v26;
        goto LABEL_16;
      }
    }
  }
}

- (void)executeQuery:(id)a3 responseQueue:(id)a4
{
  id v6 = a3;
  char v7 = (OS_dispatch_queue *)a4;
  if (+[_DKKnowledgeStore isDisabled]())
  {
    id v8 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[_DKKnowledgeStore executeQuery:responseQueue:]();
    }
  }
  else
  {
    int v9 = _os_activity_create(&dword_18ECEB000, "Duet: executeQuery async no completion", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    v12.opaque[0] = 0;
    v12.opaque[1] = 0;
    os_activity_scope_enter(v9, &v12);
    os_activity_scope_leave(&v12);

    if (self) {
      knowledgeStoreHandle = self->_knowledgeStoreHandle;
    }
    else {
      knowledgeStoreHandle = 0;
    }
    defaultQueue = v7;
    if (!v7) {
      defaultQueue = self->_defaultQueue;
    }
    [(_DKKnowledgeQuerying *)knowledgeStoreHandle executeQuery:v6 responseQueue:defaultQueue];
  }
}

- (unint64_t)deleteAllEventsInEventStream:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (+[_DKKnowledgeStore isDisabled]())
  {
    if (a4)
    {
      +[_DKKnowledgeStore knowledgeStoreDisabledError]();
      unint64_t v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      unint64_t v7 = 0;
    }
  }
  else
  {
    id v8 = _os_activity_create(&dword_18ECEB000, "Duet: deleteAllEventsInEventStream sync", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    v11.opaque[0] = 0;
    v11.opaque[1] = 0;
    os_activity_scope_enter(v8, &v11);
    os_activity_scope_leave(&v11);

    if (self) {
      knowledgeStoreHandle = self->_knowledgeStoreHandle;
    }
    else {
      knowledgeStoreHandle = 0;
    }
    unint64_t v7 = [(_DKKnowledgeQuerying *)knowledgeStoreHandle deleteAllEventsInEventStream:v6 error:a4];
  }

  return v7;
}

- (void)deleteAllEventsInEventStream:(id)a3 responseQueue:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  int v9 = (OS_dispatch_queue *)a4;
  id v10 = a5;
  if (+[_DKKnowledgeStore isDisabled]())
  {
    if (v10)
    {
      defaultQueue = v9;
      if (!v9) {
        defaultQueue = self->_defaultQueue;
      }
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __79___DKKnowledgeStore_deleteAllEventsInEventStream_responseQueue_withCompletion___block_invoke;
      v19[3] = &unk_1E560D950;
      id v20 = v10;
      os_activity_scope_state_s v12 = v19;
      os_activity_scope_state_s v13 = defaultQueue;
      dispatch_queue_t v14 = (void *)os_transaction_create();
      block.opaque[0] = MEMORY[0x1E4F143A8];
      block.opaque[1] = 3221225472;
      v22 = __cd_dispatch_async_capture_tx_block_invoke;
      v23 = &unk_1E560D978;
      id v24 = v14;
      id v25 = v12;
      id v15 = v14;
      dispatch_async(v13, &block);
    }
  }
  else
  {
    v16 = _os_activity_create(&dword_18ECEB000, "Duet: deleteAllEventsInEventStream async", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    block.opaque[0] = 0;
    block.opaque[1] = 0;
    os_activity_scope_enter(v16, &block);
    os_activity_scope_leave(&block);

    if (self) {
      knowledgeStoreHandle = self->_knowledgeStoreHandle;
    }
    else {
      knowledgeStoreHandle = 0;
    }
    id v18 = v9;
    if (!v9) {
      id v18 = self->_defaultQueue;
    }
    [(_DKKnowledgeQuerying *)knowledgeStoreHandle deleteAllEventsInEventStream:v8 responseQueue:v18 withCompletion:v10];
  }
}

- (unint64_t)deleteAllEventsMatchingPredicate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (+[_DKKnowledgeStore isDisabled]())
  {
    if (a4)
    {
      +[_DKKnowledgeStore knowledgeStoreDisabledError]();
      unint64_t v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      unint64_t v7 = 0;
    }
  }
  else
  {
    id v8 = _os_activity_create(&dword_18ECEB000, "Duet: deleteAllEventsMatchingPredicate sync", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    v11.opaque[0] = 0;
    v11.opaque[1] = 0;
    os_activity_scope_enter(v8, &v11);
    os_activity_scope_leave(&v11);

    if (self) {
      knowledgeStoreHandle = self->_knowledgeStoreHandle;
    }
    else {
      knowledgeStoreHandle = 0;
    }
    unint64_t v7 = [(_DKKnowledgeQuerying *)knowledgeStoreHandle deleteAllEventsMatchingPredicate:v6 error:a4];
  }

  return v7;
}

- (void)deleteAllEventsMatchingPredicate:(id)a3 responseQueue:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  int v9 = (OS_dispatch_queue *)a4;
  id v10 = a5;
  if (+[_DKKnowledgeStore isDisabled]())
  {
    if (v10)
    {
      defaultQueue = v9;
      if (!v9) {
        defaultQueue = self->_defaultQueue;
      }
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __83___DKKnowledgeStore_deleteAllEventsMatchingPredicate_responseQueue_withCompletion___block_invoke;
      v19[3] = &unk_1E560D950;
      id v20 = v10;
      os_activity_scope_state_s v12 = v19;
      os_activity_scope_state_s v13 = defaultQueue;
      dispatch_queue_t v14 = (void *)os_transaction_create();
      block.opaque[0] = MEMORY[0x1E4F143A8];
      block.opaque[1] = 3221225472;
      v22 = __cd_dispatch_async_capture_tx_block_invoke;
      v23 = &unk_1E560D978;
      id v24 = v14;
      id v25 = v12;
      id v15 = v14;
      dispatch_async(v13, &block);
    }
  }
  else
  {
    v16 = _os_activity_create(&dword_18ECEB000, "Duet: deleteAllEventsMatchingPredicate async", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    block.opaque[0] = 0;
    block.opaque[1] = 0;
    os_activity_scope_enter(v16, &block);
    os_activity_scope_leave(&block);

    if (self) {
      knowledgeStoreHandle = self->_knowledgeStoreHandle;
    }
    else {
      knowledgeStoreHandle = 0;
    }
    id v18 = v9;
    if (!v9) {
      id v18 = self->_defaultQueue;
    }
    [(_DKKnowledgeQuerying *)knowledgeStoreHandle deleteAllEventsMatchingPredicate:v8 responseQueue:v18 withCompletion:v10];
  }
}

- (id)knowledgeSynchronizingHandleWithError:(id *)a1
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v3 = a1;
    if ([a1[1] conformsToProtocol:&unk_1EDE29718])
    {
      a1 = (id *)v3[1];
    }
    else
    {
      if (a2)
      {
        uint64_t v4 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v7 = *MEMORY[0x1E4F28228];
        v8[0] = @"knowledge store does not implement knowledge synchronizing protocol";
        uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
        *a2 = [v4 errorWithDomain:@"com.apple.coreduet.knowledge" code:5 userInfo:v5];
      }
      a1 = 0;
    }
  }
  return a1;
}

- (BOOL)synchronizeWithError:(id *)a3
{
  if (+[_DKKnowledgeStore isDisabled]())
  {
    if (a3)
    {
      +[_DKKnowledgeStore knowledgeStoreDisabledError]();
      char v5 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      return 0;
    }
  }
  else
  {
    id v6 = _os_activity_create(&dword_18ECEB000, "Duet: synchronizeWithError", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    v10.opaque[0] = 0;
    v10.opaque[1] = 0;
    os_activity_scope_enter(v6, &v10);
    os_activity_scope_leave(&v10);

    uint64_t v7 = -[_DKKnowledgeStore knowledgeSynchronizingHandleWithError:]((id *)&self->super.isa, a3);
    id v8 = v7;
    if (v7) {
      char v5 = [v7 synchronizeWithError:a3];
    }
    else {
      char v5 = 0;
    }
  }
  return v5;
}

- (BOOL)synchronizeWithUrgency:(unint64_t)a3 client:(id)a4 error:(id *)a5
{
  id v8 = a4;
  if (+[_DKKnowledgeStore isDisabled]())
  {
    if (a5)
    {
      +[_DKKnowledgeStore knowledgeStoreDisabledError]();
      char v9 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    os_activity_scope_state_s v10 = _os_activity_create(&dword_18ECEB000, "Duet: synchronizeWithUrgency", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    v15.opaque[0] = 0;
    v15.opaque[1] = 0;
    os_activity_scope_enter(v10, &v15);
    os_activity_scope_leave(&v15);

    os_activity_scope_state_s v11 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LOWORD(v15.opaque[0]) = 0;
      _os_log_impl(&dword_18ECEB000, v11, OS_LOG_TYPE_INFO, "Starting synchronizeWithUrgency.", (uint8_t *)&v15, 2u);
    }

    os_activity_scope_state_s v12 = -[_DKKnowledgeStore knowledgeSynchronizingHandleWithError:]((id *)&self->super.isa, a5);
    os_activity_scope_state_s v13 = v12;
    if (v12) {
      char v9 = [v12 synchronizeWithUrgency:a3 client:v8 error:a5];
    }
    else {
      char v9 = 0;
    }
  }
  return v9;
}

- (void)synchronizeWithUrgency:(unint64_t)a3 client:(id)a4 responseQueue:(id)a5 completion:(id)a6
{
  id v10 = a4;
  os_activity_scope_state_s v11 = (OS_dispatch_queue *)a5;
  id v12 = a6;
  if (!+[_DKKnowledgeStore isDisabled]())
  {
    v19 = _os_activity_create(&dword_18ECEB000, "Duet: synchronizeWithUrgency async", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    block.opaque[0] = 0;
    block.opaque[1] = 0;
    os_activity_scope_enter(v19, &block);
    os_activity_scope_leave(&block);

    id v30 = 0;
    id v20 = -[_DKKnowledgeStore knowledgeSynchronizingHandleWithError:]((id *)&self->super.isa, &v30);
    id v18 = v30;
    if (v20)
    {
      defaultQueue = v11;
      if (!v11) {
        defaultQueue = self->_defaultQueue;
      }
      [v20 synchronizeWithUrgency:a3 client:v10 responseQueue:defaultQueue completion:v12];
    }
    else if (v12)
    {
      v22 = v11;
      if (!v11) {
        v22 = self->_defaultQueue;
      }
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __76___DKKnowledgeStore_synchronizeWithUrgency_client_responseQueue_completion___block_invoke_2;
      v27[3] = &unk_1E560D978;
      id v29 = v12;
      id v28 = v18;
      v23 = v27;
      id v24 = v22;
      id v25 = (void *)os_transaction_create();
      block.opaque[0] = MEMORY[0x1E4F143A8];
      block.opaque[1] = 3221225472;
      v34 = __cd_dispatch_async_capture_tx_block_invoke;
      v35 = &unk_1E560D978;
      id v36 = v25;
      id v37 = v23;
      id v26 = v25;
      dispatch_async(v24, &block);
    }
    goto LABEL_15;
  }
  if (v12)
  {
    os_activity_scope_state_s v13 = v11;
    if (!v11) {
      os_activity_scope_state_s v13 = self->_defaultQueue;
    }
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __76___DKKnowledgeStore_synchronizeWithUrgency_client_responseQueue_completion___block_invoke;
    v31[3] = &unk_1E560D950;
    id v32 = v12;
    dispatch_queue_t v14 = v31;
    os_activity_scope_state_s v15 = v13;
    v16 = (void *)os_transaction_create();
    block.opaque[0] = MEMORY[0x1E4F143A8];
    block.opaque[1] = 3221225472;
    v34 = __cd_dispatch_async_capture_tx_block_invoke;
    v35 = &unk_1E560D978;
    id v36 = v16;
    id v37 = v14;
    id v17 = v16;
    dispatch_async(v15, &block);

    id v18 = v32;
LABEL_15:
  }
}

- (BOOL)deleteRemoteState:(id *)a3
{
  if (+[_DKKnowledgeStore isDisabled]())
  {
    if (a3)
    {
      +[_DKKnowledgeStore knowledgeStoreDisabledError]();
      char v5 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      return 0;
    }
  }
  else
  {
    id v6 = _os_activity_create(&dword_18ECEB000, "Duet: deleteRemoteState", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    v10.opaque[0] = 0;
    v10.opaque[1] = 0;
    os_activity_scope_enter(v6, &v10);
    os_activity_scope_leave(&v10);

    uint64_t v7 = -[_DKKnowledgeStore knowledgeSynchronizingHandleWithError:]((id *)&self->super.isa, a3);
    id v8 = v7;
    if (v7) {
      char v5 = [v7 deleteRemoteState:a3];
    }
    else {
      char v5 = 0;
    }
  }
  return v5;
}

- (id)sourceDeviceIdentityFromObject:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (+[_DKKnowledgeStore isDisabled]())
  {
    if (a4)
    {
      +[_DKKnowledgeStore knowledgeStoreDisabledError]();
      id v6 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    uint64_t v7 = [v5 source];
    id v6 = [v7 syncDeviceID];
  }
  return v6;
}

- (id)sourceDeviceIdentityWithError:(id *)a3
{
  if (+[_DKKnowledgeStore isDisabled]())
  {
    if (a3)
    {
      +[_DKKnowledgeStore knowledgeStoreDisabledError]();
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      id v6 = 0;
      *a3 = v5;
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    uint64_t v7 = _os_activity_create(&dword_18ECEB000, "Duet: sourceDeviceIdentityFromObject", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    v14.opaque[0] = 0;
    v14.opaque[1] = 0;
    os_activity_scope_enter(v7, &v14);
    os_activity_scope_leave(&v14);

    id v8 = self;
    objc_sync_enter(v8);
    if (!sourceDeviceIdentityWithError__sourceDeviceID)
    {
      char v9 = -[_DKKnowledgeStore knowledgeSynchronizingHandleWithError:]((id *)&v8->super.isa, a3);
      os_activity_scope_state_s v10 = v9;
      if (v9)
      {
        uint64_t v11 = [v9 sourceDeviceIdentityWithError:a3];
        id v12 = (void *)sourceDeviceIdentityWithError__sourceDeviceID;
        sourceDeviceIdentityWithError__sourceDeviceID = v11;
      }
    }
    objc_sync_exit(v8);

    id v6 = (id)sourceDeviceIdentityWithError__sourceDeviceID;
  }
  return v6;
}

- (id)deviceUUID
{
  if (+[_DKKnowledgeStore isDisabled]())
  {
    id v3 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[_DKKnowledgeStore deviceUUID]();
    }

    id v4 = 0;
  }
  else
  {
    id v5 = _os_activity_create(&dword_18ECEB000, "Duet: deviceUUID", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v5, &state);
    os_activity_scope_leave(&state);

    id v6 = self;
    objc_sync_enter(v6);
    if (!deviceUUID_deviceUUID)
    {
      id v12 = 0;
      uint64_t v7 = -[_DKKnowledgeStore knowledgeSynchronizingHandleWithError:]((id *)&v6->super.isa, &v12);
      id v8 = v12;
      if (v7)
      {
        uint64_t v9 = [v7 deviceUUID];
        os_activity_scope_state_s v10 = (void *)deviceUUID_deviceUUID;
        deviceUUID_deviceUUID = v9;
      }
    }
    objc_sync_exit(v6);

    id v4 = (id)deviceUUID_deviceUUID;
  }
  return v4;
}

- (void)disableSyncPolicyForFeature:(unint64_t)a3 transportType:(int64_t)a4
{
  if (+[_DKKnowledgeStore isDisabled]())
  {
    uint64_t v7 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_ERROR)) {
      -[_DKKnowledgeStore disableSyncPolicyForFeature:transportType:]();
    }
  }
  else
  {
    id v8 = _os_activity_create(&dword_18ECEB000, "Duet: disableSyncPolicy", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v8, &state);
    os_activity_scope_leave(&state);

    uint64_t v7 = self;
    objc_sync_enter(v7);
    id v11 = 0;
    uint64_t v9 = -[_DKKnowledgeStore knowledgeSynchronizingHandleWithError:]((id *)&v7->super.isa, &v11);
    id v10 = v11;
    if (v9) {
      [v9 disableSyncPolicyForFeature:a3 transportType:a4];
    }

    objc_sync_exit(v7);
  }
}

- (BOOL)isSyncPolicyDisabledForFeature:(unint64_t)a3 transportType:(int64_t)a4
{
  if (+[_DKKnowledgeStore isDisabled]())
  {
    uint64_t v7 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[_DKKnowledgeStore isSyncPolicyDisabledForFeature:transportType:]();
    }

    return 0;
  }
  else
  {
    uint64_t v9 = _os_activity_create(&dword_18ECEB000, "Duet: isSyncPolicyDisabled", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v9, &state);
    os_activity_scope_leave(&state);

    id v10 = self;
    objc_sync_enter(v10);
    id v13 = 0;
    id v11 = -[_DKKnowledgeStore knowledgeSynchronizingHandleWithError:]((id *)&v10->super.isa, &v13);
    id v12 = v13;
    if (v11) {
      isSyncPolicyDisabledForFeature_transportType__disabled = [v11 isSyncPolicyDisabledForFeature:a3 transportType:a4];
    }

    objc_sync_exit(v10);
    return isSyncPolicyDisabledForFeature_transportType__disabled != 0;
  }
}

+ (void)isDisabled
{
  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_18ECEB000, v0, OS_LOG_TYPE_FAULT, "Knowledge store has been decomissioned", v1, 2u);
}

+ (void)_knowledgeStoreWithStoreDirectory:(uint64_t)a3 readOnly:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)executeQuery:responseQueue:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18ECEB000, v0, v1, "-executeQuery:responseQueue: dropped. Knowledge store has been decomissioned.", v2, v3, v4, v5, v6);
}

- (void)deviceUUID
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18ECEB000, v0, v1, "-deviceUUID: returning nil. Knowledge store has been decomissioned.", v2, v3, v4, v5, v6);
}

- (void)disableSyncPolicyForFeature:transportType:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18ECEB000, v0, v1, "-disableSyncPolicy. Knowledge store has been decomissioned.", v2, v3, v4, v5, v6);
}

- (void)isSyncPolicyDisabledForFeature:transportType:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18ECEB000, v0, v1, "-isSyncPolicyDisabled: returning nil. Knowledge store has been decomissioned.", v2, v3, v4, v5, v6);
}

@end