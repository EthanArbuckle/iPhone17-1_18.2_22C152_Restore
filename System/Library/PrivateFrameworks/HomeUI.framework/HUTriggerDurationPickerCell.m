@interface HUTriggerDurationPickerCell
+ (id)_defaultDurationOptions;
- (HUTriggerDurationPickerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (HUTriggerDurationPickerDelegate)delegate;
- (HUTriggerDurationPickerValue)currentDurationValue;
- (NSArray)durationOptions;
- (NSNumber)currentDuration;
- (UIPickerView)pickerView;
- (id)pickerDurationValue;
- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5;
- (int64_t)numberOfComponentsInPickerView:(id)a3;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (void)_updateDurationOptions;
- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5;
- (void)setCurrentDuration:(id)a3;
- (void)setCurrentDurationValue:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDurationOptions:(id)a3;
@end

@implementation HUTriggerDurationPickerCell

- (HUTriggerDurationPickerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v33.receiver = self;
  v33.super_class = (Class)HUTriggerDurationPickerCell;
  v4 = [(HUTriggerDurationPickerCell *)&v33 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    uint64_t v5 = +[HUTriggerDurationPickerValue valueWithNoDuration];
    currentDurationValue = v4->_currentDurationValue;
    v4->_currentDurationValue = (HUTriggerDurationPickerValue *)v5;

    id v7 = objc_alloc(MEMORY[0x1E4F42C78]);
    uint64_t v8 = objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    pickerView = v4->_pickerView;
    v4->_pickerView = (UIPickerView *)v8;

    v10 = [(HUTriggerDurationPickerCell *)v4 pickerView];
    [v10 setDataSource:v4];

    v11 = [(HUTriggerDurationPickerCell *)v4 pickerView];
    [v11 setDelegate:v4];

    v12 = [(HUTriggerDurationPickerCell *)v4 pickerView];
    [v12 setTranslatesAutoresizingMaskIntoConstraints:0];

    [(HUTriggerDurationPickerCell *)v4 _updateDurationOptions];
    v13 = [(HUTriggerDurationPickerCell *)v4 contentView];
    v14 = [(HUTriggerDurationPickerCell *)v4 pickerView];
    [v13 addSubview:v14];

    v15 = [MEMORY[0x1E4F1CA48] array];
    v16 = [(HUTriggerDurationPickerCell *)v4 pickerView];
    v17 = [v16 topAnchor];
    v18 = [(HUTriggerDurationPickerCell *)v4 contentView];
    v19 = [v18 topAnchor];
    v20 = [v17 constraintEqualToAnchor:v19];
    [v15 addObject:v20];

    v21 = [(HUTriggerDurationPickerCell *)v4 pickerView];
    v22 = [v21 bottomAnchor];
    v23 = [(HUTriggerDurationPickerCell *)v4 contentView];
    v24 = [v23 bottomAnchor];
    v25 = [v22 constraintEqualToAnchor:v24];
    [v15 addObject:v25];

    v26 = [(HUTriggerDurationPickerCell *)v4 pickerView];
    v27 = [v26 centerXAnchor];
    v28 = [(HUTriggerDurationPickerCell *)v4 contentView];
    v29 = [v28 layoutMarginsGuide];
    v30 = [v29 centerXAnchor];
    v31 = [v27 constraintEqualToAnchor:v30];
    [v15 addObject:v31];

    [MEMORY[0x1E4F28DC8] activateConstraints:v15];
  }
  return v4;
}

- (id)pickerDurationValue
{
  v3 = [(HUTriggerDurationPickerCell *)self pickerView];
  uint64_t v4 = [v3 selectedRowInComponent:0];

  if (v4 == -1)
  {
    v6 = +[HUTriggerDurationPickerValue valueWithNoDuration];
  }
  else
  {
    uint64_t v5 = [(HUTriggerDurationPickerCell *)self durationOptions];
    v6 = [v5 objectAtIndexedSubscript:v4];
  }

  return v6;
}

- (NSNumber)currentDuration
{
  v2 = [(HUTriggerDurationPickerCell *)self currentDurationValue];
  v3 = [v2 duration];

  return (NSNumber *)v3;
}

- (void)setCurrentDuration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HUTriggerDurationPickerCell *)self currentDurationValue];
  v6 = [v5 duration];
  id v10 = v4;
  id v7 = v6;
  if (v7 == v10)
  {

    goto LABEL_8;
  }
  if (!v10)
  {

    goto LABEL_7;
  }
  char v8 = [v10 isEqual:v7];

  if ((v8 & 1) == 0)
  {
LABEL_7:
    v9 = [[HUTriggerDurationPickerValue alloc] initWithDuration:v10];
    [(HUTriggerDurationPickerCell *)self setCurrentDurationValue:v9];

    [(HUTriggerDurationPickerCell *)self _updateDurationOptions];
  }
LABEL_8:
}

+ (id)_defaultDurationOptions
{
  if (_MergedGlobals_1_6 != -1) {
    dispatch_once(&_MergedGlobals_1_6, &__block_literal_global_230);
  }
  v2 = (void *)qword_1EBA46950;

  return v2;
}

void __54__HUTriggerDurationPickerCell__defaultDurationOptions__block_invoke()
{
  id v6 = [MEMORY[0x1E4F1CA48] array];
  v0 = +[HUTriggerDurationPickerValue valueWithNoDuration];
  [v6 addObject:v0];

  for (unint64_t i = 1; i < 0xF1; i += v3)
  {
    v2 = +[HUTriggerDurationPickerValue valueWithDuration:(double)(uint64_t)i * 60.0];
    [v6 addObject:v2];

    if (i < 5) {
      uint64_t v3 = 1;
    }
    else {
      uint64_t v3 = 5;
    }
    if (i >= 0x3C) {
      uint64_t v3 = 60;
    }
  }
  uint64_t v4 = [v6 copy];
  uint64_t v5 = (void *)qword_1EBA46950;
  qword_1EBA46950 = v4;
}

- (void)_updateDurationOptions
{
  uint64_t v3 = [(id)objc_opt_class() _defaultDurationOptions];
  uint64_t v4 = (void *)[v3 mutableCopy];
  uint64_t v5 = [(HUTriggerDurationPickerCell *)self currentDurationValue];
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  v13 = __53__HUTriggerDurationPickerCell__updateDurationOptions__block_invoke;
  v14 = &unk_1E638FCC8;
  id v6 = v5;
  id v15 = v6;
  v17 = &v19;
  v18 = &v23;
  id v7 = v4;
  id v16 = v7;
  [v3 enumerateObjectsUsingBlock:&v11];
  if (!*((unsigned char *)v20 + 24))
  {
    objc_msgSend(v7, "addObject:", v6, v11, v12, v13, v14, v15);
    uint64_t v8 = [v7 count] - 1;
    v24[3] = v8;
  }
  -[HUTriggerDurationPickerCell setDurationOptions:](self, "setDurationOptions:", v7, v11, v12, v13, v14);
  v9 = [(HUTriggerDurationPickerCell *)self pickerView];
  [v9 reloadAllComponents];

  id v10 = [(HUTriggerDurationPickerCell *)self pickerView];
  [v10 selectRow:v24[3] inComponent:0 animated:0];

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);
}

void __53__HUTriggerDurationPickerCell__updateDurationOptions__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  uint64_t v8 = [v7 duration];
  v9 = [*(id *)(a1 + 32) duration];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __53__HUTriggerDurationPickerCell__updateDurationOptions__block_invoke_2;
  id v15 = &unk_1E6385480;
  id v16 = *(id *)(a1 + 32);
  id v10 = v7;
  id v17 = v10;
  if (v8) {
    uint64_t v11 = -1;
  }
  else {
    uint64_t v11 = v9 != 0;
  }
  if (v8 && v9) {
    uint64_t v11 = __53__HUTriggerDurationPickerCell__updateDurationOptions__block_invoke_2((uint64_t)&v12);
  }

  if (v11 == -1)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    objc_msgSend(*(id *)(a1 + 40), "insertObject:atIndex:", *(void *)(a1 + 32), a3, v12, v13, v14, v15, v16, v17);
    goto LABEL_11;
  }
  if (!v11)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
LABEL_11:
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a3;
    *a4 = 1;
  }
}

uint64_t __53__HUTriggerDurationPickerCell__updateDurationOptions__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) duration];
  uint64_t v3 = [*(id *)(a1 + 40) duration];
  uint64_t v4 = [v2 compare:v3];

  return v4;
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  uint64_t v4 = [(HUTriggerDurationPickerCell *)self durationOptions];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  id v6 = (void *)MEMORY[0x1E4F2E7A8];
  id v7 = [(HUTriggerDurationPickerCell *)self durationOptions];
  uint64_t v8 = [v7 objectAtIndexedSubscript:a4];
  v9 = [v8 duration];
  id v10 = objc_msgSend(v6, "hf_naturalLanguageTurnOffAfterDuration:style:", v9, 0);

  return v10;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  id v6 = [(HUTriggerDurationPickerCell *)self pickerDurationValue];
  [(HUTriggerDurationPickerCell *)self setCurrentDurationValue:v6];

  id v7 = [(HUTriggerDurationPickerCell *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v10 = [(HUTriggerDurationPickerCell *)self delegate];
    v9 = [(HUTriggerDurationPickerCell *)self currentDuration];
    [v10 durationPicker:self didSelectDuration:v9];
  }
}

- (HUTriggerDurationPickerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUTriggerDurationPickerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIPickerView)pickerView
{
  return self->_pickerView;
}

- (NSArray)durationOptions
{
  return self->_durationOptions;
}

- (void)setDurationOptions:(id)a3
{
}

- (HUTriggerDurationPickerValue)currentDurationValue
{
  return self->_currentDurationValue;
}

- (void)setCurrentDurationValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDurationValue, 0);
  objc_storeStrong((id *)&self->_durationOptions, 0);
  objc_storeStrong((id *)&self->_pickerView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end