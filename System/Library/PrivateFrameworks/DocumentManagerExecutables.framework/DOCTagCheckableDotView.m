@interface DOCTagCheckableDotView
- (BOOL)checked;
- (CAShapeLayer)borderLayer;
- (DOCTagCheckableDotView)initWithFrame:(CGRect)a3;
- (DOCTagDotView)tagDotView;
- (double)insetForBorderLayer;
- (int64_t)tagColor;
- (void)layoutSublayersOfLayer:(id)a3;
- (void)layoutSubviews;
- (void)setChecked:(BOOL)a3;
- (void)setTagColor:(int64_t)a3;
- (void)updateBorderLayerVisibility;
- (void)updateLayoutOfLayers;
@end

@implementation DOCTagCheckableDotView

- (DOCTagCheckableDotView)initWithFrame:(CGRect)a3
{
  v38[4] = *MEMORY[0x263EF8340];
  v37.receiver = self;
  v37.super_class = (Class)DOCTagCheckableDotView;
  v3 = -[DOCTagCheckableDotView initWithFrame:](&v37, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[DOCTagAppearance makerUI];
    v5 = [DOCTagDotView alloc];
    v36 = v4;
    [v4 rowOfTagsDotSize];
    uint64_t v6 = -[DOCTagDotView initWithDefaultTagDimension:adjustsSizeForContentSizeCategory:](v5, "initWithDefaultTagDimension:adjustsSizeForContentSizeCategory:", 0);
    tagDotView = v3->_tagDotView;
    v3->_tagDotView = (DOCTagDotView *)v6;

    v8 = objc_msgSend(MEMORY[0x263F827D8], "doc_circleWithInset:", -6.0);
    [(DOCTagDotView *)v3->_tagDotView setHoverStyle:v8];

    [(DOCTagCheckableDotView *)v3 setHoverStyle:0];
    v9 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x263F15880]);
    borderLayer = v3->_borderLayer;
    v3->_borderLayer = v9;

    [(CAShapeLayer *)v3->_borderLayer setHidden:1];
    [(CAShapeLayer *)v3->_borderLayer setFillColor:0];
    [v4 rowOfTagsDotSelectionBorderWidth];
    -[CAShapeLayer setLineWidth:](v3->_borderLayer, "setLineWidth:");
    [(DOCTagCheckableDotView *)v3 updateLayoutOfLayers];
    v11 = [(DOCTagCheckableDotView *)v3 layer];
    v12 = [(DOCTagCheckableDotView *)v3 borderLayer];
    [v11 addSublayer:v12];

    v13 = [(DOCTagCheckableDotView *)v3 tagDotView];
    [(DOCTagCheckableDotView *)v3 addSubview:v13];

    [(DOCTagCheckableDotView *)v3 insetForBorderLayer];
    double v15 = v14;
    v28 = (void *)MEMORY[0x263F08938];
    v34 = [(DOCTagCheckableDotView *)v3 topAnchor];
    v35 = [(DOCTagCheckableDotView *)v3 tagDotView];
    v33 = [v35 topAnchor];
    double v16 = -v15;
    v32 = [v34 constraintEqualToAnchor:v33 constant:v16];
    v38[0] = v32;
    v31 = [(DOCTagCheckableDotView *)v3 tagDotView];
    v30 = [v31 bottomAnchor];
    v29 = [(DOCTagCheckableDotView *)v3 bottomAnchor];
    v27 = [v30 constraintEqualToAnchor:v29 constant:v16];
    v38[1] = v27;
    v17 = [(DOCTagCheckableDotView *)v3 leadingAnchor];
    v18 = [(DOCTagCheckableDotView *)v3 tagDotView];
    v19 = [v18 leadingAnchor];
    v20 = [v17 constraintEqualToAnchor:v19 constant:v16];
    v38[2] = v20;
    v21 = [(DOCTagCheckableDotView *)v3 tagDotView];
    v22 = [v21 trailingAnchor];
    v23 = [(DOCTagCheckableDotView *)v3 trailingAnchor];
    v24 = [v22 constraintEqualToAnchor:v23 constant:v16];
    v38[3] = v24;
    v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:4];
    [v28 activateConstraints:v25];
  }
  return v3;
}

- (double)insetForBorderLayer
{
  [(CAShapeLayer *)self->_borderLayer lineWidth];
  return v2 * 0.5;
}

- (int64_t)tagColor
{
  double v2 = [(DOCTagCheckableDotView *)self tagDotView];
  v3 = [v2 itemTag];
  int64_t v4 = [v3 labelIndex];

  return v4;
}

- (void)setTagColor:(int64_t)a3
{
  id v5 = [MEMORY[0x263F3ABC0] untitledTagForRendering:a3];
  int64_t v4 = [(DOCTagCheckableDotView *)self tagDotView];
  [v4 setItemTag:v5];
}

- (void)setChecked:(BOOL)a3
{
  if (self->_checked != a3)
  {
    BOOL v3 = a3;
    self->_checked = a3;
    id v5 = [(DOCTagCheckableDotView *)self tagDotView];
    [v5 setChecked:v3];

    [(DOCTagCheckableDotView *)self updateBorderLayerVisibility];
  }
}

- (void)updateBorderLayerVisibility
{
  int64_t v3 = [(DOCTagCheckableDotView *)self tagColor];
  int64_t v4 = [(DOCTagCheckableDotView *)self borderLayer];
  [v4 lineWidth];
  double v6 = v5;

  uint64_t v7 = 1;
  if ([(DOCTagCheckableDotView *)self checked])
  {
    if (v6 > 0.0 && v3 != 0)
    {
      v9 = +[DOCTagRenderer shared];
      uint64_t v7 = [v9 differentiateWithShapes];
    }
  }
  id v10 = [(DOCTagCheckableDotView *)self borderLayer];
  [v10 setHidden:v7];
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)DOCTagCheckableDotView;
  [(DOCTagCheckableDotView *)&v11 layoutSubviews];
  int64_t v3 = +[DOCTagAppearance makerUI];
  int64_t v4 = [v3 rowOfTagsDotSelectionBorderColor];
  double v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [MEMORY[0x263F825C8] clearColor];
  }
  uint64_t v7 = v6;

  id v8 = v7;
  uint64_t v9 = [v8 CGColor];
  id v10 = [(DOCTagCheckableDotView *)self borderLayer];
  [v10 setStrokeColor:v9];
}

- (void)layoutSublayersOfLayer:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DOCTagCheckableDotView;
  id v4 = a3;
  [(DOCTagCheckableDotView *)&v6 layoutSublayersOfLayer:v4];
  id v5 = [(DOCTagCheckableDotView *)self layer];

  if (v5 == v4) {
    [(DOCTagCheckableDotView *)self updateLayoutOfLayers];
  }
}

- (void)updateLayoutOfLayers
{
  [(DOCTagCheckableDotView *)self insetForBorderLayer];
  CGFloat v4 = v3;
  [(DOCTagCheckableDotView *)self bounds];
  CGRect v23 = CGRectInset(v22, v4, v4);
  double x = v23.origin.x;
  double y = v23.origin.y;
  double width = v23.size.width;
  double height = v23.size.height;
  [(DOCTagCheckableDotView *)self bounds];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  v17 = [(DOCTagCheckableDotView *)self borderLayer];
  objc_msgSend(v17, "setFrame:", v10, v12, v14, v16);

  objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithOvalInRect:", x, y, width, height);
  id v20 = objc_claimAutoreleasedReturnValue();
  uint64_t v18 = [v20 CGPath];
  v19 = [(DOCTagCheckableDotView *)self borderLayer];
  [v19 setPath:v18];
}

- (BOOL)checked
{
  return self->_checked;
}

- (DOCTagDotView)tagDotView
{
  return self->_tagDotView;
}

- (CAShapeLayer)borderLayer
{
  return self->_borderLayer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borderLayer, 0);

  objc_storeStrong((id *)&self->_tagDotView, 0);
}

@end