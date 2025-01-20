@interface DBUserAlertSheetView
- (DBUserAlertSheetView)initWithAlert:(id)a3 environmentConfiguration:(id)a4;
- (UILabel)messageLabel;
- (UILabel)titleLabel;
- (UIStackView)buttonStackView;
- (id)_buttonFont;
- (id)_buttonWithAlertAction:(id)a3;
- (id)_titleFont;
- (id)dismissHandler;
- (void)setButtonStackView:(id)a3;
- (void)setMessageLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation DBUserAlertSheetView

- (DBUserAlertSheetView)initWithAlert:(id)a3 environmentConfiguration:(id)a4
{
  v84[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v79.receiver = self;
  v79.super_class = (Class)DBUserAlertSheetView;
  double v8 = *MEMORY[0x263F001A8];
  double v9 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v10 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v11 = *(double *)(MEMORY[0x263F001A8] + 24);
  v12 = -[DBUserAlertSheetView initWithFrame:](&v79, sel_initWithFrame_, *MEMORY[0x263F001A8], v9, v10, v11);
  v13 = v12;
  if (v12)
  {
    [(DBUserAlertSheetView *)v12 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
    v15 = [MEMORY[0x263F825C8] tableBackgroundColor];
    [(DBUserAlertSheetView *)v13 setBackgroundColor:v15];

    uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v8, v9, v10, v11);
    titleLabel = v13->_titleLabel;
    v13->_titleLabel = (UILabel *)v16;

    [(UILabel *)v13->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v18 = [(DBUserAlertSheetView *)v13 _titleFont];
    [(UILabel *)v13->_titleLabel setFont:v18];

    [(UILabel *)v13->_titleLabel setTextAlignment:1];
    [(UILabel *)v13->_titleLabel setNumberOfLines:0];
    v19 = [v6 title];
    [(UILabel *)v13->_titleLabel setText:v19];

    [(DBUserAlertSheetView *)v13 addSubview:v13->_titleLabel];
    uint64_t v20 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v8, v9, v10, v11);
    messageLabel = v13->_messageLabel;
    v13->_messageLabel = (UILabel *)v20;

    [(UILabel *)v13->_messageLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v22 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F83580]];
    uint64_t v83 = *MEMORY[0x263F81850];
    v23 = [NSNumber numberWithDouble:*MEMORY[0x263F81838]];
    v84[0] = v23;
    v73 = [NSDictionary dictionaryWithObjects:v84 forKeys:&v83 count:1];

    uint64_t v81 = *MEMORY[0x263F817A0];
    v82 = v73;
    v24 = [NSDictionary dictionaryWithObjects:&v82 forKeys:&v81 count:1];
    v72 = [v22 fontDescriptorByAddingAttributes:v24];

    v25 = [MEMORY[0x263F81708] fontWithDescriptor:v72 size:0.0];
    [(UILabel *)v13->_messageLabel setFont:v25];

    [(UILabel *)v13->_messageLabel setTextAlignment:1];
    [(UILabel *)v13->_messageLabel setNumberOfLines:0];
    v26 = [v6 message];
    [(UILabel *)v13->_messageLabel setText:v26];

    [(DBUserAlertSheetView *)v13 addSubview:v13->_messageLabel];
    uint64_t v27 = objc_msgSend(objc_alloc(MEMORY[0x263F82BF8]), "initWithFrame:", v8, v9, v10, v11);
    buttonStackView = v13->_buttonStackView;
    v13->_buttonStackView = (UIStackView *)v27;

    [(UIStackView *)v13->_buttonStackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v13->_buttonStackView setAxis:0];
    [(UIStackView *)v13->_buttonStackView setDistribution:1];
    [(UIStackView *)v13->_buttonStackView setSpacing:20.0];
    [(DBUserAlertSheetView *)v13 addSubview:v13->_buttonStackView];
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __63__DBUserAlertSheetView_initWithAlert_environmentConfiguration___block_invoke;
    aBlock[3] = &unk_2649B5EA8;
    v29 = v13;
    v77 = v29;
    id v78 = v14;
    id v75 = v14;
    v30 = (void (**)(void *, void *))_Block_copy(aBlock);
    v31 = [v6 cancelAction];
    v30[2](v30, v31);

    v32 = [v6 otherAction];
    v71 = v30;
    v30[2](v30, v32);

    v33 = [v6 defaultAction];
    v30[2](v30, v33);

    [(DBUserAlertSheetView *)v29 safeAreaLayoutGuide];
    v34 = id v74 = v6;
    v69 = [(UILabel *)v13->_titleLabel firstBaselineAnchor];
    v68 = [v34 topAnchor];
    [v7 currentSafeViewAreaFrame];
    double v36 = v35 * 0.25;
    v70 = [v7 screen];
    [v70 scale];
    v67 = [v69 constraintEqualToAnchor:v68 constant:v36 * (v37 / 1.5) + -24.0];
    v80[0] = v67;
    v66 = [(UILabel *)v13->_titleLabel leadingAnchor];
    v65 = [v34 leadingAnchor];
    v64 = [v66 constraintEqualToAnchor:v65 constant:12.0];
    v80[1] = v64;
    v63 = [(UILabel *)v13->_titleLabel trailingAnchor];
    v62 = [v34 trailingAnchor];
    v61 = [v63 constraintEqualToAnchor:v62 constant:-12.0];
    v80[2] = v61;
    v60 = [(UILabel *)v13->_messageLabel firstBaselineAnchor];
    v59 = [(UILabel *)v13->_titleLabel lastBaselineAnchor];
    v58 = [v60 constraintEqualToAnchor:v59 constant:30.0];
    v80[3] = v58;
    v57 = [(UILabel *)v13->_messageLabel leadingAnchor];
    v56 = [v34 leadingAnchor];
    v55 = [v57 constraintEqualToAnchor:v56 constant:12.0];
    v80[4] = v55;
    v53 = [(UILabel *)v13->_messageLabel trailingAnchor];
    v54 = v34;
    v38 = v34;
    v52 = [v34 trailingAnchor];
    v51 = [v53 constraintEqualToAnchor:v52 constant:-12.0];
    v80[5] = v51;
    v49 = [(UIStackView *)v13->_buttonStackView widthAnchor];
    v50 = [(UIStackView *)v13->_buttonStackView arrangedSubviews];
    v39 = objc_msgSend(v49, "constraintEqualToConstant:", dbl_22D86F040[objc_msgSend(v50, "count") == 1]);
    v80[6] = v39;
    v40 = [(UIStackView *)v13->_buttonStackView centerXAnchor];
    v41 = [v34 centerXAnchor];
    v42 = [v40 constraintEqualToAnchor:v41];
    v80[7] = v42;
    v43 = [(UIStackView *)v13->_buttonStackView bottomAnchor];
    v44 = [v38 bottomAnchor];
    v45 = [v43 constraintEqualToAnchor:v44 constant:-24.0];
    v80[8] = v45;
    [MEMORY[0x263EFF8C0] arrayWithObjects:v80 count:9];
    v47 = id v46 = v7;
    [v75 addObjectsFromArray:v47];

    id v7 = v46;
    [MEMORY[0x263F08938] activateConstraints:v75];

    id v6 = v74;
  }

  return v13;
}

void __63__DBUserAlertSheetView_initWithAlert_environmentConfiguration___block_invoke(uint64_t a1, uint64_t a2)
{
  v10[2] = *MEMORY[0x263EF8340];
  if (a2)
  {
    v3 = [*(id *)(a1 + 32) _buttonWithAlertAction:a2];
    [*(id *)(*(void *)(a1 + 32) + 424) addArrangedSubview:v3];
    v4 = *(void **)(a1 + 40);
    v5 = [v3 widthAnchor];
    id v6 = [v5 constraintLessThanOrEqualToConstant:241.0];
    v10[0] = v6;
    id v7 = [v3 heightAnchor];
    double v8 = [v7 constraintGreaterThanOrEqualToConstant:40.0];
    v10[1] = v8;
    double v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];
    [v4 addObjectsFromArray:v9];
  }
}

- (id)_titleFont
{
  v15[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263F81720];
  uint64_t v3 = *MEMORY[0x263F83618];
  v4 = [(DBUserAlertSheetView *)self traitCollection];
  v5 = [v2 preferredFontDescriptorWithTextStyle:v3 compatibleWithTraitCollection:v4];

  uint64_t v14 = *MEMORY[0x263F81850];
  id v6 = [NSNumber numberWithDouble:*MEMORY[0x263F81800]];
  v15[0] = v6;
  id v7 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];

  uint64_t v12 = *MEMORY[0x263F817A0];
  v13 = v7;
  double v8 = [NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  double v9 = [v5 fontDescriptorByAddingAttributes:v8];

  double v10 = [MEMORY[0x263F81708] fontWithDescriptor:v9 size:0.0];

  return v10;
}

- (id)_buttonFont
{
  v12[1] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F83580]];
  uint64_t v11 = *MEMORY[0x263F81850];
  uint64_t v3 = [NSNumber numberWithDouble:*MEMORY[0x263F81800]];
  v12[0] = v3;
  v4 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];

  uint64_t v9 = *MEMORY[0x263F817A0];
  double v10 = v4;
  v5 = [NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  id v6 = [v2 fontDescriptorByAddingAttributes:v5];

  id v7 = [MEMORY[0x263F81708] fontWithDescriptor:v6 size:0.0];

  return v7;
}

- (id)_buttonWithAlertAction:(id)a3
{
  id v4 = a3;
  v5 = +[DBColorButton buttonWithType:1];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v6 = [MEMORY[0x263F825C8] _carSystemQuaternaryColor];
  [v5 setCarButtonColor:v6];

  id v7 = [v4 title];
  [v5 setTitle:v7 forState:0];

  double v8 = [v5 titleLabel];
  uint64_t v9 = [(DBUserAlertSheetView *)self _buttonFont];
  [v8 setFont:v9];

  double v10 = [MEMORY[0x263F825C8] _carSystemFocusLabelColor];
  [v5 setTitleColor:v10 forState:8];

  uint64_t v11 = [v5 titleLabel];
  [v11 setNumberOfLines:2];

  uint64_t v12 = [v5 titleLabel];
  [v12 setTextAlignment:1];

  v13 = (void *)MEMORY[0x263F823D0];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __47__DBUserAlertSheetView__buttonWithAlertAction___block_invoke;
  v17[3] = &unk_2649B5ED0;
  id v18 = v4;
  id v14 = v4;
  v15 = [v13 actionWithHandler:v17];
  [v5 addAction:v15 forControlEvents:0x2000];

  return v5;
}

void __47__DBUserAlertSheetView__buttonWithAlertAction___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = DBLogForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl(&dword_22D6F0000, v4, OS_LOG_TYPE_DEFAULT, "handling alert button action: %@", (uint8_t *)&v7, 0xCu);
  }

  v5 = [*(id *)(a1 + 32) handler];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) handler];
    v6[2](v6, *(void *)(a1 + 32));
  }
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)messageLabel
{
  return self->_messageLabel;
}

- (void)setMessageLabel:(id)a3
{
}

- (UIStackView)buttonStackView
{
  return self->_buttonStackView;
}

- (void)setButtonStackView:(id)a3
{
}

- (id)dismissHandler
{
  return self->_dismissHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dismissHandler, 0);
  objc_storeStrong((id *)&self->_buttonStackView, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end