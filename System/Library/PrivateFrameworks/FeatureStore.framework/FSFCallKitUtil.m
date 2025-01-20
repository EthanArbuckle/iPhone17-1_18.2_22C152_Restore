@interface FSFCallKitUtil
+ (id)sharedInstance;
- (BOOL)isOnCall;
- (CXCallObserver)callCenter;
- (FSFCallKitUtil)init;
@end

@implementation FSFCallKitUtil

- (FSFCallKitUtil)init
{
  v6.receiver = self;
  v6.super_class = (Class)FSFCallKitUtil;
  v2 = [(FSFCallKitUtil *)&v6 init];
  if (v2)
  {
    v3 = (CXCallObserver *)objc_alloc_init(MEMORY[0x263EFC8E8]);
    callCenter = v2->_callCenter;
    v2->_callCenter = v3;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)sharedInstance_sSharedUtil;

  return v2;
}

uint64_t __32__FSFCallKitUtil_sharedInstance__block_invoke()
{
  sharedInstance_sSharedUtil = objc_alloc_init(FSFCallKitUtil);

  return MEMORY[0x270F9A758]();
}

- (BOOL)isOnCall
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(CXCallObserver *)self->_callCenter calls];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (![*(id *)(*((void *)&v7 + 1) + 8 * i) hasEnded])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (CXCallObserver)callCenter
{
  return self->_callCenter;
}

- (void).cxx_destruct
{
}

@end