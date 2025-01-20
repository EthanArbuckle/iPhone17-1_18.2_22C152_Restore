@interface CKAvatarCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_axCKEntity;
- (id)_axLocalizedFormatStringForAcknowledgmentType:(int64_t)a3;
- (id)_axTapbackContacts;
- (id)_axTapbackLabelWithTally:(id)a3;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (int64_t)_axTapbackType;
- (unint64_t)_axCollectionViewLayoutMode;
- (unint64_t)accessibilityTraits;
- (void)_setAXCKEntity:(id)a3;
- (void)configureWithEntity:(id)a3;
@end

@implementation CKAvatarCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKAvatarCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKAvatarCollectionViewCell", @"configureWithEntity:", "v", "@", 0);
  [v3 validateClass:@"_CKAcknowledgmentTally"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_CKAcknowledgmentTally", @"contacts", "@", 0);
  [v3 validateClass:@"CKGroupAcknowledgmentVotingLayout"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKGroupAcknowledgmentVotingLayout", @"layoutMode", "Q", 0);
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (BOOL)isAccessibilityElement
{
  id v3 = [(CKAvatarCollectionViewCellAccessibility *)self _accessibilityValueForKey:@"AXTapbackTally"];
  if (v3)
  {
    unsigned __int8 v4 = [(CKAvatarCollectionViewCellAccessibility *)self _axCollectionViewLayoutMode] != 1
      || [(CKAvatarCollectionViewCellAccessibility *)self _accessibilityIntegerValueForKey:@"AXTapbackContactIndex"] == 0;
  }
  else
  {
    v5 = [(CKAvatarCollectionViewCellAccessibility *)self isAccessibilityUserDefinedElement];

    if (v5)
    {
      v6 = [(CKAvatarCollectionViewCellAccessibility *)self isAccessibilityUserDefinedElement];
      unsigned __int8 v4 = [v6 BOOLValue];
    }
    else
    {
      v8.receiver = self;
      v8.super_class = (Class)CKAvatarCollectionViewCellAccessibility;
      unsigned __int8 v4 = [(CKAvatarCollectionViewCellAccessibility *)&v8 isAccessibilityElement];
    }
  }

  return v4;
}

- (id)accessibilityLabel
{
  id v3 = [(CKAvatarCollectionViewCellAccessibility *)self _accessibilityValueForKey:@"AXTapbackTally"];
  if (v3)
  {
    unsigned __int8 v4 = [(CKAvatarCollectionViewCellAccessibility *)self _axTapbackLabelWithTally:v3];
  }
  else
  {
    objc_opt_class();
    v5 = [(CKAvatarCollectionViewCellAccessibility *)self _axCKEntity];
    v6 = __UIAccessibilityCastAsClass();

    unsigned __int8 v4 = [v6 abbreviatedDisplayName];
  }

  return v4;
}

- (id)accessibilityHint
{
  id v3 = [(CKAvatarCollectionViewCellAccessibility *)self _accessibilityValueForKey:@"AXTapbackTally"];
  if (v3)
  {
    uint64_t v4 = accessibilityLocalizedString(@"acknowledgment.tally.hint");
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CKAvatarCollectionViewCellAccessibility;
    uint64_t v4 = [(CKAvatarCollectionViewCellAccessibility *)&v7 accessibilityHint];
  }
  v5 = (void *)v4;

  return v5;
}

- (id)_axCKEntity
{
}

- (void)_setAXCKEntity:(id)a3
{
}

- (void)configureWithEntity:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CKAvatarCollectionViewCellAccessibility;
  id v4 = a3;
  [(CKAvatarCollectionViewCellAccessibility *)&v5 configureWithEntity:v4];
  -[CKAvatarCollectionViewCellAccessibility _setAXCKEntity:](self, "_setAXCKEntity:", v4, v5.receiver, v5.super_class);
}

- (id)_axTapbackLabelWithTally:(id)a3
{
  uint64_t v4 = [a3 safeIntegerForKey:@"type"];
  if ([(CKAvatarCollectionViewCellAccessibility *)self _axCollectionViewLayoutMode] == 1)
  {
    objc_super v5 = [(CKAvatarCollectionViewCellAccessibility *)self _axTapbackContacts];
    v6 = NSString;
    objc_super v7 = [(CKAvatarCollectionViewCellAccessibility *)self _axLocalizedFormatStringForAcknowledgmentType:v4];
    objc_super v8 = objc_msgSend(v6, "localizedStringWithFormat:", v7, objc_msgSend(v5, "count"));

    if ([v5 count] == 1)
    {
      uint64_t v9 = [(CKAvatarCollectionViewCellAccessibility *)self _accessibilityIntegerValueForKey:@"AXTapbackContactIndex"];
      v10 = [(CKAvatarCollectionViewCellAccessibility *)self _axTapbackContacts];
      v11 = [v10 objectAtIndex:v9];

      v16 = [v11 safeValueForKey:@"name"];
      uint64_t v12 = __UIAXStringForVariables();

      objc_super v8 = (void *)v12;
    }
  }
  else
  {
    uint64_t v13 = [(CKAvatarCollectionViewCellAccessibility *)self _accessibilityIntegerValueForKey:@"AXTapbackContactIndex"];
    v14 = [(CKAvatarCollectionViewCellAccessibility *)self _axTapbackContacts];
    objc_super v5 = [v14 objectAtIndex:v13];

    objc_super v8 = [v5 safeValueForKey:@"name"];
  }

  return v8;
}

- (id)_axLocalizedFormatStringForAcknowledgmentType:(int64_t)a3
{
  if ((unint64_t)(a3 - 2000) > 5)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = accessibilityLocalizedString(off_265112FB8[a3 - 2000]);
  }
  return v4;
}

- (int64_t)_axTapbackType
{
  v2 = [(CKAvatarCollectionViewCellAccessibility *)self _accessibilityValueForKey:@"AXTapbackTally"];
  int64_t v3 = [v2 safeIntegerForKey:@"type"];

  return v3;
}

- (id)_axTapbackContacts
{
  v2 = [(CKAvatarCollectionViewCellAccessibility *)self _accessibilityValueForKey:@"AXTapbackTally"];
  objc_opt_class();
  int64_t v3 = [v2 safeValueForKey:@"contacts"];
  uint64_t v4 = __UIAccessibilityCastAsClass();

  return v4;
}

- (unint64_t)_axCollectionViewLayoutMode
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  objc_opt_class();
  int64_t v3 = [v2 superview];
  uint64_t v4 = __UIAccessibilityCastAsClass();

  objc_super v5 = [v4 collectionViewLayout];
  unint64_t v6 = [v5 safeIntegerForKey:@"layoutMode"];

  return v6;
}

@end