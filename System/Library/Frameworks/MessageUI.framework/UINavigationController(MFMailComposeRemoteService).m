@interface UINavigationController(MFMailComposeRemoteService)
- (id)mf_keyPathsMapForUICustomization;
- (uint64_t)mf_classesForUICustomization;
@end

@implementation UINavigationController(MFMailComposeRemoteService)

- (uint64_t)mf_classesForUICustomization
{
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  return objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, v7, objc_opt_class(), 0);
}

- (id)mf_keyPathsMapForUICustomization
{
  if (mf_keyPathsMapForUICustomization_onceToken != -1) {
    dispatch_once(&mf_keyPathsMapForUICustomization_onceToken, &__block_literal_global_24);
  }
  v0 = (void *)mf_keyPathsMapForUICustomization_keyPathsMap;

  return v0;
}

@end