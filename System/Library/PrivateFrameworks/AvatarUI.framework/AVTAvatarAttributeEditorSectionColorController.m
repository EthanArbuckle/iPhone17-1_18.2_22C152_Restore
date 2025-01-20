@interface AVTAvatarAttributeEditorSectionColorController
+ (BOOL)supportsSelection;
+ (BOOL)updateCollectionViewLayout:(id)a3 containerSize:(CGSize)a4 environment:(id)a5 forExtended:(BOOL)a6 withSlider:(BOOL)a7 numberOfItems:(int64_t)a8;
+ (CGPoint)clampedContentOffsetForOffset:(CGPoint)a3 collectionView:(id)a4;
+ (CGSize)cellSizeFittingWidth:(double)a3 environment:(id)a4;
+ (double)edgeLengthFittingWidth:(double)a3 environment:(id)a4;
- (AVTAttributeEditorSectionHeaderView)headerView;
- (AVTAvatarAttributeEditorControllerSubSelectionDelegate)delegate;
- (AVTAvatarAttributeEditorSection)section;
- (AVTAvatarAttributeEditorSectionColorController)initWithDataSource:(id)a3 showsHeader:(BOOL)a4 environment:(id)a5;
- (AVTAvatarAttributeEditorSectionColorController)initWithEnvironment:(id)a3;
- (AVTAvatarAttributeEditorSectionColorController)initWithEnvironment:(id)a3 showsHeader:(BOOL)a4;
- (AVTAvatarAttributeEditorSectionColorDataSource)dataSource;
- (AVTAvatarColorSliderContainerView)sliderContainerView;
- (AVTUIEnvironment)environment;
- (BOOL)dontAnimateSelection;
- (BOOL)evaluateDisplayCondition:(id)a3;
- (BOOL)needsScrollToSelected;
- (BOOL)showsHeader;
- (CGSize)sizeForFocusingItemAtIndex:(int64_t)a3 fittingSize:(CGSize)a4;
- (CGSize)sizeForItemAtIndex:(int64_t)a3 fittingSize:(CGSize)a4;
- (UICollectionView)collectionView;
- (UICollectionViewFlowLayout)collectionViewLayout;
- (UIEdgeInsets)edgeInsetsFittingSize:(CGSize)a3;
- (UIView)containerView;
- (UIView)sectionView;
- (double)currentRelativeContentOffsetX;
- (double)heightForCollectionViewFittingWidth:(double)a3;
- (double)heightForSectionHeaderFittingWidth:(double)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)prefetchingSectionItemForIndex:(int64_t)a3;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfItems;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (int64_t)selectedIndex;
- (unint64_t)indexForItem:(id)a3;
- (void)animateWithSpringAnimations:(id)a3 completion:(id)a4;
- (void)attributeEditorSectionController:(id)a3 didDeleteSectionItems:(id)a4;
- (void)attributeEditorSectionController:(id)a3 didSelectSectionItem:(id)a4;
- (void)attributeEditorSectionController:(id)a3 didUpdateSectionItem:(id)a4;
- (void)attributeEditorSectionControllerNeedsLayoutUpdate:(id)a3;
- (void)cell:(id)a3 willDisplayAtIndex:(int64_t)a4;
- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)colorDataSource:(id)a3 didChangeDisplayMode:(int64_t)a4 previousDisplayMode:(int64_t)a5;
- (void)colorDataSource:(id)a3 didDeselectItemAtIndex:(int64_t)a4 shouldReloadModel:(BOOL)a5;
- (void)colorDataSource:(id)a3 didSelectItemAtIndex:(int64_t)a4 shouldReloadModel:(BOOL)a5;
- (void)colorSliderDidFinishChangingVariation:(double)a3 forItem:(id)a4;
- (void)colorSliderVariationChanged:(double)a3 forItem:(id)a4;
- (void)createCollectionView;
- (void)createSliderContainerView;
- (void)hideSliderAnimated:(BOOL)a3;
- (void)invalidateLayoutForNewContainerSize:(CGSize)a3;
- (void)layoutSubviewsForIndex:(int64_t)a3;
- (void)reloadData;
- (void)resetToDefaultState;
- (void)scrollCollectionViewToOrigin;
- (void)scrollCollectionViewToSelectedColor;
- (void)selectIndexPath:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setCollectionViewLayout:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setCurrentRelativeContentOffsetX:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setDontAnimateSelection:(BOOL)a3;
- (void)setHeaderView:(id)a3;
- (void)setNeedsScrollToSelected:(BOOL)a3;
- (void)setSelectedIndex:(int64_t)a3;
- (void)setSelectedState:(BOOL)a3 animated:(BOOL)a4 forCellAtIndexPath:(id)a5;
- (void)setSliderContainerView:(id)a3;
- (void)showSliderAnimated:(BOOL)a3;
- (void)updateCell:(id)a3 forItemAtIndex:(int64_t)a4;
- (void)updateCellLayer:(id)a3 withColorItem:(id)a4 withColorPreset:(id)a5;
- (void)updateCollectionViewLayoutWithContainerSize:(CGSize)a3;
- (void)updateSectionItem:(id)a3 withVariation:(double)a4;
- (void)updateSliderForSectionItemIfNeeded:(id)a3;
- (void)updateWithSection:(id)a3;
- (void)willDisplayViewForIndex:(int64_t)a3;
@end

@implementation AVTAvatarAttributeEditorSectionColorController

+ (BOOL)supportsSelection
{
  return 0;
}

+ (double)edgeLengthFittingWidth:(double)a3 environment:(id)a4
{
  id v5 = a4;
  char v6 = [v5 deviceIsPad];
  double v7 = 400.0;
  if (a3 <= 400.0 || (double v7 = 12.0, (v6 & 1) == 0))
  {
    unsigned __int8 v8 = objc_msgSend(v5, "deviceIsMac", v7);
    double v7 = 6.0;
    if (((a3 > 300.0) & v8) != 0) {
      double v7 = 10.0;
    }
  }
  double v9 = floor((a3 + -24.0 + (v7 + -1.0) * -0.0) / v7);

  return v9;
}

+ (CGSize)cellSizeFittingWidth:(double)a3 environment:(id)a4
{
  [a1 edgeLengthFittingWidth:a4 environment:a3];
  double v5 = v4;
  result.height = v5;
  result.width = v4;
  return result;
}

+ (BOOL)updateCollectionViewLayout:(id)a3 containerSize:(CGSize)a4 environment:(id)a5 forExtended:(BOOL)a6 withSlider:(BOOL)a7 numberOfItems:(int64_t)a8
{
  BOOL v8 = a6;
  double width = a4.width;
  id v11 = a3;
  id v12 = a5;
  [v11 setMinimumInteritemSpacing:0.0];
  [(id)objc_opt_class() cellSizeFittingWidth:v12 environment:width];
  double v14 = v13;
  double v16 = v15;

  objc_msgSend(v11, "setItemSize:", v14, v16);
  uint64_t v17 = !v8;
  [v11 setMinimumLineSpacing:0.0];
  uint64_t v18 = [v11 scrollDirection];
  if (v18 != v17) {
    [v11 setScrollDirection:v17];
  }
  objc_msgSend(v11, "setSectionInset:", 12.0, 0.0, 12.0, 0.0);

  return v18 != v17;
}

+ (CGPoint)clampedContentOffsetForOffset:(CGPoint)a3 collectionView:(id)a4
{
  CGFloat y = a3.y;
  double x = a3.x;
  id v6 = a4;
  [v6 contentSize];
  double v8 = v7;
  [v6 contentInset];
  double v10 = v8 + v9;
  [v6 bounds];
  double v11 = v10 - CGRectGetWidth(v18);
  [v6 contentInset];
  double v13 = v12;

  double v14 = -v13;
  if (v11 >= x) {
    double v15 = x;
  }
  else {
    double v15 = v11;
  }
  if (v15 >= v14) {
    double v14 = v15;
  }
  double v16 = y;
  result.CGFloat y = v16;
  result.double x = v14;
  return result;
}

- (AVTAvatarAttributeEditorSectionColorController)initWithEnvironment:(id)a3
{
  return [(AVTAvatarAttributeEditorSectionColorController *)self initWithEnvironment:a3 showsHeader:0];
}

- (AVTAvatarAttributeEditorSectionColorController)initWithEnvironment:(id)a3 showsHeader:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double v7 = objc_alloc_init(AVTAvatarAttributeEditorSectionColorDataSource);
  double v8 = [(AVTAvatarAttributeEditorSectionColorController *)self initWithDataSource:v7 showsHeader:v4 environment:v6];

  return v8;
}

- (AVTAvatarAttributeEditorSectionColorController)initWithDataSource:(id)a3 showsHeader:(BOOL)a4 environment:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)AVTAvatarAttributeEditorSectionColorController;
  double v11 = [(AVTAvatarAttributeEditorSectionColorController *)&v14 init];
  double v12 = v11;
  if (v11)
  {
    v11->_needsScrollToSelected = 1;
    objc_storeStrong((id *)&v11->_dataSource, a3);
    [(AVTAvatarAttributeEditorSectionColorDataSource *)v12->_dataSource setDelegate:v12];
    objc_storeStrong((id *)&v12->_environment, a5);
    v12->_showsHeader = a4;
  }

  return v12;
}

- (UIView)sectionView
{
  v3 = [(AVTAvatarAttributeEditorSectionColorController *)self containerView];

  if (!v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F1CB60]);
    double v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [(AVTAvatarAttributeEditorSectionColorController *)self setContainerView:v5];

    id v6 = [MEMORY[0x263F1C550] clearColor];
    double v7 = [(AVTAvatarAttributeEditorSectionColorController *)self containerView];
    [v7 setBackgroundColor:v6];
  }
  double v8 = [(AVTAvatarAttributeEditorSectionColorController *)self collectionView];

  if (!v8) {
    [(AVTAvatarAttributeEditorSectionColorController *)self createCollectionView];
  }
  id v9 = [(AVTAvatarAttributeEditorSectionColorController *)self sliderContainerView];

  if (!v9) {
    [(AVTAvatarAttributeEditorSectionColorController *)self createSliderContainerView];
  }
  return [(AVTAvatarAttributeEditorSectionColorController *)self containerView];
}

- (int64_t)selectedIndex
{
  v2 = [(AVTAvatarAttributeEditorSectionColorController *)self dataSource];
  int64_t v3 = [v2 selectedItemIndex];

  return v3;
}

- (UIEdgeInsets)edgeInsetsFittingSize:(CGSize)a3
{
  double v3 = *MEMORY[0x263F1D1C0];
  double v4 = *(double *)(MEMORY[0x263F1D1C0] + 8);
  double v5 = *(double *)(MEMORY[0x263F1D1C0] + 16);
  double v6 = *(double *)(MEMORY[0x263F1D1C0] + 24);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (double)currentRelativeContentOffsetX
{
  double v3 = [(AVTAvatarAttributeEditorSectionColorController *)self collectionView];
  [v3 contentOffset];
  double v5 = v4;
  double v6 = [(AVTAvatarAttributeEditorSectionColorController *)self collectionView];
  [v6 contentInset];
  double v8 = v5 + v7;

  return v8;
}

- (void)setCurrentRelativeContentOffsetX:(double)a3
{
  double v5 = [(AVTAvatarAttributeEditorSectionColorController *)self collectionView];
  [v5 contentSize];
  double v7 = v6;
  double v8 = [(AVTAvatarAttributeEditorSectionColorController *)self collectionView];
  [v8 bounds];
  double Width = CGRectGetWidth(v30);
  id v10 = [(AVTAvatarAttributeEditorSectionColorController *)self collectionView];
  [v10 contentInset];
  double v12 = v11;
  double v13 = [(AVTAvatarAttributeEditorSectionColorController *)self collectionView];
  [v13 contentInset];
  double v15 = Width - (v12 + v14);

  double v16 = [(AVTAvatarAttributeEditorSectionColorController *)self collectionView];
  [v16 contentInset];
  double v18 = v17;

  v19 = [(AVTAvatarAttributeEditorSectionColorController *)self collectionView];
  [v19 contentOffset];
  double v21 = v20;

  if (v7 <= v15)
  {
    v23 = [(AVTAvatarAttributeEditorSectionColorController *)self collectionView];
    [v23 contentInset];
    double v25 = -v27;
  }
  else
  {
    v22 = objc_opt_class();
    v23 = [(AVTAvatarAttributeEditorSectionColorController *)self collectionView];
    objc_msgSend(v22, "clampedContentOffsetForOffset:collectionView:", v23, a3 - v18, v21);
    double v25 = v24;
    double v21 = v26;
  }

  id v28 = [(AVTAvatarAttributeEditorSectionColorController *)self collectionView];
  objc_msgSend(v28, "setContentOffset:", v25, v21);
}

- (void)createCollectionView
{
  if ([(AVTAvatarAttributeEditorSectionColorController *)self showsHeader])
  {
    double v3 = [AVTAttributeEditorSectionHeaderView alloc];
    double v4 = [(AVTAvatarAttributeEditorSectionColorController *)self containerView];
    [v4 bounds];
    double v5 = -[AVTAttributeEditorSectionHeaderView initWithFrame:](v3, "initWithFrame:", 0.0, 0.0, CGRectGetWidth(v47), 40.0);
    [(AVTAvatarAttributeEditorSectionColorController *)self setHeaderView:v5];

    double v6 = [(AVTAvatarAttributeEditorSectionColorController *)self dataSource];
    double v7 = [v6 colorSection];
    double v8 = [v7 localizedName];
    id v9 = [(AVTAvatarAttributeEditorSectionColorController *)self headerView];
    [v9 setDisplayString:v8];

    id v10 = [(AVTAvatarAttributeEditorSectionColorController *)self containerView];
    double v11 = [(AVTAvatarAttributeEditorSectionColorController *)self headerView];
    [v10 addSubview:v11];

    double v12 = [(AVTAvatarAttributeEditorSectionColorController *)self headerView];
    [v12 setAutoresizingMask:34];
  }
  id v13 = objc_alloc(MEMORY[0x263F1C4E0]);
  double v14 = [(AVTAvatarAttributeEditorSectionColorController *)self containerView];
  [v14 bounds];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  v23 = [(AVTAvatarAttributeEditorSectionColorController *)self collectionViewLayout];
  double v24 = objc_msgSend(v13, "initWithFrame:collectionViewLayout:", v23, v16, v18, v20, v22);
  [(AVTAvatarAttributeEditorSectionColorController *)self setCollectionView:v24];

  double v25 = [(AVTAvatarAttributeEditorSectionColorController *)self collectionView];
  [v25 setDataSource:self];

  double v26 = [(AVTAvatarAttributeEditorSectionColorController *)self collectionView];
  [v26 setDelegate:self];

  double v27 = [MEMORY[0x263F1C550] clearColor];
  id v28 = [(AVTAvatarAttributeEditorSectionColorController *)self collectionView];
  [v28 setBackgroundColor:v27];

  v29 = [(AVTAvatarAttributeEditorSectionColorController *)self collectionView];
  [v29 setShowsHorizontalScrollIndicator:0];

  CGRect v30 = [(AVTAvatarAttributeEditorSectionColorController *)self collectionView];
  [v30 setAutoresizingMask:2];

  v31 = [(AVTAvatarAttributeEditorSectionColorController *)self collectionView];
  [v31 _setAutomaticContentOffsetAdjustmentEnabled:0];

  v32 = [(AVTAvatarAttributeEditorSectionColorController *)self collectionView];
  uint64_t v33 = objc_opt_class();
  v34 = (objc_class *)objc_opt_class();
  v35 = NSStringFromClass(v34);
  [v32 registerClass:v33 forCellWithReuseIdentifier:v35];

  v36 = [(AVTAvatarAttributeEditorSectionColorController *)self collectionView];
  uint64_t v37 = objc_opt_class();
  v38 = (objc_class *)objc_opt_class();
  v39 = NSStringFromClass(v38);
  [v36 registerClass:v37 forCellWithReuseIdentifier:v39];

  v40 = [(AVTAvatarAttributeEditorSectionColorController *)self collectionView];
  uint64_t v41 = objc_opt_class();
  v42 = (objc_class *)objc_opt_class();
  v43 = NSStringFromClass(v42);
  [v40 registerClass:v41 forCellWithReuseIdentifier:v43];

  id v45 = [(AVTAvatarAttributeEditorSectionColorController *)self containerView];
  v44 = [(AVTAvatarAttributeEditorSectionColorController *)self collectionView];
  [v45 addSubview:v44];
}

- (UICollectionViewFlowLayout)collectionViewLayout
{
  collectionViewLayout = self->_collectionViewLayout;
  if (!collectionViewLayout)
  {
    double v4 = objc_alloc_init(AVTFlippingCollectionViewFlowLayout);
    double v5 = self->_collectionViewLayout;
    self->_collectionViewLayout = &v4->super;

    collectionViewLayout = self->_collectionViewLayout;
  }
  return collectionViewLayout;
}

- (void)createSliderContainerView
{
  double v3 = [(AVTAvatarAttributeEditorSectionColorController *)self containerView];
  [v3 bounds];
  double v5 = v4;

  double v6 = [AVTAvatarColorSliderContainerView alloc];
  double v7 = [(AVTAvatarAttributeEditorSectionColorController *)self environment];
  double v8 = -[AVTAvatarColorSliderContainerView initWithFrame:userInterfaceLayoutDirection:](v6, "initWithFrame:userInterfaceLayoutDirection:", [v7 userInterfaceLayoutDirection], 0.0, 0.0, v5, 45.0);
  [(AVTAvatarAttributeEditorSectionColorController *)self setSliderContainerView:v8];

  id v9 = [(AVTAvatarAttributeEditorSectionColorController *)self sliderContainerView];
  [v9 setDelegate:self];

  id v10 = [(AVTAvatarAttributeEditorSectionColorController *)self sliderContainerView];
  [v10 setAutoresizingMask:10];

  double v11 = [(AVTAvatarAttributeEditorSectionColorController *)self sliderContainerView];
  [v11 setAlpha:0.0];

  id v13 = [(AVTAvatarAttributeEditorSectionColorController *)self containerView];
  double v12 = [(AVTAvatarAttributeEditorSectionColorController *)self sliderContainerView];
  [v13 addSubview:v12];
}

- (void)showSliderAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __69__AVTAvatarAttributeEditorSectionColorController_showSliderAnimated___block_invoke;
  v16[3] = &unk_263FF03D8;
  v16[4] = self;
  [MEMORY[0x263F1CB60] performWithoutAnimation:v16];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __69__AVTAvatarAttributeEditorSectionColorController_showSliderAnimated___block_invoke_2;
  v15[3] = &unk_263FF03D8;
  v15[4] = self;
  uint64_t v5 = MEMORY[0x210530210](v15);
  double v6 = (void *)v5;
  if (v3)
  {
    double v7 = [(AVTAvatarAttributeEditorSectionColorController *)self containerView];
    [v7 bounds];
    double Height = CGRectGetHeight(v17);
    id v9 = [(AVTAvatarAttributeEditorSectionColorController *)self sliderContainerView];
    [v9 frame];
    double v10 = Height - CGRectGetMinY(v18) + -6.0;

    CGAffineTransformMakeTranslation(&v14, 0.0, v10 + -20.0);
    double v11 = [(AVTAvatarAttributeEditorSectionColorController *)self sliderContainerView];
    CGAffineTransform v13 = v14;
    [v11 setTransform:&v13];

    double v12 = [(AVTAvatarAttributeEditorSectionColorController *)self sliderContainerView];
    [v12 setAlpha:0.0];

    [(AVTAvatarAttributeEditorSectionColorController *)self animateWithSpringAnimations:v6 completion:0];
  }
  else
  {
    (*(void (**)(uint64_t))(v5 + 16))(v5);
  }
}

void __69__AVTAvatarAttributeEditorSectionColorController_showSliderAnimated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) layoutSubviewsForIndex:0];
  id v2 = [*(id *)(a1 + 32) containerView];
  [v2 layoutIfNeeded];
}

void __69__AVTAvatarAttributeEditorSectionColorController_showSliderAnimated___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) sliderContainerView];
  [v2 setAlpha:1.0];

  BOOL v3 = [*(id *)(a1 + 32) sliderContainerView];
  long long v4 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v5[0] = *MEMORY[0x263F000D0];
  v5[1] = v4;
  v5[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [v3 setTransform:v5];
}

- (void)hideSliderAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __69__AVTAvatarAttributeEditorSectionColorController_hideSliderAnimated___block_invoke;
  v12[3] = &unk_263FF04A0;
  v12[4] = self;
  uint64_t v5 = MEMORY[0x210530210](v12, a2);
  double v6 = (void *)v5;
  if (v3)
  {
    double v7 = [(AVTAvatarAttributeEditorSectionColorController *)self containerView];
    [v7 bounds];
    double Height = CGRectGetHeight(v13);
    id v9 = [(AVTAvatarAttributeEditorSectionColorController *)self sliderContainerView];
    [v9 frame];
    double v10 = Height - CGRectGetMinY(v14) + -6.0;

    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __69__AVTAvatarAttributeEditorSectionColorController_hideSliderAnimated___block_invoke_2;
    v11[3] = &unk_263FF1CE8;
    v11[4] = self;
    *(double *)&v11[5] = v10;
    [(AVTAvatarAttributeEditorSectionColorController *)self animateWithSpringAnimations:v11 completion:v6];
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, 1);
  }
}

void __69__AVTAvatarAttributeEditorSectionColorController_hideSliderAnimated___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    BOOL v3 = [*(id *)(a1 + 32) sliderContainerView];
    [v3 setAlpha:0.0];

    long long v4 = [*(id *)(a1 + 32) sliderContainerView];
    long long v5 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    v6[0] = *MEMORY[0x263F000D0];
    v6[1] = v5;
    v6[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    [v4 setTransform:v6];
  }
}

void __69__AVTAvatarAttributeEditorSectionColorController_hideSliderAnimated___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) sliderContainerView];
  [v2 setAlpha:0.0];

  BOOL v3 = [*(id *)(a1 + 32) sliderContainerView];
  long long v4 = v3;
  if (v3) {
    [v3 transform];
  }
  else {
    memset(&v7, 0, sizeof(v7));
  }
  CGAffineTransformTranslate(&v8, &v7, 0.0, *(double *)(a1 + 40) + -20.0);
  long long v5 = [*(id *)(a1 + 32) sliderContainerView];
  CGAffineTransform v6 = v8;
  [v5 setTransform:&v6];
}

- (void)animateWithSpringAnimations:(id)a3 completion:(id)a4
{
}

- (void)updateCollectionViewLayoutWithContainerSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  CGAffineTransform v6 = [(AVTAvatarAttributeEditorSectionColorController *)self containerView];

  if (v6)
  {
    [(AVTAvatarAttributeEditorSectionColorController *)self layoutSubviewsForIndex:0];
    CGAffineTransform v7 = objc_opt_class();
    CGAffineTransform v8 = [(AVTAvatarAttributeEditorSectionColorController *)self collectionViewLayout];
    id v9 = [(AVTAvatarAttributeEditorSectionColorController *)self environment];
    double v10 = [(AVTAvatarAttributeEditorSectionColorController *)self dataSource];
    uint64_t v11 = [v10 isShowingExtended];
    double v12 = [(AVTAvatarAttributeEditorSectionColorController *)self dataSource];
    uint64_t v13 = [v12 isShowingSlider];
    CGRect v14 = [(AVTAvatarAttributeEditorSectionColorController *)self dataSource];
    LODWORD(v7) = objc_msgSend(v7, "updateCollectionViewLayout:containerSize:environment:forExtended:withSlider:numberOfItems:", v8, v9, v11, v13, objc_msgSend(v14, "numberOfItemsInSection:", 0), width, height);

    if (v7)
    {
      [(AVTAvatarAttributeEditorSectionColorController *)self scrollCollectionViewToOrigin];
    }
  }
}

- (void)scrollCollectionViewToSelectedColor
{
  if ([(AVTAvatarAttributeEditorSectionColorController *)self selectedIndex] != 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v3 = [(AVTAvatarAttributeEditorSectionColorController *)self selectedIndex];
    long long v4 = [(AVTAvatarAttributeEditorSectionColorController *)self collectionView];
    uint64_t v5 = [v4 numberOfItemsInSection:0];

    if (v3 < v5)
    {
      objc_msgSend(MEMORY[0x263F088C8], "indexPathForItem:inSection:", -[AVTAvatarAttributeEditorSectionColorController selectedIndex](self, "selectedIndex"), 0);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      CGAffineTransform v6 = [(AVTAvatarAttributeEditorSectionColorController *)self collectionView];
      [v6 scrollToItemAtIndexPath:v7 atScrollPosition:16 animated:0];
    }
  }
}

- (void)scrollCollectionViewToOrigin
{
  id v6 = [(AVTAvatarAttributeEditorSectionColorController *)self collectionView];
  [v6 contentInset];
  double v4 = -v3;
  uint64_t v5 = [(AVTAvatarAttributeEditorSectionColorController *)self collectionView];
  objc_msgSend(v5, "setContentOffset:", v4, 0.0);
}

- (void)reloadData
{
  double v3 = [(AVTAvatarAttributeEditorSectionColorController *)self containerView];

  if (v3)
  {
    double v4 = objc_opt_class();
    uint64_t v5 = [(AVTAvatarAttributeEditorSectionColorController *)self collectionViewLayout];
    id v6 = [(AVTAvatarAttributeEditorSectionColorController *)self containerView];
    [v6 bounds];
    double v8 = v7;
    double v10 = v9;
    uint64_t v11 = [(AVTAvatarAttributeEditorSectionColorController *)self environment];
    double v12 = [(AVTAvatarAttributeEditorSectionColorController *)self dataSource];
    uint64_t v13 = [v12 isShowingExtended];
    CGRect v14 = [(AVTAvatarAttributeEditorSectionColorController *)self dataSource];
    uint64_t v15 = [v14 isShowingSlider];
    double v16 = [(AVTAvatarAttributeEditorSectionColorController *)self dataSource];
    objc_msgSend(v4, "updateCollectionViewLayout:containerSize:environment:forExtended:withSlider:numberOfItems:", v5, v11, v13, v15, objc_msgSend(v16, "numberOfItemsInSection:", 0), v8, v10);

    CGRect v17 = [(AVTAvatarAttributeEditorSectionColorController *)self collectionView];
    [v17 reloadData];

    id v18 = [(AVTAvatarAttributeEditorSectionColorController *)self collectionView];
    [v18 layoutIfNeeded];
  }
}

- (void)updateWithSection:(id)a3
{
  id v14 = a3;
  uint64_t v5 = [v14 identifier];
  id v6 = [(AVTAvatarAttributeEditorSection *)self->_section identifier];
  char v7 = [v5 isEqualToString:v6];

  if ((v7 & 1) == 0) {
    self->_needsScrollToSelected = 1;
  }
  objc_storeStrong((id *)&self->_section, a3);
  [(AVTAvatarAttributeEditorSectionColorController *)self setDontAnimateSelection:1];
  int64_t v8 = [(AVTAvatarAttributeEditorSectionColorController *)self selectedIndex];
  double v9 = [(AVTAvatarAttributeEditorSectionColorController *)self dataSource];
  [v9 setColorSection:v14];

  if (v8 == [(AVTAvatarAttributeEditorSectionColorController *)self selectedIndex])
  {
    double v10 = [(AVTAvatarAttributeEditorSectionColorController *)self dataSource];
    uint64_t v11 = objc_msgSend(v10, "sectionItemAtIndex:", -[AVTAvatarAttributeEditorSectionColorController selectedIndex](self, "selectedIndex"));

    [(AVTAvatarAttributeEditorSectionColorController *)self updateSliderForSectionItemIfNeeded:v11];
  }
  [(AVTAvatarAttributeEditorSectionColorController *)self setDontAnimateSelection:0];
  double v12 = [v14 localizedName];
  uint64_t v13 = [(AVTAvatarAttributeEditorSectionColorController *)self headerView];
  [v13 setDisplayString:v12];
}

- (void)updateSliderForSectionItemIfNeeded:(id)a3
{
  id v15 = a3;
  double v4 = [(AVTAvatarAttributeEditorSectionColorController *)self dataSource];
  uint64_t v5 = [v4 isShowingSlider];

  id v6 = [v15 color];
  int v7 = [v6 canShowSlider];

  if (v7)
  {
    int64_t v8 = [(AVTAvatarAttributeEditorSectionColorController *)self sliderContainerView];
    [v8 setSectionItem:v15 animated:v5];

    double v9 = [(AVTAvatarAttributeEditorSectionColorController *)self dataSource];
    double v10 = [v9 colorSection];
    uint64_t v11 = [v10 colorVariationStore];
    double v12 = [v15 color];
    uint64_t v13 = [v11 colorPresetFromColor:v12];

    id v14 = [(AVTAvatarAttributeEditorSectionColorController *)self sliderContainerView];
    [v14 updateSliderWithColorPreset:v13 animated:v5];
  }
}

- (void)willDisplayViewForIndex:(int64_t)a3
{
  [(AVTAvatarAttributeEditorSectionColorController *)self layoutSubviewsForIndex:a3];
  [(AVTAvatarAttributeEditorSectionColorController *)self reloadData];
  if ([(AVTAvatarAttributeEditorSectionColorController *)self needsScrollToSelected])
  {
    [(AVTAvatarAttributeEditorSectionColorController *)self setNeedsScrollToSelected:0];
    [(AVTAvatarAttributeEditorSectionColorController *)self scrollCollectionViewToSelectedColor];
  }
}

- (void)layoutSubviewsForIndex:(int64_t)a3
{
  double v4 = [(AVTAvatarAttributeEditorSectionColorController *)self containerView];
  [v4 bounds];
  double Width = CGRectGetWidth(v37);

  [(AVTAvatarAttributeEditorSectionColorController *)self heightForSectionHeaderFittingWidth:Width];
  double v7 = v6;
  int64_t v8 = [(AVTAvatarAttributeEditorSectionColorController *)self containerView];
  [v8 bounds];
  double v9 = CGRectGetWidth(v38);

  double v10 = [(AVTAvatarAttributeEditorSectionColorController *)self headerView];
  objc_msgSend(v10, "setFrame:", 0.0, 0.0, v9, v7);

  [(AVTAvatarAttributeEditorSectionColorController *)self heightForCollectionViewFittingWidth:Width];
  double v12 = v11;
  v39.origin.double x = 0.0;
  v39.origin.CGFloat y = 0.0;
  v39.size.double width = v9;
  v39.size.double height = v7;
  double MaxY = CGRectGetMaxY(v39);
  id v14 = [(AVTAvatarAttributeEditorSectionColorController *)self collectionView];
  objc_msgSend(v14, "setFrame:", 0.0, MaxY, Width, v12);

  id v15 = [(AVTAvatarAttributeEditorSectionColorController *)self collectionView];
  objc_msgSend(v15, "setContentInset:", 0.0, 12.0, 0.0, 12.0);

  double v16 = [(AVTAvatarAttributeEditorSectionColorController *)self collectionView];
  [v16 contentOffset];
  double v18 = v17;

  if (v18 == 0.0) {
    [(AVTAvatarAttributeEditorSectionColorController *)self scrollCollectionViewToOrigin];
  }
  double v19 = [(AVTAvatarAttributeEditorSectionColorController *)self collectionView];
  [v19 layoutIfNeeded];

  double v20 = [(AVTAvatarAttributeEditorSectionColorController *)self dataSource];
  int v21 = [v20 isShowingSlider];

  if (v21)
  {
    double v22 = objc_opt_class();
    v23 = [(AVTAvatarAttributeEditorSectionColorController *)self containerView];
    [v23 bounds];
    double v25 = v24;
    double v26 = [(AVTAvatarAttributeEditorSectionColorController *)self environment];
    [v22 edgeLengthFittingWidth:v26 environment:v25];
    double v28 = v27;

    v29 = [(AVTAvatarAttributeEditorSectionColorController *)self containerView];
    [v29 bounds];
    double v31 = v30 - v28 + -12.0;
    v32 = [(AVTAvatarAttributeEditorSectionColorController *)self containerView];
    [v32 bounds];
    double v34 = v33;

    id v35 = [(AVTAvatarAttributeEditorSectionColorController *)self sliderContainerView];
    objc_msgSend(v35, "setFrame:", 0.0, v31, v34, v28);
  }
}

- (id)prefetchingSectionItemForIndex:(int64_t)a3
{
  return 0;
}

- (int64_t)numberOfItems
{
  return 1;
}

- (double)heightForSectionHeaderFittingWidth:(double)a3
{
  v21[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = [(AVTAvatarAttributeEditorSectionColorController *)self dataSource];
  double v6 = [v5 colorSection];

  double v7 = 0.0;
  if ([(AVTAvatarAttributeEditorSectionColorController *)self showsHeader]
    && [v6 shouldDisplayTitle])
  {
    int64_t v8 = +[AVTUIFontRepository attributeTitleFont];
    double v9 = [v6 localizedName];
    [v8 lineHeight];
    double v11 = v10 + v10;
    uint64_t v20 = *MEMORY[0x263F1C238];
    v21[0] = v8;
    double v12 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
    objc_msgSend(v9, "boundingRectWithSize:options:attributes:context:", 1, v12, 0, a3 + -40.0, v11);
    double v14 = v13;

    id v15 = +[AVTUIFontRepository attributeTitleFont];
    [v15 _scaledValueForValue:18.0];
    double v17 = v16;

    double v18 = 30.0;
    if (v17 <= 30.0) {
      double v18 = v17;
    }
    double v7 = ceil(v14 + v18 * 2.0 + -12.0);
  }
  return v7;
}

- (double)heightForCollectionViewFittingWidth:(double)a3
{
  uint64_t v5 = objc_opt_class();
  double v6 = [(AVTAvatarAttributeEditorSectionColorController *)self environment];
  [v5 edgeLengthFittingWidth:v6 environment:a3];
  double v8 = v7;

  double v9 = [(AVTAvatarAttributeEditorSectionColorController *)self dataSource];
  LODWORD(v6) = [v9 isShowingExtended];

  if (v6)
  {
    double v10 = [(AVTAvatarAttributeEditorSectionColorController *)self dataSource];
    double v11 = [v10 colorSection];
    double v12 = [v11 extendedItems];
    double v13 = (double)(unint64_t)[v12 count];

    double v8 = (v8 + 0.0) * (double)(uint64_t)ceil(v13 / (double)(uint64_t)floor((a3 + -24.0) / (v8 + 0.0)));
  }
  return v8 + 24.0;
}

- (CGSize)sizeForItemAtIndex:(int64_t)a3 fittingSize:(CGSize)a4
{
  double width = a4.width;
  -[AVTAvatarAttributeEditorSectionColorController heightForCollectionViewFittingWidth:](self, "heightForCollectionViewFittingWidth:", a3, a4.width, a4.height);
  double v7 = v6;
  if ([(AVTAvatarAttributeEditorSectionColorController *)self showsHeader])
  {
    double v8 = [(AVTAvatarAttributeEditorSectionColorController *)self dataSource];
    double v9 = [v8 colorSection];
    int v10 = [v9 shouldDisplayTitle];

    if (v10)
    {
      [(AVTAvatarAttributeEditorSectionColorController *)self heightForSectionHeaderFittingWidth:width];
      double v7 = v7 + v11;
    }
  }
  double v12 = [(AVTAvatarAttributeEditorSectionColorController *)self dataSource];
  int v13 = [v12 isShowingSlider];

  if (v13)
  {
    double v14 = objc_opt_class();
    id v15 = [(AVTAvatarAttributeEditorSectionColorController *)self environment];
    [v14 edgeLengthFittingWidth:v15 environment:width];
    double v17 = v16;

    double v7 = v7 + v17 + 6.0;
  }
  double v18 = width;
  double v19 = v7;
  result.double height = v19;
  result.double width = v18;
  return result;
}

- (unint64_t)indexForItem:(id)a3
{
  return 0;
}

- (void)cell:(id)a3 willDisplayAtIndex:(int64_t)a4
{
  [a3 layoutIfNeeded];
  [(AVTAvatarAttributeEditorSectionColorController *)self willDisplayViewForIndex:a4];
}

- (void)resetToDefaultState
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __69__AVTAvatarAttributeEditorSectionColorController_resetToDefaultState__block_invoke;
  v2[3] = &unk_263FF03D8;
  v2[4] = self;
  [MEMORY[0x263F1CB60] performWithoutAnimation:v2];
}

uint64_t __69__AVTAvatarAttributeEditorSectionColorController_resetToDefaultState__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) dataSource];
  [v2 resetToDefaultDisplayMode];

  double v3 = *(void **)(a1 + 32);
  return [v3 scrollCollectionViewToSelectedColor];
}

- (void)invalidateLayoutForNewContainerSize:(CGSize)a3
{
  -[AVTAvatarAttributeEditorSectionColorController updateCollectionViewLayoutWithContainerSize:](self, "updateCollectionViewLayoutWithContainerSize:", a3.width, a3.height);
  id v5 = [(AVTAvatarAttributeEditorSectionColorController *)self collectionView];
  double v4 = [v5 collectionViewLayout];
  [v4 invalidateLayout];
}

- (void)updateCell:(id)a3 forItemAtIndex:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(AVTAvatarAttributeEditorSectionColorController *)self viewForIndex:a4];
  [v6 setAttributeView:v7];
}

- (BOOL)evaluateDisplayCondition:(id)a3
{
  if ([a3 value]) {
    return 0;
  }
  id v5 = [(AVTAvatarAttributeEditorSectionColorController *)self dataSource];
  char v6 = [v5 isShowingSlider];

  return v6;
}

- (CGSize)sizeForFocusingItemAtIndex:(int64_t)a3 fittingSize:(CGSize)a4
{
  double width = a4.width;
  char v6 = objc_opt_class();
  id v7 = [(AVTAvatarAttributeEditorSectionColorController *)self environment];
  [v6 cellSizeFittingWidth:v7 environment:width];
  double v9 = v8;
  double v11 = v10;

  double v12 = [(AVTAvatarAttributeEditorSectionColorController *)self dataSource];
  LODWORD(v6) = [v12 isShowingSlider];

  double v13 = v9 + 6.0 + 10.0;
  if (!v6) {
    double v13 = -0.0;
  }
  double v14 = v11 + v13;
  double v15 = width;
  result.double height = v14;
  result.double width = v15;
  return result;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v5 = [(AVTAvatarAttributeEditorSectionColorController *)self dataSource];
  int64_t v6 = [v5 numberOfItemsInSection:a4];

  return v6;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [(AVTAvatarAttributeEditorSectionColorController *)self dataSource];
  double v9 = [v8 indexPathOfExtendedIcon];
  int v10 = [v6 isEqual:v9];

  if ((v10 & 1) == 0) {
    AVTUIEditorShowAssetsName_once();
  }
  double v11 = (objc_class *)objc_opt_class();
  uint64_t v12 = NSStringFromClass(v11);
  double v13 = [v7 dequeueReusableCellWithReuseIdentifier:v12 forIndexPath:v6];

  uint64_t v14 = [v13 valueView];
  double v15 = (AVTColorWheelView *)v14;
  double v34 = (void *)v12;
  if (v10)
  {
    if (!v14)
    {
      double v16 = [AVTColorWheelView alloc];
      double v17 = [v13 contentView];
      [v17 bounds];
      double v15 = -[AVTColorWheelView initWithFrame:](v16, "initWithFrame:");
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      [MEMORY[0x263EFF940] raise:@"AVTTypeMismatchException", @"Unexpected object class for %@", v15 format];
    }
    double v15 = v15;
    double v18 = [(AVTAvatarAttributeEditorSectionColorController *)self dataSource];
    double v19 = [v18 colorSection];
    uint64_t v20 = [v19 primaryItems];
    int v21 = [(AVTAvatarAttributeEditorSectionColorController *)self dataSource];
    double v22 = [v21 colorSection];
    v23 = [v22 extendedItems];
    [(AVTColorWheelView *)v15 updateWithPrimaryItems:v20 extendedItems:v23];

    goto LABEL_13;
  }
  if (!v14)
  {
    double v24 = [AVTAttributeValueView alloc];
    double v25 = [v13 contentView];
    [v25 bounds];
    double v15 = -[AVTAttributeValueView initWithFrame:](v24, "initWithFrame:");
  }
  double v26 = [(AVTAvatarAttributeEditorSectionColorController *)self dataSource];
  double v18 = objc_msgSend(v26, "sectionItemAtIndex:", objc_msgSend(v6, "item"));

  double v27 = [(AVTAvatarAttributeEditorSectionColorController *)self dataSource];
  double v28 = [v27 colorSection];
  v29 = [v28 colorVariationStore];
  double v30 = [v18 color];
  double v19 = [v29 colorPresetFromColor:v30];

  double v31 = [(AVTAttributeValueView *)v15 imageLayer];
  [(AVTAvatarAttributeEditorSectionColorController *)self updateCellLayer:v31 withColorItem:v18 withColorPreset:v19];

  if (AVTUIEditorShowAssetsName_once())
  {
    uint64_t v20 = [v18 localizedName];
    [v13 setLabelString:v20];
LABEL_13:
    v32 = v34;

    goto LABEL_15;
  }
  v32 = v34;
LABEL_15:

  [(AVTAttributeValueView *)v15 setSelectionStyle:1];
  [v13 setAttributeView:v15];

  return v13;
}

- (void)updateCellLayer:(id)a3 withColorItem:(id)a4 withColorPreset:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  double v11 = [v8 layerContentProvider];
  int v10 = [v8 skinColor];

  v11[2](v11, v7, v10, v9);
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v7 = a4;
  uint64_t v8 = [a5 item];
  BOOL v9 = v8 == [(AVTAvatarAttributeEditorSectionColorController *)self selectedIndex];
  id v11 = v7;
  [v11 layoutIfNeeded];
  int v10 = [v11 valueView];

  [v10 updateSelectedState:v9 animated:0];
}

- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(AVTAvatarAttributeEditorSectionColorController *)self collectionView];
  id v8 = [v6 cellForItemAtIndexPath:v5];

  id v7 = [v8 valueView];
  [v7 updateHighlightedState:1 animated:1 completionBlock:0];
}

- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(AVTAvatarAttributeEditorSectionColorController *)self collectionView];
  id v8 = [v6 cellForItemAtIndexPath:v5];

  id v7 = [v8 valueView];
  [v7 updateHighlightedState:0 animated:1 completionBlock:0];
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(AVTAvatarAttributeEditorSectionColorController *)self dataSource];
  [v6 selectSectionItemAtIndexPath:v5];
}

- (void)colorDataSource:(id)a3 didDeselectItemAtIndex:(int64_t)a4 shouldReloadModel:(BOOL)a5
{
  objc_msgSend(MEMORY[0x263F088C8], "indexPathForItem:inSection:", a4, 0, a5);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(AVTAvatarAttributeEditorSectionColorController *)self setSelectedState:0 animated:[(AVTAvatarAttributeEditorSectionColorController *)self dontAnimateSelection] ^ 1 forCellAtIndexPath:v6];
}

- (void)colorDataSource:(id)a3 didSelectItemAtIndex:(int64_t)a4 shouldReloadModel:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = [MEMORY[0x263F088C8] indexPathForItem:a4 inSection:0];
  [(AVTAvatarAttributeEditorSectionColorController *)self setSelectedState:1 animated:[(AVTAvatarAttributeEditorSectionColorController *)self dontAnimateSelection] ^ 1 forCellAtIndexPath:v8];
  BOOL v9 = [(AVTAvatarAttributeEditorSectionColorController *)self dataSource];
  int v10 = [v9 sectionItemAtIndex:a4];

  if (v10)
  {
    [(AVTAvatarAttributeEditorSectionColorController *)self updateSliderForSectionItemIfNeeded:v10];
    if (v5)
    {
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __105__AVTAvatarAttributeEditorSectionColorController_colorDataSource_didSelectItemAtIndex_shouldReloadModel___block_invoke;
      v11[3] = &unk_263FF0780;
      v11[4] = self;
      id v12 = v10;
      [(AVTAvatarAttributeEditorSectionColorController *)self animateWithSpringAnimations:v11 completion:0];
    }
  }
}

void __105__AVTAvatarAttributeEditorSectionColorController_colorDataSource_didSelectItemAtIndex_shouldReloadModel___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 attributeEditorSectionController:*(void *)(a1 + 32) didSelectSectionItem:*(void *)(a1 + 40)];
}

- (void)colorDataSource:(id)a3 didChangeDisplayMode:(int64_t)a4 previousDisplayMode:(int64_t)a5
{
  id v17 = a3;
  unint64_t v8 = a4 & 0xFFFFFFFFFFFFFFFDLL;
  BOOL v9 = (a4 & 0xFFFFFFFFFFFFFFFDLL) == 1;
  char v10 = ((a4 & 0xFFFFFFFFFFFFFFFELL) == 2) ^ ((a5 & 0xFFFFFFFFFFFFFFFELL) == 2);
  if (v9 == ((a5 & 0xFFFFFFFFFFFFFFFDLL) == 1))
  {
    if ((v10 & 1) == 0) {
      goto LABEL_9;
    }
    id v11 = [(AVTAvatarAttributeEditorSectionColorController *)self containerView];
    [v11 bounds];
    -[AVTAvatarAttributeEditorSectionColorController updateCollectionViewLayoutWithContainerSize:](self, "updateCollectionViewLayoutWithContainerSize:", v12, v13);
  }
  else
  {
    if (v8 == 1) {
      [(AVTAvatarAttributeEditorSectionColorController *)self showSliderAnimated:1];
    }
    else {
      [(AVTAvatarAttributeEditorSectionColorController *)self hideSliderAnimated:1];
    }
    uint64_t v14 = [(AVTAvatarAttributeEditorSectionColorController *)self containerView];
    [v14 bounds];
    -[AVTAvatarAttributeEditorSectionColorController updateCollectionViewLayoutWithContainerSize:](self, "updateCollectionViewLayoutWithContainerSize:", v15, v16);

    if ((v10 & 1) == 0) {
      goto LABEL_9;
    }
  }
  [(AVTAvatarAttributeEditorSectionColorController *)self reloadData];
LABEL_9:
}

- (void)setSelectedState:(BOOL)a3 animated:(BOOL)a4 forCellAtIndexPath:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  BOOL v9 = [(AVTAvatarAttributeEditorSectionColorController *)self collectionView];
  id v11 = [v9 cellForItemAtIndexPath:v8];

  char v10 = [v11 valueView];
  [v10 updateSelectedState:v6 animated:v5];
}

- (void)colorSliderVariationChanged:(double)a3 forItem:(id)a4
{
  id v6 = a4;
  [(AVTAvatarAttributeEditorSectionColorController *)self updateSectionItem:v6 withVariation:a3];
  id v7 = [(AVTAvatarAttributeEditorSectionColorController *)self delegate];
  [v7 attributeEditorSectionController:self didUpdateSectionItem:v6];
}

- (void)colorSliderDidFinishChangingVariation:(double)a3 forItem:(id)a4
{
  id v6 = a4;
  [(AVTAvatarAttributeEditorSectionColorController *)self updateSectionItem:v6 withVariation:a3];
  id v7 = [(AVTAvatarAttributeEditorSectionColorController *)self delegate];
  [v7 attributeEditorSectionController:self didSelectSectionItem:v6];
}

- (void)updateSectionItem:(id)a3 withVariation:(double)a4
{
  id v6 = (void *)MEMORY[0x263F088C8];
  id v7 = a3;
  objc_msgSend(v6, "indexPathForItem:inSection:", -[AVTAvatarAttributeEditorSectionColorController selectedIndex](self, "selectedIndex"), 0);
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = [(AVTAvatarAttributeEditorSectionColorController *)self collectionView];
  BOOL v9 = [v8 cellForItemAtIndexPath:v21];

  char v10 = [v7 color];
  id v11 = [v10 baseColorPreset];
  *(float *)&double v12 = a4;
  double v13 = [v11 colorPresetWithVariation:v12];

  uint64_t v14 = [(AVTAvatarAttributeEditorSectionColorController *)self dataSource];
  double v15 = [v14 colorSection];
  double v16 = [v15 colorVariationStore];
  id v17 = [v7 color];
  [v16 saveColorPreset:v13 forColor:v17];

  double v18 = [v9 valueView];
  double v19 = [v18 imageLayer];
  [(AVTAvatarAttributeEditorSectionColorController *)self updateCellLayer:v19 withColorItem:v7 withColorPreset:v13];

  uint64_t v20 = [(AVTAvatarAttributeEditorSectionColorController *)self sliderContainerView];
  [v20 updateSliderWithColorPreset:v13 animated:0];
}

- (void)attributeEditorSectionController:(id)a3 didSelectSectionItem:(id)a4
{
  id v5 = a4;
  id v6 = [(AVTAvatarAttributeEditorSectionColorController *)self delegate];
  [v6 attributeEditorSectionController:self didSelectSectionItem:v5];
}

- (void)attributeEditorSectionController:(id)a3 didUpdateSectionItem:(id)a4
{
  id v5 = a4;
  id v6 = [(AVTAvatarAttributeEditorSectionColorController *)self delegate];
  [v6 attributeEditorSectionController:self didUpdateSectionItem:v5];
}

- (void)attributeEditorSectionController:(id)a3 didDeleteSectionItems:(id)a4
{
  id v5 = a4;
  id v6 = [(AVTAvatarAttributeEditorSectionColorController *)self delegate];
  [v6 attributeEditorSectionController:self didDeleteSectionItems:v5];
}

- (void)attributeEditorSectionControllerNeedsLayoutUpdate:(id)a3
{
  double v4 = [(AVTAvatarAttributeEditorSectionColorController *)self delegate];
  [v4 attributeEditorSectionControllerNeedsLayoutUpdate:self];

  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __100__AVTAvatarAttributeEditorSectionColorController_attributeEditorSectionControllerNeedsLayoutUpdate___block_invoke;
  _OWORD v5[3] = &unk_263FF03D8;
  v5[4] = self;
  [MEMORY[0x263F1CB60] performWithoutAnimation:v5];
}

void __100__AVTAvatarAttributeEditorSectionColorController_attributeEditorSectionControllerNeedsLayoutUpdate___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) layoutSubviewsForIndex:0];
  id v2 = *(void **)(a1 + 32);
  id v5 = [v2 containerView];
  [v5 bounds];
  objc_msgSend(v2, "updateCollectionViewLayoutWithContainerSize:", v3, v4);
}

- (void)selectIndexPath:(id)a3
{
}

- (AVTAvatarAttributeEditorSection)section
{
  return self->_section;
}

- (void)setSelectedIndex:(int64_t)a3
{
  self->_selectedIndedouble x = a3;
}

- (AVTAvatarAttributeEditorControllerSubSelectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (AVTAvatarAttributeEditorControllerSubSelectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AVTAvatarAttributeEditorSectionColorDataSource)dataSource
{
  return self->_dataSource;
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (void)setCollectionViewLayout:(id)a3
{
}

- (AVTAvatarColorSliderContainerView)sliderContainerView
{
  return self->_sliderContainerView;
}

- (void)setSliderContainerView:(id)a3
{
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (BOOL)showsHeader
{
  return self->_showsHeader;
}

- (BOOL)dontAnimateSelection
{
  return self->_dontAnimateSelection;
}

- (void)setDontAnimateSelection:(BOOL)a3
{
  self->_dontAnimateSelection = a3;
}

- (BOOL)needsScrollToSelected
{
  return self->_needsScrollToSelected;
}

- (void)setNeedsScrollToSelected:(BOOL)a3
{
  self->_needsScrollToSelected = a3;
}

- (AVTAttributeEditorSectionHeaderView)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_sliderContainerView, 0);
  objc_storeStrong((id *)&self->_collectionViewLayout, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_section, 0);
}

@end