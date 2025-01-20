@interface HUDashboardCameraItemModule
- (HFCameraItemProvider)cameraItemProvider;
- (HMHome)home;
- (HMRoom)room;
- (HUDashboardCameraItemModule)initWithContext:(id)a3 itemUpdater:(id)a4;
- (HUDashboardContext)context;
- (id)_reorderableHomeKitItemListKey;
- (id)buildItemProviders;
- (id)buildSectionsWithDisplayedItems:(id)a3;
- (void)setCameraItemProvider:(id)a3;
- (void)setContext:(id)a3;
@end

@implementation HUDashboardCameraItemModule

- (id)_reorderableHomeKitItemListKey
{
  return (id)*MEMORY[0x1E4F68A38];
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  v4 = (objc_class *)MEMORY[0x1E4F692E8];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithIdentifier:@"camerasSection"];
  v7 = [(HUDashboardCameraItemModule *)self cameraItemProvider];
  v8 = [v7 items];
  v9 = [v8 allObjects];
  v10 = [(HFItemModule *)self _itemComparator];
  v11 = [v9 sortedArrayUsingComparator:v10];

  v12 = _HULocalizedStringWithDefaultValue(@"HUDashboardCamerasSectionTitle", @"HUDashboardCamerasSectionTitle", 1);
  [v6 setHeaderTitle:v12];

  [v6 setItems:v11];
  v13 = (void *)MEMORY[0x1E4F69220];
  v17[0] = v6;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  v15 = [v13 filterSections:v14 toDisplayedItems:v5];

  return v15;
}

- (HFCameraItemProvider)cameraItemProvider
{
  return self->_cameraItemProvider;
}

uint64_t __49__HUDashboardCameraItemModule_buildItemProviders__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained context];
  int v6 = [v5 shouldHideHomeKitObject:v3];

  return v6 ^ 1u;
}

- (id)buildItemProviders
{
  id v3 = [MEMORY[0x1E4F1CA80] set];
  id v4 = objc_alloc(MEMORY[0x1E4F68FA0]);
  id v5 = [(HUDashboardCameraItemModule *)self context];
  int v6 = [v5 home];
  v7 = (void *)[v4 initWithHome:v6];
  [(HUDashboardCameraItemModule *)self setCameraItemProvider:v7];

  v8 = [(HUDashboardCameraItemModule *)self context];
  v9 = [v8 room];
  v10 = [(HUDashboardCameraItemModule *)self cameraItemProvider];
  [v10 setRoom:v9];

  objc_initWeak(&location, self);
  uint64_t v14 = MEMORY[0x1E4F143A8];
  objc_copyWeak(&v15, &location);
  v11 = [(HUDashboardCameraItemModule *)self cameraItemProvider];
  [v11 setFilter:&v14];

  v12 = [(HUDashboardCameraItemModule *)self cameraItemProvider];
  objc_msgSend(v3, "na_safeAddObject:", v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v3;
}

- (HUDashboardContext)context
{
  return self->_context;
}

- (void)setCameraItemProvider:(id)a3
{
}

- (HUDashboardCameraItemModule)initWithContext:(id)a3 itemUpdater:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUDashboardCameraItemModule;
  v8 = [(HFItemModule *)&v11 initWithItemUpdater:a4];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_context, a3);
  }

  return v9;
}

- (HMHome)home
{
  v2 = [(HUDashboardCameraItemModule *)self context];
  id v3 = [v2 home];

  return (HMHome *)v3;
}

- (HMRoom)room
{
  v2 = [(HUDashboardCameraItemModule *)self context];
  id v3 = [v2 room];

  return (HMRoom *)v3;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraItemProvider, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

@end