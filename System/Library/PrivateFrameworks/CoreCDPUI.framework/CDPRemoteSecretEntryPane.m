@interface CDPRemoteSecretEntryPane
- (BOOL)remoteAccountRecovery;
- (CDPDevice)device;
- (CDPRemoteSecretEntryPane)initWithFrame:(CGRect)a3;
- (CDPRemoteValidationEscapeOffer)escapeOffer;
- (double)_scaledFooterPadding;
- (double)keyboardHeightOffset;
- (id)_createFooterButton;
- (id)_headerStringForDevice:(id)a3 localDeviceClass:(id)a4;
- (unint64_t)remoteSecretType;
- (void)didFinishResizingHeaderView;
- (void)didFinishResizingPinView;
- (void)setDevice:(id)a3;
- (void)setEscapeOffer:(id)a3;
- (void)setRemoteAccountRecovery:(BOOL)a3;
- (void)setRemoteSecretType:(unint64_t)a3;
- (void)setTitle:(id)a3;
@end

@implementation CDPRemoteSecretEntryPane

- (CDPRemoteSecretEntryPane)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CDPRemoteSecretEntryPane;
  v3 = -[CDPPassphraseEntryPane initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    containerView = v3->super._containerView;
    v6 = [(CDPRemoteSecretEntryPane *)v3 _createFooterButton];
    [(UIScrollView *)containerView addSubview:v6];
  }
  return v4;
}

- (double)keyboardHeightOffset
{
  v3 = (void *)MEMORY[0x263F828A0];
  v4 = [(PSEditingPane *)self viewController];
  objc_msgSend(v3, "sizeForInterfaceOrientation:", objc_msgSend(v4, "interfaceOrientation"));
  double v29 = v5;

  v6 = [(PSEditingPane *)self viewController];
  v7 = [v6 view];
  objc_super v8 = [(PSEditingPane *)self viewController];
  v9 = [v8 view];
  [v9 bounds];
  objc_msgSend(v7, "convertRect:toView:", 0);
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;

  v18 = [MEMORY[0x263F82B60] mainScreen];
  [v18 bounds];
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  CGFloat v26 = v25;

  v30.origin.x = v20;
  v30.origin.y = v22;
  v30.size.width = v24;
  v30.size.height = v26;
  double MaxY = CGRectGetMaxY(v30);
  v31.origin.x = v11;
  v31.origin.y = v13;
  v31.size.width = v15;
  v31.size.height = v17;
  return fmax(v29 - (MaxY - CGRectGetMaxY(v31)), 0.0);
}

- (id)_createFooterButton
{
  v3 = [MEMORY[0x263F824E8] buttonWithType:1];
  footerButton = self->_footerButton;
  self->_footerButton = v3;

  double v5 = [(UIButton *)self->_footerButton titleLabel];
  [v5 setNumberOfLines:0];

  v6 = [(UIButton *)self->_footerButton titleLabel];
  [v6 setTextAlignment:1];

  v7 = [(UIButton *)self->_footerButton titleLabel];
  objc_super v8 = (void *)MEMORY[0x263F81708];
  uint64_t v9 = *MEMORY[0x263F83570];
  double v10 = [MEMORY[0x263F82B60] mainScreen];
  CGFloat v11 = [v10 traitCollection];
  double v12 = [v8 preferredFontForTextStyle:v9 compatibleWithTraitCollection:v11];
  [v7 setFont:v12];

  [(UIButton *)self->_footerButton setAutoresizingMask:12];
  CGFloat v13 = self->_footerButton;

  return v13;
}

- (void)setEscapeOffer:(id)a3
{
  id v8 = a3;
  p_escapeOffer = &self->_escapeOffer;
  [(UIButton *)self->_footerButton removeTarget:self->_escapeOffer action:sel_handleEscapeAction_ forControlEvents:64];
  if (v8)
  {
    objc_storeStrong((id *)&self->_escapeOffer, a3);
    [(UIButton *)self->_footerButton addTarget:*p_escapeOffer action:sel_handleEscapeAction_ forControlEvents:64];
    footerButton = self->_footerButton;
    v7 = [(CDPRemoteValidationEscapeOffer *)*p_escapeOffer escapeOfferName];
    [(UIButton *)footerButton setTitle:v7 forState:0];
  }
  else
  {
    [(UIButton *)self->_footerButton removeFromSuperview];
  }
}

- (void)setRemoteSecretType:(unint64_t)a3
{
  self->_remoteSecretType = a3;
}

- (void)setTitle:(id)a3
{
  headerView = self->super._headerView;
  id v4 = a3;
  id v5 = [(CDPPaneHeaderView *)headerView detailTextLabel];
  [v5 setText:v4];
}

- (void)didFinishResizingHeaderView
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 552) bounds];
  v3 = NSStringFromCGRect(v7);
  int v4 = 138412290;
  id v5 = v3;
  _os_log_debug_impl(&dword_2187CF000, a2, OS_LOG_TYPE_DEBUG, "Available frame for remote secret view: %@", (uint8_t *)&v4, 0xCu);
}

- (void)didFinishResizingPinView
{
  [(CDPRemoteSecretEntryPane *)self _scaledFooterPadding];
  double v4 = v3;
  [(UIButton *)self->_footerButton frame];
  CGFloat v42 = v6;
  CGFloat v43 = v5;
  CGRect v7 = [(UIButton *)self->_footerButton titleLabel];
  [(CDPRemoteSecretEntryPane *)self frame];
  objc_msgSend(v7, "sizeThatFits:", CGRectGetWidth(v45), 1.79769313e308);
  double v40 = v9;
  double v41 = v8;
  double v10 = v9;

  uint64_t v11 = (int)*MEMORY[0x263F5FD40];
  double v12 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + v11) superview];
  [v12 frame];
  double v14 = v13;
  double v16 = v15;
  CGFloat v18 = v17;
  double v39 = v17;
  double v20 = v19;

  v46.origin.x = v14;
  v46.origin.y = v16;
  v46.size.width = v18;
  v46.size.height = v20;
  double Height = CGRectGetHeight(v46);
  [(CDPPassphraseEntryPane *)self desiredMinPinHeight];
  double v23 = v22;
  CGFloat v24 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + v11) superview];
  double v25 = v24;
  double v26 = 0.0;
  if (Height > v23) {
    double v26 = v4 + v10;
  }
  double v27 = v20 - v26;
  if (Height <= v23) {
    double v4 = 8.0;
  }
  double v28 = v14;
  objc_msgSend(v24, "setFrame:", v14, v16, v39, v27);

  double v29 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v11);
  CGRect v30 = [v29 superview];
  [v30 bounds];
  objc_msgSend(v29, "setFrame:");

  [(UIScrollView *)self->super._containerView bounds];
  double MidX = CGRectGetMidX(v47);
  v48.origin.y = v42;
  v48.origin.x = v43;
  v48.size.width = v41;
  v48.size.height = v40;
  CGFloat v32 = MidX + CGRectGetWidth(v48) * -0.5;
  -[CDPRemoteSecretEntryPane _footerRectY:](self, "_footerRectY:", v28, v16, v39, v27);
  CGFloat v34 = v33;
  -[UIButton setFrame:](self->_footerButton, "setFrame:", v32, v33, v41, v40);
  v49.origin.x = v32;
  v49.origin.y = v34;
  v49.size.width = v41;
  v49.size.height = v40;
  -[UIScrollView setContentSize:](self->super._containerView, "setContentSize:", 0.0, v4 + CGRectGetMaxY(v49) + self->super._keyboardOffset);
  v35 = [(UIButton *)self->_footerButton superview];

  if (v35)
  {
    [*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FD48]) frame];
    CGFloat v36 = CGRectGetMaxY(v50) + self->super._keyboardOffset;
    containerView = self->super._containerView;
    [(UIScrollView *)containerView frame];
    double v38 = fmax(v36 - CGRectGetHeight(v51), 0.0);
    -[UIScrollView setContentOffset:](containerView, "setContentOffset:", 0.0, v38);
  }
}

- (double)_scaledFooterPadding
{
  if ([(CDPPassphraseEntryPane *)self isSmallScreen]) {
    double v2 = 8.0;
  }
  else {
    double v2 = 24.0;
  }
  double v3 = [MEMORY[0x263F82770] metricsForTextStyle:*MEMORY[0x263F83570]];
  [v3 scaledValueForValue:v2];
  double v5 = v4;

  return v5;
}

- (void)setDevice:(id)a3
{
  id v28 = a3;
  objc_storeStrong((id *)&self->_device, a3);
  double v5 = [v28 modelClass];
  uint64_t v6 = [v5 length];

  if (v6)
  {
    CGRect v7 = [MEMORY[0x263F343A8] sharedInstance];
    double v8 = [v7 deviceClass];

    double v9 = [(CDPRemoteSecretEntryPane *)self _headerStringForDevice:v28 localDeviceClass:v8];
    double v10 = NSString;
    uint64_t v11 = [v28 modelClass];
    double v12 = [v10 stringWithValidatedFormat:v9, @"%@", 0, v11 validFormatSpecifiers error];

    if (v12)
    {
      double v13 = [(CDPPaneHeaderView *)self->super._headerView textLabel];
      [v13 setText:v12];

      double v14 = (void *)MEMORY[0x263F343B8];
      double v15 = @"REMOTE_SECRET_ENTRY_SUBTITLE";
      double v27 = v8;
      if (([@"REMOTE_SECRET_ENTRY_SUBTITLE" containsString:@"REBRAND"] & 1) != 0
        || !_os_feature_enabled_impl())
      {
        int v16 = 0;
      }
      else
      {
        double v15 = [@"REMOTE_SECRET_ENTRY_SUBTITLE" stringByAppendingString:@"_REBRAND"];
        int v16 = 1;
      }
      double v17 = [v14 builderForKey:v15];
      CGFloat v18 = objc_msgSend(v17, "addSecretType:", objc_msgSend(v28, "localSecretType"));
      double v19 = [v18 localizedString];
      double v20 = [(CDPPaneHeaderView *)self->super._headerView subLabel];
      [v20 setText:v19];

      if (v16) {
      double v21 = (void *)MEMORY[0x263F81708];
      }
      uint64_t v22 = *MEMORY[0x263F83570];
      double v23 = [MEMORY[0x263F82B60] mainScreen];
      CGFloat v24 = [v23 traitCollection];
      double v25 = [v21 preferredFontForTextStyle:v22 compatibleWithTraitCollection:v24];
      double v26 = [(CDPPaneHeaderView *)self->super._headerView subLabel];
      [v26 setFont:v25];

      [(CDPPaneHeaderView *)self->super._headerView makeAllTheTextFits];
      double v8 = v27;
    }
    [(CDPPaneHeaderView *)self->super._headerView layoutSubviews];
  }
}

- (id)_headerStringForDevice:(id)a3 localDeviceClass:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![v6 isCurrentDevice])
  {
    double v12 = [v6 modelClass];
    double v13 = v12;
    if (v7 && v12)
    {
      double v14 = [v6 modelClass];
      int v15 = [v14 isEqualToString:v7];

      if (v15)
      {
        int v16 = [MEMORY[0x263F343B8] builderForKey:@"REMOTE_SECRET_ENTRY_TITLE_SPECIFIC_OTHER"];
        double v17 = objc_msgSend(v16, "addSecretType:", objc_msgSend(v6, "localSecretType"));
        CGFloat v18 = [v17 addUnqualifiedDeviceClass:v7];
        double v19 = [v18 localizedString];
        goto LABEL_14;
      }
    }
    else
    {
    }
    double v20 = [v6 modelClass];

    double v10 = (void *)MEMORY[0x263F343B8];
    if (!v20)
    {
      uint64_t v11 = @"REMOTE_SECRET_ENTRY_TITLE_GENERIC_OTHER";
      goto LABEL_16;
    }
    int v16 = [MEMORY[0x263F343B8] builderForKey:@"REMOTE_SECRET_ENTRY_TITLE_SPECIFIC"];
    double v17 = [v6 modelClass];
    CGFloat v18 = [v16 addUnqualifiedDeviceClass:v17];
    double v21 = objc_msgSend(v18, "addSecretType:", objc_msgSend(v6, "localSecretType"));
    double v19 = [v21 localizedString];

LABEL_14:
    goto LABEL_17;
  }
  double v8 = [MEMORY[0x263F343A8] sharedInstance];
  if (![v8 hasLocalSecret])
  {

    goto LABEL_10;
  }
  BOOL remoteAccountRecovery = self->_remoteAccountRecovery;

  if (!remoteAccountRecovery)
  {
LABEL_10:
    double v10 = (void *)MEMORY[0x263F343B8];
    uint64_t v11 = @"REMOTE_SECRET_ENTRY_TITLE_OLD";
    goto LABEL_16;
  }
  double v10 = (void *)MEMORY[0x263F343B8];
  uint64_t v11 = @"ACCOUNT_RECOVERY_CURRENT_DEVICE_REMOTE_SECRET_TITLE";
LABEL_16:
  int v16 = [v10 builderForKey:v11];
  double v17 = objc_msgSend(v16, "addSecretType:", objc_msgSend(v6, "localSecretType"));
  double v19 = [v17 localizedString];
LABEL_17:

  return v19;
}

- (CDPRemoteValidationEscapeOffer)escapeOffer
{
  return self->_escapeOffer;
}

- (unint64_t)remoteSecretType
{
  return self->_remoteSecretType;
}

- (CDPDevice)device
{
  return self->_device;
}

- (BOOL)remoteAccountRecovery
{
  return self->_remoteAccountRecovery;
}

- (void)setRemoteAccountRecovery:(BOOL)a3
{
  self->_BOOL remoteAccountRecovery = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_escapeOffer, 0);

  objc_storeStrong((id *)&self->_footerButton, 0);
}

@end