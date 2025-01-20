@interface PKPaymentTransactionDetailViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_tableView:(id)a3 actionButtonCellForSection:(unint64_t)a4;
- (id)_transactionIdentifierCellForTableView:(id)a3;
- (void)_handleTransactionHeaderTapRecognizer:(id)a3;
@end

@implementation PKPaymentTransactionDetailViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKPaymentTransactionDetailViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPaymentTransactionDetailViewController", @"_tableView:actionButtonCellForSection:", "@", "@", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPaymentTransactionDetailViewController", @"_transactionIdentifierCellForTableView:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPaymentTransactionDetailViewController", @"_handleTransactionHeaderTapRecognizer:", "v", "@", 0);
}

- (id)_transactionIdentifierCellForTableView:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentTransactionDetailViewControllerAccessibility;
  v5 = [(PKPaymentTransactionDetailViewControllerAccessibility *)&v11 _transactionIdentifierCellForTableView:v4];
  objc_initWeak(&location, v5);
  v6 = [v5 detailTextLabel];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __96__PKPaymentTransactionDetailViewControllerAccessibility__transactionIdentifierCellForTableView___block_invoke;
  v8[3] = &unk_265140E18;
  objc_copyWeak(&v9, &location);
  [v6 _setAccessibilityLabelBlock:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v5;
}

id __96__PKPaymentTransactionDetailViewControllerAccessibility__transactionIdentifierCellForTableView___block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F21660];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained detailTextLabel];
  id v4 = [v3 text];
  v5 = [v1 axAttributedStringWithString:v4];

  [v5 setAttribute:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F217C8]];

  return v5;
}

- (void)_handleTransactionHeaderTapRecognizer:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentTransactionDetailViewControllerAccessibility;
  [(PKPaymentTransactionDetailViewControllerAccessibility *)&v3 _handleTransactionHeaderTapRecognizer:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

- (id)_tableView:(id)a3 actionButtonCellForSection:(unint64_t)a4
{
  v6.receiver = self;
  v6.super_class = (Class)PKPaymentTransactionDetailViewControllerAccessibility;
  id v4 = [(PKPaymentTransactionDetailViewControllerAccessibility *)&v6 _tableView:a3 actionButtonCellForSection:a4];
  [v4 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];

  return v4;
}

@end