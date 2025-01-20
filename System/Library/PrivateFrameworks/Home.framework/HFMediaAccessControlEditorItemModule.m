@interface HFMediaAccessControlEditorItemModule
+ (id)_descriptionFooterTextForAccessControlDescriptor:(id)a3 hasNonPeerToPeerMediaAccessories:(BOOL)a4;
- (BOOL)_hasNonPeerToPeerMediaAccessories;
- (BOOL)containsItem:(id)a3;
- (HFMediaAccessControlEditorItemModule)initWithItemUpdater:(id)a3;
- (HFMediaAccessControlEditorItemModule)initWithItemUpdater:(id)a3 home:(id)a4;
- (HFMediaAccessControlEditorItemProvider)accessControlEditorItemProvider;
- (HMHome)home;
- (id)buildSectionsWithDisplayedItems:(id)a3;
- (id)itemProviders;
- (id)updateAccessControlDescriptor:(id)a3;
- (void)home:(id)a3 didUpdateMediaPassword:(id)a4;
- (void)home:(id)a3 didUpdateMediaPeerToPeerEnabled:(BOOL)a4;
- (void)home:(id)a3 didUpdateMinimumMediaUserPrivilege:(int64_t)a4;
@end

@implementation HFMediaAccessControlEditorItemModule

- (HFMediaAccessControlEditorItemModule)initWithItemUpdater:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_initWithItemUpdater_home_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFMediaAccessControlEditorItemModule.m", 28, @"%s is unavailable; use %@ instead",
    "-[HFMediaAccessControlEditorItemModule initWithItemUpdater:]",
    v6);

  return 0;
}

- (HFMediaAccessControlEditorItemModule)initWithItemUpdater:(id)a3 home:(id)a4
{
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HFMediaAccessControlEditorItemModule;
  v8 = [(HFItemModule *)&v14 initWithItemUpdater:a3];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_home, a4);
    v10 = [[HFMediaAccessControlEditorItemProvider alloc] initWithHome:v7];
    accessControlEditorItemProvider = v9->_accessControlEditorItemProvider;
    v9->_accessControlEditorItemProvider = v10;

    v12 = +[HFHomeKitDispatcher sharedDispatcher];
    [v12 addHomeObserver:v9];
  }
  return v9;
}

- (id)itemProviders
{
  itemProviders = self->_itemProviders;
  if (itemProviders)
  {
    v3 = itemProviders;
  }
  else
  {
    v5 = (NSSet *)objc_opt_new();
    v6 = [(HFMediaAccessControlEditorItemModule *)self accessControlEditorItemProvider];
    [(NSSet *)v5 na_safeAddObject:v6];

    id v7 = self->_itemProviders;
    self->_itemProviders = v5;
    v8 = v5;

    v3 = self->_itemProviders;
  }
  return v3;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  v43[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = (void *)MEMORY[0x263EFFA08];
  id v7 = [(HFMediaAccessControlEditorItemModule *)self accessControlEditorItemProvider];
  v8 = [v7 accessControlItems];
  v9 = [v6 setWithArray:v8];

  v10 = (void *)MEMORY[0x263EFFA08];
  v11 = [(HFMediaAccessControlEditorItemModule *)self accessControlEditorItemProvider];
  v12 = [v11 passwordEnableItem];
  v13 = [(HFMediaAccessControlEditorItemModule *)self accessControlEditorItemProvider];
  objc_super v14 = [v13 passwordItem];
  v15 = objc_msgSend(v10, "setWithObjects:", v12, v14, 0);

  int v16 = [v15 intersectsSet:v4];
  v38 = v9;
  v17 = 0;
  if ([v9 intersectsSet:v4])
  {
    v17 = [(HFItemSection *)[HFMutableItemSection alloc] initWithIdentifier:@"ACCESS_CONTROL_SECTION"];
    v23 = [(HFMediaAccessControlEditorItemModule *)self accessControlEditorItemProvider];
    v24 = [v23 accessControlItems];
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __72__HFMediaAccessControlEditorItemModule_buildSectionsWithDisplayedItems___block_invoke;
    v41[3] = &unk_26408EC60;
    id v42 = v4;
    objc_msgSend(v24, "na_filter:", v41);
    v26 = v25 = v5;
    [(HFItemSection *)v17 setItems:v26];

    v5 = v25;
    v27 = _HFLocalizedStringWithDefaultValue(@"HFMediaAccessControlItemDisplayTitle", @"HFMediaAccessControlItemDisplayTitle", 1);
    [(HFItemSection *)v17 setHeaderTitle:v27];

    [v25 addObject:v17];
    if (!v16)
    {
LABEL_3:
      if (!v17) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if (!v16)
  {
    goto LABEL_3;
  }
  v37 = [(HFItemSection *)[HFMutableItemSection alloc] initWithIdentifier:@"ACCESS_CONTROL_PASSWORD_SECTION"];
  v28 = [(HFMediaAccessControlEditorItemModule *)self accessControlEditorItemProvider];
  [v28 passwordEnableItem];
  v29 = v4;
  v30 = v15;
  v32 = v31 = v5;
  v43[0] = v32;
  v33 = [(HFMediaAccessControlEditorItemModule *)self accessControlEditorItemProvider];
  v34 = [v33 passwordItem];
  v43[1] = v34;
  v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:2];

  v5 = v31;
  v15 = v30;
  id v4 = v29;

  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __72__HFMediaAccessControlEditorItemModule_buildSectionsWithDisplayedItems___block_invoke_2;
  v39[3] = &unk_26408EC60;
  id v40 = v29;
  v36 = objc_msgSend(v35, "na_filter:", v39);
  [(HFItemSection *)v37 setItems:v36];

  [v5 addObject:v37];
  v17 = v37;
  if (v37)
  {
LABEL_4:
    v18 = objc_opt_class();
    v19 = [(HFMediaAccessControlEditorItemModule *)self home];
    v20 = objc_msgSend(v19, "hf_accessControlDescriptor");
    v21 = objc_msgSend(v18, "_descriptionFooterTextForAccessControlDescriptor:hasNonPeerToPeerMediaAccessories:", v20, -[HFMediaAccessControlEditorItemModule _hasNonPeerToPeerMediaAccessories](self, "_hasNonPeerToPeerMediaAccessories"));
    [(HFItemSection *)v17 setFooterTitle:v21];
  }
LABEL_5:

  return v5;
}

uint64_t __72__HFMediaAccessControlEditorItemModule_buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

uint64_t __72__HFMediaAccessControlEditorItemModule_buildSectionsWithDisplayedItems___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

- (BOOL)containsItem:(id)a3
{
  id v4 = a3;
  v5 = [(HFMediaAccessControlEditorItemModule *)self itemProviders];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __53__HFMediaAccessControlEditorItemModule_containsItem___block_invoke;
  v9[3] = &unk_264090A00;
  id v10 = v4;
  id v6 = v4;
  char v7 = objc_msgSend(v5, "na_any:", v9);

  return v7;
}

uint64_t __53__HFMediaAccessControlEditorItemModule_containsItem___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 items];
  uint64_t v4 = [v3 containsObject:*(void *)(a1 + 32)];

  return v4;
}

- (id)updateAccessControlDescriptor:(id)a3
{
  id v5 = a3;
  id v6 = [(HFMediaAccessControlEditorItemModule *)self itemProviders];
  char v7 = +[HFItemUpdateRequest requestToReloadItemProviders:v6 senderSelector:a2];

  objc_initWeak(&location, self);
  v8 = [(HFMediaAccessControlEditorItemModule *)self home];
  v9 = objc_msgSend(v8, "hf_updateAccessControlDescriptor:", v5);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __70__HFMediaAccessControlEditorItemModule_updateAccessControlDescriptor___block_invoke;
  v13[3] = &unk_264090A28;
  objc_copyWeak(&v15, &location);
  id v10 = v7;
  id v14 = v10;
  v11 = [v9 addCompletionBlock:v13];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v11;
}

void __70__HFMediaAccessControlEditorItemModule_updateAccessControlDescriptor___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (a3)
  {
    id v4 = a3;
    id v5 = +[HFErrorHandler sharedHandler];
    [v5 handleError:v4];
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = [WeakRetained itemUpdater];
  id v7 = (id)[v6 performItemUpdateRequest:*(void *)(a1 + 32)];
}

- (BOOL)_hasNonPeerToPeerMediaAccessories
{
  v2 = [(HFMediaAccessControlEditorItemModule *)self home];
  v3 = [v2 accessories];
  char v4 = objc_msgSend(v3, "na_any:", &__block_literal_global_48);

  return v4;
}

BOOL __73__HFMediaAccessControlEditorItemModule__hasNonPeerToPeerMediaAccessories__block_invoke(uint64_t a1, void *a2)
{
  return (objc_msgSend(a2, "hf_mediaAccessControlCapabilities") & 3) == 1;
}

+ (id)_descriptionFooterTextForAccessControlDescriptor:(id)a3 hasNonPeerToPeerMediaAccessories:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  v8 = objc_opt_new();
  [v8 addObject:@"HFMediaAccessControlFooter"];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __122__HFMediaAccessControlEditorItemModule__descriptionFooterTextForAccessControlDescriptor_hasNonPeerToPeerMediaAccessories___block_invoke;
  v18[3] = &unk_264090A50;
  id v9 = v7;
  id v19 = v9;
  SEL v20 = a2;
  id v21 = a1;
  id v10 = __122__HFMediaAccessControlEditorItemModule__descriptionFooterTextForAccessControlDescriptor_hasNonPeerToPeerMediaAccessories___block_invoke((uint64_t)v18);
  [v8 addObject:v10];

  if ([v9 accessSupportsPassword])
  {
    uint64_t v16 = MEMORY[0x263EF8330];
    id v17 = v9;
    if (objc_msgSend(v17, "accessRequiresPassword", v16, 3221225472, __122__HFMediaAccessControlEditorItemModule__descriptionFooterTextForAccessControlDescriptor_hasNonPeerToPeerMediaAccessories___block_invoke_2, &unk_26408D648))v11 = @"WithPassword"; {
    else
    }
      v11 = @"NoPassword";
    [v8 addObject:v11];
  }
  if (![v9 access] && v4) {
    [v8 addObject:@"WithNonP2PAccessories"];
  }
  v12 = [v8 componentsJoinedByString:@"."];
  v13 = HFLocalizedWiFiStringKeyForKey(v12);
  id v14 = _HFLocalizedStringWithDefaultValue(v13, 0, 0);

  if (!v14)
  {
    id v14 = _HFLocalizedStringWithDefaultValue(v12, 0, 0);
  }

  return v14;
}

__CFString *__122__HFMediaAccessControlEditorItemModule__descriptionFooterTextForAccessControlDescriptor_hasNonPeerToPeerMediaAccessories___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) access];
  if (v2 == 3)
  {
    id v5 = [MEMORY[0x263F08690] currentHandler];
    [v5 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 48) file:@"HFMediaAccessControlEditorItemModule.m" lineNumber:147 description:@"This enum should never be hit."];

    return &stru_26C081158;
  }
  else
  {
    v3 = @"Everyone";
    if (v2 == 1) {
      v3 = @"SameNetwork";
    }
    if (v2 == 2) {
      return @"HomeUsersOnly";
    }
    else {
      return v3;
    }
  }
}

__CFString *__122__HFMediaAccessControlEditorItemModule__descriptionFooterTextForAccessControlDescriptor_hasNonPeerToPeerMediaAccessories___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) accessRequiresPassword]) {
    return @"WithPassword";
  }
  else {
    return @"NoPassword";
  }
}

- (void)home:(id)a3 didUpdateMinimumMediaUserPrivilege:(int64_t)a4
{
  id v6 = [(HFMediaAccessControlEditorItemModule *)self itemProviders];
  id v9 = +[HFItemUpdateRequest requestToReloadItemProviders:v6 senderSelector:a2];

  id v7 = [(HFItemModule *)self itemUpdater];
  id v8 = (id)[v7 performItemUpdateRequest:v9];
}

- (void)home:(id)a3 didUpdateMediaPeerToPeerEnabled:(BOOL)a4
{
  id v6 = [(HFMediaAccessControlEditorItemModule *)self itemProviders];
  id v9 = +[HFItemUpdateRequest requestToReloadItemProviders:v6 senderSelector:a2];

  id v7 = [(HFItemModule *)self itemUpdater];
  id v8 = (id)[v7 performItemUpdateRequest:v9];
}

- (void)home:(id)a3 didUpdateMediaPassword:(id)a4
{
  id v6 = (void *)MEMORY[0x263EFFA08];
  id v7 = [(HFMediaAccessControlEditorItemModule *)self accessControlEditorItemProvider];
  id v8 = [v7 passwordItem];
  id v9 = [(HFMediaAccessControlEditorItemModule *)self accessControlEditorItemProvider];
  id v10 = [v9 passwordEnableItem];
  v11 = objc_msgSend(v6, "setWithObjects:", v8, v10, 0);
  id v14 = +[HFItemUpdateRequest requestToUpdateItems:v11 senderSelector:a2];

  v12 = [(HFItemModule *)self itemUpdater];
  id v13 = (id)[v12 performItemUpdateRequest:v14];
}

- (HMHome)home
{
  return self->_home;
}

- (HFMediaAccessControlEditorItemProvider)accessControlEditorItemProvider
{
  return self->_accessControlEditorItemProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessControlEditorItemProvider, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_itemProviders, 0);
}

@end