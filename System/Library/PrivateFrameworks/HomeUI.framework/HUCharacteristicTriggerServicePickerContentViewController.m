@interface HUCharacteristicTriggerServicePickerContentViewController
+ (id)getThresholdRangeValueForCharacteristics:(id)a3 inHome:(id)a4;
+ (id)splitCharacteristicResults;
+ (id)transformationSetBlock;
- (BOOL)canSelectItem:(id)a3 indexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)serviceGridItemManager:(id)a3 shouldHideItem:(id)a4;
- (HFCharacteristicEventBuilderItem)eventBuilderItem;
- (HFEventTriggerBuilder)triggerBuilder;
- (HUCharacteristicTriggerServicePickerContentViewController)initWithServiceGridItemManager:(id)a3;
- (HUCharacteristicTriggerServicePickerContentViewController)initWithTriggerBuilder:(id)a3 eventBuilderItem:(id)a4 mode:(unint64_t)a5 source:(unint64_t)a6 effectiveNavigationItem:(id)a7 delegate:(id)a8;
- (NAFuture)characteristicReadFuture;
- (UINavigationItem)effectiveNavigationItem;
- (id)filter;
- (id)layoutOptionsForSection:(int64_t)a3;
- (unint64_t)mode;
- (unint64_t)source;
- (void)_addCharacteristicEventsForAlarmItem:(id)a3;
- (void)_addCharacteristicEventsForOtherDeviceItem:(id)a3;
- (void)_addTriggerValue:(id)a3 forCharacteristics:(id)a4;
- (void)_cancel:(id)a3;
- (void)_next:(id)a3;
- (void)_validateNextButton;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)configureCell:(id)a3 forItem:(id)a4;
- (void)didChangeSelection;
- (void)itemManagerDidUpdate:(id)a3;
- (void)setCharacteristicReadFuture:(id)a3;
- (void)setFilter:(id)a3;
- (void)viewDidLoad;
@end

@implementation HUCharacteristicTriggerServicePickerContentViewController

- (HUCharacteristicTriggerServicePickerContentViewController)initWithTriggerBuilder:(id)a3 eventBuilderItem:(id)a4 mode:(unint64_t)a5 source:(unint64_t)a6 effectiveNavigationItem:(id)a7 delegate:(id)a8
{
  id v13 = a3;
  id obj = a4;
  id v14 = a4;
  id v15 = a7;
  id v16 = a8;
  v17 = [(id)objc_opt_class() transformationSetBlock];
  v18 = +[HUSelectableServiceGridViewController defaultItemProviderCreatorWithOptions:9];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __146__HUCharacteristicTriggerServicePickerContentViewController_initWithTriggerBuilder_eventBuilderItem_mode_source_effectiveNavigationItem_delegate___block_invoke;
  aBlock[3] = &unk_1E6388F38;
  id v28 = v18;
  id v31 = v28;
  id v19 = v17;
  id v32 = v19;
  v20 = _Block_copy(aBlock);
  v21 = [[HUServiceGridItemManager alloc] initWithDelegate:self shouldGroupByRoom:1 itemProvidersCreator:v20];
  v29.receiver = self;
  v29.super_class = (Class)HUCharacteristicTriggerServicePickerContentViewController;
  v22 = [(HUSelectableServiceGridViewController *)&v29 initWithServiceGridItemManager:v21];
  v23 = v22;
  if (v22)
  {
    [(HUServiceGridViewController *)v22 setDelegate:v16];
    objc_storeStrong((id *)&v23->_eventBuilderItem, obj);
    objc_storeStrong((id *)&v23->_triggerBuilder, a3);
    v23->_mode = a5;
    v23->_source = a6;
    objc_storeStrong((id *)&v23->_effectiveNavigationItem, a7);
    [(HUSelectableServiceGridViewController *)v23 setAllowsMultipleSelection:0];
  }

  return v23;
}

id __146__HUCharacteristicTriggerServicePickerContentViewController_initWithTriggerBuilder_eventBuilderItem_mode_source_effectiveNavigationItem_delegate___block_invoke(uint64_t a1)
{
  v2 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __146__HUCharacteristicTriggerServicePickerContentViewController_initWithTriggerBuilder_eventBuilderItem_mode_source_effectiveNavigationItem_delegate___block_invoke_2;
  v5[3] = &unk_1E6388F10;
  id v6 = *(id *)(a1 + 40);
  v3 = objc_msgSend(v2, "na_map:", v5);

  return v3;
}

id __146__HUCharacteristicTriggerServicePickerContentViewController_initWithTriggerBuilder_eventBuilderItem_mode_source_effectiveNavigationItem_delegate___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x1E4F692E0];
  id v4 = a2;
  v5 = (void *)[[v3 alloc] initWithSourceProvider:v4 multipleTransformationBlock:*(void *)(a1 + 32)];

  return v5;
}

- (HUCharacteristicTriggerServicePickerContentViewController)initWithServiceGridItemManager:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v6 = NSStringFromSelector(sel_initWithTriggerBuilder_eventBuilderItem_mode_source_effectiveNavigationItem_delegate_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUCharacteristicTriggerServicePickerContentViewController.m", 89, @"%s is unavailable; use %@ instead",
    "-[HUCharacteristicTriggerServicePickerContentViewController initWithServiceGridItemManager:]",
    v6);

  return 0;
}

- (void)viewDidLoad
{
  v16.receiver = self;
  v16.super_class = (Class)HUCharacteristicTriggerServicePickerContentViewController;
  [(HUServiceGridViewController *)&v16 viewDidLoad];
  v3 = [(HUCharacteristicTriggerServicePickerContentViewController *)self collectionView];
  [v3 _setShouldDeriveVisibleBoundsFromContainingScrollView:1];

  id v4 = [(HUCharacteristicTriggerServicePickerContentViewController *)self collectionView];
  [v4 setScrollEnabled:0];

  v5 = [(HUCharacteristicTriggerServicePickerContentViewController *)self collectionView];
  [v5 setClipsToBounds:1];

  id v6 = [MEMORY[0x1E4F428B8] clearColor];
  v7 = [(HUCharacteristicTriggerServicePickerContentViewController *)self collectionView];
  [v7 setBackgroundColor:v6];

  v8 = [MEMORY[0x1E4F428B8] clearColor];
  v9 = [(HUCharacteristicTriggerServicePickerContentViewController *)self view];
  [v9 setBackgroundColor:v8];

  v10 = _HULocalizedStringWithDefaultValue(@"HUBackButtonTitle", @"HUBackButtonTitle", 1);
  v11 = [(HUCharacteristicTriggerServicePickerContentViewController *)self effectiveNavigationItem];
  [v11 setBackButtonTitle:v10];

  if (![(HUCharacteristicTriggerServicePickerContentViewController *)self mode])
  {
    id v12 = objc_alloc(MEMORY[0x1E4F427C0]);
    id v13 = _HULocalizedStringWithDefaultValue(@"HUCharacteristicTriggerServicePickerNextButton", @"HUCharacteristicTriggerServicePickerNextButton", 1);
    id v14 = (void *)[v12 initWithTitle:v13 style:2 target:self action:sel__next_];
    id v15 = [(HUCharacteristicTriggerServicePickerContentViewController *)self effectiveNavigationItem];
    [v15 setRightBarButtonItem:v14];
  }
  [(HUCharacteristicTriggerServicePickerContentViewController *)self _validateNextButton];
}

- (void)_cancel:(id)a3
{
  id v4 = [(HUServiceGridViewController *)self delegate];
  [v4 triggerEditor:self didFinishWithTriggerBuilder:0];
}

- (void)_next:(id)a3
{
  id v4 = [(HUCharacteristicTriggerServicePickerContentViewController *)self characteristicReadFuture];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }
  v7 = v6;

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__HUCharacteristicTriggerServicePickerContentViewController__next___block_invoke;
  v9[3] = &unk_1E63850B8;
  v9[4] = self;
  id v8 = (id)[v7 addCompletionBlock:v9];
}

void __67__HUCharacteristicTriggerServicePickerContentViewController__next___block_invoke(uint64_t a1)
{
  v2 = [HUCharacteristicTriggerEventViewController alloc];
  v3 = [*(id *)(a1 + 32) eventBuilderItem];
  id v4 = [*(id *)(a1 + 32) triggerBuilder];
  uint64_t v5 = [*(id *)(a1 + 32) mode];
  id v6 = [*(id *)(a1 + 32) delegate];
  v9 = [(HUCharacteristicTriggerEventViewController *)v2 initWithCharacteristicEventBuilderItem:v3 triggerBuilder:v4 mode:v5 delegate:v6];

  v7 = [*(id *)(a1 + 32) navigationController];
  id v8 = (id)objc_msgSend(v7, "hu_pushPreloadableViewController:animated:", v9, 1);
}

- (void)itemManagerDidUpdate:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v26.receiver = self;
  v26.super_class = (Class)HUCharacteristicTriggerServicePickerContentViewController;
  [(HUSelectableServiceGridViewController *)&v26 itemManagerDidUpdate:a3];
  v17 = [MEMORY[0x1E4F1CA80] set];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v4 = [(HUItemCollectionViewController *)self itemManager];
  uint64_t v5 = [v4 allDisplayedItems];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (([v10 conformsToProtocol:&unk_1F1A3D460] & 1) == 0) {
          NSLog(&cfstr_OurItemsMustVe.isa);
        }
        if ([v10 conformsToProtocol:&unk_1F1A3D460])
        {
          id v11 = v10;
          id v12 = [v11 services];
          v21[0] = MEMORY[0x1E4F143A8];
          v21[1] = 3221225472;
          v21[2] = __82__HUCharacteristicTriggerServicePickerContentViewController_itemManagerDidUpdate___block_invoke;
          v21[3] = &unk_1E6387048;
          v21[4] = self;
          int v13 = objc_msgSend(v12, "na_any:", v21);

          if (v13)
          {
            v18[0] = MEMORY[0x1E4F143A8];
            v18[1] = 3221225472;
            v18[2] = __82__HUCharacteristicTriggerServicePickerContentViewController_itemManagerDidUpdate___block_invoke_3;
            v18[3] = &unk_1E6388F60;
            id v14 = v11;
            id v19 = v14;
            v20 = self;
            if (__82__HUCharacteristicTriggerServicePickerContentViewController_itemManagerDidUpdate___block_invoke_3((uint64_t)v18)) {
              [v17 addObject:v14];
            }
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v7);
  }

  id v15 = (void *)[objc_alloc(MEMORY[0x1E4F692F8]) initWithFromSet:v17];
  objc_super v16 = (void *)[v15 copy];
  [(HUSelectableServiceGridViewController *)self setSelectedItems:v16];

  [(HUCharacteristicTriggerServicePickerContentViewController *)self _validateNextButton];
}

uint64_t __82__HUCharacteristicTriggerServicePickerContentViewController_itemManagerDidUpdate___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 characteristics];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __82__HUCharacteristicTriggerServicePickerContentViewController_itemManagerDidUpdate___block_invoke_2;
  v6[3] = &unk_1E6387020;
  v6[4] = *(void *)(a1 + 32);
  uint64_t v4 = objc_msgSend(v3, "na_any:", v6);

  return v4;
}

uint64_t __82__HUCharacteristicTriggerServicePickerContentViewController_itemManagerDidUpdate___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 eventBuilderItem];
  uint64_t v5 = [v4 characteristics];
  uint64_t v6 = [v5 containsObject:v3];

  return v6;
}

uint64_t __82__HUCharacteristicTriggerServicePickerContentViewController_itemManagerDidUpdate___block_invoke_3(uint64_t a1)
{
  objc_opt_class();
  v2 = [*(id *)(a1 + 32) latestResults];
  id v3 = [v2 objectForKeyedSubscript:@"HUCharacteristicTriggerServiceRepresentativeCharacteristicKey"];
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    uint64_t v6 = [*(id *)(a1 + 40) eventBuilderItem];
    uint64_t v7 = [v6 characteristics];
    uint64_t v8 = [v7 containsObject:v5];
  }
  else
  {
    uint64_t v8 = 1;
  }

  return v8;
}

- (id)layoutOptionsForSection:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HUCharacteristicTriggerServicePickerContentViewController;
  uint64_t v4 = [(HUServiceGridViewController *)&v7 layoutOptionsForSection:sel_layoutOptionsForSection_];
  id v5 = (void *)[v4 copy];

  if (!a3)
  {
    [v5 sectionTitleMargin];
    [v5 setSectionTitleMargin:9.0];
  }

  return v5;
}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  id v6 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HUCharacteristicTriggerServicePickerContentViewController;
  [(HUSelectableServiceGridViewController *)&v7 configureCell:v6 forItem:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v6 setShouldColorDescription:0];
  }
}

- (BOOL)serviceGridItemManager:(id)a3 shouldHideItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(id)objc_opt_class() instancesRespondToSelector:sel_serviceGridItemManager_shouldHideItem_])
  {
    v25.receiver = self;
    v25.super_class = (Class)HUCharacteristicTriggerServicePickerContentViewController;
    if ([(HUSelectableServiceGridViewController *)&v25 serviceGridItemManager:v6 shouldHideItem:v7])
    {
      goto LABEL_3;
    }
  }
  if (![v7 conformsToProtocol:&unk_1F1A3D460]) {
    goto LABEL_13;
  }
  id v9 = v7;
  unint64_t v10 = [(HUCharacteristicTriggerServicePickerContentViewController *)self source];
  if (v10)
  {
    if (v10 != 1)
    {

      goto LABEL_13;
    }
    id v22 = 0;
    BOOL v11 = +[HUCharacteristicEventOptionProvider hasOptionsForServiceVendingItem:v9 outCharacteristicType:&v22];
    id v12 = v22;
    int v13 = v12;
    if (!v11)
    {

      LOBYTE(v8) = 1;
LABEL_15:

      goto LABEL_17;
    }
    id v14 = objc_msgSend(MEMORY[0x1E4F2E770], "hf_sensingCharacteristicTypes");
    char v15 = [v14 containsObject:v13];

    if ((v15 & 1) == 0)
    {
LABEL_13:
      v20 = [(HUCharacteristicTriggerServicePickerContentViewController *)self filter];

      if (!v20)
      {
        LOBYTE(v8) = 0;
        goto LABEL_17;
      }
      id v9 = [(HUCharacteristicTriggerServicePickerContentViewController *)self filter];
      int v8 = (*((uint64_t (**)(id, id))v9 + 2))(v9, v7) ^ 1;
      goto LABEL_15;
    }
  }
  else
  {
    objc_super v16 = objc_msgSend(MEMORY[0x1E4F2E770], "hf_sensingCharacteristicTypes");
    v17 = [v9 services];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __99__HUCharacteristicTriggerServicePickerContentViewController_serviceGridItemManager_shouldHideItem___block_invoke;
    v23[3] = &unk_1E6387048;
    id v24 = v16;
    id v18 = v16;
    int v19 = objc_msgSend(v17, "na_any:", v23);

    if (v19) {
      goto LABEL_13;
    }
  }
LABEL_3:
  LOBYTE(v8) = 1;
LABEL_17:

  return v8;
}

uint64_t __99__HUCharacteristicTriggerServicePickerContentViewController_serviceGridItemManager_shouldHideItem___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 characteristics];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __99__HUCharacteristicTriggerServicePickerContentViewController_serviceGridItemManager_shouldHideItem___block_invoke_2;
  v6[3] = &unk_1E6387020;
  id v7 = *(id *)(a1 + 32);
  uint64_t v4 = objc_msgSend(v3, "na_any:", v6);

  return v4;
}

uint64_t __99__HUCharacteristicTriggerServicePickerContentViewController_serviceGridItemManager_shouldHideItem___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 characteristicType];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  uint64_t v4 = [(HUCharacteristicTriggerServicePickerContentViewController *)self triggerBuilder];
  id v5 = [v4 home];
  char v6 = objc_msgSend(v5, "hf_currentUserIsAdministrator");

  return v6;
}

- (void)didChangeSelection
{
  v10.receiver = self;
  v10.super_class = (Class)HUCharacteristicTriggerServicePickerContentViewController;
  [(HUSelectableServiceGridViewController *)&v10 didChangeSelection];
  id v3 = [(HUSelectableServiceGridViewController *)self selectedItems];
  uint64_t v4 = [v3 toSet];
  id v5 = [v4 anyObject];

  id v6 = v5;
  if ([v6 conformsToProtocol:&unk_1F1A3D460]) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  if (!v6 || v8)
  {
    if (v8)
    {
      unint64_t v9 = [(HUCharacteristicTriggerServicePickerContentViewController *)self source];
      if (v9 == 1)
      {
        [(HUCharacteristicTriggerServicePickerContentViewController *)self _addCharacteristicEventsForOtherDeviceItem:v8];
      }
      else if (!v9)
      {
        [(HUCharacteristicTriggerServicePickerContentViewController *)self _addCharacteristicEventsForAlarmItem:v8];
      }
    }
  }
  else
  {
    NSLog(&cfstr_OurItemsMustVe.isa);
  }
  [(HUCharacteristicTriggerServicePickerContentViewController *)self _validateNextButton];
}

- (BOOL)canSelectItem:(id)a3 indexPath:(id)a4
{
  id v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)HUCharacteristicTriggerServicePickerContentViewController;
  if ([(HUSelectableServiceGridViewController *)&v20 canSelectItem:v6 indexPath:a4])
  {
    id v7 = v6;
    if ([v7 conformsToProtocol:&unk_1F1A3D460]) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }
    id v9 = v8;

    objc_opt_class();
    id v10 = v7;
    if (objc_opt_isKindOfClass()) {
      BOOL v11 = v10;
    }
    else {
      BOOL v11 = 0;
    }
    id v12 = v11;

    int v13 = [v12 sourceItem];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      LOBYTE(v15) = 0;
    }
    else if (v9)
    {
      objc_super v16 = [v9 services];
      v17 = [(HUCharacteristicTriggerServicePickerContentViewController *)self triggerBuilder];
      id v18 = [v17 home];
      BOOL v15 = !+[HUCharacteristicEventOptionProvider homeHubUpdateRequiredForServices:v16 forHome:v18];
    }
    else
    {
      LOBYTE(v15) = 1;
    }
  }
  else
  {
    LOBYTE(v15) = 0;
  }

  return v15;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HUItemCollectionViewController *)self itemManager];
  id v9 = [v8 displayedItemAtIndexPath:v7];

  id v10 = v9;
  if ([v10 conformsToProtocol:&unk_1F1A3D460]) {
    BOOL v11 = v10;
  }
  else {
    BOOL v11 = 0;
  }
  id v12 = v11;

  objc_opt_class();
  id v13 = v10;
  if (objc_opt_isKindOfClass()) {
    id v14 = v13;
  }
  else {
    id v14 = 0;
  }
  id v15 = v14;

  objc_super v16 = [v15 sourceItem];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v18 = (void *)MEMORY[0x1E4F42728];
    int v19 = _HULocalizedStringWithDefaultValue(@"HUDontSetupProgrammableSwitchInAutomationTitle", @"HUDontSetupProgrammableSwitchInAutomationTitle", 1);
    objc_super v20 = @"HUDontSetupProgrammableSwitchInAutomationMessage";
LABEL_12:
    objc_super v25 = _HULocalizedStringWithDefaultValue(v20, v20, 1);
    objc_super v26 = [v18 alertControllerWithTitle:v19 message:v25 preferredStyle:1];

    v27 = (void *)MEMORY[0x1E4F42720];
    uint64_t v28 = _HULocalizedStringWithDefaultValue(@"HUOkTitle", @"HUOkTitle", 1);
    objc_super v29 = [v27 actionWithTitle:v28 style:0 handler:0];
    [v26 addAction:v29];

    [(HUControllableItemCollectionViewController *)self presentViewController:v26 animated:1 completion:0];
    goto LABEL_13;
  }
  if (v12)
  {
    v21 = [v12 services];
    id v22 = [(HUCharacteristicTriggerServicePickerContentViewController *)self triggerBuilder];
    long long v23 = [v22 home];
    BOOL v24 = +[HUCharacteristicEventOptionProvider homeHubUpdateRequiredForServices:v21 forHome:v23];

    if (v24)
    {
      id v18 = (void *)MEMORY[0x1E4F42728];
      int v19 = _HULocalizedStringWithDefaultValue(@"HUAlertSoftwareUpdateRequired", @"HUAlertSoftwareUpdateRequired", 1);
      objc_super v20 = @"HUCharacteristicTriggerRequireHomeHubUpdateMessage";
      goto LABEL_12;
    }
  }
LABEL_13:
  v30.receiver = self;
  v30.super_class = (Class)HUCharacteristicTriggerServicePickerContentViewController;
  [(HUSelectableServiceGridViewController *)&v30 collectionView:v6 didSelectItemAtIndexPath:v7];
}

+ (id)getThresholdRangeValueForCharacteristics:(id)a3 inHome:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_msgSend(v6, "hf_characteristicValueManager");
  id v8 = [v7 readValuesForCharacteristics:v5];

  id v9 = [MEMORY[0x1E4F7A0F0] globalAsyncScheduler];
  id v10 = [v8 reschedule:v9];
  BOOL v11 = [v10 flatMap:&__block_literal_global_67];

  id v12 = [MEMORY[0x1E4F7A0F0] globalAsyncScheduler];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __109__HUCharacteristicTriggerServicePickerContentViewController_getThresholdRangeValueForCharacteristics_inHome___block_invoke_3;
  v22[3] = &unk_1E6386340;
  id v23 = v6;
  id v13 = v5;
  id v24 = v13;
  id v25 = v11;
  id v14 = v11;
  id v15 = v6;
  id v16 = (id)[v12 afterDelay:v22 performBlock:0.5];

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __109__HUCharacteristicTriggerServicePickerContentViewController_getThresholdRangeValueForCharacteristics_inHome___block_invoke_4;
  v20[3] = &unk_1E6385648;
  id v21 = v13;
  id v17 = v13;
  id v18 = [v14 flatMap:v20];

  return v18;
}

id __109__HUCharacteristicTriggerServicePickerContentViewController_getThresholdRangeValueForCharacteristics_inHome___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = [v2 allReadResponses];
  uint64_t v4 = [v3 anyObject];
  id v5 = [v4 value];
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    id v8 = [MEMORY[0x1E4F7A0D8] futureWithResult:v7];
  }
  else
  {
    id v9 = [v2 allReadResponses];
    id v10 = objc_msgSend(v9, "na_firstObjectPassingTest:", &__block_literal_global_135);
    BOOL v11 = [v10 error];

    id v8 = [MEMORY[0x1E4F7A0D8] futureWithError:v11];
  }

  return v8;
}

BOOL __109__HUCharacteristicTriggerServicePickerContentViewController_getThresholdRangeValueForCharacteristics_inHome___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 error];
  BOOL v3 = v2 != 0;

  return v3;
}

void __109__HUCharacteristicTriggerServicePickerContentViewController_getThresholdRangeValueForCharacteristics_inHome___block_invoke_3(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "hf_characteristicValueManager");
  BOOL v3 = [*(id *)(a1 + 40) anyObject];
  id v6 = [v2 cachedValueForCharacteristic:v3];

  uint64_t v4 = *(void **)(a1 + 48);
  if (v6)
  {
    [v4 finishWithResult:v6];
  }
  else
  {
    id v5 = objc_msgSend(MEMORY[0x1E4F28C58], "hf_errorWithCode:", 39);
    [v4 finishWithError:v5];
  }
}

id __109__HUCharacteristicTriggerServicePickerContentViewController_getThresholdRangeValueForCharacteristics_inHome___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) anyObject];
  id v5 = [v4 characteristicType];
  int v6 = [v5 isEqualToString:*MEMORY[0x1E4F2CEA8]];

  if (v6)
  {
    id v7 = [*(id *)(a1 + 32) anyObject];
    id v8 = objc_msgSend(v7, "hf_visibleTriggerValues");

    uint64_t v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(MEMORY[0x1E4F2E770], "hf_indexOfSortedValues:closestToValue:", v8, v3));
    id v10 = (void *)v9;
    if (v9) {
      BOOL v11 = (void *)v9;
    }
    else {
      BOOL v11 = v3;
    }
    id v12 = v11;

    id v3 = v12;
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v40 = a1;
  id v13 = *(id *)(a1 + 32);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (!v14)
  {
    id v16 = 0;
    id v17 = 0;
    goto LABEL_22;
  }
  uint64_t v15 = v14;
  id v16 = 0;
  id v17 = 0;
  uint64_t v18 = *(void *)v42;
  do
  {
    for (uint64_t i = 0; i != v15; ++i)
    {
      if (*(void *)v42 != v18) {
        objc_enumerationMutation(v13);
      }
      objc_super v20 = *(void **)(*((void *)&v41 + 1) + 8 * i);
      id v21 = objc_msgSend(v20, "hf_maximumTriggerValue");
      id v22 = objc_msgSend(v20, "hf_minimumTriggerValue");
      if (!v17 || [v21 compare:v17] == -1)
      {
        id v23 = v21;

        id v17 = v23;
        if (v16)
        {
LABEL_16:
          if ([v22 compare:v16] != 1) {
            goto LABEL_18;
          }
        }
      }
      else if (v16)
      {
        goto LABEL_16;
      }
      id v24 = v22;

      id v16 = v24;
LABEL_18:
    }
    uint64_t v15 = [v13 countByEnumeratingWithState:&v41 objects:v45 count:16];
  }
  while (v15);
LABEL_22:

  if ([v3 compare:v17] == 1)
  {
    id v25 = (void *)MEMORY[0x1E4F2E9C8];
    objc_super v26 = [*(id *)(v40 + 32) anyObject];
    v27 = objc_msgSend(v26, "hf_valueBeforeTriggerValue:", v17);
    uint64_t v28 = [v25 numberRangeWithMaxValue:v27];
    goto LABEL_28;
  }
  if ([v3 compare:v16] == -1)
  {
    v36 = (void *)MEMORY[0x1E4F2E9C8];
    objc_super v26 = [*(id *)(v40 + 32) anyObject];
    v27 = objc_msgSend(v26, "hf_valueAfterTriggerValue:", v16);
    uint64_t v28 = [v36 numberRangeWithMinValue:v27];
LABEL_28:
    v37 = (void *)v28;
  }
  else
  {
    [v3 doubleValue];
    double v30 = v29;
    [v16 doubleValue];
    double v32 = vabdd_f64(v30, v31);
    [v3 doubleValue];
    double v34 = v33;
    [v17 doubleValue];
    if (v32 >= vabdd_f64(v34, v35)) {
      [MEMORY[0x1E4F2E9C8] numberRangeWithMaxValue:v3];
    }
    else {
    v37 = [MEMORY[0x1E4F2E9C8] numberRangeWithMinValue:v3];
    }
  }
  v38 = [MEMORY[0x1E4F7A0D8] futureWithResult:v37];

  return v38;
}

- (void)_addCharacteristicEventsForAlarmItem:(id)a3
{
  id v4 = a3;
  uint64_t v28 = [v4 services];
  id v5 = objc_msgSend(v28, "na_map:", &__block_literal_global_142_0);
  int v6 = objc_msgSend(v5, "na_setByFlattening");

  id v7 = [v4 latestResults];
  id v8 = [v7 objectForKeyedSubscript:@"HUCharacteristicTriggerServiceRepresentativeCharacteristicKey"];

  if (v8 && [v6 containsObject:v8])
  {
    uint64_t v9 = [MEMORY[0x1E4F1CAD0] setWithObject:v8];

    int v6 = (void *)v9;
  }
  id v10 = objc_msgSend(MEMORY[0x1E4F2E770], "hf_sensingCharacteristicTypes");
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __98__HUCharacteristicTriggerServicePickerContentViewController__addCharacteristicEventsForAlarmItem___block_invoke_2;
  v34[3] = &unk_1E6387020;
  id v11 = v10;
  id v35 = v11;
  id v12 = objc_msgSend(v6, "na_firstObjectPassingTest:", v34);
  id v13 = [v12 characteristicType];

  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __98__HUCharacteristicTriggerServicePickerContentViewController__addCharacteristicEventsForAlarmItem___block_invoke_3;
  v32[3] = &unk_1E6387020;
  id v14 = v13;
  id v33 = v14;
  uint64_t v15 = objc_msgSend(v6, "na_filter:", v32);
  id v16 = objc_msgSend(MEMORY[0x1E4F2E770], "hf_abnormalValueForSensorCharacteristicType:", v14);
  if (![v15 count]) {
    NSLog(&cfstr_NoAlarmCharact.isa, v4);
  }
  double v29 = v4;
  if (!v16) {
    NSLog(&cfstr_NoAbnormalValu.isa, v14);
  }
  [(HUCharacteristicTriggerServicePickerContentViewController *)self _addTriggerValue:v16 forCharacteristics:v15];
  id v17 = objc_msgSend(MEMORY[0x1E4F2E770], "hf_continuousValueRangeCharacteristicTypes");
  int v18 = [v17 containsObject:v14];

  if (v18)
  {
    int v19 = objc_opt_class();
    objc_super v20 = [(HUItemCollectionViewController *)self itemManager];
    id v21 = [v20 home];
    id v22 = [v19 getThresholdRangeValueForCharacteristics:v15 inHome:v21];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __98__HUCharacteristicTriggerServicePickerContentViewController__addCharacteristicEventsForAlarmItem___block_invoke_4;
    v30[3] = &unk_1E6388FC8;
    v30[4] = self;
    id v31 = v15;
    uint64_t v23 = [v22 flatMap:v30];
    id v24 = self;
    id v25 = v8;
    id v26 = v11;
    v27 = (void *)v23;
    [(HUCharacteristicTriggerServicePickerContentViewController *)v24 setCharacteristicReadFuture:v23];

    id v11 = v26;
    id v8 = v25;
  }
}

id __98__HUCharacteristicTriggerServicePickerContentViewController__addCharacteristicEventsForAlarmItem___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F1CAD0];
  id v3 = [a2 characteristics];
  id v4 = [v2 setWithArray:v3];

  return v4;
}

uint64_t __98__HUCharacteristicTriggerServicePickerContentViewController__addCharacteristicEventsForAlarmItem___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 characteristicType];
  if (v4)
  {
    id v5 = *(void **)(a1 + 32);
    int v6 = [v3 characteristicType];
    uint64_t v7 = [v5 containsObject:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

uint64_t __98__HUCharacteristicTriggerServicePickerContentViewController__addCharacteristicEventsForAlarmItem___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 characteristicType];
  uint64_t v4 = [v2 isEqualToString:v3];

  return v4;
}

uint64_t __98__HUCharacteristicTriggerServicePickerContentViewController__addCharacteristicEventsForAlarmItem___block_invoke_4(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _addTriggerValue:a2 forCharacteristics:*(void *)(a1 + 40)];
  id v2 = (void *)MEMORY[0x1E4F7A0D8];

  return [v2 futureWithNoResult];
}

- (void)_addCharacteristicEventsForOtherDeviceItem:(id)a3
{
  id v4 = a3;
  id v5 = [v4 services];
  int v6 = objc_msgSend(v5, "na_map:", &__block_literal_global_152);
  uint64_t v7 = objc_msgSend(v6, "na_setByFlattening");

  id v19 = 0;
  +[HUCharacteristicEventOptionProvider hasOptionsForServiceVendingItem:v4 outCharacteristicType:&v19];
  id v8 = v19;
  if (!v8) {
    NSLog(&cfstr_NoSupportedCha.isa, v4);
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __104__HUCharacteristicTriggerServicePickerContentViewController__addCharacteristicEventsForOtherDeviceItem___block_invoke_2;
  v17[3] = &unk_1E6387020;
  id v9 = v8;
  id v18 = v9;
  id v10 = objc_msgSend(v7, "na_filter:", v17);
  if (![v10 count]) {
    NSLog(&cfstr_NoCharacterist.isa, v9, v4);
  }
  id v11 = [(HUCharacteristicTriggerServicePickerContentViewController *)self eventBuilderItem];
  id v12 = [v11 setCharacteristics:v10 triggerValue:0];

  id v13 = [v12 deletions];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __104__HUCharacteristicTriggerServicePickerContentViewController__addCharacteristicEventsForOtherDeviceItem___block_invoke_3;
  v16[3] = &unk_1E6388FF0;
  v16[4] = self;
  objc_msgSend(v13, "na_each:", v16);

  id v14 = [v12 additions];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __104__HUCharacteristicTriggerServicePickerContentViewController__addCharacteristicEventsForOtherDeviceItem___block_invoke_4;
  v15[3] = &unk_1E6388FF0;
  v15[4] = self;
  objc_msgSend(v14, "na_each:", v15);
}

id __104__HUCharacteristicTriggerServicePickerContentViewController__addCharacteristicEventsForOtherDeviceItem___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F1CAD0];
  id v3 = [a2 characteristics];
  id v4 = [v2 setWithArray:v3];

  return v4;
}

uint64_t __104__HUCharacteristicTriggerServicePickerContentViewController__addCharacteristicEventsForOtherDeviceItem___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 characteristicType];
  uint64_t v4 = [v2 isEqualToString:v3];

  return v4;
}

void __104__HUCharacteristicTriggerServicePickerContentViewController__addCharacteristicEventsForOtherDeviceItem___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 triggerBuilder];
  [v4 removeEventBuilder:v3];
}

void __104__HUCharacteristicTriggerServicePickerContentViewController__addCharacteristicEventsForOtherDeviceItem___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 triggerBuilder];
  [v4 addEventBuilder:v3];
}

- (void)_addTriggerValue:(id)a3 forCharacteristics:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HUCharacteristicTriggerServicePickerContentViewController *)self eventBuilderItem];
  id v9 = [v8 setCharacteristics:v6 triggerValue:v7];

  id v10 = [v9 deletions];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __97__HUCharacteristicTriggerServicePickerContentViewController__addTriggerValue_forCharacteristics___block_invoke;
  v13[3] = &unk_1E6388FF0;
  v13[4] = self;
  objc_msgSend(v10, "na_each:", v13);

  id v11 = [v9 additions];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __97__HUCharacteristicTriggerServicePickerContentViewController__addTriggerValue_forCharacteristics___block_invoke_2;
  v12[3] = &unk_1E6388FF0;
  v12[4] = self;
  objc_msgSend(v11, "na_each:", v12);
}

void __97__HUCharacteristicTriggerServicePickerContentViewController__addTriggerValue_forCharacteristics___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 triggerBuilder];
  [v4 removeEventBuilder:v3];
}

void __97__HUCharacteristicTriggerServicePickerContentViewController__addTriggerValue_forCharacteristics___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 triggerBuilder];
  [v4 addEventBuilder:v3];
}

- (void)_validateNextButton
{
  id v7 = [(HUSelectableServiceGridViewController *)self selectedItems];
  id v3 = [v7 toSet];
  BOOL v4 = [v3 count] != 0;
  id v5 = [(HUCharacteristicTriggerServicePickerContentViewController *)self effectiveNavigationItem];
  id v6 = [v5 rightBarButtonItem];
  [v6 setEnabled:v4];
}

+ (id)transformationSetBlock
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__HUCharacteristicTriggerServicePickerContentViewController_transformationSetBlock__block_invoke;
  aBlock[3] = &__block_descriptor_40_e23___NSSet_16__0__HFItem_8l;
  void aBlock[4] = a1;
  id v2 = _Block_copy(aBlock);

  return v2;
}

id __83__HUCharacteristicTriggerServicePickerContentViewController_transformationSetBlock__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = &unk_1F1A3D460;
  if ([v3 conformsToProtocol:v4]) {
    id v5 = v3;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __83__HUCharacteristicTriggerServicePickerContentViewController_transformationSetBlock__block_invoke_2;
  v18[3] = &unk_1E6389058;
  id v7 = v6;
  uint64_t v8 = *(void *)(a1 + 32);
  id v19 = v7;
  uint64_t v20 = v8;
  id v9 = __83__HUCharacteristicTriggerServicePickerContentViewController_transformationSetBlock__block_invoke_2((uint64_t)v18);
  id v10 = v9;
  if (v9 && (unint64_t)[v9 count] >= 2)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __83__HUCharacteristicTriggerServicePickerContentViewController_transformationSetBlock__block_invoke_5;
    v15[3] = &unk_1E63890A8;
    id v11 = v3;
    uint64_t v12 = *(void *)(a1 + 32);
    id v16 = v11;
    uint64_t v17 = v12;
    id v13 = objc_msgSend(v10, "na_map:", v15);
  }
  else
  {
    id v13 = objc_msgSend(MEMORY[0x1E4F1CAD0], "na_setWithSafeObject:", v3);
  }

  return v13;
}

id __83__HUCharacteristicTriggerServicePickerContentViewController_transformationSetBlock__block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = [v2 services];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __83__HUCharacteristicTriggerServicePickerContentViewController_transformationSetBlock__block_invoke_3;
    v6[3] = &__block_descriptor_40_e26___NSSet_16__0__HMService_8l;
    void v6[4] = *(void *)(a1 + 40);
    BOOL v4 = objc_msgSend(v3, "na_flatMap:", v6);
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

id __83__HUCharacteristicTriggerServicePickerContentViewController_transformationSetBlock__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  BOOL v4 = [a2 characteristics];
  id v5 = [v3 setWithArray:v4];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __83__HUCharacteristicTriggerServicePickerContentViewController_transformationSetBlock__block_invoke_4;
  v8[3] = &__block_descriptor_40_e26_B16__0__HMCharacteristic_8l;
  v8[4] = *(void *)(a1 + 32);
  id v6 = objc_msgSend(v5, "na_filter:", v8);

  return v6;
}

BOOL __83__HUCharacteristicTriggerServicePickerContentViewController_transformationSetBlock__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  BOOL v4 = [v2 splitCharacteristicResults];
  id v5 = [v3 characteristicType];

  id v6 = [v4 objectForKeyedSubscript:v5];
  BOOL v7 = v6 != 0;

  return v7;
}

id __83__HUCharacteristicTriggerServicePickerContentViewController_transformationSetBlock__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc(MEMORY[0x1E4F69560]);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __83__HUCharacteristicTriggerServicePickerContentViewController_transformationSetBlock__block_invoke_6;
  v10[3] = &unk_1E6389080;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v11 = v3;
  uint64_t v12 = v5;
  id v7 = v3;
  uint64_t v8 = (void *)[v4 initWithSourceItem:v6 transformationBlock:v10];

  return v8;
}

id __83__HUCharacteristicTriggerServicePickerContentViewController_transformationSetBlock__block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = (void *)[a2 mutableCopy];
  [v3 setObject:*(void *)(a1 + 32) forKeyedSubscript:@"HUCharacteristicTriggerServiceRepresentativeCharacteristicKey"];
  id v4 = [*(id *)(a1 + 40) splitCharacteristicResults];
  uint64_t v5 = [*(id *)(a1 + 32) characteristicType];
  uint64_t v6 = [v4 objectForKeyedSubscript:v5];
  [v3 addEntriesFromDictionary:v6];

  return v3;
}

+ (id)splitCharacteristicResults
{
  if (_MergedGlobals_4_0 != -1) {
    dispatch_once(&_MergedGlobals_4_0, &__block_literal_global_173);
  }
  id v2 = (void *)qword_1EA12DF80;

  return v2;
}

void __87__HUCharacteristicTriggerServicePickerContentViewController_splitCharacteristicResults__block_invoke_2()
{
  v24[3] = *MEMORY[0x1E4F143B8];
  v23[0] = *MEMORY[0x1E4F2CE58];
  uint64_t v20 = *MEMORY[0x1E4F68980];
  uint64_t v0 = v20;
  v1 = HFLocalizedString();
  v22[0] = v1;
  uint64_t v21 = *MEMORY[0x1E4F689E8];
  uint64_t v2 = v21;
  id v3 = objc_alloc(MEMORY[0x1E4F68F38]);
  id v4 = (void *)[v3 initWithPackageIdentifier:*MEMORY[0x1E4F68328]];
  v22[1] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v20 count:2];
  v24[0] = v5;
  v23[1] = *MEMORY[0x1E4F2CEC8];
  v18[0] = v0;
  uint64_t v6 = HFLocalizedString();
  v18[1] = v2;
  v19[0] = v6;
  id v7 = objc_alloc(MEMORY[0x1E4F68F38]);
  uint64_t v8 = (void *)[v7 initWithPackageIdentifier:*MEMORY[0x1E4F68338]];
  v19[1] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
  v24[1] = v9;
  v23[2] = *MEMORY[0x1E4F2CED8];
  v16[0] = v0;
  id v10 = HFLocalizedString();
  v16[1] = v2;
  v17[0] = v10;
  id v11 = objc_alloc(MEMORY[0x1E4F68F38]);
  uint64_t v12 = objc_msgSend(v11, "initWithPackageIdentifier:", *MEMORY[0x1E4F68348], v16[0], v2, v10);
  v17[1] = v12;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  v24[2] = v13;
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:3];
  uint64_t v15 = (void *)qword_1EA12DF80;
  qword_1EA12DF80 = v14;
}

- (HFCharacteristicEventBuilderItem)eventBuilderItem
{
  return self->_eventBuilderItem;
}

- (HFEventTriggerBuilder)triggerBuilder
{
  return self->_triggerBuilder;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (unint64_t)source
{
  return self->_source;
}

- (UINavigationItem)effectiveNavigationItem
{
  return self->_effectiveNavigationItem;
}

- (id)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
}

- (NAFuture)characteristicReadFuture
{
  return self->_characteristicReadFuture;
}

- (void)setCharacteristicReadFuture:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characteristicReadFuture, 0);
  objc_storeStrong(&self->_filter, 0);
  objc_storeStrong((id *)&self->_effectiveNavigationItem, 0);
  objc_storeStrong((id *)&self->_triggerBuilder, 0);

  objc_storeStrong((id *)&self->_eventBuilderItem, 0);
}

@end