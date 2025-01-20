@interface HUTelevisionSettingsItemModule
+ (BOOL)_supportsAccessory:(id)a3;
+ (id)_powerModeSelectionCharacteristicForAccessory:(id)a3;
- (HFItem)showPowerModeSelectionItem;
- (HMAccessory)accessory;
- (HMHome)home;
- (HUTelevisionSettingsItemModule)initWithItemUpdater:(id)a3 home:(id)a4 accessory:(id)a5;
- (id)buildSectionsWithDisplayedItems:(id)a3;
- (id)itemProviders;
- (id)showPowerModeSelection;
- (void)_createItemProviders;
@end

@implementation HUTelevisionSettingsItemModule

+ (id)_powerModeSelectionCharacteristicForAccessory:(id)a3
{
  v3 = objc_msgSend(a3, "hf_serviceOfType:", *MEMORY[0x1E4F2DEF0]);
  v4 = objc_msgSend(v3, "hf_characteristicOfType:", *MEMORY[0x1E4F2CF68]);

  return v4;
}

+ (BOOL)_supportsAccessory:(id)a3
{
  v3 = [a1 _powerModeSelectionCharacteristicForAccessory:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (HUTelevisionSettingsItemModule)initWithItemUpdater:(id)a3 home:(id)a4 accessory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(id)objc_opt_class() _supportsAccessory:v10])
  {
    v15.receiver = self;
    v15.super_class = (Class)HUTelevisionSettingsItemModule;
    v11 = [(HFItemModule *)&v15 initWithItemUpdater:v8];
    p_isa = (id *)&v11->super.super.isa;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_home, a4);
      objc_storeStrong(p_isa + 7, a5);
      [p_isa _createItemProviders];
    }
    self = p_isa;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)_createItemProviders
{
  objc_initWeak(&location, self);
  id v3 = objc_alloc(MEMORY[0x1E4F695C0]);
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  objc_super v15 = __54__HUTelevisionSettingsItemModule__createItemProviders__block_invoke;
  v16 = &unk_1E6384FD0;
  objc_copyWeak(&v17, &location);
  BOOL v4 = (HFItem *)[v3 initWithResultsBlock:&v13];
  showPowerModeSelectionItem = self->_showPowerModeSelectionItem;
  self->_showPowerModeSelectionItem = v4;

  id v6 = objc_alloc(MEMORY[0x1E4F695C8]);
  v7 = (void *)MEMORY[0x1E4F1CAD0];
  id v8 = [(HUTelevisionSettingsItemModule *)self showPowerModeSelectionItem];
  id v9 = [v7 setWithObject:v8];
  id v10 = (void *)[v6 initWithItems:v9];

  v11 = [MEMORY[0x1E4F1CAD0] setWithObject:v10];
  itemProviders = self->_itemProviders;
  self->_itemProviders = v11;

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

id __54__HUTelevisionSettingsItemModule__createItemProviders__block_invoke(uint64_t a1)
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)MEMORY[0x1E4F7A0D8];
  v10[0] = *MEMORY[0x1E4F68AB8];
  id v3 = _HULocalizedStringWithDefaultValue(@"HUTelevisionSettingPowerModeSelectionButtonTitle", @"HUTelevisionSettingPowerModeSelectionButtonTitle", 1);
  v11[0] = v3;
  v10[1] = *MEMORY[0x1E4F68A08];
  BOOL v4 = NSNumber;
  v5 = [WeakRetained accessory];
  id v6 = objc_msgSend(v4, "numberWithInt:", objc_msgSend(v5, "hf_canSyncExternalSettings") ^ 1);
  v11[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  id v8 = [v2 futureWithResult:v7];

  return v8;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  BOOL v4 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"TVSettings"];
  v5 = _HULocalizedStringWithDefaultValue(@"HUTelevisionSettingPowerModeSelectionSectionFooterTitle", @"HUTelevisionSettingPowerModeSelectionSectionFooterTitle", 1);
  [v4 setFooterTitle:v5];

  id v6 = [(HUTelevisionSettingsItemModule *)self showPowerModeSelectionItem];
  v11[0] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  [v4 setItems:v7];

  id v10 = v4;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];

  return v8;
}

- (id)showPowerModeSelection
{
  id v3 = objc_opt_class();
  BOOL v4 = [(HUTelevisionSettingsItemModule *)self accessory];
  v5 = [v3 _powerModeSelectionCharacteristicForAccessory:v4];

  if (!v5)
  {
    id v6 = [(HUTelevisionSettingsItemModule *)self accessory];
    v7 = objc_msgSend(v6, "hf_prettyDescription");
    NSLog(&cfstr_MissingPowerMo.isa, v7);
  }
  id v8 = [(HUTelevisionSettingsItemModule *)self home];
  id v9 = objc_msgSend(v8, "hf_characteristicValueManager");
  id v10 = [v9 writeValue:&unk_1F19B52D0 forCharacteristic:v5];

  return v10;
}

- (id)itemProviders
{
  return self->_itemProviders;
}

- (HMHome)home
{
  return self->_home;
}

- (HMAccessory)accessory
{
  return self->_accessory;
}

- (HFItem)showPowerModeSelectionItem
{
  return self->_showPowerModeSelectionItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_showPowerModeSelectionItem, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_home, 0);

  objc_storeStrong((id *)&self->_itemProviders, 0);
}

@end