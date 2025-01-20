@interface AXServerInstanceActionHandlerHelper
- (AXServerInstanceActionHandlerHelper)initWithRegistrationMessageKey:(int)a3 actionResultMessageKey:(int)a4;
- (BOOL)_hasActionHandlerForClientPort:(unsigned int)a3;
- (id)handleActionHandlerRegistrationMessage:(id)a3;
- (int)actionResultMessageKey;
- (int)registrationMessageKey;
- (void)_removeActionHandler:(unsigned int)a3;
- (void)notifyActionOccurredWithType:(int64_t)a3 payload:(id)a4;
@end

@implementation AXServerInstanceActionHandlerHelper

void __76__AXServerInstanceActionHandlerHelper_notifyActionOccurredWithType_payload___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F1CA60];
  v3 = [NSNumber numberWithInteger:*(void *)(a1 + 56)];
  v4 = [v2 dictionaryWithObject:v3 forKey:@"type"];

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    [v4 setObject:v5 forKeyedSubscript:@"payload"];
  }
  v6 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", [*(id *)(a1 + 40) actionResultMessageKey], v4);
  v7 = *(void **)(a1 + 48);
  id v11 = 0;
  char v8 = [v7 sendSimpleMessage:v6 withError:&v11];
  id v9 = v11;
  if ((v8 & 1) == 0)
  {
    v10 = AXLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __76__AXServerInstanceActionHandlerHelper_notifyActionOccurredWithType_payload___block_invoke_2_cold_1((uint64_t)v9, v10);
    }
  }
}

- (int)actionResultMessageKey
{
  return self->_actionResultMessageKey;
}

- (void)notifyActionOccurredWithType:(int64_t)a3 payload:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (notifyActionOccurredWithType_payload__onceToken[0] != -1) {
    dispatch_once(notifyActionOccurredWithType_payload__onceToken, &__block_literal_global_30);
  }
  if (notifyActionOccurredWithType_payload__actionQueue)
  {
    v7 = (void *)[v6 copy];

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    obj = self->_actionHandlers;
    uint64_t v8 = [(NSMutableArray *)obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          v13 = notifyActionOccurredWithType_payload__actionQueue;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __76__AXServerInstanceActionHandlerHelper_notifyActionOccurredWithType_payload___block_invoke_2;
          block[3] = &unk_1E5587BB0;
          int64_t v19 = a3;
          id v16 = v7;
          v17 = self;
          uint64_t v18 = v12;
          dispatch_async(v13, block);
        }
        uint64_t v9 = [(NSMutableArray *)obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v9);
    }
  }
  else
  {
    v7 = v6;
  }
}

- (AXServerInstanceActionHandlerHelper)initWithRegistrationMessageKey:(int)a3 actionResultMessageKey:(int)a4
{
  v11.receiver = self;
  v11.super_class = (Class)AXServerInstanceActionHandlerHelper;
  id v6 = [(AXServerInstanceActionHandlerHelper *)&v11 init];
  v7 = v6;
  if (v6)
  {
    v6->_registrationMessageKey = a3;
    v6->_actionResultMessageKey = a4;
    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    actionHandlers = v7->_actionHandlers;
    v7->_actionHandlers = (NSMutableArray *)v8;
  }
  return v7;
}

- (id)handleActionHandlerRegistrationMessage:(id)a3
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 payload];
  id v6 = [v5 objectForKey:@"register"];
  int v7 = [v6 BOOLValue];

  uint64_t v8 = [v4 clientPort];
  if (!v7)
  {
    [(AXServerInstanceActionHandlerHelper *)self _removeActionHandler:v8];
    goto LABEL_6;
  }
  if ([(AXServerInstanceActionHandlerHelper *)self _hasActionHandlerForClientPort:v8])
  {
LABEL_6:
    uint64_t v11 = 1;
    goto LABEL_11;
  }
  uint64_t v9 = [[AXIPCClient alloc] initWithPort:v8];
  LODWORD(v10) = 1.0;
  [(AXIPCClient *)v9 setTimeout:v10];
  id v22 = 0;
  uint64_t v11 = [(AXIPCClient *)v9 connectWithError:&v22];
  id v12 = v22;
  if (v11)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __78__AXServerInstanceActionHandlerHelper_handleActionHandlerRegistrationMessage___block_invoke;
    v20[3] = &unk_1E5586F40;
    v20[4] = self;
    int v21 = v8;
    [(AXIPCClient *)v9 setPortDeathHandler:v20];
    [(NSMutableArray *)self->_actionHandlers addObject:v9];
  }
  else
  {
    v13 = AXLogIPC();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[AXServerInstanceActionHandlerHelper handleActionHandlerRegistrationMessage:]((uint64_t)v12, v13);
    }
  }
LABEL_11:
  v14 = [AXIPCMessage alloc];
  uint64_t v15 = [(AXServerInstanceActionHandlerHelper *)self registrationMessageKey];
  long long v23 = @"result";
  id v16 = [NSNumber numberWithBool:v11];
  v24[0] = v16;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
  uint64_t v18 = [(AXIPCMessage *)v14 initWithKey:v15 payload:v17];

  return v18;
}

uint64_t __78__AXServerInstanceActionHandlerHelper_handleActionHandlerRegistrationMessage___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeActionHandler:*(unsigned int *)(a1 + 40)];
}

void __76__AXServerInstanceActionHandlerHelper_notifyActionOccurredWithType_payload___block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);

  dispatch_queue_t v1 = dispatch_queue_create("axserverinstance-action-queue", attr);
  v2 = (void *)notifyActionOccurredWithType_payload__actionQueue;
  notifyActionOccurredWithType_payload__actionQueue = (uint64_t)v1;
}

- (BOOL)_hasActionHandlerForClientPort:(unsigned int)a3
{
  actionHandlers = self->_actionHandlers;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __70__AXServerInstanceActionHandlerHelper__hasActionHandlerForClientPort___block_invoke;
  v5[3] = &__block_descriptor_36_e28_B32__0__AXIPCClient_8Q16_B24l;
  unsigned int v6 = a3;
  return [(NSMutableArray *)actionHandlers indexOfObjectPassingTest:v5] != 0x7FFFFFFFFFFFFFFFLL;
}

BOOL __70__AXServerInstanceActionHandlerHelper__hasActionHandlerForClientPort___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  int v6 = [a2 serviceMachPort];
  int v7 = *(_DWORD *)(a1 + 32);
  if (v6 == v7) {
    *a4 = 1;
  }
  return v6 == v7;
}

- (void)_removeActionHandler:(unsigned int)a3
{
  actionHandlers = self->_actionHandlers;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__AXServerInstanceActionHandlerHelper__removeActionHandler___block_invoke;
  v6[3] = &__block_descriptor_36_e15_B32__0_8Q16_B24l;
  unsigned int v7 = a3;
  uint64_t v5 = [(NSMutableArray *)actionHandlers indexesOfObjectsPassingTest:v6];
  if (v5) {
    [(NSMutableArray *)self->_actionHandlers removeObjectsAtIndexes:v5];
  }
}

BOOL __60__AXServerInstanceActionHandlerHelper__removeActionHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serviceMachPort] == *(_DWORD *)(a1 + 32);
}

- (int)registrationMessageKey
{
  return self->_registrationMessageKey;
}

- (void).cxx_destruct
{
}

- (void)handleActionHandlerRegistrationMessage:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18D308000, a2, OS_LOG_TYPE_ERROR, "Could not connect client for registering serveri nstance action handler: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __76__AXServerInstanceActionHandlerHelper_notifyActionOccurredWithType_payload___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18D308000, a2, OS_LOG_TYPE_ERROR, "Error sending server instance action: %@", (uint8_t *)&v2, 0xCu);
}

@end