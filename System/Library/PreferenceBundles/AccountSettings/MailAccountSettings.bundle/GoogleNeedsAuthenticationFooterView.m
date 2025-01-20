@interface GoogleNeedsAuthenticationFooterView
- (GoogleNeedsAuthenticationFooterView)initWithSpecifier:(id)a3;
- (double)_heightForMessageConstrainedToWidth:(double)a3;
- (double)preferredHeightForWidth:(double)a3;
- (id)_font;
- (void)layoutSubviews;
@end

@implementation GoogleNeedsAuthenticationFooterView

- (GoogleNeedsAuthenticationFooterView)initWithSpecifier:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)GoogleNeedsAuthenticationFooterView;
  v5 = [(GoogleNeedsAuthenticationFooterView *)&v20 init];
  if (v5)
  {
    v6 = [v4 propertyForKey:@"GoogleNameForAccountToAuthenticate"];
    v7 = +[NSBundle bundleForClass:objc_opt_class()];
    v8 = [v7 localizedStringForKey:@"ACCOUNT_NOT_AUTHENTICATED %@" value:&stru_B9F70 table:@"AccountPreferences"];
    uint64_t v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v6);
    verificationMessage = v5->_verificationMessage;
    v5->_verificationMessage = (NSString *)v9;

    v11 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    verificationMessageLabel = v5->_verificationMessageLabel;
    v5->_verificationMessageLabel = v11;

    [(UILabel *)v5->_verificationMessageLabel setText:v5->_verificationMessage];
    v13 = v5->_verificationMessageLabel;
    v14 = +[UIColor clearColor];
    [(UILabel *)v13 setBackgroundColor:v14];

    [(UILabel *)v5->_verificationMessageLabel setNumberOfLines:0];
    v15 = v5->_verificationMessageLabel;
    v16 = +[UIColor labelColor];
    [(UILabel *)v15 setTextColor:v16];

    v17 = v5->_verificationMessageLabel;
    v18 = [(GoogleNeedsAuthenticationFooterView *)v5 _font];
    [(UILabel *)v17 setFont:v18];

    [(GoogleNeedsAuthenticationFooterView *)v5 addSubview:v5->_verificationMessageLabel];
  }

  return v5;
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)GoogleNeedsAuthenticationFooterView;
  [(GoogleNeedsAuthenticationFooterView *)&v7 layoutSubviews];
  [(GoogleNeedsAuthenticationFooterView *)self frame];
  double v4 = v3 + -28.0;
  [(GoogleNeedsAuthenticationFooterView *)self frame];
  [(GoogleNeedsAuthenticationFooterView *)self _heightForMessageConstrainedToWidth:v5 + -28.0];
  -[UILabel setFrame:](self->_verificationMessageLabel, "setFrame:", 14.0, 0.0, v4, v6);
}

- (double)preferredHeightForWidth:(double)a3
{
  [(GoogleNeedsAuthenticationFooterView *)self _heightForMessageConstrainedToWidth:a3];
  return v3 + 28.0;
}

- (double)_heightForMessageConstrainedToWidth:(double)a3
{
  verificationMessage = self->_verificationMessage;
  NSAttributedStringKey v10 = NSFontAttributeName;
  double v5 = [(GoogleNeedsAuthenticationFooterView *)self _font];
  v11 = v5;
  double v6 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  -[NSString boundingRectWithSize:options:attributes:context:](verificationMessage, "boundingRectWithSize:options:attributes:context:", 1, v6, 0, a3, 1.79769313e308);
  double v8 = v7;

  return v8;
}

- (id)_font
{
  return +[UIFont systemFontOfSize:15.0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verificationMessageLabel, 0);

  objc_storeStrong((id *)&self->_verificationMessage, 0);
}

@end