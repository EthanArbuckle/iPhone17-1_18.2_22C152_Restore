@interface PKStrokeAccessibility
+ (BOOL)_isSerializableAccessibilityElement;
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrame;
- (id)accessibilityLabel;
- (void)dealloc;
@end

@implementation PKStrokeAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKStroke";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKStroke", @"ink", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKStroke", @"renderBounds", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
}

+ (BOOL)_isSerializableAccessibilityElement
{
  return 1;
}

- (void)dealloc
{
  if (objc_opt_respondsToSelector()) {
    [(PKStrokeAccessibility *)self _accessibilityUnregister];
  }
  v3.receiver = self;
  v3.super_class = (Class)PKStrokeAccessibility;
  [(PKStrokeAccessibility *)&v3 dealloc];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (CGRect)accessibilityFrame
{
  [(PKStrokeAccessibility *)self safeCGRectForKey:@"renderBounds"];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  v11 = [(PKStrokeAccessibility *)self _accessibilityAncestorIsKindOf:objc_opt_class()];
  v20.origin.CGFloat x = v4;
  v20.origin.CGFloat y = v6;
  v20.size.CGFloat width = v8;
  v20.size.CGFloat height = v10;
  CGRect v21 = UIAccessibilityConvertFrameToScreenCoordinates(v20, v11);
  CGFloat x = v21.origin.x;
  CGFloat y = v21.origin.y;
  CGFloat width = v21.size.width;
  CGFloat height = v21.size.height;

  double v16 = x;
  double v17 = y;
  double v18 = width;
  double v19 = height;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.CGFloat y = v17;
  result.origin.CGFloat x = v16;
  return result;
}

- (id)accessibilityLabel
{
  v2 = [(PKStrokeAccessibility *)self safeValueForKey:@"ink"];
  double v3 = __UIAccessibilitySafeClass();

  CGFloat v4 = [v3 inkType];
  double v5 = [v3 color];
  if ([v4 isEqualToString:*MEMORY[0x263F14CC0]])
  {
    CGFloat v6 = @"pen.tool";
LABEL_7:
    double v7 = accessibilityPencilKitLocalizedString(v6);
    goto LABEL_8;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F14CC8]])
  {
    CGFloat v6 = @"pencil.tool";
    goto LABEL_7;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F14CB8]])
  {
    CGFloat v6 = @"marker.tool";
    goto LABEL_7;
  }
  double v7 = 0;
LABEL_8:
  CGFloat v10 = [v5 accessibilityName];
  CGFloat v8 = __AXStringForVariables();

  return v8;
}

@end