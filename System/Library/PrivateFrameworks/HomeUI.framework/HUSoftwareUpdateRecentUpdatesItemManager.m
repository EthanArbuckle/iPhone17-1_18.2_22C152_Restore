@interface HUSoftwareUpdateRecentUpdatesItemManager
- (HMHome)overrideHome;
- (HUSoftwareUpdateItemModule)softwareUpdateModule;
- (HUSoftwareUpdateRecentUpdatesItemManager)initWithDelegate:(id)a3 home:(id)a4;
- (HUSoftwareUpdateRecentUpdatesItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4;
- (id)_buildItemModulesForHome:(id)a3;
- (id)_homeFuture;
- (id)_itemsToHideInSet:(id)a3;
- (void)setOverrideHome:(id)a3;
- (void)setSoftwareUpdateModule:(id)a3;
@end

@implementation HUSoftwareUpdateRecentUpdatesItemManager

- (HUSoftwareUpdateRecentUpdatesItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  v7 = NSStringFromSelector(sel_initWithDelegate_home_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUSoftwareUpdateRecentUpdatesItemManager.m", 25, @"%s is unavailable; use %@ instead",
    "-[HUSoftwareUpdateRecentUpdatesItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (HUSoftwareUpdateRecentUpdatesItemManager)initWithDelegate:(id)a3 home:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HUSoftwareUpdateRecentUpdatesItemManager;
  v8 = [(HFItemManager *)&v11 initWithDelegate:a3 sourceItem:0];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_overrideHome, a4);
  }

  return v9;
}

- (id)_homeFuture
{
  v2 = (void *)MEMORY[0x1E4F7A0D8];
  v3 = [(HUSoftwareUpdateRecentUpdatesItemManager *)self overrideHome];
  v4 = [v2 futureWithResult:v3];

  return v4;
}

- (id)_buildItemModulesForHome:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [[HUSoftwareUpdateItemModule alloc] initWithItemUpdater:self home:v4 sourceItem:0];

  [(HUSoftwareUpdateRecentUpdatesItemManager *)self setSoftwareUpdateModule:v5];
  v6 = [(HUSoftwareUpdateRecentUpdatesItemManager *)self softwareUpdateModule];
  v9[0] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];

  return v7;
}

- (id)_itemsToHideInSet:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)HUSoftwareUpdateRecentUpdatesItemManager;
  id v3 = a3;
  id v4 = [(HFItemManager *)&v10 _itemsToHideInSet:v3];
  v5 = (void *)[v4 mutableCopy];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__HUSoftwareUpdateRecentUpdatesItemManager__itemsToHideInSet___block_invoke;
  v8[3] = &unk_1E63889F8;
  id v6 = v5;
  id v9 = v6;
  objc_msgSend(v3, "na_each:", v8);

  return v6;
}

void __62__HUSoftwareUpdateRecentUpdatesItemManager__itemsToHideInSet___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v6 latestResults];
    id v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F68C58]];
    char v5 = [v4 BOOLValue];

    if ((v5 & 1) == 0) {
      [*(id *)(a1 + 32) addObject:v6];
    }
  }
}

- (HUSoftwareUpdateItemModule)softwareUpdateModule
{
  return self->_softwareUpdateModule;
}

- (void)setSoftwareUpdateModule:(id)a3
{
}

- (HMHome)overrideHome
{
  return self->_overrideHome;
}

- (void)setOverrideHome:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideHome, 0);

  objc_storeStrong((id *)&self->_softwareUpdateModule, 0);
}

@end