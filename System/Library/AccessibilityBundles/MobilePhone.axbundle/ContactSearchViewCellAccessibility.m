@interface ContactSearchViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityCustomActions;
- (id)accessibilityElements;
- (id)automationElements;
@end

@implementation ContactSearchViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MobilePhone.ContactSearchViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MobilePhone.ContactSearchViewCell" hasSwiftField:@"titleLabel" withSwiftType:"UILabel"];
  [v3 validateClass:@"MobilePhone.ContactSearchViewCell" hasSwiftField:@"detailLabel" withSwiftType:"UILabel"];
  [v3 validateClass:@"MobilePhone.ContactSearchViewCell" hasSwiftField:@"callButton" withSwiftType:"TPAccessoryButton"];
  [v3 validateClass:@"MobilePhone.ContactSearchViewCell" hasSwiftField:@"videoButton" withSwiftType:"TPAccessoryButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MobilePhone.ContactSearchViewCell", @"callButtonTapped", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MobilePhone.ContactSearchViewCell", @"videoButtonTapped", "v", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityElements
{
  id v3 = (void *)MEMORY[0x263EFF8C0];
  v4 = [(ContactSearchViewCellAccessibility *)self safeSwiftValueForKey:@"titleLabel"];
  v5 = [(ContactSearchViewCellAccessibility *)self safeSwiftValueForKey:@"detailLabel"];
  v6 = objc_msgSend(v3, "axArrayByIgnoringNilElementsWithCount:", 2, v4, v5);

  return v6;
}

- (id)automationElements
{
  v4.receiver = self;
  v4.super_class = (Class)ContactSearchViewCellAccessibility;
  v2 = [(ContactSearchViewCellAccessibility *)&v4 accessibilityElements];

  return v2;
}

- (id)accessibilityCustomActions
{
  objc_opt_class();
  id v3 = [(ContactSearchViewCellAccessibility *)self safeSwiftValueForKey:@"videoButton"];
  objc_super v4 = __UIAccessibilityCastAsClass();

  LOBYTE(location) = 0;
  objc_opt_class();
  v5 = [(ContactSearchViewCellAccessibility *)self safeSwiftValueForKey:@"callButton"];
  v6 = __UIAccessibilityCastAsClass();

  objc_initWeak(&location, self);
  if ([v4 isHidden])
  {
    id v7 = objc_alloc(MEMORY[0x263F1C390]);
    v8 = accessibilityLocalizedString(@"call.button");
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __64__ContactSearchViewCellAccessibility_accessibilityCustomActions__block_invoke;
    v17[3] = &unk_265134E08;
    v9 = &v18;
    objc_copyWeak(&v18, &location);
    uint64_t v10 = [v7 initWithName:v8 actionHandler:v17];
  }
  else
  {
    id v11 = objc_alloc(MEMORY[0x263F1C390]);
    v8 = accessibilityLocalizedString(@"video.call.button");
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __64__ContactSearchViewCellAccessibility_accessibilityCustomActions__block_invoke_3;
    v15[3] = &unk_265134E08;
    v9 = &v16;
    objc_copyWeak(&v16, &location);
    uint64_t v10 = [v11 initWithName:v8 actionHandler:v15];
  }
  v12 = (void *)v10;

  objc_destroyWeak(v9);
  v13 = objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 1, v12);
  objc_destroyWeak(&location);

  return v13;
}

uint64_t __64__ContactSearchViewCellAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  AXPerformSafeBlock();
  objc_destroyWeak(&v5);

  return 1;
}

void __64__ContactSearchViewCellAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained callButtonTapped];
}

uint64_t __64__ContactSearchViewCellAccessibility_accessibilityCustomActions__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  AXPerformSafeBlock();
  objc_destroyWeak(&v5);

  return 1;
}

void __64__ContactSearchViewCellAccessibility_accessibilityCustomActions__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained videoButtonTapped];
}

@end