@interface PKCreditBalanceAndPaymentPresenterAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_configurePaymentDueCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 forIndexPath:(id)a6;
@end

@implementation PKCreditBalanceAndPaymentPresenterAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKCreditBalanceAndPaymentPresenter";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKDashboardCreditAccountItem", @"account", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKDashboardCreditAccountItem", @"mostRecentTransactions", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKDashboardCreditAccountItem", @"pendingPayments", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKDashboardCreditAccountItem", @"upcomingScheduledPayments", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKCreditBalanceAndPaymentPresenter", @"_configurePaymentDueCell:forItem:inCollectionView:forIndexPath:", "v", "@", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"PKCreditAccountController", @"paymentEducationStateForAccount:mostRecentTransactions:pendingPayments:upcomingScheduledPayments:", "Q", "@", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKCreditPaymentDueCell", @"payButtonImage", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKCreditPaymentDueCell", @"payButton", "@", 0);
}

- (void)_configurePaymentDueCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 forIndexPath:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)PKCreditBalanceAndPaymentPresenterAccessibility;
  [(PKCreditBalanceAndPaymentPresenterAccessibility *)&v25 _configurePaymentDueCell:v10 forItem:v11 inCollectionView:v12 forIndexPath:v13];
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  uint64_t v20 = MEMORY[0x263EF8330];
  id v14 = v11;
  AXPerformSafeBlock();
  uint64_t v15 = v22[3];

  _Block_object_dispose(&v21, 8);
  v16 = objc_msgSend(v10, "safeValueForKey:", @"payButtonImage", v20, 3221225472, __114__PKCreditBalanceAndPaymentPresenterAccessibility__configurePaymentDueCell_forItem_inCollectionView_forIndexPath___block_invoke, &unk_265140F38);

  if (v16)
  {
    switch(v15)
    {
      case 0:
        v17 = @"more.info.button";
        goto LABEL_5;
      case 2:
      case 7:
      case 9:
        v17 = @"completed.button";
LABEL_5:
        v18 = accessibilityLocalizedString(v17);
        v19 = [v10 safeUIViewForKey:@"payButton"];
        [v19 setAccessibilityLabel:v18];

        break;
      default:
        break;
    }
  }
}

void __114__PKCreditBalanceAndPaymentPresenterAccessibility__configurePaymentDueCell_forItem_inCollectionView_forIndexPath___block_invoke(uint64_t a1)
{
  Class v2 = NSClassFromString(&cfstr_Pkcreditaccoun.isa);
  id v6 = [*(id *)(a1 + 32) safeValueForKey:@"account"];
  id v3 = [*(id *)(a1 + 32) safeValueForKey:@"mostRecentTransactions"];
  v4 = [*(id *)(a1 + 32) safeValueForKey:@"pendingPayments"];
  v5 = [*(id *)(a1 + 32) safeValueForKey:@"upcomingScheduledPayments"];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [(objc_class *)v2 paymentEducationStateForAccount:v6 mostRecentTransactions:v3 pendingPayments:v4 upcomingScheduledPayments:v5];
}

@end