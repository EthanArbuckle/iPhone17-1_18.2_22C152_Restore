@interface GKMultiplayerParticipantCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityCustomActions;
- (id)accessibilityLabel;
@end

@implementation GKMultiplayerParticipantCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"GameCenterUI.GKMultiplayerParticipantCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GameCenterUI.GKMultiplayerParticipantCollectionViewCell", @"accessibilityNameLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GameCenterUI.GKMultiplayerParticipantCollectionViewCell", @"accessibilitySubtitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GameCenterUI.GKMultiplayerParticipantCollectionViewCell", @"accessibilityStatusAccessoryView", "@", 0);
  [v3 validateClass:@"GameCenterUI.DynamicTypeButton"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(GKMultiplayerParticipantCollectionViewCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"accessibilityNameLabel, accessibilitySubtitleLabel, accessibilityStatusAccessoryView"];
}

- (id)accessibilityCustomActions
{
  id v3 = [MEMORY[0x263EFF980] array];
  v17.receiver = self;
  v17.super_class = (Class)GKMultiplayerParticipantCollectionViewCellAccessibility;
  v4 = [(GKMultiplayerParticipantCollectionViewCellAccessibility *)&v17 accessibilityCustomActions];
  [v3 axSafelyAddObjectsFromArray:v4];

  char v16 = 0;
  objc_opt_class();
  v5 = [(GKMultiplayerParticipantCollectionViewCellAccessibility *)self _accessibilityDescendantOfType:MEMORY[0x24564DC30](@"GameCenterUI.DynamicTypeButton")];
  v6 = __UIAccessibilityCastAsClass();

  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x263F1C390]);
    v8 = AXGameCenterUIFrameworkLocString(@"REMOVE_PLAYERS");
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    v13 = __85__GKMultiplayerParticipantCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke;
    v14 = &unk_265122BC0;
    id v15 = v6;
    v9 = (void *)[v7 initWithName:v8 actionHandler:&v11];

    objc_msgSend(v3, "axSafelyAddObject:", v9, v11, v12, v13, v14);
  }

  return v3;
}

uint64_t __85__GKMultiplayerParticipantCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  return 1;
}

@end