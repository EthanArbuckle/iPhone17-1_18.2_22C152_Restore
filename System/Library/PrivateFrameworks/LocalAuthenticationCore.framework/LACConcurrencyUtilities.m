@interface LACConcurrencyUtilities
+ (OS_dispatch_queue)daemonQueue;
+ (id)createDefaultQueueWithIdentifier:(id)a3 concurrencyAttribute:(id)a4;
+ (id)createDefaultSerialQueueWithIdentifier:(id)a3;
+ (id)createQueueWithIdentifier:(id)a3 concurrencyAttribute:(id)a4 qos:(unsigned int)a5;
+ (id)createSerialQueueWithIdentifier:(id)a3 qos:(unsigned int)a4;
+ (id)createUserInitiatedSerialQueueWithIdentifier:(id)a3;
+ (id)globalUserInitiatedConcurrentQueue;
@end

@implementation LACConcurrencyUtilities

+ (id)createSerialQueueWithIdentifier:(id)a3 qos:(unsigned int)a4
{
  return (id)[a1 createQueueWithIdentifier:a3 concurrencyAttribute:0 qos:*(void *)&a4];
}

+ (id)createQueueWithIdentifier:(id)a3 concurrencyAttribute:(id)a4 qos:(unsigned int)a5
{
  v6 = dispatch_queue_attr_make_with_qos_class((dispatch_queue_attr_t)a4, (dispatch_qos_class_t)a5, 0);
  dispatch_queue_t v7 = dispatch_queue_create((const char *)[a3 UTF8String], v6);

  return v7;
}

+ (id)createUserInitiatedSerialQueueWithIdentifier:(id)a3
{
  return (id)[a1 createSerialQueueWithIdentifier:a3 qos:25];
}

+ (OS_dispatch_queue)daemonQueue
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__LACConcurrencyUtilities_daemonQueue__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (daemonQueue_onceToken != -1) {
    dispatch_once(&daemonQueue_onceToken, block);
  }
  v2 = (void *)daemonQueue__queue;
  return (OS_dispatch_queue *)v2;
}

+ (id)createDefaultQueueWithIdentifier:(id)a3 concurrencyAttribute:(id)a4
{
  id v5 = a3;
  v6 = a4;
  dispatch_queue_t v7 = dispatch_queue_create((const char *)[v5 UTF8String], v6);

  return v7;
}

uint64_t __38__LACConcurrencyUtilities_daemonQueue__block_invoke(uint64_t a1)
{
  daemonQueue__queue = [*(id *)(a1 + 32) createUserInitiatedSerialQueueWithIdentifier:@"daemon-serial-queue"];
  return MEMORY[0x270F9A758]();
}

+ (id)createDefaultSerialQueueWithIdentifier:(id)a3
{
  return (id)[a1 createDefaultQueueWithIdentifier:a3 concurrencyAttribute:0];
}

+ (id)globalUserInitiatedConcurrentQueue
{
  return dispatch_get_global_queue(25, 0);
}

@end