@interface PXPhotosDetailsHeaderTileWidgetAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)checkOutTileForIdentifier:(PXTileIdentifier *)a3 layout:(id)a4;
@end

@implementation PXPhotosDetailsHeaderTileWidgetAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PXPhotosDetailsHeaderTileWidget";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PXUIPlayButtonTile"];
  [v3 validateClass:@"PXTitleSubtitleUILabelTile"];
  [v3 validateClass:@"PXTitleSubtitleUILabel"];
  [v3 validateProtocol:@"PXUIViewBasicTile" hasRequiredInstanceMethod:@"view"];
  [v3 validateClass:@"PXUIPlayButtonTile" hasInstanceVariable:@"_hifiPlayButtonView" withType:"UIView<PXVideoOverlayButton>"];
  [v3 validateClass:@"PXTitleSubtitleUILabelTile" hasInstanceVariable:@"_label" withType:"PXTitleSubtitleUILabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXImageUIView", @"_imageView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXPhotosDetailsHeaderTileWidget", @"checkOutTileForIdentifier: layout:", "^v", "{PXTileIdentifier=Q[10Q]}", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXPhotosDetailsHeaderTileWidget", @"_title", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXPhotosDetailsHeaderTileWidget", @"_subtitle", "@", 0);
}

- (void)checkOutTileForIdentifier:(PXTileIdentifier *)a3 layout:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)PXPhotosDetailsHeaderTileWidgetAccessibility;
  long long v4 = *(_OWORD *)&a3->var1[5];
  v9[2] = *(_OWORD *)&a3->var1[3];
  v9[3] = v4;
  v9[4] = *(_OWORD *)&a3->var1[7];
  unint64_t v10 = a3->var1[9];
  long long v5 = *(_OWORD *)&a3->var1[1];
  v9[0] = *(_OWORD *)&a3->var0;
  v9[1] = v5;
  v6 = [(PXPhotosDetailsHeaderTileWidgetAccessibility *)&v11 checkOutTileForIdentifier:v9 layout:a4];
  MEMORY[0x2455E3C60](@"PXUIPlayButtonTile");
  if (objc_opt_isKindOfClass())
  {
    v7 = [v6 safeValueForKey:@"_hifiPlayButtonView"];
    [v7 setIsAccessibilityElement:0];
LABEL_6:

    goto LABEL_7;
  }
  MEMORY[0x2455E3C60](@"PXTitleSubtitleUILabelTile");
  if (objc_opt_isKindOfClass())
  {
    v7 = [v6 safeValueForKey:@"_label"];
    MEMORY[0x2455E3C60](@"PXTitleSubtitleUILabel");
    if (objc_opt_isKindOfClass()) {
      [v7 accessibilitySetIdentification:@"AXMemoryTileHeadingLabel"];
    }
    goto LABEL_6;
  }
LABEL_7:

  return v6;
}

@end