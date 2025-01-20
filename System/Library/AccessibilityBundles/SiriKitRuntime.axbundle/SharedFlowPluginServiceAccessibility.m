@interface SharedFlowPluginServiceAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)loadFlowPluginWithBundleId:(id)a3 bundlePath:(id)a4 rcId:(id)a5 hypothesisId:(id)a6 reply:(id)a7;
@end

@implementation SharedFlowPluginServiceAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SiriKitRuntime.SharedFlowPluginService";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)loadFlowPluginWithBundleId:(id)a3 bundlePath:(id)a4 rcId:(id)a5 hypothesisId:(id)a6 reply:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = (void (**)(id, void))a7;
  v17 = objc_opt_new();
  int v18 = [v17 isClarityBoardEnabled];

  if (v18)
  {
    v19 = [MEMORY[0x263F32040] sharedInstance];
    v20 = [v19 applicationBundleIdentifiers];

    if (!AXIsPluginAllowedInClarity())
    {
      v16[2](v16, 0);

      goto LABEL_6;
    }
  }
  v21.receiver = self;
  v21.super_class = (Class)SharedFlowPluginServiceAccessibility;
  [(SharedFlowPluginServiceAccessibility *)&v21 loadFlowPluginWithBundleId:v12 bundlePath:v13 rcId:v14 hypothesisId:v15 reply:v16];
LABEL_6:
}

@end