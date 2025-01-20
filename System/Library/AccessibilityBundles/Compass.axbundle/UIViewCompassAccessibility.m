@interface UIViewCompassAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityScroll:(int64_t)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)_accessibilityScrollStatus;
- (id)_accessibilitySupplementaryFooterViews;
- (id)accessibilityHint;
- (id)accessibilityLabel;
@end

@implementation UIViewCompassAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CompassPageViewController" hasInstanceVariable:@"_altitudeLabel" withType:"UILabel"];
  [v3 validateClass:@"CompassPageViewController" hasInstanceVariable:@"_placeLabel" withType:"UILabel"];
  [v3 validateClass:@"CompassPageViewController" hasInstanceVariable:@"_degreesSymbolLabel" withType:"UILabel"];
}

- (BOOL)isAccessibilityElement
{
  id v3 = [(UIViewCompassAccessibility *)self accessibilityIdentifier];
  if ([v3 isEqualToString:@"compassPageView"])
  {

    return 1;
  }
  v4 = [(UIViewCompassAccessibility *)self accessibilityIdentifier];
  char v5 = [v4 isEqualToString:@"levelPageView"];

  if (v5) {
    return 1;
  }
  v7.receiver = self;
  v7.super_class = (Class)UIViewCompassAccessibility;
  return [(UIViewCompassAccessibility *)&v7 isAccessibilityElement];
}

- (id)_accessibilitySupplementaryFooterViews
{
  id v3 = [(UIViewCompassAccessibility *)self accessibilityIdentifier];
  int v4 = [v3 isEqualToString:@"compassPageView"];

  if (v4)
  {
    char v5 = axCompassPageViewController();
    v6 = [v5 safeValueForKey:@"_coordinatesLabel"];
    objc_super v7 = accessibilityLocalizedString(@"coordinates.hint");
    [v6 setAccessibilityHint:v7];

    v8 = [v5 safeValueForKey:@"_altitudeLabel"];
    v9 = v8;
    if (v8 && [v8 _accessibilityViewIsVisible]) {
      [v9 setIsAccessibilityElement:1];
    }
    v10 = [v5 safeValueForKey:@"_placeLabel"];
    v11 = v10;
    if (v10 && [v10 _accessibilityViewIsVisible]) {
      [v11 setIsAccessibilityElement:1];
    }
    v12 = objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 3, v6, v11, v9);
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)UIViewCompassAccessibility;
    v12 = [(UIViewCompassAccessibility *)&v14 _accessibilitySupplementaryFooterViews];
  }

  return v12;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v8 = [(UIViewCompassAccessibility *)self _accessibilitySupplementaryFooterViews];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        -[UIViewCompassAccessibility convertPoint:toView:](self, "convertPoint:toView:", v13, x, y);
        if (objc_msgSend(v13, "pointInside:withEvent:", v7))
        {
          id v14 = v13;

          goto LABEL_11;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  v16.receiver = self;
  v16.super_class = (Class)UIViewCompassAccessibility;
  -[UIViewCompassAccessibility _accessibilityHitTest:withEvent:](&v16, sel__accessibilityHitTest_withEvent_, v7, x, y);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v14;
}

- (id)accessibilityLabel
{
  id v3 = [(UIViewCompassAccessibility *)self accessibilityIdentifier];
  int v4 = [v3 isEqualToString:@"compassPageView"];

  if (v4)
  {
    char v5 = axCompassPageViewController();
    v6 = [v5 safeValueForKey:@"_degreesLabel"];
    id v7 = [v6 accessibilityLabel];

    v8 = [v5 safeValueForKey:@"_degreesSymbolLabel"];
    uint64_t v9 = [v8 accessibilityLabel];

    uint64_t v10 = [v5 safeValueForKey:@"_directionLabel"];
    uint64_t v11 = [v10 accessibilityLabel];

    v12 = [v7 stringByAppendingString:v9];
    v13 = __UIAXStringForVariables();

LABEL_5:
    goto LABEL_7;
  }
  id v14 = [(UIViewCompassAccessibility *)self accessibilityIdentifier];
  int v15 = [v14 isEqualToString:@"levelPageView"];

  if (v15)
  {
    char v5 = axLevelPageViewController();
    id v7 = [v5 safeValueForKey:@"_degreesLabel"];
    v13 = [v7 accessibilityLabel];
    goto LABEL_5;
  }
  v17.receiver = self;
  v17.super_class = (Class)UIViewCompassAccessibility;
  v13 = [(UIViewCompassAccessibility *)&v17 accessibilityLabel];
LABEL_7:

  return v13;
}

- (id)_accessibilityScrollStatus
{
  id v3 = [(UIViewCompassAccessibility *)self accessibilityIdentifier];
  int v4 = [v3 isEqualToString:@"compassPageView"];

  if (v4)
  {
    char v5 = axCompassPageViewController();
    v6 = [v5 safeValueForKey:@"_coordinatesLabel"];
    id v7 = [v6 accessibilityLabel];

    v8 = [(UIViewCompassAccessibility *)self accessibilityLabel];
    uint64_t v9 = __UIAXStringForVariables();
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)UIViewCompassAccessibility;
    uint64_t v9 = [(UIViewCompassAccessibility *)&v11 _accessibilityScrollStatus];
  }

  return v9;
}

- (id)accessibilityHint
{
  id v3 = [(UIViewCompassAccessibility *)self accessibilityIdentifier];
  int v4 = [v3 isEqualToString:@"compassPageView"];

  if (v4)
  {
    char v5 = accessibilityLocalizedString(@"compass.usage.hint");
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIViewCompassAccessibility;
    char v5 = [(UIViewCompassAccessibility *)&v7 accessibilityHint];
  }

  return v5;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 1)
  {
    v9.receiver = self;
    v9.super_class = (Class)UIViewCompassAccessibility;
    return [(UIViewCompassAccessibility *)&v9 accessibilityScroll:a3];
  }
  else
  {
    int v4 = axCompassController();
    char v5 = [v4 safeValueForKey:@"_pageControl"];

    if (a3 == 1)
    {
      [v5 accessibilityDecrement];
    }
    else if (a3 == 2)
    {
      [v5 accessibilityIncrement];
    }
    UIAccessibilityNotifications v7 = *MEMORY[0x263F1CDC8];
    v8 = [v5 accessibilityValue];
    UIAccessibilityPostNotification(v7, v8);

    return 1;
  }
}

@end