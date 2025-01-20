@interface HUUserAccessoryAccessViewController
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (HMHome)home;
- (HMUser)user;
- (HUUserAccessoryAccessItemManager)userAccessoryAccessItemManager;
- (HUUserAccessoryAccessViewController)initWithHome:(id)a3 user:(id)a4 accessoryCategoryType:(id)a5;
- (NSMutableSet)inFlightAllowedAccessoryAdditions;
- (NSMutableSet)inFlightAllowedAccessoryRemovals;
- (NSString)accessoryCategoryType;
- (void)setInFlightAllowedAccessoryAdditions:(id)a3;
- (void)setInFlightAllowedAccessoryRemovals:(id)a3;
- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5;
- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4;
- (void)viewDidLoad;
@end

@implementation HUUserAccessoryAccessViewController

- (HUUserAccessoryAccessViewController)initWithHome:(id)a3 user:(id)a4 accessoryCategoryType:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
LABEL_8:
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"HUUserAccessoryAccessViewController.m", 38, @"Invalid parameter not satisfying: %@", @"user" object file lineNumber description];

    if (v12) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:a2, self, @"HUUserAccessoryAccessViewController.m", 37, @"Invalid parameter not satisfying: %@", @"home" object file lineNumber description];

  if (!v11) {
    goto LABEL_8;
  }
LABEL_3:
  if (v12) {
    goto LABEL_4;
  }
LABEL_9:
  v23 = [MEMORY[0x1E4F28B00] currentHandler];
  [v23 handleFailureInMethod:a2, self, @"HUUserAccessoryAccessViewController.m", 39, @"Invalid parameter not satisfying: %@", @"accessoryCategoryType" object file lineNumber description];

LABEL_4:
  v13 = [[HUUserAccessoryAccessItemManager alloc] initWithHome:v10 user:v11 accessoryCategoryType:v12];
  v24.receiver = self;
  v24.super_class = (Class)HUUserAccessoryAccessViewController;
  v14 = [(HUItemTableViewController *)&v24 initWithItemManager:v13 tableViewStyle:1];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_home, a3);
    objc_storeStrong((id *)&v15->_user, a4);
    objc_storeStrong((id *)&v15->_accessoryCategoryType, a5);
    objc_storeStrong((id *)&v15->_userAccessoryAccessItemManager, v13);
    uint64_t v16 = objc_opt_new();
    inFlightAllowedAccessoryRemovals = v15->_inFlightAllowedAccessoryRemovals;
    v15->_inFlightAllowedAccessoryRemovals = (NSMutableSet *)v16;

    uint64_t v18 = objc_opt_new();
    inFlightAllowedAccessoryAdditions = v15->_inFlightAllowedAccessoryAdditions;
    v15->_inFlightAllowedAccessoryAdditions = (NSMutableSet *)v18;
  }
  return v15;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)HUUserAccessoryAccessViewController;
  [(HUItemTableViewController *)&v6 viewDidLoad];
  v3 = (void *)MEMORY[0x1E4F2E4F8];
  v4 = [(HUUserAccessoryAccessViewController *)self accessoryCategoryType];
  v5 = objc_msgSend(v3, "hf_userFriendlyLocalizedCapitalizedPluralDescription:", v4);

  [(HUUserAccessoryAccessViewController *)self setTitle:v5];
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v5 = a3;
  objc_super v6 = [(HUUserAccessoryAccessViewController *)self userAccessoryAccessItemManager];
  v7 = [v6 transformedAllowedAccessoryItemProvider];
  v8 = [v7 items];
  int v9 = [v8 containsObject:v5];

  if (v9)
  {
    id v10 = [(HUUserAccessoryAccessViewController *)self home];
    if (objc_msgSend(v10, "hf_currentUserIsAdministrator"))
    {
      id v11 = [(HUUserAccessoryAccessViewController *)self home];
      id v12 = [(HUUserAccessoryAccessViewController *)self user];
      objc_msgSend(v11, "hf_userIsRestrictedGuest:", v12);
    }
    id v13 = (id)objc_opt_class();
  }
  else
  {
    objc_opt_class();
    id v13 = (id)objc_claimAutoreleasedReturnValue();
  }

  return (Class)v13;
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v22.receiver = self;
  v22.super_class = (Class)HUUserAccessoryAccessViewController;
  [(HUItemTableViewController *)&v22 setupCell:v8 forItem:v9 indexPath:a5];
  id v10 = [(HUUserAccessoryAccessViewController *)self userAccessoryAccessItemManager];
  id v11 = [v10 transformedAllowedAccessoryItemProvider];
  id v12 = [v11 items];
  int v13 = [v12 containsObject:v9];

  if (v13)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      id v14 = v8;
      if (objc_opt_isKindOfClass()) {
        v15 = v14;
      }
      else {
        v15 = 0;
      }
      id v16 = v15;

      [v16 setDelegate:self];
      [v16 setIconDisplayStyle:1];
LABEL_12:
      v19 = +[HUIconCellContentMetrics compactMetrics];
      [v16 setContentMetrics:v19];

      v20 = [v9 latestResults];
      v21 = [v20 objectForKeyedSubscript:*MEMORY[0x1E4F68928]];
      [v16 setAccessibilityIdentifier:v21];

      goto LABEL_13;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      id v17 = v8;
      if (objc_opt_isKindOfClass()) {
        uint64_t v18 = v17;
      }
      else {
        uint64_t v18 = 0;
      }
      id v16 = v18;

      [v16 setAccessoryView:0];
      [v16 setAccessoryType:0];
      [v16 setHideIcon:0];
      goto LABEL_12;
    }
  }
LABEL_13:
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  objc_opt_class();
  v7 = [v6 cellForRowAtIndexPath:v5];

  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  return v9 == 0;
}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = [(HUUserAccessoryAccessViewController *)self tableView];
  id v9 = [v8 indexPathForCell:v7];

  id v10 = [(HUItemTableViewController *)self itemManager];
  id v11 = [v10 displayedItemAtIndexPath:v9];

  id v12 = HFLogForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = [v7 text];
    *(_DWORD *)buf = 136315906;
    v46 = "-[HUUserAccessoryAccessViewController switchCell:didTurnOn:]";
    __int16 v47 = 2112;
    v48 = v13;
    __int16 v49 = 1024;
    BOOL v50 = v4;
    __int16 v51 = 2112;
    v52 = v11;
    _os_log_impl(&dword_1BE345000, v12, OS_LOG_TYPE_DEFAULT, "(%s) User tapped switch cell: '%@' | isOn = %{BOOL}d | item = %@", buf, 0x26u);
  }
  objc_opt_class();
  id v14 = v11;
  if (objc_opt_isKindOfClass()) {
    v15 = v14;
  }
  else {
    v15 = 0;
  }
  id v16 = v15;

  objc_opt_class();
  id v17 = [v16 sourceItem];
  if (objc_opt_isKindOfClass()) {
    uint64_t v18 = v17;
  }
  else {
    uint64_t v18 = 0;
  }
  id v33 = v18;

  id v19 = [(HUUserAccessoryAccessViewController *)self home];
  if (!objc_msgSend(v19, "hf_currentUserIsAdministrator")) {
    goto LABEL_12;
  }
  SEL v31 = a2;
  BOOL v20 = v4;
  v21 = [(HUUserAccessoryAccessViewController *)self home];
  objc_super v22 = [(HUUserAccessoryAccessViewController *)self user];
  int v23 = objc_msgSend(v21, "hf_userIsRestrictedGuest:", v22);

  if (v23)
  {
    objc_super v24 = [v33 accessory];
    v25 = [(HUUserAccessoryAccessViewController *)self home];
    v26 = [(HUUserAccessoryAccessViewController *)self user];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __60__HUUserAccessoryAccessViewController_switchCell_didTurnOn___block_invoke;
    aBlock[3] = &unk_1E6389A08;
    BOOL v44 = v20;
    id v38 = v24;
    v39 = self;
    id v40 = v25;
    id v41 = v26;
    SEL v43 = v31;
    id v27 = v7;
    id v42 = v27;
    id v32 = v26;
    id v30 = v25;
    id v19 = v24;
    v28 = _Block_copy(aBlock);
    v29 = (void *)MEMORY[0x1E4F42FF8];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __60__HUUserAccessoryAccessViewController_switchCell_didTurnOn___block_invoke_76;
    v34[3] = &unk_1E6385A70;
    id v35 = v27;
    BOOL v36 = v20;
    objc_msgSend(v29, "hu_presentingLockLimitAlertIfNeededFromViewController:home:user:accessory:include:continueActionBlock:cancelActionBlock:", self, v30, v32, v19, v20, v28, v34);

LABEL_12:
  }
}

void __60__HUUserAccessoryAccessViewController_switchCell_didTurnOn___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(*(id *)(a1 + 32), "hf_servicesWithBulletinBoardNotificationTurnedOff");
  v3 = v2;
  if (*(unsigned char *)(a1 + 80)) {
    BOOL v4 = [v2 count] != 0;
  }
  else {
    BOOL v4 = 0;
  }
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = *(unsigned __int8 *)(a1 + 80);
    *(_DWORD *)buf = 136316162;
    BOOL v20 = "-[HUUserAccessoryAccessViewController switchCell:didTurnOn:]_block_invoke";
    __int16 v21 = 1024;
    BOOL v22 = v4;
    __int16 v23 = 1024;
    int v24 = v6;
    __int16 v25 = 2048;
    uint64_t v26 = [v3 count];
    __int16 v27 = 2112;
    v28 = v3;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "(%s) displayNotificationAlert = %{BOOL}d because isOn = %{BOOL}d and servicesWithNotificationOff = (%ld) %@", buf, 0x2Cu);
  }

  objc_initWeak((id *)buf, *(id *)(a1 + 40));
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__HUUserAccessoryAccessViewController_switchCell_didTurnOn___block_invoke_50;
  aBlock[3] = &unk_1E63899E0;
  objc_copyWeak(v17, (id *)buf);
  id v13 = *(id *)(a1 + 48);
  id v14 = *(id *)(a1 + 56);
  char v18 = *(unsigned char *)(a1 + 80);
  id v7 = *(id *)(a1 + 32);
  id v9 = *(void **)(a1 + 64);
  id v8 = *(void **)(a1 + 72);
  id v15 = v7;
  v17[1] = v8;
  id v16 = v9;
  id v10 = _Block_copy(aBlock);
  id v11 = v10;
  if (v4) {
    objc_msgSend(*(id *)(a1 + 40), "hu_presentNotificationAlertForNotificationCapableObjects:notificationsEnabled:mainActionBlock:notNowActionBlock:", v3, 1, v10, v10);
  }
  else {
    (*((void (**)(void *))v10 + 2))(v10);
  }

  objc_destroyWeak(v17);
  objc_destroyWeak((id *)buf);
}

void __60__HUUserAccessoryAccessViewController_switchCell_didTurnOn___block_invoke_50(uint64_t a1)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  from = (id *)(a1 + 64);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v3 = [*(id *)(a1 + 32) homeAccessControlForUser:*(void *)(a1 + 40)];
  id v4 = objc_alloc(MEMORY[0x1E4F1CA80]);
  id v5 = [v3 restrictedGuestAccessSettings];
  int v6 = [v5 accessAllowedToAccessories];
  id v7 = (void *)[v4 initWithSet:v6];

  if (*(unsigned char *)(a1 + 80)) {
    [WeakRetained inFlightAllowedAccessoryAdditions];
  }
  else {
  id v8 = [WeakRetained inFlightAllowedAccessoryRemovals];
  }
  objc_msgSend(v8, "na_safeAddObject:", *(void *)(a1 + 48));

  id v9 = [WeakRetained inFlightAllowedAccessoryAdditions];
  id v10 = [v7 setByAddingObjectsFromSet:v9];
  id v11 = (void *)[v10 mutableCopy];

  id v12 = [WeakRetained inFlightAllowedAccessoryRemovals];
  id v13 = objc_msgSend(v11, "na_setByRemovingObjectsFromSet:", v12);
  id v14 = (void *)[v13 mutableCopy];

  id v15 = HFLogForCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 72));
    id v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    id v17 = [WeakRetained inFlightAllowedAccessoryAdditions];
    char v18 = [WeakRetained inFlightAllowedAccessoryRemovals];
    *(_DWORD *)buf = 138413058;
    __int16 v47 = (const char *)WeakRetained;
    __int16 v48 = 2112;
    __int16 v49 = v16;
    __int16 v50 = 2112;
    __int16 v51 = v17;
    __int16 v52 = 2112;
    uint64_t v53 = (uint64_t)v18;
    _os_log_impl(&dword_1BE345000, v15, OS_LOG_TYPE_DEFAULT, "%@:%@ In flight additions: %@ | In flight removals: %@", buf, 0x2Au);
  }
  id v19 = [v3 restrictedGuestAccessSettings];
  BOOL v20 = (void *)[v19 mutableCopy];

  [v20 setAccessAllowedToAccessories:v14];
  __int16 v21 = objc_msgSend(v14, "na_map:", &__block_literal_global_82);
  BOOL v22 = HFLogForCategory();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    if (*(unsigned char *)(a1 + 80)) {
      __int16 v23 = @"Including";
    }
    else {
      __int16 v23 = @"Removing";
    }
    int v24 = objc_msgSend(*(id *)(a1 + 48), "hf_minimumDescription");
    uint64_t v25 = [v14 count];
    *(_DWORD *)buf = 136316162;
    __int16 v47 = "-[HUUserAccessoryAccessViewController switchCell:didTurnOn:]_block_invoke_2";
    __int16 v48 = 2112;
    __int16 v49 = v23;
    __int16 v50 = 2112;
    __int16 v51 = v24;
    __int16 v52 = 2048;
    uint64_t v53 = v25;
    __int16 v54 = 2112;
    v55 = v21;
    _os_log_impl(&dword_1BE345000, v22, OS_LOG_TYPE_DEFAULT, "(%s) %@ accessory %@. Updating allowed accessories to (count: %ld) %@", buf, 0x34u);
  }
  uint64_t v26 = (void *)MEMORY[0x1E4F7A0D8];
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __60__HUUserAccessoryAccessViewController_switchCell_didTurnOn___block_invoke_60;
  v43[3] = &unk_1E6385D90;
  id v27 = v3;
  id v44 = v27;
  id v28 = v20;
  id v45 = v28;
  uint64_t v29 = [v26 futureWithBlock:v43];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __60__HUUserAccessoryAccessViewController_switchCell_didTurnOn___block_invoke_63;
  v40[3] = &unk_1E6386150;
  objc_copyWeak(&v42, from);
  id v41 = *(id *)(a1 + 48);
  id v30 = (id)[v29 addCompletionBlock:v40];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __60__HUUserAccessoryAccessViewController_switchCell_didTurnOn___block_invoke_2_65;
  v37[3] = &unk_1E63859F8;
  id v38 = *(id *)(a1 + 32);
  id v39 = *(id *)(a1 + 40);
  id v31 = (id)[v29 addSuccessBlock:v37];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __60__HUUserAccessoryAccessViewController_switchCell_didTurnOn___block_invoke_2_72;
  v34[3] = &unk_1E63899B8;
  id v35 = *(id *)(a1 + 56);
  char v36 = *(unsigned char *)(a1 + 80);
  id v32 = (id)[v29 addFailureBlock:v34];

  objc_destroyWeak(&v42);
}

uint64_t __60__HUUserAccessoryAccessViewController_switchCell_didTurnOn___block_invoke_51(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_minimumDescription");
}

void __60__HUUserAccessoryAccessViewController_switchCell_didTurnOn___block_invoke_60(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__HUUserAccessoryAccessViewController_switchCell_didTurnOn___block_invoke_2;
  v7[3] = &unk_1E6386708;
  id v8 = v3;
  id v6 = v3;
  [v5 updateRestrictedGuestSettings:v4 completionHandler:v7];
}

void __60__HUUserAccessoryAccessViewController_switchCell_didTurnOn___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    id v7 = "-[HUUserAccessoryAccessViewController switchCell:didTurnOn:]_block_invoke_2";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "(%s) Finished attempt to update guest access settings with error %@", (uint8_t *)&v6, 0x16u);
  }

  id v5 = *(void **)(a1 + 32);
  if (v3) {
    [v5 finishWithError:v3];
  }
  else {
    [v5 finishWithNoResult];
  }
}

void __60__HUUserAccessoryAccessViewController_switchCell_didTurnOn___block_invoke_63(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained inFlightAllowedAccessoryAdditions];
  [v2 removeObject:*(void *)(a1 + 32)];

  id v3 = [WeakRetained inFlightAllowedAccessoryRemovals];
  [v3 removeObject:*(void *)(a1 + 32)];
}

void __60__HUUserAccessoryAccessViewController_switchCell_didTurnOn___block_invoke_2_65(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v8 = "-[HUUserAccessoryAccessViewController switchCell:didTurnOn:]_block_invoke_2";
    _os_log_impl(&dword_1BE345000, v2, OS_LOG_TYPE_DEFAULT, "(%s) Successfully updated allowed accessories.", buf, 0xCu);
  }

  id v3 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __60__HUUserAccessoryAccessViewController_switchCell_didTurnOn___block_invoke_67;
  v4[3] = &unk_1E6387408;
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  [v3 dispatchHomeObserverMessage:v4 sender:0];
}

void __60__HUUserAccessoryAccessViewController_switchCell_didTurnOn___block_invoke_67(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 home:*(void *)(a1 + 32) didUpdateAccessControlForUser:*(void *)(a1 + 40)];
  }
}

void __60__HUUserAccessoryAccessViewController_switchCell_didTurnOn___block_invoke_2_72(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[HUUserAccessoryAccessViewController switchCell:didTurnOn:]_block_invoke_2";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_1BE345000, v4, OS_LOG_TYPE_ERROR, "(%s) Failed to update allowed accessories with error: %@.", (uint8_t *)&v6, 0x16u);
  }

  id v5 = [MEMORY[0x1E4F69110] sharedHandler];
  [v5 handleError:v3 operationType:*MEMORY[0x1E4F687E8] options:0 retryBlock:0 cancelBlock:0];

  [*(id *)(a1 + 32) setOn:*(unsigned char *)(a1 + 40) == 0 animated:1];
}

uint64_t __60__HUUserAccessoryAccessViewController_switchCell_didTurnOn___block_invoke_76(uint64_t a1)
{
  return [*(id *)(a1 + 32) setOn:*(unsigned char *)(a1 + 40) == 0];
}

- (HMHome)home
{
  return self->_home;
}

- (HMUser)user
{
  return self->_user;
}

- (NSString)accessoryCategoryType
{
  return self->_accessoryCategoryType;
}

- (HUUserAccessoryAccessItemManager)userAccessoryAccessItemManager
{
  return self->_userAccessoryAccessItemManager;
}

- (NSMutableSet)inFlightAllowedAccessoryRemovals
{
  return self->_inFlightAllowedAccessoryRemovals;
}

- (void)setInFlightAllowedAccessoryRemovals:(id)a3
{
}

- (NSMutableSet)inFlightAllowedAccessoryAdditions
{
  return self->_inFlightAllowedAccessoryAdditions;
}

- (void)setInFlightAllowedAccessoryAdditions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inFlightAllowedAccessoryAdditions, 0);
  objc_storeStrong((id *)&self->_inFlightAllowedAccessoryRemovals, 0);
  objc_storeStrong((id *)&self->_userAccessoryAccessItemManager, 0);
  objc_storeStrong((id *)&self->_accessoryCategoryType, 0);
  objc_storeStrong((id *)&self->_user, 0);

  objc_storeStrong((id *)&self->_home, 0);
}

@end