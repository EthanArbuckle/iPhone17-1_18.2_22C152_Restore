@interface ICNavigationTitleView
- (ICNavigationTitleView)init;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (id)accessibilityLabel;
- (void)setSubtitleLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation ICNavigationTitleView

- (ICNavigationTitleView)init
{
  v15.receiver = self;
  v15.super_class = (Class)ICNavigationTitleView;
  v2 = [(ICNavigationTitleView *)&v15 init];
  v3 = v2;
  if (v2)
  {
    [(ICNavigationTitleView *)v2 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v4 = objc_alloc_init((Class)UILabel);
    [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v4 setTextAlignment:1];
    v5 = +[UIFont boldSystemFontOfSize:16.0];
    v6 = objc_msgSend(v5, "ic_fontWithSingleLineA");
    [v4 setFont:v6];

    id v7 = objc_alloc_init((Class)UILabel);
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v7 setTextAlignment:1];
    v8 = +[UIFont systemFontOfSize:11.0];
    v9 = objc_msgSend(v8, "ic_fontWithSingleLineA");
    [v7 setFont:v9];

    [(ICNavigationTitleView *)v3 addSubview:v4];
    [(ICNavigationTitleView *)v3 addSubview:v7];
    v10 = _NSDictionaryOfVariableBindings(@"titleLabel, subtitleLabel", v4, v7, 0);
    v11 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|-0-[titleLabel]-0-|", 0, 0, v10);
    [(ICNavigationTitleView *)v3 addConstraints:v11];

    v12 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|-0-[subtitleLabel]-0-|", 0, 0, v10);
    [(ICNavigationTitleView *)v3 addConstraints:v12];

    v13 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|-0-[titleLabel]-0-[subtitleLabel]-0-|", 0, 0, v10);
    [(ICNavigationTitleView *)v3 addConstraints:v13];

    [(ICNavigationTitleView *)v3 setTitleLabel:v4];
    [(ICNavigationTitleView *)v3 setSubtitleLabel:v7];
    [(ICNavigationTitleView *)v3 setIsAccessibilityElement:1];
  }
  return v3;
}

- (id)accessibilityLabel
{
  v3 = [(ICNavigationTitleView *)self titleLabel];
  id v4 = [v3 text];
  v5 = [(ICNavigationTitleView *)self subtitleLabel];
  v8 = [v5 text];
  v6 = __ICAccessibilityStringForVariables();

  return v6;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleLabel, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end