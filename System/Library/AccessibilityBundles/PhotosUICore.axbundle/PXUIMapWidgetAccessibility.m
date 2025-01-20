@interface PXUIMapWidgetAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axUpdateMapImageView;
- (void)_loadContainerView;
@end

@implementation PXUIMapWidgetAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PXUIMapWidget";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PXImageUIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXUIMapWidget", @"_imageView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXImageUIView", @"_imageView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXUIMapWidget", @"_loadContainerView", "v", 0);
}

- (void)_axUpdateMapImageView
{
  id v4 = [(PXUIMapWidgetAccessibility *)self safeValueForKey:@"_imageView"];
  v2 = [v4 safeValueForKey:@"_imageView"];
  id v3 = accessibilityPhotosUICoreLocalizedString(@"widget.map.summaryimage.label");
  [v2 setAccessibilityLabel:v3];

  [v2 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
  [v2 accessibilitySetIdentification:@"AXMemoryTileImageView"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)PXUIMapWidgetAccessibility;
  [(PXUIMapWidgetAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(PXUIMapWidgetAccessibility *)self _axUpdateMapImageView];
}

- (void)_loadContainerView
{
  v3.receiver = self;
  v3.super_class = (Class)PXUIMapWidgetAccessibility;
  [(PXUIMapWidgetAccessibility *)&v3 _loadContainerView];
  [(PXUIMapWidgetAccessibility *)self _axUpdateMapImageView];
}

@end