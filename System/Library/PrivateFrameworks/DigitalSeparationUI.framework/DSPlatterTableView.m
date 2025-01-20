@interface DSPlatterTableView
+ (id)bannerWithPresentingViewController:(id)a3;
+ (id)cellWithPresentingViewController:(id)a3;
- (DSPlatterTableView)initWithController:(id)a3 color:(id)a4 softCorner:(BOOL)a5;
- (UIImageView)imageView;
- (UIViewController)presentingViewController;
- (double)preferredHeight;
- (id)_descriptionWithAlignment:(int64_t)a3;
- (id)_lockImage;
- (id)attributedTextWithString:(id)a3 alignment:(int64_t)a4 style:(id)a5 bold:(BOOL)a6;
- (id)contentWithAlignment:(int64_t)a3 axis:(int64_t)a4 imageSeparator:(float)a5 textSeparator:(float)a6 textAlignment:(int64_t)a7;
- (id)platterTextWithAlignment:(int64_t)a3 stackAlignment:(int64_t)a4 customSpacing:(float)a5;
- (id)stackWithAlignment:(int64_t)a3 axis:(int64_t)a4;
- (id)textView:(id)a3 primaryActionForTextItem:(id)a4 defaultAction:(id)a5;
- (void)_pinBackgroundColor:(id)a3 cornerRadius:(BOOL)a4;
- (void)_updateAppearanceForTraitCollectionChange;
- (void)setImageView:(id)a3;
- (void)setPresentingViewController:(id)a3;
@end

@implementation DSPlatterTableView

- (DSPlatterTableView)initWithController:(id)a3 color:(id)a4 softCorner:(BOOL)a5
{
  BOOL v5 = a5;
  v17[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)DSPlatterTableView;
  v10 = [(DSPlatterTableView *)&v16 init];
  if (v10)
  {
    os_log_t v11 = os_log_create("com.apple.DigitalSeparation", "DSPlatterTableView");
    v12 = (void *)DSLog_7;
    DSLog_7 = (uint64_t)v11;

    [(DSPlatterTableView *)v10 setPresentingViewController:v8];
    [(DSPlatterTableView *)v10 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(DSPlatterTableView *)v10 _pinBackgroundColor:v9 cornerRadius:v5];
    v17[0] = objc_opt_class();
    v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
    id v14 = (id)[(DSPlatterTableView *)v10 registerForTraitChanges:v13 withAction:sel__updateAppearanceForTraitCollectionChange];
  }
  return v10;
}

- (double)preferredHeight
{
  -[DSPlatterTableView systemLayoutSizeFittingSize:](self, "systemLayoutSizeFittingSize:", *MEMORY[0x263F83810], *(double *)(MEMORY[0x263F83810] + 8));
  return v2;
}

+ (id)bannerWithPresentingViewController:(id)a3
{
  id v3 = a3;
  v4 = [DSPlatterTableView alloc];
  BOOL v5 = [MEMORY[0x263F825C8] systemGray4Color];
  v6 = [(DSPlatterTableView *)v4 initWithController:v3 color:v5 softCorner:0];

  LODWORD(v7) = 12.0;
  id v8 = [(DSPlatterTableView *)v6 contentWithAlignment:0 axis:0 imageSeparator:4 textSeparator:v7 textAlignment:0.0];
  [(DSPlatterTableView *)v6 addSubview:v8];
  id v9 = [v8 topAnchor];
  v10 = [(DSPlatterTableView *)v6 topAnchor];
  os_log_t v11 = [v9 constraintEqualToAnchor:v10 constant:16.0];
  [v11 setActive:1];

  v12 = [v8 bottomAnchor];
  v13 = [(DSPlatterTableView *)v6 bottomAnchor];
  id v14 = [v12 constraintEqualToAnchor:v13 constant:-16.0];
  [v14 setActive:1];

  v15 = [v8 leadingAnchor];
  objc_super v16 = [(DSPlatterTableView *)v6 leadingAnchor];
  v17 = [v15 constraintEqualToAnchor:v16 constant:16.0];
  [v17 setActive:1];

  v18 = [v8 trailingAnchor];
  v19 = [(DSPlatterTableView *)v6 trailingAnchor];
  v20 = [v18 constraintEqualToAnchor:v19 constant:-16.0];
  [v20 setActive:1];

  return v6;
}

+ (id)cellWithPresentingViewController:(id)a3
{
  id v3 = a3;
  v4 = [DSPlatterTableView alloc];
  BOOL v5 = [MEMORY[0x263F825C8] secondarySystemBackgroundColor];
  v6 = [(DSPlatterTableView *)v4 initWithController:v3 color:v5 softCorner:1];

  LODWORD(v7) = 8.0;
  LODWORD(v8) = 2.0;
  id v9 = [(DSPlatterTableView *)v6 contentWithAlignment:3 axis:1 imageSeparator:1 textSeparator:v7 textAlignment:v8];
  [(DSPlatterTableView *)v6 addSubview:v9];
  v10 = [v9 topAnchor];
  os_log_t v11 = [(DSPlatterTableView *)v6 topAnchor];
  v12 = [v10 constraintEqualToAnchor:v11 constant:16.0];
  [v12 setActive:1];

  v13 = [v9 bottomAnchor];
  id v14 = [(DSPlatterTableView *)v6 bottomAnchor];
  v15 = [v13 constraintEqualToAnchor:v14 constant:-16.0];
  [v15 setActive:1];

  objc_super v16 = [v9 leadingAnchor];
  v17 = [(DSPlatterTableView *)v6 leadingAnchor];
  v18 = [v16 constraintEqualToAnchor:v17 constant:16.0];
  [v18 setActive:1];

  v19 = [v9 trailingAnchor];
  v20 = [(DSPlatterTableView *)v6 trailingAnchor];
  v21 = [v19 constraintEqualToAnchor:v20 constant:-16.0];
  [v21 setActive:1];

  return v6;
}

- (void)_pinBackgroundColor:(id)a3 cornerRadius:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = (objc_class *)MEMORY[0x263F82E00];
  id v7 = a3;
  id v21 = objc_alloc_init(v6);
  [v21 setBackgroundColor:v7];

  [v21 setTranslatesAutoresizingMaskIntoConstraints:0];
  if (v4)
  {
    double v8 = [v21 layer];
    [v8 setCornerRadius:8.0];
  }
  [(DSPlatterTableView *)self addSubview:v21];
  id v9 = [v21 topAnchor];
  v10 = [(DSPlatterTableView *)self topAnchor];
  os_log_t v11 = [v9 constraintEqualToAnchor:v10];
  [v11 setActive:1];

  v12 = [v21 bottomAnchor];
  v13 = [(DSPlatterTableView *)self bottomAnchor];
  id v14 = [v12 constraintEqualToAnchor:v13];
  [v14 setActive:1];

  v15 = [v21 leadingAnchor];
  objc_super v16 = [(DSPlatterTableView *)self leadingAnchor];
  v17 = [v15 constraintEqualToAnchor:v16];
  [v17 setActive:1];

  v18 = [v21 trailingAnchor];
  v19 = [(DSPlatterTableView *)self trailingAnchor];
  v20 = [v18 constraintEqualToAnchor:v19];
  [v20 setActive:1];
}

- (id)contentWithAlignment:(int64_t)a3 axis:(int64_t)a4 imageSeparator:(float)a5 textSeparator:(float)a6 textAlignment:(int64_t)a7
{
  v12 = [(DSPlatterTableView *)self stackWithAlignment:a3 axis:a4];
  v13 = objc_opt_new();
  [(DSPlatterTableView *)self setImageView:v13];

  id v14 = [(DSPlatterTableView *)self imageView];
  [v14 setContentMode:4];

  v15 = [(DSPlatterTableView *)self imageView];
  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];

  objc_super v16 = [(DSPlatterTableView *)self _lockImage];
  v17 = [(DSPlatterTableView *)self imageView];
  [v17 setImage:v16];

  v18 = [(DSPlatterTableView *)self imageView];
  [v12 addArrangedSubview:v18];

  v19 = [(DSPlatterTableView *)self imageView];
  [v12 setCustomSpacing:v19 afterView:a5];

  v20 = [(DSPlatterTableView *)self imageView];
  id v21 = [v20 widthAnchor];
  v22 = [v21 constraintEqualToConstant:34.0];
  [v22 setActive:1];

  *(float *)&double v23 = a6;
  v24 = [(DSPlatterTableView *)self platterTextWithAlignment:a7 stackAlignment:a3 customSpacing:v23];
  [v12 addArrangedSubview:v24];

  return v12;
}

- (id)_lockImage
{
  id v3 = [MEMORY[0x263F82818] configurationWithPointSize:34.0];
  BOOL v4 = (void *)MEMORY[0x263F827E8];
  BOOL v5 = DSUIBundle();
  v6 = [v4 imageNamed:@"lock.and.ring.2" inBundle:v5 withConfiguration:v3];

  id v7 = [(DSPlatterTableView *)self traitCollection];
  uint64_t v8 = [v7 userInterfaceStyle];

  if (v8 == 2)
  {
    id v9 = [MEMORY[0x263F825C8] systemWhiteColor];
    uint64_t v10 = [v6 imageWithTintColor:v9];

    v6 = (void *)v10;
  }

  return v6;
}

- (id)platterTextWithAlignment:(int64_t)a3 stackAlignment:(int64_t)a4 customSpacing:(float)a5
{
  uint64_t v8 = [(DSPlatterTableView *)self stackWithAlignment:a4 axis:1];
  id v9 = objc_opt_new();
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v9 setAdjustsFontForContentSizeCategory:1];
  [v9 setNumberOfLines:0];
  uint64_t v10 = DSUIDTOLocStringForKey(@"WARNING_PLATTER_TITLE");
  os_log_t v11 = [(DSPlatterTableView *)self attributedTextWithString:v10 alignment:a3 style:*MEMORY[0x263F835F0] bold:1];
  [v9 setAttributedText:v11];

  [v8 addArrangedSubview:v9];
  [v8 setCustomSpacing:v9 afterView:a5];
  v12 = [(DSPlatterTableView *)self _descriptionWithAlignment:a3];
  [v8 addArrangedSubview:v12];

  return v8;
}

- (id)_descriptionWithAlignment:(int64_t)a3
{
  BOOL v5 = DSUIDTOLocStringForKey(@"WARNING_PLATTER_BODY");
  v6 = [(DSPlatterTableView *)self attributedTextWithString:v5 alignment:a3 style:*MEMORY[0x263F835B8] bold:0];

  id v7 = DSUIDTOLocStringForKey(@"WARNING_PLATTER_LEARN_MORE");
  uint64_t v8 = [v6 string];
  uint64_t v9 = [v8 rangeOfString:v7];
  uint64_t v11 = v10;

  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = DSLog_7;
    if (os_log_type_enabled((os_log_t)DSLog_7, OS_LOG_TYPE_ERROR)) {
      -[DSPlatterTableView _descriptionWithAlignment:](v12);
    }
    uint64_t v13 = [v6 length];
    uint64_t v9 = v13 - [v7 length];
    uint64_t v11 = [v7 length];
  }
  uint64_t v14 = *MEMORY[0x263F81520];
  v15 = DSUIDTOLocStringForKey(@"WARNING_PLATTER_LEARN_MORE_URL");
  objc_msgSend(v6, "addAttribute:value:range:", v14, v15, v9, v11);

  uint64_t v16 = *MEMORY[0x263F81500];
  v17 = [MEMORY[0x263F825C8] labelColor];
  objc_msgSend(v6, "addAttribute:value:range:", v16, v17, 0, objc_msgSend(v6, "length"));

  id v18 = objc_alloc_init(MEMORY[0x263F82D60]);
  [v18 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v18 setAdjustsFontForContentSizeCategory:1];
  v19 = [v18 textContainer];
  [v19 setLineFragmentPadding:0.0];

  [v18 setScrollEnabled:0];
  [v18 setEditable:0];
  [v18 setDelegate:self];
  v20 = [MEMORY[0x263F825C8] clearColor];
  [v18 setBackgroundColor:v20];

  [v18 setAttributedText:v6];
  return v18;
}

- (id)attributedTextWithString:(id)a3 alignment:(int64_t)a4 style:(id)a5 bold:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v9 = (objc_class *)MEMORY[0x263F089B8];
  id v10 = a5;
  id v11 = a3;
  v12 = (void *)[[v9 alloc] initWithString:v11];
  uint64_t v13 = objc_opt_new();
  [v13 setAlignment:a4];
  uint64_t v14 = [v11 length];

  v15 = [MEMORY[0x263F81708] preferredFontForTextStyle:v10];

  if (v6)
  {
    uint64_t v16 = (void *)MEMORY[0x263F81708];
    v17 = [v15 fontDescriptor];
    id v18 = [v17 fontDescriptorWithSymbolicTraits:2];
    [v15 pointSize];
    uint64_t v19 = objc_msgSend(v16, "fontWithDescriptor:size:", v18);

    v15 = (void *)v19;
  }
  objc_msgSend(v12, "addAttribute:value:range:", *MEMORY[0x263F81540], v13, 0, v14);
  objc_msgSend(v12, "addAttribute:value:range:", *MEMORY[0x263F814F0], v15, 0, v14);

  return v12;
}

- (id)stackWithAlignment:(int64_t)a3 axis:(int64_t)a4
{
  BOOL v6 = objc_opt_new();
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v6 setAlignment:a3];
  [v6 setAxis:a4];
  return v6;
}

- (void)_updateAppearanceForTraitCollectionChange
{
  id v3 = [(DSPlatterTableView *)self _lockImage];
  BOOL v4 = [(DSPlatterTableView *)self imageView];
  [v4 setImage:v3];

  [(DSPlatterTableView *)self layoutSubviews];
}

- (id)textView:(id)a3 primaryActionForTextItem:(id)a4 defaultAction:(id)a5
{
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __70__DSPlatterTableView_textView_primaryActionForTextItem_defaultAction___block_invoke;
  v7[3] = &unk_264C6F1B0;
  v7[4] = self;
  BOOL v5 = objc_msgSend(MEMORY[0x263F823D0], "actionWithHandler:", v7, a4, a5);
  return v5;
}

void __70__DSPlatterTableView_textView_primaryActionForTextItem_defaultAction___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) presentingViewController];
  v1 = DSUIDTOLocStringForKey(@"WARNING_PLATTER_LEARN_MORE_URL");
  +[DSSafetyCheck showlearnMoreForPresentingViewController:v2 withURL:v1];
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  return (UIViewController *)WeakRetained;
}

- (void)setPresentingViewController:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
}

- (void)_descriptionWithAlignment:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_235BFC000, log, OS_LOG_TYPE_ERROR, "Couldn't find learn more string in the warning platter body, manually setting the link attribute range", v1, 2u);
}

@end