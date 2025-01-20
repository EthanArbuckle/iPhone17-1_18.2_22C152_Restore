@interface HULocationEventEditorSummaryViewController
+ (id)defaultLocationEventBuilderForHome:(id)a3 eventType:(unint64_t)a4;
- (BOOL)shouldHideHeaderAboveSection:(int64_t)a3;
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (HUEventUIFlow)flow;
- (HULocationEventEditorSummaryViewController)initWithFlow:(id)a3 stepIdentifier:(id)a4;
- (HULocationEventEditorSummaryViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4;
- (HUPresenceUserPickerItemModuleController)userPickerModuleController;
- (HUTriggerConditionEditorItemModuleController)conditionEditorModuleController;
- (NSString)stepIdentifier;
- (id)buildItemModuleControllerForModule:(id)a3;
- (void)_doneButtonPressed:(id)a3;
- (void)conditionEditorModuleController:(id)a3 dismissDetailViewController:(id)a4;
- (void)conditionEditorModuleController:(id)a3 presentDetailViewController:(id)a4;
- (void)presenceUserPickerItemModuleController:(id)a3 presentViewController:(id)a4;
- (void)regionEditor:(id)a3 didFinishWithRegion:(id)a4;
- (void)regionEditorDidCancel:(id)a3;
- (void)resetSelectedLocationToHomeForPresenceUserPickerItemModuleController:(id)a3;
- (void)setFlow:(id)a3;
- (void)setStepIdentifier:(id)a3;
- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6;
- (void)viewDidLoad;
@end

@implementation HULocationEventEditorSummaryViewController

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

- (HULocationEventEditorSummaryViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4
{
  id v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  v7 = NSStringFromSelector(sel_initWithTriggerBuilder_mode_delegate_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HULocationEventEditorSummaryViewController.m", 56, @"%s is unavailable; use %@ instead",
    "-[HULocationEventEditorSummaryViewController initWithItemManager:tableViewStyle:]",
    v7);

  return 0;
}

- (HULocationEventEditorSummaryViewController)initWithFlow:(id)a3 stepIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [[HULocationEventEditorSummaryItemManager alloc] initWithDelegate:self flow:v6];
  v12.receiver = self;
  v12.super_class = (Class)HULocationEventEditorSummaryViewController;
  v9 = [(HUItemTableViewController *)&v12 initWithItemManager:v8 tableViewStyle:1];
  v10 = v9;
  if (v9)
  {
    [(HULocationEventEditorSummaryViewController *)v9 setFlow:v6];
    [(HULocationEventEditorSummaryViewController *)v10 setStepIdentifier:v7];
  }

  return v10;
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)HULocationEventEditorSummaryViewController;
  [(HUItemTableViewController *)&v10 viewDidLoad];
  v3 = [(HULocationEventEditorSummaryViewController *)self flow];
  v4 = [(HULocationEventEditorSummaryViewController *)self stepIdentifier];
  int v5 = [v3 shouldShowDoneButtonForStep:v4];

  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F427C0]);
    id v7 = _HULocalizedStringWithDefaultValue(@"HUDoneTitle", @"HUDoneTitle", 1);
    v8 = (void *)[v6 initWithTitle:v7 style:2 target:self action:sel__doneButtonPressed_];
    v9 = [(HULocationEventEditorSummaryViewController *)self navigationItem];
    [v9 setRightBarButtonItem:v8];
  }
}

- (id)buildItemModuleControllerForModule:(id)a3
{
  id v4 = a3;
  int v5 = [(HUItemTableViewController *)self itemManager];
  id v6 = [v5 userPickerModule];
  int v7 = [v4 isEqual:v6];

  if (v7)
  {
    v8 = [(HUItemModuleController *)[HUPresenceUserPickerItemModuleController alloc] initWithModule:v4];
    userPickerModuleController = self->_userPickerModuleController;
    self->_userPickerModuleController = v8;

    [(HUPresenceUserPickerItemModuleController *)self->_userPickerModuleController setDelegate:self];
    uint64_t v10 = [(HULocationEventEditorSummaryViewController *)self userPickerModuleController];
LABEL_5:
    v16 = (void *)v10;
    goto LABEL_7;
  }
  v11 = [(HUItemTableViewController *)self itemManager];
  objc_super v12 = [v11 conditionEditorModule];
  int v13 = [v4 isEqual:v12];

  if (v13)
  {
    v14 = [[HUTriggerConditionEditorItemModuleController alloc] initWithModule:v4 delegate:self];
    conditionEditorModuleController = self->_conditionEditorModuleController;
    self->_conditionEditorModuleController = v14;

    uint64_t v10 = [(HULocationEventEditorSummaryViewController *)self conditionEditorModuleController];
    goto LABEL_5;
  }
  v16 = 0;
LABEL_7:

  return v16;
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
    uint64_t v10 = objc_opt_class();
  }
  else
  {
    uint64_t v10 = 0;
  }

  return (Class)v10;
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HULocationEventEditorSummaryViewController;
  [(HUItemTableViewController *)&v13 setupCell:v8 forItem:v9 indexPath:a5];
  uint64_t v10 = [(HUItemTableViewController *)self itemManager];
  LODWORD(self) = [v10 isInstructionsItem:v9];

  if (self)
  {
    v11 = +[HUListContentConfigurationUtilities instructionsConfigurationForItem:v9];
    [v8 setContentConfiguration:v11];
    objc_super v12 = [MEMORY[0x1E4F427B0] clearConfiguration];
    [v8 setBackgroundConfiguration:v12];
  }
}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HULocationEventEditorSummaryViewController;
  id v11 = a4;
  [(HUItemTableViewController *)&v15 updateCell:v10 forItem:v11 indexPath:a5 animated:v6];
  objc_super v12 = [(HUItemTableViewController *)self itemManager];
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
  if (_MergedGlobals_4_6 != -1) {
    dispatch_once(&_MergedGlobals_4_6, &__block_literal_global_33_3);
  }
  id v5 = (id)qword_1EA12E160;
  BOOL v6 = [(HUItemTableViewController *)self itemManager];
  char v7 = [v6 displayedSectionIdentifierForSectionIndex:a3];

  LOBYTE(v6) = [v5 containsObject:v7];
  return (char)v6;
}

void __75__HULocationEventEditorSummaryViewController_shouldHideHeaderAboveSection___block_invoke_2()
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v1 = +[HULocationEventEditorSummaryItemManager usersHeaderSectionID];
  v6[0] = v1;
  v2 = +[HULocationEventEditorSummaryItemManager usersListSectionID];
  v6[1] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
  uint64_t v4 = [v0 setWithArray:v3];
  id v5 = (void *)qword_1EA12E160;
  qword_1EA12E160 = v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)HULocationEventEditorSummaryViewController;
  [(HUItemTableViewController *)&v21 tableView:v6 didSelectRowAtIndexPath:v7];
  id v8 = [(HUItemTableViewController *)self itemManager];
  id v9 = [v8 displayedItemAtIndexPath:v7];

  id v10 = [(HUItemTableViewController *)self moduleControllerForItem:v9];

  if (!v10)
  {
    [v6 deselectRowAtIndexPath:v7 animated:1];
    id v11 = [(HUItemTableViewController *)self itemManager];
    objc_super v12 = [v11 locationItem];

    if (v9 == v12)
    {
      id v13 = [(HUItemTableViewController *)self itemManager];
      id v14 = [v13 locationEventRegion];

      objc_super v15 = [HULocationTriggerRegionEditorViewController alloc];
      v16 = [(HUItemTableViewController *)self itemManager];
      v17 = [v16 home];
      v18 = [(HULocationTriggerRegionEditorViewController *)v15 initWithRegion:v14 home:v17 delegate:self];

      v19 = (void *)[objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:v18];
      [v19 setModalPresentationStyle:2];
      [v19 setModalInPresentation:1];
      id v20 = [(UIViewController *)self hu_presentPreloadableViewController:v19 animated:1];
    }
  }
}

- (void)_doneButtonPressed:(id)a3
{
  id v5 = [(HULocationEventEditorSummaryViewController *)self flow];
  uint64_t v4 = [(HULocationEventEditorSummaryViewController *)self stepIdentifier];
  [v5 viewController:self didFinishStepWithIdentifier:v4];
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
  v14[2] = __79__HULocationEventEditorSummaryViewController_regionEditor_didFinishWithRegion___block_invoke;
  v14[3] = &unk_1E63859F8;
  v14[4] = self;
  id v15 = v7;
  id v12 = v7;
  id v13 = (id)[v8 addSuccessBlock:v14];
}

uint64_t __79__HULocationEventEditorSummaryViewController_regionEditor_didFinishWithRegion___block_invoke(uint64_t a1)
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
  uint64_t v4 = [(HUItemTableViewController *)self itemManager];
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

- (void)conditionEditorModuleController:(id)a3 presentDetailViewController:(id)a4
{
  id v4 = [(UIViewController *)self hu_presentPreloadableViewController:a4 animated:1];
}

- (void)conditionEditorModuleController:(id)a3 dismissDetailViewController:(id)a4
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

- (HUEventUIFlow)flow
{
  return self->_flow;
}

- (void)setFlow:(id)a3
{
}

- (NSString)stepIdentifier
{
  return self->_stepIdentifier;
}

- (void)setStepIdentifier:(id)a3
{
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
  objc_storeStrong((id *)&self->_stepIdentifier, 0);

  objc_storeStrong((id *)&self->_flow, 0);
}

@end