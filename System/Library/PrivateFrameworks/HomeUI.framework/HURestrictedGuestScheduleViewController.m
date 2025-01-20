@interface HURestrictedGuestScheduleViewController
- (BOOL)didDisplayLimitedLockAlert;
- (HFSchedule)inviteUserSchedule;
- (HMHome)home;
- (HMUser)user;
- (HURestrictedGuestScheduleItemManager)scheduleItemManager;
- (HURestrictedGuestScheduleViewController)initWithHome:(id)a3 user:(id)a4;
- (HURestrictedGuestScheduleViewController)initWithSchedule:(id)a3 delegate:(id)a4;
- (HURestrictedGuestScheduleViewControllerDelegate)delegate;
- (UIBarButtonItem)savedButtonBarItem;
- (id)_editorItemModule;
- (id)_originalScheduleBuilder;
- (id)buildItemModuleControllerForModule:(id)a3;
- (void)doneButtonPressed:(id)a3;
- (void)scheduleEditorModule:(id)a3 didUpdateScheduleBuilder:(id)a4;
- (void)setDidDisplayLimitedLockAlert:(BOOL)a3;
- (void)setSavedButtonBarItem:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation HURestrictedGuestScheduleViewController

- (HURestrictedGuestScheduleViewController)initWithHome:(id)a3 user:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"HURestrictedGuestScheduleViewController.m", 41, @"Invalid parameter not satisfying: %@", @"home" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"HURestrictedGuestScheduleViewController.m", 42, @"Invalid parameter not satisfying: %@", @"user" object file lineNumber description];

LABEL_3:
  if ((objc_msgSend(v8, "hf_userIsRestrictedGuest:", v10) & 1) == 0)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"HURestrictedGuestScheduleViewController.m", 43, @"Invalid parameter not satisfying: %@", @"[home hf_userIsRestrictedGuest:user]" object file lineNumber description];
  }
  v11 = [[HURestrictedGuestScheduleItemManager alloc] initWithHome:v8 user:v10 delegate:self];
  v19.receiver = self;
  v19.super_class = (Class)HURestrictedGuestScheduleViewController;
  v12 = [(HUItemTableViewController *)&v19 initWithItemManager:v11 tableViewStyle:1];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_home, a3);
    objc_storeStrong((id *)&v13->_user, a4);
    objc_storeStrong((id *)&v13->_scheduleItemManager, v11);
    if ([(HURestrictedGuestScheduleItemManager *)v11 scheduleContext])
    {
      v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:a2, v13, @"HURestrictedGuestScheduleViewController.m", 51, @"Invalid parameter not satisfying: %@", @"itemManager.scheduleContext == HUScheduleContextExistingUser" object file lineNumber description];
    }
  }

  return v13;
}

- (HURestrictedGuestScheduleViewController)initWithSchedule:(id)a3 delegate:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (!v8)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"HURestrictedGuestScheduleViewController.m", 59, @"Invalid parameter not satisfying: %@", @"schedule" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
LABEL_8:
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"HURestrictedGuestScheduleViewController.m", 60, @"Invalid parameter not satisfying: %@", @"delegate" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v9) {
    goto LABEL_8;
  }
LABEL_3:
  v11 = [[HURestrictedGuestScheduleItemManager alloc] initWithSchedule:v8 delegate:self];
  v18.receiver = self;
  v18.super_class = (Class)HURestrictedGuestScheduleViewController;
  v12 = [(HUItemTableViewController *)&v18 initWithItemManager:v11 tableViewStyle:1];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_inviteUserSchedule, a3);
    objc_storeWeak((id *)&v13->_delegate, v10);
    objc_storeStrong((id *)&v13->_scheduleItemManager, v11);
    if ([(HURestrictedGuestScheduleItemManager *)v11 scheduleContext] != 1)
    {
      v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:a2, v13, @"HURestrictedGuestScheduleViewController.m", 68, @"Invalid parameter not satisfying: %@", @"itemManager.scheduleContext == HUScheduleContextNewUser" object file lineNumber description];
    }
  }

  return v13;
}

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)HURestrictedGuestScheduleViewController;
  [(HUItemTableViewController *)&v12 viewDidLoad];
  v3 = [(HURestrictedGuestScheduleViewController *)self home];
  if (objc_msgSend(v3, "hf_currentUserIsRestrictedGuest")) {
    v4 = @"HURestrictedGuestScheduleItem_GuestView_Title";
  }
  else {
    v4 = @"HURestrictedGuestScheduleItem_AdminView_Title";
  }
  v5 = _HULocalizedStringWithDefaultValue(v4, v4, 1);

  [(HURestrictedGuestScheduleViewController *)self setTitle:v5];
  v6 = _HULocalizedStringWithDefaultValue(@"HUBackTitle", @"HUBackTitle", 1);
  v7 = [(HURestrictedGuestScheduleViewController *)self navigationItem];
  [v7 setBackButtonTitle:v6];

  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:0 target:self action:sel_doneButtonPressed_];
  id v9 = [(HURestrictedGuestScheduleViewController *)self navigationItem];
  [v9 setRightBarButtonItem:v8];

  v10 = [(HURestrictedGuestScheduleViewController *)self navigationItem];
  v11 = [v10 rightBarButtonItem];
  [v11 setAccessibilityIdentifier:@"Home.Users.Guest.Schedule.Done"];
}

- (id)buildItemModuleControllerForModule:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    NSLog(&cfstr_UnexpectedModu.isa, v4);
  }
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  [v7 setDelegate:self];
  id v8 = [(HUItemModuleController *)[HUScheduleEditorItemModuleController alloc] initWithModule:v5];

  return v8;
}

- (void)doneButtonPressed:(id)a3
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v46 = a3;
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v59 = self;
    __int16 v60 = 2112;
    v61 = v6;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ Done button pressed", buf, 0x16u);
  }
  id v7 = [(HURestrictedGuestScheduleViewController *)self _editorItemModule];
  id v8 = [(HUItemTableViewController *)self itemModuleControllers];
  id v9 = objc_msgSend(v8, "na_firstObjectPassingTest:", &__block_literal_global_71);

  if ([v9 saveCustomScheduleStartAndEndTimes])
  {
    v10 = [v7 updatedScheduleBuilder];
    v11 = [v7 originalScheduleBuilder];
    int v12 = [v10 isEqual:v11];

    if (v12)
    {
      v13 = HFLogForCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = NSStringFromSelector(a2);
        v15 = [v7 originalScheduleBuilder];
        *(_DWORD *)buf = 138413058;
        v59 = self;
        __int16 v60 = 2112;
        v61 = v14;
        __int16 v62 = 2112;
        v63 = v10;
        __int16 v64 = 2112;
        v65 = v15;
        _os_log_impl(&dword_1BE345000, v13, OS_LOG_TYPE_DEFAULT, "%@:%@ Exiting without applying changes...New guest access schedule builder [%@] did not change from original schedule builder [%@].", buf, 0x2Au);
      }
      v16 = [(HURestrictedGuestScheduleViewController *)self navigationController];
      [v16 dismissViewControllerAnimated:1 completion:0];
    }
    else
    {
      v17 = [(HURestrictedGuestScheduleViewController *)self scheduleItemManager];
      BOOL v18 = [v17 scheduleContext] == 0;

      if (v18)
      {
        v26 = [(HURestrictedGuestScheduleViewController *)self home];
        v27 = [(HURestrictedGuestScheduleViewController *)self user];
        v16 = [v26 homeAccessControlForUser:v27];

        v42 = [v16 restrictedGuestAccessSettings];
        v44 = [v42 guestAccessSchedule];
        v43 = [v10 build];
        v45 = objc_msgSend(MEMORY[0x1E4F2EA70], "hf_restrictedGuestHomeAccessScheduleFromHFSchedule:", v43);
        v28 = HFLogForCategory();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          v29 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138413058;
          v59 = self;
          __int16 v60 = 2112;
          v61 = v29;
          __int16 v62 = 2112;
          v63 = v45;
          __int16 v64 = 2112;
          v65 = v43;
          _os_log_impl(&dword_1BE345000, v28, OS_LOG_TYPE_DEFAULT, "%@:%@ Constructed new guest access schedule [%@] from schedule [%@].", buf, 0x2Au);
        }
        if ([v44 isEqual:v45])
        {
          v30 = HFLogForCategory();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            v31 = NSStringFromSelector(a2);
            *(_DWORD *)buf = 138413058;
            v59 = self;
            __int16 v60 = 2112;
            v61 = v31;
            __int16 v62 = 2112;
            v63 = v45;
            __int16 v64 = 2112;
            v65 = v44;
            _os_log_impl(&dword_1BE345000, v30, OS_LOG_TYPE_DEFAULT, "%@:%@ Exiting without applying changes...New guest access schedule [%@] is the same as the current access schedule [%@].", buf, 0x2Au);
          }
          v32 = [(HURestrictedGuestScheduleViewController *)self navigationController];
          [v32 dismissViewControllerAnimated:1 completion:0];
        }
        else
        {
          v33 = [(HURestrictedGuestScheduleViewController *)self navigationItem];
          v34 = [v33 rightBarButtonItem];
          [(HURestrictedGuestScheduleViewController *)self setSavedButtonBarItem:v34];

          v32 = (void *)[objc_alloc(MEMORY[0x1E4F42708]) initWithActivityIndicatorStyle:100];
          v35 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithCustomView:v32];
          v36 = [(HURestrictedGuestScheduleViewController *)self navigationItem];
          [v36 setRightBarButtonItem:v35];

          [v32 startAnimating];
          objc_initWeak((id *)buf, self);
          v37 = (void *)MEMORY[0x1E4F7A0D8];
          v53[0] = MEMORY[0x1E4F143A8];
          v53[1] = 3221225472;
          v53[2] = __61__HURestrictedGuestScheduleViewController_doneButtonPressed___block_invoke_76;
          v53[3] = &unk_1E63891F0;
          objc_copyWeak(v57, (id *)buf);
          v57[1] = (id)a2;
          id v54 = v44;
          id v55 = v45;
          id v56 = v16;
          v38 = [v37 futureWithBlock:v53];
          v51[0] = MEMORY[0x1E4F143A8];
          v51[1] = 3221225472;
          v51[2] = __61__HURestrictedGuestScheduleViewController_doneButtonPressed___block_invoke_2;
          v51[3] = &unk_1E6386FB8;
          objc_copyWeak(&v52, (id *)buf);
          id v39 = (id)[v38 addFailureBlock:v51];
          v49[0] = MEMORY[0x1E4F143A8];
          v49[1] = 3221225472;
          v49[2] = __61__HURestrictedGuestScheduleViewController_doneButtonPressed___block_invoke_2_88;
          v49[3] = &unk_1E63867B0;
          objc_copyWeak(&v50, (id *)buf);
          id v40 = (id)[v38 addCompletionBlock:v49];
          v47[0] = MEMORY[0x1E4F143A8];
          v47[1] = 3221225472;
          v47[2] = __61__HURestrictedGuestScheduleViewController_doneButtonPressed___block_invoke_3;
          v47[3] = &unk_1E63874A0;
          objc_copyWeak(&v48, (id *)buf);
          id v41 = (id)[v38 addSuccessBlock:v47];
          objc_destroyWeak(&v48);
          objc_destroyWeak(&v50);
          objc_destroyWeak(&v52);

          objc_destroyWeak(v57);
          objc_destroyWeak((id *)buf);
        }
      }
      else
      {
        objc_super v19 = [(HURestrictedGuestScheduleViewController *)self scheduleItemManager];
        BOOL v20 = [v19 scheduleContext] == 1;

        if (!v20)
        {
LABEL_22:

          goto LABEL_23;
        }
        v16 = [v10 build];
        v21 = HFLogForCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v22 = NSStringFromSelector(a2);
          v23 = [(HURestrictedGuestScheduleViewController *)self delegate];
          *(_DWORD *)buf = 138413314;
          v59 = self;
          __int16 v60 = 2112;
          v61 = v22;
          __int16 v62 = 2112;
          v63 = v23;
          __int16 v64 = 2112;
          v65 = v16;
          __int16 v66 = 2112;
          v67 = v10;
          _os_log_impl(&dword_1BE345000, v21, OS_LOG_TYPE_DEFAULT, "%@:%@ Notifying delegate [%@] of updated schedule [%@] from schedule builder [%@].", buf, 0x34u);
        }
        v24 = [(HURestrictedGuestScheduleViewController *)self delegate];
        [v24 didUpdateInviteUserSchedule:self schedule:v16];

        v25 = [(HURestrictedGuestScheduleViewController *)self navigationController];
        [v25 dismissViewControllerAnimated:1 completion:0];
      }
    }

    goto LABEL_22;
  }
LABEL_23:
}

uint64_t __61__HURestrictedGuestScheduleViewController_doneButtonPressed___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __61__HURestrictedGuestScheduleViewController_doneButtonPressed___block_invoke_76(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = NSStringFromSelector(*(SEL *)(a1 + 64));
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    v10 = [WeakRetained user];
    v11 = [WeakRetained home];
    *(_DWORD *)buf = 138413570;
    id v20 = WeakRetained;
    __int16 v21 = 2112;
    v22 = v7;
    __int16 v23 = 2112;
    uint64_t v24 = v9;
    __int16 v25 = 2112;
    uint64_t v26 = v8;
    __int16 v27 = 2112;
    v28 = v10;
    __int16 v29 = 2112;
    v30 = v11;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ Preparing to update (current) guest access schedule [%@] to (new) restricted guest home access schedule [%@] for user [%@] in home [%@].", buf, 0x3Eu);
  }
  uint64_t v13 = *(void *)(a1 + 40);
  int v12 = *(void **)(a1 + 48);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __61__HURestrictedGuestScheduleViewController_doneButtonPressed___block_invoke_77;
  v16[3] = &unk_1E63891C8;
  v14 = *(void **)(a1 + 64);
  v16[4] = WeakRetained;
  v18[1] = v14;
  id v15 = v3;
  id v17 = v15;
  objc_copyWeak(v18, v4);
  [v12 updateRestrictedGuestSchedule:v13 completionHandler:v16];
  objc_destroyWeak(v18);
}

void __61__HURestrictedGuestScheduleViewController_doneButtonPressed___block_invoke_77(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = HFLogForCategory();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      v10 = NSStringFromSelector(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 138412802;
      uint64_t v14 = v9;
      __int16 v15 = 2112;
      v16 = v10;
      __int16 v17 = 2112;
      id v18 = v3;
      _os_log_error_impl(&dword_1BE345000, v5, OS_LOG_TYPE_ERROR, "%@:%@ Failed to update guest access schedule for user with error: %@", buf, 0x20u);
    }
    [*(id *)(a1 + 40) finishWithError:v3];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      id v7 = NSStringFromSelector(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 138412546;
      uint64_t v14 = v6;
      __int16 v15 = 2112;
      v16 = v7;
      _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ Successfully updated guest access schedule for user.", buf, 0x16u);
    }
    uint64_t v8 = [MEMORY[0x1E4F691A0] sharedDispatcher];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __61__HURestrictedGuestScheduleViewController_doneButtonPressed___block_invoke_79;
    v11[3] = &unk_1E6386788;
    objc_copyWeak(&v12, (id *)(a1 + 48));
    [v8 dispatchHomeObserverMessage:v11 sender:0];

    [*(id *)(a1 + 40) finishWithNoResult];
    objc_destroyWeak(&v12);
  }
}

void __61__HURestrictedGuestScheduleViewController_doneButtonPressed___block_invoke_79(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_opt_respondsToSelector())
  {
    id v4 = [WeakRetained home];
    id v5 = [WeakRetained user];
    [v6 home:v4 didUpdateAccessControlForUser:v5];
  }
}

void __61__HURestrictedGuestScheduleViewController_doneButtonPressed___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v9 = "-[HURestrictedGuestScheduleViewController doneButtonPressed:]_block_invoke_2";
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_error_impl(&dword_1BE345000, v4, OS_LOG_TYPE_ERROR, "(%s) Will show error alert for failed attempt to update restricted guest access schedule with error: %@", buf, 0x16u);
  }

  id v5 = [MEMORY[0x1E4F69110] sharedHandler];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__HURestrictedGuestScheduleViewController_doneButtonPressed___block_invoke_86;
  v6[3] = &unk_1E63862A0;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  [v5 handleError:v3 retryBlock:v6 cancelBlock:0];

  objc_destroyWeak(&v7);
}

void __61__HURestrictedGuestScheduleViewController_doneButtonPressed___block_invoke_86(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained doneButtonPressed:0];
}

void __61__HURestrictedGuestScheduleViewController_doneButtonPressed___block_invoke_2_88(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained savedButtonBarItem];
  id v2 = [WeakRetained navigationItem];
  [v2 setRightBarButtonItem:v1];

  [WeakRetained setSavedButtonBarItem:0];
}

void __61__HURestrictedGuestScheduleViewController_doneButtonPressed___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained navigationController];
  [v1 dismissViewControllerAnimated:1 completion:0];
}

- (void)scheduleEditorModule:(id)a3 didUpdateScheduleBuilder:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [v6 build];
  uint64_t v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = NSStringFromSelector(a2);
    int v12 = 138413058;
    uint64_t v13 = self;
    __int16 v14 = 2112;
    __int16 v15 = v9;
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 2112;
    uint64_t v19 = v7;
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "%@:%@ Updated schedule builder [%@] results in schedule [%@].", (uint8_t *)&v12, 0x2Au);
  }
  __int16 v10 = [(HURestrictedGuestScheduleViewController *)self navigationItem];
  id v11 = [v10 rightBarButtonItem];
  [v11 setEnabled:v7 != 0];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v56.receiver = self;
  v56.super_class = (Class)HURestrictedGuestScheduleViewController;
  v49 = v6;
  [(HUItemTableViewController *)&v56 tableView:v6 didSelectRowAtIndexPath:v7];
  uint64_t v8 = [(HURestrictedGuestScheduleViewController *)self scheduleItemManager];
  LODWORD(v6) = [v8 scheduleContext] == 0;

  if (v6)
  {
    uint64_t v9 = [(HUItemTableViewController *)self itemManager];
    __int16 v10 = [v9 displayedItemAtIndexPath:v7];

    objc_opt_class();
    id v43 = v10;
    if (objc_opt_isKindOfClass()) {
      id v11 = v43;
    }
    else {
      id v11 = 0;
    }
    id v47 = v11;

    uint64_t v12 = [v47 type];
    id v46 = objc_msgSend(MEMORY[0x1E4F694A8], "scheduleBuilderFromType:withDefaultRules:", objc_msgSend(v47, "type"), 1);
    uint64_t v13 = [(HURestrictedGuestScheduleViewController *)self home];
    __int16 v14 = [(HURestrictedGuestScheduleViewController *)self user];
    __int16 v15 = [v13 homeAccessControlForUser:v14];
    __int16 v16 = [v15 restrictedGuestAccessSettings];
    id v48 = (void *)[v16 mutableCopy];

    id v17 = (void *)MEMORY[0x1E4F2EA70];
    __int16 v18 = [v46 build];
    v42 = objc_msgSend(v17, "hf_restrictedGuestHomeAccessScheduleFromHFSchedule:", v18);

    [v48 setGuestAccessSchedule:v42];
    v44 = [v48 locksWithReducedFunctionalityDueToSchedule];
    id v41 = [(HURestrictedGuestScheduleViewController *)self _editorItemModule];
    v45 = [v41 originalScheduleBuilder];
    uint64_t v19 = [v45 rules];
    BOOL v20 = 0;
    if (![v19 count] && v12) {
      BOOL v20 = ![(HURestrictedGuestScheduleViewController *)self didDisplayLimitedLockAlert]
    }
         && [v44 count] != 0;

    __int16 v21 = HFLogForCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v22 = [(HURestrictedGuestScheduleViewController *)self didDisplayLimitedLockAlert];
      __int16 v23 = (void *)MEMORY[0x1E4F2E4F8];
      uint64_t v24 = [v44 allObjects];
      __int16 v25 = objc_msgSend(v23, "hf_minimumDescriptionsOfAccessories:", v24);
      uint64_t v26 = (void *)MEMORY[0x1E4F2E4F8];
      __int16 v27 = [v48 accessAllowedToAccessories];
      v28 = [v27 allObjects];
      __int16 v29 = objc_msgSend(v26, "hf_minimumDescriptionsOfAccessories:", v28);
      *(_DWORD *)buf = 136316674;
      v58 = "-[HURestrictedGuestScheduleViewController tableView:didSelectRowAtIndexPath:]";
      __int16 v59 = 1024;
      BOOL v60 = v20;
      __int16 v61 = 2112;
      __int16 v62 = v45;
      __int16 v63 = 2112;
      __int16 v64 = v46;
      __int16 v65 = 1024;
      BOOL v66 = v22;
      __int16 v67 = 2112;
      uint64_t v68 = v25;
      __int16 v69 = 2112;
      v70 = v29;
      _os_log_impl(&dword_1BE345000, v21, OS_LOG_TYPE_DEFAULT, "(%s) shouldDisplayLimitedLockAlert = %{BOOL}d | originalSchedule = %@ | newSchedule = %@ | didDisplayLimitedLockAlert = %{BOOL}d | limitedLockAccessories = %@ | allowedAccessories = %@", buf, 0x40u);
    }
    if (v20)
    {
      objc_initWeak((id *)buf, self);
      if ([v44 count] == 1) {
        v30 = @"%@_SingleLock";
      }
      else {
        v30 = @"%@_PluralLocks";
      }
      uint64_t v31 = objc_msgSend(NSString, "stringWithFormat:", v30, @"HURestrictedGuest_LocksWithReducedFunctionalityDueToSchedule_Alert_SingleGuest");
      v32 = (void *)MEMORY[0x1E4F42728];
      v33 = _HULocalizedStringWithDefaultValue(v31, v31, 1);
      v34 = [v32 alertControllerWithTitle:&stru_1F18F92B8 message:v33 preferredStyle:0];

      v35 = (void *)MEMORY[0x1E4F42720];
      v36 = _HULocalizedStringWithDefaultValue(@"HUContinueTitle", @"HUContinueTitle", 1);
      v37 = [v35 actionWithTitle:v36 style:0 handler:&__block_literal_global_116_0];

      [v37 setAccessibilityIdentifier:@"Home.Guest.ReducedFunctionality.Alert.ContinueButton"];
      [v34 addAction:v37];
      v38 = (void *)MEMORY[0x1E4F42720];
      id v39 = _HULocalizedStringWithDefaultValue(@"HUCancelTitle", @"HUCancelTitle", 1);
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __77__HURestrictedGuestScheduleViewController_tableView_didSelectRowAtIndexPath___block_invoke_123;
      v52[3] = &unk_1E6389218;
      objc_copyWeak(&v55, (id *)buf);
      id v53 = v49;
      id v54 = self;
      id v40 = [v38 actionWithTitle:v39 style:0 handler:v52];

      [v40 setAccessibilityIdentifier:@"Home.Guest.ReducedFunctionality.Alert.CancelButton"];
      [v34 addAction:v40];
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __77__HURestrictedGuestScheduleViewController_tableView_didSelectRowAtIndexPath___block_invoke_131;
      v50[3] = &unk_1E63862A0;
      objc_copyWeak(&v51, (id *)buf);
      [(HURestrictedGuestScheduleViewController *)self presentViewController:v34 animated:1 completion:v50];
      objc_destroyWeak(&v51);

      objc_destroyWeak(&v55);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __77__HURestrictedGuestScheduleViewController_tableView_didSelectRowAtIndexPath___block_invoke()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0 = HFLogForCategory();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136315138;
    id v2 = "-[HURestrictedGuestScheduleViewController tableView:didSelectRowAtIndexPath:]_block_invoke";
    _os_log_impl(&dword_1BE345000, v0, OS_LOG_TYPE_DEFAULT, "(%s) User selected 'Continue' button about the limit for wallet key and pin code. Proceeding with schedule change.", (uint8_t *)&v1, 0xCu);
  }
}

void __77__HURestrictedGuestScheduleViewController_tableView_didSelectRowAtIndexPath___block_invoke_123(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v17 = "-[HURestrictedGuestScheduleViewController tableView:didSelectRowAtIndexPath:]_block_invoke";
    _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "(%s) User selected 'cancel' button about the limit for wallet key/pin code. Going back to 'Anytime' schedule option.", buf, 0xCu);
  }

  objc_opt_class();
  id v4 = [WeakRetained itemManager];
  id v5 = [v4 allDisplayedItems];
  id v6 = objc_msgSend(v5, "na_firstObjectPassingTest:", &__block_literal_global_127);
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  uint64_t v9 = [WeakRetained itemManager];
  __int16 v10 = [v9 indexPathForItem:v8];

  if (v10)
  {
    uint64_t v11 = *(void *)(a1 + 32);
    v15.receiver = *(id *)(a1 + 40);
    v15.super_class = (Class)HURestrictedGuestScheduleViewController;
    objc_msgSendSuper2(&v15, sel_tableView_didSelectRowAtIndexPath_, v11, v10);
  }
  else
  {
    uint64_t v12 = HFLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = [WeakRetained itemManager];
      __int16 v14 = [v13 allDisplayedItems];
      *(_DWORD *)buf = 136315394;
      id v17 = "-[HURestrictedGuestScheduleViewController tableView:didSelectRowAtIndexPath:]_block_invoke_2";
      __int16 v18 = 2112;
      uint64_t v19 = v14;
      _os_log_error_impl(&dword_1BE345000, v12, OS_LOG_TYPE_ERROR, "(%s) Failed to find indexpath for always allowed among %@", buf, 0x16u);
    }
  }
}

BOOL __77__HURestrictedGuestScheduleViewController_tableView_didSelectRowAtIndexPath___block_invoke_124(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if (v5) {
    BOOL v6 = [v5 type] == 0;
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

void __77__HURestrictedGuestScheduleViewController_tableView_didSelectRowAtIndexPath___block_invoke_131(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    id v4 = "-[HURestrictedGuestScheduleViewController tableView:didSelectRowAtIndexPath:]_block_invoke";
    _os_log_impl(&dword_1BE345000, v2, OS_LOG_TYPE_DEFAULT, "(%s) Displayed alert about wallet key and pin code limits when updating schedule for restricted guest", (uint8_t *)&v3, 0xCu);
  }

  [WeakRetained setDidDisplayLimitedLockAlert:1];
}

- (id)_originalScheduleBuilder
{
  id v2 = [(HURestrictedGuestScheduleViewController *)self _editorItemModule];
  int v3 = [v2 originalScheduleBuilder];

  return v3;
}

- (id)_editorItemModule
{
  id v2 = [(HUItemTableViewController *)self itemManager];
  int v3 = [v2 itemModules];
  id v4 = objc_msgSend(v3, "na_firstObjectPassingTest:", &__block_literal_global_134);

  return v4;
}

uint64_t __60__HURestrictedGuestScheduleViewController__editorItemModule__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (HURestrictedGuestScheduleViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HURestrictedGuestScheduleViewControllerDelegate *)WeakRetained;
}

- (HMHome)home
{
  return self->_home;
}

- (HMUser)user
{
  return self->_user;
}

- (HFSchedule)inviteUserSchedule
{
  return self->_inviteUserSchedule;
}

- (HURestrictedGuestScheduleItemManager)scheduleItemManager
{
  return self->_scheduleItemManager;
}

- (UIBarButtonItem)savedButtonBarItem
{
  return self->_savedButtonBarItem;
}

- (void)setSavedButtonBarItem:(id)a3
{
}

- (BOOL)didDisplayLimitedLockAlert
{
  return self->_didDisplayLimitedLockAlert;
}

- (void)setDidDisplayLimitedLockAlert:(BOOL)a3
{
  self->_didDisplayLimitedLockAlert = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savedButtonBarItem, 0);
  objc_storeStrong((id *)&self->_scheduleItemManager, 0);
  objc_storeStrong((id *)&self->_inviteUserSchedule, 0);
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_home, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end