@interface _UIFloatingContentViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (CGRect)accessibilityFrame;
@end

@implementation _UIFloatingContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIFloatingContentView";
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
  objc_storeStrong(location, 0);
}

- (CGRect)accessibilityFrame
{
  v15 = self;
  v14[1] = (id)a2;
  char v13 = 0;
  objc_opt_class();
  id v12 = (id)__UIAccessibilityCastAsClass();
  id v11 = v12;
  objc_storeStrong(&v12, 0);
  v14[0] = v11;
  id v10 = (id)[(_UIFloatingContentViewAccessibility *)v15 safeValueForKey:@"scaleFactor"];
  [v10 floatValue];

  [v14[0] bounds];
  UIAccessibilityFrameForBounds();
  double v16 = v2;
  double v17 = v3;
  double v18 = v4;
  double v19 = v5;
  objc_storeStrong(v14, 0);
  double v6 = v16;
  double v7 = v17;
  double v8 = v18;
  double v9 = v19;
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

@end