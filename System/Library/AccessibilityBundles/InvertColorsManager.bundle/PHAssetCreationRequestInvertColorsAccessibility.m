@interface PHAssetCreationRequestInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)creationRequestForAssetFromScreenshotImage:(id)a3;
+ (id)safeCategoryTargetClassName;
@end

@implementation PHAssetCreationRequestInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PHAssetCreationRequest";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (id)creationRequestForAssetFromScreenshotImage:(id)a3
{
  id v4 = a3;
  if (UIAccessibilityIsInvertColorsEnabled())
  {
    uint64_t v5 = +[AXInvertColorsAppHelper invertImage:v4];

    id v4 = (id)v5;
  }
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___PHAssetCreationRequestInvertColorsAccessibility;
  v6 = objc_msgSendSuper2(&v8, "creationRequestForAssetFromScreenshotImage:", v4);

  return v6;
}

@end