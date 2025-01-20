@interface _PKColorPickerSimpleCrosshairView
- (UIView)borderView;
- (UIView)shadowView;
- (_PKColorPickerSimpleCrosshairView)initWithFrame:(CGRect)a3;
- (double)_cornerRadiusForShadowView;
- (double)borderCornerRadius;
- (void)configureBorderView:(id)a3;
- (void)configureShadowView:(id)a3;
- (void)layoutSubviews;
- (void)setBorderCornerRadius:(double)a3;
- (void)setBorderView:(id)a3;
- (void)setShadowView:(id)a3;
@end

@implementation _PKColorPickerSimpleCrosshairView

- (_PKColorPickerSimpleCrosshairView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v17.receiver = self;
  v17.super_class = (Class)_PKColorPickerSimpleCrosshairView;
  v7 = -[_PKColorPickerSimpleCrosshairView initWithFrame:](&v17, sel_initWithFrame_);
  uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", x, y, width, height);
  shadowView = v7->_shadowView;
  v7->_shadowView = (UIView *)v8;

  v10 = [(_PKColorPickerSimpleCrosshairView *)v7 shadowView];
  [(_PKColorPickerSimpleCrosshairView *)v7 configureShadowView:v10];

  v11 = [(_PKColorPickerSimpleCrosshairView *)v7 shadowView];
  [(_PKColorPickerSimpleCrosshairView *)v7 addSubview:v11];

  uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", x, y, width, height);
  borderView = v7->_borderView;
  v7->_borderView = (UIView *)v12;

  v14 = [(_PKColorPickerSimpleCrosshairView *)v7 borderView];
  [(_PKColorPickerSimpleCrosshairView *)v7 configureBorderView:v14];

  v15 = [(_PKColorPickerSimpleCrosshairView *)v7 borderView];
  [(_PKColorPickerSimpleCrosshairView *)v7 addSubview:v15];

  [(_PKColorPickerSimpleCrosshairView *)v7 setClipsToBounds:0];
  return v7;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)_PKColorPickerSimpleCrosshairView;
  [(_PKColorPickerSimpleCrosshairView *)&v5 layoutSubviews];
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setValue:*MEMORY[0x1E4F1CFD0] forKey:*MEMORY[0x1E4F3A5A8]];
  v3 = [(_PKColorPickerSimpleCrosshairView *)self shadowView];
  [(_PKColorPickerSimpleCrosshairView *)self configureShadowView:v3];

  v4 = [(_PKColorPickerSimpleCrosshairView *)self borderView];
  [(_PKColorPickerSimpleCrosshairView *)self configureBorderView:v4];

  [MEMORY[0x1E4F39CF8] commit];
}

- (void)setBorderCornerRadius:(double)a3
{
  self->_borderCornerRadius = a3;
  [(_PKColorPickerSimpleCrosshairView *)self setNeedsLayout];
}

- (void)configureBorderView:(id)a3
{
  v4 = (void *)MEMORY[0x1E4FB1618];
  id v10 = a3;
  objc_msgSend(v4, "pk_crosshairViewBorderColor");
  id v5 = objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 CGColor];
  v7 = [v10 layer];
  [v7 setBorderColor:v6];

  uint64_t v8 = [v10 layer];
  [v8 setBorderWidth:2.0];

  v9 = [(_PKColorPickerSimpleCrosshairView *)self layer];
  [v9 bounds];
  objc_msgSend(v10, "setFrame:");

  [(_PKColorPickerSimpleCrosshairView *)self _cornerRadiusForBorderView];
  objc_msgSend(v10, "_setCornerRadius:");
}

- (void)configureShadowView:(id)a3
{
  v4 = (void *)MEMORY[0x1E4FB1618];
  id v16 = a3;
  id v5 = objc_msgSend(v4, "pk_crosshairViewShadowColor");
  id v6 = [v5 colorWithAlphaComponent:0.1];
  uint64_t v7 = [v6 CGColor];
  uint64_t v8 = [v16 layer];
  [v8 setBorderColor:v7];

  v9 = [v16 layer];
  [v9 setBorderWidth:4.0];

  [v16 setClipsToBounds:0];
  id v10 = [(_PKColorPickerSimpleCrosshairView *)self layer];
  [v10 bounds];
  CGFloat v11 = CGRectGetWidth(v18) + 2.0;
  uint64_t v12 = [(_PKColorPickerSimpleCrosshairView *)self layer];
  [v12 bounds];
  objc_msgSend(v16, "setFrame:", 0.0, 0.0, v11, CGRectGetHeight(v19) + 2.0);

  v13 = [(_PKColorPickerSimpleCrosshairView *)self layer];
  [v13 bounds];
  double MidX = CGRectGetMidX(v20);
  v15 = [(_PKColorPickerSimpleCrosshairView *)self layer];
  [v15 bounds];
  objc_msgSend(v16, "setPosition:", MidX, CGRectGetMidY(v21));

  [(_PKColorPickerSimpleCrosshairView *)self _cornerRadiusForShadowView];
  objc_msgSend(v16, "_setCornerRadius:");
  [v16 setAlpha:1.0];
}

- (double)_cornerRadiusForShadowView
{
  [(_PKColorPickerSimpleCrosshairView *)self borderCornerRadius];
  return v2 + 1.0;
}

- (double)borderCornerRadius
{
  return self->_borderCornerRadius;
}

- (UIView)shadowView
{
  return self->_shadowView;
}

- (void)setShadowView:(id)a3
{
}

- (UIView)borderView
{
  return self->_borderView;
}

- (void)setBorderView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borderView, 0);

  objc_storeStrong((id *)&self->_shadowView, 0);
}

@end