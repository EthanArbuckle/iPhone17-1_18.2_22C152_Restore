@interface CNUIApplicationLaunchOptions
+ (id)defaultOptions;
@end

@implementation CNUIApplicationLaunchOptions

+ (id)defaultOptions
{
  if (defaultOptions_cn_once_token_2 != -1) {
    dispatch_once(&defaultOptions_cn_once_token_2, &__block_literal_global_66);
  }
  v2 = (void *)defaultOptions_cn_once_object_2;
  return v2;
}

void __46__CNUIApplicationLaunchOptions_defaultOptions__block_invoke()
{
  v7[2] = *MEMORY[0x263EF8340];
  v0 = getFBSOpenApplicationOptionKeyUnlockDevice();
  v6[0] = v0;
  uint64_t v1 = MEMORY[0x263EFFA88];
  v7[0] = MEMORY[0x263EFFA88];
  v2 = getFBSOpenApplicationOptionKeyPromptUnlockDevice();
  v6[1] = v2;
  v7[1] = v1;
  v3 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];
  uint64_t v4 = [v3 copy];
  v5 = (void *)defaultOptions_cn_once_object_2;
  defaultOptions_cn_once_object_2 = v4;
}

@end