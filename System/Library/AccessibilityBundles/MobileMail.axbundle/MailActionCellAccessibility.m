@interface MailActionCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation MailActionCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MailActionCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MailActionCell" isKindOfClass:@"UICollectionViewCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MailActionCell", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MailActionCell", @"cardAction", "@", 0);
  [v3 validateClass:@"MailActionsViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MailActionsViewController", @"collectionView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MailActionsViewController", @"collectionViewDataSource", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFCardAction", @"handlerEnabled", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFCardAction", @"title", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(MailActionCellAccessibility *)self safeValueForKey:@"cardAction"];
  v4 = [v3 safeStringForKey:@"title"];

  if ([v4 length])
  {
    id v5 = v4;
  }
  else
  {
    id v5 = [(MailActionCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"titleLabel"];
  }
  v6 = v5;

  return v6;
}

- (unint64_t)accessibilityTraits
{
  id v3 = [(MailActionCellAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_6 startWithSelf:1];
  v4 = [v3 _accessibilityViewController];

  objc_opt_class();
  id v5 = [v4 safeValueForKey:@"collectionViewDataSource"];
  v6 = __UIAccessibilityCastAsClass();

  objc_opt_class();
  v7 = [v4 safeValueForKey:@"collectionView"];
  v8 = __UIAccessibilityCastAsClass();

  objc_opt_class();
  v9 = __UIAccessibilityCastAsClass();
  v10 = [v8 indexPathForCell:v9];

  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__1;
  v30 = __Block_byref_object_dispose__1;
  id v31 = 0;
  uint64_t v19 = MEMORY[0x263EF8330];
  uint64_t v20 = 3221225472;
  v21 = __50__MailActionCellAccessibility_accessibilityTraits__block_invoke_304;
  v22 = &unk_265133330;
  v25 = &v26;
  id v11 = v6;
  id v23 = v11;
  id v12 = v10;
  id v24 = v12;
  AXPerformSafeBlock();
  id v13 = (id)v27[5];

  _Block_object_dispose(&v26, 8);
  v18.receiver = self;
  v18.super_class = (Class)MailActionCellAccessibility;
  unint64_t v14 = [(MailActionCellAccessibility *)&v18 accessibilityTraits];
  int v15 = [v13 safeBoolForKey:@"handlerEnabled"];

  if (v15) {
    unint64_t v16 = *MEMORY[0x263F1CEE8] | v14;
  }
  else {
    unint64_t v16 = v14 & ~*MEMORY[0x263F1CF38];
  }

  return v16;
}

uint64_t __50__MailActionCellAccessibility_accessibilityTraits__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 _accessibilityViewController];
  NSClassFromString(&cfstr_Mailactionsvie_0.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __50__MailActionCellAccessibility_accessibilityTraits__block_invoke_304(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) itemIdentifierForIndexPath:*(void *)(a1 + 40)];

  return MEMORY[0x270F9A758]();
}

@end