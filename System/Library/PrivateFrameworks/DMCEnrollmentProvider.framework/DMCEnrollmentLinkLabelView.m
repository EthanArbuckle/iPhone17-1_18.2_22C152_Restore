@interface DMCEnrollmentLinkLabelView
- (BOOL)enabled;
- (CGSize)sizeThatFits:(CGSize)a3;
- (DMCEnrollmentLinkLabelView)initWithIcon:(id)a3 message:(id)a4 linkMessage:(id)a5 linkHandler:(id)a6;
- (NSString)linkMessage;
- (NSString)message;
- (UIImageView)imageView;
- (UILabel)textLabel;
- (id)_textFont;
- (id)linkHandler;
- (void)_populateTextLabelWithMessage:(id)a3 linkMessage:(id)a4;
- (void)layoutSubviews;
- (void)setEnabled:(BOOL)a3;
- (void)setImageView:(id)a3;
- (void)setLinkHandler:(id)a3;
- (void)setLinkMessage:(id)a3;
- (void)setMessage:(id)a3;
- (void)setTextLabel:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation DMCEnrollmentLinkLabelView

- (DMCEnrollmentLinkLabelView)initWithIcon:(id)a3 message:(id)a4 linkMessage:(id)a5 linkHandler:(id)a6
{
  v34[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v33.receiver = self;
  v33.super_class = (Class)DMCEnrollmentLinkLabelView;
  v14 = -[DMCEnrollmentLinkLabelView initWithFrame:](&v33, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  if (v14)
  {
    if (v10)
    {
      id v15 = objc_alloc(MEMORY[0x263F1C6D0]);
      v16 = [MEMORY[0x263F1C6B0] _systemImageNamed:v10];
      uint64_t v17 = [v15 initWithImage:v16];
      imageView = v14->_imageView;
      v14->_imageView = (UIImageView *)v17;

      [(UIImageView *)v14->_imageView setContentMode:2];
      [(DMCEnrollmentLinkLabelView *)v14 addSubview:v14->_imageView];
    }
    v14->_enabled = 1;
    uint64_t v19 = [v11 copy];
    message = v14->_message;
    v14->_message = (NSString *)v19;

    uint64_t v21 = [v12 copy];
    linkMessage = v14->_linkMessage;
    v14->_linkMessage = (NSString *)v21;

    uint64_t v23 = objc_opt_new();
    textLabel = v14->_textLabel;
    v14->_textLabel = (UILabel *)v23;

    [(UILabel *)v14->_textLabel setNumberOfLines:0];
    [(DMCEnrollmentLinkLabelView *)v14 _populateTextLabelWithMessage:v11 linkMessage:v12];
    [(DMCEnrollmentLinkLabelView *)v14 addSubview:v14->_textLabel];
    uint64_t v25 = MEMORY[0x223C90320](v13);
    id linkHandler = v14->_linkHandler;
    v14->_id linkHandler = (id)v25;

    [(DMCEnrollmentLinkLabelView *)v14 setUserInteractionEnabled:v13 != 0];
    objc_initWeak(&location, v14);
    v34[0] = objc_opt_class();
    v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:1];
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __75__DMCEnrollmentLinkLabelView_initWithIcon_message_linkMessage_linkHandler___block_invoke;
    v30[3] = &unk_2645E8EB0;
    objc_copyWeak(&v31, &location);
    id v28 = (id)[(DMCEnrollmentLinkLabelView *)v14 registerForTraitChanges:v27 withHandler:v30];

    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }

  return v14;
}

void __75__DMCEnrollmentLinkLabelView_initWithIcon_message_linkMessage_linkHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained message];
  v2 = [WeakRetained linkMessage];
  [WeakRetained _populateTextLabelWithMessage:v1 linkMessage:v2];
}

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)DMCEnrollmentLinkLabelView;
  [(DMCEnrollmentLinkLabelView *)&v15 layoutSubviews];
  [(DMCEnrollmentLinkLabelView *)self bounds];
  CGFloat v3 = (CGRectGetWidth(v16) + -35.0) * 0.5;
  v4 = [(DMCEnrollmentLinkLabelView *)self imageView];
  objc_msgSend(v4, "setFrame:", v3, 0.0, 35.0, 35.0);

  v5 = [(DMCEnrollmentLinkLabelView *)self textLabel];
  [(DMCEnrollmentLinkLabelView *)self bounds];
  objc_msgSend(v5, "sizeThatFits:", v6, v7);
  double v9 = v8;
  double v11 = v10;

  [(DMCEnrollmentLinkLabelView *)self bounds];
  CGFloat v12 = (CGRectGetWidth(v17) - v9) * 0.5;
  [(DMCEnrollmentLinkLabelView *)self bounds];
  CGFloat v13 = CGRectGetHeight(v18) - v11 + -5.0;
  v14 = [(DMCEnrollmentLinkLabelView *)self textLabel];
  objc_msgSend(v14, "setFrame:", v12, v13, v9, v11);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = [(DMCEnrollmentLinkLabelView *)self textLabel];
  objc_msgSend(v6, "sizeThatFits:", width, height);
  double v8 = v7;
  double v10 = v9;

  double v11 = [(DMCEnrollmentLinkLabelView *)self imageView];

  if (v11) {
    double v12 = v10 + 50.0;
  }
  else {
    double v12 = v10;
  }
  double v13 = v8;
  result.double height = v12;
  result.double width = v13;
  return result;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  -[DMCEnrollmentLinkLabelView setAlpha:](self, "setAlpha:", a3, a4, 1.0);
  v5 = [(DMCEnrollmentLinkLabelView *)self linkHandler];

  if (v5)
  {
    double v6 = [(DMCEnrollmentLinkLabelView *)self linkHandler];
    v6[2]();
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    id v5 = [(DMCEnrollmentLinkLabelView *)self message];
    v4 = [(DMCEnrollmentLinkLabelView *)self linkMessage];
    [(DMCEnrollmentLinkLabelView *)self _populateTextLabelWithMessage:v5 linkMessage:v4];
  }
}

- (void)_populateTextLabelWithMessage:(id)a3 linkMessage:(id)a4
{
  v27[3] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v22 = a4;
  double v7 = objc_opt_new();
  double v8 = objc_opt_new();
  [v8 setAlignment:1];
  uint64_t v9 = *MEMORY[0x263F814F0];
  v26[0] = *MEMORY[0x263F814F0];
  double v10 = [(DMCEnrollmentLinkLabelView *)self _textFont];
  v27[0] = v10;
  uint64_t v11 = *MEMORY[0x263F81500];
  v26[1] = *MEMORY[0x263F81500];
  double v12 = [MEMORY[0x263F1C550] secondaryLabelColor];
  uint64_t v13 = *MEMORY[0x263F81540];
  v26[2] = *MEMORY[0x263F81540];
  v27[1] = v12;
  v27[2] = v8;
  v14 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:3];

  if (v6)
  {
    objc_super v15 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v6 attributes:v14];
    [v7 appendAttributedString:v15];
  }
  uint64_t v23 = v6;
  v24[0] = v9;
  CGRect v16 = [(DMCEnrollmentLinkLabelView *)self _textFont];
  v25[0] = v16;
  v24[1] = v11;
  if ([(DMCEnrollmentLinkLabelView *)self enabled]) {
    [MEMORY[0x263F1C550] systemBlueColor];
  }
  else {
  CGRect v17 = [MEMORY[0x263F1C550] placeholderTextColor];
  }
  v24[2] = v13;
  v25[1] = v17;
  v25[2] = v8;
  CGRect v18 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:3];

  if (v22)
  {
    id v19 = objc_alloc(MEMORY[0x263F086A0]);
    v20 = [NSString stringWithFormat:@"\n%@", v22];
    uint64_t v21 = (void *)[v19 initWithString:v20 attributes:v18];
    [v7 appendAttributedString:v21];
  }
  [(UILabel *)self->_textLabel setAttributedText:v7];
}

- (id)_textFont
{
  v2 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F1D270]];
  CGFloat v3 = [MEMORY[0x263F81708] fontWithDescriptor:v2 size:0.0];

  return v3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (void)setTextLabel:(id)a3
{
}

- (id)linkHandler
{
  return self->_linkHandler;
}

- (void)setLinkHandler:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (NSString)linkMessage
{
  return self->_linkMessage;
}

- (void)setLinkMessage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkMessage, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong(&self->_linkHandler, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end