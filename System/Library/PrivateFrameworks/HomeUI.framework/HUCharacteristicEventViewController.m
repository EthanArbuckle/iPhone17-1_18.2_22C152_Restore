@interface HUCharacteristicEventViewController
- (BOOL)_canContinue;
- (BOOL)automaticallyUpdatesViewControllerTitle;
- (BOOL)pickerViewCell:(id)a3 canSelectValueAtIndex:(int64_t)a4;
- (BOOL)shouldHideFooterBelowSection:(int64_t)a3;
- (BOOL)shouldHideHeaderAboveSection:(int64_t)a3;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (HFCharacteristicEventBuilderItem)eventBuilderItem;
- (HFEventTriggerBuilder)triggerBuilder;
- (HUCharacteristicEventOptionItem)selectedEventOptionItem;
- (HUCharacteristicEventViewController)initWithEventBuilderItem:(id)a3 triggerBuilder:(id)a4;
- (HUCharacteristicEventViewController)initWithFlow:(id)a3 stepIdentifier:(id)a4;
- (HUEventUIFlow)flow;
- (HUTriggerConditionEditorItemModuleController)conditionModuleController;
- (NSString)stepIdentifier;
- (id)_commitTriggerBuilder;
- (id)itemModuleControllers;
- (id)pickerViewCell:(id)a3 attributedTitleForValueAtIndex:(int64_t)a4;
- (int64_t)numberOfValuesForPickerViewCell:(id)a3;
- (void)_doneButtonPressed:(id)a3;
- (void)_nextButtonPressed:(id)a3;
- (void)_updateTriggerBuilder;
- (void)_updateVisibleCellCheckmarks;
- (void)_validateNextButton;
- (void)conditionEditorModuleController:(id)a3 dismissDetailViewController:(id)a4;
- (void)conditionEditorModuleController:(id)a3 presentDetailViewController:(id)a4;
- (void)itemManagerDidUpdate:(id)a3;
- (void)pickerViewCell:(id)a3 didSelectValueAtIndex:(int64_t)a4;
- (void)setEventBuilderItem:(id)a3;
- (void)setFlow:(id)a3;
- (void)setSelectedEventOptionItem:(id)a3;
- (void)setStepIdentifier:(id)a3;
- (void)setTriggerBuilder:(id)a3;
- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation HUCharacteristicEventViewController

- (HUCharacteristicEventViewController)initWithEventBuilderItem:(id)a3 triggerBuilder:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [[HUCharacteristicEventItemManager alloc] initWithTriggerBuilder:v7 eventBuilderItem:v6 delegate:self];
  v18.receiver = self;
  v18.super_class = (Class)HUCharacteristicEventViewController;
  v9 = [(HUItemTableViewController *)&v18 initWithItemManager:v8 tableViewStyle:1];
  if (v9)
  {
    if ((_os_feature_enabled_impl() & 1) == 0)
    {
      v10 = [HUTriggerConditionEditorItemModuleController alloc];
      v11 = [(HUCharacteristicEventItemManager *)v8 conditionModule];
      uint64_t v12 = [(HUTriggerConditionEditorItemModuleController *)v10 initWithModule:v11 delegate:v9];
      conditionModuleController = v9->_conditionModuleController;
      v9->_conditionModuleController = (HUTriggerConditionEditorItemModuleController *)v12;
    }
    [(HUCharacteristicEventViewController *)v9 setEventBuilderItem:v6];
    [(HUCharacteristicEventViewController *)v9 setTriggerBuilder:v7];
    v14 = _HULocalizedStringWithDefaultValue(@"HUCharacteristicEventOptionTitle", @"HUCharacteristicEventOptionTitle", 1);
    [(HUCharacteristicEventViewController *)v9 setTitle:v14];

    v15 = _HULocalizedStringWithDefaultValue(@"HUBackButtonTitle", @"HUBackButtonTitle", 1);
    v16 = [(HUCharacteristicEventViewController *)v9 navigationItem];
    [v16 setBackButtonTitle:v15];
  }
  return v9;
}

- (HUCharacteristicEventViewController)initWithFlow:(id)a3 stepIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 eventBuilderItem];
  v9 = [v6 triggerBuilder];
  v10 = [(HUCharacteristicEventViewController *)self initWithEventBuilderItem:v8 triggerBuilder:v9];

  if (v10)
  {
    [(HUCharacteristicEventViewController *)v10 setFlow:v6];
    [(HUCharacteristicEventViewController *)v10 setStepIdentifier:v7];
  }

  return v10;
}

- (void)setSelectedEventOptionItem:(id)a3
{
  id v6 = a3;
  if (([v6 isEqual:self->_selectedEventOptionItem] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_selectedEventOptionItem, a3);
    v5 = [(HUItemTableViewController *)self itemManager];
    [v5 setActiveOptionItem:v6];
  }
}

- (id)itemModuleControllers
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v3 = [(HUCharacteristicEventViewController *)self conditionModuleController];
  v4 = objc_msgSend(v2, "na_setWithSafeObject:", v3);

  return v4;
}

- (void)viewDidLoad
{
  v14.receiver = self;
  v14.super_class = (Class)HUCharacteristicEventViewController;
  [(HUItemTableViewController *)&v14 viewDidLoad];
  v3 = [(HUCharacteristicEventViewController *)self flow];
  v4 = [(HUCharacteristicEventViewController *)self stepIdentifier];
  int v5 = [v3 shouldShowDoneButtonForStep:v4];

  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F427C0]);
    id v7 = _HULocalizedStringWithDefaultValue(@"HUDoneTitle", @"HUDoneTitle", 1);
    v8 = sel__doneButtonPressed_;
LABEL_5:
    uint64_t v12 = (void *)[v6 initWithTitle:v7 style:2 target:self action:v8];
    v13 = [(HUCharacteristicEventViewController *)self navigationItem];
    [v13 setRightBarButtonItem:v12];

    goto LABEL_6;
  }
  v9 = [(HUCharacteristicEventViewController *)self flow];
  v10 = [(HUCharacteristicEventViewController *)self stepIdentifier];
  int v11 = [v9 shouldShowNextButtonForStep:v10];

  if (v11)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F427C0]);
    id v7 = _HULocalizedStringWithDefaultValue(@"HUTimerTriggerEditorNextButton", @"HUTimerTriggerEditorNextButton", 1);
    v8 = sel__nextButtonPressed_;
    goto LABEL_5;
  }
LABEL_6:
  [(HUCharacteristicEventViewController *)self _validateNextButton];
}

- (void)viewWillAppear:(BOOL)a3
{
  v22.receiver = self;
  v22.super_class = (Class)HUCharacteristicEventViewController;
  [(HUItemTableViewController *)&v22 viewWillAppear:a3];
  int v5 = [(HUCharacteristicEventViewController *)self eventBuilderItem];
  id v6 = [(HUCharacteristicEventViewController *)self triggerBuilder];
  id v7 = [v6 home];
  v8 = +[HUCharacteristicEventItemManager serviceVendorItemForEventBuilderItem:v5 inHome:v7];

  v9 = [v8 services];
  v10 = [(HUItemTableViewController *)self itemManager];
  int v11 = [v10 serviceVendingItem];
  uint64_t v12 = [v11 services];
  char v13 = [v9 isEqual:v12];

  if ((v13 & 1) == 0)
  {
    objc_super v14 = [(HUItemTableViewController *)self itemManager];
    [v14 setServiceVendingItem:v8];

    v15 = [(HUItemTableViewController *)self itemManager];
    [v15 resetItemProvidersAndModules];

    v16 = [(HUItemTableViewController *)self itemManager];
    id v17 = (id)[v16 reloadAndUpdateAllItemsFromSenderSelector:a2];

    [(HUCharacteristicEventViewController *)self setSelectedEventOptionItem:0];
  }
  objc_super v18 = [(HUCharacteristicEventViewController *)self selectedEventOptionItem];

  if (!v18)
  {
    v19 = [(HUItemTableViewController *)self itemManager];
    v20 = [v19 allDisplayedItems];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __54__HUCharacteristicEventViewController_viewWillAppear___block_invoke;
    v21[3] = &unk_1E63889F8;
    v21[4] = self;
    objc_msgSend(v20, "na_each:", v21);
  }
}

void __54__HUCharacteristicEventViewController_viewWillAppear___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    int v5 = v4;
  }
  else {
    int v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    id v7 = [v6 triggerValue];
    if (v7)
    {
    }
    else
    {
      v8 = [v6 triggerValueRange];

      if (!v8)
      {
        int v11 = [v6 thresholdValueRange];

        if (!v11) {
          goto LABEL_10;
        }
        uint64_t v16 = 0;
        id v17 = &v16;
        uint64_t v18 = 0x3032000000;
        v19 = __Block_byref_object_copy__33;
        v20 = __Block_byref_object_dispose__33;
        id v21 = 0;
        uint64_t v12 = [*(id *)(a1 + 32) eventBuilderItem];
        char v13 = [v12 eventBuilders];
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __54__HUCharacteristicEventViewController_viewWillAppear___block_invoke_25;
        v15[3] = &unk_1E6390C58;
        v15[4] = &v16;
        int v14 = objc_msgSend(v13, "na_any:", v15);

        if (!v14)
        {
          _Block_object_dispose(&v16, 8);

          goto LABEL_10;
        }
        [v6 setThresholdValue:v17[5]];
        _Block_object_dispose(&v16, 8);

        goto LABEL_9;
      }
    }
    v9 = [v6 characteristics];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __54__HUCharacteristicEventViewController_viewWillAppear___block_invoke_2;
    v22[3] = &unk_1E638DF28;
    v22[4] = *(void *)(a1 + 32);
    id v23 = v6;
    char v10 = objc_msgSend(v9, "na_any:", v22);

    if (v10)
    {
LABEL_9:
      [*(id *)(a1 + 32) setSelectedEventOptionItem:v6];
      [*(id *)(a1 + 32) _validateNextButton];
    }
  }
LABEL_10:
}

uint64_t __54__HUCharacteristicEventViewController_viewWillAppear___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  int v5 = [v3 eventBuilderItem];
  id v6 = [*(id *)(a1 + 40) representativeTriggerValue];
  uint64_t v7 = [v5 wouldFireForCharacteristic:v4 value:v6];

  return v7;
}

BOOL __54__HUCharacteristicEventViewController_viewWillAppear___block_invoke_25(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    int v5 = v4;
  }
  else {
    int v5 = 0;
  }
  id v6 = v5;

  uint64_t v7 = [v4 characteristic];
  v8 = [v6 thresholdRange];
  uint64_t v9 = objc_msgSend(v7, "hf_thresholdValueForRange:", v8);
  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
  int v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  BOOL v12 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) != 0;
  return v12;
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HUCharacteristicEventViewController;
  [(HUItemTableViewController *)&v4 viewWillDisappear:a3];
  [(HUCharacteristicEventViewController *)self _updateTriggerBuilder];
}

- (void)_nextButtonPressed:(id)a3
{
  id v5 = [(HUCharacteristicEventViewController *)self flow];
  objc_super v4 = [(HUCharacteristicEventViewController *)self stepIdentifier];
  [v5 viewController:self didFinishStepWithIdentifier:v4];
}

- (void)_doneButtonPressed:(id)a3
{
  id v5 = [(HUCharacteristicEventViewController *)self flow];
  objc_super v4 = [(HUCharacteristicEventViewController *)self stepIdentifier];
  [v5 viewController:self didFinishStepWithIdentifier:v4];
}

- (BOOL)automaticallyUpdatesViewControllerTitle
{
  return 0;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_6;
  }
  id v6 = [(HUItemTableViewController *)self itemManager];
  uint64_t v7 = [v6 serviceNameItem];
  int v8 = [v5 isEqual:v7];

  if (v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
LABEL_6:
    int v11 = objc_opt_class();
  }
  else
  {
    id v9 = v5;
    uint64_t v10 = [v9 childItem];
    if (v10)
    {
      int v11 = objc_opt_class();
    }
    else
    {
      int v14 = [v9 thresholdValueRange];
      int v11 = objc_opt_class();
    }
  }
  BOOL v12 = v11;

  return v12;
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(HUItemTableViewController *)self itemManager];
  int v11 = [v10 serviceNameItem];
  int v12 = [v9 isEqual:v11];

  if (!v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_44;
    }
    objc_opt_class();
    id v23 = v9;
    if (objc_opt_isKindOfClass()) {
      v24 = v23;
    }
    else {
      v24 = 0;
    }
    id v25 = v24;

    v26 = [v25 childItem];
    if (v26)
    {

      goto LABEL_19;
    }
    v33 = [v25 thresholdValueRange];

    if (!v33)
    {
LABEL_19:
      uint64_t v27 = objc_opt_class();
      id v28 = v8;
      if (v28)
      {
        if (objc_opt_isKindOfClass()) {
          v29 = v28;
        }
        else {
          v29 = 0;
        }
        v30 = v28;
        if (v29) {
          goto LABEL_26;
        }
        v31 = [MEMORY[0x1E4F28B00] currentHandler];
        v32 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
        [v31 handleFailureInFunction:v32, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v27, objc_opt_class() file lineNumber description];
      }
      v30 = 0;
LABEL_26:

      [v30 setHideDescription:1];
      [v30 setHideIcon:1];

LABEL_43:
      goto LABEL_44;
    }
    uint64_t v34 = objc_opt_class();
    id v35 = v8;
    if (v35)
    {
      if (objc_opt_isKindOfClass()) {
        v36 = v35;
      }
      else {
        v36 = 0;
      }
      v37 = v35;
      if (v36) {
        goto LABEL_35;
      }
      v38 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      id v5 = (id *)objc_claimAutoreleasedReturnValue();
      [v38 handleFailureInFunction:v5, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v34, objc_opt_class() file lineNumber description];
    }
    v37 = 0;
LABEL_35:

    [v37 setDelegate:self];
    [v37 setItem:v25];
    v39 = [v25 validTriggerValues];
    v40 = [v25 thresholdValue];
    v41 = v40;
    if (v40)
    {
      id v42 = v40;
    }
    else
    {
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __67__HUCharacteristicEventViewController_setupCell_forItem_indexPath___block_invoke;
      v43[3] = &unk_1E638C658;
      id v5 = &v44;
      id v44 = v25;
      objc_msgSend(v39, "na_firstObjectPassingTest:", v43);
      id v42 = (id)objc_claimAutoreleasedReturnValue();
    }

    [v25 setThresholdValue:v42];
    if (v42) {
      objc_msgSend(v37, "setSelectedIndex:animated:", objc_msgSend(MEMORY[0x1E4F2E770], "hf_indexOfSortedValues:closestToValue:", v39, v42), 0);
    }

    if (!v41) {
    goto LABEL_43;
    }
  }
  uint64_t v13 = objc_opt_class();
  id v14 = v8;
  if (v14)
  {
    if (objc_opt_isKindOfClass()) {
      v15 = v14;
    }
    else {
      v15 = 0;
    }
    uint64_t v16 = v14;
    if (v15) {
      goto LABEL_9;
    }
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v18 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v17 handleFailureInFunction:v18, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v13, objc_opt_class() file lineNumber description];
  }
  uint64_t v16 = 0;
LABEL_9:

  [v16 setIconDisplayStyle:1];
  v19 = +[HUIconCellContentMetrics compactMetrics];
  [v16 setContentMetrics:v19];

  [v16 setDisableContinuousIconAnimation:1];
  v20 = [(HUCharacteristicEventViewController *)self flow];
  unsigned int v21 = [v20 characteristicEditorAllowChangingCharacteristic:self];

  [v16 setAccessoryType:v21];
  if (v21) {
    uint64_t v22 = 3;
  }
  else {
    uint64_t v22 = 0;
  }
  [v16 setSelectionStyle:v22];

LABEL_44:
}

uint64_t __67__HUCharacteristicEventViewController_setupCell_forItem_indexPath___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) isValidThresholdValue:a2];
}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = v10;
      id v14 = [v13 item];
      id v15 = [(HUCharacteristicEventViewController *)self selectedEventOptionItem];
      if (v14 == v15) {
        uint64_t v16 = 3;
      }
      else {
        uint64_t v16 = 0;
      }
      [v13 setAccessoryType:v16];

LABEL_16:
      goto LABEL_17;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      id v17 = v11;
      if (objc_opt_isKindOfClass()) {
        uint64_t v18 = v17;
      }
      else {
        uint64_t v18 = 0;
      }
      id v14 = v18;

      objc_opt_class();
      id v19 = v10;
      if (objc_opt_isKindOfClass()) {
        v20 = v19;
      }
      else {
        v20 = 0;
      }
      id v15 = v20;

      [v15 setItem:v14];
      unsigned int v21 = [v14 thresholdValue];

      if (v21)
      {
        uint64_t v22 = [v14 validTriggerValues];
        id v23 = [v14 thresholdValue];
        uint64_t v24 = [v22 indexOfObject:v23];

        [v15 setSelectedIndex:v24 animated:0];
      }
      goto LABEL_16;
    }
  }
LABEL_17:
  v25.receiver = self;
  v25.super_class = (Class)HUCharacteristicEventViewController;
  [(HUItemTableViewController *)&v25 updateCell:v10 forItem:v11 indexPath:v12 animated:v6];
}

- (void)itemManagerDidUpdate:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HUCharacteristicEventViewController;
  [(HUItemTableViewController *)&v4 itemManagerDidUpdate:a3];
  [(HUCharacteristicEventViewController *)self _validateNextButton];
}

- (BOOL)shouldHideHeaderAboveSection:(int64_t)a3
{
  objc_super v4 = [(HUItemTableViewController *)self itemManager];
  id v5 = [v4 displayedSectionIdentifierForSectionIndex:a3];
  char v6 = [v5 isEqualToString:@"HUCharacteristicEventSectionIdentifierInstructions"];

  return v6;
}

- (BOOL)shouldHideFooterBelowSection:(int64_t)a3
{
  objc_super v4 = [(HUItemTableViewController *)self itemManager];
  id v5 = [v4 displayedSectionIdentifierForSectionIndex:a3];
  char v6 = [v5 isEqualToString:@"HUCharacteristicEventSectionIdentifierInstructions"];

  return v6;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HUItemTableViewController *)self itemManager];
  id v9 = [v8 displayedItemAtIndexPath:v7];

  id v10 = [(HUItemTableViewController *)self itemManager];
  id v11 = [v10 instructionsItem];

  if (v9 == v11)
  {
    unsigned __int8 v14 = 0;
  }
  else
  {
    id v12 = [(HUItemTableViewController *)self itemManager];
    id v13 = [v12 serviceNameItem];

    if (v9 == v13)
    {
      id v15 = [(HUCharacteristicEventViewController *)self flow];
      unsigned __int8 v14 = [v15 characteristicEditorAllowChangingCharacteristic:self];
    }
    else
    {
      v17.receiver = self;
      v17.super_class = (Class)HUCharacteristicEventViewController;
      unsigned __int8 v14 = [(HUItemTableViewController *)&v17 tableView:v6 shouldHighlightRowAtIndexPath:v7];
    }
  }

  return v14;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HUCharacteristicEventViewController;
  [(HUItemTableViewController *)&v15 tableView:v6 didSelectRowAtIndexPath:v7];
  id v8 = [(HUItemTableViewController *)self itemManager];
  id v9 = [v8 displayedItemAtIndexPath:v7];

  id v10 = [(HUItemTableViewController *)self moduleControllerForItem:v9];

  if (!v10)
  {
    id v11 = [(HUItemTableViewController *)self itemManager];
    id v12 = [v11 serviceNameItem];
    int v13 = [v9 isEqual:v12];

    if (v13)
    {
      unsigned __int8 v14 = [(HUCharacteristicEventViewController *)self flow];
      [v14 characteristicEditorDidSelectToChangeCharacteristic:self];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v6 deselectRowAtIndexPath:v7 animated:1];
        [(HUCharacteristicEventViewController *)self setSelectedEventOptionItem:v9];
        [(HUCharacteristicEventViewController *)self _updateVisibleCellCheckmarks];
      }
    }
  }
}

- (void)_updateVisibleCellCheckmarks
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = [(HUCharacteristicEventViewController *)self tableView];
  objc_super v4 = [v3 visibleCells];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v10 = v9;
          id v11 = [v10 item];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            int v13 = [v10 item];
            unsigned __int8 v14 = [(HUCharacteristicEventViewController *)self selectedEventOptionItem];
            if (v13 == v14) {
              uint64_t v15 = 3;
            }
            else {
              uint64_t v15 = 0;
            }
            [v10 setAccessoryType:v15];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  [(HUCharacteristicEventViewController *)self _validateNextButton];
}

- (BOOL)_canContinue
{
  v2 = [(HUCharacteristicEventViewController *)self selectedEventOptionItem];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)_commitTriggerBuilder
{
  BOOL v3 = (void *)MEMORY[0x1E4F7A0D8];
  objc_super v4 = objc_msgSend(MEMORY[0x1E4F28C58], "hf_errorWithCode:", 41);
  uint64_t v5 = [v3 futureWithError:v4];

  if ([(HUCharacteristicEventViewController *)self _canCommitTriggerBuilder])
  {
    [(HUCharacteristicEventViewController *)self _updateTriggerBuilder];
    uint64_t v6 = [(HUCharacteristicEventViewController *)self triggerBuilder];
    uint64_t v7 = [v6 commitItem];

    uint64_t v5 = (void *)v7;
  }

  return v5;
}

- (void)_validateNextButton
{
  BOOL v3 = [(HUCharacteristicEventViewController *)self _canContinue];
  id v5 = [(HUCharacteristicEventViewController *)self navigationItem];
  objc_super v4 = [v5 rightBarButtonItem];
  [v4 setEnabled:v3];
}

- (void)_updateTriggerBuilder
{
  BOOL v3 = [(HUCharacteristicEventViewController *)self selectedEventOptionItem];

  if (v3)
  {
    objc_super v4 = [(HUCharacteristicEventViewController *)self selectedEventOptionItem];
    id v5 = [v4 characteristics];

    uint64_t v6 = [(HUCharacteristicEventViewController *)self selectedEventOptionItem];
    uint64_t v7 = [v6 triggerValue];

    id v8 = [(HUCharacteristicEventViewController *)self selectedEventOptionItem];
    id v9 = [v8 triggerValueRange];

    id v10 = [(HUCharacteristicEventViewController *)self selectedEventOptionItem];
    id v11 = [v10 thresholdValueRange];
    if (v11)
    {
      id v12 = [(HUCharacteristicEventViewController *)self selectedEventOptionItem];
      int v13 = [v12 triggerValueRangeByApplyingThreshold];
    }
    else
    {
      int v13 = 0;
    }

    if (v9) {
      unsigned __int8 v14 = v9;
    }
    else {
      unsigned __int8 v14 = v13;
    }
    id v15 = v14;
    long long v16 = [(HUCharacteristicEventViewController *)self eventBuilderItem];
    long long v17 = v16;
    if (v7) {
      id v18 = v7;
    }
    else {
      id v18 = v15;
    }
    long long v19 = [v16 setCharacteristics:v5 triggerValue:v18];

    uint64_t v20 = [(HUCharacteristicEventViewController *)self flow];
    if (!v20) {
      goto LABEL_13;
    }
    uint64_t v21 = (void *)v20;
    uint64_t v22 = [(HUCharacteristicEventViewController *)self flow];
    id v23 = [(HUCharacteristicEventViewController *)self stepIdentifier];
    int v24 = [v22 shouldSaveEventBuildersToTriggerBuilderForStep:v23];

    if (v24)
    {
LABEL_13:
      objc_super v25 = [v19 deletions];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __60__HUCharacteristicEventViewController__updateTriggerBuilder__block_invoke;
      v28[3] = &unk_1E6388FF0;
      v28[4] = self;
      objc_msgSend(v25, "na_each:", v28);

      v26 = [v19 additions];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __60__HUCharacteristicEventViewController__updateTriggerBuilder__block_invoke_2;
      v27[3] = &unk_1E6388FF0;
      v27[4] = self;
      objc_msgSend(v26, "na_each:", v27);
    }
  }
}

void __60__HUCharacteristicEventViewController__updateTriggerBuilder__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 triggerBuilder];
  [v4 removeEventBuilder:v3];
}

void __60__HUCharacteristicEventViewController__updateTriggerBuilder__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 triggerBuilder];
  [v4 addEventBuilder:v3];
}

- (void)conditionEditorModuleController:(id)a3 presentDetailViewController:(id)a4
{
  id v4 = [(UIViewController *)self hu_presentPreloadableViewController:a4 animated:1];
}

- (void)conditionEditorModuleController:(id)a3 dismissDetailViewController:(id)a4
{
}

- (int64_t)numberOfValuesForPickerViewCell:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = [v3 item];

  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    uint64_t v7 = [v6 validTriggerValues];
    int64_t v8 = [v7 count];
  }
  else
  {
    int64_t v8 = 0;
  }

  return v8;
}

- (BOOL)pickerViewCell:(id)a3 canSelectValueAtIndex:(int64_t)a4
{
  id v5 = a3;
  objc_opt_class();
  id v6 = [v5 item];

  if (objc_opt_isKindOfClass()) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    id v9 = [v8 validTriggerValues];
    id v10 = [v9 objectAtIndexedSubscript:a4];

    char v11 = [v8 isValidThresholdValue:v10];
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (id)pickerViewCell:(id)a3 attributedTitleForValueAtIndex:(int64_t)a4
{
  id v5 = a3;
  objc_opt_class();
  id v6 = [v5 item];

  if (objc_opt_isKindOfClass()) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    id v9 = [v8 validTriggerValues];
    id v10 = [v9 objectAtIndexedSubscript:a4];

    id v11 = objc_alloc(MEMORY[0x1E4F28E48]);
    id v12 = [v8 localizedListDescriptionForThresholdValue:v10];
    int v13 = (void *)[v11 initWithString:v12];

    if (([v8 isValidThresholdValue:v10] & 1) == 0)
    {
      uint64_t v14 = *MEMORY[0x1E4F42510];
      id v15 = [MEMORY[0x1E4F428B8] systemGrayColor];
      objc_msgSend(v13, "addAttribute:value:range:", v14, v15, 0, objc_msgSend(v13, "length"));
    }
  }
  else
  {
    int v13 = 0;
  }

  return v13;
}

- (void)pickerViewCell:(id)a3 didSelectValueAtIndex:(int64_t)a4
{
  id v6 = a3;
  objc_opt_class();
  uint64_t v7 = [v6 item];

  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v13 = v8;

  id v9 = v13;
  if (v13)
  {
    id v10 = [v13 validTriggerValues];
    id v11 = [v10 objectAtIndexedSubscript:a4];

    id v12 = [(HUCharacteristicEventViewController *)self selectedEventOptionItem];
    [v12 setThresholdValue:v11];

    [(HUCharacteristicEventViewController *)self _updateTriggerBuilder];
    id v9 = v13;
  }
}

- (HFCharacteristicEventBuilderItem)eventBuilderItem
{
  return self->_eventBuilderItem;
}

- (void)setEventBuilderItem:(id)a3
{
}

- (HFEventTriggerBuilder)triggerBuilder
{
  return self->_triggerBuilder;
}

- (void)setTriggerBuilder:(id)a3
{
}

- (HUTriggerConditionEditorItemModuleController)conditionModuleController
{
  return self->_conditionModuleController;
}

- (HUCharacteristicEventOptionItem)selectedEventOptionItem
{
  return self->_selectedEventOptionItem;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stepIdentifier, 0);
  objc_storeStrong((id *)&self->_flow, 0);
  objc_storeStrong((id *)&self->_selectedEventOptionItem, 0);
  objc_storeStrong((id *)&self->_conditionModuleController, 0);
  objc_storeStrong((id *)&self->_triggerBuilder, 0);

  objc_storeStrong((id *)&self->_eventBuilderItem, 0);
}

@end