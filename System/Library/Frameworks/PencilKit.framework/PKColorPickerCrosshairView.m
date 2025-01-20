@interface PKColorPickerCrosshairView
- (PKColorPickerCrosshairView)initWithFrame:(CGRect)a3;
- (PKColorPickerCrosshairViewDelegate)delegate;
- (_PKColorPickerCrosshairCornerMaskView)baseMaskView;
- (_PKColorPickerCrosshairCornerMaskView)cornerEdgeMaskView;
- (_PKColorPickerSimpleCrosshairView)baseView;
- (_PKColorPickerSimpleCrosshairView)cornerEdgeView;
- (unint64_t)cornerPosition;
- (void)layoutSubviews;
- (void)setBaseMaskView:(id)a3;
- (void)setBaseView:(id)a3;
- (void)setCornerEdgeMaskView:(id)a3;
- (void)setCornerEdgeView:(id)a3;
- (void)setCornerPosition:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)update;
@end

@implementation PKColorPickerCrosshairView

- (PKColorPickerCrosshairView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v29.receiver = self;
  v29.super_class = (Class)PKColorPickerCrosshairView;
  v7 = -[PKColorPickerCrosshairView initWithFrame:](&v29, sel_initWithFrame_);
  v8 = -[_PKColorPickerSimpleCrosshairView initWithFrame:]([_PKColorPickerSimpleCrosshairView alloc], "initWithFrame:", x, y, width, height);
  baseView = v7->_baseView;
  v7->_baseView = v8;

  v10 = [(PKColorPickerCrosshairView *)v7 baseView];
  [v10 setBorderCornerRadius:0.0];

  v11 = [(PKColorPickerCrosshairView *)v7 baseView];
  [(PKColorPickerCrosshairView *)v7 addSubview:v11];

  v12 = -[_PKColorPickerCrosshairCornerMaskView initWithFrame:]([_PKColorPickerCrosshairCornerMaskView alloc], "initWithFrame:", x, y, width, height);
  baseMaskView = v7->_baseMaskView;
  v7->_baseMaskView = v12;

  v14 = [(PKColorPickerCrosshairView *)v7 baseMaskView];
  [v14 setExcludeCorner:1];

  v15 = [(PKColorPickerCrosshairView *)v7 baseMaskView];
  [v15 setCornerPosition:1];

  v16 = [(PKColorPickerCrosshairView *)v7 baseMaskView];
  v17 = [(PKColorPickerCrosshairView *)v7 baseView];
  [v17 setMaskView:v16];

  v18 = -[_PKColorPickerSimpleCrosshairView initWithFrame:]([_PKColorPickerSimpleCrosshairView alloc], "initWithFrame:", x, y, width, height);
  cornerEdgeView = v7->_cornerEdgeView;
  v7->_cornerEdgeView = v18;

  v20 = [(PKColorPickerCrosshairView *)v7 cornerEdgeView];
  [v20 setBorderCornerRadius:8.0];

  v21 = [(PKColorPickerCrosshairView *)v7 cornerEdgeView];
  [(PKColorPickerCrosshairView *)v7 addSubview:v21];

  v22 = -[_PKColorPickerCrosshairCornerMaskView initWithFrame:]([_PKColorPickerCrosshairCornerMaskView alloc], "initWithFrame:", x, y, width, height);
  cornerEdgeMaskView = v7->_cornerEdgeMaskView;
  v7->_cornerEdgeMaskView = v22;

  v24 = [(PKColorPickerCrosshairView *)v7 cornerEdgeMaskView];
  [v24 setExcludeCorner:0];

  v25 = [(PKColorPickerCrosshairView *)v7 cornerEdgeMaskView];
  [v25 setCornerPosition:1];

  v26 = [(PKColorPickerCrosshairView *)v7 cornerEdgeMaskView];
  v27 = [(PKColorPickerCrosshairView *)v7 cornerEdgeView];
  [v27 setMaskView:v26];

  [(PKColorPickerCrosshairView *)v7 setClipsToBounds:0];
  [(PKColorPickerCrosshairView *)v7 setUserInteractionEnabled:0];
  return v7;
}

- (void)setCornerPosition:(unint64_t)a3
{
  if (self->_cornerPosition != a3)
  {
    self->_cornerPosition = a3;
    v5 = [(PKColorPickerCrosshairView *)self baseMaskView];
    [v5 setCornerPosition:a3];

    id v6 = [(PKColorPickerCrosshairView *)self cornerEdgeMaskView];
    [v6 setCornerPosition:a3];
  }
}

- (void)layoutSubviews
{
  v35.receiver = self;
  v35.super_class = (Class)PKColorPickerCrosshairView;
  [(PKColorPickerCrosshairView *)&v35 layoutSubviews];
  [(PKColorPickerCrosshairView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(PKColorPickerCrosshairView *)self baseView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  [(PKColorPickerCrosshairView *)self bounds];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  v20 = [(PKColorPickerCrosshairView *)self cornerEdgeView];
  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);

  v21 = [(PKColorPickerCrosshairView *)self baseView];
  [v21 bounds];
  CGRect v37 = CGRectInset(v36, -4.0, -4.0);
  double x = v37.origin.x;
  double y = v37.origin.y;
  double width = v37.size.width;
  double height = v37.size.height;
  v26 = [(PKColorPickerCrosshairView *)self baseMaskView];
  objc_msgSend(v26, "setFrame:", x, y, width, height);

  v27 = [(PKColorPickerCrosshairView *)self cornerEdgeView];
  [v27 bounds];
  CGRect v39 = CGRectInset(v38, -4.0, -4.0);
  double v28 = v39.origin.x;
  double v29 = v39.origin.y;
  double v30 = v39.size.width;
  double v31 = v39.size.height;
  v32 = [(PKColorPickerCrosshairView *)self cornerEdgeMaskView];
  objc_msgSend(v32, "setFrame:", v28, v29, v30, v31);

  v33 = [(PKColorPickerCrosshairView *)self delegate];
  uint64_t v34 = [v33 cornerPositionForColorPickerCrosshairView:self];

  [(PKColorPickerCrosshairView *)self setCornerPosition:v34];
}

- (void)update
{
  double v3 = [(PKColorPickerCrosshairView *)self delegate];
  [v3 frameForColorPickerCrosshairView:self];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[PKColorPickerCrosshairView setFrame:](self, "setFrame:", v5, v7, v9, v11);
  [(PKColorPickerCrosshairView *)self setNeedsLayout];

  [(PKColorPickerCrosshairView *)self layoutIfNeeded];
}

- (PKColorPickerCrosshairViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKColorPickerCrosshairViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)cornerPosition
{
  return self->_cornerPosition;
}

- (_PKColorPickerSimpleCrosshairView)baseView
{
  return self->_baseView;
}

- (void)setBaseView:(id)a3
{
}

- (_PKColorPickerCrosshairCornerMaskView)baseMaskView
{
  return self->_baseMaskView;
}

- (void)setBaseMaskView:(id)a3
{
}

- (_PKColorPickerSimpleCrosshairView)cornerEdgeView
{
  return self->_cornerEdgeView;
}

- (void)setCornerEdgeView:(id)a3
{
}

- (_PKColorPickerCrosshairCornerMaskView)cornerEdgeMaskView
{
  return self->_cornerEdgeMaskView;
}

- (void)setCornerEdgeMaskView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cornerEdgeMaskView, 0);
  objc_storeStrong((id *)&self->_cornerEdgeView, 0);
  objc_storeStrong((id *)&self->_baseMaskView, 0);
  objc_storeStrong((id *)&self->_baseView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end