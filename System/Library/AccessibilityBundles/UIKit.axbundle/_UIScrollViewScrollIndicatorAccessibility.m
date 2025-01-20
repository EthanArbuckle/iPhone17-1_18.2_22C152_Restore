@interface _UIScrollViewScrollIndicatorAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityCanAppearInContextMenuPreview;
- (BOOL)_accessibilityOverridesInvisibility;
- (BOOL)_accessibilityUseAccessibilityFrameForHittest;
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (CGRect)accessibilityFrame;
- (id)_axBasicDescription;
- (id)accessibilityLabel;
- (id)accessibilityScrollIndicatorDelegate;
- (id)accessibilityUserInputLabels;
- (id)accessibilityValue;
- (int64_t)_accessibilitySortPriority;
- (uint64_t)accessibilityScrollDirection;
- (uint64_t)accessibilityScrollIndicatorIsFocused;
- (uint64_t)setAccessibilityScrollDirection:(uint64_t)result;
- (uint64_t)setAccessibilityScrollIndicatorIsFocused:(uint64_t)result;
- (unint64_t)accessibilityTraits;
- (void)accessibilityDecrement;
- (void)accessibilityElementDidBecomeFocused;
- (void)accessibilityElementDidLoseFocus;
- (void)accessibilityIncrement;
- (void)setAccessibilityScrollIndicatorDelegate:(uint64_t)a1;
@end

@implementation _UIScrollViewScrollIndicatorAccessibility

- (void)setAccessibilityScrollIndicatorDelegate:(uint64_t)a1
{
  uint64_t v3 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v3) {
    __UIAccessibilitySetAssociatedNonRetainedObject();
  }
  objc_storeStrong(&location, 0);
}

- (uint64_t)setAccessibilityScrollDirection:(uint64_t)result
{
  if (result) {
    return __UIAccessibilitySetAssociatedLong();
  }
  return result;
}

+ (id)safeCategoryTargetClassName
{
  return @"_UIScrollViewScrollIndicator";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityScrollIndicatorDelegate
{
  if (a1) {
    id v2 = (id)__UIAccessibilityGetAssociatedNonRetainedObject();
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (uint64_t)accessibilityScrollDirection
{
  if (a1) {
    return __UIAccessibilityGetAssociatedLong();
  }
  else {
    return 0;
  }
}

- (uint64_t)accessibilityScrollIndicatorIsFocused
{
  if (a1) {
    char v2 = __UIAccessibilityGetAssociatedBool() & 1;
  }
  else {
    char v2 = 0;
  }
  return v2 & 1;
}

- (uint64_t)setAccessibilityScrollIndicatorIsFocused:(uint64_t)result
{
  if (result) {
    return __UIAccessibilitySetAssociatedBool();
  }
  return result;
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (BOOL)isAccessibilityElement
{
  id v3 = -[_UIScrollViewScrollIndicatorAccessibility accessibilityScrollIndicatorDelegate]((uint64_t)self);
  char v4 = [v3 accessibilityShouldEnableScrollIndicator:self];

  return v4 & 1;
}

- (BOOL)_accessibilityOverridesInvisibility
{
  return 1;
}

- (id)_axBasicDescription
{
  uint64_t v9 = a1;
  if (a1)
  {
    id v8 = 0;
    uint64_t v7 = -[_UIScrollViewScrollIndicatorAccessibility accessibilityScrollDirection](v9);
    if (v7 == 1)
    {
      id v1 = accessibilityLocalizedString(@"scroll.bar.vertical");
      id v2 = v8;
      id v8 = v1;
    }
    else if (v7 == 2)
    {
      id v3 = accessibilityLocalizedString(@"scroll.bar.horizontal");
      id v4 = v8;
      id v8 = v3;
    }
    id v10 = v8;
    objc_storeStrong(&v8, 0);
  }
  else
  {
    id v10 = 0;
  }
  v5 = v10;

  return v5;
}

- (id)accessibilityLabel
{
  v12 = self;
  v11[1] = (id)a2;
  v11[0] = -[_UIScrollViewScrollIndicatorAccessibility _axBasicDescription]((uint64_t)self);
  id v6 = -[_UIScrollViewScrollIndicatorAccessibility accessibilityScrollIndicatorDelegate]((uint64_t)v12);
  uint64_t v7 = [v6 accessibilityNumberOfPagesForScrollIndicator:v12];

  id v8 = NSString;
  id v9 = accessibilityLocalizedString(@"page.count");
  id v5 = (id)[v8 localizedStringWithFormat:v7];
  id v2 = (id)__UIAXStringForVariables();
  id v3 = v11[0];
  v11[0] = v2;

  id v10 = v11[0];
  objc_storeStrong(v11, 0);

  return v10;
}

- (id)accessibilityUserInputLabels
{
  id v3 = -[_UIScrollViewScrollIndicatorAccessibility _axBasicDescription]((uint64_t)self);
  id v4 = (id)MEMORY[0x2455E6530]();

  return v4;
}

- (id)accessibilityValue
{
  id v3 = -[_UIScrollViewScrollIndicatorAccessibility accessibilityScrollIndicatorDelegate]((uint64_t)self);
  [v3 accessibilityProgressForScrollIndicator:self];
  id v4 = (id)AXFormatFloatWithPercentage();

  return v4;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CED8];
}

- (CGRect)accessibilityFrame
{
  id v10 = -[_UIScrollViewScrollIndicatorAccessibility accessibilityScrollIndicatorDelegate]((uint64_t)self);
  [v10 accessibilityFrameForScrollIndicator:self];
  double v12 = v2;
  double v13 = v3;
  double v14 = v4;
  double v15 = v5;

  double v6 = v12;
  double v7 = v13;
  double v8 = v14;
  double v9 = v15;
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (BOOL)_accessibilityUseAccessibilityFrameForHittest
{
  return 1;
}

- (CGPoint)accessibilityActivationPoint
{
  v22 = self;
  SEL v21 = a2;
  char v14 = 0;
  objc_opt_class();
  id v13 = (id)__UIAccessibilityCastAsClass();
  id v12 = v13;
  objc_storeStrong(&v13, 0);
  [v12 bounds];
  uint64_t v15 = v2;
  uint64_t v16 = v3;
  uint64_t v17 = v4;
  uint64_t v18 = v5;
  AX_CGRectGetCenter();
  uint64_t v19 = v6;
  uint64_t v20 = v7;
  UIAccessibilityPointForPoint();
  double v23 = v8;
  double v24 = v9;

  double v10 = v23;
  double v11 = v24;
  result.y = v11;
  result.x = v10;
  return result;
}

- (void)accessibilityIncrement
{
  id v2 = -[_UIScrollViewScrollIndicatorAccessibility accessibilityScrollIndicatorDelegate]((uint64_t)self);
  [v2 accessibilityScrollIndicator:self addProgress:-0.1];
}

- (void)accessibilityDecrement
{
  id v2 = -[_UIScrollViewScrollIndicatorAccessibility accessibilityScrollIndicatorDelegate]((uint64_t)self);
  [v2 accessibilityScrollIndicator:self addProgress:0.1];
}

- (BOOL)accessibilityActivate
{
  return 1;
}

- (void)accessibilityElementDidBecomeFocused
{
  -[_UIScrollViewScrollIndicatorAccessibility setAccessibilityScrollIndicatorIsFocused:]((uint64_t)self);
  id v2 = -[_UIScrollViewScrollIndicatorAccessibility accessibilityScrollIndicatorDelegate]((uint64_t)self);
  [v2 accessibilityScrollIndicator:self didBecomeFocused:1];
}

- (void)accessibilityElementDidLoseFocus
{
  -[_UIScrollViewScrollIndicatorAccessibility setAccessibilityScrollIndicatorIsFocused:]((uint64_t)self);
  id v2 = -[_UIScrollViewScrollIndicatorAccessibility accessibilityScrollIndicatorDelegate]((uint64_t)self);
  [v2 accessibilityScrollIndicator:self didBecomeFocused:0];
}

- (int64_t)_accessibilitySortPriority
{
  return -100;
}

- (BOOL)_accessibilityCanAppearInContextMenuPreview
{
  return 0;
}

@end