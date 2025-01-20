@interface HUMediaSystemEditorGridItemManager
+ (id)defaultItemProviderCreatorForMediaSystemBuilder:(id)a3 options:(unint64_t)a4;
- (HFMediaSystemBuilder)mediaSystemBuilder;
- (HUMediaSystemEditorGridItemManager)initWithDelegate:(id)a3 shouldGroupByRoom:(BOOL)a4 itemProvidersCreator:(id)a5;
- (HUMediaSystemEditorGridItemManager)initWithMediaSystemBuilder:(id)a3 delegate:(id)a4;
- (NSSet)prioritizedRooms;
- (id)_itemsToHideInSet:(id)a3;
- (id)_roomComparator;
- (id)_sortedItems:(id)a3 forSectionIdentifier:(id)a4;
- (void)setPrioritizedRooms:(id)a3;
@end

@implementation HUMediaSystemEditorGridItemManager

+ (id)defaultItemProviderCreatorForMediaSystemBuilder:(id)a3 options:(unint64_t)a4
{
  id v7 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __94__HUMediaSystemEditorGridItemManager_defaultItemProviderCreatorForMediaSystemBuilder_options___block_invoke;
  v11[3] = &unk_1E638F4A8;
  id v12 = v7;
  unint64_t v13 = a4;
  id v14 = a1;
  SEL v15 = a2;
  id v8 = v7;
  v9 = _Block_copy(v11);

  return v9;
}

id __94__HUMediaSystemEditorGridItemManager_defaultItemProviderCreatorForMediaSystemBuilder_options___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __94__HUMediaSystemEditorGridItemManager_defaultItemProviderCreatorForMediaSystemBuilder_options___block_invoke_2;
  aBlock[3] = &unk_1E638F460;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v22 = v4;
  uint64_t v23 = v5;
  id v6 = a2;
  id v7 = _Block_copy(aBlock);
  id v8 = [MEMORY[0x1E4F1CA48] array];
  v9 = [*(id *)(a1 + 32) firstSetupSourceAccessory];
  uint64_t v10 = [v9 supportedStereoPairVersions];

  if (!v10)
  {
    v11 = HFLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = *(void *)(a1 + 48);
      v16 = NSStringFromSelector(*(SEL *)(a1 + 56));
      v17 = [*(id *)(a1 + 32) firstSetupSourceAccessory];
      *(_DWORD *)buf = 138412802;
      uint64_t v25 = v15;
      __int16 v26 = 2112;
      v27 = v16;
      __int16 v28 = 2112;
      v29 = v17;
      _os_log_error_impl(&dword_1BE345000, v11, OS_LOG_TYPE_ERROR, "%@:%@ Source HomePod has no stereo pairing versions: %@", buf, 0x20u);
    }
  }
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F69288]) initWithHome:v6];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __94__HUMediaSystemEditorGridItemManager_defaultItemProviderCreatorForMediaSystemBuilder_options___block_invoke_21;
  v18[3] = &__block_descriptor_56_e27_B16__0___HFHomeKitObject__8l;
  long long v19 = *(_OWORD *)(a1 + 48);
  uint64_t v20 = v10;
  [v12 setFilter:v18];
  unint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F696B0]) initWithSourceProvider:v12 transformationBlock:v7];
  [v8 addObject:v13];

  return v8;
}

id __94__HUMediaSystemEditorGridItemManager_defaultItemProviderCreatorForMediaSystemBuilder_options___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc((Class)objc_opt_class());
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __94__HUMediaSystemEditorGridItemManager_defaultItemProviderCreatorForMediaSystemBuilder_options___block_invoke_3;
  v10[3] = &unk_1E638F438;
  id v11 = v3;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v12 = v5;
  uint64_t v13 = v6;
  id v7 = v3;
  id v8 = (void *)[v4 initWithSourceItem:v7 transformationBlock:v10];

  return v8;
}

id __94__HUMediaSystemEditorGridItemManager_defaultItemProviderCreatorForMediaSystemBuilder_options___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = (void *)[a2 mutableCopy];
  objc_opt_class();
  id v4 = *(id *)(a1 + 32);
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  id v7 = [v6 mediaProfileContainer];
  id v8 = objc_msgSend(v7, "hf_backingAccessory");
  v9 = [*(id *)(a1 + 40) firstSetupSourceAccessory];

  if (v8 == v9) {
    uint64_t v10 = &unk_1F19B4B80;
  }
  else {
    uint64_t v10 = &unk_1F19B4B98;
  }
  [v3 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F68BC0]];
  uint64_t v11 = *(void *)(a1 + 48);
  if (v11)
  {
    [v3 removeObjectForKey:*MEMORY[0x1E4F68980]];
    uint64_t v11 = *(void *)(a1 + 48);
  }
  if ((v11 & 8) != 0)
  {
    uint64_t v12 = *MEMORY[0x1E4F689E8];
    uint64_t v13 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F689E8]];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = (objc_class *)MEMORY[0x1E4F691E0];
      id v15 = v13;
      id v16 = [v14 alloc];
      v17 = [v15 identifier];

      v18 = (void *)[v16 initWithIdentifier:v17 incrementalState:&unk_1F19B6290];
      [v3 setObject:v18 forKeyedSubscript:v12];
    }
  }
  uint64_t v30 = MEMORY[0x1E4F143A8];
  uint64_t v31 = 3221225472;
  v32 = __94__HUMediaSystemEditorGridItemManager_defaultItemProviderCreatorForMediaSystemBuilder_options___block_invoke_12;
  v33 = &unk_1E6388F60;
  id v19 = v3;
  id v34 = v19;
  id v35 = v7;
  id v20 = v7;
  if (__94__HUMediaSystemEditorGridItemManager_defaultItemProviderCreatorForMediaSystemBuilder_options___block_invoke_12((uint64_t)&v30))
  {
    uint64_t v21 = *MEMORY[0x1E4F68C40];
    id v22 = objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x1E4F68C40], v30, v31, v32, v33, v34, v35);

    if (v22)
    {
      uint64_t v23 = [v19 objectForKeyedSubscript:v21];
      v24 = [v23 underlyingError];
      [v19 setObject:v24 forKeyedSubscript:@"BADGE_REASON_ERROR"];
    }
    [v19 setObject:&unk_1F19B4BB0 forKeyedSubscript:*MEMORY[0x1E4F68940]];
    uint64_t v25 = *MEMORY[0x1E4F68938];
    __int16 v26 = v19;
    v27 = &unk_1F19B4BB0;
  }
  else
  {
    uint64_t v25 = *MEMORY[0x1E4F68940];
    __int16 v26 = v19;
    v27 = 0;
  }
  objc_msgSend(v26, "setObject:forKeyedSubscript:", v27, v25, v30, v31, v32, v33);
  __int16 v28 = (void *)[v19 copy];

  return v28;
}

uint64_t __94__HUMediaSystemEditorGridItemManager_defaultItemProviderCreatorForMediaSystemBuilder_options___block_invoke_12(uint64_t a1)
{
  uint64_t v2 = *MEMORY[0x1E4F68C40];
  id v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F68C40]];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v2];
    id v5 = [v4 underlyingSymptom];
    BOOL v6 = v5 == 0;
  }
  else
  {
    id v7 = objc_msgSend(*(id *)(a1 + 40), "hf_backingAccessory");
    id v8 = [v7 softwareVersion];
    int v9 = objc_msgSend(v8, "hf_softwareUpdateWouldSupportHomePodPairing");

    return v9 ^ 1u;
  }
  return v6;
}

BOOL __94__HUMediaSystemEditorGridItemManager_defaultItemProviderCreatorForMediaSystemBuilder_options___block_invoke_21(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_8;
  }
  id v4 = v3;
  id v5 = [v4 accessory];
  if ((objc_msgSend(v5, "hf_isHomePod") & 1) == 0)
  {

    goto LABEL_7;
  }
  BOOL v6 = (void *)MEMORY[0x1E4F2E920];
  id v7 = [v4 accessory];
  LODWORD(v6) = [v6 canSupportMediaSystem:v7];

  if (!v6)
  {
LABEL_7:

LABEL_8:
    BOOL v10 = 0;
    goto LABEL_9;
  }
  id v8 = [v4 accessory];
  uint64_t v9 = [v8 supportedStereoPairVersions];

  if (v9)
  {
    BOOL v10 = (*(void *)(a1 + 48) & v9) != 0;
  }
  else
  {
    uint64_t v12 = HFLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      id v14 = NSStringFromSelector(*(SEL *)(a1 + 40));
      id v15 = [v4 accessory];
      int v16 = 138412802;
      uint64_t v17 = v13;
      __int16 v18 = 2112;
      id v19 = v14;
      __int16 v20 = 2112;
      uint64_t v21 = v15;
      _os_log_error_impl(&dword_1BE345000, v12, OS_LOG_TYPE_ERROR, "%@:%@ Found HomePod has no stereo pairing versions: %@", (uint8_t *)&v16, 0x20u);
    }
    BOOL v10 = 0;
  }

LABEL_9:
  return v10;
}

- (HUMediaSystemEditorGridItemManager)initWithDelegate:(id)a3 shouldGroupByRoom:(BOOL)a4 itemProvidersCreator:(id)a5
{
  id v7 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5);
  id v8 = NSStringFromSelector(sel_initWithMediaSystemBuilder_delegate_);
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUMediaSystemEditorGridItemManager.m", 128, @"%s is unavailable; use %@ instead",
    "-[HUMediaSystemEditorGridItemManager initWithDelegate:shouldGroupByRoom:itemProvidersCreator:]",
    v8);

  return 0;
}

- (HUMediaSystemEditorGridItemManager)initWithMediaSystemBuilder:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = +[HUMediaSystemEditorGridItemManager defaultItemProviderCreatorForMediaSystemBuilder:v7 options:9];
  v15.receiver = self;
  v15.super_class = (Class)HUMediaSystemEditorGridItemManager;
  BOOL v10 = [(HUServiceGridItemManager *)&v15 initWithDelegate:v8 shouldGroupByRoom:1 itemProvidersCreator:v9];

  if (v10)
  {
    objc_storeStrong((id *)&v10->_mediaSystemBuilder, a3);
    uint64_t v11 = [(HUMediaSystemEditorGridItemManager *)v10 mediaSystemBuilder];
    uint64_t v12 = [v11 accessories];
    uint64_t v13 = objc_msgSend(v12, "na_map:", &__block_literal_global_215);
    [(HUMediaSystemEditorGridItemManager *)v10 setPrioritizedRooms:v13];
  }
  return v10;
}

uint64_t __74__HUMediaSystemEditorGridItemManager_initWithMediaSystemBuilder_delegate___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_parentRoom");
}

- (id)_itemsToHideInSet:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)HUMediaSystemEditorGridItemManager;
  id v5 = [(HUServiceGridItemManager *)&v30 _itemsToHideInSet:v4];
  id v24 = (id)[v5 mutableCopy];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(obj);
        }
        BOOL v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if (([v10 conformsToProtocol:&unk_1F1A3D3B8] & 1) == 0) {
          NSLog(&cfstr_ItemDoesnTConf_0.isa, v10);
        }
        if ([v10 conformsToProtocol:&unk_1F1A3D3B8])
        {
          id v11 = v10;
          uint64_t v12 = [v11 accessories];
          uint64_t v13 = [v12 count];

          id v14 = [v11 accessories];
          objc_super v15 = [v14 anyObject];

          if (v13 != 1) {
            goto LABEL_12;
          }
          int v16 = [(HUMediaSystemEditorGridItemManager *)self mediaSystemBuilder];
          uint64_t v17 = [v16 accessories];
          char v18 = [v17 containsObject:v15];

          if ((v18 & 1) == 0)
          {
            id v19 = [(HUMediaSystemEditorGridItemManager *)self mediaSystemBuilder];
            __int16 v20 = [v11 accessories];
            uint64_t v21 = [v20 anyObject];
            char v22 = [v19 shouldAllowAddingAccessory:v21];

            if ((v22 & 1) == 0) {
LABEL_12:
            }
              [v24 addObject:v11];
          }
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v7);
  }

  return v24;
}

- (id)_sortedItems:(id)a3 forSectionIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HUMediaSystemEditorGridItemManager *)self mediaSystemBuilder];
  uint64_t v9 = [v8 firstSetupSourceAccessory];

  if ((unint64_t)[v6 count] >= 2 && v9)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __72__HUMediaSystemEditorGridItemManager__sortedItems_forSectionIdentifier___block_invoke;
    v16[3] = &unk_1E6386108;
    id v17 = v9;
    BOOL v10 = objc_msgSend(v6, "na_firstObjectPassingTest:", v16);
    if (v10)
    {
      v14.receiver = self;
      v14.super_class = (Class)HUMediaSystemEditorGridItemManager;
      id v11 = [(HFItemManager *)&v14 _sortedItems:v6 forSectionIdentifier:v7];
      uint64_t v12 = (void *)[v11 mutableCopy];

      [v12 removeObject:v10];
      [v12 insertObject:v10 atIndex:0];
    }
    else
    {
      v15.receiver = self;
      v15.super_class = (Class)HUMediaSystemEditorGridItemManager;
      uint64_t v12 = [(HFItemManager *)&v15 _sortedItems:v6 forSectionIdentifier:v7];
    }
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)HUMediaSystemEditorGridItemManager;
    uint64_t v12 = [(HFItemManager *)&v18 _sortedItems:v6 forSectionIdentifier:v7];
  }

  return v12;
}

uint64_t __72__HUMediaSystemEditorGridItemManager__sortedItems_forSectionIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 conformsToProtocol:&unk_1F1A3D3B8]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;
  id v6 = [v5 accessories];

  uint64_t v7 = [v6 containsObject:*(void *)(a1 + 32)];
  return v7;
}

- (id)_roomComparator
{
  id v3 = [(HUMediaSystemEditorGridItemManager *)self prioritizedRooms];
  v12.receiver = self;
  v12.super_class = (Class)HUMediaSystemEditorGridItemManager;
  id v4 = [(HUServiceGridItemManager *)&v12 _roomComparator];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__HUMediaSystemEditorGridItemManager__roomComparator__block_invoke;
  v9[3] = &unk_1E638A928;
  id v10 = v3;
  id v11 = v4;
  id v5 = v4;
  id v6 = v3;
  uint64_t v7 = _Block_copy(v9);

  return v7;
}

uint64_t __53__HUMediaSystemEditorGridItemManager__roomComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = [*(id *)(a1 + 32) containsObject:v5];
  if (v7 == [*(id *)(a1 + 32) containsObject:v6])
  {
    uint64_t v8 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else if (v7)
  {
    uint64_t v8 = -1;
  }
  else
  {
    uint64_t v8 = 1;
  }

  return v8;
}

- (HFMediaSystemBuilder)mediaSystemBuilder
{
  return self->_mediaSystemBuilder;
}

- (NSSet)prioritizedRooms
{
  return self->_prioritizedRooms;
}

- (void)setPrioritizedRooms:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prioritizedRooms, 0);

  objc_storeStrong((id *)&self->_mediaSystemBuilder, 0);
}

@end