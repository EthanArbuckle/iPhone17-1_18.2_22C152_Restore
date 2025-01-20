@interface HKDataMetadataDeletionSection
- (BOOL)isEnabled;
- (HKDataMetadataDeletionSection)init;
- (HKDataMetadataDeletionSection)initWithTitle:(id)a3;
- (HKDataMetadataDeletionSectionDelegate)delegate;
- (NSString)title;
- (UITableViewCell)cell;
- (id)cellForIndex:(unint64_t)a3 tableView:(id)a4;
- (unint64_t)numberOfRowsInSection;
- (void)_updateCellForEnabledState;
- (void)selectCellForIndex:(unint64_t)a3 navigationController:(id)a4 animated:(BOOL)a5;
- (void)setCell:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setTitle:(id)a3;
@end

@implementation HKDataMetadataDeletionSection

- (HKDataMetadataDeletionSection)init
{
  v3 = HKHealthKitFrameworkBundle();
  v4 = [v3 localizedStringForKey:@"DELETE_SAMPLE" value:&stru_1F3B9CF20 table:*MEMORY[0x1E4F29E58]];
  v5 = [(HKDataMetadataDeletionSection *)self initWithTitle:v4];

  return v5;
}

- (HKDataMetadataDeletionSection)initWithTitle:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKDataMetadataDeletionSection;
  v6 = [(HKDataMetadataDeletionSection *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_title, a3);
    v7->_enabled = 1;
  }

  return v7;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
  [(HKDataMetadataDeletionSection *)self _updateCellForEnabledState];
}

- (void)_updateCellForEnabledState
{
  if ([(HKDataMetadataDeletionSection *)self isEnabled]) {
    objc_msgSend(MEMORY[0x1E4FB1618], "hk_appErrorColor");
  }
  else {
    objc_msgSend(MEMORY[0x1E4FB1618], "hk_appInteractionDisabledColor");
  }
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = [(HKDataMetadataDeletionSection *)self cell];
  v4 = [v3 textLabel];
  [v4 setTextColor:v5];
}

- (unint64_t)numberOfRowsInSection
{
  return 1;
}

- (id)cellForIndex:(unint64_t)a3 tableView:(id)a4
{
  id v5 = [a4 dequeueReusableCellWithIdentifier:@"HKDataMetadataDeletionSectionCell"];
  if (!v5) {
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:@"HKDataMetadataDeletionSectionCell"];
  }
  v6 = [v5 textLabel];
  [v6 setTextAlignment:1];

  v7 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  v8 = [v5 textLabel];
  [v8 setFont:v7];

  objc_super v9 = [v5 textLabel];
  [v9 setAdjustsFontForContentSizeCategory:1];

  v10 = [(HKDataMetadataDeletionSection *)self title];
  v11 = [v5 textLabel];
  [v11 setText:v10];

  [(HKDataMetadataDeletionSection *)self setCell:v5];
  v12 = [(HKDataMetadataDeletionSection *)self delegate];
  v13 = [v12 accessibilityIdentifier];
  v14 = [(HKDataMetadataDeletionSection *)self cell];
  [v14 setAccessibilityIdentifier:v13];

  [(HKDataMetadataDeletionSection *)self _updateCellForEnabledState];
  return v5;
}

- (void)selectCellForIndex:(unint64_t)a3 navigationController:(id)a4 animated:(BOOL)a5
{
  if ([(HKDataMetadataDeletionSection *)self isEnabled])
  {
    id v6 = [(HKDataMetadataDeletionSection *)self delegate];
    [v6 deletionSectionDidSelectRow:self];
  }
}

- (HKDataMetadataDeletionSectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HKDataMetadataDeletionSectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (UITableViewCell)cell
{
  return self->_cell;
}

- (void)setCell:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_cell, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end