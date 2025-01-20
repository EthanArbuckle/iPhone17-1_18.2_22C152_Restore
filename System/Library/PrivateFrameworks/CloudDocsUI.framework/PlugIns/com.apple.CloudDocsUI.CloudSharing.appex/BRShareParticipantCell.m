@interface BRShareParticipantCell
- (BRShareParticipantCellValue)representedValue;
- (CNAvatarViewController)avatarViewController;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (UIView)participantColorView;
- (void)_setupWithAvatar:(BOOL)a3 subtitle:(BOOL)a4 participantColor:(BOOL)a5;
- (void)prepareForReuse;
- (void)setAvatarViewController:(id)a3;
- (void)setParticipantColorView:(id)a3;
- (void)setRepresentedValue:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation BRShareParticipantCell

- (void)_setupWithAvatar:(BOOL)a3 subtitle:(BOOL)a4 participantColor:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  if (a3)
  {
    BOOL v8 = a4;
    avatarViewController = self->_avatarViewController;
    if (!avatarViewController)
    {
      v10 = (CNAvatarViewController *)objc_alloc_init((Class)CNAvatarViewController);
      v11 = self->_avatarViewController;
      self->_avatarViewController = v10;

      v12 = [(CNAvatarViewController *)self->_avatarViewController view];
      [v12 setTranslatesAutoresizingMaskIntoConstraints:0];

      avatarViewController = self->_avatarViewController;
    }
    v13 = [(CNAvatarViewController *)avatarViewController view];
    [(BRShareParticipantCell *)self addSubview:v13];
    v14 = objc_opt_new();
    v15 = [v13 heightAnchor];
    v16 = [v15 constraintEqualToConstant:32.0];
    [v14 addObject:v16];

    v17 = [v13 widthAnchor];
    v18 = [v17 constraintEqualToConstant:32.0];
    [v14 addObject:v18];

    v19 = [v13 leadingAnchor];
    v20 = [(BRShareParticipantCell *)self layoutMarginsGuide];
    v21 = [v20 leadingAnchor];
    v22 = [v19 constraintEqualToAnchor:v21];
    [v14 addObject:v22];

    v23 = [v13 topAnchor];
    v24 = [(BRShareParticipantCell *)self topAnchor];
    v25 = [v23 constraintEqualToAnchor:v24 constant:6.0];
    [v14 addObject:v25];

    v26 = [(BRShareParticipantCell *)self bottomAnchor];
    v27 = [v13 bottomAnchor];
    v28 = [v26 constraintEqualToAnchor:v27 constant:6.0];
    [v14 addObject:v28];

    v29 = (NSArray *)[v14 copy];
    avatarConstraints = self->_avatarConstraints;
    self->_avatarConstraints = v29;

    +[NSLayoutConstraint activateConstraints:self->_avatarConstraints];
    BOOL v6 = v8;
  }
  else
  {
    if (!self->_avatarConstraints) {
      goto LABEL_8;
    }
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:");
    v13 = [(CNAvatarViewController *)self->_avatarViewController view];
    [v13 removeFromSuperview];
  }

LABEL_8:
  if (self->_textConstraints) {
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:");
  }
  if (!self->_titleLabel)
  {
    v31 = (UILabel *)objc_opt_new();
    titleLabel = self->_titleLabel;
    self->_titleLabel = v31;

    [(UILabel *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v33 = +[UIFont systemFontOfSize:17.0 weight:UIFontWeightRegular];
    [(UILabel *)self->_titleLabel setFont:v33];

    [(UILabel *)self->_titleLabel setLineBreakMode:5];
    [(BRShareParticipantCell *)self addSubview:self->_titleLabel];
  }
  subtitleLabel = self->_subtitleLabel;
  if (v6)
  {
    if (!subtitleLabel)
    {
      v35 = (UILabel *)objc_opt_new();
      v36 = self->_subtitleLabel;
      self->_subtitleLabel = v35;

      [(UILabel *)self->_subtitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
      v37 = +[UIFont systemFontOfSize:12.0 weight:UIFontWeightRegular];
      [(UILabel *)self->_subtitleLabel setFont:v37];

      subtitleLabel = self->_subtitleLabel;
    }
    [(BRShareParticipantCell *)self addSubview:subtitleLabel];
  }
  else
  {
    [(UILabel *)self->_subtitleLabel removeFromSuperview];
  }
  uint64_t v98 = 64;
  if (v5)
  {
    if (!self->_participantColorView)
    {
      v38 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, 16.0, 16.0);
      participantColorView = self->_participantColorView;
      self->_participantColorView = v38;

      [(UIView *)self->_participantColorView setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UIView *)self->_participantColorView frame];
      double v41 = v40 * 0.5;
      v42 = [(UIView *)self->_participantColorView layer];
      [v42 setCornerRadius:v41];
    }
    v43 = [(BRShareParticipantCell *)self contentView];
    [v43 addSubview:self->_participantColorView];

    v44 = objc_opt_new();
    v45 = [(UIView *)self->_participantColorView heightAnchor];
    v46 = [v45 constraintEqualToConstant:16.0];
    [v44 addObject:v46];

    v47 = [(UIView *)self->_participantColorView widthAnchor];
    v48 = [v47 constraintEqualToConstant:16.0];
    [v44 addObject:v48];

    v49 = [(UIView *)self->_participantColorView leadingAnchor];
    v50 = [(BRShareParticipantCell *)self titleLabel];
    v51 = [v50 trailingAnchor];
    v52 = [v49 constraintEqualToAnchor:v51 constant:8.0];
    [v44 addObject:v52];

    v53 = [(UIView *)self->_participantColorView trailingAnchor];
    v54 = [(BRShareParticipantCell *)self contentView];
    v55 = [v54 trailingAnchor];
    v56 = [v53 constraintEqualToAnchor:v55 constant:-8.0];
    [v44 addObject:v56];

    v57 = [(UIView *)self->_participantColorView centerYAnchor];
    v58 = [(BRShareParticipantCell *)self contentView];
    v59 = [v58 centerYAnchor];
    v60 = [v57 constraintEqualToAnchor:v59 constant:0.0];
    [v44 addObject:v60];

    v61 = (NSArray *)[v44 copy];
    participantColorConstraints = self->_participantColorConstraints;
    self->_participantColorConstraints = v61;

    +[NSLayoutConstraint activateConstraints:self->_participantColorConstraints];
  }
  else if (self->_participantColorConstraints)
  {
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:");
    [(UIView *)self->_participantColorView removeFromSuperview];
  }
  if (!self->_textCenterLayoutGuide)
  {
    v63 = (UILayoutGuide *)objc_opt_new();
    textCenterLayoutGuide = self->_textCenterLayoutGuide;
    self->_textCenterLayoutGuide = v63;

    [(BRShareParticipantCell *)self addLayoutGuide:self->_textCenterLayoutGuide];
    v65 = [(UILayoutGuide *)self->_textCenterLayoutGuide leadingAnchor];
    v66 = [(BRShareParticipantCell *)self layoutMarginsGuide];
    v67 = [v66 leadingAnchor];
    v68 = [v65 constraintEqualToAnchor:v67 constant:48.0];
    [v68 setActive:1];

    v69 = [(BRShareParticipantCell *)self trailingAnchor];
    v70 = [(UILayoutGuide *)self->_textCenterLayoutGuide trailingAnchor];
    v71 = [v69 constraintEqualToAnchor:v70 constant:32.0];

    LODWORD(v72) = 1147207680;
    [v71 setPriority:v72];
    [v71 setActive:1];
    v73 = [(BRShareParticipantCell *)self centerYAnchor];
    v74 = [(UILayoutGuide *)self->_textCenterLayoutGuide centerYAnchor];
    v75 = [v73 constraintEqualToAnchor:v74];
    [v75 setActive:1];
  }
  +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", self->_textConstraints, v98);
  id v100 = (id)objc_opt_new();
  v76 = [(UILayoutGuide *)self->_textCenterLayoutGuide topAnchor];
  v77 = [(UILabel *)self->_titleLabel topAnchor];
  v78 = [v76 constraintEqualToAnchor:v77];
  [v100 addObject:v78];

  v79 = [(UILabel *)self->_titleLabel leadingAnchor];
  v80 = [(UILayoutGuide *)self->_textCenterLayoutGuide leadingAnchor];
  v81 = [v79 constraintEqualToAnchor:v80];
  [v100 addObject:v81];

  v82 = [(UILabel *)self->_titleLabel trailingAnchor];
  v83 = [(UILayoutGuide *)self->_textCenterLayoutGuide trailingAnchor];
  v84 = [v82 constraintEqualToAnchor:v83];
  [v100 addObject:v84];

  v85 = [(UILayoutGuide *)self->_textCenterLayoutGuide bottomAnchor];
  if (v6)
  {
    v86 = [*(id *)((char *)&self->super.super.super.super.isa + v99) bottomAnchor];
    v87 = [v85 constraintEqualToAnchor:v86];
    [v100 addObject:v87];

    v88 = [*(id *)((char *)&self->super.super.super.super.isa + v99) firstBaselineAnchor];
    v89 = [(UILabel *)self->_titleLabel firstBaselineAnchor];
    v90 = [v88 constraintEqualToAnchor:v89 constant:16.0];
    [v100 addObject:v90];

    v91 = [*(id *)((char *)&self->super.super.super.super.isa + v99) leadingAnchor];
    v92 = [(UILayoutGuide *)self->_textCenterLayoutGuide leadingAnchor];
    v93 = [v91 constraintEqualToAnchor:v92];
    [v100 addObject:v93];

    v85 = [*(id *)((char *)&self->super.super.super.super.isa + v99) trailingAnchor];
    [(UILayoutGuide *)self->_textCenterLayoutGuide trailingAnchor];
  }
  else
  {
    [(UILabel *)self->_titleLabel bottomAnchor];
  v94 = };
  v95 = [v85 constraintEqualToAnchor:v94];
  [v100 addObject:v95];

  v96 = (NSArray *)[v100 copy];
  textConstraints = self->_textConstraints;
  self->_textConstraints = v96;

  +[NSLayoutConstraint activateConstraints:self->_textConstraints];
}

- (void)setRepresentedValue:(id)a3
{
  BOOL v6 = (BRShareParticipantCellValue *)a3;
  p_representedValue = (id *)&self->_representedValue;
  if (self->_representedValue != v6)
  {
    objc_storeStrong((id *)&self->_representedValue, a3);
    if (*p_representedValue)
    {
      BOOL v8 = [(BRShareParticipantCellValue *)v6 contact];
      uint64_t v3 = v8 != 0;
      v9 = [(BRShareParticipantCellValue *)v6 subtitle];
      BOOL v10 = [v9 length] != 0;
      v11 = [(BRShareParticipantCellValue *)v6 participantColor];
      [(BRShareParticipantCell *)self _setupWithAvatar:v3 subtitle:v10 participantColor:v11 != 0];
    }
    v12 = [(BRShareParticipantCellValue *)v6 contact];
    if (v12)
    {
      uint64_t v3 = [(BRShareParticipantCellValue *)v6 contact];
      uint64_t v21 = v3;
      v13 = +[NSArray arrayWithObjects:&v21 count:1];
    }
    else
    {
      v13 = &__NSArray0__struct;
    }
    v14 = [(BRShareParticipantCell *)self avatarViewController];
    [v14 setContacts:v13];

    if (v12)
    {
    }
    v15 = [(BRShareParticipantCellValue *)v6 title];
    [(UILabel *)self->_titleLabel setText:v15];

    v16 = [(BRShareParticipantCellValue *)v6 subtitle];
    [(UILabel *)self->_subtitleLabel setText:v16];

    if ([(BRShareParticipantCellValue *)v6 grayedOut]) {
      +[UIColor secondaryLabelColor];
    }
    else {
    v17 = +[UIColor labelColor];
    }
    [(UILabel *)self->_titleLabel setTextColor:v17];
    v18 = +[UIColor secondaryLabelColor];
    [(UILabel *)self->_subtitleLabel setTextColor:v18];

    v19 = [*p_representedValue participantColor];
    if (v19) {
      [*p_representedValue participantColor];
    }
    else {
    v20 = +[UIColor clearColor];
    }
    [(UIView *)self->_participantColorView setBackgroundColor:v20];
  }
}

- (void)prepareForReuse
{
  [(BRShareParticipantCell *)self setRepresentedValue:0];
  v3.receiver = self;
  v3.super_class = (Class)BRShareParticipantCell;
  [(BRShareParticipantCell *)&v3 prepareForReuse];
}

- (BRShareParticipantCellValue)representedValue
{
  return self->_representedValue;
}

- (CNAvatarViewController)avatarViewController
{
  return self->_avatarViewController;
}

- (void)setAvatarViewController:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
}

- (UIView)participantColorView
{
  return self->_participantColorView;
}

- (void)setParticipantColorView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participantColorView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_avatarViewController, 0);
  objc_storeStrong((id *)&self->_representedValue, 0);
  objc_storeStrong((id *)&self->_textCenterLayoutGuide, 0);
  objc_storeStrong((id *)&self->_participantColorConstraints, 0);
  objc_storeStrong((id *)&self->_textConstraints, 0);

  objc_storeStrong((id *)&self->_avatarConstraints, 0);
}

@end