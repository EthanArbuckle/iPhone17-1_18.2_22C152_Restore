@interface CARSetupAssetReadySoonViewController
- (CARSetupAssetReadySoonViewController)initWithDoneHandler:(id)a3;
- (UIButton)doneButton;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (id)doneHandler;
- (void)_done;
- (void)viewDidLoad;
@end

@implementation CARSetupAssetReadySoonViewController

- (CARSetupAssetReadySoonViewController)initWithDoneHandler:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CARSetupAssetReadySoonViewController;
  v5 = [(CARSetupAssetReadySoonViewController *)&v9 initWithNibName:0 bundle:0];
  if (v5)
  {
    uint64_t v6 = MEMORY[0x24C5B0600](v4);
    id doneHandler = v5->_doneHandler;
    v5->_id doneHandler = (id)v6;
  }
  return v5;
}

- (void)viewDidLoad
{
  v73[3] = *MEMORY[0x263EF8340];
  v70.receiver = self;
  v70.super_class = (Class)CARSetupAssetReadySoonViewController;
  [(CARSetupAssetReadySoonViewController *)&v70 viewDidLoad];
  v62 = [(CARSetupAssetReadySoonViewController *)self view];
  [(CARSetupAssetReadySoonViewController *)self setOverrideUserInterfaceStyle:2];
  v2 = [(CARSetupAssetReadySoonViewController *)self navigationItem];
  [v2 setHidesBackButton:1];

  v3 = [MEMORY[0x263F1C550] blackColor];
  [v62 setBackgroundColor:v3];

  v61 = [v62 safeAreaLayoutGuide];
  id obj = objc_alloc_init(MEMORY[0x263F1C768]);
  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v59 = [v4 localizedStringForKey:@"READY_SOON_CARD_TITLE" value:&stru_26FDB85C0 table:@"Localizable-Themed"];

  [obj setText:v59];
  v5 = (void *)MEMORY[0x263F1C660];
  uint64_t v6 = [(CARSetupAssetReadySoonViewController *)self traitCollection];
  v7 = [v5 preferredFontDescriptorWithTextStyle:*MEMORY[0x263F1D2F8] compatibleWithTraitCollection:v6];

  v58 = [v7 fontDescriptorWithSymbolicTraits:2];

  v57 = [MEMORY[0x263F1C658] fontWithDescriptor:v58 size:0.0];
  [obj setFont:v57];
  [obj setTextAlignment:1];
  [obj setNumberOfLines:0];
  v8 = [MEMORY[0x263F1C550] labelColor];
  [obj setTextColor:v8];

  [obj setTranslatesAutoresizingMaskIntoConstraints:0];
  [v62 addSubview:obj];
  objc_storeStrong((id *)&self->_titleLabel, obj);
  objc_super v9 = [obj leadingAnchor];
  v10 = [v61 leadingAnchor];
  v11 = [v9 constraintEqualToAnchor:v10 constant:30.0];
  v73[0] = v11;
  v12 = [obj trailingAnchor];
  v13 = [v61 trailingAnchor];
  v14 = [v12 constraintEqualToAnchor:v13 constant:-30.0];
  v73[1] = v14;
  v15 = [obj topAnchor];
  v16 = [v61 topAnchor];
  v17 = [v15 constraintEqualToAnchor:v16 constant:60.0];
  v73[2] = v17;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v73 count:3];
  [v62 addConstraints:v18];

  id v65 = objc_alloc_init(MEMORY[0x263F1C768]);
  v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v20 = [v19 localizedStringForKey:@"READY_SOON_CARD_MESSAGE" value:&stru_26FDB85C0 table:@"Localizable-Themed"];

  [v65 setText:v20];
  v21 = (void *)MEMORY[0x263F1C660];
  v22 = [(CARSetupAssetReadySoonViewController *)self traitCollection];
  v56 = [v21 preferredFontDescriptorWithTextStyle:*MEMORY[0x263F1D2C0] compatibleWithTraitCollection:v22];

  v55 = [MEMORY[0x263F1C658] fontWithDescriptor:v56 size:0.0];
  [v65 setFont:v55];
  [v65 setTextAlignment:1];
  [v65 setNumberOfLines:0];
  v23 = [MEMORY[0x263F1C550] secondaryLabelColor];
  [v65 setTextColor:v23];

  [v65 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v62 addSubview:v65];
  objc_storeStrong((id *)&self->_subtitleLabel, v65);
  v24 = [v65 leadingAnchor];
  v25 = [v61 leadingAnchor];
  v26 = [v24 constraintEqualToAnchor:v25 constant:30.0];
  v72[0] = v26;
  v27 = [v65 trailingAnchor];
  v28 = [v61 trailingAnchor];
  v29 = [v27 constraintEqualToAnchor:v28 constant:-30.0];
  v72[1] = v29;
  v30 = [v65 topAnchor];
  v31 = [obj bottomAnchor];
  v32 = [v30 constraintEqualToAnchor:v31 constant:60.0];
  v72[2] = v32;
  v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:v72 count:3];
  [v62 addConstraints:v33];

  objc_initWeak(&location, self);
  v34 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v54 = [v34 localizedStringForKey:@"READY_SOON_CARD_DISMISS" value:&stru_26FDB85C0 table:@"Localizable-Themed"];

  v60 = [MEMORY[0x263F1C490] grayButtonConfiguration];
  v35 = [MEMORY[0x263F1C550] labelColor];
  [v60 setBaseForegroundColor:v35];

  v36 = (void *)MEMORY[0x263F1C488];
  v37 = (void *)MEMORY[0x263F1C3C0];
  v67[0] = MEMORY[0x263EF8330];
  v67[1] = 3221225472;
  v67[2] = __51__CARSetupAssetReadySoonViewController_viewDidLoad__block_invoke;
  v67[3] = &unk_265276E00;
  objc_copyWeak(&v68, &location);
  v38 = [v37 actionWithTitle:v54 image:0 identifier:0 handler:v67];
  v39 = [v36 buttonWithConfiguration:v60 primaryAction:v38];

  [v39 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v62 addSubview:v39];
  objc_storeStrong((id *)&self->_doneButton, v39);
  id vala = [v39 centerXAnchor];
  v53 = [v61 centerXAnchor];
  v52 = [vala constraintEqualToAnchor:v53];
  v71[0] = v52;
  v51 = [v39 topAnchor];
  v50 = [v65 bottomAnchor];
  v49 = [v51 constraintGreaterThanOrEqualToAnchor:v50];
  v71[1] = v49;
  v40 = [v39 bottomAnchor];
  v41 = [v61 bottomAnchor];
  v42 = [v40 constraintEqualToAnchor:v41 constant:-30.0];
  v71[2] = v42;
  v43 = [v39 widthAnchor];
  v44 = [v61 widthAnchor];
  v45 = [v43 constraintEqualToAnchor:v44 multiplier:0.75];
  v71[3] = v45;
  v46 = [v39 heightAnchor];
  v47 = [v46 constraintEqualToConstant:50.0];
  v71[4] = v47;
  v48 = [MEMORY[0x263EFF8C0] arrayWithObjects:v71 count:5];
  [v62 addConstraints:v48];

  objc_destroyWeak(&v68);
  objc_destroyWeak(&location);
}

void __51__CARSetupAssetReadySoonViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _done];
}

- (void)_done
{
  v3 = CARSetupLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_249B58000, v3, OS_LOG_TYPE_DEFAULT, "asset ready soon: done", v6, 2u);
  }

  uint64_t v4 = [(CARSetupAssetReadySoonViewController *)self doneHandler];
  v5 = (void *)v4;
  if (v4) {
    (*(void (**)(uint64_t))(v4 + 16))(v4);
  }
}

- (id)doneHandler
{
  return self->_doneHandler;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (UIButton)doneButton
{
  return self->_doneButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong(&self->_doneHandler, 0);
}

@end