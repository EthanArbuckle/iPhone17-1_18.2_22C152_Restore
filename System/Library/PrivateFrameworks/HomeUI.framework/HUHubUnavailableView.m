@interface HUHubUnavailableView
- (HUHubUnavailableView)initWithFrame:(CGRect)a3;
- (HUIconView)networkIconView;
- (NSArray)layoutConstraints;
- (NSString)accessoryName;
- (UILabel)descriptionLabel;
- (UILabel)titleLabel;
- (void)_setupView;
- (void)setAccessoryName:(id)a3;
- (void)setDescriptionLabel:(id)a3;
- (void)setLayoutConstraints:(id)a3;
- (void)setNetworkIconView:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)updateConstraints;
@end

@implementation HUHubUnavailableView

- (HUHubUnavailableView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HUHubUnavailableView;
  v3 = -[HUHubUnavailableView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(HUHubUnavailableView *)v3 _setupView];
  }
  return v4;
}

- (void)_setupView
{
  id v22 = [MEMORY[0x1E4F42A98] configurationWithPointSize:50.0];
  id v3 = objc_alloc(MEMORY[0x1E4F6A428]);
  double v4 = *MEMORY[0x1E4F1DB28];
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v8 = (HUIconView *)objc_msgSend(v3, "initWithFrame:contentMode:", 4, *MEMORY[0x1E4F1DB28], v5, v6, v7);
  networkIconView = self->_networkIconView;
  self->_networkIconView = v8;

  v10 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
  [(HUIconView *)self->_networkIconView setTintColor:v10];

  [(HUIconView *)self->_networkIconView setTranslatesAutoresizingMaskIntoConstraints:0];
  v11 = self->_networkIconView;
  v12 = (void *)[objc_alloc(MEMORY[0x1E4F691D0]) initWithSystemImageNamed:@"wifi.slash" configuration:v22];
  [(HUIconView *)v11 updateWithIconDescriptor:v12 displayStyle:1 animated:0];

  [(HUHubUnavailableView *)self addSubview:self->_networkIconView];
  v13 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", v4, v5, v6, v7);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v13;

  v15 = [MEMORY[0x1E4F428B8] labelColor];
  [(UILabel *)self->_titleLabel setTextColor:v15];

  [(UILabel *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_titleLabel setAdjustsFontSizeToFitWidth:1];
  [(UILabel *)self->_titleLabel setAdjustsFontForContentSizeCategory:1];
  [(UILabel *)self->_titleLabel setTextAlignment:1];
  [(UILabel *)self->_titleLabel setNumberOfLines:0];
  [(UILabel *)self->_titleLabel setLineBreakMode:0];
  v16 = [MEMORY[0x1E4F42A30] _preferredFontForTextStyle:*MEMORY[0x1E4F438F0] variant:1024];
  [(UILabel *)self->_titleLabel setFont:v16];

  [(HUHubUnavailableView *)self addSubview:self->_titleLabel];
  v17 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", v4, v5, v6, v7);
  descriptionLabel = self->_descriptionLabel;
  self->_descriptionLabel = v17;

  v19 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
  [(UILabel *)self->_descriptionLabel setTextColor:v19];

  [(UILabel *)self->_descriptionLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_descriptionLabel setAdjustsFontSizeToFitWidth:1];
  [(UILabel *)self->_descriptionLabel setAdjustsFontForContentSizeCategory:1];
  [(UILabel *)self->_descriptionLabel setTextAlignment:1];
  [(UILabel *)self->_descriptionLabel setNumberOfLines:0];
  [(UILabel *)self->_descriptionLabel setLineBreakMode:0];
  v20 = [MEMORY[0x1E4F42A30] _preferredFontForTextStyle:*MEMORY[0x1E4F43870] variant:8];
  [(UILabel *)self->_descriptionLabel setFont:v20];

  [(HUHubUnavailableView *)self addSubview:self->_descriptionLabel];
  v21 = [MEMORY[0x1E4F428B8] clearColor];
  [(HUHubUnavailableView *)self setBackgroundColor:v21];
}

- (void)updateConstraints
{
  id v3 = [(HUHubUnavailableView *)self layoutConstraints];

  if (!v3)
  {
    double v4 = [MEMORY[0x1E4F1CA48] array];
    double v5 = [(HUHubUnavailableView *)self networkIconView];
    double v6 = [v5 bottomAnchor];
    double v7 = [(HUHubUnavailableView *)self titleLabel];
    v8 = [v7 topAnchor];
    v9 = [v6 constraintEqualToAnchor:v8 constant:-12.0];
    [v4 addObject:v9];

    v10 = [(HUHubUnavailableView *)self networkIconView];
    v11 = [v10 centerXAnchor];
    v12 = [(HUHubUnavailableView *)self centerXAnchor];
    v13 = [v11 constraintEqualToAnchor:v12];
    [v4 addObject:v13];

    v14 = [(HUHubUnavailableView *)self networkIconView];
    v15 = [v14 widthAnchor];
    v16 = [v15 constraintEqualToConstant:50.0];
    [v4 addObject:v16];

    v17 = [(HUHubUnavailableView *)self networkIconView];
    v18 = [v17 heightAnchor];
    v19 = [v18 constraintEqualToConstant:50.0];
    [v4 addObject:v19];

    v20 = [(HUHubUnavailableView *)self titleLabel];
    v21 = [v20 bottomAnchor];
    id v22 = [(HUHubUnavailableView *)self descriptionLabel];
    v23 = [v22 topAnchor];
    v24 = [v21 constraintEqualToAnchor:v23 constant:-12.0];
    [v4 addObject:v24];

    v25 = [(HUHubUnavailableView *)self titleLabel];
    v26 = [v25 centerXAnchor];
    v27 = [(HUHubUnavailableView *)self centerXAnchor];
    v28 = [v26 constraintEqualToAnchor:v27];
    [v4 addObject:v28];

    v29 = [(HUHubUnavailableView *)self titleLabel];
    v30 = [v29 leadingAnchor];
    v31 = [(HUHubUnavailableView *)self leadingAnchor];
    v32 = [v30 constraintEqualToAnchor:v31 constant:22.0];
    [v4 addObject:v32];

    v33 = [(HUHubUnavailableView *)self titleLabel];
    v34 = [v33 trailingAnchor];
    v35 = [(HUHubUnavailableView *)self trailingAnchor];
    v36 = [v34 constraintEqualToAnchor:v35 constant:-22.0];
    [v4 addObject:v36];

    v37 = [(HUHubUnavailableView *)self descriptionLabel];
    v38 = [v37 centerXAnchor];
    v39 = [(HUHubUnavailableView *)self centerXAnchor];
    v40 = [v38 constraintEqualToAnchor:v39];
    [v4 addObject:v40];

    v41 = [(HUHubUnavailableView *)self descriptionLabel];
    v42 = [v41 centerYAnchor];
    v43 = [(HUHubUnavailableView *)self centerYAnchor];
    v44 = [v42 constraintEqualToAnchor:v43];
    [v4 addObject:v44];

    v45 = [(HUHubUnavailableView *)self descriptionLabel];
    v46 = [v45 leadingAnchor];
    v47 = [(HUHubUnavailableView *)self leadingAnchor];
    v48 = [v46 constraintEqualToAnchor:v47 constant:22.0];
    [v4 addObject:v48];

    v49 = [(HUHubUnavailableView *)self descriptionLabel];
    v50 = [v49 trailingAnchor];
    v51 = [(HUHubUnavailableView *)self trailingAnchor];
    v52 = [v50 constraintEqualToAnchor:v51 constant:-22.0];
    [v4 addObject:v52];

    [MEMORY[0x1E4F28DC8] activateConstraints:v4];
    [(HUHubUnavailableView *)self setLayoutConstraints:v4];
  }
  v53.receiver = self;
  v53.super_class = (Class)HUHubUnavailableView;
  [(HUHubUnavailableView *)&v53 updateConstraints];
}

- (void)setAccessoryName:(id)a3
{
  id v24 = a3;
  if (!-[NSString isEqualToString:](self->_accessoryName, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_accessoryName, a3);
    double v5 = [(HUHubUnavailableView *)self accessoryName];
    v12 = HULocalizedStringWithFormat(@"HUHubUnavailable_Title", @"%@", v6, v7, v8, v9, v10, v11, (uint64_t)v5);
    v13 = [(HUHubUnavailableView *)self titleLabel];
    [v13 setText:v12];

    LODWORD(v12) = [MEMORY[0x1E4F69758] useWLANInsteadOfWiFi];
    uint64_t v14 = [(HUHubUnavailableView *)self accessoryName];
    v21 = (void *)v14;
    if (v12) {
      HULocalizedStringWithFormat(@"HUHubUnavailable_Description_WLAN", @"%@", v15, v16, v17, v18, v19, v20, v14);
    }
    else {
    id v22 = HULocalizedStringWithFormat(@"HUHubUnavailable_Description_WIFI", @"%@", v15, v16, v17, v18, v19, v20, v14);
    }
    v23 = [(HUHubUnavailableView *)self descriptionLabel];
    [v23 setText:v22];

    [(HUHubUnavailableView *)self setNeedsUpdateConstraints];
  }
}

- (NSString)accessoryName
{
  return self->_accessoryName;
}

- (HUIconView)networkIconView
{
  return self->_networkIconView;
}

- (void)setNetworkIconView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
}

- (NSArray)layoutConstraints
{
  return self->_layoutConstraints;
}

- (void)setLayoutConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutConstraints, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_networkIconView, 0);

  objc_storeStrong((id *)&self->_accessoryName, 0);
}

@end