@interface PHCarPlayFavoritesTableViewCell
- (CNAvatarView)avatarView;
- (PHCarPlayFavoritesTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UILabel)nameLabel;
- (UILabel)phoneNumberTypeLabel;
- (void)setAvatarView:(id)a3;
- (void)setNameLabel:(id)a3;
- (void)setPhoneNumberTypeLabel:(id)a3;
@end

@implementation PHCarPlayFavoritesTableViewCell

- (PHCarPlayFavoritesTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v60.receiver = self;
  v60.super_class = (Class)PHCarPlayFavoritesTableViewCell;
  v4 = [(PHCarPlayGenericTableViewCell *)&v60 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    id v5 = objc_alloc((Class)UILabel);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    id v9 = [v5 initWithFrame:CGRectZero.origin.x, y, width, height];
    [v9 setAdjustsFontForContentSizeCategory:1];
    [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
    v10 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCallout];
    [v9 setFont:v10];

    v11 = +[UIColor dynamicLabelColor];
    [v9 setTextColor:v11];

    v12 = +[UIColor clearColor];
    [v9 setBackgroundColor:v12];

    v13 = +[UIColor dynamicCarFocusedLabelColor];
    [v9 setHighlightedTextColor:v13];

    v14 = [(PHCarPlayFavoritesTableViewCell *)v4 contentView];
    [v14 addSubview:v9];

    LODWORD(v15) = 1132068864;
    [v9 setContentCompressionResistancePriority:0 forAxis:v15];
    [(PHCarPlayFavoritesTableViewCell *)v4 setNameLabel:v9];
    id v16 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];

    [v16 setAdjustsFontForContentSizeCategory:1];
    [v16 setTranslatesAutoresizingMaskIntoConstraints:0];
    v17 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCaption1];
    [v16 setFont:v17];

    v18 = +[UIColor dynamicCarPrimaryColor];
    [v16 setTextColor:v18];

    v19 = +[UIColor clearColor];
    [v16 setBackgroundColor:v19];

    v20 = +[UIColor dynamicCarFocusedPrimaryLabelColor];
    [v16 setHighlightedTextColor:v20];

    v21 = [(PHCarPlayFavoritesTableViewCell *)v4 contentView];
    [v21 addSubview:v16];

    LODWORD(v22) = 1148846080;
    [v16 setContentCompressionResistancePriority:0 forAxis:v22];
    [(PHCarPlayFavoritesTableViewCell *)v4 setPhoneNumberTypeLabel:v16];
    v23 = (CNAvatarView *)objc_alloc_init((Class)CNAvatarView);
    avatarView = v4->_avatarView;
    v4->_avatarView = v23;

    [(CNAvatarView *)v4->_avatarView setTranslatesAutoresizingMaskIntoConstraints:0];
    v25 = [(PHCarPlayFavoritesTableViewCell *)v4 contentView];
    [v25 addSubview:v4->_avatarView];

    v61[0] = @"nameLabel";
    v26 = [(PHCarPlayFavoritesTableViewCell *)v4 nameLabel];
    v61[1] = @"phoneNumberTypeLabel";
    v62[0] = v26;
    v27 = [(PHCarPlayFavoritesTableViewCell *)v4 phoneNumberTypeLabel];
    v62[1] = v27;
    v28 = +[NSDictionary dictionaryWithObjects:v62 forKeys:v61 count:2];

    v29 = [(PHCarPlayFavoritesTableViewCell *)v4 contentView];
    v30 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"|-54-[nameLabel]", 0, 0, v28);
    [v29 addConstraints:v30];

    v31 = [(PHCarPlayFavoritesTableViewCell *)v4 contentView];
    v32 = [(PHCarPlayFavoritesTableViewCell *)v4 nameLabel];
    v33 = [(PHCarPlayFavoritesTableViewCell *)v4 phoneNumberTypeLabel];
    v34 = +[NSLayoutConstraint constraintWithItem:v32 attribute:6 relatedBy:-1 toItem:v33 attribute:5 multiplier:1.0 constant:-10.0];
    [v31 addConstraint:v34];

    v35 = [(PHCarPlayFavoritesTableViewCell *)v4 contentView];
    v36 = [(PHCarPlayFavoritesTableViewCell *)v4 phoneNumberTypeLabel];
    v37 = [(PHCarPlayFavoritesTableViewCell *)v4 contentView];
    v38 = +[NSLayoutConstraint constraintWithItem:v36 attribute:6 relatedBy:0 toItem:v37 attribute:6 multiplier:1.0 constant:-12.0];
    [v35 addConstraint:v38];

    v39 = [(PHCarPlayFavoritesTableViewCell *)v4 contentView];
    v40 = [(PHCarPlayFavoritesTableViewCell *)v4 nameLabel];
    v41 = [(PHCarPlayFavoritesTableViewCell *)v4 contentView];
    v42 = +[NSLayoutConstraint constraintWithItem:v40 attribute:10 relatedBy:0 toItem:v41 attribute:10 multiplier:1.0 constant:0.0];
    [v39 addConstraint:v42];

    v43 = [(PHCarPlayFavoritesTableViewCell *)v4 contentView];
    v44 = [(PHCarPlayFavoritesTableViewCell *)v4 phoneNumberTypeLabel];
    v45 = [(PHCarPlayFavoritesTableViewCell *)v4 contentView];
    v46 = +[NSLayoutConstraint constraintWithItem:v44 attribute:10 relatedBy:0 toItem:v45 attribute:10 multiplier:1.0 constant:0.0];
    [v43 addConstraint:v46];

    v47 = [(PHCarPlayFavoritesTableViewCell *)v4 contentView];
    v48 = v4->_avatarView;
    v49 = [(PHCarPlayFavoritesTableViewCell *)v4 contentView];
    v50 = +[NSLayoutConstraint constraintWithItem:v48 attribute:5 relatedBy:0 toItem:v49 attribute:5 multiplier:1.0 constant:12.0];
    [v47 addConstraint:v50];

    v51 = [(PHCarPlayFavoritesTableViewCell *)v4 contentView];
    v52 = v4->_avatarView;
    v53 = [(PHCarPlayFavoritesTableViewCell *)v4 contentView];
    v54 = +[NSLayoutConstraint constraintWithItem:v52 attribute:10 relatedBy:0 toItem:v53 attribute:10 multiplier:1.0 constant:0.0];
    [v51 addConstraint:v54];

    v55 = [(PHCarPlayFavoritesTableViewCell *)v4 contentView];
    v56 = +[NSLayoutConstraint constraintWithItem:v4->_avatarView attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:28.0];
    [v55 addConstraint:v56];

    v57 = [(PHCarPlayFavoritesTableViewCell *)v4 contentView];
    v58 = +[NSLayoutConstraint constraintWithItem:v4->_avatarView attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:28.0];
    [v57 addConstraint:v58];
  }
  return v4;
}

- (CNAvatarView)avatarView
{
  return self->_avatarView;
}

- (void)setAvatarView:(id)a3
{
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
}

- (UILabel)phoneNumberTypeLabel
{
  return self->_phoneNumberTypeLabel;
}

- (void)setPhoneNumberTypeLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneNumberTypeLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);

  objc_storeStrong((id *)&self->_avatarView, 0);
}

@end