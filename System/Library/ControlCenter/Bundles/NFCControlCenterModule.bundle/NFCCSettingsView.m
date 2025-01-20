@interface NFCCSettingsView
- (NFCCPillButton)turnOnNFCButton;
- (NFCCSettingsView)initWithFrame:(CGRect)a3;
- (void)_contentSizeCategoryDidChange;
- (void)_setUp;
- (void)didMoveToWindow;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateOrientationIfNeeded;
@end

@implementation NFCCSettingsView

- (NFCCSettingsView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NFCCSettingsView;
  v3 = -[NFCCSettingsView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(NFCCSettingsView *)v3 _setUp];
    v5 = v4;
  }

  return v4;
}

- (void)_setUp
{
  id v3 = objc_alloc((Class)UIView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  objc_super v7 = (UIView *)objc_msgSend(v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  contentView = self->_contentView;
  self->_contentView = v7;

  [(UIView *)self->_contentView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(NFCCSettingsView *)self addSubview:self->_contentView];
  v9 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v9;

  v11 = _BCSLocalizedString();
  [(UILabel *)self->_titleLabel setText:v11];

  [(UILabel *)self->_titleLabel setNumberOfLines:0];
  [(UILabel *)self->_titleLabel setTextAlignment:1];
  [(UILabel *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_contentView addSubview:self->_titleLabel];
  v12 = -[NFCCPillButton initWithFrame:]([NFCCPillButton alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  turnOnNFCButton = self->_turnOnNFCButton;
  self->_turnOnNFCButton = v12;

  v14 = _BCSLocalizedString();
  v15 = [(NFCCPillButton *)self->_turnOnNFCButton titleLabel];
  [v15 setText:v14];

  [(NFCCPillButton *)self->_turnOnNFCButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_contentView addSubview:self->_turnOnNFCButton];
  [(NFCCSettingsView *)self _contentSizeCategoryDidChange];
  v55 = [(UIView *)self->_contentView leadingAnchor];
  v54 = [(NFCCSettingsView *)self leadingAnchor];
  v53 = [v55 constraintEqualToAnchor:v54 constant:16.0];
  v56[0] = v53;
  v52 = [(UIView *)self->_contentView topAnchor];
  v51 = [(NFCCSettingsView *)self topAnchor];
  v50 = [v52 constraintGreaterThanOrEqualToAnchor:v51 constant:16.0];
  v56[1] = v50;
  v49 = [(NFCCSettingsView *)self trailingAnchor];
  v48 = [(UIView *)self->_contentView trailingAnchor];
  v47 = [v49 constraintEqualToAnchor:v48 constant:16.0];
  v56[2] = v47;
  v46 = [(NFCCSettingsView *)self bottomAnchor];
  v45 = [(UIView *)self->_contentView bottomAnchor];
  v44 = [v46 constraintGreaterThanOrEqualToAnchor:v45 constant:16.0];
  v56[3] = v44;
  v43 = [(UIView *)self->_contentView centerYAnchor];
  v42 = [(NFCCSettingsView *)self centerYAnchor];
  v41 = [v43 constraintEqualToAnchor:v42];
  v56[4] = v41;
  v40 = [(UILabel *)self->_titleLabel topAnchor];
  v39 = [(UIView *)self->_contentView topAnchor];
  v38 = [v40 constraintEqualToAnchor:v39];
  v56[5] = v38;
  v37 = [(UILabel *)self->_titleLabel leadingAnchor];
  v36 = [(UIView *)self->_contentView leadingAnchor];
  v35 = [v37 constraintEqualToAnchor:v36];
  v56[6] = v35;
  v34 = [(UIView *)self->_contentView trailingAnchor];
  v33 = [(UILabel *)self->_titleLabel trailingAnchor];
  v32 = [v34 constraintEqualToAnchor:v33];
  v56[7] = v32;
  v31 = [(NFCCPillButton *)self->_turnOnNFCButton centerXAnchor];
  v30 = [(UIView *)self->_contentView centerXAnchor];
  v29 = [v31 constraintEqualToAnchor:v30];
  v56[8] = v29;
  v28 = [(NFCCPillButton *)self->_turnOnNFCButton leadingAnchor];
  v27 = [(UIView *)self->_contentView leadingAnchor];
  v26 = [v28 constraintGreaterThanOrEqualToAnchor:v27];
  v56[9] = v26;
  v25 = [(NFCCPillButton *)self->_turnOnNFCButton topAnchor];
  v16 = [(UILabel *)self->_titleLabel lastBaselineAnchor];
  v17 = [v25 constraintEqualToAnchor:v16 constant:24.0];
  v56[10] = v17;
  v18 = [(UIView *)self->_contentView trailingAnchor];
  v19 = [(NFCCPillButton *)self->_turnOnNFCButton trailingAnchor];
  v20 = [v18 constraintGreaterThanOrEqualToAnchor:v19];
  v56[11] = v20;
  v21 = [(UIView *)self->_contentView bottomAnchor];
  v22 = [(NFCCPillButton *)self->_turnOnNFCButton bottomAnchor];
  v23 = [v21 constraintEqualToAnchor:v22];
  v56[12] = v23;
  v24 = +[NSArray arrayWithObjects:v56 count:13];
  +[NSLayoutConstraint activateConstraints:v24];
}

- (void)didMoveToWindow
{
  v6.receiver = self;
  v6.super_class = (Class)NFCCSettingsView;
  [(NFCCSettingsView *)&v6 didMoveToWindow];
  id v3 = [(NFCCSettingsView *)self window];

  if (v3)
  {
    v4 = [(NFCCSettingsView *)self visualStylingProviderForCategory:1];
    visualStylingProvider = self->_visualStylingProvider;
    if (v4 != visualStylingProvider)
    {
      [(MTVisualStylingProvider *)visualStylingProvider stopAutomaticallyUpdatingView:self->_titleLabel];
      objc_storeStrong((id *)&self->_visualStylingProvider, v4);
      [(MTVisualStylingProvider *)self->_visualStylingProvider automaticallyUpdateView:self->_titleLabel withStyle:1];
    }
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NFCCSettingsView;
  id v4 = a3;
  [(NFCCSettingsView *)&v9 traitCollectionDidChange:v4];
  v5 = objc_msgSend(v4, "preferredContentSizeCategory", v9.receiver, v9.super_class);

  objc_super v6 = [(NFCCSettingsView *)self traitCollection];
  objc_super v7 = [v6 preferredContentSizeCategory];
  unsigned __int8 v8 = [v5 isEqualToString:v7];

  if ((v8 & 1) == 0) {
    [(NFCCSettingsView *)self _contentSizeCategoryDidChange];
  }
}

- (void)updateOrientationIfNeeded
{
  id interfaceOrientation = self->_interfaceOrientation;
  if (interfaceOrientation != [UIApp activeInterfaceOrientation]) {
    [(NFCCSettingsView *)self _contentSizeCategoryDidChange];
  }
  turnOnNFCButton = self->_turnOnNFCButton;

  [(NFCCPillButton *)turnOnNFCButton updateOrientationIfNeeded];
}

- (void)_contentSizeCategoryDidChange
{
  id v3 = [(NFCCSettingsView *)self traitCollection];
  id v8 = [v3 preferredContentSizeCategory];

  id v4 = [UIApp activeInterfaceOrientation];
  self->_id interfaceOrientation = (int64_t)v4;
  if (sub_780C((NSString *)v8, (uint64_t)v4))
  {
    v5 = UIContentSizeCategoryAccessibilityLarge;

    objc_super v6 = v5;
  }
  else
  {
    objc_super v6 = (NSString *)v8;
  }
  objc_super v9 = v6;
  objc_super v7 = +[UIFont bsui_preferredFontForTextStyle:UIFontTextStyleBody hiFontStyle:8 contentSizeCategory:v6];
  [(UILabel *)self->_titleLabel setFont:v7];
}

- (NFCCPillButton)turnOnNFCButton
{
  return self->_turnOnNFCButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_turnOnNFCButton, 0);
  objc_storeStrong((id *)&self->_visualStylingProvider, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_contentView, 0);
}

@end