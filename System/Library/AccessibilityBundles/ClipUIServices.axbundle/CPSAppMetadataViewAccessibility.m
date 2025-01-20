@interface CPSAppMetadataViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation CPSAppMetadataViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CPSAppMetadataView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CPSAppMetadataView" hasInstanceVariable:@"_appNameVibrantLabel" withType:"CPSVibrantLabel"];
  [v3 validateClass:@"CPSAppMetadataView" hasInstanceVariable:@"_appStoreButton" withType:"CPSAppStoreButton"];
  [v3 validateClass:@"CPSAppMetadataView" hasInstanceVariable:@"_contentRatingContainerView" withType:"CPSContentRatingContainerView"];
  [v3 validateClass:@"CPSContentRatingContainerView" hasInstanceVariable:@"_contentRatingImageView" withType:"CPSScaledImageView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIImageView", @"image", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIImage", @"imageAsset", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIImageAsset", @"assetName", "@", 0);
}

- (id)accessibilityLabel
{
  id v3 = [(CPSAppMetadataViewAccessibility *)self safeValueForKey:@"_appNameVibrantLabel"];
  v4 = [v3 accessibilityLabel];

  v5 = [(CPSAppMetadataViewAccessibility *)self safeValueForKeyPath:@"_contentRatingContainerView._contentRatingImageView.image.imageAsset"];
  v6 = [v5 safeStringForKey:@"assetName"];

  v7 = [(CPSAppMetadataViewAccessibility *)self safeValueForKey:@"_appStoreButton"];
  v8 = [v7 accessibilityLabel];

  if (v4)
  {
    v9 = NSString;
    v10 = accessibilityLocalizedString(@"appstore.poweredBy");
    v11 = objc_msgSend(v9, "stringWithFormat:", v10, v4);
    v12 = NSString;
    v13 = accessibilityLocalizedString(@"appstore.age.rating");
    v17 = objc_msgSend(v12, "stringWithFormat:", v13, v6);
    v14 = __UIAXStringForVariables();
  }
  else
  {
    v14 = 0;
  }
  v15 = __UIAXStringForVariables();

  return v15;
}

@end