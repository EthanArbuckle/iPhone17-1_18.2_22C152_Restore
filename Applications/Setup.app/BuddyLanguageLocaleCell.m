@interface BuddyLanguageLocaleCell
- (BuddyLanguageLocaleCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSLayoutConstraint)heightConstraint;
- (UILabel)titleLabel;
- (UIView)heightView;
- (double)minimumHeight;
- (void)setHeightConstraint:(id)a3;
- (void)setHeightView:(id)a3;
- (void)setMinimumHeight:(double)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation BuddyLanguageLocaleCell

- (BuddyLanguageLocaleCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v45 = self;
  SEL v44 = a2;
  int64_t v43 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v4 = v45;
  id v45 = 0;
  v41.receiver = v4;
  v41.super_class = (Class)BuddyLanguageLocaleCell;
  id v45 = [(BuddyLanguageLocaleCell *)&v41 initWithStyle:v43 reuseIdentifier:location];
  objc_storeStrong(&v45, v45);
  if (v45)
  {
    id v5 = objc_alloc_init((Class)UILabel);
    [v45 setTitleLabel:v5];

    id v6 = [v45 titleLabel];
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

    id v7 = [v45 titleLabel];
    [v7 setNumberOfLines:0];

    id v8 = [v45 contentView];
    id v9 = [v45 titleLabel];
    [v8 addSubview:v9];

    v10 = +[UIColor secondarySystemBackgroundColor];
    [v45 setBackgroundColor:v10];

    id v40 = [v45 titleLabel];
    id v37 = [v40 leadingAnchor];
    id v39 = [v45 contentView];
    id v38 = [v39 layoutMarginsGuide];
    id v36 = [v38 leadingAnchor];
    id v35 = [v37 constraintEqualToAnchor:];
    v46[0] = v35;
    id v34 = [v45 titleLabel];
    id v31 = [v34 trailingAnchor];
    id v33 = [v45 contentView];
    id v32 = [v33 layoutMarginsGuide];
    id v30 = [v32 trailingAnchor];
    id v29 = [v31 constraintEqualToAnchor:];
    v46[1] = v29;
    id v28 = [v45 titleLabel];
    id v26 = [v28 topAnchor];
    id v27 = [v45 contentView];
    id v25 = [v27 topAnchor];
    id v24 = [v26 constraintGreaterThanOrEqualToAnchor:];
    v46[2] = v24;
    id v23 = [v45 titleLabel];
    id v11 = [v23 bottomAnchor];
    id v12 = [v45 contentView];
    id v13 = [v12 bottomAnchor];
    id v14 = [v11 constraintLessThanOrEqualToAnchor:v13];
    v46[3] = v14;
    id v15 = [v45 titleLabel];
    id v16 = [v15 centerYAnchor];
    id v17 = [v45 contentView];
    id v18 = [v17 centerYAnchor];
    id v19 = [v16 constraintEqualToAnchor:v18];
    v46[4] = v19;
    v20 = +[NSArray arrayWithObjects:v46 count:5];
    +[NSLayoutConstraint activateConstraints:v20];
  }
  v21 = (BuddyLanguageLocaleCell *)v45;
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v45, 0);
  return v21;
}

- (void)setMinimumHeight:(double)a3
{
  v3 = [(BuddyLanguageLocaleCell *)self heightConstraint];
  char v11 = 0;
  BOOL v4 = 1;
  if (v3)
  {
    id v12 = [(BuddyLanguageLocaleCell *)self heightConstraint];
    char v11 = 1;
    [(NSLayoutConstraint *)v12 constant];
    BOOL v4 = v5 != a3;
  }
  if (v11) {

  }
  if (v4)
  {
    id v6 = [(BuddyLanguageLocaleCell *)self heightConstraint];
    [(NSLayoutConstraint *)v6 setActive:0];

    id v7 = [(BuddyLanguageLocaleCell *)self contentView];
    id v8 = [v7 heightAnchor];
    id v9 = [v8 constraintGreaterThanOrEqualToConstant:a3];
    [(BuddyLanguageLocaleCell *)self setHeightConstraint:v9];

    v10 = [(BuddyLanguageLocaleCell *)self heightConstraint];
    [(NSLayoutConstraint *)v10 setActive:1];

    [(BuddyLanguageLocaleCell *)self setNeedsLayout];
  }
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (double)minimumHeight
{
  return self->_minimumHeight;
}

- (UIView)heightView
{
  return self->_heightView;
}

- (void)setHeightView:(id)a3
{
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (void)setHeightConstraint:(id)a3
{
}

- (void).cxx_destruct
{
}

@end