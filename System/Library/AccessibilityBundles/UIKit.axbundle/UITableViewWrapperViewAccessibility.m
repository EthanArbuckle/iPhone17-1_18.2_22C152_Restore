@interface UITableViewWrapperViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityScrollingEnabled;
- (CGRect)_accessibilityContentFrame;
- (UIEdgeInsets)_accessibilityVisibleContentInset;
@end

@implementation UITableViewWrapperViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UITableViewWrapperView";
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

- (UIEdgeInsets)_accessibilityVisibleContentInset
{
  double v3 = *(double *)(MEMORY[0x263F1D1C0] + 8);
  double v2 = *MEMORY[0x263F1D1C0];
  double v5 = *(double *)(MEMORY[0x263F1D1C0] + 24);
  double v4 = *(double *)(MEMORY[0x263F1D1C0] + 16);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (CGRect)_accessibilityContentFrame
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = (id)[(UITableViewWrapperViewAccessibility *)self _accessibilityAncestorIsKindOf:objc_opt_class()];
  if (location[0])
  {
    [location[0] _accessibilityContentFrame];
  }
  else
  {
    v10.receiver = v12;
    v10.super_class = (Class)UITableViewWrapperViewAccessibility;
    [(UITableViewWrapperViewAccessibility *)&v10 _accessibilityContentFrame];
  }
  double v13 = v2;
  double v14 = v3;
  double v15 = v4;
  double v16 = v5;
  objc_storeStrong(location, 0);
  double v6 = v13;
  double v7 = v14;
  double v8 = v15;
  double v9 = v16;
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (BOOL)_accessibilityScrollingEnabled
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = (id)[(UITableViewWrapperViewAccessibility *)self _accessibilityUserDefinedScrollingEnabled];
  if (location[0]) {
    char v4 = [location[0] BOOLValue] & 1;
  }
  else {
    char v4 = 0;
  }
  objc_storeStrong(location, 0);
  return v4 & 1;
}

@end