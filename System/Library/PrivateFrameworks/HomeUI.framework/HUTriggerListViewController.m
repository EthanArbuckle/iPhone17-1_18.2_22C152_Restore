@interface HUTriggerListViewController
- (BOOL)isTransitioningSizes;
- (BOOL)shouldHideFooterBelowSection:(int64_t)a3;
- (BOOL)shouldHideHeaderAboveSection:(int64_t)a3;
- (BOOL)shouldHideSeparatorsForCell:(id)a3 indexPath:(id)a4;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (HUGridLayoutOptions)layoutOptions;
- (HUNavigationBarButton)navigationAddButton;
- (HUTriggerListItemManager)triggerItemManager;
- (HUTriggerListViewController)init;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (id)_deleteItem:(id)a3;
- (id)addActionDelegateForNavigationBarButton:(id)a3;
- (id)homeForNavigationBarButton:(id)a3;
- (id)roomForNavigationBarButton:(id)a3;
- (id)trailingSwipeActionsForItem:(id)a3;
- (unint64_t)automaticDisablingReasonsForItem:(id)a3;
- (unint64_t)editorPresentationMode;
- (void)_addTrigger:(id)a3;
- (void)_showSummaryForTriggerItem:(id)a3;
- (void)aboutResidentDeviceViewControllerDidFinish:(id)a3;
- (void)coloredButtonCellPressed:(id)a3;
- (void)learnMoreLinkTapped:(id)a3;
- (void)setEditorPresentationMode:(unint64_t)a3;
- (void)setIsTransitioningSizes:(BOOL)a3;
- (void)setLayoutOptions:(id)a3;
- (void)setNavigationAddButton:(id)a3;
- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5;
- (void)showAddTriggerView;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)triggerEditor:(id)a3 didFinishWithTriggerBuilder:(id)a4;
- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation HUTriggerListViewController

- (HUTriggerListViewController)init
{
  v3 = [(HFItemManager *)[HUTriggerListItemManager alloc] initWithDelegate:self];
  v8.receiver = self;
  v8.super_class = (Class)HUTriggerListViewController;
  v4 = [(HUItemTableViewController *)&v8 initWithItemManager:v3 tableViewStyle:2];
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)&v4->_triggerItemManager, v3);
    v6 = _HULocalizedStringWithDefaultValue(@"HUTabAutomationTitle", @"HUTabAutomationTitle", 1);
    [(HUTriggerListViewController *)v5 setTitle:v6];

    [(HUTriggerListViewController *)v5 setModalInPresentation:1];
  }

  return v5;
}

- (void)viewDidLoad
{
  v18[1] = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)HUTriggerListViewController;
  [(HUItemTableViewController *)&v17 viewDidLoad];
  v3 = [(HUTriggerListViewController *)self view];
  [v3 bounds];
  v6 = +[HUGridLayoutOptions defaultOptionsForViewSize:](HUGridLayoutOptions, "defaultOptionsForViewSize:", v4, v5);
  [(HUTriggerListViewController *)self setLayoutOptions:v6];

  if (!_os_feature_enabled_impl() || (_os_feature_enabled_impl() & 1) == 0)
  {
    if ([MEMORY[0x1E4F69758] isAMac])
    {
      v7 = [(HUTriggerListViewController *)self navigationController];
      [v7 setNavigationBarHidden:1];
    }
    else
    {
      objc_super v8 = +[HUNavigationBarButton addButtonWithOwner:self];
      [(HUTriggerListViewController *)self setNavigationAddButton:v8];

      v7 = [(HUTriggerListViewController *)self navigationAddButton];
      v18[0] = v7;
      v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
      v10 = [(HUTriggerListViewController *)self navigationItem];
      [v10 setRightBarButtonItems:v9];
    }
    v11 = [(HUTriggerListViewController *)self navigationController];
    v12 = [v11 navigationBar];
    [v12 setPrefersLargeTitles:1];

    v13 = [(HUTriggerListViewController *)self navigationController];
    v14 = [v13 navigationBar];
    [v14 _setUseInlineBackgroundHeightWhenLarge:1];
  }
  v15 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
  v16 = [(HUTriggerListViewController *)self tableView];
  [v16 setBackgroundColor:v15];
}

- (void)viewWillAppear:(BOOL)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)HUTriggerListViewController;
  [(HUItemTableViewController *)&v12 viewWillAppear:a3];
  if (_os_feature_enabled_impl() && _os_feature_enabled_impl())
  {
    if ([MEMORY[0x1E4F69758] isAMac])
    {
      double v4 = [(HUTriggerListViewController *)self navigationController];
      [v4 setNavigationBarHidden:1];
    }
    else
    {
      double v5 = +[HUNavigationBarButton addButtonWithOwner:self];
      [(HUTriggerListViewController *)self setNavigationAddButton:v5];

      double v4 = [(HUTriggerListViewController *)self navigationAddButton];
      v13[0] = v4;
      v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
      v7 = [(HUTriggerListViewController *)self navigationItem];
      [v7 setRightBarButtonItems:v6];
    }
    objc_super v8 = [(HUTriggerListViewController *)self navigationController];
    v9 = [v8 navigationBar];
    [v9 setPrefersLargeTitles:1];

    v10 = [(HUTriggerListViewController *)self navigationController];
    v11 = [v10 navigationBar];
    [v11 _setUseInlineBackgroundHeightWhenLarge:1];
  }
}

- (void)viewWillLayoutSubviews
{
  v3 = [(HUTriggerListViewController *)self layoutOptions];
  [v3 viewSize];
  double v5 = v4;
  double v7 = v6;
  objc_super v8 = [(HUTriggerListViewController *)self view];
  [v8 frame];
  BOOL v11 = v7 == v10 && v5 == v9;

  if (![(HUTriggerListViewController *)self isTransitioningSizes] && !v11)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __53__HUTriggerListViewController_viewWillLayoutSubviews__block_invoke;
    v13[3] = &unk_1E6386018;
    v13[4] = self;
    [MEMORY[0x1E4F42FF0] performWithoutAnimation:v13];
  }
  v12.receiver = self;
  v12.super_class = (Class)HUTriggerListViewController;
  [(HUItemTableViewController *)&v12 viewWillLayoutSubviews];
}

void __53__HUTriggerListViewController_viewWillLayoutSubviews__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) view];
  [v2 frame];
  double v5 = +[HUGridLayoutOptions defaultOptionsForViewSize:](HUGridLayoutOptions, "defaultOptionsForViewSize:", v3, v4);
  [*(id *)(a1 + 32) setLayoutOptions:v5];

  id v6 = [*(id *)(a1 + 32) view];
  [v6 layoutIfNeeded];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)HUTriggerListViewController;
  id v7 = a4;
  -[HUItemTableViewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  [(HUTriggerListViewController *)self setIsTransitioningSizes:1];
  v8[4] = self;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __82__HUTriggerListViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v9[3] = &unk_1E6390908;
  v9[4] = self;
  *(double *)&v9[5] = width;
  *(double *)&v9[6] = height;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __82__HUTriggerListViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v8[3] = &unk_1E6385548;
  [v7 animateAlongsideTransition:v9 completion:v8];
}

void __82__HUTriggerListViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  +[HUGridLayoutOptions defaultOptionsForViewSize:](HUGridLayoutOptions, "defaultOptionsForViewSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setLayoutOptions:v2];
}

uint64_t __82__HUTriggerListViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIsTransitioningSizes:0];
}

- (void)showAddTriggerView
{
}

- (void)_addTrigger:(id)a3
{
  [(HUTriggerListViewController *)self setEditorPresentationMode:1];
  id v6 = [[HUTriggerTypePickerViewController alloc] initWithActionSetBuilder:0 delegate:self];
  [(HUTriggerTypePickerViewController *)v6 setShowSuggestedAutomations:1];
  double v4 = (void *)[objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:v6];
  [v4 setModalPresentationStyle:2];
  id v5 = [(UIViewController *)self hu_presentPreloadableViewController:v4 animated:1];
}

- (void)_showSummaryForTriggerItem:(id)a3
{
  id v15 = a3;
  double v4 = [v15 latestResults];
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F68C30]];
  uint64_t v6 = [v5 integerValue];

  id v7 = [v15 trigger];
  objc_super v8 = [(HUItemTableViewController *)self itemManager];
  double v9 = [v8 home];

  if (v15)
  {
    if (v6) {
      goto LABEL_3;
    }
  }
  else
  {
    NSLog(&cfstr_NilParameter.isa);
    if (v6)
    {
LABEL_3:
      if (v7) {
        goto LABEL_4;
      }
LABEL_12:
      NSLog(&cfstr_NilParameter.isa);
      if (v9) {
        goto LABEL_5;
      }
LABEL_13:
      NSLog(&cfstr_NilParameter.isa);
      goto LABEL_16;
    }
  }
  NSLog(&cfstr_CouldNotDeterm.isa, v15);
  if (!v7) {
    goto LABEL_12;
  }
LABEL_4:
  if (!v9) {
    goto LABEL_13;
  }
LABEL_5:
  if (v15 && v6 && v7)
  {
    objc_super v10 = objc_alloc_init(HUTriggerBuilderContext);
    [(HUTriggerBuilderContext *)v10 setFiltersEmptyActionSets:1];
    BOOL v11 = [MEMORY[0x1E4F696C0] triggerBuilderForTrigger:v7 inHome:v9 context:v10];
    if (v11)
    {
      objc_super v12 = [[HUTriggerSummaryViewController alloc] initWithTriggerBuilder:v11 mode:1 isPresentedModally:1 delegate:self];
      [(HUTriggerListViewController *)self setEditorPresentationMode:1];
      v13 = (void *)[objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:v12];
      [v13 setModalPresentationStyle:2];
      id v14 = [(UIViewController *)self hu_presentPreloadableViewController:v13 animated:1];
    }
    else
    {
      NSLog(&cfstr_CouldNotCreate_0.isa, v7);
    }
  }
LABEL_16:
}

- (unint64_t)automaticDisablingReasonsForItem:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HUTriggerListViewController;
  id v3 = a3;
  id v4 = [(HUItemTableViewController *)&v7 automaticDisablingReasonsForItem:v3];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    return 1;
  }
  else {
    return (unint64_t)v4;
  }
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v14 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v14;
    double v9 = objc_msgSend(MEMORY[0x1E4F42A80], "hu_exclamationMarkImage");
    [v8 setDescriptionIcon:v9];

    objc_super v10 = [v7 latestResults];
    BOOL v11 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F68C30]];
    BOOL v12 = [v11 intValue] != 0;

    [v8 setAccessoryType:v12];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_6;
    }
    id v13 = v14;
    [v13 setDelegate:self];
    [v13 setButtonColorFollowsTintColor:1];
  }

LABEL_6:
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
    id v13 = v10;
    id v14 = [v11 latestResults];
    id v15 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F68C28]];
    int v16 = [v15 BOOLValue];

    [v13 setHideDescriptionIcon:v16 ^ 1u];
LABEL_12:

    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v17 = objc_opt_class();
    id v18 = v10;
    if (v18)
    {
      if (objc_opt_isKindOfClass()) {
        v19 = v18;
      }
      else {
        v19 = 0;
      }
      id v13 = v18;
      if (v19) {
        goto LABEL_11;
      }
      v20 = [MEMORY[0x1E4F28B00] currentHandler];
      v21 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      [v20 handleFailureInFunction:v21, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v17, objc_opt_class() file lineNumber description];
    }
    id v13 = 0;
LABEL_11:

    [v13 setDelegate:self];
    v22 = [(HUTriggerListViewController *)self view];
    [v22 frame];
    v25 = +[HUGridLayoutOptions defaultOptionsForViewSize:](HUGridLayoutOptions, "defaultOptionsForViewSize:", v23, v24);
    [v13 setLayoutOptions:v25];

    v26 = [(HUTriggerListViewController *)self tableView];
    objc_msgSend(v13, "setRespectLayoutMargins:", objc_msgSend(v26, "_sectionContentInsetFollowsLayoutMargins") ^ 1);

    goto LABEL_12;
  }
LABEL_13:
  v27.receiver = self;
  v27.super_class = (Class)HUTriggerListViewController;
  [(HUItemTableViewController *)&v27 updateCell:v10 forItem:v11 indexPath:v12 animated:v6];
}

- (BOOL)shouldHideHeaderAboveSection:(int64_t)a3
{
  int v4 = [MEMORY[0x1E4F69758] isAMac] ^ 1;
  if (a3) {
    LOBYTE(v4) = 0;
  }
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 1) {
    return 1;
  }
  else {
    return v4;
  }
}

- (BOOL)shouldHideFooterBelowSection:(int64_t)a3
{
  int v4 = [MEMORY[0x1E4F69758] isAMac] ^ 1;
  if (a3) {
    LOBYTE(v4) = 0;
  }
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 1) {
    return 1;
  }
  else {
    return v4;
  }
}

- (BOOL)shouldHideSeparatorsForCell:(id)a3 indexPath:(id)a4
{
  id v4 = a4;
  BOOL v5 = ![v4 section] || objc_msgSend(v4, "section") == 1 || objc_msgSend(v4, "section") == 3;

  return v5;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  v16[2] = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)HUTriggerListViewController;
  -[HUItemTableViewController tableView:heightForHeaderInSection:](&v14, sel_tableView_heightForHeaderInSection_, a3);
  if (a4 != 2) {
    return v6;
  }
  id v7 = [(HUTriggerListViewController *)self view];
  [v7 frame];
  uint64_t v10 = HUViewSizeSubclassForViewSize(v8, v9);

  v15[0] = &unk_1F19B5120;
  v15[1] = &unk_1F19B5138;
  v16[0] = &unk_1F19B6590;
  v16[1] = &unk_1F19B65A0;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  double v12 = HUConstantFloatForViewSizeSubclass(v10, v11);

  return v12;
}

- (void)coloredButtonCellPressed:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    double v12 = self;
    __int16 v13 = 2080;
    objc_super v14 = "-[HUTriggerListViewController coloredButtonCellPressed:]";
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "(%@:%s) User tapped \"Create New Automation\"", (uint8_t *)&v11, 0x16u);
  }

  [(HUTriggerListViewController *)self _addTrigger:0];
  objc_opt_class();
  BOOL v5 = [(HUItemTableViewController *)self itemManager];
  if (objc_opt_isKindOfClass()) {
    double v6 = v5;
  }
  else {
    double v6 = 0;
  }
  id v7 = v6;

  double v8 = [v7 addTriggerItem];

  double v9 = [v8 latestResults];
  uint64_t v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F68AC0]];

  [MEMORY[0x1E4F68EE0] sendGeneralButtonTapEventWithButtonTitle:v10 sourceViewController:self];
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5 = a4;
  double v6 = [(HUItemTableViewController *)self itemManager];
  id v7 = [v6 displayedItemAtIndexPath:v5];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v8 = [v7 latestResults];
    double v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F68C30]];
    BOOL v10 = [v9 intValue] != 0;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)HUTriggerListViewController;
  id v6 = a4;
  id v7 = a3;
  [(HUItemTableViewController *)&v10 tableView:v7 didSelectRowAtIndexPath:v6];
  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1, v10.receiver, v10.super_class);

  double v8 = [(HUItemTableViewController *)self itemManager];
  double v9 = [v8 displayedItemAtIndexPath:v6];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(HUTriggerListViewController *)self _showSummaryForTriggerItem:v9];
  }
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(HUItemTableViewController *)self itemManager];
  id v7 = [v6 displayedItemAtIndexPath:v5];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v8 = [(HUItemTableViewController *)self itemManager];
    double v9 = [v8 home];
    char v10 = objc_msgSend(v9, "hf_currentUserIsAdministrator");
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)trailingSwipeActionsForItem:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([(HUItemTableViewController *)self itemManager],
        id v5 = objc_claimAutoreleasedReturnValue(),
        [v5 home],
        id v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = objc_msgSend(v6, "hf_currentUserIsAdministrator"),
        v6,
        v5,
        v7))
  {
    double v8 = [MEMORY[0x1E4F1CA48] array];
    double v9 = (void *)MEMORY[0x1E4F42900];
    char v10 = _HULocalizedStringWithDefaultValue(@"HUDeleteTitle", @"HUDeleteTitle", 1);
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    int v16 = __59__HUTriggerListViewController_trailingSwipeActionsForItem___block_invoke;
    uint64_t v17 = &unk_1E6390980;
    id v18 = self;
    id v19 = v4;
    int v11 = [v9 contextualActionWithStyle:1 title:v10 handler:&v14];

    objc_msgSend(v8, "addObject:", v11, v14, v15, v16, v17, v18);
    double v12 = [MEMORY[0x1E4F42E68] configurationWithActions:v8];
  }
  else
  {
    double v12 = 0;
  }

  return v12;
}

void __59__HUTriggerListViewController_trailingSwipeActionsForItem___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id v6 = [*(id *)(a1 + 32) _deleteItem:*(void *)(a1 + 40)];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__HUTriggerListViewController_trailingSwipeActionsForItem___block_invoke_2;
  v9[3] = &unk_1E6390CD0;
  id v10 = v5;
  id v7 = v5;
  id v8 = (id)[v6 addCompletionBlock:v9];
}

uint64_t __59__HUTriggerListViewController_trailingSwipeActionsForItem___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  if (a3)
  {
    id v4 = (void *)MEMORY[0x1E4F69110];
    id v5 = a3;
    id v6 = [v4 sharedHandler];
    [v6 handleError:v5];
  }
  id v7 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v7();
}

- (void)triggerEditor:(id)a3 didFinishWithTriggerBuilder:(id)a4
{
  id v8 = a3;
  unint64_t v5 = [(HUTriggerListViewController *)self editorPresentationMode];
  if (v5 == 2)
  {
    id v6 = [(HUTriggerListViewController *)self navigationController];
    id v7 = (id)[v6 popToViewController:self animated:1];
LABEL_10:

    goto LABEL_11;
  }
  if (v5 == 1)
  {
    if (![MEMORY[0x1E4F69758] isAnIPad]
      || ([MEMORY[0x1E4F69758] isAMac] & 1) != 0)
    {
      [(HUTriggerListViewController *)self dismissViewControllerAnimated:1 completion:0];
      goto LABEL_11;
    }
    id v6 = [v8 presentingViewController];
    [v6 dismissViewControllerAnimated:1 completion:0];
    goto LABEL_10;
  }
  if (([MEMORY[0x1E4F69758] isAVisionPro] & 1) == 0) {
    NSLog(&cfstr_Editorpresenta.isa, v8);
  }
LABEL_11:
  [(HUTriggerListViewController *)self setEditorPresentationMode:0];
}

- (void)aboutResidentDeviceViewControllerDidFinish:(id)a3
{
}

- (void)learnMoreLinkTapped:(id)a3
{
  unint64_t v5 = [[HUAboutResidentDeviceViewController alloc] initWithStyle:1];
  [(HUAboutResidentDeviceViewController *)v5 setDelegate:self];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:v5];
  [v4 setModalPresentationStyle:2];
  [(HUTriggerListViewController *)self presentViewController:v4 animated:1 completion:0];
}

- (id)homeForNavigationBarButton:(id)a3
{
  id v3 = [(HUItemTableViewController *)self itemManager];
  id v4 = [v3 home];

  return v4;
}

- (id)roomForNavigationBarButton:(id)a3
{
  return 0;
}

- (id)addActionDelegateForNavigationBarButton:(id)a3
{
  id v4 = [(HUTriggerListViewController *)self navigationController];
  unint64_t v5 = [v4 tabBarController];

  if (v5)
  {
    id v6 = [(HUTriggerListViewController *)self navigationController];
    id v7 = [v6 tabBarController];
  }
  else
  {
    id v8 = [(HUTriggerListViewController *)self navigationController];
    double v9 = [v8 splitViewController];

    if (!v9) {
      goto LABEL_10;
    }
    id v6 = [(HUTriggerListViewController *)self navigationController];
    id v7 = [v6 splitViewController];
  }
  id v10 = v7;
  if ([v7 conformsToProtocol:&unk_1F1A78CD0]) {
    int v11 = v10;
  }
  else {
    int v11 = 0;
  }
  id v12 = v11;

  if (v12)
  {
    __int16 v13 = [v12 dashboardNavigator];

    goto LABEL_11;
  }
LABEL_10:
  __int16 v13 = 0;
LABEL_11:

  return v13;
}

- (id)_deleteItem:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  id v8 = [v7 trigger];
  double v9 = v8;
  if (v8)
  {
    if (v7)
    {
      id v10 = (void *)MEMORY[0x1E4F7A0D8];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      void v15[2] = __43__HUTriggerListViewController__deleteItem___block_invoke;
      v15[3] = &unk_1E6385D90;
      v15[4] = self;
      id v16 = v8;
      int v11 = [v10 futureWithBlock:v15];

      goto LABEL_9;
    }
  }
  else
  {
    NSLog(&cfstr_NoTriggerToDel.isa);
  }
  id v12 = (void *)MEMORY[0x1E4F7A0D8];
  __int16 v13 = objc_msgSend(MEMORY[0x1E4F28C58], "hf_errorWithCode:description:", 30, 0);
  int v11 = [v12 futureWithError:v13];

LABEL_9:

  return v11;
}

void __43__HUTriggerListViewController__deleteItem___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) itemManager];
  id v5 = [v4 home];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __43__HUTriggerListViewController__deleteItem___block_invoke_2;
  v9[3] = &unk_1E638C140;
  uint64_t v7 = *(void *)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  id v10 = v3;
  uint64_t v11 = v7;
  id v12 = v6;
  id v8 = v3;
  [v5 removeTrigger:v12 completionHandler:v9];
}

void __43__HUTriggerListViewController__deleteItem___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = *(void **)(a1 + 32);
    [v3 finishWithError:a2];
  }
  else
  {
    id v4 = [MEMORY[0x1E4F691A0] sharedDispatcher];
    uint64_t v6 = MEMORY[0x1E4F143A8];
    uint64_t v7 = 3221225472;
    id v8 = __43__HUTriggerListViewController__deleteItem___block_invoke_3;
    double v9 = &unk_1E6387408;
    id v5 = *(void **)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = v5;
    [v4 dispatchHomeObserverMessage:&v6 sender:0];

    objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult", v6, v7, v8, v9, v10);
  }
}

void __43__HUTriggerListViewController__deleteItem___block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = [*(id *)(a1 + 32) itemManager];
    id v4 = [v3 home];
    [v5 home:v4 didRemoveTrigger:*(void *)(a1 + 40)];
  }
}

- (HUNavigationBarButton)navigationAddButton
{
  return self->_navigationAddButton;
}

- (void)setNavigationAddButton:(id)a3
{
}

- (HUTriggerListItemManager)triggerItemManager
{
  return self->_triggerItemManager;
}

- (unint64_t)editorPresentationMode
{
  return self->_editorPresentationMode;
}

- (void)setEditorPresentationMode:(unint64_t)a3
{
  self->_editorPresentationMode = a3;
}

- (BOOL)isTransitioningSizes
{
  return self->_isTransitioningSizes;
}

- (void)setIsTransitioningSizes:(BOOL)a3
{
  self->_isTransitioningSizes = a3;
}

- (HUGridLayoutOptions)layoutOptions
{
  return self->_layoutOptions;
}

- (void)setLayoutOptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutOptions, 0);
  objc_storeStrong((id *)&self->_triggerItemManager, 0);

  objc_storeStrong((id *)&self->_navigationAddButton, 0);
}

@end