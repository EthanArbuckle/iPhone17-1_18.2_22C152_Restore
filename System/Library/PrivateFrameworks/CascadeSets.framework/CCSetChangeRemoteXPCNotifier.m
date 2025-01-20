@interface CCSetChangeRemoteXPCNotifier
+ (id)sharedInstance;
- (CCSetChangeRemoteXPCNotifier)init;
- (id)client;
- (void)notifyChangeToSet:(id)a3;
- (void)notifyChangeToSet:(id)a3 completion:(id)a4;
@end

@implementation CCSetChangeRemoteXPCNotifier

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__CCSetChangeRemoteXPCNotifier_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken2 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken2, block);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult;

  return v2;
}

void __46__CCSetChangeRemoteXPCNotifier_sharedInstance__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x24C5B1100]();
  id v3 = objc_alloc_init(*(Class *)(a1 + 32));
  v4 = (void *)sharedInstance__pasExprOnceResult;
  sharedInstance__pasExprOnceResult = (uint64_t)v3;
}

- (CCSetChangeRemoteXPCNotifier)init
{
  v7.receiver = self;
  v7.super_class = (Class)CCSetChangeRemoteXPCNotifier;
  v2 = [(CCSetChangeRemoteXPCNotifier *)&v7 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.cascade.CCSetChangeRelayClient", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (id)client
{
  v2 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26FDD6BA8];
  [v2 setClass:objc_opt_class() forSelector:sel_notifyChangeToSet_completion_ argumentIndex:0 ofReply:0];
  id v3 = objc_msgSend(MEMORY[0x263F08D68], "bm_connectionWithMachServiceName:queue:options:", @"com.apple.cascade.SetChangeRelayService", 0, 0);
  dispatch_queue_t v4 = [[CCXPCClient alloc] initWithRemoteObjectXPCInterface:v2 exportedXPCInterface:0 connection:v3 clientId:@"CCSetChangeRelayClient" interruptionCode:5 invalidationCode:4 useCase:0];

  return v4;
}

- (void)notifyChangeToSet:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__CCSetChangeRemoteXPCNotifier_notifyChangeToSet___block_invoke;
  v7[3] = &unk_265279EE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __50__CCSetChangeRemoteXPCNotifier_notifyChangeToSet___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __50__CCSetChangeRemoteXPCNotifier_notifyChangeToSet___block_invoke_2;
  v3[3] = &unk_265279EB8;
  id v4 = v1;
  [v2 notifyChangeToSet:v4 completion:v3];
}

void __50__CCSetChangeRemoteXPCNotifier_notifyChangeToSet___block_invoke_2(uint64_t a1, unsigned __int16 a2)
{
  id v4 = __biome_log_for_category();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __50__CCSetChangeRemoteXPCNotifier_notifyChangeToSet___block_invoke_2_cold_1(a1, a2, v4);
  }
}

- (void)notifyChangeToSet:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CCSetChangeRemoteXPCNotifier *)self client];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __61__CCSetChangeRemoteXPCNotifier_notifyChangeToSet_completion___block_invoke;
  v10[3] = &unk_265279F08;
  id v11 = v6;
  id v9 = v6;
  [v8 serviceRequest:1 completion:v7 usingBlock:v10];
}

uint64_t __61__CCSetChangeRemoteXPCNotifier_notifyChangeToSet_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 notifyChangeToSet:*(void *)(a1 + 32) completion:a3];
}

- (void).cxx_destruct
{
}

void __50__CCSetChangeRemoteXPCNotifier_notifyChangeToSet___block_invoke_2_cold_1(uint64_t a1, unsigned __int16 a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 1024;
  int v7 = a2;
  _os_log_debug_impl(&dword_249B92000, log, OS_LOG_TYPE_DEBUG, "CCSetChangeRelayClient notifying change to Set: %@ with result: %hu", (uint8_t *)&v4, 0x12u);
}

@end