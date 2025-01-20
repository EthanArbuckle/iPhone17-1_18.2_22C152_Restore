@interface HUTriggerSummaryViewController
+ (BOOL)adoptsDefaultGridLayoutMargins;
+ (id)createTriggerSummaryViewControllerForHome:(id)a3 withTriggerActionSetBuilder:(id)a4 andTriggerActionBuilderEditorDelegate:(id)a5;
- (BOOL)_canCommitTriggerBuilder;
- (BOOL)detailEditorChangedTrigger;
- (BOOL)isEditingExistingTrigger;
- (BOOL)shouldHideSeparatorsForCell:(id)a3 indexPath:(id)a4;
- (BOOL)shouldManageTextFieldForItem:(id)a3;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (BOOL)viewHasAppeared;
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (HFTriggerBuilder)triggerBuilder;
- (HUForwardingTriggerActionBuilderDelegate)forwardingTriggerActionBuilderDelegate;
- (HUTriggerActionFlow)flow;
- (HUTriggerActionSetsModuleController)actionSetsModuleController;
- (HUTriggerConditionEditorItemModuleController)conditionEditorModuleController;
- (HUTriggerEditorDelegate)delegate;
- (HUTriggerSummaryViewController)initWithTriggerBuilder:(id)a3 flow:(id)a4 delegate:(id)a5;
- (HUTriggerSummaryViewController)initWithTriggerBuilder:(id)a3 mode:(unint64_t)a4 isPresentedModally:(BOOL)a5 delegate:(id)a6;
- (NSSet)prioritizedAccessories;
- (NSString)editingName;
- (NSString)savedName;
- (id)_commitTriggerBuilder;
- (id)buildItemModuleControllerForModule:(id)a3;
- (id)childViewControllersToPreload;
- (id)commitChanges;
- (id)contentConfigurationForFooterViewAtSectionIndex:(unint64_t)a3;
- (id)contentConfigurationForHeaderViewAtSectionIndex:(unint64_t)a3;
- (id)defaultTextForTextField:(id)a3 item:(id)a4;
- (id)itemTableHeaderMessage;
- (id)placeholderTextForTextField:(id)a3 item:(id)a4;
- (unint64_t)automaticDisablingReasonsForItem:(id)a3;
- (void)_addAction:(id)a3;
- (void)_cancel:(id)a3;
- (void)_cancelShortcutEditor:(id)a3;
- (void)_deleteTrigger:(id)a3 indexPath:(id)a4;
- (void)_done:(id)a3;
- (void)_removeActionsInServiceActionItem:(id)a3;
- (void)_sendNameAssignedEvent:(id)a3 error:(id)a4;
- (void)_setTriggerEnabled:(BOOL)a3;
- (void)_showEditorForTriggerBuilderItem:(id)a3;
- (void)_showShortcutEditorForTriggerBuilderItem:(id)a3;
- (void)_testTrigger;
- (void)_updateDurationModuleDynamicFooterView;
- (void)_updateTableHeaderConfiguration;
- (void)_updateTriggerBuilderName;
- (void)actionSetsModuleController:(id)a3 didUpdateTriggerBuilder:(id)a4;
- (void)conditionEditorModuleController:(id)a3 dismissDetailViewController:(id)a4;
- (void)conditionEditorModuleController:(id)a3 presentDetailViewController:(id)a4;
- (void)diffableDataItemManager:(id)a3 didUpdateItems:(id)a4 addItems:(id)a5 removeItems:(id)a6;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)durationModuleController:(id)a3 requestsScrollToItem:(id)a4;
- (void)eventsModuleController:(id)a3 pushViewController:(id)a4;
- (void)eventsModuleControllerDidUpdateTriggerBuilder:(id)a3;
- (void)home:(id)a3 didRemoveTrigger:(id)a4;
- (void)homeWorkflowEditorViewController:(id)a3 didFinishWithHomeWorkflow:(id)a4 includesSecureAccessory:(BOOL)a5;
- (void)itemManager:(id)a3 didUpdateResultsForItem:(id)a4 atIndexPath:(id)a5;
- (void)itemManagerDidUpdate:(id)a3;
- (void)mediaModuleController:(id)a3 pushViewController:(id)a4;
- (void)serviceGridViewController:(id)a3 didTapItem:(id)a4;
- (void)setActionSetsModuleController:(id)a3;
- (void)setConditionEditorModuleController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDetailEditorChangedTrigger:(BOOL)a3;
- (void)setEditingName:(id)a3;
- (void)setFlow:(id)a3;
- (void)setForwardingTriggerActionBuilderDelegate:(id)a3;
- (void)setIsEditingExistingTrigger:(BOOL)a3;
- (void)setPrioritizedAccessories:(id)a3;
- (void)setTriggerBuilder:(id)a3;
- (void)setViewHasAppeared:(BOOL)a3;
- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5;
- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)textDidChange:(id)a3 forTextField:(id)a4 item:(id)a5;
- (void)textFieldDidFinishEditing:(id)a3;
- (void)triggerEditor:(id)a3 didFinishWithTriggerBuilder:(id)a4;
- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation HUTriggerSummaryViewController

+ (id)createTriggerSummaryViewControllerForHome:(id)a3 withTriggerActionSetBuilder:(id)a4 andTriggerActionBuilderEditorDelegate:(id)a5
{
  v7 = (void *)MEMORY[0x1E4F691A0];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [v7 sharedDispatcher];
  [v11 setOverrideHome:v10];

  id v12 = objc_alloc(MEMORY[0x1E4F696B8]);
  v13 = [v9 allActionSets];

  v14 = (void *)[v12 initWithActionSets:v13 inHome:v10 filterEmptyActionSets:1];
  v15 = (void *)MEMORY[0x1E4F693D0];
  v16 = objc_opt_new();
  v17 = [v15 createPlaceholderTriggerForHome:v10 withTriggerActionSetBuilder:v14 context:v16];

  v18 = [[HUForwardingTriggerActionBuilderDelegate alloc] initWithTriggerActionBuilderEditorDelegate:v8];
  v19 = [[HUTriggerActionFlow alloc] initWithFlowState:7];
  v20 = [[HUTriggerSummaryViewController alloc] initWithTriggerBuilder:v17 flow:v19 delegate:0];
  [(HUTriggerSummaryViewController *)v20 setForwardingTriggerActionBuilderDelegate:v18];
  v21 = [(HUTriggerSummaryViewController *)v20 forwardingTriggerActionBuilderDelegate];
  if ([v21 conformsToProtocol:&unk_1F1A1B728]) {
    v22 = v21;
  }
  else {
    v22 = 0;
  }
  id v23 = v22;
  [(HUTriggerSummaryViewController *)v20 setDelegate:v23];

  return v20;
}

- (HUTriggerSummaryViewController)initWithTriggerBuilder:(id)a3 mode:(unint64_t)a4 isPresentedModally:(BOOL)a5 delegate:(id)a6
{
  BOOL v6 = a5;
  id v9 = a6;
  id v10 = a3;
  v11 = [HUTriggerActionFlow alloc];
  if (v6) {
    uint64_t v12 = 3;
  }
  else {
    uint64_t v12 = 1;
  }
  v13 = [(HUTriggerActionFlow *)v11 initWithFlowState:v12];
  v14 = [(HUTriggerSummaryViewController *)self initWithTriggerBuilder:v10 flow:v13 delegate:v9];

  return v14;
}

- (HUTriggerSummaryViewController)initWithTriggerBuilder:(id)a3 flow:(id)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([MEMORY[0x1E4F69138] isShortcuts])
  {
    uint64_t v12 = [MEMORY[0x1E4F691A0] sharedDispatcher];
    v13 = [v9 home];
    [v12 setOverrideHome:v13];
  }
  v14 = [[HUTriggerSummaryItemManager alloc] initWithTriggerBuilder:v9 flow:v10 delegate:self];
  v35.receiver = self;
  v35.super_class = (Class)HUTriggerSummaryViewController;
  v15 = [(HUItemTableViewController *)&v35 initWithItemManager:v14 tableViewStyle:1];
  v16 = v15;
  if (v15)
  {
    [(HUTriggerSummaryViewController *)v15 setTriggerBuilder:v9];
    [(HUTriggerSummaryViewController *)v16 setDelegate:v11];
    [(HUTriggerSummaryViewController *)v16 setFlow:v10];
    v17 = [v9 name];

    if (!v17)
    {
      v18 = [v9 naturalLanguageNameOfType:0];
      [v9 setName:v18];

      v19 = [v9 name];

      if (!v19)
      {
        v34 = [MEMORY[0x1E4F28B00] currentHandler];
        [v34 handleFailureInMethod:a2, v16, @"HUTriggerSummaryViewController.m", 117, @"Could not generate name for triggerBuilder: %@", v9 object file lineNumber description];
      }
    }
    v20 = _HULocalizedStringWithDefaultValue(@"HUBackButtonTitle", @"HUBackButtonTitle", 1);
    v21 = [(HUTriggerSummaryViewController *)v16 navigationItem];
    [v21 setBackButtonTitle:v20];

    if ([v10 isSingleFlow])
    {
      v22 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:1 target:v16 action:sel__cancel_];
      id v23 = [(HUTriggerSummaryViewController *)v16 navigationItem];
      [v23 setLeftBarButtonItem:v22];
    }
    if ([v10 isLastState])
    {
      v24 = [v9 context];
      v25 = [v24 doneButtonTitle];

      id v26 = objc_alloc(MEMORY[0x1E4F427C0]);
      v27 = v26;
      if (v25)
      {
        v28 = [v9 context];
        v29 = [v28 doneButtonTitle];
        v30 = (void *)[v27 initWithTitle:v29 style:2 target:v16 action:sel__done_];
      }
      else
      {
        v30 = (void *)[v26 initWithBarButtonSystemItem:0 target:v16 action:sel__done_];
      }
      v31 = [(HUTriggerSummaryViewController *)v16 navigationItem];
      [v31 setRightBarButtonItem:v30];
    }
    [(HUTriggerSummaryViewController *)v16 setModalInPresentation:1];
    -[HUTriggerSummaryViewController setIsEditingExistingTrigger:](v16, "setIsEditingExistingTrigger:", [v10 flowState] == 3);
    +[HUTriggerUtilities preloadShortcutHomeManager];
    v32 = [MEMORY[0x1E4F691A0] sharedDispatcher];
    [v32 addHomeObserver:v16];
  }
  return v16;
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
  v3 = [v2 triggerBuilder];
  id v4 = [v3 name];

  return (NSString *)v4;
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HUTriggerSummaryViewController;
  [(HUItemTableViewController *)&v7 viewWillAppear:a3];
  [(HUTriggerSummaryViewController *)self setViewHasAppeared:1];
  id v4 = [(HUItemTableViewController *)self itemManager];
  id v5 = [v4 triggerCurrentDisplayedName];
  [(HUTriggerSummaryViewController *)self setTitle:v5];

  if ([(HUTriggerSummaryViewController *)self detailEditorChangedTrigger])
  {
    [(HUTriggerSummaryViewController *)self setDetailEditorChangedTrigger:0];
    BOOL v6 = [(HUItemTableViewController *)self itemManager];
    [v6 triggerBuilderDidChange];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(HUTriggerSummaryViewController *)self flow];
  uint64_t v6 = [v5 flowState];

  if (v6 == 5)
  {
    objc_super v7 = [(HUTriggerSummaryViewController *)self triggerBuilder];
    id v8 = [v7 triggerActionSets];
    [v8 setHomeWorkflow:0];
  }
  v9.receiver = self;
  v9.super_class = (Class)HUTriggerSummaryViewController;
  [(HUItemTableViewController *)&v9 viewWillDisappear:v3];
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)HUTriggerSummaryViewController;
  [(HUTriggerSummaryViewController *)&v6 dismissViewControllerAnimated:a3 completion:a4];
  id v5 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  [v5 removeHomeObserver:self];
}

- (id)commitChanges
{
  BOOL v3 = [(HUTriggerSummaryViewController *)self view];
  [v3 endEditing:1];

  id v4 = [(HUTriggerSummaryViewController *)self triggerBuilder];
  id v5 = [v4 triggerActionSets];
  [v5 convertToHomeWorkflowActionSetIfNeeded];

  if ([(HUTriggerSummaryViewController *)self _canCommitTriggerBuilder])
  {
    objc_super v6 = [(HUTriggerSummaryViewController *)self triggerBuilder];
    objc_super v7 = [v6 context];
    char v8 = [v7 showTriggerEnableSwitch];

    if ((v8 & 1) == 0)
    {
      objc_super v9 = [(HUTriggerSummaryViewController *)self triggerBuilder];
      [v9 setEnabled:1];
    }
    id v10 = [(HUTriggerSummaryViewController *)self _commitTriggerBuilder];
  }
  else
  {
    id v11 = [(HUTriggerSummaryViewController *)self delegate];
    uint64_t v12 = [(HUTriggerSummaryViewController *)self triggerBuilder];
    [v11 triggerEditor:self didFinishWithTriggerBuilder:v12];

    id v10 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }

  return v10;
}

- (void)_done:(id)a3
{
  id v3 = [(HUTriggerSummaryViewController *)self commitChanges];
}

- (void)_cancel:(id)a3
{
  id v4 = [(HUTriggerSummaryViewController *)self delegate];
  [v4 triggerEditor:self didFinishWithTriggerBuilder:0];
}

- (void)_showShortcutEditorForTriggerBuilderItem:(id)a3
{
  uint64_t v5 = [a3 triggerBuilder];
  id v16 = (id)v5;
  if (a3)
  {
    if (v5) {
      goto LABEL_3;
    }
  }
  else
  {
    NSLog(&cfstr_NilParameter.isa);
    if (v16) {
      goto LABEL_3;
    }
  }
  NSLog(&cfstr_NoTriggerBuild.isa);
LABEL_3:
  objc_super v6 = [(HUTriggerSummaryViewController *)self triggerBuilder];
  objc_super v7 = [v6 triggerActionSets];
  char v8 = [v7 homeWorkflow];

  id v9 = objc_alloc(MEMORY[0x1E4FB74D0]);
  id v10 = [(HUTriggerSummaryViewController *)self triggerBuilder];
  id v11 = [v10 home];
  uint64_t v12 = (void *)[v9 initWithHomeWorkflow:v8 actionSetBuilder:0 home:v11];

  [v12 setDelegate:self];
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:v12];
  [v13 setModalInPresentation:1];
  [v13 setModalPresentationStyle:2];
  v14 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:1 target:self action:sel__cancelShortcutEditor_];
  v15 = [v12 navigationItem];
  [v15 setLeftBarButtonItem:v14];

  [(HUTriggerSummaryViewController *)self presentViewController:v13 animated:1 completion:0];
}

- (void)_cancelShortcutEditor:(id)a3
{
}

- (void)_testTrigger
{
  id v3 = [(HUItemTableViewController *)self itemManager];
  id v4 = [v3 home];
  uint64_t v5 = objc_msgSend(v4, "hf_characteristicValueManager");

  objc_super v6 = [(HUTriggerSummaryViewController *)self triggerBuilder];
  objc_super v7 = [v6 triggerActionSets];
  char v8 = [v7 allActionBuilders];

  id v9 = objc_msgSend(v8, "na_map:", &__block_literal_global_40);
  id v10 = [MEMORY[0x1E4F7A0D8] combineAllFutures:v9];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __46__HUTriggerSummaryViewController__testTrigger__block_invoke_2;
  v16[3] = &unk_1E63873E0;
  id v17 = v8;
  id v18 = v5;
  id v11 = v5;
  id v12 = v8;
  v13 = [v10 addSuccessBlock:v16];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __46__HUTriggerSummaryViewController__testTrigger__block_invoke_5;
  v15[3] = &unk_1E6386708;
  v15[4] = self;
  id v14 = (id)[v13 addFailureBlock:v15];
}

uint64_t __46__HUTriggerSummaryViewController__testTrigger__block_invoke(uint64_t a1, void *a2)
{
  return [a2 performValidation];
}

void __46__HUTriggerSummaryViewController__testTrigger__block_invoke_2(uint64_t a1)
{
  v2 = objc_msgSend(*(id *)(a1 + 32), "na_map:", &__block_literal_global_292);
  objc_msgSend(v2, "na_filter:", &__block_literal_global_295);
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  if ([v6 count])
  {
    [*(id *)(a1 + 40) beginTransactionWithReason:@"HUTriggerSummaryTransactionReasonTestTrigger"];
    id v3 = *(void **)(a1 + 40);
    id v4 = [MEMORY[0x1E4F1CAD0] setWithArray:v6];
    id v5 = (id)[v3 executeActions:v4];

    [*(id *)(a1 + 40) commitTransactionWithReason:@"HUTriggerSummaryTransactionReasonTestTrigger"];
  }
}

uint64_t __46__HUTriggerSummaryViewController__testTrigger__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 createNewAction];
}

BOOL __46__HUTriggerSummaryViewController__testTrigger__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return a2 != 0;
}

void __46__HUTriggerSummaryViewController__testTrigger__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F69110];
  id v4 = a2;
  id v9 = [v3 sharedHandler];
  uint64_t v5 = *MEMORY[0x1E4F68828];
  id v6 = [*(id *)(a1 + 32) triggerBuilder];
  objc_super v7 = [v6 displayName];
  char v8 = objc_msgSend(v4, "hf_errorWithOperationType:failedItemName:", v5, v7);

  [v9 handleError:v8];
}

- (void)_addAction:(id)a3
{
  id v4 = [(HUItemTableViewController *)self itemManager];
  uint64_t v5 = [v4 currentFlow];
  +[HUTriggerActionFlow selectFlowForState:](HUTriggerActionFlow, "selectFlowForState:", [v5 flowState]);
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  id v6 = [HUTriggerActionPickerViewController alloc];
  objc_super v7 = [(HUTriggerSummaryViewController *)self triggerBuilder];
  char v8 = [(HUTriggerActionPickerViewController *)v6 initWithTriggerBuilder:v7 flow:v11 delegate:self];

  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:v8];
  [v9 setModalPresentationStyle:2];
  id v10 = [(UIViewController *)self hu_presentPreloadableViewController:v9 animated:1];
}

- (void)_deleteTrigger:(id)a3 indexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [(HUTriggerSummaryViewController *)self triggerBuilder];
  id v9 = [v8 trigger];

  if (v9)
  {
    id v10 = [(HUTriggerSummaryViewController *)self triggerBuilder];
    id v11 = [v10 context];

    id v12 = [v11 deleteConfirmationAlertTitle];
    v13 = [v11 deleteConfirmationAlertMessage];
    id v14 = [(UITableViewController *)self hu_actionSheetWithTitle:v12 message:v13 indexPath:v7];

    objc_initWeak(&location, self);
    v15 = (void *)MEMORY[0x1E4F42720];
    id v16 = [v11 deleteInstructionDescription];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __59__HUTriggerSummaryViewController__deleteTrigger_indexPath___block_invoke;
    v21[3] = &unk_1E6387430;
    objc_copyWeak(&v23, &location);
    id v22 = v9;
    id v17 = [v15 actionWithTitle:v16 style:2 handler:v21];
    [v14 addAction:v17];

    id v18 = (void *)MEMORY[0x1E4F42720];
    v19 = _HULocalizedStringWithDefaultValue(@"HUTriggerSummaryDeleteTriggerCancelButtonTitle", @"HUTriggerSummaryDeleteTriggerCancelButtonTitle", 1);
    v20 = [v18 actionWithTitle:v19 style:1 handler:&__block_literal_global_314];
    [v14 addAction:v20];

    [(HUTriggerSummaryViewController *)self presentViewController:v14 animated:1 completion:0];
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
  else
  {
    NSLog(&cfstr_NoTriggerToDel.isa);
  }
}

void __59__HUTriggerSummaryViewController__deleteTrigger_indexPath___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained triggerBuilder];
  id v4 = [v3 deleteTrigger];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__HUTriggerSummaryViewController__deleteTrigger_indexPath___block_invoke_2;
  v6[3] = &unk_1E6384CE0;
  v6[4] = WeakRetained;
  id v7 = *(id *)(a1 + 32);
  id v5 = (id)[v4 addCompletionBlock:v6];
}

void __59__HUTriggerSummaryViewController__deleteTrigger_indexPath___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  [v2 triggerEditor:*(void *)(a1 + 32) didFinishWithTriggerBuilder:0];

  id v3 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__HUTriggerSummaryViewController__deleteTrigger_indexPath___block_invoke_3;
  v5[3] = &unk_1E6387408;
  id v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v3 dispatchHomeObserverMessage:v5 sender:0];
}

void __59__HUTriggerSummaryViewController__deleteTrigger_indexPath___block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = [*(id *)(a1 + 32) itemManager];
    id v4 = [v3 home];
    [v5 home:v4 didRemoveTrigger:*(void *)(a1 + 40)];
  }
}

- (void)_setTriggerEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(HUTriggerSummaryViewController *)self triggerBuilder];
  [v5 setEnabled:v3];

  id v6 = [(HUItemTableViewController *)self itemManager];
  [v6 triggerBuilderDidChange];
}

- (void)_removeActionsInServiceActionItem:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 actionBuilders];
  id v6 = (void *)[v5 mutableCopy];

  id v7 = [v4 actions];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __68__HUTriggerSummaryViewController__removeActionsInServiceActionItem___block_invoke;
  v21[3] = &unk_1E6387478;
  void v21[4] = self;
  char v8 = objc_msgSend(v7, "na_map:", v21);
  [v6 unionSet:v8];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * v13);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v15 = [(HUTriggerSummaryViewController *)self triggerBuilder];
          id v16 = [v15 triggerActionSets];
          [v16 removeAnonymousActionBuilder:v14];
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v11);
  }
}

id __68__HUTriggerSummaryViewController__removeActionsInServiceActionItem___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) triggerBuilder];
  id v5 = [v4 triggerActionSets];
  id v6 = [v5 anonymousActionSetBuilder];
  id v7 = [v6 actions];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__HUTriggerSummaryViewController__removeActionsInServiceActionItem___block_invoke_2;
  v11[3] = &unk_1E6387188;
  id v12 = v3;
  id v8 = v3;
  id v9 = objc_msgSend(v7, "na_firstObjectPassingTest:", v11);

  return v9;
}

uint64_t __68__HUTriggerSummaryViewController__removeActionsInServiceActionItem___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 action];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

+ (BOOL)adoptsDefaultGridLayoutMargins
{
  return 0;
}

- (id)itemTableHeaderMessage
{
  v2 = [(HUItemTableViewController *)self itemManager];
  id v3 = [v2 sourceItem];
  uint64_t v4 = [v3 latestResults];
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F689A0]];

  id v6 = HUPriorityMessageDefaultAttributedStringAttributes();
  id v7 = [v5 stringWithAttributes:v6];

  return v7;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v5 = a3;
  id v6 = [(HUItemTableViewController *)self itemManager];
  id v7 = [v6 enableItem];
  char v8 = [v5 isEqual:v7];

  if (v8) {
    goto LABEL_10;
  }
  id v9 = [(HUItemTableViewController *)self itemManager];
  uint64_t v10 = [v9 testTriggerItem];
  uint64_t v11 = v5;
  if ((id)v10 == v5)
  {
LABEL_9:

    goto LABEL_10;
  }
  id v12 = (void *)v10;
  uint64_t v13 = [(HUItemTableViewController *)self itemManager];
  uint64_t v14 = [v13 createActionButtonItem];
  if ((id)v14 == v5)
  {

    uint64_t v11 = v12;
    goto LABEL_9;
  }
  v15 = (void *)v14;
  id v16 = [(HUItemTableViewController *)self itemManager];
  id v17 = [v16 deleteTriggerItem];

  if (v17 != v5)
  {
    long long v18 = [(HUItemTableViewController *)self itemManager];
    long long v19 = [v18 durationModule];
    id v20 = [v19 durationSummaryItem];

    if (v20 != v5)
    {
      v21 = [(HUItemTableViewController *)self itemManager];
      id v22 = [v21 durationModule];
      id v23 = [v22 durationPickerItem];

      if (v23 != v5)
      {
        v24 = [(HUItemTableViewController *)self itemManager];
        [v24 namingRowItem];
      }
    }
  }
LABEL_10:
  v25 = (objc_class *)(id)objc_opt_class();

  return v25;
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v15 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v15 setDelegate:self];
    goto LABEL_11;
  }
  char v8 = [(HUItemTableViewController *)self itemManager];
  id v9 = [v8 namingRowItem];
  int v10 = [v7 isEqual:v9];

  if (v10)
  {
    objc_opt_class();
    id v11 = v15;
    if (objc_opt_isKindOfClass()) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }
    id v13 = v12;

    [v13 setDelegate:self];
    [v13 setDisabled:0];
    uint64_t v14 = [v13 textField];

    [v14 setClearButtonMode:3];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_11;
    }
    uint64_t v14 = [v15 textLabel];
    [v14 setNumberOfLines:0];
  }

LABEL_11:
}

- (unint64_t)automaticDisablingReasonsForItem:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HUTriggerSummaryViewController;
  id v3 = a3;
  id v4 = [(HUItemTableViewController *)&v7 automaticDisablingReasonsForItem:v3];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    return 2;
  }
  else {
    return (unint64_t)v4;
  }
}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  v36.receiver = self;
  v36.super_class = (Class)HUTriggerSummaryViewController;
  [(HUItemTableViewController *)&v36 updateCell:v10 forItem:v11 indexPath:a5 animated:v6];
  id v12 = [(HUItemTableViewController *)self itemManager];
  id v13 = [v12 unsupportedItemProvider];
  uint64_t v14 = [v13 items];
  int v15 = [v14 containsObject:v11];

  if (v15)
  {
    id v16 = v10;
    [v16 setAccessoryType:0];
    id v17 = objc_msgSend(MEMORY[0x1E4F42A80], "hu_exclamationMarkImage");
    [v16 setDescriptionIcon:v17];

    [v16 setHideDescriptionIcon:0];
    [v16 setHideIcon:0];
    [v16 setIconForegroundColorFollowsTintColor:1];
    [v16 setIconDisplayStyle:3];
    [v16 setDisabled:1];
LABEL_3:

    goto LABEL_4;
  }
  long long v18 = [(HUItemTableViewController *)self itemManager];
  long long v19 = [v18 enableItem];
  int v20 = [v11 isEqual:v19];

  if (v20)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      NSLog(&cfstr_WrongCellClass.isa);
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v21 = v10;
      [v21 setDelegate:self];
      id v16 = [v11 latestResults];
      id v22 = [v16 objectForKeyedSubscript:*MEMORY[0x1E4F68BC0]];
      objc_msgSend(v21, "setOn:", objc_msgSend(v22, "integerValue") == 2);

      goto LABEL_3;
    }
  }
  else
  {
    id v23 = [(HUItemTableViewController *)self itemManager];
    v24 = [v23 deleteTriggerItem];
    int v25 = [v11 isEqual:v24];

    if (!v25)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v16 = v10;
        [v16 setAccessoryType:0];
        [v16 setIconForegroundColorFollowsTintColor:0];
        [v16 setIconForegroundColor:0];
        [v16 setIconTintColorFollowsDisabledState:1];
      }
      else
      {
        id v26 = [(HUItemTableViewController *)self itemManager];
        id v27 = [v26 namingRowItem];

        if (v27 != v11) {
          goto LABEL_4;
        }
        id v16 = v10;
        [v16 setHideIconButton:1];
        v28 = [v16 textField];
        [v28 setClearButtonMode:3];

        v29 = [v11 latestResults];
        uint64_t v30 = [v29 objectForKeyedSubscript:*MEMORY[0x1E4F68AC8]];
        v31 = [v16 textField];
        [v31 setPlaceholder:v30];

        v32 = [v16 textField];
        LOBYTE(v30) = [v32 isFirstResponder];

        if ((v30 & 1) == 0)
        {
          v33 = [v11 latestResults];
          v34 = [v33 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
          objc_super v35 = [v16 textField];
          [v35 setText:v34];
        }
      }
      goto LABEL_3;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      NSLog(&cfstr_WrongCellClass.isa);
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v10 setDestructive:1];
    }
  }
LABEL_4:
}

- (id)buildItemModuleControllerForModule:(id)a3
{
  id v4 = a3;
  id v5 = [(HUItemTableViewController *)self itemManager];
  BOOL v6 = [v5 eventsModule];
  int v7 = [v4 isEqual:v6];

  if (v7)
  {
    char v8 = [[HUTriggerEventsModuleController alloc] initWithModule:v4];
    [(HUTriggerEventsModuleController *)v8 setDelegate:self];
    [(HUTriggerEventsModuleController *)v8 setAllowsEditingEvents:[(HUTriggerSummaryViewController *)self isEditingExistingTrigger]];
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = HUTriggerDurationModuleController;
LABEL_9:
    char v8 = (HUTriggerEventsModuleController *)[[v9 alloc] initWithModule:v4];
    [(HUTriggerEventsModuleController *)v8 setDelegate:self];
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v8 = [(HUItemModuleController *)[HUTriggerActionSetsModuleController alloc] initWithModule:v4];
    [(HUTriggerEventsModuleController *)v8 setDelegate:self];
    [(HUTriggerSummaryViewController *)self setActionSetsModuleController:v8];
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = HUTriggerMediaModuleController;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v8 = [[HUTriggerConditionEditorItemModuleController alloc] initWithModule:v4 delegate:self];
    [(HUTriggerSummaryViewController *)self setConditionEditorModuleController:v8];
  }
  else
  {
    char v8 = 0;
  }
LABEL_10:

  return v8;
}

- (BOOL)shouldHideSeparatorsForCell:(id)a3 indexPath:(id)a4
{
  id v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HUTriggerSummaryViewController;
  unsigned __int8 v7 = [(HUItemTableViewController *)&v14 shouldHideSeparatorsForCell:a3 indexPath:v6];
  if (v7)
  {
    BOOL v8 = 0;
  }
  else
  {
    uint64_t v9 = [v6 section];
    id v10 = [(HUItemTableViewController *)self itemManager];
    if (v9 == [v10 actionSetsSection])
    {
      BOOL v8 = 1;
    }
    else
    {
      uint64_t v11 = [v6 section];
      id v12 = [(HUItemTableViewController *)self itemManager];
      BOOL v8 = v11 == [v12 serviceActionsSection];
    }
  }

  return v7 | v8;
}

- (id)childViewControllersToPreload
{
  v2 = [(HUTriggerSummaryViewController *)self actionSetsModuleController];
  id v3 = [v2 childViewControllersToPreload];

  return v3;
}

- (void)itemManagerDidUpdate:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HUTriggerSummaryViewController;
  [(HUItemTableViewController *)&v4 itemManagerDidUpdate:a3];
  [(HUTriggerSummaryViewController *)self _updateTableHeaderConfiguration];
}

- (void)itemManager:(id)a3 didUpdateResultsForItem:(id)a4 atIndexPath:(id)a5
{
  v13.receiver = self;
  v13.super_class = (Class)HUTriggerSummaryViewController;
  id v8 = a4;
  [(HUItemTableViewController *)&v13 itemManager:a3 didUpdateResultsForItem:v8 atIndexPath:a5];
  uint64_t v9 = [(HUItemTableViewController *)self itemManager];
  id v10 = [v9 durationModule];
  uint64_t v11 = [v10 durationSummaryItem];
  int v12 = [v8 isEqual:v11];

  if (v12) {
    [(HUTriggerSummaryViewController *)self _updateDurationModuleDynamicFooterView];
  }
}

- (void)diffableDataItemManager:(id)a3 didUpdateItems:(id)a4 addItems:(id)a5 removeItems:(id)a6
{
  v15.receiver = self;
  v15.super_class = (Class)HUTriggerSummaryViewController;
  id v10 = a4;
  [(HUItemTableViewController *)&v15 diffableDataItemManager:a3 didUpdateItems:v10 addItems:a5 removeItems:a6];
  uint64_t v11 = [(HUItemTableViewController *)self itemManager];
  int v12 = [v11 durationModule];
  objc_super v13 = [v12 durationSummaryItem];
  int v14 = [v10 containsObject:v13];

  if (v14) {
    [(HUTriggerSummaryViewController *)self _updateDurationModuleDynamicFooterView];
  }
}

- (void)_updateDurationModuleDynamicFooterView
{
  id v3 = [(HUItemTableViewController *)self itemManager];
  uint64_t v4 = [v3 sectionIndexForDisplayedSectionIdentifier:@"HUTriggerDurationItemModuleSection"];

  id v5 = [(HUTriggerSummaryViewController *)self tableView];
  id v11 = [v5 footerViewForSection:v4];

  id v6 = [(HUItemTableViewController *)self itemManager];
  unsigned __int8 v7 = [v6 footerTitleForSection:v4];

  objc_opt_class();
  id v8 = [v11 contentConfiguration];
  if (objc_opt_isKindOfClass()) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  id v10 = v9;

  [v10 setText:v7];
  [v11 setContentConfiguration:v10];
}

- (BOOL)shouldManageTextFieldForItem:(id)a3
{
  return 1;
}

- (id)defaultTextForTextField:(id)a3 item:(id)a4
{
  uint64_t v4 = [(HUItemTableViewController *)self itemManager];
  id v5 = [v4 namingRowItem];
  id v6 = [v5 latestResults];
  unsigned __int8 v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  return v7;
}

- (id)placeholderTextForTextField:(id)a3 item:(id)a4
{
  uint64_t v4 = [(HUItemTableViewController *)self itemManager];
  id v5 = [v4 namingRowItem];
  id v6 = [v5 latestResults];
  unsigned __int8 v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F68AC8]];

  return v7;
}

- (void)textDidChange:(id)a3 forTextField:(id)a4 item:(id)a5
{
  -[HUTriggerSummaryViewController setEditingName:](self, "setEditingName:", a3, a4, a5);
  id v9 = [(HUTriggerSummaryViewController *)self editingName];
  if ([v9 length])
  {
    id v6 = [(HUTriggerSummaryViewController *)self editingName];
    [(HUTriggerSummaryViewController *)self setTitle:v6];
  }
  else
  {
    id v6 = [(HUItemTableViewController *)self itemManager];
    unsigned __int8 v7 = [v6 triggerBuilder];
    id v8 = [v7 displayName];
    [(HUTriggerSummaryViewController *)self setTitle:v8];
  }
}

- (id)contentConfigurationForHeaderViewAtSectionIndex:(unint64_t)a3
{
  uint64_t v4 = [(HUItemTableViewController *)self itemManager];
  id v5 = [v4 itemSectionForSectionIndex:a3];

  id v6 = [v5 headerTitle];

  if (v6)
  {
    id v6 = [MEMORY[0x1E4F42B58] prominentInsetGroupedHeaderConfiguration];
    unsigned __int8 v7 = [v5 headerTitle];
    [v6 setText:v7];

    id v8 = [v5 headerSecondaryText];
    [v6 setSecondaryText:v8];

    [v6 directionalLayoutMargins];
    objc_msgSend(v6, "setDirectionalLayoutMargins:");
  }

  return v6;
}

- (id)contentConfigurationForFooterViewAtSectionIndex:(unint64_t)a3
{
  uint64_t v4 = [(HUItemTableViewController *)self itemManager];
  id v5 = [v4 footerTitleForSection:a3];

  if (v5)
  {
    id v6 = [MEMORY[0x1E4F42B58] groupedFooterConfiguration];
    [v6 setText:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  v22.receiver = self;
  v22.super_class = (Class)HUTriggerSummaryViewController;
  id v6 = a4;
  BOOL v7 = [(HUItemTableViewController *)&v22 tableView:a3 shouldHighlightRowAtIndexPath:v6];
  id v8 = [(HUItemTableViewController *)self itemManager];
  id v9 = [v8 displayedItemAtIndexPath:v6];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v7 = [(HUTriggerSummaryViewController *)self isEditingExistingTrigger];
    goto LABEL_12;
  }
  id v10 = [(HUItemTableViewController *)self itemManager];
  uint64_t v11 = [v10 testTriggerItem];
  if (v9 == (void *)v11)
  {

LABEL_10:
    goto LABEL_11;
  }
  int v12 = (void *)v11;
  objc_super v13 = [(HUItemTableViewController *)self itemManager];
  uint64_t v14 = [v13 createActionButtonItem];
  if (v9 == (void *)v14)
  {

    goto LABEL_10;
  }
  objc_super v15 = (void *)v14;
  id v16 = [(HUItemTableViewController *)self itemManager];
  id v17 = [v16 deleteTriggerItem];

  if (v9 == v17)
  {
LABEL_11:
    BOOL v7 = 1;
    goto LABEL_12;
  }
  long long v18 = [(HUItemTableViewController *)self itemManager];
  long long v19 = [v18 mediaModule];
  int v20 = [v19 mediaRowItem];

  if (v9 == v20) {
    BOOL v7 = 1;
  }
LABEL_12:

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HUTriggerSummaryViewController;
  id v7 = a3;
  [(HUItemTableViewController *)&v16 tableView:v7 didSelectRowAtIndexPath:v6];
  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1, v16.receiver, v16.super_class);

  id v8 = [(HUItemTableViewController *)self itemManager];
  id v9 = [v8 displayedItemAtIndexPath:v6];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [(HUTriggerSummaryViewController *)self isEditingExistingTrigger])
  {
    [(HUTriggerSummaryViewController *)self _showShortcutEditorForTriggerBuilderItem:v9];
  }
  else
  {
    id v10 = [(HUItemTableViewController *)self itemManager];
    uint64_t v11 = [v10 testTriggerItem];

    if (v9 == v11)
    {
      [(HUTriggerSummaryViewController *)self _testTrigger];
    }
    else
    {
      int v12 = [(HUItemTableViewController *)self itemManager];
      objc_super v13 = [v12 createActionButtonItem];

      if (v9 == v13)
      {
        [(HUTriggerSummaryViewController *)self _addAction:0];
      }
      else
      {
        uint64_t v14 = [(HUItemTableViewController *)self itemManager];
        objc_super v15 = [v14 deleteTriggerItem];

        if (v9 == v15) {
          [(HUTriggerSummaryViewController *)self _deleteTrigger:v9 indexPath:v6];
        }
      }
    }
  }
}

- (void)triggerEditor:(id)a3 didFinishWithTriggerBuilder:(id)a4
{
  id v5 = [(HUTriggerSummaryViewController *)self triggerBuilder];
  int v6 = [v5 isShortcutOwned];

  if (v6)
  {
    id v11 = [(HUTriggerSummaryViewController *)self view];
    id v7 = [v11 window];
    id v8 = [v7 rootViewController];
    [v8 dismissViewControllerAnimated:1 completion:0];
  }
  else
  {
    id v9 = [(HUTriggerSummaryViewController *)self actionSetsModuleController];
    [v9 reloadActions];

    id v10 = [(HUItemTableViewController *)self itemManager];
    [v10 triggerBuilderDidChange];

    [(HUTriggerSummaryViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(HUTriggerSummaryViewController *)self tableView];
  id v16 = [v7 indexPathForCell:v6];

  id v8 = [(HUItemTableViewController *)self itemManager];
  id v9 = [v8 displayedItemAtIndexPath:v16];

  id v10 = [(HUItemTableViewController *)self itemManager];
  id v11 = [v10 enableItem];
  int v12 = [v9 isEqual:v11];

  if (v12) {
    [(HUTriggerSummaryViewController *)self _setTriggerEnabled:v4];
  }
  objc_super v13 = (void *)MEMORY[0x1E4F68EE0];
  uint64_t v14 = [v9 latestResults];
  objc_super v15 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F68AC0]];
  [v13 sendSwitchCellToggleEventForItem:v9 isOn:v4 title:v15 fromSourceViewController:self];
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = HFLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412546;
    uint64_t v14 = self;
    __int16 v15 = 2112;
    id v16 = v8;
    _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "%@: User tapped URL: %@", (uint8_t *)&v13, 0x16u);
  }

  if (!a6)
  {
    id v10 = [MEMORY[0x1E4F69378] sharedInstance];
    id v11 = (id)[v10 openURL:v8];
  }
  return 0;
}

- (void)actionSetsModuleController:(id)a3 didUpdateTriggerBuilder:(id)a4
{
  id v4 = [(HUItemTableViewController *)self itemManager];
  [v4 triggerBuilderDidChange];
}

- (void)durationModuleController:(id)a3 requestsScrollToItem:(id)a4
{
  id v5 = a4;
  id v6 = [(HUItemTableViewController *)self itemManager];
  id v8 = [v6 indexPathForItem:v5];

  if (v8)
  {
    id v7 = [(HUTriggerSummaryViewController *)self tableView];
    [v7 scrollToRowAtIndexPath:v8 atScrollPosition:3 animated:1];
  }
  else
  {
    NSLog(&cfstr_CouldNotFindIn_0.isa);
  }
}

- (void)eventsModuleController:(id)a3 pushViewController:(id)a4
{
  id v7 = a4;
  id v5 = [(HUTriggerSummaryViewController *)self navigationController];
  id v6 = (id)objc_msgSend(v5, "hu_pushPreloadableViewController:animated:", v7, 1);
}

- (void)eventsModuleControllerDidUpdateTriggerBuilder:(id)a3
{
  id v3 = [(HUItemTableViewController *)self itemManager];
  [v3 triggerBuilderDidChange];
}

- (void)_showEditorForTriggerBuilderItem:(id)a3
{
  id v28 = a3;
  objc_opt_class();
  id v4 = [(HUTriggerSummaryViewController *)self triggerBuilder];
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  id v7 = [v28 triggerBuilder];
  if (v28)
  {
    if (v7) {
      goto LABEL_6;
    }
  }
  else
  {
    NSLog(&cfstr_NilParameter.isa);
    if (v7) {
      goto LABEL_6;
    }
  }
  NSLog(&cfstr_NoTriggerBuild.isa);
LABEL_6:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [HUTimerTriggerEditorViewController alloc];
    id v9 = [(HUTriggerSummaryViewController *)self delegate];
    id v10 = [(HUTimerTriggerEditorViewController *)v8 initWithTimerTriggerBuilder:v7 mode:1 delegate:v9];
    goto LABEL_23;
  }
  if (!v6) {
    goto LABEL_25;
  }
  objc_opt_class();
  id v11 = [v6 eventBuilders];
  int v12 = [v11 firstObject];
  if (objc_opt_isKindOfClass()) {
    int v13 = v12;
  }
  else {
    int v13 = 0;
  }
  id v9 = v13;

  uint64_t v14 = [v6 eventBuilders];
  __int16 v15 = [v14 firstObject];
  if ([v15 conformsToProtocol:&unk_1F1AD9210]) {
    id v16 = v15;
  }
  else {
    id v16 = 0;
  }
  id v17 = v16;

  if (v9)
  {
    id v18 = objc_alloc(MEMORY[0x1E4F69020]);
    long long v19 = [MEMORY[0x1E4F1CAD0] setWithObject:v9];
    int v20 = (void *)[v18 initWithEventBuilders:v19];

    id v21 = [HUCharacteristicTriggerEventViewController alloc];
    objc_super v22 = [(HUTriggerSummaryViewController *)self delegate];
    id v23 = [(HUCharacteristicTriggerEventViewController *)v21 initWithCharacteristicEventBuilderItem:v20 triggerBuilder:v6 mode:1 delegate:v22];
  }
  else
  {
    if (!v17)
    {
      id v10 = 0;
      goto LABEL_22;
    }
    id v24 = objc_alloc(MEMORY[0x1E4F69248]);
    int v25 = [MEMORY[0x1E4F1CAD0] setWithObject:v17];
    int v20 = (void *)[v24 initWithEventBuilders:v25];

    objc_super v22 = [[HUEventUIFlow alloc] initWithTriggerBuilder:v6 eventBuilderItem:v20];
    id v23 = [[HULocationEventEditorSummaryViewController alloc] initWithFlow:v22 stepIdentifier:@"locationEventEditor"];
  }
  id v10 = (HUTimerTriggerEditorViewController *)v23;

LABEL_22:
LABEL_23:

  if (v10)
  {
    id v26 = [(HUTriggerSummaryViewController *)self navigationController];
    id v27 = (id)objc_msgSend(v26, "hu_pushPreloadableViewController:animated:", v10, 1);

    [(HUTriggerSummaryViewController *)self setDetailEditorChangedTrigger:1];
    goto LABEL_26;
  }
LABEL_25:
  NSLog(&cfstr_CouldNotCreate.isa, v28);
LABEL_26:
}

- (void)conditionEditorModuleController:(id)a3 presentDetailViewController:(id)a4
{
  id v4 = [(UIViewController *)self hu_presentPreloadableViewController:a4 animated:1];
}

- (void)conditionEditorModuleController:(id)a3 dismissDetailViewController:(id)a4
{
}

- (void)mediaModuleController:(id)a3 pushViewController:(id)a4
{
  id v7 = a4;
  id v5 = [(HUTriggerSummaryViewController *)self navigationController];
  id v6 = (id)objc_msgSend(v5, "hu_pushPreloadableViewController:animated:", v7, 1);
}

- (void)serviceGridViewController:(id)a3 didTapItem:(id)a4
{
  id v18 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    id v6 = v18;
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
    id v8 = v7;

    id v9 = [v8 containingItem];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v11 = [(HUItemTableViewController *)self itemManager];
      int v12 = (void *)MEMORY[0x1E4F1CAD0];
      int v13 = [(HUItemTableViewController *)self itemManager];
      uint64_t v14 = [v13 mediaModule];
      __int16 v15 = [v14 mediaRowItem];
      id v16 = [v12 setWithObject:v15];
      id v17 = (id)[v11 updateResultsForItems:v16 senderSelector:a2];
    }
  }
}

- (void)textFieldDidFinishEditing:(id)a3
{
  id v5 = [a3 text];
  [(HUTriggerSummaryViewController *)self setEditingName:v5];

  [(HUTriggerSummaryViewController *)self _updateTriggerBuilderName];
  id v6 = [(HUItemTableViewController *)self itemManager];
  id v7 = (void *)MEMORY[0x1E4F1CAD0];
  id v8 = [(HUItemTableViewController *)self itemManager];
  id v9 = [v8 sourceItem];
  id v10 = objc_msgSend(v7, "setWithObjects:", v9, 0);
  id v11 = (id)[v6 updateResultsForItems:v10 senderSelector:a2];

  [(HUTriggerSummaryViewController *)self setEditingName:0];
}

- (void)home:(id)a3 didRemoveTrigger:(id)a4
{
  id v5 = a4;
  id v6 = [(HUTriggerSummaryViewController *)self triggerBuilder];
  id v7 = [v6 trigger];
  id v8 = [v7 uniqueIdentifier];
  id v9 = [v5 uniqueIdentifier];

  if (v8 == v9)
  {
    id v10 = [(HUTriggerSummaryViewController *)self delegate];
    [v10 triggerEditor:self didFinishWithTriggerBuilder:0];
  }
}

- (void)_updateTriggerBuilderName
{
  id v4 = (void *)MEMORY[0x1E4F69758];
  id v5 = [(HUTriggerSummaryViewController *)self editingName];
  id v6 = [v4 sanitizeUserEnteredHomeKitName:v5];
  [(HUTriggerSummaryViewController *)self setEditingName:v6];

  uint64_t v7 = [(HUTriggerSummaryViewController *)self editingName];
  if (v7
    && (id v8 = (void *)v7,
        [(HUTriggerSummaryViewController *)self editingName],
        id v9 = objc_claimAutoreleasedReturnValue(),
        uint64_t v10 = [v9 length],
        v9,
        v8,
        v10))
  {
    id v11 = [(HUTriggerSummaryViewController *)self editingName];
    int v12 = (void *)[v11 copy];
    int v13 = [(HUItemTableViewController *)self itemManager];
    uint64_t v14 = [v13 triggerBuilder];
    [v14 setName:v12];

    __int16 v15 = [(HUItemTableViewController *)self itemManager];
    id v16 = [v15 triggerBuilder];
    [v16 setNameIsConfigured:1];

    id v17 = [(HUItemTableViewController *)self itemManager];
    id v18 = (void *)MEMORY[0x1E4F1CAD0];
    long long v19 = [(HUItemTableViewController *)self itemManager];
    int v20 = [v19 namingRowItem];
    id v21 = [v18 setWithObject:v20];
    id v22 = (id)[v17 updateResultsForItems:v21 senderSelector:a2];
  }
  else
  {
    id v23 = [(HUItemTableViewController *)self itemManager];
    id v24 = [v23 triggerBuilder];
    [v24 setNameIsConfigured:0];

    id v17 = [(HUItemTableViewController *)self itemManager];
    [v17 triggerBuilderDidChange];
  }

  id v26 = [(HUItemTableViewController *)self itemManager];
  int v25 = [v26 triggerCurrentDisplayedName];
  [(HUTriggerSummaryViewController *)self setTitle:v25];
}

- (void)_updateTableHeaderConfiguration
{
  objc_opt_class();
  id v3 = [(HUItemTableViewController *)self itemTableHeaderView];
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v13 = v4;

  if (v13)
  {
    id v5 = [v13 messageTextView];
    [v5 setDelegate:self];

    id v6 = [(HUItemTableViewController *)self itemManager];
    uint64_t v7 = [v6 allDisplayedItems];
    id v8 = [(HUItemTableViewController *)self itemManager];
    id v9 = [v8 enableItem];
    uint64_t v10 = [v7 containsObject:v9];

    [v13 setIncludeBottomSpacing:v10];
    id v11 = [(HUTriggerSummaryViewController *)self tableView];
    [v11 setNeedsLayout];

    int v12 = [(HUTriggerSummaryViewController *)self tableView];
    [v12 layoutIfNeeded];
  }
}

- (BOOL)_canCommitTriggerBuilder
{
  id v3 = [(HUTriggerSummaryViewController *)self triggerBuilder];
  id v4 = [v3 home];
  int v5 = objc_msgSend(v4, "hf_currentUserIsAdministrator");

  if (!v5) {
    return 0;
  }
  id v6 = [(HUTriggerSummaryViewController *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) == 0) {
    return 1;
  }
  id v8 = [(HUTriggerSummaryViewController *)self delegate];
  id v9 = [(HUTriggerSummaryViewController *)self triggerBuilder];
  char v10 = [v8 triggerEditor:self shouldCommitTriggerBuilder:v9];

  return v10;
}

- (id)_commitTriggerBuilder
{
  id v3 = [(HUTriggerSummaryViewController *)self navigationItem];
  id v4 = [v3 rightBarButtonItem];

  int v5 = (void *)[objc_alloc(MEMORY[0x1E4F42708]) initWithActivityIndicatorStyle:100];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithCustomView:v5];
  char v7 = [(HUTriggerSummaryViewController *)self navigationItem];
  [v7 setRightBarButtonItem:v6];

  [v5 startAnimating];
  id v8 = [(HUTriggerSummaryViewController *)self triggerBuilder];
  id v9 = [v8 commitItem];

  objc_initWeak(&location, self);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __55__HUTriggerSummaryViewController__commitTriggerBuilder__block_invoke;
  v19[3] = &unk_1E6386150;
  objc_copyWeak(&v21, &location);
  id v10 = v4;
  id v20 = v10;
  id v11 = (id)[v9 addCompletionBlock:v19];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __55__HUTriggerSummaryViewController__commitTriggerBuilder__block_invoke_2;
  v17[3] = &unk_1E6386FB8;
  objc_copyWeak(&v18, &location);
  id v12 = (id)[v9 addFailureBlock:v17];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __55__HUTriggerSummaryViewController__commitTriggerBuilder__block_invoke_4;
  v15[3] = &unk_1E63874A0;
  objc_copyWeak(&v16, &location);
  id v13 = (id)[v9 addSuccessBlock:v15];
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

  return v9;
}

void __55__HUTriggerSummaryViewController__commitTriggerBuilder__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v13 = a3;
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  char v7 = [WeakRetained delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [WeakRetained delegate];
    id v10 = [WeakRetained triggerBuilder];
    [v9 triggerEditor:WeakRetained didCommitTriggerBuilder:v10 withError:v13];
  }
  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = [WeakRetained navigationItem];
  [v12 setRightBarButtonItem:v11];

  [WeakRetained _sendNameAssignedEvent:v5 error:v13];
}

void __55__HUTriggerSummaryViewController__commitTriggerBuilder__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [MEMORY[0x1E4F69110] sharedHandler];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__HUTriggerSummaryViewController__commitTriggerBuilder__block_invoke_3;
  v6[3] = &unk_1E6386018;
  v6[4] = WeakRetained;
  [v5 handleError:v3 retryBlock:v6 cancelBlock:0];
}

uint64_t __55__HUTriggerSummaryViewController__commitTriggerBuilder__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _done:0];
}

void __55__HUTriggerSummaryViewController__commitTriggerBuilder__block_invoke_4(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = (objc_class *)objc_opt_class();
    id v4 = NSStringFromClass(v3);
    id v5 = [WeakRetained delegate];
    int v16 = 138412546;
    id v17 = v4;
    __int16 v18 = 2112;
    long long v19 = v5;
    _os_log_impl(&dword_1BE345000, v2, OS_LOG_TYPE_DEFAULT, "%@ succeeded commiting! Delegate is %@", (uint8_t *)&v16, 0x16u);
  }
  uint64_t v6 = [WeakRetained delegate];
  if (v6
    && (char v7 = (void *)v6,
        [WeakRetained delegate],
        char v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = objc_opt_respondsToSelector(),
        v8,
        v7,
        (v9 & 1) != 0))
  {
    id v10 = [WeakRetained delegate];
    uint64_t v11 = [WeakRetained triggerBuilder];
    [v10 triggerEditor:WeakRetained didFinishWithTriggerBuilder:v11];
  }
  else
  {
    id v12 = HFLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = (objc_class *)objc_opt_class();
      uint64_t v14 = NSStringFromClass(v13);
      __int16 v15 = [WeakRetained delegate];
      int v16 = 138412546;
      id v17 = v14;
      __int16 v18 = 2112;
      long long v19 = v15;
      _os_log_impl(&dword_1BE345000, v12, OS_LOG_TYPE_DEFAULT, "%@: %@ didn't respond to didFinishWithTriggerBuilder so automatically dismissing", (uint8_t *)&v16, 0x16u);
    }
    [WeakRetained dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)_sendNameAssignedEvent:(id)a3 error:(id)a4
{
  id v13 = a4;
  uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
  char v7 = [NSNumber numberWithBool:a3 != 0];
  [v6 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F68138]];

  if (v13)
  {
    char v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v13, "code"));
    [v6 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F68140]];
  }
  else
  {
    [v6 setObject:0 forKeyedSubscript:*MEMORY[0x1E4F68140]];
  }
  char v9 = objc_msgSend(NSNumber, "numberWithBool:", -[HUTriggerSummaryViewController isEditingExistingTrigger](self, "isEditingExistingTrigger"));
  [v6 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F68148]];

  id v10 = NSNumber;
  uint64_t v11 = [(HUTriggerSummaryViewController *)self triggerBuilder];
  id v12 = objc_msgSend(v10, "numberWithBool:", objc_msgSend(v11, "nameIsConfigured"));
  [v6 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F68150]];

  [MEMORY[0x1E4F68EE0] sendEvent:24 withData:v6];
}

- (void)homeWorkflowEditorViewController:(id)a3 didFinishWithHomeWorkflow:(id)a4 includesSecureAccessory:(BOOL)a5
{
  id v6 = a4;
  char v7 = [(HUTriggerSummaryViewController *)self triggerBuilder];
  char v8 = [v7 triggerActionSets];
  [v8 convertToHomeWorkflowActionSet:v6];

  char v9 = [(HUItemTableViewController *)self itemManager];
  [v9 triggerBuilderDidChange];

  [(HUTriggerSummaryViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (HFTriggerBuilder)triggerBuilder
{
  return self->_triggerBuilder;
}

- (void)setTriggerBuilder:(id)a3
{
}

- (HUTriggerEditorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUTriggerEditorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)viewHasAppeared
{
  return self->_viewHasAppeared;
}

- (void)setViewHasAppeared:(BOOL)a3
{
  self->_viewHasAppeared = a3;
}

- (HUForwardingTriggerActionBuilderDelegate)forwardingTriggerActionBuilderDelegate
{
  return self->_forwardingTriggerActionBuilderDelegate;
}

- (void)setForwardingTriggerActionBuilderDelegate:(id)a3
{
}

- (BOOL)isEditingExistingTrigger
{
  return self->_isEditingExistingTrigger;
}

- (void)setIsEditingExistingTrigger:(BOOL)a3
{
  self->_isEditingExistingTrigger = a3;
}

- (NSString)editingName
{
  return self->_editingName;
}

- (void)setEditingName:(id)a3
{
}

- (HUTriggerActionFlow)flow
{
  return self->_flow;
}

- (void)setFlow:(id)a3
{
}

- (BOOL)detailEditorChangedTrigger
{
  return self->_detailEditorChangedTrigger;
}

- (void)setDetailEditorChangedTrigger:(BOOL)a3
{
  self->_detailEditorChangedTrigger = a3;
}

- (HUTriggerActionSetsModuleController)actionSetsModuleController
{
  return self->_actionSetsModuleController;
}

- (void)setActionSetsModuleController:(id)a3
{
}

- (HUTriggerConditionEditorItemModuleController)conditionEditorModuleController
{
  return self->_conditionEditorModuleController;
}

- (void)setConditionEditorModuleController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conditionEditorModuleController, 0);
  objc_storeStrong((id *)&self->_actionSetsModuleController, 0);
  objc_storeStrong((id *)&self->_flow, 0);
  objc_storeStrong((id *)&self->_editingName, 0);
  objc_storeStrong((id *)&self->_forwardingTriggerActionBuilderDelegate, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_triggerBuilder, 0);
}

@end