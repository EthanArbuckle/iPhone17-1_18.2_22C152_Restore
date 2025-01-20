@interface FASharedSubscriptionsViewController
- (BOOL)_hasActiveCell;
- (FASharedSubscriptionsViewController)initWithAppleAccount:(id)a3 sharedSubscriptionSpecifierProvider:(id)a4;
- (id)_sharedSubscriptionSpecifiers;
- (id)preferredContentSizeCategory;
- (id)specifiers;
- (void)_performEventWithContext:(id)a3 specifier:(id)a4 completion:(id)a5;
- (void)_startSpinnerInCellLoadingRemoteUI:(id)a3;
- (void)_stopSpinnerInCellLoadingRemoteUI;
- (void)didSelectSpecifier:(id)a3;
- (void)reloadSpecifiersForProvider:(id)a3 oldSpecifiers:(id)a4 animated:(BOOL)a5;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation FASharedSubscriptionsViewController

- (FASharedSubscriptionsViewController)initWithAppleAccount:(id)a3 sharedSubscriptionSpecifierProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FASharedSubscriptionsViewController;
  v9 = [(ACUIViewController *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_appleAccount, a3);
    objc_storeStrong((id *)&v10->_sharedSubscriptionSpecifierProvider, a4);
    [(FASharedSubscriptionSpecifierProvider *)v10->_sharedSubscriptionSpecifierProvider addSubscriber:v10];
    v11 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    networkingQueue = v10->_networkingQueue;
    v10->_networkingQueue = v11;
  }
  return v10;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)FASharedSubscriptionsViewController;
  [(ACUIViewController *)&v4 viewDidLoad];
  v3 = [(FASharedSubscriptionsViewController *)self navigationItem];
  [v3 setLeftBarButtonItem:0];
  [v3 setRightBarButtonItem:0];
  [v3 setTitle:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)FASharedSubscriptionsViewController;
  [(FASharedSubscriptionsViewController *)&v4 viewWillAppear:a3];
  [(FASharedSubscriptionSpecifierProvider *)self->_sharedSubscriptionSpecifierProvider setSelectionHandler:self];
  [(FASharedSubscriptionsViewController *)self reloadSpecifiers];
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = [(FASharedSubscriptionsViewController *)self _sharedSubscriptionSpecifiers];
    v6 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = v5;

    objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (id)_sharedSubscriptionSpecifiers
{
  return [(FASharedSubscriptionSpecifierProvider *)self->_sharedSubscriptionSpecifierProvider subscriptionSpecifiers];
}

- (void)_performEventWithContext:(id)a3 specifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    v11 = [v9 propertyForKey:*MEMORY[0x263F602B0]];
    [(FASharedSubscriptionsViewController *)self _startSpinnerInCellLoadingRemoteUI:v11];
  }
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__7;
  v27 = __Block_byref_object_dispose__7;
  v12 = [FACircleStateController alloc];
  v13 = [(FASharedSubscriptionsViewController *)self navigationController];
  v28 = [(FACircleStateController *)v12 initWithPresenter:v13];

  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __85__FASharedSubscriptionsViewController__performEventWithContext_specifier_completion___block_invoke;
  v22[3] = &unk_2643489F8;
  v22[4] = self;
  [(id)v24[5] setPresentationHandler:v22];
  objc_super v14 = (void *)v24[5];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __85__FASharedSubscriptionsViewController__performEventWithContext_specifier_completion___block_invoke_2;
  v17[3] = &unk_26434A330;
  id v15 = v8;
  v21 = &v23;
  id v18 = v15;
  v19 = self;
  id v16 = v10;
  id v20 = v16;
  [v14 performOperationWithContext:v15 completion:v17];

  _Block_object_dispose(&v23, 8);
}

uint64_t __85__FASharedSubscriptionsViewController__performEventWithContext_specifier_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopSpinnerInCellLoadingRemoteUI];
}

void __85__FASharedSubscriptionsViewController__performEventWithContext_specifier_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = _FALogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [*(id *)(a1 + 32) eventType];
    id v8 = @"NO";
    int v12 = 138412802;
    v13 = v7;
    __int16 v14 = 2112;
    if (a2) {
      id v8 = @"YES";
    }
    id v15 = v8;
    __int16 v16 = 2112;
    id v17 = v5;
    _os_log_impl(&dword_2189F0000, v6, OS_LOG_TYPE_DEFAULT, "Event type %@ - completed with success: %@, error: %@", (uint8_t *)&v12, 0x20u);
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = 0;

  [*(id *)(a1 + 40) _stopSpinnerInCellLoadingRemoteUI];
  uint64_t v11 = *(void *)(a1 + 48);
  if (v11) {
    (*(void (**)(uint64_t, uint64_t, id))(v11 + 16))(v11, a2, v5);
  }
}

- (void)_startSpinnerInCellLoadingRemoteUI:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    p_activeCell = &self->_activeCell;
    id v8 = v5;
    objc_storeStrong((id *)p_activeCell, a3);
    id v7 = (void *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
    [v7 startAnimating];
    [(UITableViewCell *)*p_activeCell setAccessoryView:v7];

    id v5 = v8;
  }
}

- (void)_stopSpinnerInCellLoadingRemoteUI
{
  activeCell = self->_activeCell;
  if (activeCell)
  {
    [(UITableViewCell *)activeCell setAccessoryView:0];
    objc_super v4 = self->_activeCell;
    self->_activeCell = 0;
  }
}

- (BOOL)_hasActiveCell
{
  return self->_activeCell != 0;
}

- (void)reloadSpecifiersForProvider:(id)a3 oldSpecifiers:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v10 = a3;
  id v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v10 subscriptionSpecifiers];
    [(FASharedSubscriptionsViewController *)self replaceContiguousSpecifiers:v8 withSpecifiers:v9 animated:v5];
  }
}

- (void)didSelectSpecifier:(id)a3
{
  id v4 = a3;
  if (![(FASharedSubscriptionsViewController *)self _hasActiveCell])
  {
    BOOL v5 = [v4 propertyForKey:@"FASharedServicesSpecifierActionURLKey"];
    if (v5)
    {
      v6 = [[FACircleContext alloc] initWithEventType:@"FACircleEventTypeSharedService"];
      [(FACircleContext *)v6 setUrlForContext:v5];
      id v7 = [v4 propertyForKey:@"FASharedServicesAdditionalParameters"];
      if (v7) {
        [(FACircleContext *)v6 setAdditionalParameters:v7];
      }
      [(FASharedSubscriptionsViewController *)self _performEventWithContext:v6 specifier:v4 completion:0];
    }
    else
    {
      id v8 = _FALogSystem();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v9 = 0;
        _os_log_impl(&dword_2189F0000, v8, OS_LOG_TYPE_DEFAULT, "Shared services specifier selected, no url present. We are bailing.", v9, 2u);
      }
    }
  }
}

- (id)preferredContentSizeCategory
{
  v2 = [(FASharedSubscriptionsViewController *)self traitCollection];
  uint64_t v3 = [v2 preferredContentSizeCategory];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_sharedSubscriptionSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_activeCell, 0);
  objc_storeStrong((id *)&self->_networkingQueue, 0);
  objc_storeStrong((id *)&self->_appleAccount, 0);
}

@end