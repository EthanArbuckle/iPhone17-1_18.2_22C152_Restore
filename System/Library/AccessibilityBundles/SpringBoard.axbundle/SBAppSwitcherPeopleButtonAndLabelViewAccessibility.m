@interface SBAppSwitcherPeopleButtonAndLabelViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsFirstElementForFocus;
- (BOOL)_accessibilityIsNotFirstElement;
- (BOOL)accessibilityScrollToVisible;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation SBAppSwitcherPeopleButtonAndLabelViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBAppSwitcherPeopleButtonAndLabelView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)_accessibilityIsNotFirstElement
{
  return 1;
}

- (BOOL)_accessibilityIsFirstElementForFocus
{
  return 0;
}

- (BOOL)accessibilityScrollToVisible
{
  v3 = [(SBAppSwitcherPeopleButtonAndLabelViewAccessibility *)self _accessibilityAncestorIsKindOf:objc_opt_class()];
  [(SBAppSwitcherPeopleButtonAndLabelViewAccessibility *)self bounds];
  objc_msgSend(v3, "convertRect:fromView:", self);
  double x = v11.origin.x;
  double y = v11.origin.y;
  double width = v11.size.width;
  double height = v11.size.height;
  CGFloat v8 = CGRectGetMaxX(v11) + v11.size.width;
  [v3 visibleBounds];
  if (v8 <= CGRectGetMaxX(v12))
  {
    v13.origin.double x = x;
    v13.origin.double y = y;
    v13.size.double width = width;
    v13.size.double height = height;
    CGFloat v9 = CGRectGetMinX(v13) - width;
    [v3 visibleBounds];
    if (v9 < CGRectGetMinX(v14)) {
      double x = x - width;
    }
  }
  else
  {
    double x = x + width;
  }
  objc_msgSend(v3, "scrollRectToVisible:animated:", 1, x, y, width, height);

  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(SBAppSwitcherPeopleButtonAndLabelViewAccessibility *)self safeValueForKey:@"title"];
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

@end