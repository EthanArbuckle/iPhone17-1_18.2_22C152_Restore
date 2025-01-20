@interface WGWidgetHostingViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_requestInsertionOfRemoteViewAfterViewWillAppearForSequence:(id)a3 completionHandler:(id)a4;
@end

@implementation WGWidgetHostingViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"WGWidgetHostingViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WGWidgetHostingViewController", @"_requestInsertionOfRemoteViewAfterViewWillAppearForSequence:completionHandler:", "v", "@", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WGWidgetLifeCycleSequence", @"currentState", "q", 0);
}

- (void)_requestInsertionOfRemoteViewAfterViewWillAppearForSequence:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __124__WGWidgetHostingViewControllerAccessibility__requestInsertionOfRemoteViewAfterViewWillAppearForSequence_completionHandler___block_invoke;
  v11[3] = &unk_2651691E0;
  id v12 = v6;
  id v7 = v6;
  id v8 = a3;
  v9 = (void *)MEMORY[0x24566AF50](v11);
  v10.receiver = self;
  v10.super_class = (Class)WGWidgetHostingViewControllerAccessibility;
  [(WGWidgetHostingViewControllerAccessibility *)&v10 _requestInsertionOfRemoteViewAfterViewWillAppearForSequence:v8 completionHandler:v9];
}

void __124__WGWidgetHostingViewControllerAccessibility__requestInsertionOfRemoteViewAfterViewWillAppearForSequence_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v5);
  }
  if ([v5 safeIntegerForKey:@"currentState"] == 4) {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  }
}

@end