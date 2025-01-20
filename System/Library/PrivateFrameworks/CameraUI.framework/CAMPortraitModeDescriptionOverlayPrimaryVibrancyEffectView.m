@interface CAMPortraitModeDescriptionOverlayPrimaryVibrancyEffectView
+ (id)defaultContentColor;
- (CAMPortraitModeDescriptionOverlayPrimaryVibrancyEffectView)initWithFrame:(CGRect)a3;
- (UIView)contentView;
- (void)layoutSubviews;
@end

@implementation CAMPortraitModeDescriptionOverlayPrimaryVibrancyEffectView

- (CAMPortraitModeDescriptionOverlayPrimaryVibrancyEffectView)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CAMPortraitModeDescriptionOverlayPrimaryVibrancyEffectView;
  v3 = -[CAMPortraitModeDescriptionOverlayPrimaryVibrancyEffectView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F82E00]);
    uint64_t v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    contentView = v3->_contentView;
    v3->_contentView = (UIView *)v5;

    [(CAMPortraitModeDescriptionOverlayPrimaryVibrancyEffectView *)v3 addSubview:v3->_contentView];
    v7 = [(UIView *)v3->_contentView layer];
    [v7 setCompositingFilter:*MEMORY[0x263F15CD8]];

    v8 = [(CAMPortraitModeDescriptionOverlayPrimaryVibrancyEffectView *)v3 layer];
    [v8 setAllowsGroupBlending:0];

    v9 = v3;
  }

  return v3;
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)CAMPortraitModeDescriptionOverlayPrimaryVibrancyEffectView;
  [(CAMPortraitModeDescriptionOverlayPrimaryVibrancyEffectView *)&v12 layoutSubviews];
  [(CAMPortraitModeDescriptionOverlayPrimaryVibrancyEffectView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  objc_super v11 = [(CAMPortraitModeDescriptionOverlayPrimaryVibrancyEffectView *)self contentView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
}

+ (id)defaultContentColor
{
  return (id)[MEMORY[0x263F825C8] colorWithWhite:1.0 alpha:0.72];
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void).cxx_destruct
{
}

@end