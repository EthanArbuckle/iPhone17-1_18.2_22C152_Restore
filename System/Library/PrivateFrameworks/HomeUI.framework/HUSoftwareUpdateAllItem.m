@interface HUSoftwareUpdateAllItem
- (HMHome)home;
- (HUSoftwareUpdateAllItem)init;
- (HUSoftwareUpdateAllItem)initWithHome:(id)a3;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)description;
@end

@implementation HUSoftwareUpdateAllItem

- (HUSoftwareUpdateAllItem)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = NSStringFromSelector(sel_initWithHome_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUSoftwareUpdateAllItem.m", 19, @"%s is unavailable; use %@ instead",
    "-[HUSoftwareUpdateAllItem init]",
    v5);

  return 0;
}

- (HUSoftwareUpdateAllItem)initWithHome:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HUSoftwareUpdateAllItem;
  v6 = [(HUSoftwareUpdateAllItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_home, a3);
  }

  return v7;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4 = objc_alloc(MEMORY[0x1E4F695B0]);
  id v5 = [(HUSoftwareUpdateAllItem *)self home];
  v6 = [v5 accessories];
  v7 = (void *)[v4 initWithAccessories:v6];

  id v8 = objc_alloc_init(MEMORY[0x1E4F692F0]);
  objc_super v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  v12 = objc_msgSend(v9, "setWithObjects:", v10, v11, objc_opt_class(), 0);
  [v8 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F68900]];

  uint64_t v13 = MEMORY[0x1E4F1CC38];
  [v8 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68B00]];
  [v8 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F68AF8]];
  if ([v7 softwareUpdatesInProgress])
  {
    if ([v7 softwareUpdatesInstalling])
    {
      uint64_t v22 = [v7 softwareUpdatesInstalling];
      v14 = HFLocalizedStringWithFormat();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E4F1CC38], *MEMORY[0x1E4F68C48], v22);
    }
    else
    {
      if ([v7 softwareUpdatesDownloading])
      {
        uint64_t v23 = [v7 softwareUpdatesDownloading];
        v14 = HFLocalizedStringWithFormat();
        v15 = (void *)MEMORY[0x1E4F695B0];
        v16 = objc_msgSend(v7, "accessoriesDownloadingSoftwareUpdates", v23);
        v17 = [v15 progressForAccessoriesDownloadingSoftwareUpdate:v16];
        [v8 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F68C60]];
      }
      else if ([v7 softwareUpdatesRequested])
      {
        uint64_t v24 = [v7 softwareUpdatesRequested];
        v14 = HFLocalizedStringWithFormat();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E4F1CC38], *MEMORY[0x1E4F68958], v24);
      }
      else
      {
        v14 = 0;
      }
      objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E4F1CC38], *MEMORY[0x1E4F68C48], v21);
    }
  }
  else if ([v7 softwareUpdatesReadyToInstall])
  {
    uint64_t v21 = [v7 softwareUpdatesReadyToInstall];
    v14 = HFLocalizedStringWithFormat();
  }
  else
  {
    [v8 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68B10]];
    v14 = 0;
  }
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E4F68AB8], v21);
  v18 = _HULocalizedStringWithDefaultValue(@"HUSoftwareUpdateControlTitle_UpdateAll", @"HUSoftwareUpdateControlTitle_UpdateAll", 1);
  [v8 setObject:v18 forKeyedSubscript:*MEMORY[0x1E4F68948]];

  [v8 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68A78]];
  v19 = [MEMORY[0x1E4F7A0D8] futureWithResult:v8];

  return v19;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F7A0D0] builderWithObject:self];
  id v4 = [(HUSoftwareUpdateAllItem *)self latestResults];
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F68B10]];
  id v6 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", objc_msgSend(v5, "BOOLValue"), @"hidden", 1);

  v7 = [(HUSoftwareUpdateAllItem *)self latestResults];
  id v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  [v3 appendString:v8 withName:@"title" skipIfEmpty:1];

  objc_super v9 = [v3 build];

  return v9;
}

- (HMHome)home
{
  return self->_home;
}

- (void).cxx_destruct
{
}

@end