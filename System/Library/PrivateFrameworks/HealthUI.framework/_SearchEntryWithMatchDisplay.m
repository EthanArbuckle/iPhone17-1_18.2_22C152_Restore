@interface _SearchEntryWithMatchDisplay
- (NSString)matchDisplayString;
- (UILabel)matchDisplayLabel;
- (_SearchEntryWithMatchDisplay)initWithFrame:(CGRect)a3;
- (id)_createMatchDisplayLabel;
- (void)layoutSubviews;
- (void)matchDisplayVisible:(BOOL)a3;
- (void)setMatchDisplayString:(id)a3;
@end

@implementation _SearchEntryWithMatchDisplay

- (id)_createMatchDisplayLabel
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1930]);
  v4 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v4 setOpaque:0];
  [v4 setHidden:1];
  v5 = [MEMORY[0x1E4FB1618] systemGrayColor];
  [v4 setTextColor:v5];

  v6 = [(_SearchEntryWithMatchDisplay *)self searchField];
  v7 = [v6 font];
  [v4 setFont:v7];

  return v4;
}

- (_SearchEntryWithMatchDisplay)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_SearchEntryWithMatchDisplay;
  id v3 = -[_SearchEntryWithMatchDisplay initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = [(_SearchEntryWithMatchDisplay *)v3 _createMatchDisplayLabel];
    matchDisplayLabel = v4->_matchDisplayLabel;
    v4->_matchDisplayLabel = (UILabel *)v5;

    [(_SearchEntryWithMatchDisplay *)v4 addSubview:v4->_matchDisplayLabel];
    v7 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    [(_SearchEntryWithMatchDisplay *)v4 setBackgroundColor:v7];
  }
  return v4;
}

- (void)matchDisplayVisible:(BOOL)a3
{
}

- (void)setMatchDisplayString:(id)a3
{
  [(UILabel *)self->_matchDisplayLabel setText:a3];
  [(_SearchEntryWithMatchDisplay *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)_SearchEntryWithMatchDisplay;
  [(_SearchEntryWithMatchDisplay *)&v15 layoutSubviews];
  [(_SearchEntryWithMatchDisplay *)self bounds];
  double v4 = v3;
  double v6 = v5;
  -[UILabel sizeThatFits:](self->_matchDisplayLabel, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  v8.n128_f64[0] = v7;
  v10.n128_f64[0] = v9;
  v11.n128_f64[0] = v4 + -40.0 - v7;
  v12.n128_u64[0] = 0.5;
  v13.n128_f64[0] = (v6 - v9) * 0.5;
  matchDisplayLabel = self->_matchDisplayLabel;
  HKUIRectIntegralToScreenScale(v11, v13, v8, v10, v12);
  -[UILabel setFrame:](matchDisplayLabel, "setFrame:");
}

- (NSString)matchDisplayString
{
  return self->_matchDisplayString;
}

- (UILabel)matchDisplayLabel
{
  return (UILabel *)objc_getProperty(self, a2, 504, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchDisplayLabel, 0);
  objc_storeStrong((id *)&self->_matchDisplayString, 0);
}

@end