@interface AssistantCell
+ (id)bundle;
+ (int64_t)cellStyle;
- (BOOL)canReload;
@end

@implementation AssistantCell

+ (int64_t)cellStyle
{
  return 0;
}

+ (id)bundle
{
  v2 = (void *)bundle_sAssistantBundle_1;
  if (!bundle_sAssistantBundle_1)
  {
    uint64_t v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v4 = (void *)bundle_sAssistantBundle_1;
    bundle_sAssistantBundle_1 = v3;

    v2 = (void *)bundle_sAssistantBundle_1;
  }

  return v2;
}

- (BOOL)canReload
{
  return 1;
}

@end