@interface ASExchangeIdView
- (ASExchangeIdTextView)idTextView;
- (ASExchangeIdView)initWithSpecifier:(id)a3;
- (UILabel)label;
- (double)labelTopPadding;
- (double)preferredHeightForWidth:(double)a3;
- (double)sized;
- (double)textViewTopPadding;
- (id)_accessibilityLabels;
- (id)_generateExchangeIdLabel;
- (id)_generateExchangeIdText;
- (void)handleLongPressGesture:(id)a3;
- (void)layoutSubviews;
- (void)setIdTextView:(id)a3;
- (void)setLabel:(id)a3;
- (void)setLabelTopPadding:(double)a3;
- (void)setSized:(double)a3;
- (void)setTextForExchangeId:(id)a3;
- (void)setTextViewTopPadding:(double)a3;
@end

@implementation ASExchangeIdView

- (id)_generateExchangeIdLabel
{
  id v3 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v4 = +[UIFont preferredFontForTextStyle:UIFontTextStyleFootnote];
  [v3 setFont:v4];

  v5 = +[UIColor grayColor];
  [v3 setTextColor:v5];

  v6 = +[UIColor clearColor];
  [v3 setBackgroundColor:v6];

  [(ASExchangeIdView *)self addSubview:v3];

  return v3;
}

- (id)_generateExchangeIdText
{
  id v3 = -[ASExchangeIdTextView initWithFrame:]([ASExchangeIdTextView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v4 = +[UIFont preferredFontForTextStyle:UIFontTextStyleFootnote];
  [(ASExchangeIdTextView *)v3 setFont:v4];

  v5 = +[UIColor grayColor];
  [(ASExchangeIdTextView *)v3 setTextColor:v5];

  v6 = +[UIColor clearColor];
  [(ASExchangeIdTextView *)v3 setBackgroundColor:v6];

  [(ASExchangeIdTextView *)v3 setUserInteractionEnabled:1];
  [(ASExchangeIdTextView *)v3 setNumberOfLines:0];
  id v7 = [objc_alloc((Class)UILongPressGestureRecognizer) initWithTarget:self action:"handleLongPressGesture:"];
  [(ASExchangeIdTextView *)v3 addGestureRecognizer:v7];
  [(ASExchangeIdView *)self addSubview:v3];

  return v3;
}

- (void)handleLongPressGesture:(id)a3
{
  id v17 = a3;
  if ([v17 state] == (char *)&dword_0 + 1)
  {
    id v3 = [v17 view];
    unsigned int v4 = [v3 becomeFirstResponder];

    if (v4)
    {
      v5 = +[UIMenuController sharedMenuController];
      v6 = [v17 view];
      [v6 frame];
      double v8 = v7;
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;
      v15 = [v17 view];
      v16 = [v15 superview];
      objc_msgSend(v5, "setTargetRect:inView:", v16, v8, v10, v12, v14);

      [v5 setMenuVisible:1 animated:1];
    }
  }
}

- (void)setTextForExchangeId:(id)a3
{
  unsigned int v4 = [a3 propertyForKey:@"ASExchangeIdKey"];
  v5 = [(ASExchangeIdView *)self idTextView];
  [v5 setText:v4];

  [(ASExchangeIdView *)self setSized:0.0];
  [(ASExchangeIdView *)self setLabelTopPadding:0.0];
  [(ASExchangeIdView *)self setTextViewTopPadding:0.0];

  [(ASExchangeIdView *)self setNeedsLayout];
}

- (ASExchangeIdView)initWithSpecifier:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ASExchangeIdView;
  v5 = -[ASExchangeIdView initWithFrame:](&v15, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v6 = v5;
  if (v5)
  {
    uint64_t v7 = [(ASExchangeIdView *)v5 _generateExchangeIdLabel];
    label = v6->_label;
    v6->_label = (UILabel *)v7;

    uint64_t v9 = [(ASExchangeIdView *)v6 _generateExchangeIdText];
    idTextView = v6->_idTextView;
    v6->_idTextView = (ASExchangeIdTextView *)v9;

    double v11 = +[NSBundle bundleForClass:objc_opt_class()];
    double v12 = [v11 localizedStringForKey:@"DEVICE_ID_DESCRIPTION" value:&stru_30C50 table:@"ASAccountSetup"];
    [(UILabel *)v6->_label setText:v12];

    [(UILabel *)v6->_label setTextAlignment:1];
    [(ASExchangeIdTextView *)v6->_idTextView setTextAlignment:1];
    [(ASExchangeIdView *)v6 setTextForExchangeId:v4];
    double v13 = +[UIColor clearColor];
    [(ASExchangeIdView *)v6 setBackgroundColor:v13];
  }
  return v6;
}

- (double)preferredHeightForWidth:(double)a3
{
  [(ASExchangeIdView *)self sized];
  if (v5 == 0.0)
  {
    [(ASExchangeIdView *)self setLabelTopPadding:2.0];
    [(ASExchangeIdView *)self setTextViewTopPadding:10.0];
    v6 = [(ASExchangeIdView *)self label];
    [v6 sizeToFit];

    [(ASExchangeIdView *)self labelTopPadding];
    double v8 = v7;
    uint64_t v9 = [(ASExchangeIdView *)self label];
    double v10 = sub_1956C(v9, a3);
    double v12 = v8 + v11 * 2.0;
    [(ASExchangeIdView *)self sized];
    [(ASExchangeIdView *)self setSized:v13 + v12];

    double v14 = [(ASExchangeIdView *)self idTextView];
    [v14 sizeToFit];

    [(ASExchangeIdView *)self textViewTopPadding];
    double v16 = v15;
    id v17 = [(ASExchangeIdView *)self idTextView];
    double v18 = sub_1956C(v17, a3);
    double v20 = v16 + v19 * 2.0;
    [(ASExchangeIdView *)self sized];
    [(ASExchangeIdView *)self setSized:v21 + v20];
  }

  [(ASExchangeIdView *)self sized];
  return result;
}

- (void)layoutSubviews
{
  CGFloat y = CGRectZero.origin.y;
  CGFloat width = CGRectZero.size.width;
  CGFloat height = CGRectZero.size.height;
  [(ASExchangeIdView *)self sized];
  if (v6 == 0.0)
  {
    [(ASExchangeIdView *)self bounds];
    [(ASExchangeIdView *)self preferredHeightForWidth:v7];
  }
  double v8 = [(ASExchangeIdView *)self label];
  [v8 frame];

  uint64_t v9 = [(ASExchangeIdView *)self label];
  [(ASExchangeIdView *)self bounds];
  double v11 = sub_1956C(v9, v10);
  double v13 = v12;

  [(ASExchangeIdView *)self bounds];
  CGFloat v15 = round((v14 - v11) * 0.5);
  [(ASExchangeIdView *)self labelTopPadding];
  double v17 = v16;
  v32.origin.x = CGRectZero.origin.x;
  v32.origin.CGFloat y = y;
  v32.size.CGFloat width = width;
  v32.size.CGFloat height = height;
  CGFloat v18 = v17 + CGRectGetMaxY(v32);
  double v19 = [(ASExchangeIdView *)self label];
  objc_msgSend(v19, "setFrame:", v15, v18, v11, v13);

  [(ASExchangeIdTextView *)self->_idTextView frame];
  idTextView = self->_idTextView;
  [(ASExchangeIdView *)self bounds];
  double v22 = sub_1956C(idTextView, v21);
  double v24 = v23;
  [(ASExchangeIdView *)self bounds];
  double v26 = round((v25 - v22) * 0.5);
  [(ASExchangeIdView *)self textViewTopPadding];
  double v28 = v27;
  v33.origin.x = v15;
  v33.origin.CGFloat y = v18;
  v33.size.CGFloat width = v11;
  v33.size.CGFloat height = v13;
  double v29 = v28 + CGRectGetMaxY(v33);
  id v30 = [(ASExchangeIdView *)self idTextView];
  objc_msgSend(v30, "setFrame:", v26, v29, v22, v24);
}

- (id)_accessibilityLabels
{
  v2 = [(ASExchangeIdView *)self label];
  id v3 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v2, 0);

  return v3;
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (ASExchangeIdTextView)idTextView
{
  return self->_idTextView;
}

- (void)setIdTextView:(id)a3
{
}

- (double)sized
{
  return self->_sized;
}

- (void)setSized:(double)a3
{
  self->_sized = a3;
}

- (double)labelTopPadding
{
  return self->_labelTopPadding;
}

- (void)setLabelTopPadding:(double)a3
{
  self->_labelTopPadding = a3;
}

- (double)textViewTopPadding
{
  return self->_textViewTopPadding;
}

- (void)setTextViewTopPadding:(double)a3
{
  self->_textViewTopPadding = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idTextView, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

@end