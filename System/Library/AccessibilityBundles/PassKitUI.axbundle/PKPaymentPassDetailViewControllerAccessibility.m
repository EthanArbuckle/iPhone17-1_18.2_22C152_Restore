@interface PKPaymentPassDetailViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_infoCellWithDescription:(id)a3 forTableView:(id)a4;
- (id)_linkCellWithText:(id)a3 forTableView:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (unint64_t)_cardInfoSectionGenerateCellWithOutput:(id *)a3 forRowIndex:(int64_t)a4 tableView:(id)a5;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axLabelIssuerLogo;
- (void)_axLoadAccessibilityInformationForCell:(id)a3 atIndexPath:(id)a4;
- (void)_axSetSanitizedLabelForCell:(id)a3;
- (void)viewDidLayoutSubviews;
@end

@implementation PKPaymentPassDetailViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKPaymentPassDetailViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PKPaymentPassDetailViewController" isKindOfClass:@"PKDynamicTableViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPassField", @"value", "@", 0);
  [v3 validateClass:@"PKPaymentPassDetailViewController" hasInstanceVariable:@"_logoView" withType:"UIImageView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKDynamicTableViewController", @"indexOfSectionIdentifier:", "q", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPaymentPassDetailViewController", @"_cardInfoSectionGenerateCellWithOutput:forRowIndex:tableView:", "Q", "^@", "q", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPaymentPassDetailViewController", @"_linkCellWithText:forTableView:", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPaymentPassDetailViewController", @"_infoCellWithDescription:forTableView:", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPaymentPassDetailViewController", @"viewDidLayoutSubviews", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKSectionTableViewController", @"shouldMapSection:", "B", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPass", @"fieldForKey:", "@", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentPassDetailViewControllerAccessibility;
  [(PKPaymentPassDetailViewControllerAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(PKPaymentPassDetailViewControllerAccessibility *)self _axLabelIssuerLogo];
}

- (void)_axLoadAccessibilityInformationForCell:(id)a3 atIndexPath:(id)a4
{
  id v5 = a3;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v10[3] = 0;
  id v9 = a4;
  AXPerformSafeBlock();

  _Block_object_dispose(v10, 8);
  v8 = v5;
  id v6 = v5;
  id v7 = v9;
  AXPerformSafeBlock();
}

void __101__PKPaymentPassDetailViewControllerAccessibility__axLoadAccessibilityInformationForCell_atIndexPath___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "section"));
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_super v3 = [v4 stringValue];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 indexOfSectionIdentifier:v3];
}

void __101__PKPaymentPassDetailViewControllerAccessibility__axLoadAccessibilityInformationForCell_atIndexPath___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  if (v2 == 33)
  {
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x2020000000;
    char v20 = 0;
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    v13 = __101__PKPaymentPassDetailViewControllerAccessibility__axLoadAccessibilityInformationForCell_atIndexPath___block_invoke_3;
    v14 = &unk_265140F38;
    uint64_t v15 = *(void *)(a1 + 32);
    v16 = &v17;
    AXPerformSafeBlock();
    int v3 = *((unsigned __int8 *)v18 + 24);
    _Block_object_dispose(&v17, 8);
    if (v3)
    {
      if ([*(id *)(a1 + 40) row] != 1) {
        return;
      }
LABEL_8:
      objc_msgSend(*(id *)(a1 + 32), "_axSetSanitizedLabelForCell:", *(void *)(a1 + 48), v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16);
      return;
    }
    uint64_t v2 = *(void *)(a1 + 56);
  }
  if (v2 == 34)
  {
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x2020000000;
    char v20 = 0;
    uint64_t v5 = MEMORY[0x263EF8330];
    uint64_t v6 = 3221225472;
    id v7 = __101__PKPaymentPassDetailViewControllerAccessibility__axLoadAccessibilityInformationForCell_atIndexPath___block_invoke_4;
    v8 = &unk_265140F38;
    uint64_t v9 = *(void *)(a1 + 32);
    v10 = &v17;
    AXPerformSafeBlock();
    int v4 = *((unsigned __int8 *)v18 + 24);
    _Block_object_dispose(&v17, 8);
    if (v4) {
      goto LABEL_8;
    }
  }
}

uint64_t __101__PKPaymentPassDetailViewControllerAccessibility__axLoadAccessibilityInformationForCell_atIndexPath___block_invoke_3(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) shouldMapSection:33];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __101__PKPaymentPassDetailViewControllerAccessibility__axLoadAccessibilityInformationForCell_atIndexPath___block_invoke_4(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) shouldMapSection:34];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)_axLabelIssuerLogo
{
  int v3 = accessibilityLocalizedString(@"issue.name.image");
  int v4 = [(PKPaymentPassDetailViewControllerAccessibility *)self safeUIViewForKey:@"_logoView"];
  [v4 setAccessibilityLabel:v3];

  id v5 = [(PKPaymentPassDetailViewControllerAccessibility *)self safeUIViewForKey:@"_logoView"];
  [v5 setIsAccessibilityElement:1];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentPassDetailViewControllerAccessibility;
  [(PKPaymentPassDetailViewControllerAccessibility *)&v3 viewDidLayoutSubviews];
  [(PKPaymentPassDetailViewControllerAccessibility *)self _axLabelIssuerLogo];
}

- (id)_linkCellWithText:(id)a3 forTableView:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)PKPaymentPassDetailViewControllerAccessibility;
  int v4 = [(PKPaymentPassDetailViewControllerAccessibility *)&v6 _linkCellWithText:a3 forTableView:a4];
  [v4 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];

  return v4;
}

- (unint64_t)_cardInfoSectionGenerateCellWithOutput:(id *)a3 forRowIndex:(int64_t)a4 tableView:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)PKPaymentPassDetailViewControllerAccessibility;
  id v8 = [(PKPaymentPassDetailViewControllerAccessibility *)&v10 _cardInfoSectionGenerateCellWithOutput:a3 forRowIndex:a4 tableView:a5];
  if (a3 && !a4) {
    [(PKPaymentPassDetailViewControllerAccessibility *)self _axSetSanitizedLabelForCell:*a3];
  }
  return (unint64_t)v8;
}

- (id)_infoCellWithDescription:(id)a3 forTableView:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PKPaymentPassDetailViewControllerAccessibility;
  int v4 = [(PKPaymentPassDetailViewControllerAccessibility *)&v7 _infoCellWithDescription:a3 forTableView:a4];
  uint64_t v5 = [v4 accessibilityTraits];
  [v4 setAccessibilityTraits:v5 & ~*MEMORY[0x263F1CEE8]];

  return v4;
}

- (void)_axSetSanitizedLabelForCell:(id)a3
{
  id v3 = a3;
  NSClassFromString(&cfstr_Pkstackedlabel.isa);
  if (objc_opt_isKindOfClass()) {
    [v3 safeValueForKey:@"_detailLabel"];
  }
  else {
  int v4 = [v3 detailTextLabel];
  }

  uint64_t v5 = [v4 safeStringForKey:@"text"];
  objc_super v6 = PKPANMask();
  int v7 = [v5 containsString:v6];

  if (v7)
  {
    id v8 = [v4 safeStringForKey:@"text"];
    uint64_t v9 = [MEMORY[0x263F08708] decimalDigitCharacterSet];
    objc_super v10 = [v9 invertedSet];
    uint64_t v11 = [v8 componentsSeparatedByCharactersInSet:v10];
    uint64_t v12 = [v11 componentsJoinedByString:&stru_26F75DA98];

    v13 = [MEMORY[0x263F08708] controlCharacterSet];
    v14 = [v12 stringByTrimmingCharactersInSet:v13];

    uint64_t v15 = (void *)MEMORY[0x263F21660];
    v16 = NSString;
    uint64_t v17 = accessibilityLocalizedString(@"ends.with");
    v18 = objc_msgSend(v16, "stringWithFormat:", v17, v14);
    uint64_t v19 = [v15 axAttributedStringWithString:v18];

    [v19 setAttribute:*MEMORY[0x263EFFB40] forKey:*MEMORY[0x263F21888]];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __78__PKPaymentPassDetailViewControllerAccessibility__axSetSanitizedLabelForCell___block_invoke;
    v21[3] = &unk_265141108;
    id v22 = v19;
    id v20 = v19;
    [v4 _setAccessibilityLabelBlock:v21];
  }
}

id __78__PKPaymentPassDetailViewControllerAccessibility__axSetSanitizedLabelForCell___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentPassDetailViewControllerAccessibility;
  id v6 = a4;
  int v7 = [(PKPaymentPassDetailViewControllerAccessibility *)&v9 tableView:a3 cellForRowAtIndexPath:v6];
  -[PKPaymentPassDetailViewControllerAccessibility _axLoadAccessibilityInformationForCell:atIndexPath:](self, "_axLoadAccessibilityInformationForCell:atIndexPath:", v7, v6, v9.receiver, v9.super_class);

  return v7;
}

@end