@interface HUQuickControlPresentationItemManager
- (BOOL)_shouldDisableOptionalDataDuringFastInitialUpdate;
- (HFAccessoryItemProvider)accessoryItemProvider;
- (HFCameraItemProvider)cameraItemProvider;
- (HFGenericAccessoryItemProvider)genericItemProvider;
- (HFMediaAccessoryItemProvider)mediaAccessoryItemProvider;
- (HFProgrammableSwitchItemProvider)programmableSwitchItemProvider;
- (HFServiceItemProvider)serviceItemProvider;
- (HFTargetControlItemProvider)targetControlItemProvider;
- (HUQuickControlPresentationItemManager)initWithHomeKitObjectUUID:(id)a3 type:(unint64_t)a4;
- (NSUUID)homeKitObjectUUID;
- (id)_buildItemProvidersForHome:(id)a3;
- (unint64_t)presentationItemType;
- (void)_didFinishUpdateTransactionWithAffectedItems:(id)a3;
- (void)setAccessoryItemProvider:(id)a3;
- (void)setCameraItemProvider:(id)a3;
- (void)setGenericItemProvider:(id)a3;
- (void)setMediaAccessoryItemProvider:(id)a3;
- (void)setProgrammableSwitchItemProvider:(id)a3;
- (void)setServiceItemProvider:(id)a3;
- (void)setTargetControlItemProvider:(id)a3;
@end

@implementation HUQuickControlPresentationItemManager

- (HUQuickControlPresentationItemManager)initWithHomeKitObjectUUID:(id)a3 type:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUQuickControlPresentationItemManager;
  v8 = [(HFItemManager *)&v11 initWithDelegate:0 sourceItem:0];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_homeKitObjectUUID, a3);
    v9->_presentationItemType = a4;
  }

  return v9;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  id v4 = a3;
  v5 = [(HUQuickControlPresentationItemManager *)self homeKitObjectUUID];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__HUQuickControlPresentationItemManager__buildItemProvidersForHome___block_invoke;
  aBlock[3] = &unk_1E6385F78;
  id v6 = v5;
  id v33 = v6;
  id v7 = _Block_copy(aBlock);
  unint64_t v8 = [(HUQuickControlPresentationItemManager *)self presentationItemType];
  switch(v8)
  {
    case 3uLL:
      v19 = (void *)[objc_alloc(MEMORY[0x1E4F68FA0]) initWithHome:v4];
      [(HUQuickControlPresentationItemManager *)self setCameraItemProvider:v19];

      v18 = [(HUQuickControlPresentationItemManager *)self cameraItemProvider];
      break;
    case 2uLL:
      v20 = (void *)[objc_alloc(MEMORY[0x1E4F69558]) initWithHome:v4];
      [(HUQuickControlPresentationItemManager *)self setServiceItemProvider:v20];

      v18 = [(HUQuickControlPresentationItemManager *)self serviceItemProvider];
      break;
    case 1uLL:
      v9 = (void *)[objc_alloc(MEMORY[0x1E4F68E20]) initWithHome:v4];
      [(HUQuickControlPresentationItemManager *)self setAccessoryItemProvider:v9];

      v10 = [(HUQuickControlPresentationItemManager *)self accessoryItemProvider];
      [v10 setFilter:v7];

      objc_super v11 = (void *)[objc_alloc(MEMORY[0x1E4F69170]) initWithHome:v4];
      [(HUQuickControlPresentationItemManager *)self setGenericItemProvider:v11];

      v12 = [(HUQuickControlPresentationItemManager *)self genericItemProvider];
      [v12 setFilter:v7];

      v13 = (void *)[objc_alloc(MEMORY[0x1E4F69428]) initWithHome:v4];
      [(HUQuickControlPresentationItemManager *)self setProgrammableSwitchItemProvider:v13];

      v14 = [(HUQuickControlPresentationItemManager *)self programmableSwitchItemProvider];
      [v14 setFilter:v7];

      v15 = (void *)[objc_alloc(MEMORY[0x1E4F69630]) initWithHome:v4];
      [(HUQuickControlPresentationItemManager *)self setTargetControlItemProvider:v15];

      v16 = [(HUQuickControlPresentationItemManager *)self targetControlItemProvider];
      [v16 setFilter:v7];

      v17 = (void *)[objc_alloc(MEMORY[0x1E4F69288]) initWithHome:v4];
      [(HUQuickControlPresentationItemManager *)self setMediaAccessoryItemProvider:v17];

      v18 = [(HUQuickControlPresentationItemManager *)self mediaAccessoryItemProvider];
      break;
    default:
      goto LABEL_8;
  }
  v21 = v18;
  [v18 setFilter:v7];

LABEL_8:
  v22 = [MEMORY[0x1E4F1CA48] array];
  v23 = [(HUQuickControlPresentationItemManager *)self accessoryItemProvider];
  objc_msgSend(v22, "na_safeAddObject:", v23);

  v24 = [(HUQuickControlPresentationItemManager *)self genericItemProvider];
  objc_msgSend(v22, "na_safeAddObject:", v24);

  v25 = [(HUQuickControlPresentationItemManager *)self programmableSwitchItemProvider];
  objc_msgSend(v22, "na_safeAddObject:", v25);

  v26 = [(HUQuickControlPresentationItemManager *)self targetControlItemProvider];
  objc_msgSend(v22, "na_safeAddObject:", v26);

  v27 = [(HUQuickControlPresentationItemManager *)self mediaAccessoryItemProvider];
  objc_msgSend(v22, "na_safeAddObject:", v27);

  v28 = [(HUQuickControlPresentationItemManager *)self serviceItemProvider];
  objc_msgSend(v22, "na_safeAddObject:", v28);

  v29 = [(HUQuickControlPresentationItemManager *)self cameraItemProvider];
  objc_msgSend(v22, "na_safeAddObject:", v29);

  v30 = (void *)[v22 copy];

  return v30;
}

uint64_t __68__HUQuickControlPresentationItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 uniqueIdentifier];
  uint64_t v4 = objc_msgSend(v3, "hmf_isEqualToUUID:", *(void *)(a1 + 32));

  return v4;
}

- (void)_didFinishUpdateTransactionWithAffectedItems:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(HUQuickControlPresentationItemManager *)self presentationItemType] == 1)
  {
    v5 = [v4 allObjects];
    id v6 = [v5 sortedArrayUsingComparator:&__block_literal_global_270];
    id v7 = [v6 firstObject];
  }
  else
  {
    id v7 = [v4 anyObject];
  }
  unint64_t v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = v4;
    __int16 v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "_didFinishUpdateTransactionWithAffectedItems: %@, picked item %@", (uint8_t *)&v9, 0x16u);
  }

  [(HFItemManager *)self setSourceItem:v7];
}

uint64_t __86__HUQuickControlPresentationItemManager__didFinishUpdateTransactionWithAffectedItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = a2;
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  uint64_t v20 = objc_opt_class();
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:5];
  uint64_t v7 = objc_opt_class();

  unint64_t v8 = objc_msgSend(v6, "indexOfObject:", v7, v16, v17, v18, v19);
  uint64_t v9 = objc_opt_class();

  unint64_t v10 = [v6 indexOfObject:v9];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL && v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v13 = v10 == 0x7FFFFFFFFFFFFFFFLL || v8 < v10;
    uint64_t v14 = v13 << 63 >> 63;
    if (v8 > v10) {
      uint64_t v14 = 1;
    }
    if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = v14;
    }
  }

  return v11;
}

- (BOOL)_shouldDisableOptionalDataDuringFastInitialUpdate
{
  return 0;
}

- (NSUUID)homeKitObjectUUID
{
  return self->_homeKitObjectUUID;
}

- (unint64_t)presentationItemType
{
  return self->_presentationItemType;
}

- (HFAccessoryItemProvider)accessoryItemProvider
{
  return self->_accessoryItemProvider;
}

- (void)setAccessoryItemProvider:(id)a3
{
}

- (HFGenericAccessoryItemProvider)genericItemProvider
{
  return self->_genericItemProvider;
}

- (void)setGenericItemProvider:(id)a3
{
}

- (HFProgrammableSwitchItemProvider)programmableSwitchItemProvider
{
  return self->_programmableSwitchItemProvider;
}

- (void)setProgrammableSwitchItemProvider:(id)a3
{
}

- (HFTargetControlItemProvider)targetControlItemProvider
{
  return self->_targetControlItemProvider;
}

- (void)setTargetControlItemProvider:(id)a3
{
}

- (HFMediaAccessoryItemProvider)mediaAccessoryItemProvider
{
  return self->_mediaAccessoryItemProvider;
}

- (void)setMediaAccessoryItemProvider:(id)a3
{
}

- (HFServiceItemProvider)serviceItemProvider
{
  return self->_serviceItemProvider;
}

- (void)setServiceItemProvider:(id)a3
{
}

- (HFCameraItemProvider)cameraItemProvider
{
  return self->_cameraItemProvider;
}

- (void)setCameraItemProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraItemProvider, 0);
  objc_storeStrong((id *)&self->_serviceItemProvider, 0);
  objc_storeStrong((id *)&self->_mediaAccessoryItemProvider, 0);
  objc_storeStrong((id *)&self->_targetControlItemProvider, 0);
  objc_storeStrong((id *)&self->_programmableSwitchItemProvider, 0);
  objc_storeStrong((id *)&self->_genericItemProvider, 0);
  objc_storeStrong((id *)&self->_accessoryItemProvider, 0);

  objc_storeStrong((id *)&self->_homeKitObjectUUID, 0);
}

@end