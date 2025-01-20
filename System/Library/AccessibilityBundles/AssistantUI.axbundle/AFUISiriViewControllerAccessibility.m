@interface AFUISiriViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)compactView:(id)a3 bottomContentInsetDidChange:(double)a4;
@end

@implementation AFUISiriViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AFUISiriViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AFUISiriViewController", @"compactView:bottomContentInsetDidChange:", "v", "@", "d", 0);
  [v3 validateClass:@"AFUISiriViewController" isKindOfClass:@"UIViewController"];
}

- (void)compactView:(id)a3 bottomContentInsetDidChange:(double)a4
{
  id v6 = a3;
  v7 = objc_opt_new();
  int v8 = [v7 isClarityBoardEnabled];

  double v9 = 0.0;
  if (v8)
  {
    char v17 = 0;
    objc_opt_class();
    v10 = __UIAccessibilityCastAsClass();
    v11 = [v10 view];
    [v11 frame];
    double v13 = v12;

    if (v13 > 0.0)
    {
      v14 = [MEMORY[0x263F1C920] mainScreen];
      [v14 bounds];
      double v9 = v15 - v13;
    }
  }
  v16.receiver = self;
  v16.super_class = (Class)AFUISiriViewControllerAccessibility;
  [(AFUISiriViewControllerAccessibility *)&v16 compactView:v6 bottomContentInsetDidChange:v9 + a4];
}

@end