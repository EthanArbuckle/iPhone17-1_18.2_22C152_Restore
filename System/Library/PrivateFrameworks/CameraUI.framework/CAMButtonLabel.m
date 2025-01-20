@interface CAMButtonLabel
- (BOOL)wantsLegibilityShadow;
- (CAMButtonLabel)initWithFrame:(CGRect)a3;
- (CGSize)contentSize;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)text;
- (UIColor)textColor;
- (UILabel)_label;
- (id)highlightedTextColor;
- (int64_t)textAlignment;
- (void)_updateAttributedText;
- (void)_updateInternalContentSize;
- (void)setHighlightedTextColor:(id)a3;
- (void)setText:(id)a3;
- (void)setTextAlignment:(int64_t)a3;
- (void)setTextColor:(id)a3;
- (void)setWantsLegibilityShadow:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CAMButtonLabel

- (CAMButtonLabel)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)CAMButtonLabel;
  v3 = -[CAMButtonLabel initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F828E0]);
    [(CAMButtonLabel *)v3 bounds];
    uint64_t v5 = objc_msgSend(v4, "initWithFrame:");
    label = v3->__label;
    v3->__label = (UILabel *)v5;

    v7 = v3->__label;
    v8 = [MEMORY[0x263F825C8] whiteColor];
    [(UILabel *)v7 setTextColor:v8];

    v9 = v3->__label;
    v10 = +[CAMFont cameraFontForContentSize:*MEMORY[0x263F83468]];
    [(UILabel *)v9 setFont:v10];

    v11 = v3->__label;
    v12 = [MEMORY[0x263F825C8] clearColor];
    [(UILabel *)v11 setBackgroundColor:v12];

    [(UILabel *)v3->__label setTextAlignment:0];
    [(CAMButtonLabel *)v3 addSubview:v3->__label];
  }
  return v3;
}

- (void)setText:(id)a3
{
  id v4 = a3;
  uint64_t text = (uint64_t)self->_text;
  if ((id)text != v4)
  {
    v8 = v4;
    uint64_t text = [(id)text isEqualToString:v4];
    id v4 = v8;
    if ((text & 1) == 0)
    {
      v6 = (NSString *)[v8 copy];
      v7 = self->_text;
      self->_uint64_t text = v6;

      [(CAMButtonLabel *)self _updateAttributedText];
      uint64_t text = [(CAMButtonLabel *)self _updateInternalContentSize];
      id v4 = v8;
    }
  }
  MEMORY[0x270F9A758](text, v4);
}

- (void)_updateAttributedText
{
  v20[2] = *MEMORY[0x263EF8340];
  v3 = [(CAMButtonLabel *)self text];
  if (v3)
  {
    id v4 = [(UILabel *)self->__label font];
    id v5 = objc_alloc_init(MEMORY[0x263F81650]);
    [v4 leading];
    objc_msgSend(v5, "setLineSpacing:");
    uint64_t v6 = *MEMORY[0x263F81540];
    v19[0] = *MEMORY[0x263F814F0];
    v19[1] = v6;
    v20[0] = v4;
    v20[1] = v5;
    v7 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
    id v8 = objc_alloc(MEMORY[0x263F089B8]);
    v9 = [(CAMButtonLabel *)self text];
    v10 = (void *)[v8 initWithString:v9 attributes:v7];

    if ([(CAMButtonLabel *)self wantsLegibilityShadow])
    {
      id v11 = objc_alloc_init(MEMORY[0x263F81660]);
      v12 = [MEMORY[0x263F825C8] blackColor];
      [v11 setShadowColor:v12];

      objc_msgSend(v11, "setShadowOffset:", 0.0, 0.0);
      [v11 setShadowBlurRadius:3.0];
      objc_msgSend(v10, "addAttribute:value:range:", *MEMORY[0x263F81560], v11, 0, objc_msgSend(v10, "length"));
    }
    v13 = +[CAMFormattingManager sharedManager];
    int v14 = [v13 wantsCustomKerning];

    if (v14)
    {
      v15 = +[CAMFont cameraKerningForFont:v4];
      uint64_t v17 = *MEMORY[0x263F81510];
      v18 = v15;
      v16 = [NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
      objc_msgSend(v10, "addAttributes:range:", v16, 0, objc_msgSend(v10, "length"));
    }
    [(UILabel *)self->__label setAttributedText:v10];
  }
}

- (NSString)text
{
  return self->_text;
}

- (BOOL)wantsLegibilityShadow
{
  return self->_wantsLegibilityShadow;
}

- (void)_updateInternalContentSize
{
  p_contentSize = &self->_contentSize;
  -[UILabel sizeThatFits:](self->__label, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  p_contentSize->width = v4;
  p_contentSize->height = v5;
  label = self->__label;
  -[UILabel setFrame:](label, "setFrame:", 0.0, 0.0, v4, v5);
}

- (void)setTextAlignment:(int64_t)a3
{
}

- (void)setWantsLegibilityShadow:(BOOL)a3
{
  if (self->_wantsLegibilityShadow != a3)
  {
    self->_wantsLegibilityShadow = a3;
    [(CAMButtonLabel *)self _updateAttributedText];
  }
}

- (void)setTextColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__label, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[UILabel sizeThatFits:](self->__label, "sizeThatFits:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)intrinsicContentSize
{
  [(UILabel *)self->__label intrinsicContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (UIColor)textColor
{
  return [(UILabel *)self->__label textColor];
}

- (id)highlightedTextColor
{
  return [(UILabel *)self->__label highlightedTextColor];
}

- (void)setHighlightedTextColor:(id)a3
{
}

- (int64_t)textAlignment
{
  return [(UILabel *)self->__label textAlignment];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v7 = [a3 preferredContentSizeCategory];
  double v4 = [(CAMButtonLabel *)self traitCollection];
  id v5 = [v4 preferredContentSizeCategory];

  if (v5 != v7 && ([v5 isEqualToString:v7] & 1) == 0)
  {
    uint64_t v6 = +[CAMFont cameraFontForContentSize:v5];
    [(UILabel *)self->__label setFont:v6];
    [(CAMButtonLabel *)self _updateInternalContentSize];
    [(CAMButtonLabel *)self _updateAttributedText];
    [(UILabel *)self->__label invalidateIntrinsicContentSize];
    [(CAMButtonLabel *)self invalidateIntrinsicContentSize];
    [(CAMButtonLabel *)self setNeedsLayout];
  }
}

- (CGSize)contentSize
{
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (UILabel)_label
{
  return self->__label;
}

@end