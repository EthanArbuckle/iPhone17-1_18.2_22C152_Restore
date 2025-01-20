@interface PKPaletteColorPickerView
+ (id)collectionViewFlowLayoutWithItemSize:(CGSize)a3 minimumLineSpacing:(double)a4 minimumInterItemSpacing:(double)a5;
- (BOOL)_colorPickerAllowsColorSelection;
- (BOOL)_isExtendedColorPickerVisible;
- (BOOL)_shouldDisplayExtendedColorPickerPopoverFromColorSwatch:(id)a3;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)supportsAlpha;
- (CGRect)_popoverPresentingSourceRect;
- (CGSize)intrinsicContentSize;
- (CGSize)swatchSize;
- (NSArray)swatchColors;
- (NSArray)swatches;
- (PKPaletteColorPickerController)colorPickerController;
- (PKPaletteColorPickerView)initWithFrame:(CGRect)a3;
- (PKPaletteMulticolorSwatch)multicolorSwatch;
- (PKPalettePopoverPresenting)delegate;
- (UICollectionView)collectionView;
- (UIColor)analyticsInitialColor;
- (UIColor)selectedColor;
- (UILongPressGestureRecognizer)longPressGestureRecognizer;
- (double)scalingFactor;
- (id)_popoverPresentingSourceView;
- (id)_selectedSwatch;
- (id)_swatchColorsForTraitCollection:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)colorAtPoint:(CGPoint)a3;
- (id)swatchWithColor:(id)a3;
- (id)swatchWithIdentifier:(id)a3;
- (id)traitCollectionWithCurrentInterfaceStyle;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (int64_t)analyticsColorChangeCount;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)colorPickerMode;
- (int64_t)colorUserInterfaceStyle;
- (unint64_t)_multicolorSwatchIndexForEdge:(unint64_t)a3;
- (unint64_t)cornerLocation;
- (unint64_t)edgeLocation;
- (void)_enableOrDisableLongPressGesture;
- (void)_rebuildSwatches;
- (void)_reloadSwatchColorsForTraitCollection:(id)a3;
- (void)_setMulticolorSwatchColor:(id)a3;
- (void)_showExtendedColorPicker;
- (void)_swatchLongPressHandler:(id)a3;
- (void)_updateUI;
- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4;
- (void)colorPickerControllerDidChangeSelectedColor:(id)a3 isContinuousColorSelection:(BOOL)a4;
- (void)dealloc;
- (void)dismissEyeDropper;
- (void)dismissPalettePopoverWithCompletion:(id)a3;
- (void)reloadColorsForCurrentColorPickerMode;
- (void)setAnalyticsColorChangeCount:(int64_t)a3;
- (void)setAnalyticsInitialColor:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setColorPickerController:(id)a3;
- (void)setColorPickerMode:(int64_t)a3;
- (void)setColorUserInterfaceStyle:(int64_t)a3;
- (void)setCornerLocation:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setEdgeLocation:(unint64_t)a3;
- (void)setLongPressGestureRecognizer:(id)a3;
- (void)setMulticolorSwatch:(id)a3;
- (void)setScalingFactor:(double)a3;
- (void)setSelectedColor:(id)a3;
- (void)setSupportsAlpha:(BOOL)a3;
- (void)setSwatchColors:(id)a3;
- (void)setSwatches:(id)a3;
- (void)toggleColorSelectionPopover;
- (void)traitCollectionDidChange:(id)a3;
- (void)updatePopoverUI;
@end

@implementation PKPaletteColorPickerView

+ (id)collectionViewFlowLayoutWithItemSize:(CGSize)a3 minimumLineSpacing:(double)a4 minimumInterItemSpacing:(double)a5
{
  double height = a3.height;
  double width = a3.width;
  id v9 = objc_alloc_init(MEMORY[0x1E4FB15C0]);
  objc_msgSend(v9, "setItemSize:", width, height);
  [v9 setMinimumLineSpacing:a4];
  [v9 setMinimumInteritemSpacing:a5];

  return v9;
}

- (PKPaletteColorPickerView)initWithFrame:(CGRect)a3
{
  v37[4] = *MEMORY[0x1E4F143B8];
  v36.receiver = self;
  v36.super_class = (Class)PKPaletteColorPickerView;
  v3 = -[PKPaletteColorPickerView initWithFrame:](&v36, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_scalingFactor = 1.0;
    v5 = objc_opt_class();
    [(PKPaletteColorPickerView *)v4 swatchSize];
    v35 = objc_msgSend(v5, "collectionViewFlowLayoutWithItemSize:minimumLineSpacing:minimumInterItemSpacing:");
    id v6 = objc_alloc(MEMORY[0x1E4FB1568]);
    uint64_t v7 = objc_msgSend(v6, "initWithFrame:collectionViewLayout:", v35, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    collectionView = v4->_collectionView;
    v4->_collectionView = (UICollectionView *)v7;

    [(UICollectionView *)v4->_collectionView setTranslatesAutoresizingMaskIntoConstraints:0];
    id v9 = [MEMORY[0x1E4FB1618] clearColor];
    [(UICollectionView *)v4->_collectionView setBackgroundColor:v9];

    [(UICollectionView *)v4->_collectionView setContentInsetAdjustmentBehavior:2];
    [(UICollectionView *)v4->_collectionView setShowsVerticalScrollIndicator:0];
    [(UICollectionView *)v4->_collectionView setShowsHorizontalScrollIndicator:0];
    v10 = v4->_collectionView;
    uint64_t v11 = objc_opt_class();
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    [(UICollectionView *)v10 registerClass:v11 forCellWithReuseIdentifier:v13];

    [(UICollectionView *)v4->_collectionView setDataSource:v4];
    [(UICollectionView *)v4->_collectionView setDelegate:v4];
    [(UICollectionView *)v4->_collectionView setClipsToBounds:0];
    [(UICollectionView *)v4->_collectionView setScrollEnabled:0];
    [(UICollectionView *)v4->_collectionView setDelaysContentTouches:0];
    [(PKPaletteColorPickerView *)v4 addSubview:v4->_collectionView];
    v29 = (void *)MEMORY[0x1E4F28DC8];
    v34 = [(UICollectionView *)v4->_collectionView topAnchor];
    v33 = [(PKPaletteColorPickerView *)v4 topAnchor];
    v32 = [v34 constraintEqualToAnchor:v33];
    v37[0] = v32;
    v31 = [(UICollectionView *)v4->_collectionView bottomAnchor];
    v30 = [(PKPaletteColorPickerView *)v4 bottomAnchor];
    v14 = [v31 constraintEqualToAnchor:v30];
    v37[1] = v14;
    v15 = [(UICollectionView *)v4->_collectionView leadingAnchor];
    v16 = [(PKPaletteColorPickerView *)v4 leadingAnchor];
    v17 = [v15 constraintEqualToAnchor:v16];
    v37[2] = v17;
    v18 = [(UICollectionView *)v4->_collectionView trailingAnchor];
    v19 = [(PKPaletteColorPickerView *)v4 trailingAnchor];
    v20 = [v18 constraintEqualToAnchor:v19];
    v37[3] = v20;
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:4];
    [v29 activateConstraints:v21];

    v22 = [(PKPaletteColorPickerView *)v4 traitCollection];
    v23 = [(PKPaletteColorPickerView *)v4 _swatchColorsForTraitCollection:v22];
    [(PKPaletteColorPickerView *)v4 setSwatchColors:v23];

    v24 = (UILongPressGestureRecognizer *)objc_alloc_init(MEMORY[0x1E4FB1968]);
    [(UILongPressGestureRecognizer *)v24 addTarget:v4 action:sel__swatchLongPressHandler_];
    [(UILongPressGestureRecognizer *)v24 setDelegate:v4];
    [(UICollectionView *)v4->_collectionView addGestureRecognizer:v24];
    longPressGestureRecognizer = v4->_longPressGestureRecognizer;
    v4->_longPressGestureRecognizer = v24;
    v26 = v24;

    [(PKPaletteColorPickerView *)v4 _enableOrDisableLongPressGesture];
    v27 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v27 addObserver:v4 selector:sel_didChangePreferredContentSize_ name:*MEMORY[0x1E4FB27A8] object:0];
  }
  return v4;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB27A8] object:0];

  v4.receiver = self;
  v4.super_class = (Class)PKPaletteColorPickerView;
  [(PKPaletteColorPickerView *)&v4 dealloc];
}

- (void)_enableOrDisableLongPressGesture
{
  v3 = [MEMORY[0x1E4FB1648] system];
  category = [v3 preferredContentSizeCategory];

  if (UIContentSizeCategoryIsAccessibilityCategory(category))
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FB1938]);
    [(PKPaletteColorPickerView *)self addInteraction:v4];
    longPressGestureRecognizer = self->_longPressGestureRecognizer;
    id v6 = [v4 gestureRecognizerForExclusionRelationship];
    [(UILongPressGestureRecognizer *)longPressGestureRecognizer requireGestureRecognizerToFail:v6];
  }
}

- (id)_swatchColorsForTraitCollection:(id)a3
{
  id v4 = a3;
  if (qword_1EA3C6C30 != -1) {
    dispatch_once(&qword_1EA3C6C30, &__block_literal_global_66);
  }
  v5 = [(PKPaletteColorPickerView *)self window];
  id v6 = [v5 windowScene];
  BOOL v7 = PKUseCompactSize(v4, v6);

  v8 = _MergedGlobals_19;
  if (!v7)
  {
    unint64_t v9 = [(PKPaletteColorPickerView *)self edgeLocation];
    BOOL v10 = v9 == 2 || v9 == 8;
    uint64_t v11 = 1;
    if (v10) {
      uint64_t v11 = 2;
    }
    v8 = &_MergedGlobals_19[v11];
  }
  id v12 = (id)*v8;

  return v12;
}

void __60__PKPaletteColorPickerView__swatchColorsForTraitCollection___block_invoke()
{
  v25[5] = *MEMORY[0x1E4F143B8];
  if (!_MergedGlobals_19[0]) {
    _MergedGlobals_19[0] = MEMORY[0x1E4F1CBF0];
  }
  if (!qword_1EA3C6C20)
  {
    v22 = [MEMORY[0x1E4FB1618] colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
    v0 = +[PKSwatchColor swatchColor:identifier:]((uint64_t)PKSwatchColor, v22, @"black");
    v25[0] = v0;
    v1 = [MEMORY[0x1E4FB1618] colorWithRed:0.0823529412 green:0.494117647 blue:0.984313725 alpha:1.0];
    v2 = +[PKSwatchColor swatchColor:identifier:]((uint64_t)PKSwatchColor, v1, @"blue");
    v25[1] = v2;
    v3 = [MEMORY[0x1E4FB1618] colorWithRed:0.325490196 green:0.843137255 blue:0.411764706 alpha:1.0];
    id v4 = +[PKSwatchColor swatchColor:identifier:]((uint64_t)PKSwatchColor, v3, @"green");
    v25[2] = v4;
    v5 = [MEMORY[0x1E4FB1618] colorWithRed:0.996078431 green:0.815686275 blue:0.188235294 alpha:1.0];
    id v6 = +[PKSwatchColor swatchColor:identifier:]((uint64_t)PKSwatchColor, v5, @"yellow");
    v25[3] = v6;
    BOOL v7 = [MEMORY[0x1E4FB1618] colorWithRed:0.988235294 green:0.192156863 blue:0.258823529 alpha:1.0];
    v8 = +[PKSwatchColor swatchColor:identifier:]((uint64_t)PKSwatchColor, v7, @"red");
    v25[4] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:5];
    BOOL v10 = (void *)qword_1EA3C6C20;
    qword_1EA3C6C20 = v9;
  }
  if (!qword_1EA3C6C28)
  {
    v23 = [MEMORY[0x1E4FB1618] colorWithRed:0.996078431 green:0.815686275 blue:0.188235294 alpha:1.0];
    uint64_t v11 = +[PKSwatchColor swatchColor:identifier:]((uint64_t)PKSwatchColor, v23, @"yellow");
    v24[0] = v11;
    id v12 = [MEMORY[0x1E4FB1618] colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
    v13 = +[PKSwatchColor swatchColor:identifier:]((uint64_t)PKSwatchColor, v12, @"black");
    v24[1] = v13;
    v14 = [MEMORY[0x1E4FB1618] colorWithRed:0.988235294 green:0.192156863 blue:0.258823529 alpha:1.0];
    v15 = +[PKSwatchColor swatchColor:identifier:]((uint64_t)PKSwatchColor, v14, @"red");
    v24[2] = v15;
    v16 = [MEMORY[0x1E4FB1618] colorWithRed:0.0823529412 green:0.494117647 blue:0.984313725 alpha:1.0];
    v17 = +[PKSwatchColor swatchColor:identifier:]((uint64_t)PKSwatchColor, v16, @"blue");
    v24[3] = v17;
    v18 = [MEMORY[0x1E4FB1618] colorWithRed:0.325490196 green:0.843137255 blue:0.411764706 alpha:1.0];
    v19 = +[PKSwatchColor swatchColor:identifier:]((uint64_t)PKSwatchColor, v18, @"green");
    v24[4] = v19;
    uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:5];
    v21 = (void *)qword_1EA3C6C28;
    qword_1EA3C6C28 = v20;
  }
}

- (void)dismissEyeDropper
{
  v3 = [(PKPaletteColorPickerView *)self colorPickerController];
  [v3 dismissEyeDropper];

  id v4 = [(PKPaletteColorPickerView *)self colorPickerController];
  v5 = [v4 viewController];
  [v5 dismissViewControllerAnimated:0 completion:0];

  [(PKPaletteColorPickerView *)self setColorPickerController:0];
}

- (void)setSwatchColors:(id)a3
{
  if (self->_swatchColors != a3)
  {
    id v4 = (NSArray *)[a3 copy];
    swatchColors = self->_swatchColors;
    self->_swatchColors = v4;

    [(PKPaletteColorPickerView *)self _rebuildSwatches];
  }
}

- (void)_rebuildSwatches
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = [(PKPaletteColorPickerView *)self swatchColors];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * v8);
        BOOL v10 = objc_alloc_init(PKPaletteColorSwatch);
        [(PKPaletteColorSwatch *)v10 setSwatchColor:v9];
        -[PKPaletteColorSwatch setColorUserInterfaceStyle:](v10, [(PKPaletteColorPickerView *)self colorUserInterfaceStyle]);
        [v3 addObject:v10];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  uint64_t v11 = objc_alloc_init(PKPaletteMulticolorSwatch);
  [(PKPaletteColorPickerView *)self setMulticolorSwatch:v11];

  uint64_t v12 = [(PKPaletteColorPickerView *)self colorUserInterfaceStyle];
  v13 = [(PKPaletteColorPickerView *)self multicolorSwatch];
  -[PKPaletteColorSwatch setColorUserInterfaceStyle:](v13, v12);

  v14 = [(PKPaletteColorPickerView *)self multicolorSwatch];
  [v3 addObject:v14];

  [(PKPaletteColorPickerView *)self setSwatches:v3];
  [(PKPaletteColorPickerView *)self _updateUI];
}

- (void)_updateUI
{
  v3 = [(PKPaletteColorPickerView *)self traitCollection];
  id v4 = [(PKPaletteColorPickerView *)self window];
  uint64_t v5 = [v4 windowScene];
  BOOL v6 = PKUseCompactSize(v3, v5);

  if (!v6)
  {
    uint64_t v7 = [(PKPaletteColorPickerView *)self swatches];
    uint64_t v8 = [(PKPaletteColorPickerView *)self multicolorSwatch];
    uint64_t v9 = [v7 indexOfObject:v8];

    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v10 = [(PKPaletteColorPickerView *)self _multicolorSwatchIndexForEdge:[(PKPaletteColorPickerView *)self edgeLocation]];
      if (v10 != 0x7FFFFFFFFFFFFFFFLL)
      {
        unint64_t v11 = v10;
        if (v9 != v10)
        {
          uint64_t v12 = [(PKPaletteColorPickerView *)self swatches];
          v13 = (void *)[v12 mutableCopy];

          [v13 removeObjectAtIndex:v9];
          v14 = [(PKPaletteColorPickerView *)self multicolorSwatch];
          [v13 insertObject:v14 atIndex:v11];

          [(PKPaletteColorPickerView *)self setSwatches:v13];
        }
      }
    }
  }
  long long v15 = [(PKPaletteColorPickerView *)self collectionView];
  id v19 = [v15 collectionViewLayout];

  [(PKPaletteColorPickerView *)self swatchSize];
  objc_msgSend(v19, "setItemSize:");
  [(PKPaletteColorPickerView *)self scalingFactor];
  [v19 setMinimumLineSpacing:v16 * 12.0];
  [(PKPaletteColorPickerView *)self scalingFactor];
  [v19 setMinimumInteritemSpacing:v17 * 12.0];
  long long v18 = [(PKPaletteColorPickerView *)self collectionView];
  [v18 reloadData];
}

- (unint64_t)_multicolorSwatchIndexForEdge:(unint64_t)a3
{
  uint64_t v5 = [(PKPaletteColorPickerView *)self swatches];
  unint64_t v6 = [v5 count];

  if (v6 < 2) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v8 = [(PKPaletteColorPickerView *)self swatches];
  uint64_t v9 = [v8 count];

  if (a3 != 2) {
    return v9 - 1;
  }
  unint64_t v10 = [(PKPaletteColorPickerView *)self swatches];
  unint64_t v7 = [v10 count] - 2;

  return v7;
}

- (void)setScalingFactor:(double)a3
{
  double scalingFactor = self->_scalingFactor;
  if (scalingFactor != a3 && vabdd_f64(scalingFactor, a3) >= fabs(a3 * 0.000000999999997))
  {
    self->_double scalingFactor = a3;
    [(PKPaletteColorPickerView *)self _updateUI];
    [(PKPaletteColorPickerView *)self invalidateIntrinsicContentSize];
  }
}

- (CGSize)swatchSize
{
  v3 = [(PKPaletteColorPickerView *)self traitCollection];
  id v4 = [(PKPaletteColorPickerView *)self window];
  uint64_t v5 = [v4 windowScene];
  BOOL v6 = PKUseCompactSize(v3, v5);

  if (v6)
  {
    double v7 = PKPaletteColorSwatchSize(1);
  }
  else
  {
    double v9 = PKPaletteColorSwatchSize(0);
    double v11 = v10;
    [(PKPaletteColorPickerView *)self scalingFactor];
    double v13 = v11 * v12;
    double v7 = floor(v9 * v12);
    double v8 = floor(v13);
  }
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (void)_swatchLongPressHandler:(id)a3
{
  id v29 = a3;
  uint64_t v4 = [v29 state];
  switch(v4)
  {
    case 3:
      double v17 = [(PKPaletteColorPickerView *)self colorPickerController];
      long long v18 = [v17 viewController];
      [v18 dismissViewControllerAnimated:1 completion:0];

      id v19 = +[PKStatisticsManager sharedStatisticsManager]();
      [(PKPaletteColorPickerView *)self analyticsColorChangeCount];
      -[PKStatisticsManager recordColorsChangedBeforeChosen:]((uint64_t)v19);

      uint64_t v20 = +[PKStatisticsManager sharedStatisticsManager]();
      -[PKStatisticsManager recordColorPanelInvoked:]((uint64_t)v20, @"tapAndHold");
LABEL_8:

      break;
    case 2:
      v21 = [(PKPaletteColorPickerView *)self colorPickerController];
      v22 = [v21 viewController];
      v23 = [v22 view];
      [v29 locationInView:v23];
      double v25 = v24;
      double v27 = v26;

      uint64_t v20 = [(PKPaletteColorPickerView *)self colorPickerController];
      v28 = [v20 colorPicker];
      objc_msgSend(v28, "setSelectedColorForPoint:", v25, v27);

      goto LABEL_8;
    case 1:
      uint64_t v5 = [(PKPaletteColorPickerView *)self collectionView];
      [v29 locationInView:v5];
      double v7 = v6;
      double v9 = v8;

      double v10 = [(PKPaletteColorPickerView *)self collectionView];
      double v11 = [(PKPaletteColorPickerView *)self multicolorSwatch];
      objc_msgSend(v10, "convertPoint:toView:", v11, v7, v9);
      double v13 = v12;
      double v15 = v14;

      double v16 = [(PKPaletteColorPickerView *)self multicolorSwatch];
      LODWORD(v11) = objc_msgSend(v16, "pointInside:withEvent:", 0, v13, v15);

      if (v11) {
        [(PKPaletteColorPickerView *)self _showExtendedColorPicker];
      }
      break;
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  uint64_t v5 = objc_msgSend(a4, "view", a3);
  LOBYTE(self) = [v5 isDescendantOfView:self];

  return (char)self;
}

- (void)setEdgeLocation:(unint64_t)a3
{
  if (self->_edgeLocation != a3)
  {
    self->_edgeLocation = a3;
    uint64_t v4 = [(PKPaletteColorPickerView *)self traitCollection];
    [(PKPaletteColorPickerView *)self _reloadSwatchColorsForTraitCollection:v4];

    [(PKPaletteColorPickerView *)self invalidateIntrinsicContentSize];
    [(PKPaletteColorPickerView *)self _updateUI];
  }
}

- (CGSize)intrinsicContentSize
{
  v3 = [(PKPaletteColorPickerView *)self traitCollection];
  uint64_t v4 = [(PKPaletteColorPickerView *)self window];
  uint64_t v5 = [v4 windowScene];
  BOOL v6 = PKUseCompactSize(v3, v5);

  if (v6)
  {
    int64_t v7 = [(PKPaletteColorPickerView *)self colorPickerMode];
    if (v7 != 2)
    {
      if (v7 == 1)
      {
        double v19 = PKPaletteColorSwatchSize(1);
        double v10 = v20;
        v21 = [(PKPaletteColorPickerView *)self swatches];
        double v22 = v19 * (double)(unint64_t)[v21 count];

        v23 = [(PKPaletteColorPickerView *)self swatches];
        double v24 = (double)(unint64_t)([v23 count] - 1) * 12.0;

        double v8 = v22 + v24;
        goto LABEL_15;
      }
      if (v7)
      {
        double v8 = *MEMORY[0x1E4F1DB30];
        double v10 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
        goto LABEL_15;
      }
    }
    double v8 = PKPaletteColorSwatchSize(1);
    double v10 = v9;
  }
  else
  {
    unint64_t v11 = [(PKPaletteColorPickerView *)self edgeLocation];
    BOOL v13 = v11 == 2 || v11 == 8;
    double v14 = PKPaletteColorSwatchesSize(v13);
    double v16 = v15;
    [(PKPaletteColorPickerView *)self scalingFactor];
    double v18 = v17;
    double v8 = v14 * v17;
    double v10 = v16 * v18;
  }
LABEL_15:
  double v25 = v10;
  result.double height = v25;
  result.double width = v8;
  return result;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  uint64_t v4 = [(PKPaletteColorPickerView *)self swatches];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  double v8 = (objc_class *)objc_opt_class();
  double v9 = NSStringFromClass(v8);
  v49 = v6;
  double v10 = [v6 dequeueReusableCellWithReuseIdentifier:v9 forIndexPath:v7];

  unint64_t v11 = [v10 contentView];
  double v12 = [v11 subviews];
  [v12 makeObjectsPerformSelector:sel_removeFromSuperview];

  BOOL v13 = [(PKPaletteColorPickerView *)self swatches];
  v48 = v7;
  double v14 = objc_msgSend(v13, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));

  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v14 setUserInteractionEnabled:0];
  double v15 = [v10 contentView];
  [v15 addSubview:v14];

  [v14 hitTestInsets];
  objc_msgSend(v10, "setHitTestInsets:");
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  double v16 = [v10 interactions];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v50 objects:v55 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v51 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v50 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v10 removeInteraction:v21];
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v50 objects:v55 count:16];
    }
    while (v18);
  }

  if (v14) {
    double v22 = (void *)v14[54];
  }
  else {
    double v22 = 0;
  }
  id v23 = v22;
  [v10 addInteraction:v23];

  double v24 = (void *)MEMORY[0x1E4FB1EB0];
  double v25 = [v14 swatchColor];
  double v26 = [v25 color];
  double v27 = objc_msgSend(v24, "pk_hoverAttributedStringForColor:", v26);
  v28 = [v10 contentView];
  objc_msgSend(v28, "pk_setHoverLabelAttributedString:", v27);

  v40 = (void *)MEMORY[0x1E4F28DC8];
  v46 = [v14 widthAnchor];
  v47 = [v10 contentView];
  v45 = [v47 widthAnchor];
  v44 = [v46 constraintEqualToAnchor:v45];
  v54[0] = v44;
  v42 = [v14 heightAnchor];
  v43 = [v10 contentView];
  v41 = [v43 heightAnchor];
  v39 = [v42 constraintEqualToAnchor:v41];
  v54[1] = v39;
  v38 = [v14 centerXAnchor];
  id v29 = [v10 contentView];
  v30 = [v29 centerXAnchor];
  v31 = [v38 constraintEqualToAnchor:v30];
  v54[2] = v31;
  v32 = [v14 centerYAnchor];
  v33 = [v10 contentView];
  v34 = [v33 centerYAnchor];
  v35 = [v32 constraintEqualToAnchor:v34];
  v54[3] = v35;
  objc_super v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:4];
  [v40 activateConstraints:v36];

  return v10;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(PKPaletteColorPickerView *)self swatches];
  uint64_t v7 = [v5 row];

  id v20 = [v6 objectAtIndexedSubscript:v7];

  id v8 = [(PKPaletteColorPickerView *)self multicolorSwatch];

  if ([(PKPaletteColorPickerView *)self _shouldDisplayExtendedColorPickerPopoverFromColorSwatch:v20])
  {
    [(PKPaletteColorPickerView *)self _showExtendedColorPicker];
    double v9 = [(PKPaletteColorPickerView *)self colorPickerController];
    double v10 = [v9 viewController];
    char v11 = [v10 isBeingDismissed];

    if (v11) {
      goto LABEL_12;
    }
    double v12 = +[PKStatisticsManager sharedStatisticsManager]();
    -[PKStatisticsManager recordColorPanelInvoked:]((uint64_t)v12, @"tap");
  }
  else
  {
    BOOL v13 = [(PKPaletteColorPickerView *)self multicolorSwatch];
    int v14 = [v13 isSelected];

    double v15 = v20;
    if (v8 != v20 || (v14 & 1) != 0)
    {
      if (v14)
      {
        uint64_t v18 = [(PKPaletteColorPickerView *)self multicolorSwatch];
        [v18 setSelected:0];

        double v15 = v20;
      }
      uint64_t v17 = [v15 swatchColor];
      uint64_t v19 = [v17 color];
      [(PKPaletteColorPickerView *)self setSelectedColor:v19];
    }
    else
    {
      double v16 = [(PKPaletteColorPickerView *)self _selectedSwatch];
      [v16 setSelected:0];

      uint64_t v17 = [(PKPaletteColorPickerView *)self multicolorSwatch];
      [v17 setSelected:1];
    }

    double v12 = [(PKPaletteColorPickerView *)self delegate];
    [v12 colorPickerDidChangeSelectedColor:self isFromExtendedColorPicker:0 isContinuousColorSelection:0];
  }

LABEL_12:
}

- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(PKPaletteColorPickerView *)self swatches];
  uint64_t v7 = [v5 row];

  double v9 = [v6 objectAtIndexedSubscript:v7];

  id v8 = v9;
  if (v9 && !v9[409])
  {
    v9[409] = 1;
    -[PKPaletteColorSwatch _updateSelectionHighlight](v9);
    id v8 = v9;
  }
}

- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(PKPaletteColorPickerView *)self swatches];
  uint64_t v7 = [v5 row];

  double v9 = [v6 objectAtIndexedSubscript:v7];

  id v8 = v9;
  if (v9 && v9[409])
  {
    v9[409] = 0;
    -[PKPaletteColorSwatch _updateSelectionHighlight](v9);
    id v8 = v9;
  }
}

- (BOOL)_shouldDisplayExtendedColorPickerPopoverFromColorSwatch:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPaletteColorPickerView *)self multicolorSwatch];

  id v6 = [(PKPaletteColorPickerView *)self multicolorSwatch];
  uint64_t v7 = [v6 swatchColor];

  id v8 = [(PKPaletteColorPickerView *)self multicolorSwatch];
  int v9 = [v8 isSelected];

  int v10 = v9 | ![(PKPaletteColorPickerView *)self _colorPickerAllowsColorSelection];
  if (v7) {
    BOOL v11 = v10;
  }
  else {
    BOOL v11 = 1;
  }
  return v5 == v4 && v11;
}

- (BOOL)_colorPickerAllowsColorSelection
{
  v3 = [(PKPaletteColorPickerView *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 1;
  }
  id v5 = [(PKPaletteColorPickerView *)self delegate];
  char v6 = [v5 colorPickerShouldDisplayColorSelection:self];

  return v6;
}

- (UIColor)selectedColor
{
  v2 = [(PKPaletteColorPickerView *)self _selectedSwatch];
  v3 = [v2 swatchColor];
  char v4 = [v3 color];

  return (UIColor *)v4;
}

- (void)setSelectedColor:(id)a3
{
  id v17 = a3;
  id v4 = [(PKPaletteColorPickerView *)self selectedColor];
  if (v4 == v17)
  {

LABEL_17:
    id v8 = v17;
    goto LABEL_18;
  }
  id v5 = [(PKPaletteColorPickerView *)self selectedColor];
  if (!v17 || !v5)
  {

LABEL_8:
    int v9 = [(PKPaletteColorPickerView *)self _selectedSwatch];
    [v9 setSelected:0];

    if (v17)
    {
      int v10 = [v17 colorWithAlphaComponent:1.0];
      BOOL v11 = [(PKPaletteColorPickerView *)self swatchWithColor:v10];

      if (v11)
      {
        double v12 = [(PKPaletteColorPickerView *)self multicolorSwatch];

        if (v11 == v12)
        {
          [(PKPaletteColorPickerView *)self _setMulticolorSwatchColor:v17];
          BOOL v13 = [(PKPaletteColorPickerView *)self multicolorSwatch];
          [v13 setSelected:1];
        }
      }
      else
      {
        [(PKPaletteColorPickerView *)self _setMulticolorSwatchColor:v17];
        int v14 = [(PKPaletteColorPickerView *)self multicolorSwatch];
        [v14 setSelected:1];

        BOOL v11 = [(PKPaletteColorPickerView *)self multicolorSwatch];
      }
      [v11 setSelected:1];
      double v15 = [(PKPaletteColorPickerView *)self multicolorSwatch];
      char v16 = [v15 isSelected];

      if ((v16 & 1) == 0) {
        [(PKPaletteColorPickerView *)self _setMulticolorSwatchColor:0];
      }
    }
    else
    {
      [(PKPaletteColorPickerView *)self _setMulticolorSwatchColor:0];
    }
    goto LABEL_17;
  }
  id v6 = [(PKPaletteColorPickerView *)self selectedColor];
  BOOL IsEqualToColorIgnoringOpacity = DKUColorIsEqualToColorIgnoringOpacity((CGColor *)[v6 CGColor], (CGColor *)objc_msgSend(v17, "CGColor"), 0);

  id v8 = v17;
  if (!IsEqualToColorIgnoringOpacity) {
    goto LABEL_8;
  }
LABEL_18:
}

- (void)setSupportsAlpha:(BOOL)a3
{
  BOOL v3 = a3;
  self->_supportsAlpha = a3;
  id v5 = [(PKPaletteColorPickerView *)self colorPickerController];
  id v4 = [v5 colorPicker];
  [v4 setSupportsAlpha:v3];
}

- (id)_selectedSwatch
{
  BOOL v3 = [(PKPaletteColorPickerView *)self swatches];
  uint64_t v4 = [v3 indexOfObjectPassingTest:&__block_literal_global_42_0];

  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = 0;
  }
  else
  {
    id v6 = [(PKPaletteColorPickerView *)self swatches];
    id v5 = [v6 objectAtIndexedSubscript:v4];
  }

  return v5;
}

uint64_t __43__PKPaletteColorPickerView__selectedSwatch__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isSelected];
}

- (id)swatchWithColor:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(PKPaletteColorPickerView *)self swatches];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __44__PKPaletteColorPickerView_swatchWithColor___block_invoke;
    v10[3] = &unk_1E64C9C68;
    id v11 = v4;
    uint64_t v6 = [v5 indexOfObjectPassingTest:v10];

    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v7 = 0;
    }
    else
    {
      id v8 = [(PKPaletteColorPickerView *)self swatches];
      uint64_t v7 = [v8 objectAtIndexedSubscript:v6];
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

BOOL __44__PKPaletteColorPickerView_swatchWithColor___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 swatchColor];
  id v4 = [v3 color];
  id v5 = *(void **)(a1 + 32);
  id v6 = v4;
  id v7 = v5;
  ConvertedToSRGB = DKUCGColorCreateConvertedToSRGB([v6 CGColor]);
  id v9 = v7;
  uint64_t v10 = [v9 CGColor];

  id v11 = DKUCGColorCreateConvertedToSRGB(v10);
  BOOL IsEqualToColorIgnoringOpacity = DKUColorIsEqualToColorIgnoringOpacity(ConvertedToSRGB, v11, 0);
  CGColorRelease(ConvertedToSRGB);
  CGColorRelease(v11);

  return IsEqualToColorIgnoringOpacity;
}

- (id)swatchWithIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(PKPaletteColorPickerView *)self swatches];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __49__PKPaletteColorPickerView_swatchWithIdentifier___block_invoke;
    v10[3] = &unk_1E64C9C68;
    id v11 = v4;
    uint64_t v6 = [v5 indexOfObjectPassingTest:v10];

    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v7 = 0;
    }
    else
    {
      id v8 = [(PKPaletteColorPickerView *)self swatches];
      id v7 = [v8 objectAtIndexedSubscript:v6];
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

uint64_t __49__PKPaletteColorPickerView_swatchWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 swatchColor];
  id v4 = [v3 identifier];
  uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  return v5;
}

- (id)colorAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v6 = [(PKPaletteColorPickerView *)self collectionView];
  -[PKPaletteColorPickerView convertPoint:toView:](self, "convertPoint:toView:", v6, x, y);
  double v8 = v7;
  double v10 = v9;

  id v11 = [(PKPaletteColorPickerView *)self collectionView];
  double v12 = objc_msgSend(v11, "indexPathForItemAtPoint:", v8, v10);

  if (v12)
  {
    BOOL v13 = [(PKPaletteColorPickerView *)self swatches];
    int v14 = objc_msgSend(v13, "objectAtIndexedSubscript:", objc_msgSend(v12, "row"));

    double v15 = [v14 swatchColor];
    char v16 = [v15 color];
  }
  else
  {
    char v16 = 0;
  }

  return v16;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  if (objc_msgSend(a4, "userInterfaceIdiom", a3)) {
    return -1;
  }
  else {
    return 1;
  }
}

- (void)_showExtendedColorPicker
{
  BOOL v3 = [(PKPaletteColorPickerView *)self delegate];
  id v4 = [v3 palettePopoverPresentingController];

  if (v4)
  {
    uint64_t v5 = [(PKPaletteColorPickerView *)self colorPickerController];
    id v6 = [v5 viewController];
    if (!v6)
    {

      goto LABEL_7;
    }
    double v7 = v6;
    if ([v6 isBeingPresented])
    {

      goto LABEL_12;
    }
    char v8 = [v7 isBeingDismissed];

    if ((v8 & 1) == 0)
    {
LABEL_7:
      uint64_t v5 = [(PKPaletteColorPickerView *)self _popoverPresentingSourceView];
      if (!v5)
      {
        v64 = os_log_create("com.apple.pencilkit", "PKPalette");
        if (os_log_type_enabled(v64, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1C44F8000, v64, OS_LOG_TYPE_FAULT, "sourceView shouldn't be nil when presenting a popover", buf, 2u);
        }

        goto LABEL_16;
      }
      double v9 = +[PKPaletteColorPickerControllerFactory makeColorPickerController];
      [(PKPaletteColorPickerView *)self setColorPickerController:v9];

      int64_t v10 = [(PKPaletteColorPickerView *)self colorUserInterfaceStyle];
      id v11 = [(PKPaletteColorPickerView *)self colorPickerController];
      double v12 = [v11 colorPicker];
      [v12 setColorUserInterfaceStyle:v10];

      BOOL v13 = [(PKPaletteColorPickerView *)self supportsAlpha];
      int v14 = [(PKPaletteColorPickerView *)self colorPickerController];
      double v15 = [v14 colorPicker];
      [v15 setSupportsAlpha:v13];

      char v16 = [(PKPaletteColorPickerView *)self colorPickerController];
      id v17 = [v16 viewController];
      [v17 setModalPresentationStyle:7];

      uint64_t v18 = [(PKPaletteColorPickerView *)self colorPickerController];
      uint64_t v19 = [v18 viewController];
      id v20 = [v19 presentationController];
      [v20 setDelegate:self];

      uint64_t v21 = [(PKPaletteColorPickerView *)self delegate];
      uint64_t v22 = [v21 palettePopoverPermittedArrowDirections];
      id v23 = [(PKPaletteColorPickerView *)self colorPickerController];
      double v24 = [v23 viewController];
      double v25 = [v24 popoverPresentationController];
      [v25 setPermittedArrowDirections:v22];

      [(PKPaletteColorPickerView *)self _popoverPresentingSourceRect];
      double v27 = v26;
      double v29 = v28;
      double v31 = v30;
      double v33 = v32;
      v34 = [(PKPaletteColorPickerView *)self colorPickerController];
      v35 = [v34 viewController];
      objc_super v36 = [v35 popoverPresentationController];
      objc_msgSend(v36, "setSourceRect:", v27, v29, v31, v33);

      v37 = [(PKPaletteColorPickerView *)self colorPickerController];
      v38 = [v37 viewController];
      v39 = [v38 popoverPresentationController];
      [v39 setSourceView:v5];

      v40 = [(PKPaletteColorPickerView *)self colorPickerController];
      v41 = [v40 viewController];
      v42 = [v41 popoverPresentationController];
      [v42 _setShouldDisableInteractionDuringTransitions:0];

      v43 = [(PKPaletteColorPickerView *)self delegate];
      v44 = [v43 palettePopoverPassthroughViews];
      v45 = [(PKPaletteColorPickerView *)self colorPickerController];
      v46 = [v45 viewController];
      v47 = [v46 popoverPresentationController];
      [v47 setPassthroughViews:v44];

      v48 = [(PKPaletteColorPickerView *)self colorPickerController];
      v49 = [v48 viewController];
      long long v50 = [v49 popoverPresentationController];
      [v50 _setIgnoresKeyboardNotifications:1];

      [(PKPaletteColorPickerView *)self updatePopoverUI];
      long long v51 = [(PKPaletteColorPickerView *)self multicolorSwatch];
      LODWORD(v49) = [v51 isSelected];

      if (v49)
      {
        long long v52 = [(PKPaletteColorPickerView *)self multicolorSwatch];
        long long v53 = [v52 swatchColor];
        v54 = [v53 color];
        v55 = [(PKPaletteColorPickerView *)self colorPickerController];
        uint64_t v56 = [v55 colorPicker];
        [v56 setSelectedColor:v54];
      }
      v57 = [(PKPaletteColorPickerView *)self delegate];
      int v58 = [v57 shouldPalettePresentPopover];

      if (!v58)
      {
LABEL_16:

        goto LABEL_17;
      }
      v59 = +[PKStatisticsManager sharedStatisticsManager]();
      -[PKStatisticsManager recordColorPanelInvoked:]((uint64_t)v59, @"open");

      [(PKPaletteColorPickerView *)self setAnalyticsColorChangeCount:0];
      v60 = [(PKPaletteColorPickerView *)self colorPickerController];
      v61 = [v60 colorPicker];
      v62 = [v61 selectedColor];
      [(PKPaletteColorPickerView *)self setAnalyticsInitialColor:v62];

      double v7 = [(PKPaletteColorPickerView *)self colorPickerController];
      v63 = [v7 viewController];
      v65[0] = MEMORY[0x1E4F143A8];
      v65[1] = 3221225472;
      v65[2] = __52__PKPaletteColorPickerView__showExtendedColorPicker__block_invoke;
      v65[3] = &unk_1E64C61C0;
      v65[4] = self;
      [v4 presentViewController:v63 animated:1 completion:v65];

LABEL_12:
      goto LABEL_16;
    }
  }
LABEL_17:
}

void __52__PKPaletteColorPickerView__showExtendedColorPicker__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 colorPickerController];
  [v2 setDelegate:v1];
}

- (BOOL)_isExtendedColorPickerVisible
{
  BOOL v3 = [(PKPaletteColorPickerView *)self colorPickerController];

  if (!v3) {
    return 0;
  }
  id v4 = [(PKPaletteColorPickerView *)self delegate];
  uint64_t v5 = [v4 palettePopoverPresentingController];

  id v6 = [v5 presentedViewController];

  if (v6)
  {
    double v7 = [v5 presentedViewController];
    char v8 = [(PKPaletteColorPickerView *)self colorPickerController];
    double v9 = [v8 viewController];
    BOOL v10 = v7 == v9;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (CGRect)_popoverPresentingSourceRect
{
  BOOL v3 = [(PKPaletteColorPickerView *)self multicolorSwatch];
  [v3 bounds];
  CGRect v23 = CGRectInset(v22, -5.0, -5.0);
  CGFloat x = v23.origin.x;
  CGFloat y = v23.origin.y;
  CGFloat width = v23.size.width;
  CGFloat height = v23.size.height;

  char v8 = [(PKPaletteColorPickerView *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_5:

    goto LABEL_6;
  }
  double v9 = [(PKPaletteColorPickerView *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    char v8 = [(PKPaletteColorPickerView *)self delegate];
    if ([v8 wantsCustomPalettePopoverPresentationSource])
    {
      id v11 = [(PKPaletteColorPickerView *)self delegate];
      double v12 = [(PKPaletteColorPickerView *)self colorPickerController];
      BOOL v13 = [v12 viewController];
      [v11 palettePopoverSourceRectToPresentViewController:v13];
      CGFloat x = v14;
      CGFloat y = v15;
      CGFloat width = v16;
      CGFloat height = v17;
    }
    goto LABEL_5;
  }
LABEL_6:
  double v18 = x;
  double v19 = y;
  double v20 = width;
  double v21 = height;
  result.size.CGFloat height = v21;
  result.size.CGFloat width = v20;
  result.origin.CGFloat y = v19;
  result.origin.CGFloat x = v18;
  return result;
}

- (id)_popoverPresentingSourceView
{
  BOOL v3 = [(PKPaletteColorPickerView *)self multicolorSwatch];
  id v4 = [(PKPaletteColorPickerView *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_7;
  }
  uint64_t v5 = [(PKPaletteColorPickerView *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    double v7 = [(PKPaletteColorPickerView *)self delegate];
    int v8 = [v7 wantsCustomPalettePopoverPresentationSource];

    if (v8)
    {
      double v9 = [(PKPaletteColorPickerView *)self delegate];
      char v10 = [v9 palettePopoverSourceView];

      if (v10)
      {
        id v4 = v10;

        BOOL v3 = v4;
      }
      else
      {
        id v4 = 0;
      }
LABEL_7:
    }
  }

  return v3;
}

- (void)updatePopoverUI
{
  id v5 = [(PKPaletteColorPickerView *)self delegate];
  BOOL v3 = [(PKPaletteColorPickerView *)self colorPickerController];
  id v4 = [v3 viewController];
  [v5 updatePalettePopover:v4];
}

- (void)colorPickerControllerDidChangeSelectedColor:(id)a3 isContinuousColorSelection:(BOOL)a4
{
  BOOL v4 = a4;
  char v6 = [a3 colorPicker];
  id v10 = [v6 selectedColor];

  double v7 = [(PKPaletteColorPickerView *)self _selectedSwatch];
  [v7 setSelected:0];

  int v8 = [(PKPaletteColorPickerView *)self multicolorSwatch];
  [v8 setSelected:1];

  [(PKPaletteColorPickerView *)self _setMulticolorSwatchColor:v10];
  double v9 = [(PKPaletteColorPickerView *)self delegate];
  [v9 colorPickerDidChangeSelectedColor:self isFromExtendedColorPicker:1 isContinuousColorSelection:v4];

  [(PKPaletteColorPickerView *)self setAnalyticsColorChangeCount:[(PKPaletteColorPickerView *)self analyticsColorChangeCount] + 1];
}

- (void)_setMulticolorSwatchColor:(id)a3
{
  if (a3)
  {
    +[PKSwatchColor swatchColor:identifier:]((uint64_t)PKSwatchColor, a3, @"multi");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v4 = [(PKPaletteColorPickerView *)self multicolorSwatch];
    [v4 setSwatchColor:v5];
  }
  else
  {
    id v5 = [(PKPaletteColorPickerView *)self multicolorSwatch];
    [v5 setSwatchColor:0];
  }
}

- (void)dismissPalettePopoverWithCompletion:(id)a3
{
  id v18 = a3;
  BOOL v4 = [(PKPaletteColorPickerView *)self colorPickerController];

  if (v4)
  {
    id v5 = [(PKPaletteColorPickerView *)self colorPickerController];
    id v6 = [v5 viewController];
    if (v6)
    {
      double v7 = v6;
      if ([v6 isBeingPresented])
      {

LABEL_11:
        goto LABEL_12;
      }
      char v9 = [v7 isBeingDismissed];

      if (v9)
      {
LABEL_12:
        double v16 = [(PKPaletteColorPickerView *)self colorPickerController];
        double v17 = [v16 viewController];
        [v17 dismissViewControllerAnimated:1 completion:v18];

        goto LABEL_13;
      }
    }
    else
    {
    }
    id v10 = +[PKStatisticsManager sharedStatisticsManager]();
    [(PKPaletteColorPickerView *)self analyticsColorChangeCount];
    -[PKStatisticsManager recordColorsChangedBeforeChosen:]((uint64_t)v10);

    id v11 = [(PKPaletteColorPickerView *)self analyticsInitialColor];
    double v12 = [(PKPaletteColorPickerView *)self colorPickerController];
    BOOL v13 = [v12 colorPicker];
    double v14 = [v13 selectedColor];
    int v15 = [v11 isEqual:v14];

    if (v15)
    {
      id v5 = +[PKStatisticsManager sharedStatisticsManager]();
      -[PKStatisticsManager recordInkPickerNoOp:]((uint64_t)v5, @"colorPopover");
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  int v8 = v18;
  if (!v18) {
    goto LABEL_14;
  }
  (*((void (**)(id))v18 + 2))(v18);
LABEL_13:
  int v8 = v18;
LABEL_14:
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKPaletteColorPickerView;
  [(PKPaletteColorPickerView *)&v12 traitCollectionDidChange:v4];
  if (v4)
  {
    id v5 = [(PKPaletteColorPickerView *)self traitCollection];
    uint64_t v6 = [v5 verticalSizeClass];
    if (v6 == [v4 verticalSizeClass])
    {
      double v7 = [(PKPaletteColorPickerView *)self traitCollection];
      uint64_t v8 = [v7 horizontalSizeClass];
      if (v8 == [v4 horizontalSizeClass])
      {
        char v9 = [(PKPaletteColorPickerView *)self traitCollection];
        uint64_t v10 = [v9 userInterfaceStyle];
        uint64_t v11 = [v4 userInterfaceStyle];

        if (v10 == v11) {
          goto LABEL_9;
        }
        goto LABEL_8;
      }
    }
LABEL_8:
    [(PKPaletteColorPickerView *)self updatePopoverUI];
    [(PKPaletteColorPickerView *)self reloadColorsForCurrentColorPickerMode];
    [(PKPaletteColorPickerView *)self _updateUI];
    [(PKPaletteColorPickerView *)self invalidateIntrinsicContentSize];
  }
LABEL_9:
}

- (void)setColorUserInterfaceStyle:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (self->_colorUserInterfaceStyle != a3)
  {
    self->_colorUserInterfaceStyle = a3;
    id v5 = [(PKPaletteColorPickerView *)self colorPickerController];
    uint64_t v6 = [v5 colorPicker];
    [v6 setColorUserInterfaceStyle:a3];

    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    double v7 = [(PKPaletteColorPickerView *)self swatches];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          -[PKPaletteColorSwatch setColorUserInterfaceStyle:](*(void **)(*((void *)&v12 + 1) + 8 * i), a3);
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

- (void)_reloadSwatchColorsForTraitCollection:(id)a3
{
  id v11 = a3;
  id v4 = [(PKPaletteColorPickerView *)self selectedColor];
  id v5 = [(PKPaletteColorPickerView *)self swatchWithColor:v4];
  uint64_t v6 = [v5 swatchColor];
  double v7 = [v6 identifier];

  if ([v7 isEqualToString:@"multi"])
  {

    double v7 = 0;
  }
  uint64_t v8 = [(PKPaletteColorPickerView *)self _swatchColorsForTraitCollection:v11];
  [(PKPaletteColorPickerView *)self setSwatchColors:v8];

  [(PKPaletteColorPickerView *)self _rebuildSwatches];
  uint64_t v9 = [(PKPaletteColorPickerView *)self swatchWithIdentifier:v7];
  uint64_t v10 = v9;
  if (v9) {
    [v9 setSelected:1];
  }
  else {
    [(PKPaletteColorPickerView *)self setSelectedColor:v4];
  }
}

- (void)toggleColorSelectionPopover
{
  BOOL v3 = [(PKPaletteColorPickerView *)self colorPickerController];
  id v4 = [v3 viewController];
  if ([v4 isBeingPresented])
  {

LABEL_4:
    [(PKPaletteColorPickerView *)self dismissPalettePopoverWithCompletion:0];
    return;
  }
  id v5 = [(PKPaletteColorPickerView *)self colorPickerController];
  uint64_t v6 = [v5 viewController];
  double v7 = [v6 presentingViewController];

  if (v7) {
    goto LABEL_4;
  }

  [(PKPaletteColorPickerView *)self _showExtendedColorPicker];
}

- (void)setColorPickerMode:(int64_t)a3
{
  if (self->_colorPickerMode != a3)
  {
    self->_colorPickerMode = a3;
    [(PKPaletteColorPickerView *)self reloadColorsForCurrentColorPickerMode];
    [(PKPaletteColorPickerView *)self invalidateIntrinsicContentSize];
  }
}

- (void)reloadColorsForCurrentColorPickerMode
{
  v12[2] = *MEMORY[0x1E4F143B8];
  if ([(PKPaletteColorPickerView *)self colorPickerMode] == 1)
  {
    BOOL v3 = [MEMORY[0x1E4FB1E20] traitCollectionWithHorizontalSizeClass:2];
    id v4 = (void *)MEMORY[0x1E4FB1E20];
    v12[0] = v3;
    id v5 = [(PKPaletteColorPickerView *)self traitCollectionWithCurrentInterfaceStyle];
    v12[1] = v5;
    uint64_t v6 = (void *)MEMORY[0x1E4F1C978];
    double v7 = v12;
LABEL_5:
    uint64_t v8 = [v6 arrayWithObjects:v7 count:2];
    uint64_t v9 = [v4 traitCollectionWithTraitsFromCollections:v8];

    [(PKPaletteColorPickerView *)self _reloadSwatchColorsForTraitCollection:v9];
    return;
  }
  if ([(PKPaletteColorPickerView *)self colorPickerMode] == 2)
  {
    BOOL v3 = [MEMORY[0x1E4FB1E20] traitCollectionWithHorizontalSizeClass:1];
    id v4 = (void *)MEMORY[0x1E4FB1E20];
    v11[0] = v3;
    id v5 = [(PKPaletteColorPickerView *)self traitCollectionWithCurrentInterfaceStyle];
    v11[1] = v5;
    uint64_t v6 = (void *)MEMORY[0x1E4F1C978];
    double v7 = v11;
    goto LABEL_5;
  }
  id v10 = [(PKPaletteColorPickerView *)self traitCollection];
  -[PKPaletteColorPickerView _reloadSwatchColorsForTraitCollection:](self, "_reloadSwatchColorsForTraitCollection:");
}

- (id)traitCollectionWithCurrentInterfaceStyle
{
  id v2 = (void *)MEMORY[0x1E4FB1E20];
  BOOL v3 = [(PKPaletteColorPickerView *)self traitCollection];
  id v4 = objc_msgSend(v2, "traitCollectionWithUserInterfaceStyle:", objc_msgSend(v3, "userInterfaceStyle"));

  return v4;
}

- (unint64_t)edgeLocation
{
  return self->_edgeLocation;
}

- (unint64_t)cornerLocation
{
  return self->_cornerLocation;
}

- (void)setCornerLocation:(unint64_t)a3
{
  self->_cornerLocation = a3;
}

- (double)scalingFactor
{
  return self->_scalingFactor;
}

- (BOOL)supportsAlpha
{
  return self->_supportsAlpha;
}

- (PKPalettePopoverPresenting)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPalettePopoverPresenting *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)colorUserInterfaceStyle
{
  return self->_colorUserInterfaceStyle;
}

- (PKPaletteMulticolorSwatch)multicolorSwatch
{
  return self->_multicolorSwatch;
}

- (void)setMulticolorSwatch:(id)a3
{
}

- (int64_t)colorPickerMode
{
  return self->_colorPickerMode;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (NSArray)swatches
{
  return self->_swatches;
}

- (void)setSwatches:(id)a3
{
}

- (NSArray)swatchColors
{
  return self->_swatchColors;
}

- (UILongPressGestureRecognizer)longPressGestureRecognizer
{
  return self->_longPressGestureRecognizer;
}

- (void)setLongPressGestureRecognizer:(id)a3
{
}

- (PKPaletteColorPickerController)colorPickerController
{
  return self->_colorPickerController;
}

- (void)setColorPickerController:(id)a3
{
}

- (UIColor)analyticsInitialColor
{
  return self->_analyticsInitialColor;
}

- (void)setAnalyticsInitialColor:(id)a3
{
}

- (int64_t)analyticsColorChangeCount
{
  return self->_analyticsColorChangeCount;
}

- (void)setAnalyticsColorChangeCount:(int64_t)a3
{
  self->_analyticsColorChangeCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsInitialColor, 0);
  objc_storeStrong((id *)&self->_colorPickerController, 0);
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_swatchColors, 0);
  objc_storeStrong((id *)&self->_swatches, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_multicolorSwatch, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end