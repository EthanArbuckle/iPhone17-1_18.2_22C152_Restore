@interface CSActivationEventNotifier
+ (id)sharedNotifier;
- (CSActivationEventNotifier)init;
- (NSDictionary)handlerMap;
- (OS_dispatch_queue)queue;
- (id)_getHandlerFromEvent:(id)a3;
- (id)_getHandlerFromHandlerID:(unint64_t)a3;
- (void)_notifyActivationEvent:(id)a3 completion:(id)a4;
- (void)notifyActivationEvent:(id)a3 completion:(id)a4;
- (void)notifyActivationEvent:(unint64_t)a3 deviceId:(id)a4 activationInfo:(id)a5 completion:(id)a6;
- (void)notifyActivationEventSynchronously:(id)a3 completion:(id)a4;
- (void)notifyDeviceActivationEvent:(id)a3 completion:(id)a4;
- (void)setHandlerMap:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation CSActivationEventNotifier

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlerMap, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setHandlerMap:(id)a3
{
}

- (NSDictionary)handlerMap
{
  return self->_handlerMap;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)_getHandlerFromEvent:(id)a3
{
  uint64_t v4 = ([a3 type] << 16) | 1;
  return [(CSActivationEventNotifier *)self _getHandlerFromHandlerID:v4];
}

- (id)_getHandlerFromHandlerID:(unint64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  handlerMap = self->_handlerMap;
  uint64_t v4 = [NSNumber numberWithUnsignedInteger:a3];
  v5 = [(NSDictionary *)handlerMap objectForKey:v4];

  if (v5)
  {
    [v5 connect];
  }
  else
  {
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F5D298]) initWithMachServiceName:"com.apple.corespeech.corespeechd.activation.xpc"];
    v6 = (os_log_t *)MEMORY[0x1E4F5D180];
    v7 = *MEMORY[0x1E4F5D180];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      v11 = "-[CSActivationEventNotifier _getHandlerFromHandlerID:]";
      _os_log_impl(&dword_1C9338000, v7, OS_LOG_TYPE_DEFAULT, "%s Using default activation client", (uint8_t *)&v10, 0xCu);
    }
    [v5 connect];
    if (!v5)
    {
      v8 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
      {
        int v10 = 136315138;
        v11 = "-[CSActivationEventNotifier _getHandlerFromHandlerID:]";
        _os_log_error_impl(&dword_1C9338000, v8, OS_LOG_TYPE_ERROR, "%s activation client not exist", (uint8_t *)&v10, 0xCu);
      }
      v5 = 0;
    }
  }
  return v5;
}

- (void)notifyActivationEvent:(unint64_t)a3 deviceId:(id)a4 activationInfo:(id)a5 completion:(id)a6
{
  id v10 = a6;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __86__CSActivationEventNotifier_notifyActivationEvent_deviceId_activationInfo_completion___block_invoke;
  v16[3] = &unk_1E658D328;
  id v17 = v10;
  id v11 = v10;
  id v12 = a5;
  id v13 = a4;
  v14 = (void *)MEMORY[0x1CB785210](v16);
  v15 = (void *)[objc_alloc(MEMORY[0x1E4F5D288]) initWithType:a3 deviceId:v13 activationInfo:v12 hosttime:mach_absolute_time()];

  [(CSActivationEventNotifier *)self notifyDeviceActivationEvent:v15 completion:v14];
}

void __86__CSActivationEventNotifier_notifyActivationEvent_deviceId_activationInfo_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = (void *)*MEMORY[0x1E4F5D180];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_ERROR))
    {
      v8 = v6;
      v9 = [v5 localizedDescription];
      int v10 = 136315394;
      id v11 = "-[CSActivationEventNotifier notifyActivationEvent:deviceId:activationInfo:completion:]_block_invoke";
      __int16 v12 = 2114;
      id v13 = v9;
      _os_log_error_impl(&dword_1C9338000, v8, OS_LOG_TYPE_ERROR, "%s Cannot handle activation event : %{public}@", (uint8_t *)&v10, 0x16u);
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(void))(v7 + 16))();
  }
}

- (void)notifyDeviceActivationEvent:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__CSActivationEventNotifier_notifyDeviceActivationEvent_completion___block_invoke;
  block[3] = &unk_1E658D198;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

uint64_t __68__CSActivationEventNotifier_notifyDeviceActivationEvent_completion___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = (void *)*MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    uint64_t v4 = v2;
    id v5 = [v3 localizedDescription];
    int v7 = 136315394;
    v8 = "-[CSActivationEventNotifier notifyDeviceActivationEvent:completion:]_block_invoke";
    __int16 v9 = 2114;
    id v10 = v5;
    _os_log_impl(&dword_1C9338000, v4, OS_LOG_TYPE_DEFAULT, "%s Received Activation Event : %{public}@", (uint8_t *)&v7, 0x16u);
  }
  return [*(id *)(a1 + 40) _notifyActivationEvent:*(void *)(a1 + 32) completion:*(void *)(a1 + 48)];
}

- (void)notifyActivationEvent:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__CSActivationEventNotifier_notifyActivationEvent_completion___block_invoke;
  block[3] = &unk_1E658D198;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __62__CSActivationEventNotifier_notifyActivationEvent_completion___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = (void *)*MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    uint64_t v4 = v2;
    id v5 = [v3 localizedDescription];
    int v8 = 136315394;
    id v9 = "-[CSActivationEventNotifier notifyActivationEvent:completion:]_block_invoke";
    __int16 v10 = 2114;
    uint64_t v11 = v5;
    _os_log_impl(&dword_1C9338000, v4, OS_LOG_TYPE_DEFAULT, "%s Received Activation Event : %{public}@", (uint8_t *)&v8, 0x16u);
  }
  id v6 = *(void **)(a1 + 40);
  id v7 = [*(id *)(a1 + 32) deviceActivationEvent];
  [v6 _notifyActivationEvent:v7 completion:*(void *)(a1 + 48)];
}

- (void)notifyActivationEventSynchronously:(id)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = (void *)*MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    __int16 v10 = [v6 localizedDescription];
    int v12 = 136315394;
    id v13 = "-[CSActivationEventNotifier notifyActivationEventSynchronously:completion:]";
    __int16 v14 = 2114;
    v15 = v10;
    _os_log_impl(&dword_1C9338000, v9, OS_LOG_TYPE_DEFAULT, "%s Received Activation Event : %{public}@", (uint8_t *)&v12, 0x16u);
  }
  uint64_t v11 = [v6 deviceActivationEvent];
  [(CSActivationEventNotifier *)self _notifyActivationEvent:v11 completion:v7];
}

- (void)_notifyActivationEvent:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CSActivationEventNotifier *)self _getHandlerFromEvent:v7];
  [v8 notifyActivationEvent:v7 completion:v6];
}

- (CSActivationEventNotifier)init
{
  v6.receiver = self;
  v6.super_class = (Class)CSActivationEventNotifier;
  v2 = [(CSActivationEventNotifier *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSActivationEventNotifier", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

+ (id)sharedNotifier
{
  if (sharedNotifier_onceToken != -1) {
    dispatch_once(&sharedNotifier_onceToken, &__block_literal_global_19411);
  }
  v2 = (void *)sharedNotifier_sharedInstance;
  return v2;
}

void __43__CSActivationEventNotifier_sharedNotifier__block_invoke()
{
  v0 = objc_alloc_init(CSActivationEventNotifier);
  v1 = (void *)sharedNotifier_sharedInstance;
  sharedNotifier_sharedInstance = (uint64_t)v0;
}

@end