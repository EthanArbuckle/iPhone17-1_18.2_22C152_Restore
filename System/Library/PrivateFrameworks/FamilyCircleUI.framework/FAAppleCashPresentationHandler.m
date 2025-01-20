@interface FAAppleCashPresentationHandler
- (FAAppleCashPresentationHandler)initWithNavigationController:(id)a3;
- (PKPassbookSettingsDefaultBehavior)defaultBehavior;
- (PKPaymentPassDetailViewController)passDetailsViewController;
- (PKPeerPaymentAssociatedAccountPresentationContext)context;
- (PKPeerPaymentAssociatedAccountsController)peerPaymentController;
- (UINavigationController)navigationController;
- (id)peerPaymentPassForAccount:(id)a3 passLibraryDataProvider:(id)a4;
- (void)presentPaymentPassDetailViewController;
- (void)presentPeerPaymentControllerWithAttributes:(id)a3 completion:(id)a4;
- (void)presentPeerPaymentControllerWithFamilyCircle:(id)a3 member:(id)a4 attributes:(id)a5;
- (void)setContext:(id)a3;
- (void)setDefaultBehavior:(id)a3;
- (void)setNavigationController:(id)a3;
- (void)setPassDetailsViewController:(id)a3;
- (void)setPeerPaymentController:(id)a3;
@end

@implementation FAAppleCashPresentationHandler

- (FAAppleCashPresentationHandler)initWithNavigationController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FAAppleCashPresentationHandler;
  v6 = [(FAAppleCashPresentationHandler *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_navigationController, a3);
  }

  return v7;
}

- (void)presentPeerPaymentControllerWithAttributes:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263F3BF48]);
  [v8 setQualityOfService:33];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __88__FAAppleCashPresentationHandler_presentPeerPaymentControllerWithAttributes_completion___block_invoke;
  v11[3] = &unk_2643497E0;
  v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v6;
  id v10 = v7;
  [v8 startRequestWithCompletionHandler:v11];
}

void __88__FAAppleCashPresentationHandler_presentPeerPaymentControllerWithAttributes_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = _FALogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __88__FAAppleCashPresentationHandler_presentPeerPaymentControllerWithAttributes_completion___block_invoke_cold_1((uint64_t)v6, v7);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __88__FAAppleCashPresentationHandler_presentPeerPaymentControllerWithAttributes_completion___block_invoke_31;
    v11[3] = &unk_2643493F0;
    id v12 = *(id *)(a1 + 32);
    id v8 = v5;
    uint64_t v9 = *(void *)(a1 + 40);
    id v10 = *(void **)(a1 + 48);
    id v13 = v8;
    uint64_t v14 = v9;
    id v15 = v10;
    dispatch_async(MEMORY[0x263EF83A0], v11);
  }
}

void __88__FAAppleCashPresentationHandler_presentPeerPaymentControllerWithAttributes_completion___block_invoke_31(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"altdsid"];
  v4 = [*(id *)(v2 + 8) memberForAltDSID:v3];
  id v5 = _FALogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __88__FAAppleCashPresentationHandler_presentPeerPaymentControllerWithAttributes_completion___block_invoke_31_cold_1((uint64_t)v4, (uint64_t *)v2, v5);
  }

  [*(id *)(a1 + 48) presentPeerPaymentControllerWithFamilyCircle:*(void *)(a1 + 40) member:v4 attributes:*(void *)(a1 + 32)];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)presentPeerPaymentControllerWithFamilyCircle:(id)a3 member:(id)a4 attributes:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2050000000;
  v11 = (void *)getPKPeerPaymentAssociatedAccountsControllerClass_softClass;
  uint64_t v30 = getPKPeerPaymentAssociatedAccountsControllerClass_softClass;
  if (!getPKPeerPaymentAssociatedAccountsControllerClass_softClass)
  {
    uint64_t v22 = MEMORY[0x263EF8330];
    uint64_t v23 = 3221225472;
    v24 = __getPKPeerPaymentAssociatedAccountsControllerClass_block_invoke;
    v25 = &unk_264348998;
    v26 = &v27;
    __getPKPeerPaymentAssociatedAccountsControllerClass_block_invoke((uint64_t)&v22);
    v11 = (void *)v28[3];
  }
  id v12 = v11;
  _Block_object_dispose(&v27, 8);
  id v13 = [v12 alloc];
  uint64_t v14 = [v8 members];
  id v15 = (void *)[v13 initWithFamilyMembers:v14];
  [(FAAppleCashPresentationHandler *)self setPeerPaymentController:v15];

  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2050000000;
  v16 = (void *)getPKPeerPaymentAssociatedAccountPresentationContextClass_softClass;
  uint64_t v30 = getPKPeerPaymentAssociatedAccountPresentationContextClass_softClass;
  if (!getPKPeerPaymentAssociatedAccountPresentationContextClass_softClass)
  {
    uint64_t v22 = MEMORY[0x263EF8330];
    uint64_t v23 = 3221225472;
    v24 = __getPKPeerPaymentAssociatedAccountPresentationContextClass_block_invoke;
    v25 = &unk_264348998;
    v26 = &v27;
    __getPKPeerPaymentAssociatedAccountPresentationContextClass_block_invoke((uint64_t)&v22);
    v16 = (void *)v28[3];
  }
  v17 = v16;
  _Block_object_dispose(&v27, 8);
  v18 = (void *)[[v17 alloc] initWithFAFamilyMember:v9 options:v10];
  [(FAAppleCashPresentationHandler *)self setContext:v18];

  v19 = [(FAAppleCashPresentationHandler *)self peerPaymentController];
  v20 = [(FAAppleCashPresentationHandler *)self context];
  v21 = [(FAAppleCashPresentationHandler *)self navigationController];
  [v19 presentAssociatedAccountsFlowWithPresentationContext:v20 fromNavigationController:v21];
}

- (void)presentPaymentPassDetailViewController
{
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2050000000;
  v3 = (void *)getPKPassbookSettingsDefaultBehaviorClass_softClass;
  uint64_t v34 = getPKPassbookSettingsDefaultBehaviorClass_softClass;
  if (!getPKPassbookSettingsDefaultBehaviorClass_softClass)
  {
    uint64_t v26 = MEMORY[0x263EF8330];
    uint64_t v27 = 3221225472;
    v28 = __getPKPassbookSettingsDefaultBehaviorClass_block_invoke;
    uint64_t v29 = &unk_264348998;
    uint64_t v30 = &v31;
    __getPKPassbookSettingsDefaultBehaviorClass_block_invoke((uint64_t)&v26);
    v3 = (void *)v32[3];
  }
  v4 = v3;
  _Block_object_dispose(&v31, 8);
  id v5 = objc_alloc_init(v4);
  [(FAAppleCashPresentationHandler *)self setDefaultBehavior:v5];

  id v6 = [MEMORY[0x263F5C168] sharedInstance];
  uint64_t v7 = [v6 account];

  id v8 = [(FAAppleCashPresentationHandler *)self defaultBehavior];
  id v9 = [v8 passLibraryDataProvider];
  v25 = (void *)v7;
  v24 = [(FAAppleCashPresentationHandler *)self peerPaymentPassForAccount:v7 passLibraryDataProvider:v9];

  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2050000000;
  id v10 = (void *)getPKPaymentPassDetailViewControllerClass_softClass;
  uint64_t v34 = getPKPaymentPassDetailViewControllerClass_softClass;
  if (!getPKPaymentPassDetailViewControllerClass_softClass)
  {
    uint64_t v26 = MEMORY[0x263EF8330];
    uint64_t v27 = 3221225472;
    v28 = __getPKPaymentPassDetailViewControllerClass_block_invoke;
    uint64_t v29 = &unk_264348998;
    uint64_t v30 = &v31;
    __getPKPaymentPassDetailViewControllerClass_block_invoke((uint64_t)&v26);
    id v10 = (void *)v32[3];
  }
  v11 = v10;
  _Block_object_dispose(&v31, 8);
  id v12 = [v11 alloc];
  id v13 = [MEMORY[0x263F5C128] sharedService];
  uint64_t v23 = [(FAAppleCashPresentationHandler *)self defaultBehavior];
  uint64_t v14 = [v23 peerPaymentDataSource];
  id v15 = [v14 peerPaymentWebService];
  v16 = [(FAAppleCashPresentationHandler *)self defaultBehavior];
  v17 = [v16 passLibraryDataProvider];
  v18 = [(FAAppleCashPresentationHandler *)self defaultBehavior];
  v19 = [v18 paymentDataProvider];
  v20 = (void *)[v12 initWithPass:v24 group:0 groupsController:0 webService:v13 peerPaymentWebService:v15 style:1 passLibraryDataProvider:v17 paymentServiceDataProvider:v19];
  [(FAAppleCashPresentationHandler *)self setPassDetailsViewController:v20];

  v21 = [(FAAppleCashPresentationHandler *)self navigationController];
  uint64_t v22 = [(FAAppleCashPresentationHandler *)self passDetailsViewController];
  [v21 pushViewController:v22 animated:1];
}

- (id)peerPaymentPassForAccount:(id)a3 passLibraryDataProvider:(id)a4
{
  id v5 = a4;
  id v6 = [a3 associatedPassUniqueID];
  uint64_t v7 = [v5 passWithUniqueID:v6];

  id v8 = [v7 paymentPass];

  return v8;
}

- (PKPeerPaymentAssociatedAccountsController)peerPaymentController
{
  return self->_peerPaymentController;
}

- (void)setPeerPaymentController:(id)a3
{
}

- (PKPeerPaymentAssociatedAccountPresentationContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
}

- (PKPaymentPassDetailViewController)passDetailsViewController
{
  return self->_passDetailsViewController;
}

- (void)setPassDetailsViewController:(id)a3
{
}

- (PKPassbookSettingsDefaultBehavior)defaultBehavior
{
  return self->_defaultBehavior;
}

- (void)setDefaultBehavior:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultBehavior, 0);
  objc_storeStrong((id *)&self->_passDetailsViewController, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_peerPaymentController, 0);
}

void __88__FAAppleCashPresentationHandler_presentPeerPaymentControllerWithAttributes_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  v3 = "-[FAAppleCashPresentationHandler presentPeerPaymentControllerWithAttributes:completion:]_block_invoke";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_2189F0000, a2, OS_LOG_TYPE_ERROR, "Error %s - %@", (uint8_t *)&v2, 0x16u);
}

void __88__FAAppleCashPresentationHandler_presentPeerPaymentControllerWithAttributes_completion___block_invoke_31_cold_1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a2;
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_debug_impl(&dword_2189F0000, log, OS_LOG_TYPE_DEBUG, "Launching member %@ with attributes %@", (uint8_t *)&v4, 0x16u);
}

@end