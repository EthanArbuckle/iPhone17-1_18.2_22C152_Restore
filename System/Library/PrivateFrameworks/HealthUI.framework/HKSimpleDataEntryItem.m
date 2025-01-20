@interface HKSimpleDataEntryItem
- (HKSimpleDataEntryItemDelegate)delegate;
- (HKSimpleDataEntryItemToolbarDelegate)toolbarDelegate;
- (NSString)accessibilityIdentifier;
- (id)accessoryToolbar;
- (id)cell;
- (id)formattedKeyAndValue;
- (unint64_t)placeholderType;
- (void)beginEditing;
- (void)setAccessibilityIdentifier:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPlaceholderType:(unint64_t)a3;
- (void)setToolbarDelegate:(id)a3;
- (void)toolbarDoneButtonPressed:(id)a3;
- (void)toolbarNextButtonPressed:(id)a3;
- (void)toolbarPrevButtonPressed:(id)a3;
- (void)updateCellDisplay;
@end

@implementation HKSimpleDataEntryItem

- (void)beginEditing
{
  id v2 = [(HKSimpleDataEntryItem *)self cell];
  [v2 beginEditing];
}

- (id)accessoryToolbar
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1DF0]);
  [v3 setAutoresizingMask:18];
  v4 = [(HKSimpleDataEntryItem *)self toolbarDelegate];
  char v5 = objc_opt_respondsToSelector();

  v6 = [(HKSimpleDataEntryItem *)self toolbarDelegate];
  char v7 = objc_opt_respondsToSelector();

  v8 = [(HKSimpleDataEntryItem *)self toolbarDelegate];
  char v9 = objc_opt_respondsToSelector();

  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v5)
  {
    v11 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:103 target:self action:sel_toolbarPrevButtonPressed_];
    v12 = HKHealthTintColor();
    [v11 setTintColor:v12];

    [v10 addObject:v11];
    if ((v7 & 1) == 0) {
      goto LABEL_6;
    }
    v13 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:6 target:0 action:0];
    [v13 setWidth:1.0];
    [v10 addObject:v13];
  }
  else if ((v7 & 1) == 0)
  {
    goto LABEL_6;
  }
  v14 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:104 target:self action:sel_toolbarNextButtonPressed_];
  v15 = HKHealthTintColor();
  [v14 setTintColor:v15];

  [v10 addObject:v14];
LABEL_6:
  if (v9)
  {
    v16 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:5 target:0 action:0];
    v17 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel_toolbarDoneButtonPressed_];
    v18 = HKHealthTintColor();
    [v17 setTintColor:v18];

    v21[0] = v16;
    v21[1] = v17;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
    [v10 addObjectsFromArray:v19];
  }
  [v3 setItems:v10];

  return v3;
}

- (void)toolbarPrevButtonPressed:(id)a3
{
  v4 = [(HKSimpleDataEntryItem *)self toolbarDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(HKSimpleDataEntryItem *)self toolbarDelegate];
    [v6 dataEntryItemPrevPressed:self];
  }
}

- (void)toolbarNextButtonPressed:(id)a3
{
  v4 = [(HKSimpleDataEntryItem *)self toolbarDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(HKSimpleDataEntryItem *)self toolbarDelegate];
    [v6 dataEntryItemNextPressed:self];
  }
}

- (void)toolbarDoneButtonPressed:(id)a3
{
  v4 = [(HKSimpleDataEntryItem *)self toolbarDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(HKSimpleDataEntryItem *)self toolbarDelegate];
    [v6 dataEntryItemDonePressed:self];
  }
}

- (HKSimpleDataEntryItemDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HKSimpleDataEntryItemDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HKSimpleDataEntryItemToolbarDelegate)toolbarDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_toolbarDelegate);
  return (HKSimpleDataEntryItemToolbarDelegate *)WeakRetained;
}

- (void)setToolbarDelegate:(id)a3
{
}

- (unint64_t)placeholderType
{
  return self->_placeholderType;
}

- (void)setPlaceholderType:(unint64_t)a3
{
  self->_placeholderType = a3;
}

- (NSString)accessibilityIdentifier
{
  return self->_accessibilityIdentifier;
}

- (void)setAccessibilityIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityIdentifier, 0);
  objc_destroyWeak((id *)&self->_toolbarDelegate);
  objc_destroyWeak((id *)&self->_delegate);
}

- (id)formattedKeyAndValue
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (id)cell
{
  return 0;
}

- (void)updateCellDisplay
{
  objc_opt_class();
  NSRequestConcreteImplementation();
}

@end