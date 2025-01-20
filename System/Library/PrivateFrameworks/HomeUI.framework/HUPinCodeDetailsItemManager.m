@interface HUPinCodeDetailsItemManager
- (BOOL)operationInProgress;
- (HFAccessoryItemProvider)locksItemProvider;
- (HFPinCodeManager)pinCodeManager;
- (HFStaticItem)addOrShowHomeKeyItem;
- (HFStaticItem)deleteGuestPINCodeItem;
- (HFStaticItem)personalPINCodeItem;
- (HFStaticItem)pinCodeChangeItem;
- (HFStaticItem)pinCodeLabelItem;
- (HFStaticItem)pinCodeRestoreAccessItem;
- (HFStaticItem)pinCodeValueItem;
- (HFStaticItem)restoreHomeKeyAccessItem;
- (HFTransformItemProvider)transformedLocksItemProvider;
- (HMHome)overrideHome;
- (HUPinCodeDetailsItemManager)initWithDelegate:(id)a3;
- (HUPinCodeDetailsItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4;
- (HUPinCodeDetailsItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4 pinCodeManager:(id)a5 home:(id)a6;
- (NAFuture)restoreFuture;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (id)_homeFuture;
- (id)_itemsToUpdateWhenApplicationDidBecomeActive;
- (void)_registerForExternalUpdates;
- (void)_unregisterForExternalUpdates;
- (void)pinCodeManagerDidUpdate:(id)a3 pinCodes:(id)a4;
- (void)setAddOrShowHomeKeyItem:(id)a3;
- (void)setDeleteGuestPINCodeItem:(id)a3;
- (void)setLocksItemProvider:(id)a3;
- (void)setOperationInProgress:(BOOL)a3;
- (void)setPersonalPINCodeItem:(id)a3;
- (void)setPinCodeChangeItem:(id)a3;
- (void)setPinCodeLabelItem:(id)a3;
- (void)setPinCodeRestoreAccessItem:(id)a3;
- (void)setPinCodeValueItem:(id)a3;
- (void)setRestoreFuture:(id)a3;
- (void)setRestoreHomeKeyAccessItem:(id)a3;
- (void)setTransformedLocksItemProvider:(id)a3;
@end

@implementation HUPinCodeDetailsItemManager

- (HUPinCodeDetailsItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4 pinCodeManager:(id)a5 home:(id)a6
{
  id v12 = a5;
  id v13 = a6;
  v29.receiver = self;
  v29.super_class = (Class)HUPinCodeDetailsItemManager;
  v14 = [(HFItemManager *)&v29 initWithDelegate:a3 sourceItem:a4];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_pinCodeManager, a5);
    objc_storeStrong((id *)&v15->_overrideHome, a6);
    v16 = (NAFuture *)objc_alloc_init(MEMORY[0x1E4F7A0D8]);
    restoreFuture = v15->_restoreFuture;
    v15->_restoreFuture = v16;
  }
  objc_opt_class();
  v18 = [(HFItemManager *)v15 sourceItem];
  if (objc_opt_isKindOfClass()) {
    v19 = v18;
  }
  else {
    v19 = 0;
  }
  id v20 = v19;

  v21 = [v20 user];

  if (v21)
  {
    v22 = [v20 user];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __79__HUPinCodeDetailsItemManager_initWithDelegate_sourceItem_pinCodeManager_home___block_invoke;
    v26[3] = &unk_1E638FAD0;
    v27 = v15;
    SEL v28 = a2;
    [v13 fetchMissingWalletKeysForUser:v22 completion:v26];

    v23 = v27;
  }
  else
  {
    v23 = [(HUPinCodeDetailsItemManager *)v15 restoreFuture];
    v24 = [MEMORY[0x1E4F1CAD0] set];
    [v23 finishWithResult:v24];
  }
  return v15;
}

void __79__HUPinCodeDetailsItemManager_initWithDelegate_sourceItem_pinCodeManager_home___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!v3)
  {
    v4 = HFLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v10 = 138412546;
      uint64_t v11 = v9;
      __int16 v12 = 2080;
      id v13 = "-[HUPinCodeDetailsItemManager initWithDelegate:sourceItem:pinCodeManager:home:]_block_invoke";
      _os_log_error_impl(&dword_1BE345000, v4, OS_LOG_TYPE_ERROR, "(%@:%s) Request to fetch missing wallet keys for user returned nil set", (uint8_t *)&v10, 0x16u);
    }
  }
  v5 = [*(id *)(a1 + 32) restoreFuture];
  v6 = v5;
  if (v3)
  {
    [v5 finishWithResult:v3];
  }
  else
  {
    v7 = [MEMORY[0x1E4F1CAD0] set];
    [v6 finishWithResult:v7];
  }
  id v8 = (id)[*(id *)(a1 + 32) reloadAndUpdateAllItemsFromSenderSelector:*(void *)(a1 + 40)];
}

- (HUPinCodeDetailsItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  v7 = NSStringFromSelector(sel_initWithDelegate_sourceItem_pinCodeManager_home_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUPinCodeDetailsItemManager.m", 92, @"%s is unavailable; use %@ instead",
    "-[HUPinCodeDetailsItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (HUPinCodeDetailsItemManager)initWithDelegate:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_initWithDelegate_sourceItem_pinCodeManager_home_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUPinCodeDetailsItemManager.m", 97, @"%s is unavailable; use %@ instead",
    "-[HUPinCodeDetailsItemManager initWithDelegate:]",
    v6);

  return 0;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  v130[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  v5 = [(HFItemManager *)self sourceItem];
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v77 = v6;

  objc_opt_class();
  v7 = [(HFItemManager *)self sourceItem];
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  int v10 = [(HFItemManager *)self sourceItem];

  if (v10 && !v9 && !v77)
  {
    uint64_t v11 = [(HFItemManager *)self sourceItem];
    NSLog(&cfstr_ExpectedItemTo.isa, v11);
  }
  __int16 v12 = [(HFItemManager *)self sourceItem];
  BOOL v79 = v12 == 0;

  if (v9) {
    [v9 user];
  }
  else {
  id v13 = [v77 user];
  }
  unsigned __int8 v14 = [v4 hasOnboardedForAccessCode];
  v15 = objc_msgSend(v4, "hf_accessoriesSupportingAccessCodes");
  if ([v15 count]) {
    unsigned __int8 v16 = v14;
  }
  else {
    unsigned __int8 v16 = 0;
  }
  unsigned __int8 v76 = v16;

  if (objc_msgSend(v4, "hf_hasHomeHubSupportingAccessCodes")) {
    char v78 = 1;
  }
  else {
    char v78 = objc_msgSend(v4, "hf_currentUserIsOwner");
  }
  objc_initWeak(&location, self);
  id v17 = objc_alloc(MEMORY[0x1E4F695C0]);
  v120[0] = MEMORY[0x1E4F143A8];
  v120[1] = 3221225472;
  v120[2] = __58__HUPinCodeDetailsItemManager__buildItemProvidersForHome___block_invoke;
  v120[3] = &unk_1E638FAF8;
  objc_copyWeak(&v124, &location);
  id v18 = v13;
  id v121 = v18;
  unsigned __int8 v125 = v76;
  id v19 = v4;
  id v122 = v19;
  unsigned __int8 v126 = v14;
  id v20 = v9;
  id v123 = v20;
  v21 = (void *)[v17 initWithResultsBlock:v120];
  [(HUPinCodeDetailsItemManager *)self setPinCodeLabelItem:v21];

  id v22 = objc_alloc(MEMORY[0x1E4F695C0]);
  LODWORD(v17) = v14 & (v12 == 0);
  v115[0] = MEMORY[0x1E4F143A8];
  v115[1] = 3221225472;
  v115[2] = __58__HUPinCodeDetailsItemManager__buildItemProvidersForHome___block_invoke_93;
  v115[3] = &unk_1E638FB20;
  id v23 = v20;
  id v116 = v23;
  char v117 = (char)v17;
  unsigned __int8 v118 = v14;
  BOOL v119 = v79;
  v24 = (void *)[v22 initWithResultsBlock:v115];
  [(HUPinCodeDetailsItemManager *)self setPinCodeValueItem:v24];

  id v25 = objc_alloc(MEMORY[0x1E4F695C0]);
  v108[0] = MEMORY[0x1E4F143A8];
  v108[1] = 3221225472;
  v108[2] = __58__HUPinCodeDetailsItemManager__buildItemProvidersForHome___block_invoke_100;
  v108[3] = &unk_1E638FB48;
  id v26 = v19;
  id v109 = v26;
  id v27 = v23;
  id v110 = v27;
  unsigned __int8 v113 = v14;
  id v28 = v18;
  char v114 = v78;
  id v111 = v28;
  v112 = self;
  objc_super v29 = (void *)[v25 initWithResultsBlock:v108];
  [(HUPinCodeDetailsItemManager *)self setPinCodeRestoreAccessItem:v29];

  id v30 = objc_alloc(MEMORY[0x1E4F695C0]);
  v129[0] = *MEMORY[0x1E4F68AB8];
  v31 = _HULocalizedStringWithDefaultValue(@"HUPinCodeChangeCellTitle", @"HUPinCodeChangeCellTitle", 1);
  uint64_t v32 = *MEMORY[0x1E4F68928];
  v130[0] = v31;
  v130[1] = @"Home.Locks.PinCode.Details.ChangeAccessCode";
  uint64_t v33 = *MEMORY[0x1E4F68B10];
  v129[1] = v32;
  v129[2] = v33;
  v34 = [NSNumber numberWithInt:v17 ^ 1];
  v130[2] = v34;
  v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v130 forKeys:v129 count:3];
  v36 = (void *)[v30 initWithResults:v35];
  [(HUPinCodeDetailsItemManager *)self setPinCodeChangeItem:v36];

  id v37 = objc_alloc(MEMORY[0x1E4F695C0]);
  v100[0] = MEMORY[0x1E4F143A8];
  v100[1] = 3221225472;
  v100[2] = __58__HUPinCodeDetailsItemManager__buildItemProvidersForHome___block_invoke_115;
  v100[3] = &unk_1E638FB70;
  v100[4] = self;
  unsigned __int8 v104 = v14;
  BOOL v105 = v79;
  id v38 = v27;
  id v101 = v38;
  unsigned __int8 v106 = v76;
  id v39 = v28;
  id v102 = v39;
  char v107 = v78;
  id v40 = v26;
  id v103 = v40;
  v41 = (void *)[v37 initWithResultsBlock:v100];
  [(HUPinCodeDetailsItemManager *)self setPersonalPINCodeItem:v41];

  id v42 = objc_alloc(MEMORY[0x1E4F695C0]);
  v96[0] = MEMORY[0x1E4F143A8];
  v96[1] = 3221225472;
  v96[2] = __58__HUPinCodeDetailsItemManager__buildItemProvidersForHome___block_invoke_123;
  v96[3] = &unk_1E638FBE0;
  objc_copyWeak(&v99, &location);
  id v43 = v40;
  id v97 = v43;
  id v44 = v39;
  id v98 = v44;
  v45 = (void *)[v42 initWithResultsBlock:v96];
  [(HUPinCodeDetailsItemManager *)self setAddOrShowHomeKeyItem:v45];

  id v46 = objc_alloc(MEMORY[0x1E4F695C0]);
  v91[0] = MEMORY[0x1E4F143A8];
  v91[1] = 3221225472;
  v91[2] = __58__HUPinCodeDetailsItemManager__buildItemProvidersForHome___block_invoke_2_146;
  v91[3] = &unk_1E638FC08;
  BOOL v94 = v79;
  id v47 = v44;
  unsigned __int8 v95 = v14;
  id v92 = v47;
  v93 = self;
  v48 = (void *)[v46 initWithResultsBlock:v91];
  [(HUPinCodeDetailsItemManager *)self setDeleteGuestPINCodeItem:v48];

  id v49 = objc_alloc(MEMORY[0x1E4F695C0]);
  v90[0] = MEMORY[0x1E4F143A8];
  v90[1] = 3221225472;
  v90[2] = __58__HUPinCodeDetailsItemManager__buildItemProvidersForHome___block_invoke_153;
  v90[3] = &unk_1E6385000;
  v90[4] = self;
  v50 = (void *)[v49 initWithResultsBlock:v90];
  [(HUPinCodeDetailsItemManager *)self setRestoreHomeKeyAccessItem:v50];

  v51 = objc_opt_new();
  v52 = [(HUPinCodeDetailsItemManager *)self pinCodeLabelItem];
  objc_msgSend(v51, "na_safeAddObject:", v52);

  v53 = [(HUPinCodeDetailsItemManager *)self pinCodeValueItem];
  objc_msgSend(v51, "na_safeAddObject:", v53);

  v54 = [(HUPinCodeDetailsItemManager *)self pinCodeRestoreAccessItem];
  objc_msgSend(v51, "na_safeAddObject:", v54);

  v55 = [(HUPinCodeDetailsItemManager *)self pinCodeChangeItem];
  objc_msgSend(v51, "na_safeAddObject:", v55);

  v56 = [(HUPinCodeDetailsItemManager *)self personalPINCodeItem];
  objc_msgSend(v51, "na_safeAddObject:", v56);

  v57 = [(HUPinCodeDetailsItemManager *)self addOrShowHomeKeyItem];
  objc_msgSend(v51, "na_safeAddObject:", v57);

  v58 = [(HUPinCodeDetailsItemManager *)self deleteGuestPINCodeItem];
  objc_msgSend(v51, "na_safeAddObject:", v58);

  v59 = [(HUPinCodeDetailsItemManager *)self restoreHomeKeyAccessItem];
  objc_msgSend(v51, "na_safeAddObject:", v59);

  v60 = (void *)[objc_alloc(MEMORY[0x1E4F68E20]) initWithHome:v43];
  [(HUPinCodeDetailsItemManager *)self setLocksItemProvider:v60];

  v88[0] = MEMORY[0x1E4F143A8];
  v88[1] = 3221225472;
  v88[2] = __58__HUPinCodeDetailsItemManager__buildItemProvidersForHome___block_invoke_166;
  v88[3] = &unk_1E6385F78;
  id v61 = v47;
  id v89 = v61;
  v62 = [(HUPinCodeDetailsItemManager *)self locksItemProvider];
  [v62 setFilter:v88];

  id v63 = objc_alloc(MEMORY[0x1E4F696B0]);
  v64 = [(HUPinCodeDetailsItemManager *)self locksItemProvider];
  v80[0] = MEMORY[0x1E4F143A8];
  v80[1] = 3221225472;
  v80[2] = __58__HUPinCodeDetailsItemManager__buildItemProvidersForHome___block_invoke_2_170;
  v80[3] = &unk_1E638FC78;
  id v65 = v38;
  id v81 = v65;
  objc_copyWeak(&v85, &location);
  id v66 = v61;
  id v82 = v66;
  id v67 = v77;
  id v83 = v67;
  BOOL v86 = v79;
  id v68 = v43;
  id v84 = v68;
  char v87 = v78;
  v69 = (void *)[v63 initWithSourceProvider:v64 transformationBlock:v80];
  [(HUPinCodeDetailsItemManager *)self setTransformedLocksItemProvider:v69];

  id v70 = objc_alloc(MEMORY[0x1E4F695C8]);
  v71 = [MEMORY[0x1E4F1CAD0] setWithArray:v51];
  v72 = (void *)[v70 initWithItems:v71];

  v128[0] = v72;
  v73 = [(HUPinCodeDetailsItemManager *)self transformedLocksItemProvider];
  v128[1] = v73;
  v74 = [MEMORY[0x1E4F1C978] arrayWithObjects:v128 count:2];

  objc_destroyWeak(&v85);
  objc_destroyWeak(&v99);

  objc_destroyWeak(&v124);
  objc_destroyWeak(&location);

  return v74;
}

id __58__HUPinCodeDetailsItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [WeakRetained sourceItem];
  v5 = [v4 latestResults];
  uint64_t v6 = *MEMORY[0x1E4F68AB8];
  v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  [v3 setObject:v7 forKeyedSubscript:v6];

  if (*(void *)(a1 + 32)) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = *(unsigned char *)(a1 + 64) == 0;
  }
  id v9 = [NSNumber numberWithBool:v8];
  [v3 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F68B10]];

  int v10 = HFLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = objc_msgSend(*(id *)(a1 + 40), "hf_accessoriesSupportingAccessCodes");
    uint64_t v12 = [v11 count];
    int v13 = *(unsigned __int8 *)(a1 + 65);
    unsigned __int8 v14 = objc_msgSend(*(id *)(a1 + 32), "hf_prettyDescription");
    int v18 = 136316162;
    id v19 = "-[HUPinCodeDetailsItemManager _buildItemProvidersForHome:]_block_invoke";
    __int16 v20 = 1024;
    BOOL v21 = v8;
    __int16 v22 = 2048;
    uint64_t v23 = v12;
    __int16 v24 = 1024;
    int v25 = v13;
    __int16 v26 = 2112;
    id v27 = v14;
    _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "(%s) For pinCodeLabelItem, shouldHide = %{BOOL}d | accessoriesSupportingAccessCodes.count = %ld | hasOnboardedForAccessCode = %{BOOL}d | user = %@", (uint8_t *)&v18, 0x2Cu);
  }
  v15 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 48), "isUnknownGuestFromMatter"));
  [v3 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F68A08]];

  unsigned __int8 v16 = [MEMORY[0x1E4F7A0D8] futureWithResult:v3];

  return v16;
}

id __58__HUPinCodeDetailsItemManager__buildItemProvidersForHome___block_invoke_93(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  id v3 = _HULocalizedStringWithDefaultValue(@"HUPinCodeValueCellTitle", @"HUPinCodeValueCellTitle", 1);
  [v2 setObject:v3 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  [v2 setObject:@"Home.Locks.PinCode.Details.AccessCode" forKeyedSubscript:*MEMORY[0x1E4F68928]];
  id v4 = [*(id *)(a1 + 32) pinCodeValue];
  [v2 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F68980]];

  v5 = [NSNumber numberWithInt:*(unsigned char *)(a1 + 40) == 0];
  [v2 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F68B10]];

  uint64_t v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = *(unsigned __int8 *)(a1 + 40);
    int v8 = *(unsigned __int8 *)(a1 + 41);
    int v9 = *(unsigned __int8 *)(a1 + 42);
    int v12 = 136315906;
    int v13 = "-[HUPinCodeDetailsItemManager _buildItemProvidersForHome:]_block_invoke";
    __int16 v14 = 1024;
    int v15 = v7;
    __int16 v16 = 1024;
    int v17 = v8;
    __int16 v18 = 1024;
    int v19 = v9;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "(%s) For pinCodeValueItem, showPinCodeValue = %{BOOL}d | hasOnboardedForAccessCode = %{BOOL}d | newPinCode = %{BOOL}d", (uint8_t *)&v12, 0x1Eu);
  }

  int v10 = [MEMORY[0x1E4F7A0D8] futureWithResult:v2];

  return v10;
}

id __58__HUPinCodeDetailsItemManager__buildItemProvidersForHome___block_invoke_100(uint64_t a1)
{
  v44[5] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) accessories];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __58__HUPinCodeDetailsItemManager__buildItemProvidersForHome___block_invoke_2;
  v25[3] = &unk_1E63869C8;
  id v26 = *(id *)(a1 + 40);
  id v3 = objc_msgSend(v2, "na_firstObjectPassingTest:", v25);

  if (*(unsigned char *)(a1 + 64) && *(void *)(a1 + 48) && *(unsigned char *)(a1 + 65))
  {
    id v4 = [*(id *)(a1 + 56) pinCodeManager];
    if ([v4 isAccessoryFetchInProgress])
    {
      int v5 = 0;
    }
    else
    {
      if (*(void *)(a1 + 40)) {
        BOOL v6 = v3 == 0;
      }
      else {
        BOOL v6 = 1;
      }
      int v5 = !v6;
    }
  }
  else
  {
    int v5 = 0;
  }
  v43[0] = *MEMORY[0x1E4F68AB8];
  int v7 = _HULocalizedStringWithDefaultValue(@"HUPinCodeRestoreAccessButtonTitle", @"HUPinCodeRestoreAccessButtonTitle", 1);
  uint64_t v8 = *MEMORY[0x1E4F68928];
  v44[0] = v7;
  v44[1] = @"Home.Locks.PinCode.Details.RestoreAccessEntry";
  uint64_t v9 = *MEMORY[0x1E4F68B10];
  v43[1] = v8;
  v43[2] = v9;
  int v10 = [NSNumber numberWithInt:v5 ^ 1u];
  uint64_t v11 = *MEMORY[0x1E4F68A70];
  v44[2] = v10;
  v44[3] = MEMORY[0x1E4F1CC28];
  uint64_t v12 = *MEMORY[0x1E4F68A08];
  v43[3] = v11;
  v43[4] = v12;
  int v13 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 56), "operationInProgress"));
  v44[4] = v13;
  __int16 v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:5];

  int v15 = HFLogForCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = *(unsigned __int8 *)(a1 + 64);
    int v24 = *(unsigned __int8 *)(a1 + 65);
    int v17 = [*(id *)(a1 + 56) pinCodeManager];
    int v18 = [v17 isAccessoryFetchInProgress];
    int v19 = objc_msgSend(v3, "hf_minimumDescription");
    uint64_t v20 = *(void *)(a1 + 40);
    BOOL v21 = objc_msgSend(*(id *)(a1 + 48), "hf_prettyDescription");
    *(_DWORD *)buf = 136316930;
    uint64_t v28 = "-[HUPinCodeDetailsItemManager _buildItemProvidersForHome:]_block_invoke";
    __int16 v29 = 1024;
    int v30 = v5;
    __int16 v31 = 1024;
    int v32 = v16;
    __int16 v33 = 1024;
    int v34 = v24;
    __int16 v35 = 1024;
    int v36 = v18;
    __int16 v37 = 2112;
    id v38 = v19;
    __int16 v39 = 2112;
    uint64_t v40 = v20;
    __int16 v41 = 2112;
    id v42 = v21;
    _os_log_impl(&dword_1BE345000, v15, OS_LOG_TYPE_DEFAULT, "(%s) For pinCodeRestoreAccessItem, showRestoreAccess = %{BOOL}d | hasOnboardedForAccessCode = %{BOOL}d | hasResidentDevice = %{BOOL}d | isAccessoryFetchInProgress = %{BOOL}d | pinCodeRestorableAccessory = %@ | pinCodeItem = %@ | user = %@", buf, 0x42u);
  }
  __int16 v22 = [MEMORY[0x1E4F7A0D8] futureWithResult:v14];

  return v22;
}

uint64_t __58__HUPinCodeDetailsItemManager__buildItemProvidersForHome___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 category];
  if ([v4 isEqual:*MEMORY[0x1E4F2C1B0]])
  {
    int v5 = 1;
  }
  else
  {
    BOOL v6 = objc_msgSend(v3, "hf_primaryService");
    int v7 = [v6 serviceType];
    int v5 = [v7 isEqualToString:*MEMORY[0x1E4F2DE88]];
  }
  uint64_t v8 = [*(id *)(a1 + 32) accessories];
  int v9 = [v8 containsObject:v3];

  if (v5 && [v3 isReachable]) {
    uint64_t v10 = [v3 supportsAccessCodes] & (v9 ^ 1);
  }
  else {
    uint64_t v10 = 0;
  }

  return v10;
}

id __58__HUPinCodeDetailsItemManager__buildItemProvidersForHome___block_invoke_115(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  id v3 = _HULocalizedStringWithDefaultValue(@"HUPinCodePersonalPINCodeCellTitle", @"HUPinCodePersonalPINCodeCellTitle", 1);
  [v2 setObject:v3 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  [v2 setObject:@"Home.Locks.PinCode.PersonalAccessCode" forKeyedSubscript:*MEMORY[0x1E4F68928]];
  id v4 = objc_alloc_init(MEMORY[0x1E4F30B50]);
  id v28 = 0;
  int v5 = [v4 canEvaluatePolicy:2 error:&v28];
  id v6 = v28;
  int v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 domain];
    if ([v8 isEqualToString:*MEMORY[0x1E4F30B38]])
    {
      uint64_t v9 = [v7 code];

      if (v9 == -5) {
        int v5 = 1;
      }
    }
    else
    {
    }
    uint64_t v10 = HFLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v25 = *(const char **)(a1 + 32);
      *(_DWORD *)buf = 138413058;
      int v30 = v25;
      __int16 v31 = 2080;
      *(void *)int v32 = "-[HUPinCodeDetailsItemManager _buildItemProvidersForHome:]_block_invoke";
      *(_WORD *)&v32[8] = 1024;
      *(_DWORD *)__int16 v33 = v5;
      *(_WORD *)&v33[4] = 2112;
      int v34 = v7;
      _os_log_error_impl(&dword_1BE345000, v10, OS_LOG_TYPE_ERROR, "(%@:%s) canLocalAuthenticate = %{BOOL}d, localAuthenticationError = %@", buf, 0x26u);
    }
  }
  if (*(unsigned char *)(a1 + 64)
    && !*(unsigned char *)(a1 + 65)
    && ((int v24 = *(void **)(a1 + 40)) != 0 && *(unsigned char *)(a1 + 66)
     || *(void *)(a1 + 48) && *(unsigned char *)(a1 + 66) && *(unsigned char *)(a1 + 67)))
  {
    unsigned int v11 = v5 & ~[v24 isUnknownGuestFromMatter];
  }
  else
  {
    unsigned int v11 = 0;
  }
  uint64_t v12 = HFLogForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = *(unsigned __int8 *)(a1 + 64);
    int v14 = *(unsigned __int8 *)(a1 + 65);
    id v27 = v4;
    int v15 = *(unsigned __int8 *)(a1 + 67);
    int v16 = objc_msgSend(*(id *)(a1 + 56), "hf_accessoriesSupportingAccessCodes");
    uint64_t v17 = [v16 count];
    objc_msgSend(*(id *)(a1 + 48), "hf_prettyDescription");
    int v18 = v26 = v7;
    uint64_t v19 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 136316930;
    int v30 = "-[HUPinCodeDetailsItemManager _buildItemProvidersForHome:]_block_invoke";
    __int16 v31 = 1024;
    *(_DWORD *)int v32 = v11;
    *(_WORD *)&v32[4] = 1024;
    *(_DWORD *)&v32[6] = v13;
    *(_WORD *)__int16 v33 = 1024;
    *(_DWORD *)&v33[2] = v14;
    LOWORD(v34) = 1024;
    *(_DWORD *)((char *)&v34 + 2) = v15;
    id v4 = v27;
    HIWORD(v34) = 2048;
    uint64_t v35 = v17;
    __int16 v36 = 2112;
    __int16 v37 = v18;
    __int16 v38 = 2112;
    uint64_t v39 = v19;
    _os_log_impl(&dword_1BE345000, v12, OS_LOG_TYPE_DEFAULT, "(%s) For personalPINCodeItem, shouldShow = %{BOOL}d | hasOnboardedForAccessCode = %{BOOL}d | newPinCode = %{BOOL}d | hasResidentDevice = %{BOOL}d | accessoriesSupportingAccessCodes.count = %ld | user = %@ | pinCodeItem = %@", buf, 0x42u);

    int v7 = v26;
  }

  uint64_t v20 = [NSNumber numberWithInt:v11 ^ 1];
  [v2 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4F68B10]];

  BOOL v21 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(*(id *)(a1 + 56), "hf_hasHomeHubSupportingAccessCodes") ^ 1);
  [v2 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F68A08]];

  [v2 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:*MEMORY[0x1E4F68A70]];
  __int16 v22 = [MEMORY[0x1E4F7A0D8] futureWithResult:v2];

  return v22;
}

id __58__HUPinCodeDetailsItemManager__buildItemProvidersForHome___block_invoke_123(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [v3 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:*MEMORY[0x1E4F68A70]];
  id v4 = objc_opt_new();
  objc_msgSend(v4, "na_safeAddObject:", *(void *)(a1 + 32));
  int v5 = objc_msgSend(*(id *)(a1 + 32), "hf_walletKeyAccessories");
  id v6 = (void *)[v5 copy];
  objc_msgSend(v4, "na_safeAddObjectsFromArray:", v6);

  int v7 = (void *)[v4 copy];
  objc_msgSend(v3, "na_safeSetObject:forKey:", v7, *MEMORY[0x1E4F68908]);

  uint64_t v8 = [v5 count];
  uint64_t v9 = *(void **)(a1 + 40);
  uint64_t v10 = [*(id *)(a1 + 32) currentUser];
  if ([v9 isEqual:v10]) {
    BOOL v11 = *(void *)(a1 + 40) == 0;
  }
  else {
    BOOL v11 = 1;
  }

  int v12 = [MEMORY[0x1E4F69758] isAnIPhone] ^ 1;
  if (v11 || (v12 & 1) != 0 || !v8 || ([*(id *)(a1 + 32) hasOnboardedForWalletKey] & 1) == 0)
  {
    int v16 = HFLogForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = [*(id *)(a1 + 32) hasOnboardedForWalletKey];
      *(_DWORD *)buf = 138413826;
      id v24 = WeakRetained;
      __int16 v25 = 2080;
      id v26 = "-[HUPinCodeDetailsItemManager _buildItemProvidersForHome:]_block_invoke";
      __int16 v27 = 1024;
      BOOL v28 = v11;
      __int16 v29 = 1024;
      int v30 = v12;
      __int16 v31 = 1024;
      BOOL v32 = v8 != 0;
      __int16 v33 = 1024;
      int v34 = v17;
      __int16 v35 = 2112;
      __int16 v36 = v5;
      _os_log_impl(&dword_1BE345000, v16, OS_LOG_TYPE_DEFAULT, "(%@: %s) Hiding addOrShowHomeKeyItem. shouldHideForUser: %{BOOL}d, shouldHideForDevice: %{BOOL}d, hasWalletKeyAccessories: %{BOOL}d, home.hasOnboardedForWalletKey = hasWalletKeyAccessories: %{BOOL}d, walletKeyAccessories: %@", buf, 0x38u);
    }

    int v18 = [NSNumber numberWithBool:1];
    objc_msgSend(v3, "na_safeSetObject:forKey:", v18, *MEMORY[0x1E4F68B10]);

    int v15 = [MEMORY[0x1E4F7A0D8] futureWithResult:v3];
  }
  else
  {
    int v13 = [WeakRetained home];
    int v14 = objc_msgSend(v13, "hf_fetchWalletKeyDeviceStateForCurrentDeviceIfNecessary");
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __58__HUPinCodeDetailsItemManager__buildItemProvidersForHome___block_invoke_126;
    v20[3] = &unk_1E638FBB8;
    v20[4] = WeakRetained;
    id v21 = v3;
    id v22 = *(id *)(a1 + 32);
    int v15 = [v14 flatMap:v20];
  }

  return v15;
}

id __58__HUPinCodeDetailsItemManager__buildItemProvidersForHome___block_invoke_126(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([a2 canAddWalletKeyErrorCode] == 8)
  {
    id v3 = HFLogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v12 = v4;
      __int16 v13 = 2080;
      int v14 = "-[HUPinCodeDetailsItemManager _buildItemProvidersForHome:]_block_invoke";
      _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "(%@: %s) Hiding \"Add/Show Home Key to Wallet\" buttonbecause current device has Wallet app deleted", buf, 0x16u);
    }

    [*(id *)(a1 + 40) setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68B10]];
    int v5 = [MEMORY[0x1E4F7A0D8] futureWithResult:*(void *)(a1 + 40)];
  }
  else
  {
    id v6 = objc_msgSend(*(id *)(a1 + 48), "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");
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __58__HUPinCodeDetailsItemManager__buildItemProvidersForHome___block_invoke_127;
    v8[3] = &unk_1E638AEC0;
    id v9 = *(id *)(a1 + 48);
    id v10 = *(id *)(a1 + 40);
    int v5 = [v6 flatMap:v8];
  }

  return v5;
}

id __58__HUPinCodeDetailsItemManager__buildItemProvidersForHome___block_invoke_127(uint64_t a1, void *a2)
{
  int v3 = [a2 BOOLValue];
  uint64_t v4 = *(void **)(a1 + 32);
  if (v3)
  {
    int v5 = objc_msgSend(v4, "hf_hasWalletKey");
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    int v17 = __58__HUPinCodeDetailsItemManager__buildItemProvidersForHome___block_invoke_2_128;
    int v18 = &unk_1E6385648;
    id v6 = &v19;
    id v19 = *(id *)(a1 + 40);
    int v7 = &v15;
  }
  else
  {
    int v5 = objc_msgSend(v4, "hf_walletKeyDeviceStatesOfCompatiblePairedWatches");
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    uint64_t v12 = __58__HUPinCodeDetailsItemManager__buildItemProvidersForHome___block_invoke_3;
    __int16 v13 = &unk_1E6385620;
    id v6 = &v14;
    id v14 = *(id *)(a1 + 40);
    int v7 = &v10;
  }
  uint64_t v8 = objc_msgSend(v5, "flatMap:", v7, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19);

  return v8;
}

uint64_t __58__HUPinCodeDetailsItemManager__buildItemProvidersForHome___block_invoke_2_128(uint64_t a1, void *a2)
{
  int v3 = [a2 BOOLValue];
  BOOL v4 = v3 == 0;
  if (v3) {
    int v5 = @"HUShowHomeKeyInWalletButtonTitle";
  }
  else {
    int v5 = @"HUHomeSettingsLockAddHomeKeyToWallet";
  }
  if (v4) {
    id v6 = @"Home.Locks.PinCode.Details.AddHomeKeyToWallet";
  }
  else {
    id v6 = @"Home.Locks.PinCode.Details.ShowHomeKeyInWallet";
  }
  int v7 = _HULocalizedStringWithDefaultValue(v5, v5, 1);
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F68928]];
  uint64_t v8 = (void *)MEMORY[0x1E4F7A0D8];
  uint64_t v9 = *(void *)(a1 + 32);

  return [v8 futureWithResult:v9];
}

id __58__HUPinCodeDetailsItemManager__buildItemProvidersForHome___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136315394;
    int v17 = "-[HUPinCodeDetailsItemManager _buildItemProvidersForHome:]_block_invoke_3";
    __int16 v18 = 2112;
    id v19 = v3;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "(%s) For addOrShowHomeKeyItem | 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 returned NO and hf_walletKeyDeviceStatesOfCompatiblePairedWatches is %@", (uint8_t *)&v16, 0x16u);
  }

  uint64_t v5 = [v3 count];
  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = *MEMORY[0x1E4F68B10];
  if (v5)
  {
    objc_msgSend(v6, "na_safeSetObject:forKey:", MEMORY[0x1E4F1CC28], v7);
    uint64_t v8 = objc_msgSend(v3, "na_filter:", &__block_literal_global_229);
    uint64_t v9 = [v8 count];
    BOOL v10 = v9 == 0;
    if (v9) {
      uint64_t v11 = @"HUHomeSettingsLockAddHomeKeyToWallet";
    }
    else {
      uint64_t v11 = @"HUShowHomeKeyInWalletButtonTitle";
    }
    if (v10) {
      uint64_t v12 = @"Home.Locks.PinCode.Details.ShowHomeKeyInWallet";
    }
    else {
      uint64_t v12 = @"Home.Locks.PinCode.Details.AddHomeKeyToWallet";
    }
    __int16 v13 = _HULocalizedStringWithDefaultValue(v11, v11, 1);
    [*(id *)(a1 + 32) setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

    [*(id *)(a1 + 32) setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F68928]];
    id v14 = [MEMORY[0x1E4F7A0D8] futureWithResult:*(void *)(a1 + 32)];
  }
  else
  {
    objc_msgSend(v6, "na_safeSetObject:forKey:", MEMORY[0x1E4F1CC38], v7);
    id v14 = [MEMORY[0x1E4F7A0D8] futureWithResult:*(void *)(a1 + 32)];
  }

  return v14;
}

BOOL __58__HUPinCodeDetailsItemManager__buildItemProvidersForHome___block_invoke_142(uint64_t a1, void *a2)
{
  v2 = [a2 walletKey];
  BOOL v3 = v2 == 0;

  return v3;
}

id __58__HUPinCodeDetailsItemManager__buildItemProvidersForHome___block_invoke_2_146(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  BOOL v3 = 1;
  BOOL v4 = _HULocalizedStringWithDefaultValue(@"HUPinCodeDeleteGuestButtonTitle", @"HUPinCodeDeleteGuestButtonTitle", 1);
  [v2 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  [v2 setObject:@"Home.Locks.PinCode.Details.RemoveGuest" forKeyedSubscript:*MEMORY[0x1E4F68928]];
  if (!*(unsigned char *)(a1 + 48) && !*(void *)(a1 + 32)) {
    BOOL v3 = *(unsigned char *)(a1 + 49) == 0;
  }
  uint64_t v5 = [NSNumber numberWithBool:v3];
  [v2 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F68B10]];

  id v6 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "operationInProgress"));
  [v2 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F68A08]];

  uint64_t v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = *(unsigned __int8 *)(a1 + 48);
    int v9 = *(unsigned __int8 *)(a1 + 49);
    int v10 = [*(id *)(a1 + 40) operationInProgress];
    uint64_t v11 = objc_msgSend(*(id *)(a1 + 32), "hf_prettyDescription");
    int v14 = 136316418;
    uint64_t v15 = "-[HUPinCodeDetailsItemManager _buildItemProvidersForHome:]_block_invoke_2";
    __int16 v16 = 1024;
    BOOL v17 = v3;
    __int16 v18 = 1024;
    int v19 = v8;
    __int16 v20 = 1024;
    int v21 = v9;
    __int16 v22 = 1024;
    int v23 = v10;
    __int16 v24 = 2112;
    __int16 v25 = v11;
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "(%s) For deleteGuestPINCodeItem, hide = %{BOOL}d | newPinCode = %{BOOL}d |  hasOnboardedForAccessCode = %{BOOL}d | operationInProgress = %{BOOL}d | user = %@", (uint8_t *)&v14, 0x2Eu);
  }
  uint64_t v12 = [MEMORY[0x1E4F7A0D8] futureWithResult:v2];

  return v12;
}

id __58__HUPinCodeDetailsItemManager__buildItemProvidersForHome___block_invoke_153(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) restoreFuture];
  int v3 = [v2 isFinished];

  if (v3)
  {
    BOOL v4 = [*(id *)(a1 + 32) restoreFuture];
    uint64_t v5 = [v4 flatMap:&__block_literal_global_157_0];
  }
  else
  {
    BOOL v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v6 = _HULocalizedStringWithDefaultValue(@"HUPinCodeRestoreHomeKeyAccessButton", @"HUPinCodeRestoreHomeKeyAccessButton", 1);
    [v4 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

    [v4 setObject:@"Home.Locks.PinCode.Details.RestoreHomeKeyAccess" forKeyedSubscript:*MEMORY[0x1E4F68928]];
    [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68B10]];
    uint64_t v7 = HFLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      uint64_t v11 = "-[HUPinCodeDetailsItemManager _buildItemProvidersForHome:]_block_invoke";
      _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "(%s) restoreHomeKeyAccessItem is hidden because restoreFuture is NOT finished", (uint8_t *)&v10, 0xCu);
    }

    uint64_t v5 = [MEMORY[0x1E4F7A0D8] futureWithResult:v4];
  }
  int v8 = (void *)v5;

  return v8;
}

id __58__HUPinCodeDetailsItemManager__buildItemProvidersForHome___block_invoke_2_154(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  int v3 = [MEMORY[0x1E4F1CA60] dictionary];
  BOOL v4 = _HULocalizedStringWithDefaultValue(@"HUPinCodeRestoreHomeKeyAccessButton", @"HUPinCodeRestoreHomeKeyAccessButton", 1);
  [v3 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  [v3 setObject:@"Home.Locks.PinCode.Details.RestoreHomeKeyAccess" forKeyedSubscript:*MEMORY[0x1E4F68928]];
  [v3 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:*MEMORY[0x1E4F68A70]];
  uint64_t v5 = objc_msgSend(v2, "hmf_isEmpty");
  id v6 = [NSNumber numberWithBool:v5];
  [v3 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F68B10]];

  uint64_t v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315650;
    uint64_t v11 = "-[HUPinCodeDetailsItemManager _buildItemProvidersForHome:]_block_invoke_2";
    __int16 v12 = 1024;
    int v13 = v5;
    __int16 v14 = 2112;
    id v15 = v2;
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "(%s) For restoreHomeKeyAccessItem, hidden = %{BOOL}d | missingWalletKeys = %@ | restoreFuture.isFinished = YES", (uint8_t *)&v10, 0x1Cu);
  }

  int v8 = [MEMORY[0x1E4F7A0D8] futureWithResult:v3];

  return v8;
}

BOOL __58__HUPinCodeDetailsItemManager__buildItemProvidersForHome___block_invoke_166(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  uint64_t v7 = [v6 category];
  if ([v7 isEqual:*MEMORY[0x1E4F2C1B0]])
  {
  }
  else
  {
    int v8 = objc_msgSend(v6, "hf_primaryService");
    int v9 = [v8 serviceType];
    int v10 = [v9 isEqualToString:*MEMORY[0x1E4F2DE88]];

    if (!v10)
    {
      BOOL v11 = 0;
      goto LABEL_11;
    }
  }
  BOOL v11 = ([v6 supportsAccessCodes] & 1) != 0 || *(void *)(a1 + 32) != 0;
LABEL_11:

  return v11;
}

id __58__HUPinCodeDetailsItemManager__buildItemProvidersForHome___block_invoke_2_170(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  uint64_t v7 = [v6 accessory];
  if ([*(id *)(a1 + 32) isUnknownGuestFromMatter]
    && ([*(id *)(a1 + 32) accessories],
        int v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 containsObject:v7],
        v8,
        !v9))
  {
    __int16 v12 = 0;
  }
  else
  {
    id v10 = objc_alloc(MEMORY[0x1E4F696A8]);
    BOOL v11 = (void *)[v4 copy];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __58__HUPinCodeDetailsItemManager__buildItemProvidersForHome___block_invoke_3_173;
    v14[3] = &unk_1E638FC50;
    objc_copyWeak(&v19, (id *)(a1 + 64));
    id v15 = v7;
    id v16 = *(id *)(a1 + 40);
    id v17 = *(id *)(a1 + 48);
    char v20 = *(unsigned char *)(a1 + 72);
    id v18 = *(id *)(a1 + 56);
    char v21 = *(unsigned char *)(a1 + 73);
    __int16 v12 = (void *)[v10 initWithSourceItem:v11 transformationBlock:v14];

    objc_destroyWeak(&v19);
  }

  return v12;
}

id __58__HUPinCodeDetailsItemManager__buildItemProvidersForHome___block_invoke_3_173(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 64);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  objc_opt_class();
  id v6 = [WeakRetained sourceItem];
  if (objc_opt_isKindOfClass()) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  int v9 = [v8 accessories];
  int v10 = [v9 containsObject:*(void *)(a1 + 32)];

  int v11 = [*(id *)(a1 + 32) supportsAccessCodes];
  if (*(void *)(a1 + 40)) {
    BOOL v12 = *(void *)(a1 + 48) != 0;
  }
  else {
    BOOL v12 = 1;
  }
  int v13 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v14 = *MEMORY[0x1E4F68AB8];
  id v15 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  [v13 setObject:v15 forKeyedSubscript:v14];

  uint64_t v16 = *MEMORY[0x1E4F68928];
  id v17 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F68928]];

  [v13 setObject:v17 forKeyedSubscript:v16];
  [v13 setObject:@"lock.fill" forKeyedSubscript:*MEMORY[0x1E4F68A00]];
  id v18 = [MEMORY[0x1E4F68EA0] securityAccessoryTypeGroup];
  id v19 = objc_msgSend(v18, "hu_tintColor");
  [v13 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4F68AB0]];

  if (objc_msgSend(*(id *)(a1 + 56), "hf_currentUserIsAdministrator")
    && objc_msgSend(*(id *)(a1 + 56), "hf_userIsRestrictedGuest:", *(void *)(a1 + 40)))
  {
    char v20 = [*(id *)(a1 + 56) homeAccessControlForUser:*(void *)(a1 + 40)];
    char v21 = [v20 restrictedGuestAccessSettings];
    [v21 accessAllowedToAccessories];
    int v32 = v10;
    id v22 = v8;
    id v23 = WeakRetained;
    BOOL v24 = v12;
    v26 = int v25 = v11;
    [v26 containsObject:*(void *)(a1 + 32)];

    int v11 = v25;
    BOOL v12 = v24;
    id WeakRetained = v23;
    id v8 = v22;
    int v10 = v32;
  }
  char v27 = [*(id *)(a1 + 32) isReachable];
  BOOL v28 = [NSNumber numberWithInteger:HFPrimaryStateFromBOOL()];
  [v13 setObject:v28 forKeyedSubscript:*MEMORY[0x1E4F68BC0]];

  if ((v27 & 1) == 0 && (objc_msgSend(*(id *)(a1 + 56), "hf_shouldBlockCurrentRestrictedGuestFromHome") & 1) == 0)
  {
    [v13 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68A08]];
    __int16 v29 = @"HUPinCodeAccessorySectionIsUnReachable";
    goto LABEL_17;
  }
  if (((v12 | v10) & 1) == 0 && ((v11 ^ 1) & 1) == 0 && *(unsigned char *)(a1 + 73))
  {
    __int16 v29 = @"HUPinCodeAccessorySectionUserPINUnset";
LABEL_17:
    int v30 = _HULocalizedStringWithDefaultValue(v29, v29, 1);
    objc_msgSend(v13, "na_safeSetObject:forKey:", v30, *MEMORY[0x1E4F68980]);
  }

  return v13;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  v64[1] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v6 = [v4 array];
  objc_opt_class();
  uint64_t v7 = [(HFItemManager *)self sourceItem];
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  int v10 = [(HFItemManager *)self sourceItem];

  int v11 = [(HFItemManager *)self home];
  if (objc_msgSend(v11, "hf_hasHomeHubSupportingAccessCodes"))
  {
    int v12 = 1;
  }
  else
  {
    int v13 = [(HFItemManager *)self home];
    int v12 = objc_msgSend(v13, "hf_currentUserIsAdministrator");
  }
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"PinCodesLabel"];
  id v15 = [(HUPinCodeDetailsItemManager *)self pinCodeLabelItem];
  v64[0] = v15;
  uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:1];
  [v14 setItems:v16];

  if (v10)
  {
    id v17 = _HULocalizedStringWithDefaultValue(@"HUPinCodeNameLabelSectionHeader", @"HUPinCodeNameLabelSectionHeader", 1);
    [v14 setHeaderTitle:v17];
  }
  id v61 = v9;
  if ([v9 isUnknownGuestFromMatter])
  {
    id v18 = _HULocalizedStringWithDefaultValue(@"HUPinCodeNameLabelSectionFooter", @"HUPinCodeNameLabelSectionFooter", 1);
    [v14 setFooterTitle:v18];
  }
  v59 = v14;
  objc_msgSend(v6, "na_safeAddObject:", v14);
  v60 = v5;
  if (v12)
  {
    id v19 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"PinCodesAccessories"];
    char v20 = [(HUPinCodeDetailsItemManager *)self transformedLocksItemProvider];
    char v21 = [v20 items];
    id v22 = [v21 allObjects];
    id v23 = [MEMORY[0x1E4F69220] defaultItemComparator];
    BOOL v24 = [v22 sortedArrayUsingComparator:v23];
    int v25 = (void *)[v24 mutableCopy];

    uint64_t v26 = [(HUPinCodeDetailsItemManager *)self pinCodeRestoreAccessItem];
    [v25 addObject:v26];

    char v27 = [(HUPinCodeDetailsItemManager *)self restoreHomeKeyAccessItem];
    [v25 addObject:v27];

    [v19 setItems:v25];
    BOOL v28 = _HULocalizedStringWithDefaultValue(@"HUPinCodeAccessorySectionHeader", @"HUPinCodeAccessorySectionHeader", 1);
    [v19 setHeaderTitle:v28];

    __int16 v29 = [v61 user];

    if (v29)
    {
      int v30 = [(HFItemManager *)self home];
      __int16 v31 = [v30 name];
      __int16 v38 = HULocalizedStringWithFormat(@"HUPinCodeUserAccessorySectionFooter", @"%@", v32, v33, v34, v35, v36, v37, (uint64_t)v31);
      [v19 setFooterTitle:v38];
    }
    else
    {
      int v30 = _HULocalizedStringWithDefaultValue(@"HUPinCodeGuestAccessorySectionFooter", @"HUPinCodeGuestAccessorySectionFooter", 1);
      [v19 setFooterTitle:v30];
    }

    [v6 addObject:v19];
  }
  uint64_t v39 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"PinCodesValue"];
  uint64_t v40 = (void *)MEMORY[0x1E4F1CA48];
  __int16 v41 = [(HUPinCodeDetailsItemManager *)self pinCodeValueItem];
  v63[0] = v41;
  id v42 = [(HUPinCodeDetailsItemManager *)self pinCodeChangeItem];
  v63[1] = v42;
  id v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:2];
  id v44 = [v40 arrayWithArray:v43];

  [v39 setItems:v44];
  v45 = _HULocalizedStringWithDefaultValue(@"HUPinCodeValueSectionFooter", @"HUPinCodeValueSectionFooter", 1);
  [v39 setFooterTitle:v45];

  objc_msgSend(v6, "na_safeAddObject:", v39);
  id v46 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"PersonalPINCode"];
  id v47 = (void *)MEMORY[0x1E4F1C978];
  v48 = [(HUPinCodeDetailsItemManager *)self personalPINCodeItem];
  id v49 = objc_msgSend(v47, "na_arrayWithSafeObject:", v48);
  [v46 setItems:v49];

  objc_msgSend(v6, "na_safeAddObject:", v46);
  v50 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"ShowHomeKeyInWallet"];
  v51 = (void *)MEMORY[0x1E4F1C978];
  v52 = [(HUPinCodeDetailsItemManager *)self addOrShowHomeKeyItem];
  v53 = objc_msgSend(v51, "na_arrayWithSafeObject:", v52);
  [v50 setItems:v53];

  objc_msgSend(v6, "na_safeAddObject:", v50);
  v54 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"PinCodesDelete"];
  v55 = [(HUPinCodeDetailsItemManager *)self deleteGuestPINCodeItem];
  v62 = v55;
  v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v62 count:1];
  [v54 setItems:v56];

  [v6 addObject:v54];
  v57 = [MEMORY[0x1E4F69220] filterSections:v6 toDisplayedItems:v60];

  return v57;
}

- (id)_homeFuture
{
  id v2 = (void *)MEMORY[0x1E4F7A0D8];
  id v3 = [(HUPinCodeDetailsItemManager *)self overrideHome];
  id v4 = [v2 futureWithResult:v3];

  return v4;
}

- (id)_itemsToUpdateWhenApplicationDidBecomeActive
{
  id v2 = (void *)MEMORY[0x1E4F1CAD0];
  id v3 = [(HUPinCodeDetailsItemManager *)self addOrShowHomeKeyItem];
  id v4 = objc_msgSend(v2, "na_setWithSafeObject:", v3);

  return v4;
}

- (void)_registerForExternalUpdates
{
  v4.receiver = self;
  v4.super_class = (Class)HUPinCodeDetailsItemManager;
  [(HFItemManager *)&v4 _registerForExternalUpdates];
  id v3 = [(HUPinCodeDetailsItemManager *)self pinCodeManager];
  [v3 addObserver:self];
}

- (void)_unregisterForExternalUpdates
{
  v4.receiver = self;
  v4.super_class = (Class)HUPinCodeDetailsItemManager;
  [(HFItemManager *)&v4 _unregisterForExternalUpdates];
  id v3 = [(HUPinCodeDetailsItemManager *)self pinCodeManager];
  [v3 removeObserver:self];
}

- (void)pinCodeManagerDidUpdate:(id)a3 pinCodes:(id)a4
{
  id v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "Updating details", buf, 2u);
  }

  objc_opt_class();
  uint64_t v7 = [(HFItemManager *)self sourceItem];
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  if (v9)
  {
    int v10 = [(HUPinCodeDetailsItemManager *)self pinCodeManager];
    int v11 = [v9 pinCodeValue];
    int v12 = [v10 pinCodeForCodeValue:v11];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __64__HUPinCodeDetailsItemManager_pinCodeManagerDidUpdate_pinCodes___block_invoke;
    v14[3] = &unk_1E638FCA0;
    id v15 = v9;
    uint64_t v16 = self;
    SEL v17 = a2;
    id v13 = (id)[v12 addSuccessBlock:v14];
  }
}

id *__64__HUPinCodeDetailsItemManager_pinCodeManagerDidUpdate_pinCodes___block_invoke(id *result, uint64_t a2)
{
  if (a2)
  {
    id v2 = result;
    [result[4] updateFromPinCode:a2];
    return (id *)(id)[v2[5] reloadAndUpdateAllItemsFromSenderSelector:v2[6]];
  }
  return result;
}

- (HFTransformItemProvider)transformedLocksItemProvider
{
  return self->_transformedLocksItemProvider;
}

- (void)setTransformedLocksItemProvider:(id)a3
{
}

- (HFStaticItem)personalPINCodeItem
{
  return self->_personalPINCodeItem;
}

- (void)setPersonalPINCodeItem:(id)a3
{
}

- (HFStaticItem)pinCodeLabelItem
{
  return self->_pinCodeLabelItem;
}

- (void)setPinCodeLabelItem:(id)a3
{
}

- (HFStaticItem)pinCodeValueItem
{
  return self->_pinCodeValueItem;
}

- (void)setPinCodeValueItem:(id)a3
{
}

- (HFStaticItem)pinCodeChangeItem
{
  return self->_pinCodeChangeItem;
}

- (void)setPinCodeChangeItem:(id)a3
{
}

- (HFStaticItem)pinCodeRestoreAccessItem
{
  return self->_pinCodeRestoreAccessItem;
}

- (void)setPinCodeRestoreAccessItem:(id)a3
{
}

- (HFStaticItem)addOrShowHomeKeyItem
{
  return self->_addOrShowHomeKeyItem;
}

- (void)setAddOrShowHomeKeyItem:(id)a3
{
}

- (HFStaticItem)deleteGuestPINCodeItem
{
  return self->_deleteGuestPINCodeItem;
}

- (void)setDeleteGuestPINCodeItem:(id)a3
{
}

- (HFStaticItem)restoreHomeKeyAccessItem
{
  return self->_restoreHomeKeyAccessItem;
}

- (void)setRestoreHomeKeyAccessItem:(id)a3
{
}

- (NAFuture)restoreFuture
{
  return self->_restoreFuture;
}

- (void)setRestoreFuture:(id)a3
{
}

- (BOOL)operationInProgress
{
  return self->_operationInProgress;
}

- (void)setOperationInProgress:(BOOL)a3
{
  self->_operationInProgress = a3;
}

- (HFPinCodeManager)pinCodeManager
{
  return self->_pinCodeManager;
}

- (HMHome)overrideHome
{
  return self->_overrideHome;
}

- (HFAccessoryItemProvider)locksItemProvider
{
  return self->_locksItemProvider;
}

- (void)setLocksItemProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locksItemProvider, 0);
  objc_storeStrong((id *)&self->_overrideHome, 0);
  objc_storeStrong((id *)&self->_pinCodeManager, 0);
  objc_storeStrong((id *)&self->_restoreFuture, 0);
  objc_storeStrong((id *)&self->_restoreHomeKeyAccessItem, 0);
  objc_storeStrong((id *)&self->_deleteGuestPINCodeItem, 0);
  objc_storeStrong((id *)&self->_addOrShowHomeKeyItem, 0);
  objc_storeStrong((id *)&self->_pinCodeRestoreAccessItem, 0);
  objc_storeStrong((id *)&self->_pinCodeChangeItem, 0);
  objc_storeStrong((id *)&self->_pinCodeValueItem, 0);
  objc_storeStrong((id *)&self->_pinCodeLabelItem, 0);
  objc_storeStrong((id *)&self->_personalPINCodeItem, 0);

  objc_storeStrong((id *)&self->_transformedLocksItemProvider, 0);
}

@end