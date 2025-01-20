@interface UIKBHandwritingStrokeViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (CGRect)accessibilityFrame;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation UIKBHandwritingStrokeViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIKBHandwritingStrokeView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [location[0] validateClass:@"UIHandwritingAssistantView"];
  [location[0] validateClass:@"UIKBKeyplaneView"];
  objc_storeStrong(location, 0);
}

- (CGPoint)accessibilityActivationPoint
{
  double v3 = *(double *)(MEMORY[0x263F00148] + 8);
  double v2 = *MEMORY[0x263F00148];
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGRect)accessibilityFrame
{
  v16 = (UIView *)self;
  SEL v15 = a2;
  [(UIKBHandwritingStrokeViewAccessibility *)self bounds];
  v14.origin.double x = v2;
  v14.origin.double y = v3;
  v14.size.double width = v4;
  v14.size.double height = v5;
  id v13 = (id)[(UIView *)v16 _accessibilityFindAncestor:&__block_literal_global_21 startWithSelf:0];
  if (AXDeviceIsPhoneIdiom())
  {
    id v12 = (id)[v13 _accessibilityFindSubviewDescendant:&__block_literal_global_303];
    [v12 frame];
    v14.origin.double y = v14.origin.y + v6;
    [v12 frame];
    v14.size.double height = v14.size.height - v7;
    objc_storeStrong(&v12, 0);
  }
  CGRect v17 = UIAccessibilityConvertFrameToScreenCoordinates(v14, v16);
  objc_storeStrong(&v13, 0);
  double y = v17.origin.y;
  double x = v17.origin.x;
  double height = v17.size.height;
  double width = v17.size.width;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

uint64_t __60__UIKBHandwritingStrokeViewAccessibility_accessibilityFrame__block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  NSClassFromString(&cfstr_Uikbkeyplanevi.isa);
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_storeStrong(location, 0);
  return isKindOfClass & 1;
}

uint64_t __60__UIKBHandwritingStrokeViewAccessibility_accessibilityFrame__block_invoke_2(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  NSClassFromString(&cfstr_Uihandwritinga.isa);
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_storeStrong(location, 0);
  return isKindOfClass & 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"handwriting.input.area");
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(@"handwriting.input.hint");
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE0];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end