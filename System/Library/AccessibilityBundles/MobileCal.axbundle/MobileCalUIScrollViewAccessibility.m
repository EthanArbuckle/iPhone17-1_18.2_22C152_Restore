@interface MobileCalUIScrollViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityDrawsFocusRingWhenChildrenFocused;
- (BOOL)_accessibilityShouldIncludeArrowKeyCommandsForDirectionalFocusMovement;
- (UIEdgeInsets)_accessibilityVisibleContentInset;
- (id)_accessibilityFirstContainedElementForTechnology:(id)a3 honoringGroups:(BOOL)a4 shouldAlwaysScroll:(BOOL)a5;
@end

@implementation MobileCalUIScrollViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIScrollView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"InfiniteScrollViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"InfiniteScrollViewController", @"firstViewOnScreen", "@", 0);
}

- (UIEdgeInsets)_accessibilityVisibleContentInset
{
  v23.receiver = self;
  v23.super_class = (Class)MobileCalUIScrollViewAccessibility;
  [(MobileCalUIScrollViewAccessibility *)&v23 _accessibilityVisibleContentInset];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(MobileCalUIScrollViewAccessibility *)self accessibilityIdentifier];
  int v12 = [v11 isEqualToString:@"_AXWeekViewScrollViewIdentifier"];

  if (v12)
  {
    v13 = [(MobileCalUIScrollViewAccessibility *)self safeValueForKey:@"superview"];
    NSClassFromString(&cfstr_Weekview.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v22 = v13;
      _AXAssert();
    }
    v14 = objc_msgSend(v13, "safeValueForKey:", @"_allDayView", v22);
    v15 = [v14 safeValueForKey:@"frame"];
    [v15 CGRectValue];
    double MaxY = CGRectGetMaxY(v24);
    v17 = [(MobileCalUIScrollViewAccessibility *)self safeValueForKey:@"frame"];
    [v17 CGRectValue];
    double v4 = MaxY - CGRectGetMinY(v25);

    double v10 = 0.0;
    double v8 = 0.0;
    double v6 = 0.0;
  }
  double v18 = v4;
  double v19 = v6;
  double v20 = v8;
  double v21 = v10;
  result.right = v21;
  result.bottom = v20;
  result.left = v19;
  result.top = v18;
  return result;
}

- (BOOL)_accessibilityDrawsFocusRingWhenChildrenFocused
{
  int v3 = [(MobileCalUIScrollViewAccessibility *)self _accessibilityIsFKARunningForFocusItem];
  if (v3)
  {
    double v4 = [(MobileCalUIScrollViewAccessibility *)self accessibilityIdentification];
    char v5 = [v4 isEqualToString:@"_AXWeekScrollViewIdentifier"];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)_accessibilityShouldIncludeArrowKeyCommandsForDirectionalFocusMovement
{
  return 1;
}

- (id)_accessibilityFirstContainedElementForTechnology:(id)a3 honoringGroups:(BOOL)a4 shouldAlwaysScroll:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  double v9 = [(MobileCalUIScrollViewAccessibility *)self safeValueForKey:@"delegate"];
  NSClassFromString(&cfstr_Infinitescroll_0.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v11 = [(MobileCalUIScrollViewAccessibility *)self safeValueForKeyPath:@"delegate.firstViewOnScreen"];
    int v12 = [v11 _accessibilityFirstContainedElementForTechnology:v8 honoringGroups:v6 shouldAlwaysScroll:v5];
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)MobileCalUIScrollViewAccessibility;
    int v12 = [(MobileCalUIScrollViewAccessibility *)&v14 _accessibilityFirstContainedElementForTechnology:v8 honoringGroups:v6 shouldAlwaysScroll:v5];
  }

  return v12;
}

@end