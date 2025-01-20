@interface HKEmergencyCardEnabledTableItem
- (BOOL)hasPresentableData;
- (UIEdgeInsets)separatorInset;
- (UITableView)tableView;
- (id)_editCell;
- (id)_viewCellForTableView:(id)a3;
- (id)footerTextViewString;
- (id)initInEditMode:(BOOL)a3;
- (id)tableView:(id)a3 cellForRowAtIndex:(int64_t)a4;
- (id)titleForFooter;
- (id)titleForHeader;
- (void)setTableView:(id)a3;
- (void)switchWasChanged:(BOOL)a3;
@end

@implementation HKEmergencyCardEnabledTableItem

- (id)initInEditMode:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HKEmergencyCardEnabledTableItem;
  return [(HKEmergencyCardTableItem *)&v4 initInEditMode:a3];
}

- (BOOL)hasPresentableData
{
  return 1;
}

- (id)_editCell
{
  cell = self->_cell;
  if (!cell)
  {
    objc_super v4 = [HKMedicalIDEditorSwitchCell alloc];
    v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v6 = [v5 localizedStringForKey:@"show_medical_id_switch_title" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    v7 = [(HKEmergencyCardTableItem *)self data];
    v8 = -[HKMedicalIDEditorSwitchCell initWithTitle:defaultState:](v4, "initWithTitle:defaultState:", v6, [v7 isDisabled] ^ 1);
    v9 = self->_cell;
    self->_cell = v8;

    [(HKMedicalIDEditorSwitchCell *)self->_cell setDelegate:self];
    cell = self->_cell;
  }
  return cell;
}

- (id)_viewCellForTableView:(id)a3
{
  id v4 = a3;
  v5 = +[_HKMedicalIDMultilineStringCell defaultReuseIdentifier];
  v6 = [v4 dequeueReusableCellWithIdentifier:v5];

  v7 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v8 = [v7 localizedStringForKey:@"show_medical_id_switch_title" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  v9 = [v6 titleLabel];
  [v9 setText:v8];

  v10 = [(HKEmergencyCardTableItem *)self data];
  LODWORD(v7) = [v10 isDisabled];
  v11 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v12 = v11;
  if (v7) {
    v13 = @"access_disabled";
  }
  else {
    v13 = @"access_enabled";
  }
  v14 = [v11 localizedStringForKey:v13 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  v15 = [v6 detailLabel];
  [v15 setText:v14];

  return v6;
}

- (void)switchWasChanged:(BOOL)a3
{
  BOOL v4 = !a3;
  v5 = [(HKEmergencyCardTableItem *)self data];
  [v5 setIsDisabled:v4];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);
  [WeakRetained reloadData];
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
  id v5 = a3;
  if ([(HKEmergencyCardTableItem *)self isInEditMode])
  {
    objc_storeWeak((id *)&self->_tableView, v5);

    v6 = [(HKEmergencyCardEnabledTableItem *)self _editCell];
  }
  else
  {
    v6 = [(HKEmergencyCardEnabledTableItem *)self _viewCellForTableView:v5];
  }
  return v6;
}

- (id)titleForHeader
{
  double v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  double v3 = [v2 localizedStringForKey:@"show_medical_id_switch_title_header" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

  return v3;
}

- (id)footerTextViewString
{
  v10[2] = *MEMORY[0x1E4F143B8];
  double v2 = [(HKEmergencyCardEnabledTableItem *)self titleForFooter];
  id v3 = objc_alloc(MEMORY[0x1E4F28E48]);
  v9[0] = *MEMORY[0x1E4FB0700];
  double v4 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  v10[0] = v4;
  v9[1] = *MEMORY[0x1E4FB06F8];
  id v5 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
  v10[1] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  v7 = (void *)[v3 initWithString:v2 attributes:v6];

  return v7;
}

- (id)titleForFooter
{
  if ([(HKEmergencyCardTableItem *)self isInEditMode] && _os_feature_enabled_impl())
  {
    id v3 = [(HKEmergencyCardTableItem *)self data];
    char v4 = [v3 isDisabled];

    id v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    if (v4) {
      v6 = @"show_locked_disabled_footer";
    }
    else {
      v6 = @"show_locked_enabled_footer";
    }
  }
  else
  {
    if ([(HKEmergencyCardTableItem *)self isSecondaryProfile])
    {
      v7 = NSString;
      id v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      v8 = [v5 localizedStringForKey:@"show_medical_id_detail_for_tinker_profile_%@" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-tinker"];
      v9 = [(HKEmergencyCardTableItem *)self profileFirstName];
      v10 = objc_msgSend(v7, "stringWithFormat:", v8, v9);

      goto LABEL_12;
    }
    int v11 = [MEMORY[0x1E4F2B860] hasPairedWatch];
    id v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    if (v11) {
      v6 = @"show_medical_id_detail_with_watch";
    }
    else {
      v6 = @"show_medical_id_detail";
    }
  }
  v10 = [v5 localizedStringForKey:v6 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
LABEL_12:

  return v10;
}

- (UITableView)tableView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);
  return (UITableView *)WeakRetained;
}

- (void)setTableView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tableView);
  objc_storeStrong((id *)&self->_cell, 0);
}

@end