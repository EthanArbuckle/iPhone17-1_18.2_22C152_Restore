@interface ASCredentialRequestInfoLabelSubPane
+ (double)_infoLabelMarginInset;
+ (id)_bodyFont;
+ (id)_bodyTextColor;
+ (id)_boldTitleFont;
+ (id)_boldTitleTextColor;
+ (id)_fontForLabelStyle:(int64_t)a3;
+ (id)_infoLabelWithString:(id)a3 labelStyle:(int64_t)a4;
+ (id)_textColorForLabelStyle:(int64_t)a3;
- (ASCredentialRequestInfoLabelSubPane)initWithString:(id)a3 labelStyle:(int64_t)a4;
- (ASCredentialRequestInfoLabelSubPane)initWithString:(id)a3 labelType:(unint64_t)a4;
- (NSString)text;
- (double)marginInset;
- (void)addToStackView:(id)a3 withCustomSpacingAfter:(double)a4 context:(id)a5;
- (void)setMarginInset:(double)a3;
- (void)setText:(id)a3;
@end

@implementation ASCredentialRequestInfoLabelSubPane

- (ASCredentialRequestInfoLabelSubPane)initWithString:(id)a3 labelStyle:(int64_t)a4
{
  id v6 = a3;
  v7 = [(id)objc_opt_class() _infoLabelWithString:v6 labelStyle:a4];

  v13.receiver = self;
  v13.super_class = (Class)ASCredentialRequestInfoLabelSubPane;
  v8 = [(ASCredentialRequestSubPane *)&v13 initWithView:v7];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_infoLabel, v7);
    [(id)objc_opt_class() _infoLabelMarginInset];
    v9->_marginInset = v10;
    v11 = v9;
  }

  return v9;
}

- (ASCredentialRequestInfoLabelSubPane)initWithString:(id)a3 labelType:(unint64_t)a4
{
  return [(ASCredentialRequestInfoLabelSubPane *)self initWithString:a3 labelStyle:a4 != 1];
}

+ (id)_infoLabelWithString:(id)a3 labelStyle:(int64_t)a4
{
  id v6 = (objc_class *)MEMORY[0x263F828E0];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  v9 = [a1 _fontForLabelStyle:a4];
  [v8 setFont:v9];

  double v10 = [a1 _textColorForLabelStyle:a4];
  [v8 setTextColor:v10];

  [v8 setTextAlignment:1];
  [v8 setNumberOfLines:0];
  [v8 setAdjustsFontForContentSizeCategory:1];
  [v8 setAdjustsFontSizeToFitWidth:1];
  v11 = [MEMORY[0x263F825C8] clearColor];
  [v8 setBackgroundColor:v11];

  [v8 setText:v7];
  [v8 setMaximumContentSizeCategory:*MEMORY[0x263F83410]];

  return v8;
}

+ (id)_fontForLabelStyle:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      a1 = +[ASViewServiceInterfaceUtilities headerTitleFont];
      goto LABEL_9;
    case 1:
      a1 = +[ASViewServiceInterfaceUtilities headerMessageFont];
      goto LABEL_9;
    case 2:
      objc_msgSend(a1, "_boldTitleFont", v3);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 3:
      objc_msgSend(a1, "_bodyFont", v3);
      a1 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:
      break;
    default:
      break;
  }
  return a1;
}

+ (id)_textColorForLabelStyle:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      a1 = +[ASViewServiceInterfaceUtilities headerTitleColor];
      goto LABEL_9;
    case 1:
      a1 = +[ASViewServiceInterfaceUtilities headerMessageColor];
      goto LABEL_9;
    case 2:
      objc_msgSend(a1, "_boldTitleTextColor", v3);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 3:
      objc_msgSend(a1, "_bodyTextColor", v3);
      a1 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:
      break;
    default:
      break;
  }
  return a1;
}

+ (double)_infoLabelMarginInset
{
  int v2 = [MEMORY[0x263F29440] isPad];
  double result = 50.0;
  if (!v2) {
    return 16.0;
  }
  return result;
}

- (void)addToStackView:(id)a3 withCustomSpacingAfter:(double)a4 context:(id)a5
{
  v21[2] = *MEMORY[0x263EF8340];
  v20.receiver = self;
  v20.super_class = (Class)ASCredentialRequestInfoLabelSubPane;
  id v8 = a5;
  [(ASCredentialRequestSubPane *)&v20 addToStackView:a3 withCustomSpacingAfter:v8 context:a4];
  v9 = (void *)MEMORY[0x263F08938];
  double v10 = [(UILabel *)self->_infoLabel leadingAnchor];
  v11 = [v8 stackView];
  v12 = [v11 leadingAnchor];
  [(ASCredentialRequestInfoLabelSubPane *)self marginInset];
  objc_super v13 = objc_msgSend(v10, "constraintEqualToAnchor:constant:", v12);
  v21[0] = v13;
  v14 = [(UILabel *)self->_infoLabel trailingAnchor];
  v15 = [v8 stackView];

  v16 = [v15 trailingAnchor];
  [(ASCredentialRequestInfoLabelSubPane *)self marginInset];
  v18 = [v14 constraintEqualToAnchor:v16 constant:-v17];
  v21[1] = v18;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:2];
  [v9 activateConstraints:v19];
}

- (NSString)text
{
  return [(UILabel *)self->_infoLabel text];
}

- (void)setText:(id)a3
{
}

+ (id)_boldTitleFont
{
  return (id)[MEMORY[0x263F82760] _preferredFontForTextStyle:*MEMORY[0x263F83618] weight:*MEMORY[0x263F83630]];
}

+ (id)_bodyFont
{
  return (id)[MEMORY[0x263F82760] preferredFontForTextStyle:*MEMORY[0x263F83570]];
}

+ (id)_boldTitleTextColor
{
  return (id)[MEMORY[0x263F825C8] labelColor];
}

+ (id)_bodyTextColor
{
  return (id)[MEMORY[0x263F825C8] labelColor];
}

- (double)marginInset
{
  return self->_marginInset;
}

- (void)setMarginInset:(double)a3
{
  self->_marginInset = a3;
}

- (void).cxx_destruct
{
}

@end