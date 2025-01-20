@interface HUContactDetailsTableViewCell
+ (BOOL)requiresConstraintBasedLayout;
- (CNAvatarView)avatarView;
- (CNContact)contact;
- (HUContactDetailsTableViewCell)initWithCoder:(id)a3;
- (HUContactDetailsTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSArray)constraints;
- (NSString)descriptionText;
- (NSString)titleText;
- (UIImage)photo;
- (UIImageView)photoView;
- (UILabel)descriptionLabel;
- (UILabel)titleLabel;
- (UIView)containerView;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setConstraints:(id)a3;
- (void)setContact:(id)a3;
- (void)setDescriptionText:(id)a3;
- (void)setPhoto:(id)a3;
- (void)setTitleText:(id)a3;
- (void)updateConstraints;
@end

@implementation HUContactDetailsTableViewCell

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (HUContactDetailsTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v32[2] = *MEMORY[0x1E4F143B8];
  v30.receiver = self;
  v30.super_class = (Class)HUContactDetailsTableViewCell;
  v4 = [(HUContactDetailsTableViewCell *)&v30 initWithStyle:0 reuseIdentifier:a4];
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F1BB38]);
    double v6 = *MEMORY[0x1E4F1DB28];
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v10 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], v7, v8, v9);
    avatarView = v4->_avatarView;
    v4->_avatarView = (CNAvatarView *)v10;

    uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42AA0]), "initWithFrame:", v6, v7, v8, v9);
    photoView = v4->_photoView;
    v4->_photoView = (UIImageView *)v12;

    uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v6, v7, v8, v9);
    containerView = v4->_containerView;
    v4->_containerView = (UIView *)v14;

    uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", v6, v7, v8, v9);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = (UILabel *)v16;

    uint64_t v18 = *MEMORY[0x1E4F438C8];
    v19 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F438C8]];
    [(UILabel *)v4->_titleLabel setFont:v19];

    uint64_t v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", v6, v7, v8, v9);
    descriptionLabel = v4->_descriptionLabel;
    v4->_descriptionLabel = (UILabel *)v20;

    v22 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:v18];
    [(UILabel *)v4->_descriptionLabel setFont:v22];

    v23 = [MEMORY[0x1E4F428B8] systemGrayColor];
    [(UILabel *)v4->_descriptionLabel setTextColor:v23];

    v24 = v4->_containerView;
    v32[0] = v4->_titleLabel;
    v32[1] = v4->_descriptionLabel;
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
    [(UIView *)v24 naui_addAutoLayoutSubviews:v25];

    v26 = [(HUContactDetailsTableViewCell *)v4 contentView];
    v31[0] = v4->_avatarView;
    v31[1] = v4->_containerView;
    v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
    objc_msgSend(v26, "naui_addAutoLayoutSubviews:", v27);

    v28 = [(HUContactDetailsTableViewCell *)v4 contentView];
    [v28 addSubview:v4->_photoView];
  }
  return v4;
}

- (HUContactDetailsTableViewCell)initWithCoder:(id)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  double v6 = NSStringFromSelector(sel_initWithStyle_reuseIdentifier_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUContactDetailsTableViewCell.m", 64, @"%s is unavailable; use %@ instead",
    "-[HUContactDetailsTableViewCell initWithCoder:]",
    v6);

  return 0;
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)HUContactDetailsTableViewCell;
  [(HUContactDetailsTableViewCell *)&v4 prepareForReuse];
  [(HUContactDetailsTableViewCell *)self setTitleText:0];
  [(HUContactDetailsTableViewCell *)self setDescriptionText:0];
  v3 = [(HUContactDetailsTableViewCell *)self avatarView];
  [v3 setContacts:MEMORY[0x1E4F1CBF0]];

  [(HUContactDetailsTableViewCell *)self setPhoto:0];
}

- (NSString)titleText
{
  v2 = [(HUContactDetailsTableViewCell *)self titleLabel];
  v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setTitleText:(id)a3
{
  id v4 = a3;
  id v5 = [(HUContactDetailsTableViewCell *)self titleLabel];
  [v5 setText:v4];
}

- (NSString)descriptionText
{
  v2 = [(HUContactDetailsTableViewCell *)self descriptionLabel];
  v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setDescriptionText:(id)a3
{
  id v4 = a3;
  id v5 = [(HUContactDetailsTableViewCell *)self descriptionLabel];
  [v5 setText:v4];
}

- (CNContact)contact
{
  v2 = [(HUContactDetailsTableViewCell *)self avatarView];
  v3 = [v2 contacts];
  id v4 = [v3 firstObject];

  return (CNContact *)v4;
}

- (void)setContact:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  double v6 = [v4 arrayWithObjects:&v8 count:1];

  double v7 = [(HUContactDetailsTableViewCell *)self avatarView];
  [v7 setContacts:v6];
}

- (UIImage)photo
{
  v2 = [(HUContactDetailsTableViewCell *)self photoView];
  v3 = [v2 image];

  return (UIImage *)v3;
}

- (void)setPhoto:(id)a3
{
  id v4 = a3;
  id v5 = [(HUContactDetailsTableViewCell *)self photoView];
  [v5 setImage:v4];

  double v6 = [(HUContactDetailsTableViewCell *)self photoView];
  [v6 setHidden:v4 == 0];

  id v7 = [(HUContactDetailsTableViewCell *)self avatarView];
  [v7 setHidden:v4 != 0];
}

- (void)updateConstraints
{
  v3 = [(HUContactDetailsTableViewCell *)self constraints];

  if (!v3)
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    id v5 = [(HUContactDetailsTableViewCell *)self avatarView];
    double v6 = [v5 leadingAnchor];
    id v7 = [(HUContactDetailsTableViewCell *)self contentView];
    id v8 = [v7 layoutMarginsGuide];
    uint64_t v9 = [v8 leadingAnchor];
    uint64_t v10 = [v6 constraintEqualToAnchor:v9];
    [v4 addObject:v10];

    v11 = [(HUContactDetailsTableViewCell *)self avatarView];
    uint64_t v12 = [v11 widthAnchor];
    v13 = [v12 constraintEqualToConstant:42.0];
    [v4 addObject:v13];

    uint64_t v14 = [(HUContactDetailsTableViewCell *)self containerView];
    v15 = [v14 leadingAnchor];
    uint64_t v16 = [(HUContactDetailsTableViewCell *)self avatarView];
    v17 = [v16 trailingAnchor];
    uint64_t v18 = [v15 constraintEqualToAnchor:v17 constant:15.0];
    [v4 addObject:v18];

    v19 = [(HUContactDetailsTableViewCell *)self containerView];
    uint64_t v20 = [v19 trailingAnchor];
    v21 = [(HUContactDetailsTableViewCell *)self contentView];
    v22 = [v21 layoutMarginsGuide];
    v23 = [v22 trailingAnchor];
    v24 = [v20 constraintEqualToAnchor:v23];
    [v4 addObject:v24];

    v25 = [(HUContactDetailsTableViewCell *)self titleLabel];
    v26 = [v25 leadingAnchor];
    v27 = [(HUContactDetailsTableViewCell *)self containerView];
    v28 = [v27 leadingAnchor];
    v29 = [v26 constraintEqualToAnchor:v28];
    [v4 addObject:v29];

    objc_super v30 = [(HUContactDetailsTableViewCell *)self titleLabel];
    v31 = [v30 trailingAnchor];
    v32 = [(HUContactDetailsTableViewCell *)self containerView];
    v33 = [v32 trailingAnchor];
    v34 = [v31 constraintEqualToAnchor:v33];
    [v4 addObject:v34];

    v35 = [(HUContactDetailsTableViewCell *)self descriptionLabel];
    v36 = [v35 leadingAnchor];
    v37 = [(HUContactDetailsTableViewCell *)self containerView];
    v38 = [v37 leadingAnchor];
    v39 = [v36 constraintEqualToAnchor:v38];
    [v4 addObject:v39];

    v40 = [(HUContactDetailsTableViewCell *)self descriptionLabel];
    v41 = [v40 trailingAnchor];
    v42 = [(HUContactDetailsTableViewCell *)self containerView];
    v43 = [v42 trailingAnchor];
    v44 = [v41 constraintEqualToAnchor:v43];
    [v4 addObject:v44];

    v45 = [(HUContactDetailsTableViewCell *)self avatarView];
    v46 = [v45 topAnchor];
    v47 = [(HUContactDetailsTableViewCell *)self contentView];
    v48 = [v47 layoutMarginsGuide];
    v49 = [v48 topAnchor];
    v50 = [v46 constraintGreaterThanOrEqualToAnchor:v49];
    [v4 addObject:v50];

    v51 = [(HUContactDetailsTableViewCell *)self avatarView];
    v52 = [v51 bottomAnchor];
    v53 = [(HUContactDetailsTableViewCell *)self contentView];
    v54 = [v53 layoutMarginsGuide];
    v55 = [v54 bottomAnchor];
    v56 = [v52 constraintLessThanOrEqualToAnchor:v55];
    [v4 addObject:v56];

    v57 = [(HUContactDetailsTableViewCell *)self avatarView];
    v58 = [v57 centerYAnchor];
    v59 = [(HUContactDetailsTableViewCell *)self contentView];
    v60 = [v59 layoutMarginsGuide];
    v61 = [v60 centerYAnchor];
    v62 = [v58 constraintEqualToAnchor:v61];
    [v4 addObject:v62];

    v63 = [(HUContactDetailsTableViewCell *)self avatarView];
    v64 = [v63 heightAnchor];
    v65 = [v64 constraintEqualToConstant:42.0];
    [v4 addObject:v65];

    v66 = [(HUContactDetailsTableViewCell *)self containerView];
    v67 = [v66 topAnchor];
    v68 = [(HUContactDetailsTableViewCell *)self contentView];
    v69 = [v68 layoutMarginsGuide];
    v70 = [v69 topAnchor];
    v71 = [v67 constraintGreaterThanOrEqualToAnchor:v70];
    [v4 addObject:v71];

    v72 = [(HUContactDetailsTableViewCell *)self containerView];
    v73 = [v72 bottomAnchor];
    v74 = [(HUContactDetailsTableViewCell *)self contentView];
    v75 = [v74 layoutMarginsGuide];
    v76 = [v75 bottomAnchor];
    v77 = [v73 constraintLessThanOrEqualToAnchor:v76];
    [v4 addObject:v77];

    v78 = [(HUContactDetailsTableViewCell *)self containerView];
    v79 = [v78 centerYAnchor];
    v80 = [(HUContactDetailsTableViewCell *)self contentView];
    v81 = [v80 layoutMarginsGuide];
    v82 = [v81 centerYAnchor];
    v83 = [v79 constraintEqualToAnchor:v82];
    [v4 addObject:v83];

    v84 = [(HUContactDetailsTableViewCell *)self titleLabel];
    v85 = [v84 topAnchor];
    v86 = [(HUContactDetailsTableViewCell *)self containerView];
    v87 = [v86 topAnchor];
    v88 = [v85 constraintEqualToAnchor:v87];
    [v4 addObject:v88];

    v89 = [(HUContactDetailsTableViewCell *)self titleLabel];
    v90 = [v89 bottomAnchor];
    v91 = [(HUContactDetailsTableViewCell *)self descriptionLabel];
    v92 = [v91 topAnchor];
    v93 = [v90 constraintEqualToAnchor:v92];
    [v4 addObject:v93];

    v94 = [(HUContactDetailsTableViewCell *)self descriptionLabel];
    v95 = [v94 bottomAnchor];
    v96 = [(HUContactDetailsTableViewCell *)self containerView];
    v97 = [v96 bottomAnchor];
    v98 = [v95 constraintEqualToAnchor:v97];
    [v4 addObject:v98];

    [(HUContactDetailsTableViewCell *)self setConstraints:v4];
    v99 = (void *)MEMORY[0x1E4F28DC8];
    v100 = [(HUContactDetailsTableViewCell *)self constraints];
    [v99 activateConstraints:v100];
  }
  v101.receiver = self;
  v101.super_class = (Class)HUContactDetailsTableViewCell;
  [(HUContactDetailsTableViewCell *)&v101 updateConstraints];
}

- (void)layoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)HUContactDetailsTableViewCell;
  [(HUContactDetailsTableViewCell *)&v18 layoutSubviews];
  v3 = [(HUContactDetailsTableViewCell *)self avatarView];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  uint64_t v12 = [(HUContactDetailsTableViewCell *)self photoView];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  v13 = [(HUContactDetailsTableViewCell *)self photoView];
  [v13 bounds];
  double v15 = v14 * 0.5;
  uint64_t v16 = [(HUContactDetailsTableViewCell *)self photoView];
  v17 = [v16 layer];
  [v17 setCornerRadius:v15];
}

- (CNAvatarView)avatarView
{
  return self->_avatarView;
}

- (UIImageView)photoView
{
  return self->_photoView;
}

- (UIView)containerView
{
  return self->_containerView;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_photoView, 0);

  objc_storeStrong((id *)&self->_avatarView, 0);
}

@end