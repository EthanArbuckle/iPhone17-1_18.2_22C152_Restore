@interface HUZoneModuleController
- (BOOL)_validateNewZoneName:(id)a3;
- (BOOL)hasPendingCreation;
- (BOOL)textFieldShouldEndEditing:(id)a3;
- (BOOL)textFieldShouldReturn:(id)a3;
- (Class)collectionCellClassForItem:(id)a3;
- (HMRoom)room;
- (HUEditableTextCollectionListCell)createNewZoneCell;
- (HUZoneModuleController)initWithModule:(id)a3 room:(id)a4;
- (UICollectionViewListCell)currentZoneItemCell;
- (UITextField)editingTextField;
- (id)_createNewZoneWithName:(id)a3;
- (id)_didSelectZoneBuilderItem:(id)a3;
- (id)_didSelectZoneItem:(id)a3;
- (id)finishZoneNameEditing;
- (unint64_t)didSelectItem:(id)a3;
- (void)_configureCreateNewZoneItem:(id)a3 forCell:(id)a4;
- (void)_configureCurrentZonesItem:(id)a3 forCell:(id)a4;
- (void)_configureZoneBuilderItem:(id)a3 forCell:(id)a4;
- (void)_configureZoneItem:(id)a3 forCell:(id)a4;
- (void)_updateCreateNewZoneCellText:(BOOL)a3;
- (void)configureCell:(id)a3 forItem:(id)a4;
- (void)setCreateNewZoneCell:(id)a3;
- (void)setCurrentZoneItemCell:(id)a3;
- (void)setEditingTextField:(id)a3;
- (void)setHasPendingCreation:(BOOL)a3;
- (void)setRoom:(id)a3;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
@end

@implementation HUZoneModuleController

- (HUZoneModuleController)initWithModule:(id)a3 room:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_class();
  id v9 = v6;
  if (v9)
  {
    if (objc_opt_isKindOfClass()) {
      v10 = v9;
    }
    else {
      v10 = 0;
    }
    v11 = v9;
    if (v10) {
      goto LABEL_8;
    }
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    v13 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v12 handleFailureInFunction:v13, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v8, objc_opt_class() file lineNumber description];
  }
  v11 = 0;
LABEL_8:

  v17.receiver = self;
  v17.super_class = (Class)HUZoneModuleController;
  v14 = [(HUItemModuleController *)&v17 initWithModule:v9];
  v15 = v14;
  if (v14) {
    objc_storeStrong((id *)&v14->_room, a4);
  }

  return v15;
}

- (Class)collectionCellClassForItem:(id)a3
{
  id v4 = a3;
  v5 = [(HUItemModuleController *)self module];
  id v6 = [v5 createNewZoneItem];
  [v4 isEqual:v6];

  id v7 = objc_opt_class();

  return (Class)v7;
}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = [(HUItemModuleController *)self module];
  id v8 = [v7 createNewZoneItem];

  if (v8 == v6)
  {
    [(HUZoneModuleController *)self _configureCreateNewZoneItem:v6 forCell:v12];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v9 = [v6 sourceItem];

      v10 = [(HUItemModuleController *)self module];
      v11 = [v10 currentZoneItem];

      if (v11 == (void *)v9) {
        [(HUZoneModuleController *)self _configureCurrentZonesItem:v9 forCell:v12];
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(HUZoneModuleController *)self _configureZoneBuilderItem:v9 forCell:v12];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [(HUZoneModuleController *)self _configureZoneItem:v9 forCell:v12];
        }
      }
      id v6 = (id)v9;
    }
  }
}

- (unint64_t)didSelectItem:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 sourceItem];

    id v6 = [(HUItemModuleController *)self module];
    id v7 = [v6 currentZoneItem];

    if (v5 == v7)
    {
      id v10 = [(HUItemModuleController *)self module];
      [v10 toggleExpansion];
    }
    else
    {
      objc_opt_class();
      id v8 = v5;
      if (objc_opt_isKindOfClass()) {
        uint64_t v9 = v8;
      }
      else {
        uint64_t v9 = 0;
      }
      id v10 = v9;

      if (v10) {
        id v11 = [(HUZoneModuleController *)self _didSelectZoneItem:v8];
      }
      objc_opt_class();
      id v12 = v8;
      if (objc_opt_isKindOfClass()) {
        v13 = v12;
      }
      else {
        v13 = 0;
      }
      id v14 = v13;

      if (v14) {
        id v15 = [(HUZoneModuleController *)self _didSelectZoneBuilderItem:v12];
      }
    }
  }
  else
  {
    v5 = v4;
  }

  return 0;
}

- (id)_didSelectZoneItem:(id)a3
{
  v5 = [a3 zone];
  id v6 = objc_alloc(MEMORY[0x1E4F69788]);
  id v7 = [(HUZoneModuleController *)self room];
  id v8 = [v7 home];
  uint64_t v9 = (void *)[v6 initWithExistingObject:v5 inHome:v8];

  id v10 = [v5 rooms];
  id v11 = [(HUZoneModuleController *)self room];
  int v12 = [v10 containsObject:v11];

  v13 = [(HUZoneModuleController *)self room];
  if (v12) {
    [v9 removeRoom:v13];
  }
  else {
    [v9 addRoom:v13];
  }

  id v14 = [v9 commitItem];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __45__HUZoneModuleController__didSelectZoneItem___block_invoke;
  v17[3] = &unk_1E6387D58;
  v17[4] = self;
  v17[5] = a2;
  id v15 = [v14 addCompletionBlock:v17];

  return v15;
}

void __45__HUZoneModuleController__didSelectZoneItem___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v11 = a3;
  if (v11)
  {
    id v4 = [MEMORY[0x1E4F69110] sharedHandler];
    [v4 handleError:v11];
  }
  else
  {
    v5 = (void *)MEMORY[0x1E4F69230];
    id v6 = [*(id *)(a1 + 32) module];
    id v7 = [v6 itemProviders];
    id v4 = [v5 requestToReloadItemProviders:v7 senderSelector:*(void *)(a1 + 40)];

    id v8 = [*(id *)(a1 + 32) module];
    uint64_t v9 = [v8 itemUpdater];
    id v10 = (id)[v9 performItemUpdateRequest:v4];
  }
}

- (id)_didSelectZoneBuilderItem:(id)a3
{
  v5 = [a3 zoneBuilder];
  id v6 = [(HUZoneModuleController *)self room];
  [v5 addRoom:v6];

  id v7 = [v5 commitItem];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52__HUZoneModuleController__didSelectZoneBuilderItem___block_invoke;
  v10[3] = &unk_1E6387D58;
  v10[4] = self;
  v10[5] = a2;
  id v8 = [v7 addCompletionBlock:v10];

  return v8;
}

void __52__HUZoneModuleController__didSelectZoneBuilderItem___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v11 = a3;
  if (v11)
  {
    id v4 = [MEMORY[0x1E4F69110] sharedHandler];
    [v4 handleError:v11];
  }
  else
  {
    v5 = (void *)MEMORY[0x1E4F69230];
    id v6 = [*(id *)(a1 + 32) module];
    id v7 = [v6 itemProviders];
    id v4 = [v5 requestToReloadItemProviders:v7 senderSelector:*(void *)(a1 + 40)];

    id v8 = [*(id *)(a1 + 32) module];
    uint64_t v9 = [v8 itemUpdater];
    id v10 = (id)[v9 performItemUpdateRequest:v4];
  }
}

- (void)_updateCreateNewZoneCellText:(BOOL)a3
{
  BOOL v3 = a3;
  id v21 = [(HUZoneModuleController *)self createNewZoneCell];
  v5 = [(HUItemModuleController *)self module];
  id v6 = [v5 createNewZoneItem];

  id v7 = [MEMORY[0x1E4F42B58] cellConfiguration];
  id v8 = [v21 textField];
  int v9 = [v8 isEditing];

  if (!v9 || v3)
  {
    v13 = [v6 latestResults];
    id v14 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
    [v7 setText:v14];

    id v15 = objc_msgSend(MEMORY[0x1E4F428B8], "hf_keyColor");
    v16 = [v7 textProperties];
    [v16 setColor:v15];

    objc_super v17 = [v21 textField];
    [v17 setPlaceholder:&stru_1F18F92B8];

    v18 = [v21 textField];
    [v18 setText:&stru_1F18F92B8];

    [v21 setContentConfiguration:v7];
    if (v3)
    {
      v19 = [v21 textField];
      [v19 setText:&stru_1F18F92B8];

      v20 = [v21 textField];
      [v20 resignFirstResponder];
    }
  }
  else
  {
    [v7 setText:0];
    [v21 setContentConfiguration:v7];
    id v10 = [v6 latestResults];
    id v11 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F68AC8]];
    int v12 = [v21 textField];
    [v12 setPlaceholder:v11];
  }
}

- (void)_configureCreateNewZoneItem:(id)a3 forCell:(id)a4
{
  id v5 = a4;
  [(HUZoneModuleController *)self setCreateNewZoneCell:v5];
  [(HUZoneModuleController *)self _updateCreateNewZoneCellText:0];
  id v6 = [v5 textField];
  [v6 setAutocapitalizationType:1];

  id v7 = [v5 textField];

  [v7 setDelegate:self];
}

- (void)_configureZoneItem:(id)a3 forCell:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = +[HUListContentConfigurationUtilities labelDefaultConfigurationForItem:v7];
  [v6 setContentConfiguration:v8];
  int v9 = [v7 zone];

  id v10 = [v9 rooms];
  id v11 = [(HUZoneModuleController *)self room];
  char v12 = [v10 containsObject:v11];

  if (v12)
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F42820]);
    v15[0] = v13;
    id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    [v6 setAccessories:v14];
  }
  else
  {
    [v6 setAccessories:MEMORY[0x1E4F1CBF0]];
  }
}

- (void)_configureZoneBuilderItem:(id)a3 forCell:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F42B58];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 valueCellConfiguration];
  id v11 = +[HUListContentConfigurationUtilities labelConfiguration:v8 forItem:v7];

  int v9 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
  id v10 = [v11 textProperties];
  [v10 setColor:v9];

  [v6 setContentConfiguration:v11];
  [v6 setAccessories:MEMORY[0x1E4F1CBF0]];
}

- (void)_configureCurrentZonesItem:(id)a3 forCell:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(HUZoneModuleController *)self setCurrentZoneItemCell:v6];
  id v8 = [MEMORY[0x1E4F42B58] valueCellConfiguration];
  id v13 = +[HUListContentConfigurationUtilities labelConfiguration:v8 forItem:v7];

  int v9 = [(HUZoneModuleController *)self room];
  id v10 = objc_msgSend(v9, "hf_allZones");
  if ([v10 count]) {
    objc_msgSend(MEMORY[0x1E4F428B8], "hf_keyColor");
  }
  else {
  id v11 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
  }
  char v12 = [v13 secondaryTextProperties];
  [v12 setColor:v11];

  [v6 setContentConfiguration:v13];
  [v6 setAccessories:MEMORY[0x1E4F1CBF0]];
}

- (BOOL)_validateNewZoneName:(id)a3
{
  BOOL v3 = [MEMORY[0x1E4F69758] sanitizeUserEnteredHomeKitName:a3];
  BOOL v4 = [v3 length] != 0;

  return v4;
}

- (id)_createNewZoneWithName:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v5 = [MEMORY[0x1E4F69758] sanitizeUserEnteredHomeKitName:a3];
  if ([(HUZoneModuleController *)self hasPendingCreation])
  {
    id v6 = HFLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      v45 = self;
      __int16 v46 = 2112;
      v47 = v7;
      __int16 v48 = 2112;
      v49 = v5;
      _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ Pending creation for zone with name %@, skipping this one", buf, 0x20u);
    }
    goto LABEL_15;
  }
  if (![(HUZoneModuleController *)self _validateNewZoneName:v5])
  {
LABEL_15:
    v29 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
    goto LABEL_18;
  }
  v33 = [(HUItemModuleController *)self module];
  id v8 = objc_opt_new();
  int v9 = [(HUItemModuleController *)self module];
  id v10 = [v9 itemProviders];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __49__HUZoneModuleController__createNewZoneWithName___block_invoke;
  v41[3] = &unk_1E6387DA0;
  id v11 = v8;
  id v42 = v11;
  objc_msgSend(v10, "na_each:", v41);

  long long v39 = 0u;
  long long v40 = 0u;
  long long v38 = 0u;
  long long v37 = 0u;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v38;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v38 != v15) {
          objc_enumerationMutation(v12);
        }
        objc_super v17 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        v18 = objc_msgSend(v17, "zone", v33);
        v19 = [v18 name];
        char v20 = [v19 isEqualToString:v5];

        if (v20)
        {
          v30 = [(HUZoneModuleController *)self _didSelectZoneItem:v17];
          v36[0] = MEMORY[0x1E4F143A8];
          v36[1] = 3221225472;
          v36[2] = __49__HUZoneModuleController__createNewZoneWithName___block_invoke_4;
          v36[3] = &unk_1E6387DC8;
          v36[4] = self;
          id v31 = (id)[v30 addSuccessBlock:v36];

          v29 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
          v25 = v12;
          v22 = v33;
          goto LABEL_17;
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v37 objects:v43 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }

  id v21 = objc_alloc(MEMORY[0x1E4F69788]);
  v22 = v33;
  v23 = [v33 room];
  v24 = [v23 home];
  v25 = (void *)[v21 initWithHome:v24];

  [v25 setName:v5];
  v26 = [v33 room];
  [v25 addRoom:v26];

  [(HUZoneModuleController *)self setHasPendingCreation:1];
  v27 = [v25 commitItem];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __49__HUZoneModuleController__createNewZoneWithName___block_invoke_5;
  v35[3] = &unk_1E6387DF0;
  v35[4] = self;
  v28 = [v27 addSuccessBlock:v35];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __49__HUZoneModuleController__createNewZoneWithName___block_invoke_6;
  v34[3] = &unk_1E6386708;
  v34[4] = self;
  v29 = [v28 addFailureBlock:v34];

LABEL_17:
LABEL_18:

  return v29;
}

void __49__HUZoneModuleController__createNewZoneWithName___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 items];
  objc_msgSend(v3, "na_filter:", &__block_literal_global_53);
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  BOOL v4 = *(void **)(a1 + 32);
  id v5 = objc_msgSend(v6, "na_map:", &__block_literal_global_21);
  [v4 unionSet:v5];
}

uint64_t __49__HUZoneModuleController__createNewZoneWithName___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    BOOL v4 = v3;
  }
  else {
    BOOL v4 = 0;
  }
  id v5 = v4;

  id v6 = [v5 sourceItem];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __49__HUZoneModuleController__createNewZoneWithName___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 sourceItem];
}

uint64_t __49__HUZoneModuleController__createNewZoneWithName___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateCreateNewZoneCellText:1];
}

uint64_t __49__HUZoneModuleController__createNewZoneWithName___block_invoke_5(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) host];
  id v3 = [*(id *)(a1 + 32) module];
  BOOL v4 = [v3 createNewZoneItem];
  v7[0] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  [v2 updateCellForItems:v5];

  return [*(id *)(a1 + 32) setHasPendingCreation:0];
}

uint64_t __49__HUZoneModuleController__createNewZoneWithName___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F69110];
  id v4 = a2;
  id v5 = [v3 sharedHandler];
  [v5 handleError:v4];

  id v6 = *(void **)(a1 + 32);

  return [v6 setHasPendingCreation:0];
}

- (id)finishZoneNameEditing
{
  id v3 = [(HUZoneModuleController *)self editingTextField];
  [v3 resignFirstResponder];
  id v4 = [v3 text];
  id v5 = [(HUZoneModuleController *)self _createNewZoneWithName:v4];

  return v5;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  [(HUZoneModuleController *)self setEditingTextField:a3];

  [(HUZoneModuleController *)self _updateCreateNewZoneCellText:0];
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4 = a3;
  id v5 = [v4 text];
  id v6 = [(HUZoneModuleController *)self _createNewZoneWithName:v5];

  [v4 resignFirstResponder];
  return 1;
}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  id v4 = a3;
  id v5 = [v4 text];
  uint64_t v6 = [v5 length];

  if (v6)
  {
    id v7 = [v4 text];
    BOOL v8 = [(HUZoneModuleController *)self _validateNewZoneName:v7];
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

- (void)textFieldDidEndEditing:(id)a3
{
}

- (HMRoom)room
{
  return self->_room;
}

- (void)setRoom:(id)a3
{
}

- (UICollectionViewListCell)currentZoneItemCell
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentZoneItemCell);

  return (UICollectionViewListCell *)WeakRetained;
}

- (void)setCurrentZoneItemCell:(id)a3
{
}

- (HUEditableTextCollectionListCell)createNewZoneCell
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_createNewZoneCell);

  return (HUEditableTextCollectionListCell *)WeakRetained;
}

- (void)setCreateNewZoneCell:(id)a3
{
}

- (UITextField)editingTextField
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_editingTextField);

  return (UITextField *)WeakRetained;
}

- (void)setEditingTextField:(id)a3
{
}

- (BOOL)hasPendingCreation
{
  return self->_hasPendingCreation;
}

- (void)setHasPendingCreation:(BOOL)a3
{
  self->_hasPendingCreation = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_editingTextField);
  objc_destroyWeak((id *)&self->_createNewZoneCell);
  objc_destroyWeak((id *)&self->_currentZoneItemCell);

  objc_storeStrong((id *)&self->_room, 0);
}

@end