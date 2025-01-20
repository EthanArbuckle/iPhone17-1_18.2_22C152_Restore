@interface HUGuestsPinCodesItemManager
- (HFPinCodeListModule)guestsListModule;
- (HFPinCodeListModule)otherEcosystemListModule;
- (HFPinCodeManager)pinCodeManager;
- (HFUserItemProvider)userItemProvider;
- (HUGuestsPinCodesItemManager)initWithDelegate:(id)a3;
- (HUGuestsPinCodesItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4;
- (HUGuestsPinCodesItemManager)initWithPinCodeManager:(id)a3 delegate:(id)a4;
- (id)_buildItemModulesForHome:(id)a3;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (void)_registerForExternalUpdates;
- (void)_unregisterForExternalUpdates;
- (void)setGuestsListModule:(id)a3;
- (void)setOtherEcosystemListModule:(id)a3;
- (void)setPinCodeManager:(id)a3;
- (void)setUserItemProvider:(id)a3;
@end

@implementation HUGuestsPinCodesItemManager

- (HUGuestsPinCodesItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  v7 = NSStringFromSelector(sel_initWithPinCodeManager_delegate_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUGuestsPinCodesItemManager.m", 30, @"%s is unavailable; use %@ instead",
    "-[HUGuestsPinCodesItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (HUGuestsPinCodesItemManager)initWithDelegate:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_initWithPinCodeManager_delegate_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUGuestsPinCodesItemManager.m", 35, @"%s is unavailable; use %@ instead",
    "-[HUGuestsPinCodesItemManager initWithDelegate:]",
    v6);

  return 0;
}

- (HUGuestsPinCodesItemManager)initWithPinCodeManager:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUGuestsPinCodesItemManager;
  v8 = [(HFItemManager *)&v11 initWithDelegate:a4 sourceItem:0];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_pinCodeManager, a3);
  }

  return v9;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F69718]);
  v6 = [(HUGuestsPinCodesItemManager *)self pinCodeManager];
  id v7 = [v6 home];
  v8 = (void *)[v5 initWithHome:v7];
  [(HUGuestsPinCodesItemManager *)self setUserItemProvider:v8];

  v9 = [(HUGuestsPinCodesItemManager *)self userItemProvider];
  [v9 setIncludeGuestUsers:1];

  objc_initWeak(&location, self);
  uint64_t v14 = MEMORY[0x1E4F143A8];
  objc_copyWeak(&v15, &location);
  v10 = [(HUGuestsPinCodesItemManager *)self userItemProvider];
  [v10 setFilter:&v14];

  objc_super v11 = [(HUGuestsPinCodesItemManager *)self userItemProvider];
  v17[0] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v12;
}

uint64_t __58__HUGuestsPinCodesItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_opt_class();
  id v5 = v3;
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  v8 = [WeakRetained home];
  uint64_t v9 = objc_msgSend(v8, "hf_userIsRestrictedGuest:", v7);

  return v9;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = objc_opt_new();
    v6 = [(HUGuestsPinCodesItemManager *)self userItemProvider];
    id v7 = [v6 items];
    v8 = [v7 allObjects];
    [v5 addObjectsFromArray:v8];

    uint64_t v9 = [(HUGuestsPinCodesItemManager *)self guestsListModule];
    v10 = [v9 buildSectionsWithDisplayedItems:v4];

    objc_super v11 = objc_msgSend(v10, "na_flatMap:", &__block_literal_global_110);
    [v5 addObjectsFromArray:v11];

    v12 = [(HUGuestsPinCodesItemManager *)self otherEcosystemListModule];
    v13 = [v12 buildSectionsWithDisplayedItems:v4];

    uint64_t v14 = objc_msgSend(v13, "na_flatMap:", &__block_literal_global_13_0);
    [v5 addObjectsFromArray:v14];

    id v15 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUGuestsSections"];
    [v15 setItems:v5];
    v16 = (void *)MEMORY[0x1E4F69220];
    v20[0] = v15;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
    v18 = [v16 filterSections:v17 toDisplayedItems:v4];
  }
  else
  {
    v18 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v18;
}

uint64_t __64__HUGuestsPinCodesItemManager__buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2)
{
  return [a2 items];
}

uint64_t __64__HUGuestsPinCodesItemManager__buildSectionsWithDisplayedItems___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 items];
}

- (id)_buildItemModulesForHome:(id)a3
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v4 = (objc_class *)MEMORY[0x1E4F693B8];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v7 = [(HUGuestsPinCodesItemManager *)self pinCodeManager];
  v8 = (void *)[v6 initWithItemUpdater:self pinCodeManager:v7 listType:2 home:v5 forAccessory:0];
  [(HUGuestsPinCodesItemManager *)self setGuestsListModule:v8];

  id v9 = objc_alloc(MEMORY[0x1E4F693B8]);
  v10 = [(HUGuestsPinCodesItemManager *)self pinCodeManager];
  objc_super v11 = (void *)[v9 initWithItemUpdater:self pinCodeManager:v10 listType:4 home:v5 forAccessory:0];

  [(HUGuestsPinCodesItemManager *)self setOtherEcosystemListModule:v11];
  v12 = [(HUGuestsPinCodesItemManager *)self guestsListModule];
  v16[0] = v12;
  v13 = [(HUGuestsPinCodesItemManager *)self otherEcosystemListModule];
  v16[1] = v13;
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];

  return v14;
}

- (void)_registerForExternalUpdates
{
  v4.receiver = self;
  v4.super_class = (Class)HUGuestsPinCodesItemManager;
  [(HFItemManager *)&v4 _registerForExternalUpdates];
  id v3 = [(HUGuestsPinCodesItemManager *)self pinCodeManager];
  [v3 addObserver:self];
}

- (void)_unregisterForExternalUpdates
{
  v4.receiver = self;
  v4.super_class = (Class)HUGuestsPinCodesItemManager;
  [(HFItemManager *)&v4 _unregisterForExternalUpdates];
  id v3 = [(HUGuestsPinCodesItemManager *)self pinCodeManager];
  [v3 removeObserver:self];
}

- (HFPinCodeManager)pinCodeManager
{
  return self->_pinCodeManager;
}

- (void)setPinCodeManager:(id)a3
{
}

- (HFPinCodeListModule)guestsListModule
{
  return self->_guestsListModule;
}

- (void)setGuestsListModule:(id)a3
{
}

- (HFPinCodeListModule)otherEcosystemListModule
{
  return self->_otherEcosystemListModule;
}

- (void)setOtherEcosystemListModule:(id)a3
{
}

- (HFUserItemProvider)userItemProvider
{
  return self->_userItemProvider;
}

- (void)setUserItemProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userItemProvider, 0);
  objc_storeStrong((id *)&self->_otherEcosystemListModule, 0);
  objc_storeStrong((id *)&self->_guestsListModule, 0);

  objc_storeStrong((id *)&self->_pinCodeManager, 0);
}

@end