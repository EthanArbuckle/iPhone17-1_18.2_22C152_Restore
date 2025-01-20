@interface PreferencesDoubleTwoPartValueCell
- (TwoPartTextLabel)twoPartTextLabel2;
- (UILabel)textLabel2;
- (void)_layoutSubviewsCore;
- (void)checkValueWidths;
- (void)layoutText:(id)a3 andValue:(id)a4;
@end

@implementation PreferencesDoubleTwoPartValueCell

- (UILabel)textLabel2
{
  textLabel2 = self->_textLabel2;
  if (!textLabel2)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    v5 = self->_textLabel2;
    self->_textLabel2 = v4;

    v6 = _calendarPreferencesTableAdditionsBoldFont();
    [(UILabel *)self->_textLabel2 setFont:v6];

    v7 = [MEMORY[0x1E4FB1618] clearColor];
    [(UILabel *)self->_textLabel2 setBackgroundColor:v7];

    v8 = [(PreferencesDoubleTwoPartValueCell *)self contentView];
    [v8 addSubview:self->_textLabel2];

    textLabel2 = self->_textLabel2;
  }

  return textLabel2;
}

- (TwoPartTextLabel)twoPartTextLabel2
{
  twoPartLabel2 = self->_twoPartLabel2;
  if (!twoPartLabel2)
  {
    v4 = objc_alloc_init(TwoPartTextLabel);
    v5 = self->_twoPartLabel2;
    self->_twoPartLabel2 = v4;

    v6 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    [(TwoPartTextLabel *)self->_twoPartLabel2 setFont:v6];

    v7 = [(PreferencesTwoPartValueCell *)self valueColor];
    [(TwoPartTextLabel *)self->_twoPartLabel2 setTextColor:v7];

    v8 = [MEMORY[0x1E4FB1618] clearColor];
    [(TwoPartTextLabel *)self->_twoPartLabel2 setBackgroundColor:v8];

    v9 = [(PreferencesDoubleTwoPartValueCell *)self contentView];
    [v9 addSubview:self->_twoPartLabel2];

    twoPartLabel2 = self->_twoPartLabel2;
  }

  return twoPartLabel2;
}

- (void)_layoutSubviewsCore
{
  v4.receiver = self;
  v4.super_class = (Class)PreferencesDoubleTwoPartValueCell;
  [(PreferencesTwoPartValueCell *)&v4 _layoutSubviewsCore];
  v3 = [(PreferencesDoubleTwoPartValueCell *)self textLabel];
  [(PreferencesDoubleTwoPartValueCell *)self layoutText:v3 andValue:self->_twoPartLabel2];
}

- (void)checkValueWidths
{
  v3 = [(PreferencesTwoPartValueCell *)self shortener];

  if (!v3) {
    return;
  }
  if (![(TwoPartTextLabel *)self->super._twoPartLabel hasTwoParts]
    || ([(TwoPartTextLabel *)self->super._twoPartLabel frame],
        double v5 = v4,
        [(TwoPartTextLabel *)self->super._twoPartLabel idealSize],
        v5 >= v6))
  {
    p_twoPartLabel2 = &self->_twoPartLabel2;
    if (![(TwoPartTextLabel *)self->_twoPartLabel2 hasTwoParts]) {
      return;
    }
    char v8 = 0;
LABEL_8:
    [(TwoPartTextLabel *)*p_twoPartLabel2 frame];
    double v10 = v9;
    [(TwoPartTextLabel *)*p_twoPartLabel2 idealSize];
    if ((v8 & 1) == 0 && v10 >= v11) {
      return;
    }
    goto LABEL_11;
  }
  p_twoPartLabel2 = &self->_twoPartLabel2;
  if ([(TwoPartTextLabel *)self->_twoPartLabel2 hasTwoParts])
  {
    char v8 = 1;
    goto LABEL_8;
  }
LABEL_11:

  [(PreferencesTwoPartValueCell *)self shorten];
}

- (void)layoutText:(id)a3 andValue:(id)a4
{
  v47.receiver = self;
  v47.super_class = (Class)PreferencesDoubleTwoPartValueCell;
  [(PreferencesTwoPartValueCell *)&v47 layoutText:a3 andValue:a4];
  textLabel2 = self->_textLabel2;
  twoPartLabel2 = self->_twoPartLabel2;
  v46.receiver = self;
  v46.super_class = (Class)PreferencesDoubleTwoPartValueCell;
  [(PreferencesTwoPartValueCell *)&v46 layoutText:textLabel2 andValue:twoPartLabel2];
  v7 = [(PreferencesDoubleTwoPartValueCell *)self contentView];
  [v7 bounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  v16 = [(PreferencesDoubleTwoPartValueCell *)self textLabel];
  [v16 frame];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;

  v48.origin.x = v9;
  v48.origin.y = v11;
  v48.size.width = v13;
  v48.size.height = v15;
  CGFloat v23 = CGRectGetMinY(v48) + 9.0;
  v24 = [(PreferencesDoubleTwoPartValueCell *)self textLabel];
  objc_msgSend(v24, "setFrame:", v18, v23, v20, v22);

  v25 = [(PreferencesTwoPartValueCell *)self twoPartTextLabel];
  [v25 frame];
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;

  v49.origin.x = v9;
  v49.origin.y = v11;
  v49.size.width = v13;
  v49.size.height = v15;
  CGFloat v32 = CGRectGetMinY(v49) + 9.0;
  v33 = [(PreferencesTwoPartValueCell *)self twoPartTextLabel];
  objc_msgSend(v33, "setFrame:", v27, v32, v29, v31);

  [(UILabel *)self->_textLabel2 frame];
  double v35 = v34;
  double v37 = v36;
  double v39 = v38;
  v50.origin.x = v9;
  v50.origin.y = v11;
  v50.size.width = v13;
  v50.size.height = v15;
  -[UILabel setFrame:](self->_textLabel2, "setFrame:", v35, CGRectGetMaxY(v50) + -9.0 - v39, v37, v39);
  [(TwoPartTextLabel *)self->_twoPartLabel2 frame];
  double v41 = v40;
  double v43 = v42;
  double v45 = v44;
  v51.origin.x = v9;
  v51.origin.y = v11;
  v51.size.width = v13;
  v51.size.height = v15;
  -[TwoPartTextLabel setFrame:](self->_twoPartLabel2, "setFrame:", v41, CGRectGetMaxY(v51) + -9.0 - v45, v43, v45);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_twoPartLabel2, 0);

  objc_storeStrong((id *)&self->_textLabel2, 0);
}

@end