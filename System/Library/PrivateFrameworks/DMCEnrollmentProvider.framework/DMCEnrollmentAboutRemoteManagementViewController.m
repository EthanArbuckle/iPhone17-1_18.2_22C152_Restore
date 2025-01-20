@interface DMCEnrollmentAboutRemoteManagementViewController
+ (id)_textFontIsBold:(BOOL)a3;
+ (void)presentAboutRemoteManagementViewControllerWithBaseViewController:(id)a3;
- (NSAttributedString)attributedDetailText;
- (NSString)detailText;
- (UILabel)textLabel;
- (void)loadView;
- (void)rightBarButtonTapped:(id)a3;
- (void)setAttributedDetailText:(id)a3;
- (void)setDetailText:(id)a3;
- (void)setTextLabel:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation DMCEnrollmentAboutRemoteManagementViewController

+ (void)presentAboutRemoteManagementViewControllerWithBaseViewController:(id)a3
{
  id v9 = a3;
  v3 = [DMCEnrollmentAboutRemoteManagementViewController alloc];
  v4 = DMCLocalizedString();
  v5 = [MEMORY[0x263F1C6B0] systemImageNamed:@"gear"];
  v6 = [(DMCEnrollmentAboutRemoteManagementViewController *)v3 initWithTitle:v4 detailText:0 icon:v5];

  v7 = DMCLocalizedString();
  [(DMCEnrollmentAboutRemoteManagementViewController *)v6 setDetailText:v7];

  [(OBPrivacySplashController *)v6 setSuppressPerPageAnalyticsLogging:1];
  v8 = (void *)[objc_alloc(MEMORY[0x263F1C7F8]) initWithRootViewController:v6];
  if ([MEMORY[0x263F38B98] isPad]) {
    [v8 setModalPresentationStyle:2];
  }
  [v9 presentViewController:v8 animated:1 completion:0];
}

- (void)loadView
{
  v42[4] = *MEMORY[0x263EF8340];
  v40.receiver = self;
  v40.super_class = (Class)DMCEnrollmentAboutRemoteManagementViewController;
  [(OBPrivacySplashController *)&v40 loadView];
  v3 = objc_opt_new();
  [(DMCEnrollmentAboutRemoteManagementViewController *)self setTextLabel:v3];

  v4 = [(DMCEnrollmentAboutRemoteManagementViewController *)self textLabel];
  [v4 setNumberOfLines:0];

  v5 = [(DMCEnrollmentAboutRemoteManagementViewController *)self attributedDetailText];

  if (v5)
  {
    v6 = [(DMCEnrollmentAboutRemoteManagementViewController *)self attributedDetailText];
    v7 = [(DMCEnrollmentAboutRemoteManagementViewController *)self textLabel];
    [v7 setAttributedText:v6];
  }
  else
  {
    v6 = [(DMCEnrollmentAboutRemoteManagementViewController *)self detailText];
    v7 = [(DMCEnrollmentAboutRemoteManagementViewController *)self textLabel];
    [v7 setText:v6];
  }

  v8 = [(DMCEnrollmentAboutRemoteManagementViewController *)self textLabel];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v9 = +[DMCEnrollmentAboutRemoteManagementViewController _textFontIsBold:0];
  v10 = [(DMCEnrollmentAboutRemoteManagementViewController *)self textLabel];
  [v10 setFont:v9];

  v11 = [(DMCEnrollmentAboutRemoteManagementViewController *)self contentView];
  v12 = [(DMCEnrollmentAboutRemoteManagementViewController *)self textLabel];
  [v11 addSubview:v12];

  v24 = (void *)MEMORY[0x263F08938];
  v36 = [(DMCEnrollmentAboutRemoteManagementViewController *)self contentView];
  v34 = [v36 topAnchor];
  v35 = [(DMCEnrollmentAboutRemoteManagementViewController *)self textLabel];
  v33 = [v35 topAnchor];
  v32 = [v34 constraintEqualToAnchor:v33];
  v42[0] = v32;
  v31 = [(DMCEnrollmentAboutRemoteManagementViewController *)self contentView];
  v29 = [v31 leadingAnchor];
  v30 = [(DMCEnrollmentAboutRemoteManagementViewController *)self textLabel];
  v28 = [v30 leadingAnchor];
  v27 = [v29 constraintEqualToAnchor:v28];
  v42[1] = v27;
  v26 = [(DMCEnrollmentAboutRemoteManagementViewController *)self contentView];
  v25 = [v26 trailingAnchor];
  v13 = [(DMCEnrollmentAboutRemoteManagementViewController *)self textLabel];
  v14 = [v13 trailingAnchor];
  v15 = [v25 constraintEqualToAnchor:v14];
  v42[2] = v15;
  v16 = [(DMCEnrollmentAboutRemoteManagementViewController *)self contentView];
  v17 = [v16 bottomAnchor];
  v18 = [(DMCEnrollmentAboutRemoteManagementViewController *)self textLabel];
  v19 = [v18 bottomAnchor];
  v20 = [v17 constraintEqualToAnchor:v19];
  v42[3] = v20;
  v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v42 count:4];
  [v24 activateConstraints:v21];

  objc_initWeak(&location, self);
  uint64_t v41 = objc_opt_class();
  v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v41 count:1];
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __60__DMCEnrollmentAboutRemoteManagementViewController_loadView__block_invoke;
  v37[3] = &unk_2645E8EB0;
  objc_copyWeak(&v38, &location);
  id v23 = (id)[(DMCEnrollmentAboutRemoteManagementViewController *)self registerForTraitChanges:v22 withHandler:v37];

  objc_destroyWeak(&v38);
  objc_destroyWeak(&location);
}

void __60__DMCEnrollmentAboutRemoteManagementViewController_loadView__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = +[DMCEnrollmentAboutRemoteManagementViewController _textFontIsBold:0];
  v2 = [WeakRetained textLabel];
  [v2 setFont:v1];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DMCEnrollmentAboutRemoteManagementViewController;
  [(OBPrivacySplashController *)&v6 viewWillAppear:a3];
  v4 = [[DMCEnrollmentUIBarButtonItem alloc] initWithType:4 target:self action:sel_rightBarButtonTapped_];
  v5 = [(OBBaseWelcomeController *)self navigationItem];
  [v5 setRightBarButtonItem:v4];
}

- (void)rightBarButtonTapped:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__DMCEnrollmentAboutRemoteManagementViewController_rightBarButtonTapped___block_invoke;
  block[3] = &unk_2645E90A0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __73__DMCEnrollmentAboutRemoteManagementViewController_rightBarButtonTapped___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

- (void)setDetailText:(id)a3
{
  id v6 = a3;
  if (!-[NSString isEqualToString:](self->_detailText, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_detailText, a3);
    v5 = [(DMCEnrollmentAboutRemoteManagementViewController *)self textLabel];
    [v5 setText:v6];
  }
}

- (void)setAttributedDetailText:(id)a3
{
  id v6 = a3;
  if (!-[NSAttributedString isEqualToAttributedString:](self->_attributedDetailText, "isEqualToAttributedString:"))
  {
    objc_storeStrong((id *)&self->_attributedDetailText, a3);
    v5 = [(DMCEnrollmentAboutRemoteManagementViewController *)self textLabel];
    [v5 setAttributedText:v6];
  }
}

+ (id)_textFontIsBold:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F1D260]];
  v5 = v4;
  id v6 = (void *)MEMORY[0x263F81708];
  if (v3) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 0;
  }
  v8 = [v4 fontDescriptorWithSymbolicTraits:v7];
  id v9 = [v6 fontWithDescriptor:v8 size:0.0];

  return v9;
}

- (NSString)detailText
{
  return self->_detailText;
}

- (NSAttributedString)attributedDetailText
{
  return self->_attributedDetailText;
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (void)setTextLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_attributedDetailText, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
}

@end