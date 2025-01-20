@interface HXUIInlineDatePickerTableViewCell
- (BOOL)expanded;
- (CGRect)_contentLabelFrame;
- (CGRect)_pickerFrame;
- (CGSize)contentLabelHeightForBoundsSize:(CGSize)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (HXUIInlineDatePickerTableViewCell)initWithTitle:(id)a3 datePickerMode:(int64_t)a4 maxDate:(id)a5;
- (UIDatePicker)datePicker;
- (double)expandedHeight;
- (void)layoutSubviews;
- (void)setDisplayName:(id)a3;
- (void)setExpanded:(BOOL)a3;
- (void)updateLabelWithDate:(id)a3;
@end

@implementation HXUIInlineDatePickerTableViewCell

- (HXUIInlineDatePickerTableViewCell)initWithTitle:(id)a3 datePickerMode:(int64_t)a4 maxDate:(id)a5
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v10 = [MEMORY[0x1E4F29128] UUID];
  v11 = [v10 UUIDString];

  v27.receiver = self;
  v27.super_class = (Class)HXUIInlineDatePickerTableViewCell;
  v12 = [(HXUIInlineDatePickerTableViewCell *)&v27 initWithStyle:0 reuseIdentifier:v11];
  if (v12)
  {
    v13 = [MEMORY[0x1E4FB1618] secondarySystemGroupedBackgroundColor];
    [(HXUIInlineDatePickerTableViewCell *)v12 setBackgroundColor:v13];

    [(HXUIInlineDatePickerTableViewCell *)v12 setSelectionStyle:0];
    v14 = objc_alloc_init(HXUIPickerLabelView);
    contentLabel = v12->_contentLabel;
    v12->_contentLabel = v14;

    [(HXUIPickerLabelView *)v12->_contentLabel setText:v8];
    v16 = [(HXUIInlineDatePickerTableViewCell *)v12 contentView];
    [v16 addSubview:v12->_contentLabel];

    [(HXUIInlineDatePickerTableViewCell *)v12 _contentLabelFrame];
    -[HXUIPickerLabelView setFrame:](v12->_contentLabel, "setFrame:");
    v17 = (UIDatePicker *)objc_alloc_init(MEMORY[0x1E4FB16B0]);
    picker = v12->_picker;
    v12->_picker = v17;

    if (a4 == 1) {
      uint64_t v19 = 3;
    }
    else {
      uint64_t v19 = 1;
    }
    [(UIDatePicker *)v12->_picker setPreferredDatePickerStyle:v19];
    [(UIDatePicker *)v12->_picker setDatePickerMode:a4];
    [(UIDatePicker *)v12->_picker setMaximumDate:v9];
    v20 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v21 = [v20 timeZone];
    [(UIDatePicker *)v12->_picker setTimeZone:v21];

    [(UIDatePicker *)v12->_picker setAlpha:0.0];
    v22 = [(HXUIInlineDatePickerTableViewCell *)v12 contentView];
    [v22 addSubview:v12->_picker];

    [(HXUIInlineDatePickerTableViewCell *)v12 _pickerFrame];
    -[UIDatePicker setFrame:](v12->_picker, "setFrame:");
    v23 = self;
    v28[0] = v23;
    v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
    id v25 = (id)[(HXUIInlineDatePickerTableViewCell *)v12 registerForTraitChanges:v24 withHandler:&__block_literal_global_4];
  }
  return v12;
}

uint64_t __74__HXUIInlineDatePickerTableViewCell_initWithTitle_datePickerMode_maxDate___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setNeedsLayout];
}

- (CGRect)_contentLabelFrame
{
  [(HXUIInlineDatePickerTableViewCell *)self bounds];
  double v4 = v3 + -30.0;
  -[HXUIInlineDatePickerTableViewCell contentLabelHeightForBoundsSize:](self, "contentLabelHeightForBoundsSize:", v3 + -30.0, 10000.0);
  double v6 = v5;
  double v7 = 15.0;
  double v8 = 4.0;
  double v9 = v4;
  result.size.height = v6;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (CGRect)_pickerFrame
{
  [(HXUIInlineDatePickerTableViewCell *)self _contentLabelFrame];
  CGFloat MaxY = CGRectGetMaxY(v11);
  [(HXUIInlineDatePickerTableViewCell *)self bounds];
  double v5 = v4;
  -[UIDatePicker sizeThatFits:](self->_picker, "sizeThatFits:", v4, 10000.0);
  double v7 = v6;
  double v8 = 0.0;
  double v9 = MaxY;
  double v10 = v5;
  result.size.height = v7;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)HXUIInlineDatePickerTableViewCell;
  [(HXUIInlineDatePickerTableViewCell *)&v3 layoutSubviews];
  [(HXUIInlineDatePickerTableViewCell *)self _contentLabelFrame];
  -[HXUIPickerLabelView setFrame:](self->_contentLabel, "setFrame:");
  [(HXUIInlineDatePickerTableViewCell *)self _pickerFrame];
  -[UIDatePicker setFrame:](self->_picker, "setFrame:");
}

- (UIDatePicker)datePicker
{
  return self->_picker;
}

- (void)updateLabelWithDate:(id)a3
{
  double v4 = (objc_class *)MEMORY[0x1E4F28C10];
  id v5 = a3;
  id v9 = objc_alloc_init(v4);
  if ([(UIDatePicker *)self->_picker datePickerMode] == UIDatePickerModeDate)
  {
    [v9 setDateStyle:2];
    [v9 setTimeStyle:0];
  }
  else if ([(UIDatePicker *)self->_picker datePickerMode])
  {
    double v6 = CPDateFormatStringForFormatType();
    [v9 setDateFormat:v6];
  }
  else
  {
    [v9 setTimeStyle:1];
    [v9 setDateStyle:0];
  }
  double v7 = [MEMORY[0x1E4F1CA20] currentLocale];
  [v9 setLocale:v7];

  double v8 = [v9 stringFromDate:v5];

  [(HXUIPickerLabelView *)self->_contentLabel setDetailText:v8];
}

- (void)setExpanded:(BOOL)a3
{
  self->_expanded = a3;
  double v5 = 0.0;
  if (a3) {
    double v5 = 1.0;
  }
  [(UIDatePicker *)self->_picker setAlpha:v5];
  if (a3) {
    [MEMORY[0x1E4FB1618] systemBlueColor];
  }
  else {
  id v6 = [MEMORY[0x1E4FB1618] labelColor];
  }
  [(HXUIPickerLabelView *)self->_contentLabel setDetailTextColor:v6];
}

- (void)setDisplayName:(id)a3
{
}

- (CGSize)contentLabelHeightForBoundsSize:(CGSize)a3
{
  double v3 = a3.width + -30.0;
  if (v3 < 0.0) {
    double v3 = 0.0;
  }
  -[HXUIPickerLabelView sizeThatFits:](self->_contentLabel, "sizeThatFits:", v3, a3.height);
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  -[HXUIInlineDatePickerTableViewCell contentLabelHeightForBoundsSize:](self, "contentLabelHeightForBoundsSize:");
  double v7 = v6;
  double v9 = v8;
  if ([(HXUIInlineDatePickerTableViewCell *)self expanded])
  {
    -[UIDatePicker sizeThatFits:](self->_picker, "sizeThatFits:", width, height);
    double v9 = v9 + v10;
    double v7 = width;
  }
  double v11 = v9 + 8.0;
  double v12 = v7;
  result.double height = v11;
  result.double width = v12;
  return result;
}

- (double)expandedHeight
{
  [(HXUIInlineDatePickerTableViewCell *)self _pickerFrame];
  return CGRectGetMaxY(v3) + 4.0;
}

- (BOOL)expanded
{
  return self->_expanded;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_picker, 0);
  objc_storeStrong((id *)&self->_contentLabel, 0);
}

@end