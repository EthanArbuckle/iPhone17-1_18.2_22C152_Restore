@interface AMSUIMessageButton
+ (id)_defaultConfiguration;
- (AMSDialogAction)dialogAction;
- (AMSUIMessageButton)initWithDialogAction:(id)a3 messageStyle:(unint64_t)a4;
- (BOOL)canBecomeFocused;
- (BOOL)isDefaultCloseButton;
- (BOOL)isFooterButton;
- (UIColor)preferredBackgroundColor;
- (UIColor)preferredForegroundColor;
- (UIFont)preferredFont;
- (id)_appendChevronToString:(id)a3;
- (id)_chevronImage;
- (id)_closeImage;
- (id)_symbolConfiguration;
- (unint64_t)messageStyle;
- (void)_endObservations;
- (void)_setAXSettings;
- (void)_setAccessibilityIdentifier;
- (void)_setImagePadding;
- (void)_setupWithDialogAction:(id)a3;
- (void)_startObservations;
- (void)commitAppearance;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setFooterStyle;
- (void)setIsFooterButton:(BOOL)a3;
- (void)setMessageStyle:(unint64_t)a3;
- (void)setPreferredBackgroundColor:(id)a3;
- (void)setPreferredFont:(id)a3;
- (void)setPreferredForegroundColor:(id)a3;
@end

@implementation AMSUIMessageButton

- (AMSUIMessageButton)initWithDialogAction:(id)a3 messageStyle:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSUIMessageButton;
  v8 = [(AMSUICommonButton *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_dialogAction, a3);
    v9->_messageStyle = a4;
    [(AMSUIMessageButton *)v9 _setupWithDialogAction:v7];
    [(AMSUIMessageButton *)v9 _setAccessibilityIdentifier];
    [(AMSUIMessageButton *)v9 _startObservations];
    if (![(AMSUIMessageButton *)v9 messageStyle]) {
      [(AMSUIMessageButton *)v9 _setOverrideUserInterfaceRenderingMode:1];
    }
  }

  return v9;
}

- (void)dealloc
{
  [(AMSUIMessageButton *)self _endObservations];
  v3.receiver = self;
  v3.super_class = (Class)AMSUIMessageButton;
  [(AMSUIMessageButton *)&v3 dealloc];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)AMSUIMessageButton;
  [(AMSUIMessageButton *)&v3 layoutSubviews];
  [(AMSUIMessageButton *)self _setImagePadding];
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)_setupWithDialogAction:(id)a3
{
  id v5 = a3;
  v6 = +[AMSUIMessageButton _defaultConfiguration];
  [v6 setMacIdiomStyle:3];
  objc_msgSend(v6, "setContentInsets:", *MEMORY[0x263F82250], *(double *)(MEMORY[0x263F82250] + 8), *(double *)(MEMORY[0x263F82250] + 16), *(double *)(MEMORY[0x263F82250] + 24));
  id v7 = [(AMSUIMessageButton *)self titleLabel];
  [v7 setLineBreakMode:4];

  v8 = [(AMSUIMessageButton *)self dialogAction];
  uint64_t v9 = [v8 style];

  if (v9 == 2)
  {
    uint64_t v10 = [(AMSUIMessageButton *)self _closeImage];
    [(AMSUIMessageButton *)self setContentVerticalAlignment:1];
    [(AMSUIMessageButton *)self setContentHorizontalAlignment:5];
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v11 = [v5 title];
    v12 = [v5 iconURL];
    v13 = [v12 host];

    if (v13)
    {
      uint64_t v10 = objc_msgSend(MEMORY[0x263F827E8], "ams_imageWithSystemSymbolName:", v13);
    }
    else
    {
      uint64_t v10 = 0;
    }
    if (!(v10 | v11))
    {
      if ([(AMSUIMessageButton *)self messageStyle] == 5)
      {
        uint64_t v10 = 0;
      }
      else
      {
        uint64_t v10 = [(AMSUIMessageButton *)self _chevronImage];
      }
    }
    [(AMSUIMessageButton *)self setContentHorizontalAlignment:5];
  }
  [(AMSUIMessageButton *)self setPreservesSuperviewLayoutMargins:0];
  objc_initWeak(&location, self);
  [v6 setImage:v10];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __45__AMSUIMessageButton__setupWithDialogAction___block_invoke;
  v25[3] = &unk_2643E3E40;
  objc_copyWeak(&v26, &location);
  [v6 setImageColorTransformer:v25];
  v14 = [(AMSUIMessageButton *)self preferredBackgroundColor];
  v15 = v14;
  if (!v14)
  {
    unint64_t v16 = [(AMSUIMessageButton *)self messageStyle];
    objc_super v3 = [(AMSUIMessageButton *)self traitCollection];
    v15 = +[AMSUIAppearance _defaultButtonBackgroundColorForStyle:v16 withTraitCollection:v3];
  }
  [v6 setBaseBackgroundColor:v15];
  if (!v14)
  {
  }
  v17 = [(AMSUIMessageButton *)self _symbolConfiguration];
  [v6 setPreferredSymbolConfigurationForImage:v17];

  if (v11)
  {
    v18 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v11];
    [v6 setAttributedTitle:v18];
    uint64_t v19 = MEMORY[0x263EF8330];
    uint64_t v20 = 3221225472;
    v21 = __45__AMSUIMessageButton__setupWithDialogAction___block_invoke_2;
    v22 = &unk_2643E3E68;
    objc_copyWeak(&v24, &location);
    id v23 = (id)v11;
    [v6 setTitleTextAttributesTransformer:&v19];

    objc_destroyWeak(&v24);
  }
  -[AMSUIMessageButton setConfiguration:](self, "setConfiguration:", v6, v19, v20, v21, v22);
  [(AMSUIMessageButton *)self setNeedsUpdateConfiguration];
  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
}

id __45__AMSUIMessageButton__setupWithDialogAction___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained preferredForegroundColor];
  objc_super v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    +[AMSUIAppearance _defaultButtonIconColorForStyle:isFooter:](AMSUIAppearance, "_defaultButtonIconColorForStyle:isFooter:", [WeakRetained messageStyle], objc_msgSend(WeakRetained, "isFooterButton"));
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v5 = v4;

  return v5;
}

id __45__AMSUIMessageButton__setupWithDialogAction___block_invoke_2(uint64_t a1, void *a2)
{
  objc_super v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  v6 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v4];

  id v7 = [WeakRetained preferredFont];
  if (v7)
  {
    [v6 setObject:v7 forKeyedSubscript:*MEMORY[0x263F814F0]];
  }
  else
  {
    uint64_t v8 = [WeakRetained messageStyle];
    uint64_t v9 = [WeakRetained traitCollection];
    uint64_t v10 = +[AMSUIAppearance _defaultButtonTextFontForStyle:v8 withTraitCollection:v9];
    [v6 setObject:v10 forKeyedSubscript:*MEMORY[0x263F814F0]];
  }
  uint64_t v11 = [WeakRetained preferredForegroundColor];
  if (v11)
  {
    [v6 setObject:v11 forKeyedSubscript:*MEMORY[0x263F81500]];
  }
  else
  {
    v12 = +[AMSUIAppearance _defaultButtonTextColorForStyle:isFooter:](AMSUIAppearance, "_defaultButtonTextColorForStyle:isFooter:", [WeakRetained messageStyle], objc_msgSend(WeakRetained, "isFooterButton"));
    [v6 setObject:v12 forKeyedSubscript:*MEMORY[0x263F81500]];
  }
  if (UIAccessibilityButtonShapesEnabled()) {
    [v6 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F815F8]];
  }
  if (*(void *)(a1 + 32))
  {
    v13 = objc_opt_new();
    [v13 setAlignment:4];
    [v6 setObject:v13 forKeyedSubscript:*MEMORY[0x263F81540]];
  }
  v14 = [NSDictionary dictionaryWithDictionary:v6];

  return v14;
}

- (void)_setAccessibilityIdentifier
{
  if ([(AMSUIMessageButton *)self isFooterButton])
  {
    objc_super v3 = @"footerActionButton";
  }
  else if ([(AMSUIMessageButton *)self isDefaultCloseButton])
  {
    objc_super v3 = @"closeActionButton";
  }
  else
  {
    objc_super v3 = @"actionButton";
  }
  [(AMSUIMessageButton *)self setAccessibilityIdentifier:v3];
}

- (void)commitAppearance
{
  id v4 = [(AMSUIMessageButton *)self preferredForegroundColor];
  objc_super v3 = [(AMSUIMessageButton *)self dialogAction];
  [(AMSUIMessageButton *)self _setupWithDialogAction:v3];

  [(AMSUIMessageButton *)self setPreferredBackgroundColor:v4];
  if ([(AMSUIMessageButton *)self isFooterButton]) {
    [(AMSUIMessageButton *)self setFooterStyle];
  }
  [(AMSUIMessageButton *)self _setAccessibilityIdentifier];
}

- (void)_startObservations
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel__axSettingsDidUpdate_ name:*MEMORY[0x263F83198] object:0];
}

- (void)_endObservations
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F83198] object:0];
}

- (id)_appendChevronToString:(id)a3
{
  id v4 = (void *)MEMORY[0x263F82818];
  uint64_t v5 = *MEMORY[0x263F83588];
  id v6 = a3;
  id v7 = [v4 configurationWithTextStyle:v5 scale:1];
  id v8 = objc_alloc_init(MEMORY[0x263F81678]);
  uint64_t v9 = [(AMSUIMessageButton *)self _chevronImage];
  uint64_t v10 = [v9 imageWithConfiguration:v7];
  uint64_t v11 = [(AMSUIMessageButton *)self preferredForegroundColor];
  v12 = v11;
  if (!v11)
  {
    v12 = +[AMSUIAppearance _defaultButtonContentColorForStyle:[(AMSUIMessageButton *)self messageStyle] isFooter:[(AMSUIMessageButton *)self isFooterButton]];
  }
  v13 = [v10 imageWithTintColor:v12];
  [v8 setImage:v13];

  if (!v11) {
  v14 = [MEMORY[0x263F086A0] attributedStringWithAttachment:v8];
  }
  id v15 = objc_alloc_init(MEMORY[0x263F089B8]);
  [v15 appendAttributedString:v6];

  unint64_t v16 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:@" "];
  [v15 appendAttributedString:v16];

  [v15 appendAttributedString:v14];
  v17 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithAttributedString:v15];

  return v17;
}

- (void)_setImagePadding
{
  if ([(AMSUIMessageButton *)self isFooterButton])
  {
    id v19 = [(AMSUIMessageButton *)self configuration];
    [(AMSUIMessageButton *)self frame];
    double v4 = v3;
    [(AMSUIMessageButton *)self layoutMargins];
    double v6 = v4 - v5;
    id v7 = [(AMSUIMessageButton *)self titleLabel];
    [v7 frame];
    double v9 = v6 - v8;
    uint64_t v10 = [(AMSUIMessageButton *)self imageView];
    [v10 frame];
    double v12 = v9 - v11;
    [(AMSUIMessageButton *)self layoutMargins];
    [v19 setImagePadding:v12 - v13];

    v14 = [(AMSUIMessageButton *)self configuration];
    [v14 imagePadding];
    double v16 = v15;
    [v19 imagePadding];
    double v18 = v17;

    if (v16 != v18) {
      [(AMSUIMessageButton *)self setConfiguration:v19];
    }
  }
}

- (void)setFooterStyle
{
  [(AMSUIMessageButton *)self setIsFooterButton:1];
  id v14 = [(AMSUIMessageButton *)self configuration];
  double v3 = +[AMSUIMessageButton _defaultConfiguration];
  [v3 contentInsets];
  double v5 = v4;
  double v7 = v6;

  [(AMSUIMessageButton *)self directionalLayoutMargins];
  double v9 = v8;
  if ([(AMSUIMessageButton *)self messageStyle])
  {
    if ([(AMSUIMessageButton *)self messageStyle] == 6)
    {
      double v5 = *MEMORY[0x263F82250];
      double v10 = *(double *)(MEMORY[0x263F82250] + 8);
      double v7 = *(double *)(MEMORY[0x263F82250] + 16);
      double v9 = *(double *)(MEMORY[0x263F82250] + 24);
    }
    else
    {
      double v10 = 0.0;
    }
  }
  else
  {
    double v5 = *MEMORY[0x263F82250];
    double v10 = *(double *)(MEMORY[0x263F82250] + 8);
    double v7 = *(double *)(MEMORY[0x263F82250] + 16);
    double v9 = *(double *)(MEMORY[0x263F82250] + 24);
    double v11 = [v14 attributedTitle];

    if (v11)
    {
      double v12 = [v14 attributedTitle];
      double v13 = [(AMSUIMessageButton *)self _appendChevronToString:v12];
      [v14 setAttributedTitle:v13];
    }
  }
  [v14 setImagePlacement:8];
  objc_msgSend(v14, "setContentInsets:", v5, v10, v7, v9);
  [(AMSUIMessageButton *)self setConfiguration:v14];
  [(AMSUIMessageButton *)self setNeedsUpdateConfiguration];
  [(AMSUIMessageButton *)self setContentHorizontalAlignment:4];
  [(AMSUIMessageButton *)self _setAXSettings];
  [(AMSUIMessageButton *)self _setAccessibilityIdentifier];
}

- (void)_setAXSettings
{
  id v5 = [(AMSUIMessageButton *)self configuration];
  if ([(AMSUIMessageButton *)self isFooterButton] && UIAccessibilityButtonShapesEnabled())
  {
    double v3 = [MEMORY[0x263F825C8] clearColor];
    double v4 = [v5 background];
    [v4 setBackgroundColor:v3];

    [(AMSUIMessageButton *)self setConfiguration:v5];
  }
}

- (BOOL)isDefaultCloseButton
{
  double v3 = [(AMSUIMessageButton *)self dialogAction];
  if ([v3 style] == 2)
  {
    double v4 = [(AMSUIMessageButton *)self dialogAction];
    id v5 = [v4 title];
    if (v5)
    {
      BOOL v6 = 0;
    }
    else
    {
      double v7 = [(AMSUIMessageButton *)self dialogAction];
      double v8 = [v7 iconURL];
      BOOL v6 = v8 == 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)_symbolConfiguration
{
  v21[1] = *MEMORY[0x263EF8340];
  double v3 = [(AMSUIMessageButton *)self preferredFont];

  if (v3)
  {
    double v4 = (void *)MEMORY[0x263F82818];
    id v5 = [(AMSUIMessageButton *)self preferredFont];
    BOOL v6 = [v4 configurationWithFont:v5 scale:2];

    goto LABEL_10;
  }
  id v7 = (id)*MEMORY[0x263F83570];
  if ([(AMSUIMessageButton *)self messageStyle])
  {
    double v8 = *MEMORY[0x263F81800];
    if ([(AMSUIMessageButton *)self messageStyle] != 1)
    {
      uint64_t v10 = 2;
      goto LABEL_9;
    }
    id v9 = (id)*MEMORY[0x263F835F0];

    uint64_t v10 = 1;
  }
  else
  {
    id v9 = (id)*MEMORY[0x263F835F0];

    double v8 = *MEMORY[0x263F81828];
    uint64_t v10 = 2;
  }
  id v7 = v9;
LABEL_9:
  double v11 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:v7];
  uint64_t v20 = *MEMORY[0x263F817A0];
  uint64_t v18 = *MEMORY[0x263F81850];
  double v12 = [NSNumber numberWithDouble:v8];
  id v19 = v12;
  double v13 = [NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  v21[0] = v13;
  id v14 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
  double v15 = [v11 fontDescriptorByAddingAttributes:v14];

  double v16 = [MEMORY[0x263F81708] fontWithDescriptor:v15 size:0.0];
  BOOL v6 = [MEMORY[0x263F82818] configurationWithFont:v16 scale:v10];

LABEL_10:
  return v6;
}

- (id)_chevronImage
{
  double v3 = [(AMSUIMessageButton *)self traitCollection];
  uint64_t v4 = [v3 layoutDirection];

  if (v4 == 1) {
    objc_msgSend(MEMORY[0x263F827E8], "ams_systemChevronLeft");
  }
  else {
  id v5 = objc_msgSend(MEMORY[0x263F827E8], "ams_systemChevronRight");
  }
  BOOL v6 = [(AMSUIMessageButton *)self _symbolConfiguration];
  id v7 = objc_msgSend(v5, "ams_imageWithSymbolConfiguration:", v6);

  return v7;
}

- (id)_closeImage
{
  double v3 = objc_msgSend(MEMORY[0x263F827E8], "ams_imageWithSystemSymbolName:", @"xmark");
  uint64_t v4 = [(AMSUIMessageButton *)self _symbolConfiguration];
  id v5 = objc_msgSend(v3, "ams_imageWithSymbolConfiguration:", v4);

  return v5;
}

+ (id)_defaultConfiguration
{
  return (id)[MEMORY[0x263F824F0] plainButtonConfiguration];
}

- (UIColor)preferredForegroundColor
{
  return self->_preferredForegroundColor;
}

- (void)setPreferredForegroundColor:(id)a3
{
  id v8 = a3;
  objc_storeStrong((id *)&self->_preferredForegroundColor, a3);
  id v5 = [(AMSUIMessageButton *)self configuration];
  BOOL v6 = v5;
  if (v8)
  {
    [v5 setBaseForegroundColor:v8];
  }
  else
  {
    id v7 = +[AMSUIAppearance _defaultButtonContentColorForStyle:[(AMSUIMessageButton *)self messageStyle] isFooter:[(AMSUIMessageButton *)self isFooterButton]];
    [v6 setBaseForegroundColor:v7];
  }
  [(AMSUIMessageButton *)self setConfiguration:v6];
  [(AMSUIMessageButton *)self setNeedsUpdateConfiguration];
}

- (UIColor)preferredBackgroundColor
{
  v2 = [(AMSUIMessageButton *)self configuration];
  double v3 = [v2 baseBackgroundColor];

  return (UIColor *)v3;
}

- (void)setPreferredBackgroundColor:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSUIMessageButton *)self configuration];
  [v5 setBaseBackgroundColor:v4];

  [(AMSUIMessageButton *)self setConfiguration:v5];
  [(AMSUIMessageButton *)self setNeedsUpdateConfiguration];
}

- (AMSDialogAction)dialogAction
{
  return self->_dialogAction;
}

- (UIFont)preferredFont
{
  return self->_preferredFont;
}

- (void)setPreferredFont:(id)a3
{
}

- (unint64_t)messageStyle
{
  return self->_messageStyle;
}

- (void)setMessageStyle:(unint64_t)a3
{
  self->_messageStyle = a3;
}

- (BOOL)isFooterButton
{
  return self->_isFooterButton;
}

- (void)setIsFooterButton:(BOOL)a3
{
  self->_isFooterButton = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredFont, 0);
  objc_storeStrong((id *)&self->_dialogAction, 0);
  objc_storeStrong((id *)&self->_preferredForegroundColor, 0);
}

@end