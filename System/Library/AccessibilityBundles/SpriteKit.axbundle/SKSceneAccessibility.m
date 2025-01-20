@interface SKSceneAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (CGRect)accessibilityFrame;
- (id)accessibilityContainer;
- (void)didChangeSize:(CGSize)a3;
- (void)didMoveToView:(id)a3;
- (void)willMoveFromView:(id)a3;
@end

@implementation SKSceneAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SKScene";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKScene", @"view", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKScene", @"didMoveToView:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKScene", @"didChangeSize:", "v", "{CGSize=dd}", 0);
}

- (CGRect)accessibilityFrame
{
  v29.receiver = self;
  v29.super_class = (Class)SKSceneAccessibility;
  [(SKSceneAccessibility *)&v29 accessibilityFrame];
  CGFloat x = v30.origin.x;
  CGFloat y = v30.origin.y;
  CGFloat width = v30.size.width;
  CGFloat height = v30.size.height;
  if (CGRectIsEmpty(v30))
  {
    objc_opt_class();
    v6 = __UIAccessibilityCastAsClass();
    v7 = [v6 view];
    [v6 frame];
    double v9 = v8;
    double v11 = v10;
    [v6 anchorPoint];
    double v13 = v12 * v9;
    double v15 = v14 * v11;
    double v16 = 0.0 - v12 * v9;
    double v17 = 0.0 - v14 * v11;
    double v18 = v9 - v13;
    double v19 = v11 - v15;
    objc_msgSend(v6, "convertPointToView:", v16, v17);
    double v21 = v20;
    double v23 = v22;
    objc_msgSend(v6, "convertPointToView:", v18, v19);
    v31.size.CGFloat width = vabdd_f64(v24, v21);
    v31.size.CGFloat height = vabdd_f64(v23, v31.origin.y);
    v31.origin.CGFloat x = v21;
    CGRect v32 = UIAccessibilityConvertFrameToScreenCoordinates(v31, v7);
    CGFloat x = v32.origin.x;
    CGFloat y = v32.origin.y;
    CGFloat width = v32.size.width;
    CGFloat height = v32.size.height;
  }
  double v25 = x;
  double v26 = y;
  double v27 = width;
  double v28 = height;
  result.size.CGFloat height = v28;
  result.size.CGFloat width = v27;
  result.origin.CGFloat y = v26;
  result.origin.CGFloat x = v25;
  return result;
}

- (id)accessibilityContainer
{
  v5.receiver = self;
  v5.super_class = (Class)SKSceneAccessibility;
  id v3 = [(SKSceneAccessibility *)&v5 accessibilityContainer];
  if (!v3)
  {
    id v3 = [(SKSceneAccessibility *)self safeValueForKey:@"view"];
  }

  return v3;
}

- (void)didMoveToView:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SKSceneAccessibility;
  [(SKSceneAccessibility *)&v3 didMoveToView:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

- (void)didChangeSize:(CGSize)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SKSceneAccessibility;
  -[SKSceneAccessibility didChangeSize:](&v3, sel_didChangeSize_, a3.width, a3.height);
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

- (void)willMoveFromView:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SKSceneAccessibility;
  [(SKSceneAccessibility *)&v3 willMoveFromView:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

@end