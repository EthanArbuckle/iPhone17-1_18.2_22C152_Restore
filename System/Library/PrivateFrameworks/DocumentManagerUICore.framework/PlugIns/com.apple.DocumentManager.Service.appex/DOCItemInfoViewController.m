@interface DOCItemInfoViewController
+ (CGSize)ensureNonZeroPreferredSize:(CGSize)a3 traits:(id)a4;
- (BOOL)isInfoInPopoverMode;
- (BOOL)needsInitialPreferredContentSize;
- (BOOL)viewDidAppear;
- (DOCItemInfoViewController)initWithNodes:(id)a3 configuration:(id)a4 actionReporting:(id)a5;
- (NSArray)nodes;
- (_TtC33com_apple_DocumentManager_Service32DOCItemInfoContentViewController)contentViewController;
- (id)items;
- (void)_updateNavigationBarVisibilityAnimated:(BOOL)a3;
- (void)_updatePreferredContentSizeForFirstAppearance;
- (void)displayAddTagsViewWithItems:(id)a3;
- (void)displayTagView;
- (void)doc_startPreheatIfNecessary;
- (void)forceUpdatePreferredContentSize;
- (void)setContentViewController:(id)a3;
- (void)setIsInfoInPopoverMode:(BOOL)a3;
- (void)setNeedsInitialPreferredContentSize:(BOOL)a3;
- (void)setViewDidAppear:(BOOL)a3;
- (void)systemLayoutFittingSizeDidChangeForChildContentContainer:(id)a3;
- (void)tagsCollectionItem:(id)a3 didDeleteTag:(id)a4;
- (void)tagsCollectionView:(id)a3 didSelectAddTagButton:(id)a4;
- (void)updatePreferredContentSize;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation DOCItemInfoViewController

- (DOCItemInfoViewController)initWithNodes:(id)a3 configuration:(id)a4 actionReporting:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v24.receiver = self;
  v24.super_class = (Class)DOCItemInfoViewController;
  v12 = [(DOCItemInfoViewController *)&v24 initWithNibName:0 bundle:0];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_nodes, a3);
    if ([v9 count] == (id)1)
    {
      v14 = [v9 firstObject];
      if (v14
        && +[DOCItemInfoContentViewController itemTapDrillsIntoNode:v14])
      {
        uint64_t v15 = [v11 isBrowserCurrentLocation:v14] ^ 1;
LABEL_8:
        objc_storeWeak((id *)&v13->_actionReporting, v11);
        v16 = [[_TtC33com_apple_DocumentManager_Service32DOCItemInfoContentViewController alloc] initWithConfiguration:v10 nodes:v9 allowOpenButton:v15 documentManager:0 actionManager:0 actionDelegate:0];
        contentViewController = v13->_contentViewController;
        v13->_contentViewController = v16;

        id WeakRetained = objc_loadWeakRetained((id *)&v13->_actionReporting);
        [(DOCItemInfoContentViewController *)v13->_contentViewController setActionReporting:WeakRetained];

        [(DOCItemInfoContentViewController *)v13->_contentViewController setShowsShareButton:0];
        v19 = [(DOCItemInfoContentViewController *)v13->_contentViewController scrollView];
        [v19 setShowsVerticalScrollIndicator:0];

        [(DOCItemInfoContentViewController *)v13->_contentViewController layoutMargins];
        [(DOCItemInfoContentViewController *)v13->_contentViewController setLayoutMargins:"setLayoutMargins:"];
        v20 = [(DOCItemInfoContentViewController *)v13->_contentViewController view];
        [v20 setTranslatesAutoresizingMaskIntoConstraints:0];

        v21 = _DocumentManagerBundle();
        v22 = [v21 localizedStringForKey:@"Info [View Controller Title]" value:@"Info" table:@"Localizable"];
        [(DOCItemInfoViewController *)v13 setTitle:v22];

        goto LABEL_9;
      }
    }
    else
    {
      v14 = 0;
    }
    uint64_t v15 = 1;
    goto LABEL_8;
  }
LABEL_9:

  return v13;
}

- (NSArray)nodes
{
  return self->_nodes;
}

- (void)viewDidLoad
{
  v40.receiver = self;
  v40.super_class = (Class)DOCItemInfoViewController;
  [(DOCItemInfoViewController *)&v40 viewDidLoad];
  self->_needsInitialPreferredContentSize = 1;
  self->_viewDidAppear = 0;
  v3 = [(DOCItemInfoViewController *)self contentViewController];
  [v3 setTagsWorkflowDelegate:self];

  v4 = [(DOCItemInfoViewController *)self contentViewController];
  v5 = [v4 view];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  v6 = [(DOCItemInfoViewController *)self contentViewController];
  [(DOCItemInfoViewController *)self addChildViewController:v6];

  v7 = [(DOCItemInfoViewController *)self view];
  v8 = [(DOCItemInfoViewController *)self contentViewController];
  id v9 = [v8 view];
  [v7 addSubview:v9];

  id v10 = [(DOCItemInfoViewController *)self view];
  id v11 = [v10 layoutMarginsGuide];
  v39 = [v11 topAnchor];

  v38 = [(DOCItemInfoViewController *)self contentViewController];
  v37 = [v38 view];
  v36 = [v37 topAnchor];
  v35 = [v36 constraintEqualToAnchor:v39];
  v41[0] = v35;
  v34 = [(DOCItemInfoViewController *)self contentViewController];
  v33 = [v34 view];
  v31 = [v33 bottomAnchor];
  v32 = [(DOCItemInfoViewController *)self view];
  v30 = [v32 layoutMarginsGuide];
  v29 = [v30 bottomAnchor];
  v28 = [v31 constraintEqualToAnchor:v29];
  v41[1] = v28;
  v27 = [(DOCItemInfoViewController *)self contentViewController];
  v26 = [v27 view];
  v23 = [v26 leftAnchor];
  v25 = [(DOCItemInfoViewController *)self view];
  v22 = [v25 layoutMarginsGuide];
  v12 = [v22 leftAnchor];
  v13 = [v23 constraintEqualToAnchor:v12];
  v41[2] = v13;
  v14 = [(DOCItemInfoViewController *)self contentViewController];
  uint64_t v15 = [v14 view];
  v16 = [v15 rightAnchor];
  v17 = [(DOCItemInfoViewController *)self view];
  v18 = [v17 layoutMarginsGuide];
  v19 = [v18 rightAnchor];
  v20 = [v16 constraintEqualToAnchor:v19];
  v41[3] = v20;
  objc_super v24 = +[NSArray arrayWithObjects:v41 count:4];

  +[NSLayoutConstraint activateConstraints:v24];
  v21 = [(DOCItemInfoViewController *)self contentViewController];
  [v21 didMoveToParentViewController:self];
}

- (void)_updatePreferredContentSizeForFirstAppearance
{
  v3 = [(DOCItemInfoViewController *)self view];
  [v3 layoutIfNeeded];

  [(DOCItemInfoViewController *)self updatePreferredContentSize];
  self->_needsInitialPreferredContentSize = 0;
}

- (void)systemLayoutFittingSizeDidChangeForChildContentContainer:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)DOCItemInfoViewController;
  [(DOCItemInfoViewController *)&v7 systemLayoutFittingSizeDidChangeForChildContentContainer:a3];
  v4 = [(DOCItemInfoViewController *)self view];
  v5 = [v4 window];
  if (v5)
  {
    BOOL viewDidAppear = self->_viewDidAppear;

    if (viewDidAppear) {
      [(DOCItemInfoViewController *)self updatePreferredContentSize];
    }
  }
  else
  {
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)DOCItemInfoViewController;
  -[DOCItemInfoViewController viewWillTransitionToSize:withTransitionCoordinator:](&v7, "viewWillTransitionToSize:withTransitionCoordinator:", a4, a3.width, a3.height);
  v5 = [(DOCItemInfoViewController *)self view];
  v6 = [v5 window];

  if (v6) {
    [(DOCItemInfoViewController *)self updatePreferredContentSize];
  }
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  if (a3 && self->_needsInitialPreferredContentSize) {
    [(DOCItemInfoViewController *)self _updatePreferredContentSizeForFirstAppearance];
  }
  -[DOCItemInfoViewController _updateNavigationBarVisibilityAnimated:](self, "_updateNavigationBarVisibilityAnimated:", 0, a4);
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  self->_BOOL viewDidAppear = 1;
  [(DOCItemInfoViewController *)self updatePreferredContentSize];
  v5.receiver = self;
  v5.super_class = (Class)DOCItemInfoViewController;
  [(DOCItemInfoViewController *)&v5 viewDidAppear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  self->_BOOL viewDidAppear = 0;
  v3.receiver = self;
  v3.super_class = (Class)DOCItemInfoViewController;
  [(DOCItemInfoViewController *)&v3 viewWillDisappear:a3];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)DOCItemInfoViewController;
  [(DOCItemInfoViewController *)&v3 viewDidLayoutSubviews];
  if (self->_viewDidAppear) {
    [(DOCItemInfoViewController *)self updatePreferredContentSize];
  }
}

- (void)updatePreferredContentSize
{
  objc_super v3 = [(DOCItemInfoViewController *)self view];
  v4 = [v3 window];

  if (v4)
  {
    [(DOCItemInfoViewController *)self forceUpdatePreferredContentSize];
  }
}

- (void)forceUpdatePreferredContentSize
{
  self->_needsInitialPreferredContentSize = 0;
  [(DOCItemInfoViewController *)self preferredContentSize];
  double v4 = v3;
  if (v3 == 0.0)
  {
    objc_super v5 = [(DOCItemInfoViewController *)self navigationController];

    if (v5)
    {
      v6 = [(DOCItemInfoViewController *)self traitCollection];
      objc_super v7 = [(DOCItemInfoViewController *)self navigationController];
      [v7 preferredContentSize];
      double v9 = v8;
      double v11 = v10;

      +[DOCItemInfoViewController ensureNonZeroPreferredSize:traits:](DOCItemInfoViewController, "ensureNonZeroPreferredSize:traits:", v6, v9, v11);
      double v4 = v12;
    }
  }
  [(DOCItemInfoContentViewController *)self->_contentViewController layoutHeightForWidth:v4];
  double v14 = v13;
  uint64_t v15 = [(DOCItemInfoViewController *)self presentationController];
  v16 = [v15 presentedViewController];

  if (v16 == self)
  {
    v17 = [(DOCItemInfoViewController *)self navigationController];
  }
  else
  {
    v17 = self;
  }
  v20 = v17;
  [(DOCItemInfoViewController *)v17 preferredContentSize];
  if (v19 != v4 || v18 != v14) {
    -[DOCItemInfoViewController setPreferredContentSize:](v20, "setPreferredContentSize:", v4, v14);
  }
}

- (void)_updateNavigationBarVisibilityAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(DOCItemInfoViewController *)self navigationController];
  id v8 = [v5 topViewController];

  if ([(DOCItemInfoViewController *)self isInfoInPopoverMode])
  {
    objc_opt_class();
    char v6 = objc_opt_isKindOfClass() ^ 1;
  }
  else
  {
    char v6 = 0;
  }
  objc_super v7 = [(DOCItemInfoViewController *)self navigationController];
  [v7 setNavigationBarHidden:v6 & 1 animated:v3];
}

- (void)setIsInfoInPopoverMode:(BOOL)a3
{
  BOOL v3 = a3;
  self->_isInfoInPopoverMode = a3;
  [(DOCItemInfoViewController *)self _updateNavigationBarVisibilityAnimated:0];
  objc_super v5 = [(DOCItemInfoViewController *)self navigationController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v8 = [(DOCItemInfoViewController *)self navigationController];
    objc_super v7 = [v8 topViewController];
    [v7 setIsInfoInPopoverMode:v3];
  }
}

- (id)items
{
  return [(NSArray *)self->_nodes fpfs_syncFPItemsFromNodes];
}

- (void)tagsCollectionView:(id)a3 didSelectAddTagButton:(id)a4
{
  id v5 = [(DOCItemInfoViewController *)self items];
  [(DOCItemInfoViewController *)self displayAddTagsViewWithItems:v5];
}

- (void)displayTagView
{
  id v11 = objc_alloc_init((Class)DOCTagEditorViewController);
  [v11 setUseCompactColorPicker:1];
  [v11 setDelayResizingUntilAppeared:0];
  BOOL v3 = [(DOCItemInfoViewController *)self items];
  [v11 setItems:v3];

  objc_msgSend(v11, "setIsInfoInPopoverMode:", -[DOCItemInfoViewController isInfoInPopoverMode](self, "isInfoInPopoverMode"));
  [v11 setInTagListMode:1];
  [v11 maxListPresentationHeight];
  double v5 = v4;
  char v6 = [v11 view];
  objc_super v7 = [v6 heightAnchor];
  id v8 = [v7 constraintLessThanOrEqualToConstant:v5];

  LODWORD(v9) = 1148829696;
  [v8 setPriority:v9];
  [v8 setActive:1];
  double v10 = [(DOCItemInfoViewController *)self navigationController];
  [v10 pushViewController:v11 animated:0];

  [(DOCItemInfoViewController *)self _updateNavigationBarVisibilityAnimated:1];
}

- (void)displayAddTagsViewWithItems:(id)a3
{
  id v4 = a3;
  id v12 = objc_alloc_init((Class)DOCTagEditorViewController);
  [v12 setUseCompactColorPicker:1];
  [v12 setDelayResizingUntilAppeared:1];
  [v12 setItems:v4];

  objc_msgSend(v12, "setIsInfoInPopoverMode:", -[DOCItemInfoViewController isInfoInPopoverMode](self, "isInfoInPopoverMode"));
  [v12 setInTagListMode:0];
  [v12 maxListPresentationHeight];
  double v6 = v5;
  objc_super v7 = [v12 view];
  id v8 = [v7 heightAnchor];
  double v9 = [v8 constraintLessThanOrEqualToConstant:v6];

  LODWORD(v10) = 1148829696;
  [v9 setPriority:v10];
  [v9 setActive:1];
  id v11 = [(DOCItemInfoViewController *)self navigationController];
  [v11 pushViewController:v12 animated:1];

  [(DOCItemInfoViewController *)self _updateNavigationBarVisibilityAnimated:1];
}

- (void)tagsCollectionItem:(id)a3 didDeleteTag:(id)a4
{
  id v5 = a4;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = [(DOCItemInfoViewController *)self items];
  id v6 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v20 = *(void *)v25;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v25 != v20) {
          objc_enumerationMutation(obj);
        }
        double v9 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        double v10 = [v9 tags];
        id v11 = [v10 mutableCopy];

        id v12 = FPTagFromDOCTag();
        [v11 removeObject:v12];

        id v13 = objc_alloc((Class)DOCSetTagsOperation);
        v29 = v9;
        double v14 = +[NSArray arrayWithObjects:&v29 count:1];
        id v28 = v11;
        uint64_t v15 = +[NSArray arrayWithObjects:&v28 count:1];
        v16 = +[DOCUndoManager shared];
        id v17 = [v13 initWithItems:v14 tagsLists:v15 isUndoable:1 shouldClearUndoStack:0 undoManager:v16];

        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_10001C9D8;
        v21[3] = &unk_1005B7BC0;
        id v22 = v5;
        v23 = v9;
        [v17 setActionCompletionBlock:v21];
        double v18 = +[FPItemManager defaultManager];
        [v18 scheduleAction:v17];
      }
      id v7 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v7);
  }
}

- (BOOL)isInfoInPopoverMode
{
  return self->_isInfoInPopoverMode;
}

- (BOOL)needsInitialPreferredContentSize
{
  return self->_needsInitialPreferredContentSize;
}

- (void)setNeedsInitialPreferredContentSize:(BOOL)a3
{
  self->_needsInitialPreferredContentSize = a3;
}

- (BOOL)viewDidAppear
{
  return self->_viewDidAppear;
}

- (void)setViewDidAppear:(BOOL)a3
{
  self->_BOOL viewDidAppear = a3;
}

- (_TtC33com_apple_DocumentManager_Service32DOCItemInfoContentViewController)contentViewController
{
  return self->_contentViewController;
}

- (void)setContentViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_destroyWeak((id *)&self->_actionReporting);
  objc_storeStrong((id *)&self->_nodes, 0);
}

- (void)doc_startPreheatIfNecessary
{
  contentViewController = self->_contentViewController;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10001CBD8;
  v3[3] = &unk_1005B7570;
  v3[4] = self;
  [(DOCItemInfoContentViewController *)contentViewController objc_doc_preheatForPresentingWithCompletion:v3];
}

+ (CGSize)ensureNonZeroPreferredSize:(CGSize)a3 traits:(id)a4
{
  id v4 = a4;
  sub_1004C8E58();
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

@end