@interface TSSIMUnlockListHeaderView
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSDictionary)numberOfSIMsToUnlockAndanESIMExists;
- (TSSIMUnlockListHeaderView)initWithFrame:(CGRect)a3;
- (double)_descriptionLabelHeightForWidth:(double)a3;
- (double)_titleLabelHeightForWidth:(double)a3;
- (void)_configureLabels;
- (void)layoutSubviews;
- (void)setNumberOfSIMsToUnlockAndanESIMExists:(id)a3;
@end

@implementation TSSIMUnlockListHeaderView

- (TSSIMUnlockListHeaderView)initWithFrame:(CGRect)a3
{
  v17.receiver = self;
  v17.super_class = (Class)TSSIMUnlockListHeaderView;
  v3 = -[TSSIMUnlockListHeaderView initWithFrame:](&v17, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc((Class)UILabel);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v8 = [v4 initWithFrame:CGRectZero.origin.x, y, width, height];
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v8;

    v10 = v3->_titleLabel;
    v11 = sub_100004438();
    [(UILabel *)v10 setFont:v11];

    [(UILabel *)v3->_titleLabel setTextAlignment:1];
    [(UILabel *)v3->_titleLabel setNumberOfLines:2];
    [(TSSIMUnlockListHeaderView *)v3 addSubview:v3->_titleLabel];
    v12 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    descriptionLabel = v3->_descriptionLabel;
    v3->_descriptionLabel = v12;

    v14 = v3->_descriptionLabel;
    v15 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    [(UILabel *)v14 setFont:v15];

    [(UILabel *)v3->_descriptionLabel setTextAlignment:1];
    [(UILabel *)v3->_descriptionLabel setNumberOfLines:0];
    [(TSSIMUnlockListHeaderView *)v3 addSubview:v3->_descriptionLabel];
    [(TSSIMUnlockListHeaderView *)v3 _configureLabels];
  }
  return v3;
}

- (void)layoutSubviews
{
  v30.receiver = self;
  v30.super_class = (Class)TSSIMUnlockListHeaderView;
  [(TSSIMUnlockListHeaderView *)&v30 layoutSubviews];
  [(TSSIMUnlockListHeaderView *)self bounds];
  double Width = CGRectGetWidth(v31);
  double x = CGRectZero.origin.x;
  double y = CGRectZero.origin.y;
  double v6 = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v8 = [(UILabel *)self->_titleLabel text];
  id v9 = [v8 length];

  if (v9)
  {
    [(TSSIMUnlockListHeaderView *)self _titleLabelHeightForWidth:Width];
    double v11 = v10;
    v32.origin.double x = 0.0;
    v32.origin.double y = 0.0;
    v32.size.double width = Width;
    v32.size.double height = v11;
    CGFloat MaxY = CGRectGetMaxY(v32);
    double v12 = sub_1000044BC();
    double v14 = v13 + 0.0;
    double v15 = v12 + 0.0;
    double v29 = Width - (v13 + v16);
    double v18 = v11 - (v12 + v17);
  }
  else
  {
    CGFloat MaxY = 0.0;
    double v29 = v6;
    double v18 = height;
    double v15 = y;
    double v14 = CGRectZero.origin.x;
  }
  v19 = [(UILabel *)self->_descriptionLabel text];
  id v20 = [v19 length];

  if (v20)
  {
    [(TSSIMUnlockListHeaderView *)self _descriptionLabelHeightForWidth:Width];
    double v22 = v21;
    double v23 = sub_1000044D0();
    double x = v24 + 0.0;
    double y = v28 + v23;
    double v6 = Width - (v24 + v25);
    double height = v22 - (v23 + v26);
  }
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v14, v15, v29, v18);
  -[UILabel setFrame:](self->_descriptionLabel, "setFrame:", x, y, v6, height);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  -[TSSIMUnlockListHeaderView _titleLabelHeightForWidth:](self, "_titleLabelHeightForWidth:", a3.width, a3.height);
  double v6 = v5;
  [(TSSIMUnlockListHeaderView *)self _descriptionLabelHeightForWidth:width];
  double v8 = v6 + v7;
  double v9 = width;
  result.double height = v8;
  result.double width = v9;
  return result;
}

- (void)setNumberOfSIMsToUnlockAndanESIMExists:(id)a3
{
  id v5 = a3;
  if (!-[NSDictionary isEqualToDictionary:](self->_numberOfSIMsToUnlockAndanESIMExists, "isEqualToDictionary:"))
  {
    objc_storeStrong((id *)&self->_numberOfSIMsToUnlockAndanESIMExists, a3);
    [(TSSIMUnlockListHeaderView *)self _configureLabels];
  }
}

- (void)_configureLabels
{
  v3 = [(NSDictionary *)self->_numberOfSIMsToUnlockAndanESIMExists objectForKeyedSubscript:@"NumOfSimsAvailKey"];
  unsigned int v4 = [v3 intValue];

  id v5 = [(NSDictionary *)self->_numberOfSIMsToUnlockAndanESIMExists objectForKeyedSubscript:@"kPhysicalSimExists"];
  unsigned int v6 = [v5 BOOLValue];

  double v7 = +[NSBundle mainBundle];
  double v8 = v7;
  if (v4 == 1)
  {
    if (v6)
    {
      id v16 = [v7 localizedStringForKey:@"SINGLE_SIM_LOCKED" value:&stru_100020AC8 table:@"Localizable"];

      double v9 = +[NSBundle mainBundle];
      double v10 = v9;
      CFStringRef v11 = @"SINGLE_SIM_LOCKED_DESCRIPTION";
    }
    else
    {
      id v16 = [v7 localizedStringForKey:@"SINGLE_ESIM_LOCKED" value:&stru_100020AC8 table:@"Localizable"];

      double v9 = +[NSBundle mainBundle];
      double v10 = v9;
      CFStringRef v11 = @"SINGLE_ESIM_LOCKED_DESCRIPTION";
    }
  }
  else if (v6)
  {
    id v16 = [v7 localizedStringForKey:@"MULTIPLE_SIMS_LOCKED" value:&stru_100020AC8 table:@"Localizable"];

    double v9 = +[NSBundle mainBundle];
    double v10 = v9;
    CFStringRef v11 = @"SIM_LOCKED_DESCRIPTION";
  }
  else
  {
    id v16 = [v7 localizedStringForKey:@"MULTIPLE_ESIMS_LOCKED" value:&stru_100020AC8 table:@"Localizable"];

    double v9 = +[NSBundle mainBundle];
    double v10 = v9;
    CFStringRef v11 = @"ESIM_LOCKED_DESCRIPTION";
  }
  double v12 = [v9 localizedStringForKey:v11 value:&stru_100020AC8 table:@"Localizable"];

  if (+[TSUtilities inBuddy])
  {
    double v13 = +[NSBundle mainBundle];
    double v14 = [v13 localizedStringForKey:@"SIM_LOCKED_DESCRIPTION_IN_BUDDY" value:&stru_100020AC8 table:@"Localizable"];
    uint64_t v15 = +[NSString stringWithFormat:@"%@%@", v12, v14];

    double v12 = (void *)v15;
  }
  [(UILabel *)self->_titleLabel setText:v16];
  [(UILabel *)self->_descriptionLabel setText:v12];
  [(TSSIMUnlockListHeaderView *)self setNeedsLayout];
  [(TSSIMUnlockListHeaderView *)self setNeedsUpdateConstraints];
}

- (double)_titleLabelHeightForWidth:(double)a3
{
  id v5 = [(UILabel *)self->_titleLabel text];
  id v6 = [v5 length];

  if (!v6) {
    return 0.0;
  }
  double v7 = sub_1000044BC();
  double v9 = v8;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", a3 - v10 - v11, 1.79769313e308);
  return v9 + v7 + v12;
}

- (double)_descriptionLabelHeightForWidth:(double)a3
{
  id v5 = [(UILabel *)self->_descriptionLabel text];
  id v6 = [v5 length];

  if (!v6) {
    return 0.0;
  }
  double v7 = sub_1000044D0();
  double v9 = v8;
  -[UILabel sizeThatFits:](self->_descriptionLabel, "sizeThatFits:", a3 - v10 - v11, 1.79769313e308);
  return v9 + v7 + v12;
}

- (NSDictionary)numberOfSIMsToUnlockAndanESIMExists
{
  return self->_numberOfSIMsToUnlockAndanESIMExists;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numberOfSIMsToUnlockAndanESIMExists, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end