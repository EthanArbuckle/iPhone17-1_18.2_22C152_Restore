@interface ASKInAppPromotionController
+ (void)fetchOverridesForVisibilityAndOrderForApplicationBundleIdentifier:(id)a3 completionHandler:(id)a4;
@end

@implementation ASKInAppPromotionController

+ (void)fetchOverridesForVisibilityAndOrderForApplicationBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  v6 = (void *)MEMORY[0x1E4F3C2B8];
  id v7 = a3;
  v8 = [v6 defaultController];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __115__ASKInAppPromotionController_fetchOverridesForVisibilityAndOrderForApplicationBundleIdentifier_completionHandler___block_invoke;
  v10[3] = &unk_1E6DA89B0;
  id v11 = v5;
  id v9 = v5;
  [v8 fetchOverridesForVisibilityAndOrderForApplicationBundleIdentifier:v7 completionHandler:v10];
}

uint64_t __115__ASKInAppPromotionController_fetchOverridesForVisibilityAndOrderForApplicationBundleIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end