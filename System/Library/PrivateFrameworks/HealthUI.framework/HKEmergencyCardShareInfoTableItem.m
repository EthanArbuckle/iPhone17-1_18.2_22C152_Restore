@interface HKEmergencyCardShareInfoTableItem
- (BOOL)hasPresentableData;
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (UIEdgeInsets)separatorInset;
- (UITableView)tableView;
- (id)_editCell;
- (id)_viewCellForTableView:(id)a3;
- (id)footerTextViewString;
- (id)initInEditMode:(BOOL)a3;
- (id)tableView:(id)a3 cellForRowAtIndex:(int64_t)a4;
- (id)titleForFooter;
- (void)setTableView:(id)a3;
- (void)switchWasChanged:(BOOL)a3;
@end

@implementation HKEmergencyCardShareInfoTableItem

- (id)initInEditMode:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HKEmergencyCardShareInfoTableItem;
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
    v6 = [v5 localizedStringForKey:@"show_share_in_emergency_switch_title" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    v7 = [(HKEmergencyCardTableItem *)self data];
    v8 = -[HKMedicalIDEditorSwitchCell initWithTitle:defaultState:](v4, "initWithTitle:defaultState:", v6, [v7 shareDuringEmergency]);
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
  v8 = [v7 localizedStringForKey:@"show_share_in_emergency_switch_title" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  v9 = [v6 titleLabel];
  [v9 setText:v8];

  v10 = [(HKEmergencyCardTableItem *)self data];
  LODWORD(v7) = [v10 shareDuringEmergency];
  v11 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v12 = v11;
  if (v7) {
    v13 = @"access_enabled";
  }
  else {
    v13 = @"access_disabled";
  }
  v14 = [v11 localizedStringForKey:v13 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  v15 = [v6 detailLabel];
  [v15 setText:v14];

  return v6;
}

- (void)switchWasChanged:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(HKEmergencyCardTableItem *)self data];
  [v5 setShareDuringEmergency:v3];

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

    v6 = [(HKEmergencyCardShareInfoTableItem *)self _editCell];
  }
  else
  {
    v6 = [(HKEmergencyCardShareInfoTableItem *)self _viewCellForTableView:v5];
  }
  return v6;
}

- (id)footerTextViewString
{
  v15[2] = *MEMORY[0x1E4F143B8];
  double v2 = [(HKEmergencyCardShareInfoTableItem *)self titleForFooter];
  id v3 = objc_alloc(MEMORY[0x1E4F28E48]);
  v14[0] = *MEMORY[0x1E4FB0700];
  double v4 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  v15[0] = v4;
  v14[1] = *MEMORY[0x1E4FB06F8];
  id v5 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
  v15[1] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
  v7 = (void *)[v3 initWithString:v2 attributes:v6];

  v8 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v9 = [v8 localizedStringForKey:@"share_in_emergency_learn_more" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  uint64_t v10 = [v2 localizedStandardRangeOfString:v9];
  uint64_t v12 = v11;

  if (v10 != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v7, "addAttribute:value:range:", *MEMORY[0x1E4FB0720], @"x-apple-health://local", v10, v12);
  }

  return v7;
}

- (id)titleForFooter
{
  if ([(HKEmergencyCardTableItem *)self isSecondaryProfile])
  {
    id v3 = NSString;
    double v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    id v5 = [v4 localizedStringForKey:@"show_share_in_emergency_footer_for_tinker_profile_%@" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-tinker"];
    v6 = [(HKEmergencyCardTableItem *)self profileFirstName];
    v7 = objc_msgSend(v3, "stringWithFormat:", v5, v6);

    v8 = NSString;
    v9 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    uint64_t v10 = v9;
  }
  else
  {
    uint64_t v11 = [(HKEmergencyCardTableItem *)self data];
    char v12 = [v11 shareDuringEmergency];

    if (v12)
    {
      int v13 = [MEMORY[0x1E4F2B860] hasPairedWatch];
      v14 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      v15 = v14;
      if (v13) {
        v16 = @"share_in_emergency_apple_watch_enabled_footer";
      }
      else {
        v16 = @"share_in_emergency_enabled_footer";
      }
    }
    else
    {
      v14 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      v15 = v14;
      v16 = @"share_in_emergency_disabled_footer";
    }
    v7 = [v14 localizedStringForKey:v16 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

    v8 = NSString;
    v9 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    uint64_t v10 = v9;
  }
  v17 = [v9 localizedStringForKey:@"%@ %@" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  v18 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v19 = [v18 localizedStringForKey:@"share_in_emergency_learn_more" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  v20 = objc_msgSend(v8, "stringWithFormat:", v17, v7, v19);

  return v20;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  v7 = objc_alloc_init(HKMedicalIDEmergencyAccessLearnMoreTableViewController);
  v8 = [[HKNavigationController alloc] initWithRootViewController:v7];
  v9 = [(HKEmergencyCardTableItem *)self owningViewController];
  [v9 presentViewController:v8 animated:1 completion:0];

  return 0;
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