@interface NTK_PUAdjustmentsViewController
- (BOOL)canToggleCell:(id)a3;
- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4;
- (BOOL)didPerformHapticFeedback;
- (BOOL)didSetupControls;
- (BOOL)isAnimatingScroll;
- (BOOL)shouldDisplayControlValues;
- (BOOL)shouldDisplayMappedValues;
- (CEKBadgeTextView)badgeView;
- (CGSize)controlSize;
- (NSIndexPath)selectedIndexPath;
- (NTK_PUAdjustmentInfo)selectedAdjustmentInfo;
- (NTK_PUAdjustmentViewControllerDelegate)delegate;
- (NTK_PUAdjustmentsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (NTK_PUAdjustmentsViewDataSource)dataSource;
- (NTK_PUAdjustmentsViewFlowLayout)collectionViewLayout;
- (NTK_PUSelectionFeedbackGenerator)selectionFeedbackGenerator;
- (UICollectionView)collectionView;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (double)ntk_controlHeight;
- (id)_backgroundImageForItemAtIndexPath:(id)a3;
- (id)_circularImageWithSize:(CGSize)a3 color:(id)a4;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)layoutDirection;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (int64_t)preferredUserInterfaceStyle;
- (void)_performFeedbackIfNeeded;
- (void)_resetControlsAtIndexPath:(id)a3;
- (void)_scrollToSelectedIndexPath;
- (void)_setupCellBackgroundImagesIfNeeded;
- (void)_sliderDidEndScrolling;
- (void)_updateBadgeLayout;
- (void)_updateCell:(id)a3 withInfo:(id)a4;
- (void)_updateCollectionViewLayoutDirection:(int64_t)a3;
- (void)_updateSelectedInfo;
- (void)_updateViewLayout;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)didToggleCell:(id)a3;
- (void)ntk_setSelectedIndexPath:(id)a3;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)setBadgeView:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setCollectionViewLayout:(id)a3;
- (void)setControlSize:(CGSize)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidPerformHapticFeedback:(BOOL)a3;
- (void)setDidSetupControls:(BOOL)a3;
- (void)setIsAnimatingScroll:(BOOL)a3;
- (void)setLayoutDirection:(int64_t)a3;
- (void)setSelectedIndexPath:(id)a3;
- (void)setSelectionFeedbackGenerator:(id)a3;
- (void)setShouldDisplayControlValues:(BOOL)a3;
- (void)setShouldDisplayMappedValues:(BOOL)a3;
- (void)slider:(id)a3 willUpdateValue:(double *)a4 withVelocity:(double)a5;
- (void)sliderDidEndScrolling:(id)a3;
- (void)sliderValueChanged:(id)a3;
- (void)sliderWillBeginScrolling:(id)a3;
- (void)sliderWillEndScrolling:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)updateControls;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation NTK_PUAdjustmentsViewController

- (NTK_PUAdjustmentsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)NTK_PUAdjustmentsViewController;
  result = [(NTK_PUAdjustmentsViewController *)&v5 initWithNibName:a3 bundle:a4];
  if (result)
  {
    result->_shouldDisplayControlValues = 1;
    result->_shouldDisplayMappedValues = 1;
  }
  return result;
}

- (void)viewDidLoad
{
  v48.receiver = self;
  v48.super_class = (Class)NTK_PUAdjustmentsViewController;
  [(NTK_PUAdjustmentsViewController *)&v48 viewDidLoad];
  [(NTK_PUAdjustmentsViewController *)self setLayoutDirection:0];
  v3 = +[UIColor clearColor];
  v4 = [(NTK_PUAdjustmentsViewController *)self view];
  [v4 setBackgroundColor:v3];

  -[NTK_PUAdjustmentsViewController setControlSize:](self, "setControlSize:", 51.0, 51.0);
  objc_super v5 = objc_alloc_init(NTK_PUAdjustmentsViewFlowLayout);
  collectionViewLayout = self->_collectionViewLayout;
  self->_collectionViewLayout = v5;

  [(NTK_PUAdjustmentsViewController *)self controlSize];
  -[NTK_PUAdjustmentsViewFlowLayout setItemSize:](self->_collectionViewLayout, "setItemSize:");
  [(NTK_PUAdjustmentsViewFlowLayout *)self->_collectionViewLayout setMinimumInteritemSpacing:20.0];
  [(NTK_PUAdjustmentsViewFlowLayout *)self->_collectionViewLayout setMinimumLineSpacing:20.0];
  [(NTK_PUAdjustmentsViewFlowLayout *)self->_collectionViewLayout setScrollDirection:1];
  id v7 = objc_alloc((Class)UICollectionView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  id v11 = objc_msgSend(v7, "initWithFrame:collectionViewLayout:", self->_collectionViewLayout, CGRectZero.origin.x, y, width, height);
  [(NTK_PUAdjustmentsViewController *)self setCollectionView:v11];

  v12 = [(NTK_PUAdjustmentsViewController *)self view];
  v13 = [(NTK_PUAdjustmentsViewController *)self collectionView];
  [v12 addSubview:v13];

  v14 = +[UIColor clearColor];
  v15 = [(NTK_PUAdjustmentsViewController *)self collectionView];
  [v15 setBackgroundColor:v14];

  v16 = [(NTK_PUAdjustmentsViewController *)self collectionView];
  [v16 setShowsHorizontalScrollIndicator:0];

  v17 = [(NTK_PUAdjustmentsViewController *)self collectionView];
  [v17 setShowsVerticalScrollIndicator:0];

  v18 = [(NTK_PUAdjustmentsViewController *)self collectionView];
  [v18 setSemanticContentAttribute:3];

  v19 = [(NTK_PUAdjustmentsViewController *)self collectionView];
  [v19 setContentInsetAdjustmentBehavior:2];

  v20 = [(NTK_PUAdjustmentsViewController *)self collectionView];
  [v20 setSelectionFollowsFocus:1];

  v21 = [(NTK_PUAdjustmentsViewController *)self collectionView];
  [v21 setDelegate:self];

  v22 = [(NTK_PUAdjustmentsViewController *)self collectionView];
  [v22 setDataSource:self];

  v23 = [(NTK_PUAdjustmentsViewController *)self collectionView];
  [v23 setClipsToBounds:0];

  v24 = [(NTK_PUAdjustmentsViewController *)self collectionView];
  [v24 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"NTK_PUEditAdjustmentsCellReuseIdentifier"];

  v25 = [(NTK_PUAdjustmentsViewController *)self collectionView];
  [v25 setDecelerationRate:UIScrollViewDecelerationRateFast];

  if (NTK_PUHapticsAllowed())
  {
    v26 = objc_alloc_init(NTK_PUSelectionFeedbackGenerator);
    selectionFeedbackGenerator = self->_selectionFeedbackGenerator;
    self->_selectionFeedbackGenerator = v26;
  }
  [(NTK_PUAdjustmentsViewController *)self setDidPerformHapticFeedback:1];
  id v28 = objc_msgSend(objc_alloc((Class)CEKBadgeTextView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  [(NTK_PUAdjustmentsViewController *)self setBadgeView:v28];

  v29 = [(NTK_PUAdjustmentsViewController *)self badgeView];
  [v29 setUserInteractionEnabled:0];

  v30 = +[PUPhotoEditProtoSettings sharedInstance];
  [v30 adjustmentLabelPlatterAlpha];
  v32 = +[UIColor colorWithWhite:0.0 alpha:v31];
  v33 = [(NTK_PUAdjustmentsViewController *)self badgeView];
  [v33 _setFillColor:v32];

  v34 = +[UIColor colorWithWhite:1.0 alpha:1.0];
  v35 = [(NTK_PUAdjustmentsViewController *)self badgeView];
  [v35 _setContentColor:v34];

  v36 = [(NTK_PUAdjustmentsViewController *)self badgeView];
  [v36 _setFillCornerRadius:4.0];

  +[CEKBadgeTextView _defaultTextInsets];
  double v38 = v37 + 3.0;
  double v40 = v39 + 3.0;
  double v42 = v41 + 1.0;
  double v44 = v43 + 1.0;
  v45 = [(NTK_PUAdjustmentsViewController *)self badgeView];
  objc_msgSend(v45, "_setTextInsets:", v44, v38, v42, v40);

  v46 = [(NTK_PUAdjustmentsViewController *)self view];
  v47 = [(NTK_PUAdjustmentsViewController *)self badgeView];
  [v46 addSubview:v47];
}

- (int64_t)preferredUserInterfaceStyle
{
  return 2;
}

- (double)ntk_controlHeight
{
  return 51.0;
}

- (void)_updateViewLayout
{
  v3 = [(NTK_PUAdjustmentsViewController *)self view];
  [v3 bounds];
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  double v9 = v8;
  double v11 = v10;

  [(NTK_PUAdjustmentsViewController *)self ntk_controlHeight];
  double v13 = v12;
  int64_t v14 = [(NTK_PUAdjustmentsViewController *)self layoutDirection];
  uint64_t v15 = v5;
  uint64_t v16 = v7;
  double v17 = v9;
  double v18 = v11;
  if (v14)
  {
    CGFloat v19 = CGRectGetMaxX(*(CGRect *)&v15) - v13;
    v20 = [(NTK_PUAdjustmentsViewController *)self collectionView];
    objc_msgSend(v20, "setFrame:", v19, 0.0, v13, v11);

    double v21 = v11 * 0.5;
    [(NTK_PUAdjustmentsViewController *)self controlSize];
    double v23 = v21 - v22 * 0.5;
    [(NTK_PUAdjustmentsViewController *)self controlSize];
    double v25 = v21 - v24 * 0.5;
    v26 = [(NTK_PUAdjustmentsViewController *)self collectionView];
    v27 = v26;
    double v28 = 0.0;
    double v29 = 0.0;
    double v30 = v23;
    double v31 = v25;
  }
  else
  {
    CGFloat v32 = CGRectGetMaxY(*(CGRect *)&v15) - v13;
    v33 = [(NTK_PUAdjustmentsViewController *)self collectionView];
    objc_msgSend(v33, "setFrame:", 0.0, v32, v9, v13);

    double v34 = v9 * 0.5;
    [(NTK_PUAdjustmentsViewController *)self controlSize];
    double v36 = v9 * 0.5 - v35 * 0.5;
    [(NTK_PUAdjustmentsViewController *)self controlSize];
    double v38 = v34 - v37 * 0.5;
    v26 = [(NTK_PUAdjustmentsViewController *)self collectionView];
    v27 = v26;
    double v30 = 0.0;
    double v31 = 0.0;
    double v28 = v36;
    double v29 = v38;
  }
  objc_msgSend(v26, "setContentInset:", v30, v28, v31, v29);

  [(NTK_PUAdjustmentsViewController *)self _updateBadgeLayout];
}

- (void)_updateBadgeLayout
{
  v3 = [(NTK_PUAdjustmentsViewController *)self collectionView];
  [v3 frame];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  v19.origin.x = v5;
  v19.origin.double y = v7;
  v19.size.double width = v9;
  v19.size.double height = v11;
  double MinY = CGRectGetMinY(v19);
  double v13 = [(NTK_PUAdjustmentsViewController *)self view];
  [v13 bounds];
  CGFloat v14 = CGRectGetWidth(v20) * 0.5;

  id v17 = [(NTK_PUAdjustmentsViewController *)self badgeView];
  [v17 bounds];
  double v15 = MinY + -12.0 - CGRectGetHeight(v21) * 0.5;
  uint64_t v16 = [(NTK_PUAdjustmentsViewController *)self badgeView];
  objc_msgSend(v16, "setCenter:", v14, v15);
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)NTK_PUAdjustmentsViewController;
  [(NTK_PUAdjustmentsViewController *)&v3 viewDidLayoutSubviews];
  [(NTK_PUAdjustmentsViewController *)self _updateViewLayout];
  [(NTK_PUAdjustmentsViewController *)self _scrollToSelectedIndexPath];
}

- (void)_scrollToSelectedIndexPath
{
  objc_super v3 = [(NTK_PUAdjustmentsViewController *)self selectedIndexPath];

  if (v3)
  {
    if ([(NTK_PUAdjustmentsViewController *)self layoutDirection]) {
      uint64_t v4 = 2;
    }
    else {
      uint64_t v4 = 16;
    }
    CGFloat v5 = [(NTK_PUAdjustmentsViewController *)self collectionView];
    double v6 = [(NTK_PUAdjustmentsViewController *)self selectedIndexPath];
    [v5 selectItemAtIndexPath:v6 animated:0 scrollPosition:0];

    id v8 = [(NTK_PUAdjustmentsViewController *)self collectionView];
    CGFloat v7 = [(NTK_PUAdjustmentsViewController *)self selectedIndexPath];
    [v8 scrollToItemAtIndexPath:v7 atScrollPosition:v4 animated:0];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NTK_PUAdjustmentsViewController;
  [(NTK_PUAdjustmentsViewController *)&v8 viewDidAppear:a3];
  uint64_t v4 = [(NTK_PUAdjustmentsViewController *)self selectedIndexPath];

  if (!v4)
  {
    CGFloat v5 = [(NTK_PUAdjustmentsViewController *)self collectionViewLayout];
    double v6 = [(NTK_PUAdjustmentsViewController *)self collectionView];
    [v6 bounds];
    UIRectGetCenter();
    CGFloat v7 = objc_msgSend(v5, "nearestIndexPathForVisibleItemAtPoint:");
    [(NTK_PUAdjustmentsViewController *)self setSelectedIndexPath:v7];

    [(NTK_PUAdjustmentsViewController *)self _scrollToSelectedIndexPath];
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v11.receiver = self;
  v11.super_class = (Class)NTK_PUAdjustmentsViewController;
  id v7 = a4;
  -[NTK_PUAdjustmentsViewController viewWillTransitionToSize:withTransitionCoordinator:](&v11, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  objc_super v8 = [(NTK_PUAdjustmentsViewController *)self collectionView];
  CGFloat v9 = [v8 collectionViewLayout];
  [v9 invalidateLayout];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1275C;
  v10[3] = &unk_49008;
  v10[4] = self;
  [v7 animateAlongsideTransition:v10 completion:0];
}

- (void)_updateCollectionViewLayoutDirection:(int64_t)a3
{
  BOOL v4 = a3 == 0;
  CGFloat v5 = [(NTK_PUAdjustmentsViewController *)self collectionViewLayout];
  [v5 setScrollDirection:v4];

  id v6 = [(NTK_PUAdjustmentsViewController *)self collectionViewLayout];
  [v6 invalidateLayout];
}

- (void)setLayoutDirection:(int64_t)a3
{
  if (self->_layoutDirection != a3)
  {
    self->_layoutDirection = a3;
    [(NTK_PUAdjustmentsViewController *)self _updateCollectionViewLayoutDirection:"_updateCollectionViewLayoutDirection:"];
  }
}

- (void)_updateSelectedInfo
{
  objc_super v3 = [(NTK_PUAdjustmentsViewController *)self dataSource];
  BOOL v4 = [(NTK_PUAdjustmentsViewController *)self selectedIndexPath];
  id obj = [v3 infoForItemAtIndexPath:v4];

  id v6 = obj;
  if (obj)
  {
    objc_storeStrong((id *)&self->_selectedAdjustmentInfo, obj);
    id v7 = [(NTK_PUAdjustmentInfo *)self->_selectedAdjustmentInfo localizedName];
    objc_super v8 = [v7 localizedUppercaseString];
    CGFloat v9 = [(NTK_PUAdjustmentsViewController *)self badgeView];
    [v9 _setText:v8];

    double v10 = [(NTK_PUAdjustmentsViewController *)self badgeView];
    [v10 sizeToFit];

    [(NTK_PUAdjustmentsViewController *)self _updateBadgeLayout];
    objc_super v11 = [(NTK_PUAdjustmentsViewController *)self delegate];

    if (v11)
    {
      double v12 = [(NTK_PUAdjustmentsViewController *)self delegate];
      [v12 adjustmentsViewControllerDidUpdateSelectedControl:self];
    }
    id v6 = obj;
  }

  _objc_release_x1(v5, v6);
}

- (void)ntk_setSelectedIndexPath:(id)a3
{
  id v4 = a3;
  if ([(NTK_PUAdjustmentsViewController *)self layoutDirection]) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 16;
  }
  [(NTK_PUAdjustmentsViewController *)self setSelectedIndexPath:v4];
  id v6 = [(NTK_PUAdjustmentsViewController *)self collectionView];
  [v6 scrollToItemAtIndexPath:v4 atScrollPosition:v5 animated:0];
}

- (void)setSelectedIndexPath:(id)a3
{
  p_selectedIndexPath = &self->_selectedIndexPath;
  double v10 = (NSIndexPath *)a3;
  if (*p_selectedIndexPath != v10)
  {
    id v6 = [(NTK_PUAdjustmentsViewController *)self collectionView];
    id v7 = [v6 cellForItemAtIndexPath:*p_selectedIndexPath];

    [v7 setIsUserModifying:0];
    [v7 setSelected:0];
    objc_super v8 = [(NTK_PUAdjustmentsViewController *)self collectionView];
    CGFloat v9 = [v8 cellForItemAtIndexPath:v10];

    [v9 setSelected:1];
    objc_storeStrong((id *)&self->_selectedIndexPath, a3);
    [(NTK_PUAdjustmentsViewController *)self _updateSelectedInfo];
  }
}

- (void)_resetControlsAtIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NTK_PUAdjustmentsViewController *)self collectionView];
  id v6 = [v5 cellForItemAtIndexPath:v4];

  [v6 resetToDefault];
}

- (BOOL)canToggleCell:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NTK_PUAdjustmentsViewController *)self dataSource];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(NTK_PUAdjustmentsViewController *)self dataSource];
    objc_super v8 = [(NTK_PUAdjustmentsViewController *)self collectionView];
    CGFloat v9 = [v8 indexPathForCell:v4];
    unsigned __int8 v10 = [v7 canModifyAdjustmentAtIndexPath:v9];
  }
  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (void)didToggleCell:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NTK_PUAdjustmentsViewController *)self collectionView];
  char v6 = [v5 indexPathForCell:v4];

  id v7 = [(NTK_PUAdjustmentsViewController *)self dataSource];
  id v8 = [v4 isEnabled];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_12D9C;
  v11[3] = &unk_49030;
  v11[4] = self;
  id v12 = v6;
  id v13 = v4;
  id v9 = v4;
  id v10 = v6;
  [v7 setAdjustmentEnabled:v8 atIndexPath:v10 completionHandler:v11];
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (a5)
  {
    if (a5 < 1)
    {
      double bottom = UIEdgeInsetsZero.bottom;
      double right = UIEdgeInsetsZero.right;
      double top = UIEdgeInsetsZero.top;
      double left = UIEdgeInsetsZero.left;
    }
    else
    {
      int64_t v10 = [(NTK_PUAdjustmentsViewController *)self layoutDirection];
      if (v10) {
        double right = 0.0;
      }
      else {
        double right = 10.0;
      }
      if (v10) {
        double bottom = 10.0;
      }
      else {
        double bottom = 0.0;
      }
      if (v10) {
        double left = 0.0;
      }
      else {
        double left = 10.0;
      }
      if (v10) {
        double top = 10.0;
      }
      else {
        double top = 0.0;
      }
    }
  }
  else
  {
    int64_t v15 = [(NTK_PUAdjustmentsViewController *)self layoutDirection];
    double left = 0.0;
    if (v15) {
      double right = 0.0;
    }
    else {
      double right = 10.0;
    }
    if (v15) {
      double bottom = 10.0;
    }
    else {
      double bottom = 0.0;
    }
    double top = 0.0;
  }

  double v16 = top;
  double v17 = left;
  double v18 = bottom;
  double v19 = right;
  result.double right = v19;
  result.double bottom = v18;
  result.double left = v17;
  result.double top = v16;
  return result;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(NTK_PUAdjustmentsViewController *)self selectedIndexPath];

  if (v6 != v5)
  {
    [(NTK_PUAdjustmentsViewController *)self setSelectedIndexPath:v5];
    [(NTK_PUAdjustmentsViewController *)self setIsAnimatingScroll:1];
    if ([(NTK_PUAdjustmentsViewController *)self layoutDirection]) {
      uint64_t v7 = 2;
    }
    else {
      uint64_t v7 = 16;
    }
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1303C;
    v9[3] = &unk_49058;
    v9[4] = self;
    id v10 = v5;
    uint64_t v11 = v7;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_13094;
    v8[3] = &unk_49080;
    v8[4] = self;
    +[UIView animateWithDuration:v9 animations:v8 completion:0.25];
  }
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6 = [(NTK_PUAdjustmentsViewController *)self dataSource];

  if (!v6) {
    return 0;
  }
  uint64_t v7 = [(NTK_PUAdjustmentsViewController *)self dataSource];
  id v8 = [v7 numberOfItemsInSection:a4];

  return (int64_t)v8;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  id v4 = [(NTK_PUAdjustmentsViewController *)self dataSource];

  if (!v4) {
    return 0;
  }
  id v5 = [(NTK_PUAdjustmentsViewController *)self dataSource];
  id v6 = [v5 numberOfSections];

  return (int64_t)v6;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NTK_PUAdjustmentsViewController *)self dataSource];
  id v9 = [v8 infoForItemAtIndexPath:v6];

  id v10 = [v7 dequeueReusableCellWithReuseIdentifier:@"NTK_PUEditAdjustmentsCellReuseIdentifier" forIndexPath:v6];

  [v10 setDelegate:self];
  objc_msgSend(v10, "setShouldDisplayValueLabel:", -[NTK_PUAdjustmentsViewController shouldDisplayControlValues](self, "shouldDisplayControlValues"));
  objc_msgSend(v10, "setDisplayMappedValue:", -[NTK_PUAdjustmentsViewController shouldDisplayMappedValues](self, "shouldDisplayMappedValues"));
  [(NTK_PUAdjustmentsViewController *)self _updateCell:v10 withInfo:v9];

  return v10;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v10 = a4;
  id v7 = a5;
  id v8 = [(NTK_PUAdjustmentsViewController *)self dataSource];
  id v9 = [v8 infoForItemAtIndexPath:v7];

  [(NTK_PUAdjustmentsViewController *)self _updateCell:v10 withInfo:v9];
}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  return 1;
}

- (id)_circularImageWithSize:(CGSize)a3 color:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v6 = a4;
  id v7 = objc_msgSend(objc_alloc((Class)UIGraphicsImageRenderer), "initWithSize:", width, height);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_133D8;
  v11[3] = &unk_490A8;
  id v12 = v6;
  double v13 = width;
  double v14 = height;
  id v8 = v6;
  id v9 = [v7 imageWithActions:v11];

  return v9;
}

- (void)_setupCellBackgroundImagesIfNeeded
{
  if (!self->_itemBackgroundImage)
  {
    objc_super v3 = +[UIColor systemBackgroundColor];
    id v4 = [v3 colorWithAlphaComponent:0.3];

    -[NTK_PUAdjustmentsViewController _circularImageWithSize:color:](self, "_circularImageWithSize:color:", v4, 51.0, 51.0);
    id v5 = (UIImage *)objc_claimAutoreleasedReturnValue();
    itemBackgroundImage = self->_itemBackgroundImage;
    self->_itemBackgroundImage = v5;
  }
  if (!self->_selectedItemBackgroundImage)
  {
    id v7 = +[UIColor systemBackgroundColor];
    id v10 = [v7 colorWithAlphaComponent:0.9];

    -[NTK_PUAdjustmentsViewController _circularImageWithSize:color:](self, "_circularImageWithSize:color:", v10, 53.0, 53.0);
    id v8 = (UIImage *)objc_claimAutoreleasedReturnValue();
    selectedItemBackgroundImage = self->_selectedItemBackgroundImage;
    self->_selectedItemBackgroundImage = v8;
  }
}

- (id)_backgroundImageForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  [(NTK_PUAdjustmentsViewController *)self _setupCellBackgroundImagesIfNeeded];
  id v5 = [(NTK_PUAdjustmentsViewController *)self selectedIndexPath];

  id v6 = &OBJC_IVAR___NTK_PUAdjustmentsViewController__itemBackgroundImage;
  if (v5 == v4) {
    id v6 = &OBJC_IVAR___NTK_PUAdjustmentsViewController__selectedItemBackgroundImage;
  }
  id v7 = *(id *)((char *)&self->super.super.super.isa + *v6);

  return v7;
}

- (void)_updateCell:(id)a3 withInfo:(id)a4
{
  if (a3 && a4)
  {
    id v5 = a4;
    id v10 = a3;
    id v6 = [v5 iconName];
    [v10 setImageName:v6];

    id v7 = objc_msgSend(v5, "ntk_icon");
    objc_msgSend(v10, "ntk_setImage:", v7);

    objc_msgSend(v10, "setEnabled:", objc_msgSend(v5, "enabled"));
    [v5 minimumLevel];
    objc_msgSend(v10, "setMinValue:");
    [v5 maximumLevel];
    objc_msgSend(v10, "setMaxValue:");
    [v5 defaultLevel];
    objc_msgSend(v10, "setDefaultValue:");
    [v5 identityLevel];
    objc_msgSend(v10, "setIdentityValue:");
    [v5 currentLevel];
    double v9 = v8;

    [v10 setValue:v9];
  }
}

- (void)updateControls
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  objc_super v3 = [(NTK_PUAdjustmentsViewController *)self collectionView];
  id v4 = [v3 indexPathsForVisibleItems];

  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      double v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v15 + 1) + 8 * (void)v8);
        id v10 = [(NTK_PUAdjustmentsViewController *)self selectedIndexPath];

        if (v9 != v10)
        {
          uint64_t v11 = [(NTK_PUAdjustmentsViewController *)self dataSource];
          id v12 = [v11 infoForItemAtIndexPath:v9];

          double v13 = [(NTK_PUAdjustmentsViewController *)self collectionView];
          double v14 = [v13 cellForItemAtIndexPath:v9];

          [(NTK_PUAdjustmentsViewController *)self _updateCell:v14 withInfo:v12];
        }
        double v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
}

- (void)sliderValueChanged:(id)a3
{
  if (![(NTK_PUAdjustmentsViewController *)self isAnimatingScroll])
  {
    id v4 = [(NTK_PUAdjustmentsViewController *)self collectionView];
    id v5 = [(NTK_PUAdjustmentsViewController *)self selectedIndexPath];
    id v6 = [v4 cellForItemAtIndexPath:v5];

    if (([v6 isEnabled] & 1) == 0) {
      [v6 setEnabled:1];
    }
    [v6 setIsUserModifying:1];
  }
}

- (void)sliderWillBeginScrolling:(id)a3
{
  self->_sliderIsScrubbing = 1;
  id v4 = [(NTK_PUAdjustmentsViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(NTK_PUAdjustmentsViewController *)self delegate];
    [v6 adjustmentsViewControllerSliderWillBeginScrubbing:self];
  }
  snappingController = self->_snappingController;

  [(PXUISnappingController *)snappingController interactionBegan];
}

- (void)slider:(id)a3 willUpdateValue:(double *)a4 withVelocity:(double)a5
{
}

- (void)_sliderDidEndScrolling
{
  self->_sliderIsScrubbing = 0;
  objc_super v3 = [(NTK_PUAdjustmentsViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    char v5 = [(NTK_PUAdjustmentsViewController *)self delegate];
    [v5 adjustmentsViewControllerSliderDidEndScrubbing:self];
  }
  snappingController = self->_snappingController;

  [(PXUISnappingController *)snappingController interactionEnded];
}

- (void)sliderWillEndScrolling:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  if (a4.x == 0.0) {
    [(NTK_PUAdjustmentsViewController *)self _sliderDidEndScrolling];
  }
}

- (void)sliderDidEndScrolling:(id)a3
{
}

- (void)_performFeedbackIfNeeded
{
  if (![(NTK_PUAdjustmentsViewController *)self didPerformHapticFeedback])
  {
    objc_super v3 = [(NTK_PUAdjustmentsViewController *)self selectionFeedbackGenerator];
    [v3 performFeedback];

    [(NTK_PUAdjustmentsViewController *)self setDidPerformHapticFeedback:1];
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v27 = a3;
  if (![(NTK_PUAdjustmentsViewController *)self isAnimatingScroll]
    && (([v27 isTracking] & 1) != 0 || objc_msgSend(v27, "isDecelerating")))
  {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    CFAbsoluteTime v5 = Current - self->_previousTimeStamp;
    [v27 contentOffset];
    double v7 = fabs((v6 - self->_lastOffset.x) / v5) / 100.0;
    [v27 contentOffset];
    self->_lastOffset.x = v8;
    self->_lastOffset.double y = v9;
    self->_previousTimeStamp = Current;
    id v10 = [(NTK_PUAdjustmentsViewController *)self collectionViewLayout];
    [v27 bounds];
    PXRectGetCenter();
    uint64_t v11 = objc_msgSend(v10, "nearestIndexPathForVisibleItemAtPoint:");

    id v12 = [(NTK_PUAdjustmentsViewController *)self selectedIndexPath];

    if (v11 != v12)
    {
      [(NTK_PUAdjustmentsViewController *)self setSelectedIndexPath:v11];
      [(NTK_PUAdjustmentsViewController *)self setDidPerformHapticFeedback:0];
      if (v7 > 15.0) {
        [(NTK_PUAdjustmentsViewController *)self _performFeedbackIfNeeded];
      }
    }
    [v27 bounds];
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGRect v21 = [(NTK_PUAdjustmentsViewController *)self collectionView];
    double v22 = [(NTK_PUAdjustmentsViewController *)self selectedIndexPath];
    double v23 = [v21 layoutAttributesForItemAtIndexPath:v22];

    [v23 frame];
    double MidX = CGRectGetMidX(v29);
    v30.origin.x = v14;
    v30.origin.double y = v16;
    v30.size.double width = v18;
    v30.size.double height = v20;
    double v25 = vabdd_f64(MidX, CGRectGetMidX(v30));
    if (v7 < 15.0 && v25 < 6.0) {
      [(NTK_PUAdjustmentsViewController *)self _performFeedbackIfNeeded];
    }
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  char v4 = [(NTK_PUAdjustmentsViewController *)self selectionFeedbackGenerator];
  [v4 prepareFeedback];

  CFAbsoluteTime v5 = [(NTK_PUAdjustmentsViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(NTK_PUAdjustmentsViewController *)self delegate];
    [v7 adjustmentsViewControllerToolWillBeginScrubbing:self];
  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  CFAbsoluteTime v5 = [(NTK_PUAdjustmentsViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(NTK_PUAdjustmentsViewController *)self delegate];
    [v7 adjustmentsViewControllerToolDidEndScrubbing:self];
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  if (([a3 isDragging] & 1) == 0)
  {
    id v5 = [(NTK_PUAdjustmentsViewController *)self collectionView];
    char v4 = [(NTK_PUAdjustmentsViewController *)self selectedIndexPath];
    [v5 selectItemAtIndexPath:v4 animated:0 scrollPosition:0];
  }
}

- (NTK_PUAdjustmentsViewDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (NTK_PUAdjustmentsViewDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (NTK_PUAdjustmentViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NTK_PUAdjustmentViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (BOOL)shouldDisplayControlValues
{
  return self->_shouldDisplayControlValues;
}

- (void)setShouldDisplayControlValues:(BOOL)a3
{
  self->_shouldDisplayControlValues = a3;
}

- (BOOL)shouldDisplayMappedValues
{
  return self->_shouldDisplayMappedValues;
}

- (void)setShouldDisplayMappedValues:(BOOL)a3
{
  self->_shouldDisplayMappedValues = a3;
}

- (NTK_PUAdjustmentInfo)selectedAdjustmentInfo
{
  return self->_selectedAdjustmentInfo;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (CEKBadgeTextView)badgeView
{
  return self->_badgeView;
}

- (void)setBadgeView:(id)a3
{
}

- (NTK_PUAdjustmentsViewFlowLayout)collectionViewLayout
{
  return self->_collectionViewLayout;
}

- (void)setCollectionViewLayout:(id)a3
{
}

- (NSIndexPath)selectedIndexPath
{
  return self->_selectedIndexPath;
}

- (CGSize)controlSize
{
  double width = self->_controlSize.width;
  double height = self->_controlSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setControlSize:(CGSize)a3
{
  self->_controlSize = a3;
}

- (BOOL)didSetupControls
{
  return self->_didSetupControls;
}

- (void)setDidSetupControls:(BOOL)a3
{
  self->_didSetupControls = a3;
}

- (BOOL)isAnimatingScroll
{
  return self->_isAnimatingScroll;
}

- (void)setIsAnimatingScroll:(BOOL)a3
{
  self->_isAnimatingScroll = a3;
}

- (NTK_PUSelectionFeedbackGenerator)selectionFeedbackGenerator
{
  return self->_selectionFeedbackGenerator;
}

- (void)setSelectionFeedbackGenerator:(id)a3
{
}

- (BOOL)didPerformHapticFeedback
{
  return self->_didPerformHapticFeedback;
}

- (void)setDidPerformHapticFeedback:(BOOL)a3
{
  self->_didPerformHapticFeedback = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_selectedIndexPath, 0);
  objc_storeStrong((id *)&self->_collectionViewLayout, 0);
  objc_storeStrong((id *)&self->_badgeView, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_selectedAdjustmentInfo, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_snappingController, 0);
  objc_storeStrong((id *)&self->_itemBackgroundImage, 0);

  objc_storeStrong((id *)&self->_selectedItemBackgroundImage, 0);
}

@end