@interface PKPaletteColorSwatch
- (BOOL)isSelected;
- (BOOL)wantsBackgroundViewColor;
- (CAShapeLayer)selectionRingMaskLayer;
- (PKPaletteColorSwatch)init;
- (PKSwatchColor)swatchColor;
- (UIColor)presentationColor;
- (UIView)colorBackgroundView;
- (UIView)colorBulletView;
- (id)_uiColor;
- (id)initWithSelectionRingInset:(double)a3 bulletInset:;
- (id)newColorBackgroundView;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (void)_updateBackgroundView;
- (void)_updateColorBulletView;
- (void)_updateSelectionHighlight;
- (void)layoutSubviews;
- (void)setColorBackgroundView:(id)a3;
- (void)setColorBulletView:(id)a3;
- (void)setColorUserInterfaceStyle:(void *)a1;
- (void)setSelected:(BOOL)a3;
- (void)setSelectionRingMaskLayer:(id)a3;
- (void)setSwatchColor:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PKPaletteColorSwatch

- (PKPaletteColorSwatch)init
{
  return (PKPaletteColorSwatch *)-[PKPaletteColorSwatch initWithSelectionRingInset:bulletInset:](self, 3.0, 5.0);
}

- (id)initWithSelectionRingInset:(double)a3 bulletInset:
{
  if (!a1) {
    return 0;
  }
  v13.receiver = a1;
  v13.super_class = (Class)PKPaletteColorSwatch;
  v5 = (id *)objc_msgSendSuper2(&v13, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v6 = v5;
  if (v5)
  {
    *((double *)v5 + 55) = a2;
    *((double *)v5 + 56) = a3;
    v7 = [MEMORY[0x1E4FB1618] clearColor];
    [v6 setBackgroundColor:v7];

    -[PKPaletteColorSwatch _updateBackgroundView](v6);
    -[PKPaletteColorSwatch _updateColorBulletView](v6);
    -[PKPaletteColorSwatch _updateSelectionHighlight](v6);
    [v6 setShowsLargeContentViewer:1];
    id v8 = objc_alloc_init(MEMORY[0x1E4FB1938]);
    [v6 addInteraction:v8];

    v9 = (void *)[objc_alloc(MEMORY[0x1E4FB1AC8]) initWithDelegate:v6];
    objc_storeStrong(v6 + 54, v9);

    id v10 = v6[54];
  }
  else
  {
    [0 setShowsLargeContentViewer:1];
    id v11 = objc_alloc_init(MEMORY[0x1E4FB1938]);
    [0 addInteraction:v11];

    id v10 = 0;
  }
  [v6 addInteraction:v10];
  objc_msgSend(v6, "setHitTestInsets:", -12.0, -12.0, -12.0, -12.0);
  return v6;
}

- (void)_updateBackgroundView
{
  if (a1)
  {
    v2 = [a1 colorBackgroundView];

    if (!v2)
    {
      v3 = (void *)[a1 newColorBackgroundView];
      [a1 setColorBackgroundView:v3];

      v4 = [a1 colorBackgroundView];
      [a1 addSubview:v4];
    }
    if ([a1 wantsBackgroundViewColor])
    {
      -[PKPaletteColorSwatch _uiColor](a1);
      id v20 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v20 = 0;
    }
    v5 = [a1 colorBackgroundView];
    [v5 setBackgroundColor:v20];

    int v6 = [a1 isSelected];
    v7 = [a1 selectionRingMaskLayer];

    if (!v6 || v7)
    {
      if (v7) {
        char v17 = v6;
      }
      else {
        char v17 = 1;
      }
      if ((v17 & 1) == 0)
      {
        v18 = [a1 colorBackgroundView];
        v19 = [v18 layer];
        [v19 setMask:0];

        [a1 setSelectionRingMaskLayer:0];
      }
    }
    else
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F39C88]);
      [a1 setSelectionRingMaskLayer:v8];

      id v9 = [MEMORY[0x1E4FB1618] blackColor];
      uint64_t v10 = [v9 CGColor];
      id v11 = [a1 selectionRingMaskLayer];
      [v11 setFillColor:v10];

      uint64_t v12 = *MEMORY[0x1E4F39FB8];
      objc_super v13 = [a1 selectionRingMaskLayer];
      [v13 setFillRule:v12];

      v14 = [a1 selectionRingMaskLayer];
      v15 = [a1 colorBackgroundView];
      v16 = [v15 layer];
      [v16 setMask:v14];
    }
    if (v6) {
      [a1 setNeedsLayout];
    }
  }
}

- (void)_updateColorBulletView
{
  if (a1)
  {
    int v2 = [a1 wantsColorBulletVisible];
    v3 = [a1 colorBulletView];

    if (!v2 || v3)
    {
      if (v3) {
        char v7 = v2;
      }
      else {
        char v7 = 1;
      }
      if ((v7 & 1) == 0)
      {
        id v8 = [a1 colorBulletView];
        [v8 removeFromSuperview];

        [a1 setColorBulletView:0];
      }
    }
    else
    {
      id v4 = objc_alloc(MEMORY[0x1E4FB1EB0]);
      v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      [a1 setColorBulletView:v5];

      int v6 = [a1 colorBulletView];
      [a1 addSubview:v6];
    }
    if (v2)
    {
      id v9 = -[PKPaletteColorSwatch _uiColor](a1);
      uint64_t v10 = [a1 colorBulletView];
      [v10 setBackgroundColor:v9];

      [a1 setNeedsLayout];
    }
  }
}

- (void)_updateSelectionHighlight
{
  if (a1)
  {
    if (a1[409]) {
      double v2 = 0.5;
    }
    else {
      double v2 = 1.0;
    }
    v3 = [a1 colorBackgroundView];
    [v3 setAlpha:v2];

    id v4 = [a1 colorBulletView];
    [v4 setAlpha:v2];
  }
}

- (UIColor)presentationColor
{
  double v2 = [(PKPaletteColorSwatch *)self swatchColor];
  v3 = [v2 color];

  return (UIColor *)v3;
}

- (void)layoutSubviews
{
  v55.receiver = self;
  v55.super_class = (Class)PKPaletteColorSwatch;
  [(PKPaletteColorSwatch *)&v55 layoutSubviews];
  [(PKPaletteColorSwatch *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = [(PKPaletteColorSwatch *)self colorBackgroundView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  [(PKPaletteColorSwatch *)self bounds];
  CGFloat v12 = CGRectGetWidth(v56) * 0.5;
  objc_super v13 = [(PKPaletteColorSwatch *)self colorBackgroundView];
  v14 = [v13 layer];
  [v14 setCornerRadius:v12];

  v15 = [(PKPaletteColorSwatch *)self layer];
  [v15 setCornerRadius:v12];

  v16 = [(PKPaletteColorSwatch *)self colorBulletView];

  if (v16)
  {
    [(PKPaletteColorSwatch *)self bounds];
    CGRect v58 = CGRectInset(v57, self->_bulletInset, self->_bulletInset);
    double x = v58.origin.x;
    double y = v58.origin.y;
    double width = v58.size.width;
    double height = v58.size.height;
    v21 = [(PKPaletteColorSwatch *)self colorBulletView];
    objc_msgSend(v21, "setFrame:", x, y, width, height);

    v59.origin.double x = x;
    v59.origin.double y = y;
    v59.size.double width = width;
    v59.size.double height = height;
    CGFloat v22 = CGRectGetWidth(v59) * 0.5;
    v23 = [(PKPaletteColorSwatch *)self colorBulletView];
    v24 = [v23 layer];
    [v24 setCornerRadius:v22];

    v25 = [(PKPaletteColorSwatch *)self colorBulletView];
    v26 = [v25 layer];
    [v26 setBorderWidth:0.5];

    v27 = [(PKPaletteColorSwatch *)self traitCollection];
    uint64_t v28 = [v27 userInterfaceStyle];

    if (v28 == 2)
    {
      v29 = [MEMORY[0x1E4FB1618] whiteColor];
      v30 = v29;
      double v31 = 0.16;
    }
    else
    {
      v29 = [MEMORY[0x1E4FB1618] blackColor];
      v30 = v29;
      double v31 = 0.08;
    }
    v32 = [v29 colorWithAlphaComponent:v31];

    id v33 = v32;
    uint64_t v34 = [v33 CGColor];
    v35 = [(PKPaletteColorSwatch *)self colorBulletView];
    v36 = [v35 layer];
    [v36 setBorderColor:v34];
  }
  v37 = [(PKPaletteColorSwatch *)self selectionRingMaskLayer];

  if (v37)
  {
    [(PKPaletteColorSwatch *)self bounds];
    CGRect v61 = CGRectInset(v60, self->_selectionInset, self->_selectionInset);
    CGFloat v38 = v61.origin.x;
    CGFloat v39 = v61.origin.y;
    CGFloat v40 = v61.size.width;
    CGFloat v41 = v61.size.height;
    v42 = [(PKPaletteColorSwatch *)self colorBackgroundView];
    v43 = [v42 layer];
    [v43 bounds];
    double v45 = v44;
    double v47 = v46;
    double v49 = v48;
    double v51 = v50;

    v52 = [(PKPaletteColorSwatch *)self selectionRingMaskLayer];
    objc_msgSend(v52, "setFrame:", v45, v47, v49, v51);

    Mutable = CGPathCreateMutable();
    v62.origin.double x = v45;
    v62.origin.double y = v47;
    v62.size.double width = v49;
    v62.size.double height = v51;
    CGPathAddRect(Mutable, 0, v62);
    v63.origin.double x = v38;
    v63.origin.double y = v39;
    v63.size.double width = v40;
    v63.size.double height = v41;
    CGPathAddEllipseInRect(Mutable, 0, v63);
    v54 = [(PKPaletteColorSwatch *)self selectionRingMaskLayer];
    [v54 setPath:Mutable];

    CGPathRelease(Mutable);
  }
}

- (void)setSelected:(BOOL)a3
{
  if (self->_selected != a3)
  {
    self->_selected = a3;
    -[PKPaletteColorSwatch _updateBackgroundView](self);
    -[PKPaletteColorSwatch _updateColorBulletView](self);
  }
}

- (void)setSwatchColor:(id)a3
{
  double v5 = (PKSwatchColor *)a3;
  p_swatchColor = &self->_swatchColor;
  if (self->_swatchColor != v5)
  {
    id v11 = v5;
    objc_storeStrong((id *)&self->_swatchColor, a3);
    -[PKPaletteColorSwatch _updateBackgroundView](self);
    -[PKPaletteColorSwatch _updateColorBulletView](self);
    double v7 = [(PKSwatchColor *)*p_swatchColor identifier];
    int v8 = [v7 isEqualToString:@"multi"];

    if (v8)
    {
      double v9 = _PencilKitBundle();
      double v10 = [v9 localizedStringForKey:@"Show More Colors" value:@"Show More Colors" table:@"Localizable"];
      [(PKPaletteColorSwatch *)self setLargeContentTitle:v10];
    }
    else
    {
      double v9 = [(PKSwatchColor *)*p_swatchColor identifier];
      [(PKPaletteColorSwatch *)self setLargeContentTitle:v9];
    }

    double v5 = v11;
  }
}

- (id)_uiColor
{
  double v2 = [a1 presentationColor];
  uint64_t v3 = a1[53];
  if (!v3)
  {
    double v4 = [a1 traitCollection];
    uint64_t v3 = [v4 userInterfaceStyle];
  }
  double v5 = +[PKInkingTool convertColor:v2 fromUserInterfaceStyle:1 to:v3];

  return v5;
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPaletteColorSwatch;
  [(PKPaletteColorSwatch *)&v4 traitCollectionDidChange:a3];
  if (self)
  {
    -[PKPaletteColorSwatch _updateBackgroundView](self);
    -[PKPaletteColorSwatch _updateColorBulletView](self);
  }
}

- (void)setColorUserInterfaceStyle:(void *)a1
{
  if (a1 && a1[53] != a2)
  {
    a1[53] = a2;
    -[PKPaletteColorSwatch _updateBackgroundView](a1);
    -[PKPaletteColorSwatch _updateColorBulletView](a1);
  }
}

- (id)newColorBackgroundView
{
  id v2 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);

  return (id)objc_msgSend(v2, "initWithFrame:", v3, v4, v5, v6);
}

- (BOOL)wantsBackgroundViewColor
{
  return 1;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5 = a3;
  id v6 = objc_alloc(MEMORY[0x1E4FB1D48]);
  double v7 = [v5 view];
  int v8 = (void *)[v6 initWithView:v7];

  double v9 = [MEMORY[0x1E4FB1AD0] effectWithPreview:v8];
  double v10 = [(PKPaletteColorSwatch *)self traitCollection];
  uint64_t v11 = [v10 userInterfaceIdiom];

  CGFloat v12 = (void *)MEMORY[0x1E4FB1AE0];
  if (v11 == 6)
  {
    objc_super v13 = [v5 view];
    [v13 frame];
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    CGFloat v22 = [v5 view];
    [v22 bounds];
    objc_msgSend(v12, "shapeWithRoundedRect:cornerRadius:", v15, v17, v19, v21, v23 * 0.5);
  }
  else
  {
    v24 = (void *)MEMORY[0x1E4FB14C0];
    objc_super v13 = [v5 view];
    [v13 bounds];
    CGFloat v22 = objc_msgSend(v24, "bezierPathWithOvalInRect:");
    [v12 shapeWithPath:v22];
  v25 = };

  v26 = [MEMORY[0x1E4FB1AE8] styleWithEffect:v9 shape:v25];

  return v26;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  objc_msgSend(a5, "rect", a3, a4);
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  [(PKPaletteColorSwatch *)self hitTestInsets];
  CGFloat v15 = v14;
  [(PKPaletteColorSwatch *)self hitTestInsets];
  CGFloat v17 = v16;
  v21.origin.double x = v7;
  v21.origin.double y = v9;
  v21.size.double width = v11;
  v21.size.double height = v13;
  CGRect v22 = CGRectInset(v21, v15, v17);
  double v18 = (void *)MEMORY[0x1E4FB1AD8];

  return (id)objc_msgSend(v18, "regionWithRect:identifier:", 0, v22.origin.x, v22.origin.y, v22.size.width, v22.size.height);
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (PKSwatchColor)swatchColor
{
  return self->_swatchColor;
}

- (UIView)colorBackgroundView
{
  return self->_colorBackgroundView;
}

- (void)setColorBackgroundView:(id)a3
{
}

- (CAShapeLayer)selectionRingMaskLayer
{
  return self->_selectionRingMaskLayer;
}

- (void)setSelectionRingMaskLayer:(id)a3
{
}

- (UIView)colorBulletView
{
  return self->_colorBulletView;
}

- (void)setColorBulletView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorBulletView, 0);
  objc_storeStrong((id *)&self->_selectionRingMaskLayer, 0);
  objc_storeStrong((id *)&self->_colorBackgroundView, 0);
  objc_storeStrong((id *)&self->_pointerInteraction, 0);

  objc_storeStrong((id *)&self->_swatchColor, 0);
}

@end