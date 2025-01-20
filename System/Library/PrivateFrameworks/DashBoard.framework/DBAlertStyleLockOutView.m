@interface DBAlertStyleLockOutView
- (DBAlertStyleLockOutView)initWithMode:(int64_t)a3 environmentConfiguration:(id)a4;
- (UIImageView)imageView;
- (UILabel)messageLabel;
- (UILabel)titleLabel;
- (UIStackView)buttonStackView;
- (id)_buttonFont;
- (id)_buttonOfType:(unint64_t)a3;
- (id)_buttonTitleForType:(unint64_t)a3;
- (id)_titleFont;
- (void)_buttonTapped:(id)a3;
- (void)setButtonStackView:(id)a3;
- (void)setImageView:(id)a3;
- (void)setMessageLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation DBAlertStyleLockOutView

- (DBAlertStyleLockOutView)initWithMode:(int64_t)a3 environmentConfiguration:(id)a4
{
  v146[1] = *MEMORY[0x263EF8340];
  v134.receiver = self;
  v134.super_class = (Class)DBAlertStyleLockOutView;
  id v126 = a4;
  v5 = -[DBLockOutView initWithMode:environmentConfiguration:](&v134, sel_initWithMode_environmentConfiguration_, a3);
  if (v5)
  {
    v129 = objc_opt_new();
    v6 = objc_opt_new();
    v7 = [MEMORY[0x263F825C8] tableBackgroundColor];
    [(DBAlertStyleLockOutView *)v5 setBackgroundColor:v7];

    v128 = v5;
    switch(a3)
    {
      case 0:
      case 1:
      case 2:
      case 5:
      case 6:
        v8 = [MEMORY[0x263F086E0] bundleForClass:NSClassFromString(&cfstr_Dashboard_4.isa)];
        v9 = [v8 localizedStringForKey:@"LOCKOUT_GENERIC_TITLE" value:&stru_26E13A820 table:@"CarPlayApp"];

        v10 = [(DBAlertStyleLockOutView *)v5 _buttonOfType:1000];
        v146[0] = v10;
        v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v146 count:1];
        [v6 addObjectsFromArray:v11];

        uint64_t v12 = 0;
        goto LABEL_4;
      case 3:
        v75 = [MEMORY[0x263F086E0] bundleForClass:NSClassFromString(&cfstr_Dashboard_4.isa)];
        v9 = [v75 localizedStringForKey:@"LOCKOUT_SIRI_TITLE" value:&stru_26E13A820 table:@"CarPlayApp"];

        v76 = [MEMORY[0x263F086E0] bundleForClass:NSClassFromString(&cfstr_Dashboard_4.isa)];
        uint64_t v12 = [v76 localizedStringForKey:@"LOCKOUT_SIRI_MESSAGE" value:&stru_26E13A820 table:@"CarPlayApp"];

        v10 = [(DBAlertStyleLockOutView *)v5 _buttonOfType:1000];
        v145 = v10;
        v77 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v145 count:1];
        [v6 addObjectsFromArray:v77];

        goto LABEL_4;
      case 4:
        v78 = [MEMORY[0x263F086E0] bundleForClass:NSClassFromString(&cfstr_Dashboard_4.isa)];
        v9 = [v78 localizedStringForKey:@"LOCKOUT_THERMAL_TITLE" value:&stru_26E13A820 table:@"CarPlayApp"];

        v79 = (void *)MEMORY[0x263F827E8];
        v80 = [MEMORY[0x263F086E0] bundleForClass:NSClassFromString(&cfstr_Dashboard_4.isa)];
        v81 = [v126 traitCollection];
        uint64_t v13 = [v79 imageNamed:@"CarDisplayThermometer" inBundle:v80 compatibleWithTraitCollection:v81];

        v5 = v128;
        v82 = [MEMORY[0x263F086E0] bundleForClass:NSClassFromString(&cfstr_Dashboard_4.isa)];
        uint64_t v12 = [v82 localizedStringForKey:@"LOCKOUT_THERMAL_MESSAGE" value:&stru_26E13A820 table:@"CarPlayApp"];

        v10 = [(DBAlertStyleLockOutView *)v128 _buttonOfType:1000];
        v144 = v10;
        v83 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v144 count:1];
        [v6 addObjectsFromArray:v83];

        goto LABEL_5;
      case 7:
        v84 = [MEMORY[0x263F086E0] bundleForClass:NSClassFromString(&cfstr_Dashboard_4.isa)];
        v9 = [v84 localizedStringForKey:@"LOCKOUT_DISCLOSURE_TITLE" value:&stru_26E13A820 table:@"CarPlayApp"];

        v85 = [MEMORY[0x263F086E0] bundleForClass:NSClassFromString(&cfstr_Dashboard_4.isa)];
        uint64_t v12 = [v85 localizedStringForKey:@"LOCKOUT_DISCLOSURE_MESSAGE" value:&stru_26E13A820 table:@"CarPlayApp"];

        v86 = [(DBAlertStyleLockOutView *)v5 _buttonOfType:1002];
        v143[0] = v86;
        v87 = [(DBAlertStyleLockOutView *)v5 _buttonOfType:1003];
        v143[1] = v87;
        v88 = [MEMORY[0x263EFF8C0] arrayWithObjects:v143 count:2];
        [v6 addObjectsFromArray:v88];

        if ([MEMORY[0x263F30E28] showTrustedLockout])
        {
          v10 = [(DBAlertStyleLockOutView *)v5 _buttonOfType:1004];
          [v6 insertObject:v10 atIndex:1];
LABEL_4:
          uint64_t v13 = 0;
LABEL_5:
        }
        else
        {
          uint64_t v13 = 0;
        }
LABEL_6:
        id v14 = objc_alloc(MEMORY[0x263F828E0]);
        double v15 = *MEMORY[0x263F001A8];
        double v16 = *(double *)(MEMORY[0x263F001A8] + 8);
        double v17 = *(double *)(MEMORY[0x263F001A8] + 16);
        double v18 = *(double *)(MEMORY[0x263F001A8] + 24);
        uint64_t v19 = objc_msgSend(v14, "initWithFrame:", *MEMORY[0x263F001A8], v16, v17, v18);
        titleLabel = v5->_titleLabel;
        v5->_titleLabel = (UILabel *)v19;

        [(UILabel *)v5->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
        v21 = [(DBAlertStyleLockOutView *)v5 _titleFont];
        [(UILabel *)v5->_titleLabel setFont:v21];

        [(UILabel *)v5->_titleLabel setTextAlignment:1];
        [(UILabel *)v5->_titleLabel setNumberOfLines:0];
        [(UILabel *)v5->_titleLabel setText:v9];
        [(DBAlertStyleLockOutView *)v5 addSubview:v5->_titleLabel];
        if (v13)
        {
          uint64_t v22 = [objc_alloc(MEMORY[0x263F82828]) initWithImage:v13];
          imageView = v5->_imageView;
          v5->_imageView = (UIImageView *)v22;

          [(UIImageView *)v5->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
          [(UIImageView *)v5->_imageView setContentMode:1];
          [(DBAlertStyleLockOutView *)v5 addSubview:v5->_imageView];
        }
        v124 = (void *)v13;
        uint64_t v24 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v15, v16, v17, v18);
        messageLabel = v5->_messageLabel;
        v5->_messageLabel = (UILabel *)v24;

        [(UILabel *)v5->_messageLabel setTranslatesAutoresizingMaskIntoConstraints:0];
        v26 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F83580]];
        uint64_t v141 = *MEMORY[0x263F81850];
        v27 = [NSNumber numberWithDouble:*MEMORY[0x263F81838]];
        v142 = v27;
        uint64_t v28 = [NSDictionary dictionaryWithObjects:&v142 forKeys:&v141 count:1];

        uint64_t v139 = *MEMORY[0x263F817A0];
        uint64_t v140 = v28;
        v123 = (void *)v28;
        v29 = [NSDictionary dictionaryWithObjects:&v140 forKeys:&v139 count:1];
        uint64_t v30 = [v26 fontDescriptorByAddingAttributes:v29];

        v122 = (void *)v30;
        v31 = [MEMORY[0x263F81708] fontWithDescriptor:v30 size:0.0];
        [(UILabel *)v5->_messageLabel setFont:v31];

        [(UILabel *)v5->_messageLabel setTextAlignment:1];
        [(UILabel *)v5->_messageLabel setNumberOfLines:0];
        v125 = (void *)v12;
        [(UILabel *)v5->_messageLabel setText:v12];
        [(DBAlertStyleLockOutView *)v5 addSubview:v5->_messageLabel];
        uint64_t v32 = objc_msgSend(objc_alloc(MEMORY[0x263F82BF8]), "initWithFrame:", v15, v16, v17, v18);
        buttonStackView = v5->_buttonStackView;
        v5->_buttonStackView = (UIStackView *)v32;

        [(UIStackView *)v5->_buttonStackView setTranslatesAutoresizingMaskIntoConstraints:0];
        [(UIStackView *)v5->_buttonStackView setAxis:0];
        [(UIStackView *)v5->_buttonStackView setDistribution:1];
        [(UIStackView *)v5->_buttonStackView setSpacing:20.0];
        [(DBAlertStyleLockOutView *)v5 addSubview:v5->_buttonStackView];
        long long v132 = 0u;
        long long v133 = 0u;
        long long v130 = 0u;
        long long v131 = 0u;
        id obj = v6;
        uint64_t v34 = [obj countByEnumeratingWithState:&v130 objects:v138 count:16];
        if (v34)
        {
          uint64_t v35 = v34;
          uint64_t v36 = *(void *)v131;
          do
          {
            for (uint64_t i = 0; i != v35; ++i)
            {
              if (*(void *)v131 != v36) {
                objc_enumerationMutation(obj);
              }
              v38 = *(void **)(*((void *)&v130 + 1) + 8 * i);
              [(UIStackView *)v5->_buttonStackView addArrangedSubview:v38];
              v39 = [v38 widthAnchor];
              v40 = [v39 constraintLessThanOrEqualToConstant:241.0];
              v137[0] = v40;
              v41 = [v38 heightAnchor];
              v42 = [v41 constraintGreaterThanOrEqualToConstant:40.0];
              v137[1] = v42;
              v43 = [MEMORY[0x263EFF8C0] arrayWithObjects:v137 count:2];
              [v129 addObjectsFromArray:v43];

              v5 = v128;
            }
            uint64_t v35 = [obj countByEnumeratingWithState:&v130 objects:v138 count:16];
          }
          while (v35);
        }

        v44 = v5->_imageView;
        if (v44)
        {
          v108 = [(UIImageView *)v44 firstBaselineAnchor];
          v118 = [(DBAlertStyleLockOutView *)v5 safeAreaLayoutGuide];
          uint64_t v45 = [v118 topAnchor];
          [v126 currentSafeViewAreaFrame];
          double v47 = v46 * 0.25;
          v114 = [v126 screen];
          [v114 scale];
          double v49 = v48 / 1.5;
          v112 = [v126 screen];
          [v112 scale];
          v51 = (void *)v45;
          v116 = [v108 constraintEqualToAnchor:v45 constant:v50 * 0.5 * -60.0 + v47 * v49];
          v136[0] = v116;
          v106 = [(UIImageView *)v5->_imageView leadingAnchor];
          v110 = [(DBAlertStyleLockOutView *)v5 safeAreaLayoutGuide];
          v104 = [v110 leadingAnchor];
          v102 = [v106 constraintEqualToAnchor:v104 constant:12.0];
          v136[1] = v102;
          v98 = [(UIImageView *)v5->_imageView trailingAnchor];
          v100 = [(DBAlertStyleLockOutView *)v5 safeAreaLayoutGuide];
          v52 = [v100 trailingAnchor];
          v53 = [v98 constraintEqualToAnchor:v52 constant:-12.0];
          v136[2] = v53;
          v54 = [(UILabel *)v5->_titleLabel firstBaselineAnchor];
          v55 = [(UIImageView *)v5->_imageView lastBaselineAnchor];
          v56 = [v54 constraintEqualToAnchor:v55 constant:30.0];
          v136[3] = v56;
          v57 = [MEMORY[0x263EFF8C0] arrayWithObjects:v136 count:4];
          [v129 addObjectsFromArray:v57];

          v5 = v128;
          v58 = v51;

          v59 = v118;
          v60 = v114;
          v61 = v108;

          v62 = v112;
        }
        else
        {
          v61 = [(UILabel *)v5->_titleLabel firstBaselineAnchor];
          v59 = [(DBAlertStyleLockOutView *)v5 safeAreaLayoutGuide];
          v58 = [v59 topAnchor];
          [v126 currentSafeViewAreaFrame];
          double v64 = v63 * 0.25;
          v60 = [v126 screen];
          [v60 scale];
          v62 = [v61 constraintEqualToAnchor:v58 constant:v64 * (v65 / 1.5) + -24.0];
          [v129 addObject:v62];
        }

        v119 = [(UILabel *)v5->_titleLabel leadingAnchor];
        v121 = [(DBAlertStyleLockOutView *)v5 safeAreaLayoutGuide];
        v117 = [v121 leadingAnchor];
        v115 = [v119 constraintEqualToAnchor:v117 constant:12.0];
        v135[0] = v115;
        v111 = [(UILabel *)v5->_titleLabel trailingAnchor];
        v113 = [(DBAlertStyleLockOutView *)v5 safeAreaLayoutGuide];
        v109 = [v113 trailingAnchor];
        v107 = [v111 constraintEqualToAnchor:v109 constant:-12.0];
        v135[1] = v107;
        v105 = [(UILabel *)v5->_messageLabel firstBaselineAnchor];
        v103 = [(UILabel *)v5->_titleLabel lastBaselineAnchor];
        v101 = [v105 constraintEqualToAnchor:v103 constant:30.0];
        v135[2] = v101;
        v97 = [(UILabel *)v5->_messageLabel leadingAnchor];
        v99 = [(DBAlertStyleLockOutView *)v5 safeAreaLayoutGuide];
        v96 = [v99 leadingAnchor];
        v95 = [v97 constraintEqualToAnchor:v96 constant:12.0];
        v135[3] = v95;
        v94 = [(UILabel *)v5->_messageLabel trailingAnchor];
        v120 = [(DBAlertStyleLockOutView *)v5 safeAreaLayoutGuide];
        v93 = [v120 trailingAnchor];
        v92 = [v94 constraintEqualToAnchor:v93 constant:-12.0];
        v135[4] = v92;
        v91 = [(UIStackView *)v5->_buttonStackView widthAnchor];
        v90 = objc_msgSend(v91, "constraintEqualToConstant:", dbl_22D86EE00[objc_msgSend(obj, "count") == 1]);
        v135[5] = v90;
        v66 = [(UIStackView *)v5->_buttonStackView centerXAnchor];
        v89 = [(DBAlertStyleLockOutView *)v5 safeAreaLayoutGuide];
        v67 = [v89 centerXAnchor];
        v68 = [v66 constraintEqualToAnchor:v67];
        v135[6] = v68;
        v69 = [(UIStackView *)v5->_buttonStackView bottomAnchor];
        v70 = [(DBAlertStyleLockOutView *)v5 safeAreaLayoutGuide];
        v71 = [v70 bottomAnchor];
        v72 = [v69 constraintEqualToAnchor:v71 constant:-24.0];
        v135[7] = v72;
        v73 = [MEMORY[0x263EFF8C0] arrayWithObjects:v135 count:8];
        [v129 addObjectsFromArray:v73];

        v5 = v128;
        [MEMORY[0x263F08938] activateConstraints:v129];

        break;
      default:
        uint64_t v12 = 0;
        uint64_t v13 = 0;
        v9 = 0;
        goto LABEL_6;
    }
  }

  return v5;
}

- (id)_titleFont
{
  v15[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263F81720];
  uint64_t v3 = *MEMORY[0x263F83618];
  v4 = [(DBAlertStyleLockOutView *)self traitCollection];
  v5 = [v2 preferredFontDescriptorWithTextStyle:v3 compatibleWithTraitCollection:v4];

  uint64_t v14 = *MEMORY[0x263F81850];
  v6 = [NSNumber numberWithDouble:*MEMORY[0x263F81800]];
  v15[0] = v6;
  v7 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];

  uint64_t v12 = *MEMORY[0x263F817A0];
  uint64_t v13 = v7;
  v8 = [NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  v9 = [v5 fontDescriptorByAddingAttributes:v8];

  v10 = [MEMORY[0x263F81708] fontWithDescriptor:v9 size:0.0];

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
  v10 = v4;
  v5 = [NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  v6 = [v2 fontDescriptorByAddingAttributes:v5];

  v7 = [MEMORY[0x263F81708] fontWithDescriptor:v6 size:0.0];

  return v7;
}

- (id)_buttonOfType:(unint64_t)a3
{
  v5 = +[DBColorButton buttonWithType:1];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  v6 = [(DBAlertStyleLockOutView *)self _buttonTitleForType:a3];
  [v5 setTitle:v6 forState:0];

  [v5 addTarget:self action:sel__buttonTapped_ forControlEvents:64];
  switch(a3)
  {
    case 0x3ECuLL:
      uint64_t v7 = [MEMORY[0x263F825C8] systemYellowColor];
      goto LABEL_7;
    case 0x3EBuLL:
      uint64_t v7 = [MEMORY[0x263F825C8] systemGreenColor];
      goto LABEL_7;
    case 0x3EAuLL:
      uint64_t v7 = [MEMORY[0x263F825C8] systemRedColor];
LABEL_7:
      v8 = (void *)v7;
      [v5 setCarButtonColor:v7];

      uint64_t v9 = [MEMORY[0x263F825C8] _carSystemFocusLabelColor];
      [v5 setTitleColor:v9 forState:0];
      goto LABEL_9;
  }
  uint64_t v9 = [MEMORY[0x263F825C8] _carSystemQuaternaryColor];
  [v5 setCarButtonColor:v9];
LABEL_9:

  v10 = [v5 titleLabel];
  uint64_t v11 = [(DBAlertStyleLockOutView *)self _buttonFont];
  [v10 setFont:v11];

  uint64_t v12 = [MEMORY[0x263F825C8] _carSystemFocusLabelColor];
  [v5 setTitleColor:v12 forState:8];

  uint64_t v13 = [v5 titleLabel];
  [v13 setNumberOfLines:2];

  uint64_t v14 = [v5 titleLabel];
  [v14 setTextAlignment:1];

  [v5 setTag:a3];
  return v5;
}

- (id)_buttonTitleForType:(unint64_t)a3
{
  switch(a3)
  {
    case 0x3E8uLL:
      v4 = [MEMORY[0x263F086E0] bundleForClass:NSClassFromString(&cfstr_Dashboard_4.isa)];
      v5 = v4;
      v6 = @"LOCKOUT_BACK_TO_OEM";
      goto LABEL_7;
    case 0x3E9uLL:
      v4 = [MEMORY[0x263F086E0] bundleForClass:NSClassFromString(&cfstr_Dashboard_4.isa)];
      v5 = v4;
      v6 = @"LOCKOUT_ENABLE_SIRI";
      goto LABEL_7;
    case 0x3EAuLL:
      v4 = [MEMORY[0x263F086E0] bundleForClass:NSClassFromString(&cfstr_Dashboard_4.isa)];
      v5 = v4;
      v6 = @"LOCKOUT_UNDISCLOSED";
      goto LABEL_7;
    case 0x3EBuLL:
      v4 = [MEMORY[0x263F086E0] bundleForClass:NSClassFromString(&cfstr_Dashboard_4.isa)];
      v5 = v4;
      v6 = @"LOCKOUT_SAFE";
      goto LABEL_7;
    case 0x3ECuLL:
      v4 = [MEMORY[0x263F086E0] bundleForClass:NSClassFromString(&cfstr_Dashboard_4.isa)];
      v5 = v4;
      v6 = @"LOCKOUT_FEATURES_OFF";
LABEL_7:
      uint64_t v3 = [v4 localizedStringForKey:v6 value:&stru_26E13A820 table:@"CarPlayApp"];

      break;
    default:
      break;
  }
  return v3;
}

- (void)_buttonTapped:(id)a3
{
  id v4 = a3;
  id v6 = [(DBLockOutView *)self delegate];
  uint64_t v5 = [v4 tag];

  [v6 lockOutView:self didTapButtonOfType:v5];
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonStackView, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end