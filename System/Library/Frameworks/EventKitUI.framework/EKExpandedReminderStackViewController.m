@interface EKExpandedReminderStackViewController
- (BOOL)canManagePresentationStyle;
- (BOOL)expandedReminderStackShouldDoCompactLayout;
- (BOOL)preferModalPresentation;
- (BOOL)wantsManagement;
- (CGRect)stackedReminderViewFrame;
- (EKExpandedReminderStackViewController)initWithEvents:(id)a3 delegate:(id)a4;
- (UIVisualEffectView)visualEffectView;
- (double)transitionDuration:(id)a3;
- (id)_eventAtIndexPath:(id)a3;
- (id)cellForItemIdentifier:(id)a3 indexPath:(id)a4 collectionView:(id)a5;
- (id)collectionViewDataSource;
- (id)events;
- (id)loadReminderWithEKEvent:(id)a3;
- (void)_handleBackgroundTap:(id)a3;
- (void)_reloadCollectionViewDataWithoutAnimation;
- (void)_updateBlurBackground;
- (void)_updatePopoverSize;
- (void)animateTransition:(id)a3;
- (void)clearSnapshotWithAnimating:(BOOL)a3 completion:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)dismissCurrentViewController;
- (void)loadSnapshotWithAnimating:(BOOL)a3 completion:(id)a4;
- (void)reminderDetailDismissedWithDeletedEvent:(id)a3;
- (void)reminderToggled:(id)a3;
- (void)setEKExpandedReminderStackViewControllerDelegate:(id)a3;
- (void)setOccurrenceViewOnCanvasHidden:(BOOL)a3;
- (void)setPreferModalPresentation:(BOOL)a3;
- (void)setSelectedOccurrenceViewOnCanvasHidden:(BOOL)a3;
- (void)setVisualEffectView:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation EKExpandedReminderStackViewController

- (EKExpandedReminderStackViewController)initWithEvents:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)EKExpandedReminderStackViewController;
  v9 = [(EKExpandedReminderStackViewController *)&v13 init];
  v10 = v9;
  if (v9)
  {
    [(EKExpandedReminderStackViewController *)v9 setPreferModalPresentation:0];
    objc_storeStrong((id *)&v10->_events, a3);
    objc_storeStrong((id *)&v10->_delegate, a4);
    v10->_presentingTransitionCancelled = 0;
    v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:v10 selector:sel__eventModified_ name:*MEMORY[0x1E4F25448] object:0];
  }
  return v10;
}

- (id)loadReminderWithEKEvent:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isReminderIntegrationEvent])
  {
    v5 = [v4 uniqueID];
    v6 = [MEMORY[0x1E4F1CB10] URLWithString:v5];
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x2050000000;
    id v7 = (void *)getREMObjectIDClass_softClass;
    uint64_t v27 = getREMObjectIDClass_softClass;
    if (!getREMObjectIDClass_softClass)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getREMObjectIDClass_block_invoke;
      v29 = &unk_1E6087D90;
      v30 = &v24;
      __getREMObjectIDClass_block_invoke((uint64_t)buf);
      id v7 = (void *)v25[3];
    }
    id v8 = v7;
    _Block_object_dispose(&v24, 8);
    v9 = [v8 objectIDWithURL:v6];
    if (v9)
    {
      reminderStore = self->_reminderStore;
      if (!reminderStore)
      {
        uint64_t v24 = 0;
        v25 = &v24;
        uint64_t v26 = 0x2050000000;
        v11 = (void *)getREMStoreClass_softClass;
        uint64_t v27 = getREMStoreClass_softClass;
        if (!getREMStoreClass_softClass)
        {
          *(void *)buf = MEMORY[0x1E4F143A8];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __getREMStoreClass_block_invoke;
          v29 = &unk_1E6087D90;
          v30 = &v24;
          __getREMStoreClass_block_invoke((uint64_t)buf);
          v11 = (void *)v25[3];
        }
        v12 = v11;
        _Block_object_dispose(&v24, 8);
        objc_super v13 = (REMStore *)objc_alloc_init(v12);
        p_reminderStore = &self->_reminderStore;
        v15 = *p_reminderStore;
        *p_reminderStore = v13;

        reminderStore = *p_reminderStore;
      }
      id v23 = 0;
      v16 = [(REMStore *)reminderStore fetchReminderWithObjectID:v9 error:&v23];
      id v17 = v23;
      v18 = v17;
      if (!v16 || v17)
      {
        v19 = kEKUILogHandle;
        if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)&buf[4] = v6;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v18;
          _os_log_impl(&dword_1B3F4C000, v19, OS_LOG_TYPE_ERROR, "Unable to fetch reminder (objectID: %@). Error: %@", buf, 0x16u);
        }
      }
      id v20 = v16;
    }
    else
    {
      id v20 = 0;
    }
  }
  else
  {
    v21 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v4;
      _os_log_impl(&dword_1B3F4C000, v21, OS_LOG_TYPE_ERROR, "Trying to reload reminder with EKEvent, but it's not a reminder. %@", buf, 0xCu);
    }
    id v20 = 0;
  }

  return v20;
}

- (void)setEKExpandedReminderStackViewControllerDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
  id v5 = a3;
  collectionView = self->_collectionView;
  id v7 = [[EKExpandedReminderStackLayout alloc] initWithDelegate:self];
  [(UICollectionView *)collectionView setCollectionViewLayout:v7 animated:0];

  [(UICollectionView *)self->_collectionView layoutIfNeeded];

  [(EKExpandedReminderStackViewController *)self loadSnapshotWithAnimating:0 completion:0];
}

- (void)viewDidLoad
{
  v34[4] = *MEMORY[0x1E4F143B8];
  v33.receiver = self;
  v33.super_class = (Class)EKExpandedReminderStackViewController;
  [(EKExpandedReminderStackViewController *)&v33 viewDidLoad];
  id v3 = objc_alloc(MEMORY[0x1E4FB1568]);
  id v4 = [[EKExpandedReminderStackLayout alloc] initWithDelegate:self];
  id v5 = (UICollectionView *)objc_msgSend(v3, "initWithFrame:collectionViewLayout:", v4, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  collectionView = self->_collectionView;
  self->_collectionView = v5;

  id v7 = [(EKExpandedReminderStackViewController *)self collectionViewDataSource];
  [(UICollectionView *)self->_collectionView setDataSource:v7];

  [(UICollectionView *)self->_collectionView setDelegate:self];
  [(UICollectionView *)self->_collectionView setTranslatesAutoresizingMaskIntoConstraints:0];
  id v8 = [MEMORY[0x1E4FB1618] clearColor];
  [(UICollectionView *)self->_collectionView setBackgroundColor:v8];

  [(UICollectionView *)self->_collectionView setBackgroundView:0];
  v9 = [(EKExpandedReminderStackViewController *)self view];
  [v9 addSubview:self->_collectionView];

  v10 = [(EKExpandedReminderStackViewController *)self transitioningDelegate];

  if (!v10) {
    [(EKExpandedReminderStackViewController *)self loadSnapshotWithAnimating:0 completion:0];
  }
  v11 = (objc_class *)objc_opt_class();
  v32 = NSStringFromClass(v11);
  [(UICollectionView *)self->_collectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:v32];
  v12 = (objc_class *)objc_opt_class();
  uint64_t v31 = NSStringFromClass(v12);
  [(UICollectionView *)self->_collectionView registerClass:objc_opt_class() forSupplementaryViewOfKind:*MEMORY[0x1E4FB2770] withReuseIdentifier:v31];
  id v23 = (void *)MEMORY[0x1E4F28DC8];
  v29 = [(UICollectionView *)self->_collectionView topAnchor];
  v30 = [(EKExpandedReminderStackViewController *)self view];
  v28 = [v30 topAnchor];
  uint64_t v27 = [v29 constraintEqualToAnchor:v28];
  v34[0] = v27;
  v25 = [(UICollectionView *)self->_collectionView bottomAnchor];
  uint64_t v26 = [(EKExpandedReminderStackViewController *)self view];
  uint64_t v24 = [v26 bottomAnchor];
  objc_super v13 = [v25 constraintEqualToAnchor:v24];
  v34[1] = v13;
  v14 = [(UICollectionView *)self->_collectionView leadingAnchor];
  v15 = [(EKExpandedReminderStackViewController *)self view];
  v16 = [v15 leadingAnchor];
  id v17 = [v14 constraintEqualToAnchor:v16];
  v34[2] = v17;
  v18 = [(UICollectionView *)self->_collectionView trailingAnchor];
  v19 = [(EKExpandedReminderStackViewController *)self view];
  id v20 = [v19 trailingAnchor];
  v21 = [v18 constraintEqualToAnchor:v20];
  v34[3] = v21;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:4];
  [v23 activateConstraints:v22];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)EKExpandedReminderStackViewController;
  [(EKExpandedReminderStackViewController *)&v6 viewWillAppear:a3];
  [(EKExpandedReminderStackViewController *)self _updateBlurBackground];
  id v4 = [(EKExpandedReminderStackViewController *)self navigationController];
  [v4 setNavigationBarHidden:1];

  id v5 = [(EKExpandedReminderStackViewController *)self navigationController];
  [v5 setToolbarHidden:1];

  [(EKExpandedReminderStackViewController *)self _updatePopoverSize];
  if (objc_opt_respondsToSelector()) {
    [(EKExpandedReminderStackViewControllerDelegate *)self->_delegate setModelSelectedEvents:self->_events];
  }
}

- (id)events
{
  return self->_events;
}

- (void)reminderDetailDismissedWithDeletedEvent:(id)a3
{
  if (a3)
  {
    events = self->_events;
    id v5 = a3;
    objc_super v6 = (NSArray *)[(NSArray *)events mutableCopy];
    [(NSArray *)v6 removeObject:v5];

    id v7 = self->_events;
    self->_events = v6;
  }

  [(EKExpandedReminderStackViewController *)self _reloadCollectionViewDataWithoutAnimation];
}

- (id)cellForItemIdentifier:(id)a3 indexPath:(id)a4 collectionView:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v12 = [(EKExpandedReminderStackViewControllerDelegate *)self->_delegate overrideCellColor];

    v11 = (void *)v12;
  }
  objc_super v13 = [v8 event];
  v36 = v9;
  v37 = v11;
  v35 = self;
  if ([v13 hasRecurrenceRules])
  {
    v14 = [(EKExpandedReminderStackViewController *)self loadReminderWithEKEvent:v13];
    uint64_t v39 = 0;
    v40 = &v39;
    uint64_t v41 = 0x2050000000;
    v15 = (void *)getREMRecurrenceRuleFormatterClass_softClass;
    uint64_t v42 = getREMRecurrenceRuleFormatterClass_softClass;
    if (!getREMRecurrenceRuleFormatterClass_softClass)
    {
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __getREMRecurrenceRuleFormatterClass_block_invoke;
      v38[3] = &unk_1E6087D90;
      v38[4] = &v39;
      __getREMRecurrenceRuleFormatterClass_block_invoke((uint64_t)v38);
      v15 = (void *)v40[3];
    }
    id v16 = v15;
    _Block_object_dispose(&v39, 8);
    id v17 = [v14 recurrenceRules];
    v18 = [v17 firstObject];
    v19 = [v13 startDate];
    id v20 = [v13 eventStore];
    v21 = [v20 timeZone];
    v22 = [v16 shortNaturalLanguageDescriptionForRecurrenceRule:v18 date:v19 timeZone:v21 lowercase:0];

    id v9 = v36;
  }
  else
  {
    v22 = 0;
  }
  id v23 = (objc_class *)objc_opt_class();
  uint64_t v24 = NSStringFromClass(v23);
  v34 = v10;
  v25 = [v10 dequeueReusableCellWithReuseIdentifier:v24 forIndexPath:v9];

  uint64_t v26 = [v8 title];
  uint64_t v27 = [v8 completed];
  uint64_t v28 = [v8 editable];
  v29 = [v8 date];
  v30 = [v8 color];
  uint64_t v31 = [v8 buttonImageName];
  [v25 setupCellWithTitle:v26 completed:v27 editable:v28 date:v29 buttonColor:v30 buttonImageName:v31 backgroundColor:v37 recurringString:v22 delegate:v35];

  if (CalendarLinkLibraryCore())
  {
    v32 = [v8 event];
    objc_msgSend(v25, "Cal_annotateWithEvent:", v32);
  }

  return v25;
}

- (id)collectionViewDataSource
{
  dataSource = self->_dataSource;
  if (!dataSource)
  {
    if (self->_collectionView)
    {
      objc_initWeak(&location, self);
      id v4 = objc_alloc(MEMORY[0x1E4FB1598]);
      collectionView = self->_collectionView;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __65__EKExpandedReminderStackViewController_collectionViewDataSource__block_invoke;
      v12[3] = &unk_1E6087CF0;
      objc_copyWeak(&v13, &location);
      objc_super v6 = (UICollectionViewDiffableDataSource *)[v4 initWithCollectionView:collectionView cellProvider:v12];
      id v7 = self->_dataSource;
      self->_dataSource = v6;

      id v8 = self->_dataSource;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __65__EKExpandedReminderStackViewController_collectionViewDataSource__block_invoke_2;
      v10[3] = &unk_1E6087D18;
      objc_copyWeak(&v11, &location);
      [(UICollectionViewDiffableDataSource *)v8 setSupplementaryViewProvider:v10];
      objc_destroyWeak(&v11);
      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
      dataSource = self->_dataSource;
    }
    else
    {
      dataSource = 0;
    }
  }

  return dataSource;
}

id __65__EKExpandedReminderStackViewController_collectionViewDataSource__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v11 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v12 = [WeakRetained cellForItemIdentifier:v9 indexPath:v8 collectionView:v7];
  }
  else
  {
    uint64_t v12 = objc_opt_new();
  }
  id v13 = (void *)v12;

  return v13;
}

id __65__EKExpandedReminderStackViewController_collectionViewDataSource__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v11 = (objc_class *)objc_opt_class();
    uint64_t v12 = NSStringFromClass(v11);
    id v13 = [v7 dequeueReusableSupplementaryViewOfKind:v8 withReuseIdentifier:v12 forIndexPath:v9];

    v14 = [WeakRetained[123] firstObject];
    v15 = [v14 startDate];
    [v13 setupWithDate:v15];
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (void)loadSnapshotWithAnimating:(BOOL)a3 completion:(id)a4
{
  BOOL v17 = a3;
  v25[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  objc_super v6 = objc_opt_new();
  v25[0] = @"section";
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
  [v6 appendSectionsWithIdentifiers:v7];

  id v8 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v9 = self->_events;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = [[EKExpandedHashableReminder alloc] initWithEKEvent:*(void *)(*((void *)&v20 + 1) + 8 * v13)];
        [v8 addObject:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v11);
  }

  [v6 appendItemsWithIdentifiers:v8];
  v15 = [(EKExpandedReminderStackViewController *)self collectionViewDataSource];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __78__EKExpandedReminderStackViewController_loadSnapshotWithAnimating_completion___block_invoke;
  v18[3] = &unk_1E6087BD8;
  id v19 = v5;
  id v16 = v5;
  [v15 applySnapshot:v6 animatingDifferences:v17 completion:v18];
}

uint64_t __78__EKExpandedReminderStackViewController_loadSnapshotWithAnimating_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)clearSnapshotWithAnimating:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  id v8 = [(EKExpandedReminderStackViewController *)self collectionViewDataSource];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __79__EKExpandedReminderStackViewController_clearSnapshotWithAnimating_completion___block_invoke;
  v10[3] = &unk_1E6087BD8;
  id v11 = v6;
  id v9 = v6;
  [v8 applySnapshot:v7 animatingDifferences:v4 completion:v10];
}

uint64_t __79__EKExpandedReminderStackViewController_clearSnapshotWithAnimating_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  delegate = self->_delegate;
  id v5 = [(EKExpandedReminderStackViewController *)self _eventAtIndexPath:a4];
  [(EKExpandedReminderStackViewControllerDelegate *)delegate showReminderDetail:v5];
}

- (BOOL)expandedReminderStackShouldDoCompactLayout
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  delegate = self->_delegate;

  return [(EKExpandedReminderStackViewControllerDelegate *)delegate shouldShowCompactLayout];
}

- (CGRect)stackedReminderViewFrame
{
  if (objc_opt_respondsToSelector())
  {
    delegate = self->_delegate;
    BOOL v4 = [(NSArray *)self->_events firstObject];
    id v5 = [(EKExpandedReminderStackViewControllerDelegate *)delegate occurrenceViewForEvent:v4];

    [v5 bounds];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    v14 = [(EKExpandedReminderStackViewController *)self view];
    objc_msgSend(v5, "convertRect:toView:", v14, v7, v9, v11, v13);
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;

    long long v23 = [(EKExpandedReminderStackViewController *)self view];
    [v23 safeAreaInsets];
    double v25 = v24;

    if ((CalInterfaceIsLeftToRight() & 1) == 0)
    {
      uint64_t v26 = [(EKExpandedReminderStackViewController *)self view];
      [v26 frame];
      double v16 = v27 - v16 - v20;
    }
    double v28 = v18 - v25;
  }
  else
  {
    double v16 = *MEMORY[0x1E4F1DB28];
    double v28 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v20 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v22 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  double v29 = v16;
  double v30 = v28;
  double v31 = v20;
  double v32 = v22;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

- (void)_reloadCollectionViewDataWithoutAnimation
{
  [(EKExpandedReminderStackViewController *)self loadSnapshotWithAnimating:0 completion:0];
  collectionView = self->_collectionView;
  BOOL v4 = [[EKExpandedReminderStackLayout alloc] initWithDelegate:self];
  [(UICollectionView *)collectionView setCollectionViewLayout:v4 animated:0];

  id v5 = self->_collectionView;

  [(UICollectionView *)v5 layoutIfNeeded];
}

- (void)_updateBlurBackground
{
  v34[4] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(EKExpandedReminderStackViewController *)self expandedReminderStackShouldDoCompactLayout];
  BOOL v4 = [(EKExpandedReminderStackViewController *)self visualEffectView];
  id v5 = v4;
  if (v3)
  {

    if (!v5)
    {
      double v6 = (void *)[objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:0];
      [(EKExpandedReminderStackViewController *)self setVisualEffectView:v6];

      double v7 = [(EKExpandedReminderStackViewController *)self visualEffectView];
      [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

      double v8 = [(EKExpandedReminderStackViewController *)self view];
      double v9 = [(EKExpandedReminderStackViewController *)self visualEffectView];
      [v8 addSubview:v9];

      uint64_t v26 = (void *)MEMORY[0x1E4F28DC8];
      double v32 = [(UIVisualEffectView *)self->_visualEffectView leadingAnchor];
      objc_super v33 = [(EKExpandedReminderStackViewController *)self view];
      double v31 = [v33 leadingAnchor];
      double v30 = [v32 constraintEqualToAnchor:v31];
      v34[0] = v30;
      double v28 = [(UIVisualEffectView *)self->_visualEffectView topAnchor];
      double v29 = [(EKExpandedReminderStackViewController *)self view];
      double v27 = [v29 topAnchor];
      double v25 = [v28 constraintEqualToAnchor:v27];
      v34[1] = v25;
      double v10 = [(UIVisualEffectView *)self->_visualEffectView trailingAnchor];
      double v11 = [(EKExpandedReminderStackViewController *)self view];
      double v12 = [v11 trailingAnchor];
      double v13 = [v10 constraintEqualToAnchor:v12];
      v34[2] = v13;
      v14 = [(UIVisualEffectView *)self->_visualEffectView bottomAnchor];
      double v15 = [(EKExpandedReminderStackViewController *)self view];
      double v16 = [v15 bottomAnchor];
      double v17 = [v14 constraintEqualToAnchor:v16];
      v34[3] = v17;
      double v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:4];
      [v26 activateConstraints:v18];

      double v19 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__handleBackgroundTap_];
      [v19 setCancelsTouchesInView:0];
      [(UICollectionView *)self->_collectionView addGestureRecognizer:v19];
      double v20 = [(EKExpandedReminderStackViewController *)self view];
      double v21 = [(EKExpandedReminderStackViewController *)self visualEffectView];
      [v20 sendSubviewToBack:v21];

      double v22 = [(EKExpandedReminderStackViewController *)self transitioningDelegate];

      if (!v22)
      {
        long long v23 = [MEMORY[0x1E4FB14C8] effectWithStyle:6];
        [(UIVisualEffectView *)self->_visualEffectView setEffect:v23];
      }
    }
  }
  else
  {

    if (v5)
    {
      double v24 = [(EKExpandedReminderStackViewController *)self visualEffectView];
      [v24 removeFromSuperview];

      [(EKExpandedReminderStackViewController *)self setVisualEffectView:0];
    }
  }
}

- (void)_handleBackgroundTap:(id)a3
{
  [a3 locationInView:self->_collectionView];
  -[UICollectionView indexPathForItemAtPoint:](self->_collectionView, "indexPathForItemAtPoint:");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!v7
    || ([(UICollectionView *)self->_collectionView cellForItemAtIndexPath:v7],
        (uint64_t v4 = objc_claimAutoreleasedReturnValue()) == 0)
    || (id v5 = (void *)v4,
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v5,
        (isKindOfClass & 1) == 0))
  {
    [(EKExpandedReminderStackViewController *)self dismissCurrentViewController];
  }
}

- (id)_eventAtIndexPath:(id)a3
{
  events = self->_events;
  uint64_t v4 = [a3 row];

  return [(NSArray *)events objectAtIndexedSubscript:v4];
}

- (void)_updatePopoverSize
{
  [(UICollectionView *)self->_collectionView layoutIfNeeded];
  double v3 = EKUIContainedControllerIdealWidth();
  +[EKExpandedReminderStackLayout verticalCellPaddingForPopover];
  double v5 = v4;
  +[EKExpandedReminderStackLayout verticalCollectionViewPaddingForPopover];
  double v7 = -(v5 - v6 * 2.0);
  if ([(NSArray *)self->_events count])
  {
    unint64_t v8 = 0;
    do
    {
      collectionView = self->_collectionView;
      double v10 = [MEMORY[0x1E4F28D58] indexPathForRow:v8 inSection:0];
      double v11 = [(UICollectionView *)collectionView cellForItemAtIndexPath:v10];
      [v11 frame];
      double v13 = v7 + v12;

      double v7 = v5 + v13;
      ++v8;
    }
    while (v8 < [(NSArray *)self->_events count]);
  }
  -[EKExpandedReminderStackViewController setPreferredContentSize:](self, "setPreferredContentSize:", v3, v7);
  [(EKExpandedReminderStackViewController *)self preferredContentSize];
  double v15 = v14;
  double v17 = v16;
  id v18 = [(EKExpandedReminderStackViewController *)self navigationController];
  objc_msgSend(v18, "setPreferredContentSize:", v15, v17);
}

- (void)reminderToggled:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  double v4 = [(UICollectionView *)self->_collectionView indexPathForCell:a3];
  double v5 = [(EKExpandedReminderStackViewController *)self _eventAtIndexPath:v4];

  if (objc_msgSend(v5, "CUIK_reminderShouldBeEditable"))
  {
    id v6 = v5;
    objc_msgSend(v6, "setCompleted:", objc_msgSend(v6, "completed") ^ 1);
    double v7 = [(UIResponder *)self EKUI_editor];
    id v11 = 0;
    char v8 = [v7 saveEvent:v6 span:0 error:&v11];
    id v9 = v11;

    if ((v8 & 1) == 0)
    {
      double v10 = kEKUILogHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v13 = v9;
        _os_log_impl(&dword_1B3F4C000, v10, OS_LOG_TYPE_ERROR, "Couldn't complete/uncomplete event: %@", buf, 0xCu);
      }
    }
    [(EKExpandedReminderStackViewController *)self loadSnapshotWithAnimating:0 completion:0];
  }
}

- (BOOL)canManagePresentationStyle
{
  return 1;
}

- (BOOL)wantsManagement
{
  return 1;
}

- (void)dismissCurrentViewController
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  if ([(EKExpandedReminderStackViewController *)self isBeingPresented])
  {
    double v3 = dispatch_group_create();
    self->_presentingTransitionCancelled = 1;
    [(UICollectionView *)self->_collectionView setUserInteractionEnabled:0];
    dispatch_group_enter(v3);
    double v4 = (void *)MEMORY[0x1E4FB1EB0];
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __69__EKExpandedReminderStackViewController_dismissCurrentViewController__block_invoke;
    v48[3] = &unk_1E6087570;
    v48[4] = self;
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __69__EKExpandedReminderStackViewController_dismissCurrentViewController__block_invoke_2;
    v46[3] = &unk_1E6087520;
    double v5 = v3;
    v47 = v5;
    [v4 animateWithDuration:65540 delay:v48 options:v46 animations:0.2 completion:0.0];
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    uint64_t v26 = self;
    id v6 = [(UICollectionView *)self->_collectionView visibleCells];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v42 objects:v50 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v43 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v42 + 1) + 8 * i);
          id v12 = objc_alloc(MEMORY[0x1E4FB1ED8]);
          v41[0] = MEMORY[0x1E4F143A8];
          v41[1] = 3221225472;
          v41[2] = __69__EKExpandedReminderStackViewController_dismissCurrentViewController__block_invoke_3;
          v41[3] = &unk_1E6087570;
          v41[4] = v11;
          id v13 = (void *)[v12 initWithDuration:4 curve:v41 animations:0.2];
          dispatch_group_enter(v5);
          v39[0] = MEMORY[0x1E4F143A8];
          v39[1] = 3221225472;
          v39[2] = __69__EKExpandedReminderStackViewController_dismissCurrentViewController__block_invoke_4;
          v39[3] = &unk_1E6087D40;
          v40 = v5;
          [v13 addCompletion:v39];
          [v13 startAnimation];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v42 objects:v50 count:16];
      }
      while (v8);
    }

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v14 = [(UICollectionView *)v26->_collectionView visibleSupplementaryViewsOfKind:*MEMORY[0x1E4FB2770]];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v35 objects:v49 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v36;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v36 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v35 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            double v20 = [MEMORY[0x1E4FB1ED8] expandingStackedRemindersSpringAnimator];
            v34[0] = MEMORY[0x1E4F143A8];
            v34[1] = 3221225472;
            v34[2] = __69__EKExpandedReminderStackViewController_dismissCurrentViewController__block_invoke_5;
            v34[3] = &unk_1E6087570;
            v34[4] = v19;
            [v20 addAnimations:v34];
            dispatch_group_enter(v5);
            v32[0] = MEMORY[0x1E4F143A8];
            v32[1] = 3221225472;
            v32[2] = __69__EKExpandedReminderStackViewController_dismissCurrentViewController__block_invoke_6;
            v32[3] = &unk_1E6087D40;
            objc_super v33 = v5;
            [v20 addCompletion:v32];
            [v20 startAnimation];
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v35 objects:v49 count:16];
      }
      while (v16);
    }

    dispatch_group_enter(v5);
    collectionView = v26->_collectionView;
    double v22 = [EKExpandedReminderStackDismissingLayout alloc];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __69__EKExpandedReminderStackViewController_dismissCurrentViewController__block_invoke_7;
    v30[3] = &unk_1E6087570;
    double v31 = v5;
    long long v23 = v5;
    double v24 = [(EKExpandedReminderStackDismissingLayout *)v22 initWithDelegate:v26 completionHandler:v30];
    [(UICollectionView *)collectionView setCollectionViewLayout:v24 animated:1 completion:0];

    objc_initWeak(&location, v26);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__EKExpandedReminderStackViewController_dismissCurrentViewController__block_invoke_8;
    block[3] = &unk_1E6087918;
    objc_copyWeak(&v28, &location);
    dispatch_group_notify(v23, MEMORY[0x1E4F14428], block);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }
  else
  {
    double v25 = [(EKExpandedReminderStackViewController *)self transitioningDelegate];

    if (!v25) {
      [(EKExpandedReminderStackViewController *)self setModalTransitionStyle:2];
    }
    [(EKExpandedReminderStackViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

uint64_t __69__EKExpandedReminderStackViewController_dismissCurrentViewController__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1040) setAlpha:0.0];
}

void __69__EKExpandedReminderStackViewController_dismissCurrentViewController__block_invoke_2(uint64_t a1)
{
}

uint64_t __69__EKExpandedReminderStackViewController_dismissCurrentViewController__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setVisibleForExpandingAnimation:0];
}

void __69__EKExpandedReminderStackViewController_dismissCurrentViewController__block_invoke_4(uint64_t a1)
{
}

uint64_t __69__EKExpandedReminderStackViewController_dismissCurrentViewController__block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) setBlurFilterRadius:20.0];
}

void __69__EKExpandedReminderStackViewController_dismissCurrentViewController__block_invoke_6(uint64_t a1)
{
}

void __69__EKExpandedReminderStackViewController_dismissCurrentViewController__block_invoke_7(uint64_t a1)
{
}

void __69__EKExpandedReminderStackViewController_dismissCurrentViewController__block_invoke_8(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    double v3 = WeakRetained;
    [WeakRetained[127] completeTransition:0];
    id v2 = v3[127];
    v3[127] = 0;

    [v3 setOccurrenceViewOnCanvasHidden:0];
    id WeakRetained = v3;
  }
}

- (void)animateTransition:(id)a3
{
  uint64_t v135 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = [(EKExpandedReminderStackViewController *)self isBeingPresented];
  uint64_t v7 = (void *)MEMORY[0x1E4FB2770];
  id v95 = v5;
  v96 = self;
  if (!v6)
  {
    uint64_t v39 = [v5 viewControllerForKey:*MEMORY[0x1E4FB30B8]];
    v40 = [v39 view];

    v94 = v40;
    [v40 setAlpha:1.0];
    [(UICollectionView *)self->_collectionView setUserInteractionEnabled:0];
    v113[0] = MEMORY[0x1E4F143A8];
    v113[1] = 3221225472;
    v113[2] = __59__EKExpandedReminderStackViewController_animateTransition___block_invoke_5;
    v113[3] = &unk_1E6087570;
    v113[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:0x20000 delay:v113 options:0 animations:0.2 completion:0.0];
    long long v111 = 0u;
    long long v112 = 0u;
    long long v109 = 0u;
    long long v110 = 0u;
    uint64_t v41 = [(UICollectionView *)self->_collectionView visibleSupplementaryViewsOfKind:*v7];
    uint64_t v42 = [v41 countByEnumeratingWithState:&v109 objects:v132 count:16];
    if (v42)
    {
      uint64_t v43 = v42;
      uint64_t v44 = *(void *)v110;
      do
      {
        for (uint64_t i = 0; i != v43; ++i)
        {
          if (*(void *)v110 != v44) {
            objc_enumerationMutation(v41);
          }
          uint64_t v46 = *(void *)(*((void *)&v109 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v47 = [MEMORY[0x1E4FB1ED8] expandingStackedRemindersSpringAnimator];
            v108[0] = MEMORY[0x1E4F143A8];
            v108[1] = 3221225472;
            v108[2] = __59__EKExpandedReminderStackViewController_animateTransition___block_invoke_6;
            v108[3] = &unk_1E6087570;
            v108[4] = v46;
            [v47 addAnimations:v108];
            [v47 startAnimation];
          }
        }
        uint64_t v43 = [v41 countByEnumeratingWithState:&v109 objects:v132 count:16];
      }
      while (v43);
    }

    p_isa = (id *)&v96->super.super.super.isa;
    long long v38 = v5;
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_55;
    }
    delegate = v96->_delegate;
    v50 = [(NSArray *)v96->_events firstObject];
    uint64_t v51 = [(EKExpandedReminderStackViewControllerDelegate *)delegate occurrenceViewForEvent:v50];

    [v51 setHidden:0];
    v52 = [v51 snapshotViewAfterScreenUpdates:1];
    [v52 setHidden:0];
    [v51 setHidden:1];
    v92 = v52;
    v93 = v51;
    if (v51 && v52)
    {
      long long v106 = 0u;
      long long v107 = 0u;
      long long v104 = 0u;
      long long v105 = 0u;
      v53 = [(UICollectionView *)v96->_collectionView visibleCells];
      uint64_t v54 = [v53 countByEnumeratingWithState:&v104 objects:v129 count:16];
      if (v54)
      {
        uint64_t v55 = v54;
        uint64_t v56 = *(void *)v105;
        do
        {
          for (uint64_t j = 0; j != v55; ++j)
          {
            if (*(void *)v105 != v56) {
              objc_enumerationMutation(v53);
            }
            v58 = [*(id *)(*((void *)&v104 + 1) + 8 * j) backgroundImageView];
            [v58 setImage:0];
          }
          uint64_t v55 = [v53 countByEnumeratingWithState:&v104 objects:v129 count:16];
        }
        while (v55);
      }

      collectionView = v96->_collectionView;
      v60 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:0];
      v61 = [(UICollectionView *)collectionView cellForItemAtIndexPath:v60];
      v62 = [v61 backgroundImageView];

      [v62 addSubview:v52];
      [v52 setTranslatesAutoresizingMaskIntoConstraints:0];
      v87 = (void *)MEMORY[0x1E4F28DC8];
      v63 = [v52 leadingAnchor];
      v91 = [v62 leadingAnchor];
      v90 = [v63 constraintEqualToAnchor:v91];
      v128[0] = v90;
      v89 = [v52 topAnchor];
      v88 = [v62 topAnchor];
      v86 = [v89 constraintEqualToAnchor:v88];
      v128[1] = v86;
      v64 = [v52 trailingAnchor];
      v65 = [v62 trailingAnchor];
      v66 = [v64 constraintEqualToAnchor:v65];
      v128[2] = v66;
      v67 = [v52 bottomAnchor];
      v68 = [v62 bottomAnchor];
      v69 = [v67 constraintEqualToAnchor:v68];
      v128[3] = v69;
      v70 = [MEMORY[0x1E4F1C978] arrayWithObjects:v128 count:4];
      [v87 activateConstraints:v70];

      p_isa = (id *)&v96->super.super.super.isa;
      long long v38 = v95;

      goto LABEL_47;
    }
    v71 = (void *)kEKUILogHandle;
    BOOL v72 = os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR);
    if (v51)
    {
      if (v72)
      {
        events = v96->_events;
        v74 = v71;
        v75 = [(NSArray *)events firstObject];
        *(_DWORD *)buf = 138412290;
        v131 = v75;
        v76 = "Couldn't snapshot occurrence view for event: %@";
LABEL_46:
        _os_log_impl(&dword_1B3F4C000, v74, OS_LOG_TYPE_ERROR, v76, buf, 0xCu);
      }
    }
    else if (v72)
    {
      v77 = v96->_events;
      v74 = v71;
      v75 = [(NSArray *)v77 firstObject];
      *(_DWORD *)buf = 138412290;
      v131 = v75;
      v76 = "Couldn't find occurrence view for event: %@";
      goto LABEL_46;
    }
LABEL_47:
    long long v103 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    long long v100 = 0u;
    v78 = [p_isa[124] visibleCells];
    uint64_t v79 = [v78 countByEnumeratingWithState:&v100 objects:v127 count:16];
    if (v79)
    {
      uint64_t v80 = v79;
      uint64_t v81 = *(void *)v101;
      do
      {
        for (uint64_t k = 0; k != v80; ++k)
        {
          if (*(void *)v101 != v81) {
            objc_enumerationMutation(v78);
          }
          uint64_t v83 = *(void *)(*((void *)&v100 + 1) + 8 * k);
          id v84 = objc_alloc(MEMORY[0x1E4FB1ED8]);
          v99[0] = MEMORY[0x1E4F143A8];
          v99[1] = 3221225472;
          v99[2] = __59__EKExpandedReminderStackViewController_animateTransition___block_invoke_104;
          v99[3] = &unk_1E6087570;
          v99[4] = v83;
          v85 = (void *)[v84 initWithDuration:0 curve:v99 animations:0.2];
          [v85 startAnimation];
        }
        uint64_t v80 = [v78 countByEnumeratingWithState:&v100 objects:v127 count:16];
      }
      while (v80);
    }

LABEL_55:
    v97[0] = MEMORY[0x1E4F143A8];
    v97[1] = 3221225472;
    v97[2] = __59__EKExpandedReminderStackViewController_animateTransition___block_invoke_2_105;
    v97[3] = &unk_1E6087D68;
    v97[4] = p_isa;
    id v98 = v38;
    [p_isa clearSnapshotWithAnimating:1 completion:v97];

    goto LABEL_56;
  }
  uint64_t v8 = [v5 containerView];
  uint64_t v9 = [(EKExpandedReminderStackViewController *)self view];
  v94 = v8;
  [v8 addSubview:v9];

  objc_storeStrong((id *)&self->_transitionContext, a3);
  v125[0] = MEMORY[0x1E4F143A8];
  v125[1] = 3221225472;
  v125[2] = __59__EKExpandedReminderStackViewController_animateTransition___block_invoke;
  v125[3] = &unk_1E6087D68;
  v125[4] = self;
  id v126 = v5;
  [(EKExpandedReminderStackViewController *)self loadSnapshotWithAnimating:1 completion:v125];
  v124[0] = MEMORY[0x1E4F143A8];
  v124[1] = 3221225472;
  v124[2] = __59__EKExpandedReminderStackViewController_animateTransition___block_invoke_2;
  v124[3] = &unk_1E6087570;
  v124[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:0x20000 delay:v124 options:0 animations:0.5 completion:0.0];
  long long v122 = 0u;
  long long v123 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  double v10 = [(UICollectionView *)self->_collectionView visibleSupplementaryViewsOfKind:*MEMORY[0x1E4FB2770]];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v120 objects:v134 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v121;
    do
    {
      for (uint64_t m = 0; m != v12; ++m)
      {
        if (*(void *)v121 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v120 + 1) + 8 * m);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v15 setBlurFilterRadius:20.0];
          uint64_t v16 = [MEMORY[0x1E4FB1ED8] expandingStackedRemindersSpringAnimator];
          v119[0] = MEMORY[0x1E4F143A8];
          v119[1] = 3221225472;
          v119[2] = __59__EKExpandedReminderStackViewController_animateTransition___block_invoke_3;
          v119[3] = &unk_1E6087570;
          v119[4] = v15;
          [v16 addAnimations:v119];
          [v16 startAnimation];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v120 objects:v134 count:16];
    }
    while (v12);
  }

  uint64_t v17 = v96;
  if (objc_opt_respondsToSelector())
  {
    id v18 = v96->_delegate;
    uint64_t v19 = [(NSArray *)v96->_events firstObject];
    double v20 = [(EKExpandedReminderStackViewControllerDelegate *)v18 occurrenceViewForEvent:v19];

    [v20 bounds];
    v136.width = v21;
    v136.height = v22;
    UIGraphicsBeginImageContextWithOptions(v136, 0, 0.0);
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(CurrentContext);
    double v24 = [v20 layer];
    [v24 renderInContext:CurrentContext];

    CGContextRestoreGState(CurrentContext);
    double v25 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    uint64_t v26 = v96->_collectionView;
    double v27 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:0];
    id v28 = [(UICollectionView *)v26 cellForItemAtIndexPath:v27];
    double v29 = [v28 backgroundImageView];
    [v29 setImage:v25];

    long long v117 = 0u;
    long long v118 = 0u;
    long long v115 = 0u;
    long long v116 = 0u;
    double v30 = [(UICollectionView *)v96->_collectionView visibleCells];
    uint64_t v31 = [v30 countByEnumeratingWithState:&v115 objects:v133 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v116;
      do
      {
        for (uint64_t n = 0; n != v32; ++n)
        {
          if (*(void *)v116 != v33) {
            objc_enumerationMutation(v30);
          }
          long long v35 = *(void **)(*((void *)&v115 + 1) + 8 * n);
          [v35 setVisibleForExpandingAnimation:0];
          id v36 = objc_alloc(MEMORY[0x1E4FB1ED8]);
          v114[0] = MEMORY[0x1E4F143A8];
          v114[1] = 3221225472;
          v114[2] = __59__EKExpandedReminderStackViewController_animateTransition___block_invoke_4;
          v114[3] = &unk_1E6087570;
          v114[4] = v35;
          long long v37 = (void *)[v36 initWithDuration:0 curve:v114 animations:0.2];
          [v37 startAnimation];
        }
        uint64_t v32 = [v30 countByEnumeratingWithState:&v115 objects:v133 count:16];
      }
      while (v32);
    }

    uint64_t v17 = v96;
  }
  [(EKExpandedReminderStackViewController *)v17 setOccurrenceViewOnCanvasHidden:1];
  [(EKExpandedReminderStackViewController *)v17 setSelectedOccurrenceViewOnCanvasHidden:1];

  long long v38 = v95;
LABEL_56:
}

void __59__EKExpandedReminderStackViewController_animateTransition___block_invoke(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 1008))
  {
    [*(id *)(a1 + 40) completeTransition:1];
    uint64_t v2 = *(void *)(a1 + 32);
    double v3 = *(void **)(v2 + 1016);
    *(void *)(v2 + 1016) = 0;
  }
}

void __59__EKExpandedReminderStackViewController_animateTransition___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4FB14C8] effectWithStyle:6];
  [*(id *)(*(void *)(a1 + 32) + 1040) setEffect:v2];
}

uint64_t __59__EKExpandedReminderStackViewController_animateTransition___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setBlurFilterRadius:0.0];
}

uint64_t __59__EKExpandedReminderStackViewController_animateTransition___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setVisibleForExpandingAnimation:1];
}

uint64_t __59__EKExpandedReminderStackViewController_animateTransition___block_invoke_5(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1040) setAlpha:0.0];
}

uint64_t __59__EKExpandedReminderStackViewController_animateTransition___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) setBlurFilterRadius:20.0];
}

uint64_t __59__EKExpandedReminderStackViewController_animateTransition___block_invoke_104(uint64_t a1)
{
  return [*(id *)(a1 + 32) setVisibleForExpandingAnimation:0];
}

uint64_t __59__EKExpandedReminderStackViewController_animateTransition___block_invoke_2_105(uint64_t a1)
{
  [*(id *)(a1 + 32) setOccurrenceViewOnCanvasHidden:0];
  id v2 = *(void **)(a1 + 40);

  return [v2 completeTransition:1];
}

- (double)transitionDuration:(id)a3
{
  return 0.0;
}

- (void)setOccurrenceViewOnCanvasHidden:(BOOL)a3
{
  BOOL v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    delegate = self->_delegate;
    id v7 = [(NSArray *)self->_events firstObject];
    int v6 = [(EKExpandedReminderStackViewControllerDelegate *)delegate occurrenceViewForEvent:v7];
    [v6 setHidden:v3];
  }
}

- (void)setSelectedOccurrenceViewOnCanvasHidden:(BOOL)a3
{
  BOOL v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    delegate = self->_delegate;
    id v8 = [(NSArray *)self->_events firstObject];
    int v6 = [(EKExpandedReminderStackViewControllerDelegate *)delegate occurrenceViewForEvent:v8];
    id v7 = [v6 selectedCopy];
    [v7 setHidden:v3];
  }
}

- (BOOL)preferModalPresentation
{
  return self->_preferModalPresentation;
}

- (void)setPreferModalPresentation:(BOOL)a3
{
  self->_preferModalPresentatiouint64_t n = a3;
}

- (UIVisualEffectView)visualEffectView
{
  return self->_visualEffectView;
}

- (void)setVisualEffectView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_storeStrong((id *)&self->_reminderStore, 0);
  objc_storeStrong((id *)&self->_transitionContext, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_events, 0);

  objc_storeStrong((id *)&self->_delegate, 0);
}

@end