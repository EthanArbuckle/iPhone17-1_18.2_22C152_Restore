@interface HUCameraPermissionsSettingsModule
- (BOOL)isItemHeader:(id)a3;
- (HFItemProvider)headerItemProvider;
- (HMHome)home;
- (HUCameraPermissionsSettingsModule)initWithItemUpdater:(id)a3;
- (HUCameraPermissionsSettingsModule)initWithItemUpdater:(id)a3 home:(id)a4 displayStyle:(unint64_t)a5;
- (NSArray)userSectionModules;
- (NSSet)itemProviders;
- (id)buildSectionsWithDisplayedItems:(id)a3;
- (id)didSelectItem:(id)a3;
- (unint64_t)accessModeSettingForUser:(id)a3;
- (unint64_t)displayStyle;
- (void)_buildItemProviders;
- (void)setHeaderItemProvider:(id)a3;
- (void)setItemProviders:(id)a3;
- (void)setUserSectionModules:(id)a3;
@end

@implementation HUCameraPermissionsSettingsModule

- (HUCameraPermissionsSettingsModule)initWithItemUpdater:(id)a3 home:(id)a4 displayStyle:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  if (!v10)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"HUCameraPermissionsSettingsModule.m", 24, @"Invalid parameter not satisfying: %@", @"home != nil" object file lineNumber description];
  }
  v16.receiver = self;
  v16.super_class = (Class)HUCameraPermissionsSettingsModule;
  v11 = [(HFItemModule *)&v16 initWithItemUpdater:v9];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_home, a4);
    userSectionModules = v12->_userSectionModules;
    v12->_userSectionModules = (NSArray *)MEMORY[0x1E4F1CBF0];

    v12->_displayStyle = a5;
    [(HUCameraPermissionsSettingsModule *)v12 _buildItemProviders];
  }

  return v12;
}

- (HUCameraPermissionsSettingsModule)initWithItemUpdater:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_initWithItemUpdater_home_displayStyle_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUCameraPermissionsSettingsModule.m", 38, @"%s is unavailable; use %@ instead",
    "-[HUCameraPermissionsSettingsModule initWithItemUpdater:]",
    v6);

  return 0;
}

- (BOOL)isItemHeader:(id)a3
{
  id v4 = a3;
  v5 = [(HUCameraPermissionsSettingsModule *)self headerItemProvider];
  v6 = [v5 items];
  char v7 = [v6 containsObject:v4];

  return v7;
}

- (unint64_t)accessModeSettingForUser:(id)a3
{
  id v4 = a3;
  v5 = [(HUCameraPermissionsSettingsModule *)self home];
  v6 = [v5 homeAccessControlForUser:v4];

  unint64_t v7 = [v6 camerasAccessLevel];
  return v7;
}

- (void)_buildItemProviders
{
  id v4 = objc_alloc(MEMORY[0x1E4F695C8]);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __56__HUCameraPermissionsSettingsModule__buildItemProviders__block_invoke;
  v26[3] = &unk_1E63858C8;
  v26[4] = self;
  v5 = __56__HUCameraPermissionsSettingsModule__buildItemProviders__block_invoke((uint64_t)v26);
  v6 = (void *)[v4 initWithItems:v5];
  [(HUCameraPermissionsSettingsModule *)self setHeaderItemProvider:v6];

  unint64_t v7 = [(HUCameraPermissionsSettingsModule *)self home];
  v8 = objc_msgSend(v7, "hf_allNonOwnerUsers");
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __56__HUCameraPermissionsSettingsModule__buildItemProviders__block_invoke_2;
  v24[3] = &unk_1E63858F0;
  id v25 = v7;
  id v9 = v7;
  id v10 = objc_msgSend(v8, "na_filter:", v24);

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __56__HUCameraPermissionsSettingsModule__buildItemProviders__block_invoke_3;
  v23[3] = &unk_1E6385918;
  v23[4] = self;
  v11 = objc_msgSend(v10, "na_map:", v23);
  [(HUCameraPermissionsSettingsModule *)self setUserSectionModules:v11];

  v12 = (void *)MEMORY[0x1E4F1CAD0];
  v13 = [(HUCameraPermissionsSettingsModule *)self expandableModules];
  v14 = [v12 setWithArray:v13];
  v15 = objc_msgSend(v14, "na_flatMap:", &__block_literal_global_11);
  objc_super v16 = [(HUCameraPermissionsSettingsModule *)self headerItemProvider];
  v17 = [v15 setByAddingObject:v16];
  [(HUCameraPermissionsSettingsModule *)self setItemProviders:v17];

  v18 = (void *)MEMORY[0x1E4F69230];
  v19 = [(HUCameraPermissionsSettingsModule *)self itemProviders];
  v20 = [v18 requestToReloadItemProviders:v19 senderSelector:a2];

  v21 = [(HFItemModule *)self itemUpdater];
  id v22 = (id)[v21 performItemUpdateRequest:v20];
}

id __56__HUCameraPermissionsSettingsModule__buildItemProviders__block_invoke(uint64_t a1)
{
  v15[2] = *MEMORY[0x1E4F143B8];
  v2 = _HULocalizedStringWithDefaultValue(@"HUCameraPermissionsSettingsHeader_Title", @"HUCameraPermissionsSettingsHeader_Title", 1);
  v3 = _HULocalizedStringWithDefaultValue(@"HUCameraPermissionsSettingsHeader_Body", @"HUCameraPermissionsSettingsHeader_Body", 1);
  id v4 = HUCameraBuildHeaderAttributedString(2, v2, v3);
  id v5 = objc_alloc(MEMORY[0x1E4F695C0]);
  uint64_t v6 = *MEMORY[0x1E4F68980];
  v15[0] = v4;
  uint64_t v7 = *MEMORY[0x1E4F68B10];
  v14[0] = v6;
  v14[1] = v7;
  uint64_t v8 = [*(id *)(a1 + 32) displayStyle];
  uint64_t v9 = MEMORY[0x1E4F1CC38];
  if (v8 == 2) {
    uint64_t v9 = MEMORY[0x1E4F1CC28];
  }
  v15[1] = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
  v11 = (void *)[v5 initWithResults:v10];

  v12 = [MEMORY[0x1E4F1CAD0] setWithObject:v11];

  return v12;
}

uint64_t __56__HUCameraPermissionsSettingsModule__buildItemProviders__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "hf_userIsRestrictedGuest:", a2) ^ 1;
}

HUCameraUserPermissionsSettingsModule *__56__HUCameraPermissionsSettingsModule__buildItemProviders__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [HUCameraUserPermissionsSettingsModule alloc];
  id v5 = [*(id *)(a1 + 32) itemUpdater];
  uint64_t v6 = [*(id *)(a1 + 32) home];
  uint64_t v7 = [(HUCameraUserPermissionsSettingsModule *)v4 initWithItemUpdater:v5 user:v3 home:v6];

  return v7;
}

uint64_t __56__HUCameraPermissionsSettingsModule__buildItemProviders__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 itemProviders];
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"PermissionsOptionsHeader"];
  uint64_t v6 = [(HUCameraPermissionsSettingsModule *)self headerItemProvider];
  uint64_t v7 = [v6 items];
  uint64_t v8 = [v7 allObjects];
  [v5 setItems:v8];

  uint64_t v9 = objc_opt_new();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v10 = [(HUCameraPermissionsSettingsModule *)self expandableModules];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = [*(id *)(*((void *)&v22 + 1) + 8 * i) buildSectionsWithDisplayedItems:v4];
        objc_super v16 = objc_msgSend(v15, "na_flatMap:", &__block_literal_global_35_0);
        [v9 addObjectsFromArray:v16];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v12);
  }

  v17 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"PermissionsOptions"];
  [v17 setItems:v9];
  v18 = (void *)MEMORY[0x1E4F69220];
  v26[0] = v5;
  v26[1] = v17;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
  v20 = [v18 filterSections:v19 toDisplayedItems:v4];

  return v20;
}

uint64_t __69__HUCameraPermissionsSettingsModule_buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2)
{
  return [a2 items];
}

- (id)didSelectItem:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1;
  objc_super v16 = __Block_byref_object_dispose__1;
  id v17 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  id v5 = [(HUCameraPermissionsSettingsModule *)self expandableModules];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__HUCameraPermissionsSettingsModule_didSelectItem___block_invoke;
  v9[3] = &unk_1E6385980;
  uint64_t v11 = &v12;
  id v6 = v4;
  id v10 = v6;
  objc_msgSend(v5, "na_each:", v9);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __51__HUCameraPermissionsSettingsModule_didSelectItem___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v9 = v3;
  if (objc_opt_isKindOfClass()) {
    id v4 = v9;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = [v5 didSelectItem:*(void *)(a1 + 32)];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
}

- (NSSet)itemProviders
{
  return self->_itemProviders;
}

- (void)setItemProviders:(id)a3
{
}

- (unint64_t)displayStyle
{
  return self->_displayStyle;
}

- (HMHome)home
{
  return self->_home;
}

- (HFItemProvider)headerItemProvider
{
  return self->_headerItemProvider;
}

- (void)setHeaderItemProvider:(id)a3
{
}

- (NSArray)userSectionModules
{
  return self->_userSectionModules;
}

- (void)setUserSectionModules:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userSectionModules, 0);
  objc_storeStrong((id *)&self->_headerItemProvider, 0);
  objc_storeStrong((id *)&self->_home, 0);

  objc_storeStrong((id *)&self->_itemProviders, 0);
}

@end