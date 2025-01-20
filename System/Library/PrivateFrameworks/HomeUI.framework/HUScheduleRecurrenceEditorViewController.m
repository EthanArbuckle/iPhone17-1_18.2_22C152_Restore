@interface HUScheduleRecurrenceEditorViewController
- (HUScheduleRecurrenceEditorViewController)initWithRecurrences:(id)a3 delegate:(id)a4;
- (HUScheduleRecurrenceEditorViewControllerDelegate)delegate;
- (UIBarButtonItem)savedButtonBarItem;
- (id)_editorItemModule;
- (id)buildItemModuleControllerForModule:(id)a3;
- (void)_saveChanges;
- (void)doneButtonPressed:(id)a3;
- (void)setSavedButtonBarItem:(id)a3;
- (void)viewDidLoad;
@end

@implementation HUScheduleRecurrenceEditorViewController

- (HUScheduleRecurrenceEditorViewController)initWithRecurrences:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"HUScheduleRecurrenceEditorViewController.m", 27, @"Invalid parameter not satisfying: %@", @"recurrences" object file lineNumber description];
  }
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F69590]) initWithDelegate:self];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __73__HUScheduleRecurrenceEditorViewController_initWithRecurrences_delegate___block_invoke;
  v16[3] = &unk_1E6387A08;
  id v10 = v7;
  id v17 = v10;
  [v9 setItemModuleCreator:v16];
  v15.receiver = self;
  v15.super_class = (Class)HUScheduleRecurrenceEditorViewController;
  v11 = [(HUItemTableViewController *)&v15 initWithItemManager:v9 tableViewStyle:1];
  v12 = v11;
  if (v11) {
    objc_storeWeak((id *)&v11->_delegate, v8);
  }

  return v12;
}

id __73__HUScheduleRecurrenceEditorViewController_initWithRecurrences_delegate___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [[HUScheduleRecurrenceEditorItemModule alloc] initWithItemUpdater:v4 recurrences:*(void *)(a1 + 32)];

  v8[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  return v6;
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)HUScheduleRecurrenceEditorViewController;
  [(HUItemTableViewController *)&v8 viewDidLoad];
  v3 = _HULocalizedStringWithDefaultValue(@"HUScheduleRuleEditor_Repeat", @"HUScheduleRuleEditor_Repeat", 1);
  [(HUScheduleRecurrenceEditorViewController *)self setTitle:v3];

  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:0 target:self action:sel_doneButtonPressed_];
  v5 = [(HUScheduleRecurrenceEditorViewController *)self navigationItem];
  [v5 setRightBarButtonItem:v4];

  v6 = [(HUScheduleRecurrenceEditorViewController *)self navigationItem];
  id v7 = [v6 rightBarButtonItem];
  [v7 setAccessibilityIdentifier:@"Home.Schedule.Recurrence.DoneButton"];
}

- (id)buildItemModuleControllerForModule:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    NSLog(&cfstr_UnexpectedModu.isa, v3);
  }
  id v4 = [(HUItemModuleController *)[HUScheduleRecurrenceEditorItemModuleController alloc] initWithModule:v3];

  return v4;
}

- (void)doneButtonPressed:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    int v9 = 138412546;
    id v10 = self;
    __int16 v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ Done button pressed", (uint8_t *)&v9, 0x16u);
  }
  [(HUScheduleRecurrenceEditorViewController *)self _saveChanges];
  id v7 = [(HUScheduleRecurrenceEditorViewController *)self navigationController];
  id v8 = (id)[v7 popViewControllerAnimated:1];
}

- (void)_saveChanges
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = [(HUScheduleRecurrenceEditorViewController *)self _editorItemModule];
  v5 = [v4 editedRecurrences];
  v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = NSStringFromSelector(a2);
    id v8 = [(HUScheduleRecurrenceEditorViewController *)self delegate];
    int v10 = 138413058;
    __int16 v11 = self;
    __int16 v12 = 2112;
    uint64_t v13 = v7;
    __int16 v14 = 2112;
    objc_super v15 = v8;
    __int16 v16 = 2112;
    id v17 = v5;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ Notifying delegate [%@] of updated recurrences [%@]", (uint8_t *)&v10, 0x2Au);
  }
  int v9 = [(HUScheduleRecurrenceEditorViewController *)self delegate];
  [v9 didUpdateRecurrences:self recurrences:v5];
}

- (id)_editorItemModule
{
  v2 = [(HUItemTableViewController *)self itemManager];
  id v3 = [v2 itemModules];
  id v4 = objc_msgSend(v3, "na_firstObjectPassingTest:", &__block_literal_global_266);

  return v4;
}

uint64_t __61__HUScheduleRecurrenceEditorViewController__editorItemModule__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (HUScheduleRecurrenceEditorViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUScheduleRecurrenceEditorViewControllerDelegate *)WeakRetained;
}

- (UIBarButtonItem)savedButtonBarItem
{
  return self->_savedButtonBarItem;
}

- (void)setSavedButtonBarItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savedButtonBarItem, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end