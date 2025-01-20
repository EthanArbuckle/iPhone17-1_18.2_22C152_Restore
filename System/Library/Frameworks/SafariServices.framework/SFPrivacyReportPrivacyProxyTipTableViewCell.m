@interface SFPrivacyReportPrivacyProxyTipTableViewCell
- (BOOL)usesInsetStyle;
- (SFPrivacyReportPrivacyProxyTipTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (SFPrivacyReportPrivacyProxyTipTableViewCellDelegate)delegate;
- (void)_createContentViews;
- (void)_dismiss:(id)a3;
- (void)_notifyDelegateOfStateChange;
- (void)_openICloudPrivateRelaySettingsToLearnMore:(id)a3;
- (void)_setPrivacyProxyStateToTrackers:(id)a3;
- (void)_setPrivacyProxyStateToTrackersAndWebsites:(id)a3;
- (void)_turnOnCrossSiteTrackingProtectionIfNeeded;
- (void)prepareForReuse;
- (void)setDelegate:(id)a3;
- (void)setUsesInsetStyle:(BOOL)a3;
@end

@implementation SFPrivacyReportPrivacyProxyTipTableViewCell

- (SFPrivacyReportPrivacyProxyTipTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)SFPrivacyReportPrivacyProxyTipTableViewCell;
  v4 = [(SFPrivacyReportPrivacyProxyTipTableViewCell *)&v9 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(SFPrivacyReportPrivacyProxyTipTableViewCell *)v4 setBackgroundView:0];
    v6 = [MEMORY[0x1E4FB1618] clearColor];
    [(SFPrivacyReportPrivacyProxyTipTableViewCell *)v5 setBackgroundColor:v6];

    [(SFPrivacyReportPrivacyProxyTipTableViewCell *)v5 _createContentViews];
    v7 = v5;
  }

  return v5;
}

- (void)prepareForReuse
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)SFPrivacyReportPrivacyProxyTipTableViewCell;
  [(SFPrivacyReportPrivacyProxyTipTableViewCell *)&v13 prepareForReuse];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v3 = [(SFPrivacyReportPrivacyProxyTipTableViewCell *)self contentView];
  v4 = [v3 subviews];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) removeFromSuperview];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v6);
  }

  [(SFPrivacyReportPrivacyProxyTipTableViewCell *)self _createContentViews];
}

- (void)setUsesInsetStyle:(BOOL)a3
{
  self->_usesInsetStyle = a3;
  if (a3) {
    double v4 = 0.0;
  }
  else {
    double v4 = 13.0;
  }
  [(NSLayoutConstraint *)self->_insetLeading setConstant:v4];
  insetTrailing = self->_insetTrailing;

  [(NSLayoutConstraint *)insetTrailing setConstant:-v4];
}

- (void)_createContentViews
{
  id v114 = [MEMORY[0x1E4F98CF0] sharedManager];
  int v2 = [v114 isUserAccountInSubscriberTierForPrivacyProxy];
  uint64_t v106 = [v114 state];
  int v110 = v2;
  if (v106) {
    char v3 = 1;
  }
  else {
    char v3 = v2;
  }
  double v4 = [MEMORY[0x1E4F1CA48] array];
  unint64_t v5 = 0x1E4FB1000uLL;
  id v6 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  uint64_t v7 = [v6 layer];
  [v7 setCornerCurve:*MEMORY[0x1E4F39EA8]];
  [v7 setCornerRadius:8.0];
  [v6 setClipsToBounds:1];
  unint64_t v8 = 0x1E4FB1000uLL;
  long long v9 = [MEMORY[0x1E4FB1618] tableCellGroupedBackgroundColor];
  [v6 setBackgroundColor:v9];

  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v10 = objc_alloc_init(MEMORY[0x1E4FB1C60]);
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v10 setSpacing:4.0];
  [v10 setAxis:1];
  [v10 setAlignment:0];
  [v10 setDistribution:0];
  [v6 addSubview:v10];
  long long v11 = [v10 topAnchor];
  long long v12 = [v6 topAnchor];
  objc_super v13 = [v11 constraintEqualToAnchor:v12 constant:11.0];
  [v4 addObject:v13];

  v14 = [v10 bottomAnchor];
  uint64_t v15 = [v6 bottomAnchor];
  v16 = [v14 constraintEqualToAnchor:v15 constant:-11.0];
  [v4 addObject:v16];

  v17 = [v10 trailingAnchor];
  v18 = [v6 trailingAnchor];
  v19 = [v17 constraintEqualToAnchor:v18 constant:-13.0];
  [v4 addObject:v19];

  v107 = v7;
  v109 = v10;
  if (v3)
  {
    v20 = (void *)MEMORY[0x1E4FB1818];
    v21 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v22 = [MEMORY[0x1E4FB1830] configurationWithScale:1];
    v112 = [v20 imageNamed:@"PrivateProxyIcon" inBundle:v21 withConfiguration:v22];

    v23 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v112];
    [v23 setTranslatesAutoresizingMaskIntoConstraints:0];
    v24 = [MEMORY[0x1E4FB1618] labelColor];
    [v23 setTintColor:v24];

    [v6 addSubview:v23];
    v25 = [v23 widthAnchor];
    [v25 constraintEqualToConstant:35.0];
    v27 = v26 = v10;
    [v4 addObject:v27];

    v28 = [v23 heightAnchor];
    v29 = [v28 constraintEqualToConstant:35.0];
    [v4 addObject:v29];

    v30 = [v23 topAnchor];
    v31 = [v6 topAnchor];
    v32 = [v30 constraintEqualToAnchor:v31 constant:11.0];
    [v4 addObject:v32];

    v33 = [v23 leadingAnchor];
    v34 = [v6 leadingAnchor];
    v35 = [v33 constraintEqualToAnchor:v34 constant:13.0];
    [v4 addObject:v35];

    v36 = [v23 trailingAnchor];
    v37 = [v26 leadingAnchor];
    v38 = [v36 constraintEqualToAnchor:v37 constant:-13.0];
    [v4 addObject:v38];

    if (v106 == 1) {
      char v39 = v110;
    }
    else {
      char v39 = 1;
    }
    if (v39)
    {
      id v10 = v109;
      unint64_t v8 = 0x1E4FB1000;
      unint64_t v5 = 0x1E4FB1000;
      goto LABEL_13;
    }
    v43 = (void *)MEMORY[0x1E4FB14D0];
    v44 = [MEMORY[0x1E4FB1818] systemImageNamed:@"xmark"];
    v40 = [v43 systemButtonWithImage:v44 target:self action:sel__dismiss_];

    [v40 setTranslatesAutoresizingMaskIntoConstraints:0];
    unint64_t v8 = 0x1E4FB1000uLL;
    v45 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [v40 setTintColor:v45];

    [v6 addSubview:v40];
    v46 = [v40 topAnchor];
    v47 = [v6 topAnchor];
    v48 = [v46 constraintEqualToAnchor:v47 constant:13.0];
    [v4 addObject:v48];

    v49 = [v40 trailingAnchor];
    v50 = [v6 trailingAnchor];
    v51 = [v49 constraintEqualToAnchor:v50 constant:-13.0];
    [v4 addObject:v51];

    v52 = [v40 widthAnchor];
    v53 = [v52 constraintEqualToConstant:13.0];
    [v4 addObject:v53];

    v41 = [v40 heightAnchor];
    v42 = [v41 constraintEqualToConstant:13.0];
    id v10 = v109;
    unint64_t v5 = 0x1E4FB1000uLL;
  }
  else
  {
    v40 = [v10 leadingAnchor];
    v41 = [v6 leadingAnchor];
    v42 = [v40 constraintEqualToAnchor:v41 constant:13.0];
  }
  [v4 addObject:v42];

LABEL_13:
  id v54 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [v54 setTranslatesAutoresizingMaskIntoConstraints:0];
  v55 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:*MEMORY[0x1E4FB2908]];
  [v54 setFont:v55];

  v111 = v54;
  [v54 setNumberOfLines:0];
  id v56 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [v56 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v57 = *MEMORY[0x1E4FB2950];
  v58 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
  [v56 setFont:v58];

  v59 = [*(id *)(v8 + 1560) secondaryLabelColor];
  [v56 setTextColor:v59];

  [v56 setNumberOfLines:0];
  id v60 = objc_alloc_init(*(Class *)(v5 + 3760));
  v61 = [*(id *)(v8 + 1560) quaternaryLabelColor];
  [v60 setBackgroundColor:v61];

  [v60 setTranslatesAutoresizingMaskIntoConstraints:0];
  v62 = [v60 heightAnchor];
  [v62 constraintEqualToConstant:1.0];
  v64 = unint64_t v63 = v8;
  [v4 addObject:v64];

  v65 = [v60 leadingAnchor];
  v66 = [v56 leadingAnchor];
  v67 = [v65 constraintEqualToAnchor:v66];
  [v4 addObject:v67];

  v68 = [v60 topAnchor];
  v69 = [v56 bottomAnchor];
  v70 = [v68 constraintEqualToAnchor:v69 constant:4.0];
  [v4 addObject:v70];

  v113 = v60;
  v71 = [v60 trailingAnchor];
  v72 = [v6 trailingAnchor];
  v73 = [v71 constraintEqualToAnchor:v72];
  [v4 addObject:v73];

  id v74 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [v74 setTranslatesAutoresizingMaskIntoConstraints:0];
  v75 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:v57];
  [v74 setFont:v75];

  [v74 setNumberOfLines:0];
  v76 = [*(id *)(v63 + 1560) linkColor];
  [v74 setTextColor:v76];

  [v74 setUserInteractionEnabled:1];
  if (v110)
  {
    v77 = v4;
    v78 = _WBSLocalizedString();
    v79 = v111;
    [v111 setText:v78];

    id v82 = v56;
    v83 = _WBSLocalizedString();
    [v56 setText:v83];

    v84 = &selRef__setPrivacyProxyStateToTrackersAndWebsites_;
  }
  else
  {
    v77 = v4;
    v80 = _WBSLocalizedString();
    v79 = v111;
    [v111 setText:v80];

    v81 = _WBSLocalizedString();
    id v82 = v56;
    [v56 setText:v81];

    if (v106) {
      v84 = &selRef__openICloudPrivateRelaySettingsToLearnMore_;
    }
    else {
      v84 = &selRef__setPrivacyProxyStateToTrackers_;
    }
  }
  v85 = _WBSLocalizedString();
  [v74 setText:v85];

  v86 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:*v84];
  [v74 addGestureRecognizer:v86];

  [v10 addArrangedSubview:v79];
  [v10 addArrangedSubview:v82];
  [v10 addArrangedSubview:v74];
  [v10 setCustomSpacing:v82 afterView:14.0];
  [v6 addSubview:v113];
  v87 = [v6 leadingAnchor];
  v88 = [(SFPrivacyReportPrivacyProxyTipTableViewCell *)self contentView];
  v89 = [v88 leadingAnchor];
  v90 = [v87 constraintEqualToAnchor:v89];
  insetLeading = self->_insetLeading;
  self->_insetLeading = v90;

  v92 = [v6 trailingAnchor];
  v93 = [(SFPrivacyReportPrivacyProxyTipTableViewCell *)self contentView];
  v94 = [v93 trailingAnchor];
  v95 = [v92 constraintEqualToAnchor:v94];
  insetTrailing = self->_insetTrailing;
  self->_insetTrailing = v95;

  v97 = [v6 topAnchor];
  v98 = [(SFPrivacyReportPrivacyProxyTipTableViewCell *)self contentView];
  v99 = [v98 topAnchor];
  v100 = [v97 constraintEqualToAnchor:v99];
  [v77 addObject:v100];

  v101 = [v6 bottomAnchor];
  v102 = [(SFPrivacyReportPrivacyProxyTipTableViewCell *)self contentView];
  v103 = [v102 bottomAnchor];
  v104 = [v101 constraintEqualToAnchor:v103];
  [v77 addObject:v104];

  [v77 addObject:self->_insetLeading];
  [v77 addObject:self->_insetTrailing];
  v105 = [(SFPrivacyReportPrivacyProxyTipTableViewCell *)self contentView];
  [v105 addSubview:v6];

  [MEMORY[0x1E4F28DC8] activateConstraints:v77];
}

- (void)_notifyDelegateOfStateChange
{
  id v3 = [(SFPrivacyReportPrivacyProxyTipTableViewCell *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 cellPrivacyProxyStateChanged:self];
  }
}

- (void)_turnOnCrossSiteTrackingProtectionIfNeeded
{
  int v2 = [MEMORY[0x1E4F18D30] sharedHTTPCookieStorage];
  char v3 = objc_msgSend(v2, "webui_trackerProtectionEnabled");

  if ((v3 & 1) == 0)
  {
    double v4 = [MEMORY[0x1E4F74230] sharedConnection];
    [v4 setValue:&unk_1EFBDFBA8 forSetting:*MEMORY[0x1E4F74120]];

    unint64_t v5 = [MEMORY[0x1E4F18D30] sharedHTTPCookieStorage];
    objc_msgSend(v5, "webui_applySafariCookieAcceptPolicy");

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFStringRef v7 = (const __CFString *)*MEMORY[0x1E4FB6F30];
    CFNotificationCenterPostNotification(DarwinNotifyCenter, v7, 0, 0, 0);
  }
}

- (void)_setPrivacyProxyStateToTrackersAndWebsites:(id)a3
{
  [(SFPrivacyReportPrivacyProxyTipTableViewCell *)self _turnOnCrossSiteTrackingProtectionIfNeeded];
  double v4 = [MEMORY[0x1E4F98CF0] sharedManager];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __90__SFPrivacyReportPrivacyProxyTipTableViewCell__setPrivacyProxyStateToTrackersAndWebsites___block_invoke;
  v5[3] = &unk_1E5C73750;
  v5[4] = self;
  [v4 setPrivacyProxyState:2 completionHandler:v5];
}

uint64_t __90__SFPrivacyReportPrivacyProxyTipTableViewCell__setPrivacyProxyStateToTrackersAndWebsites___block_invoke(uint64_t result, uint64_t a2)
{
  if (!a2) {
    return [*(id *)(result + 32) _notifyDelegateOfStateChange];
  }
  return result;
}

- (void)_setPrivacyProxyStateToTrackers:(id)a3
{
  [(SFPrivacyReportPrivacyProxyTipTableViewCell *)self _turnOnCrossSiteTrackingProtectionIfNeeded];
  double v4 = [MEMORY[0x1E4F98CF0] sharedManager];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __79__SFPrivacyReportPrivacyProxyTipTableViewCell__setPrivacyProxyStateToTrackers___block_invoke;
  v5[3] = &unk_1E5C73750;
  v5[4] = self;
  [v4 setPrivacyProxyState:1 completionHandler:v5];
}

uint64_t __79__SFPrivacyReportPrivacyProxyTipTableViewCell__setPrivacyProxyStateToTrackers___block_invoke(uint64_t result, uint64_t a2)
{
  if (!a2) {
    return [*(id *)(result + 32) _notifyDelegateOfStateChange];
  }
  return result;
}

- (void)_openICloudPrivateRelaySettingsToLearnMore:(id)a3
{
}

- (void)_dismiss:(id)a3
{
  id v4 = [(SFPrivacyReportPrivacyProxyTipTableViewCell *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 cellPrivacyProxyUpsellDismissed:self];
  }
}

- (BOOL)usesInsetStyle
{
  return self->_usesInsetStyle;
}

- (SFPrivacyReportPrivacyProxyTipTableViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SFPrivacyReportPrivacyProxyTipTableViewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_insetTrailing, 0);

  objc_storeStrong((id *)&self->_insetLeading, 0);
}

@end