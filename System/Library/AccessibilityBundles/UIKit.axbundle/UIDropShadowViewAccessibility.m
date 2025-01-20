@interface UIDropShadowViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsScrollAncestor;
- (BOOL)accessibilityScrollDownPage;
- (BOOL)accessibilityScrollDownPageSupported;
- (BOOL)accessibilityScrollToVisibleWithChild:(id)a3;
- (BOOL)accessibilityScrollUpPage;
- (BOOL)accessibilityScrollUpPageSupported;
- (id)_axSheetPresentationController;
@end

@implementation UIDropShadowViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIDropShadowView";
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
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIDropShadowView", @"_delegate", "@", 0);
  objc_storeStrong(v4, obj);
}

- (BOOL)accessibilityScrollToVisibleWithChild:(id)a3
{
  v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v20 = [(UIDropShadowViewAccessibility *)v22 _axSheetPresentationController];
  if (!v20) {
    goto LABEL_6;
  }
  char v18 = 0;
  objc_opt_class();
  id v17 = (id)__UIAccessibilityCastAsClass();
  id v16 = v17;
  objc_storeStrong(&v17, 0);
  id v19 = v16;
  id v15 = (id)[location[0] _accessibilityParentView];
  id v12 = v19;
  [v15 bounds];
  objc_msgSend(v12, "convertRect:fromView:", v15, v3, v4, v5, v6);
  v14.origin.x = v7;
  v14.origin.y = v8;
  v14.size.width = v9;
  v14.size.height = v10;
  [v19 bounds];
  CGRectIntersection(v24, v14);
  if (AX_CGRectAlmostEqualToRect())
  {
    int v13 = 0;
  }
  else
  {
    char v23 = objc_msgSend(v20, "_accessibilityExpandSheet", 1.0) & 1;
    int v13 = 1;
  }
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v19, 0);
  if (!v13) {
LABEL_6:
  }
    char v23 = 0;
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
  return v23 & 1;
}

- (BOOL)_accessibilityIsScrollAncestor
{
  v6[2] = self;
  v6[1] = (id)a2;
  v6[0] = [(UIDropShadowViewAccessibility *)self _axSheetPresentationController];
  v2 = (objc_class *)objc_opt_class();
  double v4 = NSStringFromClass(v2);
  int v5 = ![(NSString *)v4 isEqualToString:@"_UIRootPresentationController"];

  objc_storeStrong(v6, 0);
  return v5 & 1;
}

- (BOOL)accessibilityScrollUpPageSupported
{
  id v4 = [(UIDropShadowViewAccessibility *)self _axSheetPresentationController];
  char v7 = 0;
  char v5 = 0;
  if ([v4 _accessibilityIsInverted])
  {
    id v8 = [(UIDropShadowViewAccessibility *)self _axSheetPresentationController];
    char v7 = 1;
    int v3 = [v8 _accessibilityCanExpandSheet] & 1;
  }
  else
  {
    id v6 = [(UIDropShadowViewAccessibility *)self _axSheetPresentationController];
    char v5 = 1;
    int v3 = [v6 _accessibilityCanCollapseSheet] & 1;
  }
  if (v5) {

  }
  if (v7) {
  return v3 != 0;
  }
}

- (BOOL)accessibilityScrollUpPage
{
  id v4 = [(UIDropShadowViewAccessibility *)self _axSheetPresentationController];
  char v7 = 0;
  char v5 = 0;
  if ([v4 _accessibilityIsInverted])
  {
    id v8 = [(UIDropShadowViewAccessibility *)self _axSheetPresentationController];
    char v7 = 1;
    int v3 = [v8 _accessibilityExpandSheet] & 1;
  }
  else
  {
    id v6 = [(UIDropShadowViewAccessibility *)self _axSheetPresentationController];
    char v5 = 1;
    int v3 = [v6 _accessibilityCollapseSheet] & 1;
  }
  if (v5) {

  }
  if (v7) {
  return v3 != 0;
  }
}

- (BOOL)accessibilityScrollDownPageSupported
{
  id v4 = [(UIDropShadowViewAccessibility *)self _axSheetPresentationController];
  char v7 = 0;
  char v5 = 0;
  if ([v4 _accessibilityIsInverted])
  {
    id v8 = [(UIDropShadowViewAccessibility *)self _axSheetPresentationController];
    char v7 = 1;
    int v3 = [v8 _accessibilityCanCollapseSheet] & 1;
  }
  else
  {
    id v6 = [(UIDropShadowViewAccessibility *)self _axSheetPresentationController];
    char v5 = 1;
    int v3 = [v6 _accessibilityCanExpandSheet] & 1;
  }
  if (v5) {

  }
  if (v7) {
  return v3 != 0;
  }
}

- (BOOL)accessibilityScrollDownPage
{
  id v4 = [(UIDropShadowViewAccessibility *)self _axSheetPresentationController];
  char v7 = 0;
  char v5 = 0;
  if ([v4 _accessibilityIsInverted])
  {
    id v8 = [(UIDropShadowViewAccessibility *)self _axSheetPresentationController];
    char v7 = 1;
    int v3 = [v8 _accessibilityCollapseSheet] & 1;
  }
  else
  {
    id v6 = [(UIDropShadowViewAccessibility *)self _axSheetPresentationController];
    char v5 = 1;
    int v3 = [v6 _accessibilityExpandSheet] & 1;
  }
  if (v5) {

  }
  if (v7) {
  return v3 != 0;
  }
}

- (id)_axSheetPresentationController
{
  v7[2] = self;
  v7[1] = (id)a2;
  v7[0] = (id)[(UIDropShadowViewAccessibility *)self safeValueForKey:@"_delegate"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v6 = 0;
    objc_opt_class();
    id v5 = (id)__UIAccessibilityCastAsSafeCategory();
    id v4 = v5;
    objc_storeStrong(&v5, 0);
    id v8 = v4;
  }
  else
  {
    id v8 = 0;
  }
  objc_storeStrong(v7, 0);
  v2 = v8;

  return v2;
}

@end