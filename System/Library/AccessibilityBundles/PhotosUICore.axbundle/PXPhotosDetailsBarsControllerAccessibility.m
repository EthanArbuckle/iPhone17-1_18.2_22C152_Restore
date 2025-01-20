@interface PXPhotosDetailsBarsControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_barButtonItemForBarItemIdentifier:(id)a3;
@end

@implementation PXPhotosDetailsBarsControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PXPhotosDetailsBarsController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)_barButtonItemForBarItemIdentifier:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PXPhotosDetailsBarsControllerAccessibility;
  id v3 = a3;
  v4 = [(PXPhotosDetailsBarsControllerAccessibility *)&v8 _barButtonItemForBarItemIdentifier:v3];
  int v5 = objc_msgSend(v3, "isEqualToString:", @"PXBarItemIdentifierActionMenu", v8.receiver, v8.super_class);

  if (v5)
  {
    v6 = accessibilityPhotosUICoreLocalizedString(@"action.menu");
    [v4 setAccessibilityLabel:v6];
  }

  return v4;
}

@end