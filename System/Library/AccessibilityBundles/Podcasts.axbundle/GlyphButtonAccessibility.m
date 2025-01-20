@interface GlyphButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation GlyphButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ShelfKitCollectionViews.GlyphButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.GlyphButton", @"accessibilityGlyphView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIImageView", @"image", "@", 0);
  [v3 validateClass:@"UIImage" hasInstanceVariable:@"_imageAsset" withType:"UIImageAsset"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIImageAsset", @"assetName", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(GlyphButtonAccessibility *)self safeValueForKey:@"accessibilityGlyphView"];
  v11.receiver = self;
  v11.super_class = (Class)GlyphButtonAccessibility;
  v4 = [(GlyphButtonAccessibility *)&v11 accessibilityLabel];
  if ([v4 length]) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v3 == 0;
  }
  if (!v5)
  {
    v6 = [v3 safeValueForKey:@"image"];
    v7 = [v6 safeValueForKey:@"_imageAsset"];
    v8 = [v7 safeStringForKey:@"assetName"];

    uint64_t v9 = AXSSAccessibilityDescriptionForSymbolName();

    v4 = (void *)v9;
  }

  return v4;
}

@end