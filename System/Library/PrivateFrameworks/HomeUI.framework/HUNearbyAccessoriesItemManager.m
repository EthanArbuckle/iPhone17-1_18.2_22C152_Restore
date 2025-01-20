@interface HUNearbyAccessoriesItemManager
+ (id)itemProvidersForPrimaryAccessory:(id)a3 inHome:(id)a4;
- (BOOL)_isAPreferredServiceType:(id)a3;
- (BOOL)_isServiceItemAssociatedWithPrimaryAccessory:(id)a3;
- (BOOL)hasCustomNearbyAccessories;
- (BOOL)hasEmptyNearbyAccessories;
- (BOOL)shouldHideItem:(id)a3;
- (BOOL)supportsQuickControls;
- (HMAccessory)primaryAccessory;
- (HUNearbyAccessoriesItemManager)initWithDelegate:(id)a3 sourceProfileItem:(id)a4 supportsQuickControls:(BOOL)a5;
- (NSDictionary)customNearbyAccessories;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_comparatorForSectionIdentifier:(id)a3;
- (id)_itemsToHideInSet:(id)a3;
- (id)userFilteredIdentifiers;
- (unint64_t)_numberOfSections;
- (void)setCustomNearbyAccessories:(id)a3;
- (void)setPrimaryAccessory:(id)a3;
- (void)setSupportsQuickControls:(BOOL)a3;
@end

@implementation HUNearbyAccessoriesItemManager

- (HUNearbyAccessoriesItemManager)initWithDelegate:(id)a3 sourceProfileItem:(id)a4 supportsQuickControls:(BOOL)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = (void *)[v8 copy];
  v15.receiver = self;
  v15.super_class = (Class)HUNearbyAccessoriesItemManager;
  v11 = [(HFItemManager *)&v15 initWithDelegate:v9 sourceItem:v10];

  if (v11)
  {
    uint64_t v12 = [v8 accessory];
    primaryAccessory = v11->_primaryAccessory;
    v11->_primaryAccessory = (HMAccessory *)v12;

    v11->_supportsQuickControls = a5;
  }

  return v11;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_class();
  v6 = [(HUNearbyAccessoriesItemManager *)self primaryAccessory];
  v7 = [v5 itemProvidersForPrimaryAccessory:v6 inHome:v4];

  return v7;
}

- (unint64_t)_numberOfSections
{
  return 1;
}

- (id)_comparatorForSectionIdentifier:(id)a3
{
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__HUNearbyAccessoriesItemManager__comparatorForSectionIdentifier___block_invoke;
  v9[3] = &unk_1E63912D8;
  v9[4] = self;
  v9[5] = v6;
  v9[6] = v4;
  v9[7] = v5;
  v7 = _Block_copy(v9);

  return v7;
}

uint64_t __66__HUNearbyAccessoriesItemManager__comparatorForSectionIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (objc_opt_isKindOfClass()) {
    v7 = v5;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  id v9 = v6;
  if (objc_opt_isKindOfClass()) {
    v10 = v9;
  }
  else {
    v10 = 0;
  }
  id v11 = v10;

  if (v8) {
    uint64_t v12 = -1;
  }
  else {
    uint64_t v12 = 1;
  }
  if ((v8 != 0) != (v11 == 0))
  {
    v13 = [v5 latestResults];
    uint64_t v14 = *MEMORY[0x1E4F68AB8];
    objc_super v15 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];

    v16 = [v9 latestResults];
    v17 = [v16 objectForKeyedSubscript:v14];

    id v18 = v5;
    if (objc_opt_isKindOfClass()) {
      v19 = v18;
    }
    else {
      v19 = 0;
    }
    id v20 = v19;

    id v21 = v9;
    if (objc_opt_isKindOfClass()) {
      v22 = v21;
    }
    else {
      v22 = 0;
    }
    id v23 = v22;

    int v24 = [*(id *)(a1 + 32) _isServiceItemAssociatedWithPrimaryAccessory:v20];
    int v25 = [*(id *)(a1 + 32) _isServiceItemAssociatedWithPrimaryAccessory:v23];
    if (v24 && v25)
    {
      uint64_t v12 = [v15 localizedStandardCompare:v17];
LABEL_52:

      goto LABEL_53;
    }
    char v26 = v24 | v25;
    if (v24) {
      uint64_t v12 = -1;
    }
    else {
      uint64_t v12 = 1;
    }
    if (v26) {
      goto LABEL_52;
    }
    id v27 = v18;
    if (objc_opt_isKindOfClass()) {
      v28 = v27;
    }
    else {
      v28 = 0;
    }
    id v29 = v28;

    id v30 = v21;
    v31 = v29;
    id v32 = v30;
    if (objc_opt_isKindOfClass()) {
      v33 = v32;
    }
    else {
      v33 = 0;
    }
    id v34 = v33;

    if (v31)
    {
      [v31 accessory];
      v36 = id v35 = v34;
      v53 = objc_msgSend(v36, "hf_primaryService");

      id v34 = v35;
    }
    else
    {
      v53 = [v20 service];
    }
    v51 = v31;
    v52 = v34;
    if (v34)
    {
      v37 = [v34 accessory];
      v38 = objc_msgSend(v37, "hf_primaryService");
    }
    else
    {
      v38 = [v23 service];
    }
    v39 = *(void **)(a1 + 32);
    v40 = [v53 serviceType];
    int v41 = [v39 _isAPreferredServiceType:v40];

    v42 = *(void **)(a1 + 32);
    v43 = [v38 serviceType];
    int v44 = [v42 _isAPreferredServiceType:v43];

    if (v41 && v44)
    {
      uint64_t v12 = [v15 localizedStandardCompare:v17];
    }
    else
    {
      char v45 = v41 | v44;
      if (v41) {
        uint64_t v12 = -1;
      }
      else {
        uint64_t v12 = 1;
      }
      if ((v45 & 1) == 0)
      {
        id v47 = v15;
        v54 = v47;
        id v48 = v17;
        v49 = v48;
        id v55 = v48;
        if (v47) {
          uint64_t v12 = -1;
        }
        else {
          uint64_t v12 = v48 != 0;
        }
        if (v47 && v48)
        {
          uint64_t v12 = [v47 localizedStandardCompare:v48];
          v49 = v55;
        }
        v46 = v51;

        goto LABEL_51;
      }
    }
    v46 = v51;
LABEL_51:

    goto LABEL_52;
  }
LABEL_53:

  return v12;
}

uint64_t __66__HUNearbyAccessoriesItemManager__comparatorForSectionIdentifier___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) localizedStandardCompare:*(void *)(a1 + 40)];
}

- (BOOL)_isServiceItemAssociatedWithPrimaryAccessory:(id)a3
{
  uint64_t v4 = [a3 accessories];
  id v5 = [v4 anyObject];
  id v6 = [(HUNearbyAccessoriesItemManager *)self primaryAccessory];
  char v7 = [v5 isEqual:v6];

  return v7;
}

- (id)_itemsToHideInSet:(id)a3
{
  id v4 = a3;
  id v5 = [(HUNearbyAccessoriesItemManager *)self userFilteredIdentifiers];
  [(HUNearbyAccessoriesItemManager *)self setCustomNearbyAccessories:v5];

  v11.receiver = self;
  v11.super_class = (Class)HUNearbyAccessoriesItemManager;
  id v6 = [(HFItemManager *)&v11 _itemsToHideInSet:v4];
  char v7 = (void *)[v6 mutableCopy];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52__HUNearbyAccessoriesItemManager__itemsToHideInSet___block_invoke;
  v10[3] = &unk_1E6386108;
  v10[4] = self;
  id v8 = objc_msgSend(v4, "na_filter:", v10);

  [v7 unionSet:v8];

  return v7;
}

uint64_t __52__HUNearbyAccessoriesItemManager__itemsToHideInSet___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) shouldHideItem:a2];
}

- (BOOL)hasCustomNearbyAccessories
{
  v2 = [(HUNearbyAccessoriesItemManager *)self customNearbyAccessories];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)hasEmptyNearbyAccessories
{
  v2 = [(HUNearbyAccessoriesItemManager *)self customNearbyAccessories];
  BOOL v3 = [v2 objectForKeyedSubscript:@"EmptySetIdentifier"];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)shouldHideItem:(id)a3
{
  id v4 = a3;
  if (![(HUNearbyAccessoriesItemManager *)self hasCustomNearbyAccessories])
  {
    objc_opt_class();
    id v6 = v4;
    if (objc_opt_isKindOfClass()) {
      char v7 = v6;
    }
    else {
      char v7 = 0;
    }
    id v8 = v7;

    if (v8)
    {
      id v9 = [v8 accessories];
      v10 = [v9 anyObject];
      objc_super v11 = [(HUNearbyAccessoriesItemManager *)self primaryAccessory];
      int v12 = [v10 isEqual:v11];

      if (v12)
      {
        id v13 = [v8 service];
        int v5 = objc_msgSend(v13, "hf_isDisplayableSensor") ^ 1;
        id v8 = v6;
LABEL_45:

        goto LABEL_46;
      }
    }
    objc_opt_class();
    id v14 = v6;
    if (objc_opt_isKindOfClass()) {
      objc_super v15 = v14;
    }
    else {
      objc_super v15 = 0;
    }
    id v13 = v15;

    objc_opt_class();
    id v16 = v14;
    if (objc_opt_isKindOfClass()) {
      v17 = v16;
    }
    else {
      v17 = 0;
    }
    id v18 = v17;

    v19 = [v13 accessory];
    id v20 = [(HUNearbyAccessoriesItemManager *)self primaryAccessory];
    char v21 = [v19 isEqual:v20];

    if (v21)
    {
      LOBYTE(v5) = 1;
LABEL_44:

      goto LABEL_45;
    }
    if (v13)
    {
      id v34 = [v13 accessory];
      id v35 = objc_msgSend(v34, "hf_primaryService");
    }
    else if (v8)
    {
      id v35 = [v8 service];
    }
    else
    {
      id v35 = 0;
    }
    v39 = [v35 serviceType];
    char v40 = [v39 isEqual:*MEMORY[0x1E4F2DE98]];

    if ((v40 & 1) == 0)
    {
      int v41 = [v35 serviceType];
      char v42 = [v41 isEqualToString:*MEMORY[0x1E4F2DEB0]];

      if (v42)
      {
        LOBYTE(v5) = 0;
        goto LABEL_43;
      }
      if ((objc_msgSend(v35, "hf_isInGroup") & 1) == 0)
      {
        int v44 = (void *)MEMORY[0x1E4F69098];
        char v45 = [(HFItemManager *)self childItemsForItem:v16];
        v46 = objc_msgSend(v44, "hu_preferredToggleableControlItemInControlItems:", v45);

        if ([(HUNearbyAccessoriesItemManager *)self supportsQuickControls] || v46)
        {
          if (v18)
          {
            id v47 = [v18 latestResults];
            uint64_t v48 = [v47 objectForKeyedSubscript:*MEMORY[0x1E4F68BE8]];
          }
          else
          {
            id v49 = v16;
            if ([v49 conformsToProtocol:&unk_1F19E4798]) {
              v50 = v49;
            }
            else {
              v50 = 0;
            }
            id v51 = v50;

            v52 = [v51 homeKitObject];

            if ([v52 conformsToProtocol:&unk_1F1A6A1B0]) {
              v53 = v52;
            }
            else {
              v53 = 0;
            }
            id v54 = v53;

            id v47 = objc_msgSend(v54, "hf_parentRoom");

            uint64_t v48 = [v47 uniqueIdentifier];
          }
          id v55 = (void *)v48;

          if (v55)
          {
            v56 = [(HUNearbyAccessoriesItemManager *)self primaryAccessory];
            v57 = objc_msgSend(v56, "hf_parentRoom");
            v58 = [v57 uniqueIdentifier];
            v59 = [v58 UUIDString];

            v60 = [v55 UUIDString];
            int v5 = [v60 isEqual:v59] ^ 1;
          }
          else
          {
            LOBYTE(v5) = 1;
          }

          goto LABEL_43;
        }
      }
    }
    LOBYTE(v5) = 1;
LABEL_43:

    goto LABEL_44;
  }
  if (![(HUNearbyAccessoriesItemManager *)self hasEmptyNearbyAccessories])
  {
    objc_opt_class();
    id v22 = v4;
    if (objc_opt_isKindOfClass()) {
      id v23 = v22;
    }
    else {
      id v23 = 0;
    }
    id v8 = v23;

    objc_opt_class();
    id v24 = v22;
    if (objc_opt_isKindOfClass()) {
      int v25 = v24;
    }
    else {
      int v25 = 0;
    }
    id v13 = v25;

    objc_opt_class();
    id v26 = v24;
    if (objc_opt_isKindOfClass()) {
      id v27 = v26;
    }
    else {
      id v27 = 0;
    }
    id v18 = v27;

    v28 = [(HUNearbyAccessoriesItemManager *)self customNearbyAccessories];
    id v29 = [v8 service];
    id v30 = [v29 uniqueIdentifier];
    v31 = [v30 UUIDString];
    id v32 = [v28 objectForKeyedSubscript:v31];
    if (v32)
    {
      BOOL v33 = 1;
    }
    else
    {
      v69 = v18;
      v36 = [(HUNearbyAccessoriesItemManager *)self customNearbyAccessories];
      v67 = [v13 serviceGroup];
      v66 = [v67 uniqueIdentifier];
      [v66 UUIDString];
      v65 = v68 = v36;
      v37 = objc_msgSend(v36, "objectForKeyedSubscript:");
      if (v37)
      {
        BOOL v33 = 1;
      }
      else
      {
        v63 = [(HUNearbyAccessoriesItemManager *)self customNearbyAccessories];
        v64 = [v69 accessory];
        v62 = [v64 uniqueIdentifier];
        v61 = [v62 UUIDString];
        v38 = [v63 objectForKeyedSubscript:v61];
        BOOL v33 = v38 != 0;
      }
      id v18 = v69;
    }

    LOBYTE(v5) = !v33;
    goto LABEL_44;
  }
  LOBYTE(v5) = 1;
LABEL_46:

  return v5;
}

- (BOOL)_isAPreferredServiceType:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:*MEMORY[0x1E4F2DE78]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F2DE18]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F2DE88]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F2DED8]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F2DEB0]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F2DE38]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F2DE80]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F2DEA8]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F2DF28]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F2DF30]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F2DE28]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F2DF10]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F2DEC8]] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 isEqualToString:*MEMORY[0x1E4F2DED0]];
  }

  return v4;
}

- (id)userFilteredIdentifiers
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [(HUNearbyAccessoriesItemManager *)self primaryAccessory];
  id v3 = [v2 applicationData];
  char v4 = [v3 objectForKeyedSubscript:@"HUNearbyAccessoryCustomUUIDStrings"];

  if (v4)
  {
    int v5 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v6 = objc_opt_class();
    id v12 = 0;
    char v7 = [v5 unarchivedDictionaryWithKeysOfClass:v6 objectsOfClass:objc_opt_class() fromData:v4 error:&v12];
    id v8 = v12;
    id v9 = HFLogForCategory();
    v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v14 = v8;
        _os_log_error_impl(&dword_1BE345000, v10, OS_LOG_TYPE_ERROR, "Unable to unarchive custom data:%@", buf, 0xCu);
      }

      v10 = v7;
      char v7 = MEMORY[0x1E4F1CC08];
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v7;
      _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "Unarchived custom data:%@", buf, 0xCu);
    }
  }
  else
  {
    id v8 = HFLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1BE345000, v8, OS_LOG_TYPE_ERROR, "Associated accessories have never been customized.", buf, 2u);
    }
    char v7 = MEMORY[0x1E4F1CC08];
  }

  return v7;
}

+ (id)itemProvidersForPrimaryAccessory:(id)a3 inHome:(id)a4
{
  v22[3] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__HUNearbyAccessoriesItemManager_itemProvidersForPrimaryAccessory_inHome___block_invoke_2;
  aBlock[3] = &unk_1E6391300;
  id v21 = &__block_literal_global_260;
  id v6 = a4;
  char v7 = _Block_copy(aBlock);
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F69558]) initWithHome:v6 serviceTypes:0];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __74__HUNearbyAccessoriesItemManager_itemProvidersForPrimaryAccessory_inHome___block_invoke_3;
  v17[3] = &unk_1E6391328;
  id v18 = v5;
  id v19 = v7;
  id v9 = v7;
  id v10 = v5;
  [v8 setFilter:v17];
  objc_super v11 = (void *)[objc_alloc(MEMORY[0x1E4F68E20]) initWithHome:v6];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __74__HUNearbyAccessoriesItemManager_itemProvidersForPrimaryAccessory_inHome___block_invoke_4;
  v15[3] = &unk_1E6390D40;
  id v16 = &__block_literal_global_260;
  [v11 setFilter:v15];
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F69540]) initWithHome:v6];

  v22[0] = v11;
  v22[1] = v12;
  v22[2] = v8;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:3];

  return v13;
}

uint64_t __74__HUNearbyAccessoriesItemManager_itemProvidersForPrimaryAccessory_inHome___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_showAsAccessoryTile");
}

uint64_t __74__HUNearbyAccessoriesItemManager_itemProvidersForPrimaryAccessory_inHome___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 accessory];
  uint64_t v4 = (*(unsigned int (**)(uint64_t, void *))(v2 + 16))(v2, v3) ^ 1;

  return v4;
}

uint64_t __74__HUNearbyAccessoriesItemManager_itemProvidersForPrimaryAccessory_inHome___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  char v7 = [v6 accessory];
  if ([v7 isEqual:*(void *)(a1 + 32)]) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }

  return v8;
}

uint64_t __74__HUNearbyAccessoriesItemManager_itemProvidersForPrimaryAccessory_inHome___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  uint64_t v7 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  return v7;
}

- (HMAccessory)primaryAccessory
{
  return self->_primaryAccessory;
}

- (void)setPrimaryAccessory:(id)a3
{
}

- (BOOL)supportsQuickControls
{
  return self->_supportsQuickControls;
}

- (void)setSupportsQuickControls:(BOOL)a3
{
  self->_supportsQuickControls = a3;
}

- (NSDictionary)customNearbyAccessories
{
  return self->_customNearbyAccessories;
}

- (void)setCustomNearbyAccessories:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customNearbyAccessories, 0);

  objc_storeStrong((id *)&self->_primaryAccessory, 0);
}

@end