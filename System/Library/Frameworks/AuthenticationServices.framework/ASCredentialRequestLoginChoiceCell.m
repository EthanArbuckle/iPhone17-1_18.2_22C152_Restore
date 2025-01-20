@interface ASCredentialRequestLoginChoiceCell
- (ASCredentialRequestLoginChoiceCell)initWithLoginChoice:(id)a3 presentationContext:(id)a4 authorizationProvider:(id)a5;
- (BOOL)_shouldUseAppIconImageViewStyle;
- (BOOL)isSelectedLoginChoice;
- (NSString)detailText;
- (NSString)title;
- (UIImage)iconImage;
- (double)_additionalLeadingSeparatorInset;
- (id)_cableIcon;
- (id)_defaultPasskeyIcon;
- (id)_detailTextForExternalPasswordLoginChoice:(id)a3;
- (id)_detailTextForPasswordLoginChoice:(id)a3;
- (id)_detailTextForPasswordLoginChoiceFromKeychain:(id)a3;
- (id)_emptyRadioButtonImage;
- (id)_publicKeyCredentialImageForPresentationContext:(id)a3;
- (id)_selectedRadioButtonImage;
- (id)_subtitleForPublicKeyCredentialAssertion;
- (id)_titleForPublicKeyCredentialAssertionWithName:(id)a3 identifier:(id)a4;
- (void)_configureIconImageStyle;
- (void)_configureImageViewForAppIcon;
- (void)_configureImageViewForSymbolImage;
- (void)_setUpAccessoryImageView;
- (void)_setUpContent;
- (void)_setUpFormat;
- (void)_updateAccessoryImageView;
- (void)_updateLayoutForCurrentContentSizeCategory;
- (void)setDetailText:(id)a3;
- (void)setIconImage:(id)a3;
- (void)setIsSelectedLoginChoice:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation ASCredentialRequestLoginChoiceCell

- (ASCredentialRequestLoginChoiceCell)initWithLoginChoice:(id)a3 presentationContext:(id)a4 authorizationProvider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)ASCredentialRequestLoginChoiceCell;
  v12 = [(ASCredentialRequestLoginChoiceCell *)&v16 initWithStyle:3 reuseIdentifier:0];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_loginChoice, a3);
    objc_storeStrong((id *)&v13->_presentationContext, a4);
    objc_storeStrong((id *)&v13->_authorizationProvider, a5);
    [(ASCredentialRequestLoginChoiceCell *)v13 _setUpFormat];
    [(ASCredentialRequestLoginChoiceCell *)v13 _setUpContent];
    [(ASCredentialRequestLoginChoiceCell *)v13 _setUpAccessoryImageView];
    v14 = v13;
  }

  return v13;
}

- (void)_setUpFormat
{
  v68[2] = *MEMORY[0x263EF8340];
  v3 = +[ASViewServiceInterfaceUtilities cellBackgroundConfiguration];
  [(ASCredentialRequestLoginChoiceCell *)self setBackgroundConfiguration:v3];

  [(ASCredentialRequestLoginChoiceCell *)self setSelectionStyle:0];
  v4 = [(ASCredentialRequestLoginChoiceCell *)self contentView];
  v5 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v5;

  v7 = +[ASViewServiceInterfaceUtilities cellTitleColor];
  [(UILabel *)self->_titleLabel setTextColor:v7];

  v8 = +[ASViewServiceInterfaceUtilities cellTitleFont];
  [(UILabel *)self->_titleLabel setFont:v8];

  [(UILabel *)self->_titleLabel setAdjustsFontSizeToFitWidth:1];
  [(UILabel *)self->_titleLabel setAdjustsFontForContentSizeCategory:1];
  uint64_t v9 = *MEMORY[0x263F83418];
  [(UILabel *)self->_titleLabel setMaximumContentSizeCategory:*MEMORY[0x263F83418]];
  [(UILabel *)self->_titleLabel setMinimumScaleFactor:0.7];
  id v10 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
  detailLabel = self->_detailLabel;
  self->_detailLabel = v10;

  v12 = +[ASViewServiceInterfaceUtilities cellSubtitleColor];
  [(UILabel *)self->_detailLabel setTextColor:v12];

  v13 = +[ASViewServiceInterfaceUtilities cellSubtitleFont];
  [(UILabel *)self->_detailLabel setFont:v13];

  [(UILabel *)self->_detailLabel setAdjustsFontSizeToFitWidth:1];
  [(UILabel *)self->_detailLabel setAdjustsFontForContentSizeCategory:1];
  [(UILabel *)self->_detailLabel setMaximumContentSizeCategory:v9];
  [(UILabel *)self->_detailLabel setMinimumScaleFactor:0.7];
  v14 = (UIImageView *)objc_alloc_init(MEMORY[0x263F82828]);
  iconImageView = self->_iconImageView;
  self->_iconImageView = v14;

  objc_super v16 = +[ASViewServiceInterfaceUtilities cellIconTintColor];
  [(UIImageView *)self->_iconImageView setTintColor:v16];

  [(UIImageView *)self->_iconImageView setClipsToBounds:1];
  +[ASViewServiceInterfaceUtilities cellIconCornerRadius];
  -[UIImageView _setContinuousCornerRadius:](self->_iconImageView, "_setContinuousCornerRadius:");
  v17 = +[ASViewServiceInterfaceUtilities iconBorderColor];
  v18 = [(UIImageView *)self->_iconImageView layer];
  [v18 setBorderColor:v17];

  v19 = +[ASViewServiceInterfaceUtilities cellIconDefaultSymbolConfiguration];
  [(UIImageView *)self->_iconImageView setPreferredSymbolConfiguration:v19];

  id v20 = objc_alloc(MEMORY[0x263F82BF8]);
  v21 = self->_detailLabel;
  v68[0] = self->_titleLabel;
  v68[1] = v21;
  v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v68 count:2];
  v23 = (void *)[v20 initWithArrangedSubviews:v22];

  [v23 setAxis:1];
  [v23 setSpacing:0.0];
  id v24 = objc_alloc(MEMORY[0x263F82BF8]);
  v67[0] = self->_iconImageView;
  v67[1] = v23;
  v62 = v23;
  v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v67 count:2];
  v26 = (UIStackView *)[v24 initWithArrangedSubviews:v25];
  iconAndTextStackView = self->_iconAndTextStackView;
  self->_iconAndTextStackView = v26;

  [(UIStackView *)self->_iconAndTextStackView setTranslatesAutoresizingMaskIntoConstraints:0];
  v63 = v4;
  [v4 addSubview:self->_iconAndTextStackView];
  v28 = [(ASCredentialRequestLoginChoiceCell *)self contentView];
  v29 = [v28 layoutMarginsGuide];

  +[ASViewServiceInterfaceUtilities cellIconSize];
  double v31 = v30;
  double v33 = v32;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    +[ASViewServiceInterfaceUtilities otherAccountsCellIconSize];
    double v31 = v34;
    double v33 = v35;
  }
  v55 = (void *)MEMORY[0x263F08938];
  v60 = [(UIStackView *)self->_iconAndTextStackView leadingAnchor];
  v59 = [v29 leadingAnchor];
  v58 = [v60 constraintEqualToAnchor:v59];
  v66[0] = v58;
  v57 = [(UIStackView *)self->_iconAndTextStackView trailingAnchor];
  v61 = v29;
  v56 = [v29 trailingAnchor];
  v36 = [v57 constraintEqualToAnchor:v56];
  v66[1] = v36;
  v37 = [(UIImageView *)self->_iconImageView widthAnchor];
  v38 = [v37 constraintEqualToConstant:v31];
  v66[2] = v38;
  v39 = [(UIImageView *)self->_iconImageView heightAnchor];
  v40 = [v39 constraintEqualToConstant:v33];
  v66[3] = v40;
  v41 = [(ASCredentialRequestLoginChoiceCell *)self contentView];
  v42 = [v41 heightAnchor];
  +[ASViewServiceInterfaceUtilities tableViewRowHeight];
  v43 = objc_msgSend(v42, "constraintGreaterThanOrEqualToConstant:");
  v66[4] = v43;
  v44 = [MEMORY[0x263EFF8C0] arrayWithObjects:v66 count:5];
  [v55 activateConstraints:v44];

  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    v45 = (void *)MEMORY[0x263F08938];
    v46 = [(UIStackView *)self->_iconAndTextStackView centerYAnchor];
    v47 = v61;
    v48 = [v61 centerYAnchor];
    v49 = [v46 constraintEqualToAnchor:v48];
    v65 = v49;
    v50 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v65 count:1];
    [v45 activateConstraints:v50];
  }
  else
  {
    v51 = (void *)MEMORY[0x263F08938];
    v46 = [(UIStackView *)self->_iconAndTextStackView topAnchor];
    v47 = v61;
    v48 = [v61 topAnchor];
    v49 = [v46 constraintEqualToAnchor:v48];
    v64[0] = v49;
    v50 = [(UIStackView *)self->_iconAndTextStackView bottomAnchor];
    v52 = [v61 bottomAnchor];
    v53 = [v50 constraintEqualToAnchor:v52];
    v64[1] = v53;
    v54 = [MEMORY[0x263EFF8C0] arrayWithObjects:v64 count:2];
    [v51 activateConstraints:v54];
  }
  [(ASCredentialRequestLoginChoiceCell *)self _updateLayoutForCurrentContentSizeCategory];
}

- (UIImage)iconImage
{
  return [(UIImageView *)self->_iconImageView image];
}

- (void)setIconImage:(id)a3
{
}

- (void)_configureImageViewForSymbolImage
{
  [(UIImageView *)self->_iconImageView setContentMode:4];
  v3 = +[ASViewServiceInterfaceUtilities cellIconBackgroundColor];
  [(UIImageView *)self->_iconImageView setBackgroundColor:v3];

  +[ASViewServiceInterfaceUtilities iconBorderWidth];
  double v5 = v4;
  id v6 = [(UIImageView *)self->_iconImageView layer];
  [v6 setBorderWidth:v5];
}

- (void)_configureImageViewForAppIcon
{
  [(UIImageView *)self->_iconImageView setContentMode:1];
  [(UIImageView *)self->_iconImageView setBackgroundColor:0];
  +[ASViewServiceInterfaceUtilities iconBorderWidth];
  double v4 = v3;
  id v5 = [(UIImageView *)self->_iconImageView layer];
  [v5 setBorderWidth:v4];
}

- (BOOL)_shouldUseAppIconImageViewStyle
{
  if (![(ASCLoginChoiceProtocol *)self->_loginChoice loginChoiceKind]) {
    return 1;
  }
  if ([(ASCLoginChoiceProtocol *)self->_loginChoice loginChoiceKind] != 1) {
    return 0;
  }
  loginChoice = self->_loginChoice;

  return [(ASCLoginChoiceProtocol *)loginChoice isExternal];
}

- (void)_configureIconImageStyle
{
  if ([(ASCredentialRequestLoginChoiceCell *)self _shouldUseAppIconImageViewStyle])
  {
    [(ASCredentialRequestLoginChoiceCell *)self _configureImageViewForAppIcon];
  }
  else
  {
    [(ASCredentialRequestLoginChoiceCell *)self _configureImageViewForSymbolImage];
  }
}

- (void)_setUpContent
{
  [(ASCredentialRequestLoginChoiceCell *)self _configureIconImageStyle];
  switch([(ASCLoginChoiceProtocol *)self->_loginChoice loginChoiceKind])
  {
    case 0:
      double v3 = [(ASCLoginChoiceProtocol *)self->_loginChoice user];
      [(ASCredentialRequestLoginChoiceCell *)self setTitle:v3];

      double v4 = [(AKASAuthorizationProvider *)self->_authorizationProvider loginRowData];
      id v5 = [v4 loginRowDetailText];
      [(ASCredentialRequestLoginChoiceCell *)self setDetailText:v5];

      v57 = [(AKASAuthorizationProvider *)self->_authorizationProvider loginRowData];
      uint64_t v6 = [(ASCLoginChoiceProtocol *)v57 loginRowIconImage];
      goto LABEL_29;
    case 1:
      v58 = [(ASCLoginChoiceProtocol *)self->_loginChoice username];
      if ([(ASCLoginChoiceProtocol *)v58 length])
      {
        v7 = v58;
      }
      else
      {
        uint64_t v32 = _WBSLocalizedString();

        double v33 = [MEMORY[0x263F825C8] tertiaryLabelColor];
        [(UILabel *)self->_titleLabel setTextColor:v33];

        v7 = (ASCLoginChoiceProtocol *)v32;
      }
      v57 = v7;
      [(ASCredentialRequestLoginChoiceCell *)self setTitle:v7];
      double v34 = [(ASCredentialRequestLoginChoiceCell *)self _detailTextForPasswordLoginChoice:self->_loginChoice];
      [(ASCredentialRequestLoginChoiceCell *)self setDetailText:v34];

      uint64_t v6 = +[ASCredentialRequestIconGenerator iconForPasswordLoginChoice:self->_loginChoice presentationContext:self->_presentationContext];
      goto LABEL_29;
    case 2:
      v57 = self->_loginChoice;
      v8 = [(ASCLoginChoiceProtocol *)v57 externalCredentialProviderBundleID];

      if (v8)
      {
        uint64_t v9 = [(ASCLoginChoiceProtocol *)v57 externalCredentialProviderBundleID];
        +[ASViewServiceInterfaceUtilities cellIconSize];
        id v10 = +[ASCredentialRequestIconGenerator iconForApplicationIdentifier:size:](ASCredentialRequestIconGenerator, "iconForApplicationIdentifier:size:", v9);
        [(ASCredentialRequestLoginChoiceCell *)self setIconImage:v10];
      }
      else
      {
        uint64_t v9 = +[ASCredentialRequestIconGenerator systemPasskeyIcon];
        [(ASCredentialRequestLoginChoiceCell *)self setIconImage:v9];
      }

      if ([(ASCLoginChoiceProtocol *)v57 isRegistrationRequest])
      {
        if ([(ASCAuthorizationPresentationContext *)self->_presentationContext shouldUseFallbackPasskeyUI])
        {
          [MEMORY[0x263F29440] biometryType];
LABEL_24:
          id v24 = _WBSLocalizedString();
          [(ASCredentialRequestLoginChoiceCell *)self setTitle:v24];

          goto LABEL_13;
        }
        if (!v8) {
          goto LABEL_24;
        }
        double v35 = [(ASCLoginChoiceProtocol *)v57 externalCredentialProviderName];
        [(ASCredentialRequestLoginChoiceCell *)self setTitle:v35];

        v29 = NSString;
        double v30 = _WBSLocalizedString();
        uint64_t v31 = [(ASCLoginChoiceProtocol *)v57 externalCredentialProviderName];
        goto LABEL_32;
      }
      v25 = [(ASCLoginChoiceProtocol *)v57 userVisibleName];
      v26 = [(ASCLoginChoiceProtocol *)v57 identifier];
      v27 = [(ASCredentialRequestLoginChoiceCell *)self _titleForPublicKeyCredentialAssertionWithName:v25 identifier:v26];
      [(ASCredentialRequestLoginChoiceCell *)self setTitle:v27];

      char v28 = [(ASCAuthorizationPresentationContext *)self->_presentationContext shouldUseFallbackPasskeyUI];
      v29 = NSString;
      if (v28)
      {
        double v30 = _WBSLocalizedString();
        uint64_t v31 = [(ASCAuthorizationPresentationContext *)self->_presentationContext serviceName];
LABEL_32:
        v36 = (void *)v31;
        v37 = objc_msgSend(v29, "stringWithFormat:", v30, v31);
        [(ASCredentialRequestLoginChoiceCell *)self setDetailText:v37];

LABEL_53:
        goto LABEL_54;
      }
      v38 = _WBSLocalizedString();
      v39 = [(ASCLoginChoiceProtocol *)v57 relyingPartyIdentifier];
      v40 = v39;
      if (!v39)
      {
        v40 = [(ASCAuthorizationPresentationContext *)self->_presentationContext serviceName];
      }
      v41 = objc_msgSend(v29, "localizedStringWithFormat:", v38, v40);
      [(ASCredentialRequestLoginChoiceCell *)self setDetailText:v41];

      if (!v39) {
      if ([(ASCLoginChoiceProtocol *)v57 isSharedCredential])
      }
      {
        v42 = NSString;
        v43 = _WBSLocalizedString();
        v44 = [(ASCLoginChoiceProtocol *)v57 relyingPartyIdentifier];
        v45 = v44;
        if (!v44)
        {
          v45 = [(ASCAuthorizationPresentationContext *)self->_presentationContext serviceName];
        }
        v46 = objc_msgSend(v42, "localizedStringWithFormat:", v43, v45);
        [(ASCredentialRequestLoginChoiceCell *)self setDetailText:v46];

        if (!v44) {
      }
        }
      v47 = [(ASCLoginChoiceProtocol *)v57 customTitle];
      uint64_t v48 = [v47 length];

      if (v48)
      {
        v49 = NSString;
        double v30 = [(ASCLoginChoiceProtocol *)v57 customTitle];
        v50 = [(ASCLoginChoiceProtocol *)v57 relyingPartyIdentifier];
        v51 = v50;
        if (!v50)
        {
          v51 = [(ASCAuthorizationPresentationContext *)self->_presentationContext serviceName];
        }
        v52 = [v49 stringWithFormat:@"%@ — %@", v30, v51];
        [(ASCredentialRequestLoginChoiceCell *)self setDetailText:v52];

        if (!v50) {
        goto LABEL_53;
        }
      }
LABEL_54:

      return;
    case 3:
      v57 = self->_loginChoice;
      uint64_t v11 = [(ASCLoginChoiceProtocol *)v57 credentialKind];
      if (v11) {
        BOOL v12 = v11 == 2;
      }
      else {
        BOOL v12 = 1;
      }
      if (v12)
      {
        v13 = +[ASCredentialRequestIconGenerator systemSecurityKeysIcon];
        [(ASCredentialRequestLoginChoiceCell *)self setIconImage:v13];

        v14 = _WBSLocalizedString();
        [(ASCredentialRequestLoginChoiceCell *)self setTitle:v14];

LABEL_13:
        uint64_t v15 = _WBSLocalizedString();
      }
      else
      {
        if (v11 != 1) {
          goto LABEL_54;
        }
        v23 = [(ASCredentialRequestLoginChoiceCell *)self _publicKeyCredentialImageForPresentationContext:self->_presentationContext];
        if (v23)
        {
          [(ASCredentialRequestLoginChoiceCell *)self setIconImage:v23];
        }
        else
        {
          v53 = +[ASCredentialRequestIconGenerator systemSecurityKeysIcon];
          [(ASCredentialRequestLoginChoiceCell *)self setIconImage:v53];
        }
        v54 = [(ASCLoginChoiceProtocol *)v57 name];
        v55 = [(ASCLoginChoiceProtocol *)v57 identifier];
        v56 = [(ASCredentialRequestLoginChoiceCell *)self _titleForPublicKeyCredentialAssertionWithName:v54 identifier:v55];
        [(ASCredentialRequestLoginChoiceCell *)self setTitle:v56];

        uint64_t v15 = [(ASCredentialRequestLoginChoiceCell *)self _subtitleForPublicKeyCredentialAssertion];
      }
      double v30 = (void *)v15;
      [(ASCredentialRequestLoginChoiceCell *)self setDetailText:v15];
      goto LABEL_53;
    case 4:
      objc_super v16 = _WBSLocalizedString();
      [(ASCredentialRequestLoginChoiceCell *)self setTitle:v16];

      v17 = [(ASCredentialRequestLoginChoiceCell *)self _cableIcon];
      [(ASCredentialRequestLoginChoiceCell *)self setIconImage:v17];

      [(ASCAuthorizationPresentationContext *)self->_presentationContext shouldUseFallbackPasskeyUI];
      [(ASCAuthorizationPresentationContext *)self->_presentationContext isRegistrationRequest];
      _WBSLocalizedString();
      v57 = (ASCLoginChoiceProtocol *)objc_claimAutoreleasedReturnValue();
      [(ASCredentialRequestLoginChoiceCell *)self setDetailText:v57];
      goto LABEL_54;
    case 5:
      v18 = _WBSLocalizedString();
      [(ASCredentialRequestLoginChoiceCell *)self setTitle:v18];

      +[ASViewServiceInterfaceUtilities otherAccountsCellIconSize];
      +[ASCredentialRequestIconGenerator passwordManagerIconWithSize:](ASCredentialRequestIconGenerator, "passwordManagerIconWithSize:");
      v57 = (ASCLoginChoiceProtocol *)objc_claimAutoreleasedReturnValue();
      [(ASCredentialRequestLoginChoiceCell *)self setIconImage:v57];
      goto LABEL_54;
    case 6:
      v19 = NSString;
      id v20 = self->_loginChoice;
      v21 = [(ASCLoginChoiceProtocol *)v20 providerName];
      v22 = [v19 stringWithFormat:@"%@…", v21];
      [(ASCredentialRequestLoginChoiceCell *)self setTitle:v22];

      v57 = [(ASCLoginChoiceProtocol *)v20 providerExtensionContainingAppBundleID];

      +[ASViewServiceInterfaceUtilities otherAccountsCellIconSize];
      uint64_t v6 = +[ASCredentialRequestIconGenerator iconForApplicationIdentifier:size:](ASCredentialRequestIconGenerator, "iconForApplicationIdentifier:size:", v57);
LABEL_29:
      double v30 = (void *)v6;
      [(ASCredentialRequestLoginChoiceCell *)self setIconImage:v6];
      goto LABEL_53;
    default:
      return;
  }
}

- (id)_publicKeyCredentialImageForPresentationContext:(id)a3
{
  return +[ASCredentialRequestIconGenerator iconForPublicKeyCredentialLoginChoiceWithPresentationContext:a3];
}

- (id)_titleForPublicKeyCredentialAssertionWithName:(id)a3 identifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length])
  {
    id v7 = v5;
  }
  else
  {
    v8 = [v6 credentialID];
    unint64_t v9 = [v8 length];
    if (v9 >= 6) {
      uint64_t v10 = 6;
    }
    else {
      uint64_t v10 = v9;
    }
    uint64_t v11 = NSString;
    BOOL v12 = _WBSLocalizedString();
    v13 = objc_msgSend(v8, "substringWithRange:", 0, v10);
    objc_msgSend(v11, "stringWithFormat:", v12, v13);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)_subtitleForPublicKeyCredentialAssertion
{
  [(ASCAuthorizationPresentationContext *)self->_presentationContext appIdentifier];

  v2 = _WBSLocalizedString();

  return v2;
}

- (NSString)title
{
  return [(UILabel *)self->_titleLabel text];
}

- (void)setTitle:(id)a3
{
}

- (NSString)detailText
{
  return [(UILabel *)self->_detailLabel text];
}

- (void)setDetailText:(id)a3
{
}

- (void)setIsSelectedLoginChoice:(BOOL)a3
{
  if (self->_isSelectedLoginChoice != a3)
  {
    self->_isSelectedLoginChoice = a3;
    [(ASCredentialRequestLoginChoiceCell *)self _updateAccessoryImageView];
  }
}

- (id)_detailTextForPasswordLoginChoice:(id)a3
{
  id v4 = a3;
  id v5 = [(ASCLoginChoiceProtocol *)self->_loginChoice site];
  if ([(ASCAuthorizationPresentationContext *)self->_presentationContext hasExternalPasswords])
  {
    if ([v4 isExternal]) {
      [(ASCredentialRequestLoginChoiceCell *)self _detailTextForExternalPasswordLoginChoice:v4];
    }
    else {
    uint64_t v10 = [(ASCredentialRequestLoginChoiceCell *)self _detailTextForPasswordLoginChoiceFromKeychain:v4];
    }
  }
  else
  {
    id v6 = [v4 customTitle];
    uint64_t v7 = [v6 length];

    if (v7)
    {
      v8 = NSString;
      unint64_t v9 = [v4 customTitle];
      [v8 stringWithFormat:@"%@ — %@", v9, v5];
    }
    else
    {
      uint64_t v11 = [v4 groupName];
      [v11 length];

      BOOL v12 = NSString;
      unint64_t v9 = _WBSLocalizedString();
      objc_msgSend(v12, "localizedStringWithFormat:", v9, v5);
    uint64_t v10 = };
  }

  return v10;
}

- (id)_detailTextForPasswordLoginChoiceFromKeychain:(id)a3
{
  double v3 = NSString;
  id v4 = [a3 site];
  id v5 = _WBSLocalizedString();
  id v6 = [v3 stringWithFormat:@"%@ — %@", v4, v5];

  return v6;
}

- (id)_detailTextForExternalPasswordLoginChoice:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x263F01890];
  id v5 = [v3 providerBundleIdentifier];
  id v14 = 0;
  id v6 = [v4 bundleRecordWithBundleIdentifier:v5 allowPlaceholder:0 error:&v14];
  id v7 = v14;

  if (v6)
  {
    v8 = NSString;
    unint64_t v9 = [v3 site];
    uint64_t v10 = [v6 localizedName];
    uint64_t v11 = [v8 stringWithFormat:@"%@ — %@", v9, v10];
  }
  else
  {
    BOOL v12 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ASCredentialRequestLoginChoiceCell _detailTextForExternalPasswordLoginChoice:](v12, v7);
    }
    uint64_t v11 = 0;
  }

  return v11;
}

- (id)_cableIcon
{
  v2 = [MEMORY[0x263F827E8] systemImageNamed:@"qrcode.viewfinder"];
  id v3 = objc_msgSend(v2, "imageWithAlignmentRectInsets:", *MEMORY[0x263F834E8], *(double *)(MEMORY[0x263F834E8] + 8), *(double *)(MEMORY[0x263F834E8] + 16), *(double *)(MEMORY[0x263F834E8] + 24));

  return v3;
}

- (id)_defaultPasskeyIcon
{
  return +[ASCredentialRequestIconGenerator passwordManagerIcon];
}

- (void)_setUpAccessoryImageView
{
  id v3 = objc_alloc(MEMORY[0x263F82828]);
  id v4 = [(ASCredentialRequestLoginChoiceCell *)self _emptyRadioButtonImage];
  id v6 = (id)[v3 initWithImage:v4];

  id v5 = [MEMORY[0x263F82818] configurationWithPointSize:20.0];
  [v6 setPreferredSymbolConfiguration:v5];

  [v6 sizeToFit];
  [(ASCredentialRequestLoginChoiceCell *)self setAccessoryView:v6];
}

- (void)_updateAccessoryImageView
{
  id v4 = [(ASCredentialRequestLoginChoiceCell *)self accessoryView];
  if (self->_isSelectedLoginChoice) {
    [(ASCredentialRequestLoginChoiceCell *)self _selectedRadioButtonImage];
  }
  else {
  id v3 = [(ASCredentialRequestLoginChoiceCell *)self _emptyRadioButtonImage];
  }
  [v4 setImage:v3];
}

- (id)_emptyRadioButtonImage
{
  v2 = [MEMORY[0x263F827E8] systemImageNamed:@"circle"];
  id v3 = [MEMORY[0x263F825C8] systemFillColor];
  id v4 = [v2 imageWithTintColor:v3 renderingMode:1];

  return v4;
}

- (id)_selectedRadioButtonImage
{
  v2 = [MEMORY[0x263F827E8] systemImageNamed:@"checkmark.circle.fill"];
  id v3 = [MEMORY[0x263F825C8] systemBlueColor];
  id v4 = [v2 imageWithTintColor:v3 renderingMode:1];

  return v4;
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ASCredentialRequestLoginChoiceCell;
  id v4 = a3;
  [(ASCredentialRequestLoginChoiceCell *)&v8 traitCollectionDidChange:v4];
  id v5 = [(ASCredentialRequestLoginChoiceCell *)self traitCollection];
  id v6 = [v5 preferredContentSizeCategory];
  id v7 = [v4 preferredContentSizeCategory];

  LOBYTE(v4) = [v6 isEqualToString:v7];
  if ((v4 & 1) == 0) {
    [(ASCredentialRequestLoginChoiceCell *)self _updateLayoutForCurrentContentSizeCategory];
  }
}

- (void)_updateLayoutForCurrentContentSizeCategory
{
  id v3 = [(ASCredentialRequestLoginChoiceCell *)self traitCollection];
  id v4 = [v3 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  if (IsAccessibilityCategory) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = 3;
  }
  [(UILabel *)self->_titleLabel setNumberOfLines:v6];
  [(UILabel *)self->_detailLabel setNumberOfLines:v6];
  if ([(ASCLoginChoiceProtocol *)self->_loginChoice loginChoiceKind] == 6) {
    [(UILabel *)self->_titleLabel setNumberOfLines:1];
  }
  [(UIStackView *)self->_iconAndTextStackView setAxis:IsAccessibilityCategory];
  if (IsAccessibilityCategory) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = 3;
  }
  [(UIStackView *)self->_iconAndTextStackView setAlignment:v7];
  if (IsAccessibilityCategory)
  {
    [(UIStackView *)self->_iconAndTextStackView setSpacing:1.17549435e-38];
    double v8 = 0.0;
  }
  else
  {
    +[ASViewServiceInterfaceUtilities cellIconMarginTrailing];
    -[UIStackView setSpacing:](self->_iconAndTextStackView, "setSpacing:");
    [(ASCredentialRequestLoginChoiceCell *)self _additionalLeadingSeparatorInset];
    double v8 = v9;
  }

  -[ASCredentialRequestLoginChoiceCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, v8, 0.0, 0.0);
}

- (double)_additionalLeadingSeparatorInset
{
  +[ASViewServiceInterfaceUtilities cellIconMarginTrailing];
  double v3 = v2;
  +[ASViewServiceInterfaceUtilities cellIconSize];
  return v3 + v4;
}

- (BOOL)isSelectedLoginChoice
{
  return self->_isSelectedLoginChoice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconAndTextStackView, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_authorizationProvider, 0);
  objc_storeStrong((id *)&self->_presentationContext, 0);

  objc_storeStrong((id *)&self->_loginChoice, 0);
}

- (void)_detailTextForExternalPasswordLoginChoice:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  double v3 = a1;
  double v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v5 = 138543362;
  uint64_t v6 = v4;
  _os_log_error_impl(&dword_21918F000, v3, OS_LOG_TYPE_ERROR, "Could not get bundle record to fetch password manager name error: %{public}@.", (uint8_t *)&v5, 0xCu);
}

@end