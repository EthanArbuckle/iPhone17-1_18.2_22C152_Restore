@interface SBSystemApertureWindowAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsInJindo;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation SBSystemApertureWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBSystemApertureWindow";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SpringBoard", @"systemApertureControllerForMainDisplay", "@", 0);
  [v3 validateClass:@"SBSystemApertureController" hasInstanceVariable:@"_systemApertureViewController" withType:"SBSystemApertureViewController"];
  [v3 validateClass:@"SBSystemApertureViewController" hasInstanceVariable:@"_systemApertureContainsAnyContent" withType:"BOOL"];
}

- (BOOL)_accessibilityIsInJindo
{
  return 1;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v8 = [(id)*MEMORY[0x263F1D020] safeValueForKey:@"systemApertureControllerForMainDisplay"];
  v9 = [v8 safeValueForKey:@"_systemApertureViewController"];
  if ([v9 safeBoolForKey:@"_systemApertureContainsAnyContent"])
  {
    v13.receiver = self;
    v13.super_class = (Class)SBSystemApertureWindowAccessibility;
    -[SBSystemApertureWindowAccessibility _accessibilityHitTest:withEvent:](&v13, sel__accessibilityHitTest_withEvent_, v7, x, y);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = v9;
  }
  v11 = v10;

  return v11;
}

@end