@interface DMCActivityViewController
- (BOOL)showBottomView;
- (DMCActivityViewController)initWithActivityText:(id)a3 showBottomView:(BOOL)a4;
- (NSString)activityText;
- (UIActivityIndicatorView)spinnerView;
- (UILabel)textLabel;
- (id)_textFont;
- (void)setActivityText:(id)a3;
- (void)setShowBottomView:(BOOL)a3;
- (void)setSpinnerView:(id)a3;
- (void)setTextLabel:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation DMCActivityViewController

- (DMCActivityViewController)initWithActivityText:(id)a3 showBottomView:(BOOL)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DMCActivityViewController;
  v8 = [(DMCActivityViewController *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_activityText, a3);
    v9->_showBottomView = a4;
    textLabel = v9->_textLabel;
    if (textLabel) {
      [(UILabel *)textLabel setText:v7];
    }
  }

  return v9;
}

- (void)viewWillAppear:(BOOL)a3
{
  v26[1] = *MEMORY[0x263EF8340];
  v25.receiver = self;
  v25.super_class = (Class)DMCActivityViewController;
  [(DMCEnrollmentTemplateTableViewController *)&v25 viewWillAppear:a3];
  if (([(DMCActivityViewController *)self isBeingPresented] & 1) != 0
    || [(DMCActivityViewController *)self isMovingToParentViewController])
  {
    v4 = (void *)[objc_alloc(MEMORY[0x263F1C3D8]) initWithActivityIndicatorStyle:100];
    [(DMCActivityViewController *)self setSpinnerView:v4];

    v5 = [(DMCActivityViewController *)self spinnerView];
    [v5 startAnimating];

    v6 = [(DMCActivityViewController *)self activityText];
    id v7 = [(DMCActivityViewController *)self textLabel];
    [v7 setText:v6];

    v8 = [(DMCActivityViewController *)self view];
    v9 = [(DMCActivityViewController *)self spinnerView];
    [v8 addSubview:v9];

    v10 = [(DMCActivityViewController *)self view];
    v11 = [(DMCActivityViewController *)self textLabel];
    [v10 addSubview:v11];

    [(DMCActivityViewController *)self setModalInPresentation:1];
    if ([(DMCActivityViewController *)self showBottomView])
    {
      objc_super v12 = [DMCEnrollmentLinkLabelView alloc];
      v13 = DMCLocalizedString();
      v14 = [(DMCEnrollmentLinkLabelView *)v12 initWithIcon:@"gear" message:v13 linkMessage:0 linkHandler:0];

      [(DMCEnrollmentLinkLabelView *)v14 setUserInteractionEnabled:0];
      [(DMCEnrollmentTemplateTableViewController *)self addBottomView:v14];
    }
    objc_initWeak(&location, self);
    v26[0] = objc_opt_class();
    v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:1];
    uint64_t v19 = MEMORY[0x263EF8330];
    uint64_t v20 = 3221225472;
    v21 = __44__DMCActivityViewController_viewWillAppear___block_invoke;
    v22 = &unk_2645E8EB0;
    objc_copyWeak(&v23, &location);
    id v16 = (id)[(DMCActivityViewController *)self registerForTraitChanges:v15 withHandler:&v19];

    v17 = [(DMCActivityViewController *)self view];
    [v17 setNeedsDisplay];

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
  v18 = [(DMCActivityViewController *)self navigationItem];
  [v18 setHidesBackButton:1];
}

void __44__DMCActivityViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained _textFont];
  v2 = [WeakRetained textLabel];
  [v2 setFont:v1];
}

- (void)viewDidLayoutSubviews
{
  v24.receiver = self;
  v24.super_class = (Class)DMCActivityViewController;
  [(DMCActivityViewController *)&v24 viewDidLayoutSubviews];
  v3 = [(DMCActivityViewController *)self textLabel];
  v4 = [(DMCActivityViewController *)self view];
  [v4 bounds];
  objc_msgSend(v3, "sizeThatFits:", CGRectGetWidth(v25) + -30.0, 1.79769313e308);
  double v6 = v5;
  double v8 = v7;

  v9 = [(DMCActivityViewController *)self spinnerView];
  [v9 frame];
  double v11 = v10;
  double v13 = v12;

  v14 = [(DMCActivityViewController *)self view];
  [v14 bounds];
  CGFloat v15 = (CGRectGetWidth(v26) - v6) * 0.5;
  id v16 = [(DMCActivityViewController *)self view];
  [v16 bounds];
  CGFloat v17 = CGRectGetHeight(v27) * 0.5 - v8;
  v18 = [(DMCActivityViewController *)self textLabel];
  objc_msgSend(v18, "setFrame:", v15, v17, v6, v8);

  uint64_t v19 = [(DMCActivityViewController *)self view];
  [v19 bounds];
  CGFloat v20 = (CGRectGetWidth(v28) - v11) * 0.5;
  v21 = [(DMCActivityViewController *)self textLabel];
  [v21 frame];
  CGFloat v22 = CGRectGetMinY(v29) - v13 + -15.0;
  id v23 = [(DMCActivityViewController *)self spinnerView];
  objc_msgSend(v23, "setFrame:", v20, v22, v11, v13);
}

- (UILabel)textLabel
{
  textLabel = self->_textLabel;
  if (!textLabel)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
    double v5 = self->_textLabel;
    self->_textLabel = v4;

    [(UILabel *)self->_textLabel setLineBreakMode:0];
    double v6 = self->_textLabel;
    double v7 = [MEMORY[0x263F1C550] labelColor];
    [(UILabel *)v6 setTextColor:v7];

    [(UILabel *)self->_textLabel setNumberOfLines:0];
    [(UILabel *)self->_textLabel setTextAlignment:1];
    [(UILabel *)self->_textLabel setTranslatesAutoresizingMaskIntoConstraints:1];
    textLabel = self->_textLabel;
  }
  return textLabel;
}

- (id)_textFont
{
  v2 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F1D260]];
  v3 = [MEMORY[0x263F81708] fontWithDescriptor:v2 size:0.0];

  return v3;
}

- (NSString)activityText
{
  return self->_activityText;
}

- (void)setActivityText:(id)a3
{
}

- (BOOL)showBottomView
{
  return self->_showBottomView;
}

- (void)setShowBottomView:(BOOL)a3
{
  self->_showBottomView = a3;
}

- (void)setTextLabel:(id)a3
{
}

- (UIActivityIndicatorView)spinnerView
{
  return self->_spinnerView;
}

- (void)setSpinnerView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinnerView, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_activityText, 0);
}

@end