@interface NC_PLPlatterHeaderContentViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityTitleLabel;
- (id)_axAggregateTitleDateElement;
- (id)accessibilityElements;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axSetAggregateTitleDateElement:(id)a3;
- (void)_configureUtilityButton;
- (void)setDate:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation NC_PLPlatterHeaderContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PLPlatterHeaderContentView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axAggregateTitleDateElement
{
}

- (void)_axSetAggregateTitleDateElement:(id)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PLPlatterHeaderContentView" hasInstanceVariable:@"_dateLabel" withType:"UILabel<BSUIDateLabel>"];
  [v3 validateClass:@"PLPlatterHeaderContentView" hasInstanceVariable:@"_iconButtons" withType:"NSArray"];
  [v3 validateClass:@"PLPlatterHeaderContentView" hasInstanceVariable:@"_utilityButton" withType:"UIButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PLPlatterHeaderContentView", @"_titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PLPlatterHeaderContentView", @"setDate:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PLPlatterHeaderContentView", @"setTitle:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PLPlatterHeaderContentView", @"_configureUtilityButton", "v", 0);
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)_accessibilityTitleLabel
{
  v2 = [(NC_PLPlatterHeaderContentViewAccessibility *)self safeValueForKey:@"_titleLabel"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)accessibilityElements
{
  id v3 = [(NC_PLPlatterHeaderContentViewAccessibility *)self _axAggregateTitleDateElement];

  if (!v3)
  {
    v4 = [AXAggregateHeaderView alloc];
    v5 = [(NC_PLPlatterHeaderContentViewAccessibility *)self safeValueForKey:@"_iconButtons"];
    v6 = [(NC_PLPlatterHeaderContentViewAccessibility *)self safeValueForKey:@"_dateLabel"];
    v7 = [(NC_PLPlatterHeaderContentViewAccessibility *)self safeValueForKey:@"_titleLabel"];
    v8 = [(AXAggregateHeaderView *)v4 initWithAccessibilityContainer:self iconButtons:v5 dateLabel:v6 titleLabel:v7];

    [(NC_PLPlatterHeaderContentViewAccessibility *)self _axSetAggregateTitleDateElement:v8];
  }
  v9 = [(NC_PLPlatterHeaderContentViewAccessibility *)self safeValueForKey:@"_utilityButton"];
  v10 = __UIAccessibilitySafeClass();

  if (![v10 _accessibilityViewIsVisible]
    || ([v10 allTargets],
        v11 = objc_claimAutoreleasedReturnValue(),
        uint64_t v12 = [v11 count],
        v11,
        !v12))
  {

    v10 = 0;
  }
  v13 = (void *)MEMORY[0x263EFF8C0];
  v14 = [(NC_PLPlatterHeaderContentViewAccessibility *)self _axAggregateTitleDateElement];
  v15 = objc_msgSend(v13, "axArrayByIgnoringNilElementsWithCount:", 2, v14, v10);

  return v15;
}

- (void)_configureUtilityButton
{
  v3.receiver = self;
  v3.super_class = (Class)NC_PLPlatterHeaderContentViewAccessibility;
  [(NC_PLPlatterHeaderContentViewAccessibility *)&v3 _configureUtilityButton];
  [(NC_PLPlatterHeaderContentViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v8.receiver = self;
  v8.super_class = (Class)NC_PLPlatterHeaderContentViewAccessibility;
  [(NC_PLPlatterHeaderContentViewAccessibility *)&v8 _accessibilityLoadAccessibilityInformation];
  LOBYTE(location) = 0;
  objc_super v3 = [(NC_PLPlatterHeaderContentViewAccessibility *)self safeValueForKey:@"_utilityButton"];
  v4 = __UIAccessibilitySafeClass();

  objc_initWeak(&location, v4);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __88__NC_PLPlatterHeaderContentViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v5[3] = &unk_265143C68;
  objc_copyWeak(&v6, &location);
  [v4 _setAccessibilityLabelBlock:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)setDate:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NC_PLPlatterHeaderContentViewAccessibility;
  [(NC_PLPlatterHeaderContentViewAccessibility *)&v4 setDate:a3];
  [(NC_PLPlatterHeaderContentViewAccessibility *)self _axSetAggregateTitleDateElement:0];
}

- (void)setTitle:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NC_PLPlatterHeaderContentViewAccessibility;
  [(NC_PLPlatterHeaderContentViewAccessibility *)&v4 setTitle:a3];
  [(NC_PLPlatterHeaderContentViewAccessibility *)self _axSetAggregateTitleDateElement:0];
}

@end