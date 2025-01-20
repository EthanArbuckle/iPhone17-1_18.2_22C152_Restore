@interface HFPinCodeListModule
- (HFItemSectionAccessoryButtonHeaderDelegate)editButtonHeaderDelegate;
- (HFPinCodeItemProvider)pinCodeItemProvider;
- (HFPinCodeListModule)initWithItemUpdater:(id)a3 pinCodeManager:(id)a4 listType:(unint64_t)a5 home:(id)a6 forAccessory:(id)a7;
- (HFPinCodeManager)pinCodeManager;
- (HFStaticItem)addPinCodeItem;
- (HFStaticItem)revokePinCodeItem;
- (HMAccessory)accessory;
- (HMHome)home;
- (id)_sectionIdentifier;
- (id)buildSectionsWithDisplayedItems:(id)a3;
- (id)itemProviders;
- (unint64_t)listType;
- (void)setAccessory:(id)a3;
- (void)setAddPinCodeItem:(id)a3;
- (void)setEditButtonHeaderDelegate:(id)a3;
- (void)setListType:(unint64_t)a3;
- (void)setPinCodeItemProvider:(id)a3;
- (void)setRevokePinCodeItem:(id)a3;
@end

@implementation HFPinCodeListModule

- (HFPinCodeListModule)initWithItemUpdater:(id)a3 pinCodeManager:(id)a4 listType:(unint64_t)a5 home:(id)a6 forAccessory:(id)a7
{
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)HFPinCodeListModule;
  v16 = [(HFItemModule *)&v19 initWithItemUpdater:a3];
  v17 = v16;
  if (v16)
  {
    v16->_listType = a5;
    objc_storeStrong((id *)&v16->_pinCodeManager, a4);
    objc_storeStrong((id *)&v17->_home, a6);
    objc_storeStrong((id *)&v17->_accessory, a7);
  }

  return v17;
}

- (id)itemProviders
{
  itemProviders = self->_itemProviders;
  if (!itemProviders)
  {
    v5 = [MEMORY[0x263EFF9C0] set];
    if ([(HFPinCodeListModule *)self listType] == 2)
    {
      v6 = [HFStaticItem alloc];
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __36__HFPinCodeListModule_itemProviders__block_invoke;
      v28[3] = &unk_264091E30;
      v28[4] = self;
      v7 = [(HFStaticItem *)v6 initWithResultsBlock:v28];
      [(HFPinCodeListModule *)self setAddPinCodeItem:v7];

      v8 = [HFStaticItemProvider alloc];
      v9 = (void *)MEMORY[0x263EFFA08];
      uint64_t v10 = [(HFPinCodeListModule *)self addPinCodeItem];
    }
    else
    {
      if ([(HFPinCodeListModule *)self listType] != 3)
      {
LABEL_8:
        objc_opt_class();
        id v15 = [(HFItemModule *)self itemUpdater];
        if (objc_opt_isKindOfClass()) {
          v16 = v15;
        }
        else {
          v16 = 0;
        }
        id v17 = v16;

        v18 = [HFPinCodeItemProvider alloc];
        objc_super v19 = [v17 home];

        v20 = [(HFPinCodeListModule *)self pinCodeManager];
        unint64_t v21 = [(HFPinCodeListModule *)self listType];
        v22 = [(HFPinCodeListModule *)self accessory];
        v23 = [(HFPinCodeItemProvider *)v18 initWithHome:v19 pinCodeManager:v20 listType:v21 forAccessory:v22];
        [(HFPinCodeListModule *)self setPinCodeItemProvider:v23];

        v24 = [(HFPinCodeListModule *)self pinCodeItemProvider];
        [(NSSet *)v5 addObject:v24];

        v25 = self->_itemProviders;
        self->_itemProviders = v5;
        v26 = v5;

        v3 = self->_itemProviders;
        goto LABEL_12;
      }
      v11 = [[HFStaticItem alloc] initWithResultsBlock:&__block_literal_global_60];
      [(HFPinCodeListModule *)self setRevokePinCodeItem:v11];

      v8 = [HFStaticItemProvider alloc];
      v9 = (void *)MEMORY[0x263EFFA08];
      uint64_t v10 = [(HFPinCodeListModule *)self revokePinCodeItem];
    }
    v12 = (void *)v10;
    id v13 = [v9 setWithObject:v10];
    id v14 = [(HFStaticItemProvider *)v8 initWithItems:v13];
    [(NSSet *)v5 addObject:v14];

    goto LABEL_8;
  }
  v3 = itemProviders;
LABEL_12:
  return v3;
}

id __36__HFPinCodeListModule_itemProviders__block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFF9A0] dictionary];
  [v2 setObject:@"plus" forKeyedSubscript:@"iconNames"];
  BOOL v3 = 1;
  v4 = _HFLocalizedStringWithDefaultValue(@"HFPinCodeAddButtonTitle", @"HFPinCodeAddButtonTitle", 1);
  [v2 setObject:v4 forKeyedSubscript:@"title"];

  [v2 setObject:@"Home.Locks.Pincodes.AddGuest" forKeyedSubscript:@"HFResultDisplayAccessibilityIDKey"];
  v5 = +[HFHomeKitDispatcher sharedDispatcher];
  v6 = [v5 homeManager];
  int v7 = [v6 hasOptedToHH2];

  if (v7)
  {
    v8 = [*(id *)(a1 + 32) home];
    v9 = [v8 residentDevices];
    BOOL v3 = [v9 count] != 0;
  }
  uint64_t v10 = HFLogForCategory(0x46uLL);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [*(id *)(a1 + 32) home];
    v12 = [v11 residentDevices];
    uint64_t v13 = [v12 count];
    id v14 = [*(id *)(a1 + 32) home];
    int v18 = 136316162;
    objc_super v19 = "-[HFPinCodeListModule itemProviders]_block_invoke";
    __int16 v20 = 1024;
    BOOL v21 = v3;
    __int16 v22 = 1024;
    int v23 = v7;
    __int16 v24 = 2048;
    uint64_t v25 = v13;
    __int16 v26 = 2112;
    v27 = v14;
    _os_log_impl(&dword_20B986000, v10, OS_LOG_TYPE_DEFAULT, "(%s) shouldShowInvitePeople = %{BOOL}d because hasOptedToHH2 = %{BOOL}d | residentDevices.count = %ld | home %@", (uint8_t *)&v18, 0x2Cu);
  }
  id v15 = [NSNumber numberWithBool:!v3];
  [v2 setObject:v15 forKeyedSubscript:@"hidden"];

  v16 = [MEMORY[0x263F58190] futureWithResult:v2];

  return v16;
}

id __36__HFPinCodeListModule_itemProviders__block_invoke_15()
{
  v0 = [MEMORY[0x263EFF9A0] dictionary];
  v1 = _HFLocalizedStringWithDefaultValue(@"HFPinCodeRevokeRemovedUserButtonTitle", @"HFPinCodeRevokeRemovedUserButtonTitle", 1);
  [v0 setObject:v1 forKeyedSubscript:@"title"];

  [v0 setObject:@"Home.Locks.PinCodes.RevokeAccessCode" forKeyedSubscript:@"HFResultDisplayAccessibilityIDKey"];
  [v0 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:@"hidden"];
  v2 = [MEMORY[0x263F58190] futureWithResult:v0];

  return v2;
}

- (id)_sectionIdentifier
{
  unint64_t v2 = [(HFPinCodeListModule *)self listType];
  if (v2 - 1 > 3) {
    BOOL v3 = 0;
  }
  else {
    BOOL v3 = off_264091E50[v2 - 1];
  }
  return (id)[NSString stringWithFormat:@"PinCodes-%@", v3];
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  v26[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HFPinCodeListModule *)self pinCodeItemProvider];
  v6 = [v5 items];
  int v7 = [v6 allObjects];
  v8 = (void *)[v7 mutableCopy];

  v9 = +[HFItemSection defaultItemComparator];
  [v8 sortUsingComparator:v9];

  if (![v8 count]
    && ([(HFPinCodeListModule *)self listType] == 1
     || [(HFPinCodeListModule *)self listType] == 3
     || [(HFPinCodeListModule *)self listType] == 4))
  {
    v12 = (void *)MEMORY[0x263EFFA68];
    goto LABEL_28;
  }
  uint64_t v10 = [(HFPinCodeListModule *)self addPinCodeItem];

  if (v10)
  {
    uint64_t v11 = [(HFPinCodeListModule *)self addPinCodeItem];
  }
  else
  {
    uint64_t v13 = [(HFPinCodeListModule *)self revokePinCodeItem];

    if (!v13) {
      goto LABEL_11;
    }
    uint64_t v11 = [(HFPinCodeListModule *)self revokePinCodeItem];
  }
  id v14 = (void *)v11;
  [v8 addObject:v11];

LABEL_11:
  switch([(HFPinCodeListModule *)self listType])
  {
    case 1uLL:
      id v15 = @"HFPinCodeUserSectionHeader";
      goto LABEL_17;
    case 2uLL:
      id v15 = @"HFPinCodeGuestSectionHeader";
      goto LABEL_17;
    case 3uLL:
      id v15 = @"HFPinCodeRemovedUsersSectionHeader";
      goto LABEL_17;
    case 4uLL:
      id v15 = @"HFPinCodeOtherEcosystemGuestsSectionHeader";
LABEL_17:
      v16 = _HFLocalizedStringWithDefaultValue(v15, v15, 1);
      break;
    default:
      v16 = 0;
      break;
  }
  id v17 = [HFMutableItemSection alloc];
  int v18 = [(HFPinCodeListModule *)self _sectionIdentifier];
  objc_super v19 = [(HFItemSection *)v17 initWithIdentifier:v18];

  [(HFMutableItemSection *)v19 setItems:v8 filteringToDisplayedItems:v4];
  [(HFItemSection *)v19 setHeaderTitle:v16];
  __int16 v20 = [(HFPinCodeListModule *)self accessory];

  if (!v20) {
    goto LABEL_27;
  }
  unint64_t v21 = [(HFPinCodeListModule *)self listType];
  switch(v21)
  {
    case 3uLL:
      __int16 v22 = @"HFPinCodeRemovedUsersSectionFooter";
      goto LABEL_24;
    case 2uLL:
      __int16 v24 = _HFLocalizedStringWithDefaultValue(@"HFPinCodeListGuestsHeaderButtonEditTitle", @"HFPinCodeListGuestsHeaderButtonEditTitle", 1);
      [(HFItemSection *)v19 setHeaderAccessoryButtonTitle:v24];

      int v23 = [(HFPinCodeListModule *)self editButtonHeaderDelegate];
      [(HFItemSection *)v19 setHeaderAccessoryButtonDelegate:v23];
      goto LABEL_26;
    case 1uLL:
      __int16 v22 = @"HFPinCodeUserSectionFooter";
LABEL_24:
      int v23 = _HFLocalizedStringWithDefaultValue(v22, v22, 1);
      [(HFItemSection *)v19 setFooterTitle:v23];
LABEL_26:

      break;
  }
LABEL_27:
  v26[0] = v19;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:1];

LABEL_28:
  return v12;
}

- (HMHome)home
{
  return self->_home;
}

- (HFStaticItem)addPinCodeItem
{
  return self->_addPinCodeItem;
}

- (void)setAddPinCodeItem:(id)a3
{
}

- (HFStaticItem)revokePinCodeItem
{
  return self->_revokePinCodeItem;
}

- (void)setRevokePinCodeItem:(id)a3
{
}

- (HFPinCodeManager)pinCodeManager
{
  return self->_pinCodeManager;
}

- (HMAccessory)accessory
{
  return self->_accessory;
}

- (void)setAccessory:(id)a3
{
}

- (unint64_t)listType
{
  return self->_listType;
}

- (void)setListType:(unint64_t)a3
{
  self->_listType = a3;
}

- (HFPinCodeItemProvider)pinCodeItemProvider
{
  return self->_pinCodeItemProvider;
}

- (void)setPinCodeItemProvider:(id)a3
{
}

- (HFItemSectionAccessoryButtonHeaderDelegate)editButtonHeaderDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_editButtonHeaderDelegate);
  return (HFItemSectionAccessoryButtonHeaderDelegate *)WeakRetained;
}

- (void)setEditButtonHeaderDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_editButtonHeaderDelegate);
  objc_storeStrong((id *)&self->_pinCodeItemProvider, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_pinCodeManager, 0);
  objc_storeStrong((id *)&self->_revokePinCodeItem, 0);
  objc_storeStrong((id *)&self->_addPinCodeItem, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_itemProviders, 0);
}

@end