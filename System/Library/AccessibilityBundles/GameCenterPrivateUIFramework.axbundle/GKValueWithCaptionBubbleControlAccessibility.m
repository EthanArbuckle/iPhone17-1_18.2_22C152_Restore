@interface GKValueWithCaptionBubbleControlAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityPath;
- (unint64_t)accessibilityTraits;
@end

@implementation GKValueWithCaptionBubbleControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"GKValueWithCaptionBubbleControl";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)MEMORY[0x270F9A6F8](MEMORY[0x263F8B098], a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GKValueWithCaptionBubbleControl", @"captionText", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GKValueWithCaptionBubbleControl", @"valueText", "@", 0);
}

- (id)accessibilityLabel
{
  id v3 = [(GKValueWithCaptionBubbleControlAccessibility *)self safeValueForKey:@"captionText"];
  v6 = [(GKValueWithCaptionBubbleControlAccessibility *)self safeValueForKey:@"valueText"];
  v4 = __UIAXStringForVariables();

  return v4;
}

- (id)accessibilityPath
{
  [(GKValueWithCaptionBubbleControlAccessibility *)self accessibilityFrame];
  CGFloat x = v13.origin.x;
  CGFloat y = v13.origin.y;
  CGFloat width = v13.size.width;
  CGFloat height = v13.size.height;
  double MidX = CGRectGetMidX(v13);
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v14);
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  double v8 = CGRectGetWidth(v15);
  v16.origin.CGFloat x = x;
  v16.origin.CGFloat y = y;
  v16.size.CGFloat width = width;
  v16.size.CGFloat height = height;
  double v9 = CGRectGetHeight(v16);
  if (v8 >= v9) {
    double v9 = v8;
  }
  v10 = (void *)MEMORY[0x263F1C478];

  return (id)objc_msgSend(v10, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, MidX, MidY, v9 * 0.5, 0.0, 6.28318531);
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (BOOL)isAccessibilityElement
{
  if (![(GKValueWithCaptionBubbleControlAccessibility *)self safeBoolForKey:@"_accessibilityViewIsVisible"])return 0; {
  id v3 = [(GKValueWithCaptionBubbleControlAccessibility *)self accessibilityLabel];
  }
  BOOL v4 = [v3 length] != 0;

  return v4;
}

@end