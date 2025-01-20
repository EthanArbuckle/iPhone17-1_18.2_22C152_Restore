@interface HUServiceDetailsControlAndCharacteristicStateItemModule
- (BOOL)isServiceGroup;
- (HFCharacteristicStateItemProvider)characteristicStateItemProvider;
- (HFControlPanelItemProvider)controlPanelItemProvider;
- (HUServiceDetailsControlAndCharacteristicStateItemModule)initWithItemUpdater:(id)a3 home:(id)a4 sourceItem:(id)a5;
- (HUServiceDetailsControlAndCharacteristicStateItemModule)initWithItemUpdater:(id)a3 home:(id)a4 sourceItem:(id)a5 delegate:(id)a6;
- (HUServiceDetailsControlAndCharacteristicStateItemModuleDelegate)delegate;
- (id)_allCharacteristicTypesForItem:(id)a3;
- (id)_characteristicStateItemComparator;
- (id)_createGroupCharacteristicSectionsForItems:(id)a3;
- (id)_createStandaloneCharacteristicSectionsForItems:(id)a3;
- (id)buildSectionsWithDisplayedItems:(id)a3;
- (id)itemProviders;
- (id)sourceServiceItem;
- (void)setDelegate:(id)a3;
@end

@implementation HUServiceDetailsControlAndCharacteristicStateItemModule

- (HUServiceDetailsControlAndCharacteristicStateItemModule)initWithItemUpdater:(id)a3 home:(id)a4 sourceItem:(id)a5 delegate:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v14)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"HUServiceDetailsControlAndCharacteristicStateItemModule.m", 31, @"Invalid parameter not satisfying: %@", @"delegate" object file lineNumber description];
  }
  v19.receiver = self;
  v19.super_class = (Class)HUServiceDetailsControlAndCharacteristicStateItemModule;
  v15 = [(HUServiceDetailsItemModule *)&v19 initWithItemUpdater:v11 home:v12 sourceItem:v13];
  v16 = v15;
  if (v15) {
    [(HUServiceDetailsControlAndCharacteristicStateItemModule *)v15 setDelegate:v14];
  }

  return v16;
}

- (HUServiceDetailsControlAndCharacteristicStateItemModule)initWithItemUpdater:(id)a3 home:(id)a4 sourceItem:(id)a5
{
  v7 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5);
  v8 = NSStringFromSelector(sel_initWithItemUpdater_home_sourceItem_delegate_);
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUServiceDetailsControlAndCharacteristicStateItemModule.m", 43, @"%s is unavailable; use %@ instead",
    "-[HUServiceDetailsControlAndCharacteristicStateItemModule initWithItemUpdater:home:sourceItem:]",
    v8);

  return 0;
}

- (BOOL)isServiceGroup
{
  v2 = [(HUServiceDetailsControlAndCharacteristicStateItemModule *)self sourceServiceItem];
  if ([v2 conformsToProtocol:&unk_1F1A3D6E8]) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)sourceServiceItem
{
  v2 = [(HUServiceDetailsItemModule *)self sourceItem];
  v3 = &unk_1F1A3D558;
  id v4 = v2;
  v5 = v4;
  if (v4)
  {
    if ([v4 conformsToProtocol:v3]) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
    v7 = v5;
    if (v6) {
      goto LABEL_8;
    }
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    v9 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertProtocolCast(Protocol * _Nonnull __strong, id  _Nonnull __strong)");
    v10 = NSStringFromProtocol((Protocol *)v3);
    [v8 handleFailureInFunction:v9, @"NSObject+NAAdditions.h", 71, @"Expected protocol %@", v10 file lineNumber description];
  }
  v7 = 0;
LABEL_8:

  return v7;
}

- (HFControlPanelItemProvider)controlPanelItemProvider
{
  controlPanelItemProvider = self->_controlPanelItemProvider;
  if (controlPanelItemProvider)
  {
    v3 = controlPanelItemProvider;
  }
  else
  {
    objc_initWeak(&location, self);
    id v5 = objc_alloc(MEMORY[0x1E4F690A8]);
    v6 = [(HUServiceDetailsControlAndCharacteristicStateItemModule *)self sourceServiceItem];
    v7 = [(HUServiceDetailsControlAndCharacteristicStateItemModule *)self sourceServiceItem];
    v8 = [v7 valueSource];
    v9 = (HFControlPanelItemProvider *)[v5 initWithItem:v6 valueSource:v8];
    v10 = self->_controlPanelItemProvider;
    self->_controlPanelItemProvider = v9;

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __83__HUServiceDetailsControlAndCharacteristicStateItemModule_controlPanelItemProvider__block_invoke;
    v12[3] = &unk_1E638C518;
    objc_copyWeak(&v13, &location);
    [(HFControlPanelItemProvider *)self->_controlPanelItemProvider setFilter:v12];
    v3 = self->_controlPanelItemProvider;
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

  return v3;
}

uint64_t __83__HUServiceDetailsControlAndCharacteristicStateItemModule_controlPanelItemProvider__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = [WeakRetained sourceServiceItem];
  v6 = [v5 services];
  if ((unint64_t)[v6 count] > 1)
  {
    uint64_t v8 = 0;
  }
  else
  {
    v7 = [WeakRetained delegate];
    uint64_t v8 = [v7 controlAndCharacteristicStateItemModule:WeakRetained shouldShowControlPanelItem:v3];
  }
  return v8;
}

- (HFCharacteristicStateItemProvider)characteristicStateItemProvider
{
  characteristicStateItemProvider = self->_characteristicStateItemProvider;
  if (!characteristicStateItemProvider)
  {
    if (![(HUServiceDetailsControlAndCharacteristicStateItemModule *)self isServiceGroup])
    {
      id v4 = [(HUServiceDetailsControlAndCharacteristicStateItemModule *)self sourceServiceItem];
      id v5 = [v4 services];
      uint64_t v6 = [v5 count];

      if (v6 == 1)
      {
        id v7 = objc_alloc(MEMORY[0x1E4F69030]);
        uint64_t v8 = [(HUServiceDetailsItemModule *)self home];
        v9 = objc_msgSend(v8, "hf_characteristicValueManager");
        v10 = [(HUServiceDetailsControlAndCharacteristicStateItemModule *)self sourceServiceItem];
        id v11 = [v10 services];
        id v12 = [v11 anyObject];
        id v13 = (HFCharacteristicStateItemProvider *)[v7 initWithValueSource:v9 service:v12];
LABEL_7:
        v18 = self->_characteristicStateItemProvider;
        self->_characteristicStateItemProvider = v13;

        goto LABEL_8;
      }
      id v14 = [(HUServiceDetailsControlAndCharacteristicStateItemModule *)self sourceServiceItem];
      v15 = [v14 accessories];
      uint64_t v16 = [v15 count];

      if (v16 == 1)
      {
        id v17 = objc_alloc(MEMORY[0x1E4F69030]);
        uint64_t v8 = [(HUServiceDetailsItemModule *)self home];
        v9 = objc_msgSend(v8, "hf_characteristicValueManager");
        v10 = [(HUServiceDetailsControlAndCharacteristicStateItemModule *)self sourceServiceItem];
        id v11 = [v10 accessories];
        id v12 = [v11 anyObject];
        id v13 = (HFCharacteristicStateItemProvider *)[v17 initWithValueSource:v9 accessory:v12];
        goto LABEL_7;
      }
    }
LABEL_8:
    characteristicStateItemProvider = self->_characteristicStateItemProvider;
  }
  objc_super v19 = characteristicStateItemProvider;

  return v19;
}

- (id)itemProviders
{
  itemProviders = self->_itemProviders;
  if (itemProviders)
  {
    id v3 = itemProviders;
  }
  else
  {
    id v5 = objc_opt_new();
    uint64_t v6 = [(HUServiceDetailsControlAndCharacteristicStateItemModule *)self controlPanelItemProvider];
    objc_msgSend(v5, "na_safeAddObject:", v6);

    id v7 = [(HUServiceDetailsControlAndCharacteristicStateItemModule *)self characteristicStateItemProvider];
    objc_msgSend(v5, "na_safeAddObject:", v7);

    uint64_t v8 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];
    v9 = self->_itemProviders;
    self->_itemProviders = v8;

    id v3 = self->_itemProviders;
  }

  return v3;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HUServiceDetailsControlAndCharacteristicStateItemModule *)self controlPanelItemProvider];
  uint64_t v6 = [v5 items];
  id v7 = objc_msgSend(v6, "na_setByIntersectingWithSet:", v4);
  uint64_t v8 = (void *)[v7 mutableCopy];

  v9 = [(HUServiceDetailsControlAndCharacteristicStateItemModule *)self characteristicStateItemProvider];
  v10 = [v9 items];
  id v11 = objc_msgSend(v10, "na_setByIntersectingWithSet:", v4);
  [v8 unionSet:v11];

  id v12 = [v8 objectsPassingTest:&__block_literal_global_178];
  [v8 minusSet:v12];

  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __91__HUServiceDetailsControlAndCharacteristicStateItemModule_buildSectionsWithDisplayedItems___block_invoke_2;
  v37[3] = &unk_1E6386108;
  id v31 = v4;
  id v38 = v31;
  id v13 = (id)objc_msgSend(v8, "na_filter:", v37);
  id v14 = objc_opt_new();
  v32 = self;
  v15 = [(HUServiceDetailsControlAndCharacteristicStateItemModule *)self _createGroupCharacteristicSectionsForItems:v8];
  [v14 addObjectsFromArray:v15];
  uint64_t v16 = (void *)[v8 mutableCopy];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v17 = v15;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v34;
    uint64_t v21 = MEMORY[0x1E4F1CBF0];
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v34 != v20) {
          objc_enumerationMutation(v17);
        }
        v23 = (void *)MEMORY[0x1E4F1CAD0];
        uint64_t v24 = [*(id *)(*((void *)&v33 + 1) + 8 * i) items];
        v25 = (void *)v24;
        if (v24) {
          uint64_t v26 = v24;
        }
        else {
          uint64_t v26 = v21;
        }
        v27 = [v23 setWithArray:v26];
        [v16 minusSet:v27];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v33 objects:v39 count:16];
    }
    while (v19);
  }

  v28 = [(HUServiceDetailsControlAndCharacteristicStateItemModule *)v32 _createStandaloneCharacteristicSectionsForItems:v16];
  [v14 addObjectsFromArray:v28];

  v29 = (void *)[v14 copy];

  return v29;
}

BOOL __91__HUServiceDetailsControlAndCharacteristicStateItemModule_buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 latestResults];
  BOOL v3 = v2 == 0;

  return v3;
}

uint64_t __91__HUServiceDetailsControlAndCharacteristicStateItemModule_buildSectionsWithDisplayedItems___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

- (id)_createGroupCharacteristicSectionsForItems:(id)a3
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v45 = objc_opt_new();
  id v4 = objc_opt_new();
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  obuint64_t j = v3;
  uint64_t v46 = [obj countByEnumeratingWithState:&v65 objects:v79 count:16];
  if (v46)
  {
    uint64_t v44 = *(void *)v66;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v66 != v44) {
          objc_enumerationMutation(obj);
        }
        uint64_t v47 = v5;
        uint64_t v6 = *(void **)(*((void *)&v65 + 1) + 8 * v5);
        id v7 = [v6 latestResults];

        if (!v7) {
          NSLog(&cfstr_ItemHasNotBeen.isa, v6);
        }
        uint64_t v8 = [(HUServiceDetailsControlAndCharacteristicStateItemModule *)self _allCharacteristicTypesForItem:v6];
        [v45 unionSet:v8];
        long long v63 = 0u;
        long long v64 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        id v49 = v8;
        uint64_t v9 = [v49 countByEnumeratingWithState:&v61 objects:v78 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v62;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v62 != v11) {
                objc_enumerationMutation(v49);
              }
              uint64_t v13 = *(void *)(*((void *)&v61 + 1) + 8 * i);
              id v14 = [(HUServiceDetailsItemModule *)self sourceItem];
              if ([v14 conformsToProtocol:&unk_1F1A3D558]) {
                v15 = v14;
              }
              else {
                v15 = 0;
              }
              id v16 = v15;

              id v17 = [(HUServiceDetailsItemModule *)self home];
              uint64_t v18 = [v16 homeKitObject];

              uint64_t v19 = [v18 uniqueIdentifier];
              uint64_t v20 = objc_msgSend(v17, "hf_serviceWithIdentifier:", v19);

              uint64_t v21 = [v20 accessory];
              LODWORD(v19) = [v21 supportsCHIP];

              if (!v19)
              {
                uint64_t v26 = [v4 objectForKeyedSubscript:v13];

                if (!v26) {
                  goto LABEL_25;
                }
                uint64_t v24 = objc_msgSend(MEMORY[0x1E4F2E770], "hf_descriptionForCharacteristicType:", v13);
                NSLog(&cfstr_DuplicateItems.isa, v24);
                goto LABEL_24;
              }
              v22 = HFLogForCategory();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315394;
                v71 = "-[HUServiceDetailsControlAndCharacteristicStateItemModule _createGroupCharacteristicSectionsForItems:]";
                __int16 v72 = 2112;
                uint64_t v73 = v13;
                _os_log_impl(&dword_1BE345000, v22, OS_LOG_TYPE_DEFAULT, "%s: Skipping assertion for matter accessory duplicate characteristic type: %@", buf, 0x16u);
              }

              v23 = [v4 objectForKeyedSubscript:v13];

              if (v23)
              {
                uint64_t v24 = HFLogForCategory();
                if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
                {
                  v25 = [v4 objectForKeyedSubscript:v13];
                  *(_DWORD *)buf = 136315906;
                  v71 = "-[HUServiceDetailsControlAndCharacteristicStateItemModule _createGroupCharacteristicSectionsForItems:]";
                  __int16 v72 = 2112;
                  uint64_t v73 = v13;
                  __int16 v74 = 2112;
                  v75 = v6;
                  __int16 v76 = 2112;
                  v77 = v25;
                  _os_log_error_impl(&dword_1BE345000, v24, OS_LOG_TYPE_ERROR, "%s: Duplicate characteristic found. Characteristic type: %@, current item: %@, existingItem: %@", buf, 0x2Au);
                }
LABEL_24:
              }
LABEL_25:
              [v4 setObject:v6 forKeyedSubscript:v13];
            }
            uint64_t v10 = [v49 countByEnumeratingWithState:&v61 objects:v78 count:16];
          }
          while (v10);
        }

        uint64_t v5 = v47 + 1;
      }
      while (v47 + 1 != v46);
      uint64_t v46 = [obj countByEnumeratingWithState:&v65 objects:v79 count:16];
    }
    while (v46);
  }

  id v50 = (id)objc_opt_new();
  v48 = objc_opt_new();
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v27 = v45;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v57 objects:v69 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v58;
    do
    {
      for (uint64_t j = 0; j != v29; ++j)
      {
        if (*(void *)v58 != v30) {
          objc_enumerationMutation(v27);
        }
        uint64_t v32 = *(void *)(*((void *)&v57 + 1) + 8 * j);
        long long v33 = [MEMORY[0x1E4F69028] characteristicGroupForCharacteristicType:v32];
        if (v33)
        {
          [v50 addObject:v33];
          long long v34 = [v33 identifier];
          long long v35 = objc_msgSend(v48, "na_objectForKey:withDefaultValue:", v34, &__block_literal_global_114_1);
          [v35 addObject:v32];
        }
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v57 objects:v69 count:16];
    }
    while (v29);
  }
  long long v36 = v27;

  v37 = [(HUServiceDetailsControlAndCharacteristicStateItemModule *)self _characteristicStateItemComparator];
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __102__HUServiceDetailsControlAndCharacteristicStateItemModule__createGroupCharacteristicSectionsForItems___block_invoke_2;
  v52[3] = &unk_1E638DFE8;
  id v53 = v48;
  id v54 = v4;
  v55 = self;
  id v56 = v37;
  id v38 = v37;
  id v39 = v4;
  id v40 = v48;
  v41 = objc_msgSend(v50, "na_map:", v52);

  return v41;
}

id __102__HUServiceDetailsControlAndCharacteristicStateItemModule__createGroupCharacteristicSectionsForItems___block_invoke()
{
  v0 = objc_opt_new();

  return v0;
}

id __102__HUServiceDetailsControlAndCharacteristicStateItemModule__createGroupCharacteristicSectionsForItems___block_invoke_2(uint64_t a1, void *a2)
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 identifier];
  uint64_t v5 = [@"CharacteristicGroup-" stringByAppendingString:v4];

  uint64_t v26 = (void *)v5;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:v5];
  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = [v3 identifier];
  uint64_t v9 = [v7 objectForKeyedSubscript:v8];

  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __102__HUServiceDetailsControlAndCharacteristicStateItemModule__createGroupCharacteristicSectionsForItems___block_invoke_3;
  v27[3] = &unk_1E638DFC0;
  id v28 = *(id *)(a1 + 40);
  uint64_t v10 = objc_msgSend(v9, "na_map:", v27);
  uint64_t v11 = [v10 allObjects];
  id v12 = [v11 sortedArrayUsingComparator:*(void *)(a1 + 56)];
  [v6 setItems:v12];

  uint64_t v13 = objc_msgSend(v10, "na_filter:", &__block_literal_global_118_0);
  if ((unint64_t)[v13 count] >= 2) {
    NSLog(&cfstr_MultipleContro.isa, v3);
  }
  id v14 = [v13 anyObject];
  if (v14)
  {
    v15 = [*(id *)(a1 + 48) delegate];
    id v16 = *(void **)(a1 + 48);
    id v17 = [v16 sourceItem];
    uint64_t v18 = [v15 controlAndCharacteristicStateItemModule:v16 sectionTitleForControlPanelItem:v14 forServiceItem:v17];

    uint64_t v19 = [*(id *)(a1 + 48) delegate];
    uint64_t v20 = *(void **)(a1 + 48);
    uint64_t v21 = [v20 sourceItem];
    v22 = [v19 controlAndCharacteristicStateItemModule:v20 sectionFooterForControlPanelItem:v14 forServiceItem:v21];
  }
  else
  {
    if ([v10 count] == 1)
    {
      uint64_t v18 = 0;
    }
    else
    {
      uint64_t v18 = [v3 title];
    }
    v22 = 0;
  }
  [v6 setHeaderTitle:v18];
  [v6 setFooterTitle:v22];
  uint64_t v29 = @"HUServiceDetailsItemModuleTitleForSectionSortingUserInfoKey";
  v23 = [v3 title];
  v30[0] = v23;
  uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
  [v6 setUserInfo:v24];

  return v6;
}

uint64_t __102__HUServiceDetailsControlAndCharacteristicStateItemModule__createGroupCharacteristicSectionsForItems___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
}

uint64_t __102__HUServiceDetailsControlAndCharacteristicStateItemModule__createGroupCharacteristicSectionsForItems___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_createStandaloneCharacteristicSectionsForItems:(id)a3
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __107__HUServiceDetailsControlAndCharacteristicStateItemModule__createStandaloneCharacteristicSectionsForItems___block_invoke;
  v6[3] = &unk_1E638E010;
  v6[4] = self;
  id v3 = objc_msgSend(a3, "na_map:", v6);
  id v4 = [v3 allObjects];

  return v4;
}

id __107__HUServiceDetailsControlAndCharacteristicStateItemModule__createStandaloneCharacteristicSectionsForItems___block_invoke(uint64_t a1, void *a2)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 latestResults];

  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v3;
      uint64_t v6 = [v5 uniqueIdentifier];
      id v7 = [@"ControlPanel-" stringByAppendingString:v6];

      uint64_t v8 = [*(id *)(a1 + 32) delegate];
      int v9 = [v8 controlAndCharacteristicStateItemModule:*(void *)(a1 + 32) shouldShowSectionTitleForControlPanelItem:v5];

      if (!v9)
      {
        uint64_t v11 = 0;
        goto LABEL_10;
      }
      uint64_t v10 = [v5 latestResults];
      uint64_t v11 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
LABEL_8:

LABEL_10:
      id v14 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:v7];
      [v14 setHeaderTitle:v11];
      uint64_t v19 = @"HUServiceDetailsItemModuleTitleForSectionSortingUserInfoKey";
      v20[0] = v7;
      v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
      [v14 setUserInfo:v15];

      id v18 = v3;
      id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
      [v14 setItems:v16];

      goto LABEL_13;
    }
    id v5 = [*(id *)(a1 + 32) _allCharacteristicTypesForItem:v3];
    if ([v5 count])
    {
      id v12 = [v5 allObjects];
      uint64_t v13 = [v12 sortedArrayUsingComparator:&__block_literal_global_130_0];
      uint64_t v10 = [v13 componentsJoinedByString:@"_"];

      id v7 = [@"CharacteristicItem-" stringByAppendingString:v10];
      uint64_t v11 = 0;
      goto LABEL_8;
    }
    NSLog(&cfstr_NoCharacterist_0.isa, v3);
  }
  else
  {
    NSLog(&cfstr_ItemHasNotBeen.isa, v3);
  }
  id v14 = 0;
LABEL_13:

  return v14;
}

uint64_t __107__HUServiceDetailsControlAndCharacteristicStateItemModule__createStandaloneCharacteristicSectionsForItems___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = NSNumber;
  id v5 = (void *)MEMORY[0x1E4F2E770];
  id v6 = a3;
  id v7 = objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v5, "hf_sortPriorityForCharacteristicType:", a2));
  uint64_t v8 = NSNumber;
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F2E770], "hf_sortPriorityForCharacteristicType:", v6);

  uint64_t v10 = [v8 numberWithInteger:v9];
  uint64_t v11 = [v7 compare:v10];

  return v11;
}

- (id)_allCharacteristicTypesForItem:(id)a3
{
  id v4 = a3;
  id v5 = [v4 latestResults];
  id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F688D8]];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [MEMORY[0x1E4F1CAD0] set];
  }
  uint64_t v9 = v8;

  uint64_t v10 = [(HUServiceDetailsControlAndCharacteristicStateItemModule *)self delegate];
  uint64_t v11 = [v10 controlAndCharacteristicStateItemModule:self childItemsForItem:v4];

  id v12 = objc_msgSend(v11, "na_flatMap:", &__block_literal_global_142_2);

  uint64_t v13 = [v9 setByAddingObjectsFromSet:v12];

  return v13;
}

id __90__HUServiceDetailsControlAndCharacteristicStateItemModule__allCharacteristicTypesForItem___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 latestResults];
  id v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F688D8]];

  return v3;
}

- (id)_characteristicStateItemComparator
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __93__HUServiceDetailsControlAndCharacteristicStateItemModule__characteristicStateItemComparator__block_invoke;
  aBlock[3] = &unk_1E638E058;
  aBlock[4] = self;
  id v2 = _Block_copy(aBlock);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __93__HUServiceDetailsControlAndCharacteristicStateItemModule__characteristicStateItemComparator__block_invoke_2;
  v6[3] = &unk_1E638E080;
  id v7 = v2;
  id v3 = v2;
  id v4 = _Block_copy(v6);

  return v4;
}

uint64_t __93__HUServiceDetailsControlAndCharacteristicStateItemModule__characteristicStateItemComparator__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) _allCharacteristicTypesForItem:a2];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    uint64_t v6 = -1000;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = objc_msgSend(MEMORY[0x1E4F2E770], "hf_sortPriorityForCharacteristicType:", *(void *)(*((void *)&v10 + 1) + 8 * i));
        if (v6 <= v8) {
          uint64_t v6 = v8;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    uint64_t v6 = -1000;
  }

  return v6;
}

uint64_t __93__HUServiceDetailsControlAndCharacteristicStateItemModule__characteristicStateItemComparator__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v8 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (v7 == v8)
  {
    uint64_t v9 = [v5 latestResults];
    uint64_t v10 = *MEMORY[0x1E4F68AB8];
    long long v11 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];

    long long v12 = [v6 latestResults];
    long long v13 = [v12 objectForKeyedSubscript:v10];

    uint64_t v14 = [v11 localizedStandardCompare:v13];
  }
  else
  {
    long long v11 = [NSNumber numberWithInteger:v8];
    long long v13 = [NSNumber numberWithInteger:v7];
    uint64_t v14 = [v11 compare:v13];
  }
  uint64_t v15 = v14;

  return v15;
}

- (HUServiceDetailsControlAndCharacteristicStateItemModuleDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUServiceDetailsControlAndCharacteristicStateItemModuleDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_itemProviders, 0);
  objc_storeStrong((id *)&self->_controlPanelItemProvider, 0);

  objc_storeStrong((id *)&self->_characteristicStateItemProvider, 0);
}

@end