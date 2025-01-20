@interface UINavigationController
@end

@implementation UINavigationController

void __84__UINavigationController_MFUtilities__mf_viewControllerOfClass_startFromTopOfStack___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if (objc_opt_isKindOfClass())
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

void __86__UINavigationController_MFMailComposeRemoteService__mf_keyPathsMapForUICustomization__block_invoke()
{
  v8[3] = *MEMORY[0x1E4F143B8];
  v7[0] = @"navigationBar.tintColor";
  v8[0] = objc_opt_class();
  v7[1] = @"navigationBar.barStyle";
  v8[1] = objc_opt_class();
  v7[2] = @"navigationBar.titleTextAttributes";
  v5[0] = *MEMORY[0x1E4FB06F8];
  v0 = +[_MFValueTransformer valueTransformer];
  v6[0] = v0;
  v5[1] = *MEMORY[0x1E4FB0700];
  v6[1] = objc_opt_class();
  v5[2] = *MEMORY[0x1E4FB0758];
  v1 = +[_MFValueTransformer valueTransformer];
  v6[2] = v1;
  v5[3] = *MEMORY[0x1E4FB2F40];
  v6[3] = objc_opt_class();
  v5[4] = *MEMORY[0x1E4FB2F48];
  v6[4] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:5];
  v8[2] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];
  v4 = (void *)mf_keyPathsMapForUICustomization_keyPathsMap;
  mf_keyPathsMapForUICustomization_keyPathsMap = v3;
}

@end