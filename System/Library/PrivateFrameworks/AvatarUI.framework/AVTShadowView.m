@interface AVTShadowView
+ (double)defaultHeightForSuperview:(id)a3;
- (AVTShadowView)initWithFrame:(CGRect)a3;
- (CALayer)separator;
- (void)layoutSubviews;
- (void)setSeparator:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation AVTShadowView

+ (double)defaultHeightForSuperview:(id)a3
{
  return AVTRoundToViewScale(a3, 1.0);
}

- (AVTShadowView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)AVTShadowView;
  v3 = -[AVTShadowView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F1C550] clearColor];
    [(AVTShadowView *)v3 setBackgroundColor:v4];

    uint64_t v5 = [MEMORY[0x263F157E8] layer];
    separator = v3->_separator;
    v3->_separator = (CALayer *)v5;

    id v7 = +[AVTUIColorRepository separatorColor];
    -[CALayer setBackgroundColor:](v3->_separator, "setBackgroundColor:", [v7 CGColor]);

    [(AVTShadowView *)v3 bounds];
    -[CALayer setFrame:](v3->_separator, "setFrame:");
    v8 = [(AVTShadowView *)v3 layer];
    [v8 addSublayer:v3->_separator];
  }
  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)AVTShadowView;
  id v4 = a3;
  [(AVTShadowView *)&v9 traitCollectionDidChange:v4];
  uint64_t v5 = objc_msgSend(v4, "userInterfaceStyle", v9.receiver, v9.super_class);

  v6 = [(AVTShadowView *)self traitCollection];
  uint64_t v7 = [v6 userInterfaceStyle];

  if (v5 != v7)
  {
    id v8 = +[AVTUIColorRepository separatorColor];
    -[CALayer setBackgroundColor:](self->_separator, "setBackgroundColor:", [v8 CGColor]);
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)AVTShadowView;
  [(AVTShadowView *)&v3 layoutSubviews];
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  [(AVTShadowView *)self bounds];
  -[CALayer setFrame:](self->_separator, "setFrame:");
  [MEMORY[0x263F158F8] commit];
}

- (CALayer)separator
{
  return self->_separator;
}

- (void)setSeparator:(id)a3
{
}

- (void).cxx_destruct
{
}

@end