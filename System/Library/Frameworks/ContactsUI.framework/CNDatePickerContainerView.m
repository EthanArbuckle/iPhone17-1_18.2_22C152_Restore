@interface CNDatePickerContainerView
- (CNDatePickerContainerView)initWithDatePicker:(id)a3;
- (UIDatePicker)datePicker;
@end

@implementation CNDatePickerContainerView

- (void).cxx_destruct
{
}

- (UIDatePicker)datePicker
{
  return self->_datePicker;
}

- (CNDatePickerContainerView)initWithDatePicker:(id)a3
{
  v30[4] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v29.receiver = self;
  v29.super_class = (Class)CNDatePickerContainerView;
  v6 = -[CNDatePickerContainerView initWithFrame:](&v29, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v7 = v6;
  if (v6)
  {
    p_datePicker = (id *)&v6->_datePicker;
    objc_storeStrong((id *)&v6->_datePicker, a3);
    [*p_datePicker setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CNDatePickerContainerView *)v7 addSubview:*p_datePicker];
    v26 = [*p_datePicker leadingAnchor];
    v27 = [(CNDatePickerContainerView *)v7 layoutMarginsGuide];
    v25 = [v27 leadingAnchor];
    v24 = [v26 constraintEqualToAnchor:v25];
    v30[0] = v24;
    v22 = [*p_datePicker topAnchor];
    v23 = [(CNDatePickerContainerView *)v7 layoutMarginsGuide];
    v21 = [v23 topAnchor];
    v20 = [v22 constraintEqualToAnchor:v21];
    v30[1] = v20;
    v9 = [*p_datePicker trailingAnchor];
    [(CNDatePickerContainerView *)v7 layoutMarginsGuide];
    v10 = id v28 = v5;
    v11 = [v10 trailingAnchor];
    v12 = [v9 constraintEqualToAnchor:v11];
    v30[2] = v12;
    v13 = [*p_datePicker bottomAnchor];
    v14 = [(CNDatePickerContainerView *)v7 layoutMarginsGuide];
    v15 = [v14 bottomAnchor];
    v16 = [v13 constraintEqualToAnchor:v15];
    v30[3] = v16;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:4];

    id v5 = v28;
    [MEMORY[0x1E4F28DC8] activateConstraints:v17];
    v18 = v7;
  }
  return v7;
}

@end