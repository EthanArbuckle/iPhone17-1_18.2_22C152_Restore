@interface CARSettingsTableFooterView
- (CARSettingsTableFooterView)initWithReuseIdentifier:(id)a3;
- (NSLayoutConstraint)labelBottomConstraint;
- (NSLayoutConstraint)labelTopConstraint;
- (UILabel)label;
- (void)_prepareForLayout;
- (void)prepareForReuse;
- (void)setLabel:(id)a3;
- (void)setText:(id)a3;
@end

@implementation CARSettingsTableFooterView

- (CARSettingsTableFooterView)initWithReuseIdentifier:(id)a3
{
  v50.receiver = self;
  v50.super_class = (Class)CARSettingsTableFooterView;
  v3 = [(CARSettingsTableFooterView *)&v50 initWithReuseIdentifier:a3];
  if (v3)
  {
    id v4 = objc_alloc((Class)UILabel);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v8 = [v4 initWithFrame:CGRectZero.origin.x, y, width, height];
    label = v3->_label;
    v3->_label = v8;

    v10 = [(CARSettingsTableFooterView *)v3 label];
    [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

    v11 = +[UIColor _carSystemSecondaryColor];
    v12 = [(CARSettingsTableFooterView *)v3 label];
    [v12 setTextColor:v11];

    v13 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleFootnote];
    UIFontDescriptorTraitKey v54 = UIFontWeightTrait;
    v14 = +[NSNumber numberWithDouble:UIFontWeightRegular];
    v55 = v14;
    v49 = +[NSDictionary dictionaryWithObjects:&v55 forKeys:&v54 count:1];

    UIFontDescriptorAttributeName v52 = UIFontDescriptorTraitsAttribute;
    v53 = v49;
    v15 = +[NSDictionary dictionaryWithObjects:&v53 forKeys:&v52 count:1];
    v48 = [v13 fontDescriptorByAddingAttributes:v15];

    v16 = +[UIFont fontWithDescriptor:v48 size:0.0];
    v17 = [(CARSettingsTableFooterView *)v3 label];
    [v17 setFont:v16];

    v18 = [(CARSettingsTableFooterView *)v3 label];
    [v18 setNumberOfLines:0];

    v19 = [(CARSettingsTableFooterView *)v3 contentView];
    v20 = [(CARSettingsTableFooterView *)v3 label];
    [v19 addSubview:v20];

    v21 = [(CARSettingsTableFooterView *)v3 label];
    v22 = [v21 topAnchor];
    v23 = [(CARSettingsTableFooterView *)v3 contentView];
    v24 = [v23 topAnchor];
    uint64_t v25 = [v22 constraintEqualToAnchor:v24 constant:5.0];
    labelTopConstraint = v3->_labelTopConstraint;
    v3->_labelTopConstraint = (NSLayoutConstraint *)v25;

    v27 = [(CARSettingsTableFooterView *)v3 label];
    v28 = [v27 bottomAnchor];
    v29 = [(CARSettingsTableFooterView *)v3 contentView];
    v30 = [v29 bottomAnchor];
    uint64_t v31 = [v28 constraintEqualToAnchor:v30 constant:-5.0];
    labelBottomConstraint = v3->_labelBottomConstraint;
    v3->_labelBottomConstraint = (NSLayoutConstraint *)v31;

    v47 = [(CARSettingsTableFooterView *)v3 label];
    v45 = [v47 leadingAnchor];
    v46 = [(CARSettingsTableFooterView *)v3 contentView];
    v33 = [v46 leadingAnchor];
    v34 = [v45 constraintEqualToAnchor:v33 constant:12.0];
    v51[0] = v34;
    v35 = [(CARSettingsTableFooterView *)v3 label];
    v36 = [v35 trailingAnchor];
    v37 = [(CARSettingsTableFooterView *)v3 contentView];
    v38 = [v37 trailingAnchor];
    v39 = [v36 constraintEqualToAnchor:v38 constant:-12.0];
    v51[1] = v39;
    v51[2] = v3->_labelTopConstraint;
    v51[3] = v3->_labelBottomConstraint;
    v40 = +[NSArray arrayWithObjects:v51 count:4];
    +[NSLayoutConstraint activateConstraints:v40];

    v41 = +[UIColor tableBackgroundColor];
    v42 = [(CARSettingsTableFooterView *)v3 contentView];
    [v42 setBackgroundColor:v41];

    id v43 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, y, width, height];
    [v43 setBackgroundColor:v41];
    [(CARSettingsTableFooterView *)v3 setBackgroundView:v43];
  }
  return v3;
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)CARSettingsTableFooterView;
  [(CARSettingsTableFooterView *)&v4 prepareForReuse];
  v3 = [(CARSettingsTableFooterView *)self label];
  [v3 setText:&stru_100094078];
}

- (void)setText:(id)a3
{
  id v14 = a3;
  objc_super v4 = [(CARSettingsTableFooterView *)self label];
  v5 = [v4 text];
  unsigned __int8 v6 = [v5 isEqualToString:v14];

  if ((v6 & 1) == 0)
  {
    v7 = [(CARSettingsTableFooterView *)self label];
    [v7 setText:v14];

    id v8 = [v14 length];
    v9 = [(CARSettingsTableFooterView *)self labelTopConstraint];
    v10 = v9;
    if (v8)
    {
      [v9 setConstant:4.0];

      v11 = [(CARSettingsTableFooterView *)self labelBottomConstraint];
      v12 = v11;
      double v13 = -20.0;
    }
    else
    {
      [v9 setConstant:5.0];

      v11 = [(CARSettingsTableFooterView *)self labelBottomConstraint];
      v12 = v11;
      double v13 = -5.0;
    }
    [v11 setConstant:v13];

    [(CARSettingsTableFooterView *)self _prepareForLayout];
  }
}

- (void)_prepareForLayout
{
  v3 = [(CARSettingsTableFooterView *)self label];
  id v4 = [v3 textAlignment];

  if (v4 == (id)4)
  {
    id v7 = [(CARSettingsTableFooterView *)self traitCollection];
    if ([v7 layoutDirection] == (id)1) {
      uint64_t v5 = 10;
    }
    else {
      uint64_t v5 = 9;
    }
    unsigned __int8 v6 = [(CARSettingsTableFooterView *)self label];
    [v6 setContentMode:v5];
  }
  else
  {
    id v7 = [(CARSettingsTableFooterView *)self label];
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

- (NSLayoutConstraint)labelTopConstraint
{
  return self->_labelTopConstraint;
}

- (NSLayoutConstraint)labelBottomConstraint
{
  return self->_labelBottomConstraint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelBottomConstraint, 0);
  objc_storeStrong((id *)&self->_labelTopConstraint, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

@end