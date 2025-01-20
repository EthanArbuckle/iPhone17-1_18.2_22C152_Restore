@interface PHCarPlayVoicemailTableViewCell
- (BOOL)isRestrictedMessage;
- (CNContactStore)contactStore;
- (MPMessage)representedVoicemail;
- (NSLayoutConstraint)nameLabelBaselineConstraint;
- (NSLayoutConstraint)subtitleLabelBaselineConstraint;
- (NSString)localizedSenderIdentityTitle;
- (PHCarPlayVoicemailTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (TPBadgeView)badgeView;
- (UIDateLabel)dateLabel;
- (UIImageView)unreadIndicatorImageView;
- (UILabel)nameLabel;
- (UILabel)subtitleLabel;
- (UIStackView)stackView;
- (double)nameLabelBaselineConstraintConstant;
- (double)subtitleLabelBaselineConstraintConstant;
- (id)disabledTextColor;
- (void)_updateConstraints;
- (void)setBadgeView:(id)a3;
- (void)setDateLabel:(id)a3;
- (void)setLocalizedSenderIdentityTitle:(id)a3;
- (void)setNameLabel:(id)a3;
- (void)setNameLabelBaselineConstraint:(id)a3;
- (void)setPendingState:(BOOL)a3;
- (void)setRepresentedVoicemail:(id)a3;
- (void)setRepresentedVoicemail:(id)a3 isRestrictedMessage:(BOOL)a4;
- (void)setRestrictedMessage:(BOOL)a3;
- (void)setStackView:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setSubtitleLabelBaselineConstraint:(id)a3;
- (void)setSubtitleString:(id)a3;
- (void)setUnreadIndicatorImageView:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updatePendingState;
@end

@implementation PHCarPlayVoicemailTableViewCell

- (PHCarPlayVoicemailTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v79.receiver = self;
  v79.super_class = (Class)PHCarPlayVoicemailTableViewCell;
  v4 = [(PHCarPlayGenericTableViewCell *)&v79 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = +[PHApplicationServices sharedInstance];
    uint64_t v6 = [v5 contactStore];
    contactStore = v4->_contactStore;
    v4->_contactStore = (CNContactStore *)v6;

    id v8 = objc_alloc((Class)UIDateLabel);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    id v12 = [v8 initWithFrame:CGRectZero.origin.x, y, width, height];
    [v12 setAdjustsFontForContentSizeCategory:1];
    [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
    v13 = +[UIColor dynamicCarPrimaryColor];
    [v12 setTextColor:v13];

    v14 = +[UIColor dynamicCarFocusedPrimaryLabelColor];
    [v12 setHighlightedTextColor:v14];

    v15 = +[UIColor clearColor];
    [v12 setBackgroundColor:v15];

    v16 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCaption1];
    [v12 setFont:v16];

    v17 = [(PHCarPlayVoicemailTableViewCell *)v4 contentView];
    [v17 addSubview:v12];

    [(PHCarPlayVoicemailTableViewCell *)v4 setDateLabel:v12];
    id v18 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    [v18 setAdjustsFontForContentSizeCategory:1];
    [v18 setTranslatesAutoresizingMaskIntoConstraints:0];
    v19 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCallout];
    [v18 setFont:v19];

    v20 = +[UIColor dynamicLabelColor];
    [v18 setTextColor:v20];

    v21 = +[UIColor clearColor];
    [v18 setBackgroundColor:v21];

    v22 = +[UIColor dynamicCarFocusedLabelColor];
    [v18 setHighlightedTextColor:v22];

    v23 = [(PHCarPlayVoicemailTableViewCell *)v4 contentView];
    [v23 addSubview:v18];

    [(PHCarPlayVoicemailTableViewCell *)v4 setNameLabel:v18];
    id v24 = objc_alloc((Class)UIImageView);
    v25 = UIImageGetUnreadIndicator();
    id v78 = [v24 initWithImage:v25];

    [v78 setTranslatesAutoresizingMaskIntoConstraints:0];
    v26 = [(PHCarPlayVoicemailTableViewCell *)v4 contentView];
    [v26 addSubview:v78];

    [(PHCarPlayVoicemailTableViewCell *)v4 setUnreadIndicatorImageView:v78];
    v27 = +[UIImage phCarPlayImageNamed:@"carplay_voicemail_unread_indicator"];
    v28 = +[UIColor blackColor];
    v29 = [v27 _flatImageWithColor:v28];
    v30 = [(PHCarPlayVoicemailTableViewCell *)v4 unreadIndicatorImageView];
    [v30 setHighlightedImage:v29];

    v31 = +[UIImage phCarPlayImageNamed:@"carplay_voicemail_unread_indicator"];
    v32 = +[UIColor dynamicCarFocusedColor];
    v33 = [v31 _flatImageWithColor:v32];
    v34 = [(PHCarPlayVoicemailTableViewCell *)v4 unreadIndicatorImageView];
    [v34 setImage:v33];

    v35 = [(PHCarPlayVoicemailTableViewCell *)v4 unreadIndicatorImageView];
    [v35 setTintColor:0];

    id v36 = objc_alloc_init((Class)UIStackView);
    [(PHCarPlayVoicemailTableViewCell *)v4 setStackView:v36];

    v37 = [(PHCarPlayVoicemailTableViewCell *)v4 stackView];
    [v37 setAxis:0];

    v38 = [(PHCarPlayVoicemailTableViewCell *)v4 stackView];
    [v38 setDistribution:0];

    v39 = [(PHCarPlayVoicemailTableViewCell *)v4 stackView];
    [v39 setAlignment:5];

    v40 = [(PHCarPlayVoicemailTableViewCell *)v4 stackView];
    [v40 setTranslatesAutoresizingMaskIntoConstraints:0];

    v41 = [(PHCarPlayVoicemailTableViewCell *)v4 stackView];
    [v41 setSpacing:4.0];

    v42 = [(PHCarPlayVoicemailTableViewCell *)v4 contentView];
    v43 = [(PHCarPlayVoicemailTableViewCell *)v4 stackView];
    [v42 addSubview:v43];

    v80[0] = @"dateLabel";
    v44 = [(PHCarPlayVoicemailTableViewCell *)v4 dateLabel];
    v81[0] = v44;
    v80[1] = @"nameLabel";
    v45 = [(PHCarPlayVoicemailTableViewCell *)v4 nameLabel];
    v81[1] = v45;
    v80[2] = @"unreadIndicator";
    v46 = [(PHCarPlayVoicemailTableViewCell *)v4 unreadIndicatorImageView];
    v81[2] = v46;
    v80[3] = @"stackView";
    v47 = [(PHCarPlayVoicemailTableViewCell *)v4 stackView];
    v81[3] = v47;
    v48 = +[NSDictionary dictionaryWithObjects:v81 forKeys:v80 count:4];

    v49 = [(PHCarPlayVoicemailTableViewCell *)v4 contentView];
    v50 = [(PHCarPlayVoicemailTableViewCell *)v4 dateLabel];
    v51 = [(PHCarPlayVoicemailTableViewCell *)v4 contentView];
    v52 = +[NSLayoutConstraint constraintWithItem:v50 attribute:6 relatedBy:0 toItem:v51 attribute:6 multiplier:1.0 constant:-8.0];
    [v49 addConstraint:v52];

    v53 = [(PHCarPlayVoicemailTableViewCell *)v4 contentView];
    v54 = [(PHCarPlayVoicemailTableViewCell *)v4 dateLabel];
    v55 = [(PHCarPlayVoicemailTableViewCell *)v4 contentView];
    v56 = +[NSLayoutConstraint constraintWithItem:v54 attribute:10 relatedBy:0 toItem:v55 attribute:10 multiplier:1.0 constant:0.0];
    [v53 addConstraint:v56];

    v57 = [(PHCarPlayVoicemailTableViewCell *)v4 contentView];
    v58 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"|-35-[nameLabel]", 0, 0, v48);
    [v57 addConstraints:v58];

    v59 = [(PHCarPlayVoicemailTableViewCell *)v4 contentView];
    unreadIndicatorImageView = v4->_unreadIndicatorImageView;
    v61 = [(PHCarPlayVoicemailTableViewCell *)v4 contentView];
    v62 = +[NSLayoutConstraint constraintWithItem:unreadIndicatorImageView attribute:9 relatedBy:0 toItem:v61 attribute:5 multiplier:1.0 constant:17.5];
    [v59 addConstraint:v62];

    v63 = [(PHCarPlayVoicemailTableViewCell *)v4 nameLabel];
    v64 = [(PHCarPlayVoicemailTableViewCell *)v4 contentView];
    [(PHCarPlayVoicemailTableViewCell *)v4 nameLabelBaselineConstraintConstant];
    v66 = +[NSLayoutConstraint constraintWithItem:v63 attribute:11 relatedBy:0 toItem:v64 attribute:3 multiplier:1.0 constant:v65];
    [(PHCarPlayVoicemailTableViewCell *)v4 setNameLabelBaselineConstraint:v66];

    v67 = [(PHCarPlayVoicemailTableViewCell *)v4 contentView];
    v68 = [(PHCarPlayVoicemailTableViewCell *)v4 nameLabelBaselineConstraint];
    [v67 addConstraint:v68];

    v69 = [(PHCarPlayVoicemailTableViewCell *)v4 contentView];
    v70 = [(PHCarPlayVoicemailTableViewCell *)v4 unreadIndicatorImageView];
    v71 = [(PHCarPlayVoicemailTableViewCell *)v4 contentView];
    v72 = +[NSLayoutConstraint constraintWithItem:v70 attribute:10 relatedBy:0 toItem:v71 attribute:10 multiplier:1.0 constant:0.0];
    [v69 addConstraint:v72];

    v73 = [(PHCarPlayVoicemailTableViewCell *)v4 contentView];
    v74 = [(PHCarPlayVoicemailTableViewCell *)v4 nameLabel];
    v75 = [(PHCarPlayVoicemailTableViewCell *)v4 dateLabel];
    v76 = +[NSLayoutConstraint constraintWithItem:v74 attribute:6 relatedBy:-1 toItem:v75 attribute:5 multiplier:1.0 constant:-10.0];
    [v73 addConstraint:v76];
  }
  return v4;
}

- (double)nameLabelBaselineConstraintConstant
{
  v3 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCallout];
  v4 = [(PHCarPlayVoicemailTableViewCell *)self subtitleLabel];
  if (v4)
  {
    [v3 _scaledValueForValue:20.0];
    double v6 = v5;
  }
  else
  {
    v7 = [(PHCarPlayVoicemailTableViewCell *)self badgeView];
    double v8 = 28.5;
    if (v7) {
      double v8 = 20.0;
    }
    [v3 _scaledValueForValue:v8];
    double v6 = v9;
  }
  return v6;
}

- (double)subtitleLabelBaselineConstraintConstant
{
  v2 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCallout];
  [v2 _scaledValueForValue:-7.5];
  double v4 = v3;

  return v4;
}

- (id)disabledTextColor
{
  return +[UIColor dynamicCarTertiaryColor];
}

- (void)setRepresentedVoicemail:(id)a3 isRestrictedMessage:(BOOL)a4
{
  BOOL v4 = a4;
  id v42 = a3;
  [(PHCarPlayVoicemailTableViewCell *)self setRepresentedVoicemail:v42];
  [(PHCarPlayVoicemailTableViewCell *)self setRestrictedMessage:v4];
  double v6 = [(PHCarPlayVoicemailTableViewCell *)self contactStore];
  v7 = [v42 displayNameUsingContactStore:v6];

  if (![v7 length])
  {
    double v8 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v9 = [v8 localizedStringForKey:@"UNKNOWN" value:&stru_100285990 table:@"PHCarPlay"];

    v7 = (void *)v9;
  }
  v10 = [(PHCarPlayVoicemailTableViewCell *)self nameLabel];
  [v10 setText:v7];

  v11 = [v42 date];
  id v12 = [(PHCarPlayVoicemailTableViewCell *)self dateLabel];
  [v12 setDate:v11];

  uint64_t v13 = [v42 isRead] & !v4;
  v14 = [(PHCarPlayVoicemailTableViewCell *)self unreadIndicatorImageView];
  [v14 setHidden:v13];

  v15 = [(PHCarPlayVoicemailTableViewCell *)self unreadIndicatorImageView];
  [v15 setTintColor:0];

  if (!v4) {
    +[UIColor dynamicLabelColor];
  }
  else {
  v16 = [(PHCarPlayVoicemailTableViewCell *)self disabledTextColor];
  }
  v17 = [(PHCarPlayVoicemailTableViewCell *)self nameLabel];
  [v17 setTextColor:v16];

  if (v4) {
    [(PHCarPlayVoicemailTableViewCell *)self disabledTextColor];
  }
  else {
  id v18 = +[UIColor dynamicCarPrimaryColor];
  }
  v19 = [(PHCarPlayVoicemailTableViewCell *)self dateLabel];
  [v19 setTextColor:v18];

  if (v4)
  {
    v20 = [(PHCarPlayVoicemailTableViewCell *)self nameLabel];
    v21 = [v20 font];
    [v21 pointSize];
    v23 = +[UIImage tpImageForSymbolType:42 pointSize:v22 * 0.85];
    id v24 = +[UIColor blackColor];
    v25 = [v23 tpFlattenedWithColor:v24];
  }
  else
  {
    v25 = +[UIImage phCarPlayImageNamed:@"carplay_voicemail_unread_indicator"];
  }
  v26 = +[UIColor blackColor];
  v27 = [v25 _flatImageWithColor:v26];

  v28 = +[UIColor dynamicCarFocusedColor];
  v29 = [v25 _flatImageWithColor:v28];

  v30 = [(PHCarPlayVoicemailTableViewCell *)self unreadIndicatorImageView];
  [v30 setImage:v29];

  v31 = [(PHCarPlayVoicemailTableViewCell *)self unreadIndicatorImageView];
  [v31 setHighlightedImage:v27];

  if (+[PHDevice isGeminiCapable])
  {
    v32 = +[PHApplicationServices sharedInstance];
    v33 = [v32 callProviderManager];

    v34 = [v33 telephonyProvider];
    v35 = [v34 prioritizedSenderIdentities];
    if ((unint64_t)[v35 count] <= 1)
    {
    }
    else
    {
      id v36 = [v42 receiverDestinationID];
      id v37 = [v36 length];

      if (!v37)
      {
LABEL_19:

        goto LABEL_20;
      }
      v41 = [v33 telephonyProvider];
      v38 = [v42 receiverDestinationID];
      v39 = +[TUHandle handleWithDestinationID:v38];
      v40 = [v41 senderIdentityForHandle:v39];
      v34 = [v40 localizedShortName];

      if ([v34 length]) {
        [(PHCarPlayVoicemailTableViewCell *)self setLocalizedSenderIdentityTitle:v34];
      }
    }

    goto LABEL_19;
  }
LABEL_20:
  [(PHCarPlayVoicemailTableViewCell *)self updatePendingState];
}

- (void)setLocalizedSenderIdentityTitle:(id)a3
{
  id v10 = a3;
  if (!-[NSString isEqualToString:](self->_localizedSenderIdentityTitle, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_localizedSenderIdentityTitle, a3);
    if ([v10 length])
    {
      id v5 = [objc_alloc((Class)TPBadgeView) initWithTitle:v10 theme:5];
      [v5 setSizeCategory:4];
      double v6 = [(PHCarPlayVoicemailTableViewCell *)self badgeView];

      if (v6)
      {
        v7 = [(PHCarPlayVoicemailTableViewCell *)self badgeView];
        [v7 setTitle:v10];
      }
      else
      {
        uint64_t v9 = [(PHCarPlayVoicemailTableViewCell *)self stackView];
        [v9 insertArrangedSubview:v5 atIndex:0];

        [(PHCarPlayVoicemailTableViewCell *)self setBadgeView:v5];
      }
    }
    else
    {
      double v8 = [(PHCarPlayVoicemailTableViewCell *)self badgeView];
      [v8 removeFromSuperview];

      [(PHCarPlayVoicemailTableViewCell *)self setBadgeView:0];
    }
  }
  [(PHCarPlayVoicemailTableViewCell *)self _updateConstraints];
}

- (void)updatePendingState
{
  double v3 = [(PHCarPlayVoicemailTableViewCell *)self representedVoicemail];
  unsigned int v4 = [v3 isDataAvailable];

  [(PHCarPlayVoicemailTableViewCell *)self setPendingState:v4 ^ 1];
}

- (void)setPendingState:(BOOL)a3
{
  if (a3)
  {
    unsigned int v4 = +[NSBundle bundleForClass:objc_opt_class()];
    id v6 = [v4 localizedStringForKey:@"DOWNLOAD_PENDING" value:&stru_100285990 table:@"PHCarPlay"];
  }
  else
  {
    unsigned int v4 = +[PHCarPlayVoicemailManager sharedVoicemailManager];
    id v5 = [(PHCarPlayVoicemailTableViewCell *)self representedVoicemail];
    id v6 = [v4 localizedSubtitleForMessage:v5];
  }
  [(PHCarPlayVoicemailTableViewCell *)self setSubtitleString:v6];
}

- (void)setSubtitleString:(id)a3
{
  id v14 = a3;
  if (v14
    && ([(PHCarPlayVoicemailTableViewCell *)self subtitleLabel],
        unsigned int v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        !v4))
  {
    v7 = (UILabel *)objc_alloc_init((Class)UILabel);
    subtitleLabel = self->_subtitleLabel;
    self->_subtitleLabel = v7;

    [(UILabel *)self->_subtitleLabel setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)self->_subtitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)self->_subtitleLabel setText:v14];
    uint64_t v9 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCaption1];
    [(UILabel *)self->_subtitleLabel setFont:v9];

    if ([(PHCarPlayVoicemailTableViewCell *)self isRestrictedMessage]) {
      [(PHCarPlayVoicemailTableViewCell *)self disabledTextColor];
    }
    else {
    id v10 = +[UIColor dynamicCarSecondaryColor];
    }
    [(UILabel *)self->_subtitleLabel setTextColor:v10];

    v11 = +[UIColor clearColor];
    [(UILabel *)self->_subtitleLabel setBackgroundColor:v11];

    id v12 = +[UIColor blackColor];
    [(UILabel *)self->_subtitleLabel setHighlightedTextColor:v12];

    uint64_t v13 = [(PHCarPlayVoicemailTableViewCell *)self stackView];
    [v13 addArrangedSubview:self->_subtitleLabel];
  }
  else if (![v14 length])
  {
    id v5 = [(PHCarPlayVoicemailTableViewCell *)self subtitleLabel];

    if (v5)
    {
      id v6 = [(PHCarPlayVoicemailTableViewCell *)self subtitleLabel];
      [v6 removeFromSuperview];

      [(PHCarPlayVoicemailTableViewCell *)self setSubtitleLabel:0];
    }
  }
  [(PHCarPlayVoicemailTableViewCell *)self _updateConstraints];
}

- (void)_updateConstraints
{
  double v3 = [(PHCarPlayVoicemailTableViewCell *)self subtitleLabel];
  if (v3)
  {
  }
  else
  {
    unsigned int v4 = [(PHCarPlayVoicemailTableViewCell *)self badgeView];

    if (!v4) {
      goto LABEL_5;
    }
  }
  id v5 = [(PHCarPlayVoicemailTableViewCell *)self contentView];
  id v6 = [(PHCarPlayVoicemailTableViewCell *)self stackView];
  v7 = [(PHCarPlayVoicemailTableViewCell *)self nameLabel];
  double v8 = +[NSLayoutConstraint constraintWithItem:v6 attribute:5 relatedBy:0 toItem:v7 attribute:5 multiplier:1.0 constant:0.0];
  [v5 addConstraint:v8];

  uint64_t v9 = [(PHCarPlayVoicemailTableViewCell *)self stackView];
  id v10 = [(PHCarPlayVoicemailTableViewCell *)self contentView];
  [(PHCarPlayVoicemailTableViewCell *)self subtitleLabelBaselineConstraintConstant];
  id v12 = +[NSLayoutConstraint constraintWithItem:v9 attribute:11 relatedBy:0 toItem:v10 attribute:4 multiplier:1.0 constant:v11];
  [(PHCarPlayVoicemailTableViewCell *)self setSubtitleLabelBaselineConstraint:v12];

  uint64_t v13 = [(PHCarPlayVoicemailTableViewCell *)self contentView];
  id v14 = [(PHCarPlayVoicemailTableViewCell *)self subtitleLabelBaselineConstraint];
  [v13 addConstraint:v14];

LABEL_5:
  [(PHCarPlayVoicemailTableViewCell *)self nameLabelBaselineConstraintConstant];
  double v16 = v15;
  id v17 = [(PHCarPlayVoicemailTableViewCell *)self nameLabelBaselineConstraint];
  [v17 setConstant:v16];
}

- (void)traitCollectionDidChange:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)PHCarPlayVoicemailTableViewCell;
  id v4 = a3;
  [(PHCarPlayVoicemailTableViewCell *)&v14 traitCollectionDidChange:v4];
  id v5 = [(PHCarPlayVoicemailTableViewCell *)self traitCollection];
  id v6 = [v5 preferredContentSizeCategory];
  v7 = [v4 preferredContentSizeCategory];

  if (v6 != v7)
  {
    [(PHCarPlayVoicemailTableViewCell *)self nameLabelBaselineConstraintConstant];
    double v9 = v8;
    id v10 = [(PHCarPlayVoicemailTableViewCell *)self nameLabelBaselineConstraint];
    [v10 setConstant:v9];

    [(PHCarPlayVoicemailTableViewCell *)self subtitleLabelBaselineConstraintConstant];
    double v12 = v11;
    uint64_t v13 = [(PHCarPlayVoicemailTableViewCell *)self subtitleLabelBaselineConstraint];
    [v13 setConstant:v12];
  }
}

- (NSString)localizedSenderIdentityTitle
{
  return self->_localizedSenderIdentityTitle;
}

- (MPMessage)representedVoicemail
{
  return self->_representedVoicemail;
}

- (void)setRepresentedVoicemail:(id)a3
{
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (UILabel)nameLabel
{
  return (UILabel *)objc_getProperty(self, a2, 56, 1);
}

- (void)setNameLabel:(id)a3
{
}

- (NSLayoutConstraint)nameLabelBaselineConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 64, 1);
}

- (void)setNameLabelBaselineConstraint:(id)a3
{
}

- (NSLayoutConstraint)subtitleLabelBaselineConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSubtitleLabelBaselineConstraint:(id)a3
{
}

- (UILabel)subtitleLabel
{
  return (UILabel *)objc_getProperty(self, a2, 80, 1);
}

- (void)setSubtitleLabel:(id)a3
{
}

- (UIDateLabel)dateLabel
{
  return (UIDateLabel *)objc_getProperty(self, a2, 88, 1);
}

- (void)setDateLabel:(id)a3
{
}

- (UIImageView)unreadIndicatorImageView
{
  return (UIImageView *)objc_getProperty(self, a2, 96, 1);
}

- (void)setUnreadIndicatorImageView:(id)a3
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

- (BOOL)isRestrictedMessage
{
  return self->_restrictedMessage;
}

- (void)setRestrictedMessage:(BOOL)a3
{
  self->_restrictedMessage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_unreadIndicatorImageView, 0);
  objc_storeStrong((id *)&self->_dateLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabelBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_nameLabelBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_representedVoicemail, 0);

  objc_storeStrong((id *)&self->_localizedSenderIdentityTitle, 0);
}

@end