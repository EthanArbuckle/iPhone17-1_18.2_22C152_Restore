@interface HUCharacteristicTriggerEventViewController
- (BOOL)_canCommitTriggerBuilder;
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
- (HUCharacteristicTriggerEventViewController)initWithCharacteristicEventBuilderItem:(id)a3 triggerBuilder:(id)a4 mode:(unint64_t)a5 delegate:(id)a6;
- (HUTriggerConditionEditorItemModuleController)conditionModuleController;
- (HUTriggerEditorDelegate)delegate;
- (id)_commitTriggerBuilder;
- (id)buildItemModuleControllerForModule:(id)a3;
- (id)pickerViewCell:(id)a3 attributedTitleForValueAtIndex:(int64_t)a4;
- (id)visibleTriggerValuesForItem:(id)a3;
- (int64_t)numberOfValuesForPickerViewCell:(id)a3;
- (unint64_t)mode;
- (void)_cancel:(id)a3;
- (void)_showActionEditor:(id)a3;
- (void)_showSummary:(id)a3;
- (void)_updateTriggerBuilder;
- (void)_updateVisibleCellCheckmarks;
- (void)_validateNextButton;
- (void)conditionEditorModuleController:(id)a3 dismissDetailViewController:(id)a4;
- (void)conditionEditorModuleController:(id)a3 presentDetailViewController:(id)a4;
- (void)itemManagerDidUpdate:(id)a3;
- (void)pickerViewCell:(id)a3 didSelectValueAtIndex:(int64_t)a4;
- (void)setDelegate:(id)a3;
- (void)setEventBuilderItem:(id)a3;
- (void)setMode:(unint64_t)a3;
- (void)setSelectedEventOptionItem:(id)a3;
- (void)setTriggerBuilder:(id)a3;
- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation HUCharacteristicTriggerEventViewController

- (HUCharacteristicTriggerEventViewController)initWithCharacteristicEventBuilderItem:(id)a3 triggerBuilder:(id)a4 mode:(unint64_t)a5 delegate:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = [[HUCharacteristicTriggerEventItemManager alloc] initWithTriggerBuilder:v11 eventBuilderItem:v10 delegate:self];
  v28.receiver = self;
  v28.super_class = (Class)HUCharacteristicTriggerEventViewController;
  v14 = [(HUItemTableViewController *)&v28 initWithItemManager:v13 tableViewStyle:1];
  v15 = v14;
  if (v14)
  {
    [(HUCharacteristicTriggerEventViewController *)v14 setEventBuilderItem:v10];
    [(HUCharacteristicTriggerEventViewController *)v15 setTriggerBuilder:v11];
    [(HUCharacteristicTriggerEventViewController *)v15 setMode:a5];
    [(HUCharacteristicTriggerEventViewController *)v15 setDelegate:v12];
    v16 = _HULocalizedStringWithDefaultValue(@"HUCharacteristicTriggerEventOptionTitle", @"HUCharacteristicTriggerEventOptionTitle", 1);
    [(HUCharacteristicTriggerEventViewController *)v15 setTitle:v16];

    v17 = _HULocalizedStringWithDefaultValue(@"HUBackButtonTitle", @"HUBackButtonTitle", 1);
    v18 = [(HUCharacteristicTriggerEventViewController *)v15 navigationItem];
    [v18 setBackButtonTitle:v17];

    if (!a5)
    {
      v19 = [v11 triggerActionSets];
      int v20 = [v19 hasActions];
      v21 = &selRef__showSummary_;
      if (!v20) {
        v21 = &selRef__showActionEditor_;
      }
      v22 = *v21;

      id v23 = objc_alloc(MEMORY[0x1E4F427C0]);
      v24 = _HULocalizedStringWithDefaultValue(@"HUTimerTriggerEditorNextButton", @"HUTimerTriggerEditorNextButton", 1);
      v25 = (void *)[v23 initWithTitle:v24 style:2 target:v15 action:v22];
      v26 = [(HUCharacteristicTriggerEventViewController *)v15 navigationItem];
      [v26 setRightBarButtonItem:v25];

      [(HUCharacteristicTriggerEventViewController *)v15 _validateNextButton];
    }
  }

  return v15;
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

- (void)viewWillAppear:(BOOL)a3
{
  v22.receiver = self;
  v22.super_class = (Class)HUCharacteristicTriggerEventViewController;
  [(HUItemTableViewController *)&v22 viewWillAppear:a3];
  v5 = [(HUCharacteristicTriggerEventViewController *)self eventBuilderItem];
  id v6 = [(HUCharacteristicTriggerEventViewController *)self triggerBuilder];
  v7 = [v6 home];
  v8 = +[HUCharacteristicTriggerEventItemManager serviceVendorItemForEventBuilderItem:v5 inHome:v7];

  v9 = [v8 services];
  id v10 = [(HUItemTableViewController *)self itemManager];
  id v11 = [v10 serviceVendingItem];
  id v12 = [v11 services];
  char v13 = [v9 isEqual:v12];

  if ((v13 & 1) == 0)
  {
    v14 = [(HUItemTableViewController *)self itemManager];
    [v14 setServiceVendingItem:v8];

    v15 = [(HUItemTableViewController *)self itemManager];
    [v15 resetItemProvidersAndModules];

    v16 = [(HUItemTableViewController *)self itemManager];
    id v17 = (id)[v16 reloadAndUpdateAllItemsFromSenderSelector:a2];

    [(HUCharacteristicTriggerEventViewController *)self setSelectedEventOptionItem:0];
  }
  v18 = [(HUCharacteristicTriggerEventViewController *)self selectedEventOptionItem];

  if (!v18)
  {
    v19 = [(HUItemTableViewController *)self itemManager];
    int v20 = [v19 allDisplayedItems];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __61__HUCharacteristicTriggerEventViewController_viewWillAppear___block_invoke;
    v21[3] = &unk_1E63889F8;
    v21[4] = self;
    objc_msgSend(v20, "na_each:", v21);
  }
}

void __61__HUCharacteristicTriggerEventViewController_viewWillAppear___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  if (!v6) {
    goto LABEL_10;
  }
  v7 = [v6 triggerValue];
  if (v7)
  {

    goto LABEL_8;
  }
  v8 = [v6 triggerValueRange];

  if (v8)
  {
LABEL_8:
    v9 = [v6 characteristics];
    uint64_t v30 = MEMORY[0x1E4F143A8];
    uint64_t v31 = 3221225472;
    v32 = __61__HUCharacteristicTriggerEventViewController_viewWillAppear___block_invoke_2;
    v33 = &unk_1E638DF28;
    uint64_t v34 = *(void *)(a1 + 32);
    id v35 = v6;
    char v10 = objc_msgSend(v9, "na_any:", &v30);

    if (v10)
    {
LABEL_9:
      objc_msgSend(*(id *)(a1 + 32), "setSelectedEventOptionItem:", v6, v30, v31, v32, v33, v34);
      [*(id *)(a1 + 32) _validateNextButton];
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  id v11 = [v6 thresholdValueRange];

  if (v11)
  {
    objc_opt_class();
    id v12 = [*(id *)(a1 + 32) eventBuilderItem];
    char v13 = [v12 eventBuilders];
    v14 = [v13 anyObject];
    v15 = (objc_opt_isKindOfClass() & 1) != 0 ? v14 : 0;
    id v16 = v15;

    if (v16)
    {
      id v17 = [v16 characteristic];
      v18 = [v16 thresholdRange];
      v19 = objc_msgSend(v17, "hf_thresholdValueForRange:", v18);

      if (!v19)
      {

        goto LABEL_10;
      }
      int v20 = (void *)MEMORY[0x1E4F2E7A8];
      v21 = [v6 characteristics];
      objc_super v22 = [v6 thresholdValueRange];
      uint64_t v23 = objc_msgSend(v20, "hf_triggerRangeTypeWithCharacteristics:triggerValueRange:thresholdValue:", v21, v22, v19);

      v24 = (void *)MEMORY[0x1E4F2E7A8];
      v25 = (void *)MEMORY[0x1E4F1CAD0];
      v26 = [v16 characteristic];
      v27 = [v25 setWithObject:v26];
      objc_super v28 = [v16 thresholdRange];
      uint64_t v29 = objc_msgSend(v24, "hf_triggerRangeTypeWithCharacteristics:triggerValueRange:thresholdValue:", v27, v28, v19);

      [v6 setThresholdValue:v19];
      if (v23 != v29) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }
LABEL_10:
}

uint64_t __61__HUCharacteristicTriggerEventViewController_viewWillAppear___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 eventBuilderItem];
  id v6 = [*(id *)(a1 + 40) representativeTriggerValue];
  uint64_t v7 = [v5 wouldFireForCharacteristic:v4 value:v6];

  return v7;
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HUCharacteristicTriggerEventViewController;
  [(HUItemTableViewController *)&v4 viewWillDisappear:a3];
  [(HUCharacteristicTriggerEventViewController *)self _updateTriggerBuilder];
}

- (void)_cancel:(id)a3
{
  id v4 = [(HUCharacteristicTriggerEventViewController *)self delegate];
  [v4 triggerEditor:self didFinishWithTriggerBuilder:0];
}

- (void)_showActionEditor:(id)a3
{
  [(HUCharacteristicTriggerEventViewController *)self _updateTriggerBuilder];
  id v4 = [HUTriggerActionPickerViewController alloc];
  v5 = [(HUCharacteristicTriggerEventViewController *)self triggerBuilder];
  unint64_t v6 = [(HUCharacteristicTriggerEventViewController *)self mode];
  uint64_t v7 = [(HUCharacteristicTriggerEventViewController *)self delegate];
  char v10 = [(HUTriggerActionPickerViewController *)v4 initWithTriggerBuilder:v5 mode:v6 delegate:v7];

  v8 = [(HUCharacteristicTriggerEventViewController *)self navigationController];
  id v9 = (id)objc_msgSend(v8, "hu_pushPreloadableViewController:animated:", v10, 1);
}

- (void)_showSummary:(id)a3
{
  [(HUCharacteristicTriggerEventViewController *)self _updateTriggerBuilder];
  id v4 = [HUTriggerSummaryViewController alloc];
  v5 = [(HUCharacteristicTriggerEventViewController *)self triggerBuilder];
  unint64_t v6 = [(HUCharacteristicTriggerEventViewController *)self mode];
  uint64_t v7 = [(HUCharacteristicTriggerEventViewController *)self delegate];
  char v10 = [(HUTriggerSummaryViewController *)v4 initWithTriggerBuilder:v5 mode:v6 isPresentedModally:0 delegate:v7];

  v8 = [(HUCharacteristicTriggerEventViewController *)self navigationController];
  id v9 = (id)objc_msgSend(v8, "hu_pushPreloadableViewController:animated:", v10, 1);
}

- (BOOL)automaticallyUpdatesViewControllerTitle
{
  return 0;
}

- (id)buildItemModuleControllerForModule:(id)a3
{
  id v4 = a3;
  v5 = [[HUTriggerConditionEditorItemModuleController alloc] initWithModule:v4 delegate:self];

  conditionModuleController = self->_conditionModuleController;
  self->_conditionModuleController = v5;

  uint64_t v7 = self->_conditionModuleController;

  return v7;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_7;
  }
  unint64_t v6 = [(HUItemTableViewController *)self itemManager];
  uint64_t v7 = [v6 serviceNameItem];
  int v8 = [v5 isEqual:v7];

  if (v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
LABEL_7:
    v15 = objc_opt_class();
  }
  else
  {
    id v9 = v5;
    char v10 = objc_msgSend(MEMORY[0x1E4F2E770], "hf_valueRangeCharacteristicTypes");
    id v11 = [v9 mainCharacteristic];
    id v12 = [v11 characteristicType];
    int v13 = [v10 containsObject:v12];

    if (v13)
    {
      v14 = [v9 childItem];
      if (v14)
      {
        v15 = objc_opt_class();
      }
      else
      {
        v18 = [v9 thresholdValueRange];
        v15 = objc_opt_class();
      }
    }
    else
    {
      v15 = objc_opt_class();
    }
  }
  id v16 = v15;

  return v16;
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  char v10 = [(HUItemTableViewController *)self itemManager];
  id v11 = [v10 serviceNameItem];
  int v12 = [v9 isEqual:v11];

  if (!v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_54;
      }
      id v22 = +[HUListContentConfigurationUtilities instructionsConfigurationForItem:v9];
      [v8 setContentConfiguration:v22];
      uint64_t v30 = [MEMORY[0x1E4F427B0] clearConfiguration];
      [v8 setBackgroundConfiguration:v30];

      goto LABEL_53;
    }
    objc_opt_class();
    id v20 = v9;
    if (objc_opt_isKindOfClass()) {
      v21 = v20;
    }
    else {
      v21 = 0;
    }
    id v22 = v21;

    uint64_t v23 = [v22 childItem];
    if (v23)
    {

      goto LABEL_16;
    }
    v37 = [v22 thresholdValueRange];

    if (!v37)
    {
LABEL_16:
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v24 = objc_opt_class();
        id v25 = v8;
        if (v25)
        {
          if (objc_opt_isKindOfClass()) {
            v26 = v25;
          }
          else {
            v26 = 0;
          }
          v27 = v25;
          if (v26) {
            goto LABEL_24;
          }
          objc_super v28 = [MEMORY[0x1E4F28B00] currentHandler];
          uint64_t v29 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
          [v28 handleFailureInFunction:v29, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v24, objc_opt_class() file lineNumber description];
        }
        v27 = 0;
LABEL_24:

        [v27 setHideDescription:1];
        [v27 setHideIcon:1];
LABEL_36:

        goto LABEL_53;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v31 = objc_opt_class();
        id v32 = v8;
        if (v32)
        {
          if (objc_opt_isKindOfClass()) {
            v33 = v32;
          }
          else {
            v33 = 0;
          }
          v27 = v32;
          if (v33) {
            goto LABEL_35;
          }
          uint64_t v34 = [MEMORY[0x1E4F28B00] currentHandler];
          id v35 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
          [v34 handleFailureInFunction:v35, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v31, objc_opt_class() file lineNumber description];
        }
        v27 = 0;
LABEL_35:

        [v27 setHideIcon:1];
        [v27 setValueColorFollowsTintColor:1];
        v36 = objc_msgSend(MEMORY[0x1E4F428B8], "hf_keyColor");
        [v27 setTintColor:v36];

        goto LABEL_36;
      }
LABEL_53:

      goto LABEL_54;
    }
    uint64_t v38 = objc_opt_class();
    id v39 = v8;
    if (v39)
    {
      if (objc_opt_isKindOfClass()) {
        v40 = v39;
      }
      else {
        v40 = 0;
      }
      v41 = v39;
      if (v40) {
        goto LABEL_45;
      }
      v42 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      id v5 = (id *)objc_claimAutoreleasedReturnValue();
      [v42 handleFailureInFunction:v5, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v38, objc_opt_class() file lineNumber description];
    }
    v41 = 0;
LABEL_45:

    [v41 setDelegate:self];
    [v41 setItem:v22];
    v43 = [(HUCharacteristicTriggerEventViewController *)self visibleTriggerValuesForItem:v22];
    v44 = [v22 thresholdValue];
    v45 = v44;
    if (v44)
    {
      id v46 = v44;
    }
    else
    {
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __74__HUCharacteristicTriggerEventViewController_setupCell_forItem_indexPath___block_invoke;
      v47[3] = &unk_1E638C658;
      id v5 = &v48;
      id v48 = v22;
      objc_msgSend(v43, "na_firstObjectPassingTest:", v47);
      id v46 = (id)objc_claimAutoreleasedReturnValue();
    }

    [v22 setThresholdValue:v46];
    if (v46) {
      objc_msgSend(v41, "setSelectedIndex:animated:", objc_msgSend(MEMORY[0x1E4F2E770], "hf_indexOfSortedValues:closestToValue:", v43, v46), 0);
    }

    if (!v45) {
    goto LABEL_53;
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
    id v16 = v14;
    if (v15) {
      goto LABEL_9;
    }
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    v18 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v17 handleFailureInFunction:v18, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v13, objc_opt_class() file lineNumber description];
  }
  id v16 = 0;
LABEL_9:

  [v16 setIconDisplayStyle:1];
  v19 = +[HUIconCellContentMetrics compactMetrics];
  [v16 setContentMetrics:v19];

  [v16 setDisableContinuousIconAnimation:1];
  objc_msgSend(v16, "setAccessoryType:", -[HUCharacteristicTriggerEventViewController mode](self, "mode") == 1);

LABEL_54:
}

uint64_t __74__HUCharacteristicTriggerEventViewController_setupCell_forItem_indexPath___block_invoke(uint64_t a1, uint64_t a2)
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
      id v15 = [(HUCharacteristicTriggerEventViewController *)self selectedEventOptionItem];
      if (v14 == v15) {
        uint64_t v16 = 3;
      }
      else {
        uint64_t v16 = 0;
      }
      [v13 setAccessoryType:v16];

      goto LABEL_19;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      id v17 = v11;
      if (objc_opt_isKindOfClass()) {
        v18 = v17;
      }
      else {
        v18 = 0;
      }
      id v14 = v18;

      objc_opt_class();
      id v19 = v10;
      if (objc_opt_isKindOfClass()) {
        id v20 = v19;
      }
      else {
        id v20 = 0;
      }
      id v21 = v20;

      [v21 setItem:v14];
      id v22 = [(HUCharacteristicTriggerEventViewController *)self visibleTriggerValuesForItem:v14];
      uint64_t v23 = [v14 thresholdValue];

      if (v23)
      {
        uint64_t v24 = (void *)MEMORY[0x1E4F2E770];
        id v25 = [v14 thresholdValue];
        uint64_t v26 = objc_msgSend(v24, "hf_indexOfSortedValues:closestToValue:", v22, v25);

        [v21 setSelectedIndex:v26 animated:0];
      }

      goto LABEL_19;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = v10;
      v27 = [v14 item];
      objc_super v28 = [(HUCharacteristicTriggerEventViewController *)self selectedEventOptionItem];
      BOOL v29 = v27 == v28;
      BOOL v30 = v27 != v28;

      [v14 setHideValue:v30];
      [v14 setChecked:v29];
LABEL_19:
    }
  }
  v31.receiver = self;
  v31.super_class = (Class)HUCharacteristicTriggerEventViewController;
  [(HUItemTableViewController *)&v31 updateCell:v10 forItem:v11 indexPath:v12 animated:v6];
}

- (void)itemManagerDidUpdate:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HUCharacteristicTriggerEventViewController;
  [(HUItemTableViewController *)&v4 itemManagerDidUpdate:a3];
  [(HUCharacteristicTriggerEventViewController *)self _validateNextButton];
}

- (BOOL)shouldHideHeaderAboveSection:(int64_t)a3
{
  objc_super v4 = [(HUItemTableViewController *)self itemManager];
  id v5 = [v4 displayedSectionIdentifierForSectionIndex:a3];
  char v6 = [v5 isEqualToString:@"HUCharacteristicTriggerEventSectionIdentifierInstructions"];

  return v6;
}

- (BOOL)shouldHideFooterBelowSection:(int64_t)a3
{
  objc_super v4 = [(HUItemTableViewController *)self itemManager];
  id v5 = [v4 displayedSectionIdentifierForSectionIndex:a3];
  char v6 = [v5 isEqualToString:@"HUCharacteristicTriggerEventSectionIdentifierInstructions"];

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
      unsigned __int8 v14 = [(HUCharacteristicTriggerEventViewController *)self mode] == 1;
    }
    else
    {
      v16.receiver = self;
      v16.super_class = (Class)HUCharacteristicTriggerEventViewController;
      unsigned __int8 v14 = [(HUItemTableViewController *)&v16 tableView:v6 shouldHighlightRowAtIndexPath:v7];
    }
  }

  return v14;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)HUCharacteristicTriggerEventViewController;
  [(HUItemTableViewController *)&v24 tableView:v6 didSelectRowAtIndexPath:v7];
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
      unsigned __int8 v14 = [(HUCharacteristicTriggerEventViewController *)self triggerBuilder];
      unint64_t v15 = +[HUCharacteristicTriggerServicePickerViewController sourceForTriggerBuilder:v14];

      objc_super v16 = [HUAccessoryEventPickerViewController alloc];
      id v17 = [(HUCharacteristicTriggerEventViewController *)self eventBuilderItem];
      v18 = [(HUCharacteristicTriggerEventViewController *)self triggerBuilder];
      unint64_t v19 = [(HUCharacteristicTriggerEventViewController *)self mode];
      id v20 = [(HUCharacteristicTriggerEventViewController *)self delegate];
      id v21 = [(HUAccessoryEventPickerViewController *)v16 initWithEventBuilderItem:v17 triggerBuilder:v18 mode:v19 source:v15 delegate:v20];

      id v22 = [(HUCharacteristicTriggerEventViewController *)self navigationController];
      id v23 = (id)objc_msgSend(v22, "hu_pushPreloadableViewController:animated:", v21, 1);
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v6 deselectRowAtIndexPath:v7 animated:1];
        [(HUCharacteristicTriggerEventViewController *)self setSelectedEventOptionItem:v9];
        [(HUCharacteristicTriggerEventViewController *)self _updateVisibleCellCheckmarks];
      }
    }
  }
}

- (id)visibleTriggerValuesForItem:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  objc_super v4 = [v3 latestResults];
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F68C98]];
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;
  if (v7)
  {
    id v8 = v5;
  }
  else
  {
    id v8 = [v3 visibleTriggerValues];
  }
  id v9 = v8;

  return v9;
}

- (void)_updateVisibleCellCheckmarks
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v2 = [(HUCharacteristicTriggerEventViewController *)self tableView];
  id v3 = [v2 visibleCells];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v32;
    id v7 = off_1E6382000;
    id v8 = off_1E6381000;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v32 != v6) {
          objc_enumerationMutation(v3);
        }
        id v10 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = v10;
          id v12 = [v11 item];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            unsigned __int8 v14 = [v11 item];
            unint64_t v15 = [(HUCharacteristicTriggerEventViewController *)self selectedEventOptionItem];
            BOOL v30 = v14 == v15;
            uint64_t v16 = v5;
            uint64_t v17 = v6;
            v18 = v7;
            unint64_t v19 = v3;
            id v20 = v8;
            BOOL v21 = v14 != v15;

            BOOL v22 = v21;
            id v8 = v20;
            id v3 = v19;
            id v7 = v18;
            uint64_t v6 = v17;
            uint64_t v5 = v16;
            [v11 setHideValue:v22];
            [v11 setChecked:v30];
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
          id v23 = v10;
          objc_super v24 = [v23 item];
          objc_opt_class();
          char v25 = objc_opt_isKindOfClass();

          if (v25)
          {
            uint64_t v26 = [v23 item];
            v27 = [(HUCharacteristicTriggerEventViewController *)self selectedEventOptionItem];
            if (v26 == v27) {
              uint64_t v28 = 3;
            }
            else {
              uint64_t v28 = 0;
            }
            [v23 setAccessoryType:v28];
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v5);
  }

  [(HUCharacteristicTriggerEventViewController *)self _validateNextButton];
}

- (BOOL)_canContinue
{
  v2 = [(HUCharacteristicTriggerEventViewController *)self selectedEventOptionItem];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)_canCommitTriggerBuilder
{
  BOOL v3 = [(HUCharacteristicTriggerEventViewController *)self _canContinue];
  if (v3)
  {
    uint64_t v4 = [(HUCharacteristicTriggerEventViewController *)self delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      uint64_t v6 = [(HUCharacteristicTriggerEventViewController *)self delegate];
      id v7 = [(HUCharacteristicTriggerEventViewController *)self triggerBuilder];
      char v8 = [v6 triggerEditor:self shouldCommitTriggerBuilder:v7];

      LOBYTE(v3) = v8;
    }
    else
    {
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (id)_commitTriggerBuilder
{
  BOOL v3 = (void *)MEMORY[0x1E4F7A0D8];
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F28C58], "hf_errorWithCode:", 41);
  char v5 = [v3 futureWithError:v4];

  if ([(HUCharacteristicTriggerEventViewController *)self _canCommitTriggerBuilder])
  {
    [(HUCharacteristicTriggerEventViewController *)self _updateTriggerBuilder];
    uint64_t v6 = [(HUCharacteristicTriggerEventViewController *)self triggerBuilder];
    uint64_t v7 = [v6 commitItem];

    char v5 = (void *)v7;
  }

  return v5;
}

- (void)_validateNextButton
{
  BOOL v3 = [(HUCharacteristicTriggerEventViewController *)self _canContinue];
  id v5 = [(HUCharacteristicTriggerEventViewController *)self navigationItem];
  uint64_t v4 = [v5 rightBarButtonItem];
  [v4 setEnabled:v3];
}

- (void)_updateTriggerBuilder
{
  BOOL v3 = [(HUCharacteristicTriggerEventViewController *)self selectedEventOptionItem];

  if (v3)
  {
    uint64_t v4 = [(HUCharacteristicTriggerEventViewController *)self selectedEventOptionItem];
    id v5 = [v4 characteristics];

    uint64_t v6 = [(HUCharacteristicTriggerEventViewController *)self selectedEventOptionItem];
    uint64_t v7 = [v6 triggerValue];

    char v8 = [(HUCharacteristicTriggerEventViewController *)self selectedEventOptionItem];
    id v9 = [v8 triggerValueRange];

    id v10 = [(HUCharacteristicTriggerEventViewController *)self selectedEventOptionItem];
    id v11 = [v10 thresholdValueRange];
    if (v11)
    {
      id v12 = [(HUCharacteristicTriggerEventViewController *)self selectedEventOptionItem];
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
    if (v7) {
      unint64_t v15 = v7;
    }
    else {
      unint64_t v15 = v14;
    }
    id v16 = v15;
    id v17 = v14;
    v18 = [(HUCharacteristicTriggerEventViewController *)self eventBuilderItem];
    unint64_t v19 = [v18 setCharacteristics:v5 triggerValue:v16];

    id v20 = [v19 deletions];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __67__HUCharacteristicTriggerEventViewController__updateTriggerBuilder__block_invoke;
    v23[3] = &unk_1E6388FF0;
    v23[4] = self;
    objc_msgSend(v20, "na_each:", v23);

    BOOL v21 = [v19 additions];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __67__HUCharacteristicTriggerEventViewController__updateTriggerBuilder__block_invoke_2;
    v22[3] = &unk_1E6388FF0;
    v22[4] = self;
    objc_msgSend(v21, "na_each:", v22);
  }
}

void __67__HUCharacteristicTriggerEventViewController__updateTriggerBuilder__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 triggerBuilder];
  [v4 removeEventBuilder:v3];
}

void __67__HUCharacteristicTriggerEventViewController__updateTriggerBuilder__block_invoke_2(uint64_t a1, void *a2)
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
  id v4 = a3;
  objc_opt_class();
  id v5 = [v4 item];

  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    char v8 = [(HUCharacteristicTriggerEventViewController *)self visibleTriggerValuesForItem:v7];
    int64_t v9 = [v8 count];
  }
  else
  {
    int64_t v9 = 0;
  }

  return v9;
}

- (BOOL)pickerViewCell:(id)a3 canSelectValueAtIndex:(int64_t)a4
{
  id v6 = a3;
  objc_opt_class();
  id v7 = [v6 item];

  if (objc_opt_isKindOfClass()) {
    char v8 = v7;
  }
  else {
    char v8 = 0;
  }
  id v9 = v8;

  if (v9)
  {
    id v10 = [(HUCharacteristicTriggerEventViewController *)self visibleTriggerValuesForItem:v9];
    id v11 = [v10 objectAtIndexedSubscript:a4];

    char v12 = [v9 isValidThresholdValue:v11];
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (id)pickerViewCell:(id)a3 attributedTitleForValueAtIndex:(int64_t)a4
{
  id v6 = a3;
  objc_opt_class();
  id v7 = [v6 item];

  if (objc_opt_isKindOfClass()) {
    char v8 = v7;
  }
  else {
    char v8 = 0;
  }
  id v9 = v8;

  if (v9)
  {
    id v10 = [(HUCharacteristicTriggerEventViewController *)self visibleTriggerValuesForItem:v9];
    unint64_t v11 = [v10 count];
    char v12 = 0;
    if ((a4 & 0x8000000000000000) == 0 && v11 > a4)
    {
      int v13 = [v10 objectAtIndexedSubscript:a4];
      id v14 = objc_alloc(MEMORY[0x1E4F28E48]);
      unint64_t v15 = [v9 localizedListDescriptionForThresholdValue:v13];
      char v12 = (void *)[v14 initWithString:v15];

      if (([v9 isValidThresholdValue:v13] & 1) == 0)
      {
        uint64_t v16 = *MEMORY[0x1E4F42510];
        id v17 = [MEMORY[0x1E4F428B8] systemGrayColor];
        objc_msgSend(v12, "addAttribute:value:range:", v16, v17, 0, objc_msgSend(v12, "length"));
      }
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (void)pickerViewCell:(id)a3 didSelectValueAtIndex:(int64_t)a4
{
  id v7 = a3;
  objc_opt_class();
  char v8 = [v7 item];

  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  id v19 = v9;

  id v10 = v19;
  if (v19)
  {
    unint64_t v11 = [(HUCharacteristicTriggerEventViewController *)self visibleTriggerValuesForItem:v19];
    char v12 = [v11 objectAtIndexedSubscript:a4];

    int v13 = [(HUCharacteristicTriggerEventViewController *)self selectedEventOptionItem];
    [v13 setThresholdValue:v12];

    [(HUCharacteristicTriggerEventViewController *)self _updateTriggerBuilder];
    id v14 = [(HUItemTableViewController *)self itemManager];
    unint64_t v15 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = [(HUCharacteristicTriggerEventViewController *)self selectedEventOptionItem];
    id v17 = objc_msgSend(v15, "na_setWithSafeObject:", v16);
    id v18 = (id)[v14 updateResultsForItems:v17 senderSelector:a2];

    id v10 = v19;
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

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (HUTriggerEditorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUTriggerEditorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedEventOptionItem, 0);
  objc_storeStrong((id *)&self->_conditionModuleController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_triggerBuilder, 0);

  objc_storeStrong((id *)&self->_eventBuilderItem, 0);
}

@end