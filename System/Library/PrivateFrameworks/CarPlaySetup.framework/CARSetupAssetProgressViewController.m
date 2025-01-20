@interface CARSetupAssetProgressViewController
- (CARSetupAppIconProgressView)progressView;
- (CARSetupAssetProgressViewController)initWithProgressReporter:(id)a3 cancelHandler:(id)a4;
- (NSProgressReporting)progressReporter;
- (NSTimer)useLaterTimer;
- (UIButton)useLaterButton;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (id)cancelHandler;
- (void)_cancel;
- (void)_invalidateUseLaterTimer;
- (void)_showUseLater;
- (void)_startUseLaterTimer;
- (void)_useLater;
- (void)dealloc;
- (void)setUseLaterTimer:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation CARSetupAssetProgressViewController

- (CARSetupAssetProgressViewController)initWithProgressReporter:(id)a3 cancelHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CARSetupAssetProgressViewController;
  v9 = [(CARSetupAssetProgressViewController *)&v14 initWithNibName:0 bundle:0];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_progressReporter, a3);
    uint64_t v11 = MEMORY[0x24C5B0600](v8);
    id cancelHandler = v10->_cancelHandler;
    v10->_id cancelHandler = (id)v11;
  }
  return v10;
}

- (void)dealloc
{
  [(CARSetupAssetProgressViewController *)self _invalidateUseLaterTimer];
  v3.receiver = self;
  v3.super_class = (Class)CARSetupAssetProgressViewController;
  [(CARSetupAssetProgressViewController *)&v3 dealloc];
}

- (void)viewDidLoad
{
  v59[4] = *MEMORY[0x263EF8340];
  v57.receiver = self;
  v57.super_class = (Class)CARSetupAssetProgressViewController;
  [(CARSetupAssetProgressViewController *)&v57 viewDidLoad];
  objc_super v3 = [(CARSetupAssetProgressViewController *)self view];
  [(CARSetupAssetProgressViewController *)self setOverrideUserInterfaceStyle:2];
  v4 = [MEMORY[0x263F1C550] blackColor];
  [v3 setBackgroundColor:v4];

  id v5 = objc_alloc(MEMORY[0x263F1C468]);
  v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:@"CANCEL" value:&stru_26FDB85C0 table:@"Localizable-Themed"];

  id v8 = (void *)[v5 initWithTitle:v7 style:0 target:self action:sel__cancel];
  v9 = [MEMORY[0x263F1C550] whiteColor];
  v56 = v8;
  [v8 setTintColor:v9];

  v10 = [(CARSetupAssetProgressViewController *)self navigationItem];
  [v10 setLeftBarButtonItem:v8];

  uint64_t v11 = objc_alloc_init(CARSetupAppIconProgressView);
  [(CARSetupAppIconProgressView *)v11 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 addSubview:v11];
  progressView = self->_progressView;
  self->_progressView = v11;
  v13 = v11;

  objc_super v14 = v13;
  v53 = v13;
  v54 = [(CARSetupAppIconProgressView *)v13 centerXAnchor];
  v15 = v3;
  v51 = [v3 centerXAnchor];
  v49 = [v54 constraintEqualToAnchor:v51];
  v59[0] = v49;
  v46 = [(CARSetupAppIconProgressView *)v13 centerYAnchor];
  v44 = [v3 centerYAnchor];
  v16 = [v46 constraintEqualToAnchor:v44 constant:-30.0];
  v59[1] = v16;
  v17 = [(CARSetupAppIconProgressView *)v13 widthAnchor];
  v48 = v15;
  v18 = [v15 widthAnchor];
  v19 = [v17 constraintEqualToAnchor:v18 multiplier:1.0];
  v59[2] = v19;
  v20 = [(CARSetupAppIconProgressView *)v13 heightAnchor];
  v21 = [(CARSetupAppIconProgressView *)v14 widthAnchor];
  v22 = [v20 constraintEqualToAnchor:v21];
  v59[3] = v22;
  v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v59 count:4];
  [v15 addConstraints:v23];

  v24 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
  v25 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v55 = [v25 localizedStringForKey:@"SETTING_UP_CARD_TITLE" value:&stru_26FDB85C0 table:@"Localizable-Themed"];

  [(UILabel *)v24 setText:v55];
  v26 = (void *)MEMORY[0x263F1C660];
  uint64_t v27 = *MEMORY[0x263F1D300];
  v28 = [(CARSetupAssetProgressViewController *)self traitCollection];
  v29 = [v26 preferredFontDescriptorWithTextStyle:v27 compatibleWithTraitCollection:v28];

  v52 = [v29 fontDescriptorWithSymbolicTraits:2];

  v50 = [MEMORY[0x263F1C658] fontWithDescriptor:v52 size:0.0];
  [(UILabel *)v24 setFont:v50];
  v30 = [MEMORY[0x263F1C550] labelColor];
  [(UILabel *)v24 setTextColor:v30];

  [(UILabel *)v24 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v48 addSubview:v24];
  titleLabel = self->_titleLabel;
  self->_titleLabel = v24;
  v32 = v24;

  v47 = [(UILabel *)v32 centerXAnchor];
  v45 = [v48 centerXAnchor];
  v43 = [v47 constraintEqualToAnchor:v45];
  v58[0] = v43;
  v42 = [(UILabel *)v32 widthAnchor];
  v41 = [v48 widthAnchor];
  v40 = [v42 constraintLessThanOrEqualToAnchor:v41];
  v58[1] = v40;
  v33 = [(UILabel *)v32 topAnchor];
  v34 = [(CARSetupAppIconProgressView *)v53 bottomAnchor];
  v35 = [v33 constraintEqualToAnchor:v34 constant:30.0];
  v58[2] = v35;
  v36 = [(UILabel *)v32 bottomAnchor];
  v37 = [v48 bottomAnchor];
  v38 = [v36 constraintLessThanOrEqualToAnchor:v37 constant:-30.0];
  v58[3] = v38;
  v39 = [MEMORY[0x263EFF8C0] arrayWithObjects:v58 count:4];

  [v48 addConstraints:v39];
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CARSetupAssetProgressViewController;
  [(CARSetupAssetProgressViewController *)&v7 viewDidAppear:a3];
  v4 = CARSetupLogForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_249B58000, v4, OS_LOG_TYPE_DEFAULT, "starting asset progress animation", v6, 2u);
  }

  id v5 = [(CARSetupAssetProgressViewController *)self progressView];
  [v5 startAnimating];

  [(CARSetupAssetProgressViewController *)self _startUseLaterTimer];
}

- (void)_startUseLaterTimer
{
  id v3 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel__showUseLater selector:0 userInfo:0 repeats:30.0];
  [(CARSetupAssetProgressViewController *)self setUseLaterTimer:v3];
}

- (void)_invalidateUseLaterTimer
{
  id v3 = [(CARSetupAssetProgressViewController *)self useLaterTimer];
  if (v3)
  {
    id v4 = v3;
    [v3 invalidate];
    [(CARSetupAssetProgressViewController *)self setUseLaterTimer:0];
    id v3 = v4;
  }
}

- (void)_showUseLater
{
  v30[4] = *MEMORY[0x263EF8340];
  id v3 = CARSetupLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_249B58000, v3, OS_LOG_TYPE_DEFAULT, "showing button for asset ready soon progress", (uint8_t *)buf, 2u);
  }

  id v4 = [(CARSetupAssetProgressViewController *)self useLaterTimer];
  [v4 invalidate];

  [(CARSetupAssetProgressViewController *)self setUseLaterTimer:0];
  objc_initWeak(buf, self);
  id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v26 = [v5 localizedStringForKey:@"USE_LATER" value:&stru_26FDB85C0 table:@"Localizable-Themed"];

  v6 = (void *)MEMORY[0x263F1C488];
  objc_super v7 = (void *)MEMORY[0x263F1C3C0];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __52__CARSetupAssetProgressViewController__showUseLater__block_invoke;
  v27[3] = &unk_265276E00;
  objc_copyWeak(&v28, buf);
  id v8 = [v7 actionWithTitle:v26 image:0 identifier:0 handler:v27];
  v9 = [v6 systemButtonWithPrimaryAction:v8];

  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  v10 = [(CARSetupAssetProgressViewController *)self view];
  [v10 addSubview:v9];
  objc_storeStrong((id *)&self->_useLaterButton, v9);
  v25 = [v9 centerXAnchor];
  v24 = [v10 centerXAnchor];
  v23 = [v25 constraintEqualToAnchor:v24];
  v30[0] = v23;
  v21 = [v9 topAnchor];
  v22 = [(CARSetupAssetProgressViewController *)self titleLabel];
  v20 = [v22 bottomAnchor];
  v19 = [v21 constraintGreaterThanOrEqualToAnchor:v20];
  v30[1] = v19;
  uint64_t v11 = [v9 bottomAnchor];
  v12 = [v10 safeAreaLayoutGuide];
  v13 = [v12 bottomAnchor];
  objc_super v14 = [v11 constraintEqualToAnchor:v13 constant:-30.0];
  v30[2] = v14;
  v15 = [v9 widthAnchor];
  v16 = [v10 widthAnchor];
  v17 = [v15 constraintLessThanOrEqualToAnchor:v16];
  v30[3] = v17;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:4];
  [v10 addConstraints:v18];

  objc_destroyWeak(&v28);
  objc_destroyWeak(buf);
}

void __52__CARSetupAssetProgressViewController__showUseLater__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _useLater];
}

- (void)_cancel
{
  id v3 = CARSetupLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_249B58000, v3, OS_LOG_TYPE_DEFAULT, "asset progress: canceling", v6, 2u);
  }

  uint64_t v4 = [(CARSetupAssetProgressViewController *)self cancelHandler];
  id v5 = (void *)v4;
  if (v4) {
    (*(void (**)(uint64_t, void))(v4 + 16))(v4, 0);
  }
}

- (void)_useLater
{
  id v3 = CARSetupLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_249B58000, v3, OS_LOG_TYPE_DEFAULT, "asset progress: use later", v6, 2u);
  }

  uint64_t v4 = [(CARSetupAssetProgressViewController *)self cancelHandler];
  id v5 = (void *)v4;
  if (v4) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, 1);
  }
}

- (NSProgressReporting)progressReporter
{
  return self->_progressReporter;
}

- (id)cancelHandler
{
  return self->_cancelHandler;
}

- (CARSetupAppIconProgressView)progressView
{
  return self->_progressView;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (UIButton)useLaterButton
{
  return self->_useLaterButton;
}

- (NSTimer)useLaterTimer
{
  return self->_useLaterTimer;
}

- (void)setUseLaterTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_useLaterTimer, 0);
  objc_storeStrong((id *)&self->_useLaterButton, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong(&self->_cancelHandler, 0);
  objc_storeStrong((id *)&self->_progressReporter, 0);
}

@end