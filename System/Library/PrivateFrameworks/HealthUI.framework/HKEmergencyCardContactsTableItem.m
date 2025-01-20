@interface HKEmergencyCardContactsTableItem
- (BOOL)hasPresentableData;
- (BOOL)refreshFromData:(BOOL)a3;
- (BOOL)shouldHighlightRowAtIndex:(int64_t)a3;
- (HKEmergencyCardContactUpdateDelegate)delegate;
- (double)tableView:(id)a3 heightForRowAtIndex:(int64_t)a4;
- (id)_dequeueAndConfigureContactEditCellForIndex:(int64_t)a3 inTableView:(id)a4;
- (id)_dequeueAndConfigureContactViewCellForIndex:(int64_t)a3 inTableView:(id)a4;
- (id)_footerAttributedText;
- (id)_footerAttributedTextForPrimaryProfile;
- (id)_footerAttributedTextForSecondaryProfile;
- (id)_footerTextForSecondaryProfile;
- (id)_footerTextWithGivenName:(id)a3;
- (id)initInEditMode:(BOOL)a3;
- (id)tableView:(id)a3 cellForRowAtIndex:(int64_t)a4;
- (id)title;
- (id)titleForFooter;
- (id)titleForHeader;
- (int64_t)commitEditingStyle:(int64_t)a3 forRowAtIndex:(int64_t)a4;
- (int64_t)contactIndexForRowIndex:(int64_t)a3;
- (int64_t)editingStyleForRowAtIndex:(int64_t)a3;
- (int64_t)itemTypeForRowIndex:(int64_t)a3;
- (int64_t)numberOfRows;
- (void)_addEmergencyContactToData:(id)a3;
- (void)_presentEmergencyContactPickerIfPossible;
- (void)_setupContactPickingFlow;
- (void)callEmergencyContact:(id)a3;
- (void)emergencyContactFlow:(id)a3 didSelectContact:(id)a4;
- (void)emergencyContactFlowDidCancel:(id)a3;
- (void)emergencyContactRelationshipPicker:(id)a3 didChooseRelationshipNamed:(id)a4;
- (void)emergencyContactRelationshipPickerDidCancel:(id)a3;
- (void)medicalIDEditorCellDidTapLabel:(id)a3;
- (void)setDelegate:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndex:(int64_t)a4;
@end

@implementation HKEmergencyCardContactsTableItem

- (id)initInEditMode:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HKEmergencyCardContactsTableItem;
  return [(HKEmergencyCardTableItem *)&v4 initInEditMode:a3];
}

- (BOOL)hasPresentableData
{
  v3 = [(HKEmergencyCardTableItem *)self data];
  objc_super v4 = [v3 emergencyContacts];
  if ([v4 count]) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = [(HKEmergencyCardTableItem *)self shouldShowHints];
  }

  return v5;
}

- (int64_t)itemTypeForRowIndex:(int64_t)a3
{
  BOOL v5 = [(HKEmergencyCardTableItem *)self isInEditMode];
  v6 = [(HKEmergencyCardTableItem *)self data];
  v7 = [v6 emergencyContacts];
  uint64_t v8 = [v7 count];
  uint64_t v9 = v8;
  if (v5)
  {

    BOOL v10 = v9 == a3;
    int64_t v11 = 3;
    goto LABEL_10;
  }
  if (v8)
  {

LABEL_9:
    v14 = [(HKEmergencyCardTableItem *)self data];
    v15 = [v14 emergencyContacts];
    uint64_t v16 = [v15 count];

    BOOL v10 = v16 == a3;
    int64_t v11 = 1;
LABEL_10:
    if (v10) {
      return v11 + 1;
    }
    else {
      return v11;
    }
  }
  BOOL v12 = [(HKEmergencyCardTableItem *)self shouldShowHints];

  if (!v12) {
    goto LABEL_9;
  }
  if (a3) {
    return 2;
  }
  else {
    return 5;
  }
}

- (int64_t)contactIndexForRowIndex:(int64_t)a3
{
  return a3;
}

- (void)callEmergencyContact:(id)a3
{
  id v3 = [a3 phoneNumber];
  +[HKMedicalIDTelephoneUtilities callEmergencyContact:v3];
}

- (int64_t)numberOfRows
{
  id v3 = [(HKEmergencyCardTableItem *)self data];
  objc_super v4 = [v3 emergencyContacts];
  uint64_t v5 = [v4 count];

  int64_t v6 = v5 + [(HKEmergencyCardTableItem *)self isInEditMode];
  if (![(HKEmergencyCardTableItem *)self isInEditMode]
    && [(HKEmergencyCardTableItem *)self shouldShowHints]
    && v6 == 0)
  {
    int64_t v6 = 1;
  }
  if (![(HKEmergencyCardTableItem *)self isInEditMode])
  {
    BOOL v7 = [(HKEmergencyCardTableItem *)self shouldShowHints];
    uint64_t v8 = v6 > 0 || v7;
    v6 += v8;
  }
  return v6;
}

- (BOOL)refreshFromData:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(HKEmergencyCardTableItem *)self isInEditMode]) {
    uint64_t v5 = [(HKEmergencyCardTableItem *)self isSecondaryProfile] & v3;
  }
  else {
    uint64_t v5 = 0;
  }
  int64_t v6 = [(HKEmergencyCardTableItem *)self data];
  char v7 = [v6 updateEmergencyContactsAutopopulateForSecondaryProfileIfEmpty:v5];

  return v7;
}

- (id)_dequeueAndConfigureContactViewCellForIndex:(int64_t)a3 inTableView:(id)a4
{
  id v6 = a4;
  int64_t v7 = [(HKEmergencyCardContactsTableItem *)self itemTypeForRowIndex:a3];
  if (v7 == 5)
  {
    uint64_t v8 = [v6 dequeueReusableCellWithIdentifier:0x1F3BACD20];
  }
  else if (v7 == 2)
  {
    uint64_t v8 = [v6 dequeueReusableCellWithIdentifier:0x1F3BAC680];
    uint64_t v9 = [(HKEmergencyCardContactsTableItem *)self _footerAttributedText];
    [v8 setFooterAttributedText:v9];
  }
  else
  {
    uint64_t v8 = [v6 dequeueReusableCellWithIdentifier:0x1F3BB6F60];
    BOOL v10 = [(HKEmergencyCardTableItem *)self data];
    int64_t v11 = [v10 emergencyContacts];
    BOOL v12 = objc_msgSend(v11, "objectAtIndexedSubscript:", -[HKEmergencyCardContactsTableItem contactIndexForRowIndex:](self, "contactIndexForRowIndex:", a3));
    [v8 setContact:v12];
  }
  return v8;
}

- (id)_footerAttributedText
{
  if ([(HKEmergencyCardTableItem *)self isSecondaryProfile]) {
    [(HKEmergencyCardContactsTableItem *)self _footerAttributedTextForSecondaryProfile];
  }
  else {
  BOOL v3 = [(HKEmergencyCardContactsTableItem *)self _footerAttributedTextForPrimaryProfile];
  }
  return v3;
}

- (id)_footerAttributedTextForPrimaryProfile
{
  v31[2] = *MEMORY[0x1E4F143B8];
  v2 = NSString;
  BOOL v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  objc_super v4 = [v3 localizedStringForKey:@"EMERGENCY_CONTACT_HINT_CONCATENATION_RULE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  uint64_t v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v6 = [v5 localizedStringForKey:@"EMERGENCY_CONTACT_HINT" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  int64_t v7 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  uint64_t v8 = [v7 localizedStringForKey:@"EMERGENCY_CONTACT_HINT_PROMPT" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  uint64_t v9 = objc_msgSend(v2, "stringWithFormat:", v4, v6, v8);

  id v10 = objc_alloc(MEMORY[0x1E4F28E48]);
  uint64_t v11 = *MEMORY[0x1E4FB0700];
  v30[0] = *MEMORY[0x1E4FB0700];
  BOOL v12 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  v31[0] = v12;
  uint64_t v13 = *MEMORY[0x1E4FB06F8];
  v30[1] = *MEMORY[0x1E4FB06F8];
  uint64_t v14 = *MEMORY[0x1E4FB28F0];
  v15 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
  v31[1] = v15;
  uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];
  v17 = (void *)[v10 initWithString:v9 attributes:v16];

  v18 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v19 = [v18 localizedStringForKey:@"EMERGENCY_CONTACT_HINT_PROMPT" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  uint64_t v20 = [v9 rangeOfString:v19];
  uint64_t v22 = v21;

  if (v20 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v28[0] = v11;
    v23 = HKHealthKeyColor();
    v29[0] = v23;
    v28[1] = *MEMORY[0x1E4FB0720];
    v24 = [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=EMERGENCY_SOS%23-64"];
    v29[1] = v24;
    v28[2] = v13;
    v25 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v14];
    v29[2] = v25;
    v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:3];
    objc_msgSend(v17, "setAttributes:range:", v26, v20, v22);
  }
  return v17;
}

- (id)_footerAttributedTextForSecondaryProfile
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v2 = [(HKEmergencyCardContactsTableItem *)self _footerTextForSecondaryProfile];
  id v3 = objc_alloc(MEMORY[0x1E4F28B18]);
  v9[0] = *MEMORY[0x1E4FB0700];
  objc_super v4 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  v10[0] = v4;
  v9[1] = *MEMORY[0x1E4FB06F8];
  uint64_t v5 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
  v10[1] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  int64_t v7 = (void *)[v3 initWithString:v2 attributes:v6];

  return v7;
}

- (id)_footerTextForSecondaryProfile
{
  id v3 = [(HKEmergencyCardTableItem *)self profileFirstName];
  objc_super v4 = [(HKEmergencyCardContactsTableItem *)self _footerTextWithGivenName:v3];

  return v4;
}

- (id)_footerTextWithGivenName:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28B50];
  id v4 = a3;
  uint64_t v5 = [v3 bundleWithIdentifier:@"com.apple.HealthUI"];
  id v6 = [v5 localizedStringForKey:@"EMERGENCY_CONTACT_HINT_WITH_NAME_%@_%@" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-tinker"];

  int64_t v7 = objc_msgSend(NSString, "localizedStringWithFormat:", v6, v4, v4);

  return v7;
}

- (id)_dequeueAndConfigureContactEditCellForIndex:(int64_t)a3 inTableView:(id)a4
{
  id v6 = [a4 dequeueReusableCellWithIdentifier:@"contactsTableItemEditCell"];
  if (!v6)
  {
    id v6 = [[HKMedicalIDEditorEmergencyContactCell alloc] initWithStyle:1 reuseIdentifier:@"contactsTableItemEditCell"];
    [(HKMedicalIDEditorCell *)v6 setEditDelegate:self];
    [(HKMedicalIDEditorCell *)v6 setMinimumLabelWidth:87.0];
  }
  int64_t v7 = [(HKEmergencyCardTableItem *)self data];
  uint64_t v8 = [v7 emergencyContacts];
  uint64_t v9 = [v8 objectAtIndexedSubscript:a3];
  [(HKMedicalIDEditorEmergencyContactCell *)v6 setContact:v9];

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndex:(int64_t)a4
{
  id v6 = a3;
  if ([(HKEmergencyCardTableItem *)self isInEditMode])
  {
    int64_t v7 = [(HKEmergencyCardTableItem *)self data];
    uint64_t v8 = [v7 emergencyContacts];
    uint64_t v9 = [v8 count];

    if (v9 == a4)
    {
      id v10 = [(HKEmergencyCardTableItem *)self data];
      uint64_t v11 = [v10 emergencyContacts];
      BOOL v12 = [v11 count] > 9;

      uint64_t v13 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      uint64_t v14 = [v13 localizedStringForKey:@"add_emergency_contact" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      v15 = [(HKEmergencyCardTableItem *)self _dequeueNoValueCellInTableView:v6 withTitle:v14 disabled:v12];

      objc_storeStrong((id *)&self->_lastDequeuedAddContactCell, v15);
      [(HKEmergencyCardContactsTableItem *)self _setupContactPickingFlow];
      goto LABEL_7;
    }
    uint64_t v16 = [(HKEmergencyCardContactsTableItem *)self _dequeueAndConfigureContactEditCellForIndex:a4 inTableView:v6];
  }
  else
  {
    uint64_t v16 = [(HKEmergencyCardContactsTableItem *)self _dequeueAndConfigureContactViewCellForIndex:a4 inTableView:v6];
  }
  v15 = (void *)v16;
LABEL_7:

  return v15;
}

- (id)title
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v3 = [v2 localizedStringForKey:@"contacts" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

  return v3;
}

- (double)tableView:(id)a3 heightForRowAtIndex:(int64_t)a4
{
  return *MEMORY[0x1E4FB2F28];
}

- (BOOL)shouldHighlightRowAtIndex:(int64_t)a3
{
  int64_t v3 = [(HKEmergencyCardContactsTableItem *)self itemTypeForRowIndex:a3];
  return v3 == 1 || v3 == 4;
}

- (void)_setupContactPickingFlow
{
  int64_t v3 = [HKMedicalIDEmergencyContactFlow alloc];
  id v4 = [(HKEmergencyCardTableItem *)self owningViewController];
  uint64_t v5 = [(HKEmergencyCardTableItem *)self data];
  id v6 = [(HKMedicalIDEmergencyContactFlow *)v3 initWithPresentingViewController:v4 forMedicalIDData:v5];
  contactPicker = self->_contactPicker;
  self->_contactPicker = v6;

  [(HKMedicalIDEmergencyContactFlow *)self->_contactPicker setIsSecondaryProfile:[(HKEmergencyCardTableItem *)self isSecondaryProfile]];
  [(HKMedicalIDEmergencyContactFlow *)self->_contactPicker setDelegate:self];
  uint64_t v8 = self->_contactPicker;
  [(HKMedicalIDEmergencyContactFlow *)v8 fetchFamilyContactsForSuggestion];
}

- (void)_presentEmergencyContactPickerIfPossible
{
}

- (void)tableView:(id)a3 didSelectRowAtIndex:(int64_t)a4
{
  id v6 = a3;
  int64_t v7 = [v6 indexPathForSelectedRow];
  [v6 deselectRowAtIndexPath:v7 animated:1];

  int64_t v8 = [(HKEmergencyCardContactsTableItem *)self itemTypeForRowIndex:a4];
  if (v8 == 4)
  {
    [(HKEmergencyCardContactsTableItem *)self _presentEmergencyContactPickerIfPossible];
  }
  else if (v8 == 1)
  {
    uint64_t v9 = [(HKEmergencyCardTableItem *)self data];
    id v10 = [v9 emergencyContacts];
    objc_msgSend(v10, "objectAtIndexedSubscript:", -[HKEmergencyCardContactsTableItem contactIndexForRowIndex:](self, "contactIndexForRowIndex:", a4));
    id v11 = (id)objc_claimAutoreleasedReturnValue();

    [(HKEmergencyCardContactsTableItem *)self callEmergencyContact:v11];
  }
}

- (int64_t)editingStyleForRowAtIndex:(int64_t)a3
{
  id v4 = [(HKEmergencyCardTableItem *)self data];
  uint64_t v5 = [v4 emergencyContacts];
  uint64_t v6 = [v5 count];

  if (v6 == a3) {
    return 2;
  }
  else {
    return 1;
  }
}

- (int64_t)commitEditingStyle:(int64_t)a3 forRowAtIndex:(int64_t)a4
{
  if (a3 == 1)
  {
    uint64_t v6 = [(HKEmergencyCardTableItem *)self data];
    int64_t v7 = [v6 emergencyContacts];
    int64_t v8 = (void *)[v7 mutableCopy];

    objc_msgSend(v8, "removeObjectAtIndex:", -[HKEmergencyCardContactsTableItem contactIndexForRowIndex:](self, "contactIndexForRowIndex:", a4));
    uint64_t v9 = [(HKEmergencyCardTableItem *)self data];
    [v9 setEmergencyContacts:v8];

    return 1;
  }
  else
  {
    [(HKEmergencyCardContactsTableItem *)self _presentEmergencyContactPickerIfPossible];
    return 0;
  }
}

- (void)medicalIDEditorCellDidTapLabel:(id)a3
{
  id v4 = [a3 contact];
  selectedContact = self->_selectedContact;
  self->_selectedContact = v4;

  int64_t v8 = objc_alloc_init(HKEmergencyContactRelationshipPicker);
  [(HKEmergencyContactRelationshipPicker *)v8 setDelegate:self];
  uint64_t v6 = [[HKNavigationController alloc] initWithRootViewController:v8];
  int64_t v7 = [(HKEmergencyCardTableItem *)self owningViewController];
  [v7 presentViewController:v6 animated:1 completion:0];
}

- (void)emergencyContactRelationshipPicker:(id)a3 didChooseRelationshipNamed:(id)a4
{
  [(_HKEmergencyContact *)self->_selectedContact setRelationship:a4];
  selectedContact = self->_selectedContact;
  self->_selectedContact = 0;

  uint64_t v6 = [(HKEmergencyCardTableItem *)self owningViewController];
  [v6 dismissViewControllerAnimated:1 completion:0];

  id v7 = [(HKEmergencyCardContactsTableItem *)self delegate];
  [v7 updateEmergencyContactTableItem];
}

- (void)emergencyContactRelationshipPickerDidCancel:(id)a3
{
  selectedContact = self->_selectedContact;
  self->_selectedContact = 0;

  id v5 = [(HKEmergencyCardTableItem *)self owningViewController];
  [v5 dismissViewControllerAnimated:1 completion:0];
}

- (void)_addEmergencyContactToData:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HKEmergencyCardTableItem *)self data];
  uint64_t v6 = [v5 emergencyContacts];

  if (v6)
  {
    id v7 = [v6 arrayByAddingObject:v4];
  }
  else
  {
    v10[0] = v4;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  }
  if (getSOSUtilitiesClass_0() && ([getSOSUtilitiesClass_0() isAllowedToMessageSOSContacts] & 1) == 0) {
    [getSOSUtilitiesClass_0() setAllowedToMessageSOSContacts:1];
  }
  int64_t v8 = [(HKEmergencyCardTableItem *)self data];
  [v8 setEmergencyContacts:v7];

  uint64_t v9 = [(HKEmergencyCardContactsTableItem *)self delegate];
  [v9 updateEmergencyContactTableItem];
}

- (void)emergencyContactFlow:(id)a3 didSelectContact:(id)a4
{
  [(HKEmergencyCardContactsTableItem *)self _addEmergencyContactToData:a4];
  selectedContact = self->_selectedContact;
  self->_selectedContact = 0;
}

- (void)emergencyContactFlowDidCancel:(id)a3
{
  self->_selectedContact = 0;
  MEMORY[0x1F41817F8]();
}

- (id)titleForFooter
{
  if (![(HKEmergencyCardTableItem *)self isInEditMode]) {
    goto LABEL_9;
  }
  if ([(HKEmergencyCardTableItem *)self isSecondaryProfile])
  {
    int64_t v3 = [(HKEmergencyCardContactsTableItem *)self _footerTextForSecondaryProfile];
    goto LABEL_10;
  }
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2050000000;
  id v4 = (void *)getSOSManagerClass_softClass;
  uint64_t v12 = getSOSManagerClass_softClass;
  if (!getSOSManagerClass_softClass)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __getSOSManagerClass_block_invoke;
    v8[3] = &unk_1E6D514F8;
    v8[4] = &v9;
    __getSOSManagerClass_block_invoke((uint64_t)v8);
    id v4 = (void *)v10[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v9, 8);
  if (([v5 deviceSupportsSOS] & 1) != 0
    || [MEMORY[0x1E4F2B860] hasPairedWatch])
  {
    uint64_t v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    int64_t v3 = [v6 localizedStringForKey:@"EMERGENCY_CONTACT_FOOTNOTE_LONG" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  }
  else
  {
LABEL_9:
    int64_t v3 = &stru_1F3B9CF20;
  }
LABEL_10:
  return v3;
}

- (id)titleForHeader
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  int64_t v3 = [v2 localizedStringForKey:@"EMERGENCY_CONTACT_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

  return v3;
}

- (HKEmergencyCardContactUpdateDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HKEmergencyCardContactUpdateDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contactPicker, 0);
  objc_storeStrong((id *)&self->_selectedContact, 0);
  objc_storeStrong((id *)&self->_lastDequeuedAddContactCell, 0);
}

@end