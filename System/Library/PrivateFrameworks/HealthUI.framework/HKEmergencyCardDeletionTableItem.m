@interface HKEmergencyCardDeletionTableItem
- (BOOL)shouldHighlightRowAtIndex:(int64_t)a3;
- (HKEmergencyCardDeletionDelegate)deletionDelegate;
- (UIEdgeInsets)separatorInset;
- (id)initInEditMode:(BOOL)a3;
- (id)tableView:(id)a3 cellForRowAtIndex:(int64_t)a4;
- (id)title;
- (void)setDeletionDelegate:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndex:(int64_t)a4;
@end

@implementation HKEmergencyCardDeletionTableItem

- (id)initInEditMode:(BOOL)a3
{
  BOOL v3 = a3;
  if (!a3)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"HKEmergencyCardDeletionTableItem.m" lineNumber:26 description:@"HKEmergencyCardDeletionTableItem only supports edit mode"];
  }
  v8.receiver = self;
  v8.super_class = (Class)HKEmergencyCardDeletionTableItem;
  return [(HKEmergencyCardTableItem *)&v8 initInEditMode:v3];
}

- (id)title
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  BOOL v3 = [v2 localizedStringForKey:@"delete_medical_id" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

  return v3;
}

- (UIEdgeInsets)separatorInset
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndex:(int64_t)a4
{
  if (!self->_cell)
  {
    double v5 = (UITableViewCell *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:0];
    cell = self->_cell;
    self->_cell = v5;
  }
  v7 = [(HKEmergencyCardDeletionTableItem *)self title];
  objc_super v8 = [(UITableViewCell *)self->_cell textLabel];
  [v8 setText:v7];

  v9 = [MEMORY[0x1E4FB1618] systemRedColor];
  v10 = [(UITableViewCell *)self->_cell textLabel];
  [v10 setTextColor:v9];

  v11 = [(UITableViewCell *)self->_cell textLabel];
  [v11 setTextAlignment:1];

  v12 = objc_alloc_init(_HKCustomInsetCellLayoutManager);
  [(UITableViewCell *)self->_cell setLayoutManager:v12];
  v13 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredFontForTextStyle:", *MEMORY[0x1E4FB28C8]);
  v14 = [(UITableViewCell *)self->_cell textLabel];
  [v14 setFont:v13];

  v15 = self->_cell;
  return v15;
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

  v7 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:0 preferredStyle:0];
  objc_super v8 = [v7 view];
  v9 = [MEMORY[0x1E4FB1618] systemBlueColor];
  [v8 setTintColor:v9];

  v10 = (void *)MEMORY[0x1E4FB1410];
  v11 = [(HKEmergencyCardDeletionTableItem *)self title];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __66__HKEmergencyCardDeletionTableItem_tableView_didSelectRowAtIndex___block_invoke;
  v18[3] = &unk_1E6D51928;
  v18[4] = self;
  v12 = [v10 actionWithTitle:v11 style:2 handler:v18];

  [v7 addAction:v12];
  v13 = (void *)MEMORY[0x1E4FB1410];
  v14 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v15 = [v14 localizedStringForKey:@"cancel_delete_medical_id" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  v16 = [v13 actionWithTitle:v15 style:1 handler:0];

  [v7 addAction:v16];
  v17 = [(HKEmergencyCardTableItem *)self owningViewController];
  [v17 presentViewController:v7 animated:1 completion:0];
}

void __66__HKEmergencyCardDeletionTableItem_tableView_didSelectRowAtIndex___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  [WeakRetained deletionTableItemDidTapDelete:*(void *)(a1 + 32)];
}

- (HKEmergencyCardDeletionDelegate)deletionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_deletionDelegate);
  return (HKEmergencyCardDeletionDelegate *)WeakRetained;
}

- (void)setDeletionDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_deletionDelegate);
  objc_storeStrong((id *)&self->_cell, 0);
}

@end