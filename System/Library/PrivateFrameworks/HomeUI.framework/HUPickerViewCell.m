@interface HUPickerViewCell
- (BOOL)_canSelectValueAtIndex:(int64_t)a3;
- (HFItem)item;
- (HUPickerCellDelegate)delegate;
- (HUPickerViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSIndexPath)selectedIndexPath;
- (UIPickerView)pickerView;
- (id)pickerView:(id)a3 attributedTitleForRow:(int64_t)a4 forComponent:(int64_t)a5;
- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5;
- (int64_t)numberOfComponentsInPickerView:(id)a3;
- (int64_t)numberOfValues;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5;
- (void)prepareForReuse;
- (void)reloadPickerView;
- (void)setDelegate:(id)a3;
- (void)setItem:(id)a3;
- (void)setNumberOfValues:(int64_t)a3;
- (void)setPickerView:(id)a3;
- (void)setSelectedIndex:(int64_t)a3 animated:(BOOL)a4;
@end

@implementation HUPickerViewCell

- (HUPickerViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v32.receiver = self;
  v32.super_class = (Class)HUPickerViewCell;
  v4 = [(HUPickerViewCell *)&v32 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F42C78]);
    [(HUPickerViewCell *)v4 setPickerView:v5];

    v6 = [(HUPickerViewCell *)v4 pickerView];
    [v6 setDelegate:v4];

    v7 = [(HUPickerViewCell *)v4 pickerView];
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

    v8 = [(HUPickerViewCell *)v4 contentView];
    v9 = [(HUPickerViewCell *)v4 pickerView];
    [v8 addSubview:v9];

    v10 = [MEMORY[0x1E4F1CA48] array];
    v11 = [(HUPickerViewCell *)v4 pickerView];
    v12 = [v11 topAnchor];
    v13 = [(HUPickerViewCell *)v4 contentView];
    v14 = [v13 topAnchor];
    v15 = [v12 constraintEqualToAnchor:v14];
    [v10 addObject:v15];

    v16 = [(HUPickerViewCell *)v4 pickerView];
    v17 = [v16 bottomAnchor];
    v18 = [(HUPickerViewCell *)v4 contentView];
    v19 = [v18 bottomAnchor];
    v20 = [v17 constraintEqualToAnchor:v19];
    [v10 addObject:v20];

    v21 = [(HUPickerViewCell *)v4 pickerView];
    v22 = [v21 leadingAnchor];
    v23 = [(HUPickerViewCell *)v4 contentView];
    v24 = [v23 leadingAnchor];
    v25 = [v22 constraintEqualToAnchor:v24];
    [v10 addObject:v25];

    v26 = [(HUPickerViewCell *)v4 pickerView];
    v27 = [v26 trailingAnchor];
    v28 = [(HUPickerViewCell *)v4 contentView];
    v29 = [v28 trailingAnchor];
    v30 = [v27 constraintEqualToAnchor:v29];
    [v10 addObject:v30];

    [MEMORY[0x1E4F28DC8] activateConstraints:v10];
  }
  return v4;
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)HUPickerViewCell;
  [(HUPickerViewCell *)&v4 prepareForReuse];
  selectedIndexPath = self->_selectedIndexPath;
  self->_selectedIndexPath = 0;
}

- (void)reloadPickerView
{
  id v2 = [(HUPickerViewCell *)self pickerView];
  [v2 reloadAllComponents];
}

- (void)setSelectedIndex:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = [MEMORY[0x1E4F28D58] indexPathForRow:a3 inSection:0];
  selectedIndexPath = self->_selectedIndexPath;
  self->_selectedIndexPath = v7;

  v9 = [(HUPickerViewCell *)self pickerView];
  [v9 selectRow:a3 inComponent:0 animated:v4];

  id v10 = [(HUPickerViewCell *)self delegate];
  [v10 pickerViewCell:self didSelectValueAtIndex:a3];
}

- (BOOL)_canSelectValueAtIndex:(int64_t)a3
{
  id v5 = [(HUPickerViewCell *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0) {
    return (a3 & 0x8000000000000000) == 0 && self->_numberOfValues > a3;
  }
  v7 = [(HUPickerViewCell *)self delegate];
  char v8 = [v7 pickerViewCell:self canSelectValueAtIndex:a3];

  return v8;
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  id v5 = [(HUPickerViewCell *)self delegate];
  self->_numberOfValues = [v5 numberOfValuesForPickerViewCell:self];

  return self->_numberOfValues;
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  v7 = [(HUPickerViewCell *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    v9 = [(HUPickerViewCell *)self delegate];
    id v10 = [v9 pickerViewCell:self titleForValueAtIndex:a4];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)pickerView:(id)a3 attributedTitleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  v7 = [(HUPickerViewCell *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    v9 = [(HUPickerViewCell *)self delegate];
    id v10 = [v9 pickerViewCell:self attributedTitleForValueAtIndex:a4];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  if (![(HUPickerViewCell *)self _canSelectValueAtIndex:a4])
  {
    int64_t v8 = [(NSIndexPath *)self->_selectedIndexPath row];
    if ((a4 & 0x8000000000000000) == 0)
    {
      if (v8 > a4) {
        uint64_t v9 = 1;
      }
      else {
        uint64_t v9 = -1;
      }
      int64_t v10 = a4;
      while (v10 < self->_numberOfValues)
      {
        if ([(HUPickerViewCell *)self _canSelectValueAtIndex:v10])
        {
          v13 = [(HUPickerViewCell *)self pickerView];
          [v13 selectRow:v10 inComponent:0 animated:1];

          goto LABEL_11;
        }
        v10 += v9;
        if (v10 < 0) {
          break;
        }
      }
    }
  }
  int64_t v10 = a4;
LABEL_11:
  v11 = [MEMORY[0x1E4F28D58] indexPathForRow:v10 inSection:a5];
  selectedIndexPath = self->_selectedIndexPath;
  self->_selectedIndexPath = v11;

  id v14 = [(HUPickerViewCell *)self delegate];
  [v14 pickerViewCell:self didSelectValueAtIndex:v10];
}

- (HFItem)item
{
  return self->item;
}

- (void)setItem:(id)a3
{
}

- (NSIndexPath)selectedIndexPath
{
  return self->_selectedIndexPath;
}

- (HUPickerCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUPickerCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIPickerView)pickerView
{
  return self->_pickerView;
}

- (void)setPickerView:(id)a3
{
}

- (int64_t)numberOfValues
{
  return self->_numberOfValues;
}

- (void)setNumberOfValues:(int64_t)a3
{
  self->_numberOfValues = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pickerView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectedIndexPath, 0);

  objc_storeStrong((id *)&self->item, 0);
}

@end