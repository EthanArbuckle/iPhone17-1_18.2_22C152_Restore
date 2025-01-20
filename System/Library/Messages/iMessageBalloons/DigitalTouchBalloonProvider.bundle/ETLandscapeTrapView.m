@interface ETLandscapeTrapView
- (ETLandscapeTrapView)init;
- (void)layoutSubviews;
@end

@implementation ETLandscapeTrapView

- (ETLandscapeTrapView)init
{
  v15.receiver = self;
  v15.super_class = (Class)ETLandscapeTrapView;
  v2 = [(ETLandscapeTrapView *)&v15 init];
  if (v2)
  {
    v3 = +[UIColor blackColor];
    [(ETLandscapeTrapView *)v2 setBackgroundColor:v3];

    v4 = (UILabel *)objc_alloc_init((Class)UILabel);
    label = v2->_label;
    v2->_label = v4;

    v6 = v2->_label;
    v7 = +[UIColor systemGrayColor];
    [(UILabel *)v6 setTextColor:v7];

    v8 = v2->_label;
    v9 = +[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
    [(UILabel *)v8 setFont:v9];

    [(UILabel *)v2->_label setNumberOfLines:0];
    [(UILabel *)v2->_label setTextAlignment:1];
    v10 = +[NSBundle bundleForClass:objc_opt_class()];
    v11 = v2->_label;
    v12 = [v10 localizedStringForKey:@"LANDSCAPE_TRAP_TEXT" value:&stru_24D60 table:@"DigitalTouchBalloonProvider-Localizable"];
    [(UILabel *)v11 setText:v12];

    [(ETLandscapeTrapView *)v2 addSubview:v2->_label];
    v13 = v2;
  }
  return v2;
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)ETLandscapeTrapView;
  [(ETLandscapeTrapView *)&v6 layoutSubviews];
  [(ETLandscapeTrapView *)self bounds];
  CGRect v8 = CGRectInset(v7, 15.0, 0.0);
  -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", v8.size.width, v8.size.height);
  -[UILabel setFrame:](self->_label, "setFrame:", 0.0, 0.0, v3, v4);
  label = self->_label;
  [(ETLandscapeTrapView *)self center];
  -[UILabel setCenter:](label, "setCenter:");
}

- (void).cxx_destruct
{
}

@end