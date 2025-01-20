@interface DKInternetWarningViewController
+ (id)advancedDataProtectionConfiguration;
+ (id)standardConfiguration;
- (DKInternetWarningConfiguration)configuration;
- (DKInternetWarningViewController)initWithConfiguration:(id)a3;
- (DKNotableUserData)notableUserData;
- (id)_createNotableUserDataCardForFindMy:(BOOL)a3;
- (id)continueWithoutInternetBlock;
- (id)requireInternetBlock;
- (void)_continueWithoutInternetTapped:(id)a3;
- (void)_requireInternetTapped:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setContinueWithoutInternetBlock:(id)a3;
- (void)setNotableUserData:(id)a3;
- (void)setRequireInternetBlock:(id)a3;
- (void)showAvailable;
- (void)showBusy;
- (void)viewDidLoad;
@end

@implementation DKInternetWarningViewController

+ (id)standardConfiguration
{
  v2 = objc_alloc_init(DKInternetWarningStandardConfiguration);
  return v2;
}

+ (id)advancedDataProtectionConfiguration
{
  v2 = objc_alloc_init(DKInternetWarningAdvancedDataProtectionConfiguration);
  return v2;
}

- (DKInternetWarningViewController)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v5 = [v4 imageName];

  if (v5)
  {
    v6 = (void *)MEMORY[0x263F1C6B0];
    v7 = [v4 imageName];
    v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v5 = [v6 imageNamed:v7 inBundle:v8 withConfiguration:0];
  }
  v9 = [v4 title];
  v12.receiver = self;
  v12.super_class = (Class)DKInternetWarningViewController;
  v10 = [(DKInternetWarningViewController *)&v12 initWithTitle:v9 detailText:0 icon:v5 contentLayout:2];

  if (v10) {
    [(DKInternetWarningViewController *)v10 setConfiguration:v4];
  }

  return v10;
}

- (void)viewDidLoad
{
  v58[4] = *MEMORY[0x263EF8340];
  v57.receiver = self;
  v57.super_class = (Class)DKInternetWarningViewController;
  [(OBBaseWelcomeController *)&v57 viewDidLoad];
  v3 = [(DKInternetWarningViewController *)self configuration];
  int v4 = [v3 showNotableUserDataCardForFindMy];

  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x263F1C9B8]);
    double v6 = *MEMORY[0x263F001A8];
    double v7 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v8 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v9 = *(double *)(MEMORY[0x263F001A8] + 24);
    v10 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x263F001A8], v7, v8, v9);
    [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v10 setAxis:1];
    [v10 setSpacing:10.0];
    v11 = [(DKInternetWarningViewController *)self notableUserData];
    objc_super v12 = -[DKInternetWarningViewController _createNotableUserDataCardForFindMy:](self, "_createNotableUserDataCardForFindMy:", [v11 findMyEnabled]);
    [v10 addArrangedSubview:v12];

    v13 = [v10 arrangedSubviews];
    uint64_t v55 = [v13 lastObject];

    [v10 setCustomSpacing:v55 afterView:20.0];
    v14 = objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", v6, v7, v8, v9);
    v15 = [(DKInternetWarningViewController *)self configuration];
    v16 = [v15 detail];
    [v14 setText:v16];

    [v14 setTextAlignment:1];
    v17 = (void *)MEMORY[0x263F1C658];
    v18 = (void *)MEMORY[0x263F1C660];
    uint64_t v19 = *MEMORY[0x263F1D260];
    v20 = [(DKInternetWarningViewController *)self traitCollection];
    v21 = [v18 preferredFontDescriptorWithTextStyle:v19 compatibleWithTraitCollection:v20];
    v22 = [v17 fontWithDescriptor:v21 size:0.0];
    [v14 setFont:v22];

    v23 = [MEMORY[0x263F1C550] labelColor];
    [v14 setTextColor:v23];

    [v14 setNumberOfLines:0];
    [v10 addArrangedSubview:v14];
    v24 = [(DKInternetWarningViewController *)self contentView];
    [v24 addSubview:v10];

    v56 = [(DKInternetWarningViewController *)self contentView];
    v54 = [(DKInternetWarningViewController *)self contentView];
    v53 = [v54 topAnchor];
    v52 = [v10 topAnchor];
    v51 = [v53 constraintEqualToAnchor:v52];
    v58[0] = v51;
    v50 = [(DKInternetWarningViewController *)self contentView];
    v49 = [v50 leadingAnchor];
    v48 = [v10 leadingAnchor];
    v47 = [v49 constraintEqualToAnchor:v48];
    v58[1] = v47;
    v46 = [(DKInternetWarningViewController *)self contentView];
    v45 = [v46 trailingAnchor];
    v25 = [v10 trailingAnchor];
    v26 = [v45 constraintEqualToAnchor:v25];
    v58[2] = v26;
    v27 = [(DKInternetWarningViewController *)self contentView];
    v28 = [v27 bottomAnchor];
    v29 = [v10 bottomAnchor];
    v30 = [v28 constraintEqualToAnchor:v29];
    v58[3] = v30;
    v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:v58 count:4];
    [v56 addConstraints:v31];

    v32 = (void *)v55;
  }
  else
  {
    v10 = [(DKInternetWarningViewController *)self configuration];
    v32 = [v10 detail];
    v14 = [(DKInternetWarningViewController *)self headerView];
    [v14 setDetailText:v32];
  }

  v33 = [MEMORY[0x263F5B898] boldButton];
  v34 = [(DKInternetWarningViewController *)self configuration];
  v35 = [v34 requireInternetButtonTitle];
  [v33 setTitle:v35 forState:0];

  [v33 addTarget:self action:sel__requireInternetTapped_ forControlEvents:64];
  v36 = [(DKInternetWarningViewController *)self buttonTray];
  [v36 addButton:v33];

  v37 = [MEMORY[0x263F5B8D0] linkButton];
  v38 = [(DKInternetWarningViewController *)self configuration];
  v39 = [v38 continueWithoutInternetButtonTitle];
  [v37 setTitle:v39 forState:0];

  v40 = [(DKInternetWarningViewController *)self configuration];
  v41 = [v40 continueWithoutInternetButtonTintColor];

  if (v41)
  {
    v42 = [(DKInternetWarningViewController *)self configuration];
    v43 = [v42 continueWithoutInternetButtonTintColor];
    [v37 setTintColor:v43];
  }
  [v37 addTarget:self action:sel__continueWithoutInternetTapped_ forControlEvents:64];
  v44 = [(DKInternetWarningViewController *)self buttonTray];
  [v44 addButton:v37];
}

- (void)showBusy
{
  id v2 = [(DKInternetWarningViewController *)self buttonTray];
  [v2 showButtonsBusy];
}

- (void)showAvailable
{
  id v2 = [(DKInternetWarningViewController *)self buttonTray];
  [v2 showButtonsAvailable];
}

- (id)_createNotableUserDataCardForFindMy:(BOOL)a3
{
  if (a3)
  {
    v3 = [DKNotableUserDataCardView alloc];
    int v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v5 = [v4 localizedStringForKey:@"FIND_MY" value:&stru_26EAA9F58 table:@"Localizable"];
    double v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    double v7 = [v6 localizedStringForKey:@"ACTIVATION_LOCK" value:&stru_26EAA9F58 table:@"Localizable"];
    double v8 = [MEMORY[0x263F1C6B0] _systemImageNamed:@"findmy"];
    double v9 = [(DKNotableUserDataCardView *)v3 initWithTitle:v5 subtitle:v7 icon:v8];

    v10 = [DKNotableUserDataCardCell alloc];
    v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    objc_super v12 = [v11 localizedStringForKey:@"FIND_MY_DESCRIPTION" value:&stru_26EAA9F58 table:@"Localizable"];
    v13 = [(DKNotableUserDataCardCell *)v10 initWithTitle:0 subtitle:v12 accessoryView:0];

    [(DKNotableUserDataCardView *)v9 addCardCell:v13];
  }
  else
  {
    double v9 = 0;
  }
  return v9;
}

- (void)_requireInternetTapped:(id)a3
{
  v3 = [(DKInternetWarningViewController *)self requireInternetBlock];
  v3[2]();
}

- (void)_continueWithoutInternetTapped:(id)a3
{
  int v4 = objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice", a3);
  BOOL v5 = [v4 userInterfaceIdiom] == 1;

  double v6 = (void *)MEMORY[0x263F1C3F8];
  double v7 = [(DKInternetWarningViewController *)self configuration];
  double v8 = [v7 confirmationTitle];
  double v9 = [v6 alertControllerWithTitle:v8 message:0 preferredStyle:v5];

  v10 = (void *)MEMORY[0x263F1C3F0];
  v11 = [(DKInternetWarningViewController *)self configuration];
  objc_super v12 = [v11 confirmationContinueWithoutInternetButtonTitle];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __66__DKInternetWarningViewController__continueWithoutInternetTapped___block_invoke;
  v18[3] = &unk_264CF0AE8;
  v18[4] = self;
  v13 = [v10 actionWithTitle:v12 style:2 handler:v18];
  [v9 addAction:v13];

  v14 = (void *)MEMORY[0x263F1C3F0];
  v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v16 = [v15 localizedStringForKey:@"CANCEL" value:&stru_26EAA9F58 table:@"Localizable"];
  v17 = [v14 actionWithTitle:v16 style:1 handler:0];
  [v9 addAction:v17];

  [(DKInternetWarningViewController *)self presentViewController:v9 animated:1 completion:0];
}

void __66__DKInternetWarningViewController__continueWithoutInternetTapped___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) continueWithoutInternetBlock];
  v1[2]();
}

- (id)requireInternetBlock
{
  return self->_requireInternetBlock;
}

- (void)setRequireInternetBlock:(id)a3
{
}

- (id)continueWithoutInternetBlock
{
  return self->_continueWithoutInternetBlock;
}

- (void)setContinueWithoutInternetBlock:(id)a3
{
}

- (DKNotableUserData)notableUserData
{
  return self->_notableUserData;
}

- (void)setNotableUserData:(id)a3
{
}

- (DKInternetWarningConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_notableUserData, 0);
  objc_storeStrong(&self->_continueWithoutInternetBlock, 0);
  objc_storeStrong(&self->_requireInternetBlock, 0);
}

@end