@interface PHCarPlayRecentsTableViewCell
- (BOOL)showsOutgoingCallIcon;
- (CNAvatarViewController)avatarViewController;
- (NSLayoutConstraint)nameLabelVerticalLayoutConstraint;
- (NSLayoutConstraint)stackViewVerticalLayoutConstraint;
- (NSString)localizedSenderIdentityTitle;
- (NSString)phoneNumberTypeLabelText;
- (PHCarPlayRecentsTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (TPBadgeView)badgeView;
- (TUFeatureFlags)featureFlags;
- (UIDateLabel)dateLabel;
- (UIImageView)outgoingCallIconImageView;
- (UILabel)nameLabel;
- (UILabel)phoneNumberTypeLabel;
- (UIStackView)stackView;
- (double)nameLabelVerticalLayoutConstraintConstant;
- (double)stackViewVerticalLayoutConstraintConstant;
- (void)setAvatarViewController:(id)a3;
- (void)setBadgeView:(id)a3;
- (void)setDateLabel:(id)a3;
- (void)setLocalizedSenderIdentityTitle:(id)a3;
- (void)setNameLabel:(id)a3;
- (void)setNameLabelVerticalLayoutConstraint:(id)a3;
- (void)setOutgoingCallIconImageView:(id)a3;
- (void)setPhoneNumberTypeLabel:(id)a3;
- (void)setPhoneNumberTypeLabelText:(id)a3;
- (void)setShowsOutgoingCallIcon:(BOOL)a3;
- (void)setStackView:(id)a3;
- (void)setStackViewVerticalLayoutConstraint:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateLabelConstraintConstants;
- (void)updateRootViewWithAvatarView;
@end

@implementation PHCarPlayRecentsTableViewCell

- (PHCarPlayRecentsTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v80.receiver = self;
  v80.super_class = (Class)PHCarPlayRecentsTableViewCell;
  v4 = [(PHCarPlayGenericTableViewCell *)&v80 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = (TUFeatureFlags *)objc_alloc_init((Class)TUFeatureFlags);
    featureFlags = v4->_featureFlags;
    v4->_featureFlags = v5;

    id v7 = objc_alloc((Class)UIDateLabel);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    id v11 = [v7 initWithFrame:CGRectZero.origin.x, y, width, height];
    [v11 setAdjustsFontForContentSizeCategory:1];
    [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
    v12 = +[UIColor dynamicCarPrimaryColor];
    [v11 setTextColor:v12];

    v13 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCaption1];
    [v11 setFont:v13];

    v14 = +[UIColor dynamicCarFocusedPrimaryLabelColor];
    [v11 setHighlightedTextColor:v14];

    v15 = +[UIColor clearColor];
    [v11 setBackgroundColor:v15];

    v16 = [(PHCarPlayRecentsTableViewCell *)v4 contentView];
    [v16 addSubview:v11];

    [(PHCarPlayRecentsTableViewCell *)v4 setDateLabel:v11];
    id v17 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    [v17 setAdjustsFontForContentSizeCategory:1];
    [v17 setTranslatesAutoresizingMaskIntoConstraints:0];
    v18 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCallout];
    [v17 setFont:v18];

    v19 = +[UIColor dynamicLabelColor];
    [v17 setTextColor:v19];

    v20 = +[UIColor clearColor];
    [v17 setBackgroundColor:v20];

    v21 = +[UIColor dynamicCarFocusedLabelColor];
    [v17 setHighlightedTextColor:v21];

    v22 = [(PHCarPlayRecentsTableViewCell *)v4 contentView];
    [v22 addSubview:v17];

    [(PHCarPlayRecentsTableViewCell *)v4 setNameLabel:v17];
    id v23 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];

    [v23 setAdjustsFontForContentSizeCategory:1];
    [v23 setTranslatesAutoresizingMaskIntoConstraints:0];
    v24 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCaption1];
    [v23 setFont:v24];

    v25 = +[UIColor dynamicCarSecondaryColor];
    [v23 setTextColor:v25];

    v26 = +[UIColor clearColor];
    [v23 setBackgroundColor:v26];

    v27 = +[UIColor dynamicCarFocusedSecondaryLabelColor];
    [v23 setHighlightedTextColor:v27];

    [(PHCarPlayRecentsTableViewCell *)v4 setPhoneNumberTypeLabel:v23];
    id v28 = objc_alloc_init((Class)UIStackView);
    [(PHCarPlayRecentsTableViewCell *)v4 setStackView:v28];

    v29 = [(PHCarPlayRecentsTableViewCell *)v4 stackView];
    [v29 setAxis:0];

    v30 = [(PHCarPlayRecentsTableViewCell *)v4 stackView];
    [v30 setDistribution:0];

    v31 = [(PHCarPlayRecentsTableViewCell *)v4 stackView];
    [v31 setAlignment:5];

    v32 = [(PHCarPlayRecentsTableViewCell *)v4 stackView];
    [v32 setTranslatesAutoresizingMaskIntoConstraints:0];

    v33 = [(PHCarPlayRecentsTableViewCell *)v4 stackView];
    [v33 setSpacing:4.0];

    v34 = [(PHCarPlayRecentsTableViewCell *)v4 stackView];
    v35 = [(PHCarPlayRecentsTableViewCell *)v4 phoneNumberTypeLabel];
    [v34 addArrangedSubview:v35];

    v36 = [(PHCarPlayRecentsTableViewCell *)v4 contentView];
    v37 = [(PHCarPlayRecentsTableViewCell *)v4 stackView];
    [v36 addSubview:v37];

    v81[0] = @"dateLabel";
    v38 = [(PHCarPlayRecentsTableViewCell *)v4 dateLabel];
    v82[0] = v38;
    v81[1] = @"nameLabel";
    v39 = [(PHCarPlayRecentsTableViewCell *)v4 nameLabel];
    v82[1] = v39;
    v81[2] = @"phoneNumberTypeLabel";
    v40 = [(PHCarPlayRecentsTableViewCell *)v4 phoneNumberTypeLabel];
    v82[2] = v40;
    v81[3] = @"stackView";
    v41 = [(PHCarPlayRecentsTableViewCell *)v4 stackView];
    v82[3] = v41;
    v42 = +[NSDictionary dictionaryWithObjects:v82 forKeys:v81 count:4];

    v43 = [(PHCarPlayRecentsTableViewCell *)v4 contentView];
    v44 = +[NSLayoutConstraint constraintsWithVisualFormat:@"[dateLabel]-12-|" options:0 metrics:0 views:v42];
    [v43 addConstraints:v44];

    v45 = [(PHCarPlayRecentsTableViewCell *)v4 contentView];
    v46 = [(PHCarPlayRecentsTableViewCell *)v4 dateLabel];
    v47 = [(PHCarPlayRecentsTableViewCell *)v4 contentView];
    v48 = +[NSLayoutConstraint constraintWithItem:v46 attribute:10 relatedBy:0 toItem:v47 attribute:10 multiplier:1.0 constant:0.0];
    [v45 addConstraint:v48];

    LODWORD(v45) = [(TUFeatureFlags *)v4->_featureFlags phoneRecentsAvatarsCarplayEnabled];
    v49 = [(PHCarPlayRecentsTableViewCell *)v4 nameLabel];
    v50 = [v49 leadingAnchor];
    v51 = [(PHCarPlayRecentsTableViewCell *)v4 leadingAnchor];
    double v52 = 39.0;
    if (v45) {
      double v52 = 54.0;
    }
    v53 = [v50 constraintEqualToAnchor:v51 constant:v52];
    [v53 setActive:1];

    v54 = [(PHCarPlayRecentsTableViewCell *)v4 contentView];
    v55 = [(PHCarPlayRecentsTableViewCell *)v4 nameLabel];
    v56 = [(PHCarPlayRecentsTableViewCell *)v4 dateLabel];
    v57 = +[NSLayoutConstraint constraintWithItem:v55 attribute:6 relatedBy:-1 toItem:v56 attribute:5 multiplier:1.0 constant:-5.0];
    [v54 addConstraint:v57];

    v58 = [(PHCarPlayRecentsTableViewCell *)v4 nameLabel];
    v59 = [(PHCarPlayRecentsTableViewCell *)v4 contentView];
    [(PHCarPlayRecentsTableViewCell *)v4 nameLabelVerticalLayoutConstraintConstant];
    v61 = +[NSLayoutConstraint constraintWithItem:v58 attribute:11 relatedBy:0 toItem:v59 attribute:3 multiplier:1.0 constant:v60];
    [(PHCarPlayRecentsTableViewCell *)v4 setNameLabelVerticalLayoutConstraint:v61];

    v62 = [(PHCarPlayRecentsTableViewCell *)v4 contentView];
    v63 = [(PHCarPlayRecentsTableViewCell *)v4 nameLabelVerticalLayoutConstraint];
    [v62 addConstraint:v63];

    v64 = [(PHCarPlayRecentsTableViewCell *)v4 stackView];
    v65 = [(PHCarPlayRecentsTableViewCell *)v4 contentView];
    [(PHCarPlayRecentsTableViewCell *)v4 stackViewVerticalLayoutConstraintConstant];
    v67 = +[NSLayoutConstraint constraintWithItem:v64 attribute:11 relatedBy:0 toItem:v65 attribute:4 multiplier:1.0 constant:v66];
    [(PHCarPlayRecentsTableViewCell *)v4 setStackViewVerticalLayoutConstraint:v67];

    v68 = [(PHCarPlayRecentsTableViewCell *)v4 contentView];
    v69 = [(PHCarPlayRecentsTableViewCell *)v4 stackViewVerticalLayoutConstraint];
    [v68 addConstraint:v69];

    v70 = [(PHCarPlayRecentsTableViewCell *)v4 contentView];
    v71 = [(PHCarPlayRecentsTableViewCell *)v4 stackView];
    v72 = [(PHCarPlayRecentsTableViewCell *)v4 nameLabel];
    v73 = +[NSLayoutConstraint constraintWithItem:v71 attribute:5 relatedBy:0 toItem:v72 attribute:5 multiplier:1.0 constant:0.0];
    [v70 addConstraint:v73];

    id v74 = [(TUFeatureFlags *)v4->_featureFlags phoneRecentsAvatarsCarplayEnabled];
    v75 = [(PHCarPlayRecentsTableViewCell *)v4 contentView];
    v76 = [(PHCarPlayRecentsTableViewCell *)v4 stackView];
    v77 = [(PHCarPlayRecentsTableViewCell *)v4 nameLabel];
    v78 = +[NSLayoutConstraint constraintWithItem:v76 attribute:6 relatedBy:(uint64_t)((void)v74 << 63) >> 63 toItem:v77 attribute:6 multiplier:1.0 constant:0.0];
    [v75 addConstraint:v78];
  }
  return v4;
}

- (void)setAvatarViewController:(id)a3
{
  id v7 = (CNAvatarViewController *)a3;
  p_avatarViewController = (CNAvatarViewController **)[(TUFeatureFlags *)self->_featureFlags phoneRecentsAvatarsCarplayEnabled];
  v6 = v7;
  if (p_avatarViewController)
  {
    p_avatarViewController = &self->_avatarViewController;
    if (self->_avatarViewController != v7)
    {
      objc_storeStrong((id *)p_avatarViewController, a3);
      p_avatarViewController = (CNAvatarViewController **)[(PHCarPlayRecentsTableViewCell *)self updateRootViewWithAvatarView];
      v6 = v7;
    }
  }

  _objc_release_x1(p_avatarViewController, v6);
}

- (void)updateRootViewWithAvatarView
{
  if ([(TUFeatureFlags *)self->_featureFlags phoneRecentsAvatarsCarplayEnabled])
  {
    v3 = [(PHCarPlayRecentsTableViewCell *)self avatarViewController];

    if (v3)
    {
      v4 = [(PHCarPlayRecentsTableViewCell *)self avatarViewController];
      v5 = [v4 view];
      [v5 setMinimumLayoutSize:28.0, 28.0];

      v6 = [(PHCarPlayRecentsTableViewCell *)self avatarViewController];
      id v7 = [v6 view];
      [v7 setMaximumLayoutSize:28.0, 28.0];

      v8 = [(PHCarPlayRecentsTableViewCell *)self avatarViewController];
      v9 = [v8 view];

      [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
      LODWORD(v10) = 1148846080;
      [v9 setContentCompressionResistancePriority:0 forAxis:v10];
      LODWORD(v11) = 1148846080;
      [v9 setContentCompressionResistancePriority:1 forAxis:v11];
      LODWORD(v12) = 1148846080;
      [v9 setContentHuggingPriority:0 forAxis:v12];
      LODWORD(v13) = 1148846080;
      [v9 setContentHuggingPriority:1 forAxis:v13];
      v14 = [(PHCarPlayRecentsTableViewCell *)self contentView];
      [v14 addSubview:v9];

      v15 = [(PHCarPlayRecentsTableViewCell *)self contentView];
      v16 = +[NSLayoutConstraint constraintWithItem:v9 attribute:5 relatedBy:0 toItem:v15 attribute:5 multiplier:1.0 constant:12.0];

      id v17 = [(PHCarPlayRecentsTableViewCell *)self contentView];
      v18 = +[NSLayoutConstraint constraintWithItem:v9 attribute:10 relatedBy:0 toItem:v17 attribute:10 multiplier:1.0 constant:0.0];

      v19 = +[NSLayoutConstraint constraintWithItem:v9 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:28.0];
      v20 = +[NSLayoutConstraint constraintWithItem:v9 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:28.0];
      v22[0] = v16;
      v22[1] = v18;
      v22[2] = v19;
      v22[3] = v20;
      v21 = +[NSArray arrayWithObjects:v22 count:4];
      +[NSLayoutConstraint activateConstraints:v21];
    }
  }
}

- (void)setLocalizedSenderIdentityTitle:(id)a3
{
  id v18 = a3;
  if (!-[NSString isEqualToString:](self->_localizedSenderIdentityTitle, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_localizedSenderIdentityTitle, a3);
    if ([v18 length])
    {
      id v5 = [objc_alloc((Class)TPBadgeView) initWithTitle:v18 theme:5];
      [v5 setSizeCategory:4];
      v6 = [(PHCarPlayRecentsTableViewCell *)self badgeView];

      if (v6)
      {
        id v7 = [(PHCarPlayRecentsTableViewCell *)self badgeView];
        [v7 setTitle:v18];
      }
      else
      {
        unsigned int v9 = [(TUFeatureFlags *)self->_featureFlags phoneRecentsAvatarsCarplayEnabled];
        double v10 = [(PHCarPlayRecentsTableViewCell *)self stackView];
        double v11 = v10;
        if (!v9) {
          goto LABEL_9;
        }
        double v12 = [v10 arrangedSubviews];
        double v13 = [(PHCarPlayRecentsTableViewCell *)self outgoingCallIconImageView];
        unsigned int v14 = [v12 containsObject:v13];

        double v11 = [(PHCarPlayRecentsTableViewCell *)self stackView];
        if (v14)
        {
          v15 = [(PHCarPlayRecentsTableViewCell *)self stackView];
          v16 = [v15 arrangedSubviews];
          id v17 = [(PHCarPlayRecentsTableViewCell *)self outgoingCallIconImageView];
          [v11 insertArrangedSubview:v5 atIndex:([v16 indexOfObject:v17] + 1)];
        }
        else
        {
LABEL_9:
          [v11 insertArrangedSubview:v5 atIndex:0];
        }

        [(PHCarPlayRecentsTableViewCell *)self setBadgeView:v5];
      }
    }
    else
    {
      v8 = [(PHCarPlayRecentsTableViewCell *)self badgeView];
      [v8 removeFromSuperview];

      [(PHCarPlayRecentsTableViewCell *)self setBadgeView:0];
    }
  }
}

- (void)setShowsOutgoingCallIcon:(BOOL)a3
{
  if (self->_showsOutgoingCallIcon != a3)
  {
    BOOL v3 = a3;
    self->_showsOutgoingCallIcon = a3;
    if (a3)
    {
      id v5 = [(PHCarPlayRecentsTableViewCell *)self outgoingCallIconImageView];

      if (!v5)
      {
        if (!carPlayOutgoingCallImage_0)
        {
          unsigned int v6 = [(TUFeatureFlags *)self->_featureFlags phoneRecentsAvatarsCarplayEnabled];
          if (v6) {
            uint64_t v7 = 1;
          }
          else {
            uint64_t v7 = 2;
          }
          v8 = &UIFontTextStyleFootnote;
          if (!v6) {
            v8 = &UIFontTextStyleCallout;
          }
          uint64_t v9 = +[UIImage tpImageForSymbolType:4 textStyle:*v8 scale:v7 isStaticSize:0];
          double v10 = (void *)carPlayOutgoingCallImage_0;
          carPlayOutgoingCallImage_0 = v9;

          uint64_t v11 = [(id)carPlayOutgoingCallImage_0 imageWithRenderingMode:2];
          double v12 = (void *)carPlayOutgoingCallImage_0;
          carPlayOutgoingCallImage_0 = v11;
        }
        id v13 = objc_alloc((Class)UIImageView);
        unsigned int v14 = (UIImageView *)[v13 initWithImage:carPlayOutgoingCallImage_0];
        outgoingCallIconImageView = self->_outgoingCallIconImageView;
        self->_outgoingCallIconImageView = v14;

        v16 = self->_outgoingCallIconImageView;
        id v17 = (void *)carPlayOutgoingCallImage_0;
        id v18 = +[UIColor dynamicCarFocusedLabelColor];
        v19 = [v17 _flatImageWithColor:v18];
        [(UIImageView *)v16 setHighlightedImage:v19];

        [(UIImageView *)self->_outgoingCallIconImageView setTranslatesAutoresizingMaskIntoConstraints:0];
        if ([(TUFeatureFlags *)self->_featureFlags phoneRecentsAvatarsCarplayEnabled])
        {
          v20 = +[UIColor dynamicCarSecondaryColor];
          [(UIImageView *)self->_outgoingCallIconImageView setTintColor:v20];

          LODWORD(v21) = 1148846080;
          [(UIImageView *)self->_outgoingCallIconImageView setContentCompressionResistancePriority:0 forAxis:v21];
          LODWORD(v22) = 1148846080;
          [(UIImageView *)self->_outgoingCallIconImageView setContentCompressionResistancePriority:1 forAxis:v22];
          id v23 = [(PHCarPlayRecentsTableViewCell *)self stackView];
          [v23 insertArrangedSubview:self->_outgoingCallIconImageView atIndex:0];
        }
        else
        {
          v24 = [(PHCarPlayRecentsTableViewCell *)self contentView];
          [v24 addSubview:self->_outgoingCallIconImageView];

          v25 = +[UIColor dynamicCarPrimaryColor];
          v26 = [(PHCarPlayRecentsTableViewCell *)self contentView];
          [v26 setTintColor:v25];

          v27 = [(PHCarPlayRecentsTableViewCell *)self contentView];
          id v28 = self->_outgoingCallIconImageView;
          v29 = [(PHCarPlayRecentsTableViewCell *)self contentView];
          v30 = +[NSLayoutConstraint constraintWithItem:v28 attribute:10 relatedBy:0 toItem:v29 attribute:10 multiplier:1.0 constant:0.0];
          [v27 addConstraint:v30];

          id v23 = [(PHCarPlayRecentsTableViewCell *)self contentView];
          v31 = self->_outgoingCallIconImageView;
          CFStringRef v35 = @"OutgoingCallIconImageView";
          v36 = v31;
          v32 = +[NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
          v33 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"|-(12)-[OutgoingCallIconImageView]", 0, 0, v32);
          [v23 addConstraints:v33];
        }
      }
    }
    v34 = [(PHCarPlayRecentsTableViewCell *)self outgoingCallIconImageView];
    [v34 setHidden:!v3];
  }
}

- (NSString)phoneNumberTypeLabelText
{
  v2 = [(PHCarPlayRecentsTableViewCell *)self phoneNumberTypeLabel];
  BOOL v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setPhoneNumberTypeLabelText:(id)a3
{
  CFStringRef v4 = (const __CFString *)a3;
  if (!v4) {
    CFStringRef v4 = &stru_100285990;
  }
  uint64_t v9 = (__CFString *)v4;
  id v5 = [(PHCarPlayRecentsTableViewCell *)self phoneNumberTypeLabel];
  unsigned int v6 = [v5 text];
  unsigned __int8 v7 = [v6 isEqualToString:v9];

  if ((v7 & 1) == 0)
  {
    v8 = [(PHCarPlayRecentsTableViewCell *)self phoneNumberTypeLabel];
    [v8 setText:v9];

    [(PHCarPlayRecentsTableViewCell *)self updateLabelConstraintConstants];
  }
}

- (double)nameLabelVerticalLayoutConstraintConstant
{
  BOOL v3 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCallout];
  CFStringRef v4 = [(PHCarPlayRecentsTableViewCell *)self phoneNumberTypeLabel];
  id v5 = [v4 text];
  id v6 = [v5 length];
  double v7 = 28.5;
  if (v6) {
    double v7 = 20.0;
  }
  [v3 _scaledValueForValue:v7];
  double v9 = v8;

  return v9;
}

- (double)stackViewVerticalLayoutConstraintConstant
{
  v2 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCallout];
  [v2 _scaledValueForValue:-7.5];
  double v4 = v3;

  return v4;
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PHCarPlayRecentsTableViewCell;
  id v4 = a3;
  [(PHCarPlayRecentsTableViewCell *)&v8 traitCollectionDidChange:v4];
  id v5 = [(PHCarPlayRecentsTableViewCell *)self traitCollection];
  id v6 = [v5 preferredContentSizeCategory];
  double v7 = [v4 preferredContentSizeCategory];

  if (v6 != v7) {
    [(PHCarPlayRecentsTableViewCell *)self updateLabelConstraintConstants];
  }
}

- (void)updateLabelConstraintConstants
{
  [(PHCarPlayRecentsTableViewCell *)self nameLabelVerticalLayoutConstraintConstant];
  double v4 = v3;
  id v5 = [(PHCarPlayRecentsTableViewCell *)self nameLabelVerticalLayoutConstraint];
  [v5 setConstant:v4];

  [(PHCarPlayRecentsTableViewCell *)self stackViewVerticalLayoutConstraintConstant];
  double v7 = v6;
  id v8 = [(PHCarPlayRecentsTableViewCell *)self stackViewVerticalLayoutConstraint];
  [v8 setConstant:v7];
}

- (CNAvatarViewController)avatarViewController
{
  return self->_avatarViewController;
}

- (UIDateLabel)dateLabel
{
  return self->_dateLabel;
}

- (void)setDateLabel:(id)a3
{
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
}

- (NSLayoutConstraint)nameLabelVerticalLayoutConstraint
{
  return self->_nameLabelVerticalLayoutConstraint;
}

- (void)setNameLabelVerticalLayoutConstraint:(id)a3
{
}

- (NSString)localizedSenderIdentityTitle
{
  return self->_localizedSenderIdentityTitle;
}

- (BOOL)showsOutgoingCallIcon
{
  return self->_showsOutgoingCallIcon;
}

- (UILabel)phoneNumberTypeLabel
{
  return self->_phoneNumberTypeLabel;
}

- (void)setPhoneNumberTypeLabel:(id)a3
{
}

- (NSLayoutConstraint)stackViewVerticalLayoutConstraint
{
  return self->_stackViewVerticalLayoutConstraint;
}

- (void)setStackViewVerticalLayoutConstraint:(id)a3
{
}

- (UIImageView)outgoingCallIconImageView
{
  return self->_outgoingCallIconImageView;
}

- (void)setOutgoingCallIconImageView:(id)a3
{
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (TPBadgeView)badgeView
{
  return self->_badgeView;
}

- (void)setBadgeView:(id)a3
{
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_badgeView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_outgoingCallIconImageView, 0);
  objc_storeStrong((id *)&self->_stackViewVerticalLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_phoneNumberTypeLabel, 0);
  objc_storeStrong((id *)&self->_localizedSenderIdentityTitle, 0);
  objc_storeStrong((id *)&self->_nameLabelVerticalLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_dateLabel, 0);

  objc_storeStrong((id *)&self->_avatarViewController, 0);
}

@end