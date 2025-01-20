@interface PGStashViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityUseAccessibilityFrameForHittest;
- (CGRect)accessibilityFrame;
- (PGStashViewAccessibility)initWithFrame:(CGRect)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axMarkupBackdropView;
@end

@implementation PGStashViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PGStashView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PGBackdropView" isKindOfClass:@"UIView"];
  [v3 validateClass:@"PGStashView" isKindOfClass:@"UIView"];
  [v3 validateClass:@"PGStashView" hasInstanceVariable:@"_backdropView" withType:"PGBackdropView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PGStashView", @"initWithFrame:", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
}

- (PGStashViewAccessibility)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PGStashViewAccessibility;
  id v3 = -[PGStashViewAccessibility initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(PGStashViewAccessibility *)v3 _axMarkupBackdropView];
  }

  return v4;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)PGStashViewAccessibility;
  [(PGStashViewAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(PGStashViewAccessibility *)self _axMarkupBackdropView];
}

- (void)_axMarkupBackdropView
{
  id v4 = [(PGStashViewAccessibility *)self safeValueForKey:@"_backdropView"];
  v2 = accessibilityLocalizedString(@"pip.stash.view");
  [v4 setAccessibilityLabel:v2];

  objc_super v3 = accessibilityLocalizedString(@"pip.stash.stashed");
  [v4 setAccessibilityValue:v3];

  [v4 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
  [v4 setIsAccessibilityElement:1];
}

- (BOOL)_accessibilityUseAccessibilityFrameForHittest
{
  return 1;
}

- (CGRect)accessibilityFrame
{
  objc_super v3 = [(PGStashViewAccessibility *)self safeUIViewForKey:@"_backdropView"];
  v24.receiver = self;
  v24.super_class = (Class)PGStashViewAccessibility;
  [(PGStashViewAccessibility *)&v24 accessibilityFrame];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [v3 accessibilityFrame];
  v28.origin.CGFloat x = v12;
  v28.origin.CGFloat y = v13;
  v28.size.CGFloat width = v14;
  v28.size.CGFloat height = v15;
  v25.origin.CGFloat x = v5;
  v25.origin.CGFloat y = v7;
  v25.size.CGFloat width = v9;
  v25.size.CGFloat height = v11;
  CGRect v26 = CGRectUnion(v25, v28);
  CGFloat x = v26.origin.x;
  CGFloat y = v26.origin.y;
  CGFloat width = v26.size.width;
  CGFloat height = v26.size.height;

  double v20 = x;
  double v21 = y;
  double v22 = width;
  double v23 = height;
  result.size.CGFloat height = v23;
  result.size.CGFloat width = v22;
  result.origin.CGFloat y = v21;
  result.origin.CGFloat x = v20;
  return result;
}

@end