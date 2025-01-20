@interface CRXUNotificationCenter
+ (id)sharedInstance;
- (int)addBlockObserver:(id)a3 queue:(id)a4 name:(id)a5;
- (int)addObserver:(id)a3 selector:(SEL)a4 queue:(id)a5 name:(id)a6;
- (void)postNotificationName:(id)a3;
- (void)removeObserver:(int)a3;
@end

@implementation CRXUNotificationCenter

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__CRXUNotificationCenter_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance___once__LINE___1 != -1) {
    dispatch_once(&sharedInstance___once__LINE___1, block);
  }
  v2 = (void *)sharedInstance_instance_1;
  return v2;
}

uint64_t __40__CRXUNotificationCenter_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_instance_1 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

- (void)postNotificationName:(id)a3
{
  v3 = (const char *)[a3 UTF8String];
  notify_post(v3);
}

- (int)addBlockObserver:(id)a3 queue:(id)a4 name:(id)a5
{
  id v7 = a3;
  int out_token = 0;
  id v8 = a5;
  id v9 = a4;
  v10 = (const char *)[v8 UTF8String];
  v11 = [v9 queue];

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __54__CRXUNotificationCenter_addBlockObserver_queue_name___block_invoke;
  v14[3] = &unk_2652E2128;
  id v15 = v7;
  id v12 = v7;
  notify_register_dispatch(v10, &out_token, v11, v14);

  LODWORD(v10) = out_token;
  return (int)v10;
}

uint64_t __54__CRXUNotificationCenter_addBlockObserver_queue_name___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int)addObserver:(id)a3 selector:(SEL)a4 queue:(id)a5 name:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  int out_token = 0;
  objc_initWeak(&location, v9);
  id v12 = v11;
  v13 = (const char *)[v12 UTF8String];
  v14 = [v10 queue];
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __58__CRXUNotificationCenter_addObserver_selector_queue_name___block_invoke;
  handler[3] = &unk_2652E2150;
  objc_copyWeak(v19, &location);
  v19[1] = (id)a4;
  id v15 = v12;
  id v18 = v15;
  notify_register_dispatch(v13, &out_token, v14, handler);

  LODWORD(v13) = out_token;
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);

  return (int)v13;
}

void __58__CRXUNotificationCenter_addObserver_selector_queue_name___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (objc_opt_respondsToSelector()) {
      ((void (*)(id, void, void))[WeakRetained methodForSelector:*(void *)(a1 + 48)])(WeakRetained, *(void *)(a1 + 48), *(void *)(a1 + 32));
    }
  }
  else
  {
    notify_cancel(a2);
  }
}

- (void)removeObserver:(int)a3
{
}

@end