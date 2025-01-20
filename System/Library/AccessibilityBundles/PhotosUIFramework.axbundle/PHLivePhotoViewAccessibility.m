@interface PHLivePhotoViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsPHAssetLocallyAvailable;
- (BOOL)_accessibilitySavePhotoLabel:(id)a3;
- (BOOL)_accessibilitySkipImageTraitDescription;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityElementStoredUserLabel;
- (id)_accessibilityPHAssetLocalIdentifier;
- (id)_accessibilityPhotoLibraryURL;
- (id)_axPHAsset;
- (id)accessibilityCustomContent;
- (id)accessibilityLabel;
- (id)accessibilityURL;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation PHLivePhotoViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PHLivePhotoView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHLivePhotoView", @"livePhoto", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHLivePhoto", @"asset", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHLivePhoto", @"imageURL", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHAsset", @"mainFileURL", "@", 0);
}

- (id)_axPHAsset
{
  id v3 = [(PHLivePhotoViewAccessibility *)self _accessibilityValueForKey:@"AXPHImageAsset"];
  if (!v3)
  {
    v4 = [(PHLivePhotoViewAccessibility *)self safeValueForKey:@"livePhoto"];
    v5 = [v4 safeValueForKey:@"asset"];
    id v3 = __UIAccessibilitySafeClass();
  }

  return v3;
}

- (BOOL)_accessibilitySkipImageTraitDescription
{
  return 1;
}

- (BOOL)isAccessibilityElement
{
  id v3 = [(PHLivePhotoViewAccessibility *)self isAccessibilityUserDefinedElement];

  if (!v3) {
    return 1;
  }
  v4 = [(PHLivePhotoViewAccessibility *)self isAccessibilityUserDefinedElement];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (id)accessibilityCustomContent
{
  v2 = [(PHLivePhotoViewAccessibility *)self _axPHAsset];
  id v3 = [v2 accessibilityCustomContent];

  return v3;
}

- (id)accessibilityLabel
{
  id v3 = [(PHLivePhotoViewAccessibility *)self accessibilityUserDefinedLabel];

  if (v3)
  {
    v4 = [(PHLivePhotoViewAccessibility *)self accessibilityUserDefinedLabel];
  }
  else
  {
    char v5 = [(PHLivePhotoViewAccessibility *)self _axPHAsset];
    v6 = v5;
    if (v5)
    {
      v4 = [v5 accessibilityLabel];
    }
    else
    {
      v7 = [(PHLivePhotoViewAccessibility *)self safeValueForKey:@"livePhoto"];
      v8 = [v7 safeValueForKey:@"imageURL"];
      v9 = __UIAccessibilitySafeClass();

      v4 = UIAccessibilityMetadataDescriptionForImage();
    }
  }

  return v4;
}

- (id)accessibilityValue
{
  v2 = [(PHLivePhotoViewAccessibility *)self _axPHAsset];
  id v3 = [v2 accessibilityValue];

  return v3;
}

- (unint64_t)accessibilityTraits
{
  id v3 = [(PHLivePhotoViewAccessibility *)self _axPHAsset];

  if (!v3) {
    return *MEMORY[0x263F1CF00];
  }
  v4 = [(PHLivePhotoViewAccessibility *)self _axPHAsset];
  unint64_t v5 = [v4 accessibilityTraits];

  return v5;
}

- (id)accessibilityURL
{
  id v3 = [(PHLivePhotoViewAccessibility *)self _axPHAsset];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [v3 accessibilityURL];
  }
  else
  {
    if (objc_opt_respondsToSelector())
    {
      char v9 = 0;
      unint64_t v5 = [v3 safeValueForKey:@"mainFileURL"];
      v6 = __UIAccessibilitySafeClass();

      goto LABEL_7;
    }
    v8.receiver = self;
    v8.super_class = (Class)PHLivePhotoViewAccessibility;
    uint64_t v4 = [(PHLivePhotoViewAccessibility *)&v8 accessibilityURL];
  }
  v6 = (void *)v4;
LABEL_7:

  return v6;
}

- (id)_accessibilityPHAssetLocalIdentifier
{
  v2 = [(PHLivePhotoViewAccessibility *)self _axPHAsset];
  id v3 = [v2 _accessibilityPHAssetLocalIdentifier];

  return v3;
}

- (id)_accessibilityPhotoLibraryURL
{
  v2 = [(PHLivePhotoViewAccessibility *)self _axPHAsset];
  id v3 = [v2 _accessibilityPhotoLibraryURL];

  return v3;
}

- (BOOL)_accessibilityIsPHAssetLocallyAvailable
{
  v2 = [(PHLivePhotoViewAccessibility *)self _axPHAsset];
  char v3 = [v2 _accessibilityIsPHAssetLocallyAvailable];

  return v3;
}

- (BOOL)_accessibilitySavePhotoLabel:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(PHLivePhotoViewAccessibility *)self _axPHAsset];
  char v6 = [v5 _accessibilitySavePhotoLabel:v4];

  return v6;
}

- (id)_accessibilityElementStoredUserLabel
{
  v2 = [(PHLivePhotoViewAccessibility *)self _axPHAsset];
  char v3 = [v2 safeValueForKey:@"_accessibilityiCloudPhotoLabel"];

  return v3;
}

@end