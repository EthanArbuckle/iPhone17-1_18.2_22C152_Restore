@interface CAMOrientationInstructionView
- (BOOL)hasBlurredBackground;
- (CAMOrientationInstructionView)initWithFrame:(CGRect)a3;
- (UILabel)_label;
- (UIVisualEffectView)_effectView;
- (int64_t)_interfaceOrientation;
- (int64_t)orientation;
- (void)_formatLabel;
- (void)layoutSubviews;
- (void)setHasBlurredBackground:(BOOL)a3;
- (void)setHasBlurredBackground:(BOOL)a3 animated:(BOOL)a4;
- (void)setOrientation:(int64_t)a3;
- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4;
- (void)set_effectView:(id)a3;
- (void)set_interfaceOrientation:(int64_t)a3;
@end

@implementation CAMOrientationInstructionView

- (CAMOrientationInstructionView)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CAMOrientationInstructionView;
  v3 = -[CAMOrientationInstructionView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(CAMOrientationInstructionView *)v3 setUserInteractionEnabled:0];
    v4->__interfaceOrientation = 1;
    v5 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    label = v4->__label;
    v4->__label = v5;

    [(UILabel *)v4->__label setNumberOfLines:0];
    id v7 = objc_alloc(MEMORY[0x263F82E50]);
    v8 = [MEMORY[0x263F824D8] effectWithBlurRadius:25.0];
    uint64_t v9 = [v7 initWithEffect:v8];
    effectView = v4->__effectView;
    v4->__effectView = (UIVisualEffectView *)v9;

    v4->_hasBlurredBackground = 1;
    [(CAMOrientationInstructionView *)v4 addSubview:v4->__effectView];
    [(CAMOrientationInstructionView *)v4 addSubview:v4->__label];
    [(CAMOrientationInstructionView *)v4 _formatLabel];
  }
  return v4;
}

- (void)_formatLabel
{
  v30[3] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263F81650]);
  [v2 setAlignment:1];
  [v2 setLineBreakMode:0];
  [v2 setLineBreakStrategy:0xFFFFLL];
  id v3 = objc_alloc_init(MEMORY[0x263F81660]);
  v4 = [MEMORY[0x263F825C8] blackColor];
  v5 = [v4 colorWithAlphaComponent:0.35];
  [v3 setShadowColor:v5];

  objc_msgSend(v3, "setShadowOffset:", 0.0, 0.0);
  [v3 setShadowBlurRadius:2.0];
  v24 = [MEMORY[0x263F827E8] systemImageNamed:@"rectangle.portrait.rotate"];
  v23 = [MEMORY[0x263F81678] textAttachmentWithImage:v24];
  id v6 = objc_alloc(MEMORY[0x263F089B8]);
  id v7 = [MEMORY[0x263F086A0] attributedStringWithAttachment:v23];
  v8 = (void *)[v6 initWithAttributedString:v7];

  v22 = +[CAMFont cameraMonospacedFontOfSize:42.0 weight:*MEMORY[0x263F81848]];
  uint64_t v10 = *MEMORY[0x263F81540];
  v28[0] = *MEMORY[0x263F814F0];
  uint64_t v9 = v28[0];
  v28[1] = v10;
  v30[0] = v22;
  v30[1] = v2;
  uint64_t v29 = *MEMORY[0x263F81560];
  uint64_t v11 = v29;
  v30[2] = v3;
  objc_super v12 = [NSDictionary dictionaryWithObjects:v30 forKeys:v28 count:3];
  objc_msgSend(v8, "addAttributes:range:", v12, 0, objc_msgSend(v8, "length"));
  v13 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:@"\n"];
  id v14 = objc_alloc(MEMORY[0x263F086A0]);
  v15 = CAMLocalizedFrameworkString(@"SPATIAL_VIDEO_LANDSCAPE_ORIENTATION_INSTRUCTION_LABEL", 0);
  v16 = (void *)[v14 initWithString:v15];
  [v13 appendAttributedString:v16];

  v17 = +[CAMFont cameraFontForContentSize:*MEMORY[0x263F83450]];
  v18 = +[CAMFont cameraKerningForFont:v17];
  uint64_t v19 = *MEMORY[0x263F81510];
  v26[0] = v9;
  v26[1] = v19;
  v27[0] = v17;
  v27[1] = v18;
  v26[2] = v10;
  v26[3] = v11;
  v27[2] = v2;
  v27[3] = v3;
  v20 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:4];
  objc_msgSend(v13, "addAttributes:range:", v20, 0, objc_msgSend(v13, "length"));
  [v8 appendAttributedString:v13];
  v21 = [(CAMOrientationInstructionView *)self _label];
  [v21 setAttributedText:v8];
}

- (void)setHasBlurredBackground:(BOOL)a3
{
}

- (void)setHasBlurredBackground:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_hasBlurredBackground != a3)
  {
    self->_hasBlurredBackground = a3;
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __66__CAMOrientationInstructionView_setHasBlurredBackground_animated___block_invoke;
    v4[3] = &unk_263FA02A8;
    v4[4] = self;
    BOOL v5 = a3;
    +[CAMView animateIfNeededWithDuration:v4 animations:0 completion:0.25];
  }
}

void __66__CAMOrientationInstructionView_setHasBlurredBackground_animated___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    double v1 = 1.0;
  }
  else {
    double v1 = 0.0;
  }
  id v2 = [*(id *)(a1 + 32) _effectView];
  [v2 setAlpha:v1];
}

- (void)setOrientation:(int64_t)a3
{
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_orientation != a3)
  {
    BOOL v4 = a4;
    self->_orientation = a3;
    if ((unint64_t)(a3 - 1) <= 1) {
      -[CAMOrientationInstructionView set_interfaceOrientation:](self, "set_interfaceOrientation:");
    }
    id v6 = [(CAMOrientationInstructionView *)self _label];
    +[CAMView rotateView:v6 toInterfaceOrientation:[(CAMOrientationInstructionView *)self _interfaceOrientation] animated:v4];
  }
}

- (void)layoutSubviews
{
  v20.receiver = self;
  v20.super_class = (Class)CAMOrientationInstructionView;
  [(CAMOrientationInstructionView *)&v20 layoutSubviews];
  [(CAMOrientationInstructionView *)self bounds];
  double x = v21.origin.x;
  double y = v21.origin.y;
  double width = v21.size.width;
  double height = v21.size.height;
  CGRectGetMidX(v21);
  UIRoundToViewScale();
  double v19 = v7;
  v22.origin.double x = x;
  v22.origin.double y = y;
  v22.size.double width = width;
  v22.size.double height = height;
  CGRectGetMidY(v22);
  UIRoundToViewScale();
  double v18 = v8;
  v23.origin.double x = x;
  v23.origin.double y = y;
  v23.size.double width = width;
  v23.size.double height = height;
  CGRect v24 = CGRectInset(v23, 16.0, 0.0);
  double v9 = v24.origin.x;
  double v10 = v24.origin.y;
  double v11 = v24.size.width;
  double v12 = v24.size.height;
  v13 = [(CAMOrientationInstructionView *)self _label];
  objc_msgSend(v13, "setBounds:", v9, v10, v11, v12);

  id v14 = [(CAMOrientationInstructionView *)self _label];
  objc_msgSend(v14, "setCenter:", v19, v18);

  v15 = [(CAMOrientationInstructionView *)self _effectView];
  objc_msgSend(v15, "setCenter:", v19, v18);

  v16 = [(CAMOrientationInstructionView *)self _effectView];
  objc_msgSend(v16, "setBounds:", x, y, width, height);

  v17 = [(CAMOrientationInstructionView *)self _label];
  +[CAMView rotateView:v17 toInterfaceOrientation:[(CAMOrientationInstructionView *)self _interfaceOrientation] animated:0];
}

- (BOOL)hasBlurredBackground
{
  return self->_hasBlurredBackground;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (UILabel)_label
{
  return self->__label;
}

- (int64_t)_interfaceOrientation
{
  return self->__interfaceOrientation;
}

- (void)set_interfaceOrientation:(int64_t)a3
{
  self->__interfaceOrientation = a3;
}

- (UIVisualEffectView)_effectView
{
  return self->__effectView;
}

- (void)set_effectView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__effectView, 0);
  objc_storeStrong((id *)&self->__label, 0);
}

@end