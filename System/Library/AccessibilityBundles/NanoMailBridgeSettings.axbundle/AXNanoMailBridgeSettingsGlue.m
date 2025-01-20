@interface AXNanoMailBridgeSettingsGlue
+ (id)accessibilityBundles;
+ (void)accessibilityInitializeBundle;
@end

@implementation AXNanoMailBridgeSettingsGlue

+ (id)accessibilityBundles
{
  return 0;
}

+ (void)accessibilityInitializeBundle
{
  if (qword_8128 != -1) {
    dispatch_once(&qword_8128, &stru_4088);
  }
}

@end