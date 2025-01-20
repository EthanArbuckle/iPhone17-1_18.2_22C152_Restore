@interface ACSettingsSwitchView
- (ACSettingsSwitchView)initWithFrame:(CGRect)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIImage)icon;
- (UILabel)title;
- (UISwitch)switchControl;
- (void)setIcon:(id)a3;
@end

@implementation ACSettingsSwitchView

- (ACSettingsSwitchView)initWithFrame:(CGRect)a3
{
  v40.receiver = self;
  v40.super_class = (Class)ACSettingsSwitchView;
  v3 = -[ACSettingsSnippetView initWithFrame:](&v40, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc((Class)UIImageView);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v8 = (UIImageView *)objc_msgSend(v4, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    iconImageView = v3->_iconImageView;
    v3->_iconImageView = v8;

    [(UIImageView *)v3->_iconImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(ACSettingsSwitchView *)v3 addSubview:v3->_iconImageView];
    uint64_t v10 = +[SiriSharedUIContentLabel labelWithBodyFont];
    title = v3->_title;
    v3->_title = (UILabel *)v10;

    [(UILabel *)v3->_title setTranslatesAutoresizingMaskIntoConstraints:0];
    [(ACSettingsSwitchView *)v3 addSubview:v3->_title];
    v12 = (UISwitch *)objc_msgSend(objc_alloc((Class)UISwitch), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    switchControl = v3->_switchControl;
    v3->_switchControl = v12;

    v14 = v3->_switchControl;
    v15 = +[UIColor siriui_keylineColor];
    [(UISwitch *)v14 setTintColor:v15];

    [(UISwitch *)v3->_switchControl setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v16) = 1148846080;
    [(UISwitch *)v3->_switchControl setContentCompressionResistancePriority:0 forAxis:v16];
    [(ACSettingsSwitchView *)v3 addSubview:v3->_switchControl];
    uint64_t v17 = _NSDictionaryOfVariableBindings(@"_iconImageView, _title, _switchControl", v3->_iconImageView, v3->_title, v3->_switchControl, 0);
    v43[0] = &off_89E0;
    v42[0] = @"iconHorizontalSpacing";
    v42[1] = @"horizontalSpacing";
    v18 = +[NSNumber numberWithDouble:SiriUIPlatterStyle[29]];
    v43[1] = v18;
    v42[2] = @"leftEdgeInset";
    v19 = +[NSNumber numberWithDouble:SiriUIPlatterStyle[32]];
    v43[2] = v19;
    v42[3] = @"rightEdgeInset";
    v20 = +[NSNumber numberWithDouble:SiriUIPlatterStyle[34]];
    v43[3] = v20;
    v21 = +[NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:4];
    v35 = (void *)v17;
    v22 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|-leftEdgeInset-[_iconImageView]-iconHorizontalSpacing-[_title]-(>=horizontalSpacing@900)-[_switchControl]-rightEdgeInset-|", 1024, v21, v17);

    v23 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v3->_iconImageView, v3->_title, 0);
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v24 = v22;
    id v25 = [v24 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v37;
      do
      {
        for (i = 0; i != v26; i = (char *)i + 1)
        {
          if (*(void *)v37 != v27) {
            objc_enumerationMutation(v24);
          }
          v29 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          v30 = [v29 firstItem];
          if ([v23 containsObject:v30])
          {
            v31 = [v29 secondItem];
            unsigned int v32 = [v23 containsObject:v31];

            if (v32)
            {
              objc_storeStrong((id *)&v3->_iconHorizontalSpacingConstraint, v29);
              goto LABEL_13;
            }
          }
          else
          {
          }
        }
        id v26 = [v24 countByEnumeratingWithState:&v36 objects:v41 count:16];
      }
      while (v26);
    }
LABEL_13:

    v33 = +[NSLayoutConstraint constraintWithItem:v3->_iconImageView attribute:10 relatedBy:0 toItem:v3 attribute:10 multiplier:1.0 constant:0.0];
    [(ACSettingsSwitchView *)v3 addConstraints:v24];
    [(ACSettingsSwitchView *)v3 addConstraint:v33];
  }
  return v3;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
  id v5 = a3;
  iconHorizontalSpacingConstraint = self->_iconHorizontalSpacingConstraint;
  [v5 size];
  if (v7 == 0.0) {
    double v8 = 1.0;
  }
  else {
    double v8 = SiriUIPlatterStyle[29];
  }
  [(NSLayoutConstraint *)iconHorizontalSpacingConstraint setConstant:v8];
  [(UIImageView *)self->_iconImageView setImage:v5];

  [(ACSettingsSwitchView *)self setNeedsLayout];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  id v5 = [(UIImageView *)self->_iconImageView image];
  [v5 size];
  double v7 = v6 + SiriUIPlatterStyle[30] * 2.0;

  -[UILabel sizeThatFits:](self->_title, "sizeThatFits:", width, 1.79769313e308);
  if (v7 >= v8) {
    double v9 = v7;
  }
  else {
    double v9 = v8;
  }
  double v10 = fmax(v9, 47.0);
  double v11 = width;
  result.double height = v10;
  result.double width = v11;
  return result;
}

- (UIImage)icon
{
  return self->_icon;
}

- (UILabel)title
{
  return self->_title;
}

- (UISwitch)switchControl
{
  return self->_switchControl;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_switchControl, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_iconHorizontalSpacingConstraint, 0);

  objc_storeStrong((id *)&self->_iconImageView, 0);
}

@end