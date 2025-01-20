@interface PUVideoPlayerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsPHAssetLocallyAvailable;
- (BOOL)_accessibilitySavePhotoLabel:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityElementStoredUserLabel;
- (id)_accessibilityPHAssetLocalIdentifier;
- (id)_accessibilityPhotoLibraryURL;
- (id)_axPHAsset;
- (id)accessibilityLabel;
- (id)accessibilityURL;
@end

@implementation PUVideoPlayerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PUVideoPlayerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PUVideoPlayerView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHAsset", @"mainFileURL", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHAsset", @"isVideo", "B", 0);
}

- (id)_axPHAsset
{
  objc_opt_class();
  id v3 = [(PUVideoPlayerViewAccessibility *)self _accessibilityValueForKey:@"AXAsset"];
  v4 = __UIAccessibilityCastAsClass();

  return v4;
}

- (BOOL)isAccessibilityElement
{
  id v3 = [(PUVideoPlayerViewAccessibility *)self isAccessibilityUserDefinedElement];

  if (!v3) {
    return 1;
  }
  v4 = [(PUVideoPlayerViewAccessibility *)self isAccessibilityUserDefinedElement];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (id)accessibilityLabel
{
  v2 = [(PUVideoPlayerViewAccessibility *)self _axPHAsset];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)accessibilityURL
{
  id v3 = [(PUVideoPlayerViewAccessibility *)self _axPHAsset];
  v4 = [v3 safeValueForKey:@"mainFileURL"];

  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PUVideoPlayerViewAccessibility;
    id v5 = [(PUVideoPlayerViewAccessibility *)&v8 accessibilityURL];
  }
  v6 = v5;

  return v6;
}

- (id)_accessibilityPHAssetLocalIdentifier
{
  v2 = [(PUVideoPlayerViewAccessibility *)self _axPHAsset];
  id v3 = [v2 _accessibilityPHAssetLocalIdentifier];

  return v3;
}

- (id)_accessibilityPhotoLibraryURL
{
  v2 = [(PUVideoPlayerViewAccessibility *)self _axPHAsset];
  id v3 = [v2 _accessibilityPhotoLibraryURL];

  return v3;
}

- (BOOL)_accessibilityIsPHAssetLocallyAvailable
{
  v2 = [(PUVideoPlayerViewAccessibility *)self _axPHAsset];
  char v3 = [v2 _accessibilityIsPHAssetLocallyAvailable];

  return v3;
}

- (id)_accessibilityElementStoredUserLabel
{
  char v3 = [(PUVideoPlayerViewAccessibility *)self _axPHAsset];
  v4 = [v3 safeValueForKey:@"_accessibilityiCloudPhotoLabel"];

  if (![v4 length])
  {
    id v5 = [(PUVideoPlayerViewAccessibility *)self _axPHAsset];
    int v6 = [v5 safeBoolForKey:@"isVideo"];

    if (v6)
    {
      v7 = [(PUVideoPlayerViewAccessibility *)self accessibilityURL];
      uint64_t v8 = UIAccessibilityMetadataDescriptionForVideo();

      v4 = (void *)v8;
    }
  }

  return v4;
}

- (BOOL)_accessibilitySavePhotoLabel:(id)a3
{
  id v4 = a3;
  id v5 = [(PUVideoPlayerViewAccessibility *)self _axPHAsset];
  char v6 = [v5 _accessibilitySavePhotoLabel:v4];

  return v6;
}

@end