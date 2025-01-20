@interface PHCarPlayRecentsOngoingMultiwayTableViewCell
- (BOOL)showsOutgoingCallIcon;
- (NSLayoutConstraint)nameLabelVerticalLayoutConstraint;
- (PHCarPlayRecentsOngoingMultiwayTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (TPBadgeView)badgeView;
- (UIImageView)joinCallImageView;
- (UIImageView)outgoingCallIconImageView;
- (UILabel)nameLabel;
- (UILabel)phoneNumberTypeLabel;
- (UIStackView)stackView;
- (void)setBadgeView:(id)a3;
- (void)setJoinCallImageView:(id)a3;
- (void)setNameLabel:(id)a3;
- (void)setNameLabelVerticalLayoutConstraint:(id)a3;
- (void)setOutgoingCallIconImageView:(id)a3;
- (void)setPhoneNumberTypeLabel:(id)a3;
- (void)setShowsOutgoingCallIcon:(BOOL)a3;
- (void)setStackView:(id)a3;
@end

@implementation PHCarPlayRecentsOngoingMultiwayTableViewCell

- (PHCarPlayRecentsOngoingMultiwayTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v86.receiver = self;
  v86.super_class = (Class)PHCarPlayRecentsOngoingMultiwayTableViewCell;
  v4 = [(PHCarPlayGenericTableViewCell *)&v86 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    id v5 = objc_alloc((Class)UIImageView);
    v6 = +[NSBundle mainBundle];
    v7 = +[UIImage phCarPlayImageNamed:@"carplay_facetime_join_button" inBundle:v6];
    id v8 = [v5 initWithImage:v7];

    id v9 = v8;
    v85 = v8;
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    v10 = [(PHCarPlayRecentsOngoingMultiwayTableViewCell *)v4 contentView];
    [v10 addSubview:v9];

    [(PHCarPlayRecentsOngoingMultiwayTableViewCell *)v4 setJoinCallImageView:v9];
    id v11 = objc_alloc((Class)UILabel);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    id v15 = [v11 initWithFrame:CGRectZero.origin.x, y, width, height];
    [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
    v16 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCallout];
    [v15 setFont:v16];

    v17 = +[UIColor systemGreenColor];
    [v15 setTextColor:v17];

    v18 = +[UIColor clearColor];
    [v15 setBackgroundColor:v18];

    v19 = +[UIColor dynamicCarFocusedLabelColor];
    [v15 setHighlightedTextColor:v19];

    v20 = [(PHCarPlayRecentsOngoingMultiwayTableViewCell *)v4 contentView];
    [v20 addSubview:v15];

    [(PHCarPlayRecentsOngoingMultiwayTableViewCell *)v4 setNameLabel:v15];
    id v21 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];

    [v21 setTranslatesAutoresizingMaskIntoConstraints:0];
    v22 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCaption1];
    [v21 setFont:v22];

    v23 = +[UIColor dynamicCarSecondaryColor];
    [v21 setTextColor:v23];

    v24 = +[UIColor clearColor];
    [v21 setBackgroundColor:v24];

    v25 = +[UIColor dynamicCarFocusedSecondaryLabelColor];
    v26 = v21;
    v84 = v21;
    [v21 setHighlightedTextColor:v25];

    v27 = +[NSBundle bundleForClass:objc_opt_class()];
    v28 = [v27 localizedStringForKey:@"FACETIME_ONGOING_MULTIWAY_DESCRIPTION" value:&stru_100285990 table:@"PHCarPlay"];
    [v26 setText:v28];

    [(PHCarPlayRecentsOngoingMultiwayTableViewCell *)v4 setPhoneNumberTypeLabel:v26];
    id v29 = objc_alloc_init((Class)UIStackView);
    [(PHCarPlayRecentsOngoingMultiwayTableViewCell *)v4 setStackView:v29];

    v30 = [(PHCarPlayRecentsOngoingMultiwayTableViewCell *)v4 stackView];
    [v30 setAxis:0];

    v31 = [(PHCarPlayRecentsOngoingMultiwayTableViewCell *)v4 stackView];
    [v31 setDistribution:2];

    v32 = [(PHCarPlayRecentsOngoingMultiwayTableViewCell *)v4 stackView];
    [v32 setAlignment:3];

    v33 = [(PHCarPlayRecentsOngoingMultiwayTableViewCell *)v4 stackView];
    [v33 setTranslatesAutoresizingMaskIntoConstraints:0];

    v34 = [(PHCarPlayRecentsOngoingMultiwayTableViewCell *)v4 stackView];
    [v34 setSpacing:8.0];

    v35 = [(PHCarPlayRecentsOngoingMultiwayTableViewCell *)v4 stackView];
    v36 = [(PHCarPlayRecentsOngoingMultiwayTableViewCell *)v4 phoneNumberTypeLabel];
    [v35 addArrangedSubview:v36];

    v37 = [(PHCarPlayRecentsOngoingMultiwayTableViewCell *)v4 contentView];
    v38 = [(PHCarPlayRecentsOngoingMultiwayTableViewCell *)v4 stackView];
    [v37 addSubview:v38];

    v88[0] = @"joinCallImageView";
    v39 = [(PHCarPlayRecentsOngoingMultiwayTableViewCell *)v4 joinCallImageView];
    v89[0] = v39;
    v88[1] = @"nameLabel";
    v40 = [(PHCarPlayRecentsOngoingMultiwayTableViewCell *)v4 nameLabel];
    v89[1] = v40;
    v88[2] = @"phoneNumberTypeLabel";
    v41 = [(PHCarPlayRecentsOngoingMultiwayTableViewCell *)v4 phoneNumberTypeLabel];
    v89[2] = v41;
    v88[3] = @"stackView";
    v42 = [(PHCarPlayRecentsOngoingMultiwayTableViewCell *)v4 stackView];
    v89[3] = v42;
    v83 = +[NSDictionary dictionaryWithObjects:v89 forKeys:v88 count:4];

    v43 = [(PHCarPlayRecentsOngoingMultiwayTableViewCell *)v4 nameLabel];
    v44 = [v43 lastBaselineAnchor];
    v45 = [(PHCarPlayRecentsOngoingMultiwayTableViewCell *)v4 contentView];
    v46 = [v45 topAnchor];
    v47 = [v44 constraintEqualToAnchor:v46 constant:20.0];
    [(PHCarPlayRecentsOngoingMultiwayTableViewCell *)v4 setNameLabelVerticalLayoutConstraint:v47];

    v82 = [(PHCarPlayRecentsOngoingMultiwayTableViewCell *)v4 nameLabelVerticalLayoutConstraint];
    v87[0] = v82;
    v81 = [(PHCarPlayRecentsOngoingMultiwayTableViewCell *)v4 joinCallImageView];
    v79 = [v81 centerYAnchor];
    v80 = [(PHCarPlayRecentsOngoingMultiwayTableViewCell *)v4 contentView];
    v78 = [v80 centerYAnchor];
    v77 = [v79 constraintEqualToAnchor:v78];
    v87[1] = v77;
    v76 = [(PHCarPlayRecentsOngoingMultiwayTableViewCell *)v4 joinCallImageView];
    v75 = [v76 heightAnchor];
    v74 = [v75 constraintEqualToConstant:32.0];
    v87[2] = v74;
    v73 = [(PHCarPlayRecentsOngoingMultiwayTableViewCell *)v4 joinCallImageView];
    v72 = [v73 widthAnchor];
    v71 = [v72 constraintEqualToConstant:32.0];
    v87[3] = v71;
    v70 = [(PHCarPlayRecentsOngoingMultiwayTableViewCell *)v4 nameLabel];
    v68 = [v70 trailingAnchor];
    v69 = [(PHCarPlayRecentsOngoingMultiwayTableViewCell *)v4 joinCallImageView];
    v67 = [v69 leadingAnchor];
    v65 = [v68 constraintLessThanOrEqualToAnchor:v67 constant:-5.0];
    v87[4] = v65;
    v64 = [(PHCarPlayRecentsOngoingMultiwayTableViewCell *)v4 stackView];
    v63 = [v64 lastBaselineAnchor];
    v48 = [(PHCarPlayRecentsOngoingMultiwayTableViewCell *)v4 contentView];
    v49 = [v48 bottomAnchor];
    v50 = [v63 constraintEqualToAnchor:v49 constant:-7.5];
    v87[5] = v50;
    v51 = [(PHCarPlayRecentsOngoingMultiwayTableViewCell *)v4 stackView];
    v52 = [v51 leadingAnchor];
    v53 = [(PHCarPlayRecentsOngoingMultiwayTableViewCell *)v4 nameLabel];
    v54 = [v53 leadingAnchor];
    v55 = [v52 constraintEqualToAnchor:v54];
    v87[6] = v55;
    v56 = +[NSArray arrayWithObjects:v87 count:7];
    id v66 = [v56 mutableCopy];

    v57 = +[NSLayoutConstraint constraintsWithVisualFormat:@"[joinCallImageView]-12-|" options:0 metrics:0 views:v83];
    [v66 addObjectsFromArray:v57];

    v58 = [(PHCarPlayRecentsOngoingMultiwayTableViewCell *)v4 nameLabel];
    v59 = [v58 leadingAnchor];
    v60 = [(PHCarPlayRecentsOngoingMultiwayTableViewCell *)v4 leadingAnchor];
    v61 = [v59 constraintEqualToAnchor:v60 constant:39.0];
    [v61 setActive:1];

    +[NSLayoutConstraint activateConstraints:v66];
  }
  return v4;
}

- (void)setShowsOutgoingCallIcon:(BOOL)a3
{
  if (self->_showsOutgoingCallIcon != a3)
  {
    BOOL v3 = a3;
    self->_showsOutgoingCallIcon = a3;
    if (a3)
    {
      id v5 = [(PHCarPlayRecentsOngoingMultiwayTableViewCell *)self outgoingCallIconImageView];

      if (!v5)
      {
        if (!carPlayOutgoingCallImage)
        {
          uint64_t v6 = +[UIImage tpImageForSymbolType:4 textStyle:UIFontTextStyleCallout scale:2 isStaticSize:0];
          v7 = (void *)carPlayOutgoingCallImage;
          carPlayOutgoingCallImage = v6;

          uint64_t v8 = [(id)carPlayOutgoingCallImage imageWithRenderingMode:2];
          id v9 = (void *)carPlayOutgoingCallImage;
          carPlayOutgoingCallImage = v8;
        }
        id v10 = objc_alloc((Class)UIImageView);
        id v11 = (UIImageView *)[v10 initWithImage:carPlayOutgoingCallImage];
        outgoingCallIconImageView = self->_outgoingCallIconImageView;
        self->_outgoingCallIconImageView = v11;

        v13 = self->_outgoingCallIconImageView;
        v14 = (void *)carPlayOutgoingCallImage;
        id v15 = +[UIColor blackColor];
        v16 = [v14 _flatImageWithColor:v15];
        [(UIImageView *)v13 setHighlightedImage:v16];

        [(UIImageView *)self->_outgoingCallIconImageView setTranslatesAutoresizingMaskIntoConstraints:0];
        v17 = [(PHCarPlayRecentsOngoingMultiwayTableViewCell *)self contentView];
        [v17 addSubview:self->_outgoingCallIconImageView];

        v18 = +[UIColor whiteColor];
        v19 = [(PHCarPlayRecentsOngoingMultiwayTableViewCell *)self contentView];
        [v19 setTintColor:v18];

        v20 = [(PHCarPlayRecentsOngoingMultiwayTableViewCell *)self contentView];
        id v21 = self->_outgoingCallIconImageView;
        v22 = [(PHCarPlayRecentsOngoingMultiwayTableViewCell *)self contentView];
        v23 = +[NSLayoutConstraint constraintWithItem:v21 attribute:10 relatedBy:0 toItem:v22 attribute:10 multiplier:1.0 constant:0.0];
        [v20 addConstraint:v23];

        v24 = [(PHCarPlayRecentsOngoingMultiwayTableViewCell *)self contentView];
        v25 = self->_outgoingCallIconImageView;
        CFStringRef v29 = @"OutgoingCallIconImageView";
        v30 = v25;
        v26 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
        v27 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"|-(12)-[OutgoingCallIconImageView]", 0, 0, v26);
        [v24 addConstraints:v27];
      }
    }
    v28 = [(PHCarPlayRecentsOngoingMultiwayTableViewCell *)self outgoingCallIconImageView];
    [v28 setHidden:!v3];
  }
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
}

- (UIImageView)joinCallImageView
{
  return self->_joinCallImageView;
}

- (void)setJoinCallImageView:(id)a3
{
}

- (NSLayoutConstraint)nameLabelVerticalLayoutConstraint
{
  return self->_nameLabelVerticalLayoutConstraint;
}

- (void)setNameLabelVerticalLayoutConstraint:(id)a3
{
}

- (UILabel)phoneNumberTypeLabel
{
  return self->_phoneNumberTypeLabel;
}

- (void)setPhoneNumberTypeLabel:(id)a3
{
}

- (BOOL)showsOutgoingCallIcon
{
  return self->_showsOutgoingCallIcon;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_outgoingCallIconImageView, 0);
  objc_storeStrong((id *)&self->_phoneNumberTypeLabel, 0);
  objc_storeStrong((id *)&self->_nameLabelVerticalLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_joinCallImageView, 0);

  objc_storeStrong((id *)&self->_nameLabel, 0);
}

@end