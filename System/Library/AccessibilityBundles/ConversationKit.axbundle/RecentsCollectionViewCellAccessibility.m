@interface RecentsCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityCustomActions;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation RecentsCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ConversationKit.RecentsCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"ConversationKit.RecentsCollectionViewCell" isKindOfClass:@"UICollectionViewListCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationKit.RecentsCollectionViewCell", @"trailingAccessoryView", "@", 0);
  [v3 validateClass:@"ConversationKit.RecentsCollectionViewCell" hasSwiftField:@"listItemViewHelper" withSwiftType:"Optional<RecentsListItemViewHelper>"];
  [v3 validateClass:@"TelephonyUI.RecentsListItemViewHelper" hasSwiftField:@"messageIndicatorView" withSwiftType:"Optional<MessageIndicatorView>"];
  [v3 validateClass:@"TelephonyUI.MessageIndicatorView" hasSwiftField:@"titleLabel" withSwiftType:"UILabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TelephonyUI.MessageIndicatorView", @"handleTapGesture", "v", 0);
}

- (id)accessibilityLabel
{
  v2 = [(RecentsCollectionViewCellAccessibility *)self _accessibilityFindSubviewDescendantsPassingTest:&__block_literal_global_0];
  id v3 = MEMORY[0x245649340]();

  return v3;
}

BOOL __60__RecentsCollectionViewCellAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    int v6 = 0;
  }
  else
  {
    v2 = [v4 accessibilityIdentifier];
    if ([v2 isEqualToString:@"TelephonyUI.MessageIndicatorView.sensitive"])
    {
      int v6 = 0;
    }
    else
    {
      id v3 = [v4 accessibilityIdentifier];
      if (([v3 isEqualToString:@"TelephonyUI.MessageIndicatorView.unread"] & 1) == 0)
      {

        BOOL v8 = 0;
LABEL_12:

        goto LABEL_13;
      }
      int v6 = 1;
    }
  }
  v7 = [v4 accessibilityLabel];
  BOOL v8 = [v7 length] != 0;

  if (v6) {
  if ((isKindOfClass & 1) == 0)
  }
    goto LABEL_12;
LABEL_13:

  return v8;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)RecentsCollectionViewCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(RecentsCollectionViewCellAccessibility *)&v3 accessibilityTraits];
}

- (id)accessibilityCustomActions
{
  objc_super v3 = [MEMORY[0x263EFF980] array];
  char v31 = 0;
  objc_opt_class();
  id v4 = __UIAccessibilityCastAsClass();
  v5 = v4;
  int v6 = [v4 accessories];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __68__RecentsCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke;
  v29[3] = &unk_265119EC0;
  id v7 = v3;
  id v30 = v7;
  [v6 enumerateObjectsUsingBlock:v29];

  char v31 = 0;
  objc_opt_class();
  BOOL v8 = [(RecentsCollectionViewCellAccessibility *)self safeValueForKey:@"trailingAccessoryView"];
  v9 = __UIAccessibilityCastAsClass();

  if (v31) {
    abort();
  }
  if (v9)
  {
    id v10 = objc_alloc(MEMORY[0x263F1C390]);
    v11 = [v9 accessibilityLabel];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __68__RecentsCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke_3;
    v27[3] = &unk_265119E98;
    id v28 = v9;
    v12 = (void *)[v10 initWithName:v11 actionHandler:v27];

    [v7 addObject:v12];
  }
  v13 = [(RecentsCollectionViewCellAccessibility *)self safeSwiftValueForKey:@"listItemViewHelper"];
  v14 = [v13 safeSwiftValueForKey:@"messageIndicatorView"];
  v15 = v14;
  if (v14)
  {
    v16 = [v14 safeSwiftValueForKey:@"titleLabel"];
    v17 = [v16 accessibilityLabel];

    id v18 = objc_alloc(MEMORY[0x263F1C390]);
    v19 = NSString;
    v20 = accessibilityLocalizedString(@"play.message");
    v21 = objc_msgSend(v19, "stringWithFormat:", v20, v17);
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __68__RecentsCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke_4;
    v25[3] = &unk_265119E98;
    id v26 = v15;
    v22 = (void *)[v18 initWithName:v21 actionHandler:v25];

    [v7 addObject:v22];
  }
  id v23 = v7;

  return v23;
}

void __68__RecentsCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = __UIAccessibilityCastAsClass();
  char v15 = 0;
  objc_opt_class();
  v5 = [v4 customView];
  int v6 = __UIAccessibilityCastAsClass();

  if (v6)
  {
    [v6 setIsAccessibilityElement:0];
    id v7 = objc_alloc(MEMORY[0x263F1C390]);
    BOOL v8 = [v6 accessibilityLabel];
    uint64_t v10 = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    v12 = __68__RecentsCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke_2;
    v13 = &unk_265119E98;
    id v14 = v6;
    v9 = (void *)[v7 initWithName:v8 actionHandler:&v10];

    objc_msgSend(*(id *)(a1 + 32), "addObject:", v9, v10, v11, v12, v13);
  }
}

uint64_t __68__RecentsCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  return 1;
}

uint64_t __68__RecentsCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke_3(uint64_t a1)
{
  return 1;
}

uint64_t __68__RecentsCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke_4(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  AXPerformSafeBlock();

  return 1;
}

uint64_t __68__RecentsCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleTapGesture];
}

@end