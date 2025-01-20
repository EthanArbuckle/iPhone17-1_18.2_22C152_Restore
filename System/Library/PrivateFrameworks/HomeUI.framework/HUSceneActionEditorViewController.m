@interface HUSceneActionEditorViewController
+ (BOOL)adoptsDefaultGridLayoutMargins;
- (BOOL)_allowEditingNameAndIcon;
- (BOOL)hasViewEverAppeared;
- (BOOL)requiresPresentingViewControllerDismissal;
- (BOOL)shouldHideSeparatorsForCell:(id)a3 indexPath:(id)a4;
- (BOOL)shouldManageTextFieldForItem:(id)a3;
- (BOOL)showCancelButton;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (HUPresentationDelegate)presentationDelegate;
- (HUQuickControlSummaryNavigationBarTitleView)navigationBarTitleView;
- (HUSceneActionEditorViewController)initWithActionSetBuilder:(id)a3 mode:(unint64_t)a4;
- (HUSceneEditorDelegate)sceneEditorDelegate;
- (NSMutableDictionary)actionGridViewControllersByEditorType;
- (NSSet)prioritizedAccessories;
- (NSString)editingName;
- (NSString)savedName;
- (id)_actionGridViewControllerForEditorType:(unint64_t)a3;
- (id)childViewControllersToPreload;
- (id)commitChanges;
- (id)contentConfigurationForHeaderViewAtSectionIndex:(unint64_t)a3;
- (id)currentTextForTextField:(id)a3 item:(id)a4;
- (id)mediaSelectionViewController:(id)a3 messageForMediaPickerUnavailableReason:(int64_t)a4;
- (id)mediaSelectionViewControllerMessageForMediaActionPlayUnavailable:(id)a3;
- (id)placeholderTextForTextField:(id)a3 item:(id)a4;
- (unint64_t)mode;
- (void)_cancel:(id)a3;
- (void)_changeServices:(id)a3;
- (void)_deleteScene:(id)a3 indexPath:(id)a4;
- (void)_done:(id)a3;
- (void)_presentMediaSelection;
- (void)_sendSceneIconEditEventDidChangeColor:(BOOL)a3 didChangeIcon:(BOOL)a4;
- (void)_servicePickerDidFinish;
- (void)_testScene:(id)a3;
- (void)_updateActionSetBuilderName;
- (void)_validateDoneButton;
- (void)iconPicker:(id)a3 didPickIcon:(id)a4 withTintColor:(id)a5;
- (void)iconPicker:(id)a3 didPickIconDescriptor:(id)a4;
- (void)iconPickerDidCancel:(id)a3;
- (void)itemManagerDidUpdate:(id)a3;
- (void)nameAndIconEditorCellDidTapIcon:(id)a3;
- (void)sceneActionGridViewController:(id)a3 didUpdate:(id)a4;
- (void)serviceGridViewController:(id)a3 didTapItem:(id)a4;
- (void)setEditingName:(id)a3;
- (void)setHasViewEverAppeared:(BOOL)a3;
- (void)setMode:(unint64_t)a3;
- (void)setNavigationBarTitleView:(id)a3;
- (void)setPresentationDelegate:(id)a3;
- (void)setPrioritizedAccessories:(id)a3;
- (void)setRequiresPresentingViewControllerDismissal:(BOOL)a3;
- (void)setSceneEditorDelegate:(id)a3;
- (void)setShowCancelButton:(BOOL)a3;
- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5;
- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)textDidChange:(id)a3 forTextField:(id)a4 item:(id)a5;
- (void)textFieldDidEndEditing:(id)a3 item:(id)a4;
- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation HUSceneActionEditorViewController

- (HUSceneActionEditorViewController)initWithActionSetBuilder:(id)a3 mode:(unint64_t)a4
{
  id v6 = a3;
  if (!v6)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F68EB0]);
    v8 = [MEMORY[0x1E4F691A0] sharedDispatcher];
    v9 = [v8 home];
    id v6 = (id)[v7 initWithHome:v9];
  }
  v10 = [v6 home];
  int v11 = objc_msgSend(v10, "hf_currentUserIsAdministrator");

  if (v11) {
    unint64_t v12 = a4;
  }
  else {
    unint64_t v12 = 4;
  }
  v13 = [[HUSceneActionEditorItemManager alloc] initWithActionSetBuilder:v6 mode:v12 delegate:self];
  v19.receiver = self;
  v19.super_class = (Class)HUSceneActionEditorViewController;
  v14 = [(HUItemTableViewController *)&v19 initWithItemManager:v13 tableViewStyle:1];
  v15 = v14;
  if (v14)
  {
    v14->_mode = v12;
    v14->_showCancelButton = 1;
    v14->_requiresPresentingViewControllerDismissal = 1;
    uint64_t v16 = objc_opt_new();
    actionGridViewControllersByEditorType = v15->_actionGridViewControllersByEditorType;
    v15->_actionGridViewControllersByEditorType = (NSMutableDictionary *)v16;
  }
  return v15;
}

- (void)viewDidLoad
{
  v14.receiver = self;
  v14.super_class = (Class)HUSceneActionEditorViewController;
  [(HUItemTableViewController *)&v14 viewDidLoad];
  unint64_t mode = self->_mode;
  if (mode - 1 < 2)
  {
    id v7 = @"HUSceneActionEditorNewTitle";
LABEL_7:
    v4 = _HULocalizedStringWithDefaultValue(v7, v7, 1);
    [(HUSceneActionEditorViewController *)self setTitle:v4];
    goto LABEL_8;
  }
  if (mode - 3 >= 2)
  {
    if (mode) {
      goto LABEL_9;
    }
    id v7 = @"HUSceneActionEditorEditTitle";
    goto LABEL_7;
  }
  v4 = [(HUItemTableViewController *)self itemManager];
  v5 = [v4 actionSetBuilder];
  id v6 = [v5 name];
  [(HUSceneActionEditorViewController *)self setTitle:v6];

LABEL_8:
LABEL_9:
  if ([(HUSceneActionEditorViewController *)self showCancelButton])
  {
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:1 target:self action:sel__cancel_];
    v9 = [(HUSceneActionEditorViewController *)self navigationItem];
    [v9 setLeftBarButtonItem:v8];
  }
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:0 target:self action:sel__done_];
  int v11 = [(HUSceneActionEditorViewController *)self navigationItem];
  [v11 setRightBarButtonItem:v10];

  unint64_t v12 = [(HUSceneActionEditorViewController *)self navigationItem];
  v13 = [v12 rightBarButtonItem];
  [v13 setAccessibilityIdentifier:@"Home.NewScene.Done"];

  [(HUSceneActionEditorViewController *)self _validateDoneButton];
}

- (void)viewDidAppear:(BOOL)a3
{
  v15.receiver = self;
  v15.super_class = (Class)HUSceneActionEditorViewController;
  [(HUItemTableViewController *)&v15 viewDidAppear:a3];
  if ([(HUSceneActionEditorViewController *)self _allowEditingNameAndIcon]
    && ![(HUSceneActionEditorViewController *)self hasViewEverAppeared]
    && [(HUSceneActionEditorViewController *)self mode] == 2)
  {
    v4 = [(HUItemTableViewController *)self itemManager];
    v5 = [v4 nameAndIconItem];
    id v6 = [(HUItemTableViewController *)self textFieldForVisibleItem:v5];
    [v6 becomeFirstResponder];
  }
  [(HUSceneActionEditorViewController *)self setHasViewEverAppeared:1];
  id v7 = [(HUSceneActionEditorViewController *)self parentViewController];
  v8 = [v7 navigationItem];
  v9 = [v8 titleView];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(HUSceneActionEditorViewController *)self setNavigationBarTitleView:v9];
    v10 = [(HUItemTableViewController *)self itemManager];
    int v11 = [v10 actionSetBuilder];
    unint64_t v12 = [v11 name];
    v13 = [(HUSceneActionEditorViewController *)self navigationBarTitleView];
    objc_super v14 = [v13 summaryView];
    [v14 setPrimaryText:v12];
  }
  if (![(HUSceneActionEditorViewController *)self mode]) {
    [MEMORY[0x1E4F68EE0] sendEvent:35];
  }
}

- (NSSet)prioritizedAccessories
{
  v2 = [(HUItemTableViewController *)self itemManager];
  v3 = [v2 prioritizedAccessories];

  return (NSSet *)v3;
}

- (void)setPrioritizedAccessories:(id)a3
{
  id v4 = a3;
  id v5 = [(HUItemTableViewController *)self itemManager];
  [v5 setPrioritizedAccessories:v4];
}

- (NSString)savedName
{
  v2 = [(HUItemTableViewController *)self itemManager];
  v3 = [v2 actionSetBuilder];
  id v4 = [v3 name];

  return (NSString *)v4;
}

- (id)_actionGridViewControllerForEditorType:(unint64_t)a3
{
  id v5 = [(HUSceneActionEditorViewController *)self actionGridViewControllersByEditorType];
  id v6 = [NSNumber numberWithUnsignedInteger:a3];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __76__HUSceneActionEditorViewController__actionGridViewControllerForEditorType___block_invoke;
  v9[3] = &unk_1E638C368;
  v9[4] = self;
  v9[5] = a3;
  id v7 = objc_msgSend(v5, "na_objectForKey:withDefaultValue:", v6, v9);

  return v7;
}

HUEmbeddedSceneActionGridViewController *__76__HUSceneActionEditorViewController__actionGridViewControllerForEditorType___block_invoke(uint64_t a1)
{
  v2 = [HUEmbeddedSceneActionGridViewController alloc];
  v3 = [*(id *)(a1 + 32) itemManager];
  id v4 = [v3 actionSetBuilder];
  id v5 = [(HUEmbeddedSceneActionGridViewController *)v2 initWithActionSetBuilder:v4];

  -[ActionGridViewController setAllowsEditing:](v5, "setAllowsEditing:", [*(id *)(a1 + 32) mode] != 4);
  [(HUEmbeddedSceneActionGridViewController *)v5 setSceneActionGridDelegate:*(void *)(a1 + 32)];
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6 == 2)
  {
    id v7 = [*(id *)(a1 + 32) prioritizedAccessories];
    v8 = [v7 allObjects];
    [(ActionGridViewController *)v5 setDenylistedAccessories:v8];
  }
  else
  {
    if (v6 != 1) {
      goto LABEL_6;
    }
    id v7 = [*(id *)(a1 + 32) prioritizedAccessories];
    v8 = [v7 allObjects];
    [(ActionGridViewController *)v5 setAllowlistedAccessories:v8];
  }

LABEL_6:

  return v5;
}

- (id)commitChanges
{
  v3 = [(HUItemTableViewController *)self itemManager];
  id v4 = [v3 home];
  char v5 = objc_msgSend(v4, "hf_currentUserIsAdministrator");

  if (v5)
  {
    [(HUSceneActionEditorViewController *)self _updateActionSetBuilderName];
    [(HUSceneActionEditorViewController *)self setEditingName:0];
    uint64_t v6 = [(HUSceneActionEditorViewController *)self navigationItem];
    id v7 = [v6 rightBarButtonItem];

    v8 = (void *)[objc_alloc(MEMORY[0x1E4F42708]) initWithActivityIndicatorStyle:100];
    v9 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithCustomView:v8];
    v10 = [(HUSceneActionEditorViewController *)self navigationItem];
    [v10 setRightBarButtonItem:v9];

    [v8 startAnimating];
    int v11 = [(HUItemTableViewController *)self itemManager];
    unint64_t v12 = [v11 actionSetBuilder];
    v13 = [v12 commitItem];

    objc_initWeak(&location, self);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __50__HUSceneActionEditorViewController_commitChanges__block_invoke;
    v24[3] = &unk_1E63874A0;
    objc_copyWeak(&v25, &location);
    id v14 = (id)[v13 addSuccessBlock:v24];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __50__HUSceneActionEditorViewController_commitChanges__block_invoke_2;
    v22[3] = &unk_1E6386FB8;
    objc_copyWeak(&v23, &location);
    id v15 = (id)[v13 addFailureBlock:v22];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __50__HUSceneActionEditorViewController_commitChanges__block_invoke_5;
    v20[3] = &unk_1E6384CE0;
    v20[4] = self;
    id v16 = v7;
    id v21 = v16;
    id v17 = (id)[v13 addCompletionBlock:v20];

    objc_destroyWeak(&v23);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
  else
  {
    v18 = [(HUSceneActionEditorViewController *)self presentationDelegate];
    v13 = [v18 finishPresentation:self animated:1];
  }

  return v13;
}

void __50__HUSceneActionEditorViewController_commitChanges__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained presentationDelegate];
  id v2 = (id)[v1 finishPresentation:WeakRetained animated:1];
}

void __50__HUSceneActionEditorViewController_commitChanges__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v5 = [MEMORY[0x1E4F7A0F0] mainThreadScheduler];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__HUSceneActionEditorViewController_commitChanges__block_invoke_3;
  v8[3] = &unk_1E63850E0;
  id v9 = v3;
  id v10 = WeakRetained;
  id v6 = v3;
  id v7 = (id)[v5 afterDelay:v8 performBlock:0.2];
}

void __50__HUSceneActionEditorViewController_commitChanges__block_invoke_3(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F69110] sharedHandler];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__HUSceneActionEditorViewController_commitChanges__block_invoke_4;
  v4[3] = &unk_1E6386018;
  uint64_t v3 = *(void *)(a1 + 32);
  v4[4] = *(void *)(a1 + 40);
  [v2 handleError:v3 retryBlock:v4 cancelBlock:0];
}

uint64_t __50__HUSceneActionEditorViewController_commitChanges__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _done:0];
}

void __50__HUSceneActionEditorViewController_commitChanges__block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = [*(id *)(a1 + 32) navigationItem];
  [(id)v3 setRightBarButtonItem:v2];

  id v4 = [*(id *)(a1 + 32) sceneEditorDelegate];
  LOBYTE(v3) = objc_opt_respondsToSelector();

  if (v3)
  {
    id v8 = [*(id *)(a1 + 32) sceneEditorDelegate];
    char v5 = *(void **)(a1 + 32);
    id v6 = [v5 itemManager];
    id v7 = [v6 actionSetBuilder];
    [v8 sceneEditor:v5 didCommitActionSet:v7];
  }
}

- (void)_done:(id)a3
{
  id v3 = [(HUSceneActionEditorViewController *)self commitChanges];
}

- (void)_cancel:(id)a3
{
  [(HUSceneActionEditorViewController *)self setEditingName:0];
  id v5 = [(HUSceneActionEditorViewController *)self presentationDelegate];
  id v4 = (id)[v5 finishPresentation:self animated:1];
}

- (void)_changeServices:(id)a3
{
  [(HUSceneActionEditorViewController *)self _updateActionSetBuilderName];
  [(HUSceneActionEditorViewController *)self setEditingName:0];
  id v4 = [HUActionSetAccessoryPickerViewController alloc];
  id v5 = [(HUItemTableViewController *)self itemManager];
  id v6 = [v5 actionSetBuilder];
  id v10 = [(HUActionSetAccessoryPickerViewController *)v4 initWithActionSetBuilder:v6 delegate:self];

  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:v10];
  [v7 setModalPresentationStyle:2];
  id v8 = [(HUSceneActionEditorViewController *)self view];
  [v8 endEditing:1];

  id v9 = [(UIViewController *)self hu_presentPreloadableViewController:v7 animated:1];
}

- (void)_deleteScene:(id)a3 indexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HUItemTableViewController *)self itemManager];
  id v9 = [v8 actionSetBuilder];
  id v10 = [v9 actionSet];

  if (v10)
  {
    if ([MEMORY[0x1E4F69758] isAMac])
    {
      int v11 = [v10 name];
      v18 = HULocalizedStringWithFormat(@"HUSceneActionEditorDeleteSceneConfirmationAlertTitle", @"%@", v12, v13, v14, v15, v16, v17, (uint64_t)v11);

      objc_super v19 = _HULocalizedStringWithDefaultValue(@"HUSceneActionEditorDeleteSceneConfirmationAlertMessage", @"HUSceneActionEditorDeleteSceneConfirmationAlertMessage", 1);
    }
    else
    {
      v18 = 0;
      objc_super v19 = 0;
    }
    v20 = [(UITableViewController *)self hu_actionSheetWithTitle:v18 message:v19 indexPath:v7];
    objc_initWeak(&location, self);
    id v21 = (void *)MEMORY[0x1E4F42720];
    v22 = _HULocalizedStringWithDefaultValue(@"HUSceneActionEditorDeleteSceneConfirmationButtonTitle", @"HUSceneActionEditorDeleteSceneConfirmationButtonTitle", 1);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __60__HUSceneActionEditorViewController__deleteScene_indexPath___block_invoke;
    v27[3] = &unk_1E6387430;
    objc_copyWeak(&v29, &location);
    id v28 = v6;
    id v23 = [v21 actionWithTitle:v22 style:2 handler:v27];
    [v20 addAction:v23];

    v24 = (void *)MEMORY[0x1E4F42720];
    id v25 = _HULocalizedStringWithDefaultValue(@"HUSceneActionEditorDeleteSceneCancelButtonTitle", @"HUSceneActionEditorDeleteSceneCancelButtonTitle", 1);
    v26 = [v24 actionWithTitle:v25 style:1 handler:&__block_literal_global_134];
    [v20 addAction:v26];

    [(HUSceneActionEditorViewController *)self presentViewController:v20 animated:1 completion:0];
    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }
  else
  {
    NSLog(&cfstr_NoActionSetToD.isa);
  }
}

void __60__HUSceneActionEditorViewController__deleteScene_indexPath___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ([WeakRetained mode] == 3)
  {
    id v3 = [WeakRetained sceneEditorDelegate];
    id v4 = [WeakRetained itemManager];
    id v5 = [v4 actionSetBuilder];
    [v3 sceneEditor:WeakRetained removeActionSetBuilderFromTrigger:v5];

    id v6 = [WeakRetained presentationDelegate];
    id v7 = (id)[v6 finishPresentation:WeakRetained animated:1];
  }
  else
  {
    id v8 = [WeakRetained itemManager];
    id v9 = [v8 actionSetBuilder];
    id v10 = [v9 deleteActionSet];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __60__HUSceneActionEditorViewController__deleteScene_indexPath___block_invoke_2;
    v12[3] = &unk_1E6384CE0;
    v12[4] = WeakRetained;
    id v13 = *(id *)(a1 + 32);
    id v11 = (id)[v10 addCompletionBlock:v12];
  }
}

void __60__HUSceneActionEditorViewController__deleteScene_indexPath___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v12 = a3;
  if (v12)
  {
    uint64_t v5 = *MEMORY[0x1E4F687A8];
    id v6 = [*(id *)(a1 + 32) editingName];
    id v7 = objc_msgSend(v12, "hf_errorWithOperationType:failedItemName:", v5, v6);

    id v8 = [MEMORY[0x1E4F69110] sharedHandler];
    [v8 handleError:v7];

LABEL_5:
    goto LABEL_7;
  }
  int v9 = [a2 isEqualToString:*MEMORY[0x1E4F2C958]];
  id v10 = *(void **)(a1 + 32);
  if (v9)
  {
    id v7 = [v10 presentationDelegate];
    id v11 = (id)[v7 finishPresentation:*(void *)(a1 + 32) animated:1];
    goto LABEL_5;
  }
  [v10 _done:*(void *)(a1 + 40)];
LABEL_7:
}

- (void)_testScene:(id)a3
{
  id v4 = [(HUItemTableViewController *)self itemManager];
  uint64_t v5 = [v4 home];
  id v6 = objc_msgSend(v5, "hf_characteristicValueManager");

  id v7 = [(HUItemTableViewController *)self itemManager];
  id v8 = [v7 actionSetBuilder];
  int v9 = [v8 actions];
  id v10 = objc_msgSend(v9, "na_map:", &__block_literal_global_142_1);

  id v11 = [MEMORY[0x1E4F7A0D8] combineAllFutures:v10];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __48__HUSceneActionEditorViewController__testScene___block_invoke_2;
  v16[3] = &unk_1E63873E0;
  id v17 = v6;
  v18 = self;
  id v12 = v6;
  id v13 = [v11 addSuccessBlock:v16];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __48__HUSceneActionEditorViewController__testScene___block_invoke_5;
  v15[3] = &unk_1E6386708;
  v15[4] = self;
  id v14 = (id)[v13 addFailureBlock:v15];
}

uint64_t __48__HUSceneActionEditorViewController__testScene___block_invoke(uint64_t a1, void *a2)
{
  return [a2 performValidation];
}

void __48__HUSceneActionEditorViewController__testScene___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) beginTransactionWithReason:@"HUSceneActionEditorTransactionReasonTestScene"];
  uint64_t v2 = [*(id *)(a1 + 40) itemManager];
  id v3 = [v2 actionSetBuilder];
  id v4 = [v3 actions];
  uint64_t v5 = objc_msgSend(v4, "na_map:", &__block_literal_global_145_0);
  objc_msgSend(v5, "na_filter:", &__block_literal_global_148);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  id v6 = *(void **)(a1 + 32);
  id v7 = [MEMORY[0x1E4F1CAD0] setWithArray:v9];
  id v8 = (id)[v6 executeActions:v7];

  [*(id *)(a1 + 32) commitTransactionWithReason:@"HUSceneActionEditorTransactionReasonTestScene"];
}

uint64_t __48__HUSceneActionEditorViewController__testScene___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 createNewAction];
}

BOOL __48__HUSceneActionEditorViewController__testScene___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return a2 != 0;
}

void __48__HUSceneActionEditorViewController__testScene___block_invoke_5(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = [MEMORY[0x1E4F69110] sharedHandler];
  uint64_t v4 = *MEMORY[0x1E4F68820];
  uint64_t v5 = [*(id *)(a1 + 32) editingName];
  id v6 = v5;
  if (!v5)
  {
    id v6 = [*(id *)(a1 + 32) savedName];
  }
  id v7 = objc_msgSend(v8, "hf_errorWithOperationType:failedItemName:", v4, v6);
  [v3 handleError:v7];

  if (!v5) {
}
  }

+ (BOOL)adoptsDefaultGridLayoutMargins
{
  return 0;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v5 = a3;
  id v6 = [(HUItemTableViewController *)self itemManager];
  id v7 = [v6 nameAndIconItem];
  char v8 = [v5 isEqual:v7];

  if ((v8 & 1) == 0)
  {
    id v9 = [(HUItemTableViewController *)self itemManager];
    id v10 = [v9 actionGridItems];
    char v11 = [v10 containsObject:v5];

    if ((v11 & 1) == 0)
    {
      id v12 = [(HUItemTableViewController *)self itemManager];
      id v13 = [v12 mediaItem];
      char v14 = [v5 isEqual:v13];

      if ((v14 & 1) == 0)
      {
        uint64_t v15 = [(HUItemTableViewController *)self itemManager];
        uint64_t v16 = [v15 showInHomeDashboardItem];
        [v5 isEqual:v16];
      }
    }
  }
  id v17 = objc_opt_class();

  return (Class)v17;
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v51 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(HUItemTableViewController *)self itemManager];
  id v11 = [v10 nameAndIconItem];

  if (v11 == v8)
  {
    uint64_t v23 = objc_opt_class();
    id v24 = v51;
    if (v24)
    {
      if (objc_opt_isKindOfClass()) {
        id v25 = v24;
      }
      else {
        id v25 = 0;
      }
      id v26 = v24;
      if (v25) {
        goto LABEL_11;
      }
      v27 = [MEMORY[0x1E4F28B00] currentHandler];
      id v28 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      [v27 handleFailureInFunction:v28, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v23, objc_opt_class() file lineNumber description];
    }
    id v26 = 0;
LABEL_11:

    [v26 setDelegate:self];
    objc_msgSend(v26, "setDisabled:", -[HUSceneActionEditorViewController _allowEditingNameAndIcon](self, "_allowEditingNameAndIcon") ^ 1);
    id v29 = +[HUGridSceneCellLayoutOptions defaultOptionsForCellSizeSubclass:1];
    v30 = [v29 font];
    [v26 setTextFieldFont:v30];

    v31 = [v26 iconButton];
    [v31 setSelected:1];

    v32 = [v26 textField];
    [v32 setAccessibilityIdentifier:@"Home.NewScene.SceneName"];

    goto LABEL_23;
  }
  id v12 = [(HUItemTableViewController *)self itemManager];
  id v13 = [v12 actionGridItems];
  int v14 = [v13 containsObject:v8];

  if (v14)
  {
    uint64_t v15 = (void *)MEMORY[0x1E4F428B8];
    id v16 = v51;
    id v17 = [v15 clearColor];
    [v16 setBackgroundColor:v17];

    v18 = [MEMORY[0x1E4F428B8] clearColor];
    objc_super v19 = [v16 contentView];
    [v19 setBackgroundColor:v18];

    [v16 setIgnoreRounding:1];
    v20 = [(HUItemTableViewController *)self itemManager];
    id v21 = objc_msgSend(v20, "displayedSectionIdentifierForSectionIndex:", objc_msgSend(v9, "section"));

    v22 = [(HUSceneActionEditorViewController *)self _actionGridViewControllerForEditorType:+[HUSceneActionEditorItemManager actionGridEditorTypeForSectionIdentifier:v21]];
    [v16 setViewController:v22];

    goto LABEL_24;
  }
  v33 = [(HUItemTableViewController *)self itemManager];
  v34 = [v33 deleteSceneItem];
  int v35 = [v8 isEqual:v34];

  if (v35)
  {
    id v26 = v51;
    [v26 setDestructive:1];
    if (![(HUSceneActionEditorViewController *)self mode])
    {
      v36 = @"Home.Scene.DeleteScene";
LABEL_22:
      [v26 setAccessibilityIdentifier:v36];
    }
LABEL_23:

    goto LABEL_24;
  }
  v37 = [(HUItemTableViewController *)self itemManager];
  v38 = [v37 mediaItem];
  int v39 = [v8 isEqual:v38];

  if (v39)
  {
    id v40 = v51;
    [v40 setAccessoryType:1];
    [v40 setHideIcon:1];

    goto LABEL_24;
  }
  v41 = [(HUItemTableViewController *)self itemManager];
  v42 = [v41 showInHomeDashboardItem];
  int v43 = [v8 isEqual:v42];

  if (v43)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      NSLog(&cfstr_WrongCellClass.isa);
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v26 = v51;
      [v26 setDelegate:self];
      v36 = @"Home.Scene.AddToHomeView";
      goto LABEL_22;
    }
  }
  else
  {
    v44 = [(HUItemTableViewController *)self itemManager];
    v45 = [v44 testSceneItem];
    int v46 = [v8 isEqual:v45];

    if (v46)
    {
      v47 = @"Home.Scene.TestScene";
    }
    else
    {
      v48 = [(HUItemTableViewController *)self itemManager];
      v49 = [v48 changeServicesItem];
      int v50 = [v8 isEqual:v49];

      if (!v50) {
        goto LABEL_24;
      }
      v47 = @"Home.Scene.ChangeAccessories";
    }
    [v51 setAccessibilityIdentifier:v47];
  }
LABEL_24:
}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  v21.receiver = self;
  v21.super_class = (Class)HUSceneActionEditorViewController;
  id v11 = a4;
  [(HUItemTableViewController *)&v21 updateCell:v10 forItem:v11 indexPath:a5 animated:v6];
  id v12 = [(HUItemTableViewController *)self itemManager];
  id v13 = [v12 nameAndIconItem];
  int v14 = [v11 isEqual:v13];

  if (v14)
  {
    uint64_t v15 = objc_opt_class();
    id v16 = v10;
    if (v16)
    {
      if (objc_opt_isKindOfClass()) {
        id v17 = v16;
      }
      else {
        id v17 = 0;
      }
      v18 = v16;
      if (v17) {
        goto LABEL_9;
      }
      objc_super v19 = [MEMORY[0x1E4F28B00] currentHandler];
      v20 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      [v19 handleFailureInFunction:v20, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v15, objc_opt_class(), v21.receiver, v21.super_class file lineNumber description];
    }
    v18 = 0;
LABEL_9:

    objc_msgSend(v18, "setDisabled:", -[HUSceneActionEditorViewController _allowEditingNameAndIcon](self, "_allowEditingNameAndIcon") ^ 1);
  }
}

- (void)itemManagerDidUpdate:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)HUSceneActionEditorViewController;
  [(HUItemTableViewController *)&v9 itemManagerDidUpdate:a3];
  [(HUSceneActionEditorViewController *)self _validateDoneButton];
  uint64_t v4 = [(HUSceneActionEditorViewController *)self navigationBarTitleView];
  id v5 = [v4 summaryView];

  if (v5)
  {
    BOOL v6 = [(HUItemTableViewController *)self itemManager];
    id v7 = [v6 actionSetBuilder];
    id v8 = [v7 name];
    [v5 setPrimaryText:v8];
  }
}

- (BOOL)shouldHideSeparatorsForCell:(id)a3 indexPath:(id)a4
{
  id v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HUSceneActionEditorViewController;
  if ([(HUItemTableViewController *)&v9 shouldHideSeparatorsForCell:v6 indexPath:a4]|| (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (id)childViewControllersToPreload
{
  id v3 = +[HUSceneActionEditorItemManager allActionGridEditorSectionIdentifiers];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__HUSceneActionEditorViewController_childViewControllersToPreload__block_invoke;
  v7[3] = &unk_1E638C390;
  v7[4] = self;
  uint64_t v4 = objc_msgSend(v3, "na_map:", v7);
  id v5 = [v4 allObjects];

  return v5;
}

id __66__HUSceneActionEditorViewController_childViewControllersToPreload__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) itemManager];
  uint64_t v5 = [v4 sectionIndexForDisplayedSectionIdentifier:v3];

  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = objc_msgSend(*(id *)(a1 + 32), "_actionGridViewControllerForEditorType:", +[HUSceneActionEditorItemManager actionGridEditorTypeForSectionIdentifier:](HUSceneActionEditorItemManager, "actionGridEditorTypeForSectionIdentifier:", v3));
  }

  return v6;
}

- (BOOL)shouldManageTextFieldForItem:(id)a3
{
  return 1;
}

- (id)placeholderTextForTextField:(id)a3 item:(id)a4
{
  return _HULocalizedStringWithDefaultValue(@"HUSceneActionEditorSceneNamePlaceholderText", @"HUSceneActionEditorSceneNamePlaceholderText", 1);
}

- (id)currentTextForTextField:(id)a3 item:(id)a4
{
  uint64_t v5 = [(HUSceneActionEditorViewController *)self editingName];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [(HUSceneActionEditorViewController *)self savedName];
  }
  id v8 = v7;

  return v8;
}

- (void)textDidChange:(id)a3 forTextField:(id)a4 item:(id)a5
{
  -[HUSceneActionEditorViewController setEditingName:](self, "setEditingName:", a3, a4, a5);
  id v6 = [(HUSceneActionEditorViewController *)self navigationBarTitleView];
  id v8 = [v6 summaryView];

  if (v8)
  {
    id v7 = [(HUSceneActionEditorViewController *)self editingName];
    [v8 setPrimaryText:v7];
  }
}

- (void)textFieldDidEndEditing:(id)a3 item:(id)a4
{
  [(HUSceneActionEditorViewController *)self _updateActionSetBuilderName];

  [(HUSceneActionEditorViewController *)self setEditingName:0];
}

- (id)contentConfigurationForHeaderViewAtSectionIndex:(unint64_t)a3
{
  uint64_t v4 = [(HUItemTableViewController *)self itemManager];
  uint64_t v5 = [v4 itemSectionForSectionIndex:a3];

  id v6 = [v5 headerTitle];

  if (v6)
  {
    id v6 = [MEMORY[0x1E4F42B58] prominentInsetGroupedHeaderConfiguration];
    id v7 = [v5 headerTitle];
    [v6 setText:v7];

    id v8 = [v5 headerSecondaryText];
    [v6 setSecondaryText:v8];

    [v6 directionalLayoutMargins];
    objc_msgSend(v6, "setDirectionalLayoutMargins:");
  }

  return v6;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(HUItemTableViewController *)self itemManager];
  id v7 = [v6 displayedItemAtIndexPath:v5];

  id v8 = [(HUItemTableViewController *)self itemManager];
  objc_super v9 = [v8 changeServicesItem];
  if (v7 == v9)
  {
    BOOL v16 = 1;
  }
  else
  {
    id v10 = [(HUItemTableViewController *)self itemManager];
    id v11 = [v10 testSceneItem];
    if (v7 == v11)
    {
      BOOL v16 = 1;
    }
    else
    {
      id v12 = [(HUItemTableViewController *)self itemManager];
      id v13 = [v12 deleteSceneItem];
      if (v7 == v13)
      {
        BOOL v16 = 1;
      }
      else
      {
        int v14 = [(HUItemTableViewController *)self itemManager];
        uint64_t v15 = [v14 mediaItem];
        BOOL v16 = v7 == v15;
      }
    }
  }
  return v16;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HUSceneActionEditorViewController;
  id v7 = a3;
  [(HUItemTableViewController *)&v18 tableView:v7 didSelectRowAtIndexPath:v6];
  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1, v18.receiver, v18.super_class);

  id v8 = [(HUItemTableViewController *)self itemManager];
  objc_super v9 = [v8 displayedItemAtIndexPath:v6];

  id v10 = [(HUItemTableViewController *)self itemManager];
  id v11 = [v10 changeServicesItem];

  if (v9 == v11)
  {
    [(HUSceneActionEditorViewController *)self _changeServices:v9];
  }
  else
  {
    id v12 = [(HUItemTableViewController *)self itemManager];
    id v13 = [v12 testSceneItem];

    if (v9 == v13)
    {
      [(HUSceneActionEditorViewController *)self _testScene:v9];
    }
    else
    {
      int v14 = [(HUItemTableViewController *)self itemManager];
      uint64_t v15 = [v14 deleteSceneItem];

      if (v9 == v15)
      {
        [(HUSceneActionEditorViewController *)self _deleteScene:v9 indexPath:v6];
      }
      else
      {
        BOOL v16 = [(HUItemTableViewController *)self itemManager];
        id v17 = [v16 mediaItem];

        if (v9 == v17) {
          [(HUSceneActionEditorViewController *)self _presentMediaSelection];
        }
      }
    }
  }
}

- (void)_updateActionSetBuilderName
{
  uint64_t v4 = (void *)MEMORY[0x1E4F69758];
  id v5 = [(HUSceneActionEditorViewController *)self editingName];
  id v6 = [v4 sanitizeUserEnteredHomeKitName:v5];
  [(HUSceneActionEditorViewController *)self setEditingName:v6];

  uint64_t v7 = [(HUSceneActionEditorViewController *)self editingName];
  if (!v7
    || (id v8 = (void *)v7,
        [(HUSceneActionEditorViewController *)self editingName],
        objc_super v9 = objc_claimAutoreleasedReturnValue(),
        uint64_t v10 = [v9 length],
        v9,
        v8,
        !v10))
  {
    id v11 = [(HUSceneActionEditorViewController *)self savedName];
    id v12 = (void *)[v11 mutableCopy];
    [(HUSceneActionEditorViewController *)self setEditingName:v12];

    id v13 = [(HUSceneActionEditorViewController *)self editingName];
    int v14 = [(HUItemTableViewController *)self itemManager];
    uint64_t v15 = [v14 nameAndIconItem];
    BOOL v16 = [(HUItemTableViewController *)self textFieldForVisibleItem:v15];
    [v16 setText:v13];
  }
  id v17 = [(HUSceneActionEditorViewController *)self editingName];
  objc_super v18 = (void *)[v17 copy];
  objc_super v19 = [(HUItemTableViewController *)self itemManager];
  v20 = [v19 actionSetBuilder];
  [v20 setName:v18];

  [(HUSceneActionEditorViewController *)self _validateDoneButton];
  id v24 = [(HUItemTableViewController *)self itemManager];
  objc_super v21 = [(HUItemTableViewController *)self itemManager];
  v22 = [v21 instructionsItems];
  id v23 = (id)[v24 updateResultsForItems:v22 senderSelector:a2];
}

- (void)_validateDoneButton
{
  uint64_t v4 = [(HUItemTableViewController *)self itemManager];
  id v10 = [v4 actionSetBuilder];

  id v5 = [v10 actions];
  uint64_t v6 = [v5 count];
  if (v6)
  {
    uint64_t v2 = [v10 name];
    BOOL v7 = [v2 length] != 0;
  }
  else
  {
    BOOL v7 = 0;
  }
  id v8 = [(HUSceneActionEditorViewController *)self navigationItem];
  objc_super v9 = [v8 rightBarButtonItem];
  [v9 setEnabled:v7];

  if (v6) {
}
  }

- (BOOL)_allowEditingNameAndIcon
{
  id v3 = [(HUItemTableViewController *)self itemManager];
  uint64_t v4 = [v3 actionSetBuilder];

  if ([(HUSceneActionEditorViewController *)self mode] == 4)
  {
    char v5 = 0;
  }
  else
  {
    if (_MergedGlobals_4_2 != -1) {
      dispatch_once(&_MergedGlobals_4_2, &__block_literal_global_193);
    }
    id v6 = (id)qword_1EA12E050;
    BOOL v7 = [v4 actionSet];
    if (v7)
    {
      id v8 = [v4 actionSet];
      objc_super v9 = [v8 actionSetType];
      char v5 = [v6 containsObject:v9];
    }
    else
    {
      char v5 = 1;
    }
  }
  return v5;
}

void __61__HUSceneActionEditorViewController__allowEditingNameAndIcon__block_invoke_2()
{
  v6[5] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = *MEMORY[0x1E4F2C948];
  v6[0] = *MEMORY[0x1E4F2C958];
  v6[1] = v1;
  uint64_t v2 = *MEMORY[0x1E4F2C930];
  v6[2] = *MEMORY[0x1E4F2C960];
  v6[3] = v2;
  v6[4] = *MEMORY[0x1E4F2C938];
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:5];
  uint64_t v4 = [v0 setWithArray:v3];
  char v5 = (void *)qword_1EA12E050;
  qword_1EA12E050 = v4;
}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = [(HUSceneActionEditorViewController *)self tableView];
  id v18 = [v7 indexPathForCell:v6];

  id v8 = [(HUItemTableViewController *)self itemManager];
  objc_super v9 = [v8 displayedItemAtIndexPath:v18];

  id v10 = [(HUItemTableViewController *)self itemManager];
  id v11 = [v10 showInHomeDashboardItem];
  int v12 = [v9 isEqual:v11];

  if (v12)
  {
    id v13 = [(HUItemTableViewController *)self itemManager];
    int v14 = [v13 actionSetBuilder];
    [v14 setShowInHomeDashboard:v4];
  }
  uint64_t v15 = (void *)MEMORY[0x1E4F68EE0];
  BOOL v16 = [v9 latestResults];
  id v17 = [v16 objectForKeyedSubscript:*MEMORY[0x1E4F68AC0]];
  [v15 sendSwitchCellToggleEventForItem:v9 isOn:v4 title:v17 fromSourceViewController:self];
}

- (void)_servicePickerDidFinish
{
  [(HUSceneActionEditorViewController *)self _validateDoneButton];
  BOOL v4 = [(HUItemTableViewController *)self itemManager];
  char v5 = [v4 itemsToHideWhenEmpty];
  id v6 = [(HUItemTableViewController *)self itemManager];
  BOOL v7 = [v6 instructionsItems];
  id v8 = [v5 setByAddingObjectsFromSet:v7];

  objc_super v9 = [(HUItemTableViewController *)self itemManager];
  id v10 = (id)[v9 updateResultsForItems:v8 senderSelector:a2];

  id v11 = [(HUSceneActionEditorViewController *)self actionGridViewControllersByEditorType];
  int v12 = [v11 allValues];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __60__HUSceneActionEditorViewController__servicePickerDidFinish__block_invoke;
  v14[3] = &__block_descriptor_40_e40_v16__0__HUItemCollectionViewController_8l;
  v14[4] = a2;
  objc_msgSend(v12, "na_each:", v14);

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __60__HUSceneActionEditorViewController__servicePickerDidFinish__block_invoke_2;
  v13[3] = &unk_1E6386018;
  v13[4] = self;
  [(HUSceneActionEditorViewController *)self dismissViewControllerAnimated:1 completion:v13];
}

void __60__HUSceneActionEditorViewController__servicePickerDidFinish__block_invoke(uint64_t a1, void *a2)
{
  id v4 = [a2 itemManager];
  id v3 = (id)[v4 reloadAndUpdateAllItemsFromSenderSelector:*(void *)(a1 + 32)];
}

void __60__HUSceneActionEditorViewController__servicePickerDidFinish__block_invoke_2(uint64_t a1)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) itemManager];
  int v3 = [v2 diffableDataSourceDisabled];

  id v4 = *(void **)(a1 + 32);
  if (v3)
  {
    id v10 = [v4 tableView];
    char v5 = [MEMORY[0x1E4F28D60] indexSetWithIndex:1];
    [v10 reloadSections:v5 withRowAnimation:5];
  }
  else
  {
    id v6 = [v4 itemManager];
    BOOL v7 = [v6 itemSectionForSectionIndex:1];

    if (v7)
    {
      id v8 = [*(id *)(a1 + 32) itemManager];
      v11[0] = v7;
      objc_super v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
      [v8 reloadUIRepresentationForSections:v9 withAnimation:0];
    }
  }
}

- (void)nameAndIconEditorCellDidTapIcon:(id)a3
{
  id v4 = [(HUItemTableViewController *)self itemManager];
  char v5 = [v4 actionSetBuilder];
  id v12 = [v5 iconDescriptor];

  id v6 = [(HUItemTableViewController *)self itemManager];
  BOOL v7 = [v6 actionSetBuilder];
  id v8 = [v7 iconTintColor];

  objc_super v9 = +[HUSymbolIconPickerViewController sceneIconDescriptors];
  id v10 = [[HUSymbolIconPickerViewController alloc] initWithIconDescriptors:v9 selectedIconDescriptor:v12 selectedTintColor:v8 delegate:self];
  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:v10];
  [v11 setModalPresentationStyle:2];
  [(HUSceneActionEditorViewController *)self presentViewController:v11 animated:1 completion:0];
}

- (void)iconPickerDidCancel:(id)a3
{
  [(HUSceneActionEditorViewController *)self dismissViewControllerAnimated:1 completion:0];

  [(HUSceneActionEditorViewController *)self _sendSceneIconEditEventDidChangeColor:0 didChangeIcon:0];
}

- (void)iconPicker:(id)a3 didPickIcon:(id)a4 withTintColor:(id)a5
{
  id v54 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  id v53 = v9;
  if (!v9)
  {
    uint64_t v22 = 0;
    if (v10) {
      goto LABEL_11;
    }
LABEL_8:
    uint64_t v23 = 0;
    id v24 = v53;
    goto LABEL_16;
  }
  objc_opt_class();
  id v12 = v9;
  if (objc_opt_isKindOfClass()) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }
  id v14 = v13;

  if (v14)
  {
    uint64_t v15 = [(HUItemTableViewController *)self itemManager];
    [v15 actionSetBuilder];
    v52 = v11;
    v17 = BOOL v16 = a2;
    id v18 = [v17 iconDescriptor];
    objc_super v19 = [v18 imageIdentifier];
    v20 = [v14 imageIdentifier];
    uint64_t v21 = [v19 isEqualToString:v20] ^ 1;

    uint64_t v22 = v21;
    a2 = v16;
    id v11 = v52;
  }
  else
  {
    uint64_t v22 = 0;
  }
  id v25 = [(HUItemTableViewController *)self itemManager];
  id v26 = [v25 actionSetBuilder];
  [v26 setIconDescriptor:v12];

  if (!v11) {
    goto LABEL_8;
  }
LABEL_11:
  v27 = [(HUItemTableViewController *)self itemManager];
  id v28 = [v27 actionSetBuilder];
  uint64_t v29 = [v28 iconTintColor];

  v30 = [(HUItemTableViewController *)self itemManager];
  v31 = [v30 actionSetBuilder];
  uint64_t v32 = [v31 actionSet];
  uint64_t v33 = v32 | v29;

  if (v33
    || ([MEMORY[0x1E4F428B8] systemOrangeColor],
        v34 = objc_claimAutoreleasedReturnValue(),
        char v35 = [v11 isEqual:v34],
        v34,
        (v35 & 1) == 0))
  {
    uint64_t v23 = [(id)v29 isEqual:v11] ^ 1;
  }
  else
  {
    uint64_t v23 = 0;
  }
  id v24 = v53;
  v36 = [(HUItemTableViewController *)self itemManager];
  v37 = [v36 actionSetBuilder];
  [v37 setIconTintColor:v11];

LABEL_16:
  v38 = [(HUItemTableViewController *)self itemManager];
  int v39 = (void *)MEMORY[0x1E4F1CAD0];
  id v40 = [(HUItemTableViewController *)self itemManager];
  v41 = [v40 nameAndIconItem];
  v42 = [v39 setWithObject:v41];
  id v43 = (id)[v38 updateResultsForItems:v42 senderSelector:a2];

  [(HUSceneActionEditorViewController *)self dismissViewControllerAnimated:1 completion:0];
  if (([MEMORY[0x1E4F69758] shouldUseLegacyQuickControlPresentation] & 1) == 0)
  {
    v44 = [(HUSceneActionEditorViewController *)self navigationBarTitleView];
    v45 = [v44 summaryView];
    int v46 = [v45 baseIconView];
    v47 = [v46 configuration];

    if (v47)
    {
      v48 = (void *)[v47 copyWithIconDescriptor:v24];
      v49 = [(HUSceneActionEditorViewController *)self navigationBarTitleView];
      int v50 = [v49 summaryView];
      id v51 = [v50 baseIconView];
      [v51 setConfiguration:v48];
    }
  }
  [(HUSceneActionEditorViewController *)self _sendSceneIconEditEventDidChangeColor:v23 didChangeIcon:v22];
}

- (void)iconPicker:(id)a3 didPickIconDescriptor:(id)a4
{
  if (a4)
  {
    id v6 = a4;
    BOOL v7 = [(HUItemTableViewController *)self itemManager];
    id v8 = [v7 actionSetBuilder];
    [v8 setIconDescriptor:v6];
  }
  id v9 = [(HUItemTableViewController *)self itemManager];
  id v10 = (void *)MEMORY[0x1E4F1CAD0];
  id v11 = [(HUItemTableViewController *)self itemManager];
  id v12 = [v11 nameAndIconItem];
  id v13 = [v10 setWithObject:v12];
  id v14 = (id)[v9 updateResultsForItems:v13 senderSelector:a2];

  [(HUSceneActionEditorViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)_presentMediaSelection
{
  int v3 = [(HUItemTableViewController *)self itemManager];
  id v6 = [v3 actionSetBuilder];

  id v4 = [[HUMediaSelectionViewController alloc] initWithActionSetBuilder:v6];
  [(HUMediaSelectionViewController *)v4 setDelegate:self];
  char v5 = [(HUSceneActionEditorViewController *)self navigationController];
  [v5 pushViewController:v4 animated:1];
}

- (void)sceneActionGridViewController:(id)a3 didUpdate:(id)a4
{
  if (objc_msgSend(a4, "na_any:", &__block_literal_global_202))
  {
    id v11 = [(HUItemTableViewController *)self itemManager];
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    BOOL v7 = [(HUItemTableViewController *)self itemManager];
    id v8 = [v7 mediaItem];
    id v9 = [v6 setWithObject:v8];
    id v10 = (id)[v11 updateResultsForItems:v9 senderSelector:a2];
  }
}

uint64_t __77__HUSceneActionEditorViewController_sceneActionGridViewController_didUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)serviceGridViewController:(id)a3 didTapItem:(id)a4
{
  id v17 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    id v6 = v17;
    if (objc_opt_isKindOfClass()) {
      BOOL v7 = v6;
    }
    else {
      BOOL v7 = 0;
    }
    id v8 = v7;

    id v9 = [v8 containingItem];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v11 = [(HUItemTableViewController *)self itemManager];
      id v12 = (void *)MEMORY[0x1E4F1CAD0];
      id v13 = [(HUItemTableViewController *)self itemManager];
      id v14 = [v13 mediaItem];
      uint64_t v15 = [v12 setWithObject:v14];
      id v16 = (id)[v11 updateResultsForItems:v15 senderSelector:a2];
    }
  }
}

- (id)mediaSelectionViewController:(id)a3 messageForMediaPickerUnavailableReason:(int64_t)a4
{
  id v4 = @"HUSceneMediaPickerUnavailableMusicCatalogPlaybackDisabledPromptMessage";
  if (a4 != 1) {
    id v4 = 0;
  }
  if (a4) {
    return v4;
  }
  else {
    return @"HUSceneMediaPickerUnavailableMusicAppUninstalledPromptMessage";
  }
}

- (id)mediaSelectionViewControllerMessageForMediaActionPlayUnavailable:(id)a3
{
  return @"HUSceneMediaActionPlayUnavailableMessage";
}

- (void)_sendSceneIconEditEventDidChangeColor:(BOOL)a3 didChangeIcon:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  BOOL v7 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v8 = *MEMORY[0x1E4F682D8];
  id v22 = v7;
  if (v5 || v4)
  {
    objc_msgSend(v7, "na_safeSetObject:forKey:", MEMORY[0x1E4F1CC38], v8);
    if (v5)
    {
      id v9 = [(HUItemTableViewController *)self itemManager];
      id v10 = [v9 actionSetBuilder];
      id v11 = [v10 iconTintColor];
      id v12 = [v11 _debugName];
      objc_msgSend(v22, "na_safeSetObject:forKey:", v12, *MEMORY[0x1E4F682D0]);
    }
    if (v4)
    {
      id v13 = [(HUItemTableViewController *)self itemManager];
      id v14 = [v13 actionSetBuilder];
      uint64_t v15 = [v14 iconDescriptor];
      id v16 = [v15 imageIdentifier];
      objc_msgSend(v22, "na_safeSetObject:forKey:", v16, *MEMORY[0x1E4F682E0]);
    }
  }
  else
  {
    objc_msgSend(v7, "na_safeSetObject:forKey:", MEMORY[0x1E4F1CC28], v8);
  }
  id v17 = [(HUItemTableViewController *)self itemManager];
  id v18 = [v17 actionSetBuilder];
  objc_super v19 = [v18 actionSet];
  BOOL v20 = v19 == 0;

  uint64_t v21 = [NSNumber numberWithBool:v20];
  objc_msgSend(v22, "na_safeSetObject:forKey:", v21, *MEMORY[0x1E4F682E8]);

  [MEMORY[0x1E4F68EE0] sendEvent:38 withData:v22];
}

- (HUPresentationDelegate)presentationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationDelegate);

  return (HUPresentationDelegate *)WeakRetained;
}

- (void)setPresentationDelegate:(id)a3
{
}

- (BOOL)requiresPresentingViewControllerDismissal
{
  return self->_requiresPresentingViewControllerDismissal;
}

- (void)setRequiresPresentingViewControllerDismissal:(BOOL)a3
{
  self->_requiresPresentingViewControllerDismissal = a3;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_unint64_t mode = a3;
}

- (BOOL)showCancelButton
{
  return self->_showCancelButton;
}

- (void)setShowCancelButton:(BOOL)a3
{
  self->_showCancelButton = a3;
}

- (HUSceneEditorDelegate)sceneEditorDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneEditorDelegate);

  return (HUSceneEditorDelegate *)WeakRetained;
}

- (void)setSceneEditorDelegate:(id)a3
{
}

- (HUQuickControlSummaryNavigationBarTitleView)navigationBarTitleView
{
  return self->_navigationBarTitleView;
}

- (void)setNavigationBarTitleView:(id)a3
{
}

- (NSString)editingName
{
  return self->_editingName;
}

- (void)setEditingName:(id)a3
{
}

- (NSMutableDictionary)actionGridViewControllersByEditorType
{
  return self->_actionGridViewControllersByEditorType;
}

- (BOOL)hasViewEverAppeared
{
  return self->_hasViewEverAppeared;
}

- (void)setHasViewEverAppeared:(BOOL)a3
{
  self->_hasViewEverAppeared = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionGridViewControllersByEditorType, 0);
  objc_storeStrong((id *)&self->_editingName, 0);
  objc_storeStrong((id *)&self->_navigationBarTitleView, 0);
  objc_destroyWeak((id *)&self->_sceneEditorDelegate);

  objc_destroyWeak((id *)&self->_presentationDelegate);
}

@end