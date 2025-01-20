@interface CARSettingsTableHeaderView
- (CARSettingsTableHeaderView)initWithReuseIdentifier:(id)a3;
- (UILabel)label;
- (void)_prepareForLayout;
- (void)prepareForReuse;
- (void)setLabel:(id)a3;
- (void)setText:(id)a3;
@end

@implementation CARSettingsTableHeaderView

- (CARSettingsTableHeaderView)initWithReuseIdentifier:(id)a3
{
  v38.receiver = self;
  v38.super_class = (Class)CARSettingsTableHeaderView;
  v3 = [(CARSettingsTableHeaderView *)&v38 initWithReuseIdentifier:a3];
  if (v3)
  {
    id v4 = objc_alloc((Class)UILabel);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v8 = [v4 initWithFrame:CGRectZero.origin.x, y, width, height];
    label = v3->_label;
    v3->_label = v8;

    v10 = [(CARSettingsTableHeaderView *)v3 label];
    [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

    v11 = +[UIColor _carSystemSecondaryColor];
    v12 = [(CARSettingsTableHeaderView *)v3 label];
    [v12 setTextColor:v11];

    v13 = +[UIFont preferredFontForTextStyle:UIFontTextStyleFootnote];
    v14 = [(CARSettingsTableHeaderView *)v3 label];
    [v14 setFont:v13];

    v15 = [(CARSettingsTableHeaderView *)v3 label];
    [v15 setNumberOfLines:0];

    v16 = [(CARSettingsTableHeaderView *)v3 contentView];
    v17 = [(CARSettingsTableHeaderView *)v3 label];
    [v16 addSubview:v17];

    v37 = [(CARSettingsTableHeaderView *)v3 label];
    v35 = [v37 leadingAnchor];
    v36 = [(CARSettingsTableHeaderView *)v3 contentView];
    v34 = [v36 leadingAnchor];
    v33 = [v35 constraintEqualToAnchor:v34 constant:12.0];
    v39[0] = v33;
    v32 = [(CARSettingsTableHeaderView *)v3 label];
    v31 = [v32 trailingAnchor];
    v18 = [(CARSettingsTableHeaderView *)v3 contentView];
    v19 = [v18 trailingAnchor];
    v20 = [v31 constraintEqualToAnchor:v19 constant:-12.0];
    v39[1] = v20;
    v21 = [(CARSettingsTableHeaderView *)v3 contentView];
    v22 = [v21 bottomAnchor];
    v23 = [(CARSettingsTableHeaderView *)v3 label];
    v24 = [v23 lastBaselineAnchor];
    v25 = [v22 constraintEqualToAnchor:v24 constant:8.0];
    v39[2] = v25;
    v26 = +[NSArray arrayWithObjects:v39 count:3];
    +[NSLayoutConstraint activateConstraints:v26];

    v27 = +[UIColor tableBackgroundColor];
    v28 = [(CARSettingsTableHeaderView *)v3 contentView];
    [v28 setBackgroundColor:v27];

    id v29 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, y, width, height];
    [v29 setBackgroundColor:v27];
    [(CARSettingsTableHeaderView *)v3 setBackgroundView:v29];
  }
  return v3;
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)CARSettingsTableHeaderView;
  [(CARSettingsTableHeaderView *)&v4 prepareForReuse];
  v3 = [(CARSettingsTableHeaderView *)self label];
  [v3 setText:&stru_100094078];
}

- (void)setText:(id)a3
{
  id v8 = a3;
  objc_super v4 = [(CARSettingsTableHeaderView *)self label];
  v5 = [v4 text];
  unsigned __int8 v6 = [v5 isEqualToString:v8];

  if ((v6 & 1) == 0)
  {
    v7 = [(CARSettingsTableHeaderView *)self label];
    [v7 setText:v8];

    [(CARSettingsTableHeaderView *)self _prepareForLayout];
  }
}

- (void)_prepareForLayout
{
  v3 = [(CARSettingsTableHeaderView *)self label];
  id v4 = [v3 textAlignment];

  if (v4 == (id)4)
  {
    id v7 = [(CARSettingsTableHeaderView *)self traitCollection];
    if ([v7 layoutDirection] == (id)1) {
      uint64_t v5 = 10;
    }
    else {
      uint64_t v5 = 9;
    }
    unsigned __int8 v6 = [(CARSettingsTableHeaderView *)self label];
    [v6 setContentMode:v5];
  }
  else
  {
    id v7 = [(CARSettingsTableHeaderView *)self label];
    [v7 setContentMode:5];
  }
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end