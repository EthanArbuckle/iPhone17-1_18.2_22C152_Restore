@interface CSNotificationAdjunctListViewController
+ (Class)viewClass;
- (BOOL)_canAnimate;
- (BOOL)_hostsInlineContentInAdjunctList;
- (BOOL)_hostsTimeInAdjunctList;
- (BOOL)allowsAddRemoveAnimations;
- (BOOL)handleEvent:(id)a3;
- (BOOL)isPresentingContent;
- (BOOL)isPresentingTransientContent;
- (BOOL)isShowingMediaControls;
- (BOOL)respondingToSubviewLayoutChange;
- (CGAffineTransform)_disappearedTransformForContentWithHeight:(SEL)a3;
- (CGSize)sizeToMimic;
- (CGSize)sizeToMimicForHost:(id)a3;
- (CGSize)stackViewContentSize;
- (CSAdjunctListActionManager)actionManager;
- (CSContentActionInterpreter)actionInterpreter;
- (CSFocusActivityManager)focusActivityManager;
- (CSNotificationAdjunctListViewController)init;
- (CSNotificationAdjunctListViewControllerDelegate)delegate;
- (CSNowPlayingController)nowPlayingController;
- (CSProminentUISpacerViewController)spacerViewController;
- (CSRemoteContentInlineManager)remoteContentInlineManager;
- (CSRemoteContentInlineProviding)remoteContentInlineProvider;
- (NSMutableDictionary)identifiersToItems;
- (PRWidgetMetricsProvider)widgetMetricsProvider;
- (SBFActionProviding)contentActionProvider;
- (UIViewController)digestOnboardingSuggestionViewController;
- (double)listViewContentAnimationDampingRatio;
- (double)listViewContentAnimationDuration;
- (double)prominentElementHeightToMimic;
- (id)_createItemViewForHost:(id)a3 recipe:(int64_t)a4;
- (id)_groupNameBase;
- (id)_stackView;
- (id)itemsGroupSortComparatorForListSectionIdentifier:(id)a3;
- (id)itemsViewControllerSortComparatorForListSectionIdentifier:(id)a3;
- (unint64_t)_preferredIndexForItem:(id)a3;
- (void)_didUpdateDisplay;
- (void)_insertItem:(id)a3 atPreferredIndex:(int64_t)a4 animated:(BOOL)a5;
- (void)_removeItem:(id)a3 animated:(BOOL)a4;
- (void)_setIsFocusActivityIndicatorVisible:(BOOL)a3;
- (void)_updateItemsSizeToMimic;
- (void)adjunctListModel:(id)a3 didAddItem:(id)a4;
- (void)adjunctListModel:(id)a3 didRemoveItem:(id)a4;
- (void)adjunctListModel:(id)a3 didUpdateItem:(id)a4 withItem:(id)a5;
- (void)focusActivityIndicatorDidChangeToVisible:(BOOL)a3;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)setActionInterpreter:(id)a3;
- (void)setActionManager:(id)a3;
- (void)setAllowsAddRemoveAnimations:(BOOL)a3;
- (void)setContentActionProvider:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDigestOnboardingSuggestionViewController:(id)a3;
- (void)setFocusActivityManager:(id)a3;
- (void)setIdentifiersToItems:(id)a3;
- (void)setNowPlayingController:(id)a3;
- (void)setProminentElementHeightToMimic:(double)a3;
- (void)setRemoteContentInlineManager:(id)a3;
- (void)setRemoteContentInlineProvider:(id)a3;
- (void)setRespondingToSubviewLayoutChange:(BOOL)a3;
- (void)setSpacerViewController:(id)a3;
- (void)setWidgetMetricsProvider:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation CSNotificationAdjunctListViewController

- (CSNotificationAdjunctListViewController)init
{
  v19.receiver = self;
  v19.super_class = (Class)CSNotificationAdjunctListViewController;
  v2 = [(CSNotificationAdjunctListViewController *)&v19 init];
  v3 = v2;
  if (v2)
  {
    v2->_allowsAddRemoveAnimations = 1;
    v4 = objc_alloc_init(CSNowPlayingController);
    nowPlayingController = v3->_nowPlayingController;
    v3->_nowPlayingController = v4;

    v6 = objc_alloc_init(CSContentActionInterpreter);
    actionInterpreter = v3->_actionInterpreter;
    v3->_actionInterpreter = v6;

    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    identifiersToItems = v3->_identifiersToItems;
    v3->_identifiersToItems = (NSMutableDictionary *)v8;

    v10 = objc_alloc_init(CSAdjunctListModel);
    model = v3->_model;
    v3->_model = v10;

    [(CSAdjunctListModel *)v3->_model setDelegate:v3];
    v12 = [[CSFocusActivityManager alloc] initWithItemDestination:v3->_model];
    focusActivityManager = v3->_focusActivityManager;
    v3->_focusActivityManager = v12;

    [(CSFocusActivityManager *)v3->_focusActivityManager setDelegate:v3];
    v14 = [[CSAdjunctListActionManager alloc] initWithItemDestination:v3->_model];
    actionManager = v3->_actionManager;
    v3->_actionManager = v14;

    v16 = [[CSRemoteContentInlineManager alloc] initWithItemDestination:v3->_model];
    remoteContentInlineManager = v3->_remoteContentInlineManager;
    v3->_remoteContentInlineManager = v16;
  }
  return v3;
}

+ (Class)viewClass
{
  return (Class)objc_opt_class();
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)CSNotificationAdjunctListViewController;
  [(CSCoverSheetViewControllerBase *)&v7 viewDidLoad];
  v3 = [(CSNotificationAdjunctListViewController *)self _stackView];
  v4 = [(CSNotificationAdjunctListViewController *)self delegate];
  [v4 insetMarginsToMimicForAdjunctListViewController:self];
  objc_msgSend(v3, "setLayoutMargins:");
  [v4 interItemSpacingToMimicForAdjunctListViewController:self];
  objc_msgSend(v3, "setSpacing:");
  [v3 setAxis:1];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 setAlignment:3];
  actionInterpreter = self->_actionInterpreter;
  v6 = [(CSNowPlayingController *)self->_nowPlayingController controlsViewController];
  [(CSContentActionInterpreter *)actionInterpreter setNowPlayingViewController:v6];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CSNotificationAdjunctListViewController;
  [(CSCoverSheetViewControllerBase *)&v4 viewWillAppear:a3];
  [(CSAdjunctListModel *)self->_model resumeItemHandling];
  [(CSNotificationAdjunctListViewController *)self _updateItemsSizeToMimic];
  [(CSNotificationAdjunctListViewController *)self _setIsFocusActivityIndicatorVisible:[(CSFocusActivityManager *)self->_focusActivityManager isFocusActivityIndicatorVisible]];
  [(CSProminentUISpacerViewController *)self->_spacerViewController setTopMarginToMimic:self->_prominentElementHeightToMimic];
  [(CSCoverSheetViewControllerBase *)self rebuildBehavior];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CSNotificationAdjunctListViewController;
  [(CSCoverSheetViewControllerBase *)&v3 viewDidLayoutSubviews];
  if (!self->_respondingToSubviewLayoutChange)
  {
    self->_respondingToSubviewLayoutChange = 1;
    [(CSNotificationAdjunctListViewController *)self _didUpdateDisplay];
    self->_respondingToSubviewLayoutChange = 0;
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)CSNotificationAdjunctListViewController;
  id v7 = a4;
  -[CSCoverSheetViewControllerBase viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __94__CSNotificationAdjunctListViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E6AD97F8;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:0];
}

uint64_t __94__CSNotificationAdjunctListViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateItemsSizeToMimic];
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [(NSMutableDictionary *)self->_identifiersToItems allValues];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v11 = [v10 contentHost];

        if (v11 == v4)
        {
          v12 = [v10 itemView];
          [v12 invalidateIntrinsicContentSize];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

- (CGSize)stackViewContentSize
{
  objc_super v3 = [(CSNotificationAdjunctListViewController *)self delegate];
  [v3 sizeToMimicForAdjunctListViewController:self];
  double v5 = v4;
  uint64_t v6 = [(CSNotificationAdjunctListViewController *)self view];
  objc_msgSend(v6, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4F43B90], *(double *)(MEMORY[0x1E4F43B90] + 8));
  double v8 = v7;

  double v9 = v5;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (BOOL)isShowingMediaControls
{
  v2 = [(NSMutableDictionary *)self->_identifiersToItems objectForKey:*MEMORY[0x1E4FA6D18]];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isPresentingContent
{
  return [(NSMutableDictionary *)self->_identifiersToItems count] != 0;
}

- (BOOL)isPresentingTransientContent
{
  BOOL v3 = [(NSMutableDictionary *)self->_identifiersToItems objectForKey:@"focus activity identifier"];

  if (v3) {
    return [(NSMutableDictionary *)self->_identifiersToItems count] != 1;
  }

  return [(CSNotificationAdjunctListViewController *)self isPresentingContent];
}

- (CGSize)sizeToMimicForHost:(id)a3
{
  id v4 = a3;
  double v5 = [(CSNotificationAdjunctListViewController *)self delegate];
  [v5 sizeToMimicForAdjunctListViewController:self];
  double v7 = v6;
  double v9 = v8;
  if ((objc_opt_respondsToSelector() & 1) == 0 || [v4 insetsMargins])
  {
    [v5 insetMarginsToMimicForAdjunctListViewController:self];
    double v7 = v7 - v10 - v11;
  }

  double v12 = v7;
  double v13 = v9;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (double)listViewContentAnimationDuration
{
  return 1.15;
}

- (double)listViewContentAnimationDampingRatio
{
  return 0.81;
}

- (BOOL)handleEvent:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CSNotificationAdjunctListViewController;
  if ([(CSCoverSheetViewControllerBase *)&v9 handleEvent:v4]) {
    int v5 = [v4 isConsumable];
  }
  else {
    int v5 = 0;
  }
  uint64_t v6 = [v4 type];
  if (v6 == 8)
  {
    [(CSAdjunctListModel *)self->_model resumeItemHandling];
  }
  else if (v6 == 9)
  {
    [(CSAdjunctListModel *)self->_model suspendItemHandling];
  }
  else if (!v5)
  {
    char v7 = 0;
    goto LABEL_10;
  }
  char v7 = [v4 isConsumable];
LABEL_10:

  return v7;
}

- (void)setContentActionProvider:(id)a3
{
}

- (void)setRemoteContentInlineProvider:(id)a3
{
  p_remoteContentInlineProvider = &self->_remoteContentInlineProvider;
  id v5 = a3;
  objc_storeWeak((id *)p_remoteContentInlineProvider, v5);
  [(CSRemoteContentInlineManager *)self->_remoteContentInlineManager setRemoteContentInlineProvider:v5];
}

- (void)setDigestOnboardingSuggestionViewController:(id)a3
{
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != v4)
  {
    objc_storeWeak((id *)&self->_delegate, v4);
    [v4 adjunctListViewController:self didAddSectionWithIdentifier:@"AdjunctTopSticky"];
    if ([(CSNotificationAdjunctListViewController *)self _hostsTimeInAdjunctList])
    {
      spacerViewController = self->_spacerViewController;
      if (!spacerViewController)
      {
        char v7 = objc_alloc_init(CSProminentUISpacerViewController);
        double v8 = self->_spacerViewController;
        self->_spacerViewController = v7;

        [(CSProminentUISpacerViewController *)self->_spacerViewController setTopMarginToMimic:self->_prominentElementHeightToMimic];
        spacerViewController = self->_spacerViewController;
      }
      objc_super v9 = [(CSNotificationAdjunctListViewController *)self _createItemViewForHost:spacerViewController recipe:0];
      double v10 = v9;
      if (v9)
      {
        double v11 = (void *)MEMORY[0x1E4F42FF0];
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __55__CSNotificationAdjunctListViewController_setDelegate___block_invoke;
        v13[3] = &unk_1E6AD8848;
        v13[4] = self;
        id v14 = v9;
        id v15 = v4;
        [v11 performWithoutAnimation:v13];
        double v12 = [(CSNotificationAdjunctListViewController *)self view];
        [v12 setNeedsLayout];

        [(CSNotificationAdjunctListViewController *)self _didUpdateDisplay];
      }
    }
  }
}

uint64_t __55__CSNotificationAdjunctListViewController_setDelegate___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "bs_addChildViewController:withSuperview:animated:transitionBlock:", *(void *)(*(void *)(a1 + 32) + 1160), *(void *)(a1 + 40), 0, 0);
  v2 = *(void **)(a1 + 48);

  return objc_msgSend(v2, "adjunctListViewController:didAddViewController:withIdentifier:");
}

- (void)setProminentElementHeightToMimic:(double)a3
{
  if (self->_prominentElementHeightToMimic != a3)
  {
    self->_prominentElementHeightToMimic = a3;
    -[CSProminentUISpacerViewController setTopMarginToMimic:](self->_spacerViewController, "setTopMarginToMimic:");
  }
}

- (id)itemsGroupSortComparatorForListSectionIdentifier:(id)a3
{
  return &__block_literal_global_6;
}

uint64_t __92__CSNotificationAdjunctListViewController_itemsGroupSortComparatorForListSectionIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (id)itemsViewControllerSortComparatorForListSectionIdentifier:(id)a3
{
  return &__block_literal_global_33;
}

uint64_t __101__CSNotificationAdjunctListViewController_itemsViewControllerSortComparatorForListSectionIdentifier___block_invoke()
{
  return 0;
}

- (void)adjunctListModel:(id)a3 didAddItem:(id)a4
{
  id v6 = a4;
  BOOL v5 = [v6 animatePresentation]
    && [(CSNotificationAdjunctListViewController *)self _canAnimate]
    && self->_allowsAddRemoveAnimations;
  [(CSNotificationAdjunctListViewController *)self _insertItem:v6 atPreferredIndex:[(CSNotificationAdjunctListViewController *)self _preferredIndexForItem:v6] animated:v5];
}

- (void)adjunctListModel:(id)a3 didRemoveItem:(id)a4
{
  id v6 = a4;
  BOOL v5 = [v6 animateDismissal]
    && [(CSNotificationAdjunctListViewController *)self _canAnimate]
    && self->_allowsAddRemoveAnimations;
  [(CSNotificationAdjunctListViewController *)self _removeItem:v6 animated:v5];
}

- (void)adjunctListModel:(id)a3 didUpdateItem:(id)a4 withItem:(id)a5
{
  id v12 = a4;
  id v7 = a5;
  if (v12 != v7)
  {
    double v8 = [(CSNotificationAdjunctListViewController *)self _stackView];
    objc_super v9 = [v12 itemView];
    double v10 = [v8 arrangedSubviews];
    uint64_t v11 = [v10 indexOfObject:v9];
    if (!v11) {
      uint64_t v11 = [(CSNotificationAdjunctListViewController *)self _preferredIndexForItem:v7];
    }

    [(CSNotificationAdjunctListViewController *)self _removeItem:v12 animated:0];
    [(CSNotificationAdjunctListViewController *)self _insertItem:v7 atPreferredIndex:v11 animated:0];
  }
}

- (void)focusActivityIndicatorDidChangeToVisible:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained focusActivityViewChangedToVisible:v3];
}

- (BOOL)_hostsTimeInAdjunctList
{
  v2 = +[CSLockScreenDomain rootSettings];
  BOOL v3 = [v2 dashBoardRemoteContentSettings];

  if ([v3 shouldHostContentInNotificationList]) {
    char v4 = [v3 includesDateTimeStandinInAdjunctList];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)_hostsInlineContentInAdjunctList
{
  v2 = +[CSLockScreenDomain rootSettings];
  BOOL v3 = [v2 dashBoardRemoteContentSettings];

  if ([v3 shouldHostContentInNotificationList]) {
    char v4 = [v3 hostsInlineContentNativelyInNotificationList];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)_canAnimate
{
  return [(CSNotificationAdjunctListViewController *)self _appearState] != 0;
}

- (void)_insertItem:(id)a3 atPreferredIndex:(int64_t)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  objc_super v9 = [v8 identifier];
  [(NSMutableDictionary *)self->_identifiersToItems setObject:v8 forKey:v9];
  double v10 = [v8 action];

  if (v10)
  {
    actionInterpreter = self->_actionInterpreter;
    id v12 = [v8 action];
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __81__CSNotificationAdjunctListViewController__insertItem_atPreferredIndex_animated___block_invoke;
    v46[3] = &unk_1E6AD9860;
    id v47 = v8;
    [(CSContentActionInterpreter *)actionInterpreter _viewControllerFromAction:v12 completion:v46];
  }
  double v13 = [v8 contentHost];

  if (v13)
  {
    id v14 = [v8 contentHost];
    BOOL v15 = [(CSNotificationAdjunctListViewController *)self _hostsInlineContentInAdjunctList];
    BOOL v33 = v5;
    if (v15)
    {
      long long v16 = 0;
    }
    else
    {
      long long v16 = [(CSNotificationAdjunctListViewController *)self _stackView];
    }
    v17 = [v8 action];
    unint64_t v18 = objc_msgSend(v17, "sb_materialRecipe");
    if (v18 <= 1) {
      uint64_t v19 = 1;
    }
    else {
      uint64_t v19 = v18;
    }

    v20 = [(CSNotificationAdjunctListViewController *)self _createItemViewForHost:v14 recipe:v19];
    [v8 setItemView:v20];
    if (v20)
    {
      v21 = (void *)MEMORY[0x1E4F42FF0];
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __81__CSNotificationAdjunctListViewController__insertItem_atPreferredIndex_animated___block_invoke_36;
      v39[3] = &unk_1E6AD9888;
      BOOL v45 = v15;
      id v22 = v20;
      id v40 = v22;
      v32 = v16;
      id v23 = v16;
      int64_t v44 = a4;
      id v41 = v23;
      v42 = self;
      v43 = v14;
      [v21 performWithoutAnimation:v39];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __81__CSNotificationAdjunctListViewController__insertItem_atPreferredIndex_animated___block_invoke_2;
      v34[3] = &unk_1E6AD8DB8;
      BOOL v38 = v15;
      id v35 = v22;
      v36 = self;
      id v37 = v23;
      v24 = (void *)MEMORY[0x1D9487300](v34);
      v25 = [(CSNotificationAdjunctListViewController *)self view];
      [v25 setNeedsLayout];

      v26 = (void *)MEMORY[0x1E4F42FF0];
      if (v33)
      {
        [(CSNotificationAdjunctListViewController *)self listViewContentAnimationDuration];
        double v28 = v27;
        [(CSNotificationAdjunctListViewController *)self listViewContentAnimationDampingRatio];
        [v26 animateWithDuration:0 delay:v24 usingSpringWithDamping:0 initialSpringVelocity:v28 options:0.0 animations:v29 completion:0.0];
      }
      else
      {
        [MEMORY[0x1E4F42FF0] performWithoutAnimation:v24];
      }
      v30 = SBLogDashBoard();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        v31 = [v8 identifier];
        *(_DWORD *)buf = 138412290;
        v49 = v31;
        _os_log_impl(&dword_1D839D000, v30, OS_LOG_TYPE_DEFAULT, "Inserted adjunct list item with identifier: %@", buf, 0xCu);
      }
      long long v16 = v32;
    }
  }
  else
  {
    id v14 = SBLogDashBoard();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[CSNotificationAdjunctListViewController _insertItem:atPreferredIndex:animated:](v14);
    }
  }
}

void __81__CSNotificationAdjunctListViewController__insertItem_atPreferredIndex_animated___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = SBLogDashBoard();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __81__CSNotificationAdjunctListViewController__insertItem_atPreferredIndex_animated___block_invoke_cold_1(v5, v6);
    }
  }
  else
  {
    [*(id *)(a1 + 32) setContentHost:a2];
  }
}

uint64_t __81__CSNotificationAdjunctListViewController__insertItem_atPreferredIndex_animated___block_invoke_36(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 72))
  {
    [*(id *)(a1 + 32) setNeedsLayout];
    [*(id *)(a1 + 32) setHidden:1];
    v2 = [*(id *)(a1 + 40) arrangedSubviews];
    unint64_t v3 = [v2 count];

    if (v3 >= *(void *)(a1 + 64)) {
      unint64_t v4 = *(void *)(a1 + 64);
    }
    else {
      unint64_t v4 = v3;
    }
    [*(id *)(a1 + 40) insertArrangedSubview:*(void *)(a1 + 32) atIndex:v4];
    [*(id *)(a1 + 40) layoutIfNeeded];
    [*(id *)(a1 + 32) setAlpha:0.0];
    id v5 = *(void **)(a1 + 32);
    CGAffineTransformMakeScale(&v8, 0.5, 0.5);
    CGAffineTransformTranslate(&v9, &v8, 0.0, 0.0);
    [v5 setTransform:&v9];
  }
  objc_msgSend(*(id *)(a1 + 48), "bs_addChildViewController:withSuperview:animated:transitionBlock:", *(void *)(a1 + 56), *(void *)(a1 + 32), 0, 0);
  if (*(unsigned char *)(a1 + 72))
  {
    id v6 = [*(id *)(a1 + 48) delegate];
    [v6 adjunctListViewController:*(void *)(a1 + 48) didAddViewController:*(void *)(a1 + 56) withIdentifier:@"com.apple.SpringBoard.sleep"];
  }
  return [*(id *)(a1 + 48) _didUpdateDisplay];
}

uint64_t __81__CSNotificationAdjunctListViewController__insertItem_atPreferredIndex_animated___block_invoke_2(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 56)) {
    [*(id *)(a1 + 32) setHidden:0];
  }
  [*(id *)(a1 + 40) _didUpdateDisplay];
  if (!*(unsigned char *)(a1 + 56))
  {
    [*(id *)(a1 + 32) setAlpha:1.0];
    v2 = *(void **)(a1 + 32);
    long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v5[0] = *MEMORY[0x1E4F1DAB8];
    v5[1] = v3;
    v5[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [v2 setTransform:v5];
    [*(id *)(a1 + 48) setNeedsLayout];
    [*(id *)(a1 + 48) layoutIfNeeded];
  }
  return [*(id *)(a1 + 40) _didUpdateDisplay];
}

- (void)_removeItem:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 contentHost];
  CGAffineTransform v8 = [v6 itemView];
  BOOL v9 = [(CSNotificationAdjunctListViewController *)self _hostsInlineContentInAdjunctList];
  if (v9)
  {
    double v10 = 0;
  }
  else
  {
    double v10 = [(CSNotificationAdjunctListViewController *)self _stackView];
  }
  uint64_t v11 = SBLogDashBoard();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v7;
    *(_WORD *)&buf[22] = 2112;
    *(void *)&buf[24] = v8;
    _os_log_impl(&dword_1D839D000, v11, OS_LOG_TYPE_DEFAULT, "Removing adjunct list item: %@, and content host: %@, itemView: %@", buf, 0x20u);
  }

  if (v8 && v7)
  {
    BOOL v27 = v4;
    if (v9)
    {
      [v8 setHidden:0];
      [v8 setAlpha:1.0];
      long long v12 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      *(_OWORD *)buf = *MEMORY[0x1E4F1DAB8];
      *(_OWORD *)&buf[16] = v12;
      long long v46 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      [v8 setTransform:buf];
    }
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __64__CSNotificationAdjunctListViewController__removeItem_animated___block_invoke;
    v40[3] = &unk_1E6AD8DB8;
    BOOL v44 = v9;
    id v13 = v8;
    id v41 = v13;
    id v14 = v10;
    id v42 = v14;
    v43 = self;
    BOOL v15 = (void *)MEMORY[0x1D9487300](v40);
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __64__CSNotificationAdjunctListViewController__removeItem_animated___block_invoke_2;
    v33[3] = &unk_1E6AD98B0;
    id v34 = v13;
    BOOL v39 = v9;
    id v35 = v14;
    v36 = self;
    id v16 = v6;
    id v37 = v16;
    id v38 = v7;
    v17 = (void *)MEMORY[0x1D9487300](v33);
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __64__CSNotificationAdjunctListViewController__removeItem_animated___block_invoke_3;
    v31[3] = &unk_1E6AD9000;
    v31[4] = self;
    id v18 = v17;
    id v32 = v18;
    uint64_t v19 = (void *)MEMORY[0x1D9487300](v31);
    v20 = [(CSNotificationAdjunctListViewController *)self delegate];
    [v20 adjunctListViewController:self willRemoveViewWithIdentifier:@"com.apple.SpringBoard.sleep"];

    v21 = (void *)MEMORY[0x1E4F42FF0];
    if (v27)
    {
      [(CSNotificationAdjunctListViewController *)self listViewContentAnimationDuration];
      double v23 = v22;
      [(CSNotificationAdjunctListViewController *)self listViewContentAnimationDampingRatio];
      [v21 animateWithDuration:0 delay:v15 usingSpringWithDamping:v19 initialSpringVelocity:v23 options:0.0 animations:v24 completion:0.0];
    }
    else
    {
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __64__CSNotificationAdjunctListViewController__removeItem_animated___block_invoke_4;
      v28[3] = &unk_1E6AD9250;
      id v29 = v15;
      id v30 = v19;
      [v21 performWithoutAnimation:v28];
    }
    v25 = SBLogDashBoard();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = [v16 identifier];
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v26;
      _os_log_impl(&dword_1D839D000, v25, OS_LOG_TYPE_DEFAULT, "Removed adjunct list item with identifier: %@", buf, 0xCu);
    }
  }
}

uint64_t __64__CSNotificationAdjunctListViewController__removeItem_animated___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56)) {
    [*(id *)(a1 + 32) setHidden:1];
  }
  [*(id *)(a1 + 40) layoutIfNeeded];
  [*(id *)(a1 + 48) _didUpdateDisplay];
  if (*(unsigned char *)(a1 + 56))
  {
    [*(id *)(a1 + 32) setAlpha:0.0];
    v2 = *(void **)(a1 + 32);
    long long v3 = *(void **)(a1 + 48);
    [v2 bounds];
    double Height = CGRectGetHeight(v9);
    if (v3)
    {
      [v3 _disappearedTransformForContentWithHeight:Height];
    }
    else
    {
      long long v7 = 0u;
      long long v8 = 0u;
      long long v6 = 0u;
    }
    [v2 setTransform:&v6];
  }
  return objc_msgSend(*(id *)(a1 + 48), "_didUpdateDisplay", v6, v7, v8);
}

void __64__CSNotificationAdjunctListViewController__removeItem_animated___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32) && objc_msgSend(*(id *)(a1 + 40), "containsView:"))
  {
    if (*(unsigned char *)(a1 + 72)) {
      [*(id *)(a1 + 32) setHidden:1];
    }
    [*(id *)(a1 + 32) removeFromSuperview];
    v2 = *(void **)(*(void *)(a1 + 48) + 1120);
    long long v3 = [*(id *)(a1 + 56) identifier];
    id v7 = [v2 objectForKey:v3];

    if (v7 == *(id *)(a1 + 56))
    {
      objc_msgSend(*(id *)(a1 + 48), "bs_removeChildViewController:animated:transitionBlock:", *(void *)(a1 + 64), 0, 0);
      BOOL v4 = *(void **)(*(void *)(a1 + 48) + 1120);
      id v5 = [*(id *)(a1 + 56) identifier];
      [v4 removeObjectForKey:v5];
    }
    long long v6 = [*(id *)(a1 + 48) delegate];
    [v6 adjunctListViewController:*(void *)(a1 + 48) willRemoveViewWithIdentifier:@"com.apple.SpringBoard.sleep"];

    [*(id *)(a1 + 40) setNeedsLayout];
    [*(id *)(a1 + 40) layoutIfNeeded];
    [*(id *)(a1 + 48) _didUpdateDisplay];
  }
}

void __64__CSNotificationAdjunctListViewController__removeItem_animated___block_invoke_3(uint64_t a1)
{
  v1 = *(void (***)(void))(a1 + 40);
  if (*(unsigned char *)(*(void *)(a1 + 32) + 1059)) {
    dispatch_async(MEMORY[0x1E4F14428], v1);
  }
  else {
    v1[2](*(void *)(a1 + 40));
  }
}

uint64_t __64__CSNotificationAdjunctListViewController__removeItem_animated___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

- (unint64_t)_preferredIndexForItem:(id)a3
{
  long long v3 = [a3 identifier];
  if ([v3 hasPrefix:@"focus activity identifier"]) {
    unint64_t v4 = 0;
  }
  else {
    unint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v4;
}

- (id)_createItemViewForHost:(id)a3 recipe:(int64_t)a4
{
  id v6 = a3;
  id v7 = [[CSAdjunctItemView alloc] initWithRecipe:a4];
  long long v8 = [(CSNotificationAdjunctListViewController *)self _groupNameBase];
  [(CSAdjunctItemView *)v7 setMaterialGroupNameBase:v8];

  [(CSAdjunctItemView *)v7 setContentHost:v6];
  [(CSNotificationAdjunctListViewController *)self sizeToMimicForHost:v6];
  double v10 = v9;
  double v12 = v11;

  -[CSAdjunctItemView setSizeToMimic:](v7, "setSizeToMimic:", v10, v12);

  return v7;
}

- (void)_updateItemsSizeToMimic
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v3 = [(CSNotificationAdjunctListViewController *)self _stackView];
  unint64_t v4 = [v3 arrangedSubviews];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        double v10 = [v9 contentHost];
        [(CSNotificationAdjunctListViewController *)self sizeToMimicForHost:v10];
        objc_msgSend(v9, "setSizeToMimic:");
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (id)_groupNameBase
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  unint64_t v4 = [WeakRetained groupNameBaseForAdjunctListViewController:self];

  return v4;
}

- (void)_didUpdateDisplay
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  long long v3 = [(CSNotificationAdjunctListViewController *)self _stackView];
  objc_msgSend(v3, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4F43B90], *(double *)(MEMORY[0x1E4F43B90] + 8));
  double v5 = v4;
  double v7 = v6;

  if ([(CSNotificationAdjunctListViewController *)self _hostsTimeInAdjunctList])
  {
    [(CSProminentUISpacerViewController *)self->_spacerViewController preferredContentSize];
    double v7 = v7 + v8;
  }
  objc_msgSend(WeakRetained, "adjunctListViewController:didUpdateWithSize:", self, v5, v7);
  uint64_t v9 = [(NSMutableDictionary *)self->_identifiersToItems objectForKey:*MEMORY[0x1E4FA6D18]];
  double v10 = (void *)v9;
  BOOL v11 = v9 != 0;
  if (self->_isNowPlayingVisible != v11)
  {
    self->_isNowPlayingVisible = v11;
    [WeakRetained adjunctListViewController:self updatedNowPlayingVisbility:v9 != 0];
  }
}

- (CGAffineTransform)_disappearedTransformForContentWithHeight:(SEL)a3
{
  memset(&v10, 0, sizeof(v10));
  CGAffineTransformMakeScale(&v10, 0.05, 0.05);
  memset(&v9, 0, sizeof(v9));
  CGAffineTransformMakeTranslation(&v9, 0.0, a4 * 0.55);
  CGAffineTransform t1 = v10;
  CGAffineTransform v7 = v9;
  return CGAffineTransformConcat(retstr, &t1, &v7);
}

- (void)_setIsFocusActivityIndicatorVisible:(BOOL)a3
{
  if (self->_isFocusActivityIndicatorVisible != a3)
  {
    BOOL v3 = a3;
    self->_isFocusActivityIndicatorVisible = a3;
    id v4 = [(CSNotificationAdjunctListViewController *)self delegate];
    [v4 focusActivityViewChangedToVisible:v3];
  }
}

- (id)_stackView
{
  v2 = [(CSNotificationAdjunctListViewController *)self view];
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      double v5 = v4;
    }
    else {
      double v5 = 0;
    }
  }
  else
  {
    double v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (double)prominentElementHeightToMimic
{
  return self->_prominentElementHeightToMimic;
}

- (SBFActionProviding)contentActionProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentActionProvider);

  return (SBFActionProviding *)WeakRetained;
}

- (CSRemoteContentInlineProviding)remoteContentInlineProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteContentInlineProvider);

  return (CSRemoteContentInlineProviding *)WeakRetained;
}

- (UIViewController)digestOnboardingSuggestionViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_digestOnboardingSuggestionViewController);

  return (UIViewController *)WeakRetained;
}

- (CSNotificationAdjunctListViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CSNotificationAdjunctListViewControllerDelegate *)WeakRetained;
}

- (CGSize)sizeToMimic
{
  double width = self->_sizeToMimic.width;
  double height = self->_sizeToMimic.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (PRWidgetMetricsProvider)widgetMetricsProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_widgetMetricsProvider);

  return (PRWidgetMetricsProvider *)WeakRetained;
}

- (void)setWidgetMetricsProvider:(id)a3
{
}

- (CSFocusActivityManager)focusActivityManager
{
  return self->_focusActivityManager;
}

- (void)setFocusActivityManager:(id)a3
{
}

- (NSMutableDictionary)identifiersToItems
{
  return self->_identifiersToItems;
}

- (void)setIdentifiersToItems:(id)a3
{
}

- (CSNowPlayingController)nowPlayingController
{
  return self->_nowPlayingController;
}

- (void)setNowPlayingController:(id)a3
{
}

- (CSContentActionInterpreter)actionInterpreter
{
  return self->_actionInterpreter;
}

- (void)setActionInterpreter:(id)a3
{
}

- (BOOL)respondingToSubviewLayoutChange
{
  return self->_respondingToSubviewLayoutChange;
}

- (void)setRespondingToSubviewLayoutChange:(BOOL)a3
{
  self->_respondingToSubviewLayoutChange = a3;
}

- (CSRemoteContentInlineManager)remoteContentInlineManager
{
  return self->_remoteContentInlineManager;
}

- (void)setRemoteContentInlineManager:(id)a3
{
}

- (CSAdjunctListActionManager)actionManager
{
  return self->_actionManager;
}

- (void)setActionManager:(id)a3
{
}

- (CSProminentUISpacerViewController)spacerViewController
{
  return self->_spacerViewController;
}

- (void)setSpacerViewController:(id)a3
{
}

- (BOOL)allowsAddRemoveAnimations
{
  return self->_allowsAddRemoveAnimations;
}

- (void)setAllowsAddRemoveAnimations:(BOOL)a3
{
  self->_allowsAddRemoveAnimations = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spacerViewController, 0);
  objc_storeStrong((id *)&self->_actionManager, 0);
  objc_storeStrong((id *)&self->_remoteContentInlineManager, 0);
  objc_storeStrong((id *)&self->_actionInterpreter, 0);
  objc_storeStrong((id *)&self->_nowPlayingController, 0);
  objc_storeStrong((id *)&self->_identifiersToItems, 0);
  objc_storeStrong((id *)&self->_focusActivityManager, 0);
  objc_destroyWeak((id *)&self->_widgetMetricsProvider);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_digestOnboardingSuggestionViewController);
  objc_destroyWeak((id *)&self->_remoteContentInlineProvider);
  objc_destroyWeak((id *)&self->_contentActionProvider);

  objc_storeStrong((id *)&self->_model, 0);
}

- (void)_insertItem:(os_log_t)log atPreferredIndex:animated:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D839D000, log, OS_LOG_TYPE_ERROR, "Cannot present an item that has neither an action or a view controller", v1, 2u);
}

void __81__CSNotificationAdjunctListViewController__insertItem_atPreferredIndex_animated___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 localizedDescription];
  int v4 = 138412290;
  double v5 = v3;
  _os_log_error_impl(&dword_1D839D000, a2, OS_LOG_TYPE_ERROR, "Error loading view controller from action: %@", (uint8_t *)&v4, 0xCu);
}

@end