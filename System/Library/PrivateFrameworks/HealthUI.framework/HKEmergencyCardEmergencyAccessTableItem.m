@interface HKEmergencyCardEmergencyAccessTableItem
- (BOOL)hasPresentableData;
- (BOOL)showsEmergencyAccessState;
- (BOOL)showsShowWhenLockedState;
- (UIEdgeInsets)separatorInset;
- (double)tableView:(id)a3 heightForRowAtIndex:(int64_t)a4;
- (id)initInEditMode:(BOOL)a3 shouldShowLocked:(BOOL)a4 shouldShareInfo:(BOOL)a5;
- (id)tableView:(id)a3 cellForRowAtIndex:(int64_t)a4;
- (id)titleForHeader;
- (void)setIsSecondaryProfile:(BOOL)a3;
- (void)setShowsEmergencyAccessState:(BOOL)a3;
- (void)setShowsShowWhenLockedState:(BOOL)a3;
@end

@implementation HKEmergencyCardEmergencyAccessTableItem

- (id)initInEditMode:(BOOL)a3 shouldShowLocked:(BOOL)a4 shouldShareInfo:(BOOL)a5
{
  int v5 = a5;
  BOOL v7 = a3;
  v27[2] = *MEMORY[0x1E4F143B8];
  v25.receiver = self;
  v25.super_class = (Class)HKEmergencyCardEmergencyAccessTableItem;
  v8 = -[HKEmergencyCardTableItem initInEditMode:](&v25, sel_initInEditMode_);
  v9 = (id *)v8;
  if (!v8) {
    return v9;
  }
  v8[112] = a4;
  v8[113] = v5;
  if (v8[112])
  {
    id v10 = [[HKEmergencyCardEnabledTableItem alloc] initInEditMode:v7];
    id v11 = v9[11];
    v9[11] = v10;

    objc_msgSend(v9[11], "setIsSecondaryProfile:", objc_msgSend(v9, "isSecondaryProfile"));
    id v12 = [[HKEmergencyCardFooterTableItem alloc] initInEditMode:v7];
    id v13 = v9[12];
    v9[12] = v12;

    int v5 = *((unsigned __int8 *)v9 + 113);
  }
  if (v5)
  {
    v14 = [MEMORY[0x1E4F2B860] sharedBehavior];
    if ([v14 supportsEED])
    {

LABEL_8:
      id v17 = [[HKEmergencyCardShareInfoTableItem alloc] initInEditMode:v7];
      id v18 = v9[10];
      v9[10] = v17;

      id v19 = [[HKEmergencyCardFooterTableItem alloc] initInEditMode:v7];
      id v20 = v9[13];
      v9[13] = v19;

      objc_msgSend(v9[10], "setIsSecondaryProfile:", objc_msgSend(v9, "isSecondaryProfile"));
      goto LABEL_9;
    }
    v15 = [v9 data];
    int v16 = [v15 shareDuringEmergency];

    if (v16) {
      goto LABEL_8;
    }
  }
LABEL_9:
  id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v9[11])
  {
    v27[0] = v9[11];
    v27[1] = v9[12];
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
    [v21 addObjectsFromArray:v22];
  }
  if (v9[10])
  {
    v26[0] = v9[10];
    v26[1] = v9[13];
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
    [v21 addObjectsFromArray:v23];
  }
  [v9 setSubitems:v21];

  return v9;
}

- (void)setIsSecondaryProfile:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HKEmergencyCardEmergencyAccessTableItem;
  [(HKEmergencyCardTableItem *)&v4 setIsSecondaryProfile:a3];
  [(HKEmergencyCardTableItem *)self->_enabledTableItem setIsSecondaryProfile:[(HKEmergencyCardTableItem *)self isSecondaryProfile]];
  [(HKEmergencyCardTableItem *)self->_shareInfoTableItem setIsSecondaryProfile:[(HKEmergencyCardTableItem *)self isSecondaryProfile]];
}

- (BOOL)hasPresentableData
{
  return 1;
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
  id v6 = a3;
  switch(a4)
  {
    case 0:
      enabledTableItem = self->_enabledTableItem;
      id v8 = v6;
      uint64_t v9 = 0;
      goto LABEL_6;
    case 1:
      id v10 = [(HKEmergencyCardFooterTableItem *)self->_enabledFooterItem tableView:v6 cellForRowAtIndex:1];
      id v11 = [(HKEmergencyCardEnabledTableItem *)self->_enabledTableItem footerTextViewString];
      [v10 setFooterText:v11];

      break;
    case 2:
      enabledTableItem = self->_shareInfoTableItem;
      id v8 = v6;
      uint64_t v9 = 2;
LABEL_6:
      id v10 = [enabledTableItem tableView:v8 cellForRowAtIndex:v9];
      break;
    case 3:
      id v10 = [(HKEmergencyCardFooterTableItem *)self->_shareInfoFooterItem tableView:v6 cellForRowAtIndex:3];
      id v12 = [(HKEmergencyCardShareInfoTableItem *)self->_shareInfoTableItem footerTextViewString];
      [v10 setFooterText:v12];

      [v10 setTextViewDelegate:self->_shareInfoTableItem];
      break;
    default:
      id v10 = 0;
      break;
  }

  return v10;
}

- (double)tableView:(id)a3 heightForRowAtIndex:(int64_t)a4
{
  return *MEMORY[0x1E4FB2F28];
}

- (id)titleForHeader
{
  double v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  double v3 = [v2 localizedStringForKey:@"emergency_access" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

  return v3;
}

- (BOOL)showsShowWhenLockedState
{
  return self->_showsShowWhenLockedState;
}

- (void)setShowsShowWhenLockedState:(BOOL)a3
{
  self->_showsShowWhenLockedState = a3;
}

- (BOOL)showsEmergencyAccessState
{
  return self->_showsEmergencyAccessState;
}

- (void)setShowsEmergencyAccessState:(BOOL)a3
{
  self->_showsEmergencyAccessState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareInfoFooterItem, 0);
  objc_storeStrong((id *)&self->_enabledFooterItem, 0);
  objc_storeStrong((id *)&self->_enabledTableItem, 0);
  objc_storeStrong((id *)&self->_shareInfoTableItem, 0);
  objc_storeStrong((id *)&self->_lastDequeuedAddContactCell, 0);
}

@end