@interface PHCarPlayPhoneCallViewCell
- (BOOL)canBecomeFocused;
- (CNAvatarViewController)avatarViewController;
- (NSLayoutConstraint)containerSpecificLeftConstraint;
- (NSLayoutConstraint)containerSpecificRightConstraint;
- (NSLayoutConstraint)topAvatarConstraint;
- (NSLayoutConstraint)topMainLabelConstraint;
- (PHCarPlayPhoneCallViewCell)initWithFrame:(CGRect)a3;
- (TPBadgeView)badgeView;
- (UILabel)mainLabel;
- (UILabel)subtitleLabel;
- (UIStackView)subtitleStackView;
- (UIView)avatarContentView;
- (int64_t)numberOfLinesInSubtitleLabel;
- (void)_updateBadgeViewForLocalizedSenderIdentityTitle:(id)a3;
- (void)layoutSubviews;
- (void)setAvatarViewController:(id)a3;
- (void)setBadgeView:(id)a3;
- (void)setContainerSpecificLeftConstraint:(id)a3;
- (void)setContainerSpecificRightConstraint:(id)a3;
- (void)setDimmed:(BOOL)a3 animated:(BOOL)a4;
- (void)setEnabled:(BOOL)a3;
- (void)setMainLabel:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setSubtitleStackView:(id)a3;
- (void)setTitle:(id)a3 subtitle:(id)a4 subtitleColor:(id)a5 localizedSenderIdentityTitle:(id)a6 animated:(BOOL)a7;
- (void)setTitle:(id)a3 subtitle:(id)a4 subtitleColor:(id)a5 overrideBadgeColor:(id)a6 localizedSenderIdentityTitle:(id)a7 animated:(BOOL)a8;
- (void)setTopAvatarConstraint:(id)a3;
- (void)setTopMainLabelConstraint:(id)a3;
@end

@implementation PHCarPlayPhoneCallViewCell

- (PHCarPlayPhoneCallViewCell)initWithFrame:(CGRect)a3
{
  v70.receiver = self;
  v70.super_class = (Class)PHCarPlayPhoneCallViewCell;
  v3 = -[PHCarPlayPhoneCallViewCell initWithFrame:](&v70, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, 62.5);
  v4 = v3;
  if (v3)
  {
    [(PHCarPlayPhoneCallViewCell *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
    v5 = (UILabel *)objc_alloc_init((Class)UILabel);
    mainLabel = v4->_mainLabel;
    v4->_mainLabel = v5;

    [(UILabel *)v4->_mainLabel setNumberOfLines:2];
    [(UILabel *)v4->_mainLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v4->_mainLabel setTextAlignment:1];
    v7 = +[UIFont systemFontOfSize:28.0];
    [(UILabel *)v4->_mainLabel setFont:v7];

    v8 = +[UIColor dynamicLabelColor];
    [(UILabel *)v4->_mainLabel setTextColor:v8];

    v9 = +[UIColor clearColor];
    [(UILabel *)v4->_mainLabel setBackgroundColor:v9];

    [(UILabel *)v4->_mainLabel setOpaque:0];
    [(UILabel *)v4->_mainLabel setText:&stru_100285990];
    [(UILabel *)v4->_mainLabel setLineBreakMode:4];
    [(PHCarPlayPhoneCallViewCell *)v4 addSubview:v4->_mainLabel];
    v10 = (UILabel *)objc_alloc_init((Class)UILabel);
    subtitleLabel = v4->_subtitleLabel;
    v4->_subtitleLabel = v10;

    [(UILabel *)v4->_subtitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v4->_subtitleLabel setTextAlignment:1];
    [(UILabel *)v4->_subtitleLabel setLineBreakMode:3];
    v12 = +[UIFont monospacedDigitSystemFontOfSize:16.0 weight:UIFontWeightRegular];
    [(UILabel *)v4->_subtitleLabel setFont:v12];

    v13 = +[UIColor dynamicLabelColor];
    [(UILabel *)v4->_subtitleLabel setTextColor:v13];

    v14 = +[UIColor clearColor];
    [(UILabel *)v4->_subtitleLabel setBackgroundColor:v14];

    [(UILabel *)v4->_subtitleLabel setOpaque:0];
    [(UILabel *)v4->_subtitleLabel setText:&stru_100285990];
    [(UILabel *)v4->_subtitleLabel setNumberOfLines:2];
    [(UILabel *)v4->_subtitleLabel setAdjustsFontSizeToFitWidth:1];
    v15 = (UIStackView *)objc_alloc_init((Class)UIStackView);
    subtitleStackView = v4->_subtitleStackView;
    v4->_subtitleStackView = v15;

    [(UIStackView *)v4->_subtitleStackView setAxis:0];
    [(UIStackView *)v4->_subtitleStackView setDistribution:0];
    [(UIStackView *)v4->_subtitleStackView setAlignment:5];
    [(UIStackView *)v4->_subtitleStackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v4->_subtitleStackView setSpacing:4.0];
    [(UIStackView *)v4->_subtitleStackView addArrangedSubview:v4->_subtitleLabel];
    [(PHCarPlayPhoneCallViewCell *)v4 addSubview:v4->_subtitleStackView];
    v17 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    avatarContentView = v4->_avatarContentView;
    v4->_avatarContentView = v17;

    [(UIView *)v4->_avatarContentView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PHCarPlayPhoneCallViewCell *)v4 addSubview:v4->_avatarContentView];
    v69 = +[NSMutableArray array];
    v68 = [(UILabel *)v4->_mainLabel leftAnchor];
    v67 = [(PHCarPlayPhoneCallViewCell *)v4 leftAnchor];
    v66 = [v68 constraintGreaterThanOrEqualToAnchor:v67];
    v72[0] = v66;
    v65 = [(UILabel *)v4->_mainLabel rightAnchor];
    v64 = [(PHCarPlayPhoneCallViewCell *)v4 rightAnchor];
    v63 = [v65 constraintLessThanOrEqualToAnchor:v64];
    v72[1] = v63;
    v62 = [(UILabel *)v4->_mainLabel centerXAnchor];
    v61 = [(PHCarPlayPhoneCallViewCell *)v4 centerXAnchor];
    v60 = [v62 constraintEqualToAnchor:v61];
    v72[2] = v60;
    v59 = [(UIStackView *)v4->_subtitleStackView topAnchor];
    v58 = [(UILabel *)v4->_mainLabel bottomAnchor];
    v57 = [v59 constraintEqualToAnchor:v58 constant:0.0];
    v72[3] = v57;
    v56 = [(UIStackView *)v4->_subtitleStackView leftAnchor];
    v55 = [(PHCarPlayPhoneCallViewCell *)v4 leftAnchor];
    v54 = [v56 constraintGreaterThanOrEqualToAnchor:v55 constant:0.0];
    v72[4] = v54;
    v53 = [(UIStackView *)v4->_subtitleStackView rightAnchor];
    v52 = [(PHCarPlayPhoneCallViewCell *)v4 rightAnchor];
    v51 = [v53 constraintLessThanOrEqualToAnchor:v52 constant:0.0];
    v72[5] = v51;
    v50 = [(UIStackView *)v4->_subtitleStackView centerXAnchor];
    v49 = [(PHCarPlayPhoneCallViewCell *)v4 centerXAnchor];
    v48 = [v50 constraintEqualToAnchor:v49];
    v72[6] = v48;
    v47 = [(UIStackView *)v4->_subtitleStackView heightAnchor];
    v46 = [(UILabel *)v4->_subtitleLabel heightAnchor];
    v45 = [v47 constraintGreaterThanOrEqualToAnchor:v46];
    v72[7] = v45;
    v44 = [(UIView *)v4->_avatarContentView widthAnchor];
    v43 = [v44 constraintEqualToConstant:72.0];
    v72[8] = v43;
    v42 = [(UIView *)v4->_avatarContentView heightAnchor];
    v19 = [v42 constraintEqualToConstant:72.0];
    v72[9] = v19;
    v20 = [(UIView *)v4->_avatarContentView centerXAnchor];
    v21 = [(PHCarPlayPhoneCallViewCell *)v4 centerXAnchor];
    v22 = [v20 constraintEqualToAnchor:v21];
    v72[10] = v22;
    v23 = [(UIView *)v4->_avatarContentView bottomAnchor];
    v24 = [(UILabel *)v4->_mainLabel topAnchor];
    v25 = [v23 constraintEqualToAnchor:v24 constant:-6.0];
    v72[11] = v25;
    v26 = +[NSArray arrayWithObjects:v72 count:12];
    [v69 addObjectsFromArray:v26];

    v27 = [(PHCarPlayPhoneCallViewCell *)v4 topAnchor];
    v28 = [(UILabel *)v4->_mainLabel topAnchor];
    uint64_t v29 = [v27 constraintEqualToAnchor:v28];
    topMainLabelConstraint = v4->_topMainLabelConstraint;
    v4->_topMainLabelConstraint = (NSLayoutConstraint *)v29;

    v31 = [(PHCarPlayPhoneCallViewCell *)v4 topAnchor];
    v32 = [(UIView *)v4->_avatarContentView topAnchor];
    uint64_t v33 = [v31 constraintEqualToAnchor:v32];
    topAvatarConstraint = v4->_topAvatarConstraint;
    v4->_topAvatarConstraint = (NSLayoutConstraint *)v33;

    v71[0] = v4->_topMainLabelConstraint;
    v35 = [(PHCarPlayPhoneCallViewCell *)v4 bottomAnchor];
    v36 = [(UIStackView *)v4->_subtitleStackView bottomAnchor];
    v37 = [v35 constraintEqualToAnchor:v36];
    v71[1] = v37;
    v38 = +[NSArray arrayWithObjects:v71 count:2];
    [v69 addObjectsFromArray:v38];

    [(PHCarPlayPhoneCallViewCell *)v4 addConstraints:v69];
    [(PHCarPlayPhoneCallViewCell *)v4 layoutIfNeeded];
    containerSpecificLeftConstraint = v4->_containerSpecificLeftConstraint;
    v4->_containerSpecificLeftConstraint = 0;

    containerSpecificRightConstraint = v4->_containerSpecificRightConstraint;
    v4->_containerSpecificRightConstraint = 0;
  }
  return v4;
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)PHCarPlayPhoneCallViewCell;
  [(PHCarPlayPhoneCallViewCell *)&v11 layoutSubviews];
  [(PHCarPlayPhoneCallViewCell *)self frame];
  double v5 = v4;
  v6 = [(PHCarPlayPhoneCallViewCell *)self superview];
  [v6 frame];
  double v8 = v7;
  if (v5 > v7)
  {
    uint64_t v9 = 1;
  }
  else
  {
    v2 = [(PHCarPlayPhoneCallViewCell *)self mainLabel];
    uint64_t v9 = (uint64_t)[v2 numberOfLines];
  }
  v10 = [(PHCarPlayPhoneCallViewCell *)self mainLabel];
  [v10 setNumberOfLines:v9];

  if (v5 <= v8) {
}
  }

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PHCarPlayPhoneCallViewCell;
  -[PHCarPlayPhoneCallViewCell setEnabled:](&v5, "setEnabled:");
  [(PHCarPlayPhoneCallViewCell *)self setDimmed:v3 animated:0];
}

- (void)setDimmed:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3) {
    double v6 = 0.5;
  }
  else {
    double v6 = 1.0;
  }
  [(PHCarPlayPhoneCallViewCell *)self alpha];
  if (v7 != v6)
  {
    if (v4)
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = __49__PHCarPlayPhoneCallViewCell_setDimmed_animated___block_invoke;
      v8[3] = &unk_10027CA40;
      v8[4] = self;
      *(double *)&v8[5] = v6;
      +[UIView transitionWithView:self duration:5243012 options:v8 animations:0 completion:0.550000012];
    }
    else
    {
      [(PHCarPlayPhoneCallViewCell *)self setAlpha:v6];
    }
  }
}

id __49__PHCarPlayPhoneCallViewCell_setDimmed_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 40)];
}

- (void)setTitle:(id)a3 subtitle:(id)a4 subtitleColor:(id)a5 overrideBadgeColor:(id)a6 localizedSenderIdentityTitle:(id)a7 animated:(BOOL)a8
{
  BOOL v8 = a8;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  if (v8)
  {
    v17 = [(PHCarPlayPhoneCallViewCell *)self mainLabel];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = __119__PHCarPlayPhoneCallViewCell_setTitle_subtitle_subtitleColor_overrideBadgeColor_localizedSenderIdentityTitle_animated___block_invoke;
    v26[3] = &unk_10027C940;
    v26[4] = self;
    id v27 = v13;
    +[UIView transitionWithView:v17 duration:5243012 options:v26 animations:0 completion:0.550000012];

    v18 = [(PHCarPlayPhoneCallViewCell *)self subtitleStackView];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = __119__PHCarPlayPhoneCallViewCell_setTitle_subtitle_subtitleColor_overrideBadgeColor_localizedSenderIdentityTitle_animated___block_invoke_2;
    v22[3] = &unk_10027CA68;
    v22[4] = self;
    id v23 = v16;
    id v24 = v14;
    id v25 = v15;
    +[UIView transitionWithView:v18 duration:5243012 options:v22 animations:0 completion:0.550000012];
  }
  else
  {
    [(PHCarPlayPhoneCallViewCell *)self _updateBadgeViewForLocalizedSenderIdentityTitle:v16];
    v19 = [(PHCarPlayPhoneCallViewCell *)self mainLabel];
    [v19 setText:v13];

    v20 = [(PHCarPlayPhoneCallViewCell *)self subtitleLabel];
    [v20 setText:v14];

    v21 = [(PHCarPlayPhoneCallViewCell *)self subtitleLabel];
    [v21 setColor:v15];
  }
}

void __119__PHCarPlayPhoneCallViewCell_setTitle_subtitle_subtitleColor_overrideBadgeColor_localizedSenderIdentityTitle_animated___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) mainLabel];
  [v2 setText:v1];
}

void __119__PHCarPlayPhoneCallViewCell_setTitle_subtitle_subtitleColor_overrideBadgeColor_localizedSenderIdentityTitle_animated___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateBadgeViewForLocalizedSenderIdentityTitle:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 48);
  BOOL v3 = [*(id *)(a1 + 32) subtitleLabel];
  [v3 setText:v2];

  uint64_t v4 = *(void *)(a1 + 56);
  objc_super v5 = [*(id *)(a1 + 32) subtitleLabel];
  [v5 setColor:v4];

  id v6 = [*(id *)(a1 + 32) subtitleLabel];
  [v6 sizeToFit];
}

- (void)setTitle:(id)a3 subtitle:(id)a4 subtitleColor:(id)a5 localizedSenderIdentityTitle:(id)a6 animated:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (!v7)
  {
    [(PHCarPlayPhoneCallViewCell *)self _updateBadgeViewForLocalizedSenderIdentityTitle:v15];
    v18 = [(PHCarPlayPhoneCallViewCell *)self mainLabel];
    [v18 setText:v12];

    v19 = [(PHCarPlayPhoneCallViewCell *)self subtitleLabel];
    [v19 setText:v13];

    v20 = [(PHCarPlayPhoneCallViewCell *)self subtitleLabel];
    [v20 setColor:v14];

    v21 = +[NSBundle mainBundle];
    v22 = [v21 localizedStringForKey:@"ALERT_ERROR_LABEL" value:&stru_100285990 table:@"Localizable-Stewie"];
    if ([v13 isEqualToString:v22])
    {
      uint64_t v23 = [(PHCarPlayPhoneCallViewCell *)self numberOfLinesInSubtitleLabel];

      if (v23 < 3) {
        goto LABEL_7;
      }
      v21 = +[NSBundle mainBundle];
      v22 = [v21 localizedStringForKey:@"ALERT_ERROR_LABEL_NO_LINE_BREAK" value:&stru_100285990 table:@"Localizable-Stewie"];
      id v24 = [(PHCarPlayPhoneCallViewCell *)self subtitleLabel];
      [v24 setText:v22];
    }
    goto LABEL_7;
  }
  id v16 = [(PHCarPlayPhoneCallViewCell *)self mainLabel];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = __100__PHCarPlayPhoneCallViewCell_setTitle_subtitle_subtitleColor_localizedSenderIdentityTitle_animated___block_invoke;
  v29[3] = &unk_10027C940;
  v29[4] = self;
  id v30 = v12;
  +[UIView transitionWithView:v16 duration:5243012 options:v29 animations:0 completion:0.550000012];

  v17 = [(PHCarPlayPhoneCallViewCell *)self subtitleStackView];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = __100__PHCarPlayPhoneCallViewCell_setTitle_subtitle_subtitleColor_localizedSenderIdentityTitle_animated___block_invoke_2;
  v25[3] = &unk_10027CA68;
  v25[4] = self;
  id v26 = v15;
  id v27 = v13;
  id v28 = v14;
  +[UIView transitionWithView:v17 duration:5243012 options:v25 animations:0 completion:0.550000012];

LABEL_7:
}

void __100__PHCarPlayPhoneCallViewCell_setTitle_subtitle_subtitleColor_localizedSenderIdentityTitle_animated___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) mainLabel];
  [v2 setText:v1];
}

void __100__PHCarPlayPhoneCallViewCell_setTitle_subtitle_subtitleColor_localizedSenderIdentityTitle_animated___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateBadgeViewForLocalizedSenderIdentityTitle:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 48);
  BOOL v3 = [*(id *)(a1 + 32) subtitleLabel];
  [v3 setText:v2];

  uint64_t v4 = *(void *)(a1 + 56);
  objc_super v5 = [*(id *)(a1 + 32) subtitleLabel];
  [v5 setColor:v4];

  id v6 = [*(id *)(a1 + 32) subtitleLabel];
  [v6 sizeToFit];
}

- (void)_updateBadgeViewForLocalizedSenderIdentityTitle:(id)a3
{
  id v9 = a3;
  if (v9 && [v9 length])
  {
    uint64_t v4 = [(PHCarPlayPhoneCallViewCell *)self badgeView];

    if (v4)
    {
      objc_super v5 = [(PHCarPlayPhoneCallViewCell *)self badgeView];
      [v5 setTitle:v9];
    }
    else
    {
      id v7 = [objc_alloc((Class)TPBadgeView) initWithTitle:v9 theme:6];
      [v7 setSizeCategory:5];
      BOOL v8 = [(PHCarPlayPhoneCallViewCell *)self subtitleStackView];
      [v8 insertArrangedSubview:v7 atIndex:0];

      [(PHCarPlayPhoneCallViewCell *)self setBadgeView:v7];
    }
  }
  else
  {
    id v6 = [(PHCarPlayPhoneCallViewCell *)self badgeView];
    [v6 removeFromSuperview];

    [(PHCarPlayPhoneCallViewCell *)self setBadgeView:0];
  }
}

- (void)setAvatarViewController:(id)a3
{
  objc_super v5 = (CNAvatarViewController *)a3;
  p_avatarViewController = &self->_avatarViewController;
  if (self->_avatarViewController != v5)
  {
    objc_super v11 = v5;
    if (v5)
    {
      id v7 = [(CNAvatarViewController *)v5 view];
      [v7 setAutoresizingMask:18];
      BOOL v8 = [(PHCarPlayPhoneCallViewCell *)self avatarContentView];
      [v8 bounds];
      [v7 setFrame:];

      id v9 = [(PHCarPlayPhoneCallViewCell *)self avatarContentView];
      [v9 addSubview:v7];

      [(NSLayoutConstraint *)self->_topMainLabelConstraint setActive:0];
      [(NSLayoutConstraint *)self->_topAvatarConstraint setActive:1];
    }
    else
    {
      [(NSLayoutConstraint *)self->_topAvatarConstraint setActive:0];
      [(NSLayoutConstraint *)self->_topMainLabelConstraint setActive:1];
      id v7 = [(PHCarPlayPhoneCallViewCell *)self mainLabel];
      [v7 setNumberOfLines:2];
    }

    v10 = [(CNAvatarViewController *)*p_avatarViewController view];
    [v10 removeFromSuperview];

    objc_storeStrong((id *)p_avatarViewController, a3);
    objc_super v5 = v11;
  }
}

- (int64_t)numberOfLinesInSubtitleLabel
{
  [(PHCarPlayPhoneCallViewCell *)self frame];
  double v4 = v3;
  objc_super v5 = [(PHCarPlayPhoneCallViewCell *)self subtitleLabel];
  id v6 = [v5 font];
  [v6 lineHeight];
  double v8 = v7;

  id v9 = [(PHCarPlayPhoneCallViewCell *)self subtitleLabel];
  v10 = [v9 text];

  NSAttributedStringKey v17 = NSFontAttributeName;
  objc_super v11 = [(PHCarPlayPhoneCallViewCell *)self subtitleLabel];
  id v12 = [v11 font];
  v18 = v12;
  id v13 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  [v10 boundingRectWithSize:1 options:v13 attributes:0 context:v4];
  double v15 = v14;

  return (uint64_t)(v15 / v8);
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (NSLayoutConstraint)containerSpecificLeftConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 8, 1);
}

- (void)setContainerSpecificLeftConstraint:(id)a3
{
}

- (NSLayoutConstraint)containerSpecificRightConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 16, 1);
}

- (void)setContainerSpecificRightConstraint:(id)a3
{
}

- (CNAvatarViewController)avatarViewController
{
  return self->_avatarViewController;
}

- (UILabel)mainLabel
{
  return (UILabel *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMainLabel:(id)a3
{
}

- (UILabel)subtitleLabel
{
  return (UILabel *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSubtitleLabel:(id)a3
{
}

- (UIStackView)subtitleStackView
{
  return self->_subtitleStackView;
}

- (void)setSubtitleStackView:(id)a3
{
}

- (TPBadgeView)badgeView
{
  return self->_badgeView;
}

- (void)setBadgeView:(id)a3
{
}

- (UIView)avatarContentView
{
  return self->_avatarContentView;
}

- (NSLayoutConstraint)topMainLabelConstraint
{
  return self->_topMainLabelConstraint;
}

- (void)setTopMainLabelConstraint:(id)a3
{
}

- (NSLayoutConstraint)topAvatarConstraint
{
  return self->_topAvatarConstraint;
}

- (void)setTopAvatarConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topAvatarConstraint, 0);
  objc_storeStrong((id *)&self->_topMainLabelConstraint, 0);
  objc_storeStrong((id *)&self->_avatarContentView, 0);
  objc_storeStrong((id *)&self->_badgeView, 0);
  objc_storeStrong((id *)&self->_subtitleStackView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_mainLabel, 0);
  objc_storeStrong((id *)&self->_avatarViewController, 0);
  objc_storeStrong((id *)&self->_containerSpecificRightConstraint, 0);

  objc_storeStrong((id *)&self->_containerSpecificLeftConstraint, 0);
}

@end