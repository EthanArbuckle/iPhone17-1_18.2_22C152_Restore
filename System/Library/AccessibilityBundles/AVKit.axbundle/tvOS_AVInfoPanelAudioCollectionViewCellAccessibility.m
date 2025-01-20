@interface tvOS_AVInfoPanelAudioCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityHeaderElements;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation tvOS_AVInfoPanelAudioCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AVInfoPanelAudioCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"AVInfoPanelAudioCollectionViewCell" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
  [v3 validateClass:@"AVInfoPanelAudioCollectionViewCell" hasInstanceVariable:@"_checkmarkImageView" withType:"UIImageView"];
  [v3 validateClass:@"AVInfoPanelAudioCollectionViewCell" hasInstanceVariable:@"_mediaOption" withType:"AVInfoPanelMediaOption"];
  [v3 validateClass:@"AVInfoPanelAudioCollectionViewCell" hasInstanceVariable:@"_displayAsSelected" withType:"B"];
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"AVInfoPanelMediaOption", @"_imageForRoute:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVInfoPanelMediaOption", @"route", "@", 0);
  [v3 validateClass:@"AVInfoPanelCollectionReusableHeaderView"];
  [v3 validateClass:@"AVInfoPanelCollectionReusableHeaderView" isKindOfClass:@"UIView"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(tvOS_AVInfoPanelAudioCollectionViewCellAccessibility *)self safeValueForKey:@"_titleLabel"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)accessibilityValue
{
  id v3 = [(tvOS_AVInfoPanelAudioCollectionViewCellAccessibility *)self safeValueForKey:@"_mediaOption"];
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  id v15 = 0;
  uint64_t v9 = MEMORY[0x263EF8330];
  id v4 = v3;
  AXPerformSafeBlock();
  id v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  v6 = objc_msgSend(v5, "accessibilityLabel", v9, 3221225472, __74__tvOS_AVInfoPanelAudioCollectionViewCellAccessibility_accessibilityValue__block_invoke, &unk_265101B78);

  v7 = [(tvOS_AVInfoPanelAudioCollectionViewCellAccessibility *)self accessibilityLabel];
  LODWORD(v5) = [v6 isEqualToString:v7];

  if (v5)
  {

    v6 = 0;
  }

  return v6;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2 = *MEMORY[0x263F1CEE8];
  int v3 = [(tvOS_AVInfoPanelAudioCollectionViewCellAccessibility *)self safeBoolForKey:@"_displayAsSelected"];
  uint64_t v4 = *MEMORY[0x263F1CF38];
  if (!v3) {
    uint64_t v4 = 0;
  }
  return v4 | v2;
}

- (id)accessibilityHeaderElements
{
  uint64_t v2 = [(tvOS_AVInfoPanelAudioCollectionViewCellAccessibility *)self _accessibilityAncestorIsKindOf:objc_opt_class()];
  int v3 = [v2 _accessibilityFindDescendant:&__block_literal_global_7];
  uint64_t v4 = objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 1, v3);

  return v4;
}

@end