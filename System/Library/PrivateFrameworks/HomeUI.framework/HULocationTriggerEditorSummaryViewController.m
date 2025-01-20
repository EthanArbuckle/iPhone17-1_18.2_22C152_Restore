@interface HULocationTriggerEditorSummaryViewController
+ (id)defaultLocationEventBuilderForHome:(id)a3 eventType:(unint64_t)a4;
- (BOOL)shouldHideHeaderAboveSection:(int64_t)a3;
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (HFEventTriggerBuilder)triggerBuilder;
- (HULocationTriggerEditorSummaryViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4;
- (HULocationTriggerEditorSummaryViewController)initWithTriggerBuilder:(id)a3 mode:(unint64_t)a4 delegate:(id)a5;
- (HUPresenceUserPickerItemModuleController)userPickerModuleController;
- (HUTriggerConditionEditorItemModuleController)conditionEditorModuleController;
- (HUTriggerEditorDelegate)delegate;
- (id)itemModuleControllers;
- (unint64_t)mode;
- (void)_showActionEditor:(id)a3;
- (void)_showSummary:(id)a3;
- (void)conditionEditorModuleController:(id)a3 dismissDetailViewController:(id)a4;
- (void)conditionEditorModuleController:(id)a3 presentDetailViewController:(id)a4;
- (void)presenceUserPickerItemModuleController:(id)a3 presentViewController:(id)a4;
- (void)regionEditor:(id)a3 didFinishWithRegion:(id)a4;
- (void)regionEditorDidCancel:(id)a3;
- (void)resetSelectedLocationToHomeForPresenceUserPickerItemModuleController:(id)a3;
- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6;
- (void)viewDidLoad;
@end

@implementation HULocationTriggerEditorSummaryViewController

+ (id)defaultLocationEventBuilderForHome:(id)a3 eventType:(unint64_t)a4
{
  id v5 = a3;
  if (objc_msgSend(MEMORY[0x1E4F2EA28], "hf_presenceDisableReasonsForHome:", v5))
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F69258]);
    v7 = +[HULocationTriggerRegion homeRegionWithHome:v5 eventType:a4];
    v8 = [v7 defaultCircularRegionForCoordinate];
    [v6 setRegion:v8];
  }
  else
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F69408]);
    [v6 setLocationEventType:a4];
    v9 = [MEMORY[0x1E4F694F8] allUsersCollection];
    [v6 setUsers:v9];

    [v6 setActivationGranularity:0];
  }

  return v6;
}

- (HULocationTriggerEditorSummaryViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4
{
  id v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  v7 = NSStringFromSelector(sel_initWithTriggerBuilder_mode_delegate_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HULocationTriggerEditorSummaryViewController.m", 43, @"%s is unavailable; use %@ instead",
    "-[HULocationTriggerEditorSummaryViewController initWithItemManager:tableViewStyle:]",
    v7);

  return 0;
}

- (HULocationTriggerEditorSummaryViewController)initWithTriggerBuilder:(id)a3 mode:(unint64_t)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v11 = [[HULocationTriggerEditorSummaryItemManager alloc] initWithDelegate:self triggerBuilder:v9];
  v23.receiver = self;
  v23.super_class = (Class)HULocationTriggerEditorSummaryViewController;
  v12 = [(HUItemTableViewController *)&v23 initWithItemManager:v11 tableViewStyle:1];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_triggerBuilder, a3);
    v13->_mode = a4;
    objc_storeWeak((id *)&v13->_delegate, v10);
    v14 = [HUTriggerConditionEditorItemModuleController alloc];
    v15 = [(HULocationTriggerEditorSummaryItemManager *)v11 conditionEditorModule];
    uint64_t v16 = [(HUTriggerConditionEditorItemModuleController *)v14 initWithModule:v15 delegate:v13];
    conditionEditorModuleController = v13->_conditionEditorModuleController;
    v13->_conditionEditorModuleController = (HUTriggerConditionEditorItemModuleController *)v16;

    v18 = [HUPresenceUserPickerItemModuleController alloc];
    v19 = [(HULocationTriggerEditorSummaryItemManager *)v11 userPickerModule];
    uint64_t v20 = [(HUItemModuleController *)v18 initWithModule:v19];
    userPickerModuleController = v13->_userPickerModuleController;
    v13->_userPickerModuleController = (HUPresenceUserPickerItemModuleController *)v20;

    [(HUPresenceUserPickerItemModuleController *)v13->_userPickerModuleController setDelegate:v13];
  }

  return v13;
}

- (void)viewDidLoad
{
  v14.receiver = self;
  v14.super_class = (Class)HULocationTriggerEditorSummaryViewController;
  [(HUItemTableViewController *)&v14 viewDidLoad];
  v3 = _HULocalizedStringWithDefaultValue(@"HUBackButtonTitle", @"HUBackButtonTitle", 1);
  v4 = [(HULocationTriggerEditorSummaryViewController *)self navigationItem];
  [v4 setBackButtonTitle:v3];

  if (![(HULocationTriggerEditorSummaryViewController *)self mode])
  {
    id v5 = [(HULocationTriggerEditorSummaryViewController *)self triggerBuilder];
    id v6 = [v5 triggerActionSets];
    int v7 = [v6 hasActions];
    v8 = &selRef__showSummary_;
    if (!v7) {
      v8 = &selRef__showActionEditor_;
    }
    id v9 = *v8;

    id v10 = objc_alloc(MEMORY[0x1E4F427C0]);
    v11 = _HULocalizedStringWithDefaultValue(@"HUTimerTriggerEditorNextButton", @"HUTimerTriggerEditorNextButton", 1);
    v12 = (void *)[v10 initWithTitle:v11 style:2 target:self action:v9];
    v13 = [(HULocationTriggerEditorSummaryViewController *)self navigationItem];
    [v13 setRightBarButtonItem:v12];
  }
}

- (id)itemModuleControllers
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  v4 = [(HULocationTriggerEditorSummaryViewController *)self conditionEditorModuleController];
  v9[0] = v4;
  id v5 = [(HULocationTriggerEditorSummaryViewController *)self userPickerModuleController];
  v9[1] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  int v7 = [v3 setWithArray:v6];

  return v7;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v5 = a3;
  id v6 = [(HUItemTableViewController *)self itemManager];
  char v7 = [v6 isInstructionsItem:v5];

  if ((v7 & 1) != 0
    || ([(HUItemTableViewController *)self itemManager],
        v8 = objc_claimAutoreleasedReturnValue(),
        [v8 locationItem],
        id v9 = (id)objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        v9 == v5))
  {
    id v10 = objc_opt_class();
  }
  else
  {
    id v10 = 0;
  }

  return (Class)v10;
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HULocationTriggerEditorSummaryViewController;
  [(HUItemTableViewController *)&v13 setupCell:v8 forItem:v9 indexPath:a5];
  id v10 = [(HUItemTableViewController *)self itemManager];
  LODWORD(self) = [v10 isInstructionsItem:v9];

  if (self)
  {
    v11 = +[HUListContentConfigurationUtilities instructionsConfigurationForItem:v9];
    [v8 setContentConfiguration:v11];
    v12 = [MEMORY[0x1E4F427B0] clearConfiguration];
    [v8 setBackgroundConfiguration:v12];
  }
}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HULocationTriggerEditorSummaryViewController;
  id v11 = a4;
  [(HUItemTableViewController *)&v15 updateCell:v10 forItem:v11 indexPath:a5 animated:v6];
  v12 = [(HUItemTableViewController *)self itemManager];
  id v13 = [v12 locationItem];

  if (v13 == v11)
  {
    id v14 = v10;
    [v14 setHideIcon:1];
    [v14 setValueColorFollowsTintColor:1];
  }
}

- (BOOL)shouldHideHeaderAboveSection:(int64_t)a3
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v4 = [(HUItemTableViewController *)self itemManager];
  id v5 = [v4 displayedSectionIdentifierForSectionIndex:a3];

  BOOL v6 = +[HULocationTriggerEditorSummaryItemManager usersHeaderSectionID];
  v10[0] = v6;
  char v7 = +[HULocationTriggerEditorSummaryItemManager usersListSectionID];
  v10[1] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  LOBYTE(a3) = [v8 containsObject:v5];

  return a3;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)HULocationTriggerEditorSummaryViewController;
  [(HUItemTableViewController *)&v21 tableView:v6 didSelectRowAtIndexPath:v7];
  id v8 = [(HUItemTableViewController *)self itemManager];
  id v9 = [v8 displayedItemAtIndexPath:v7];

  id v10 = [(HUItemTableViewController *)self moduleControllerForItem:v9];

  if (!v10)
  {
    [v6 deselectRowAtIndexPath:v7 animated:1];
    id v11 = [(HUItemTableViewController *)self itemManager];
    v12 = [v11 locationItem];

    if (v9 == v12)
    {
      id v13 = [(HUItemTableViewController *)self itemManager];
      id v14 = [v13 locationEventRegion];

      objc_super v15 = [HULocationTriggerRegionEditorViewController alloc];
      uint64_t v16 = [(HUItemTableViewController *)self itemManager];
      v17 = [v16 home];
      v18 = [(HULocationTriggerRegionEditorViewController *)v15 initWithRegion:v14 home:v17 delegate:self];

      v19 = (void *)[objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:v18];
      [v19 setModalPresentationStyle:2];
      [v19 setModalInPresentation:1];
      id v20 = [(UIViewController *)self hu_presentPreloadableViewController:v19 animated:1];
    }
  }
}

- (void)_showActionEditor:(id)a3
{
  v4 = [HUTriggerActionPickerViewController alloc];
  id v5 = [(HULocationTriggerEditorSummaryViewController *)self triggerBuilder];
  unint64_t v6 = [(HULocationTriggerEditorSummaryViewController *)self mode];
  id v7 = [(HULocationTriggerEditorSummaryViewController *)self delegate];
  id v10 = [(HUTriggerActionPickerViewController *)v4 initWithTriggerBuilder:v5 mode:v6 delegate:v7];

  id v8 = [(HULocationTriggerEditorSummaryViewController *)self navigationController];
  id v9 = (id)objc_msgSend(v8, "hu_pushPreloadableViewController:animated:", v10, 1);
}

- (void)_showSummary:(id)a3
{
  v4 = [HUTriggerSummaryViewController alloc];
  id v5 = [(HULocationTriggerEditorSummaryViewController *)self triggerBuilder];
  unint64_t v6 = [(HULocationTriggerEditorSummaryViewController *)self mode];
  id v7 = [(HULocationTriggerEditorSummaryViewController *)self delegate];
  id v10 = [(HUTriggerSummaryViewController *)v4 initWithTriggerBuilder:v5 mode:v6 isPresentedModally:0 delegate:v7];

  id v8 = [(HULocationTriggerEditorSummaryViewController *)self navigationController];
  id v9 = (id)objc_msgSend(v8, "hu_pushPreloadableViewController:animated:", v10, 1);
}

- (void)conditionEditorModuleController:(id)a3 presentDetailViewController:(id)a4
{
  id v4 = [(UIViewController *)self hu_presentPreloadableViewController:a4 animated:1];
}

- (void)conditionEditorModuleController:(id)a3 dismissDetailViewController:(id)a4
{
}

- (void)regionEditor:(id)a3 didFinishWithRegion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  id v9 = [(HUItemTableViewController *)self itemManager];
  char v10 = [v9 canAddRegionToTriggerBuilder];

  if ((v10 & 1) == 0)
  {
    uint64_t v11 = [v6 showLocationRegionInvalidAlert];

    id v8 = (void *)v11;
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __81__HULocationTriggerEditorSummaryViewController_regionEditor_didFinishWithRegion___block_invoke;
  v14[3] = &unk_1E63859F8;
  v14[4] = self;
  id v15 = v7;
  id v12 = v7;
  id v13 = (id)[v8 addSuccessBlock:v14];
}

uint64_t __81__HULocationTriggerEditorSummaryViewController_regionEditor_didFinishWithRegion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) itemManager];
  [v2 updateLocationEventWithRegion:*(void *)(a1 + 40)];

  v3 = *(void **)(a1 + 32);

  return [v3 dismissViewControllerAnimated:1 completion:0];
}

- (void)regionEditorDidCancel:(id)a3
{
}

- (void)resetSelectedLocationToHomeForPresenceUserPickerItemModuleController:(id)a3
{
  id v4 = [(HUItemTableViewController *)self itemManager];
  id v5 = [v4 home];
  id v6 = [(HUItemTableViewController *)self itemManager];
  id v7 = [v6 locationEventRegion];
  +[HULocationTriggerRegion homeRegionWithHome:eventType:](HULocationTriggerRegion, "homeRegionWithHome:eventType:", v5, [v7 eventType]);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  id v8 = [(HUItemTableViewController *)self itemManager];
  [v8 updateLocationEventWithRegion:v9];
}

- (void)presenceUserPickerItemModuleController:(id)a3 presentViewController:(id)a4
{
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = self;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "%@: User tapped URL: %@", (uint8_t *)&v12, 0x16u);
  }

  id v9 = [MEMORY[0x1E4F69378] sharedInstance];
  id v10 = (id)[v9 openURL:v7];

  return 0;
}

- (HFEventTriggerBuilder)triggerBuilder
{
  return self->_triggerBuilder;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (HUTriggerEditorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUTriggerEditorDelegate *)WeakRetained;
}

- (HUPresenceUserPickerItemModuleController)userPickerModuleController
{
  return self->_userPickerModuleController;
}

- (HUTriggerConditionEditorItemModuleController)conditionEditorModuleController
{
  return self->_conditionEditorModuleController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conditionEditorModuleController, 0);
  objc_storeStrong((id *)&self->_userPickerModuleController, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_triggerBuilder, 0);
}

@end