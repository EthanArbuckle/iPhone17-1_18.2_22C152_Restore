@interface MFExpandedMessageCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityTouchContainerShouldOutputBraille;
- (id)accessibilityDragSourceDescriptors;
- (id)accessibilityElements;
- (id)accessibilityLabel;
- (int64_t)accessibilityContainerType;
@end

@implementation MFExpandedMessageCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MFExpandedMessageCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"WKContentView"];
  [v3 validateClass:@"MFExpandedMessageCell" isKindOfClass:@"UICollectionViewCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFExpandedMessageCell", @"messageViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UICollectionView", @"_accessibilityShouldUseCollectionViewCellAccessibilityElements", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UICollectionViewCellAccessibilityElement", @"indexPath", "@", 0);
  [v3 validateClass:@"MFModernAddressAtom" hasInstanceVariable:@"_atomView" withType:"CNAtomView"];
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (BOOL)_accessibilityTouchContainerShouldOutputBraille
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(MFExpandedMessageCellAccessibility *)self _accessibilityFindSubviewDescendant:&__block_literal_global_4];
  v4 = [v3 safeValueForKey:@"_atomView"];
  v5 = [v4 accessibilityLabel];

  char v12 = 0;
  objc_opt_class();
  v6 = __UIAccessibilityCastAsSafeCategory();
  v7 = [v6 _accessibilityMessageIndexDescription];

  if (v7)
  {
    uint64_t v8 = __AXStringForVariables();
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)MFExpandedMessageCellAccessibility;
    uint64_t v8 = [(MFExpandedMessageCellAccessibility *)&v11 accessibilityLabel];
  }
  v9 = (void *)v8;

  return v9;
}

uint64_t __56__MFExpandedMessageCellAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Mfmodernaddres.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)accessibilityDragSourceDescriptors
{
  id v3 = [(MFExpandedMessageCellAccessibility *)self _accessibilityDescendantOfType:NSClassFromString(&cfstr_Wkcontentview.isa)];
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 accessibilityDragSourceDescriptors];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)MFExpandedMessageCellAccessibility;
    uint64_t v5 = [(MFExpandedMessageCellAccessibility *)&v8 accessibilityDragSourceDescriptors];
  }
  v6 = (void *)v5;

  return v6;
}

- (id)accessibilityElements
{
  v12[1] = *MEMORY[0x263EF8340];
  id v3 = [(MFExpandedMessageCellAccessibility *)self _accessibilityAncestorIsKindOf:objc_opt_class()];
  int v4 = [v3 safeBoolForKey:@"_accessibilityShouldUseCollectionViewCellAccessibilityElements"];

  if (!v4) {
    goto LABEL_4;
  }
  char v11 = 0;
  objc_opt_class();
  uint64_t v5 = [(MFExpandedMessageCellAccessibility *)self safeValueForKey:@"messageViewController"];
  v6 = __UIAccessibilityCastAsClass();

  v7 = [v6 view];

  if (v7)
  {
    v12[0] = v7;
    objc_super v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  }
  else
  {
LABEL_4:
    v10.receiver = self;
    v10.super_class = (Class)MFExpandedMessageCellAccessibility;
    objc_super v8 = [(MFExpandedMessageCellAccessibility *)&v10 accessibilityElements];
  }

  return v8;
}

@end