@interface AXVisualAlertBundleLoader
+ (void)initialize;
@end

@implementation AXVisualAlertBundleLoader

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v3 = (id)objc_opt_new();
    v2 = +[AXVisualAlertManager sharedVisualAlertManager];
    [v2 startForAlertTypes:63 cameraTorchManager:v3];
  }
}

@end