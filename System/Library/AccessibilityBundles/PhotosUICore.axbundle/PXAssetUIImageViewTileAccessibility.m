@interface PXAssetUIImageViewTileAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_updateImageView;
@end

@implementation PXAssetUIImageViewTileAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PXAssetUIImageViewTile";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PXAssetUIImageViewTile" conformsToProtocol:@"PXAssetTile"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXImageUIView", @"_imageView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXAssetUIImageViewTile", @"setImageRequester:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXAssetUIImageViewTile", @"_updateImageView", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXImageRequester", @"asset", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_24021B000, log, OS_LOG_TYPE_DEBUG, "reloading asset: %@ %@", (uint8_t *)&v3, 0x16u);
}

- (void)_updateImageView
{
  v3.receiver = self;
  v3.super_class = (Class)PXAssetUIImageViewTileAccessibility;
  [(PXAssetUIImageViewTileAccessibility *)&v3 _updateImageView];
  [(PXAssetUIImageViewTileAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end