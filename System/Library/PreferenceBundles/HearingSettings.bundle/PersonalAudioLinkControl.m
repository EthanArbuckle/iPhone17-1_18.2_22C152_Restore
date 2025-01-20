@interface PersonalAudioLinkControl
+ (id)linkWithTitle:(id)a3;
- (NSString)title;
- (UILabel)titleLabel;
- (void)layoutSubviews;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation PersonalAudioLinkControl

+ (id)linkWithTitle:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(PersonalAudioLinkControl);
  [(PersonalAudioLinkControl *)v4 setTitle:v3];

  return v4;
}

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)PersonalAudioLinkControl;
  [(PersonalAudioLinkControl *)&v15 layoutSubviews];
  titleLabel = self->_titleLabel;
  if (!titleLabel)
  {
    v4 = (UILabel *)objc_alloc_init((Class)UILabel);
    v5 = self->_titleLabel;
    self->_titleLabel = v4;

    [(UILabel *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)self->_titleLabel setTextAlignment:1];
    [(UILabel *)self->_titleLabel setNumberOfLines:0];
    v6 = self->_titleLabel;
    v7 = +[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
    [(UILabel *)v6 setFont:v7];

    v8 = self->_titleLabel;
    v9 = +[UIColor systemBlueColor];
    [(UILabel *)v8 setTextColor:v9];

    [(PersonalAudioLinkControl *)self addSubview:self->_titleLabel];
    v10 = _NSDictionaryOfVariableBindings(@"_titleLabel", self->_titleLabel, 0);
    v11 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|-[_titleLabel]-|", 0, 0, v10);
    [(PersonalAudioLinkControl *)self addConstraints:v11];

    v12 = _NSDictionaryOfVariableBindings(@"_titleLabel", self->_titleLabel, 0);
    v13 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|-[_titleLabel]-|", 0, 0, v12);
    [(PersonalAudioLinkControl *)self addConstraints:v13];

    titleLabel = self->_titleLabel;
  }
  v14 = [(PersonalAudioLinkControl *)self title];
  [(UILabel *)titleLabel setText:v14];
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end