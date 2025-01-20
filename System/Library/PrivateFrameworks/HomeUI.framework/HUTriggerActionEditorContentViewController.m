@interface HUTriggerActionEditorContentViewController
+ (void)_removeDeletedServiceItems:(id)a3 fromTriggerBuilder:(id)a4;
- (BOOL)_canSelectMediaAccessoryItem:(id)a3;
- (BOOL)canSelectItem:(id)a3 indexPath:(id)a4;
- (BOOL)serviceGridItemManager:(id)a3 shouldHideItem:(id)a4;
- (HFTriggerBuilder)triggerBuilder;
- (HUTriggerActionEditorContentViewController)initWithServiceGridItemManager:(id)a3;
- (HUTriggerActionEditorContentViewController)initWithTriggerBuilder:(id)a3 flow:(id)a4 effectiveNavigationItem:(id)a5 delegate:(id)a6;
- (HUTriggerActionFlow)flow;
- (NSSet)existingAnonActionSetMediaProfiles;
- (NSSet)existingSelectedActionSets;
- (NSSet)existingSelectedCharacteristics;
- (UINavigationItem)effectiveNavigationItem;
- (id)_triggerBuilderFuture;
- (id)_updateTriggerBuilderActionSets;
- (id)_updateTriggerBuilderAnonymousActions;
- (id)layoutOptionsForSection:(int64_t)a3;
- (unint64_t)_triggerForceDisableReasonsForActionItem:(id)a3;
- (unint64_t)forceDisableReasonsForSecureCharacteristicControl;
- (void)_addActionSetItems:(id)a3 toTriggerBuilder:(id)a4 inHome:(id)a5;
- (void)_cancel:(id)a3;
- (void)_goToSummaryScreen:(id)a3;
- (void)_next:(id)a3;
- (void)_popAlertWithLocalizedTitle:(id)a3 localizedMessage:(id)a4 actions:(id)a5;
- (void)_presentUnsupportedAlertWithTitle:(id)a3 message:(id)a4;
- (void)_removeDeletedActionSetsItems:(id)a3 fromTriggerBuilder:(id)a4;
- (void)_setUpNavButtons;
- (void)_updateOrRemoveDeletedMediaItems:(id)a3 fromTriggerBuilder:(id)a4;
- (void)_updateSelectedServicesAndActionSets;
- (void)_validateDoneButton;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)configureCell:(id)a3 forItem:(id)a4;
- (void)didChangeSelection;
- (void)goToSummaryScreen;
- (void)itemManager:(id)a3 didUpdateResultsForSourceItem:(id)a4;
- (void)itemManagerDidUpdate:(id)a3;
- (void)setExistingAnonActionSetMediaProfiles:(id)a3;
- (void)setExistingSelectedActionSets:(id)a3;
- (void)setExistingSelectedCharacteristics:(id)a3;
- (void)setFlow:(id)a3;
- (void)setForceDisableReasonsForSecureCharacteristicControl:(unint64_t)a3;
- (void)setTriggerBuilder:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HUTriggerActionEditorContentViewController

- (HUTriggerActionEditorContentViewController)initWithTriggerBuilder:(id)a3 flow:(id)a4 effectiveNavigationItem:(id)a5 delegate:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v27 = a5;
  id v13 = a6;
  v14 = [[HUTriggerBuilderItem alloc] initWithTriggerBuilder:v11 nameType:2];
  v15 = [HUServiceGridItemManager alloc];
  v16 = +[HUSelectableServiceGridViewController defaultItemProviderCreatorWithOptions:29];
  v17 = [(HUServiceGridItemManager *)v15 initWithDelegate:self sourceItem:v14 shouldGroupByRoom:1 shouldShowSectionHeaders:1 itemProvidersCreator:v16];

  v28.receiver = self;
  v28.super_class = (Class)HUTriggerActionEditorContentViewController;
  v18 = [(HUSelectableServiceGridViewController *)&v28 initWithServiceGridItemManager:v17];
  v19 = v18;
  if (v18)
  {
    [(HUServiceGridViewController *)v18 setDelegate:v13];
    objc_storeStrong((id *)&v19->_triggerBuilder, a3);
    objc_storeStrong((id *)&v19->_flow, a4);
    objc_storeStrong((id *)&v19->_effectiveNavigationItem, a5);
    v20 = [v11 name];

    if (!v12 || !v20)
    {
      v21 = [v11 naturalLanguageNameOfType:0];
      [v11 setName:v21];

      v22 = [v11 naturalLanguageNameOfType:1];
      [v11 setDisplayName:v22];

      v23 = [v11 name];

      if (!v23)
      {
        v25 = [MEMORY[0x1E4F28B00] currentHandler];
        [v25 handleFailureInMethod:a2, v19, @"HUTriggerActionEditorContentViewController.m", 72, @"Could not generate name for triggerBuilder: %@", v11 object file lineNumber description];
      }
    }
  }

  return v19;
}

- (HUTriggerActionEditorContentViewController)initWithServiceGridItemManager:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_initWithTriggerBuilder_flow_effectiveNavigationItem_delegate_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUTriggerActionEditorContentViewController.m", 81, @"%s is unavailable; use %@ instead",
    "-[HUTriggerActionEditorContentViewController initWithServiceGridItemManager:]",
    v6);

  return 0;
}

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)HUTriggerActionEditorContentViewController;
  [(HUServiceGridViewController *)&v12 viewDidLoad];
  v3 = _HULocalizedStringWithDefaultValue(@"HUBackButtonTitle", @"HUBackButtonTitle", 1);
  v4 = [(HUTriggerActionEditorContentViewController *)self effectiveNavigationItem];
  [v4 setBackButtonTitle:v3];

  v5 = [(HUTriggerActionEditorContentViewController *)self collectionView];
  [v5 _setShouldDeriveVisibleBoundsFromContainingScrollView:1];

  v6 = [(HUTriggerActionEditorContentViewController *)self collectionView];
  [v6 setScrollEnabled:0];

  v7 = [(HUTriggerActionEditorContentViewController *)self collectionView];
  [v7 setClipsToBounds:1];

  v8 = [MEMORY[0x1E4F428B8] clearColor];
  v9 = [(HUTriggerActionEditorContentViewController *)self collectionView];
  [v9 setBackgroundColor:v8];

  v10 = [MEMORY[0x1E4F428B8] clearColor];
  id v11 = [(HUTriggerActionEditorContentViewController *)self view];
  [v11 setBackgroundColor:v10];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HUTriggerActionEditorContentViewController;
  [(HUServiceGridViewController *)&v6 viewWillAppear:a3];
  v4 = [(HUTriggerActionEditorContentViewController *)self navigationController];
  char v5 = [v4 isBeingDismissed];

  if ((v5 & 1) == 0)
  {
    [(HUTriggerActionEditorContentViewController *)self _setUpNavButtons];
    [(HUTriggerActionEditorContentViewController *)self _updateSelectedServicesAndActionSets];
  }
}

- (void)_setUpNavButtons
{
  v3 = [(HUTriggerActionEditorContentViewController *)self flow];
  if ([v3 isStandalone])
  {
  }
  else
  {
    v4 = [(HUTriggerActionEditorContentViewController *)self flow];
    int v5 = [v4 isSingleFlow];

    if (!v5) {
      goto LABEL_5;
    }
  }
  objc_super v6 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:1 target:self action:sel__cancel_];
  v7 = [(HUTriggerActionEditorContentViewController *)self effectiveNavigationItem];
  [v7 setLeftBarButtonItem:v6];

LABEL_5:
  v8 = [(HUTriggerActionEditorContentViewController *)self flow];
  int v9 = [v8 isLastState];

  id v10 = objc_alloc(MEMORY[0x1E4F427C0]);
  id v11 = v10;
  if (v9)
  {
    objc_super v12 = (void *)[v10 initWithBarButtonSystemItem:0 target:self action:sel__next_];
    id v13 = [(HUTriggerActionEditorContentViewController *)self effectiveNavigationItem];
    [v13 setRightBarButtonItem:v12];
  }
  else
  {
    objc_super v12 = _HULocalizedStringWithDefaultValue(@"HUTriggerActionEditorNextButton", @"HUTriggerActionEditorNextButton", 1);
    id v13 = (void *)[v11 initWithTitle:v12 style:2 target:self action:sel__next_];
    v14 = [(HUTriggerActionEditorContentViewController *)self effectiveNavigationItem];
    [v14 setRightBarButtonItem:v13];
  }

  [(HUTriggerActionEditorContentViewController *)self _validateDoneButton];
}

- (void)_cancel:(id)a3
{
  id v4 = [(HUServiceGridViewController *)self delegate];
  [v4 triggerEditor:self didFinishWithTriggerBuilder:0];
}

- (void)_next:(id)a3
{
  id v4 = a3;
  int v5 = [(HUTriggerActionEditorContentViewController *)self effectiveNavigationItem];
  objc_super v6 = [v5 rightBarButtonItem];

  v7 = (void *)[objc_alloc(MEMORY[0x1E4F42708]) initWithActivityIndicatorStyle:100];
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithCustomView:v7];
  int v9 = [(HUTriggerActionEditorContentViewController *)self effectiveNavigationItem];
  [v9 setRightBarButtonItem:v8];

  [v7 startAnimating];
  id v10 = [(HUTriggerActionEditorContentViewController *)self _triggerBuilderFuture];
  objc_initWeak(&location, self);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __52__HUTriggerActionEditorContentViewController__next___block_invoke;
  v19[3] = &unk_1E6386150;
  objc_copyWeak(&v21, &location);
  id v11 = v6;
  id v20 = v11;
  id v12 = (id)[v10 addCompletionBlock:v19];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __52__HUTriggerActionEditorContentViewController__next___block_invoke_2;
  v17[3] = &unk_1E6386FB8;
  objc_copyWeak(&v18, &location);
  id v13 = (id)[v10 addFailureBlock:v17];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __52__HUTriggerActionEditorContentViewController__next___block_invoke_4;
  v15[3] = &unk_1E63874A0;
  objc_copyWeak(&v16, &location);
  id v14 = (id)[v10 addSuccessBlock:v15];
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __52__HUTriggerActionEditorContentViewController__next___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v11 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v5 = [WeakRetained delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [WeakRetained delegate];
    v8 = [WeakRetained triggerBuilder];
    [v7 triggerEditor:WeakRetained didCommitTriggerBuilder:v8 withError:v11];
  }
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = [WeakRetained effectiveNavigationItem];
  [v10 setRightBarButtonItem:v9];
}

void __52__HUTriggerActionEditorContentViewController__next___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  int v5 = [MEMORY[0x1E4F69110] sharedHandler];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__HUTriggerActionEditorContentViewController__next___block_invoke_3;
  v6[3] = &unk_1E6386018;
  v6[4] = WeakRetained;
  [v5 handleError:v3 retryBlock:v6 cancelBlock:0];
}

uint64_t __52__HUTriggerActionEditorContentViewController__next___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _next:0];
}

void __52__HUTriggerActionEditorContentViewController__next___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained flow];
  v2 = [v1 getNextState];

  if ([v2 isFinished])
  {
    id v3 = [WeakRetained delegate];
    id v4 = [WeakRetained triggerBuilder];
    [v3 triggerEditor:WeakRetained didFinishWithTriggerBuilder:v4];
  }
  else
  {
    [WeakRetained _goToSummaryScreen:v2];
  }
}

- (void)goToSummaryScreen
{
  id v3 = [(HUTriggerActionEditorContentViewController *)self flow];
  id v4 = [v3 getNextState];

  [(HUTriggerActionEditorContentViewController *)self _goToSummaryScreen:v4];
}

- (void)_goToSummaryScreen:(id)a3
{
  id v4 = a3;
  int v5 = [HUTriggerSummaryViewController alloc];
  char v6 = [(HUTriggerActionEditorContentViewController *)self triggerBuilder];
  v7 = [(HUServiceGridViewController *)self delegate];
  id v10 = [(HUTriggerSummaryViewController *)v5 initWithTriggerBuilder:v6 flow:v4 delegate:v7];

  v8 = [(HUTriggerActionEditorContentViewController *)self navigationController];
  id v9 = (id)objc_msgSend(v8, "hu_pushPreloadableViewController:animated:", v10, 1);
}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  id v6 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HUTriggerActionEditorContentViewController;
  [(HUSelectableServiceGridViewController *)&v7 configureCell:v6 forItem:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v6 setShouldColorDescription:0];
  }
}

- (BOOL)canSelectItem:(id)a3 indexPath:(id)a4
{
  id v5 = a3;
  if ([(HUTriggerActionEditorContentViewController *)self _triggerForceDisableReasonsForActionItem:v5])
  {
    id v6 = [(HUSelectableServiceGridViewController *)self selectedItems];
    objc_super v7 = [v6 fromSet];
    int v8 = [v7 containsObject:v5];

    if (!v8) {
      goto LABEL_22;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v9 = 1;
    goto LABEL_23;
  }
  objc_opt_class();
  id v10 = v5;
  id v11 = (objc_opt_isKindOfClass() & 1) != 0 ? v10 : 0;
  id v12 = v11;

  id v13 = [v12 sourceHomeKitItem];

  objc_opt_class();
  LOBYTE(v12) = objc_opt_isKindOfClass();

  if (v12)
  {
LABEL_22:
    char v9 = 0;
    goto LABEL_23;
  }
  objc_opt_class();
  id v14 = v10;
  if (objc_opt_isKindOfClass()) {
    v15 = v14;
  }
  else {
    v15 = 0;
  }
  id v16 = v15;

  v17 = [v16 sourceItem];

  objc_opt_class();
  LOBYTE(v16) = objc_opt_isKindOfClass();

  if ((v16 & 1) == 0)
  {
    if ([v14 conformsToProtocol:&unk_1F1A3D9B0])
    {
      char v9 = [v14 containsActions];
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  objc_opt_class();
  id v18 = v14;
  if (objc_opt_isKindOfClass()) {
    v19 = v18;
  }
  else {
    v19 = 0;
  }
  id v20 = v19;

  objc_opt_class();
  id v21 = [v20 sourceItem];

  if (objc_opt_isKindOfClass()) {
    v22 = v21;
  }
  else {
    v22 = 0;
  }
  id v23 = v22;

  char v9 = [(HUTriggerActionEditorContentViewController *)self _canSelectMediaAccessoryItem:v23];
LABEL_23:

  return v9;
}

- (void)itemManager:(id)a3 didUpdateResultsForSourceItem:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)HUTriggerActionEditorContentViewController;
  id v6 = a4;
  [(HUItemCollectionViewController *)&v11 itemManager:a3 didUpdateResultsForSourceItem:v6];
  objc_super v7 = objc_msgSend(v6, "latestResults", v11.receiver, v11.super_class);

  int v8 = [v7 objectForKeyedSubscript:@"forceDisableReasonsForSecureCharacteristicControl"];
  uint64_t v9 = [v8 integerValue];

  if ([(HUTriggerActionEditorContentViewController *)self forceDisableReasonsForSecureCharacteristicControl] != v9)
  {
    [(HUTriggerActionEditorContentViewController *)self setForceDisableReasonsForSecureCharacteristicControl:v9];
    id v10 = [(HUTriggerActionEditorContentViewController *)self collectionView];
    [v10 reloadData];
  }
}

- (void)itemManagerDidUpdate:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HUTriggerActionEditorContentViewController;
  [(HUSelectableServiceGridViewController *)&v4 itemManagerDidUpdate:a3];
  [(HUTriggerActionEditorContentViewController *)self _updateSelectedServicesAndActionSets];
}

- (id)layoutOptionsForSection:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HUTriggerActionEditorContentViewController;
  objc_super v4 = [(HUServiceGridViewController *)&v7 layoutOptionsForSection:sel_layoutOptionsForSection_];
  id v5 = (void *)[v4 copy];

  if (!a3)
  {
    [v5 sectionTitleMargin];
    [v5 setSectionTitleMargin:9.0];
  }

  return v5;
}

- (void)didChangeSelection
{
  v3.receiver = self;
  v3.super_class = (Class)HUTriggerActionEditorContentViewController;
  [(HUSelectableServiceGridViewController *)&v3 didChangeSelection];
  [(HUTriggerActionEditorContentViewController *)self _validateDoneButton];
}

- (BOOL)serviceGridItemManager:(id)a3 shouldHideItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(id)objc_opt_class() instancesRespondToSelector:sel_serviceGridItemManager_shouldHideItem_]|| (v22.receiver = self, v22.super_class = (Class)HUTriggerActionEditorContentViewController, !-[HUSelectableServiceGridViewController serviceGridItemManager:shouldHideItem:](&v22, sel_serviceGridItemManager_shouldHideItem_, v6, v7)))
  {
    if (![v7 conformsToProtocol:&unk_1F1A3D460]
      || ([(HUTriggerActionEditorContentViewController *)self triggerBuilder],
          uint64_t v9 = objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          char isKindOfClass = objc_opt_isKindOfClass(),
          v9,
          (isKindOfClass & 1) == 0))
    {
      char v8 = 0;
      goto LABEL_15;
    }
    id v11 = v7;
    uint64_t v12 = objc_opt_class();
    id v13 = [(HUTriggerActionEditorContentViewController *)self triggerBuilder];
    if (v13)
    {
      if (objc_opt_isKindOfClass()) {
        id v14 = v13;
      }
      else {
        id v14 = 0;
      }
      v15 = v13;
      if (v14) {
        goto LABEL_13;
      }
      id v16 = [MEMORY[0x1E4F28B00] currentHandler];
      v17 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      [v16 handleFailureInFunction:v17, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v12, objc_opt_class() file lineNumber description];
    }
    v15 = 0;
LABEL_13:

    id v18 = [v15 characteristics];
    v19 = objc_msgSend(v18, "na_map:", &__block_literal_global_149);

    id v20 = [v11 services];

    char v8 = [v19 intersectsSet:v20];
    goto LABEL_15;
  }
  char v8 = 1;
LABEL_15:

  return v8;
}

uint64_t __84__HUTriggerActionEditorContentViewController_serviceGridItemManager_shouldHideItem___block_invoke(uint64_t a1, void *a2)
{
  return [a2 service];
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  v52[2] = *MEMORY[0x1E4F143B8];
  v49.receiver = self;
  v49.super_class = (Class)HUTriggerActionEditorContentViewController;
  id v6 = a4;
  [(HUSelectableServiceGridViewController *)&v49 collectionView:a3 didSelectItemAtIndexPath:v6];
  id v7 = [(HUItemCollectionViewController *)self itemManager];
  char v8 = [v7 displayedItemAtIndexPath:v6];

  objc_opt_class();
  id v9 = v8;
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  uint64_t v12 = [v11 sourceHomeKitItem];
  objc_opt_class();

  LOBYTE(v11) = objc_opt_isKindOfClass();
  if (v11)
  {
    id v13 = @"HUDontSetupProgrammableSwitchInAutomationActionEditorTitle";
    id v14 = @"HUDontSetupProgrammableSwitchInAutomationActionEditorMessage";
LABEL_32:
    [(HUTriggerActionEditorContentViewController *)self _presentUnsupportedAlertWithTitle:v13 message:v14];
    goto LABEL_33;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    && (![v9 conformsToProtocol:&unk_1F1A3D9B0]
     || ([v9 containsActions] & 1) == 0))
  {
    id v13 = @"HUTriggerActionEditorUnsupportedAccessoryTitle";
    id v14 = @"HUTriggerActionEditorUnsupportedAccessoryMessage";
    goto LABEL_32;
  }
  unint64_t v15 = [(HUTriggerActionEditorContentViewController *)self _triggerForceDisableReasonsForActionItem:v9];
  if (!v15) {
    goto LABEL_11;
  }
  unint64_t v16 = v15;
  v17 = [(HUSelectableServiceGridViewController *)self selectedItems];
  id v18 = [v17 fromSet];
  char v19 = [v18 containsObject:v9];

  if ((v19 & 1) == 0)
  {
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __86__HUTriggerActionEditorContentViewController_collectionView_didSelectItemAtIndexPath___block_invoke;
    v46[3] = &unk_1E638D1C8;
    id v47 = v9;
    unint64_t v48 = v16;
    v33 = __86__HUTriggerActionEditorContentViewController_collectionView_didSelectItemAtIndexPath___block_invoke((uint64_t)v46);
    v34 = _HULocalizedStringWithDefaultValue(@"HUTriggerActionEditorConfirmationRequiredButNotPossibleAlertTitle", @"HUTriggerActionEditorConfirmationRequiredButNotPossibleAlertTitle", 1);
    v35 = (void *)MEMORY[0x1E4F42720];
    v36 = _HULocalizedStringWithDefaultValue(@"HUTriggerActionEditorConfirmationRequiredButNotPossibleAlertCancelButton", @"HUTriggerActionEditorConfirmationRequiredButNotPossibleAlertCancelButton", 1);
    v37 = [v35 actionWithTitle:v36 style:1 handler:0];
    v52[0] = v37;
    v38 = (void *)MEMORY[0x1E4F42720];
    v39 = _HULocalizedStringWithDefaultValue(@"HUTriggerActionEditorConfirmationRequiredButNotPossibleAlertGoToSettingsButton", @"HUTriggerActionEditorConfirmationRequiredButNotPossibleAlertGoToSettingsButton", 1);
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __86__HUTriggerActionEditorContentViewController_collectionView_didSelectItemAtIndexPath___block_invoke_2;
    v45[3] = &__block_descriptor_40_e23_v16__0__UIAlertAction_8l;
    v45[4] = v16;
    v40 = [v38 actionWithTitle:v39 style:0 handler:v45];
    v52[1] = v40;
    v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:2];
    [(HUTriggerActionEditorContentViewController *)self _popAlertWithLocalizedTitle:v34 localizedMessage:v33 actions:v41];
  }
  else
  {
LABEL_11:
    objc_opt_class();
    id v20 = v9;
    if (objc_opt_isKindOfClass()) {
      id v21 = v20;
    }
    else {
      id v21 = 0;
    }
    id v22 = v21;

    id v23 = [v22 sourceItem];
    objc_opt_class();

    LOBYTE(v22) = objc_opt_isKindOfClass();
    if (v22)
    {
      objc_opt_class();
      id v24 = v20;
      if (objc_opt_isKindOfClass()) {
        v25 = v24;
      }
      else {
        v25 = 0;
      }
      id v26 = v25;

      objc_opt_class();
      id v27 = [v26 sourceItem];

      if (objc_opt_isKindOfClass()) {
        objc_super v28 = v27;
      }
      else {
        objc_super v28 = 0;
      }
      id v29 = v28;

      if ([v29 allowsAppleMusicAccount]
        && ([v29 supportsMediaAction] & 1) == 0)
      {
        uint64_t v42 = [v29 mediaAccessoryItemType];
        switch(v42)
        {
          case 0:
          case 5:
          case 6:
          case 7:
          case 8:
          case 9:
            v43 = HFLogForCategory();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134217984;
              uint64_t v51 = v42;
              _os_log_error_impl(&dword_1BE345000, v43, OS_LOG_TYPE_ERROR, "Error: got media accessory item type %ld", buf, 0xCu);
            }

            break;
          case 1:
            v44 = @"HUTriggerActionEditorUnsupportedAppleTVMessage";
            goto LABEL_42;
          case 2:
          case 3:
            v44 = @"HUTriggerActionEditorUnsupportedHomePodMessage";
            goto LABEL_42;
          case 4:
            v44 = @"HUTriggerActionEditorUnsupportedHomePodStereoPairMessage";
LABEL_42:
            [(HUTriggerActionEditorContentViewController *)self _presentUnsupportedAlertWithTitle:@"HUAlertSoftwareUpdateRequired" message:v44];
            break;
          default:
            break;
        }
      }
      else
      {
        v30 = [(HUItemCollectionViewController *)self itemManager];
        v31 = [v30 home];

        if (objc_msgSend(v31, "hf_hasEnabledResident")
          && (objc_msgSend(v31, "hf_enabledResidentsSupportsMediaActions") & 1) == 0)
        {
          if ([v29 mediaAccessoryItemType] == 7) {
            v32 = @"HUTriggerActionEditorUnsupportedResidentWithAirPortExpressMessage";
          }
          else {
            v32 = @"HUTriggerActionEditorUnsupportedResidentMessage";
          }
          [(HUTriggerActionEditorContentViewController *)self _presentUnsupportedAlertWithTitle:@"HUAlertSoftwareUpdateRequired" message:v32];
        }
      }
    }
  }
LABEL_33:
}

id __86__HUTriggerActionEditorContentViewController_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t a1)
{
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v3 = @"Service";
  if (isKindOfClass) {
    objc_super v3 = @"Scene";
  }
  if (*(void *)(a1 + 40)) {
    objc_super v4 = @"MustAllowNotifications";
  }
  else {
    objc_super v4 = @"MustAllowAccessWhileLocked";
  }
  id v5 = [NSString stringWithFormat:@"HUTriggerActionEditor%@ToUse%@AlertMessageFormat", v4, v3];
  id v6 = [*(id *)(a1 + 32) latestResults];
  id v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  id v14 = HULocalizedStringWithFormat(v5, @"%@", v8, v9, v10, v11, v12, v13, (uint64_t)v7);

  return v14;
}

void __86__HUTriggerActionEditorContentViewController_collectionView_didSelectItemAtIndexPath___block_invoke_2(uint64_t a1)
{
  id v3 = +[HUTriggerBuilderItem settingsURLForForceDisableReasons:*(void *)(a1 + 32)];
  v1 = [MEMORY[0x1E4F69378] sharedInstance];
  id v2 = (id)[v1 openURL:v3];
}

- (void)_presentUnsupportedAlertWithTitle:(id)a3 message:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F42728];
  id v7 = a4;
  uint64_t v8 = _HULocalizedStringWithDefaultValue(a3, a3, 1);
  uint64_t v9 = _HULocalizedStringWithDefaultValue(v7, v7, 1);

  id v13 = [v6 alertControllerWithTitle:v8 message:v9 preferredStyle:1];

  uint64_t v10 = (void *)MEMORY[0x1E4F42720];
  uint64_t v11 = _HULocalizedStringWithDefaultValue(@"HUOkTitle", @"HUOkTitle", 1);
  uint64_t v12 = [v10 actionWithTitle:v11 style:0 handler:0];
  [v13 addAction:v12];

  [(HUControllableItemCollectionViewController *)self presentViewController:v13 animated:1 completion:0];
}

- (void)_popAlertWithLocalizedTitle:(id)a3 localizedMessage:(id)a4 actions:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  uint64_t v9 = [MEMORY[0x1E4F42728] alertControllerWithTitle:a3 message:a4 preferredStyle:1];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(v9, "addAction:", *(void *)(*((void *)&v15 + 1) + 8 * v14++), (void)v15);
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }

  [(HUControllableItemCollectionViewController *)self presentViewController:v9 animated:1 completion:0];
}

- (id)_triggerBuilderFuture
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F7A0D8];
  objc_super v4 = [(HUTriggerActionEditorContentViewController *)self _updateTriggerBuilderActionSets];
  v11[0] = v4;
  id v5 = [(HUTriggerActionEditorContentViewController *)self _updateTriggerBuilderAnonymousActions];
  v11[1] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  id v7 = [v3 combineAllFutures:v6];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__HUTriggerActionEditorContentViewController__triggerBuilderFuture__block_invoke;
  v10[3] = &unk_1E6385620;
  v10[4] = self;
  id v8 = [v7 flatMap:v10];

  return v8;
}

id __67__HUTriggerActionEditorContentViewController__triggerBuilderFuture__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F7A0D8];
  id v2 = [*(id *)(a1 + 32) triggerBuilder];
  id v3 = [v1 futureWithResult:v2];

  return v3;
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

  LOBYTE(v6) = v5 & objc_msgSend(v7, "hf_enabledResidentsSupportsMediaActions");
  return (char)v6;
}

- (void)_updateSelectedServicesAndActionSets
{
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = [(HUTriggerActionEditorContentViewController *)self triggerBuilder];
  char v5 = [v4 triggerActionSets];
  id v6 = [v5 anonymousActionSetBuilder];
  id v7 = [v6 actions];
  id v8 = objc_msgSend(v7, "na_map:", &__block_literal_global_197_0);
  uint64_t v9 = [v3 setWithArray:v8];

  id v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = [(HUTriggerActionEditorContentViewController *)self triggerBuilder];
  uint64_t v12 = [v11 triggerActionSets];
  uint64_t v13 = [v12 namedActionSets];
  uint64_t v14 = [v10 setWithArray:v13];
  long long v15 = objc_msgSend(v14, "na_map:", &__block_literal_global_201_0);

  long long v16 = [(HUTriggerActionEditorContentViewController *)self triggerBuilder];
  long long v17 = [v16 triggerActionSets];
  long long v18 = [v17 anonymousActionSetBuilder];
  char v19 = [v18 mediaAction];

  uint64_t v20 = [v19 mediaProfiles];
  id v21 = objc_msgSend(v20, "na_flatMap:", &__block_literal_global_204_0);

  if (!v21)
  {
    id v21 = [MEMORY[0x1E4F1CAD0] set];
  }
  id v22 = [(HUTriggerActionEditorContentViewController *)self existingSelectedCharacteristics];
  if ([v22 isEqualToSet:v9])
  {
    id v23 = [(HUTriggerActionEditorContentViewController *)self existingSelectedActionSets];
    if ([v23 isEqualToSet:v15])
    {
      id v24 = [(HUTriggerActionEditorContentViewController *)self existingAnonActionSetMediaProfiles];
      char v25 = [v24 isEqualToSet:v21];

      if (v25) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }
LABEL_9:
  [(HUTriggerActionEditorContentViewController *)self setExistingSelectedCharacteristics:v9];
  [(HUTriggerActionEditorContentViewController *)self setExistingSelectedActionSets:v15];
  [(HUTriggerActionEditorContentViewController *)self setExistingAnonActionSetMediaProfiles:v21];
  id v26 = [(HUItemCollectionViewController *)self itemManager];
  id v27 = [v26 allDisplayedItems];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __82__HUTriggerActionEditorContentViewController__updateSelectedServicesAndActionSets__block_invoke_5;
  v31[3] = &unk_1E638D258;
  id v32 = v15;
  id v33 = v9;
  id v34 = v21;
  objc_super v28 = objc_msgSend(v27, "na_filter:", v31);

  id v29 = (void *)[objc_alloc(MEMORY[0x1E4F692F8]) initWithFromSet:v28];
  v30 = (void *)[v29 copy];
  [(HUSelectableServiceGridViewController *)self setSelectedItems:v30];

LABEL_10:
  [(HUTriggerActionEditorContentViewController *)self _validateDoneButton];
}

id __82__HUTriggerActionEditorContentViewController__updateSelectedServicesAndActionSets__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v2 characteristic];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

uint64_t __82__HUTriggerActionEditorContentViewController__updateSelectedServicesAndActionSets__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 actionSet];
}

id __82__HUTriggerActionEditorContentViewController__updateSelectedServicesAndActionSets__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = [a2 accessories];
  id v3 = objc_msgSend(v2, "na_map:", &__block_literal_global_207_0);

  return v3;
}

uint64_t __82__HUTriggerActionEditorContentViewController__updateSelectedServicesAndActionSets__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 mediaProfile];
}

uint64_t __82__HUTriggerActionEditorContentViewController__updateSelectedServicesAndActionSets__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    uint64_t v5 = objc_opt_class();
    id v6 = [v4 homeKitObject];
    if (v6)
    {
      if (objc_opt_isKindOfClass()) {
        id v7 = v6;
      }
      else {
        id v7 = 0;
      }
      id v8 = v6;
      if (v7) {
        goto LABEL_9;
      }
      uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
      id v10 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      [v9 handleFailureInFunction:v10, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v5, objc_opt_class() file lineNumber description];
    }
    id v8 = 0;
LABEL_9:

    uint64_t v11 = *(void **)(a1 + 32);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __82__HUTriggerActionEditorContentViewController__updateSelectedServicesAndActionSets__block_invoke_6;
    v26[3] = &unk_1E638D230;
    id v27 = v8;
    id v12 = v8;
    uint64_t v13 = objc_msgSend(v11, "na_any:", v26);

    goto LABEL_12;
  }
  if (![v3 conformsToProtocol:&unk_1F1A3D460])
  {
    uint64_t v13 = 0;
    goto LABEL_14;
  }
  id v14 = v3;
  long long v15 = [v14 services];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __82__HUTriggerActionEditorContentViewController__updateSelectedServicesAndActionSets__block_invoke_7;
  v24[3] = &unk_1E6387048;
  id v25 = *(id *)(a1 + 40);
  int v16 = objc_msgSend(v15, "na_any:", v24);

  long long v17 = [v14 accessories];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __82__HUTriggerActionEditorContentViewController__updateSelectedServicesAndActionSets__block_invoke_10;
  v21[3] = &unk_1E6387070;
  id v22 = v14;
  id v23 = *(id *)(a1 + 48);
  id v18 = v14;
  unsigned int v19 = objc_msgSend(v17, "na_any:", v21);

  uint64_t v13 = v16 | v19;
  id v12 = v25;
LABEL_12:

LABEL_14:
  return v13;
}

uint64_t __82__HUTriggerActionEditorContentViewController__updateSelectedServicesAndActionSets__block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueIdentifier];
  id v4 = [*(id *)(a1 + 32) uniqueIdentifier];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

uint64_t __82__HUTriggerActionEditorContentViewController__updateSelectedServicesAndActionSets__block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = [a2 characteristics];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __82__HUTriggerActionEditorContentViewController__updateSelectedServicesAndActionSets__block_invoke_8;
  v6[3] = &unk_1E6387020;
  id v7 = *(id *)(a1 + 32);
  uint64_t v4 = objc_msgSend(v3, "na_any:", v6);

  return v4;
}

uint64_t __82__HUTriggerActionEditorContentViewController__updateSelectedServicesAndActionSets__block_invoke_8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __82__HUTriggerActionEditorContentViewController__updateSelectedServicesAndActionSets__block_invoke_9;
  v8[3] = &unk_1E6387020;
  id v9 = v3;
  id v5 = v3;
  uint64_t v6 = objc_msgSend(v4, "na_any:", v8);

  return v6;
}

uint64_t __82__HUTriggerActionEditorContentViewController__updateSelectedServicesAndActionSets__block_invoke_9(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueIdentifier];
  uint64_t v4 = [*(id *)(a1 + 32) uniqueIdentifier];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

uint64_t __82__HUTriggerActionEditorContentViewController__updateSelectedServicesAndActionSets__block_invoke_10(uint64_t a1, void *a2)
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
  uint64_t v6 = *(void **)(a1 + 40);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __82__HUTriggerActionEditorContentViewController__updateSelectedServicesAndActionSets__block_invoke_11;
  v10[3] = &unk_1E63870E0;
  id v11 = v3;
  id v7 = v3;
  LODWORD(v6) = objc_msgSend(v6, "na_any:", v10);
  uint64_t v8 = (objc_msgSend(v7, "hf_isMediaAccessory") | v5) & v6;

  return v8;
}

uint64_t __82__HUTriggerActionEditorContentViewController__updateSelectedServicesAndActionSets__block_invoke_11(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueIdentifier];
  uint64_t v4 = [*(id *)(a1 + 32) mediaProfile];
  BOOL v5 = [v4 uniqueIdentifier];
  uint64_t v6 = [v3 isEqual:v5];

  return v6;
}

- (id)_updateTriggerBuilderActionSets
{
  uint64_t v4 = [(HUTriggerActionEditorContentViewController *)self triggerBuilder];

  if (!v4)
  {
    int v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"HUTriggerActionEditorContentViewController.m", 551, @"Invalid parameter not satisfying: %@", @"self.triggerBuilder" object file lineNumber description];
  }
  BOOL v5 = [(HUSelectableServiceGridViewController *)self selectedItems];
  uint64_t v6 = [(HUItemCollectionViewController *)self itemManager];
  id v7 = [v6 home];

  uint64_t v8 = [v5 deletions];
  id v9 = [(HUTriggerActionEditorContentViewController *)self triggerBuilder];
  [(HUTriggerActionEditorContentViewController *)self _removeDeletedActionSetsItems:v8 fromTriggerBuilder:v9];

  id v10 = [v5 additions];
  id v11 = [(HUTriggerActionEditorContentViewController *)self triggerBuilder];
  [(HUTriggerActionEditorContentViewController *)self _addActionSetItems:v10 toTriggerBuilder:v11 inHome:v7];

  id v12 = (void *)MEMORY[0x1E4F7A0D8];
  uint64_t v13 = [(HUTriggerActionEditorContentViewController *)self triggerBuilder];
  id v14 = [v12 futureWithResult:v13];

  return v14;
}

- (void)_removeDeletedActionSetsItems:(id)a3 fromTriggerBuilder:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v21 + 1) + 8 * v10);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v12 = v11;
          uint64_t v13 = objc_opt_class();
          id v14 = [v12 homeKitObject];

          id v15 = v14;
          if (!v15) {
            goto LABEL_13;
          }
          if (objc_opt_isKindOfClass()) {
            int v16 = v15;
          }
          else {
            int v16 = 0;
          }
          long long v17 = v15;
          if (!v16)
          {
            uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
            id v18 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
            [v20 handleFailureInFunction:v18, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v13, objc_opt_class() file lineNumber description];

LABEL_13:
            long long v17 = 0;
          }

          if (v17)
          {
            unsigned int v19 = [v6 triggerActionSets];
            [v19 removeActionSetIfPresent:v17];
          }
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
  }
}

- (void)_addActionSetItems:(id)a3 toTriggerBuilder:(id)a4 inHome:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v22 + 1) + 8 * v11);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v13 = v12;
          uint64_t v14 = objc_opt_class();
          id v15 = [v13 homeKitObject];

          id v16 = v15;
          if (!v16) {
            goto LABEL_13;
          }
          if (objc_opt_isKindOfClass()) {
            long long v17 = v16;
          }
          else {
            long long v17 = 0;
          }
          id v18 = v16;
          if (!v17)
          {
            long long v21 = [MEMORY[0x1E4F28B00] currentHandler];
            unsigned int v19 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
            [v21 handleFailureInFunction:v19, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v14, objc_opt_class() file lineNumber description];

LABEL_13:
            id v18 = 0;
          }

          if (v18)
          {
            uint64_t v20 = [v7 triggerActionSets];
            [v20 addActionSetIfNotPresent:v18];
          }
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v9);
  }
}

- (id)_updateTriggerBuilderAnonymousActions
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(HUTriggerActionEditorContentViewController *)self triggerBuilder];

  if (!v4)
  {
    id v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2, self, @"HUTriggerActionEditorContentViewController.m", 601, @"Invalid parameter not satisfying: %@", @"self.triggerBuilder" object file lineNumber description];
  }
  id v33 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
  id v5 = [(HUSelectableServiceGridViewController *)self selectedItems];
  id v6 = [(HUItemCollectionViewController *)self itemManager];
  id v7 = [v6 home];

  uint64_t v8 = objc_opt_class();
  uint64_t v9 = [v5 deletions];
  uint64_t v10 = [(HUTriggerActionEditorContentViewController *)self triggerBuilder];
  [v8 _removeDeletedServiceItems:v9 fromTriggerBuilder:v10];

  uint64_t v11 = [v5 deletions];
  id v12 = [(HUTriggerActionEditorContentViewController *)self triggerBuilder];
  [(HUTriggerActionEditorContentViewController *)self _updateOrRemoveDeletedMediaItems:v11 fromTriggerBuilder:v12];

  id v13 = [MEMORY[0x1E4F1CA48] array];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v14 = [v5 additions];
  id v15 = [v5 updates];
  id v16 = [v14 setByAddingObjectsFromSet:v15];

  uint64_t v17 = [v16 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v41 != v18) {
          objc_enumerationMutation(v16);
        }
        uint64_t v20 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        if ([v20 conformsToProtocol:&unk_1F1A3D9B0])
        {
          long long v21 = [v20 currentStateActionBuildersForHome:v7];
          if (v21) {
            [v13 addObject:v21];
          }
        }
      }
      uint64_t v17 = [v16 countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v17);
  }

  long long v22 = (void *)MEMORY[0x1E4F7A0D8];
  long long v23 = [MEMORY[0x1E4F7A0F0] mainThreadScheduler];
  long long v24 = [v22 combineAllFutures:v13 ignoringErrors:0 scheduler:v23];

  objc_initWeak(&location, self);
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __83__HUTriggerActionEditorContentViewController__updateTriggerBuilderAnonymousActions__block_invoke;
  v36[3] = &unk_1E6387108;
  objc_copyWeak(&v38, &location);
  id v25 = v33;
  id v37 = v25;
  id v26 = (id)[v24 addSuccessBlock:v36];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __83__HUTriggerActionEditorContentViewController__updateTriggerBuilderAnonymousActions__block_invoke_2;
  v34[3] = &unk_1E6386708;
  id v27 = v25;
  id v35 = v27;
  id v28 = (id)[v24 addFailureBlock:v34];
  id v29 = v35;
  id v30 = v27;

  objc_destroyWeak(&v38);
  objc_destroyWeak(&location);

  return v30;
}

void __83__HUTriggerActionEditorContentViewController__updateTriggerBuilderAnonymousActions__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v19 = a1;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v21 = *(void *)v27;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v27 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v26 + 1) + 8 * v7);
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v9 = v8;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v23;
          do
          {
            uint64_t v13 = 0;
            do
            {
              if (*(void *)v23 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void *)(*((void *)&v22 + 1) + 8 * v13);
              id v15 = [WeakRetained triggerBuilder];
              id v16 = [v15 triggerActionSets];
              [v16 addAnonymousActionBuilder:v14];

              ++v13;
            }
            while (v11 != v13);
            uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
          }
          while (v11);
        }

        ++v7;
      }
      while (v7 != v6);
      uint64_t v6 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v6);
  }

  uint64_t v17 = *(void **)(v19 + 32);
  uint64_t v18 = [WeakRetained triggerBuilder];
  [v17 finishWithResult:v18];
}

uint64_t __83__HUTriggerActionEditorContentViewController__updateTriggerBuilderAnonymousActions__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

+ (void)_removeDeletedServiceItems:(id)a3 fromTriggerBuilder:(id)a4
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v48 = a3;
  id v5 = a4;
  uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  uint64_t v7 = [v5 triggerActionSets];
  uint64_t v8 = [v7 anonymousActionSetBuilder];
  id v9 = [v8 actions];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v62 objects:v69 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v63;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v63 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v62 + 1) + 8 * v13);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v15 = [v14 characteristic];
          id v16 = [v15 uniqueIdentifier];

          if (v16) {
            [v6 setObject:v14 forKeyedSubscript:v16];
          }
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v62 objects:v69 count:16];
    }
    while (v11);
  }

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id obj = v48;
  uint64_t v17 = [obj countByEnumeratingWithState:&v58 objects:v68 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v43 = *(void *)v59;
    do
    {
      uint64_t v19 = 0;
      uint64_t v42 = v18;
      do
      {
        if (*(void *)v59 != v43) {
          objc_enumerationMutation(obj);
        }
        id v20 = *(id *)(*((void *)&v58 + 1) + 8 * v19);
        uint64_t v21 = &unk_1F1A3D460;
        if ([v20 conformsToProtocol:v21]) {
          long long v22 = v20;
        }
        else {
          long long v22 = 0;
        }
        id v23 = v22;

        if (v23)
        {
          long long v24 = [v23 accessories];
          long long v25 = [v24 anyObject];
          if (objc_msgSend(v25, "hf_isSiriEndpoint"))
          {
            long long v26 = [v23 services];
            uint64_t v27 = [v26 count];

            if (!v27)
            {
LABEL_42:

              goto LABEL_43;
            }
          }
          else
          {
          }
          v44 = v24;
          id v45 = v23;
          uint64_t v46 = v19;
          long long v28 = [v20 services];
          long long v54 = 0u;
          long long v55 = 0u;
          long long v56 = 0u;
          long long v57 = 0u;
          id v47 = v28;
          uint64_t v29 = [v28 countByEnumeratingWithState:&v54 objects:v67 count:16];
          if (v29)
          {
            uint64_t v30 = v29;
            uint64_t v49 = *(void *)v55;
            do
            {
              uint64_t v31 = 0;
              do
              {
                if (*(void *)v55 != v49) {
                  objc_enumerationMutation(v47);
                }
                uint64_t v32 = *(void **)(*((void *)&v54 + 1) + 8 * v31);
                long long v50 = 0u;
                long long v51 = 0u;
                long long v52 = 0u;
                long long v53 = 0u;
                id v33 = [v32 characteristics];
                uint64_t v34 = [v33 countByEnumeratingWithState:&v50 objects:v66 count:16];
                if (v34)
                {
                  uint64_t v35 = v34;
                  uint64_t v36 = *(void *)v51;
                  do
                  {
                    uint64_t v37 = 0;
                    do
                    {
                      if (*(void *)v51 != v36) {
                        objc_enumerationMutation(v33);
                      }
                      id v38 = [*(id *)(*((void *)&v50 + 1) + 8 * v37) uniqueIdentifier];
                      v39 = [v6 objectForKeyedSubscript:v38];

                      if (v39)
                      {
                        long long v40 = [v5 triggerActionSets];
                        [v40 removeAnonymousActionBuilder:v39];
                      }
                      ++v37;
                    }
                    while (v35 != v37);
                    uint64_t v35 = [v33 countByEnumeratingWithState:&v50 objects:v66 count:16];
                  }
                  while (v35);
                }

                ++v31;
              }
              while (v31 != v30);
              uint64_t v30 = [v47 countByEnumeratingWithState:&v54 objects:v67 count:16];
            }
            while (v30);
          }

          uint64_t v18 = v42;
          id v23 = v45;
          uint64_t v19 = v46;
          long long v24 = v44;
          goto LABEL_42;
        }
LABEL_43:

        ++v19;
      }
      while (v19 != v18);
      uint64_t v18 = [obj countByEnumeratingWithState:&v58 objects:v68 count:16];
    }
    while (v18);
  }
}

- (void)_updateOrRemoveDeletedMediaItems:(id)a3 fromTriggerBuilder:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v20 = a4;
  uint64_t v6 = [v20 triggerActionSets];
  uint64_t v7 = [v6 anonymousActionSetBuilder];
  uint64_t v8 = [v7 mediaAction];

  id v9 = [v8 mediaProfiles];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v10 = v5;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if ([v15 conformsToProtocol:&unk_1F1A3D460])
        {
          id v16 = [v15 accessories];
          v21[0] = MEMORY[0x1E4F143A8];
          v21[1] = 3221225472;
          v21[2] = __98__HUTriggerActionEditorContentViewController__updateOrRemoveDeletedMediaItems_fromTriggerBuilder___block_invoke;
          v21[3] = &unk_1E63870E0;
          id v22 = v16;
          id v17 = v16;
          uint64_t v18 = objc_msgSend(v9, "na_filter:", v21);

          id v9 = (void *)v18;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v12);
  }

  if (v8)
  {
    if ([v9 count])
    {
      [v8 setMediaProfiles:v9];
      uint64_t v19 = [v20 triggerActionSets];
      [v19 updateAnonymousActionBuilder:v8];
    }
    else
    {
      uint64_t v19 = [v20 triggerActionSets];
      [v19 removeAnonymousActionBuilder:v8];
    }
  }
}

uint64_t __98__HUTriggerActionEditorContentViewController__updateOrRemoveDeletedMediaItems_fromTriggerBuilder___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 accessories];
  uint64_t v4 = [v3 intersectsSet:*(void *)(a1 + 32)] ^ 1;

  return v4;
}

- (void)_validateDoneButton
{
  id v7 = [(HUSelectableServiceGridViewController *)self selectedItems];
  id v3 = [v7 toSet];
  BOOL v4 = [v3 count] != 0;
  id v5 = [(HUTriggerActionEditorContentViewController *)self effectiveNavigationItem];
  uint64_t v6 = [v5 rightBarButtonItem];
  [v6 setEnabled:v4];
}

- (unint64_t)_triggerForceDisableReasonsForActionItem:(id)a3
{
  id v4 = a3;
  id v5 = [(HUItemCollectionViewController *)self itemManager];
  uint64_t v6 = [v5 sourceItem];
  id v7 = [v6 latestResults];
  uint64_t v8 = [v7 objectForKeyedSubscript:@"forceDisableReasonsForSecureCharacteristicControl"];
  uint64_t v9 = [v8 integerValue];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __87__HUTriggerActionEditorContentViewController__triggerForceDisableReasonsForActionItem___block_invoke;
  v13[3] = &unk_1E638D280;
  id v14 = v4;
  id v10 = v4;
  if (__87__HUTriggerActionEditorContentViewController__triggerForceDisableReasonsForActionItem___block_invoke((uint64_t)v13)) {
    unint64_t v11 = v9;
  }
  else {
    unint64_t v11 = 0;
  }

  return v11;
}

uint64_t __87__HUTriggerActionEditorContentViewController__triggerForceDisableReasonsForActionItem___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) latestResults];
  id v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F688A0]];
  char v4 = [v3 BOOLValue];

  if (v4) {
    return 1;
  }
  uint64_t result = [*(id *)(a1 + 32) conformsToProtocol:&unk_1F1A3D9B0];
  if (result)
  {
    uint64_t v6 = *(void **)(a1 + 32);
    return [v6 actionsMayRequireDeviceUnlock];
  }
  return result;
}

- (HFTriggerBuilder)triggerBuilder
{
  return self->_triggerBuilder;
}

- (void)setTriggerBuilder:(id)a3
{
}

- (HUTriggerActionFlow)flow
{
  return self->_flow;
}

- (void)setFlow:(id)a3
{
}

- (UINavigationItem)effectiveNavigationItem
{
  return self->_effectiveNavigationItem;
}

- (unint64_t)forceDisableReasonsForSecureCharacteristicControl
{
  return self->_forceDisableReasonsForSecureCharacteristicControl;
}

- (void)setForceDisableReasonsForSecureCharacteristicControl:(unint64_t)a3
{
  self->_forceDisableReasonsForSecureCharacteristicControl = a3;
}

- (NSSet)existingSelectedCharacteristics
{
  return self->_existingSelectedCharacteristics;
}

- (void)setExistingSelectedCharacteristics:(id)a3
{
}

- (NSSet)existingSelectedActionSets
{
  return self->_existingSelectedActionSets;
}

- (void)setExistingSelectedActionSets:(id)a3
{
}

- (NSSet)existingAnonActionSetMediaProfiles
{
  return self->_existingAnonActionSetMediaProfiles;
}

- (void)setExistingAnonActionSetMediaProfiles:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_existingAnonActionSetMediaProfiles, 0);
  objc_storeStrong((id *)&self->_existingSelectedActionSets, 0);
  objc_storeStrong((id *)&self->_existingSelectedCharacteristics, 0);
  objc_storeStrong((id *)&self->_effectiveNavigationItem, 0);
  objc_storeStrong((id *)&self->_flow, 0);

  objc_storeStrong((id *)&self->_triggerBuilder, 0);
}

@end