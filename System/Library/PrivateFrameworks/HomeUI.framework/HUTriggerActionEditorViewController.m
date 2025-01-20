@interface HUTriggerActionEditorViewController
+ (BOOL)adoptsDefaultGridLayoutMargins;
+ (id)createTriggerActionEditorViewControllerForHome:(id)a3 withTriggerActionSetBuilder:(id)a4 andTriggerActionBuilderEditorDelegate:(id)a5;
- (BOOL)shouldHideSeparatorsForCell:(id)a3 indexPath:(id)a4;
- (HFTriggerBuilder)triggerBuilder;
- (HUForwardingTriggerActionBuilderDelegate)forwardingTriggerActionBuilderDelegate;
- (HUTriggerActionEditorContentViewController)actionEditorContentViewController;
- (HUTriggerActionEditorViewController)initWithInstructionsItem:(id)a3 contentViewController:(id)a4;
- (HUTriggerActionEditorViewController)initWithTriggerBuilder:(id)a3 flow:(id)a4 delegate:(id)a5;
- (HUTriggerActionEditorViewController)initWithTriggerBuilder:(id)a3 mode:(unint64_t)a4 delegate:(id)a5;
- (HUTriggerEditorDelegate)delegate;
- (void)_informUserShortcutsAreNotSupportedInThisHome;
- (void)_showShortcutsEditor;
- (void)_showShortcutsEditorIfPossible;
- (void)homeWorkflowEditorViewController:(id)a3 didFinishWithHomeWorkflow:(id)a4 includesSecureAccessory:(BOOL)a5;
- (void)setDelegate:(id)a3;
- (void)setForwardingTriggerActionBuilderDelegate:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6;
- (void)viewDidLoad;
@end

@implementation HUTriggerActionEditorViewController

+ (id)createTriggerActionEditorViewControllerForHome:(id)a3 withTriggerActionSetBuilder:(id)a4 andTriggerActionBuilderEditorDelegate:(id)a5
{
  v7 = (void *)MEMORY[0x1E4F691A0];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [v7 sharedDispatcher];
  [v11 setOverrideHome:v10];

  v12 = (void *)MEMORY[0x1E4F693D0];
  v13 = objc_opt_new();
  v14 = [v12 createPlaceholderTriggerForHome:v10 withTriggerActionSetBuilder:v9 context:v13];

  v15 = [[HUForwardingTriggerActionBuilderDelegate alloc] initWithTriggerActionBuilderEditorDelegate:v8];
  v16 = [[HUTriggerActionFlow alloc] initWithFlowState:4];
  v17 = [[HUTriggerActionEditorViewController alloc] initWithTriggerBuilder:v14 flow:v16 delegate:0];
  [(HUTriggerActionEditorViewController *)v17 setForwardingTriggerActionBuilderDelegate:v15];
  v18 = [(HUTriggerActionEditorViewController *)v17 forwardingTriggerActionBuilderDelegate];
  if ([v18 conformsToProtocol:&unk_1F1A1B728]) {
    v19 = v18;
  }
  else {
    v19 = 0;
  }
  id v20 = v19;
  [(HUTriggerActionEditorViewController *)v17 setDelegate:v20];

  return v17;
}

- (HUTriggerActionEditorViewController)initWithInstructionsItem:(id)a3 contentViewController:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  v7 = NSStringFromSelector(sel_initWithTriggerBuilder_mode_delegate_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUTriggerActionEditorViewController.m", 81, @"%s is unavailable; use %@ instead",
    "-[HUTriggerActionEditorViewController initWithInstructionsItem:contentViewController:]",
    v7);

  return 0;
}

- (HUTriggerActionEditorViewController)initWithTriggerBuilder:(id)a3 mode:(unint64_t)a4 delegate:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [[HUTriggerActionFlow alloc] initWithEditorMode:a4];
  v11 = [(HUTriggerActionEditorViewController *)self initWithTriggerBuilder:v9 flow:v10 delegate:v8];

  return v11;
}

- (HUTriggerActionEditorViewController)initWithTriggerBuilder:(id)a3 flow:(id)a4 delegate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [HUTriggerActionEditorContentViewController alloc];
  v12 = [(HUTriggerActionEditorViewController *)self navigationItem];
  v13 = [(HUTriggerActionEditorContentViewController *)v11 initWithTriggerBuilder:v8 flow:v9 effectiveNavigationItem:v12 delegate:v10];

  int v14 = 1;
  [(HUTriggerActionEditorViewController *)self setModalInPresentation:1];
  objc_opt_class();
  id v15 = v8;
  if (objc_opt_isKindOfClass()) {
    v16 = v15;
  }
  else {
    v16 = 0;
  }
  id v17 = v16;

  if (v17)
  {
    v18 = [v17 locationInterface];
    int v19 = [v18 isCustomLocationTrigger];

    int v14 = v19 ^ 1;
  }
  id v20 = -[HUTriggerActionEditorItemManager initWithDelegate:showShortcutItem:]([HUTriggerActionEditorItemManager alloc], "initWithDelegate:showShortcutItem:", self, v14 & ~[v9 isStandalone]);
  [(HUServiceGridViewController *)v13 setContentMargins:1];
  +[HUTriggerUtilities preloadShortcutHomeManager];
  v23.receiver = self;
  v23.super_class = (Class)HUTriggerActionEditorViewController;
  v21 = [(HUInstructionsTableViewController *)&v23 initWithItemManager:v20 instructionsItem:0 contentViewController:v13];

  return v21;
}

- (void)viewDidLoad
{
  v15.receiver = self;
  v15.super_class = (Class)HUTriggerActionEditorViewController;
  [(HUInstructionsTableViewController *)&v15 viewDidLoad];
  v3 = [(HUTriggerActionEditorViewController *)self triggerBuilder];
  v4 = [v3 context];
  v5 = [v4 triggerContextAwareTitle];
  if (v5)
  {
    [(HUTriggerActionEditorViewController *)self setTitle:v5];
  }
  else
  {
    v6 = [(HUTriggerActionEditorViewController *)self triggerBuilder];
    v7 = [v6 naturalLanguageNameOfType:2];
    [(HUTriggerActionEditorViewController *)self setTitle:v7];
  }
  id v8 = [(HUTriggerActionEditorViewController *)self triggerBuilder];
  id v9 = [v8 context];
  id v10 = [v9 actionEditorInstructionsDescription];
  v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    _HULocalizedStringWithDefaultValue(@"HUTriggerActionEditorInstructionsDescription", @"HUTriggerActionEditorInstructionsDescription", 1);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  int v14 = [(HUTriggerActionEditorViewController *)self navigationItem];
  [v14 setPrompt:v13];
}

+ (BOOL)adoptsDefaultGridLayoutMargins
{
  return 1;
}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUTriggerActionEditorViewController;
  [(HUInstructionsTableViewController *)&v11 updateCell:v10 forItem:a4 indexPath:a5 animated:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v10 removeMargins];
  }
}

- (BOOL)shouldHideSeparatorsForCell:(id)a3 indexPath:(id)a4
{
  return 1;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(HUItemTableViewController *)self itemManager];
  id v10 = [v9 displayedItemAtIndexPath:v8];

  objc_opt_class();
  objc_super v11 = [(HUItemTableViewController *)self itemManager];
  if (objc_opt_isKindOfClass()) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }
  id v13 = v12;

  int v14 = [v13 addShortcutItem];

  if (v10 == v14)
  {
    [v7 deselectRowAtIndexPath:v8 animated:1];
    [(HUTriggerActionEditorViewController *)self _showShortcutsEditorIfPossible];
  }
  else if (objc_msgSend((id)+[HUTriggerActionEditorViewController superclass](HUTriggerActionEditorViewController, "superclass"), "instancesRespondToSelector:", a2))
  {
    v15.receiver = self;
    v15.super_class = (Class)HUTriggerActionEditorViewController;
    [(HUItemTableViewController *)&v15 tableView:v7 didSelectRowAtIndexPath:v8];
  }
}

- (void)_showShortcutsEditorIfPossible
{
  v3 = (void *)MEMORY[0x1E4F2EAE0];
  v4 = [(HUTriggerActionEditorViewController *)self triggerBuilder];
  v5 = [v4 home];
  LODWORD(v3) = [v3 isSupportedForHome:v5];

  if (v3)
  {
    [(HUTriggerActionEditorViewController *)self _showShortcutsEditor];
  }
  else
  {
    [(HUTriggerActionEditorViewController *)self _informUserShortcutsAreNotSupportedInThisHome];
  }
}

- (void)_informUserShortcutsAreNotSupportedInThisHome
{
  v3 = (void *)MEMORY[0x1E4F42728];
  v4 = _HULocalizedStringWithDefaultValue(@"HUAlertSoftwareUpdateRequired", @"HUAlertSoftwareUpdateRequired", 1);
  v5 = _HULocalizedStringWithDefaultValue(@"HUTriggerUnsupportedAutomationOnHomeHub", @"HUTriggerUnsupportedAutomationOnHomeHub", 1);
  id v9 = [v3 alertControllerWithTitle:v4 message:v5 preferredStyle:1];

  BOOL v6 = (void *)MEMORY[0x1E4F42720];
  id v7 = _HULocalizedStringWithDefaultValue(@"HUOkTitle", @"HUOkTitle", 1);
  id v8 = [v6 actionWithTitle:v7 style:0 handler:0];
  [v9 addAction:v8];

  [(HUTriggerActionEditorViewController *)self presentViewController:v9 animated:1 completion:0];
}

- (void)_showShortcutsEditor
{
  v3 = [(HUTriggerActionEditorViewController *)self actionEditorContentViewController];
  v4 = [v3 triggerBuilderFutureWithLatestUIChanges];

  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__HUTriggerActionEditorViewController__showShortcutsEditor__block_invoke;
  v9[3] = &unk_1E6386FB8;
  objc_copyWeak(&v10, &location);
  id v5 = (id)[v4 addFailureBlock:v9];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__HUTriggerActionEditorViewController__showShortcutsEditor__block_invoke_3;
  v7[3] = &unk_1E63874A0;
  objc_copyWeak(&v8, &location);
  id v6 = (id)[v4 addSuccessBlock:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __59__HUTriggerActionEditorViewController__showShortcutsEditor__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [MEMORY[0x1E4F69110] sharedHandler];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__HUTriggerActionEditorViewController__showShortcutsEditor__block_invoke_2;
  v6[3] = &unk_1E6386018;
  v6[4] = WeakRetained;
  [v5 handleError:v3 retryBlock:v6 cancelBlock:0];
}

uint64_t __59__HUTriggerActionEditorViewController__showShortcutsEditor__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _showShortcutsEditor];
}

void __59__HUTriggerActionEditorViewController__showShortcutsEditor__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained triggerBuilder];
  v2 = [v1 triggerActionSets];
  [v2 defaultActionsForShortcut];

  id v3 = objc_alloc(MEMORY[0x1E4FB74D0]);
  v4 = [WeakRetained triggerBuilder];
  id v5 = [v4 triggerActionSets];
  id v6 = [WeakRetained triggerBuilder];
  id v7 = [v6 home];
  id v8 = (void *)[v3 initWithHomeWorkflow:0 actionSetBuilder:v5 home:v7];

  [v8 setDelegate:WeakRetained];
  id v9 = [WeakRetained navigationController];
  [v9 pushViewController:v8 animated:1];
}

- (HUTriggerActionEditorContentViewController)actionEditorContentViewController
{
  objc_opt_class();
  id v3 = [(HUInstructionsTableViewController *)self contentViewController];
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  return (HUTriggerActionEditorContentViewController *)v5;
}

- (HFTriggerBuilder)triggerBuilder
{
  v2 = [(HUTriggerActionEditorViewController *)self actionEditorContentViewController];
  id v3 = [v2 triggerBuilder];

  return (HFTriggerBuilder *)v3;
}

- (HUTriggerEditorDelegate)delegate
{
  v2 = [(HUTriggerActionEditorViewController *)self actionEditorContentViewController];
  id v3 = [v2 delegate];

  return (HUTriggerEditorDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(HUTriggerActionEditorViewController *)self actionEditorContentViewController];
  [v5 setDelegate:v4];
}

- (HUForwardingTriggerActionBuilderDelegate)forwardingTriggerActionBuilderDelegate
{
  return self->_forwardingTriggerActionBuilderDelegate;
}

- (void)setForwardingTriggerActionBuilderDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)homeWorkflowEditorViewController:(id)a3 didFinishWithHomeWorkflow:(id)a4 includesSecureAccessory:(BOOL)a5
{
  id v6 = a4;
  id v7 = [(HUTriggerActionEditorViewController *)self triggerBuilder];
  id v8 = [v7 triggerActionSets];
  [v8 setHomeWorkflow:v6];

  id v9 = [(HUTriggerActionEditorViewController *)self actionEditorContentViewController];
  [v9 goToSummaryScreen];
}

@end