@interface CNComposeRecipientTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)actionButtonTapped;
@end

@implementation CNComposeRecipientTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CNComposeRecipientTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNComposeRecipientTableViewCell", @"actionType", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNComposeRecipientTableViewCell", @"actionButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNComposeRecipientTableViewCell", @"actionButtonTapped", "v", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v11.receiver = self;
  v11.super_class = (Class)CNComposeRecipientTableViewCellAccessibility;
  [(CNComposeRecipientTableViewCellAccessibility *)&v11 _accessibilityLoadAccessibilityInformation];
  switch([(CNComposeRecipientTableViewCellAccessibility *)self safeUnsignedIntegerForKey:@"actionType"])
  {
    case 1:
      id v3 = @"info.button.label";
      goto LABEL_6;
    case 2:
      id v3 = @"collapsed.button.label";
      goto LABEL_6;
    case 3:
      id v3 = @"expanded.button.label";
LABEL_6:
      uint64_t v5 = accessibilityLocalizedString(v3);
      goto LABEL_8;
    case 4:
      uint64_t v5 = accessibilityLocalizedStringStewie(@"stewie.button.label");
LABEL_8:
      v4 = (void *)v5;
      break;
    default:
      v4 = 0;
      break;
  }
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __90__CNComposeRecipientTableViewCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v7[3] = &unk_2651177F8;
  id v6 = v4;
  id v8 = v6;
  objc_copyWeak(&v9, &location);
  [(CNComposeRecipientTableViewCellAccessibility *)self setAccessibilityCustomActionsBlock:v7];
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
}

id __90__CNComposeRecipientTableViewCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  v9[1] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(MEMORY[0x263F1C390]);
  uint64_t v3 = *(void *)(a1 + 32);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __90__CNComposeRecipientTableViewCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v7[3] = &unk_2651177D0;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v4 = (void *)[v2 initWithName:v3 actionHandler:v7];
  v9[0] = v4;
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];

  objc_destroyWeak(&v8);

  return v5;
}

uint64_t __90__CNComposeRecipientTableViewCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  AXPerformSafeBlock();
  objc_destroyWeak(&v5);

  return 1;
}

void __90__CNComposeRecipientTableViewCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained actionButtonTapped];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)CNComposeRecipientTableViewCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(CNComposeRecipientTableViewCellAccessibility *)&v3 accessibilityTraits];
}

- (void)actionButtonTapped
{
  v3.receiver = self;
  v3.super_class = (Class)CNComposeRecipientTableViewCellAccessibility;
  [(CNComposeRecipientTableViewCellAccessibility *)&v3 actionButtonTapped];
  [(CNComposeRecipientTableViewCellAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end