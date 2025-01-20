@interface YearViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityScrollStatusForScrollView:(id)a3;
- (id)scrollView;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axAnnotateView;
- (void)showDate:(id)a3 animated:(BOOL)a4 completionBlock:(id)a5;
- (void)viewDidLoad;
@end

@implementation YearViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"YearViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"EKUIYearMonthView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"YearViewController", @"bestDateForNewEvent", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"InfiniteScrollViewController", @"showDate: animated: completionBlock:", "v", "@", "B", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"InfiniteScrollViewController", @"scrollView", "@", 0);
  [v3 validateClass:@"YearViewController" isKindOfClass:@"InfiniteScrollViewController"];
  [v3 validateClass:@"YearViewController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"YearViewController" isKindOfClass:@"InfiniteScrollViewController"];
  [v3 validateClass:@"EKUIYearMonthView" hasInstanceVariable:@"_todayIndex" withType:"q"];
}

- (void)_axAnnotateView
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  id v3 = [v2 view];
  [v3 accessibilitySetIdentification:@"_AXYearViewIdentifier"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)YearViewControllerAccessibility;
  [(YearViewControllerAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(YearViewControllerAccessibility *)self _axAnnotateView];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)YearViewControllerAccessibility;
  [(YearViewControllerAccessibility *)&v3 viewDidLoad];
  [(YearViewControllerAccessibility *)self _axAnnotateView];
}

- (id)accessibilityScrollStatusForScrollView:(id)a3
{
  objc_super v3 = [(YearViewControllerAccessibility *)self safeValueForKey:@"bestDateForNewEvent"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v5 = [v3 date];
  v6 = (void *)v5;
  if (isKindOfClass)
  {
    v7 = MEMORY[0x245654960](v5);
  }
  else
  {
    _AXAssert();
    v7 = 0;
  }

  return v7;
}

- (void)showDate:(id)a3 animated:(BOOL)a4 completionBlock:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __69__YearViewControllerAccessibility_showDate_animated_completionBlock___block_invoke;
  v13[3] = &unk_265131EB8;
  v13[4] = self;
  id v14 = v8;
  id v9 = v8;
  id v10 = a3;
  v11 = (void *)MEMORY[0x245654CF0](v13);
  v12.receiver = self;
  v12.super_class = (Class)YearViewControllerAccessibility;
  [(YearViewControllerAccessibility *)&v12 showDate:v10 animated:v5 completionBlock:v11];
}

void __69__YearViewControllerAccessibility_showDate_animated_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  if ([*(id *)(a1 + 32) _accessibilityBoolValueForKey:@"_AXShouldFocusOnTodayStorageKey"])
  {
    objc_super v3 = [*(id *)(a1 + 32) safeValueForKey:@"view"];
    id argument = [v3 _accessibilityFindSubviewDescendant:&__block_literal_global_7];

    UIAccessibilityPostNotification(*MEMORY[0x263F812F8], argument);
  }
}

BOOL __69__YearViewControllerAccessibility_showDate_animated_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Ekuiyearmonthv.isa);
  if (objc_opt_isKindOfClass())
  {
    objc_super v3 = [v2 safeValueForKey:@"_todayIndex"];
    BOOL v4 = [v3 integerValue] != -1;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (id)scrollView
{
  v5.receiver = self;
  v5.super_class = (Class)YearViewControllerAccessibility;
  id v2 = [(YearViewControllerAccessibility *)&v5 scrollView];
  [v2 setAccessibilityContainerType:4];
  objc_super v3 = accessibilityLocalizedString(@"years.container");
  [v2 setAccessibilityLabel:v3];

  return v2;
}

@end