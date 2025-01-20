@interface DOCTagDotView
- (BOOL)adjustsSizeForContentSizeCategory;
- (BOOL)checked;
- (BOOL)needsItemTagImageUpdate;
- (CALayer)checkmarkLayer;
- (DOCTag)itemTag;
- (DOCTagDotView)initWithDefaultTagDimension:(double)a3 adjustsSizeForContentSizeCategory:(BOOL)a4;
- (NSArray)notificationObservances;
- (NSLayoutConstraint)tagDimensionConstraint;
- (UIImage)itemTagImage;
- (UIImageView)dotView;
- (double)defaultTagDimension;
- (double)tagDimension;
- (unint64_t)renderedTagVariant;
- (void)_updateLayoutOfLayers;
- (void)_withoutAnimations:(id)a3;
- (void)dealloc;
- (void)layoutSublayersOfLayer:(id)a3;
- (void)layoutSubviews;
- (void)loadItemTagImageIfNecessary;
- (void)setChecked:(BOOL)a3;
- (void)setItemTag:(id)a3;
- (void)setItemTagImage:(id)a3;
- (void)setNeedsItemTagImageUpdate;
- (void)setRenderedTagVariant:(unint64_t)a3;
- (void)updateContents;
- (void)updateForChangedTraitsAffectingFonts;
- (void)updateLayoutOfLayers;
@end

@implementation DOCTagDotView

- (DOCTagDotView)initWithDefaultTagDimension:(double)a3 adjustsSizeForContentSizeCategory:(BOOL)a4
{
  BOOL v4 = a4;
  v37[1] = *MEMORY[0x263EF8340];
  v36.receiver = self;
  v36.super_class = (Class)DOCTagDotView;
  v6 = -[DOCTagDotView initWithFrame:](&v36, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v7 = v6;
  if (v6)
  {
    v6->_renderedTagVariant = 0;
    v6->_defaultTagDimension = a3;
    v6->_adjustsSizeForContentSizeCategory = v4;
    v8 = (UIImageView *)objc_alloc_init(MEMORY[0x263F82828]);
    dotView = v7->_dotView;
    v7->_dotView = v8;

    v10 = (CALayer *)objc_alloc_init(MEMORY[0x263F157E8]);
    checkmarkLayer = v7->_checkmarkLayer;
    v7->_checkmarkLayer = v10;

    [(CALayer *)v7->_checkmarkLayer setHidden:1];
    id v12 = objc_alloc_init(MEMORY[0x263F157E8]);
    id v13 = +[DOCTagCheckmarkView checkmarkImage];
    objc_msgSend(v12, "setContents:", objc_msgSend(v13, "CGImage"));

    [(CALayer *)v7->_checkmarkLayer setMask:v12];
    [(DOCTagDotView *)v7 updateLayoutOfLayers];
    [(DOCTagDotView *)v7 addSubview:v7->_dotView];
    v14 = [(DOCTagDotView *)v7 layer];
    v15 = [(DOCTagDotView *)v7 checkmarkLayer];
    [v14 addSublayer:v15];

    [(DOCTagDotView *)v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    v16 = [(DOCTagDotView *)v7 heightAnchor];
    uint64_t v17 = [v16 constraintEqualToConstant:a3];
    tagDimensionConstraint = v7->_tagDimensionConstraint;
    v7->_tagDimensionConstraint = (NSLayoutConstraint *)v17;

    v19 = [(DOCTagDotView *)v7 widthAnchor];
    v20 = [(DOCTagDotView *)v7 heightAnchor];
    v21 = [v19 constraintEqualToAnchor:v20];
    [v21 setActive:1];

    [(DOCTagDotView *)v7 updateForChangedTraitsAffectingFonts];
    [(NSLayoutConstraint *)v7->_tagDimensionConstraint setActive:1];
    objc_initWeak(&location, v7);
    v22 = [MEMORY[0x263F08A00] defaultCenter];
    v23 = [MEMORY[0x263F08A48] mainQueue];
    uint64_t v30 = MEMORY[0x263EF8330];
    uint64_t v31 = 3221225472;
    v32 = __79__DOCTagDotView_initWithDefaultTagDimension_adjustsSizeForContentSizeCategory___block_invoke;
    v33 = &unk_2648FB658;
    objc_copyWeak(&v34, &location);
    v24 = [v22 addObserverForName:*MEMORY[0x263F83190] object:0 queue:v23 usingBlock:&v30];
    v37[0] = v24;
    uint64_t v25 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v37, 1, v30, v31, v32, v33);
    notificationObservances = v7->_notificationObservances;
    v7->_notificationObservances = (NSArray *)v25;

    if (v4)
    {
      v27 = objc_msgSend(MEMORY[0x263F82DA0], "doc_traitsAffectingFonts");
      id v28 = (id)[(DOCTagDotView *)v7 registerForTraitChanges:v27 withAction:sel_updateForChangedTraitsAffectingFonts];
    }
    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);
  }
  return v7;
}

void __79__DOCTagDotView_initWithDefaultTagDimension_adjustsSizeForContentSizeCategory___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateLayoutOfLayers];
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  notificationObservances = self->_notificationObservances;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __24__DOCTagDotView_dealloc__block_invoke;
  v7[3] = &unk_2648FB680;
  id v8 = v3;
  id v5 = v3;
  [(NSArray *)notificationObservances enumerateObjectsUsingBlock:v7];

  v6.receiver = self;
  v6.super_class = (Class)DOCTagDotView;
  [(DOCTagDotView *)&v6 dealloc];
}

uint64_t __24__DOCTagDotView_dealloc__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeObserver:a2];
}

- (void)updateForChangedTraitsAffectingFonts
{
  [(DOCTagDotView *)self defaultTagDimension];
  double v4 = v3;
  if ([(DOCTagDotView *)self adjustsSizeForContentSizeCategory])
  {
    id v5 = [MEMORY[0x263F82770] defaultMetrics];
    [(DOCTagDotView *)self defaultTagDimension];
    double v7 = v6;
    id v8 = [(DOCTagDotView *)self traitCollection];
    [v5 scaledValueForValue:v8 compatibleWithTraitCollection:v7];
    double v4 = v9;
  }
  [(NSLayoutConstraint *)self->_tagDimensionConstraint constant];
  if (v4 != v10)
  {
    [(NSLayoutConstraint *)self->_tagDimensionConstraint setConstant:v4];
    [(DOCTagDotView *)self invalidateIntrinsicContentSize];
  }
}

- (double)tagDimension
{
  [(NSLayoutConstraint *)self->_tagDimensionConstraint constant];
  return result;
}

- (void)setItemTag:(id)a3
{
  id v5 = (DOCTag *)a3;
  p_itemTag = &self->_itemTag;
  if (self->_itemTag != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)p_itemTag, a3);
    [(DOCTagDotView *)self setNeedsItemTagImageUpdate];
    p_itemTag = (DOCTag **)[(DOCTagDotView *)self updateContents];
    id v5 = v7;
  }

  MEMORY[0x270F9A758](p_itemTag, v5);
}

- (void)setItemTagImage:(id)a3
{
  id v5 = (UIImage *)a3;
  if (self->_itemTagImage != v5)
  {
    objc_storeStrong((id *)&self->_itemTagImage, a3);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __33__DOCTagDotView_setItemTagImage___block_invoke;
    v6[3] = &unk_2648FB630;
    v6[4] = self;
    double v7 = v5;
    [(DOCTagDotView *)self _withoutAnimations:v6];
  }
}

void __33__DOCTagDotView_setItemTagImage___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) dotView];
  [v2 setImage:v1];
}

- (void)_withoutAnimations:(id)a3
{
  id v3 = a3;
  double v4 = (void *)MEMORY[0x263F82E00];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __36__DOCTagDotView__withoutAnimations___block_invoke;
  v6[3] = &unk_2648FB6A8;
  id v7 = v3;
  id v5 = v3;
  [v4 performWithoutAnimation:v6];
}

uint64_t __36__DOCTagDotView__withoutAnimations___block_invoke(uint64_t a1)
{
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = (void *)MEMORY[0x263F158F8];

  return [v2 commit];
}

- (void)setChecked:(BOOL)a3
{
  if (self->_checked != a3)
  {
    self->_checked = a3;
    BOOL v3 = !a3;
    id v4 = [(DOCTagDotView *)self checkmarkLayer];
    [v4 setHidden:v3];
  }
}

- (void)setRenderedTagVariant:(unint64_t)a3
{
  if (self->_renderedTagVariant != a3)
  {
    self->_renderedTagVariant = a3;
    [(DOCTagDotView *)self setNeedsItemTagImageUpdate];
  }
}

- (void)layoutSubviews
{
  [(DOCTagDotView *)self updateContents];
  v3.receiver = self;
  v3.super_class = (Class)DOCTagDotView;
  [(DOCTagDotView *)&v3 layoutSubviews];
}

- (void)layoutSublayersOfLayer:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DOCTagDotView;
  id v4 = a3;
  [(DOCTagDotView *)&v6 layoutSublayersOfLayer:v4];
  id v5 = [(DOCTagDotView *)self layer];

  if (v5 == v4) {
    [(DOCTagDotView *)self updateLayoutOfLayers];
  }
}

- (void)setNeedsItemTagImageUpdate
{
  self->_needsItemTagImageUpdate = 1;
  [(DOCTagDotView *)self setNeedsLayout];
}

- (void)loadItemTagImageIfNecessary
{
  itemTagImage = self->_itemTagImage;
  if ([(DOCTagDotView *)self needsItemTagImageUpdate] || !itemTagImage)
  {
    self->_needsItemTagImageUpdate = 0;
    id v4 = [(DOCTagDotView *)self tagDimensionConstraint];
    [v4 constant];
    double v6 = v5;

    id v7 = [(DOCTagDotView *)self itemTag];
    id v10 = +[DOCTagRenderingRequest requestForTag:v7 tagDimension:self->_renderedTagVariant variant:v6];

    [v10 setAllowUnsizedSymbolImages:1];
    id v8 = +[DOCTagRenderer shared];
    double v9 = [v8 renderImageWithRequest:v10];

    [(DOCTagDotView *)self setItemTagImage:v9];
  }
}

- (void)updateContents
{
  [(DOCTagDotView *)self loadItemTagImageIfNecessary];
  objc_super v3 = [(DOCTagDotView *)self itemTag];
  id v7 = [v3 tagColorIfNotClear];

  if (v7) {
    [MEMORY[0x263F825C8] whiteColor];
  }
  else {
  id v4 = [MEMORY[0x263F3ABC0] nonClearNoneTagColor];
  }
  uint64_t v5 = [v4 CGColor];
  double v6 = [(DOCTagDotView *)self checkmarkLayer];
  [v6 setBackgroundColor:v5];
}

- (void)updateLayoutOfLayers
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __37__DOCTagDotView_updateLayoutOfLayers__block_invoke;
  v2[3] = &unk_2648FB608;
  v2[4] = self;
  [(DOCTagDotView *)self _withoutAnimations:v2];
}

uint64_t __37__DOCTagDotView_updateLayoutOfLayers__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateLayoutOfLayers];
}

- (void)_updateLayoutOfLayers
{
  [(DOCTagDotView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(DOCTagDotView *)self dotView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  id v39 = +[DOCTagCheckmarkView checkmarkImage];
  [v39 size];
  double v13 = v12;
  double v15 = v14;
  [(DOCTagDotView *)self bounds];
  double v17 = v16 * 0.5;
  if (v16 * 0.5 > 0.0)
  {
    [v39 size];
    double v19 = v18 / v17;
    [v39 size];
    double v21 = v20 / v17;
    if (v19 >= v20 / v17) {
      double v21 = v19;
    }
    if (v21 > 1.0)
    {
      double v13 = v13 / v21;
      double v15 = v15 / v21;
    }
  }
  [(DOCTagDotView *)self bounds];
  CGFloat v22 = CGRectGetMidX(v41) - v13 * 0.5;
  [(DOCTagDotView *)self bounds];
  v43.origin.double y = CGRectGetMidY(v42) - v15 * 0.5;
  v43.origin.double x = v22;
  v43.size.double width = v13;
  v43.size.double height = v15;
  CGRect v44 = CGRectIntegral(v43);
  double x = v44.origin.x;
  double y = v44.origin.y;
  double width = v44.size.width;
  double height = v44.size.height;
  v27 = [(DOCTagDotView *)self checkmarkLayer];
  objc_msgSend(v27, "setFrame:", x, y, width, height);

  id v28 = [(DOCTagDotView *)self checkmarkLayer];
  [v28 bounds];
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;
  v37 = [(DOCTagDotView *)self checkmarkLayer];
  v38 = [v37 mask];
  objc_msgSend(v38, "setFrame:", v30, v32, v34, v36);
}

- (DOCTag)itemTag
{
  return self->_itemTag;
}

- (BOOL)adjustsSizeForContentSizeCategory
{
  return self->_adjustsSizeForContentSizeCategory;
}

- (BOOL)checked
{
  return self->_checked;
}

- (unint64_t)renderedTagVariant
{
  return self->_renderedTagVariant;
}

- (double)defaultTagDimension
{
  return self->_defaultTagDimension;
}

- (NSLayoutConstraint)tagDimensionConstraint
{
  return self->_tagDimensionConstraint;
}

- (BOOL)needsItemTagImageUpdate
{
  return self->_needsItemTagImageUpdate;
}

- (UIImage)itemTagImage
{
  return self->_itemTagImage;
}

- (UIImageView)dotView
{
  return self->_dotView;
}

- (CALayer)checkmarkLayer
{
  return self->_checkmarkLayer;
}

- (NSArray)notificationObservances
{
  return self->_notificationObservances;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationObservances, 0);
  objc_storeStrong((id *)&self->_checkmarkLayer, 0);
  objc_storeStrong((id *)&self->_dotView, 0);
  objc_storeStrong((id *)&self->_itemTagImage, 0);
  objc_storeStrong((id *)&self->_tagDimensionConstraint, 0);

  objc_storeStrong((id *)&self->_itemTag, 0);
}

@end