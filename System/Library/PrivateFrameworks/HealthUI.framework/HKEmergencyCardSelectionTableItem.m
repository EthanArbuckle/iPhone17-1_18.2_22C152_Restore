@interface HKEmergencyCardSelectionTableItem
- (BOOL)hasPresentableData;
- (BOOL)shouldHighlightRowAtIndex:(int64_t)a3;
- (HKEmergencyCardSelectionTableItemDelegate)selectionDelegate;
- (id)tableView:(id)a3 cellForRowAtIndex:(int64_t)a4;
- (id)title;
- (void)setSelectionDelegate:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndex:(int64_t)a4;
@end

@implementation HKEmergencyCardSelectionTableItem

- (BOOL)hasPresentableData
{
  return 1;
}

- (id)title
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v3 = [v2 localizedStringForKey:@"edit_medical_id_row" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

  return v3;
}

- (id)tableView:(id)a3 cellForRowAtIndex:(int64_t)a4
{
  if (!self->_cell)
  {
    v5 = (UITableViewCell *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:0];
    cell = self->_cell;
    self->_cell = v5;
  }
  v7 = [(HKEmergencyCardSelectionTableItem *)self title];
  v8 = [(UITableViewCell *)self->_cell textLabel];
  [v8 setText:v7];

  v9 = HKHealthKeyColor();
  v10 = [(UITableViewCell *)self->_cell textLabel];
  [v10 setTextColor:v9];

  v11 = objc_alloc_init(_HKCustomInsetCellLayoutManager);
  [(UITableViewCell *)self->_cell setLayoutManager:v11];
  v12 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredFontForTextStyle:", *MEMORY[0x1E4FB28C8]);
  v13 = [(UITableViewCell *)self->_cell textLabel];
  [v13 setFont:v12];

  v14 = self->_cell;
  return v14;
}

- (BOOL)shouldHighlightRowAtIndex:(int64_t)a3
{
  return 1;
}

- (void)tableView:(id)a3 didSelectRowAtIndex:(int64_t)a4
{
  id v5 = a3;
  v6 = [v5 indexPathForSelectedRow];
  [v5 deselectRowAtIndexPath:v6 animated:1];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectionDelegate);
  [WeakRetained selectionTableItemDidTap:self];
}

- (HKEmergencyCardSelectionTableItemDelegate)selectionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectionDelegate);
  return (HKEmergencyCardSelectionTableItemDelegate *)WeakRetained;
}

- (void)setSelectionDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_selectionDelegate);
  objc_storeStrong((id *)&self->_cell, 0);
}

@end