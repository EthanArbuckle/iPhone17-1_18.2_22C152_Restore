@interface SFDefaultBrowserListView
- (BOOL)_isInstalling;
- (BOOL)_shouldHidePinnedHeader;
- (BOOL)_shouldHideScrollInstruction;
- (BOOL)hostAppIsInBackground;
- (CGPoint)_collectionViewInitialOffset;
- (CGSize)intrinsicContentSize;
- (SFDefaultBrowserChangeDelegate)delegate;
- (SFDefaultBrowserListView)initWithCompletionHandler:(id)a3;
- (SFDefaultBrowserListViewController)containerViewController;
- (SFDefaultBrowserPinnedHeaderView)headerView;
- (SFDefaultBrowserScrollInstructionView)instructionView;
- (id)_sectionFooterView;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)presentingViewControllerForLockupView:(id)a3;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (int64_t)userCohort;
- (void)_createPlaceholderLockupViews;
- (void)_didFinishAppInstallation:(id)a3 browserChoiceResult:(int64_t)a4;
- (void)_installBrowserWithLockupView:(id)a3 shouldObserveProgress:(BOOL)a4;
- (void)_observeScrollViewDidScroll:(id)a3;
- (void)_showAlertForRestrictedBrowser;
- (void)_updateBrowserLockupViews;
- (void)_updateCell:(id)a3 lockupView:(id)a4;
- (void)_updateHeaderWithLockupView:(id)a3;
- (void)_updateListWithState:(unint64_t)a3 lockupView:(id)a4;
- (void)_updateSelectedCellWithProgressMetaData:(id)a3 lockupView:(id)a4;
- (void)browserInstallerDidCompleteAppStoreInstallation;
- (void)browserInstallerDidCompleteInstallation;
- (void)browserInstallerDidFailWithError:(id)a3 appName:(id)a4 shouldDismissSheet:(BOOL)a5;
- (void)browserInstallerDownloadWithProgress:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)dealloc;
- (void)footerViewDidTapConfirmationAction:(id)a3;
- (void)hostApplicationEnteredBackground;
- (void)layoutSubviews;
- (void)lockupViewDidFinishRequest:(id)a3;
- (void)productDetailsUserDidInteractWithApp:(id)a3 interactionType:(id)a4;
- (void)setContainerViewController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHeaderView:(id)a3;
- (void)setHostAppIsInBackground:(BOOL)a3;
- (void)setInstructionView:(id)a3;
- (void)setUserCohort:(int64_t)a3;
@end

@implementation SFDefaultBrowserListView

- (SFDefaultBrowserListView)initWithCompletionHandler:(id)a3
{
  v39[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)SFDefaultBrowserListView;
  v5 = [(SFDefaultBrowserListView *)&v38 init];
  if (v5)
  {
    uint64_t v6 = MEMORY[0x1AD0C36A0](v4);
    id completionHandler = v5->_completionHandler;
    v5->_id completionHandler = (id)v6;

    [(SFDefaultBrowserListView *)v5 _createPlaceholderLockupViews];
    [(SFDefaultBrowserListView *)v5 _updateBrowserLockupViews];
    v36 = (void *)[objc_alloc(MEMORY[0x1E4FB1580]) initWithSectionProvider:&__block_literal_global_0];
    id v8 = objc_alloc(MEMORY[0x1E4FB1568]);
    [MEMORY[0x1E4FB1BA8] mainScreen];
    v9 = id v37 = v4;
    [v9 bounds];
    uint64_t v10 = objc_msgSend(v8, "initWithFrame:collectionViewLayout:", v36);
    collectionView = v5->_collectionView;
    v5->_collectionView = (UICollectionView *)v10;

    [(UICollectionView *)v5->_collectionView setDelegate:v5];
    [(UICollectionView *)v5->_collectionView setDataSource:v5];
    [(UICollectionView *)v5->_collectionView setScrollEnabled:0];
    v12 = v5->_collectionView;
    uint64_t v13 = objc_opt_class();
    v14 = +[SFDefaultBrowserAppCollectionViewCell reuseIdentifier];
    [(UICollectionView *)v12 registerClass:v13 forCellWithReuseIdentifier:v14];

    v15 = v5->_collectionView;
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = *MEMORY[0x1E4FB2760];
    v18 = +[SFDefaultBrowserListFooterView reuseIdentifier];
    [(UICollectionView *)v15 registerClass:v16 forSupplementaryViewOfKind:v17 withReuseIdentifier:v18];

    [(SFDefaultBrowserListView *)v5 addSubview:v5->_collectionView];
    [(UICollectionView *)v5->_collectionView setTranslatesAutoresizingMaskIntoConstraints:0];
    v32 = [(SFDefaultBrowserListView *)v5 layoutMarginsGuide];
    v30 = (void *)MEMORY[0x1E4F28DC8];
    v35 = [(UICollectionView *)v5->_collectionView topAnchor];
    v34 = [(SFDefaultBrowserListView *)v5 topAnchor];
    v33 = [v35 constraintEqualToAnchor:v34];
    v39[0] = v33;
    v31 = [(UICollectionView *)v5->_collectionView leadingAnchor];
    v19 = [v32 leadingAnchor];
    v20 = [v31 constraintEqualToAnchor:v19];
    v39[1] = v20;
    v21 = [(UICollectionView *)v5->_collectionView trailingAnchor];
    v22 = [v32 trailingAnchor];
    v23 = [v21 constraintEqualToAnchor:v22];
    v39[2] = v23;
    v24 = [(UICollectionView *)v5->_collectionView bottomAnchor];
    v25 = [(SFDefaultBrowserListView *)v5 bottomAnchor];
    v26 = [v24 constraintEqualToAnchor:v25];
    v39[3] = v26;
    v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:4];
    [v30 activateConstraints:v27];

    id v4 = v37;
    v28 = v5;
  }
  return v5;
}

id __54__SFDefaultBrowserListView_initWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v3 = (objc_class *)MEMORY[0x1E4FB1558];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithAppearance:0];
  uint64_t v6 = [MEMORY[0x1E4FB1618] clearColor];
  [v5 setBackgroundColor:v6];

  [v5 setShowsSeparators:0];
  v7 = [MEMORY[0x1E4FB1330] sectionWithListConfiguration:v5 layoutEnvironment:v4];

  objc_msgSend(v7, "setContentInsets:", *MEMORY[0x1E4FB12A8], *(double *)(MEMORY[0x1E4FB12A8] + 8), *(double *)(MEMORY[0x1E4FB12A8] + 16), *(double *)(MEMORY[0x1E4FB12A8] + 24));

  return v7;
}

- (void)dealloc
{
  [(UIScrollView *)self->_containerScrollView _removeScrollViewScrollObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)SFDefaultBrowserListView;
  [(SFDefaultBrowserListView *)&v3 dealloc];
}

- (void)setContainerViewController:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);

  v5 = obj;
  if (WeakRetained != obj)
  {
    [(UIScrollView *)self->_containerScrollView _removeScrollViewScrollObserver:self];
    objc_storeWeak((id *)&self->_containerViewController, obj);
    uint64_t v6 = [obj scrollView];
    objc_storeStrong((id *)&self->_containerScrollView, v6);
    [v6 _addScrollViewScrollObserver:self];
    browserInstaller = self->_browserInstaller;
    if (browserInstaller)
    {
      [(SFDefaultBrowserInstaller *)browserInstaller setPresentingViewController:obj];
    }
    else
    {
      id v8 = [[SFDefaultBrowserInstaller alloc] initWithPresentingViewController:obj];
      v9 = self->_browserInstaller;
      self->_browserInstaller = v8;

      [(SFDefaultBrowserInstaller *)self->_browserInstaller setDelegate:self];
    }

    v5 = obj;
  }
}

- (void)hostApplicationEnteredBackground
{
  objc_super v3 = [MEMORY[0x1E4F98948] sharedLogger];
  LOBYTE(v4) = self->_userTriedSelectingDisabledBrowser;
  [v3 didSelectBrowserChoice:0 browserAlreadyInstalled:0 browsersWithProductPagesViewed:self->_browsersWithProductPageViewed browserList:self->_browserListBundleIDs userCohort:self->_userCohort listContainsDisabledBrowser:self->_listContainsDisabledBrowser userTriedSelectingDisabledBrowser:v4];

  if ([(SFDefaultBrowserListView *)self _isInstalling])
  {
    if (self->_state == 2) {
      [(SFDefaultBrowserInstaller *)self->_browserInstaller stopQuerying];
    }
    [(SFDefaultBrowserInstaller *)self->_browserInstaller enableDaemonNotification];
    id v5 = [(NSArray *)self->_browserAppLockupViews objectAtIndexedSubscript:[(NSIndexPath *)self->_selectedIndexPath item]];
    [(SFDefaultBrowserListView *)self _didFinishAppInstallation:v5 browserChoiceResult:2];
  }
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)SFDefaultBrowserListView;
  [(SFDefaultBrowserListView *)&v4 layoutSubviews];
  [(SFDefaultBrowserListView *)self bounds];
  double v3 = fmax((CGRectGetWidth(v5) + -500.0) * 0.5, 0.0);
  -[SFDefaultBrowserListView setLayoutMargins:](self, "setLayoutMargins:", 0.0, v3, 0.0, v3);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  collectionView = self->_collectionView;
  id v6 = a4;
  v7 = +[SFDefaultBrowserAppCollectionViewCell reuseIdentifier];
  id v8 = [(UICollectionView *)collectionView dequeueReusableCellWithReuseIdentifier:v7 forIndexPath:v6];

  browserAppLockupViews = self->_browserAppLockupViews;
  uint64_t v10 = [v6 row];

  v11 = [(NSArray *)browserAppLockupViews objectAtIndexedSubscript:v10];
  [(SFDefaultBrowserListView *)self _updateCell:v8 lockupView:v11];

  return v8;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  collectionView = self->_collectionView;
  uint64_t v7 = *MEMORY[0x1E4FB2760];
  id v8 = a5;
  v9 = +[SFDefaultBrowserListFooterView reuseIdentifier];
  uint64_t v10 = [(UICollectionView *)collectionView dequeueReusableSupplementaryViewOfKind:v7 withReuseIdentifier:v9 forIndexPath:v8];

  [v10 setDelegate:self];
  [v10 updateButtonState:self->_state];

  return v10;
}

- (void)_updateCell:(id)a3 lockupView:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    [v5 setLockupView:v6];
    uint64_t v7 = [v6 lockup];
    id v8 = [v7 id];

    if (v8)
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4FB1530]);
      [v9 setDisplayedState:0];
      uint64_t v10 = [v6 lockup];
      v11 = [v10 offer];

      if (v11)
      {
        v15[0] = v9;
        id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
        [v5 setAccessories:v12];
      }
      else
      {
        v14[0] = v9;
        id v12 = objc_alloc_init(MEMORY[0x1E4FB1518]);
        v14[1] = v12;
        uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
        objc_msgSend(v5, "setAccessories:", v13, v14[0]);
      }
    }
  }
}

- (void)_updateSelectedCellWithProgressMetaData:(id)a3 lockupView:(id)a4
{
  id v11 = a4;
  if (a3)
  {
    id v6 = (objc_class *)MEMORY[0x1E4F4BAE0];
    id v7 = a3;
    a3 = (id)[[v6 alloc] initWithMetadata:v7 action:0];
  }
  id v8 = [v11 lockup];
  id v9 = [v8 lockupWithOffer:a3];
  [v11 setLockup:v9];

  uint64_t v10 = [(UICollectionView *)self->_collectionView cellForItemAtIndexPath:self->_selectedIndexPath];
  [(SFDefaultBrowserListView *)self _updateCell:v10 lockupView:v11];
  [(SFDefaultBrowserListView *)self _updateHeaderWithLockupView:v11];
}

- (void)_updateHeaderWithLockupView:(id)a3
{
  id v12 = a3;
  id v4 = objc_alloc(MEMORY[0x1E4F4BB08]);
  id v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  id v6 = [v12 request];
  id v7 = (void *)[v6 copy];
  [v5 setRequest:v7];

  if ([(SFDefaultBrowserListView *)self _isInstalling])
  {
    id v8 = [v12 lockup];
    id v9 = [v8 offer];
  }
  else
  {
    id v9 = 0;
  }
  uint64_t v10 = [v12 lockup];
  id v11 = [v10 lockupWithOffer:v9];
  [v5 setLockup:v11];

  [(SFDefaultBrowserPinnedHeaderView *)self->_headerView setLockupView:v5];
  [(SFDefaultBrowserPinnedHeaderView *)self->_headerView setHidden:[(SFDefaultBrowserListView *)self _shouldHidePinnedHeader]];
}

- (BOOL)_isInstalling
{
  return self->_state - 1 < 2;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  p_selectedIndexPath = &self->_selectedIndexPath;
  objc_storeStrong((id *)&self->_selectedIndexPath, a4);
  id v7 = a4;
  [(SFDefaultBrowserScrollInstructionView *)self->_instructionView setHidden:[(SFDefaultBrowserListView *)self _shouldHideScrollInstruction]];
  id v8 = [(NSArray *)self->_browserAppLockupViews objectAtIndexedSubscript:[(NSIndexPath *)*p_selectedIndexPath item]];

  [(SFDefaultBrowserListView *)self _updateListWithState:3 lockupView:v8];
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return [(NSArray *)self->_browserAppLockupViews count];
}

- (void)_createPlaceholderLockupViews
{
  id v11 = [MEMORY[0x1E4F1CA48] array];
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  uint64_t v7 = 6;
  do
  {
    id v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F4BB08]), "initWithFrame:", v3, v4, v5, v6);
    [v8 setShowsPlaceholderContent:1];
    [v11 addObject:v8];

    --v7;
  }
  while (v7);
  id v9 = (NSArray *)[v11 copy];
  browserAppLockupViews = self->_browserAppLockupViews;
  self->_browserAppLockupViews = v9;

  [(UICollectionView *)self->_collectionView reloadData];
}

- (void)_updateBrowserLockupViews
{
  double v3 = +[SFBrowserASCLockupViewGenerator sharedGenerator];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__SFDefaultBrowserListView__updateBrowserLockupViews__block_invoke;
  v4[3] = &unk_1E5C72420;
  v4[4] = self;
  [v3 generateLockupViewsWithDelegate:self completionHandler:v4];
}

uint64_t __53__SFDefaultBrowserListView__updateBrowserLockupViews__block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    double v3 = (objc_class *)MEMORY[0x1E4FB1580];
    id v4 = a2;
    double v5 = (void *)[[v3 alloc] initWithSectionProvider:&__block_literal_global_23];
    uint64_t v6 = [v4 copy];

    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(v7 + 408);
    *(void *)(v7 + 408) = v6;

    id v9 = [*(id *)(*(void *)(a1 + 32) + 408) firstObject];
    uint64_t v10 = [v9 subviews];
    id v11 = [v10 firstObject];
    uint64_t v12 = [v11 effectiveUserInterfaceLayoutDirection];

    uint64_t v13 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v14 = *(void *)(a1 + 32);
    v15 = *(void **)(v14 + 480);
    *(void *)(v14 + 480) = v13;

    uint64_t v16 = *(void *)(a1 + 32);
    uint64_t v17 = *(void **)(v16 + 408);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __53__SFDefaultBrowserListView__updateBrowserLockupViews__block_invoke_3;
    v22[3] = &unk_1E5C723F8;
    v22[4] = v16;
    [v17 enumerateObjectsUsingBlock:v22];
    if ([*(id *)(*(void *)(a1 + 32) + 480) count])
    {
      v18 = [MEMORY[0x1E4F98948] sharedLogger];
      [v18 didShowBrowserChoiceScreen:*(void *)(*(void *)(a1 + 32) + 480)];
    }
    if (!v12)
    {
      [*(id *)(*(void *)(a1 + 32) + 416) setSemanticContentAttribute:3];
      [v5 setLayoutRTL:0];
    }
    [*(id *)(*(void *)(a1 + 32) + 416) setCollectionViewLayout:v5];
    v19 = *(void **)(*(void *)(a1 + 32) + 416);
    v20 = [MEMORY[0x1E4F28D60] indexSetWithIndex:0];
    [v19 reloadSections:v20];

    [*(id *)(a1 + 32) invalidateIntrinsicContentSize];
  }
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 432) + 16))();
}

id __53__SFDefaultBrowserListView__updateBrowserLockupViews__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  double v3 = (objc_class *)MEMORY[0x1E4FB1558];
  id v4 = a3;
  double v5 = (void *)[[v3 alloc] initWithAppearance:2];
  uint64_t v6 = [MEMORY[0x1E4FB1618] clearColor];
  [v5 setBackgroundColor:v6];

  [v5 setHeaderTopPadding:0.0];
  uint64_t v7 = [v5 separatorConfiguration];
  objc_msgSend(v7, "setBottomSeparatorInsets:", 0.0, 15.0, 0.0, 0.0);
  [v7 setBottomSeparatorVisibility:1];
  [v5 setFooterMode:1];
  [v5 setSeparatorConfiguration:v7];
  id v8 = [MEMORY[0x1E4FB1330] sectionWithListConfiguration:v5 layoutEnvironment:v4];

  objc_msgSend(v8, "setContentInsets:", *MEMORY[0x1E4FB12A8], *(double *)(MEMORY[0x1E4FB12A8] + 8), *(double *)(MEMORY[0x1E4FB12A8] + 16), *(double *)(MEMORY[0x1E4FB12A8] + 24));
  id v9 = (void *)MEMORY[0x1E4FB1338];
  uint64_t v10 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0];
  id v11 = [MEMORY[0x1E4FB1308] estimatedDimension:90.0];
  uint64_t v12 = [v9 sizeWithWidthDimension:v10 heightDimension:v11];

  uint64_t v13 = [MEMORY[0x1E4FB12F8] boundarySupplementaryItemWithLayoutSize:v12 elementKind:*MEMORY[0x1E4FB2760] alignment:5];
  [v13 setExtendsBoundary:1];
  v16[0] = v13;
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  [v8 setBoundarySupplementaryItems:v14];

  return v8;
}

void __53__SFDefaultBrowserListView__updateBrowserLockupViews__block_invoke_3(uint64_t a1, void *a2)
{
  id v8 = a2;
  double v3 = [v8 lockup];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    double v5 = *(void **)(*(void *)(a1 + 32) + 480);
    uint64_t v6 = [v8 lockup];
    uint64_t v7 = [v6 bundleID];
    [v5 addObject:v7];
  }
}

- (CGSize)intrinsicContentSize
{
  [(UICollectionView *)self->_collectionView bounds];
  double v4 = v3;
  double v6 = v5;
  uint64_t v7 = [(SFDefaultBrowserListView *)self traitCollection];
  +[SFDefaultBrowserAppCollectionViewCell estimatedSizeForBounds:withTraits:](SFDefaultBrowserAppCollectionViewCell, "estimatedSizeForBounds:withTraits:", v7, v4, v6);
  double v9 = v8;

  [(UICollectionView *)self->_collectionView layoutMargins];
  double v11 = v10;
  double v13 = v12;
  [(UICollectionView *)self->_collectionView bounds];
  double v15 = v14 - v11 - v13;
  [(UICollectionView *)self->_collectionView bounds];
  +[SFDefaultBrowserListFooterView sizeForBounds:state:](SFDefaultBrowserListFooterView, "sizeForBounds:state:", self->_state, v15, v16);
  double v18 = v17 + v9 * (double)[(NSArray *)self->_browserAppLockupViews count];
  double v19 = *MEMORY[0x1E4FB30D8];
  result.height = v18;
  result.width = v19;
  return result;
}

- (CGPoint)_collectionViewInitialOffset
{
  v2 = [(SFDefaultBrowserListView *)self superview];
  double v3 = v2;
  if (v2)
  {
    [v2 frame];
    double v5 = v4;
    double v7 = v6;
  }
  else
  {
    double v5 = *MEMORY[0x1E4F1DAD8];
    double v7 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }

  double v8 = v5;
  double v9 = v7;
  result.y = v9;
  result.x = v8;
  return result;
}

- (id)_sectionFooterView
{
  collectionView = self->_collectionView;
  uint64_t v3 = *MEMORY[0x1E4FB2760];
  double v4 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:0];
  double v5 = [(UICollectionView *)collectionView supplementaryViewForElementKind:v3 atIndexPath:v4];

  return v5;
}

- (BOOL)_shouldHidePinnedHeader
{
  if (!self->_selectedIndexPath) {
    return 1;
  }
  v2 = self;
  [(UICollectionView *)self->_collectionView visibleSize];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  [(UIScrollView *)v2->_containerScrollView contentOffset];
  CGFloat v8 = v7;
  double v9 = [(UICollectionView *)v2->_collectionView layoutAttributesForItemAtIndexPath:v2->_selectedIndexPath];
  [v9 size];
  CGFloat v11 = v10;
  double v13 = v12;
  [v9 frame];
  double v15 = v14;
  [(SFDefaultBrowserListView *)v2 _collectionViewInitialOffset];
  v19.origin.y = v15 + v16 - v13;
  v18.origin.x = 0.0;
  v19.origin.x = 0.0;
  v18.origin.y = v8;
  v18.size.width = v4;
  v18.size.height = v6;
  v19.size.width = v11;
  v19.size.height = v13;
  LOBYTE(v2) = CGRectIntersectsRect(v18, v19);

  return (char)v2;
}

- (BOOL)_shouldHideScrollInstruction
{
  if (!self->_selectedIndexPath || [(SFDefaultBrowserListView *)self _isInstalling]) {
    return 1;
  }
  CGFloat v4 = [(SFDefaultBrowserListView *)self _sectionFooterView];
  double v5 = v4;
  if (v4)
  {
    [v4 frame];
    CGFloat v7 = v6;
    double v9 = v8;
    [v5 frame];
    double v11 = v10;
    [(SFDefaultBrowserListView *)self _collectionViewInitialOffset];
    CGFloat v13 = v9 * 0.5 + v11 + v12;
    double v14 = self->_containerScrollView;
    [(UIScrollView *)v14 frame];
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    [(UIScrollView *)v14 contentOffset];
    CGFloat v20 = v19;

    v22.origin.x = 0.0;
    v23.origin.x = 0.0;
    v22.origin.y = v13;
    v22.size.width = v7;
    v22.size.height = v9;
    v23.origin.y = v20;
    v23.size.width = v16;
    v23.size.height = v18;
    BOOL v3 = CGRectIntersectsRect(v22, v23);
  }
  else
  {
    BOOL v3 = 1;
  }

  return v3;
}

- (void)_didFinishAppInstallation:(id)a3 browserChoiceResult:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 1)
  {
    self->_state = 3;
    CGFloat v7 = [(SFDefaultBrowserListView *)self _sectionFooterView];
    [v7 updateButtonState:self->_state];
  }
  [(UICollectionView *)self->_collectionView setUserInteractionEnabled:1];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  [WeakRetained setNavigationEnabled:1];

  [(SFDefaultBrowserListView *)self _updateSelectedCellWithProgressMetaData:0 lockupView:v6];
  double v9 = +[SFDefaultBrowserPromptController sharedController];
  char v10 = [v9 didCompleteBrowserSheet];

  if (v10)
  {
    double v11 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    double v12 = SFDefaultBrowserSelectionStateKey();
    [v11 setInteger:1 forKey:v12];

    id v13 = objc_loadWeakRetained((id *)&self->_delegate);
    double v14 = [v6 lockup];
    double v15 = [v14 bundleID];
    [v13 didChangeDefaultBrowserWithBundleIdentifier:v15 browserChoiceResult:a4];
  }
  else
  {
    CGFloat v16 = WBS_LOG_CHANNEL_PREFIXBrowserChoiceScreen();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[SFDefaultBrowserListView _didFinishAppInstallation:browserChoiceResult:](v16);
    }
  }
}

- (void)_updateListWithState:(unint64_t)a3 lockupView:(id)a4
{
  id v10 = a4;
  self->_unint64_t state = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  unint64_t state = self->_state;
  if (state - 1 >= 2)
  {
    if (state != 3) {
      goto LABEL_6;
    }
    [(UICollectionView *)self->_collectionView setUserInteractionEnabled:1];
    [WeakRetained setNavigationEnabled:1];
    [(SFDefaultBrowserListView *)self _updateSelectedCellWithProgressMetaData:0 lockupView:v10];
  }
  else
  {
    [(UICollectionView *)self->_collectionView setUserInteractionEnabled:0];
    [WeakRetained setNavigationEnabled:0];
    double v8 = [MEMORY[0x1E4F4BB20] indeterminateProgressMetadata];
    [(SFDefaultBrowserListView *)self _updateSelectedCellWithProgressMetaData:v8 lockupView:v10];
  }
  double v9 = [(SFDefaultBrowserListView *)self _sectionFooterView];
  [v9 updateButtonState:self->_state];

LABEL_6:
}

- (void)_observeScrollViewDidScroll:(id)a3
{
  [(SFDefaultBrowserPinnedHeaderView *)self->_headerView setHidden:[(SFDefaultBrowserListView *)self _shouldHidePinnedHeader]];
  BOOL v4 = [(SFDefaultBrowserListView *)self _shouldHideScrollInstruction];
  instructionView = self->_instructionView;

  [(SFDefaultBrowserScrollInstructionView *)instructionView setHidden:v4];
}

- (void)footerViewDidTapConfirmationAction:(id)a3
{
  BOOL v4 = [(NSArray *)self->_browserAppLockupViews objectAtIndexedSubscript:[(NSIndexPath *)self->_selectedIndexPath item]];
  double v5 = [v4 lockup];
  id v6 = objc_alloc(MEMORY[0x1E4F223C8]);
  CGFloat v7 = [v5 bundleID];
  double v8 = (void *)[v6 initWithBundleIdentifier:v7 allowPlaceholder:0 error:0];
  if (v8)
  {
  }
  else
  {
    double v9 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:@"com.apple.AppStore" allowPlaceholder:0 error:0];

    if (!v9)
    {
      id v10 = (void *)MEMORY[0x1E4FB1418];
      double v11 = _WBSLocalizedString();
      double v12 = NSString;
      id v13 = _WBSLocalizedString();
      double v14 = [v5 title];
      double v15 = objc_msgSend(v12, "stringWithFormat:", v13, v14);
      CGFloat v16 = [v10 alertControllerWithTitle:v11 message:v15 preferredStyle:1];

      double v17 = (void *)MEMORY[0x1E4FB1410];
      CGFloat v18 = _WBSLocalizedString();
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __63__SFDefaultBrowserListView_footerViewDidTapConfirmationAction___block_invoke;
      v27[3] = &unk_1E5C72448;
      v27[4] = self;
      id v19 = v4;
      id v28 = v19;
      CGFloat v20 = [v17 actionWithTitle:v18 style:1 handler:v27];
      [v16 addAction:v20];

      v21 = (void *)MEMORY[0x1E4FB1410];
      CGRect v22 = _WBSLocalizedString();
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __63__SFDefaultBrowserListView_footerViewDidTapConfirmationAction___block_invoke_2;
      v25[3] = &unk_1E5C72448;
      v25[4] = self;
      id v26 = v19;
      CGRect v23 = [v21 actionWithTitle:v22 style:0 handler:v25];

      [v16 addAction:v23];
      [v16 setPreferredAction:v23];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
      [WeakRetained presentViewController:v16 animated:1 completion:0];

      goto LABEL_5;
    }
  }
  [(SFDefaultBrowserListView *)self _installBrowserWithLockupView:v4 shouldObserveProgress:[(SFDefaultBrowserListView *)self hostAppIsInBackground] ^ 1];
LABEL_5:
}

uint64_t __63__SFDefaultBrowserListView_footerViewDidTapConfirmationAction___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateListWithState:3 lockupView:*(void *)(a1 + 40)];
}

uint64_t __63__SFDefaultBrowserListView_footerViewDidTapConfirmationAction___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateListWithState:1 lockupView:*(void *)(a1 + 40)];
  v2 = *(void **)(*(void *)(a1 + 32) + 464);

  return [v2 installAppStore];
}

- (void)_installBrowserWithLockupView:(id)a3 shouldObserveProgress:(BOOL)a4
{
  BOOL v4 = a4;
  id v23 = a3;
  [(SFDefaultBrowserListView *)self _updateListWithState:2 lockupView:v23];
  id v6 = [v23 lockup];
  browserListAgeRating = self->_browserListAgeRating;
  double v8 = [v6 id];
  double v9 = [v8 numberValue];
  id v10 = [(NSMutableDictionary *)browserListAgeRating objectForKeyedSubscript:v9];
  BOOL v11 = +[SFDefaultBrowserInstaller isRestrictedToInstallBrowser:v6 withAgeRating:v10];

  if (v11)
  {
    [(SFDefaultBrowserListView *)self _showAlertForRestrictedBrowser];
    goto LABEL_9;
  }
  BOOL v12 = [(SFDefaultBrowserInstaller *)self->_browserInstaller browserIsAlreadyInstalled:v6];
  browserInstaller = self->_browserInstaller;
  double v14 = self->_browserListAgeRating;
  double v15 = [v6 id];
  CGFloat v16 = [v15 numberValue];
  double v17 = [(NSMutableDictionary *)v14 objectForKeyedSubscript:v16];
  BOOL v18 = [(SFDefaultBrowserInstaller *)browserInstaller installBrowserFromLockup:v6 shouldObserveProgress:v4 ageRating:v17];

  id v19 = [v23 lockup];
  if (objc_opt_respondsToSelector())
  {

    if (!v12 && !v18) {
      goto LABEL_7;
    }
    id v19 = [MEMORY[0x1E4F98948] sharedLogger];
    CGFloat v20 = [v23 lockup];
    v21 = [v20 bundleID];
    LOBYTE(v22) = self->_userTriedSelectingDisabledBrowser;
    [v19 didSelectBrowserChoice:v21 browserAlreadyInstalled:v12 browsersWithProductPagesViewed:self->_browsersWithProductPageViewed browserList:self->_browserListBundleIDs userCohort:self->_userCohort listContainsDisabledBrowser:self->_listContainsDisabledBrowser userTriedSelectingDisabledBrowser:v22];
  }
LABEL_7:
  if (v12) {
    [(SFDefaultBrowserListView *)self _didFinishAppInstallation:v23 browserChoiceResult:1];
  }
LABEL_9:
}

- (void)browserInstallerDownloadWithProgress:(id)a3
{
  browserAppLockupViews = self->_browserAppLockupViews;
  selectedIndexPath = self->_selectedIndexPath;
  id v6 = a3;
  id v11 = [(NSArray *)browserAppLockupViews objectAtIndexedSubscript:[(NSIndexPath *)selectedIndexPath item]];
  CGFloat v7 = (void *)MEMORY[0x1E4F4BB20];
  [v6 fractionCompleted];
  double v9 = v8;

  id v10 = [v7 progressMetadataWithValue:v9];
  [(SFDefaultBrowserListView *)self _updateSelectedCellWithProgressMetaData:v10 lockupView:v11];
}

- (void)browserInstallerDidCompleteInstallation
{
  if (!self->_didInstallApp)
  {
    self->_didInstallApp = 1;
    id v3 = [(NSArray *)self->_browserAppLockupViews objectAtIndexedSubscript:[(NSIndexPath *)self->_selectedIndexPath item]];
    [(SFDefaultBrowserListView *)self _didFinishAppInstallation:v3 browserChoiceResult:0];
  }
}

- (void)browserInstallerDidCompleteAppStoreInstallation
{
  if (!self->_didInstallAppStore)
  {
    self->_didInstallAppStore = 1;
    id v3 = [(NSArray *)self->_browserAppLockupViews objectAtIndexedSubscript:[(NSIndexPath *)self->_selectedIndexPath item]];
    [(SFDefaultBrowserListView *)self _installBrowserWithLockupView:v3 shouldObserveProgress:[(SFDefaultBrowserListView *)self hostAppIsInBackground] ^ 1];
  }
}

- (void)browserInstallerDidFailWithError:(id)a3 appName:(id)a4 shouldDismissSheet:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = WBS_LOG_CHANNEL_PREFIXBrowserChoiceScreen();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    -[SFDefaultBrowserListView browserInstallerDidFailWithError:appName:shouldDismissSheet:]((uint64_t)v9, v10, v8);
  }
  id v11 = [(NSArray *)self->_browserAppLockupViews objectAtIndexedSubscript:[(NSIndexPath *)self->_selectedIndexPath item]];
  if (v5)
  {
    [(SFDefaultBrowserListView *)self _didFinishAppInstallation:v11 browserChoiceResult:2];
  }
  else
  {
    BOOL v12 = (void *)MEMORY[0x1E4FB1418];
    id v13 = NSString;
    double v14 = _WBSLocalizedString();
    double v15 = objc_msgSend(v13, "stringWithFormat:", v14, v9);
    CGFloat v16 = _WBSLocalizedString();
    double v17 = [v12 alertControllerWithTitle:v15 message:v16 preferredStyle:1];

    BOOL v18 = (void *)MEMORY[0x1E4FB1410];
    id v19 = _WBSLocalizedString();
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __88__SFDefaultBrowserListView_browserInstallerDidFailWithError_appName_shouldDismissSheet___block_invoke;
    v22[3] = &unk_1E5C72448;
    v22[4] = self;
    id v23 = v11;
    CGFloat v20 = [v18 actionWithTitle:v19 style:1 handler:v22];
    [v17 addAction:v20];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    [WeakRetained presentViewController:v17 animated:1 completion:0];
  }
}

uint64_t __88__SFDefaultBrowserListView_browserInstallerDidFailWithError_appName_shouldDismissSheet___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateListWithState:3 lockupView:*(void *)(a1 + 40)];
}

- (void)_showAlertForRestrictedBrowser
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A690B000, a2, OS_LOG_TYPE_ERROR, "Disabled to install %{public}@ due to one of the following restrictions: managed apple ID, age rating or retail store demo mode", (uint8_t *)&v2, 0xCu);
}

uint64_t __58__SFDefaultBrowserListView__showAlertForRestrictedBrowser__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateListWithState:3 lockupView:*(void *)(a1 + 40)];
}

- (id)presentingViewControllerForLockupView:(id)a3
{
  return 0;
}

- (void)lockupViewDidFinishRequest:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 lockup];
  browserListAgeRating = self->_browserListAgeRating;
  id v18 = v5;
  if (!browserListAgeRating)
  {
    CGFloat v7 = [MEMORY[0x1E4F1CA60] dictionary];
    id v8 = self->_browserListAgeRating;
    self->_browserListAgeRating = v7;

    BOOL v5 = v18;
    browserListAgeRating = self->_browserListAgeRating;
  }
  id v9 = [v5 offer];
  id v10 = [v9 ageRating];
  id v11 = [v18 id];
  BOOL v12 = [v11 numberValue];
  [(NSMutableDictionary *)browserListAgeRating setObject:v10 forKey:v12];

  if (!self->_listContainsDisabledBrowser)
  {
    id v13 = [v18 offer];
    double v14 = [v13 ageRating];
    BOOL v15 = +[SFDefaultBrowserInstaller isRestrictedToInstallBrowser:v18 withAgeRating:v14];

    if (v15) {
      self->_listContainsDisabledBrowser = 1;
    }
  }
  CGFloat v16 = [v4 lockup];
  double v17 = [v16 lockupWithOffer:0];
  [v4 setLockup:v17];
}

- (void)productDetailsUserDidInteractWithApp:(id)a3 interactionType:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = WBS_LOG_CHANNEL_PREFIXBrowserChoiceScreen();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_1A690B000, v8, OS_LOG_TYPE_INFO, "Received user interaction with type %{public}@", (uint8_t *)&buf, 0xCu);
  }
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x2020000000;
  id v9 = (void *)getASCLockupProductDetailsInteractionTypeSelectedSymbolLoc_ptr;
  uint64_t v25 = getASCLockupProductDetailsInteractionTypeSelectedSymbolLoc_ptr;
  if (!getASCLockupProductDetailsInteractionTypeSelectedSymbolLoc_ptr)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v27 = __getASCLockupProductDetailsInteractionTypeSelectedSymbolLoc_block_invoke;
    id v28 = &unk_1E5C723B0;
    v29 = &v22;
    __getASCLockupProductDetailsInteractionTypeSelectedSymbolLoc_block_invoke((uint64_t)&buf);
    id v9 = (void *)v23[3];
  }
  _Block_object_dispose(&v22, 8);
  if (!v9)
  {
    -[SFDefaultBrowserListView productDetailsUserDidInteractWithApp:interactionType:]();
    __break(1u);
  }
  if (objc_msgSend(v7, "isEqualToString:", *v9, v22))
  {
    NSUInteger v10 = [(NSArray *)self->_browserAppLockupViews indexOfObject:v6];
    id v11 = [MEMORY[0x1E4F28D58] indexPathForItem:v10 inSection:0];
    [(UICollectionView *)self->_collectionView selectItemAtIndexPath:v11 animated:0 scrollPosition:0];
    [(SFDefaultBrowserListView *)self collectionView:self->_collectionView didSelectItemAtIndexPath:v11];
  }
  if (!self->_browsersWithProductPageViewed)
  {
    BOOL v12 = [MEMORY[0x1E4F1CA80] set];
    browsersWithProductPageViewed = self->_browsersWithProductPageViewed;
    self->_browsersWithProductPageViewed = v12;
  }
  double v14 = [v6 lockup];
  char v15 = objc_opt_respondsToSelector();

  if (v15)
  {
    CGFloat v16 = self->_browsersWithProductPageViewed;
    double v17 = [v6 lockup];
    id v18 = [v17 bundleID];
    [(NSMutableSet *)v16 addObject:v18];

    id v19 = [MEMORY[0x1E4F98948] sharedLogger];
    CGFloat v20 = [v6 lockup];
    v21 = [v20 bundleID];
    [v19 didViewBrowserProductPage:v21];
  }
}

- (SFDefaultBrowserChangeDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SFDefaultBrowserChangeDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SFDefaultBrowserListViewController)containerViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);

  return (SFDefaultBrowserListViewController *)WeakRetained;
}

- (SFDefaultBrowserPinnedHeaderView)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
}

- (SFDefaultBrowserScrollInstructionView)instructionView
{
  return self->_instructionView;
}

- (void)setInstructionView:(id)a3
{
}

- (BOOL)hostAppIsInBackground
{
  return self->_hostAppIsInBackground;
}

- (void)setHostAppIsInBackground:(BOOL)a3
{
  self->_hostAppIsInBackground = a3;
}

- (int64_t)userCohort
{
  return self->_userCohort;
}

- (void)setUserCohort:(int64_t)a3
{
  self->_userCohort = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instructionView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_destroyWeak((id *)&self->_containerViewController);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_browserListAgeRating, 0);
  objc_storeStrong((id *)&self->_browsersWithProductPageViewed, 0);
  objc_storeStrong((id *)&self->_browserListBundleIDs, 0);
  objc_storeStrong((id *)&self->_containerScrollView, 0);
  objc_storeStrong((id *)&self->_browserInstaller, 0);
  objc_storeStrong((id *)&self->_selectedIndexPath, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);

  objc_storeStrong((id *)&self->_browserAppLockupViews, 0);
}

- (void)_didFinishAppInstallation:(os_log_t)log browserChoiceResult:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A690B000, log, OS_LOG_TYPE_ERROR, "Failed to commit latest version in file", v1, 2u);
}

- (void)browserInstallerDidFailWithError:(uint64_t)a1 appName:(void *)a2 shouldDismissSheet:(void *)a3 .cold.1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  BOOL v5 = a2;
  id v6 = objc_msgSend(a3, "safari_privacyPreservingDescription");
  int v7 = 138543618;
  uint64_t v8 = a1;
  __int16 v9 = 2114;
  NSUInteger v10 = v6;
  _os_log_error_impl(&dword_1A690B000, v5, OS_LOG_TYPE_ERROR, "Failed to install %{public}@ with error: %{public}@", (uint8_t *)&v7, 0x16u);
}

- (uint64_t)productDetailsUserDidInteractWithApp:interactionType:.cold.1()
{
  dlerror();
  v0 = abort_report_np();
  return -[SSReadingList addReadingListItemWithURL:title:previewText:error:](v0);
}

@end