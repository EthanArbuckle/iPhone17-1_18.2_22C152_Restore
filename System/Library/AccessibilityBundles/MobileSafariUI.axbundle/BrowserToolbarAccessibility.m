@interface BrowserToolbarAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityElementsHidden;
- (BrowserToolbarAccessibility)initWithPlacement:(int64_t)a3 hideBackground:(BOOL)a4;
- (int64_t)accessibilityContainerType;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)setItems:(id)a3 animated:(BOOL)a4;
@end

@implementation BrowserToolbarAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BrowserToolbar";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"BrowserToolbar" hasInstanceVariable:@"_barRegistration" withType:"<_SFBarRegistrationToken>"];
  [v3 validateClass:@"SFBarRegistration" hasInstanceVariable:@"_shareItem" withType:"UIBarButtonItem"];
  [v3 validateClass:@"SFBarRegistration" hasInstanceVariable:@"_tabExposeItem" withType:"UIBarButtonItem"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BrowserToolbar", @"initWithPlacement:hideBackground:", "@", "q", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BrowserToolbar", @"setItems:animated:", "v", "@", "B", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v15.receiver = self;
  v15.super_class = (Class)BrowserToolbarAccessibility;
  [(BrowserToolbarAccessibility *)&v15 _accessibilityLoadAccessibilityInformation];
  id v3 = [(BrowserToolbarAccessibility *)self safeValueForKey:@"_barRegistration"];
  v4 = [v3 safeValueForKey:@"_shareItem"];
  v5 = accessibilityLocalizedString(@"actions.button");
  [v4 setAccessibilityLabel:v5];

  v6 = [(BrowserToolbarAccessibility *)self safeValueForKey:@"_barRegistration"];
  v7 = [v6 safeValueForKey:@"_tabExposeItem"];
  v8 = accessibilityLocalizedString(@"buttonbar.tabs.text");
  [v7 setAccessibilityLabel:v8];

  v9 = [(BrowserToolbarAccessibility *)self safeValueForKey:@"_barRegistration"];
  v10 = [v9 safeValueForKey:@"_tabExposeItem"];
  v11 = accessibilityLocalizedString(@"buttonbar.tabs.hint");
  [v10 setAccessibilityHint:v11];

  v12 = [(BrowserToolbarAccessibility *)self safeValueForKey:@"_barRegistration"];
  v13 = [v12 safeValueForKey:@"_newTabItem"];
  v14 = accessibilityLocalizedString(@"new.tab.button");
  [v13 setAccessibilityLabel:v14];
}

- (BrowserToolbarAccessibility)initWithPlacement:(int64_t)a3 hideBackground:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)BrowserToolbarAccessibility;
  v4 = [(BrowserToolbarAccessibility *)&v6 initWithPlacement:a3 hideBackground:a4];
  [(BrowserToolbarAccessibility *)v4 _accessibilityLoadAccessibilityInformation];
  return v4;
}

- (BOOL)accessibilityElementsHidden
{
  [(BrowserToolbarAccessibility *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(BrowserToolbarAccessibility *)self window];
  -[BrowserToolbarAccessibility convertRect:toView:](self, "convertRect:toView:", v11, v4, v6, v8, v10);
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  v20 = [(BrowserToolbarAccessibility *)self window];
  [v20 bounds];
  v29.origin.x = v21;
  v29.origin.y = v22;
  v29.size.width = v23;
  v29.size.height = v24;
  v27.origin.x = v13;
  v27.origin.y = v15;
  v27.size.width = v17;
  v27.size.height = v19;
  CGRect v28 = CGRectIntersection(v27, v29);
  BOOL v25 = v28.size.height <= 0.0 || v28.size.width <= 0.0;

  return v25;
}

- (void)setItems:(id)a3 animated:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)BrowserToolbarAccessibility;
  [(BrowserToolbarAccessibility *)&v5 setItems:a3 animated:a4];
  [(BrowserToolbarAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

@end