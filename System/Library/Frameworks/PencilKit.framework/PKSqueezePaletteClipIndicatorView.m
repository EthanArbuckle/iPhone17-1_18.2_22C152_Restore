@interface PKSqueezePaletteClipIndicatorView
- (PKSqueezePaletteClipIndicatorView)initWithFrame:(CGRect)a3;
- (void)_updateUI;
- (void)layoutSubviews;
@end

@implementation PKSqueezePaletteClipIndicatorView

- (PKSqueezePaletteClipIndicatorView)initWithFrame:(CGRect)a3
{
  v20.receiver = self;
  v20.super_class = (Class)PKSqueezePaletteClipIndicatorView;
  v3 = -[PKSqueezePaletteClipIndicatorView initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(PKSqueezePaletteClipIndicatorView *)v3 setUserInteractionEnabled:0];
    uint64_t v5 = [MEMORY[0x1E4F39BE8] layer];
    indicator = v4->_indicator;
    v4->_indicator = (CALayer *)v5;

    v7 = [(PKSqueezePaletteClipIndicatorView *)v4 layer];
    [v7 addSublayer:v4->_indicator];

    uint64_t v8 = [MEMORY[0x1E4F39BE8] layer];
    topMask = v4->_topMask;
    v4->_topMask = (CALayer *)v8;

    id v10 = [MEMORY[0x1E4FB1618] blackColor];
    -[CALayer setBackgroundColor:](v4->_topMask, "setBackgroundColor:", [v10 CGColor]);

    v11 = v4->_topMask;
    v12 = [(PKSqueezePaletteClipIndicatorView *)v4 layer];
    [v12 setMask:v11];

    v13 = [(PKSqueezePaletteClipIndicatorView *)v4 layer];
    [v13 setGeometryFlipped:1];

    v14 = [MEMORY[0x1E4FB1E20] systemTraitsAffectingColorAppearance];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __51__PKSqueezePaletteClipIndicatorView_initWithFrame___block_invoke;
    v18[3] = &unk_1E64C8880;
    v15 = v4;
    v19 = v15;
    id v16 = (id)[(PKSqueezePaletteClipIndicatorView *)v15 registerForTraitChanges:v14 withHandler:v18];

    -[PKSqueezePaletteClipIndicatorView _updateUI]((uint64_t)v15);
  }
  return v4;
}

void __51__PKSqueezePaletteClipIndicatorView_initWithFrame___block_invoke(uint64_t a1)
{
}

- (void)_updateUI
{
  if (a1)
  {
    PKSqueezePaletteToolClipIndicatorColor();
    id v2 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 408), "setBackgroundColor:", objc_msgSend(v2, "CGColor"));
  }
}

- (void)layoutSubviews
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v24.receiver = self;
  v24.super_class = (Class)PKSqueezePaletteClipIndicatorView;
  [(PKSqueezePaletteClipIndicatorView *)&v24 layoutSubviews];
  v3 = [(PKSqueezePaletteClipIndicatorView *)self layer];
  [v3 setAllowsEdgeAntialiasing:1];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v4 = [(PKSqueezePaletteClipIndicatorView *)self layer];
  uint64_t v5 = [v4 sublayers];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * v9++) setAllowsEdgeAntialiasing:1];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v7);
  }

  [(PKSqueezePaletteClipIndicatorView *)self bounds];
  UIRectGetCenter();
  double v11 = v10;
  double v13 = v12;
  double v14 = *(double *)&PKSqueezePaletteToolClipIndicatorWidth;
  [(PKSqueezePaletteClipIndicatorView *)self bounds];
  -[CALayer setFrame:](self->_indicator, "setFrame:", v11 - v14 * 0.5, v13 - v15 * 0.5, v14);
  double v16 = *(double *)&PKSqueezePaletteToolClipIndicatorTopMaskHeight;
  [(PKSqueezePaletteClipIndicatorView *)self bounds];
  double v18 = v17;
  [(PKSqueezePaletteClipIndicatorView *)self bounds];
  -[CALayer setFrame:](self->_topMask, "setFrame:", 0.0, v16, v18, v19 - *(double *)&PKSqueezePaletteToolClipIndicatorTopMaskHeight);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topMask, 0);

  objc_storeStrong((id *)&self->_indicator, 0);
}

@end