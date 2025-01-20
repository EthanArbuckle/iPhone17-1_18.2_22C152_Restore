@interface STStorageButtonHeader
- (STStorageButtonHeader)initWithSpecifier:(id)a3;
- (UIButton)headerButton;
- (UILabel)titleLabel;
- (double)preferredHeightForWidth:(double)a3;
- (void)setHeaderButton:(id)a3;
- (void)setHeaderButtonTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)updateConstraints;
@end

@implementation STStorageButtonHeader

- (STStorageButtonHeader)initWithSpecifier:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)STStorageButtonHeader;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v8 = -[STStorageButtonHeader initWithFrame:](&v35, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  if (v8)
  {
    v9 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    titleLabel = v8->_titleLabel;
    v8->_titleLabel = v9;

    [(UILabel *)v8->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v11 = [v4 name];
    v12 = +[NSLocale currentLocale];
    v13 = [v11 uppercaseStringWithLocale:v12];
    [(UILabel *)v8->_titleLabel setText:v13];

    v14 = PreferencesTableViewHeaderFont();
    [(UILabel *)v8->_titleLabel setFont:v14];

    v15 = PreferencesTableViewHeaderColor();
    [(UILabel *)v8->_titleLabel setTextColor:v15];

    v16 = +[UIColor clearColor];
    [(UILabel *)v8->_titleLabel setBackgroundColor:v16];

    [(UILabel *)v8->_titleLabel setNumberOfLines:1];
    [(UILabel *)v8->_titleLabel setLineBreakMode:4];
    [(UILabel *)v8->_titleLabel sizeToFit];
    [(STStorageButtonHeader *)v8 addSubview:v8->_titleLabel];
    uint64_t v17 = +[UIButton buttonWithType:1];
    headerButton = v8->_headerButton;
    v8->_headerButton = (UIButton *)v17;

    [(UIButton *)v8->_headerButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v19 = v8->_headerButton;
    v20 = +[UIColor systemBlueColor];
    [(UIButton *)v19 setTitleColor:v20 forState:0];

    v21 = v8->_headerButton;
    v22 = PreferencesTableViewHeaderFont();
    [(UIButton *)v21 _setFont:v22];

    v23 = +[UIColor clearColor];
    [(UIButton *)v8->_headerButton setBackgroundColor:v23];

    v24 = [v4 propertyForKey:@"stButtonSymbol"];
    if (v24)
    {
      v25 = v8->_headerButton;
      v26 = +[UIImage systemImageNamed:v24];
      [(UIButton *)v25 setImage:v26 forState:0];

      v8->_hasSymbolButton = 1;
    }
    else
    {
      v27 = [v4 propertyForKey:@"stButtonTitle"];
      v28 = v8->_headerButton;
      v29 = +[NSLocale currentLocale];
      v30 = [v27 uppercaseStringWithLocale:v29];
      [(UIButton *)v28 setTitle:v30 forState:0];
    }
    v31 = [v4 target];
    id v32 = [v4 buttonAction];
    if (v31)
    {
      id v33 = v32;
      if (v32) {
        [(UIButton *)v8->_headerButton addTarget:v31 action:v32 forControlEvents:64];
      }
    }
    -[STStorageButtonHeader addSubview:](v8, "addSubview:", v8->_headerButton, v33);
    [(STStorageButtonHeader *)v8 updateConstraints];
  }
  return v8;
}

- (void)updateConstraints
{
  [(UIButton *)self->_headerButton sizeToFit];
  v3 = _NSDictionaryOfVariableBindings(@"_titleLabel, _headerButton", self->_titleLabel, self->_headerButton, 0);
  if ([(NSMutableArray *)self->_constraints count]) {
    +[NSLayoutConstraint deactivateConstraints:self->_constraints];
  }
  id v4 = +[NSMutableArray arrayWithCapacity:20];
  constraints = self->_constraints;
  self->_constraints = v4;

  unsigned int v6 = [(UIButton *)self->_headerButton isHidden];
  v7 = self->_constraints;
  if (v6) {
    CFStringRef v8 = @"H:|-16-[_titleLabel]-15-|";
  }
  else {
    CFStringRef v8 = @"H:|-16-[_titleLabel]-10-[_headerButton]-15-|";
  }
  v9 = +[NSLayoutConstraint constraintsWithVisualFormat:v8 options:0 metrics:0 views:v3];
  [(NSMutableArray *)v7 addObjectsFromArray:v9];

  v10 = self->_constraints;
  headerButton = self->_headerButton;
  [(UIButton *)headerButton bounds];
  v13 = +[NSLayoutConstraint constraintWithItem:headerButton attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:0.0 constant:v12];
  [(NSMutableArray *)v10 addObject:v13];

  v14 = [(UILabel *)self->_titleLabel text];
  id v15 = [v14 length];

  v16 = self->_constraints;
  if (v15)
  {
    uint64_t v17 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|-(>=5)-[_titleLabel]-5-|", 0, 0, v3);
    [(NSMutableArray *)v16 addObjectsFromArray:v17];

    v18 = self->_constraints;
    v19 = +[NSLayoutConstraint constraintWithItem:self->_headerButton attribute:12 relatedBy:0 toItem:self->_titleLabel attribute:12 multiplier:1.0 constant:0.0];
    [(NSMutableArray *)v18 addObject:v19];
  }
  else
  {
    v19 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|-(>=5)-[_headerButton]-7-|", 0, 0, v3);
    [(NSMutableArray *)v16 addObjectsFromArray:v19];
  }

  if (self->_hasSymbolButton)
  {
    v20 = self->_constraints;
    v21 = +[NSLayoutConstraint constraintWithItem:self->_headerButton attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:0.0 constant:20.0];
    [(NSMutableArray *)v20 addObject:v21];
  }
  +[NSLayoutConstraint activateConstraints:self->_constraints];
  v22.receiver = self;
  v22.super_class = (Class)STStorageButtonHeader;
  [(STStorageButtonHeader *)&v22 updateConstraints];
}

- (double)preferredHeightForWidth:(double)a3
{
  id v4 = [(UILabel *)self->_titleLabel text];
  id v5 = [v4 length];

  if (v5)
  {
    unsigned int v6 = [(UILabel *)self->_titleLabel font];
    [v6 ascender];
    double v8 = v7;
    v9 = [(UILabel *)self->_titleLabel font];
    [v9 descender];
    double v11 = v8 - v10 + 12.0;
  }
  else
  {
    double v11 = 0.0;
  }
  double v12 = 20.0;
  if (!self->_hasSymbolButton)
  {
    v13 = [(UIButton *)self->_headerButton titleLabel];
    v14 = [v13 text];
    id v15 = [v14 length];

    if (v15)
    {
      v16 = [v13 font];
      [v16 ascender];
      double v18 = v17;
      v19 = [v13 font];
      [v19 descender];
      double v12 = v18 - v20 + 12.0;
    }
    else
    {
      double v12 = 0.0;
    }
  }
  return round(fmax(v11, v12));
}

- (void)setHeaderButtonTitle:(id)a3
{
  headerButton = self->_headerButton;
  id v5 = a3;
  unsigned int v6 = +[NSLocale currentLocale];
  double v7 = [v5 uppercaseStringWithLocale:v6];

  [(UIButton *)headerButton setTitle:v7 forState:0];

  [(STStorageButtonHeader *)self updateConstraints];
}

- (UIButton)headerButton
{
  return (UIButton *)objc_getProperty(self, a2, 24, 1);
}

- (void)setHeaderButton:(id)a3
{
}

- (UILabel)titleLabel
{
  return (UILabel *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTitleLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_headerButton, 0);

  objc_storeStrong((id *)&self->_constraints, 0);
}

@end