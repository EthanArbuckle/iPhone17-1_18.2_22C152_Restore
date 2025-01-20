@interface HUFirmwareUpdateItemModule
- (HMHome)home;
- (HUFirmwareUpdateItemModule)initWithItemUpdater:(id)a3;
- (HUFirmwareUpdateItemModule)initWithItemUpdater:(id)a3 home:(id)a4;
- (HUFirmwareUpdateItemProvider)firmwareUpdateItemProvider;
- (id)buildItemProviders;
- (id)buildSectionsWithDisplayedItems:(id)a3;
- (id)transformedUpdateOutcomeForItem:(id)a3 proposedOutcome:(id)a4;
- (void)setFirmwareUpdateItemProvider:(id)a3;
@end

@implementation HUFirmwareUpdateItemModule

- (HUFirmwareUpdateItemModule)initWithItemUpdater:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_initWithItemUpdater_home_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUFirmwareUpdateItemModule.m", 32, @"%s is unavailable; use %@ instead",
    "-[HUFirmwareUpdateItemModule initWithItemUpdater:]",
    v6);

  return 0;
}

- (HUFirmwareUpdateItemModule)initWithItemUpdater:(id)a3 home:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HUFirmwareUpdateItemModule;
  v8 = [(HFItemModule *)&v11 initWithItemUpdater:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_home, a4);
  }

  return v9;
}

- (id)buildItemProviders
{
  v3 = [HUFirmwareUpdateItemProvider alloc];
  v4 = [(HUFirmwareUpdateItemModule *)self home];
  v5 = [(HUFirmwareUpdateItemProvider *)v3 initWithHome:v4 style:2];
  [(HUFirmwareUpdateItemModule *)self setFirmwareUpdateItemProvider:v5];

  v6 = (void *)MEMORY[0x1E4F1CAD0];
  id v7 = [(HUFirmwareUpdateItemModule *)self firmwareUpdateItemProvider];
  v8 = objc_msgSend(v6, "na_setWithSafeObject:", v7);

  return v8;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"thirdPartyUpdates"];
  id v7 = [(HUFirmwareUpdateItemModule *)self firmwareUpdateItemProvider];
  v8 = [v7 items];
  v9 = [v8 allObjects];
  v10 = [MEMORY[0x1E4F69220] defaultItemComparator];
  objc_super v11 = [v9 sortedArrayUsingComparator:v10];
  [v6 setItems:v11];

  v12 = [(HUFirmwareUpdateItemModule *)self home];
  LODWORD(v7) = objc_msgSend(v12, "hf_hasAccessoriesSupportingSoftwareUpdate");

  if (v7)
  {
    v13 = _HULocalizedStringWithDefaultValue(@"HUSoftwareUpdateLegacyThirdPartyUpdatesSectionHeader", @"HUSoftwareUpdateLegacyThirdPartyUpdatesSectionHeader", 1);
    [v6 setHeaderTitle:v13];
  }
  [v5 addObject:v6];
  v14 = [MEMORY[0x1E4F69220] filterSections:v5 toDisplayedItems:v4];

  return v14;
}

- (id)transformedUpdateOutcomeForItem:(id)a3 proposedOutcome:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v5 sourceItem],
        id v7 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v7,
        (isKindOfClass & 1) != 0))
  {
    id v9 = (id)[v6 mutableCopy];
    v10 = [v6 objectForKeyedSubscript:@"HFResultApplicationIsInstalled"];
    if ([v10 BOOLValue]) {
      objc_super v11 = @"HUDownloadButtonTitle_Open";
    }
    else {
      objc_super v11 = @"HUDownloadButtonTitle_View";
    }
    v12 = _HULocalizedStringWithDefaultValue(v11, v11, 1);
    [v9 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F68948]];

    v13 = [v6 objectForKeyedSubscript:@"HFResultApplicationPublisher"];
    [v9 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F68990]];
  }
  else
  {
    id v9 = v6;
  }

  return v9;
}

- (HMHome)home
{
  return self->_home;
}

- (HUFirmwareUpdateItemProvider)firmwareUpdateItemProvider
{
  return self->_firmwareUpdateItemProvider;
}

- (void)setFirmwareUpdateItemProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firmwareUpdateItemProvider, 0);

  objc_storeStrong((id *)&self->_home, 0);
}

@end