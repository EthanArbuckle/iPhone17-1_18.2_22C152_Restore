@interface AKGlobalConfig
+ (id)sharedInstance;
- (void)fetchGlobalConfigUsingCachePolicy:(unint64_t)a3 completion:(id)a4;
@end

@implementation AKGlobalConfig

+ (id)sharedInstance
{
  if (sharedInstance_pred_0 != -1) {
    dispatch_once(&sharedInstance_pred_0, &__block_literal_global_45);
  }
  v2 = (void *)sharedInstance_sharedInstance_3;

  return v2;
}

uint64_t __32__AKGlobalConfig_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_3 = objc_alloc_init(AKGlobalConfig);

  return MEMORY[0x1F41817F8]();
}

- (void)fetchGlobalConfigUsingCachePolicy:(unint64_t)a3 completion:(id)a4
{
  id v5 = a4;
  v6 = objc_alloc_init(AKAppleIDAuthenticationController);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__AKGlobalConfig_fetchGlobalConfigUsingCachePolicy_completion___block_invoke;
  v8[3] = &unk_1E575EAE8;
  id v9 = v5;
  id v7 = v5;
  [(AKAppleIDAuthenticationController *)v6 fetchGlobalConfigurationUsingPolicy:a3 completion:v8];
}

uint64_t __63__AKGlobalConfig_fetchGlobalConfigUsingCachePolicy_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end