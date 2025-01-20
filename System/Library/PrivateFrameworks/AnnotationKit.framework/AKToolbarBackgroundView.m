@interface AKToolbarBackgroundView
- (AKToolbarBackgroundView)initWithFrame:(CGRect)a3;
- (BOOL)isTranslucent;
- (UIColor)separatorColor;
- (UIView)separatorLine;
- (int64_t)blurStyle;
- (void)_hostSeparatorInView:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setBackgroundImage:(id)a3 forToolbarPosition:(int64_t)a4 barMetrics:(int64_t)a5;
- (void)setBlurStyle:(int64_t)a3;
- (void)setOpaque:(BOOL)a3;
- (void)setSeparatorColor:(id)a3;
- (void)setSeparatorLine:(id)a3;
- (void)setShadowImage:(id)a3 forToolbarPosition:(int64_t)a4;
- (void)setTranslucent:(BOOL)a3;
- (void)updateSeparatorVisibility;
@end

@implementation AKToolbarBackgroundView

- (AKToolbarBackgroundView)initWithFrame:(CGRect)a3
{
  v16.receiver = self;
  v16.super_class = (Class)AKToolbarBackgroundView;
  v3 = -[AKToolbarBackgroundView initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F1C550] _secondarySystemBackgroundColor];
    [(AKToolbarBackgroundView *)v3 setBackgroundColor:v4];

    v3->_blurStyle = 2;
    id v5 = objc_alloc(MEMORY[0x263F1CB60]);
    v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [(AKToolbarBackgroundView *)v3 setSeparatorLine:v6];

    v7 = [MEMORY[0x263F1C550] _separatorColor];
    v8 = [(AKToolbarBackgroundView *)v3 separatorLine];
    [v8 setBackgroundColor:v7];

    v9 = [(AKToolbarBackgroundView *)v3 separatorLine];
    [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

    v10 = [(AKToolbarBackgroundView *)v3 separatorLine];
    v11 = [v10 heightAnchor];
    v12 = [MEMORY[0x263F1C920] mainScreen];
    [v12 scale];
    v14 = [v11 constraintEqualToConstant:1.0 / v13];
    [v14 setActive:1];

    [(AKToolbarBackgroundView *)v3 _hostSeparatorInView:v3];
  }
  return v3;
}

- (void)setOpaque:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AKToolbarBackgroundView;
  [(AKToolbarBackgroundView *)&v4 setOpaque:a3];
  [(AKToolbarBackgroundView *)self updateSeparatorVisibility];
}

- (void)setBackgroundColor:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AKToolbarBackgroundView;
  [(AKToolbarBackgroundView *)&v4 setBackgroundColor:a3];
  [(AKToolbarBackgroundView *)self updateSeparatorVisibility];
}

- (void)updateSeparatorVisibility
{
  if ([(AKToolbarBackgroundView *)self isTranslucent])
  {
    uint64_t v3 = 0;
  }
  else if ([(AKToolbarBackgroundView *)self isOpaque])
  {
    objc_super v4 = [(AKToolbarBackgroundView *)self backgroundColor];
    id v5 = [MEMORY[0x263F1C550] clearColor];
    uint64_t v3 = [v4 isEqual:v5];
  }
  else
  {
    uint64_t v3 = 1;
  }
  id v6 = [(AKToolbarBackgroundView *)self separatorLine];
  [v6 setHidden:v3];
}

- (void)setBlurStyle:(int64_t)a3
{
  if (self->_blurStyle != a3)
  {
    self->_blurStyle = a3;
    objc_msgSend(MEMORY[0x263F1C480], "effectWithStyle:", -[AKToolbarBackgroundView blurStyle](self, "blurStyle"));
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(UIVisualEffectView *)self->_visualEffectView setEffect:v4];
  }
}

- (void)setTranslucent:(BOOL)a3
{
  self->_translucent = a3;
  if (a3)
  {
    id v4 = objc_msgSend(MEMORY[0x263F1C480], "effectWithStyle:", -[AKToolbarBackgroundView blurStyle](self, "blurStyle"));
    id v5 = (UIVisualEffectView *)[objc_alloc(MEMORY[0x263F1CB98]) initWithEffect:v4];
    visualEffectView = self->_visualEffectView;
    self->_visualEffectView = v5;

    v7 = [MEMORY[0x263F1C550] clearColor];
    [(UIVisualEffectView *)self->_visualEffectView setBackgroundColor:v7];

    -[UIView ak_addSubview:withEdgeInsets:](self, "ak_addSubview:withEdgeInsets:", self->_visualEffectView, *MEMORY[0x263F1D1C0], *(double *)(MEMORY[0x263F1D1C0] + 8), *(double *)(MEMORY[0x263F1D1C0] + 16), *(double *)(MEMORY[0x263F1D1C0] + 24));
    [(AKToolbarBackgroundView *)self sendSubviewToBack:self->_visualEffectView];
    v8 = [(UIVisualEffectView *)self->_visualEffectView contentView];
    [(AKToolbarBackgroundView *)self _hostSeparatorInView:v8];

    v9 = [(AKToolbarBackgroundView *)self separatorLine];
    [v9 setOpaque:0];
  }
  else
  {
    v10 = [(AKToolbarBackgroundView *)self separatorLine];
    [v10 setOpaque:1];

    [(AKToolbarBackgroundView *)self _hostSeparatorInView:self];
    [(UIVisualEffectView *)self->_visualEffectView removeFromSuperview];
    id v4 = self->_visualEffectView;
    self->_visualEffectView = 0;
  }

  [(AKToolbarBackgroundView *)self updateSeparatorVisibility];
}

- (void)setSeparatorColor:(id)a3
{
  id v4 = a3;
  id v5 = [(AKToolbarBackgroundView *)self separatorLine];
  [v5 setBackgroundColor:v4];
}

- (void)setBackgroundImage:(id)a3 forToolbarPosition:(int64_t)a4 barMetrics:(int64_t)a5
{
}

- (void)setShadowImage:(id)a3 forToolbarPosition:(int64_t)a4
{
}

- (void)_hostSeparatorInView:(id)a3
{
  id v4 = a3;
  id v5 = [(AKToolbarBackgroundView *)self separatorLine];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v6 = [(AKToolbarBackgroundView *)self separatorLine];
  [v4 addSubview:v6];

  v7 = [(AKToolbarBackgroundView *)self separatorLine];
  v8 = [v7 topAnchor];
  v9 = [v4 topAnchor];
  v10 = [v8 constraintEqualToAnchor:v9];
  [v10 setActive:1];

  v11 = [(AKToolbarBackgroundView *)self separatorLine];
  v12 = [v11 leadingAnchor];
  double v13 = [v4 leadingAnchor];
  v14 = [v12 constraintEqualToAnchor:v13];
  [v14 setActive:1];

  id v18 = [(AKToolbarBackgroundView *)self separatorLine];
  v15 = [v18 trailingAnchor];
  objc_super v16 = [v4 trailingAnchor];

  v17 = [v15 constraintEqualToAnchor:v16];
  [v17 setActive:1];
}

- (UIView)separatorLine
{
  return self->_separatorLine;
}

- (void)setSeparatorLine:(id)a3
{
}

- (UIColor)separatorColor
{
  return self->_separatorColor;
}

- (BOOL)isTranslucent
{
  return self->_translucent;
}

- (int64_t)blurStyle
{
  return self->_blurStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorColor, 0);
  objc_storeStrong((id *)&self->_separatorLine, 0);

  objc_storeStrong((id *)&self->_visualEffectView, 0);
}

@end