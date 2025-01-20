@interface HUROARUpgradeView
- (HMHome)home;
- (HUROARUpgradeView)initWithUpgradeViewReason:(unint64_t)a3 home:(id)a4;
- (NSMutableArray)constraints;
- (UIButton)button;
- (UIImageView)deviceImageView;
- (UILabel)subtitle;
- (UILabel)title;
- (id)_buttonAction;
- (id)_buttonString;
- (id)_subtitleString;
- (id)_titleString;
- (unint64_t)upgradeViewReason;
- (void)_didSwitchToHome:(id)a3;
- (void)homeKitDispatcher:(id)a3 manager:(id)a4 didChangeHome:(id)a5;
- (void)layoutSubviews;
- (void)setButton:(id)a3;
- (void)setConstraints:(id)a3;
- (void)setDeviceImageView:(id)a3;
- (void)setHome:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUpgradeViewReason:(unint64_t)a3;
@end

@implementation HUROARUpgradeView

- (HUROARUpgradeView)initWithUpgradeViewReason:(unint64_t)a3 home:(id)a4
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v57.receiver = self;
  v57.super_class = (Class)HUROARUpgradeView;
  v9 = [(HUROARUpgradeView *)&v57 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_home, a4);
    v11 = [MEMORY[0x1E4F691A0] sharedDispatcher];
    [v11 addHomeManagerObserver:v10];

    v12 = HFLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138413058;
      v59 = v10;
      __int16 v60 = 2112;
      v61 = v13;
      __int16 v62 = 2112;
      id v63 = v8;
      __int16 v64 = 2048;
      unint64_t v65 = a3;
      _os_log_impl(&dword_1BE345000, v12, OS_LOG_TYPE_DEFAULT, "%@:%@, home = %@,  upgradeViewReason = %lu", buf, 0x2Au);
    }
    [(HUROARUpgradeView *)v10 setUpgradeViewReason:a3];
    if (a3 == 2)
    {
      v14 = [MEMORY[0x1E4F442D8] _typeOfCurrentDevice];
      v15 = [v14 identifier];
      uint64_t v56 = 0;
      [MEMORY[0x1E4F6F260] symbolForTypeIdentifier:v15 error:&v56];
      v16 = id v55 = v8;
      id v17 = objc_alloc_init(MEMORY[0x1E4F6F240]);
      [v17 setSymbolSize:3];
      v18 = [v16 imageForDescriptor:v17];
      v19 = objc_msgSend(MEMORY[0x1E4F42A80], "imageWithCGImage:", objc_msgSend(v18, "CGImage"));
      v20 = [MEMORY[0x1E4F428B8] systemWhiteColor];
      v21 = [v19 imageWithTintColor:v20];

      id v8 = v55;
      a3 = 2;
    }
    else
    {
      v14 = [MEMORY[0x1E4F42A98] configurationWithPointSize:4 weight:72.0];
      v21 = [MEMORY[0x1E4F42A80] systemImageNamed:@"homekit" withConfiguration:v14];
    }

    v22 = (void *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v21];
    [(HUROARUpgradeView *)v10 setDeviceImageView:v22];

    v23 = [MEMORY[0x1E4F428B8] systemWhiteColor];
    v24 = [(HUROARUpgradeView *)v10 deviceImageView];
    [v24 setTintColor:v23];

    id v25 = objc_alloc_init(MEMORY[0x1E4F42B38]);
    [(HUROARUpgradeView *)v10 setTitle:v25];

    v26 = [(HUROARUpgradeView *)v10 _titleString];
    v27 = [(HUROARUpgradeView *)v10 title];
    [v27 setText:v26];

    v28 = [(HUROARUpgradeView *)v10 title];
    [v28 setTextAlignment:1];

    v29 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F438E8]];
    v30 = [(HUROARUpgradeView *)v10 title];
    [v30 setFont:v29];

    v31 = [MEMORY[0x1E4F428B8] systemWhiteColor];
    v32 = [(HUROARUpgradeView *)v10 title];
    [v32 setTextColor:v31];

    v33 = [(HUROARUpgradeView *)v10 title];
    [v33 sizeToFit];

    id v34 = objc_alloc_init(MEMORY[0x1E4F42B38]);
    [(HUROARUpgradeView *)v10 setSubtitle:v34];

    v35 = [(HUROARUpgradeView *)v10 _subtitleString];
    v36 = [(HUROARUpgradeView *)v10 subtitle];
    [v36 setText:v35];

    v37 = [(HUROARUpgradeView *)v10 subtitle];
    [v37 setTextAlignment:1];

    v38 = [(HUROARUpgradeView *)v10 subtitle];
    [v38 setNumberOfLines:0];

    v39 = [MEMORY[0x1E4F428B8] systemWhiteColor];
    v40 = [(HUROARUpgradeView *)v10 subtitle];
    [v40 setTextColor:v39];

    v41 = [(HUROARUpgradeView *)v10 subtitle];
    [v41 sizeToFit];

    v42 = [(HUROARUpgradeView *)v10 deviceImageView];
    [(HUROARUpgradeView *)v10 addSubview:v42];

    v43 = [(HUROARUpgradeView *)v10 title];
    [(HUROARUpgradeView *)v10 addSubview:v43];

    v44 = [(HUROARUpgradeView *)v10 subtitle];
    [(HUROARUpgradeView *)v10 addSubview:v44];

    v45 = [MEMORY[0x1E4F427E8] filledButtonConfiguration];
    v46 = [(HUROARUpgradeView *)v10 _buttonString];
    [v45 setTitle:v46];

    [v45 setButtonSize:3];
    [v45 setCornerStyle:3];
    v47 = [MEMORY[0x1E4F428B8] systemBlackColor];
    [v45 setBaseForegroundColor:v47];

    v48 = [MEMORY[0x1E4F428B8] systemWhiteColor];
    [v45 setBaseBackgroundColor:v48];

    v49 = [(HUROARUpgradeView *)v10 _buttonAction];
    v50 = [MEMORY[0x1E4F427E0] buttonWithConfiguration:v45 primaryAction:v49];
    [(HUROARUpgradeView *)v10 setButton:v50];

    v51 = [(HUROARUpgradeView *)v10 button];
    [(HUROARUpgradeView *)v10 addSubview:v51];

    if (a3 == 2)
    {
      uint64_t v52 = 0;
    }
    else if (v8)
    {
      uint64_t v52 = objc_msgSend(v8, "hf_currentUserIsOwner");
    }
    else
    {
      uint64_t v52 = 1;
    }
    v53 = [(HUROARUpgradeView *)v10 button];
    [v53 setHidden:v52];
  }
  return v10;
}

- (void)layoutSubviews
{
  v70.receiver = self;
  v70.super_class = (Class)HUROARUpgradeView;
  [(HUROARUpgradeView *)&v70 layoutSubviews];
  v3 = [(HUROARUpgradeView *)self constraints];

  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    v5 = [(HUROARUpgradeView *)self deviceImageView];
    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

    v6 = [(HUROARUpgradeView *)self subtitle];
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

    v7 = [(HUROARUpgradeView *)self title];
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

    id v8 = [(HUROARUpgradeView *)self button];
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

    v9 = [(HUROARUpgradeView *)self subtitle];
    v10 = [v9 bottomAnchor];
    v11 = [(HUROARUpgradeView *)self centerYAnchor];
    v12 = [v10 constraintEqualToAnchor:v11];
    [v4 addObject:v12];

    v13 = [(HUROARUpgradeView *)self subtitle];
    v14 = [v13 leadingAnchor];
    v15 = [(HUROARUpgradeView *)self leadingAnchor];
    v16 = [v14 constraintEqualToAnchor:v15];
    [v4 addObject:v16];

    id v17 = [(HUROARUpgradeView *)self subtitle];
    v18 = [v17 trailingAnchor];
    v19 = [(HUROARUpgradeView *)self trailingAnchor];
    v20 = [v18 constraintEqualToAnchor:v19];
    [v4 addObject:v20];

    v21 = [(HUROARUpgradeView *)self subtitle];
    v22 = [v21 centerXAnchor];
    v23 = [(HUROARUpgradeView *)self centerXAnchor];
    v24 = [v22 constraintEqualToAnchor:v23];
    [v4 addObject:v24];

    id v25 = [(HUROARUpgradeView *)self title];
    v26 = [v25 bottomAnchor];
    v27 = [(HUROARUpgradeView *)self subtitle];
    v28 = [v27 topAnchor];
    v29 = [v26 constraintEqualToAnchor:v28 constant:-5.0];
    [v4 addObject:v29];

    v30 = [(HUROARUpgradeView *)self title];
    v31 = [v30 leadingAnchor];
    v32 = [(HUROARUpgradeView *)self leadingAnchor];
    v33 = [v31 constraintEqualToAnchor:v32];
    [v4 addObject:v33];

    id v34 = [(HUROARUpgradeView *)self title];
    v35 = [v34 trailingAnchor];
    v36 = [(HUROARUpgradeView *)self trailingAnchor];
    v37 = [v35 constraintEqualToAnchor:v36];
    [v4 addObject:v37];

    v38 = [(HUROARUpgradeView *)self title];
    v39 = [v38 centerXAnchor];
    v40 = [(HUROARUpgradeView *)self centerXAnchor];
    v41 = [v39 constraintEqualToAnchor:v40];
    [v4 addObject:v41];

    v42 = [(HUROARUpgradeView *)self deviceImageView];
    v43 = [v42 centerXAnchor];
    v44 = [(HUROARUpgradeView *)self centerXAnchor];
    v45 = [v43 constraintEqualToAnchor:v44];
    [v4 addObject:v45];

    v46 = [(HUROARUpgradeView *)self deviceImageView];
    v47 = [v46 bottomAnchor];
    v48 = [(HUROARUpgradeView *)self title];
    v49 = [v48 topAnchor];
    v50 = [v47 constraintEqualToAnchor:v49 constant:-10.0];
    [v4 addObject:v50];

    v51 = [(HUROARUpgradeView *)self button];
    uint64_t v52 = [v51 bottomAnchor];
    v53 = [(HUROARUpgradeView *)self layoutMarginsGuide];
    v54 = [v53 bottomAnchor];
    id v55 = [v52 constraintEqualToAnchor:v54];
    [v4 addObject:v55];

    uint64_t v56 = [(HUROARUpgradeView *)self button];
    objc_super v57 = [v56 leadingAnchor];
    v58 = [(HUROARUpgradeView *)self leadingAnchor];
    v59 = [v57 constraintEqualToAnchor:v58];
    [v4 addObject:v59];

    __int16 v60 = [(HUROARUpgradeView *)self button];
    v61 = [v60 trailingAnchor];
    __int16 v62 = [(HUROARUpgradeView *)self trailingAnchor];
    id v63 = [v61 constraintEqualToAnchor:v62];
    [v4 addObject:v63];

    __int16 v64 = [(HUROARUpgradeView *)self button];
    unint64_t v65 = [v64 centerXAnchor];
    uint64_t v66 = [(HUROARUpgradeView *)self centerXAnchor];
    v67 = [v65 constraintEqualToAnchor:v66];
    [v4 addObject:v67];

    [(HUROARUpgradeView *)self setConstraints:v4];
    v68 = (void *)MEMORY[0x1E4F28DC8];
    v69 = [(HUROARUpgradeView *)self constraints];
    [v68 activateConstraints:v69];
  }
}

- (id)_titleString
{
  v3 = _HULocalizedStringWithDefaultValue(@"HUSetupCellROARRequired_Title", @"HUSetupCellROARRequired_Title", 1);
  if ([(HUROARUpgradeView *)self upgradeViewReason] == 4)
  {
    uint64_t v4 = _HULocalizedStringWithDefaultValue(@"HUUnsupportedHomeHub_Title", @"HUUnsupportedHomeHub_Title", 1);

    v3 = (void *)v4;
  }

  return v3;
}

- (id)_subtitleString
{
  v3 = _HULocalizedStringWithDefaultValue(@"HUSetupCellROARRequired_Details", @"HUSetupCellROARRequired_Details", 1);
  if ([(HUROARUpgradeView *)self upgradeViewReason] == 4)
  {
    uint64_t v4 = _HULocalizedStringWithDefaultValue(@"HUUnsupportedHomeHub_Details", @"HUUnsupportedHomeHub_Details", 1);

    v3 = (void *)v4;
  }

  return v3;
}

- (id)_buttonString
{
  if ([(HUROARUpgradeView *)self upgradeViewReason] == 2) {
    v2 = @"HUSetupCellSoftwareUpdate";
  }
  else {
    v2 = @"HUUnsupportedHomeHub_LearnMore";
  }
  v3 = _HULocalizedStringWithDefaultValue(v2, v2, 1);

  return v3;
}

- (id)_buttonAction
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34__HUROARUpgradeView__buttonAction__block_invoke;
  v4[3] = &unk_1E6386758;
  v4[4] = self;
  v2 = [MEMORY[0x1E4F426E8] actionWithHandler:v4];

  return v2;
}

void __34__HUROARUpgradeView__buttonAction__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) upgradeViewReason];
  id v4 = [MEMORY[0x1E4F69378] sharedInstance];
  if (v1 == 4) {
    objc_msgSend(MEMORY[0x1E4F1CB10], "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");
  }
  else {
  v2 = objc_msgSend(MEMORY[0x1E4F1CB10], "hf_systemSoftwareUpdate");
  }
  id v3 = (id)[v4 openSensitiveURL:v2];
}

- (void)_didSwitchToHome:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = NSStringFromSelector(a2);
    id v8 = [(HUROARUpgradeView *)self home];
    int v18 = 138413058;
    v19 = self;
    __int16 v20 = 2112;
    v21 = v7;
    __int16 v22 = 2112;
    unint64_t v23 = (unint64_t)v5;
    __int16 v24 = 2112;
    id v25 = v8;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@, Switched to Home %@ - current Home %@", (uint8_t *)&v18, 0x2Au);
  }
  id v9 = [(HUROARUpgradeView *)self home];

  if (v9 != v5)
  {
    [(HUROARUpgradeView *)self setHome:v5];
    v10 = HFLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = NSStringFromSelector(a2);
      unint64_t v12 = [(HUROARUpgradeView *)self upgradeViewReason];
      int v13 = objc_msgSend(v5, "hf_currentUserIsOwner");
      int v18 = 138413058;
      v19 = self;
      __int16 v20 = 2112;
      v21 = v11;
      __int16 v22 = 2048;
      unint64_t v23 = v12;
      __int16 v24 = 1024;
      LODWORD(v25) = v13;
      _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "%@:%@, upgradeViewReason %lu - currentUserIsOwner %{BOOL}d", (uint8_t *)&v18, 0x26u);
    }
    if ([(HUROARUpgradeView *)self upgradeViewReason] == 2
      || v5 && (objc_msgSend(v5, "hf_currentUserIsOwner") & 1) == 0)
    {
      v15 = [(HUROARUpgradeView *)self button];
      [v15 setHidden:0];

      v14 = [(HUROARUpgradeView *)self _buttonString];
      v16 = [(HUROARUpgradeView *)self button];
      id v17 = [v16 configuration];
      [v17 setTitle:v14];
    }
    else
    {
      v14 = [(HUROARUpgradeView *)self button];
      [v14 setHidden:1];
    }
  }
}

- (void)homeKitDispatcher:(id)a3 manager:(id)a4 didChangeHome:(id)a5
{
}

- (UIImageView)deviceImageView
{
  return self->_deviceImageView;
}

- (void)setDeviceImageView:(id)a3
{
}

- (UILabel)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (UILabel)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (UIButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
}

- (NSMutableArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
}

- (unint64_t)upgradeViewReason
{
  return self->_upgradeViewReason;
}

- (void)setUpgradeViewReason:(unint64_t)a3
{
  self->_upgradeViewReason = a3;
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_deviceImageView, 0);
}

@end