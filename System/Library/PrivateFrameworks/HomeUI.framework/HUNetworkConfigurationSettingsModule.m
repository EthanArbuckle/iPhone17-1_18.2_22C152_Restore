@interface HUNetworkConfigurationSettingsModule
+ (id)_allowedHostDescriptionForHostGroup:(id)a3;
+ (id)_attributedCheckmarkIcon;
+ (id)_attributedExclamationIcon;
+ (id)_attributedIconNamed:(id)a3;
- (BOOL)isItemNetworkProtectionModeOptionItem:(id)a3;
- (BOOL)isUpdatingProtectionMode;
- (HFNetworkConfigurationGroupItem)sourceItem;
- (HMAccessoryNetworkProtectionGroup)group;
- (HUNetworkConfigurationSettingsModule)initWithItemUpdater:(id)a3;
- (HUNetworkConfigurationSettingsModule)initWithItemUpdater:(id)a3 group:(id)a4;
- (HUNetworkConfigurationSettingsModuleDelegate)networkConfigurationSettingsModuleDelegate;
- (HUNetworkProtectionModeOptionItemProvider)networkProtectionModeOptionItemProvider;
- (NSTimer)updateProtectionModeTimer;
- (id)_protectionModeOptionSectionFooter;
- (id)buildSectionsWithDisplayedItems:(id)a3;
- (id)description;
- (id)itemProviders;
- (id)updateProtectionMode:(int64_t)a3;
- (void)setIsUpdatingProtectionMode:(BOOL)a3;
- (void)setNetworkConfigurationSettingsModuleDelegate:(id)a3;
- (void)setNetworkProtectionModeOptionItemProvider:(id)a3;
- (void)setUpdateProtectionModeTimer:(id)a3;
@end

@implementation HUNetworkConfigurationSettingsModule

- (HUNetworkConfigurationSettingsModule)initWithItemUpdater:(id)a3 group:(id)a4
{
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HUNetworkConfigurationSettingsModule;
  v8 = [(HFItemModule *)&v13 initWithItemUpdater:a3];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_group, a4);
    v10 = [[HUNetworkProtectionModeOptionItemProvider alloc] initWithGroup:v7];
    networkProtectionModeOptionItemProvider = v9->_networkProtectionModeOptionItemProvider;
    v9->_networkProtectionModeOptionItemProvider = v10;
  }
  return v9;
}

- (HUNetworkConfigurationSettingsModule)initWithItemUpdater:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_initWithItemUpdater_group_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUNetworkConfigurationSettingsModule.m", 45, @"%s is unavailable; use %@ instead",
    "-[HUNetworkConfigurationSettingsModule initWithItemUpdater:]",
    v6);

  return 0;
}

- (BOOL)isItemNetworkProtectionModeOptionItem:(id)a3
{
  id v4 = a3;
  v5 = [(HUNetworkConfigurationSettingsModule *)self networkProtectionModeOptionItemProvider];
  v6 = [v5 items];
  char v7 = [v6 containsObject:v4];

  return v7;
}

- (HFNetworkConfigurationGroupItem)sourceItem
{
  objc_opt_class();
  v3 = [(HFItemModule *)self itemUpdater];
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  objc_opt_class();
  v6 = [v5 sourceItem];
  if (objc_opt_isKindOfClass()) {
    char v7 = v6;
  }
  else {
    char v7 = 0;
  }
  id v8 = v7;

  if (!v8)
  {
    v9 = [v5 sourceItem];
    NSLog(&cfstr_InvalidSourceI.isa, v9, v5);
  }

  return (HFNetworkConfigurationGroupItem *)v8;
}

- (id)updateProtectionMode:(int64_t)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    char v7 = [(HUNetworkConfigurationSettingsModule *)self group];
    *(_DWORD *)buf = 138412802;
    v21 = self;
    __int16 v22 = 2048;
    int64_t v23 = a3;
    __int16 v24 = 2112;
    v25 = v7;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "%@: Updating protection mode to %lu for group %@", buf, 0x20u);
  }
  id v8 = [(HUNetworkConfigurationSettingsModule *)self group];
  v9 = objc_msgSend(v8, "hf_updateProtectionMode:", a3);
  [(HUNetworkConfigurationSettingsModule *)self setIsUpdatingProtectionMode:1];
  v10 = [(HUNetworkConfigurationSettingsModule *)self updateProtectionModeTimer];

  if (v10)
  {
    v11 = HFLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = [(HUNetworkConfigurationSettingsModule *)self updateProtectionModeTimer];
      *(_DWORD *)buf = 138412546;
      v21 = self;
      __int16 v22 = 2112;
      int64_t v23 = (int64_t)v12;
      _os_log_impl(&dword_1BE345000, v11, OS_LOG_TYPE_DEFAULT, "%@: Cancelling timer %@ and restarting mode update", buf, 0x16u);
    }
    objc_super v13 = [(HUNetworkConfigurationSettingsModule *)self updateProtectionModeTimer];
    [v13 invalidate];

    [(HUNetworkConfigurationSettingsModule *)self setUpdateProtectionModeTimer:0];
  }
  objc_initWeak((id *)buf, v8);
  objc_initWeak(&location, self);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __61__HUNetworkConfigurationSettingsModule_updateProtectionMode___block_invoke;
  v16[3] = &unk_1E6386800;
  objc_copyWeak(&v17, (id *)buf);
  objc_copyWeak(v18, &location);
  v18[1] = (id)a2;
  id v14 = (id)[v9 addCompletionBlock:v16];
  objc_destroyWeak(v18);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);

  return v9;
}

void __61__HUNetworkConfigurationSettingsModule_updateProtectionMode___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 4);
  id v8 = objc_loadWeakRetained(a1 + 5);
  v9 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __61__HUNetworkConfigurationSettingsModule_updateProtectionMode___block_invoke_2;
  v20[3] = &unk_1E6386788;
  objc_copyWeak(&v21, a1 + 4);
  [v9 dispatchHomeObserverMessage:v20 sender:0];

  v10 = (void *)MEMORY[0x1E4F1CB00];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  v16 = __61__HUNetworkConfigurationSettingsModule_updateProtectionMode___block_invoke_3;
  id v17 = &unk_1E63867D8;
  id v18 = v8;
  objc_copyWeak(v19, a1 + 5);
  v19[1] = a1[6];
  v11 = [v10 scheduledTimerWithTimeInterval:0 repeats:&v14 block:30.0];
  objc_msgSend(v8, "setUpdateProtectionModeTimer:", v11, v14, v15, v16, v17, v18);

  v12 = HFLogForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v13 = [v8 updateProtectionModeTimer];
    *(_DWORD *)buf = 138412802;
    id v23 = v8;
    __int16 v24 = 2112;
    v25 = v13;
    __int16 v26 = 2048;
    uint64_t v27 = 30;
    _os_log_impl(&dword_1BE345000, v12, OS_LOG_TYPE_DEFAULT, "%@: Starting protection mode update timer %@ (%lus)", buf, 0x20u);
  }
  objc_destroyWeak(v19);
  objc_destroyWeak(&v21);
}

void __61__HUNetworkConfigurationSettingsModule_updateProtectionMode___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = objc_msgSend(WeakRetained, "hf_home");
    [v6 home:v5 didUpdateAccessoryNetworkProtectionGroup:v4];
  }
}

void __61__HUNetworkConfigurationSettingsModule_updateProtectionMode___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    __int16 v24 = v5;
    __int16 v25 = 2112;
    id v26 = v3;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@: Timer fired %@", buf, 0x16u);
  }

  id v6 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (!WeakRetained
    || ([WeakRetained sourceItem],
        v9 = objc_claimAutoreleasedReturnValue(),
        BOOL v10 = v9 == 0,
        v9,
        v10))
  {
    v19 = HFLogForCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v24 = v8;
      _os_log_error_impl(&dword_1BE345000, v19, OS_LOG_TYPE_ERROR, "%@: Protection mode update timer lost reference to parent; invalidating",
        buf,
        0xCu);
    }
  }
  else
  {
    [v8 setIsUpdatingProtectionMode:0];
    [v8 setUpdateProtectionModeTimer:0];
    v11 = HFLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = [v8 sourceItem];
      *(_DWORD *)buf = 138412546;
      __int16 v24 = v8;
      __int16 v25 = 2112;
      id v26 = v12;
      _os_log_impl(&dword_1BE345000, v11, OS_LOG_TYPE_DEFAULT, "%@: Ending attempt and updating %@ to check for mismatch", buf, 0x16u);
    }
    objc_super v13 = [v8 itemUpdater];
    uint64_t v14 = (void *)MEMORY[0x1E4F69230];
    uint64_t v15 = (void *)MEMORY[0x1E4F1CAD0];
    v16 = [v8 sourceItem];
    id v17 = [v15 setWithObject:v16];
    id v18 = [v14 requestToUpdateItems:v17 senderSelector:*(void *)(a1 + 48)];
    v19 = [v13 performItemUpdateRequest:v18];

    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __61__HUNetworkConfigurationSettingsModule_updateProtectionMode___block_invoke_23;
    v21[3] = &unk_1E63867B0;
    objc_copyWeak(&v22, v6);
    id v20 = (id)[v19 addCompletionBlock:v21];
    objc_destroyWeak(&v22);
  }
}

void __61__HUNetworkConfigurationSettingsModule_updateProtectionMode___block_invoke_23(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained sourceItem];
  id v3 = [v2 latestResults];
  id v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F68B98]];
  int v5 = [v4 BOOLValue];

  id v6 = HFLogForCategory();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      int v8 = 138412290;
      id v9 = WeakRetained;
      _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "%@: Protection mode update attempt timed out", (uint8_t *)&v8, 0xCu);
    }

    id v6 = [WeakRetained networkConfigurationSettingsModuleDelegate];
    [v6 networkConfigurationSettingsModuleUpdateDidTimeout:WeakRetained];
  }
  else if (v7)
  {
    int v8 = 138412290;
    id v9 = WeakRetained;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "%@: Protection mode update attempt already succeeded", (uint8_t *)&v8, 0xCu);
  }
}

- (id)description
{
  id v3 = NSString;
  id v4 = [(HUNetworkConfigurationSettingsModule *)self group];
  int v5 = objc_msgSend(v4, "hf_title");
  id v6 = [v3 stringWithFormat:@"<HUNetworkConfigurationSettingsModule %p (%@)>", self, v5];

  return v6;
}

- (id)itemProviders
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  id v3 = [(HUNetworkConfigurationSettingsModule *)self networkProtectionModeOptionItemProvider];
  id v4 = [v2 setWithObject:v3];

  return v4;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = (objc_class *)MEMORY[0x1E4F692E8];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithIdentifier:@"HUNetworkConfigurationSettingsModuleProtectionModeOptionSectionIdentifier"];
  BOOL v7 = _HULocalizedStringWithDefaultValue(@"HUNetworkConfigurationSettingsSectionTitle", @"HUNetworkConfigurationSettingsSectionTitle", 1);
  [v6 setHeaderTitle:v7];

  int v8 = [(HUNetworkConfigurationSettingsModule *)self networkProtectionModeOptionItemProvider];
  id v9 = [v8 items];
  uint64_t v10 = [v9 allObjects];
  v11 = [MEMORY[0x1E4F69220] itemResultManualSortComparator];
  v12 = [v10 sortedArrayUsingComparator:v11];
  [v6 setItems:v12];

  objc_super v13 = [(HUNetworkConfigurationSettingsModule *)self _protectionModeOptionSectionFooter];
  [v6 setAttributedFooterTitle:v13];

  uint64_t v14 = (void *)MEMORY[0x1E4F69220];
  v18[0] = v6;
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  v16 = [v14 filterSections:v15 toDisplayedItems:v5];

  return v16;
}

- (id)_protectionModeOptionSectionFooter
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v3 = [(HUNetworkConfigurationSettingsModule *)self sourceItem];
  id v4 = [v3 latestResults];
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F68BA0]];
  uint64_t v6 = [v5 unsignedIntegerValue];

  BOOL v7 = [v3 latestResults];
  int v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F68B70]];
  uint64_t v9 = [v8 unsignedIntegerValue];

  uint64_t v10 = [v3 latestResults];
  v11 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F68B88]];
  int v12 = [v11 BOOLValue];

  objc_super v13 = [v3 latestResults];
  uint64_t v14 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F68B80]];
  int v15 = [v14 BOOLValue];

  v16 = [v3 latestResults];
  id v17 = [v16 objectForKeyedSubscript:*MEMORY[0x1E4F68B68]];

  id v18 = [v17 allObjects];
  v32 = [v18 sortedArrayUsingComparator:&__block_literal_global_27];

  v19 = [v3 latestResults];
  id v20 = [v19 objectForKeyedSubscript:*MEMORY[0x1E4F68B78]];
  int v21 = [v20 BOOLValue];
  if (v9 == 2) {
    int v22 = v21;
  }
  else {
    int v22 = 0;
  }

  id v23 = [v3 latestResults];
  __int16 v24 = [v23 objectForKeyedSubscript:*MEMORY[0x1E4F68B98]];
  if ([v24 BOOLValue]) {
    int v33 = ![(HUNetworkConfigurationSettingsModule *)self isUpdatingProtectionMode];
  }
  else {
    int v33 = 0;
  }

  __int16 v25 = HFLogForCategory();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138414594;
    v42 = self;
    __int16 v43 = 2112;
    v44 = v3;
    __int16 v45 = 2048;
    uint64_t v46 = v6;
    __int16 v47 = 2048;
    uint64_t v48 = v9;
    __int16 v49 = 1024;
    BOOL v50 = [(HUNetworkConfigurationSettingsModule *)self isUpdatingProtectionMode];
    __int16 v51 = 1024;
    int v52 = v33;
    __int16 v53 = 1024;
    int v54 = v15;
    __int16 v55 = 1024;
    int v56 = v12;
    __int16 v57 = 2048;
    uint64_t v58 = [v17 count];
    __int16 v59 = 1024;
    int v60 = v22;
    _os_log_impl(&dword_1BE345000, v25, OS_LOG_TYPE_DEFAULT, "%@: Constructing footer for item %@: target:%lu current:%lu updateAttempt:%{BOOL}d protectionMismatch:%{BOOL}d hostException:%{BOOL}d hostMismatch:%{BOOL}d allowedHostCount:%lu accessViolation:%{BOOL}d", buf, 0x52u);
  }

  id v26 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __74__HUNetworkConfigurationSettingsModule__protectionModeOptionSectionFooter__block_invoke_38;
  v38[3] = &__block_descriptor_34_e25___NSAttributedString_8__0l;
  char v39 = v12;
  char v40 = v15;
  uint64_t v27 = __74__HUNetworkConfigurationSettingsModule__protectionModeOptionSectionFooter__block_invoke_38((uint64_t)v38);
  [v26 appendAttributedString:v27];

  if ([v26 length])
  {
    uint64_t v28 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"\n"];
    [v26 appendAttributedString:v28];
  }
  if (v9 == 2)
  {
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __74__HUNetworkConfigurationSettingsModule__protectionModeOptionSectionFooter__block_invoke_3;
    v35[3] = &unk_1E63868B0;
    id v36 = v26;
    v37 = self;
    objc_msgSend(v32, "na_each:", v35);
  }
  if (v22)
  {
    v34[5] = MEMORY[0x1E4F143A8];
    v34[6] = 3221225472;
    v34[7] = __74__HUNetworkConfigurationSettingsModule__protectionModeOptionSectionFooter__block_invoke_5;
    v34[8] = &unk_1E6385028;
    v34[9] = self;
    v29 = __74__HUNetworkConfigurationSettingsModule__protectionModeOptionSectionFooter__block_invoke_5();
    [v26 appendAttributedString:v29];
  }
  if (v33)
  {
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __74__HUNetworkConfigurationSettingsModule__protectionModeOptionSectionFooter__block_invoke_6;
    v34[3] = &unk_1E6385028;
    v34[4] = self;
    v30 = __74__HUNetworkConfigurationSettingsModule__protectionModeOptionSectionFooter__block_invoke_6((uint64_t)v34);
    [v26 appendAttributedString:v30];
  }

  return v26;
}

uint64_t __74__HUNetworkConfigurationSettingsModule__protectionModeOptionSectionFooter__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 name];
  uint64_t v6 = [v4 name];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

id __74__HUNetworkConfigurationSettingsModule__protectionModeOptionSectionFooter__block_invoke_38(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F28B18]);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __74__HUNetworkConfigurationSettingsModule__protectionModeOptionSectionFooter__block_invoke_2;
  v6[3] = &__block_descriptor_34_e15___NSString_8__0l;
  __int16 v7 = *(_WORD *)(a1 + 32);
  id v3 = __74__HUNetworkConfigurationSettingsModule__protectionModeOptionSectionFooter__block_invoke_2((uint64_t)v6);
  id v4 = (void *)[v2 initWithString:v3];

  return v4;
}

id __74__HUNetworkConfigurationSettingsModule__protectionModeOptionSectionFooter__block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 32))
  {
    if (*(unsigned char *)(a1 + 33)) {
      v1 = @"HUNetworkConfigurationSettingsAllowedHostMessageMismatchAndException";
    }
    else {
      v1 = @"HUNetworkConfigurationSettingsAllowedHostMessageMismatch";
    }
    goto LABEL_7;
  }
  if (*(unsigned char *)(a1 + 33))
  {
    v1 = @"HUNetworkConfigurationSettingsAllowedHostMessageException";
LABEL_7:
    id v2 = _HULocalizedStringWithDefaultValue(v1, v1, 1);
    goto LABEL_8;
  }
  id v2 = [NSString string];
LABEL_8:

  return v2;
}

void __74__HUNetworkConfigurationSettingsModule__protectionModeOptionSectionFooter__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __74__HUNetworkConfigurationSettingsModule__protectionModeOptionSectionFooter__block_invoke_4;
  uint64_t v10 = &unk_1E6386888;
  id v4 = *(void **)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 40);
  id v12 = v3;
  id v5 = v3;
  uint64_t v6 = __74__HUNetworkConfigurationSettingsModule__protectionModeOptionSectionFooter__block_invoke_4((uint64_t)&v7);
  objc_msgSend(v4, "appendAttributedString:", v6, v7, v8, v9, v10, v11);
}

id __74__HUNetworkConfigurationSettingsModule__protectionModeOptionSectionFooter__block_invoke_4(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  id v3 = [(id)objc_opt_class() _attributedCheckmarkIcon];
  [v2 appendAttributedString:v3];

  id v4 = objc_alloc(MEMORY[0x1E4F28B18]);
  id v5 = [(id)objc_opt_class() _allowedHostDescriptionForHostGroup:*(void *)(a1 + 40)];
  uint64_t v6 = (void *)[v4 initWithString:v5];
  [v2 appendAttributedString:v6];

  return v2;
}

id __74__HUNetworkConfigurationSettingsModule__protectionModeOptionSectionFooter__block_invoke_5()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  v1 = [(id)objc_opt_class() _attributedExclamationIcon];
  [v0 appendAttributedString:v1];

  id v2 = objc_alloc(MEMORY[0x1E4F28B18]);
  id v3 = _HULocalizedStringWithDefaultValue(@"HUNetworkConfigurationSettingsBlockedHostDescription", @"HUNetworkConfigurationSettingsBlockedHostDescription", 1);
  id v4 = (void *)[v2 initWithString:v3];
  [v0 appendAttributedString:v4];

  return v0;
}

id __74__HUNetworkConfigurationSettingsModule__protectionModeOptionSectionFooter__block_invoke_6(uint64_t a1)
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  id v3 = [(id)objc_opt_class() _attributedExclamationIcon];
  [v2 appendAttributedString:v3];

  id v4 = (void *)MEMORY[0x1E4F2E9C0];
  id v5 = [*(id *)(a1 + 32) group];
  uint64_t v6 = objc_msgSend(v4, "hf_detailedLocalizedTitleForTargetProtectionMode:", objc_msgSend(v5, "targetProtectionMode"));
  uint64_t v7 = [*(id *)(a1 + 32) group];
  id v20 = objc_msgSend(v7, "hf_title");
  uint64_t v14 = HULocalizedStringWithFormat(@"HUNetworkConfigurationSettingsConfigurationMismatchDescription", @"%@%@", v8, v9, v10, v11, v12, v13, (uint64_t)v6);

  int v15 = (void *)MEMORY[0x1E4F28B18];
  v16 = _HULocalizedStringWithDefaultValue(@"HUNetworkConfigurationSettingsConfigurationMismatchDescriptionLink", @"HUNetworkConfigurationSettingsConfigurationMismatchDescriptionLink", 1);
  int v21 = @"HUNetworkConfigurationSettingsMismatchLinkAttributeName";
  v22[0] = MEMORY[0x1E4F1CC38];
  id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
  id v18 = objc_msgSend(v15, "hf_attributedLinkStringForString:linkString:linkURL:attributes:additionalLinkAttributes:", v14, v16, 0, 0, v17);

  [v2 appendAttributedString:v18];

  return v2;
}

+ (id)_allowedHostDescriptionForHostGroup:(id)a3
{
  id v3 = a3;
  id v4 = [v3 name];
  id v5 = [v3 purposeLocalizedDescription];

  uint64_t v12 = HULocalizedStringWithFormat(@"HUNetworkConfigurationSettingsAllowedHostDescriptionFormat", @"%@%@", v6, v7, v8, v9, v10, v11, (uint64_t)v4);

  return v12;
}

+ (id)_attributedIconNamed:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:@"\n"];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__HUNetworkConfigurationSettingsModule__attributedIconNamed___block_invoke;
  v9[3] = &unk_1E63868D8;
  id v10 = v3;
  id v5 = v3;
  uint64_t v6 = __61__HUNetworkConfigurationSettingsModule__attributedIconNamed___block_invoke((uint64_t)v9);
  [v4 appendAttributedString:v6];

  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:@" "];
  [v4 appendAttributedString:v7];

  return v4;
}

id __61__HUNetworkConfigurationSettingsModule__attributedIconNamed___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F42698]);
  id v3 = [MEMORY[0x1E4F42A80] _systemImageNamed:*(void *)(a1 + 32)];
  id v4 = [MEMORY[0x1E4F42A98] configurationWithTextStyle:*MEMORY[0x1E4F43890] scale:2];
  id v5 = [v3 imageWithSymbolConfiguration:v4];
  uint64_t v6 = [v5 imageWithRenderingMode:2];
  [v2 setImage:v6];

  uint64_t v7 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v2];

  return v7;
}

+ (id)_attributedCheckmarkIcon
{
  return (id)[a1 _attributedIconNamed:@"checkmark.circle"];
}

+ (id)_attributedExclamationIcon
{
  return (id)[a1 _attributedIconNamed:@"exclamationmark.circle"];
}

- (HUNetworkConfigurationSettingsModuleDelegate)networkConfigurationSettingsModuleDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_networkConfigurationSettingsModuleDelegate);

  return (HUNetworkConfigurationSettingsModuleDelegate *)WeakRetained;
}

- (void)setNetworkConfigurationSettingsModuleDelegate:(id)a3
{
}

- (HMAccessoryNetworkProtectionGroup)group
{
  return self->_group;
}

- (BOOL)isUpdatingProtectionMode
{
  return self->_isUpdatingProtectionMode;
}

- (void)setIsUpdatingProtectionMode:(BOOL)a3
{
  self->_isUpdatingProtectionMode = a3;
}

- (HUNetworkProtectionModeOptionItemProvider)networkProtectionModeOptionItemProvider
{
  return self->_networkProtectionModeOptionItemProvider;
}

- (void)setNetworkProtectionModeOptionItemProvider:(id)a3
{
}

- (NSTimer)updateProtectionModeTimer
{
  return self->_updateProtectionModeTimer;
}

- (void)setUpdateProtectionModeTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateProtectionModeTimer, 0);
  objc_storeStrong((id *)&self->_networkProtectionModeOptionItemProvider, 0);
  objc_storeStrong((id *)&self->_group, 0);

  objc_destroyWeak((id *)&self->_networkConfigurationSettingsModuleDelegate);
}

@end