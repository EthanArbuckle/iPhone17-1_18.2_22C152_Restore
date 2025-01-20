@interface CAMZoomButtonPlatter
- (BOOL)isCollapsed;
- (CAMZoomButton)zoomFactorButton;
- (CAMZoomButtonPlatter)initWithFrame:(CGRect)a3;
- (CGSize)_intrinsicContentSizeForButtonCount:(unint64_t)a3;
- (CGSize)intrinsicContentSize;
- (NSArray)zoomFactors;
- (NSArray)zoomPoints;
- (NSMutableArray)_allButtons;
- (UIImageView)_platterBackgroundView;
- (double)_zoomFactorForButton:(id)a3 zoomPoint:(id)a4 isZoomFactorButton:(BOOL)a5;
- (double)defaultZoomFactorForButton:(id)a3;
- (double)zoomFactor;
- (id)_createPlatterImageForContentSize:(id)a3;
- (id)_createZoomButton;
- (id)_indexesForChanges:(id)a3;
- (id)baseZoomPointForButton:(id)a3;
- (id)nearestZoomButtonForTouch:(id)a3;
- (int64_t)buttonAccessoryPosition;
- (int64_t)buttonAccessoryState;
- (int64_t)orientation;
- (int64_t)preferredCustomLens;
- (unint64_t)_focalLengthFlashID;
- (unint64_t)buttonCount;
- (void)_cancelFocalLengthFlash;
- (void)_flashFocalLengthIfNeeded;
- (void)_setFocalLengthFlashID:(unint64_t)a3;
- (void)_updateBackgroundAnimated:(BOOL)a3;
- (void)_updateButtonAccessoryAnimated:(BOOL)a3;
- (void)_updateButtonsAnimated:(BOOL)a3;
- (void)_updateForContentSize;
- (void)layoutSubviews;
- (void)setButtonAccessoryPosition:(int64_t)a3;
- (void)setButtonAccessoryPosition:(int64_t)a3 animated:(BOOL)a4;
- (void)setButtonAccessoryState:(int64_t)a3;
- (void)setButtonAccessoryState:(int64_t)a3 animated:(BOOL)a4;
- (void)setCollapsed:(BOOL)a3;
- (void)setCollapsed:(BOOL)a3 animated:(BOOL)a4;
- (void)setOrientation:(int64_t)a3;
- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4;
- (void)setPreferredCustomLens:(int64_t)a3;
- (void)setZoomFactor:(double)a3;
- (void)setZoomFactor:(double)a3 allowFlashingSubstate:(BOOL)a4 animated:(BOOL)a5;
- (void)setZoomPoints:(id)a3;
- (void)setZoomPoints:(id)a3 animated:(BOOL)a4;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CAMZoomButtonPlatter

- (CAMZoomButtonPlatter)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CAMZoomButtonPlatter;
  v3 = -[CAMZoomButtonPlatter initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x263F82828]);
    platterBackgroundView = v3->__platterBackgroundView;
    v3->__platterBackgroundView = v4;

    [(CAMZoomButtonPlatter *)v3 addSubview:v3->__platterBackgroundView];
    uint64_t v6 = [MEMORY[0x263EFF980] array];
    allButtons = v3->__allButtons;
    v3->__allButtons = (NSMutableArray *)v6;

    zoomPoints = v3->_zoomPoints;
    v3->_zoomPoints = (NSArray *)MEMORY[0x263EFFA68];

    v3->_preferredCustomLens = 0;
    [(CAMZoomButtonPlatter *)v3 _updateForContentSize];
    v9 = v3;
  }

  return v3;
}

- (void)layoutSubviews
{
  [(CAMZoomButtonPlatter *)self bounds];
  [(CAMZoomButtonPlatter *)self intrinsicContentSize];
  UIRectCenteredIntegralRectScale();
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  objc_super v11 = [(CAMZoomButtonPlatter *)self _platterBackgroundView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  unint64_t v12 = [(CAMZoomButtonPlatter *)self buttonCount];
  v13 = [(CAMZoomButtonPlatter *)self traitCollection];
  v14 = [v13 preferredContentSizeCategory];
  +[CAMZoomButton circleDiameterForContentSize:v14];
  double v16 = v15 * 0.5;

  UIRectGetCenter();
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  v26.origin.x = v4;
  v26.origin.y = v6;
  v26.size.width = v8;
  v26.size.height = v10;
  double v21 = v16 + CGRectGetMinX(v26) + 3.0;
  v27.origin.x = v4;
  v27.origin.y = v6;
  v27.size.width = v8;
  v27.size.height = v10;
  double MaxX = CGRectGetMaxX(v27);
  double v23 = 0.0;
  if (v12 >= 2) {
    double v23 = (MaxX - v16 + -3.0 - v21) / (double)(v12 - 1);
  }
  v24 = [(CAMZoomButtonPlatter *)self _allButtons];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __38__CAMZoomButtonPlatter_layoutSubviews__block_invoke;
  v25[3] = &__block_descriptor_64_e30_v32__0__CAMZoomButton_8Q16_B24l;
  v25[4] = v18;
  v25[5] = v20;
  *(double *)&v25[6] = v21;
  *(double *)&v25[7] = v23;
  [v24 enumerateObjectsUsingBlock:v25];
}

void __38__CAMZoomButtonPlatter_layoutSubviews__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  [v6 intrinsicContentSize];
  UIRectCenteredAboutPointScale();
  objc_msgSend(v6, "frameForAlignmentRect:");
  CAMViewSetBoundsAndCenterForFrame(v6, v2, v3, v4, v5);
}

- (CGSize)intrinsicContentSize
{
  if ([(CAMZoomButtonPlatter *)self isCollapsed]) {
    unint64_t v3 = 1;
  }
  else {
    unint64_t v3 = [(CAMZoomButtonPlatter *)self buttonCount];
  }
  [(CAMZoomButtonPlatter *)self _intrinsicContentSizeForButtonCount:v3];
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGSize)_intrinsicContentSizeForButtonCount:(unint64_t)a3
{
  double v4 = [(CAMZoomButtonPlatter *)self traitCollection];
  double v5 = [v4 preferredContentSizeCategory];
  +[CAMZoomButton circleDiameterForContentSize:v5];
  double v7 = v6;

  double v8 = v7 + 6.0;
  double v9 = (double)(a3 + 1) * 3.0 + v7 * (double)a3;
  result.height = v8;
  result.width = v9;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v6 = [a3 preferredContentSizeCategory];
  double v4 = [(CAMZoomButtonPlatter *)self traitCollection];
  id v5 = [v4 preferredContentSizeCategory];

  if (v5 != v6 && ([v5 isEqualToString:v6] & 1) == 0)
  {
    [(CAMZoomButtonPlatter *)self _updateForContentSize];
    [(CAMZoomButtonPlatter *)self setNeedsLayout];
  }
}

- (unint64_t)buttonCount
{
  double v2 = [(CAMZoomButtonPlatter *)self zoomPoints];
  unint64_t v3 = [v2 count];

  return v3;
}

- (void)setZoomFactor:(double)a3
{
}

- (void)setZoomFactor:(double)a3 allowFlashingSubstate:(BOOL)a4 animated:(BOOL)a5
{
  if (self->_zoomFactor != a3)
  {
    BOOL v5 = a5;
    self->_zoomFactor = a3;
    if (a4 && a5) {
      [(CAMZoomButtonPlatter *)self _flashFocalLengthIfNeeded];
    }
    [(CAMZoomButtonPlatter *)self _updateButtonsAnimated:v5];
    [(CAMZoomButtonPlatter *)self _updateButtonAccessoryAnimated:0];
  }
}

- (CAMZoomButton)zoomFactorButton
{
  unint64_t v3 = [(CAMZoomButtonPlatter *)self zoomPoints];
  uint64_t v14 = 0;
  double v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__12;
  uint64_t v18 = __Block_byref_object_dispose__12;
  id v19 = 0;
  [(CAMZoomButtonPlatter *)self zoomFactor];
  uint64_t v5 = v4;
  id v6 = [(CAMZoomButtonPlatter *)self _allButtons];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __40__CAMZoomButtonPlatter_zoomFactorButton__block_invoke;
  v10[3] = &unk_263FA3ED8;
  id v7 = v3;
  uint64_t v13 = v5;
  id v11 = v7;
  unint64_t v12 = &v14;
  [v6 enumerateObjectsWithOptions:2 usingBlock:v10];

  id v8 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return (CAMZoomButton *)v8;
}

void __40__CAMZoomButtonPlatter_zoomFactorButton__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v12 = a2;
  id v8 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  double v9 = [v8 fundamentalZoomPoint];
  [v9 displayZoomFactor];
  double v11 = v10;

  if (*(double *)(a1 + 48) >= v11)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (void)setZoomPoints:(id)a3
{
}

- (void)setZoomPoints:(id)a3 animated:(BOOL)a4
{
  BOOL v49 = a4;
  uint64_t v82 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v46 = [v5 count];
  if (([v5 isEqualToArray:self->_zoomPoints] & 1) == 0)
  {
    v42 = v5;
    id v6 = [(CAMZoomButtonPlatter *)self _allButtons];
    v43 = (void *)[v6 copy];
    v40 = [(CAMZoomButtonPlatter *)self zoomPoints];
    uint64_t v45 = [v40 count];
    v41 = [v5 differenceFromArray:v40 withOptions:0 usingEquivalenceTest:&__block_literal_global_32];
    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    id v7 = [v41 removals];
    id obj = [v7 reverseObjectEnumerator];

    uint64_t v8 = [obj countByEnumeratingWithState:&v76 objects:v81 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v77;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v77 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = [*(id *)(*((void *)&v76 + 1) + 8 * i) index];
          id v12 = [v6 objectAtIndexedSubscript:v11];
          [v6 removeObjectAtIndex:v11];
          if (v49)
          {
            uint64_t v13 = [v12 layer];
            uint64_t v14 = [v13 presentationLayer];
            double v15 = v14;
            if (v14)
            {
              id v16 = v14;
            }
            else
            {
              id v16 = [v12 layer];
            }
            uint64_t v17 = v16;

            [v17 position];
            objc_msgSend(v12, "setCenter:");
            [v17 opacity];
            [v12 setAlpha:v18];
            uint64_t v19 = MEMORY[0x263EF8330];
            v71[0] = MEMORY[0x263EF8330];
            v71[1] = 3221225472;
            v71[2] = __47__CAMZoomButtonPlatter_setZoomPoints_animated___block_invoke_2;
            v71[3] = &unk_263FA3F20;
            uint64_t v74 = v45;
            uint64_t v75 = v11;
            uint64_t v73 = v46;
            v71[4] = self;
            id v72 = v12;
            v69[0] = v19;
            v69[1] = 3221225472;
            v69[2] = __47__CAMZoomButtonPlatter_setZoomPoints_animated___block_invoke_3;
            v69[3] = &unk_263FA0430;
            id v70 = v72;
            +[CAMView animateIfNeededWithDuration:v71 animations:v69 completion:0.3];
          }
          else
          {
            [v12 removeFromSuperview];
          }
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v76 objects:v81 count:16];
      }
      while (v8);
    }

    uint64_t v20 = [v41 insertions];
    v44 = [(CAMZoomButtonPlatter *)self _indexesForChanges:v20];
    uint64_t v63 = 0;
    v64 = &v63;
    uint64_t v65 = 0x3010000000;
    v66 = "";
    uint64_t v67 = 0;
    uint64_t v68 = 0;
    v62[0] = MEMORY[0x263EF8330];
    v62[1] = 3221225472;
    v62[2] = __47__CAMZoomButtonPlatter_setZoomPoints_animated___block_invoke_4;
    v62[3] = &unk_263FA3F48;
    v62[4] = &v63;
    [v44 enumerateRangesUsingBlock:v62];
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v21 = v20;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v58 objects:v80 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v59;
      id obja = (id)(v45 - 1);
      do
      {
        uint64_t v24 = 0;
        do
        {
          if (*(void *)v59 != v23) {
            objc_enumerationMutation(v21);
          }
          unint64_t v25 = [*(id *)(*((void *)&v58 + 1) + 8 * v24) index];
          CGRect v26 = [(CAMZoomButtonPlatter *)self _createZoomButton];
          [v6 insertObject:v26 atIndex:v25];
          [(CAMZoomButtonPlatter *)self addSubview:v26];
          if (v49)
          {
            if (v64[4])
            {
              if (v25 < (unint64_t)obja) {
                goto LABEL_33;
              }
LABEL_30:
              v29 = [v43 lastObject];
              goto LABEL_31;
            }
            unint64_t v27 = v64[5];
            if (v25 < v27 || v25 >= (unint64_t)obja)
            {
              if (v25 >= v27) {
                goto LABEL_30;
              }
              v29 = [v43 firstObject];
LABEL_31:
              v30 = v29;
              [v29 center];
              objc_msgSend(v26, "setCenter:");
              [v30 bounds];
              objc_msgSend(v26, "setBounds:");
              if (v30)
              {
                [v30 transform];
              }
              else
              {
                long long v56 = 0u;
                long long v57 = 0u;
                long long v55 = 0u;
              }
              v54[0] = v55;
              v54[1] = v56;
              v54[2] = v57;
              [v26 setTransform:v54];
            }
            else
            {
LABEL_33:
              v31 = [(CAMZoomButtonPlatter *)self traitCollection];
              v32 = [v31 preferredContentSizeCategory];
              +[CAMZoomButton circleDiameterForContentSize:v32];
              double v34 = v33;

              objc_msgSend(v26, "setBounds:", 0.0, 0.0, v34, v34);
              [(CAMZoomButtonPlatter *)self bounds];
              UIRectGetCenter();
              objc_msgSend(v26, "setCenter:");
              CGAffineTransformMakeScale(&v53, 0.65, 0.65);
              CGAffineTransform v52 = v53;
              [v26 setTransform:&v52];
            }
            [v26 setAlpha:0.0];
            [v26 layoutIfNeeded];
            v50[0] = MEMORY[0x263EF8330];
            v50[1] = 3221225472;
            v50[2] = __47__CAMZoomButtonPlatter_setZoomPoints_animated___block_invoke_5;
            v50[3] = &unk_263FA0208;
            id v51 = v26;
            +[CAMView animateIfNeededWithDuration:v50 animations:0.3];
          }
          ++v24;
        }
        while (v22 != v24);
        uint64_t v35 = [v21 countByEnumeratingWithState:&v58 objects:v80 count:16];
        uint64_t v22 = v35;
      }
      while (v35);
    }

    v36 = (NSArray *)[v42 copy];
    zoomPoints = self->_zoomPoints;
    self->_zoomPoints = v36;

    v38 = +[CAMZoomPoint displayZoomFactorsFromZoomPoints:v42];
    zoomFactors = self->_zoomFactors;
    self->_zoomFactors = v38;

    [(CAMZoomButtonPlatter *)self _updateButtonsAnimated:0];
    [(CAMZoomButtonPlatter *)self _updateButtonAccessoryAnimated:0];
    [(CAMZoomButtonPlatter *)self _cancelFocalLengthFlash];
    if (v46 != v45) {
      [(CAMZoomButtonPlatter *)self invalidateIntrinsicContentSize];
    }
    _Block_object_dispose(&v63, 8);

    id v5 = v42;
  }
}

BOOL __47__CAMZoomButtonPlatter_setZoomPoints_animated___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 fundamentalZoomPoint];
  [v5 displayZoomFactor];
  double v7 = v6;
  uint64_t v8 = [v4 fundamentalZoomPoint];

  [v8 displayZoomFactor];
  BOOL v10 = v7 == v9;

  return v10;
}

uint64_t __47__CAMZoomButtonPlatter_setZoomPoints_animated___block_invoke_2(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 56);
  if (*(void *)(a1 + 48) < v2 && *(void *)(a1 + 64) >= v2 >> 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_intrinsicContentSizeForButtonCount:");
    double v4 = v3;
    [*(id *)(a1 + 32) _intrinsicContentSizeForButtonCount:*(void *)(a1 + 48)];
    double v6 = v5;
    [*(id *)(a1 + 40) center];
    [*(id *)(a1 + 40) setCenter:v7 + (v4 - v6) * -0.5];
  }
  uint64_t v8 = *(void **)(a1 + 40);
  return [v8 setAlpha:0.0];
}

uint64_t __47__CAMZoomButtonPlatter_setZoomPoints_animated___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

uint64_t __47__CAMZoomButtonPlatter_setZoomPoints_animated___block_invoke_4(uint64_t result, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v4 = *(void *)(*(void *)(result + 32) + 8);
  *(void *)(v4 + 32) = a2;
  *(void *)(v4 + 40) = a3;
  *a4 = 1;
  return result;
}

uint64_t __47__CAMZoomButtonPlatter_setZoomPoints_animated___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

- (id)nearestZoomButtonForTouch:(id)a3
{
  id v4 = a3;
  [v4 locationInView:self];
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  float v18 = __Block_byref_object_copy__12;
  uint64_t v19 = __Block_byref_object_dispose__12;
  id v20 = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v14[3] = 0x7FEFFFFFFFFFFFFFLL;
  if ([(CAMZoomButtonPlatter *)self isCollapsed])
  {
    uint64_t v9 = [(CAMZoomButtonPlatter *)self zoomFactorButton];
    BOOL v10 = (void *)v16[5];
    v16[5] = v9;
  }
  else
  {
    BOOL v10 = [(CAMZoomButtonPlatter *)self _allButtons];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __50__CAMZoomButtonPlatter_nearestZoomButtonForTouch___block_invoke;
    v13[3] = &unk_263FA3F70;
    v13[6] = v6;
    v13[7] = v8;
    v13[4] = v14;
    v13[5] = &v15;
    [v10 enumerateObjectsUsingBlock:v13];
  }

  id v11 = (id)v16[5];
  _Block_object_dispose(v14, 8);
  _Block_object_dispose(&v15, 8);

  return v11;
}

void __50__CAMZoomButtonPlatter_nearestZoomButtonForTouch___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  [v9 center];
  UIDistanceBetweenPoints();
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v7 >= *(double *)(v8 + 24))
  {
    *a4 = 1;
  }
  else
  {
    *(double *)(v8 + 24) = v7;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

- (id)baseZoomPointForButton:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CAMZoomButtonPlatter *)self _allButtons];
  unint64_t v6 = [v5 indexOfObject:v4];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL
    || ([(CAMZoomButtonPlatter *)self zoomPoints],
        double v7 = objc_claimAutoreleasedReturnValue(),
        unint64_t v8 = [v7 count],
        v7,
        v6 >= v8))
  {
    BOOL v10 = 0;
  }
  else
  {
    id v9 = [(CAMZoomButtonPlatter *)self zoomPoints];
    BOOL v10 = [v9 objectAtIndexedSubscript:v6];
  }
  return v10;
}

- (double)defaultZoomFactorForButton:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CAMZoomButtonPlatter *)self baseZoomPointForButton:v4];
  [(CAMZoomButtonPlatter *)self _zoomFactorForButton:v4 zoomPoint:v5 isZoomFactorButton:0];
  double v7 = v6;

  return v7;
}

- (void)setCollapsed:(BOOL)a3
{
}

- (void)setCollapsed:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_collapsed != a3)
  {
    if (a4)
    {
      [(CAMZoomButtonPlatter *)self layoutIfNeeded];
      self->_collapsed = a3;
      [(CAMZoomButtonPlatter *)self _updateButtonsAnimated:1];
      [(CAMZoomButtonPlatter *)self _updateBackgroundAnimated:1];
      [(CAMZoomButtonPlatter *)self _updateButtonAccessoryAnimated:1];
      [(CAMZoomButtonPlatter *)self setNeedsLayout];
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = __46__CAMZoomButtonPlatter_setCollapsed_animated___block_invoke;
      v6[3] = &unk_263FA0208;
      v6[4] = self;
      [MEMORY[0x263F82E00] animateWithDuration:v6 animations:0.3];
    }
    else
    {
      self->_collapsed = a3;
      [(CAMZoomButtonPlatter *)self _updateButtonsAnimated:0];
      [(CAMZoomButtonPlatter *)self _updateBackgroundAnimated:0];
      [(CAMZoomButtonPlatter *)self _updateButtonAccessoryAnimated:0];
      [(CAMZoomButtonPlatter *)self setNeedsLayout];
    }
  }
}

uint64_t __46__CAMZoomButtonPlatter_setCollapsed_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)setButtonAccessoryState:(int64_t)a3
{
}

- (void)setButtonAccessoryState:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_buttonAccessoryState != a3)
  {
    self->_buttonAccessoryState = a3;
    [(CAMZoomButtonPlatter *)self _updateButtonAccessoryAnimated:a4];
  }
}

- (void)setButtonAccessoryPosition:(int64_t)a3
{
}

- (void)setButtonAccessoryPosition:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_buttonAccessoryPosition != a3)
  {
    self->_buttonAccessoryPosition = a3;
    [(CAMZoomButtonPlatter *)self _updateButtonAccessoryAnimated:a4];
  }
}

- (void)_updateButtonAccessoryAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v20 = *MEMORY[0x263EF8340];
  int64_t v5 = [(CAMZoomButtonPlatter *)self buttonAccessoryState];
  double v6 = [(CAMZoomButtonPlatter *)self zoomFactorButton];
  BOOL v7 = [(CAMZoomButtonPlatter *)self isCollapsed];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  unint64_t v8 = [(CAMZoomButtonPlatter *)self _allButtons];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v15 + 1) + 8 * v12);
        if (v7 && v13 == v6) {
          int64_t v14 = v5;
        }
        else {
          int64_t v14 = 0;
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * v12) setAccessoryState:v14 animated:v3];
        objc_msgSend(v13, "setAccessoryPosition:animated:", -[CAMZoomButtonPlatter buttonAccessoryPosition](self, "buttonAccessoryPosition"), v3);
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
}

- (void)setPreferredCustomLens:(int64_t)a3
{
  if (self->_preferredCustomLens != a3)
  {
    self->_preferredCustomLens = a3;
    [(CAMZoomButtonPlatter *)self _updateButtonsAnimated:0];
  }
}

- (void)_updateForContentSize
{
  BOOL v3 = [(CAMZoomButtonPlatter *)self traitCollection];
  id v6 = [v3 preferredContentSizeCategory];

  id v4 = [(CAMZoomButtonPlatter *)self _createPlatterImageForContentSize:v6];
  int64_t v5 = [(CAMZoomButtonPlatter *)self _platterBackgroundView];
  [v5 setImage:v4];
}

- (void)_updateBackgroundAnimated:(BOOL)a3
{
  double v3 = 0.3;
  if (!a3) {
    double v3 = 0.0;
  }
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __50__CAMZoomButtonPlatter__updateBackgroundAnimated___block_invoke;
  v4[3] = &unk_263FA0208;
  v4[4] = self;
  +[CAMView animateIfNeededWithDuration:v4 animations:v3];
}

void __50__CAMZoomButtonPlatter__updateBackgroundAnimated___block_invoke(uint64_t a1)
{
  double v2 = (double)([*(id *)(a1 + 32) isCollapsed] ^ 1);
  id v3 = [*(id *)(a1 + 32) _platterBackgroundView];
  [v3 setAlpha:v2];
}

- (void)_updateButtonsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  int64_t v5 = [(CAMZoomButtonPlatter *)self zoomPoints];
  id v6 = [(CAMZoomButtonPlatter *)self _allButtons];
  BOOL v7 = [(CAMZoomButtonPlatter *)self zoomFactorButton];
  BOOL v8 = [(CAMZoomButtonPlatter *)self isCollapsed];
  uint64_t v9 = [v5 firstObject];
  [v9 displayZoomFactor];
  double v11 = v10;

  uint64_t v12 = [v5 lastObject];
  [v12 displayZoomFactor];
  double v14 = v13;

  float v15 = v11;
  double v16 = floorf(v15);
  long long v17 = +[CAMZoomButton zoomFactorFormatter];
  long long v18 = [v17 decimalSeparator];
  char v19 = [v18 isEqualToString:@","];

  float v20 = v14;
  double v21 = floorf(v20);
  if (v11 == v16 || v14 == v21)
  {
    if ([v6 count] == 2) {
      char v27 = 1;
    }
    else {
      char v27 = v19;
    }
  }
  else
  {
    char v27 = 1;
  }
  v28[1] = 3221225472;
  v28[0] = MEMORY[0x263EF8330];
  v28[2] = __47__CAMZoomButtonPlatter__updateButtonsAnimated___block_invoke;
  v28[3] = &unk_263FA3FC0;
  if (v3) {
    double v23 = 0.3;
  }
  else {
    double v23 = 0.0;
  }
  id v29 = v6;
  id v30 = v5;
  BOOL v33 = v3;
  BOOL v34 = v8;
  id v31 = v7;
  v32 = self;
  char v35 = v27;
  id v24 = v7;
  id v25 = v5;
  id v26 = v6;
  +[CAMView animateIfNeededWithDuration:v28 animations:v23];
}

void __47__CAMZoomButtonPlatter__updateButtonsAnimated___block_invoke(uint64_t a1)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __47__CAMZoomButtonPlatter__updateButtonsAnimated___block_invoke_2;
  v5[3] = &unk_263FA3F98;
  double v2 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 48);
  char v9 = *(unsigned char *)(a1 + 64);
  __int16 v10 = *(_WORD *)(a1 + 65);
  uint64_t v4 = *(void *)(a1 + 56);
  id v7 = v3;
  uint64_t v8 = v4;
  [v2 enumerateObjectsUsingBlock:v5];
}

void __47__CAMZoomButtonPlatter__updateButtonsAnimated___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  id v7 = *(id *)(a1 + 40);
  if (!*(unsigned char *)(a1 + 56) || (*(unsigned char *)(a1 + 57) ? (BOOL v8 = v7 == v5) : (BOOL v8 = 1), v8))
  {
    [*(id *)(a1 + 48) _zoomFactorForButton:v5 zoomPoint:v6 isZoomFactorButton:v7 == v5];
    objc_msgSend(v5, "setZoomFactor:");
    [v5 setAbbreviateAndEnlargeText:v7 != v5];
    BOOL v9 = v7 == v5 || *(unsigned char *)(a1 + 58) != 0;
    [v5 setUseLeadingZero:v9];
  }
  __int16 v10 = (void *)MEMORY[0x263F82E00];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __47__CAMZoomButtonPlatter__updateButtonsAnimated___block_invoke_3;
  v17[3] = &unk_263FA02D0;
  id v18 = v5;
  BOOL v19 = v7 == v5;
  char v20 = *(unsigned char *)(a1 + 57);
  id v11 = v5;
  [v10 performWithoutAnimation:v17];
  if (v7 == v5)
  {
    double v12 = 1.0;
  }
  else
  {
    double v12 = 0.65;
    if (*(unsigned char *)(a1 + 57)) {
      double v12 = 0.5;
    }
  }
  CGAffineTransformMakeScale(&v16, v12, v12);
  CGAffineTransform v15 = v16;
  [v11 setTransform:&v15];
  if (*(unsigned char *)(a1 + 57)) {
    BOOL v13 = v7 == v5;
  }
  else {
    BOOL v13 = 1;
  }
  unsigned int v14 = v13;
  [v11 setAlpha:(double)v14];
}

void __47__CAMZoomButtonPlatter__updateButtonsAnimated___block_invoke_3(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40) && !*(unsigned char *)(a1 + 41))
  {
    uint64_t v2 = [MEMORY[0x263F825C8] systemYellowColor];
  }
  else
  {
    uint64_t v2 = [MEMORY[0x263F825C8] whiteColor];
  }
  id v3 = (id)v2;
  [*(id *)(a1 + 32) setTintColor:v2];
}

- (double)_zoomFactorForButton:(id)a3 zoomPoint:(id)a4 isZoomFactorButton:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  __int16 v10 = v9;
  if (v5)
  {
    [(CAMZoomButtonPlatter *)self zoomFactor];
LABEL_8:
    double v17 = v11;
    goto LABEL_12;
  }
  if (![v9 isCustomLens])
  {
    if (!v10)
    {
      double v17 = 1.0;
      goto LABEL_12;
    }
    [v10 displayZoomFactor];
    goto LABEL_8;
  }
  double v12 = +[CAMCaptureCapabilities capabilities];
  uint64_t v13 = objc_msgSend(v12, "effectiveFocalLengthForCustomLens:", -[CAMZoomButtonPlatter preferredCustomLens](self, "preferredCustomLens"));
  unsigned int v14 = [v10 allZoomPoints];
  uint64_t v21 = MEMORY[0x263EF8330];
  uint64_t v22 = 3221225472;
  double v23 = __74__CAMZoomButtonPlatter__zoomFactorForButton_zoomPoint_isZoomFactorButton___block_invoke;
  id v24 = &unk_263FA3FE8;
  id v25 = v12;
  uint64_t v26 = v13;
  id v15 = v12;
  uint64_t v16 = [v14 indexOfObjectPassingTest:&v21];
  if (v16 == 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v10, "fundamentalZoomPoint", v21, v22, v23, v24, v25, v26);
  }
  else {
  id v18 = objc_msgSend(v14, "objectAtIndexedSubscript:", v16, v21, v22, v23, v24, v25, v26);
  }
  [v18 displayZoomFactor];
  double v17 = v19;

LABEL_12:
  return v17;
}

BOOL __74__CAMZoomButtonPlatter__zoomFactorForButton_zoomPoint_isZoomFactorButton___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "effectiveFocalLengthForCustomLens:", objc_msgSend(a2, "customLens")) == *(void *)(a1 + 40);
}

- (id)_createPlatterImageForContentSize:(id)a3
{
  [(CAMZoomButtonPlatter *)self intrinsicContentSize];
  double height = v10.height;
  v10.width = v10.height;
  UIGraphicsBeginImageContextWithOptions(v10, 0, 0.0);
  uint64_t v4 = objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithOvalInRect:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), height, height);
  BOOL v5 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.15];
  [v5 set];
  [v4 fill];
  id v6 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  UIFloorToViewScale();
  UIEdgeInsetsMakeWithEdges();
  id v7 = objc_msgSend(v6, "resizableImageWithCapInsets:");

  return v7;
}

- (id)_createZoomButton
{
  id v3 = objc_alloc_init(CAMZoomButton);
  [(CAMZoomButton *)v3 setOverPlatter:1];
  [(CAMZoomButton *)v3 setOrientation:[(CAMZoomButtonPlatter *)self orientation]];
  return v3;
}

- (id)_indexesForChanges:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x263F089C8] indexSet];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(v4, "addIndex:", objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "index", (void)v11));
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)_flashFocalLengthIfNeeded
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  [(CAMZoomButtonPlatter *)self zoomFactor];
  double v4 = v3;
  id v5 = [(CAMZoomButtonPlatter *)self zoomFactorButton];
  uint64_t v6 = [(CAMZoomButtonPlatter *)self baseZoomPointForButton:v5];
  if ([v6 isCustomLens])
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v7 = [v6 allZoomPoints];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          [v12 displayZoomFactor];
          if (vabdd_f64(v13, v4) < 0.001)
          {
            uint64_t v14 = [v12 customLens];

            uint64_t v7 = +[CAMCaptureCapabilities capabilities];
            objc_msgSend(v5, "setFocalLength:", objc_msgSend(v7, "effectiveFocalLengthForCustomLens:", v14));
            [v5 setContentType:2 animated:1];
            unint64_t v15 = [(CAMZoomButtonPlatter *)self _focalLengthFlashID] + 1;
            [(CAMZoomButtonPlatter *)self _setFocalLengthFlashID:v15];
            dispatch_time_t v16 = dispatch_time(0, 1000000000);
            block[0] = MEMORY[0x263EF8330];
            block[1] = 3221225472;
            block[2] = __49__CAMZoomButtonPlatter__flashFocalLengthIfNeeded__block_invoke;
            block[3] = &unk_263FA1FF8;
            block[4] = self;
            unint64_t v19 = v15;
            id v18 = v5;
            dispatch_after(v16, MEMORY[0x263EF83A0], block);

            goto LABEL_12;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
}

uint64_t __49__CAMZoomButtonPlatter__flashFocalLengthIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _focalLengthFlashID];
  if (result == *(void *)(a1 + 48))
  {
    double v3 = *(void **)(a1 + 40);
    return [v3 setContentType:0 animated:1];
  }
  return result;
}

- (void)_cancelFocalLengthFlash
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  double v3 = [(CAMZoomButtonPlatter *)self _allButtons];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) setContentType:0 animated:0];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(CAMZoomButtonPlatter *)self _setFocalLengthFlashID:[(CAMZoomButtonPlatter *)self _focalLengthFlashID] + 1];
}

- (void)setOrientation:(int64_t)a3
{
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_orientation != a3)
  {
    self->_orientation = a3;
    uint64_t v6 = [(CAMZoomButtonPlatter *)self _allButtons];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __48__CAMZoomButtonPlatter_setOrientation_animated___block_invoke;
    v7[3] = &__block_descriptor_41_e30_v32__0__CAMZoomButton_8Q16_B24l;
    v7[4] = a3;
    BOOL v8 = a4;
    [v6 enumerateObjectsUsingBlock:v7];
  }
}

uint64_t __48__CAMZoomButtonPlatter_setOrientation_animated___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setOrientation:*(void *)(a1 + 32) animated:*(unsigned __int8 *)(a1 + 40)];
}

- (double)zoomFactor
{
  return self->_zoomFactor;
}

- (NSArray)zoomPoints
{
  return self->_zoomPoints;
}

- (NSArray)zoomFactors
{
  return self->_zoomFactors;
}

- (BOOL)isCollapsed
{
  return self->_collapsed;
}

- (int64_t)buttonAccessoryState
{
  return self->_buttonAccessoryState;
}

- (int64_t)buttonAccessoryPosition
{
  return self->_buttonAccessoryPosition;
}

- (int64_t)preferredCustomLens
{
  return self->_preferredCustomLens;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (UIImageView)_platterBackgroundView
{
  return self->__platterBackgroundView;
}

- (NSMutableArray)_allButtons
{
  return self->__allButtons;
}

- (unint64_t)_focalLengthFlashID
{
  return self->__focalLengthFlashID;
}

- (void)_setFocalLengthFlashID:(unint64_t)a3
{
  self->__focalLengthFlashID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__allButtons, 0);
  objc_storeStrong((id *)&self->__platterBackgroundView, 0);
  objc_storeStrong((id *)&self->_zoomFactors, 0);
  objc_storeStrong((id *)&self->_zoomPoints, 0);
}

@end