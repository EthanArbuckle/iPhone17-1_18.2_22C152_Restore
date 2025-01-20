@interface CSSubscriptionManager
+ (id)sharedManager;
- (CSSubscriptionManager)init;
- (void)registerSubscriptionWithInfo:(id)a3 expirationDate:(id)a4;
- (void)unregisterAllSubscriptions;
- (void)unregisterSubscriptionWithInfo:(id)a3;
@end

@implementation CSSubscriptionManager

+ (id)sharedManager
{
  if (sharedManager_once != -1) {
    dispatch_once(&sharedManager_once, &__block_literal_global_0);
  }
  v2 = (void *)sharedManager_mgr;

  return v2;
}

uint64_t __38__CSSubscriptionManager_sharedManager__block_invoke()
{
  sharedManager_mgr = objc_alloc_init(CSSubscriptionManager);

  return MEMORY[0x1F41817F8]();
}

- (CSSubscriptionManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)CSSubscriptionManager;
  v2 = [(CSSubscriptionManager *)&v8 init];
  if (v2)
  {
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x2050000000;
    v3 = (void *)getPSSSSubscriptionManagerClass_softClass;
    uint64_t v13 = getPSSSSubscriptionManagerClass_softClass;
    if (!getPSSSSubscriptionManagerClass_softClass)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __getPSSSSubscriptionManagerClass_block_invoke;
      v9[3] = &unk_1E5548E88;
      v9[4] = &v10;
      __getPSSSSubscriptionManagerClass_block_invoke((uint64_t)v9);
      v3 = (void *)v11[3];
    }
    v4 = v3;
    _Block_object_dispose(&v10, 8);
    v5 = (PSSSSubscriptionManager *)objc_alloc_init(v4);
    internal = v2->_internal;
    v2->_internal = v5;
  }
  return v2;
}

- (void)registerSubscriptionWithInfo:(id)a3 expirationDate:(id)a4
{
}

- (void)unregisterSubscriptionWithInfo:(id)a3
{
}

- (void)unregisterAllSubscriptions
{
}

- (void).cxx_destruct
{
}

@end