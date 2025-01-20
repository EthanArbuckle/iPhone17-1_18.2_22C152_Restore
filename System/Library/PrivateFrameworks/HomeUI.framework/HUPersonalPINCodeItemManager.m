@interface HUPersonalPINCodeItemManager
- (BOOL)operationInProgress;
- (HFPinCodeManager)pinCodeManager;
- (HFStaticItem)createUserPINButtonItem;
- (HFStaticItem)pinCodeChangeItem;
- (HFStaticItem)pinCodeValueItem;
- (HFStaticItem)removeUserPINButtonItem;
- (HFStaticItem)shareButtonItem;
- (HMHome)overrideHome;
- (HUPersonalPINCodeItemManager)initWithDelegate:(id)a3;
- (HUPersonalPINCodeItemManager)initWithDelegate:(id)a3 item:(id)a4 pinCodeManager:(id)a5 home:(id)a6;
- (HUPersonalPINCodeItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (id)_homeFuture;
- (id)_itemsToUpdateForApplicationResignActive;
- (void)setCreateUserPINButtonItem:(id)a3;
- (void)setOperationInProgress:(BOOL)a3;
- (void)setPinCodeChangeItem:(id)a3;
- (void)setPinCodeValueItem:(id)a3;
- (void)setRemoveUserPINButtonItem:(id)a3;
- (void)setShareButtonItem:(id)a3;
@end

@implementation HUPersonalPINCodeItemManager

- (HUPersonalPINCodeItemManager)initWithDelegate:(id)a3 item:(id)a4 pinCodeManager:(id)a5 home:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)HUPersonalPINCodeItemManager;
  v13 = [(HFItemManager *)&v16 initWithDelegate:a3 sourceItem:a4];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_pinCodeManager, a5);
    objc_storeStrong((id *)&v14->_overrideHome, a6);
  }

  return v14;
}

- (HUPersonalPINCodeItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  v7 = NSStringFromSelector(sel_initWithDelegate_item_pinCodeManager_home_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUPersonalPINCodeItemManager.m", 58, @"%s is unavailable; use %@ instead",
    "-[HUPersonalPINCodeItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (HUPersonalPINCodeItemManager)initWithDelegate:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_initWithDelegate_item_pinCodeManager_home_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUPersonalPINCodeItemManager.m", 63, @"%s is unavailable; use %@ instead",
    "-[HUPersonalPINCodeItemManager initWithDelegate:]",
    v6);

  return 0;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  v69[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  v5 = [(HFItemManager *)self sourceItem];
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  unint64_t v7 = v6;

  objc_opt_class();
  v8 = [(HFItemManager *)self sourceItem];
  if (objc_opt_isKindOfClass()) {
    unint64_t v9 = (unint64_t)v8;
  }
  else {
    unint64_t v9 = 0;
  }

  unint64_t v54 = v9;
  if (!(v9 | v7))
  {
    v10 = [(HFItemManager *)self sourceItem];
    NSLog(&cfstr_ExpectedItemTo.isa, v10);
  }
  int v11 = [(id)v7 isGuest];
  if (objc_msgSend(v4, "hf_hasHomeHubSupportingAccessCodes")) {
    int v12 = 1;
  }
  else {
    int v12 = objc_msgSend(v4, "hf_currentUserIsOwner");
  }
  int v51 = v12;
  id v13 = objc_alloc(MEMORY[0x1E4F695C0]);
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __59__HUPersonalPINCodeItemManager__buildItemProvidersForHome___block_invoke;
  v59[3] = &unk_1E6385DE0;
  id v60 = v4;
  id v61 = (id)v7;
  char v62 = v11;
  id v55 = v4;
  id v56 = (id)v7;
  v14 = (void *)[v13 initWithResultsBlock:v59];
  [(HUPersonalPINCodeItemManager *)self setPinCodeValueItem:v14];

  id v15 = objc_alloc(MEMORY[0x1E4F695C0]);
  int v16 = v11;
  char v52 = v11;
  uint64_t v17 = *MEMORY[0x1E4F68AB8];
  v68[0] = *MEMORY[0x1E4F68AB8];
  v18 = _HULocalizedStringWithDefaultValue(@"HUPinCodeChangeCellTitle", @"HUPinCodeChangeCellTitle", 1);
  uint64_t v19 = *MEMORY[0x1E4F68928];
  v69[0] = v18;
  v69[1] = @"Home.Locks.Pincode.ChangeAccessCode";
  uint64_t v20 = *MEMORY[0x1E4F68B10];
  v68[1] = v19;
  v68[2] = v20;
  if (v7) {
    int v21 = v12;
  }
  else {
    int v21 = 0;
  }
  char v53 = v21;
  if (v7) {
    int v22 = v16;
  }
  else {
    int v22 = 0;
  }
  v23 = [NSNumber numberWithInt:v21 ^ 1u];
  v69[2] = v23;
  v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v69 forKeys:v68 count:3];
  v25 = (void *)[v15 initWithResults:v24];
  [(HUPersonalPINCodeItemManager *)self setPinCodeChangeItem:v25];

  id v26 = objc_alloc(MEMORY[0x1E4F695C0]);
  v66[0] = v17;
  v27 = _HULocalizedStringWithDefaultValue(@"HUPinCodeShareButtonTitle", @"HUPinCodeShareButtonTitle", 1);
  v67[0] = v27;
  v67[1] = @"Home.Locks.Pincode.ShareAccessCode";
  v66[1] = v19;
  v66[2] = v20;
  v28 = [NSNumber numberWithInt:v22 ^ 1u];
  v67[2] = v28;
  v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v67 forKeys:v66 count:3];
  v30 = (void *)[v26 initWithResults:v29];
  [(HUPersonalPINCodeItemManager *)self setShareButtonItem:v30];

  if (v56) {
    BOOL v31 = 1;
  }
  else {
    BOOL v31 = v54 == 0;
  }
  if (v31) {
    int v32 = 0;
  }
  else {
    int v32 = v51;
  }
  id v33 = objc_alloc(MEMORY[0x1E4F695C0]);
  v64[0] = v17;
  v34 = _HULocalizedStringWithDefaultValue(@"HUPinCodeCreateUserPINButtonTitle", @"HUPinCodeCreateUserPINButtonTitle", 1);
  v65[0] = v34;
  v65[1] = @"Home.Locks.PinCode.CreateAccessCode";
  v64[1] = v19;
  v64[2] = v20;
  v35 = [NSNumber numberWithInt:v32 ^ 1u];
  v65[2] = v35;
  v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v65 forKeys:v64 count:3];
  v37 = (void *)[v33 initWithResults:v36];
  [(HUPersonalPINCodeItemManager *)self setCreateUserPINButtonItem:v37];

  id v38 = objc_alloc(MEMORY[0x1E4F695C0]);
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __59__HUPersonalPINCodeItemManager__buildItemProvidersForHome___block_invoke_2;
  v57[3] = &unk_1E6386518;
  char v58 = v53 & ~v52;
  v57[4] = self;
  v39 = (void *)[v38 initWithResultsBlock:v57];
  [(HUPersonalPINCodeItemManager *)self setRemoveUserPINButtonItem:v39];

  v40 = objc_opt_new();
  v41 = [(HUPersonalPINCodeItemManager *)self pinCodeValueItem];
  objc_msgSend(v40, "na_safeAddObject:", v41);

  v42 = [(HUPersonalPINCodeItemManager *)self pinCodeChangeItem];
  objc_msgSend(v40, "na_safeAddObject:", v42);

  v43 = [(HUPersonalPINCodeItemManager *)self shareButtonItem];
  objc_msgSend(v40, "na_safeAddObject:", v43);

  v44 = [(HUPersonalPINCodeItemManager *)self createUserPINButtonItem];
  objc_msgSend(v40, "na_safeAddObject:", v44);

  v45 = [(HUPersonalPINCodeItemManager *)self removeUserPINButtonItem];
  objc_msgSend(v40, "na_safeAddObject:", v45);

  id v46 = objc_alloc(MEMORY[0x1E4F695C8]);
  v47 = [MEMORY[0x1E4F1CAD0] setWithArray:v40];
  v48 = (void *)[v46 initWithItems:v47];

  v63 = v48;
  v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v63 count:1];

  return v49;
}

id __59__HUPersonalPINCodeItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  v3 = _HULocalizedStringWithDefaultValue(@"HUPinCodeValueCellTitle", @"HUPinCodeValueCellTitle", 1);
  [v2 setObject:v3 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  [v2 setObject:@"Home.Locks.PinCode.AccessCode" forKeyedSubscript:*MEMORY[0x1E4F68928]];
  id v4 = [*(id *)(a1 + 32) currentUser];
  v5 = [v4 uniqueIdentifier];
  v6 = [*(id *)(a1 + 40) user];
  unint64_t v7 = [v6 uniqueIdentifier];
  int v8 = [v5 isEqual:v7];

  unint64_t v9 = [MEMORY[0x1E4F69138] sharedInstance];
  if ([v9 isActive])
  {
    if (*(unsigned char *)(a1 + 48)) {
      int v8 = 1;
    }

    if (v8 == 1)
    {
      uint64_t v10 = [*(id *)(a1 + 40) pinCodeValue];
      goto LABEL_8;
    }
  }
  else
  {
  }
  uint64_t v10 = _HULocalizedStringWithDefaultValue(@"HUPINCodeMasking", @"HUPINCodeMasking", 1);
LABEL_8:
  int v11 = (void *)v10;
  [v2 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F68980]];

  int v12 = [NSNumber numberWithInt:*(void *)(a1 + 40) == 0];
  [v2 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F68B10]];

  id v13 = [MEMORY[0x1E4F7A0D8] futureWithResult:v2];

  return v13;
}

id __59__HUPersonalPINCodeItemManager__buildItemProvidersForHome___block_invoke_2(uint64_t a1)
{
  v11[4] = *MEMORY[0x1E4F143B8];
  v10[0] = *MEMORY[0x1E4F68AB8];
  v2 = _HULocalizedStringWithDefaultValue(@"HUPinCodeRemoveUserPINButtonTitle", @"HUPinCodeRemoveUserPINButtonTitle", 1);
  uint64_t v3 = *MEMORY[0x1E4F68928];
  v11[0] = v2;
  v11[1] = @"Home.Locks.PinCode.RemoveAccessCode";
  uint64_t v4 = *MEMORY[0x1E4F68B10];
  v10[1] = v3;
  v10[2] = v4;
  v5 = [NSNumber numberWithInt:*(unsigned char *)(a1 + 40) == 0];
  v11[2] = v5;
  v10[3] = *MEMORY[0x1E4F68A08];
  v6 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "operationInProgress"));
  v11[3] = v6;
  unint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:4];

  int v8 = [MEMORY[0x1E4F7A0D8] futureWithResult:v7];

  return v8;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  v22[2] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  v6 = [v4 array];
  unint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"PinCodeValue"];
  int v8 = [(HUPersonalPINCodeItemManager *)self pinCodeValueItem];
  v22[0] = v8;
  unint64_t v9 = [(HUPersonalPINCodeItemManager *)self pinCodeChangeItem];
  v22[1] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
  [v7 setItems:v10];

  objc_msgSend(v6, "na_safeAddObject:", v7);
  int v11 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"SharePinCode"];
  int v12 = [(HUPersonalPINCodeItemManager *)self shareButtonItem];
  int v21 = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
  [v11 setItems:v13];

  objc_msgSend(v6, "na_safeAddObject:", v11);
  v14 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"CreateRemovePIN"];
  id v15 = [(HUPersonalPINCodeItemManager *)self createUserPINButtonItem];
  int v16 = [(HUPersonalPINCodeItemManager *)self removeUserPINButtonItem];
  v20[1] = v16;
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  [v14 setItems:v17];

  objc_msgSend(v6, "na_safeAddObject:", v14);
  v18 = [MEMORY[0x1E4F69220] filterSections:v6 toDisplayedItems:v5];

  return v18;
}

- (id)_homeFuture
{
  v2 = (void *)MEMORY[0x1E4F7A0D8];
  uint64_t v3 = [(HUPersonalPINCodeItemManager *)self overrideHome];
  uint64_t v4 = [v2 futureWithResult:v3];

  return v4;
}

- (id)_itemsToUpdateForApplicationResignActive
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = [(HUPersonalPINCodeItemManager *)self pinCodeValueItem];
  uint64_t v4 = objc_msgSend(v2, "na_setWithSafeObject:", v3);

  return v4;
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

- (HFStaticItem)shareButtonItem
{
  return self->_shareButtonItem;
}

- (void)setShareButtonItem:(id)a3
{
}

- (HFStaticItem)createUserPINButtonItem
{
  return self->_createUserPINButtonItem;
}

- (void)setCreateUserPINButtonItem:(id)a3
{
}

- (HFStaticItem)removeUserPINButtonItem
{
  return self->_removeUserPINButtonItem;
}

- (void)setRemoveUserPINButtonItem:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideHome, 0);
  objc_storeStrong((id *)&self->_pinCodeManager, 0);
  objc_storeStrong((id *)&self->_removeUserPINButtonItem, 0);
  objc_storeStrong((id *)&self->_createUserPINButtonItem, 0);
  objc_storeStrong((id *)&self->_shareButtonItem, 0);
  objc_storeStrong((id *)&self->_pinCodeChangeItem, 0);

  objc_storeStrong((id *)&self->_pinCodeValueItem, 0);
}

@end