@interface SYSyncEngine
- (BOOL)buffersHandshake;
- (BOOL)buffersSessions;
- (BOOL)isInSession;
- (BOOL)resume:(id *)a3;
- (BOOL)targetConnected;
- (BOOL)targetIsNearby;
- (OS_dispatch_queue)queue;
- (OS_os_activity)transportActivity;
- (PBCodable)stateForLogging;
- (SYService)service;
- (SYSyncEngine)initWithService:(id)a3 queue:(id)a4;
- (SYSyncEngineResponder)responder;
- (id)cancelMessagesReturningFailures:(id)a3;
- (id)outputStreamWithMetadata:(id)a3 priority:(int64_t)a4 options:(id)a5 context:(id)a6 error:(id *)a7;
- (void)beginSession;
- (void)dealloc;
- (void)endSession;
- (void)enqueueSyncRequest:(id)a3 withMessageID:(unsigned __int16)a4 priority:(int64_t)a5 options:(id)a6 userContext:(id)a7 callback:(id)a8;
- (void)setResponder:(id)a3;
- (void)suspend;
@end

@implementation SYSyncEngine

- (SYSyncEngine)initWithService:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)SYSyncEngine;
  v8 = [(SYSyncEngine *)&v23 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_service, v6);
    v10 = [v6 serviceActivity];
    os_activity_t v11 = _os_activity_create(&dword_21C7C9000, "Transport", v10, OS_ACTIVITY_FLAG_DEFAULT);

    transportActivity = v9->_transportActivity;
    v9->_transportActivity = (OS_os_activity *)v11;

    if (v7)
    {
      v13 = (OS_dispatch_queue *)v7;
      queue = v9->_queue;
      v9->_queue = v13;
    }
    else
    {
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      queue = (OS_dispatch_queue *) objc_claimAutoreleasedReturnValue();
      v16 = (const char *)[(OS_dispatch_queue *)queue UTF8String];
      v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v18 = dispatch_get_global_queue(21, 0);
      dispatch_queue_t v19 = dispatch_queue_create_with_target_V2(v16, v17, v18);
      v20 = v9->_queue;
      v9->_queue = (OS_dispatch_queue *)v19;
    }
    +[SYQueueDumper registerQueue:v9->_queue];
    v21 = v9;
  }

  return v9;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)SYSyncEngine;
  [(SYSyncEngine *)&v2 dealloc];
}

- (SYSyncEngineResponder)responder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_responder);
  return (SYSyncEngineResponder *)WeakRetained;
}

- (void)setResponder:(id)a3
{
}

- (void)beginSession
{
  v3 = (OS_os_transaction *)os_transaction_create();
  transaction = self->_transaction;
  self->_transaction = v3;
  MEMORY[0x270F9A758](v3, transaction);
}

- (void)endSession
{
  self->_transaction = 0;
  MEMORY[0x270F9A758]();
}

- (BOOL)isInSession
{
  return 0;
}

- (BOOL)buffersSessions
{
  return 0;
}

- (BOOL)buffersHandshake
{
  return 0;
}

- (BOOL)targetIsNearby
{
  return 0;
}

- (BOOL)targetConnected
{
  return 0;
}

- (id)cancelMessagesReturningFailures:(id)a3
{
  id v3 = a3;
  return v3;
}

- (OS_os_activity)transportActivity
{
  return self->_transportActivity;
}

- (SYService)service
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_service);
  return (SYService *)WeakRetained;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_service);
  objc_storeStrong((id *)&self->_transportActivity, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_destroyWeak((id *)&self->_responder);
}

- (BOOL)resume:(id *)a3
{
  OUTLINED_FUNCTION_1_4();
  uint64_t v3 = objc_opt_class();
  OUTLINED_FUNCTION_0_7(v3);
  return 0;
}

- (void)suspend
{
  OUTLINED_FUNCTION_1_4();
  uint64_t v4 = objc_opt_class();
  MEMORY[0x270EF2BB8](v3, v2, v4);
}

- (void)enqueueSyncRequest:(id)a3 withMessageID:(unsigned __int16)a4 priority:(int64_t)a5 options:(id)a6 userContext:(id)a7 callback:(id)a8
{
  OUTLINED_FUNCTION_1_4();
  uint64_t v10 = objc_opt_class();
  MEMORY[0x270EF2BB8](v9, v8, v10);
}

- (id)outputStreamWithMetadata:(id)a3 priority:(int64_t)a4 options:(id)a5 context:(id)a6 error:(id *)a7
{
  OUTLINED_FUNCTION_1_4();
  uint64_t v7 = objc_opt_class();
  OUTLINED_FUNCTION_0_7(v7);
  return 0;
}

- (PBCodable)stateForLogging
{
  OUTLINED_FUNCTION_1_4();
  uint64_t v2 = objc_opt_class();
  OUTLINED_FUNCTION_0_7(v2);
  return 0;
}

@end