@interface GAXSBAppPlatterDragPreviewOverride
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (GAXSBAppPlatterDragPreviewOverride)initWithReferenceIconView:(id)a3 sourceView:(id)a4;
@end

@implementation GAXSBAppPlatterDragPreviewOverride

+ (id)safeCategoryTargetClassName
{
  return @"SBAppPlatterDragPreview";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBAppPlatterDragPreview", @"initWithReferenceIconView:sourceView:", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconView", @"icon", "@", 0);
}

- (GAXSBAppPlatterDragPreviewOverride)initWithReferenceIconView:(id)a3 sourceView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v13 = 0;
  objc_opt_class();
  v8 = [v6 safeValueForKey:@"icon"];
  v9 = __UIAccessibilityCastAsSafeCategory();

  [v9 _gaxSetNeedsLaunchEnabledAppearance:1];
  v12.receiver = self;
  v12.super_class = (Class)GAXSBAppPlatterDragPreviewOverride;
  v10 = [(GAXSBAppPlatterDragPreviewOverride *)&v12 initWithReferenceIconView:v6 sourceView:v7];
  [v9 _gaxSetNeedsLaunchEnabledAppearance:0];

  return v10;
}

@end