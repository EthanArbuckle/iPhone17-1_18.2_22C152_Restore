@interface EKTextViewWithLabelTextMetricsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityIsLocationLink;
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrame;
- (id)_axLocationItem;
- (id)_axURLCell;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation EKTextViewWithLabelTextMetricsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"EKTextViewWithLabelTextMetrics";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"EKEventDetailLocationItem"];
  [v3 validateClass:@"EKEventDetailURLCell"];
  [v3 validateClass:@"EKEventDetailTitleCell" hasInstanceVariable:@"_locationItems" withType:"NSMutableArray"];
  [v3 validateClass:@"EKEventDetailLocationItem" hasInstanceVariable:@"_locationTapRecognizer" withType:"UITapGestureRecognizer"];
  [v3 validateClass:@"EKEventDetailURLCell" hasInstanceVariable:@"_URLTitleView" withType:"UILabel"];
}

- (id)_axLocationItem
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  id v3 = [v2 delegate];

  NSClassFromString(&cfstr_Ekeventdetaill.isa);
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (BOOL)accessibilityIsLocationLink
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = [(EKTextViewWithLabelTextMetricsAccessibility *)self _axLocationItem];
  id v3 = v2;
  if (v2)
  {
    id v4 = [v2 safeValueForKey:@"_locationTapRecognizer"];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    objc_opt_class();
    v5 = __UIAccessibilityCastAsClass();
    v6 = [v5 gestureRecognizers];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v6);
          }
          if (v4 == *(void **)(*((void *)&v11 + 1) + 8 * i))
          {
            LOBYTE(v7) = 1;
            goto LABEL_12;
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)EKTextViewWithLabelTextMetricsAccessibility;
  unint64_t v3 = [(EKTextViewWithLabelTextMetricsAccessibility *)&v7 accessibilityTraits];
  BOOL v4 = [(EKTextViewWithLabelTextMetricsAccessibility *)self accessibilityIsLocationLink];
  uint64_t v5 = *MEMORY[0x263F1CF10];
  if (!v4) {
    uint64_t v5 = 0;
  }
  return v5 | v3;
}

- (BOOL)isAccessibilityElement
{
  unint64_t v3 = [(EKTextViewWithLabelTextMetricsAccessibility *)self _axURLCell];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)EKTextViewWithLabelTextMetricsAccessibility;
    BOOL v4 = [(EKTextViewWithLabelTextMetricsAccessibility *)&v6 isAccessibilityElement];
  }

  return v4;
}

- (CGRect)accessibilityFrame
{
  unint64_t v3 = [(EKTextViewWithLabelTextMetricsAccessibility *)self _axURLCell];
  BOOL v4 = v3;
  if (v3)
  {
    [v3 accessibilityFrame];
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)EKTextViewWithLabelTextMetricsAccessibility;
    [(EKTextViewWithLabelTextMetricsAccessibility *)&v17 accessibilityFrame];
  }
  double v9 = v5;
  double v10 = v6;
  double v11 = v7;
  double v12 = v8;

  double v13 = v9;
  double v14 = v10;
  double v15 = v11;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (id)accessibilityLabel
{
  unint64_t v3 = [(EKTextViewWithLabelTextMetricsAccessibility *)self _axURLCell];
  BOOL v4 = v3;
  if (v3)
  {
    double v5 = [v3 safeValueForKey:@"_URLTitleView"];
    double v6 = [v5 accessibilityLabel];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)EKTextViewWithLabelTextMetricsAccessibility;
    double v6 = [(EKTextViewWithLabelTextMetricsAccessibility *)&v8 accessibilityLabel];
  }

  return v6;
}

- (id)_axURLCell
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  unint64_t v3 = [v2 delegate];

  NSClassFromString(&cfstr_Ekeventdetailu_0.isa);
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

@end