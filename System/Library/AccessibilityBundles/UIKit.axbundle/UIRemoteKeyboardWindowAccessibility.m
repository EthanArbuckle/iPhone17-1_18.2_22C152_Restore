@interface UIRemoteKeyboardWindowAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (CGPoint)accessibilityActivationPoint;
@end

@implementation UIRemoteKeyboardWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIRemoteKeyboardWindow";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v4 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIInputWindowController", @"visibleInputViewFrame", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_storeStrong(v4, obj);
}

- (CGPoint)accessibilityActivationPoint
{
  v18[2] = self;
  v18[1] = (id)a2;
  char v17 = 0;
  id v16 = (id)__UIAccessibilitySafeClass();
  id v15 = v16;
  objc_storeStrong(&v16, 0);
  v18[0] = v15;
  memset(&v14, 0, sizeof(v14));
  char v13 = 0;
  id v10 = (id)[v15 rootViewController];
  id v12 = (id)__UIAccessibilitySafeClass();

  id v11 = v12;
  objc_storeStrong(&v12, 0);
  [v11 safeCGRectForKey:@"visibleInputViewFrame"];
  v14.origin.x = v2;
  v14.origin.y = v3;
  v14.size.width = v4;
  v14.size.height = v5;

  UIAccessibilityConvertFrameToScreenCoordinates(v14, (UIView *)v18[0]);
  AX_CGRectGetCenter();
  double v19 = v6;
  double v20 = v7;
  objc_storeStrong(v18, 0);
  double v8 = v19;
  double v9 = v20;
  result.y = v9;
  result.x = v8;
  return result;
}

@end