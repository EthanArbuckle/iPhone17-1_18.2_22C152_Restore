@interface HUUnitPickerViewCell
- (CGSize)_estimatedSizeForAttributedString:(id)a3;
- (CGSize)longestValueSize;
- (HUUnitPickerViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSAttributedString)longestValue;
- (NSString)unitText;
- (UILabel)unitLabel;
- (id)effectiveUnitText;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)reloadPickerView;
- (void)setUnitLabel:(id)a3;
- (void)setUnitText:(id)a3;
- (void)updateUIWithAnimation:(BOOL)a3;
@end

@implementation HUUnitPickerViewCell

- (HUUnitPickerViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v15.receiver = self;
  v15.super_class = (Class)HUUnitPickerViewCell;
  v4 = [(HUPickerViewCell *)&v15 initWithStyle:a3 reuseIdentifier:a4];
  v5 = (HUUnitPickerViewCell *)v4;
  if (v4)
  {
    *(_OWORD *)(v4 + 1080) = *MEMORY[0x1E4F1DB30];
    id v6 = objc_alloc_init(MEMORY[0x1E4F42B38]);
    [(HUUnitPickerViewCell *)v5 setUnitLabel:v6];

    v7 = [MEMORY[0x1E4F42A30] systemFontOfSize:20.0];
    v8 = [(HUUnitPickerViewCell *)v5 unitLabel];
    [v8 setFont:v7];

    v9 = [(HUPickerViewCell *)v5 pickerView];
    v10 = [v9 _textColor];
    v11 = [(HUUnitPickerViewCell *)v5 unitLabel];
    [v11 setTextColor:v10];

    v12 = [(HUUnitPickerViewCell *)v5 contentView];
    v13 = [(HUUnitPickerViewCell *)v5 unitLabel];
    [v12 addSubview:v13];
  }
  return v5;
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)HUUnitPickerViewCell;
  [(HUPickerViewCell *)&v4 prepareForReuse];
  longestValue = self->_longestValue;
  self->_longestValue = 0;

  self->_longestValueSize = (CGSize)*MEMORY[0x1E4F1DB30];
}

- (void)reloadPickerView
{
  longestValue = self->_longestValue;
  self->_longestValue = 0;

  self->_longestValueSize = (CGSize)*MEMORY[0x1E4F1DB30];
  v4.receiver = self;
  v4.super_class = (Class)HUUnitPickerViewCell;
  [(HUPickerViewCell *)&v4 reloadPickerView];
}

- (void)setUnitText:(id)a3
{
  id v5 = a3;
  id v6 = self->_unitText;
  v7 = (NSString *)v5;
  v9 = v7;
  if (v6 == v7)
  {

    goto LABEL_8;
  }
  if (!v6)
  {

    goto LABEL_7;
  }
  char v8 = [(NSString *)v6 isEqual:v7];

  if ((v8 & 1) == 0)
  {
LABEL_7:
    objc_storeStrong((id *)&self->_unitText, a3);
    [(HUUnitPickerViewCell *)self updateUIWithAnimation:1];
  }
LABEL_8:
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  v13.receiver = self;
  v13.super_class = (Class)HUUnitPickerViewCell;
  [(HUPickerViewCell *)&v13 updateUIWithAnimation:a3];
  objc_super v4 = [(HUUnitPickerViewCell *)self unitLabel];
  id v5 = [v4 text];
  id v6 = [(HUUnitPickerViewCell *)self effectiveUnitText];
  id v7 = v5;
  id v8 = v6;
  if (v7 == v8)
  {

    return;
  }
  v9 = v8;
  if (!v7)
  {

    goto LABEL_7;
  }
  char v10 = [v7 isEqual:v8];

  if ((v10 & 1) == 0)
  {
LABEL_7:
    v11 = [(HUUnitPickerViewCell *)self effectiveUnitText];
    v12 = [(HUUnitPickerViewCell *)self unitLabel];
    [v12 setText:v11];

    [(HUUnitPickerViewCell *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)HUUnitPickerViewCell;
  [(HUUnitPickerViewCell *)&v18 layoutSubviews];
  v3 = [(HUUnitPickerViewCell *)self unitLabel];
  [v3 sizeToFit];

  objc_super v4 = [(HUUnitPickerViewCell *)self unitLabel];
  [v4 frame];
  double v6 = v5;
  double v8 = v7;

  v9 = [(HUPickerViewCell *)self pickerView];
  [v9 center];
  double v11 = v10;
  [(HUUnitPickerViewCell *)self longestValueSize];
  double v13 = v11 + v12 * 0.5 + 8.0;
  v14 = [(HUPickerViewCell *)self pickerView];
  [v14 center];
  double v16 = v15 - v8 * 0.5;

  v17 = [(HUUnitPickerViewCell *)self unitLabel];
  objc_msgSend(v17, "setFrame:", v13, v16, v6, v8);
}

- (id)effectiveUnitText
{
  v3 = [(HUUnitPickerViewCell *)self unitText];
  objc_super v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    double v6 = [(HUPickerViewCell *)self item];
    double v7 = [v6 latestResults];
    id v5 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F68AD0]];
  }

  return v5;
}

- (NSAttributedString)longestValue
{
  longestValue = self->_longestValue;
  if (!longestValue)
  {
    objc_super v4 = 0;
    if ([(HUPickerViewCell *)self numberOfValues])
    {
      uint64_t v5 = 0;
      double v6 = 0.0;
      while (1)
      {
        double v7 = [(HUPickerViewCell *)self pickerView];
        double v8 = [(HUPickerViewCell *)self pickerView:v7 attributedTitleForRow:v5 forComponent:0];

        if (v8) {
          break;
        }
        double v11 = [(HUPickerViewCell *)self pickerView];
        double v12 = [(HUPickerViewCell *)self pickerView:v11 titleForRow:v5 forComponent:0];

        if (v12)
        {
          double v8 = (NSAttributedString *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v12];

          if (v8) {
            break;
          }
        }
        else
        {
          double v8 = 0;
        }
LABEL_11:

        if (++v5 >= (unint64_t)[(HUPickerViewCell *)self numberOfValues]) {
          goto LABEL_12;
        }
      }
      [(HUUnitPickerViewCell *)self _estimatedSizeForAttributedString:v8];
      if (v9 > v6)
      {
        double v10 = v9;
        double v8 = v8;

        objc_super v4 = v8;
        double v6 = v10;
      }
      goto LABEL_11;
    }
LABEL_12:
    double v13 = self->_longestValue;
    self->_longestValue = v4;

    longestValue = self->_longestValue;
  }

  return longestValue;
}

- (CGSize)longestValueSize
{
  p_longestValueSize = &self->_longestValueSize;
  double width = self->_longestValueSize.width;
  double height = self->_longestValueSize.height;
  if (width == *MEMORY[0x1E4F1DB30] && height == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    double v7 = [(HUUnitPickerViewCell *)self longestValue];
    [(HUUnitPickerViewCell *)self _estimatedSizeForAttributedString:v7];
    p_longestValueSize->double width = v8;
    p_longestValueSize->double height = v9;

    double width = p_longestValueSize->width;
    double height = p_longestValueSize->height;
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)_estimatedSizeForAttributedString:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  uint64_t v16 = *MEMORY[0x1E4F42508];
  id v4 = a3;
  uint64_t v5 = [(HUUnitPickerViewCell *)self unitLabel];
  double v6 = [v5 font];
  v17[0] = v6;
  double v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
  CGFloat v8 = objc_msgSend(v4, "hf_attributedStringWithDefaultAttributes:", v7);

  CGFloat v9 = objc_msgSend(v8, "hf_attributedStringScaledByFactor:", 1.2);

  [v9 size];
  double v11 = v10;
  double v13 = v12;

  double v14 = v11;
  double v15 = v13;
  result.double height = v15;
  result.double width = v14;
  return result;
}

- (NSString)unitText
{
  return self->_unitText;
}

- (UILabel)unitLabel
{
  return self->_unitLabel;
}

- (void)setUnitLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitLabel, 0);
  objc_storeStrong((id *)&self->_unitText, 0);

  objc_storeStrong((id *)&self->_longestValue, 0);
}

@end