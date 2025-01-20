@interface DNDSXPCEventInterface
+ (id)sharedInstance;
- (void)registerForStream:(id)a3 queue:(id)a4 handler:(id)a5;
- (void)setEvent:(id)a3 forKey:(id)a4 onStream:(id)a5;
@end

@implementation DNDSXPCEventInterface

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__DNDSXPCEventInterface_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, block);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

uint64_t __39__DNDSXPCEventInterface_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

- (void)setEvent:(id)a3 forKey:(id)a4 onStream:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v10 = a3;
  [v7 UTF8String];
  id v9 = v8;
  [v9 UTF8String];

  xpc_set_event();
}

- (void)registerForStream:(id)a3 queue:(id)a4 handler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  targetq = a4;
  xpc_set_event_stream_handler((const char *)[v7 UTF8String], targetq, v8);
}

@end