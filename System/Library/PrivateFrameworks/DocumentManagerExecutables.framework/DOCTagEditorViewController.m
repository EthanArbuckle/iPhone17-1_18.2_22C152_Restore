@interface DOCTagEditorViewController
- (BOOL)addTagTextField:(id)a3 userDidCreateTagWithName:(id)a4;
- (BOOL)addTagTextFieldShouldEndEditing:(id)a3;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)delayResizingUntilAppeared;
- (BOOL)inTagListMode;
- (BOOL)isAddingTag;
- (BOOL)isInfoInPopoverMode;
- (BOOL)useCompactColorPicker;
- (BOOL)userChangedTags;
- (DOCAddTagView)addTagTextFieldView;
- (DOCTagEditorDelegate)delegate;
- (DOCTagEditorTextFieldCell)addTagCell;
- (DOCTagEditorViewController)initWithCoder:(id)a3;
- (DOCTagEditorViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (NSArray)items;
- (NSLayoutConstraint)collectionViewHeightConstraint;
- (NSMutableOrderedSet)discoveredTags;
- (NSMutableSet)intersectionSelectedTags;
- (NSMutableSet)unionSelectedTags;
- (NSOrderedSet)userTags;
- (NSString)navigationTitleForTagListInInfoPanel;
- (NSString)navigationTitleForTagListOnly;
- (NSString)navigationTitleForTagMaker;
- (UIBarButtonItem)cancelButton;
- (UIBarButtonItem)doneButton;
- (UICollectionView)collectionView;
- (double)bottomEdgeSpacing;
- (double)maxListPresentationHeight;
- (double)topEdgeSpacing;
- (id)_panelAppearance;
- (id)_tagForIndexPath:(id)a3;
- (id)cellForIndexPath:(id)a3 dequeueCell:(id)a4;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)_updateMixedSelectionForCell:(id)a3;
- (void)_updateNavigationItem;
- (void)_updatePreferredContentSize:(BOOL)a3;
- (void)_updateSelection;
- (void)_updateSelectionForSection:(unint64_t)a3 withTags:(id)a4;
- (void)addTagTextFieldDidBeginEditing:(id)a3;
- (void)addTagTextFieldDidEndEditing:(id)a3;
- (void)cancelButtonTapped:(id)a3;
- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)dealloc;
- (void)deselectTag:(id)a3;
- (void)doc_commonInit;
- (void)doneButtonTapped:(id)a3;
- (void)loadView;
- (void)registerCells:(id)a3;
- (void)scheduleSetTagsOperationWithTag:(id)a3 adding:(BOOL)a4;
- (void)selectTag:(id)a3;
- (void)setAddTagCell:(id)a3;
- (void)setAddTagTextFieldView:(id)a3;
- (void)setAddingTag:(BOOL)a3;
- (void)setCancelButton:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setDelayResizingUntilAppeared:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDoneButton:(id)a3;
- (void)setInTagListMode:(BOOL)a3;
- (void)setIntersectionSelectedTags:(id)a3;
- (void)setIsInfoInPopoverMode:(BOOL)a3;
- (void)setItems:(id)a3;
- (void)setNavigationTitleForTagListInInfoPanel:(id)a3;
- (void)setNavigationTitleForTagListOnly:(id)a3;
- (void)setNavigationTitleForTagMaker:(id)a3;
- (void)setSelectedTags:(id)a3;
- (void)setTagsWithItems:(id)a3;
- (void)setUnionSelectedTags:(id)a3;
- (void)setUseCompactColorPicker:(BOOL)a3;
- (void)setUserChangedTags:(BOOL)a3;
- (void)tagRegistryDidUpdate;
- (void)updateDiscoveredTags;
- (void)updateSelectedTags;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation DOCTagEditorViewController

- (DOCTagEditorViewController)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DOCTagEditorViewController;
  v3 = [(DOCTagEditorViewController *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(DOCTagEditorViewController *)v3 doc_commonInit];
  }
  return v4;
}

- (DOCTagEditorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)DOCTagEditorViewController;
  v4 = [(DOCTagEditorViewController *)&v7 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4) {
    [(DOCTagEditorViewController *)v4 doc_commonInit];
  }
  return v5;
}

- (void)doc_commonInit
{
  self->_inTagListMode = 1;
}

- (void)registerCells:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v10 = [v4 objectForKeyedSubscript:v9];
        v11 = [(DOCTagEditorViewController *)self collectionView];
        [v11 registerClass:v10 forCellWithReuseIdentifier:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (void)loadView
{
  v22[3] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F82548]);
  id v4 = objc_alloc(MEMORY[0x263F82540]);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __38__DOCTagEditorViewController_loadView__block_invoke;
  v19[3] = &unk_2648FB4C8;
  v19[4] = self;
  uint64_t v5 = (void *)[v4 initWithSectionProvider:v19 configuration:v3];
  id v6 = objc_alloc(MEMORY[0x263F82528]);
  uint64_t v7 = (UICollectionView *)objc_msgSend(v6, "initWithFrame:collectionViewLayout:", v5, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  collectionView = self->_collectionView;
  self->_collectionView = v7;

  v21[0] = @"DOCTagEditorTextFieldCell";
  v22[0] = objc_opt_class();
  v21[1] = @"DOCTagEditorColorPickerCell";
  v22[1] = objc_opt_class();
  v21[2] = @"DOCTagEditorTagCell";
  v22[2] = objc_opt_class();
  uint64_t v9 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:3];
  [(DOCTagEditorViewController *)self registerCells:v9];

  uint64_t v10 = [(DOCTagEditorViewController *)self collectionView];
  [v10 setAllowsMultipleSelection:1];

  v11 = [MEMORY[0x263F825C8] systemBackgroundColor];
  long long v12 = [(DOCTagEditorViewController *)self collectionView];
  [v12 setBackgroundColor:v11];

  id v13 = objc_alloc(MEMORY[0x263F82BF8]);
  long long v14 = [(DOCTagEditorViewController *)self collectionView];
  v20 = v14;
  long long v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v20 count:1];
  v16 = (void *)[v13 initWithArrangedSubviews:v15];

  [v16 setAxis:1];
  uint64_t v17 = [MEMORY[0x263F3AB78] tagEditorContainer];
  [v16 setAccessibilityIdentifier:v17];

  [(DOCTagEditorViewController *)self setView:v16];
  v18 = [(DOCTagEditorViewController *)self collectionView];
  [(DOCTagEditorViewController *)self setContentScrollView:v18 forEdge:15];
}

id __38__DOCTagEditorViewController_loadView__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = (objc_class *)MEMORY[0x263F82510];
  id v6 = a3;
  uint64_t v7 = (void *)[[v5 alloc] initWithAppearance:4];
  [v7 setShowsSeparators:0];
  v8 = [MEMORY[0x263F82320] sectionWithListConfiguration:v7 layoutEnvironment:v6];

  double v9 = *(double *)(MEMORY[0x263F82250] + 8);
  double v10 = *(double *)(MEMORY[0x263F82250] + 16);
  double v11 = *(double *)(MEMORY[0x263F82250] + 24);
  if (a2)
  {
    if (a2 == 5) {
      [*(id *)(a1 + 32) bottomEdgeSpacing];
    }
    else {
      double v12 = *MEMORY[0x263F82250];
    }
  }
  else
  {
    [*(id *)(a1 + 32) topEdgeSpacing];
  }
  objc_msgSend(v8, "setContentInsets:", v12, v9, v10, v11);
  [v8 setInterGroupSpacing:0.0];

  return v8;
}

- (void)viewDidLoad
{
  v22[1] = *MEMORY[0x263EF8340];
  v21.receiver = self;
  v21.super_class = (Class)DOCTagEditorViewController;
  [(DOCTagEditorViewController *)&v21 viewDidLoad];
  id v3 = [(DOCTagEditorViewController *)self collectionView];
  [v3 setDelegate:self];

  id v4 = [(DOCTagEditorViewController *)self collectionView];
  [v4 setDataSource:self];

  uint64_t v5 = _DocumentManagerBundle();
  id v6 = [v5 localizedStringForKey:@"Tags [Navigation Bar]" value:@"Tags" table:@"Localizable"];
  [(DOCTagEditorViewController *)self setNavigationTitleForTagListOnly:v6];

  uint64_t v7 = _DocumentManagerBundle();
  v8 = [v7 localizedStringForKey:@"Add Tag [Navigation Bar]" value:@"Add Tag" table:@"Localizable"];
  [(DOCTagEditorViewController *)self setNavigationTitleForTagListInInfoPanel:v8];

  double v9 = _DocumentManagerBundle();
  double v10 = [v9 localizedStringForKey:@"Add Tag [Create Tag Navigation Bar]" value:@"Add Tag" table:@"Localizable"];
  [(DOCTagEditorViewController *)self setNavigationTitleForTagMaker:v10];

  double v11 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:0 target:self action:sel_doneButtonTapped_];
  [(DOCTagEditorViewController *)self setDoneButton:v11];

  double v12 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancelButtonTapped_];
  [(DOCTagEditorViewController *)self setCancelButton:v12];

  [(DOCTagEditorViewController *)self _updateSelection];
  [(DOCTagEditorViewController *)self _updateNavigationItem];
  id v13 = [(DOCTagEditorViewController *)self collectionView];
  long long v14 = [v13 heightAnchor];
  long long v15 = [v14 constraintEqualToConstant:0.0];
  DOCConstraintWithPriority();
  v16 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  collectionViewHeightConstraint = self->_collectionViewHeightConstraint;
  self->_collectionViewHeightConstraint = v16;

  v18 = (void *)MEMORY[0x263F08938];
  v22[0] = self->_collectionViewHeightConstraint;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:1];
  [v18 activateConstraints:v19];

  v20 = [MEMORY[0x263F08A00] defaultCenter];
  [v20 addObserver:self selector:sel_tagRegistryDidUpdate name:*MEMORY[0x263F3AB70] object:0];

  if ([(DOCTagEditorViewController *)self modalTransitionStyle] == 2) {
    [(DOCTagEditorViewController *)self _updatePreferredContentSize:1];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DOCTagEditorViewController;
  [(DOCTagEditorViewController *)&v4 viewWillAppear:a3];
  [(DOCTagEditorViewController *)self _updateNavigationItem];
  if (![(DOCTagEditorViewController *)self delayResizingUntilAppeared]) {
    [(DOCTagEditorViewController *)self _updatePreferredContentSize:1];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DOCTagEditorViewController;
  [(DOCTagEditorViewController *)&v5 viewWillDisappear:a3];
  if ([(DOCTagEditorViewController *)self userChangedTags])
  {
    objc_super v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 postNotificationName:@"DOCTagEditorTagsDidChangeNotification" object:self];

    [(DOCTagEditorViewController *)self scheduleSetTagsOperationWithTag:0 adding:1];
    [(DOCTagEditorViewController *)self setUserChangedTags:0];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(DOCTagEditorViewController *)self delayResizingUntilAppeared]) {
    [(DOCTagEditorViewController *)self _updatePreferredContentSize:0];
  }
  v5.receiver = self;
  v5.super_class = (Class)DOCTagEditorViewController;
  [(DOCTagEditorViewController *)&v5 viewDidAppear:v3];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)DOCTagEditorViewController;
  id v7 = a4;
  -[DOCTagEditorViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __81__DOCTagEditorViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_2648FB4F0;
  v8[4] = self;
  [v7 animateAlongsideTransition:0 completion:v8];
}

uint64_t __81__DOCTagEditorViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateNavigationItem];
}

- (void)dealloc
{
  BOOL v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)DOCTagEditorViewController;
  [(DOCTagEditorViewController *)&v4 dealloc];
}

- (NSOrderedSet)userTags
{
  userTags = self->_userTags;
  if (!userTags)
  {
    objc_super v4 = [MEMORY[0x263F3ABC8] sharedInstance];
    objc_super v5 = [v4 userTags];
    id v6 = (NSOrderedSet *)[v5 copy];
    id v7 = self->_userTags;
    self->_userTags = v6;

    userTags = self->_userTags;
  }

  return userTags;
}

- (void)tagRegistryDidUpdate
{
  userTags = self->_userTags;
  self->_userTags = 0;

  [(DOCTagEditorViewController *)self updateDiscoveredTags];
  id v5 = [MEMORY[0x263F089C8] indexSet];
  [v5 addIndex:3];
  [v5 addIndex:4];
  objc_super v4 = [(DOCTagEditorViewController *)self collectionView];
  [v4 reloadSections:v5];

  [(DOCTagEditorViewController *)self _updateSelection];
  [(DOCTagEditorViewController *)self _updatePreferredContentSize:0];
}

- (void)doneButtonTapped:(id)a3
{
  if ([(DOCTagEditorViewController *)self isAddingTag])
  {
    id v4 = [(DOCTagEditorViewController *)self addTagTextFieldView];
    [v4 commit];
  }
  else
  {
    [(DOCTagEditorViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)cancelButtonTapped:(id)a3
{
  id v3 = [(DOCTagEditorViewController *)self addTagTextFieldView];
  [v3 cancel];
}

- (id)_panelAppearance
{
  if ([(DOCTagEditorViewController *)self isAddingTag]) {
    +[DOCTagAppearance makerUI];
  }
  else {
  v2 = +[DOCTagAppearance pickerList];
  }
  id v3 = [v2 container];

  return v3;
}

- (double)topEdgeSpacing
{
  v2 = [(DOCTagEditorViewController *)self _panelAppearance];
  [v2 topMargin];
  double v4 = v3;

  return v4;
}

- (double)bottomEdgeSpacing
{
  v2 = [(DOCTagEditorViewController *)self _panelAppearance];
  [v2 bottomMargin];
  double v4 = v3;

  return v4;
}

- (void)updateDiscoveredTags
{
  v12[1] = *MEMORY[0x263EF8340];
  discoveredTags = self->_discoveredTags;
  if (!discoveredTags)
  {
    double v4 = [MEMORY[0x263EFF9B0] orderedSet];
    id v5 = self->_discoveredTags;
    self->_discoveredTags = v4;

    discoveredTags = self->_discoveredTags;
  }
  id v6 = [(DOCTagEditorViewController *)self unionSelectedTags];
  [(NSMutableOrderedSet *)discoveredTags unionSet:v6];

  id v7 = self->_discoveredTags;
  v8 = [(DOCTagEditorViewController *)self userTags];
  [(NSMutableOrderedSet *)v7 minusOrderedSet:v8];

  objc_super v9 = self->_discoveredTags;
  double v10 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"displayName" ascending:1 selector:sel_localizedStandardCompare_];
  v12[0] = v10;
  double v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  [(NSMutableOrderedSet *)v9 sortUsingDescriptors:v11];
}

- (void)_updatePreferredContentSize:(BOOL)a3
{
  BOOL v3 = a3;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__DOCTagEditorViewController__updatePreferredContentSize___block_invoke;
  aBlock[3] = &unk_2648FB518;
  aBlock[4] = self;
  id v5 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  id v6 = [(DOCTagEditorViewController *)self collectionView];
  id v7 = v6;
  if (v3)
  {
    [v6 setNeedsLayout];

    v8 = [(DOCTagEditorViewController *)self collectionView];
    [v8 layoutIfNeeded];

    v5[2](v5, 1);
  }
  else
  {
    [v6 performBatchUpdates:&__block_literal_global_1 completion:v5];
  }
}

void __58__DOCTagEditorViewController__updatePreferredContentSize___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) collectionView];
  BOOL v3 = [v2 collectionViewLayout];
  [v3 collectionViewContentSize];
  double v5 = v4;

  id v6 = [*(id *)(a1 + 32) collectionViewHeightConstraint];
  [v6 setConstant:v5];

  id v7 = [*(id *)(a1 + 32) navigationController];
  v8 = v7;
  if (!v7) {
    v8 = *(void **)(a1 + 32);
  }
  id v22 = v8;

  objc_super v9 = [*(id *)(a1 + 32) view];
  objc_msgSend(v9, "systemLayoutSizeFittingSize:", *MEMORY[0x263F83810], *(double *)(MEMORY[0x263F83810] + 8));
  double v11 = v10;

  double v12 = [*(id *)(a1 + 32) view];
  [v12 frame];
  double Width = CGRectGetWidth(v24);

  if ([*(id *)(a1 + 32) _isInPopoverPresentation])
  {
    long long v14 = [*(id *)(a1 + 32) _existingPresentationControllerImmediate:0 effective:0];
    long long v15 = [v14 presentedViewController];

    if (v15) {
      [v15 preferredContentSize];
    }
    else {
      double v16 = 0.0;
    }
    if (v16 != 0.0) {
      double Width = v16;
    }
  }
  if ([*(id *)(a1 + 32) modalTransitionStyle] == 2 && Width > 0.0 && v11 == 0.0)
  {
    uint64_t v17 = [*(id *)(a1 + 32) view];
    [v17 frame];
    double v11 = v18;

    if (v11 == 0.0)
    {
      id v19 = objc_alloc_init(MEMORY[0x263F82E10]);
      v20 = [v19 view];
      [v20 frame];
      double v11 = v21;

      if (v11 == 0.0) {
        double v11 = 1024.0;
      }
    }
  }
  objc_msgSend(v22, "setPreferredContentSize:", Width, v11);
}

- (void)_updateSelectionForSection:(unint64_t)a3 withTags:(id)a4
{
  id v15 = a4;
  uint64_t v6 = [v15 count];
  if (v6)
  {
    uint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
    {
      objc_super v9 = [v15 objectAtIndexedSubscript:i];
      double v10 = [MEMORY[0x263F088C8] indexPathForItem:i inSection:a3];
      double v11 = [(DOCTagEditorViewController *)self intersectionSelectedTags];
      int v12 = [v11 containsObject:v9];

      id v13 = [(DOCTagEditorViewController *)self collectionView];
      long long v14 = v13;
      if (v12) {
        [v13 selectItemAtIndexPath:v10 animated:0 scrollPosition:0];
      }
      else {
        [v13 deselectItemAtIndexPath:v10 animated:0];
      }
    }
  }
}

- (void)_updateMixedSelectionForCell:(id)a3
{
  id v7 = a3;
  double v4 = [v7 tagValue];
  double v5 = [(DOCTagEditorViewController *)self intersectionSelectedTags];
  if ([v5 containsObject:v4])
  {
    [v7 setMixedSelection:0];
  }
  else
  {
    uint64_t v6 = [(DOCTagEditorViewController *)self unionSelectedTags];
    objc_msgSend(v7, "setMixedSelection:", objc_msgSend(v6, "containsObject:", v4));
  }
}

- (void)_updateSelection
{
  BOOL v3 = [(DOCTagEditorViewController *)self collectionView];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __46__DOCTagEditorViewController__updateSelection__block_invoke_2;
  v4[3] = &unk_2648FB518;
  v4[4] = self;
  [v3 performBatchUpdates:&__block_literal_global_80 completion:v4];
}

void __46__DOCTagEditorViewController__updateSelection__block_invoke_2(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  BOOL v3 = [v2 userTags];
  [v2 _updateSelectionForSection:3 withTags:v3];

  double v4 = *(void **)(a1 + 32);
  double v5 = [v4 discoveredTags];
  [v4 _updateSelectionForSection:4 withTags:v5];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = objc_msgSend(*(id *)(a1 + 32), "collectionView", 0);
  id v7 = [v6 preparedCells];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [*(id *)(a1 + 32) _updateMixedSelectionForCell:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)_updateNavigationItem
{
  if ([(DOCTagEditorViewController *)self isAddingTag])
  {
    uint64_t v3 = [(DOCTagEditorViewController *)self navigationTitleForTagMaker];
  }
  else
  {
    if ([(DOCTagEditorViewController *)self inTagListMode]) {
      [(DOCTagEditorViewController *)self navigationTitleForTagListOnly];
    }
    else {
    uint64_t v3 = [(DOCTagEditorViewController *)self navigationTitleForTagListInInfoPanel];
    }
  }
  double v4 = (void *)v3;
  [(DOCTagEditorViewController *)self setTitle:v3];

  BOOL v5 = [(DOCTagEditorViewController *)self inTagListMode];
  uint64_t v6 = [(DOCTagEditorViewController *)self navigationItem];
  [v6 setHidesBackButton:v5];

  id v7 = _DocumentManagerBundle();
  uint64_t v8 = [v7 localizedStringForKey:@"Back" value:@"Back" table:@"Localizable"];
  uint64_t v9 = [(DOCTagEditorViewController *)self navigationItem];
  [v9 setBackButtonTitle:v8];

  if ([(DOCTagEditorViewController *)self isAddingTag])
  {
    uint64_t v10 = [(DOCTagEditorViewController *)self cancelButton];
    double v11 = [(DOCTagEditorViewController *)self navigationItem];
    [v11 setLeftBarButtonItem:v10];

    uint64_t v12 = [MEMORY[0x263F3ABC8] sharedInstance];
    long long v13 = [(DOCTagEditorViewController *)self addTagTextFieldView];
    long long v14 = [v13 text];
    uint64_t v15 = [v12 isValidNewTagName:v14];
    long long v16 = [(DOCTagEditorViewController *)self doneButton];
    [v16 setEnabled:v15];

    id v22 = [(DOCTagEditorViewController *)self doneButton];
    uint64_t v17 = [(DOCTagEditorViewController *)self navigationItem];
    [v17 setRightBarButtonItem:v22];
  }
  else
  {
    if ([(DOCTagEditorViewController *)self isInfoInPopoverMode]
      || ([(DOCTagEditorViewController *)self _isInPopoverPresentation] & 1) != 0)
    {
      int v18 = 0;
      id v19 = 0;
    }
    else
    {
      id v19 = [(DOCTagEditorViewController *)self doneButton];
      int v18 = 1;
    }
    v20 = [(DOCTagEditorViewController *)self navigationItem];
    [v20 setRightBarButtonItem:v19];

    if (v18) {
    double v21 = [(DOCTagEditorViewController *)self doneButton];
    }
    [v21 setEnabled:1];

    id v22 = [(DOCTagEditorViewController *)self navigationItem];
    [v22 setLeftBarButtonItem:0];
  }
}

- (void)setItems:(id)a3
{
  uint64_t v6 = (NSArray *)a3;
  if (self->_items != v6)
  {
    uint64_t v8 = v6;
    if (![(NSArray *)v6 count])
    {
      id v7 = [MEMORY[0x263F08690] currentHandler];
      [v7 handleFailureInMethod:a2 object:self file:@"DOCTagEditorViewController.m" lineNumber:419 description:@"Number of items must be greater than 0."];
    }
    objc_storeStrong((id *)&self->_items, a3);
    [(DOCTagEditorViewController *)self setUserChangedTags:0];
    [(DOCTagEditorViewController *)self setTagsWithItems:v8];
    uint64_t v6 = v8;
  }
}

- (void)setTagsWithItems:(id)a3
{
  double v4 = [(DOCTagEditorViewController *)self items];
  BOOL v5 = [v4 objectAtIndexedSubscript:0];
  uint64_t v6 = [v5 tags];
  DOCTagsFromFPTags();
  id v18 = (id)objc_claimAutoreleasedReturnValue();

  id v7 = [MEMORY[0x263EFF9C0] setWithArray:v18];
  uint64_t v8 = [MEMORY[0x263EFF9C0] setWithArray:v18];
  uint64_t v9 = [(DOCTagEditorViewController *)self items];
  unint64_t v10 = [v9 count];

  if (v10 >= 2)
  {
    for (uint64_t i = 1; i != v10; ++i)
    {
      uint64_t v12 = (void *)MEMORY[0x263EFFA08];
      long long v13 = [(DOCTagEditorViewController *)self items];
      long long v14 = [v13 objectAtIndexedSubscript:i];
      uint64_t v15 = [v14 tags];
      long long v16 = DOCTagsFromFPTags();
      uint64_t v17 = [v12 setWithArray:v16];

      [v7 intersectSet:v17];
      [v8 unionSet:v17];
    }
  }
  [(DOCTagEditorViewController *)self setIntersectionSelectedTags:v7];
  [(DOCTagEditorViewController *)self setUnionSelectedTags:v8];
  [(DOCTagEditorViewController *)self updateSelectedTags];
}

- (void)setSelectedTags:(id)a3
{
  double v4 = (void *)MEMORY[0x263EFF9C0];
  id v5 = a3;
  uint64_t v6 = [v4 setWithArray:v5];
  [(DOCTagEditorViewController *)self setIntersectionSelectedTags:v6];

  id v7 = [MEMORY[0x263EFF9C0] setWithArray:v5];

  [(DOCTagEditorViewController *)self setUnionSelectedTags:v7];

  [(DOCTagEditorViewController *)self updateSelectedTags];
}

- (void)updateSelectedTags
{
  [(DOCTagEditorViewController *)self updateDiscoveredTags];
  id v4 = [MEMORY[0x263F089C8] indexSet];
  [v4 addIndex:3];
  [v4 addIndex:4];
  uint64_t v3 = [(DOCTagEditorViewController *)self collectionView];
  [v3 reloadSections:v4];

  [(DOCTagEditorViewController *)self _updateSelection];
}

- (void)setAddingTag:(BOOL)a3
{
  if (self->_addingTag != a3)
  {
    self->_addingTag = a3;
    id v6 = [MEMORY[0x263F089C8] indexSet];
    [v6 addIndex:2];
    [v6 addIndex:3];
    [v6 addIndex:4];
    [v6 addIndex:5];
    id v4 = [(DOCTagEditorViewController *)self collectionView];
    [v4 reloadSections:v6];

    id v5 = [(DOCTagEditorViewController *)self addTagCell];
    [v5 updateHoverEffects];

    if (!self->_addingTag) {
      [(DOCTagEditorViewController *)self _updateSelection];
    }
    [(DOCTagEditorViewController *)self _updateNavigationItem];
    [(DOCTagEditorViewController *)self _updatePreferredContentSize:0];
  }
}

- (void)setIsInfoInPopoverMode:(BOOL)a3
{
  self->_isInfoInPopoverMode = a3;
  [(DOCTagEditorViewController *)self _updateNavigationItem];
}

- (double)maxListPresentationHeight
{
  v2 = +[DOCTagAppearance pickerList];
  uint64_t v3 = [v2 container];
  [v3 maxHeight];
  double v5 = v4;

  return v5;
}

- (void)scheduleSetTagsOperationWithTag:(id)a3 adding:(BOOL)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v5 = a3;
  items = self->_items;
  if (items)
  {
    v35 = v5;
    id v7 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSArray count](items, "count"));
    uint64_t v8 = (void *)MEMORY[0x263EFFA08];
    uint64_t v9 = [(DOCTagEditorViewController *)self intersectionSelectedTags];
    unint64_t v10 = [v9 allObjects];
    double v11 = FPTagsFromDOCTags();
    uint64_t v12 = [v8 setWithArray:v11];

    long long v13 = (void *)MEMORY[0x263EFFA08];
    long long v14 = [(DOCTagEditorViewController *)self unionSelectedTags];
    uint64_t v15 = [v14 allObjects];
    long long v16 = FPTagsFromDOCTags();
    uint64_t v17 = [v13 setWithArray:v16];

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    v34 = self;
    id v18 = self->_items;
    uint64_t v19 = [(NSArray *)v18 countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v40 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = (void *)MEMORY[0x263EFF9B0];
          CGRect v24 = [*(id *)(*((void *)&v39 + 1) + 8 * i) tags];
          v25 = [v23 orderedSetWithArray:v24];

          [v25 unionSet:v12];
          [v25 intersectSet:v17];
          v26 = [v25 array];
          [v7 addObject:v26];
        }
        uint64_t v20 = [(NSArray *)v18 countByEnumeratingWithState:&v39 objects:v43 count:16];
      }
      while (v20);
    }

    id v27 = objc_alloc(MEMORY[0x263F3ABB8]);
    v28 = v34->_items;
    v29 = [MEMORY[0x263F3ABD8] shared];
    v30 = (void *)[v27 initWithItems:v28 tagsLists:v7 isUndoable:1 shouldClearUndoStack:0 undoManager:v29];

    v31 = v34->_items;
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __69__DOCTagEditorViewController_scheduleSetTagsOperationWithTag_adding___block_invoke;
    v36[3] = &unk_2648FB540;
    id v5 = v35;
    id v37 = v35;
    v38 = v31;
    v32 = v31;
    [v30 setActionCompletionBlock:v36];
    v33 = [MEMORY[0x263F054C0] defaultManager];
    [v33 scheduleAction:v30];
  }
}

void __69__DOCTagEditorViewController_scheduleSetTagsOperationWithTag_adding___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = (NSObject **)MEMORY[0x263F3AC28];
  id v5 = *MEMORY[0x263F3AC28];
  if (v3)
  {
    if (!v5)
    {
      DOCInitLogging();
      id v5 = *v4;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __69__DOCTagEditorViewController_scheduleSetTagsOperationWithTag_adding___block_invoke_cold_2(a1, v5, (uint64_t)v3);
    }
  }
  else
  {
    if (!v5)
    {
      DOCInitLogging();
      id v5 = *v4;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __69__DOCTagEditorViewController_scheduleSetTagsOperationWithTag_adding___block_invoke_cold_1(a1, v5);
    }
  }
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  id v4 = a4;
  BOOL v5 = [v4 section] == 3 || objc_msgSend(v4, "section") == 4;

  return v5;
}

- (id)_tagForIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 section];
  if (v5 == 4)
  {
    id v6 = [(DOCTagEditorViewController *)self discoveredTags];
    goto LABEL_5;
  }
  if (v5 == 3)
  {
    id v6 = [(DOCTagEditorViewController *)self userTags];
LABEL_5:
    id v7 = v6;
    uint64_t v8 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v4, "item"));

    goto LABEL_7;
  }
  uint64_t v8 = 0;
LABEL_7:

  return v8;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v8 = a4;
  uint64_t v5 = -[DOCTagEditorViewController _tagForIndexPath:](self, "_tagForIndexPath:");
  if (v5)
  {
    id v6 = [(DOCTagEditorViewController *)self collectionView];
    id v7 = [v6 cellForItemAtIndexPath:v8];

    [v7 setMixedSelection:0];
    [(DOCTagEditorViewController *)self selectTag:v5];
  }
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  id v8 = a4;
  uint64_t v5 = -[DOCTagEditorViewController _tagForIndexPath:](self, "_tagForIndexPath:");
  if (v5)
  {
    id v6 = [(DOCTagEditorViewController *)self collectionView];
    id v7 = [v6 cellForItemAtIndexPath:v8];

    [v7 setMixedSelection:0];
    [(DOCTagEditorViewController *)self deselectTag:v5];
  }
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 6;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6 = a3;
  switch(a4)
  {
    case 1:
      int64_t v7 = 1;
      break;
    case 2:
      int64_t v7 = [(DOCTagEditorViewController *)self isAddingTag];
      break;
    case 3:
      if ([(DOCTagEditorViewController *)self isAddingTag]) {
        goto LABEL_6;
      }
      id v8 = [(DOCTagEditorViewController *)self userTags];
      goto LABEL_9;
    case 4:
      if ([(DOCTagEditorViewController *)self isAddingTag]) {
        goto LABEL_6;
      }
      id v8 = [(DOCTagEditorViewController *)self discoveredTags];
LABEL_9:
      uint64_t v9 = v8;
      int64_t v7 = [v8 count];

      break;
    default:
LABEL_6:
      int64_t v7 = 0;
      break;
  }

  return v7;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 3221225472;
  uint64_t v20 = __68__DOCTagEditorViewController_collectionView_cellForItemAtIndexPath___block_invoke;
  uint64_t v21 = &unk_2648FB568;
  id v22 = v6;
  id v8 = v7;
  id v23 = v8;
  id v9 = v6;
  unint64_t v10 = [(DOCTagEditorViewController *)self cellForIndexPath:v8 dequeueCell:&v18];
  if (objc_msgSend(v8, "section", v18, v19, v20, v21) == 1)
  {
    id v11 = v10;
    uint64_t v12 = [v11 addTagView];
    [v12 setDelegate:self];

    long long v13 = [v11 addTagView];
    [(DOCTagEditorViewController *)self setAddTagTextFieldView:v13];

    [(DOCTagEditorViewController *)self setAddTagCell:v11];
  }
  else
  {
    if ([v8 section] != 2) {
      goto LABEL_6;
    }
    id v14 = v10;
    id v11 = [(DOCTagEditorViewController *)self collectionView];
    uint64_t v15 = [v11 panGestureRecognizer];
    long long v16 = [v14 changeColorPanGestureRecognizer];

    [v15 requireGestureRecognizerToFail:v16];
  }

LABEL_6:

  return v10;
}

uint64_t __68__DOCTagEditorViewController_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) dequeueReusableCellWithReuseIdentifier:a2 forIndexPath:*(void *)(a1 + 40)];
}

- (id)cellForIndexPath:(id)a3 dequeueCell:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, __CFString *))a4;
  uint64_t v8 = [v6 section];
  if ((unint64_t)(v8 - 3) < 2)
  {
    id v9 = v7[2](v7, @"DOCTagEditorTagCell");
    unint64_t v10 = [(DOCTagEditorViewController *)self _tagForIndexPath:v6];
    [v9 setTagValue:v10];

    [(DOCTagEditorViewController *)self _updateMixedSelectionForCell:v9];
    goto LABEL_9;
  }
  if (v8 == 2)
  {
    v7[2](v7, @"DOCTagEditorColorPickerCell");
    goto LABEL_7;
  }
  if (v8 == 1)
  {
    v7[2](v7, @"DOCTagEditorTextFieldCell");
    id v9 = LABEL_7:;
    goto LABEL_9;
  }
  id v9 = 0;
LABEL_9:

  return v9;
}

- (void)addTagTextFieldDidBeginEditing:(id)a3
{
}

- (BOOL)addTagTextFieldShouldEndEditing:(id)a3
{
  if (![(DOCTagEditorViewController *)self isAddingTag]) {
    return 1;
  }
  id v4 = [(DOCTagEditorViewController *)self _existingPresentationControllerImmediate:0 effective:0];
  char v5 = [v4 dismissing];

  return v5 ^ 1;
}

- (void)addTagTextFieldDidEndEditing:(id)a3
{
  if ([(DOCTagEditorViewController *)self addTagTextFieldShouldEndEditing:a3])
  {
    [(DOCTagEditorViewController *)self setAddingTag:0];
  }
}

- (BOOL)addTagTextField:(id)a3 userDidCreateTagWithName:(id)a4
{
  id v5 = a4;
  id v6 = [MEMORY[0x263F3ABC8] sanitizedTagName:v5];
  if ([(DOCTagEditorViewController *)self isAddingTag] || !v6)
  {
    uint64_t v8 = [(DOCTagEditorViewController *)self collectionView];
    id v9 = [MEMORY[0x263F088C8] indexPathForRow:0 inSection:2];
    unint64_t v10 = [v8 cellForItemAtIndexPath:v9];

    id v11 = objc_msgSend(objc_alloc(MEMORY[0x263F3ABC0]), "initWithDisplayName:labelIndex:type:", v5, objc_msgSend(v10, "selectedColor"), 1);
    uint64_t v12 = [MEMORY[0x263F3ABC8] sharedInstance];
    int v7 = [v12 insertTag:v11 atIndex:0];

    if (v7)
    {
      long long v13 = [(DOCTagEditorViewController *)self delegate];
      [v13 tagEditor:self userDidCreateTag:v11];

      [(DOCTagEditorViewController *)self selectTag:v11];
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (void)selectTag:(id)a3
{
  id v4 = a3;
  id v5 = [(DOCTagEditorViewController *)self intersectionSelectedTags];
  [v5 addObject:v4];

  id v6 = [(DOCTagEditorViewController *)self unionSelectedTags];
  [v6 addObject:v4];

  [(DOCTagEditorViewController *)self setUserChangedTags:1];
  id v7 = [(DOCTagEditorViewController *)self delegate];
  [v7 tagEditor:self userDidSelectTag:v4];
}

- (void)deselectTag:(id)a3
{
  id v4 = a3;
  id v5 = [(DOCTagEditorViewController *)self intersectionSelectedTags];
  [v5 removeObject:v4];

  id v6 = [(DOCTagEditorViewController *)self unionSelectedTags];
  [v6 removeObject:v4];

  [(DOCTagEditorViewController *)self setUserChangedTags:1];
  id v7 = [(DOCTagEditorViewController *)self delegate];
  [v7 tagEditor:self userDidDeselectTag:v4];
}

- (BOOL)useCompactColorPicker
{
  return self->_useCompactColorPicker;
}

- (void)setUseCompactColorPicker:(BOOL)a3
{
  self->_useCompactColorPicker = a3;
}

- (BOOL)delayResizingUntilAppeared
{
  return self->_delayResizingUntilAppeared;
}

- (void)setDelayResizingUntilAppeared:(BOOL)a3
{
  self->_delayResizingUntilAppeared = a3;
}

- (DOCTagEditorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (DOCTagEditorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)items
{
  return self->_items;
}

- (BOOL)isInfoInPopoverMode
{
  return self->_isInfoInPopoverMode;
}

- (BOOL)inTagListMode
{
  return self->_inTagListMode;
}

- (void)setInTagListMode:(BOOL)a3
{
  self->_inTagListMode = a3;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (DOCAddTagView)addTagTextFieldView
{
  return self->_addTagTextFieldView;
}

- (void)setAddTagTextFieldView:(id)a3
{
}

- (DOCTagEditorTextFieldCell)addTagCell
{
  return self->_addTagCell;
}

- (void)setAddTagCell:(id)a3
{
}

- (NSLayoutConstraint)collectionViewHeightConstraint
{
  return self->_collectionViewHeightConstraint;
}

- (BOOL)isAddingTag
{
  return self->_addingTag;
}

- (NSMutableOrderedSet)discoveredTags
{
  return self->_discoveredTags;
}

- (NSMutableSet)intersectionSelectedTags
{
  return self->_intersectionSelectedTags;
}

- (void)setIntersectionSelectedTags:(id)a3
{
}

- (NSMutableSet)unionSelectedTags
{
  return self->_unionSelectedTags;
}

- (void)setUnionSelectedTags:(id)a3
{
}

- (BOOL)userChangedTags
{
  return self->_userChangedTags;
}

- (void)setUserChangedTags:(BOOL)a3
{
  self->_userChangedTags = a3;
}

- (NSString)navigationTitleForTagListOnly
{
  return self->_navigationTitleForTagListOnly;
}

- (void)setNavigationTitleForTagListOnly:(id)a3
{
}

- (NSString)navigationTitleForTagListInInfoPanel
{
  return self->_navigationTitleForTagListInInfoPanel;
}

- (void)setNavigationTitleForTagListInInfoPanel:(id)a3
{
}

- (NSString)navigationTitleForTagMaker
{
  return self->_navigationTitleForTagMaker;
}

- (void)setNavigationTitleForTagMaker:(id)a3
{
}

- (UIBarButtonItem)doneButton
{
  return self->_doneButton;
}

- (void)setDoneButton:(id)a3
{
}

- (UIBarButtonItem)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_navigationTitleForTagMaker, 0);
  objc_storeStrong((id *)&self->_navigationTitleForTagListInInfoPanel, 0);
  objc_storeStrong((id *)&self->_navigationTitleForTagListOnly, 0);
  objc_storeStrong((id *)&self->_unionSelectedTags, 0);
  objc_storeStrong((id *)&self->_intersectionSelectedTags, 0);
  objc_storeStrong((id *)&self->_discoveredTags, 0);
  objc_storeStrong((id *)&self->_collectionViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_addTagCell, 0);
  objc_storeStrong((id *)&self->_addTagTextFieldView, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_userTags, 0);
  objc_storeStrong((id *)&self->_items, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

void __69__DOCTagEditorViewController_scheduleSetTagsOperationWithTag_adding___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 displayName];
  OUTLINED_FUNCTION_0_0();
  _os_log_debug_impl(&dword_22BDC5000, v3, OS_LOG_TYPE_DEBUG, "User did add tag %@ to items: %@", v5, 0x16u);
}

void __69__DOCTagEditorViewController_scheduleSetTagsOperationWithTag_adding___block_invoke_cold_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  uint64_t v6 = [v4 displayName];
  OUTLINED_FUNCTION_0_0();
  __int16 v9 = v7;
  uint64_t v10 = a3;
  _os_log_error_impl(&dword_22BDC5000, v5, OS_LOG_TYPE_ERROR, "Failed to add tag %@ on items: %@. Error: %@", v8, 0x20u);
}

@end