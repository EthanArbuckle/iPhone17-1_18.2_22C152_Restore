@interface HUScheduleDateEditorViewController
- (HUScheduleDateEditorViewController)initWithDate:(id)a3 editorContext:(unint64_t)a4 delegate:(id)a5;
- (HUScheduleDateEditorViewControllerDelegate)delegate;
- (UIBarButtonItem)savedButtonBarItem;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_editorItemModule;
- (id)buildItemModuleControllerForModule:(id)a3;
- (unint64_t)editorContext;
- (void)_saveChanges;
- (void)doneButtonPressed:(id)a3;
- (void)setSavedButtonBarItem:(id)a3;
- (void)viewDidLoad;
@end

@implementation HUScheduleDateEditorViewController

- (HUScheduleDateEditorViewController)initWithDate:(id)a3 editorContext:(unint64_t)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if (!v9)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"HUScheduleDateEditorViewController.m", 28, @"Invalid parameter not satisfying: %@", @"date" object file lineNumber description];
  }
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F69590]) initWithDelegate:self];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __74__HUScheduleDateEditorViewController_initWithDate_editorContext_delegate___block_invoke;
  v18[3] = &unk_1E6387FE8;
  id v12 = v9;
  id v19 = v12;
  unint64_t v20 = a4;
  [v11 setItemModuleCreator:v18];
  v17.receiver = self;
  v17.super_class = (Class)HUScheduleDateEditorViewController;
  v13 = [(HUItemTableViewController *)&v17 initWithItemManager:v11 tableViewStyle:1];
  v14 = v13;
  if (v13)
  {
    v13->_editorContext = a4;
    objc_storeWeak((id *)&v13->_delegate, v10);
  }

  return v14;
}

id __74__HUScheduleDateEditorViewController_initWithDate_editorContext_delegate___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [[HUScheduleDateEditorItemModule alloc] initWithItemUpdater:v4 date:*(void *)(a1 + 32) editorContext:*(void *)(a1 + 40)];

  v8[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  return v6;
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)HUScheduleDateEditorViewController;
  [(HUItemTableViewController *)&v9 viewDidLoad];
  if ([(HUScheduleDateEditorViewController *)self editorContext]) {
    v3 = @"HUScheduleRuleEditor_EndTime_Title";
  }
  else {
    v3 = @"HUScheduleRuleEditor_StartTime_Title";
  }
  id v4 = _HULocalizedStringWithDefaultValue(v3, v3, 1);
  [(HUScheduleDateEditorViewController *)self setTitle:v4];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:0 target:self action:sel_doneButtonPressed_];
  v6 = [(HUScheduleDateEditorViewController *)self navigationItem];
  [v6 setRightBarButtonItem:v5];

  v7 = [(HUScheduleDateEditorViewController *)self navigationItem];
  v8 = [v7 rightBarButtonItem];
  [v8 setAccessibilityIdentifier:@"Home.Schedule.Editor.DoneButton"];
}

- (id)buildItemModuleControllerForModule:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    NSLog(&cfstr_UnexpectedModu.isa, v3);
  }
  id v4 = [(HUItemModuleController *)[HUScheduleDateEditorItemModuleController alloc] initWithModule:v3];

  return v4;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v5 = a3;
  if ([a4 row] == 2)
  {
    double v6 = 380.0;
  }
  else
  {
    [v5 rowHeight];
    double v6 = v7;
  }

  return v6;
}

- (void)doneButtonPressed:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    double v6 = NSStringFromSelector(a2);
    int v9 = 138412546;
    id v10 = self;
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ Done button pressed", (uint8_t *)&v9, 0x16u);
  }
  [(HUScheduleDateEditorViewController *)self _saveChanges];
  double v7 = [(HUScheduleDateEditorViewController *)self navigationController];
  id v8 = (id)[v7 popViewControllerAnimated:1];
}

- (void)_saveChanges
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = [(HUScheduleDateEditorViewController *)self _editorItemModule];
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    double v6 = NSStringFromSelector(a2);
    double v7 = [(HUScheduleDateEditorViewController *)self delegate];
    id v8 = [v4 editedDate];
    int v11 = 138413058;
    id v12 = self;
    __int16 v13 = 2112;
    v14 = v6;
    __int16 v15 = 2112;
    v16 = v7;
    __int16 v17 = 2112;
    v18 = v8;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ Notifying delegate [%@] of updated schedule rule date [%@]", (uint8_t *)&v11, 0x2Au);
  }
  int v9 = [v4 editedDate];
  id v10 = [(HUScheduleDateEditorViewController *)self delegate];
  objc_msgSend(v10, "didUpdateDate:date:editorContext:", self, v9, objc_msgSend(v4, "editorContext"));
}

- (id)_editorItemModule
{
  v2 = [(HUItemTableViewController *)self itemManager];
  id v3 = [v2 itemModules];
  id v4 = objc_msgSend(v3, "na_firstObjectPassingTest:", &__block_literal_global_55);

  return v4;
}

uint64_t __55__HUScheduleDateEditorViewController__editorItemModule__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (unint64_t)editorContext
{
  return self->_editorContext;
}

- (HUScheduleDateEditorViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUScheduleDateEditorViewControllerDelegate *)WeakRetained;
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