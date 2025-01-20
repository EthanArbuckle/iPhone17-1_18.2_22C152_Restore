@interface AmbientPhotoFrameControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)accessibilityPresentExtendedMetadataOverlay;
@end

@implementation AmbientPhotoFrameControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PhotosUIPrivate.AmbientPhotoFrameController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PhotosUIPrivate.AmbientPhotoFrameController", @"accessibilityPresentExtendedMetadataOverlay", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PhotosUIPrivate.AmbientPhotoFrameController", @"openVisibleAssetInPhotosApp", "v", 0);
  [v3 validateClass:@"PhotosUIPrivate.AmbientPhotoFrameController" hasSwiftField:@"extendedMetadataOverlayView" withSwiftType:"Optional<AmbientPhotoFrameExtendedMetadataOverlayView>"];
  [v3 validateClass:@"PhotosUIPrivate.AmbientPhotoFrameExtendedMetadataOverlayView" hasSwiftField:@"openPhotosLabel" withSwiftType:"Optional<UILabel>"];
}

- (void)accessibilityPresentExtendedMetadataOverlay
{
  id v3 = [(AmbientPhotoFrameControllerAccessibility *)self safeSwiftValueForKey:@"extendedMetadataOverlayView"];
  v4 = [v3 safeSwiftValueForKey:@"openPhotosLabel"];
  [v4 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __87__AmbientPhotoFrameControllerAccessibility_accessibilityPresentExtendedMetadataOverlay__block_invoke;
  v5[3] = &unk_2650A80B0;
  v5[4] = self;
  [v4 setAccessibilityActivateBlock:v5];
}

uint64_t __87__AmbientPhotoFrameControllerAccessibility_accessibilityPresentExtendedMetadataOverlay__block_invoke()
{
  return 1;
}

uint64_t __87__AmbientPhotoFrameControllerAccessibility_accessibilityPresentExtendedMetadataOverlay__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) openVisibleAssetInPhotosApp];
}

@end