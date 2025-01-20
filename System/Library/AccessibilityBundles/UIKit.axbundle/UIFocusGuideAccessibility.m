@interface UIFocusGuideAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (CGRect)accessibilityFrame;
@end

@implementation UIFocusGuideAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIFocusGuide";
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
  v18[2] = self;
  v18[1] = (id)a2;
  char v17 = 0;
  objc_opt_class();
  id v16 = (id)__UIAccessibilityCastAsClass();
  id v15 = v16;
  objc_storeStrong(&v16, 0);
  v18[0] = v15;
  id v14 = (id)[v15 owningView];
  [v18[0] layoutFrame];
  objc_msgSend(v14, "convertRect:toView:", 0, v2, v3, v4, v5);
  double v19 = v6;
  double v20 = v7;
  double v21 = v8;
  double v22 = v9;

  objc_storeStrong(v18, 0);
  double v10 = v19;
  double v11 = v20;
  double v12 = v21;
  double v13 = v22;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

@end