@interface HUQuickControlSimpleItemUpdater
- (HFSimpleItemManager)itemManager;
- (HUQuickControlItemHosting)itemHost;
- (HUQuickControlSimpleItemUpdater)init;
- (HUQuickControlSimpleItemUpdater)initWithItemHost:(id)a3;
- (void)_setExternalItemManagerUpdatesDisabled:(BOOL)a3;
- (void)itemManager:(id)a3 performUpdateRequest:(id)a4;
- (void)quickControlItemHost:(id)a3 didUpdateVisibility:(BOOL)a4;
@end

@implementation HUQuickControlSimpleItemUpdater

- (HUQuickControlSimpleItemUpdater)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = NSStringFromSelector(sel_initWithItemHost_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUQuickControlItemUpdating.m", 19, @"%s is unavailable; use %@ instead",
    "-[HUQuickControlSimpleItemUpdater init]",
    v5);

  return 0;
}

- (HUQuickControlSimpleItemUpdater)initWithItemHost:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HUQuickControlSimpleItemUpdater;
  v5 = [(HUQuickControlSimpleItemUpdater *)&v17 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_itemHost, v4);
    objc_initWeak(&location, v6);
    id v7 = objc_alloc(MEMORY[0x1E4F69590]);
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    v13 = __52__HUQuickControlSimpleItemUpdater_initWithItemHost___block_invoke;
    v14 = &unk_1E63926B8;
    objc_copyWeak(&v15, &location);
    uint64_t v8 = [v7 initWithDelegate:v6 itemProvidersCreator:&v11];
    itemManager = v6->_itemManager;
    v6->_itemManager = (HFSimpleItemManager *)v8;

    -[HFSimpleItemManager setShouldDisableOptionalDataDuringFastInitialUpdate:](v6->_itemManager, "setShouldDisableOptionalDataDuringFastInitialUpdate:", 0, v11, v12, v13, v14);
    [(HUQuickControlSimpleItemUpdater *)v6 _setExternalItemManagerUpdatesDisabled:1];
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v6;
}

id __52__HUQuickControlSimpleItemUpdater_initWithItemHost___block_invoke(uint64_t a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F695C8]);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = [WeakRetained itemHost];
  v5 = [v4 controlItems];
  v6 = (void *)[v2 initWithItems:v5];
  v9[0] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];

  return v7;
}

- (void)_setExternalItemManagerUpdatesDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(HUQuickControlSimpleItemUpdater *)self itemManager];
  id v5 = v4;
  if (v3) {
    [v4 disableExternalUpdatesWithReason:@"HUQuickControlSimpleItemUpdater_NotVisible"];
  }
  else {
    [v4 endDisableExternalUpdatesWithReason:@"HUQuickControlSimpleItemUpdater_NotVisible"];
  }
}

- (void)itemManager:(id)a3 performUpdateRequest:(id)a4
{
  id v5 = a4;
  v6 = [v5 changes];
  id v7 = [v6 itemOperations];
  objc_msgSend(v7, "na_map:", &__block_literal_global_295);
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v8 = [(HUQuickControlSimpleItemUpdater *)self itemHost];
  v9 = [MEMORY[0x1E4F1CAD0] setWithArray:v10];
  [v8 quickControlItemUpdater:self didUpdateResultsForControlItems:v9];

  [v5 performWithOptions:1];
}

id __68__HUQuickControlSimpleItemUpdater_itemManager_performUpdateRequest___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ((unint64_t)[v2 type] > 1)
  {
    BOOL v3 = 0;
  }
  else
  {
    BOOL v3 = [v2 item];
  }

  return v3;
}

- (void)quickControlItemHost:(id)a3 didUpdateVisibility:(BOOL)a4
{
}

- (HUQuickControlItemHosting)itemHost
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_itemHost);

  return (HUQuickControlItemHosting *)WeakRetained;
}

- (HFSimpleItemManager)itemManager
{
  return self->_itemManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemManager, 0);

  objc_destroyWeak((id *)&self->_itemHost);
}

@end