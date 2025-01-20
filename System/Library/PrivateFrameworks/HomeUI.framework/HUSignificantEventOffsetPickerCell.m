@interface HUSignificantEventOffsetPickerCell
+ (id)_defaultOffsetDateComponentOptions;
- (HUSignificantEventOffsetPickerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (HUSignificantEventOffsetPickerDelegate)delegate;
- (NSArray)offsetDateComponentOptions;
- (NSDateComponents)currentOffset;
- (NSDateComponents)selectedOffset;
- (NSString)significantEvent;
- (UIPickerView)pickerView;
- (id)_titleForOffsetComponents:(id)a3;
- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5;
- (int64_t)numberOfComponentsInPickerView:(id)a3;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (void)_updateOffsetDateComponentOptions;
- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5;
- (void)setCurrentOffset:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setOffsetDateComponentOptions:(id)a3;
- (void)setSelectedOffset:(id)a3;
- (void)setSignificantEvent:(id)a3;
@end

@implementation HUSignificantEventOffsetPickerCell

- (HUSignificantEventOffsetPickerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v34.receiver = self;
  v34.super_class = (Class)HUSignificantEventOffsetPickerCell;
  v4 = [(HUSignificantEventOffsetPickerCell *)&v34 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)&v4->_significantEvent, (id)*MEMORY[0x1E4F2DF70]);
    uint64_t v6 = objc_opt_new();
    currentOffset = v5->_currentOffset;
    v5->_currentOffset = (NSDateComponents *)v6;

    objc_storeStrong((id *)&v5->_selectedOffset, v5->_currentOffset);
    id v8 = objc_alloc(MEMORY[0x1E4F42C78]);
    uint64_t v9 = objc_msgSend(v8, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    pickerView = v5->_pickerView;
    v5->_pickerView = (UIPickerView *)v9;

    v11 = [(HUSignificantEventOffsetPickerCell *)v5 pickerView];
    [v11 setDataSource:v5];

    v12 = [(HUSignificantEventOffsetPickerCell *)v5 pickerView];
    [v12 setDelegate:v5];

    v13 = [(HUSignificantEventOffsetPickerCell *)v5 pickerView];
    [v13 setTranslatesAutoresizingMaskIntoConstraints:0];

    [(HUSignificantEventOffsetPickerCell *)v5 _updateOffsetDateComponentOptions];
    v14 = [(HUSignificantEventOffsetPickerCell *)v5 contentView];
    v15 = [(HUSignificantEventOffsetPickerCell *)v5 pickerView];
    [v14 addSubview:v15];

    v16 = [MEMORY[0x1E4F1CA48] array];
    v17 = [(HUSignificantEventOffsetPickerCell *)v5 pickerView];
    v18 = [v17 topAnchor];
    v19 = [(HUSignificantEventOffsetPickerCell *)v5 contentView];
    v20 = [v19 topAnchor];
    v21 = [v18 constraintEqualToAnchor:v20];
    [v16 addObject:v21];

    v22 = [(HUSignificantEventOffsetPickerCell *)v5 pickerView];
    v23 = [v22 bottomAnchor];
    v24 = [(HUSignificantEventOffsetPickerCell *)v5 contentView];
    v25 = [v24 bottomAnchor];
    v26 = [v23 constraintEqualToAnchor:v25];
    [v16 addObject:v26];

    v27 = [(HUSignificantEventOffsetPickerCell *)v5 pickerView];
    v28 = [v27 centerXAnchor];
    v29 = [(HUSignificantEventOffsetPickerCell *)v5 contentView];
    v30 = [v29 layoutMarginsGuide];
    v31 = [v30 centerXAnchor];
    v32 = [v28 constraintEqualToAnchor:v31];
    [v16 addObject:v32];

    [MEMORY[0x1E4F28DC8] activateConstraints:v16];
  }
  return v5;
}

- (NSDateComponents)selectedOffset
{
  v3 = [(HUSignificantEventOffsetPickerCell *)self pickerView];
  uint64_t v4 = [v3 selectedRowInComponent:0];

  if (v4 == -1)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  }
  else
  {
    v5 = [(HUSignificantEventOffsetPickerCell *)self offsetDateComponentOptions];
    id v6 = [v5 objectAtIndexedSubscript:v4];
  }

  return (NSDateComponents *)v6;
}

- (void)setCurrentOffset:(id)a3
{
  id v5 = a3;
  currentOffset = self->_currentOffset;
  uint64_t v9 = (NSDateComponents *)v5;
  v7 = currentOffset;
  if (v7 == v9)
  {

    goto LABEL_8;
  }
  if (!v9)
  {

    goto LABEL_7;
  }
  char v8 = [(NSDateComponents *)v9 isEqual:v7];

  if ((v8 & 1) == 0)
  {
LABEL_7:
    objc_storeStrong((id *)&self->_currentOffset, a3);
    [(HUSignificantEventOffsetPickerCell *)self _updateOffsetDateComponentOptions];
  }
LABEL_8:
}

- (void)setSignificantEvent:(id)a3
{
  id v5 = a3;
  significantEvent = self->_significantEvent;
  v10 = (NSString *)v5;
  v7 = significantEvent;
  if (v7 == v10)
  {

    uint64_t v9 = v10;
LABEL_8:

    goto LABEL_9;
  }
  if (!v10)
  {

    goto LABEL_7;
  }
  char v8 = [(NSString *)v10 isEqual:v7];

  if ((v8 & 1) == 0)
  {
LABEL_7:
    objc_storeStrong((id *)&self->_significantEvent, a3);
    uint64_t v9 = [(HUSignificantEventOffsetPickerCell *)self pickerView];
    [v9 reloadAllComponents];
    goto LABEL_8;
  }
LABEL_9:
}

+ (id)_defaultOffsetDateComponentOptions
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __72__HUSignificantEventOffsetPickerCell__defaultOffsetDateComponentOptions__block_invoke_2;
  v4[3] = &unk_1E638D650;
  id v5 = &__block_literal_global_158;
  v2 = __72__HUSignificantEventOffsetPickerCell__defaultOffsetDateComponentOptions__block_invoke_2((uint64_t)v4);

  return v2;
}

id __72__HUSignificantEventOffsetPickerCell__defaultOffsetDateComponentOptions__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v5 setHour:a2];
  [v5 setMinute:a3];

  return v5;
}

id __72__HUSignificantEventOffsetPickerCell__defaultOffsetDateComponentOptions__block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__HUSignificantEventOffsetPickerCell__defaultOffsetDateComponentOptions__block_invoke_3;
  block[3] = &unk_1E6386040;
  id v4 = *(id *)(a1 + 32);
  if (_MergedGlobals_1_3 != -1) {
    dispatch_once(&_MergedGlobals_1_3, block);
  }
  id v1 = (id)qword_1EBA46920;

  return v1;
}

void __72__HUSignificantEventOffsetPickerCell__defaultOffsetDateComponentOptions__block_invoke_3(uint64_t a1)
{
  v19[15] = *MEMORY[0x1E4F143B8];
  v18 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v19[0] = v18;
  v17 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v19[1] = v17;
  v16 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v19[2] = v16;
  v15 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v19[3] = v15;
  v14 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v19[4] = v14;
  v2 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v19[5] = v2;
  v3 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v19[6] = v3;
  id v4 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v19[7] = v4;
  id v5 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v19[8] = v5;
  id v6 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v19[9] = v6;
  v7 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v19[10] = v7;
  char v8 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v19[11] = v8;
  uint64_t v9 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v19[12] = v9;
  v10 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v19[13] = v10;
  v11 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v19[14] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:15];
  v13 = (void *)qword_1EBA46920;
  qword_1EBA46920 = v12;
}

- (void)_updateOffsetDateComponentOptions
{
  id v4 = [(id)objc_opt_class() _defaultOffsetDateComponentOptions];
  id v5 = (void *)[v4 mutableCopy];
  id v6 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:0.0];
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  uint64_t v35 = 0x7FFFFFFFFFFFFFFFLL;
  char v8 = [(HUSignificantEventOffsetPickerCell *)self currentOffset];

  if (!v8)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"HUSignificantEventOffsetPickerCell.m", 120, @"Invalid parameter not satisfying: %@", @"self.currentOffset != nil" object file lineNumber description];
  }
  uint64_t v9 = [(HUSignificantEventOffsetPickerCell *)self currentOffset];
  v10 = [v6 dateByAddingComponents:v9 toDate:v7 options:0];
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __71__HUSignificantEventOffsetPickerCell__updateOffsetDateComponentOptions__block_invoke;
  v20[3] = &unk_1E638D678;
  id v11 = v6;
  id v21 = v11;
  id v12 = v7;
  id v22 = v12;
  id v13 = v10;
  id v23 = v13;
  v26 = &v28;
  v27 = &v32;
  id v14 = v5;
  id v24 = v14;
  id v15 = v9;
  id v25 = v15;
  [v4 enumerateObjectsUsingBlock:v20];
  if (!*((unsigned char *)v29 + 24))
  {
    [v14 addObject:v15];
    uint64_t v16 = [v14 count] - 1;
    v33[3] = v16;
  }
  [(HUSignificantEventOffsetPickerCell *)self setOffsetDateComponentOptions:v14];
  v17 = [(HUSignificantEventOffsetPickerCell *)self pickerView];
  [v17 reloadAllComponents];

  v18 = [(HUSignificantEventOffsetPickerCell *)self pickerView];
  [v18 selectRow:v33[3] inComponent:0 animated:0];

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);
}

void __71__HUSignificantEventOffsetPickerCell__updateOffsetDateComponentOptions__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  id v8 = [*(id *)(a1 + 32) dateByAddingComponents:a2 toDate:*(void *)(a1 + 40) options:0];
  uint64_t v7 = objc_msgSend(*(id *)(a1 + 48), "compare:");
  if (v7 == -1)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
    [*(id *)(a1 + 56) insertObject:*(void *)(a1 + 64) atIndex:a3];
  }
  else
  {
    if (v7) {
      goto LABEL_6;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
  }
  *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = a3;
  *a4 = 1;
LABEL_6:
}

- (id)_titleForOffsetComponents:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F2EB98];
  id v5 = a3;
  id v6 = [(HUSignificantEventOffsetPickerCell *)self significantEvent];
  uint64_t v7 = objc_msgSend(v4, "hf_localizedStringForSignficantEvent:offset:", v6, v5);

  return v7;
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  id v4 = [(HUSignificantEventOffsetPickerCell *)self offsetDateComponentOptions];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  uint64_t v7 = [(HUSignificantEventOffsetPickerCell *)self offsetDateComponentOptions];
  id v8 = [v7 objectAtIndexedSubscript:a4];
  uint64_t v9 = [(HUSignificantEventOffsetPickerCell *)self _titleForOffsetComponents:v8];

  return v9;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  id v6 = [(HUSignificantEventOffsetPickerCell *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v9 = [(HUSignificantEventOffsetPickerCell *)self delegate];
    id v8 = [(HUSignificantEventOffsetPickerCell *)self selectedOffset];
    [v9 significantEventOffsetPicker:self didSelectOffset:v8];
  }
}

- (NSString)significantEvent
{
  return self->_significantEvent;
}

- (NSDateComponents)currentOffset
{
  return self->_currentOffset;
}

- (HUSignificantEventOffsetPickerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUSignificantEventOffsetPickerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setSelectedOffset:(id)a3
{
}

- (UIPickerView)pickerView
{
  return self->_pickerView;
}

- (NSArray)offsetDateComponentOptions
{
  return self->_offsetDateComponentOptions;
}

- (void)setOffsetDateComponentOptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offsetDateComponentOptions, 0);
  objc_storeStrong((id *)&self->_pickerView, 0);
  objc_storeStrong((id *)&self->_selectedOffset, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentOffset, 0);

  objc_storeStrong((id *)&self->_significantEvent, 0);
}

@end