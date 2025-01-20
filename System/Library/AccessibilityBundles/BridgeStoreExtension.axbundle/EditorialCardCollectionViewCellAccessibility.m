@interface EditorialCardCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilitySupplementaryFooterViews;
- (id)accessibilityCustomActions;
- (id)accessibilityLabel;
- (id)automationElements;
- (unint64_t)accessibilityTraits;
@end

@implementation EditorialCardCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BridgeStoreExtension.EditorialCardCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BridgeStoreExtension.EditorialCardCollectionViewCell", @"accessibilityCaptionLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BridgeStoreExtension.EditorialCardCollectionViewCell", @"accessibilityTitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BridgeStoreExtension.EditorialCardCollectionViewCell", @"accessibilitySubtitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BridgeStoreExtension.EditorialCardCollectionViewCell", @"accessibilityLockupView", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(EditorialCardCollectionViewCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"accessibilityCaptionLabel, accessibilityTitleLabel, accessibilitySubtitleLabel, accessibilityLockupView"];
}

- (id)automationElements
{
  v2 = (void *)MEMORY[0x263EFF8C0];
  id v3 = [(EditorialCardCollectionViewCellAccessibility *)self safeValueForKey:@"accessibilityLockupView"];
  v4 = objc_msgSend(v2, "axArrayByIgnoringNilElementsWithCount:", 1, v3);

  return v4;
}

- (id)accessibilityCustomActions
{
  v11[1] = *MEMORY[0x263EF8340];
  v10.receiver = self;
  v10.super_class = (Class)EditorialCardCollectionViewCellAccessibility;
  id v3 = [(EditorialCardCollectionViewCellAccessibility *)&v10 accessibilityCustomActions];
  v4 = [(EditorialCardCollectionViewCellAccessibility *)self safeUIViewForKey:@"accessibilityLockupView"];
  if ([v4 _accessibilityViewIsVisible])
  {
    id v5 = objc_alloc(MEMORY[0x263F1C390]);
    v6 = [v4 accessibilityLabel];
    v7 = (void *)[v5 initWithName:v6 actionHandler:&__block_literal_global_2];

    [v4 accessibilityActivationPoint];
    objc_msgSend(v7, "setActivationPoint:");
    if (v3)
    {
      uint64_t v8 = [v3 arrayByAddingObject:v7];

      id v3 = (void *)v8;
    }
    else
    {
      v11[0] = v7;
      id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
    }
  }

  return v3;
}

uint64_t __74__EditorialCardCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke()
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (id)_accessibilitySupplementaryFooterViews
{
  v2 = [(EditorialCardCollectionViewCellAccessibility *)self safeUIViewForKey:@"accessibilityLockupView"];
  id v3 = [v2 _accessibilitySupplementaryFooterViews];

  return v3;
}

@end