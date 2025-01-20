@interface CAMInstructionLabel
- (BOOL)_wantsPrefixActivityIndicatorView;
- (BOOL)useModeDialFontSize;
- (CAMInstructionLabel)initWithFrame:(CGRect)a3;
- (CAMInstructionLabelDelegate)delegate;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSAttributedString)_attributedText;
- (NSString)_symbolPrefixName;
- (NSString)_symbolSuffixName;
- (NSString)text;
- (UIActivityIndicatorView)_activityIndicatorView;
- (UIColor)_textColor;
- (UIEdgeInsets)_textInsets;
- (UILabel)_label;
- (double)_backgroundAlpha;
- (double)_backgroundColorWhiteValue;
- (double)_defaultCornerRadius;
- (id)_textAttributes;
- (int64_t)style;
- (void)_updateAttributedText;
- (void)_updateLabel;
- (void)_updateLayerCornerRadius;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setStyle:(int64_t)a3;
- (void)setText:(id)a3;
- (void)setUseModeDialFontSize:(BOOL)a3;
- (void)set_activityIndicatorView:(id)a3;
- (void)set_attributedText:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CAMInstructionLabel

- (CAMInstructionLabel)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CAMInstructionLabel;
  v3 = -[CAMInstructionLabel initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(CAMInstructionLabel *)v3 _backgroundAlpha];
    [(CAMInstructionLabel *)v4 _backgroundColorWhiteValue];
    v5 = objc_msgSend(MEMORY[0x263F825C8], "colorWithWhite:alpha:");
    [(CAMInstructionLabel *)v4 setBackgroundColor:v5];

    id v6 = objc_alloc(MEMORY[0x263F828E0]);
    uint64_t v7 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    label = v4->__label;
    v4->__label = (UILabel *)v7;

    [(UILabel *)v4->__label setTextAlignment:1];
    [(UILabel *)v4->__label setNumberOfLines:0];
    [(CAMInstructionLabel *)v4 addSubview:v4->__label];
    v9 = v4;
  }

  return v4;
}

- (int64_t)style
{
  return self->_style;
}

- (void)_updateLabel
{
  v3 = [(CAMInstructionLabel *)self _label];
  v4 = [(CAMInstructionLabel *)self _attributedText];
  [v3 setAttributedText:v4];

  [(CAMInstructionLabel *)self setNeedsLayout];
  id v5 = [(CAMInstructionLabel *)self delegate];
  [v5 instructionLabelDidChangeIntrinsicContentSize:self];
}

- (NSString)text
{
  return self->_text;
}

- (UILabel)_label
{
  return self->__label;
}

- (CAMInstructionLabelDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CAMInstructionLabelDelegate *)WeakRetained;
}

- (void)setUseModeDialFontSize:(BOOL)a3
{
  if (self->_useModeDialFontSize != a3)
  {
    self->_useModeDialFontSize = a3;
    [(CAMInstructionLabel *)self _updateAttributedText];
    [(CAMInstructionLabel *)self setNeedsLayout];
  }
}

- (void)setDelegate:(id)a3
{
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v6 = [(CAMInstructionLabel *)self _attributedText];
  [(CAMInstructionLabel *)self _textInsets];
  if (width <= 0.0 || height <= 0.0)
  {
    [v6 size];
  }
  else
  {
    double v11 = width - v8 - v10;
    double v12 = height - v7 - v9;
    v13 = [(CAMInstructionLabel *)self traitCollection];
    v14 = [v13 preferredContentSizeCategory];
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v14);

    if (IsAccessibilityCategory) {
      -[UILabel sizeThatFits:](self->__label, "sizeThatFits:", v11, v12);
    }
    else {
      objc_msgSend(v6, "boundingRectWithSize:options:context:", 1, 0, v11, v12);
    }
  }
  [(CAMInstructionLabel *)self _wantsPrefixActivityIndicatorView];
  UICeilToViewScale();
  double v17 = v16;
  UICeilToViewScale();
  double v19 = v18;

  double v20 = v17;
  double v21 = v19;
  result.double height = v21;
  result.double width = v20;
  return result;
}

- (id)_textAttributes
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v4 = [(CAMInstructionLabel *)self _textColor];
  id v5 = [(CAMInstructionLabel *)self traitCollection];
  id v6 = [v5 preferredContentSizeCategory];

  if ([(CAMInstructionLabel *)self useModeDialFontSize]) {
    +[CAMFont cameraModeDialFontForContentSize:v6];
  }
  else {
  double v7 = +[CAMFont cameraFontForContentSize:v6];
  }
  id v8 = objc_alloc_init(MEMORY[0x263F81650]);
  [v8 setAlignment:1];
  [v8 setLineBreakMode:0];
  [v8 setLineBreakStrategy:0xFFFFLL];
  double v9 = [(CAMInstructionLabel *)self text];
  BOOL v10 = +[CAMFont isExtraLongCharacterSet:v9];

  double v11 = 1.39999998;
  if (!v10) {
    double v11 = 1.0;
  }
  [v8 setLineHeightMultiple:v11];
  id v12 = objc_alloc_init(MEMORY[0x263F81660]);
  v13 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.75];
  [v12 setShadowColor:v13];

  objc_msgSend(v12, "setShadowOffset:", 0.0, 0.0);
  [v12 setShadowBlurRadius:3.0];
  [v3 setObject:v4 forKeyedSubscript:*MEMORY[0x263F81500]];
  [v3 setObject:v7 forKeyedSubscript:*MEMORY[0x263F814F0]];
  [v3 setObject:v8 forKeyedSubscript:*MEMORY[0x263F81540]];
  [v3 setObject:v12 forKeyedSubscript:*MEMORY[0x263F81560]];

  return v3;
}

- (BOOL)useModeDialFontSize
{
  return self->_useModeDialFontSize;
}

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    [(CAMInstructionLabel *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  v32.receiver = self;
  v32.super_class = (Class)CAMInstructionLabel;
  [(CAMInstructionLabel *)&v32 layoutSubviews];
  [(CAMInstructionLabel *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v30 = v9;
  if ([(CAMInstructionLabel *)self _wantsPrefixActivityIndicatorView])
  {
    BOOL v10 = [(CAMInstructionLabel *)self _activityIndicatorView];

    if (!v10)
    {
      double v11 = (void *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
      [(CAMInstructionLabel *)self set_activityIndicatorView:v11];

      id v12 = [(CAMInstructionLabel *)self _activityIndicatorView];
      [v12 startAnimating];

      v13 = [(CAMInstructionLabel *)self _activityIndicatorView];
      [(CAMInstructionLabel *)self addSubview:v13];
    }
  }
  [(CAMInstructionLabel *)self _textInsets];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v26 = v4 + v16;
  double v27 = v6 + v14;
  double v28 = v8;
  double v29 = v6;
  double v22 = v8 - (v16 + v20);
  double v23 = v30 - (v14 + v18);
  BOOL v24 = ![(CAMInstructionLabel *)self _wantsPrefixActivityIndicatorView];
  double v25 = 0.0;
  v31[1] = 3221225472;
  v31[0] = MEMORY[0x263EF8330];
  v31[2] = __37__CAMInstructionLabel_layoutSubviews__block_invoke;
  v31[3] = &unk_263FA4F90;
  v31[4] = self;
  if (!v24) {
    double v25 = 16.0;
  }
  *(double *)&v31[5] = v26 + v25;
  *(double *)&v31[6] = v27;
  *(double *)&v31[7] = v22 - v25;
  *(double *)&v31[8] = v23;
  *(double *)&v31[9] = v15;
  *(double *)&v31[10] = v17;
  *(double *)&v31[11] = v19;
  *(double *)&v31[12] = v21;
  *(double *)&v31[13] = v4;
  *(double *)&v31[14] = v29;
  *(double *)&v31[15] = v28;
  *(double *)&v31[16] = v30;
  [MEMORY[0x263F82E00] performWithoutAnimation:v31];
  [(CAMInstructionLabel *)self _updateLayerCornerRadius];
}

- (void)setText:(id)a3
{
  id v4 = a3;
  uint64_t text = (uint64_t)self->_text;
  if ((id)text != v4)
  {
    double v8 = v4;
    uint64_t text = [(id)text isEqualToString:v4];
    id v4 = v8;
    if ((text & 1) == 0)
    {
      double v6 = (NSString *)[v8 copy];
      double v7 = self->_text;
      self->_uint64_t text = v6;

      uint64_t text = [(CAMInstructionLabel *)self _updateAttributedText];
      id v4 = v8;
    }
  }
  MEMORY[0x270F9A758](text, v4);
}

- (CGSize)intrinsicContentSize
{
  -[CAMInstructionLabel sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v6 = [a3 preferredContentSizeCategory];
  id v4 = [(CAMInstructionLabel *)self traitCollection];
  id v5 = [v4 preferredContentSizeCategory];

  if (v5 != v6 && ([v5 isEqualToString:v6] & 1) == 0)
  {
    [(CAMInstructionLabel *)self _updateAttributedText];
    [(CAMInstructionLabel *)self setNeedsLayout];
  }
}

void __37__CAMInstructionLabel_layoutSubviews__block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) _label];
  objc_msgSend(v2, "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));

  CGAffineTransformMakeScale(&v8, 0.6, 0.6);
  double v3 = [*(id *)(a1 + 32) _activityIndicatorView];
  CGAffineTransform v7 = v8;
  [v3 setTransform:&v7];

  id v4 = [*(id *)(a1 + 32) _activityIndicatorView];
  objc_msgSend(v4, "setFrame:", *(double *)(a1 + 80), 0.0, 10.0, *(double *)(a1 + 128));

  uint64_t v5 = [*(id *)(a1 + 32) _wantsPrefixActivityIndicatorView] ^ 1;
  id v6 = [*(id *)(a1 + 32) _activityIndicatorView];
  [v6 setHidden:v5];
}

- (void)_updateAttributedText
{
  double v3 = [(CAMInstructionLabel *)self text];
  if (v3)
  {
    id v4 = [(CAMInstructionLabel *)self _textAttributes];
    id v16 = (id)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v3];
    uint64_t v5 = [(CAMInstructionLabel *)self _symbolPrefixName];
    id v6 = [(CAMInstructionLabel *)self _symbolSuffixName];
    if ([v5 length])
    {
      CGAffineTransform v7 = [MEMORY[0x263F827E8] systemImageNamed:v5];
      if (v7)
      {
        CGAffineTransform v8 = [MEMORY[0x263F81678] textAttachmentWithImage:v7];
        double v9 = [MEMORY[0x263F086A0] attributedStringWithAttachment:v8];
        BOOL v10 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:@" "];
        [v16 insertAttributedString:v10 atIndex:0];

        [v16 insertAttributedString:v9 atIndex:0];
      }
    }
    if ([v6 length])
    {
      double v11 = [MEMORY[0x263F827E8] systemImageNamed:v6];
      if (v11)
      {
        id v12 = [MEMORY[0x263F81678] textAttachmentWithImage:v11];
        v13 = [MEMORY[0x263F086A0] attributedStringWithAttachment:v12];
        double v14 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:@" "];
        [v16 appendAttributedString:v14];

        [v16 appendAttributedString:v13];
      }
    }
    objc_msgSend(v16, "addAttributes:range:", v4, 0, objc_msgSend(v16, "length"));

    id v15 = v16;
  }
  else
  {
    id v15 = 0;
  }
  id v17 = v15;
  [(CAMInstructionLabel *)self set_attributedText:v15];
  [(CAMInstructionLabel *)self _updateLabel];
}

- (void)_updateLayerCornerRadius
{
  [(CAMInstructionLabel *)self _defaultCornerRadius];
  double v4 = v3;
  int64_t v5 = [(CAMInstructionLabel *)self style];
  if (v5 == 2)
  {
    [(CAMInstructionLabel *)self bounds];
    double v4 = v6 * 0.5;
  }
  else if (v5 == 1)
  {
    double v4 = 2.0;
  }
  id v7 = [(CAMInstructionLabel *)self layer];
  [v7 setCornerRadius:v4];
}

- (UIEdgeInsets)_textInsets
{
  double v2 = CAMPixelWidthForView(self);
  double v3 = v2 * 2.0 + 2.0;
  double v4 = 11.0;
  double v5 = 10.0;
  double v6 = v2 + 2.0;
  result.right = v5;
  result.bottom = v3;
  result.left = v4;
  result.top = v6;
  return result;
}

- (UIColor)_textColor
{
  return (UIColor *)[MEMORY[0x263F825C8] whiteColor];
}

- (double)_backgroundAlpha
{
  return 0.5;
}

- (double)_backgroundColorWhiteValue
{
  return 0.0;
}

- (NSString)_symbolPrefixName
{
  return 0;
}

- (BOOL)_wantsPrefixActivityIndicatorView
{
  return 0;
}

- (double)_defaultCornerRadius
{
  return 0.0;
}

- (NSAttributedString)_attributedText
{
  return self->__attributedText;
}

- (void)set_attributedText:(id)a3
{
}

- (UIActivityIndicatorView)_activityIndicatorView
{
  return self->__activityIndicatorView;
}

- (void)set_activityIndicatorView:(id)a3
{
}

- (NSString)_symbolSuffixName
{
  return self->__symbolSuffixName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__symbolSuffixName, 0);
  objc_storeStrong((id *)&self->__activityIndicatorView, 0);
  objc_storeStrong((id *)&self->__attributedText, 0);
  objc_storeStrong((id *)&self->__label, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_text, 0);
}

@end