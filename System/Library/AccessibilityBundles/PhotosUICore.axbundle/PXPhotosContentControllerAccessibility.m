@interface PXPhotosContentControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)axGroup:(id)a3 didChange:(unint64_t)a4 userInfo:(id)a5;
@end

@implementation PXPhotosContentControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PXPhotosContentController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXCuratedLibraryViewProvider", @"gridView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXPhotosContentController", @"axGroup:didChange:userInfo:", "v", "@", "Q", "@", 0);
}

- (void)axGroup:(id)a3 didChange:(unint64_t)a4 userInfo:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (a4 != 2
    || ([(PXPhotosContentControllerAccessibility *)self safeValueForKey:@"gridView"],
        v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = [v10 _accessibilityIsFKARunningForFocusItem],
        v10,
        (v11 & 1) == 0))
  {
    v12.receiver = self;
    v12.super_class = (Class)PXPhotosContentControllerAccessibility;
    [(PXPhotosContentControllerAccessibility *)&v12 axGroup:v8 didChange:a4 userInfo:v9];
  }
}

@end