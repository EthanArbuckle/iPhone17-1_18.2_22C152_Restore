@interface CSProminentTextElementView
+ (Class)textLabelClass;
+ (unint64_t)elementType;
- (CSProminentTextElementView)initWithDate:(id)a3 font:(id)a4 textColor:(id)a5;
- (CSProminentTitleLabelDefining)textLabel;
- (NSDate)date;
- (NSString)overrideString;
- (UIColor)primaryTextColor;
- (UIFont)primaryFont;
- (id)displayString;
- (void)layoutSubviews;
- (void)setDate:(id)a3;
- (void)setOverrideString:(id)a3;
- (void)setPrimaryFont:(id)a3;
- (void)setPrimaryTextColor:(id)a3;
@end

@implementation CSProminentTextElementView

- (void)setDate:(id)a3
{
}

- (NSDate)date
{
  return self->_date;
}

- (CSProminentTitleLabelDefining)textLabel
{
  return self->_textLabel;
}

- (CSProminentTextElementView)initWithDate:(id)a3 font:(id)a4 textColor:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  +[CSProminentLayoutController frameForElements:](CSProminentLayoutController, "frameForElements:", [(id)objc_opt_class() elementType]);
  double x = v26.origin.x;
  double y = v26.origin.y;
  double width = v26.size.width;
  double height = v26.size.height;
  if (CGRectIsNull(v26))
  {
    double x = *MEMORY[0x1E4F1DB28];
    double y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  v25.receiver = self;
  v25.super_class = (Class)CSProminentTextElementView;
  v16 = -[CSProminentTextElementView initWithFrame:](&v25, sel_initWithFrame_, x, y, width, height);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_date, a3);
    overrideString = v17->_overrideString;
    v17->_overrideString = 0;

    objc_storeStrong((id *)&v17->_primaryFont, a4);
    objc_storeStrong((id *)&v17->_primaryTextColor, a5);
    id v19 = objc_alloc((Class)[(id)objc_opt_class() textLabelClass]);
    [(CSProminentTextElementView *)v17 bounds];
    v20 = objc_msgSend(v19, "initWithFrame:");
    [v20 setTextAlignment:1];
    [v20 setTextColor:v11];
    [v20 setFont:v10];
    if (objc_opt_respondsToSelector()) {
      [v20 setClipsToBounds:0];
    }
    textLabel = v17->_textLabel;
    v17->_textLabel = (CSProminentTitleLabelDefining *)v20;
    id v22 = v20;

    v23 = [(CSProminentTitleLabelDefining *)v17->_textLabel view];

    [(CSProminentTextElementView *)v17 addSubview:v23];
  }

  return v17;
}

+ (unint64_t)elementType
{
  return 0;
}

+ (Class)textLabelClass
{
  if (_os_feature_enabled_impl()) {
    [(id)objc_opt_class() elementType];
  }
  v2 = objc_opt_class();

  return (Class)v2;
}

- (id)displayString
{
  return self->_overrideString;
}

- (void)setPrimaryFont:(id)a3
{
  id v5 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_primaryFont, a3);
    [(CSProminentTitleLabelDefining *)self->_textLabel setFont:v5];
    [(CSProminentTextElementView *)self setNeedsLayout];
  }
}

- (void)setPrimaryTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_primaryTextColor, a3);
  id v5 = a3;
  [(CSProminentTitleLabelDefining *)self->_textLabel setTextColor:v5];
}

- (void)setOverrideString:(id)a3
{
  p_overrideString = &self->_overrideString;
  id v6 = a3;
  if ((BSEqualStrings() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_overrideString, a3);
    [(CSProminentTitleLabelDefining *)self->_textLabel setText:*p_overrideString];
    [(CSProminentTextElementView *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  v20.receiver = self;
  v20.super_class = (Class)CSProminentTextElementView;
  [(CSProminentTextElementView *)&v20 layoutSubviews];
  [(CSProminentTextElementView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  v7 = [(CSProminentTitleLabelDefining *)self->_textLabel view];
  objc_msgSend(v7, "sizeThatFits:", v4, v6);
  double v9 = v8;
  double v11 = v10;

  v12 = [(CSProminentTextElementView *)self traitCollection];
  [v12 displayScale];

  uint64_t v13 = [(CSProminentTitleLabelDefining *)self->_textLabel textAlignment];
  if (v9 <= v4) {
    double v14 = v9;
  }
  else {
    double v14 = v4;
  }
  if (v13 == 1) {
    double v4 = v14;
  }
  BSPointRoundForScale();
  double v16 = v15;
  double v18 = v17;
  id v19 = [(CSProminentTitleLabelDefining *)self->_textLabel view];
  objc_msgSend(v19, "setFrame:", v16, v18, v4, v11);
}

- (NSString)overrideString
{
  return self->_overrideString;
}

- (UIFont)primaryFont
{
  return self->_primaryFont;
}

- (UIColor)primaryTextColor
{
  return self->_primaryTextColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_primaryTextColor, 0);
  objc_storeStrong((id *)&self->_primaryFont, 0);
  objc_storeStrong((id *)&self->_overrideString, 0);

  objc_storeStrong((id *)&self->_date, 0);
}

@end