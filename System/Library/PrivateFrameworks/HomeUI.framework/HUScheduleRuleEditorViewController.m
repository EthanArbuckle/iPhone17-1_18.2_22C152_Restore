@interface HUScheduleRuleEditorViewController
- (BOOL)_validateStartTimeBeforeEndTime:(id)a3 endTime:(id)a4;
- (BOOL)isModalPresentation;
- (HUScheduleRuleEditorViewController)initWithScheduleType:(unint64_t)a3 scheduleRule:(id)a4 scheduleBuilder:(id)a5 delegate:(id)a6;
- (HUScheduleRuleEditorViewControllerDelegate)delegate;
- (NSString)titleString;
- (UIBarButtonItem)savedButtonBarItem;
- (id)_editorItemModule;
- (id)buildItemModuleControllerForModule:(id)a3;
- (void)_presentAlertWithError:(int64_t)a3;
- (void)_saveChanges;
- (void)doneButtonPressed:(id)a3;
- (void)scheduleRuleEditorModuleController:(id)a3 didRequestRuleRemoval:(id)a4;
- (void)setIsModalPresentation:(BOOL)a3;
- (void)setSavedButtonBarItem:(id)a3;
- (void)setTitleString:(id)a3;
- (void)viewDidLoad;
@end

@implementation HUScheduleRuleEditorViewController

- (HUScheduleRuleEditorViewController)initWithScheduleType:(unint64_t)a3 scheduleRule:(id)a4 scheduleBuilder:(id)a5 delegate:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v12)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"HUScheduleRuleEditorViewController.m", 33, @"Invalid parameter not satisfying: %@", @"scheduleBuilder" object file lineNumber description];
  }
  v14 = (void *)[objc_alloc(MEMORY[0x1E4F69590]) initWithDelegate:self];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __97__HUScheduleRuleEditorViewController_initWithScheduleType_scheduleRule_scheduleBuilder_delegate___block_invoke;
  v24[3] = &unk_1E638A200;
  unint64_t v27 = a3;
  id v15 = v11;
  id v25 = v15;
  id v16 = v12;
  id v26 = v16;
  [v14 setItemModuleCreator:v24];
  v23.receiver = self;
  v23.super_class = (Class)HUScheduleRuleEditorViewController;
  v17 = [(HUItemTableViewController *)&v23 initWithItemManager:v14 tableViewStyle:1];
  v18 = v17;
  if (v17) {
    objc_storeWeak((id *)&v17->_delegate, v13);
  }
  [(HUScheduleRuleEditorViewController *)v18 setIsModalPresentation:v15 == 0];
  if (a3 == 2) {
    v19 = @"HUScheduleRuleEditor_Times_Title";
  }
  else {
    v19 = @"HUScheduleRuleEditor_Dates_Title";
  }
  v20 = _HULocalizedStringWithDefaultValue(v19, v19, 1);
  [(HUScheduleRuleEditorViewController *)v18 setTitleString:v20];

  return v18;
}

id __97__HUScheduleRuleEditorViewController_initWithScheduleType_scheduleRule_scheduleBuilder_delegate___block_invoke(void *a1, uint64_t a2, void *a3)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [[HUScheduleRuleEditorItemModule alloc] initWithItemUpdater:v4 scheduleType:a1[6] scheduleRule:a1[4] scheduleBuilder:a1[5]];

  v8[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  return v6;
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)HUScheduleRuleEditorViewController;
  [(HUItemTableViewController *)&v8 viewDidLoad];
  v3 = [(HUScheduleRuleEditorViewController *)self titleString];
  [(HUScheduleRuleEditorViewController *)self setTitle:v3];

  id v4 = _HULocalizedStringWithDefaultValue(@"HUBackTitle", @"HUBackTitle", 1);
  v5 = [(HUScheduleRuleEditorViewController *)self navigationItem];
  [v5 setBackButtonTitle:v4];

  v6 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:0 target:self action:sel_doneButtonPressed_];
  v7 = [(HUScheduleRuleEditorViewController *)self navigationItem];
  [v7 setRightBarButtonItem:v6];
}

- (id)buildItemModuleControllerForModule:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    NSLog(&cfstr_UnexpectedModu.isa, v4);
  }
  v5 = [(HUItemModuleController *)[HUScheduleRuleEditorItemModuleController alloc] initWithModule:v4];
  [(HUScheduleRuleEditorItemModuleController *)v5 setDelegate:self];

  return v5;
}

- (void)doneButtonPressed:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    int v11 = 138412546;
    id v12 = self;
    __int16 v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ Done button pressed", (uint8_t *)&v11, 0x16u);
  }
  [(HUScheduleRuleEditorViewController *)self _saveChanges];
  BOOL v7 = [(HUScheduleRuleEditorViewController *)self isModalPresentation];
  objc_super v8 = [(HUScheduleRuleEditorViewController *)self navigationController];
  v9 = v8;
  if (v7) {
    [v8 dismissViewControllerAnimated:1 completion:0];
  }
  else {
    id v10 = (id)[v8 popViewControllerAnimated:1];
  }
}

- (void)scheduleRuleEditorModuleController:(id)a3 didRequestRuleRemoval:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  BOOL v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v8 = NSStringFromSelector(a2);
    int v24 = 138412802;
    id v25 = self;
    __int16 v26 = 2112;
    unint64_t v27 = v8;
    __int16 v28 = 2112;
    id v29 = v6;
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@ User requested to remove schedule rule [%@]", (uint8_t *)&v24, 0x20u);
  }
  v9 = [(HUScheduleRuleEditorViewController *)self _editorItemModule];
  id v10 = [v9 existingScheduleRule];
  int v11 = HFLogForCategory();
  id v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v13 = NSStringFromSelector(a2);
      int v24 = 138412802;
      id v25 = self;
      __int16 v26 = 2112;
      unint64_t v27 = v13;
      __int16 v28 = 2112;
      id v29 = v10;
      _os_log_impl(&dword_1BE345000, v12, OS_LOG_TYPE_DEFAULT, "%@:%@ Removing schedule rule [%@]", (uint8_t *)&v24, 0x20u);
    }
    id v12 = [v9 scheduleBuilder];
    v14 = (void *)MEMORY[0x1E4F1CA80];
    uint64_t v15 = [v12 rules];
    id v16 = [v14 setWithSet:v15];

    [v16 removeObject:v10];
    [v12 setRules:v16];
    v17 = HFLogForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = NSStringFromSelector(a2);
      v19 = [(HUScheduleRuleEditorViewController *)self delegate];
      int v24 = 138413058;
      id v25 = self;
      __int16 v26 = 2112;
      unint64_t v27 = v18;
      __int16 v28 = 2112;
      id v29 = v19;
      __int16 v30 = 2112;
      v31 = v12;
      _os_log_impl(&dword_1BE345000, v17, OS_LOG_TYPE_DEFAULT, "%@:%@ Notifying delegate [%@] of updated schedule builder [%@]", (uint8_t *)&v24, 0x2Au);
    }
    v20 = [(HUScheduleRuleEditorViewController *)self delegate];
    [v20 didUpdateScheduleBuilder:self scheduleBuilder:v12];

    v21 = [(HUScheduleRuleEditorViewController *)self navigationController];
    id v22 = (id)[v21 popViewControllerAnimated:1];
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    objc_super v23 = NSStringFromSelector(a2);
    int v24 = 138412546;
    id v25 = self;
    __int16 v26 = 2112;
    unint64_t v27 = v23;
    _os_log_error_impl(&dword_1BE345000, v12, OS_LOG_TYPE_ERROR, "%@:%@ Invalid request. Requesting to remove schedule rule with no existing rule.", (uint8_t *)&v24, 0x16u);
  }
}

- (void)_saveChanges
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v4 = [(HUScheduleRuleEditorViewController *)self _editorItemModule];
  v5 = [v4 existingScheduleRule];
  id v6 = [v4 editedScheduleRule];
  if (v6)
  {
    BOOL v7 = v6;
    if ([v6 isWeekDayRule])
    {
      objc_super v8 = [v4 editedStartTime];
      if (v8)
      {
        v9 = [v4 editedStartTime];
      }
      else
      {
        int v11 = [v7 weekDayRule];
        v9 = [v11 startTime];
      }
      id v12 = [v4 editedEndTime];
      if (v12)
      {
        __int16 v13 = [v4 editedEndTime];
      }
      else
      {
        v14 = [v7 weekDayRule];
        __int16 v13 = [v14 endTime];
      }
      if (![(HUScheduleRuleEditorViewController *)self _validateStartTimeBeforeEndTime:v9 endTime:v13])
      {

        id v10 = v7;
LABEL_32:

        goto LABEL_33;
      }
      aSelector = a2;
      id v15 = objc_alloc(MEMORY[0x1E4F2EBD0]);
      id v16 = [v7 weekDayRule];
      v17 = (char *)objc_msgSend(v15, "initWithStartTime:endTime:daysOfTheWeek:", v9, v13, objc_msgSend(v16, "daysOfTheWeek"));

      v18 = HFLogForCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = NSStringFromSelector(aSelector);
        *(_DWORD *)buf = 138412802;
        v48 = self;
        __int16 v49 = 2112;
        v50 = v19;
        __int16 v51 = 2112;
        v52 = v17;
        _os_log_impl(&dword_1BE345000, v18, OS_LOG_TYPE_DEFAULT, "%@:%@ New weekDay schedule rule will be %@", buf, 0x20u);
      }
      id v10 = (void *)[objc_alloc(MEMORY[0x1E4F694B0]) initWithWeekDayRule:v17];
      v20 = HFLogForCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = NSStringFromSelector(aSelector);
        *(_DWORD *)buf = 138413058;
        v48 = self;
        __int16 v49 = 2112;
        v50 = v21;
        __int16 v51 = 2112;
        v52 = (char *)v7;
        __int16 v53 = 2112;
        id v54 = v10;
        _os_log_impl(&dword_1BE345000, v20, OS_LOG_TYPE_DEFAULT, "%@:%@ Updating from schedule rule %@ to %@", buf, 0x2Au);
      }
      a2 = aSelector;
    }
    else
    {
      id v10 = v7;
    }
    id v22 = objc_msgSend(v4, "scheduleBuilder", aSelector);
    objc_super v23 = v22;
    if (v5 && v10)
    {
      int v24 = HFLogForCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        id v25 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138413058;
        v48 = self;
        __int16 v49 = 2112;
        v50 = v25;
        __int16 v51 = 2112;
        v52 = v5;
        __int16 v53 = 2112;
        id v54 = v10;
        _os_log_impl(&dword_1BE345000, v24, OS_LOG_TYPE_DEFAULT, "%@:%@ Replacing existing schedule rule [%@] with edited schedule rule [%@]", buf, 0x2Au);
      }
      __int16 v26 = (void *)MEMORY[0x1E4F1CA80];
      unint64_t v27 = [v23 rules];
      __int16 v28 = [v26 setWithSet:v27];

      [v28 removeObject:v5];
      [v28 addObject:v10];
      [v23 setRules:v28];
    }
    else
    {
      id v29 = [v22 rules];
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __50__HUScheduleRuleEditorViewController__saveChanges__block_invoke;
      v45[3] = &unk_1E638A228;
      id v30 = v10;
      id v46 = v30;
      objc_msgSend(v29, "na_firstObjectPassingTest:", v45);
      v31 = (char *)objc_claimAutoreleasedReturnValue();

      uint64_t v32 = HFLogForCategory();
      BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
      if (v31)
      {
        if (v33)
        {
          v34 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138413058;
          v48 = self;
          __int16 v49 = 2112;
          v50 = v34;
          __int16 v51 = 2112;
          v52 = v31;
          __int16 v53 = 2112;
          id v54 = v30;
          _os_log_impl(&dword_1BE345000, v32, OS_LOG_TYPE_DEFAULT, "%@:%@ Contains duplicate schedule rule [%@] that matches edited schedule rule [%@]", buf, 0x2Au);
        }
      }
      else
      {
        SEL aSelectora = v5;
        if (v33)
        {
          v35 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412802;
          v48 = self;
          __int16 v49 = 2112;
          v50 = v35;
          __int16 v51 = 2112;
          v52 = (char *)v30;
          _os_log_impl(&dword_1BE345000, v32, OS_LOG_TYPE_DEFAULT, "%@:%@ Adding schedule rule [%@]", buf, 0x20u);
        }
        v36 = (void *)MEMORY[0x1E4F1CA80];
        [v23 rules];
        v38 = v37 = a2;
        uint64_t v32 = [v36 setWithSet:v38];

        a2 = v37;
        [v32 addObject:v30];
        [v23 setRules:v32];
        v5 = (char *)aSelectora;
      }

      __int16 v28 = v46;
    }

    v39 = HFLogForCategory();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      v40 = NSStringFromSelector(a2);
      v41 = [(HUScheduleRuleEditorViewController *)self delegate];
      *(_DWORD *)buf = 138413058;
      v48 = self;
      __int16 v49 = 2112;
      v50 = v40;
      __int16 v51 = 2112;
      v52 = v41;
      __int16 v53 = 2112;
      id v54 = v23;
      _os_log_impl(&dword_1BE345000, v39, OS_LOG_TYPE_DEFAULT, "%@:%@ Notifying delegate [%@] of updated schedule builder [%@]", buf, 0x2Au);
    }
    v42 = [(HUScheduleRuleEditorViewController *)self delegate];
    [v42 didUpdateScheduleBuilder:self scheduleBuilder:v23];

    goto LABEL_32;
  }
LABEL_33:
}

uint64_t __50__HUScheduleRuleEditorViewController__saveChanges__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEqual:*(void *)(a1 + 32)];
}

- (BOOL)_validateStartTimeBeforeEndTime:(id)a3 endTime:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = objc_msgSend(MEMORY[0x1E4F1C9C8], "hf_sharedCalendar");
  id v10 = [v9 dateFromComponents:v7];
  int v11 = [v9 dateFromComponents:v8];
  unint64_t v12 = [v10 compare:v11];

  if ((v12 & 0x8000000000000000) == 0)
  {
    __int16 v13 = HFLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v15 = NSStringFromSelector(a2);
      int v17 = 138413058;
      v18 = self;
      __int16 v19 = 2112;
      v20 = v15;
      __int16 v21 = 2112;
      id v22 = v7;
      __int16 v23 = 2112;
      id v24 = v8;
      _os_log_error_impl(&dword_1BE345000, v13, OS_LOG_TYPE_ERROR, "%@:%@ Invalid schedule rule. Start time [%@] is not before end time [%@].", (uint8_t *)&v17, 0x2Au);
    }
    [(HUScheduleRuleEditorViewController *)self _presentAlertWithError:102];
  }

  return v12 >> 63;
}

- (void)_presentAlertWithError:(int64_t)a3
{
  id v5 = [MEMORY[0x1E4F69110] sharedHandler];
  id v4 = objc_msgSend(MEMORY[0x1E4F28C58], "hf_errorWithCode:", a3);
  [v5 handleError:v4 operationType:*MEMORY[0x1E4F687D8] options:0 retryBlock:0 cancelBlock:0];
}

- (id)_editorItemModule
{
  v2 = [(HUItemTableViewController *)self itemManager];
  v3 = [v2 itemModules];
  id v4 = objc_msgSend(v3, "na_firstObjectPassingTest:", &__block_literal_global_98);

  return v4;
}

uint64_t __55__HUScheduleRuleEditorViewController__editorItemModule__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (HUScheduleRuleEditorViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUScheduleRuleEditorViewControllerDelegate *)WeakRetained;
}

- (UIBarButtonItem)savedButtonBarItem
{
  return self->_savedButtonBarItem;
}

- (void)setSavedButtonBarItem:(id)a3
{
}

- (BOOL)isModalPresentation
{
  return self->_isModalPresentation;
}

- (void)setIsModalPresentation:(BOOL)a3
{
  self->_isModalPresentation = a3;
}

- (NSString)titleString
{
  return self->_titleString;
}

- (void)setTitleString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleString, 0);
  objc_storeStrong((id *)&self->_savedButtonBarItem, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end