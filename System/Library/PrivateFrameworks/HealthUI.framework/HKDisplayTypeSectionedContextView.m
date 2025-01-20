@interface HKDisplayTypeSectionedContextView
- (BOOL)_appendHeaderForSectionIndex:(int64_t)a3;
- (BOOL)_isHorizontalInTwoOverlaysMode;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)useBottomInsets;
- (BOOL)useHorizontalInsets;
- (BOOL)useTopInsetsWithNoHeader;
- (CGSize)intrinsicContentSize;
- (HKDisplayTypeContextItem)sizingItem;
- (HKDisplayTypeContextVerticalCollectionViewCell)sizingCell;
- (HKDisplayTypeSectionedContextView)initWithStyle:(int64_t)a3;
- (HKDisplayTypeSectionedContextViewDelegate)delegate;
- (NSArray)displayTypeContextSections;
- (NSDirectionalEdgeInsets)_contentItemInsetsWithTopInsets:(BOOL)a3 BottomInsets:(BOOL)a4 horizontalInsets:(BOOL)a5;
- (NSMutableDictionary)collectionViewLayoutCache;
- (double)_cellSizingWidth;
- (double)_collectionViewLineSpacing;
- (double)_contentHeight;
- (double)_contentWidth;
- (double)_estimateCellHeightForCell:(id)a3;
- (double)_estimatedDynamicCellHeight;
- (double)_interItemSpacing;
- (double)_maximumHeaderLabelLength;
- (double)_preferredCollectionViewHeightForCount:(int64_t)a3;
- (double)contentViewTopInset;
- (double)sizingCellEstimatedHeight;
- (id)_buildCollectionViewLayoutWithBottomInsets:(BOOL)a3 horizontalInsets:(BOOL)a4 topInsetsWithNoHeader:(BOOL)a5;
- (id)_collectionViewLayoutForHorizontalTwoOverlaysWithConfig:(id)a3;
- (id)_collectionViewLayoutWithLayoutGroup:(id)a3 bottomInsets:(BOOL)a4 horizontalInsets:(BOOL)a5 topInsetsWithNoHeader:(BOOL)a6;
- (id)_currentConfigurationWithBottomInsets:(BOOL)a3 horizontalInsets:(BOOL)a4 topInsetsWithNoHeader:(BOOL)a5;
- (id)_defaultCollectionViewLayoutWithConfiguration:(id)a3;
- (id)_makeDummySizingItem;
- (id)_makeSizingItemWithItem:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)createCellWithItem:(id)a3;
- (int64_t)_rowsForScreenSize;
- (int64_t)_widthDesignationFromTraitCollection:(id)a3;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)_handleSelection:(id)a3 indexPath:(id)a4 informDelegate:(BOOL)a5;
- (void)_reconfigureCollectionViewLayoutAndInsetsIfNecessary;
- (void)_registerForTraitChange;
- (void)_reloadCollectionViewWithSelectedItems;
- (void)_updateSelfSizingHeightConstraintIfNecessary;
- (void)_updateSizingCellEstimatedHeightIfNecessary;
- (void)_updateSizingCellWithContextItemSections:(id)a3;
- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)deselectAllItemsAnimated:(BOOL)a3;
- (void)didTapOnInfoButtonForCollectionViewCell:(id)a3;
- (void)layoutSubviews;
- (void)scrollToTop;
- (void)selectItemAtIndexPath:(id)a3 animated:(BOOL)a4 scrollPosition:(unint64_t)a5;
- (void)setCollectionViewLayoutCache:(id)a3;
- (void)setContentViewTopInset:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayTypeContextSections:(id)a3;
- (void)setSemanticContentAttribute:(int64_t)a3;
- (void)setSizingCell:(id)a3;
- (void)setSizingCellEstimatedHeight:(double)a3;
- (void)setSizingItem:(id)a3;
- (void)setUseBottomInsets:(BOOL)a3;
- (void)setUseHorizontalInsets:(BOOL)a3;
- (void)setUseTopInsetsWithNoHeader:(BOOL)a3;
- (void)updateConstraints;
@end

@implementation HKDisplayTypeSectionedContextView

- (HKDisplayTypeSectionedContextView)initWithStyle:(int64_t)a3
{
  v51[4] = *MEMORY[0x1E4F143B8];
  v50.receiver = self;
  v50.super_class = (Class)HKDisplayTypeSectionedContextView;
  double v4 = *MEMORY[0x1E4F1DB28];
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v8 = -[HKDisplayTypeSectionedContextView initWithFrame:](&v50, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v5, v6, v7);
  v9 = v8;
  if (v8)
  {
    v8->_style = a3;
    int64_t v10 = a3;
    int64_t v49 = a3;
    v8->_bottomInsetsEnabled = 0;
    v8->_horizontalInsetsEnabled = 0;
    v8->_topInsetsWithNoHeaderEnabled = 1;
    v8->_contentViewTopInset = 0.0;
    v8->_sizingCellEstimatedHeight = -1.0;
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    collectionViewLayoutCache = v9->_collectionViewLayoutCache;
    v9->_collectionViewLayoutCache = v11;

    uint64_t v13 = [(HKDisplayTypeSectionedContextView *)v9 _buildCollectionViewLayoutWithBottomInsets:v9->_bottomInsetsEnabled horizontalInsets:v9->_horizontalInsetsEnabled topInsetsWithNoHeader:v9->_topInsetsWithNoHeaderEnabled];
    collectionViewLayout = v9->_collectionViewLayout;
    v9->_collectionViewLayout = (UICollectionViewLayout *)v13;

    uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1568]), "initWithFrame:collectionViewLayout:", v9->_collectionViewLayout, v4, v5, v6, v7);
    collectionView = v9->_collectionView;
    v9->_collectionView = (UICollectionView *)v15;

    [(UICollectionView *)v9->_collectionView setTranslatesAutoresizingMaskIntoConstraints:0];
    v17 = [MEMORY[0x1E4FB1618] clearColor];
    [(UICollectionView *)v9->_collectionView setBackgroundColor:v17];

    [(UICollectionView *)v9->_collectionView setDelegate:v9];
    [(UICollectionView *)v9->_collectionView setDataSource:v9];
    [(UICollectionView *)v9->_collectionView setAllowsSelection:1];
    [(UICollectionView *)v9->_collectionView setAllowsMultipleSelection:1];
    [(UICollectionView *)v9->_collectionView setScrollEnabled:v10 == 3];
    [(UICollectionView *)v9->_collectionView setAlwaysBounceVertical:1];
    [(HKDisplayTypeSectionedContextView *)v9 addSubview:v9->_collectionView];
    v18 = v9->_collectionView;
    uint64_t v19 = objc_opt_class();
    v20 = +[HKDisplayTypeContextVerticalCollectionViewCell reuseIdentifier];
    [(UICollectionView *)v18 registerClass:v19 forCellWithReuseIdentifier:v20];

    v21 = v9->_collectionView;
    uint64_t v22 = objc_opt_class();
    uint64_t v23 = *MEMORY[0x1E4FB2770];
    v24 = +[_HKDisplayTypeSectionedHeaderView reuseIdentifier];
    [(UICollectionView *)v21 registerClass:v22 forSupplementaryViewOfKind:v23 withReuseIdentifier:v24];

    v25 = v9->_collectionView;
    uint64_t v26 = objc_opt_class();
    v27 = +[_HKDisplayTypeSectionedHeaderWithButtonView reuseIdentifier];
    [(UICollectionView *)v25 registerClass:v26 forSupplementaryViewOfKind:v23 withReuseIdentifier:v27];

    v43 = (void *)MEMORY[0x1E4F28DC8];
    v48 = [(UICollectionView *)v9->_collectionView leadingAnchor];
    v47 = [(HKDisplayTypeSectionedContextView *)v9 leadingAnchor];
    v46 = [v48 constraintEqualToAnchor:v47];
    v51[0] = v46;
    v45 = [(UICollectionView *)v9->_collectionView trailingAnchor];
    v44 = [(HKDisplayTypeSectionedContextView *)v9 trailingAnchor];
    v28 = [v45 constraintEqualToAnchor:v44];
    v51[1] = v28;
    v29 = [(UICollectionView *)v9->_collectionView topAnchor];
    v30 = [(HKDisplayTypeSectionedContextView *)v9 topAnchor];
    v31 = [v29 constraintEqualToAnchor:v30];
    v51[2] = v31;
    v32 = [(UICollectionView *)v9->_collectionView bottomAnchor];
    v33 = [(HKDisplayTypeSectionedContextView *)v9 bottomAnchor];
    v34 = [v32 constraintEqualToAnchor:v33];
    v51[3] = v34;
    v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:4];
    [v43 activateConstraints:v35];

    if (v49 != 3)
    {
      v36 = [(UICollectionView *)v9->_collectionView heightAnchor];
      uint64_t v37 = [v36 constraintEqualToConstant:48.0];
      collectionViewHeightConstraint = v9->_collectionViewHeightConstraint;
      v9->_collectionViewHeightConstraint = (NSLayoutConstraint *)v37;

      [(NSLayoutConstraint *)v9->_collectionViewHeightConstraint setActive:1];
    }
    uint64_t v39 = [MEMORY[0x1E4F28D58] indexPathWithIndex:-1];
    lastSelectedIndex = v9->_lastSelectedIndex;
    v9->_lastSelectedIndex = (NSIndexPath *)v39;

    v41 = objc_msgSend(NSString, "hk_chartAccessibilityIdentifier:", @"Overlays");
    [(HKDisplayTypeSectionedContextView *)v9 setAccessibilityIdentifier:v41];

    [(HKDisplayTypeSectionedContextView *)v9 _registerForTraitChange];
  }
  return v9;
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKDisplayTypeSectionedContextView;
  -[HKDisplayTypeSectionedContextView setSemanticContentAttribute:](&v5, sel_setSemanticContentAttribute_);
  [(UICollectionView *)self->_collectionView setSemanticContentAttribute:a3];
}

- (BOOL)useBottomInsets
{
  return self->_bottomInsetsEnabled;
}

- (void)setUseBottomInsets:(BOOL)a3
{
  if (self->_bottomInsetsEnabled != a3)
  {
    self->_bottomInsetsEnabled = a3;
    [(HKDisplayTypeSectionedContextView *)self _reconfigureCollectionViewLayoutAndInsetsIfNecessary];
  }
}

- (BOOL)useHorizontalInsets
{
  return self->_horizontalInsetsEnabled;
}

- (void)setUseHorizontalInsets:(BOOL)a3
{
  if (self->_horizontalInsetsEnabled != a3)
  {
    self->_horizontalInsetsEnabled = a3;
    [(HKDisplayTypeSectionedContextView *)self _reconfigureCollectionViewLayoutAndInsetsIfNecessary];
  }
}

- (BOOL)useTopInsetsWithNoHeader
{
  return self->_topInsetsWithNoHeaderEnabled;
}

- (void)setUseTopInsetsWithNoHeader:(BOOL)a3
{
  if (self->_topInsetsWithNoHeaderEnabled != a3)
  {
    self->_topInsetsWithNoHeaderEnabled = a3;
    [(HKDisplayTypeSectionedContextView *)self _reconfigureCollectionViewLayoutAndInsetsIfNecessary];
  }
}

- (double)contentViewTopInset
{
  return self->_contentViewTopInset;
}

- (void)setContentViewTopInset:(double)a3
{
  if (a3 >= 0.0 && self->_contentViewTopInset != a3)
  {
    self->_contentViewTopInset = a3;
    -[UICollectionView setContentInset:](self->_collectionView, "setContentInset:");
    [(HKDisplayTypeSectionedContextView *)self _reconfigureCollectionViewLayoutAndInsetsIfNecessary];
  }
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)HKDisplayTypeSectionedContextView;
  [(HKDisplayTypeSectionedContextView *)&v3 _dynamicUserInterfaceTraitDidChange];
  [(HKDisplayTypeSectionedContextView *)self _reloadCollectionViewWithSelectedItems];
}

- (void)_reloadCollectionViewWithSelectedItems
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(UICollectionView *)self->_collectionView indexPathsForSelectedItems];
  [(UICollectionView *)self->_collectionView reloadData];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        -[UICollectionView selectItemAtIndexPath:animated:scrollPosition:](self->_collectionView, "selectItemAtIndexPath:animated:scrollPosition:", *(void *)(*((void *)&v9 + 1) + 8 * v8++), 0, 0, (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_registerForTraitChange
{
  v8[2] = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  v8[0] = objc_opt_class();
  v8[1] = objc_opt_class();
  objc_super v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__HKDisplayTypeSectionedContextView__registerForTraitChange__block_invoke;
  v5[3] = &unk_1E6D55DA8;
  objc_copyWeak(&v6, &location);
  id v4 = (id)[(HKDisplayTypeSectionedContextView *)self registerForTraitChanges:v3 withHandler:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __60__HKDisplayTypeSectionedContextView__registerForTraitChange__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v7 = [v13 traitCollection];
    uint64_t v8 = [WeakRetained _widthDesignationFromTraitCollection:v7];

    uint64_t v9 = [WeakRetained _widthDesignationFromTraitCollection:v5];
    long long v10 = [v13 traitCollection];
    long long v11 = [v10 preferredContentSizeCategory];
    long long v12 = [v5 preferredContentSizeCategory];

    if (v8 != v9 || v11 != v12)
    {
      WeakRetained[62] = 0xBFF0000000000000;
      [WeakRetained invalidateIntrinsicContentSize];
      [WeakRetained setNeedsLayout];
      [WeakRetained setNeedsUpdateConstraints];
    }
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)HKDisplayTypeSectionedContextView;
  [(HKDisplayTypeSectionedContextView *)&v3 layoutSubviews];
  [(HKDisplayTypeSectionedContextView *)self _reconfigureCollectionViewLayoutAndInsetsIfNecessary];
  if (self->_style == 2) {
    [(HKDisplayTypeSectionedContextView *)self _updateSizingCellWithContextItemSections:self->_displayTypeContextSections];
  }
  else {
    [(HKDisplayTypeSectionedContextView *)self _updateSizingCellEstimatedHeightIfNecessary];
  }
}

- (void)updateConstraints
{
  [(HKDisplayTypeSectionedContextView *)self _updateSelfSizingHeightConstraintIfNecessary];
  v3.receiver = self;
  v3.super_class = (Class)HKDisplayTypeSectionedContextView;
  [(HKDisplayTypeSectionedContextView *)&v3 updateConstraints];
}

- (void)_updateSelfSizingHeightConstraintIfNecessary
{
  if (self->_style != 3)
  {
    [(HKDisplayTypeSectionedContextView *)self _contentHeight];
    double v4 = v3;
    [(NSLayoutConstraint *)self->_collectionViewHeightConstraint constant];
    if (vabdd_f64(v4, v5) > 0.00000011920929)
    {
      [(NSLayoutConstraint *)self->_collectionViewHeightConstraint setConstant:v4];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __81__HKDisplayTypeSectionedContextView__updateSelfSizingHeightConstraintIfNecessary__block_invoke;
      block[3] = &unk_1E6D50ED8;
      block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

uint64_t __81__HKDisplayTypeSectionedContextView__updateSelfSizingHeightConstraintIfNecessary__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadCollectionViewWithSelectedItems];
}

- (id)_currentConfigurationWithBottomInsets:(BOOL)a3 horizontalInsets:(BOOL)a4 topInsetsWithNoHeader:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  BOOL v7 = a3;
  uint64_t v9 = objc_alloc_init(_HKSectionedContextViewConfiguration);
  [(_HKSectionedContextViewConfiguration *)v9 setIsHorizontalInTwoOverlaysMode:[(HKDisplayTypeSectionedContextView *)self _isHorizontalInTwoOverlaysMode]];
  [(_HKSectionedContextViewConfiguration *)v9 setBottomInsetsEnabled:v7];
  [(_HKSectionedContextViewConfiguration *)v9 setHorizontalInsetsEnabled:v6];
  [(_HKSectionedContextViewConfiguration *)v9 setTopInsetsWithNoHeaderEnabled:v5];
  return v9;
}

- (id)_buildCollectionViewLayoutWithBottomInsets:(BOOL)a3 horizontalInsets:(BOOL)a4 topInsetsWithNoHeader:(BOOL)a5
{
  BOOL v6 = [(HKDisplayTypeSectionedContextView *)self _currentConfigurationWithBottomInsets:a3 horizontalInsets:a4 topInsetsWithNoHeader:a5];
  if ([v6 isHorizontalInTwoOverlaysMode]) {
    [(HKDisplayTypeSectionedContextView *)self _collectionViewLayoutForHorizontalTwoOverlaysWithConfig:v6];
  }
  else {
  BOOL v7 = [(HKDisplayTypeSectionedContextView *)self _defaultCollectionViewLayoutWithConfiguration:v6];
  }

  return v7;
}

- (id)_collectionViewLayoutForHorizontalTwoOverlaysWithConfig:(id)a3
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(NSMutableDictionary *)self->_collectionViewLayoutCache objectForKeyedSubscript:v4];

  if (v5)
  {
    BOOL v6 = [(NSMutableDictionary *)self->_collectionViewLayoutCache objectForKeyedSubscript:v4];
  }
  else
  {
    BOOL v7 = (void *)MEMORY[0x1E4FB1338];
    uint64_t v8 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:0.5];
    uint64_t v9 = [MEMORY[0x1E4FB1308] estimatedDimension:50.0];
    long long v10 = [v7 sizeWithWidthDimension:v8 heightDimension:v9];

    long long v11 = [MEMORY[0x1E4FB1328] itemWithLayoutSize:v10];
    long long v12 = [MEMORY[0x1E4FB1328] itemWithLayoutSize:v10];
    id v13 = (void *)MEMORY[0x1E4FB1338];
    uint64_t v14 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0];
    uint64_t v15 = [MEMORY[0x1E4FB1308] estimatedDimension:50.0];
    v16 = [v13 sizeWithWidthDimension:v14 heightDimension:v15];

    v17 = (void *)MEMORY[0x1E4FB1318];
    v23[0] = v11;
    v23[1] = v12;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
    uint64_t v19 = [v17 horizontalGroupWithLayoutSize:v16 subitems:v18];

    v20 = (void *)MEMORY[0x1E4FB1340];
    [(HKDisplayTypeSectionedContextView *)self _interItemSpacing];
    v21 = objc_msgSend(v20, "fixedSpacing:");
    [v19 setInterItemSpacing:v21];

    BOOL v6 = -[HKDisplayTypeSectionedContextView _collectionViewLayoutWithLayoutGroup:bottomInsets:horizontalInsets:topInsetsWithNoHeader:](self, "_collectionViewLayoutWithLayoutGroup:bottomInsets:horizontalInsets:topInsetsWithNoHeader:", v19, [v4 bottomInsetsEnabled], objc_msgSend(v4, "horizontalInsetsEnabled"), objc_msgSend(v4, "topInsetsWithNoHeaderEnabled"));
    [(NSMutableDictionary *)self->_collectionViewLayoutCache setObject:v6 forKeyedSubscript:v4];
  }
  return v6;
}

- (id)_defaultCollectionViewLayoutWithConfiguration:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(NSMutableDictionary *)self->_collectionViewLayoutCache objectForKeyedSubscript:v4];

  if (v5)
  {
    BOOL v6 = [(NSMutableDictionary *)self->_collectionViewLayoutCache objectForKeyedSubscript:v4];
  }
  else
  {
    BOOL v7 = (void *)MEMORY[0x1E4FB1338];
    uint64_t v8 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0];
    uint64_t v9 = [MEMORY[0x1E4FB1308] estimatedDimension:50.0];
    long long v10 = [v7 sizeWithWidthDimension:v8 heightDimension:v9];

    long long v11 = [MEMORY[0x1E4FB1328] itemWithLayoutSize:v10];
    long long v12 = (void *)[v10 copy];
    id v13 = (void *)MEMORY[0x1E4FB1318];
    v17[0] = v11;
    uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    uint64_t v15 = [v13 horizontalGroupWithLayoutSize:v12 subitems:v14];

    BOOL v6 = -[HKDisplayTypeSectionedContextView _collectionViewLayoutWithLayoutGroup:bottomInsets:horizontalInsets:topInsetsWithNoHeader:](self, "_collectionViewLayoutWithLayoutGroup:bottomInsets:horizontalInsets:topInsetsWithNoHeader:", v15, [v4 bottomInsetsEnabled], objc_msgSend(v4, "horizontalInsetsEnabled"), objc_msgSend(v4, "topInsetsWithNoHeaderEnabled"));
    [(NSMutableDictionary *)self->_collectionViewLayoutCache setObject:v6 forKeyedSubscript:v4];
  }
  return v6;
}

- (double)_collectionViewLineSpacing
{
  v2 = [MEMORY[0x1E4F2B860] sharedBehavior];
  if ([v2 isiPad]) {
    double v3 = 16.0;
  }
  else {
    double v3 = 10.0;
  }

  return v3;
}

- (id)_collectionViewLayoutWithLayoutGroup:(id)a3 bottomInsets:(BOOL)a4 horizontalInsets:(BOOL)a5 topInsetsWithNoHeader:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  v29[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  long long v11 = (void *)MEMORY[0x1E4FB1338];
  long long v12 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0];
  id v13 = [MEMORY[0x1E4FB1308] estimatedDimension:50.0];
  uint64_t v14 = [v11 sizeWithWidthDimension:v12 heightDimension:v13];

  uint64_t v15 = [MEMORY[0x1E4FB12F8] boundarySupplementaryItemWithLayoutSize:v14 elementKind:*MEMORY[0x1E4FB2770] alignment:1];
  v16 = [MEMORY[0x1E4FB1330] sectionWithGroup:v10];
  [(HKDisplayTypeSectionedContextView *)self _collectionViewLineSpacing];
  objc_msgSend(v16, "setInterGroupSpacing:");
  [(HKDisplayTypeSectionedContextView *)self _contentItemInsetsWithTopInsets:v6 BottomInsets:v8 horizontalInsets:v7];
  objc_msgSend(v16, "setContentInsets:");
  v17 = [MEMORY[0x1E4FB1330] sectionWithGroup:v10];
  [(HKDisplayTypeSectionedContextView *)self _collectionViewLineSpacing];
  objc_msgSend(v17, "setInterGroupSpacing:");
  [(HKDisplayTypeSectionedContextView *)self _contentItemInsetsWithTopInsets:1 BottomInsets:v8 horizontalInsets:v7];
  objc_msgSend(v17, "setContentInsets:");
  v29[0] = v15;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
  [v17 setBoundarySupplementaryItems:v18];

  objc_initWeak(&location, self);
  id v19 = objc_alloc(MEMORY[0x1E4FB1580]);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __126__HKDisplayTypeSectionedContextView__collectionViewLayoutWithLayoutGroup_bottomInsets_horizontalInsets_topInsetsWithNoHeader___block_invoke;
  v24[3] = &unk_1E6D56560;
  objc_copyWeak(&v27, &location);
  id v20 = v17;
  id v25 = v20;
  id v21 = v16;
  id v26 = v21;
  uint64_t v22 = (void *)[v19 initWithSectionProvider:v24];

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);

  return v22;
}

id __126__HKDisplayTypeSectionedContextView__collectionViewLayoutWithLayoutGroup_bottomInsets_horizontalInsets_topInsetsWithNoHeader___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  BOOL v5 = WeakRetained;
  if (WeakRetained)
  {
    int v6 = [WeakRetained _appendHeaderForSectionIndex:a2];
    uint64_t v7 = 40;
    if (v6) {
      uint64_t v7 = 32;
    }
    id v8 = *(id *)(a1 + v7);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (BOOL)_appendHeaderForSectionIndex:(int64_t)a3
{
  displayTypeContextSections = self->_displayTypeContextSections;
  if (!displayTypeContextSections) {
    return 0;
  }
  id v4 = [(NSArray *)displayTypeContextSections objectAtIndexedSubscript:a3];
  BOOL v5 = [v4 title];

  if (v5) {
    BOOL v6 = [v5 length] != 0;
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (NSDirectionalEdgeInsets)_contentItemInsetsWithTopInsets:(BOOL)a3 BottomInsets:(BOOL)a4 horizontalInsets:(BOOL)a5
{
  double v5 = 0.0;
  if (a3) {
    double v6 = 16.0;
  }
  else {
    double v6 = 0.0;
  }
  if (a5) {
    double v7 = 16.0;
  }
  else {
    double v7 = 0.0;
  }
  if (a4) {
    double v5 = 16.0;
  }
  double v8 = v7;
  result.trailing = v8;
  result.bottom = v5;
  result.leading = v7;
  result.top = v6;
  return result;
}

- (int64_t)_widthDesignationFromTraitCollection:(id)a3
{
  id v3 = a3;
  int64_t v4 = [v3 valueForNSIntegerTrait:objc_opt_class()];

  return v4;
}

- (BOOL)_isHorizontalInTwoOverlaysMode
{
  if (self->_style != 2) {
    return 0;
  }
  id v3 = [(HKDisplayTypeSectionedContextView *)self traitCollection];
  int64_t v4 = [(HKDisplayTypeSectionedContextView *)self _widthDesignationFromTraitCollection:v3];

  return (unint64_t)(v4 - 4) < 3;
}

- (double)_interItemSpacing
{
  if (![(HKDisplayTypeSectionedContextView *)self _isHorizontalInTwoOverlaysMode]) {
    return 0.0;
  }
  id v3 = [(HKDisplayTypeSectionedContextView *)self traitCollection];
  int64_t v4 = [(HKDisplayTypeSectionedContextView *)self _widthDesignationFromTraitCollection:v3];

  +[HKCollectionViewLayoutEngineDefaults interItemSpacingForWidthDesignation:v4];
  return result;
}

- (void)_reconfigureCollectionViewLayoutAndInsetsIfNecessary
{
  id v5 = [(HKDisplayTypeSectionedContextView *)self _buildCollectionViewLayoutWithBottomInsets:self->_bottomInsetsEnabled horizontalInsets:self->_horizontalInsetsEnabled topInsetsWithNoHeader:self->_topInsetsWithNoHeaderEnabled];
  id v3 = [(UICollectionView *)self->_collectionView collectionViewLayout];
  char v4 = [v5 isEqual:v3];

  if ((v4 & 1) == 0)
  {
    [(UICollectionView *)self->_collectionView setCollectionViewLayout:v5];
    [(HKDisplayTypeSectionedContextView *)self invalidateIntrinsicContentSize];
    [(HKDisplayTypeSectionedContextView *)self setNeedsLayout];
    [(UICollectionView *)self->_collectionView setNeedsDisplay];
    [(HKDisplayTypeSectionedContextView *)self setNeedsUpdateConstraints];
  }
}

- (void)setDisplayTypeContextSections:(id)a3
{
  objc_storeStrong((id *)&self->_displayTypeContextSections, a3);
  id v5 = a3;
  [(HKDisplayTypeSectionedContextView *)self _updateSizingCellWithContextItemSections:v5];
  [(UICollectionView *)self->_collectionView reloadData];
}

- (void)selectItemAtIndexPath:(id)a3 animated:(BOOL)a4 scrollPosition:(unint64_t)a5
{
  collectionView = self->_collectionView;
  id v7 = a3;
  [(UICollectionView *)collectionView selectItemAtIndexPath:v7 animated:0 scrollPosition:0];
  [(HKDisplayTypeSectionedContextView *)self _handleSelection:self->_collectionView indexPath:v7 informDelegate:0];
}

- (void)deselectAllItemsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = [MEMORY[0x1E4F28D58] indexPathWithIndex:-1];
  lastSelectedIndex = self->_lastSelectedIndex;
  self->_lastSelectedIndex = v5;

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = [(UICollectionView *)self->_collectionView indexPathsForSelectedItems];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [(UICollectionView *)self->_collectionView deselectItemAtIndexPath:*(void *)(*((void *)&v12 + 1) + 8 * v11++) animated:v3];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)scrollToTop
{
  if ([(UICollectionView *)self->_collectionView isScrollEnabled])
  {
    collectionView = self->_collectionView;
    [(UICollectionView *)collectionView contentInset];
    -[UICollectionView setContentOffset:animated:](collectionView, "setContentOffset:animated:", 0, 0.0, -v4);
  }
}

- (CGSize)intrinsicContentSize
{
  [(HKDisplayTypeSectionedContextView *)self _contentWidth];
  double v4 = v3;
  [(HKDisplayTypeSectionedContextView *)self _contentHeight];
  double v6 = v5;
  double v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

- (HKDisplayTypeContextVerticalCollectionViewCell)sizingCell
{
  sizingCell = self->_sizingCell;
  if (!sizingCell)
  {
    [(HKDisplayTypeSectionedContextView *)self _cellSizingWidth];
    double v5 = -[HKDisplayTypeContextVerticalCollectionViewCell initWithFrame:]([HKDisplayTypeContextVerticalCollectionViewCell alloc], "initWithFrame:", 0.0, 0.0, v4, 48.0);
    double v6 = self->_sizingCell;
    self->_sizingCell = v5;

    [(HKDisplayTypeContextVerticalCollectionViewCell *)self->_sizingCell setHidden:1];
    double v7 = self->_sizingCell;
    uint64_t v8 = [(HKDisplayTypeSectionedContextView *)self sizingItem];
    [(HKDisplayTypeContextVerticalCollectionViewCell *)v7 updateWithContextItem:v8 mode:self->_style];

    sizingCell = self->_sizingCell;
  }
  return sizingCell;
}

- (id)createCellWithItem:(id)a3
{
  id v4 = a3;
  [(HKDisplayTypeSectionedContextView *)self _cellSizingWidth];
  double v6 = -[HKDisplayTypeContextVerticalCollectionViewCell initWithFrame:]([HKDisplayTypeContextVerticalCollectionViewCell alloc], "initWithFrame:", 0.0, 0.0, v5, 48.0);
  [(HKDisplayTypeContextVerticalCollectionViewCell *)v6 updateWithContextItem:v4 mode:self->_style];

  return v6;
}

- (HKDisplayTypeContextItem)sizingItem
{
  sizingItem = self->_sizingItem;
  if (!sizingItem)
  {
    id v4 = [(HKDisplayTypeSectionedContextView *)self _makeSizingItemWithItem:0];
    double v5 = self->_sizingItem;
    self->_sizingItem = v4;

    sizingItem = self->_sizingItem;
  }
  return sizingItem;
}

- (id)_makeDummySizingItem
{
  v2 = objc_alloc_init(HKDisplayTypeContextItem);
  [(HKDisplayTypeContextItem *)v2 setTitle:@"Fake Title"];
  [(HKDisplayTypeContextItem *)v2 setAccessibilityIdentifier:@"Fake Id"];
  [(HKDisplayTypeContextItem *)v2 setValue:@"Fake Value"];
  [(HKDisplayTypeContextItem *)v2 setUnit:@"Fake Unit"];
  [(HKDisplayTypeContextItem *)v2 setValueContext:@"Fake"];
  return v2;
}

- (id)_makeSizingItemWithItem:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    double v5 = objc_alloc_init(HKDisplayTypeContextItem);
    double v6 = [v4 title];
    [(HKDisplayTypeContextItem *)v5 setTitle:v6];

    double v7 = [v4 accessibilityIdentifier];
    [(HKDisplayTypeContextItem *)v5 setAccessibilityIdentifier:v7];

    uint64_t v8 = [v4 value];
    [(HKDisplayTypeContextItem *)v5 setValue:v8];

    uint64_t v9 = [v4 unit];
    [(HKDisplayTypeContextItem *)v5 setUnit:v9];

    uint64_t v10 = [v4 attributedLabelTextOverride];
    [(HKDisplayTypeContextItem *)v5 setAttributedLabelTextOverride:v10];

    uint64_t v11 = [v4 valueContext];
    [(HKDisplayTypeContextItem *)v5 setValueContext:v11];

    -[HKDisplayTypeContextItem setIsUnitIncludedInValue:](v5, "setIsUnitIncludedInValue:", [v4 isUnitIncludedInValue]);
  }
  else
  {
    double v5 = [(HKDisplayTypeSectionedContextView *)self _makeDummySizingItem];
  }

  return v5;
}

- (void)_updateSizingCellWithContextItemSections:(id)a3
{
  if ((unint64_t)(self->_style - 1) <= 1)
  {
    id v21 = [a3 firstObject];
    id v4 = [v21 items];
    double v5 = [v4 firstObject];
    double v6 = [(HKDisplayTypeSectionedContextView *)self _makeSizingItemWithItem:v5];

    if (self->_style == 2)
    {
      double v7 = [v21 items];
      uint64_t v8 = [v7 objectAtIndexedSubscript:1];
      uint64_t v9 = [(HKDisplayTypeSectionedContextView *)self _makeSizingItemWithItem:v8];

      uint64_t v10 = [(HKDisplayTypeSectionedContextView *)self createCellWithItem:v6];
      uint64_t v11 = [(HKDisplayTypeSectionedContextView *)self createCellWithItem:v9];
      [(HKDisplayTypeSectionedContextView *)self _estimateCellHeightForCell:v10];
      double v13 = v12;
      [(HKDisplayTypeSectionedContextView *)self _estimateCellHeightForCell:v11];
      if (v14 > v13)
      {
        double v15 = v14;
        id v16 = v9;

        double v13 = v15;
        double v6 = v16;
      }
      BOOL v17 = vabdd_f64(v13, self->_sizingCellEstimatedHeight) > 0.00000011920929;
    }
    else
    {
      BOOL v17 = 0;
    }
    v18 = [(HKDisplayTypeSectionedContextView *)self sizingItem];
    int v19 = [v6 isEqualToContextItem:v18];

    if (v17 || !v19)
    {
      objc_storeStrong((id *)&self->_sizingItem, v6);
      id v20 = [(HKDisplayTypeSectionedContextView *)self sizingCell];
      [v20 updateWithContextItem:self->_sizingItem mode:self->_style];

      [(HKDisplayTypeSectionedContextView *)self _updateSizingCellEstimatedHeightIfNecessary];
    }
  }
}

- (void)_updateSizingCellEstimatedHeightIfNecessary
{
  [(HKDisplayTypeSectionedContextView *)self _estimatedDynamicCellHeight];
  if (vabdd_f64(v3, self->_sizingCellEstimatedHeight) > 0.00000011920929)
  {
    self->_sizingCellEstimatedHeight = v3;
    [(HKDisplayTypeSectionedContextView *)self invalidateIntrinsicContentSize];
    [(HKDisplayTypeSectionedContextView *)self setNeedsLayout];
    [(HKDisplayTypeSectionedContextView *)self setNeedsUpdateConstraints];
  }
}

- (double)_estimatedDynamicCellHeight
{
  double v3 = [(HKDisplayTypeSectionedContextView *)self sizingCell];
  [(HKDisplayTypeSectionedContextView *)self addSubview:v3];

  id v4 = [(HKDisplayTypeSectionedContextView *)self sizingCell];
  [v4 configureForTraitCollection];

  double v5 = [(HKDisplayTypeSectionedContextView *)self sizingCell];
  [v5 setNeedsLayout];

  double v6 = [(HKDisplayTypeSectionedContextView *)self sizingCell];
  [v6 layoutIfNeeded];

  double v7 = [(HKDisplayTypeSectionedContextView *)self sizingCell];
  [(HKDisplayTypeSectionedContextView *)self _estimateCellHeightForCell:v7];
  double v9 = v8;

  uint64_t v10 = [(HKDisplayTypeSectionedContextView *)self sizingCell];
  [v10 removeFromSuperview];

  return v9;
}

- (double)_estimateCellHeightForCell:(id)a3
{
  id v4 = a3;
  [(HKDisplayTypeSectionedContextView *)self _cellSizingWidth];
  objc_msgSend(v4, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:");
  double v6 = v5;

  return v6;
}

- (double)_preferredCollectionViewHeightForCount:(int64_t)a3
{
  double v5 = 16.0;
  if (!self->_bottomInsetsEnabled) {
    double v5 = 0.0;
  }
  double v6 = self->_contentViewTopInset + 16.0 + v5;
  [(HKDisplayTypeSectionedContextView *)self _collectionViewLineSpacing];
  double v8 = v6 + v7 * (double)(a3 - 1);
  if (a3 < 3)
  {
    double sizingCellEstimatedHeight = self->_sizingCellEstimatedHeight;
    if (sizingCellEstimatedHeight == -1.0) {
      [(HKDisplayTypeSectionedContextView *)self _estimatedDynamicCellHeight];
    }
    return v8 + sizingCellEstimatedHeight * (double)a3;
  }
  else
  {
    double v9 = v8 + (double)a3 * 48.0;
    if ((objc_msgSend(MEMORY[0x1E4FB1BA8], "hk_currentDeviceHas4InchScreen") & 1) != 0
      || objc_msgSend(MEMORY[0x1E4FB1BA8], "hk_currentDeviceHas4Point7InchScreen"))
    {
      return fmin(v9, 125.0);
    }
    return v9;
  }
}

- (double)_contentHeight
{
  int64_t style = self->_style;
  if (style != 1)
  {
    if (style == 3)
    {
      int64_t style = [(HKDisplayTypeSectionedContextView *)self _rowsForScreenSize];
    }
    else
    {
      if (style != 2) {
        return 0.0;
      }
      if ([(HKDisplayTypeSectionedContextView *)self _isHorizontalInTwoOverlaysMode]) {
        int64_t style = 1;
      }
      else {
        int64_t style = 2;
      }
    }
  }
  [(HKDisplayTypeSectionedContextView *)self _preferredCollectionViewHeightForCount:style];
  return result;
}

- (double)_contentWidth
{
  [(HKDisplayTypeSectionedContextView *)self frame];
  if (v3 == 0.0)
  {
    id v4 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v4 bounds];
    double v6 = v5;
  }
  else
  {
    [(HKDisplayTypeSectionedContextView *)self frame];
    return v7;
  }
  return v6;
}

- (double)_cellSizingWidth
{
  if (self->_horizontalInsetsEnabled) {
    double v3 = 32.0;
  }
  else {
    double v3 = 0.0;
  }
  BOOL v4 = [(HKDisplayTypeSectionedContextView *)self _isHorizontalInTwoOverlaysMode];
  [(HKDisplayTypeSectionedContextView *)self _contentWidth];
  double v6 = v5;
  if (v4)
  {
    [(HKDisplayTypeSectionedContextView *)self _interItemSpacing];
    double v8 = (v6 - v7 - v3) * 0.5;
  }
  else
  {
    double v8 = v5 - v3;
  }
  return fmax(v8, 0.0);
}

- (int64_t)_rowsForScreenSize
{
  if (objc_msgSend(MEMORY[0x1E4FB1BA8], "hk_currentDeviceHas4InchScreen")) {
    return 2;
  }
  else {
    return 4;
  }
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  int64_t result = (int64_t)self->_displayTypeContextSections;
  if (result) {
    return objc_msgSend((id)result, "count", a3);
  }
  return result;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6 = a3;
  displayTypeContextSections = self->_displayTypeContextSections;
  if (displayTypeContextSections && [(NSArray *)displayTypeContextSections count] - 1 >= a4)
  {
    double v9 = [(NSArray *)self->_displayTypeContextSections objectAtIndexedSubscript:a4];
    uint64_t v10 = [v9 items];
    int64_t v8 = [v10 count];
  }
  else
  {
    int64_t v8 = 0;
  }

  return v8;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int64_t v8 = +[HKDisplayTypeContextVerticalCollectionViewCell reuseIdentifier];
  double v9 = [v7 dequeueReusableCellWithReuseIdentifier:v8 forIndexPath:v6];

  [v9 setDelegate:self];
  uint64_t v10 = -[NSArray objectAtIndexedSubscript:](self->_displayTypeContextSections, "objectAtIndexedSubscript:", [v6 section]);
  uint64_t v11 = [v10 items];
  uint64_t v12 = [v6 item];

  double v13 = [v11 objectAtIndexedSubscript:v12];

  [v9 updateWithContextItem:v13 mode:self->_style];
  return v9;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
}

- (void)_handleSelection:(id)a3 indexPath:(id)a4 informDelegate:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  double v9 = (NSIndexPath *)a4;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v10 = objc_msgSend(v8, "indexPathsForSelectedItems", 0);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        double v15 = *(NSIndexPath **)(*((void *)&v20 + 1) + 8 * v14);
        if (v15 != v9) {
          [v8 deselectItemAtIndexPath:v15 animated:0];
        }
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v12);
  }

  p_lastSelectedIndex = &self->_lastSelectedIndex;
  if (self->_lastSelectedIndex == v9)
  {
    if (v5)
    {
      [v8 deselectItemAtIndexPath:v9 animated:0];
      uint64_t v18 = [MEMORY[0x1E4F28D58] indexPathWithIndex:-1];
      int v19 = *p_lastSelectedIndex;
      *p_lastSelectedIndex = (NSIndexPath *)v18;

      BOOL v17 = [(HKDisplayTypeSectionedContextView *)self delegate];
      [v17 contextView:self didDeselectItemAtIndexPath:v9];
      goto LABEL_15;
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_lastSelectedIndex, a4);
    if (v5)
    {
      BOOL v17 = [(HKDisplayTypeSectionedContextView *)self delegate];
      [v17 contextView:self didSelectItemAtIndexPath:v9];
LABEL_15:
    }
  }
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  BOOL v5 = (void *)MEMORY[0x1E4F28D58];
  id v6 = a4;
  id v7 = [v5 indexPathWithIndex:-1];
  lastSelectedIndex = self->_lastSelectedIndex;
  self->_lastSelectedIndex = v7;

  id v9 = [(HKDisplayTypeSectionedContextView *)self delegate];
  [v9 contextView:self didDeselectItemAtIndexPath:v6];
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(HKDisplayTypeSectionedContextView *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(HKDisplayTypeSectionedContextView *)self delegate];
    char v9 = [v8 contextView:self canSelectItemAtIndexPath:v5];
  }
  else
  {
    char v9 = 1;
  }

  return v9;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(HKDisplayTypeSectionedContextView *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(HKDisplayTypeSectionedContextView *)self delegate];
    char v9 = [v8 contextView:self canSelectItemAtIndexPath:v5];
  }
  else
  {
    char v9 = 1;
  }

  return v9;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  char v9 = -[NSArray objectAtIndexedSubscript:](self->_displayTypeContextSections, "objectAtIndexedSubscript:", [v8 section]);
  char v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0
    && (-[NSArray objectAtIndexedSubscript:](self->_displayTypeContextSections, "objectAtIndexedSubscript:", [v8 section]), uint64_t v11 = objc_claimAutoreleasedReturnValue(), objc_msgSend(v11, "accessoryButtonAction"), v12 = objc_claimAutoreleasedReturnValue(), v12, v11, v12))
  {
    uint64_t v13 = *MEMORY[0x1E4FB2770];
    uint64_t v14 = +[_HKDisplayTypeSectionedHeaderWithButtonView reuseIdentifier];
    double v15 = [v7 dequeueReusableSupplementaryViewOfKind:v13 withReuseIdentifier:v14 forIndexPath:v8];

    id v16 = -[NSArray objectAtIndexedSubscript:](self->_displayTypeContextSections, "objectAtIndexedSubscript:", [v8 section]);
    BOOL v17 = [v16 title];

    [v15 setTitle:v17];
    uint64_t v18 = -[NSArray objectAtIndexedSubscript:](self->_displayTypeContextSections, "objectAtIndexedSubscript:", [v8 section]);
    int v19 = [v18 accessoryButtonAction];
    [v15 setAccessoryButtonAction:v19];
  }
  else
  {
    uint64_t v20 = *MEMORY[0x1E4FB2770];
    long long v21 = +[_HKDisplayTypeSectionedHeaderView reuseIdentifier];
    double v15 = [v7 dequeueReusableSupplementaryViewOfKind:v20 withReuseIdentifier:v21 forIndexPath:v8];

    long long v22 = -[NSArray objectAtIndexedSubscript:](self->_displayTypeContextSections, "objectAtIndexedSubscript:", [v8 section]);
    BOOL v17 = [v22 title];

    [v15 setTitle:v17];
  }

  return v15;
}

- (double)_maximumHeaderLabelLength
{
  [(UICollectionView *)self->_collectionView frame];
  double Width = CGRectGetWidth(v8);
  [(UICollectionView *)self->_collectionView contentInset];
  double v5 = Width - v4;
  [(UICollectionView *)self->_collectionView contentInset];
  return v5 + v6;
}

- (void)didTapOnInfoButtonForCollectionViewCell:(id)a3
{
  id v7 = [(UICollectionView *)self->_collectionView indexPathForCell:a3];
  double v4 = [(HKDisplayTypeSectionedContextView *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    double v6 = [(HKDisplayTypeSectionedContextView *)self delegate];
    objc_msgSend(v6, "contextView:didTapOnInfoButtonAtIndex:", self, objc_msgSend(v7, "row"));
  }
}

- (NSArray)displayTypeContextSections
{
  return self->_displayTypeContextSections;
}

- (HKDisplayTypeSectionedContextViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HKDisplayTypeSectionedContextViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setSizingCell:(id)a3
{
}

- (void)setSizingItem:(id)a3
{
}

- (double)sizingCellEstimatedHeight
{
  return self->_sizingCellEstimatedHeight;
}

- (void)setSizingCellEstimatedHeight:(double)a3
{
  self->_double sizingCellEstimatedHeight = a3;
}

- (NSMutableDictionary)collectionViewLayoutCache
{
  return self->_collectionViewLayoutCache;
}

- (void)setCollectionViewLayoutCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionViewLayoutCache, 0);
  objc_storeStrong((id *)&self->_sizingItem, 0);
  objc_storeStrong((id *)&self->_sizingCell, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_displayTypeContextSections, 0);
  objc_storeStrong((id *)&self->_lastSelectedIndex, 0);
  objc_storeStrong((id *)&self->_collectionViewLayout, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_collectionViewHeightConstraint, 0);
}

@end