@interface HUCharacteristicEventServicePickerContentViewController
+ (id)splitCharacteristicResults;
+ (id)transformationSetBlock;
- (BOOL)canSelectItem:(id)a3 indexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)serviceGridItemManager:(id)a3 shouldHideItem:(id)a4;
- (HFCharacteristicEventBuilderItem)eventBuilderItem;
- (HFEventTriggerBuilder)triggerBuilder;
- (HUCharacteristicEventServicePickerContentViewController)initWithFlow:(id)a3 stepIdentifier:(id)a4;
- (HUCharacteristicEventServicePickerContentViewController)initWithServiceGridItemManager:(id)a3;
- (HUCharacteristicEventServicePickerContentViewController)initWithTriggerBuilder:(id)a3 eventBuilderItem:(id)a4 source:(unint64_t)a5;
- (HUCharacteristicEventServicePickerContentViewControllerDelegate)servicePickerDelegate;
- (HUEventUIFlow)flow;
- (NSString)stepIdentifier;
- (id)filter;
- (id)layoutOptionsForSection:(int64_t)a3;
- (unint64_t)source;
- (void)_addCharacteristicEventsForAlarmItem:(id)a3;
- (void)_addCharacteristicEventsForOtherDeviceItem:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)configureCell:(id)a3 forItem:(id)a4;
- (void)didChangeSelection;
- (void)itemManagerDidUpdate:(id)a3;
- (void)setFilter:(id)a3;
- (void)setFlow:(id)a3;
- (void)setServicePickerDelegate:(id)a3;
- (void)setStepIdentifier:(id)a3;
- (void)viewDidLoad;
@end

@implementation HUCharacteristicEventServicePickerContentViewController

- (HUCharacteristicEventServicePickerContentViewController)initWithTriggerBuilder:(id)a3 eventBuilderItem:(id)a4 source:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = [(id)objc_opt_class() transformationSetBlock];
  v12 = +[HUSelectableServiceGridViewController defaultItemProviderCreatorWithOptions:9];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __106__HUCharacteristicEventServicePickerContentViewController_initWithTriggerBuilder_eventBuilderItem_source___block_invoke;
  aBlock[3] = &unk_1E6388F38;
  id v13 = v12;
  id v22 = v13;
  id v14 = v11;
  id v23 = v14;
  v15 = _Block_copy(aBlock);
  v16 = [[HUServiceGridItemManager alloc] initWithDelegate:self shouldGroupByRoom:1 itemProvidersCreator:v15];
  v20.receiver = self;
  v20.super_class = (Class)HUCharacteristicEventServicePickerContentViewController;
  v17 = [(HUSelectableServiceGridViewController *)&v20 initWithServiceGridItemManager:v16];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_eventBuilderItem, a4);
    objc_storeStrong((id *)&v18->_triggerBuilder, a3);
    v18->_source = a5;
    [(HUSelectableServiceGridViewController *)v18 setAllowsMultipleSelection:0];
  }

  return v18;
}

id __106__HUCharacteristicEventServicePickerContentViewController_initWithTriggerBuilder_eventBuilderItem_source___block_invoke(uint64_t a1)
{
  v2 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __106__HUCharacteristicEventServicePickerContentViewController_initWithTriggerBuilder_eventBuilderItem_source___block_invoke_2;
  v5[3] = &unk_1E6388F10;
  id v6 = *(id *)(a1 + 40);
  v3 = objc_msgSend(v2, "na_map:", v5);

  return v3;
}

id __106__HUCharacteristicEventServicePickerContentViewController_initWithTriggerBuilder_eventBuilderItem_source___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x1E4F692E0];
  id v4 = a2;
  v5 = (void *)[[v3 alloc] initWithSourceProvider:v4 multipleTransformationBlock:*(void *)(a1 + 32)];

  return v5;
}

- (HUCharacteristicEventServicePickerContentViewController)initWithFlow:(id)a3 stepIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 viewController:self servicePickerSourceForStep:v7];
  id v9 = [v6 triggerBuilder];
  id v10 = [v6 eventBuilderItem];
  v11 = [(HUCharacteristicEventServicePickerContentViewController *)self initWithTriggerBuilder:v9 eventBuilderItem:v10 source:v8];

  if (v11)
  {
    [(HUCharacteristicEventServicePickerContentViewController *)v11 setFlow:v6];
    [(HUCharacteristicEventServicePickerContentViewController *)v11 setStepIdentifier:v7];
  }

  return v11;
}

- (HUCharacteristicEventServicePickerContentViewController)initWithServiceGridItemManager:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v6 = NSStringFromSelector(sel_initWithFlow_stepIdentifier_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUCharacteristicEventServicePickerContentViewController.m", 91, @"%s is unavailable; use %@ instead",
    "-[HUCharacteristicEventServicePickerContentViewController initWithServiceGridItemManager:]",
    v6);

  return 0;
}

- (void)viewDidLoad
{
  v13.receiver = self;
  v13.super_class = (Class)HUCharacteristicEventServicePickerContentViewController;
  [(HUServiceGridViewController *)&v13 viewDidLoad];
  v3 = [(HUCharacteristicEventServicePickerContentViewController *)self collectionView];
  [v3 _setShouldDeriveVisibleBoundsFromContainingScrollView:1];

  id v4 = [(HUCharacteristicEventServicePickerContentViewController *)self collectionView];
  [v4 setScrollEnabled:0];

  v5 = [(HUCharacteristicEventServicePickerContentViewController *)self collectionView];
  [v5 setClipsToBounds:1];

  id v6 = [MEMORY[0x1E4F428B8] clearColor];
  id v7 = [(HUCharacteristicEventServicePickerContentViewController *)self collectionView];
  [v7 setBackgroundColor:v6];

  uint64_t v8 = [MEMORY[0x1E4F428B8] clearColor];
  id v9 = [(HUCharacteristicEventServicePickerContentViewController *)self view];
  [v9 setBackgroundColor:v8];

  id v10 = [(HUCharacteristicEventServicePickerContentViewController *)self servicePickerDelegate];
  v11 = [(HUSelectableServiceGridViewController *)self selectedItems];
  v12 = [v11 toSet];
  objc_msgSend(v10, "characteristicEventServicePickerContentViewController:didChangeNumberOfSelectedItems:", self, objc_msgSend(v12, "count"));
}

- (void)itemManagerDidUpdate:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v29.receiver = self;
  v29.super_class = (Class)HUCharacteristicEventServicePickerContentViewController;
  [(HUSelectableServiceGridViewController *)&v29 itemManagerDidUpdate:a3];
  objc_super v20 = [MEMORY[0x1E4F1CA80] set];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v4 = [(HUItemCollectionViewController *)self itemManager];
  v5 = [v4 allDisplayedItems];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if (([v10 conformsToProtocol:&unk_1F1A3D460] & 1) == 0) {
          NSLog(&cfstr_OurItemsMustVe.isa);
        }
        if ([v10 conformsToProtocol:&unk_1F1A3D460])
        {
          id v11 = v10;
          v12 = [v11 services];
          v24[0] = MEMORY[0x1E4F143A8];
          v24[1] = 3221225472;
          v24[2] = __80__HUCharacteristicEventServicePickerContentViewController_itemManagerDidUpdate___block_invoke;
          v24[3] = &unk_1E6387048;
          v24[4] = self;
          int v13 = objc_msgSend(v12, "na_any:", v24);

          if (v13)
          {
            v21[0] = MEMORY[0x1E4F143A8];
            v21[1] = 3221225472;
            v21[2] = __80__HUCharacteristicEventServicePickerContentViewController_itemManagerDidUpdate___block_invoke_3;
            v21[3] = &unk_1E6388F60;
            id v14 = v11;
            id v22 = v14;
            id v23 = self;
            if (__80__HUCharacteristicEventServicePickerContentViewController_itemManagerDidUpdate___block_invoke_3((uint64_t)v21)) {
              [v20 addObject:v14];
            }
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v7);
  }

  v15 = (void *)[objc_alloc(MEMORY[0x1E4F692F8]) initWithFromSet:v20];
  v16 = (void *)[v15 copy];
  [(HUSelectableServiceGridViewController *)self setSelectedItems:v16];

  v17 = [(HUCharacteristicEventServicePickerContentViewController *)self servicePickerDelegate];
  v18 = [(HUSelectableServiceGridViewController *)self selectedItems];
  v19 = [v18 toSet];
  objc_msgSend(v17, "characteristicEventServicePickerContentViewController:didChangeNumberOfSelectedItems:", self, objc_msgSend(v19, "count"));
}

uint64_t __80__HUCharacteristicEventServicePickerContentViewController_itemManagerDidUpdate___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 characteristics];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __80__HUCharacteristicEventServicePickerContentViewController_itemManagerDidUpdate___block_invoke_2;
  v6[3] = &unk_1E6387020;
  v6[4] = *(void *)(a1 + 32);
  uint64_t v4 = objc_msgSend(v3, "na_any:", v6);

  return v4;
}

uint64_t __80__HUCharacteristicEventServicePickerContentViewController_itemManagerDidUpdate___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 eventBuilderItem];
  v5 = [v4 characteristics];
  uint64_t v6 = [v5 containsObject:v3];

  return v6;
}

uint64_t __80__HUCharacteristicEventServicePickerContentViewController_itemManagerDidUpdate___block_invoke_3(uint64_t a1)
{
  objc_opt_class();
  v2 = [*(id *)(a1 + 32) latestResults];
  id v3 = [v2 objectForKeyedSubscript:@"HUCharacteristicEventServiceRepresentativeCharacteristicKey"];
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
  v7.super_class = (Class)HUCharacteristicEventServicePickerContentViewController;
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
  v7.super_class = (Class)HUCharacteristicEventServicePickerContentViewController;
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
    v25.super_class = (Class)HUCharacteristicEventServicePickerContentViewController;
    if ([(HUSelectableServiceGridViewController *)&v25 serviceGridItemManager:v6 shouldHideItem:v7])
    {
      goto LABEL_3;
    }
  }
  if (![v7 conformsToProtocol:&unk_1F1A3D460]) {
    goto LABEL_13;
  }
  id v9 = v7;
  unint64_t v10 = [(HUCharacteristicEventServicePickerContentViewController *)self source];
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
      objc_super v20 = [(HUCharacteristicEventServicePickerContentViewController *)self filter];

      if (!v20)
      {
        LOBYTE(v8) = 0;
        goto LABEL_17;
      }
      id v9 = [(HUCharacteristicEventServicePickerContentViewController *)self filter];
      int v8 = (*((uint64_t (**)(id, id))v9 + 2))(v9, v7) ^ 1;
      goto LABEL_15;
    }
  }
  else
  {
    v16 = objc_msgSend(MEMORY[0x1E4F2E770], "hf_sensingCharacteristicTypes");
    v17 = [v9 services];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __97__HUCharacteristicEventServicePickerContentViewController_serviceGridItemManager_shouldHideItem___block_invoke;
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

uint64_t __97__HUCharacteristicEventServicePickerContentViewController_serviceGridItemManager_shouldHideItem___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 characteristics];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __97__HUCharacteristicEventServicePickerContentViewController_serviceGridItemManager_shouldHideItem___block_invoke_2;
  v6[3] = &unk_1E6387020;
  id v7 = *(id *)(a1 + 32);
  uint64_t v4 = objc_msgSend(v3, "na_any:", v6);

  return v4;
}

uint64_t __97__HUCharacteristicEventServicePickerContentViewController_serviceGridItemManager_shouldHideItem___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 characteristicType];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  uint64_t v4 = [(HUCharacteristicEventServicePickerContentViewController *)self triggerBuilder];
  id v5 = [v4 home];
  char v6 = objc_msgSend(v5, "hf_currentUserIsAdministrator");

  return v6;
}

- (void)didChangeSelection
{
  v11.receiver = self;
  v11.super_class = (Class)HUCharacteristicEventServicePickerContentViewController;
  [(HUSelectableServiceGridViewController *)&v11 didChangeSelection];
  id v3 = [(HUSelectableServiceGridViewController *)self selectedItems];
  uint64_t v4 = [v3 toSet];
  id v5 = [v4 anyObject];

  if (v5 && ([v5 conformsToProtocol:&unk_1F1A3D460] & 1) == 0) {
    NSLog(&cfstr_OurItemsMustVe.isa);
  }
  if ([v5 conformsToProtocol:&unk_1F1A3D460])
  {
    id v6 = v5;
    unint64_t v7 = [(HUCharacteristicEventServicePickerContentViewController *)self source];
    if (v7 == 1)
    {
      [(HUCharacteristicEventServicePickerContentViewController *)self _addCharacteristicEventsForOtherDeviceItem:v6];
    }
    else if (!v7)
    {
      [(HUCharacteristicEventServicePickerContentViewController *)self _addCharacteristicEventsForAlarmItem:v6];
    }
  }
  int v8 = [(HUCharacteristicEventServicePickerContentViewController *)self servicePickerDelegate];
  id v9 = [(HUSelectableServiceGridViewController *)self selectedItems];
  unint64_t v10 = [v9 toSet];
  objc_msgSend(v8, "characteristicEventServicePickerContentViewController:didChangeNumberOfSelectedItems:", self, objc_msgSend(v10, "count"));
}

- (BOOL)canSelectItem:(id)a3 indexPath:(id)a4
{
  id v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)HUCharacteristicEventServicePickerContentViewController;
  if ([(HUSelectableServiceGridViewController *)&v20 canSelectItem:v6 indexPath:a4])
  {
    id v7 = v6;
    if ([v7 conformsToProtocol:&unk_1F1A3D460]) {
      int v8 = v7;
    }
    else {
      int v8 = 0;
    }
    id v9 = v8;

    objc_opt_class();
    id v10 = v7;
    if (objc_opt_isKindOfClass()) {
      objc_super v11 = v10;
    }
    else {
      objc_super v11 = 0;
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
      v16 = [v9 services];
      v17 = [(HUCharacteristicEventServicePickerContentViewController *)self triggerBuilder];
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
  int v8 = [(HUItemCollectionViewController *)self itemManager];
  id v9 = [v8 displayedItemAtIndexPath:v7];

  id v10 = v9;
  if ([v10 conformsToProtocol:&unk_1F1A3D460]) {
    objc_super v11 = v10;
  }
  else {
    objc_super v11 = 0;
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

  v16 = [v15 sourceItem];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v18 = (void *)MEMORY[0x1E4F42728];
    int v19 = _HULocalizedStringWithDefaultValue(@"HUDontSetupProgrammableSwitchInAutomationTitle", @"HUDontSetupProgrammableSwitchInAutomationTitle", 1);
    objc_super v20 = @"HUDontSetupProgrammableSwitchInAutomationMessage";
LABEL_12:
    objc_super v25 = _HULocalizedStringWithDefaultValue(v20, v20, 1);
    long long v26 = [v18 alertControllerWithTitle:v19 message:v25 preferredStyle:1];

    long long v27 = (void *)MEMORY[0x1E4F42720];
    long long v28 = _HULocalizedStringWithDefaultValue(@"HUOkTitle", @"HUOkTitle", 1);
    objc_super v29 = [v27 actionWithTitle:v28 style:0 handler:0];
    [v26 addAction:v29];

    [(HUControllableItemCollectionViewController *)self presentViewController:v26 animated:1 completion:0];
    goto LABEL_13;
  }
  if (v12)
  {
    v21 = [v12 services];
    id v22 = [(HUCharacteristicEventServicePickerContentViewController *)self triggerBuilder];
    id v23 = [v22 home];
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
  v30.super_class = (Class)HUCharacteristicEventServicePickerContentViewController;
  [(HUSelectableServiceGridViewController *)&v30 collectionView:v6 didSelectItemAtIndexPath:v7];
}

- (void)_addCharacteristicEventsForAlarmItem:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 services];
  id v5 = objc_msgSend(v4, "na_map:", &__block_literal_global_170);
  id v6 = objc_msgSend(v5, "na_setByFlattening");

  id v7 = [v3 latestResults];
  int v8 = [v7 objectForKeyedSubscript:@"HUCharacteristicEventServiceRepresentativeCharacteristicKey"];

  if (v8 && [v6 containsObject:v8])
  {
    uint64_t v9 = [MEMORY[0x1E4F1CAD0] setWithObject:v8];

    id v6 = (void *)v9;
  }
  id v10 = objc_msgSend(MEMORY[0x1E4F2E770], "hf_sensingCharacteristicTypes");
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __96__HUCharacteristicEventServicePickerContentViewController__addCharacteristicEventsForAlarmItem___block_invoke_2;
  v38[3] = &unk_1E6387020;
  id v32 = v10;
  id v39 = v32;
  objc_super v11 = objc_msgSend(v6, "na_firstObjectPassingTest:", v38);
  id v12 = [v11 characteristicType];

  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __96__HUCharacteristicEventServicePickerContentViewController__addCharacteristicEventsForAlarmItem___block_invoke_3;
  v36[3] = &unk_1E6387020;
  id v13 = v12;
  id v37 = v13;
  id v14 = objc_msgSend(v6, "na_filter:", v36);
  id v15 = objc_msgSend(MEMORY[0x1E4F2E770], "hf_abnormalValueForSensorCharacteristicType:", v13);
  if (![v14 count]) {
    NSLog(&cfstr_NoAlarmCharact.isa, v3);
  }
  v16 = self;
  if (!v15) {
    NSLog(&cfstr_NoAbnormalValu.isa, v13);
  }
  uint64_t v31 = v13;
  v17 = [(HUCharacteristicEventServicePickerContentViewController *)self eventBuilderItem];
  objc_super v30 = v14;
  id v18 = [v17 setCharacteristics:v14 triggerValue:v15];

  uint64_t v19 = [(HUCharacteristicEventServicePickerContentViewController *)self flow];
  if (!v19) {
    goto LABEL_10;
  }
  objc_super v20 = (void *)v19;
  v21 = [(HUCharacteristicEventServicePickerContentViewController *)self flow];
  [(HUCharacteristicEventServicePickerContentViewController *)self stepIdentifier];
  id v22 = v8;
  id v23 = v6;
  BOOL v24 = v4;
  v26 = id v25 = v3;
  int v27 = [v21 shouldSaveEventBuildersToTriggerBuilderForStep:v26];

  id v3 = v25;
  uint64_t v4 = v24;
  id v6 = v23;
  int v8 = v22;
  v16 = self;

  if (v27)
  {
LABEL_10:
    long long v28 = [v18 deletions];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __96__HUCharacteristicEventServicePickerContentViewController__addCharacteristicEventsForAlarmItem___block_invoke_4;
    v35[3] = &unk_1E6388FF0;
    v35[4] = v16;
    objc_msgSend(v28, "na_each:", v35);

    objc_super v29 = [v18 additions];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __96__HUCharacteristicEventServicePickerContentViewController__addCharacteristicEventsForAlarmItem___block_invoke_5;
    v34[3] = &unk_1E6388FF0;
    v34[4] = v16;
    objc_msgSend(v29, "na_each:", v34);
  }
}

id __96__HUCharacteristicEventServicePickerContentViewController__addCharacteristicEventsForAlarmItem___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  id v3 = [a2 characteristics];
  uint64_t v4 = [v2 setWithArray:v3];

  return v4;
}

uint64_t __96__HUCharacteristicEventServicePickerContentViewController__addCharacteristicEventsForAlarmItem___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 characteristicType];
  if (v4)
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = [v3 characteristicType];
    uint64_t v7 = [v5 containsObject:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

uint64_t __96__HUCharacteristicEventServicePickerContentViewController__addCharacteristicEventsForAlarmItem___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 characteristicType];
  uint64_t v4 = [v2 isEqualToString:v3];

  return v4;
}

void __96__HUCharacteristicEventServicePickerContentViewController__addCharacteristicEventsForAlarmItem___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 triggerBuilder];
  [v4 removeEventBuilder:v3];
}

void __96__HUCharacteristicEventServicePickerContentViewController__addCharacteristicEventsForAlarmItem___block_invoke_5(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 triggerBuilder];
  [v4 addEventBuilder:v3];
}

- (void)_addCharacteristicEventsForOtherDeviceItem:(id)a3
{
  id v4 = a3;
  id v5 = [v4 services];
  id v6 = objc_msgSend(v5, "na_map:", &__block_literal_global_128_0);
  uint64_t v7 = objc_msgSend(v6, "na_setByFlattening");

  v30[0] = 0;
  +[HUCharacteristicEventOptionProvider hasOptionsForServiceVendingItem:v4 outCharacteristicType:v30];
  id v8 = v30[0];
  if (!v8) {
    NSLog(&cfstr_NoSupportedCha.isa, v4);
  }
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __102__HUCharacteristicEventServicePickerContentViewController__addCharacteristicEventsForOtherDeviceItem___block_invoke_2;
  v28[3] = &unk_1E6387020;
  id v9 = v8;
  id v29 = v9;
  id v10 = objc_msgSend(v7, "na_filter:", v28);
  if (![v10 count]) {
    NSLog(&cfstr_NoCharacterist.isa, v9, v4);
  }
  objc_super v11 = [(HUCharacteristicEventServicePickerContentViewController *)self eventBuilderItem];
  id v12 = [v11 setCharacteristics:v10 triggerValue:0];

  uint64_t v13 = [(HUCharacteristicEventServicePickerContentViewController *)self flow];
  if (!v13) {
    goto LABEL_7;
  }
  id v14 = (void *)v13;
  [(HUCharacteristicEventServicePickerContentViewController *)self flow];
  id v25 = v10;
  id v15 = v9;
  id v16 = v4;
  v17 = v7;
  v19 = id v18 = v5;
  [(HUCharacteristicEventServicePickerContentViewController *)self stepIdentifier];
  v21 = objc_super v20 = self;
  int v22 = [v19 shouldSaveEventBuildersToTriggerBuilderForStep:v21];

  self = v20;
  id v5 = v18;
  uint64_t v7 = v17;
  id v4 = v16;
  id v9 = v15;
  id v10 = v25;

  if (v22)
  {
LABEL_7:
    id v23 = [v12 deletions];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __102__HUCharacteristicEventServicePickerContentViewController__addCharacteristicEventsForOtherDeviceItem___block_invoke_3;
    v27[3] = &unk_1E6388FF0;
    v27[4] = self;
    objc_msgSend(v23, "na_each:", v27);

    BOOL v24 = [v12 additions];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __102__HUCharacteristicEventServicePickerContentViewController__addCharacteristicEventsForOtherDeviceItem___block_invoke_4;
    v26[3] = &unk_1E6388FF0;
    v26[4] = self;
    objc_msgSend(v24, "na_each:", v26);
  }
}

id __102__HUCharacteristicEventServicePickerContentViewController__addCharacteristicEventsForOtherDeviceItem___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  id v3 = [a2 characteristics];
  id v4 = [v2 setWithArray:v3];

  return v4;
}

uint64_t __102__HUCharacteristicEventServicePickerContentViewController__addCharacteristicEventsForOtherDeviceItem___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 characteristicType];
  uint64_t v4 = [v2 isEqualToString:v3];

  return v4;
}

void __102__HUCharacteristicEventServicePickerContentViewController__addCharacteristicEventsForOtherDeviceItem___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 triggerBuilder];
  [v4 removeEventBuilder:v3];
}

void __102__HUCharacteristicEventServicePickerContentViewController__addCharacteristicEventsForOtherDeviceItem___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 triggerBuilder];
  [v4 addEventBuilder:v3];
}

+ (id)transformationSetBlock
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __81__HUCharacteristicEventServicePickerContentViewController_transformationSetBlock__block_invoke;
  aBlock[3] = &__block_descriptor_40_e23___NSSet_16__0__HFItem_8l;
  void aBlock[4] = a1;
  v2 = _Block_copy(aBlock);

  return v2;
}

id __81__HUCharacteristicEventServicePickerContentViewController_transformationSetBlock__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = &unk_1F1A3D460;
  if ([v3 conformsToProtocol:v4]) {
    id v5 = v3;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __81__HUCharacteristicEventServicePickerContentViewController_transformationSetBlock__block_invoke_2;
  v18[3] = &unk_1E6389058;
  id v7 = v6;
  uint64_t v8 = *(void *)(a1 + 32);
  id v19 = v7;
  uint64_t v20 = v8;
  id v9 = __81__HUCharacteristicEventServicePickerContentViewController_transformationSetBlock__block_invoke_2((uint64_t)v18);
  id v10 = v9;
  if (v9 && (unint64_t)[v9 count] >= 2)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __81__HUCharacteristicEventServicePickerContentViewController_transformationSetBlock__block_invoke_5;
    v15[3] = &unk_1E63890A8;
    id v11 = v3;
    uint64_t v12 = *(void *)(a1 + 32);
    id v16 = v11;
    uint64_t v17 = v12;
    uint64_t v13 = objc_msgSend(v10, "na_map:", v15);
  }
  else
  {
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1CAD0], "na_setWithSafeObject:", v3);
  }

  return v13;
}

id __81__HUCharacteristicEventServicePickerContentViewController_transformationSetBlock__block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = [v2 services];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __81__HUCharacteristicEventServicePickerContentViewController_transformationSetBlock__block_invoke_3;
    v6[3] = &__block_descriptor_40_e26___NSSet_16__0__HMService_8l;
    void v6[4] = *(void *)(a1 + 40);
    id v4 = objc_msgSend(v3, "na_flatMap:", v6);
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

id __81__HUCharacteristicEventServicePickerContentViewController_transformationSetBlock__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = [a2 characteristics];
  id v5 = [v3 setWithArray:v4];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __81__HUCharacteristicEventServicePickerContentViewController_transformationSetBlock__block_invoke_4;
  v8[3] = &__block_descriptor_40_e26_B16__0__HMCharacteristic_8l;
  v8[4] = *(void *)(a1 + 32);
  id v6 = objc_msgSend(v5, "na_filter:", v8);

  return v6;
}

BOOL __81__HUCharacteristicEventServicePickerContentViewController_transformationSetBlock__block_invoke_4(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 splitCharacteristicResults];
  id v5 = [v3 characteristicType];

  id v6 = [v4 objectForKeyedSubscript:v5];
  BOOL v7 = v6 != 0;

  return v7;
}

id __81__HUCharacteristicEventServicePickerContentViewController_transformationSetBlock__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc(MEMORY[0x1E4F69560]);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __81__HUCharacteristicEventServicePickerContentViewController_transformationSetBlock__block_invoke_6;
  v10[3] = &unk_1E6389080;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v11 = v3;
  uint64_t v12 = v5;
  id v7 = v3;
  uint64_t v8 = (void *)[v4 initWithSourceItem:v6 transformationBlock:v10];

  return v8;
}

id __81__HUCharacteristicEventServicePickerContentViewController_transformationSetBlock__block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = (void *)[a2 mutableCopy];
  [v3 setObject:*(void *)(a1 + 32) forKeyedSubscript:@"HUCharacteristicEventServiceRepresentativeCharacteristicKey"];
  id v4 = [*(id *)(a1 + 40) splitCharacteristicResults];
  uint64_t v5 = [*(id *)(a1 + 32) characteristicType];
  uint64_t v6 = [v4 objectForKeyedSubscript:v5];
  [v3 addEntriesFromDictionary:v6];

  return v3;
}

+ (id)splitCharacteristicResults
{
  if (_MergedGlobals_4_4 != -1) {
    dispatch_once(&_MergedGlobals_4_4, &__block_literal_global_149_1);
  }
  v2 = (void *)qword_1EA12E0F0;

  return v2;
}

void __85__HUCharacteristicEventServicePickerContentViewController_splitCharacteristicResults__block_invoke_2()
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
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  v24[2] = v13;
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:3];
  id v15 = (void *)qword_1EA12E0F0;
  qword_1EA12E0F0 = v14;
}

- (HFEventTriggerBuilder)triggerBuilder
{
  return self->_triggerBuilder;
}

- (HFCharacteristicEventBuilderItem)eventBuilderItem
{
  return self->_eventBuilderItem;
}

- (unint64_t)source
{
  return self->_source;
}

- (HUCharacteristicEventServicePickerContentViewControllerDelegate)servicePickerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_servicePickerDelegate);

  return (HUCharacteristicEventServicePickerContentViewControllerDelegate *)WeakRetained;
}

- (void)setServicePickerDelegate:(id)a3
{
}

- (id)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
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
  objc_storeStrong(&self->_filter, 0);
  objc_destroyWeak((id *)&self->_servicePickerDelegate);
  objc_storeStrong((id *)&self->_eventBuilderItem, 0);

  objc_storeStrong((id *)&self->_triggerBuilder, 0);
}

@end