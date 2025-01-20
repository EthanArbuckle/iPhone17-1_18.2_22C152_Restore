@interface HUSceneServicePickerViewController
- (BOOL)_canSelectMediaAccessoryItem:(id)a3;
- (BOOL)canSelectItem:(id)a3 indexPath:(id)a4;
- (HFActionSetBuilder)actionSetBuilder;
- (HUSceneServicePickerViewController)initWithActionSetBuilder:(id)a3 servicePickerDelegate:(id)a4;
- (HUSceneServicePickerViewController)initWithServiceGridItemManager:(id)a3;
- (HUSceneServicePickerViewControllerDelegate)servicePickerDelegate;
- (NSSet)existingActionSetCharacteristics;
- (NSSet)existingActionSetMediaProfiles;
- (id)_updateActionSetBuilder;
- (id)layoutOptionsForSection:(int64_t)a3;
- (void)_cancel:(id)a3;
- (void)_done:(id)a3;
- (void)_presentUnsupportedAlertWithTitle:(id)a3 message:(id)a4;
- (void)_validateDoneButton;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)configureCell:(id)a3 forItem:(id)a4;
- (void)didChangeSelection;
- (void)itemManagerDidUpdate:(id)a3;
- (void)setExistingActionSetCharacteristics:(id)a3;
- (void)setExistingActionSetMediaProfiles:(id)a3;
- (void)setServicePickerDelegate:(id)a3;
@end

@implementation HUSceneServicePickerViewController

- (HUSceneServicePickerViewController)initWithActionSetBuilder:(id)a3 servicePickerDelegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [HUServiceGridItemManager alloc];
  v10 = +[HUSelectableServiceGridViewController defaultItemProviderCreatorWithOptions:13];
  v11 = [(HUServiceGridItemManager *)v9 initWithDelegate:self shouldGroupByRoom:1 itemProvidersCreator:v10];

  v22.receiver = self;
  v22.super_class = (Class)HUSceneServicePickerViewController;
  v12 = [(HUSelectableServiceGridViewController *)&v22 initWithServiceGridItemManager:v11];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_actionSetBuilder, a3);
    objc_storeWeak((id *)&v13->_servicePickerDelegate, v8);
    v14 = _HULocalizedStringWithDefaultValue(@"HUSceneServicePickerTitle", @"HUSceneServicePickerTitle", 1);
    [(HUSceneServicePickerViewController *)v13 setTitle:v14];

    v15 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:1 target:v13 action:sel__cancel_];
    v16 = [(HUSceneServicePickerViewController *)v13 navigationItem];
    [v16 setLeftBarButtonItem:v15];

    v17 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:0 target:v13 action:sel__done_];
    v18 = [(HUSceneServicePickerViewController *)v13 navigationItem];
    [v18 setRightBarButtonItem:v17];

    v19 = [MEMORY[0x1E4F428B8] systemGroupedBackgroundColor];
    v20 = [(HUSceneServicePickerViewController *)v13 collectionView];
    [v20 setBackgroundColor:v19];

    [(HUSceneServicePickerViewController *)v13 setModalInPresentation:1];
  }

  return v13;
}

- (HUSceneServicePickerViewController)initWithServiceGridItemManager:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_initWithActionSetBuilder_servicePickerDelegate_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUSceneServicePickerViewController.m", 54, @"%s is unavailable; use %@ instead",
    "-[HUSceneServicePickerViewController initWithServiceGridItemManager:]",
    v6);

  return 0;
}

- (void)_cancel:(id)a3
{
  id v4 = [(HUSceneServicePickerViewController *)self servicePickerDelegate];
  [v4 sceneServicePickerDidFinish:self];
}

- (void)_done:(id)a3
{
  id v4 = a3;
  v5 = [(HUSceneServicePickerViewController *)self navigationItem];
  v6 = [v5 rightBarButtonItem];

  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F42708]) initWithActivityIndicatorStyle:100];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithCustomView:v7];
  v9 = [(HUSceneServicePickerViewController *)self navigationItem];
  [v9 setRightBarButtonItem:v8];

  [v7 startAnimating];
  v10 = [(HUSceneServicePickerViewController *)self _updateActionSetBuilder];
  objc_initWeak(&location, self);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __44__HUSceneServicePickerViewController__done___block_invoke;
  v19[3] = &unk_1E6386F90;
  objc_copyWeak(&v20, &location);
  id v11 = (id)[v10 addSuccessBlock:v19];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __44__HUSceneServicePickerViewController__done___block_invoke_2;
  v17[3] = &unk_1E6386FB8;
  objc_copyWeak(&v18, &location);
  id v12 = (id)[v10 addFailureBlock:v17];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __44__HUSceneServicePickerViewController__done___block_invoke_4;
  v15[3] = &unk_1E6384CE0;
  v15[4] = self;
  id v13 = v6;
  id v16 = v13;
  id v14 = (id)[v10 addCompletionBlock:v15];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __44__HUSceneServicePickerViewController__done___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained servicePickerDelegate];
  [v1 sceneServicePickerDidFinish:WeakRetained];
}

void __44__HUSceneServicePickerViewController__done___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v5 = [MEMORY[0x1E4F69110] sharedHandler];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__HUSceneServicePickerViewController__done___block_invoke_3;
  v6[3] = &unk_1E6386018;
  v6[4] = WeakRetained;
  [v5 handleError:v3 retryBlock:v6 cancelBlock:0];
}

uint64_t __44__HUSceneServicePickerViewController__done___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _done:0];
}

void __44__HUSceneServicePickerViewController__done___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) navigationItem];
  [v2 setRightBarButtonItem:v1];
}

- (void)didChangeSelection
{
  v3.receiver = self;
  v3.super_class = (Class)HUSceneServicePickerViewController;
  [(HUSelectableServiceGridViewController *)&v3 didChangeSelection];
  [(HUSceneServicePickerViewController *)self _validateDoneButton];
}

- (void)itemManagerDidUpdate:(id)a3
{
  v28.receiver = self;
  v28.super_class = (Class)HUSceneServicePickerViewController;
  [(HUSelectableServiceGridViewController *)&v28 itemManagerDidUpdate:a3];
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  v5 = [(HUSceneServicePickerViewController *)self actionSetBuilder];
  v6 = [v5 actions];
  id v7 = objc_msgSend(v6, "na_map:", &__block_literal_global_35);
  id v8 = [v4 setWithArray:v7];

  if (!v8)
  {
    id v8 = [MEMORY[0x1E4F1CAD0] set];
  }
  v9 = [(HUSceneServicePickerViewController *)self actionSetBuilder];
  v10 = [v9 mediaAction];

  id v11 = [v10 mediaProfiles];
  id v12 = objc_msgSend(v11, "na_flatMap:", &__block_literal_global_38_0);

  if (!v12)
  {
    id v12 = [MEMORY[0x1E4F1CAD0] set];
  }
  id v13 = [(HUSceneServicePickerViewController *)self existingActionSetCharacteristics];
  if ([v13 isEqualToSet:v8])
  {
    id v14 = [(HUSceneServicePickerViewController *)self existingActionSetMediaProfiles];
    char v15 = [v14 isEqualToSet:v12];

    if (v15) {
      goto LABEL_10;
    }
  }
  else
  {
  }
  [(HUSceneServicePickerViewController *)self setExistingActionSetCharacteristics:v8];
  [(HUSceneServicePickerViewController *)self setExistingActionSetMediaProfiles:v12];
  id v16 = [(HUItemCollectionViewController *)self itemManager];
  v17 = [v16 allDisplayedItems];
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  v24 = __59__HUSceneServicePickerViewController_itemManagerDidUpdate___block_invoke_4;
  v25 = &unk_1E6387098;
  id v26 = v8;
  id v27 = v12;
  id v18 = objc_msgSend(v17, "na_filter:", &v22);

  id v19 = objc_alloc(MEMORY[0x1E4F692F8]);
  id v20 = objc_msgSend(v19, "initWithFromSet:", v18, v22, v23, v24, v25);
  v21 = (void *)[v20 copy];
  [(HUSelectableServiceGridViewController *)self setSelectedItems:v21];

LABEL_10:
  [(HUSceneServicePickerViewController *)self _validateDoneButton];
}

id __59__HUSceneServicePickerViewController_itemManagerDidUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v3 = [v2 characteristic];
  }
  else
  {
    objc_super v3 = 0;
  }

  return v3;
}

id __59__HUSceneServicePickerViewController_itemManagerDidUpdate___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 accessories];
  objc_super v3 = objc_msgSend(v2, "na_map:", &__block_literal_global_41);

  return v3;
}

uint64_t __59__HUSceneServicePickerViewController_itemManagerDidUpdate___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 mediaProfile];
}

uint64_t __59__HUSceneServicePickerViewController_itemManagerDidUpdate___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 conformsToProtocol:&unk_1F1A3D460])
  {
    id v4 = v3;
    v5 = [v4 services];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __59__HUSceneServicePickerViewController_itemManagerDidUpdate___block_invoke_5;
    v15[3] = &unk_1E6387048;
    id v16 = *(id *)(a1 + 32);
    int v6 = objc_msgSend(v5, "na_any:", v15);

    id v7 = [v4 accessories];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __59__HUSceneServicePickerViewController_itemManagerDidUpdate___block_invoke_7;
    v12[3] = &unk_1E6387070;
    id v13 = v4;
    id v14 = *(id *)(a1 + 40);
    id v8 = v4;
    unsigned int v9 = objc_msgSend(v7, "na_any:", v12);

    uint64_t v10 = v6 | v9;
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

uint64_t __59__HUSceneServicePickerViewController_itemManagerDidUpdate___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = [a2 characteristics];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__HUSceneServicePickerViewController_itemManagerDidUpdate___block_invoke_6;
  v6[3] = &unk_1E6387020;
  id v7 = *(id *)(a1 + 32);
  uint64_t v4 = objc_msgSend(v3, "na_any:", v6);

  return v4;
}

uint64_t __59__HUSceneServicePickerViewController_itemManagerDidUpdate___block_invoke_6(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

uint64_t __59__HUSceneServicePickerViewController_itemManagerDidUpdate___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(v3, "hf_isSiriEndpoint"))
  {
    uint64_t v4 = [*(id *)(a1 + 32) services];
    BOOL v5 = [v4 count] == 0;
  }
  else
  {
    BOOL v5 = 0;
  }
  if ((objc_msgSend(v3, "hf_isMediaAccessory") & 1) != 0 || v5)
  {
    id v7 = *(void **)(a1 + 40);
    id v8 = [v3 mediaProfile];
    uint64_t v6 = [v7 containsObject:v8];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)layoutOptionsForSection:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HUSceneServicePickerViewController;
  uint64_t v4 = [(HUServiceGridViewController *)&v7 layoutOptionsForSection:sel_layoutOptionsForSection_];
  BOOL v5 = (void *)[v4 copy];

  if (!a3)
  {
    [v5 sectionTitleMargin];
    [v5 setSectionTitleMargin:40.0];
  }

  return v5;
}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  id v6 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HUSceneServicePickerViewController;
  [(HUSelectableServiceGridViewController *)&v7 configureCell:v6 forItem:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v6 setShouldColorDescription:0];
  }
}

- (BOOL)canSelectItem:(id)a3 indexPath:(id)a4
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v6 = 1;
    goto LABEL_21;
  }
  objc_opt_class();
  id v7 = v5;
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  uint64_t v10 = [v9 sourceItem];

  objc_opt_class();
  LOBYTE(v9) = objc_opt_isKindOfClass();

  if (v9)
  {
LABEL_20:
    char v6 = 0;
    goto LABEL_21;
  }
  objc_opt_class();
  id v11 = v7;
  if (objc_opt_isKindOfClass()) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }
  id v13 = v12;

  id v14 = [v13 sourceItem];

  objc_opt_class();
  LOBYTE(v13) = objc_opt_isKindOfClass();

  if ((v13 & 1) == 0)
  {
    if ([v11 conformsToProtocol:&unk_1F1A3D9B0])
    {
      char v6 = [v11 containsActions];
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  objc_opt_class();
  id v15 = v11;
  if (objc_opt_isKindOfClass()) {
    id v16 = v15;
  }
  else {
    id v16 = 0;
  }
  id v17 = v16;

  objc_opt_class();
  id v18 = [v17 sourceItem];

  if (objc_opt_isKindOfClass()) {
    id v19 = v18;
  }
  else {
    id v19 = 0;
  }
  id v20 = v19;

  char v6 = [(HUSceneServicePickerViewController *)self _canSelectMediaAccessoryItem:v20];
LABEL_21:

  return v6;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v31.receiver = self;
  v31.super_class = (Class)HUSceneServicePickerViewController;
  id v6 = a4;
  [(HUSelectableServiceGridViewController *)&v31 collectionView:a3 didSelectItemAtIndexPath:v6];
  id v7 = [(HUItemCollectionViewController *)self itemManager];
  id v8 = [v7 displayedItemAtIndexPath:v6];

  objc_opt_class();
  id v9 = v8;
  if (objc_opt_isKindOfClass()) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 0;
  }
  id v11 = v10;

  id v12 = [v11 sourceItem];

  objc_opt_class();
  LOBYTE(v11) = objc_opt_isKindOfClass();

  if (v11)
  {
    id v13 = @"HUDontSetupProgrammableSwitchInSceneServicePickerTitle";
    id v14 = @"HUDontSetupProgrammableSwitchInSceneServicePickerMessage";
LABEL_29:
    [(HUSceneServicePickerViewController *)self _presentUnsupportedAlertWithTitle:v13 message:v14];
    goto LABEL_30;
  }
  if (![v9 conformsToProtocol:&unk_1F1A3D9B0]
    || ([v9 containsActions] & 1) == 0)
  {
    id v13 = @"HUSceneServicePickerUnsupportedAccessoryTitle";
    id v14 = @"HUSceneServicePickerUnsupportedAccessoryMessage";
    goto LABEL_29;
  }
  objc_opt_class();
  id v15 = v9;
  if (objc_opt_isKindOfClass()) {
    id v16 = v15;
  }
  else {
    id v16 = 0;
  }
  id v17 = v16;

  id v18 = [v17 sourceItem];

  objc_opt_class();
  LOBYTE(v17) = objc_opt_isKindOfClass();

  if (v17)
  {
    objc_opt_class();
    id v19 = v15;
    if (objc_opt_isKindOfClass()) {
      id v20 = v19;
    }
    else {
      id v20 = 0;
    }
    id v21 = v20;

    objc_opt_class();
    uint64_t v22 = [v21 sourceItem];

    if (objc_opt_isKindOfClass()) {
      uint64_t v23 = v22;
    }
    else {
      uint64_t v23 = 0;
    }
    id v24 = v23;

    if ([v24 allowsAppleMusicAccount]
      && ([v24 supportsMediaAction] & 1) == 0)
    {
      uint64_t v28 = [v24 mediaAccessoryItemType];
      switch(v28)
      {
        case 0:
        case 5:
        case 6:
        case 7:
        case 8:
        case 9:
          v29 = HFLogForCategory();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134217984;
            uint64_t v33 = v28;
            _os_log_error_impl(&dword_1BE345000, v29, OS_LOG_TYPE_ERROR, "Error: got media accessory item type %ld", buf, 0xCu);
          }

          break;
        case 1:
          v30 = @"HUSceneServicePickerUnsupportedAppleTVMessage";
          goto LABEL_38;
        case 2:
        case 3:
          v30 = @"HUSceneServicePickerUnsupportedHomePodMessage";
          goto LABEL_38;
        case 4:
          v30 = @"HUSceneServicePickerUnsupportedHomePodStereoPairMessage";
LABEL_38:
          [(HUSceneServicePickerViewController *)self _presentUnsupportedAlertWithTitle:@"HUAlertSoftwareUpdateRequired" message:v30];
          break;
        default:
          break;
      }
    }
    else
    {
      v25 = [(HUItemCollectionViewController *)self itemManager];
      id v26 = [v25 home];

      if (objc_msgSend(v26, "hf_hasEnabledResident")
        && (objc_msgSend(v26, "hf_enabledResidentsSupportsMediaActions") & 1) == 0)
      {
        if ([v24 mediaAccessoryItemType] == 7) {
          id v27 = @"HUSceneServicePickerUnsupportedResidentWithAirPortExpressMessage";
        }
        else {
          id v27 = @"HUSceneServicePickerUnsupportedResidentMessage";
        }
        [(HUSceneServicePickerViewController *)self _presentUnsupportedAlertWithTitle:@"HUAlertSoftwareUpdateRequired" message:v27];
      }
    }
  }
LABEL_30:
}

- (void)_presentUnsupportedAlertWithTitle:(id)a3 message:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F42728];
  id v7 = a4;
  id v8 = _HULocalizedStringWithDefaultValue(a3, a3, 1);
  id v9 = _HULocalizedStringWithDefaultValue(v7, v7, 1);

  id v13 = [v6 alertControllerWithTitle:v8 message:v9 preferredStyle:1];

  uint64_t v10 = (void *)MEMORY[0x1E4F42720];
  id v11 = _HULocalizedStringWithDefaultValue(@"HUOkTitle", @"HUOkTitle", 1);
  id v12 = [v10 actionWithTitle:v11 style:0 handler:0];
  [v13 addAction:v12];

  [(HUControllableItemCollectionViewController *)self presentViewController:v13 animated:1 completion:0];
}

- (BOOL)_canSelectMediaAccessoryItem:(id)a3
{
  id v4 = a3;
  if ([v4 allowsAppleMusicAccount]) {
    char v5 = [v4 supportsMediaAction];
  }
  else {
    char v5 = 1;
  }
  id v6 = [(HUItemCollectionViewController *)self itemManager];
  id v7 = [v6 home];

  if (objc_msgSend(v7, "hf_hasEnabledResident")) {
    char v8 = objc_msgSend(v7, "hf_enabledResidentsSupportsMediaActions");
  }
  else {
    char v8 = 1;
  }
  char v9 = v5 & v8;

  return v9;
}

- (id)_updateActionSetBuilder
{
  uint64_t v137 = *MEMORY[0x1E4F143B8];
  id v70 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
  val = self;
  v73 = [(HUSelectableServiceGridViewController *)self selectedItems];
  id v3 = [(HUItemCollectionViewController *)self itemManager];
  v81 = [v3 home];

  v84 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v127 = 0u;
  long long v128 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  id v4 = [(HUSceneServicePickerViewController *)val actionSetBuilder];
  char v5 = [v4 actions];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v125 objects:v136 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v126;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v126 != v7) {
          objc_enumerationMutation(v5);
        }
        char v9 = *(void **)(*((void *)&v125 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v10 = [v9 characteristic];
          id v11 = [v10 uniqueIdentifier];

          if (v11) {
            [v84 setObject:v9 forKeyedSubscript:v11];
          }
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v125 objects:v136 count:16];
    }
    while (v6);
  }

  id v12 = [(HUSceneServicePickerViewController *)val actionSetBuilder];
  id v13 = [v12 actions];
  v85 = objc_msgSend(v13, "na_filter:", &__block_literal_global_153);

  long long v123 = 0u;
  long long v124 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  id obj = [v73 deletions];
  uint64_t v74 = [obj countByEnumeratingWithState:&v121 objects:v135 count:16];
  if (v74)
  {
    uint64_t v71 = *(void *)v122;
    do
    {
      for (uint64_t j = 0; j != v74; ++j)
      {
        if (*(void *)v122 != v71) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v121 + 1) + 8 * j);
        if (([v14 conformsToProtocol:&unk_1F1A3D460] & 1) == 0) {
          NSLog(&cfstr_UnexpectedItem_0.isa, v14);
        }
        if ([v14 conformsToProtocol:&unk_1F1A3D460])
        {
          id v76 = [v14 services];
          long long v119 = 0u;
          long long v120 = 0u;
          long long v117 = 0u;
          long long v118 = 0u;
          uint64_t v78 = [v76 countByEnumeratingWithState:&v117 objects:v134 count:16];
          if (v78)
          {
            uint64_t v77 = *(void *)v118;
            do
            {
              uint64_t v15 = 0;
              do
              {
                if (*(void *)v118 != v77)
                {
                  uint64_t v16 = v15;
                  objc_enumerationMutation(v76);
                  uint64_t v15 = v16;
                }
                uint64_t v80 = v15;
                id v17 = *(void **)(*((void *)&v117 + 1) + 8 * v15);
                long long v113 = 0u;
                long long v114 = 0u;
                long long v115 = 0u;
                long long v116 = 0u;
                id v18 = [v17 characteristics];
                uint64_t v19 = [v18 countByEnumeratingWithState:&v113 objects:v133 count:16];
                if (v19)
                {
                  uint64_t v20 = *(void *)v114;
                  do
                  {
                    for (uint64_t k = 0; k != v19; ++k)
                    {
                      if (*(void *)v114 != v20) {
                        objc_enumerationMutation(v18);
                      }
                      uint64_t v22 = *(void **)(*((void *)&v113 + 1) + 8 * k);
                      uint64_t v23 = [v22 uniqueIdentifier];
                      BOOL v24 = v23 == 0;

                      if (!v24)
                      {
                        v25 = [v22 uniqueIdentifier];
                        id v26 = [v84 objectForKeyedSubscript:v25];

                        if (v26)
                        {
                          id v27 = [(HUSceneServicePickerViewController *)val actionSetBuilder];
                          [v27 removeAction:v26];
                        }
                      }
                    }
                    uint64_t v19 = [v18 countByEnumeratingWithState:&v113 objects:v133 count:16];
                  }
                  while (v19);
                }

                long long v111 = 0u;
                long long v112 = 0u;
                long long v109 = 0u;
                long long v110 = 0u;
                objc_msgSend(v17, "hf_lightProfiles");
                id v82 = (id)objc_claimAutoreleasedReturnValue();
                uint64_t v28 = [v82 countByEnumeratingWithState:&v109 objects:v132 count:16];
                if (v28)
                {
                  uint64_t v86 = *(void *)v110;
                  do
                  {
                    for (uint64_t m = 0; m != v28; ++m)
                    {
                      if (*(void *)v110 != v86) {
                        objc_enumerationMutation(v82);
                      }
                      uint64_t v30 = *(void *)(*((void *)&v109 + 1) + 8 * m);
                      long long v105 = 0u;
                      long long v106 = 0u;
                      long long v107 = 0u;
                      long long v108 = 0u;
                      id v31 = v85;
                      uint64_t v32 = [v31 countByEnumeratingWithState:&v105 objects:v131 count:16];
                      if (v32)
                      {
                        uint64_t v33 = *(void *)v106;
                        while (2)
                        {
                          for (uint64_t n = 0; n != v32; ++n)
                          {
                            if (*(void *)v106 != v33) {
                              objc_enumerationMutation(v31);
                            }
                            v35 = *(void **)(*((void *)&v105 + 1) + 8 * n);
                            v36 = [v35 lightProfile];
                            int v37 = [v36 isEqual:v30];

                            if (v37)
                            {
                              v38 = [(HUSceneServicePickerViewController *)val actionSetBuilder];
                              [v38 removeAction:v35];

                              goto LABEL_51;
                            }
                          }
                          uint64_t v32 = [v31 countByEnumeratingWithState:&v105 objects:v131 count:16];
                          if (v32) {
                            continue;
                          }
                          break;
                        }
                      }
LABEL_51:
                    }
                    uint64_t v28 = [v82 countByEnumeratingWithState:&v109 objects:v132 count:16];
                  }
                  while (v28);
                }

                uint64_t v15 = v80 + 1;
              }
              while (v80 + 1 != v78);
              uint64_t v78 = [v76 countByEnumeratingWithState:&v117 objects:v134 count:16];
            }
            while (v78);
          }
        }
      }
      uint64_t v74 = [obj countByEnumeratingWithState:&v121 objects:v135 count:16];
    }
    while (v74);
  }

  v39 = [(HUSceneServicePickerViewController *)val actionSetBuilder];
  v79 = [v39 mediaAction];

  v87 = [v79 mediaProfiles];
  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  id v83 = [v73 deletions];
  uint64_t v40 = [v83 countByEnumeratingWithState:&v101 objects:v130 count:16];
  if (v40)
  {
    uint64_t v41 = *(void *)v102;
    do
    {
      for (iuint64_t i = 0; ii != v40; ++ii)
      {
        if (*(void *)v102 != v41) {
          objc_enumerationMutation(v83);
        }
        v43 = *(void **)(*((void *)&v101 + 1) + 8 * ii);
        if (([v43 conformsToProtocol:&unk_1F1A3D460] & 1) == 0) {
          NSLog(&cfstr_UnexpectedItem_0.isa, v43);
        }
        id v44 = v43;
        v45 = [v44 accessories];
        v46 = [v45 anyObject];
        if (objc_msgSend(v46, "hf_isSiriEndpoint"))
        {
          v47 = [v44 services];
          BOOL v48 = [v47 count] != 0;
        }
        else
        {
          BOOL v48 = 0;
        }

        if ((([v44 conformsToProtocol:&unk_1F1A3D460] ^ 1 | v48) & 1) == 0)
        {
          v99[0] = MEMORY[0x1E4F143A8];
          v99[1] = 3221225472;
          v99[2] = __61__HUSceneServicePickerViewController__updateActionSetBuilder__block_invoke_2;
          v99[3] = &unk_1E63870E0;
          id v100 = v45;
          uint64_t v49 = objc_msgSend(v87, "na_filter:", v99);

          v87 = (void *)v49;
        }
      }
      uint64_t v40 = [v83 countByEnumeratingWithState:&v101 objects:v130 count:16];
    }
    while (v40);
  }

  if (v79)
  {
    if ([v87 count])
    {
      [v79 setMediaProfiles:v87];
      v50 = [(HUSceneServicePickerViewController *)val actionSetBuilder];
      [v50 updateAction:v79];
    }
    else
    {
      v50 = [(HUSceneServicePickerViewController *)val actionSetBuilder];
      [v50 removeAction:v79];
    }
  }
  v51 = [MEMORY[0x1E4F1CA48] array];
  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  v52 = [v73 additions];
  v53 = [v73 updates];
  v54 = [v52 setByAddingObjectsFromSet:v53];

  uint64_t v55 = [v54 countByEnumeratingWithState:&v95 objects:v129 count:16];
  if (v55)
  {
    uint64_t v56 = *(void *)v96;
    do
    {
      for (uint64_t jj = 0; jj != v55; ++jj)
      {
        if (*(void *)v96 != v56) {
          objc_enumerationMutation(v54);
        }
        v58 = *(void **)(*((void *)&v95 + 1) + 8 * jj);
        if (([v58 conformsToProtocol:&unk_1F1A3D9B0] & 1) == 0) {
          NSLog(&cfstr_UnexpectedItem_1.isa, v58);
        }
        if ([v58 conformsToProtocol:&unk_1F1A3D9B0])
        {
          v59 = [v58 currentStateActionBuildersForHome:v81];
          if (v59) {
            [v51 addObject:v59];
          }
        }
      }
      uint64_t v55 = [v54 countByEnumeratingWithState:&v95 objects:v129 count:16];
    }
    while (v55);
  }

  v60 = (void *)MEMORY[0x1E4F7A0D8];
  v61 = [MEMORY[0x1E4F7A0F0] mainThreadScheduler];
  v62 = [v60 combineAllFutures:v51 ignoringErrors:0 scheduler:v61];

  objc_initWeak(&location, val);
  v91[0] = MEMORY[0x1E4F143A8];
  v91[1] = 3221225472;
  v91[2] = __61__HUSceneServicePickerViewController__updateActionSetBuilder__block_invoke_3;
  v91[3] = &unk_1E6387108;
  objc_copyWeak(&v93, &location);
  id v63 = v70;
  id v92 = v63;
  id v64 = (id)[v62 addSuccessBlock:v91];
  v89[0] = MEMORY[0x1E4F143A8];
  v89[1] = 3221225472;
  v89[2] = __61__HUSceneServicePickerViewController__updateActionSetBuilder__block_invoke_4;
  v89[3] = &unk_1E6386708;
  id v65 = v63;
  id v90 = v65;
  id v66 = (id)[v62 addFailureBlock:v89];
  v67 = v90;
  id v68 = v65;

  objc_destroyWeak(&v93);
  objc_destroyWeak(&location);

  return v68;
}

uint64_t __61__HUSceneServicePickerViewController__updateActionSetBuilder__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __61__HUSceneServicePickerViewController__updateActionSetBuilder__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 accessories];
  uint64_t v4 = [v3 intersectsSet:*(void *)(a1 + 32)] ^ 1;

  return v4;
}

void __61__HUSceneServicePickerViewController__updateActionSetBuilder__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v19 = a1;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v26;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(obj);
        }
        char v9 = *(void **)(*((void *)&v25 + 1) + 8 * v8);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v10 = v9;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v22;
          do
          {
            uint64_t v14 = 0;
            do
            {
              if (*(void *)v22 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void *)(*((void *)&v21 + 1) + 8 * v14);
              uint64_t v16 = objc_msgSend(WeakRetained, "actionSetBuilder", v19);
              [v16 addAction:v15];

              ++v14;
            }
            while (v12 != v14);
            uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
          }
          while (v12);
        }

        ++v8;
      }
      while (v8 != v6);
      uint64_t v6 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v6);
  }

  id v17 = *(void **)(v19 + 32);
  id v18 = [WeakRetained actionSetBuilder];
  [v17 finishWithResult:v18];
}

uint64_t __61__HUSceneServicePickerViewController__updateActionSetBuilder__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

- (void)_validateDoneButton
{
  id v7 = [(HUSelectableServiceGridViewController *)self selectedItems];
  id v3 = [v7 toSet];
  BOOL v4 = [v3 count] != 0;
  uint64_t v5 = [(HUSceneServicePickerViewController *)self navigationItem];
  uint64_t v6 = [v5 rightBarButtonItem];
  [v6 setEnabled:v4];
}

- (HUSceneServicePickerViewControllerDelegate)servicePickerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_servicePickerDelegate);

  return (HUSceneServicePickerViewControllerDelegate *)WeakRetained;
}

- (void)setServicePickerDelegate:(id)a3
{
}

- (HFActionSetBuilder)actionSetBuilder
{
  return self->_actionSetBuilder;
}

- (NSSet)existingActionSetCharacteristics
{
  return self->_existingActionSetCharacteristics;
}

- (void)setExistingActionSetCharacteristics:(id)a3
{
}

- (NSSet)existingActionSetMediaProfiles
{
  return self->_existingActionSetMediaProfiles;
}

- (void)setExistingActionSetMediaProfiles:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_existingActionSetMediaProfiles, 0);
  objc_storeStrong((id *)&self->_existingActionSetCharacteristics, 0);
  objc_storeStrong((id *)&self->_actionSetBuilder, 0);

  objc_destroyWeak((id *)&self->_servicePickerDelegate);
}

@end