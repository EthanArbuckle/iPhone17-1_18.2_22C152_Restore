@interface BRCloudDocsHelperProvider
+ (BOOL)hasDaemonicParts;
+ (id)cloudDocsHelper;
@end

@implementation BRCloudDocsHelperProvider

+ (id)cloudDocsHelper
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__BRCloudDocsHelperProvider_cloudDocsHelper__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (cloudDocsHelper_once != -1) {
    dispatch_once(&cloudDocsHelper_once, block);
  }
  v2 = (void *)cloudDocsHelper_helper;

  return v2;
}

void __45__BRCloudDocsHelperProvider_hasDaemonicParts__block_invoke()
{
  id v1 = [MEMORY[0x1E4F28B50] mainBundle];
  v0 = [v1 bundleIdentifier];
  hasDaemonicParts_hasDaemonicParts = [v0 isEqualToString:@"com.apple.bird"];
}

uint64_t __44__BRCloudDocsHelperProvider_cloudDocsHelper__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) hasDaemonicParts]) {
    id v1 = NSClassFromString((NSString *)@"BRDaemonCloudDocsHelper");
  }
  else {
    id v1 = (objc_class *)objc_opt_class();
  }
  cloudDocsHelper_helper = (uint64_t)objc_alloc_init(v1);

  return MEMORY[0x1F41817F8]();
}

+ (BOOL)hasDaemonicParts
{
  if (hasDaemonicParts_once != -1) {
    dispatch_once(&hasDaemonicParts_once, &__block_literal_global_2);
  }
  return hasDaemonicParts_hasDaemonicParts;
}

@end