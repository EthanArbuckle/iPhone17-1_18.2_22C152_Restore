@interface HUTimerIntervalPickerView
- (HUTimerIntervalPickerView)initWithFrame:(CGRect)a3;
- (HUTimerIntervalPickerViewDelegate)delegate;
- (UILabel)hoursLabel;
- (UILabel)minutesLabel;
- (UILabel)secondsLabel;
- (UIPickerView)timePicker;
- (double)pickerView:(id)a3 rowHeightForComponent:(int64_t)a4;
- (double)pickerView:(id)a3 widthForComponent:(int64_t)a4;
- (double)selectedDuration;
- (id)_hoursStringForHour:(int64_t)a3;
- (id)_labelForComponent:(int64_t)a3 createIfNecessary:(BOOL)a4;
- (id)_makeNewComponentLabel;
- (id)_minutesStringForMinutes:(int64_t)a3;
- (id)_secondsStringForSeconds:(int64_t)a3;
- (id)pickerView:(id)a3 viewForRow:(int64_t)a4 forComponent:(int64_t)a5 reusingView:(id)a6;
- (int64_t)numberOfComponentsInPickerView:(id)a3;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (void)_fadeLabelForComponent:(int64_t)a3 toText:(id)a4 animated:(BOOL)a5;
- (void)_positionLabel:(id)a3 forComponent:(int64_t)a4;
- (void)_setLabel:(id)a3 forComponent:(int64_t)a4;
- (void)_updateLabels:(BOOL)a3;
- (void)layoutSubviews;
- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5;
- (void)setDelegate:(id)a3;
- (void)setDuration:(double)a3;
- (void)setHoursLabel:(id)a3;
- (void)setMinutesLabel:(id)a3;
- (void)setSecondsLabel:(id)a3;
- (void)setTimePicker:(id)a3;
- (void)updateConstraints;
@end

@implementation HUTimerIntervalPickerView

- (HUTimerIntervalPickerView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HUTimerIntervalPickerView;
  v3 = -[HUTimerIntervalPickerView initWithFrame:](&v7, sel_initWithFrame_, 0.0, 0.0, 180.0, 216.0);
  if (v3)
  {
    uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42C78]), "initWithFrame:", 0.0, 0.0, 180.0, 216.0);
    timePicker = v3->_timePicker;
    v3->_timePicker = (UIPickerView *)v4;

    [(UIPickerView *)v3->_timePicker setDataSource:v3];
    [(UIPickerView *)v3->_timePicker setDelegate:v3];
    [(HUTimerIntervalPickerView *)v3 addSubview:v3->_timePicker];
  }
  return v3;
}

- (void)updateConstraints
{
  v6.receiver = self;
  v6.super_class = (Class)HUTimerIntervalPickerView;
  [(HUTimerIntervalPickerView *)&v6 updateConstraints];
  v3 = (void *)MEMORY[0x1E4F28DC8];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__HUTimerIntervalPickerView_updateConstraints__block_invoke;
  v5[3] = &unk_1E6385E30;
  v5[4] = self;
  uint64_t v4 = __46__HUTimerIntervalPickerView_updateConstraints__block_invoke((uint64_t)v5);
  [v3 activateConstraints:v4];
}

id __46__HUTimerIntervalPickerView_updateConstraints__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) timePicker];
  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];

  v3 = objc_opt_new();
  uint64_t v4 = [*(id *)(a1 + 32) timePicker];
  v5 = [v4 leadingAnchor];
  objc_super v6 = [*(id *)(a1 + 32) leadingAnchor];
  objc_super v7 = [v5 constraintEqualToAnchor:v6];
  [v3 addObject:v7];

  v8 = [*(id *)(a1 + 32) timePicker];
  v9 = [v8 trailingAnchor];
  v10 = [*(id *)(a1 + 32) trailingAnchor];
  v11 = [v9 constraintEqualToAnchor:v10];
  [v3 addObject:v11];

  v12 = [*(id *)(a1 + 32) timePicker];
  v13 = [v12 bottomAnchor];
  v14 = [*(id *)(a1 + 32) bottomAnchor];
  v15 = [v13 constraintEqualToAnchor:v14];
  [v3 addObject:v15];

  v16 = [*(id *)(a1 + 32) timePicker];
  v17 = [v16 topAnchor];
  v18 = [*(id *)(a1 + 32) topAnchor];
  v19 = [v17 constraintEqualToAnchor:v18];
  [v3 addObject:v19];

  return v3;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)HUTimerIntervalPickerView;
  [(HUTimerIntervalPickerView *)&v3 layoutSubviews];
  [(HUTimerIntervalPickerView *)self _updateLabels:1];
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 3;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  int64_t v4 = 60;
  if ((unint64_t)a4 >= 3) {
    int64_t v4 = 0;
  }
  if (a4) {
    return v4;
  }
  else {
    return 24;
  }
}

- (id)pickerView:(id)a3 viewForRow:(int64_t)a4 forComponent:(int64_t)a5 reusingView:(id)a6
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v9 = a6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v10 = (HUTimerIntervalPickerCell *)v9;
  }
  else {
    v10 = objc_alloc_init(HUTimerIntervalPickerCell);
  }
  v11 = v10;
  uint64_t v12 = 2
      * ([(HUTimerIntervalPickerView *)self effectiveUserInterfaceLayoutDirection] == 0);
  v13 = [(HUTimerIntervalPickerCell *)v11 textLabel];
  [v13 setTextAlignment:v12];

  v14 = [MEMORY[0x1E4F42A30] systemFontOfSize:22.0];
  v15 = [(HUTimerIntervalPickerCell *)v11 textLabel];
  [v15 setFont:v14];

  [(HUTimerIntervalPickerView *)self pickerView:self->_timePicker widthForComponent:a5];
  double v17 = v16;
  [(HUTimerIntervalPickerView *)self pickerView:self->_timePicker rowHeightForComponent:a5];
  -[HUTimerIntervalPickerCell setFrame:](v11, "setFrame:", 0.0, 0.0, v17, v18);
  v19 = [MEMORY[0x1E4F428B8] labelColor];
  v20 = (void *)MEMORY[0x1E4F28EE0];
  v21 = [NSNumber numberWithInteger:a4];
  v22 = [v20 localizedStringFromNumber:v21 numberStyle:0];

  id v23 = objc_alloc(MEMORY[0x1E4F28B18]);
  uint64_t v28 = *MEMORY[0x1E4F42510];
  v29[0] = v19;
  v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
  v25 = (void *)[v23 initWithString:v22 attributes:v24];

  v26 = [(HUTimerIntervalPickerCell *)v11 textLabel];
  [v26 setAttributedText:v25];

  return v11;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  -[HUTimerIntervalPickerView _updateLabels:](self, "_updateLabels:", 1, a4, a5);
  uint64_t v6 = [(HUTimerIntervalPickerView *)self delegate];
  if (v6)
  {
    objc_super v7 = (void *)v6;
    v8 = [(HUTimerIntervalPickerView *)self delegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      id v10 = [(HUTimerIntervalPickerView *)self delegate];
      [(HUTimerIntervalPickerView *)self selectedDuration];
      objc_msgSend(v10, "pickerView:didChangeSelectedDuration:", self);
    }
  }
}

- (double)pickerView:(id)a3 widthForComponent:(int64_t)a4
{
  [a3 bounds];
  return v4 / 3.0 + -10.0;
}

- (double)pickerView:(id)a3 rowHeightForComponent:(int64_t)a4
{
  return 32.0;
}

- (void)_updateLabels:(BOOL)a3
{
  BOOL v3 = a3;
  NSInteger v5 = [(UIPickerView *)self->_timePicker selectedRowInComponent:0];
  NSInteger v6 = [(UIPickerView *)self->_timePicker selectedRowInComponent:1];
  NSInteger v7 = [(UIPickerView *)self->_timePicker selectedRowInComponent:2];
  v8 = [(HUTimerIntervalPickerView *)self _hoursStringForHour:v5];
  [(HUTimerIntervalPickerView *)self _fadeLabelForComponent:0 toText:v8 animated:v3];

  char v9 = [(HUTimerIntervalPickerView *)self _minutesStringForMinutes:v6];
  [(HUTimerIntervalPickerView *)self _fadeLabelForComponent:1 toText:v9 animated:v3];

  id v10 = [(HUTimerIntervalPickerView *)self _secondsStringForSeconds:v7];
  [(HUTimerIntervalPickerView *)self _fadeLabelForComponent:2 toText:v10 animated:v3];
}

- (id)_makeNewComponentLabel
{
  id v2 = objc_alloc(MEMORY[0x1E4F42B38]);
  BOOL v3 = objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  double v4 = [MEMORY[0x1E4F42A30] boldSystemFontOfSize:17.0];
  [v3 setFont:v4];

  NSInteger v5 = [MEMORY[0x1E4F428B8] labelColor];
  [v3 setTextColor:v5];

  [v3 setTextAlignment:4];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  return v3;
}

- (id)_labelForComponent:(int64_t)a3 createIfNecessary:(BOOL)a4
{
  switch(a3)
  {
    case 2:
      p_secondsLabel = &self->_secondsLabel;
      secondsLabel = self->_secondsLabel;
      if (secondsLabel) {
        BOOL v11 = 1;
      }
      else {
        BOOL v11 = !a4;
      }
      if (v11) {
        goto LABEL_20;
      }
      v8 = -[HUTimerIntervalPickerView _secondsStringForSeconds:](self, "_secondsStringForSeconds:", 0, a4);
      char v9 = self;
      uint64_t v10 = 2;
      goto LABEL_19;
    case 1:
      p_secondsLabel = &self->_minutesLabel;
      secondsLabel = self->_minutesLabel;
      if (secondsLabel) {
        BOOL v12 = 1;
      }
      else {
        BOOL v12 = !a4;
      }
      if (v12) {
        goto LABEL_20;
      }
      v8 = -[HUTimerIntervalPickerView _minutesStringForMinutes:](self, "_minutesStringForMinutes:", 0, a4);
      char v9 = self;
      uint64_t v10 = 1;
      goto LABEL_19;
    case 0:
      p_secondsLabel = &self->_hoursLabel;
      secondsLabel = self->_hoursLabel;
      if (secondsLabel) {
        BOOL v7 = 1;
      }
      else {
        BOOL v7 = !a4;
      }
      if (v7) {
        goto LABEL_20;
      }
      v8 = -[HUTimerIntervalPickerView _hoursStringForHour:](self, "_hoursStringForHour:", 0, a4);
      char v9 = self;
      uint64_t v10 = 0;
LABEL_19:
      [(HUTimerIntervalPickerView *)v9 _fadeLabelForComponent:v10 toText:v8 animated:0];

      secondsLabel = *p_secondsLabel;
LABEL_20:
      v13 = secondsLabel;
      goto LABEL_22;
  }
  v13 = 0;
LABEL_22:

  return v13;
}

- (void)_setLabel:(id)a3 forComponent:(int64_t)a4
{
  id v7 = a3;
  if ((unint64_t)a4 <= 2)
  {
    id v8 = v7;
    objc_storeStrong((id *)((char *)&self->super.super.super.super.isa + *off_1E63872B0[a4]), a3);
    id v7 = v8;
  }
}

- (void)_positionLabel:(id)a3 forComponent:(int64_t)a4
{
  v24[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(HUTimerIntervalPickerView *)self effectiveUserInterfaceLayoutDirection];
  [(UIPickerView *)self->_timePicker _contentSizeForRow:0 inComponent:a4];
  if (a4 == 2)
  {
    double v10 = v8 * 2.0 + 18.0;
    double v11 = v8 * 2.0 + 23.0;
    if (v7 == 1) {
      double v11 = v10;
    }
    double v8 = v11 + 26.0;
    double v12 = 9.0;
    goto LABEL_11;
  }
  if (a4 == 1)
  {
    double v13 = 7.0;
    if (v7 == 1) {
      double v13 = 4.0;
    }
    double v14 = v13 + v8;
    double v12 = 9.0;
    double v8 = v14 + 9.0 + 26.0;
LABEL_11:
    double v9 = v8 + v12;
    goto LABEL_12;
  }
  double v9 = 9.0;
  if (!a4) {
    double v9 = dbl_1BEA19B60[v7 == 1];
  }
LABEL_12:
  LODWORD(v8) = 1148846080;
  [v6 setContentHuggingPriority:0 forAxis:v8];
  LODWORD(v15) = 1148846080;
  [v6 setContentCompressionResistancePriority:0 forAxis:v15];
  double v16 = (void *)MEMORY[0x1E4F28DC8];
  double v17 = [v6 leadingAnchor];
  double v18 = [(UIPickerView *)self->_timePicker leadingAnchor];
  v19 = [v17 constraintEqualToAnchor:v18 constant:v9 + 4.0];
  v24[0] = v19;
  v20 = [v6 centerYAnchor];

  v21 = [(UIPickerView *)self->_timePicker centerYAnchor];
  v22 = [v20 constraintEqualToAnchor:v21 constant:1.0];
  v24[1] = v22;
  id v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
  [v16 activateConstraints:v23];
}

- (void)_fadeLabelForComponent:(int64_t)a3 toText:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = [(HUTimerIntervalPickerView *)self _labelForComponent:a3 createIfNecessary:0];
  double v10 = [v9 text];
  char v11 = [v10 isEqualToString:v8];

  id v12 = v9;
  if ((v11 & 1) == 0)
  {
    if (v5)
    {
      double v13 = [(HUTimerIntervalPickerView *)self _makeNewComponentLabel];

      [v13 setText:v8];
      [(HUTimerIntervalPickerView *)self addSubview:v13];
      [(HUTimerIntervalPickerView *)self _positionLabel:v13 forComponent:a3];
      [v13 setAlpha:0.0];
      double v14 = (void *)MEMORY[0x1E4F42FF0];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __68__HUTimerIntervalPickerView__fadeLabelForComponent_toText_animated___block_invoke;
      v20[3] = &unk_1E6386018;
      id v21 = v9;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __68__HUTimerIntervalPickerView__fadeLabelForComponent_toText_animated___block_invoke_2;
      v18[3] = &unk_1E6386730;
      id v19 = v21;
      [v14 animateWithDuration:0x10000 delay:v20 options:v18 animations:0.2 completion:0.0];
      double v15 = (void *)MEMORY[0x1E4F42FF0];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __68__HUTimerIntervalPickerView__fadeLabelForComponent_toText_animated___block_invoke_3;
      v16[3] = &unk_1E6386018;
      id v12 = v13;
      id v17 = v12;
      [v15 animateWithDuration:0x20000 delay:v16 options:0 animations:0.2 completion:0.0];
    }
    else
    {
      id v12 = v9;
      if (!v9)
      {
        id v12 = [(HUTimerIntervalPickerView *)self _makeNewComponentLabel];
        [(HUTimerIntervalPickerView *)self addSubview:v12];
      }
      [v12 setText:v8];
      [(HUTimerIntervalPickerView *)self _positionLabel:v12 forComponent:a3];
    }
  }
  [(HUTimerIntervalPickerView *)self _setLabel:v12 forComponent:a3];
}

uint64_t __68__HUTimerIntervalPickerView__fadeLabelForComponent_toText_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __68__HUTimerIntervalPickerView__fadeLabelForComponent_toText_animated___block_invoke_2(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) removeFromSuperview];
  }
  return result;
}

uint64_t __68__HUTimerIntervalPickerView__fadeLabelForComponent_toText_animated___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

- (void)setDuration:(double)a3
{
  [(UIPickerView *)self->_timePicker selectRow:(uint64_t)(a3 / 3600.0) inComponent:0 animated:0];
  [(UIPickerView *)self->_timePicker selectRow:(int)(((__int16)((34953 * ((int)(uint64_t)a3 % 3600)) >> 16) >> 5)+ ((((int)(uint64_t)a3 % 3600 + ((-30583 * ((int)(uint64_t)a3 % 3600)) >> 16)) & 0x8000) >> 15)) inComponent:1 animated:0];
  [(UIPickerView *)self->_timePicker selectRow:(uint64_t)a3 % 60 inComponent:2 animated:0];

  [(HUTimerIntervalPickerView *)self _updateLabels:1];
}

- (double)selectedDuration
{
  double v3 = (double)(3600 * [(UIPickerView *)self->_timePicker selectedRowInComponent:0]);
  double v4 = v3 + (double)(60 * [(UIPickerView *)self->_timePicker selectedRowInComponent:1]);
  return v4 + (double)[(UIPickerView *)self->_timePicker selectedRowInComponent:2];
}

- (id)_hoursStringForHour:(int64_t)a3
{
  if (a3 == 1)
  {
    double v3 = @"HUHourSingular";
    double v4 = @"HUHourSingular";
  }
  else
  {
    if (a3) {
      double v3 = @"HUHourPlural";
    }
    else {
      double v3 = @"HUHourZero";
    }
    double v4 = v3;
    LODWORD(a3) = 1;
  }
  BOOL v5 = _HULocalizedStringWithDefaultValue(v3, v4, a3);

  return v5;
}

- (id)_minutesStringForMinutes:(int64_t)a3
{
  if (a3 == 1)
  {
    double v3 = @"HUMinSingular";
    double v4 = @"HUMinSingular";
  }
  else
  {
    if (a3) {
      double v3 = @"HUMinPlural";
    }
    else {
      double v3 = @"HUMinZero";
    }
    double v4 = v3;
    LODWORD(a3) = 1;
  }
  BOOL v5 = _HULocalizedStringWithDefaultValue(v3, v4, a3);

  return v5;
}

- (id)_secondsStringForSeconds:(int64_t)a3
{
  if (a3 == 1)
  {
    double v3 = @"HUSecSingular";
    double v4 = @"HUSecSingular";
  }
  else
  {
    if (a3) {
      double v3 = @"HUSecPlural";
    }
    else {
      double v3 = @"HUSecZero";
    }
    double v4 = v3;
    LODWORD(a3) = 1;
  }
  BOOL v5 = _HULocalizedStringWithDefaultValue(v3, v4, a3);

  return v5;
}

- (HUTimerIntervalPickerViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUTimerIntervalPickerViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIPickerView)timePicker
{
  return self->_timePicker;
}

- (void)setTimePicker:(id)a3
{
}

- (UILabel)hoursLabel
{
  return self->_hoursLabel;
}

- (void)setHoursLabel:(id)a3
{
}

- (UILabel)minutesLabel
{
  return self->_minutesLabel;
}

- (void)setMinutesLabel:(id)a3
{
}

- (UILabel)secondsLabel
{
  return self->_secondsLabel;
}

- (void)setSecondsLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondsLabel, 0);
  objc_storeStrong((id *)&self->_minutesLabel, 0);
  objc_storeStrong((id *)&self->_hoursLabel, 0);
  objc_storeStrong((id *)&self->_timePicker, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end