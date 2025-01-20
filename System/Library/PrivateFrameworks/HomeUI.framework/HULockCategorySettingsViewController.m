@interface HULockCategorySettingsViewController
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (HFPinCodeManager)pinCodeManager;
- (HFUserNotificationServiceTopic)topic;
- (HULockCategorySettingsItemManager)lockSettingsItemManager;
- (HULockCategorySettingsViewController)initWithItemManager:(id)a3 collectionViewLayout:(id)a4;
- (HULockCategorySettingsViewController)initWithLockTopic:(id)a3 home:(id)a4;
- (HULockCategorySettingsViewController)initWithLockTopic:(id)a3 pinCodeManager:(id)a4 home:(id)a5;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)configureCell:(id)a3 forItem:(id)a4;
- (void)setLockSettingsItemManager:(id)a3;
- (void)setPinCodeManager:(id)a3;
- (void)setTopic:(id)a3;
@end

@implementation HULockCategorySettingsViewController

- (HULockCategorySettingsViewController)initWithLockTopic:(id)a3 home:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 serviceTypes];
  char v10 = [v9 containsObject:*MEMORY[0x1E4F2DE88]];

  if ((v10 & 1) == 0) {
    NSLog(&cfstr_ErrorThisViewC.isa);
  }
  v11 = [[HULockCategorySettingsItemManager alloc] initWithDelegate:0 topic:v7 home:v8];

  v12 = (void *)[objc_alloc(MEMORY[0x1E4F42848]) initWithAppearance:2];
  v13 = [MEMORY[0x1E4F428B8] systemGroupedBackgroundColor];
  [v12 setBackgroundColor:v13];

  [v12 setHeaderMode:1];
  [v12 setFooterMode:1];
  v14 = [MEMORY[0x1E4F42870] layoutWithListConfiguration:v12];
  v18.receiver = self;
  v18.super_class = (Class)HULockCategorySettingsViewController;
  v15 = [(HUItemCollectionViewController *)&v18 initWithItemManager:v11 collectionViewLayout:v14];
  if (v15)
  {
    v16 = _HULocalizedStringWithDefaultValue(@"HULockCategorySettingsViewControllerTitle", @"HULockCategorySettingsViewControllerTitle", 1);
    [(HULockCategorySettingsViewController *)v15 setTitle:v16];

    objc_storeStrong((id *)&v15->_lockSettingsItemManager, v11);
    objc_storeStrong((id *)&v15->_topic, a3);
  }

  return v15;
}

- (HULockCategorySettingsViewController)initWithLockTopic:(id)a3 pinCodeManager:(id)a4 home:(id)a5
{
  id v9 = a3;
  id obj = a4;
  id v10 = a4;
  id v11 = a5;
  v22 = v10;
  v12 = [[HULockCategorySettingsItemManager alloc] initWithDelegate:0 topic:v9 pinCodeManager:v10 home:v11];
  v13 = [v9 serviceTypes];
  LOBYTE(v10) = [v13 containsObject:*MEMORY[0x1E4F2DE88]];

  if ((v10 & 1) == 0) {
    NSLog(&cfstr_ErrorThisViewC.isa);
  }
  v14 = (void *)[objc_alloc(MEMORY[0x1E4F42848]) initWithAppearance:2];
  v15 = [MEMORY[0x1E4F428B8] systemGroupedBackgroundColor];
  [v14 setBackgroundColor:v15];

  [v14 setHeaderMode:1];
  [v14 setFooterMode:1];
  objc_initWeak(&location, self);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __78__HULockCategorySettingsViewController_initWithLockTopic_pinCodeManager_home___block_invoke;
  v24[3] = &unk_1E6389E00;
  objc_copyWeak(&v26, &location);
  v16 = v12;
  v25 = v16;
  [v14 setItemSeparatorHandler:v24];
  v17 = [MEMORY[0x1E4F42870] layoutWithListConfiguration:v14];
  v23.receiver = self;
  v23.super_class = (Class)HULockCategorySettingsViewController;
  objc_super v18 = [(HUItemCollectionViewController *)&v23 initWithItemManager:v16 collectionViewLayout:v17];
  if (v18)
  {
    v19 = _HULocalizedStringWithDefaultValue(@"HULockCategorySettingsViewControllerTitle", @"HULockCategorySettingsViewControllerTitle", 1);
    [(HULockCategorySettingsViewController *)v18 setTitle:v19];

    objc_storeStrong((id *)&v18->_lockSettingsItemManager, v12);
    objc_storeStrong((id *)&v18->_topic, a3);
    objc_storeStrong((id *)&v18->_pinCodeManager, obj);
  }

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);

  return v18;
}

id __78__HULockCategorySettingsViewController_initWithLockTopic_pinCodeManager_home___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v8 = [v5 section];
  if (v8 == [*(id *)(a1 + 32) sectionIndexForDisplayedSectionIdentifier:@"HULockCategorySettingsPeopleSection"])
  {
    objc_opt_class();
    id v9 = [WeakRetained collectionView];
    id v10 = [v9 cellForItemAtIndexPath:v5];
    if (objc_opt_isKindOfClass()) {
      id v11 = v10;
    }
    else {
      id v11 = 0;
    }
    id v12 = v11;

    v13 = [v12 avatarContentView];
    v14 = [WeakRetained view];
    uint64_t v15 = [v14 effectiveUserInterfaceLayoutDirection];

    v16 = [v13 listContentView];
    v17 = [v16 textLayoutGuide];
    [v17 layoutFrame];
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;

    id v26 = [v13 listContentView];
    objc_msgSend(v12, "convertRect:fromView:", v26, v19, v21, v23, v25);
    double v28 = v27;
    double v30 = v29;

    if (v15 == 1)
    {
      [v12 bounds];
      double v28 = v31 - (v28 + v30);
    }
    objc_msgSend(v6, "setBottomSeparatorInsets:", 0.0, v28, 0.0, 0.0);
  }

  return v6;
}

- (HULockCategorySettingsViewController)initWithItemManager:(id)a3 collectionViewLayout:(id)a4
{
  id v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  id v7 = NSStringFromSelector(sel_initWithLockTopic_home_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HULockCategorySettingsViewController.m", 96, @"%s is unavailable; use %@ instead",
    "-[HULockCategorySettingsViewController initWithItemManager:collectionViewLayout:]",
    v7);

  return 0;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v5 = a3;
  id v6 = [(HULockCategorySettingsViewController *)self lockSettingsItemManager];
  id v7 = [v6 userItemProvider];
  uint64_t v8 = [v7 items];
  [v8 containsObject:v5];

  id v9 = objc_opt_class();

  return (Class)v9;
}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  v44[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v43.receiver = self;
  v43.super_class = (Class)HULockCategorySettingsViewController;
  [(HUItemCollectionViewController *)&v43 configureCell:v6 forItem:v7];
  objc_opt_class();
  id v8 = v6;
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  id v11 = +[HUListContentConfigurationUtilities labelDefaultConfigurationForItem:v7];
  id v12 = objc_alloc_init(MEMORY[0x1E4F42830]);
  v44[0] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:1];
  [v10 setAccessories:v13];

  v14 = [(HULockCategorySettingsViewController *)self lockSettingsItemManager];
  uint64_t v15 = [v14 userItemProvider];
  v16 = [v15 items];
  int v17 = [v16 containsObject:v7];

  if (v17)
  {
    objc_opt_class();
    id v18 = v8;
    if (objc_opt_isKindOfClass()) {
      double v19 = v18;
    }
    else {
      double v19 = 0;
    }
    id v20 = v19;

    [v20 setShowAccessLevelDescription:1];
    double v21 = [v7 latestResults];
    double v22 = [v21 objectForKeyedSubscript:*MEMORY[0x1E4F68C78]];

    if (v22) {
      [v20 setUserHandle:v22];
    }

    goto LABEL_13;
  }
  double v23 = [(HULockCategorySettingsViewController *)self lockSettingsItemManager];
  double v24 = [v23 guestsItem];
  int v25 = [v7 isEqual:v24];

  if (v25)
  {
    id v26 = [v7 latestResults];
    double v27 = [v26 objectForKeyedSubscript:*MEMORY[0x1E4F689F8]];
    [v11 setImage:v27];

    double v28 = [MEMORY[0x1E4F428B8] systemGrayColor];
    double v29 = [v11 imageProperties];
    [v29 setTintColor:v28];

    double v30 = *MEMORY[0x1E4F43BA0];
    id v20 = [v11 imageProperties];
    objc_msgSend(v20, "setReservedLayoutSize:", 37.0, v30);
LABEL_13:

    goto LABEL_14;
  }
  v33 = [(HULockCategorySettingsViewController *)self lockSettingsItemManager];
  v34 = [v33 lockServiceItemProvider];
  v35 = [v34 items];
  int v36 = [v35 containsObject:v7];

  if (v36)
  {
    v37 = [MEMORY[0x1E4F42A80] systemImageNamed:@"lock.fill"];
    [v11 setImage:v37];

    v38 = [MEMORY[0x1E4F68EA0] securityAccessoryTypeGroup];
    v39 = objc_msgSend(v38, "hu_tintColor");
    v40 = [v11 imageProperties];
    [v40 setTintColor:v39];

    v41 = [MEMORY[0x1E4F42A98] configurationWithPointSize:26.0];
    v42 = [v11 imageProperties];
    [v42 setPreferredSymbolConfiguration:v41];

    [v11 setSecondaryText:0];
  }
LABEL_14:
  [v10 setContentConfiguration:v11];
  double v31 = [v7 latestResults];
  v32 = [v31 objectForKeyedSubscript:*MEMORY[0x1E4F68928]];
  [v10 setAccessibilityIdentifier:v32];
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v47.receiver = self;
  v47.super_class = (Class)HULockCategorySettingsViewController;
  [(HUItemCollectionViewController *)&v47 collectionView:v6 didSelectItemAtIndexPath:v7];
  id v8 = [(HUItemCollectionViewController *)self itemManager];
  id v9 = [v8 displayedItemAtIndexPath:v7];

  id v10 = [(HULockCategorySettingsViewController *)self lockSettingsItemManager];
  id v11 = [v10 userItemProvider];
  id v12 = [v11 items];
  int v13 = [v12 containsObject:v9];

  if (v13)
  {
    objc_opt_class();
    id v14 = v9;
    if (objc_opt_isKindOfClass()) {
      uint64_t v15 = v14;
    }
    else {
      uint64_t v15 = 0;
    }
    id v16 = v15;

    int v17 = [v16 user];
    id v18 = [(HUItemCollectionViewController *)self itemManager];
    double v19 = [v18 home];

    objc_initWeak(&location, self);
    id v20 = [(HULockCategorySettingsViewController *)self pinCodeManager];
    double v21 = [v20 userPinCodes];
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __80__HULockCategorySettingsViewController_collectionView_didSelectItemAtIndexPath___block_invoke;
    v41[3] = &unk_1E6389E50;
    objc_copyWeak(&v45, &location);
    id v22 = v17;
    id v42 = v22;
    double v23 = (HUGuestsPinCodesViewController *)v16;
    objc_super v43 = v23;
    id v24 = v19;
    id v44 = v24;
    id v25 = (id)[v21 addSuccessBlock:v41];

    objc_destroyWeak(&v45);
    objc_destroyWeak(&location);

    goto LABEL_14;
  }
  id v26 = [(HULockCategorySettingsViewController *)self lockSettingsItemManager];
  double v27 = [v26 guestsItem];
  int v28 = [v9 isEqual:v27];

  if (v28)
  {
    double v29 = [HUGuestsPinCodesViewController alloc];
    double v30 = [(HULockCategorySettingsViewController *)self pinCodeManager];
    double v23 = [(HUGuestsPinCodesViewController *)v29 initWithPinCodeManager:v30 settingsContext:1];
LABEL_13:

    id v22 = [(HULockCategorySettingsViewController *)self navigationController];
    id v39 = (id)objc_msgSend(v22, "hu_pushPreloadableViewController:animated:", v23, 1);
LABEL_14:

    goto LABEL_15;
  }
  double v31 = [(HULockCategorySettingsViewController *)self lockSettingsItemManager];
  v32 = [v31 lockServiceItemProvider];
  v33 = [v32 items];
  int v34 = [v33 containsObject:v9];

  if (v34)
  {
    id v35 = v9;
    int v36 = &unk_1F1A3D558;
    if ([v35 conformsToProtocol:v36]) {
      v37 = v35;
    }
    else {
      v37 = 0;
    }
    id v38 = v37;

    double v30 = [(HULockCategorySettingsViewController *)self navigationController];
    double v23 = +[HUAccessoryDetailsRouter detailsViewFor:v38 navigationController:v30 dismiss:0];

    goto LABEL_13;
  }
LABEL_15:
  v40 = [v6 cellForItemAtIndexPath:v7];
  [v40 setHighlighted:0];
}

void __80__HULockCategorySettingsViewController_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 56);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __80__HULockCategorySettingsViewController_collectionView_didSelectItemAtIndexPath___block_invoke_2;
  v14[3] = &unk_1E6389E28;
  id v15 = *(id *)(a1 + 32);
  id v6 = objc_msgSend(v4, "na_firstObjectPassingTest:", v14);

  id v7 = *(id *)(a1 + 40);
  if (v6)
  {
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F693B0]) initWithPinCode:v6 inHome:*(void *)(a1 + 48) onAccessory:0];

    id v7 = (id)v8;
  }
  id v9 = [HUPinCodeDetailsViewController alloc];
  id v10 = [WeakRetained pinCodeManager];
  id v11 = [(HUPinCodeDetailsViewController *)v9 initWithItem:v7 pinCodeManager:v10 home:*(void *)(a1 + 48)];

  id v12 = [WeakRetained navigationController];
  id v13 = (id)objc_msgSend(v12, "hu_pushPreloadableViewController:animated:", v11, 1);
}

uint64_t __80__HULockCategorySettingsViewController_collectionView_didSelectItemAtIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 userLabel];
  id v4 = [v3 user];
  id v5 = [v4 uniqueIdentifier];
  id v6 = [*(id *)(a1 + 32) uniqueIdentifier];
  uint64_t v7 = [v5 isEqual:v6];

  return v7;
}

- (HFPinCodeManager)pinCodeManager
{
  return self->_pinCodeManager;
}

- (void)setPinCodeManager:(id)a3
{
}

- (HULockCategorySettingsItemManager)lockSettingsItemManager
{
  return self->_lockSettingsItemManager;
}

- (void)setLockSettingsItemManager:(id)a3
{
}

- (HFUserNotificationServiceTopic)topic
{
  return self->_topic;
}

- (void)setTopic:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topic, 0);
  objc_storeStrong((id *)&self->_lockSettingsItemManager, 0);

  objc_storeStrong((id *)&self->_pinCodeManager, 0);
}

@end