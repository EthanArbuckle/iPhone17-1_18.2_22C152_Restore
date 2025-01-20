@interface SRSpeechAlternativeTapToEditCellView
- (CGSize)sizeThatFits:(CGSize)result;
- (SRSpeechAlternativeTapToEditCellView)init;
- (void)layoutSubviews;
- (void)setTextHidden:(BOOL)a3;
@end

@implementation SRSpeechAlternativeTapToEditCellView

- (SRSpeechAlternativeTapToEditCellView)init
{
  v17.receiver = self;
  v17.super_class = (Class)SRSpeechAlternativeTapToEditCellView;
  v2 = [(SRSpeechAlternativeTapToEditCellView *)&v17 init];
  if (v2)
  {
    v3 = +[NSBundle bundleForClass:objc_opt_class()];
    v4 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    tapToEditLabel = v2->_tapToEditLabel;
    v2->_tapToEditLabel = v4;

    v6 = v2->_tapToEditLabel;
    v7 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCaption2];
    [(UILabel *)v6 setFont:v7];

    v8 = v2->_tapToEditLabel;
    v9 = +[UIColor colorWithWhite:1.0 alpha:0.6];
    [(UILabel *)v8 setTextColor:v9];

    v10 = v2->_tapToEditLabel;
    v11 = [v3 siriUILocalizedStringForKey:@"TAP_TO_EDIT" table:0];
    id v12 = objc_alloc((Class)NSLocale);
    v13 = AFUIGetLanguageCode();
    id v14 = [v12 initWithLocaleIdentifier:v13];
    v15 = [v11 uppercaseStringWithLocale:v14];
    [(UILabel *)v10 setText:v15];

    [(UILabel *)v2->_tapToEditLabel setHidden:0];
    [(UILabel *)v2->_tapToEditLabel sizeToFit];
    [(SRSpeechAlternativeTapToEditCellView *)v2 addSubview:v2->_tapToEditLabel];
  }
  return v2;
}

- (void)setTextHidden:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UILabel *)self->_tapToEditLabel isHidden] != a3)
  {
    if (v3)
    {
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_10006756C;
      v7[3] = &unk_100142E88;
      v7[4] = self;
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_100067584;
      v6[3] = &unk_1001444D8;
      v6[4] = self;
      +[UIView animateWithDuration:v7 animations:v6 completion:0.5];
    }
    else
    {
      [(UILabel *)self->_tapToEditLabel setHidden:0];
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_10006759C;
      v5[3] = &unk_100142E88;
      v5[4] = self;
      +[UIView animateWithDuration:v5 animations:0.5];
    }
  }
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3 = SiriUIPlatterStyle[26];
  result.height = v3;
  return result;
}

- (void)layoutSubviews
{
  [(SRSpeechAlternativeTapToEditCellView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(UILabel *)self->_tapToEditLabel frame];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  double v16 = v15;
  double v18 = v17;
  if (SiriLanguageIsRTL())
  {
    v25.origin.x = v4;
    v25.origin.y = v6;
    v25.size.width = v8;
    v25.size.height = v10;
    CGFloat v19 = CGRectGetWidth(v25) - SiriUIPlatterStyle[34];
    v26.origin.x = v12;
    v26.origin.y = v14;
    v26.size.width = v16;
    v26.size.height = v18;
    double v20 = v19 - CGRectGetWidth(v26);
  }
  else
  {
    double v20 = SiriUIPlatterStyle[32];
  }
  [(UILabel *)self->_tapToEditLabel bounds];
  double v21 = SiriUIPlatterStyle[21];
  double Height = CGRectGetHeight(v27);
  tapToEditLabel = self->_tapToEditLabel;

  -[UILabel setFrame:](tapToEditLabel, "setFrame:", v20, v21 - Height, v16, v18);
}

- (void).cxx_destruct
{
}

@end