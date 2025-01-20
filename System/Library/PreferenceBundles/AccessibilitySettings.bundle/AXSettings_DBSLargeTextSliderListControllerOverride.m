@interface AXSettings_DBSLargeTextSliderListControllerOverride
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)loadView;
- (void)viewDidLayoutSubviews;
@end

@implementation AXSettings_DBSLargeTextSliderListControllerOverride

+ (id)safeCategoryTargetClassName
{
  return @"DBSLargeTextSliderListController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"DBSLargeTextSliderListController" isKindOfClass:@"PSListController"];
  [v3 validateClass:@"PSListController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIViewController", @"viewDidLayoutSubviews", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIViewController", @"loadView", "v", 0);
}

- (void)loadView
{
  v6.receiver = self;
  v6.super_class = (Class)AXSettings_DBSLargeTextSliderListControllerOverride;
  [(AXSettings_DBSLargeTextSliderListControllerOverride *)&v6 loadView];
  if (AXProcessIsSetup())
  {
    objc_opt_class();
    v2 = __UIAccessibilityCastAsClass();
    id v3 = sharedBFFStyle();
    v4 = [v3 backgroundColor];
    v5 = [v2 table];
    [v5 setBackgroundColor:v4];
  }
}

- (void)viewDidLayoutSubviews
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_0, log, OS_LOG_TYPE_FAULT, "Unexpectedly installed safe category for AXLargeTextController outside of Setup", v1, 2u);
}

@end