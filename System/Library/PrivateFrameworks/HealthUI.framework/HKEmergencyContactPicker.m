@interface HKEmergencyContactPicker
- (BOOL)isSecondaryProfile;
- (HKEmergencyContactPicker)initWithOwningViewController:(id)a3;
- (HKEmergencyContactPickerDelegate)delegate;
- (NSArray)suggestedContacts;
- (UIViewController)owningViewController;
- (id)_meContactIdentifier;
- (void)_meContactIdentifier;
- (void)contactPicker:(id)a3 didSelectContact:(id)a4;
- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4;
- (void)presentEmergencyContactPickerForMedicalIDDataIfPossible:(id)a3;
- (void)presentMaximumEmergencyContactAlert;
- (void)setDelegate:(id)a3;
- (void)setIsSecondaryProfile:(BOOL)a3;
- (void)setOwningViewController:(id)a3;
- (void)setSuggestedContacts:(id)a3;
@end

@implementation HKEmergencyContactPicker

- (HKEmergencyContactPicker)initWithOwningViewController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKEmergencyContactPicker;
  v6 = [(HKEmergencyContactPicker *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_owningViewController, a3);
  }

  return v7;
}

- (void)presentEmergencyContactPickerForMedicalIDDataIfPossible:(id)a3
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 emergencyContacts];
  uint64_t v6 = [v5 count];

  if (v6 >= 10)
  {
    [(HKEmergencyContactPicker *)self presentMaximumEmergencyContactAlert];
  }
  else
  {
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x2050000000;
    v7 = (void *)getCNContactPickerViewControllerClass_softClass;
    uint64_t v29 = getCNContactPickerViewControllerClass_softClass;
    if (!getCNContactPickerViewControllerClass_softClass)
    {
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __getCNContactPickerViewControllerClass_block_invoke;
      v25[3] = &unk_1E6D514F8;
      v25[4] = &v26;
      __getCNContactPickerViewControllerClass_block_invoke((uint64_t)v25);
      v7 = (void *)v27[3];
    }
    v8 = v7;
    _Block_object_dispose(&v26, 8);
    id v9 = objc_alloc_init(v8);
    if (v9)
    {
      v30[0] = *MEMORY[0x1E4F1AEE0];
      uint64_t v10 = v30[0];
      v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
      [v9 setDisplayedPropertyKeys:v11];

      [v9 setDelegate:self];
      [v9 setMode:1];
      [v9 setOnlyRealContacts:1];
      v12 = [(HKEmergencyContactPicker *)self _meContactIdentifier];
      v13 = NSStringFromSelector(sel_nameContactIdentifier);
      v14 = [v4 emergencyContacts];
      v15 = [v14 valueForKeyPath:v13];

      v16 = (void *)MEMORY[0x1E4F1CA48];
      v17 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K.@count > 0", v10);
      v18 = [v16 arrayWithObject:v17];

      if (v12 && ![(HKEmergencyContactPicker *)self isSecondaryProfile])
      {
        v19 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K != %@", *MEMORY[0x1E4F1AE08], v12];
        [v18 addObject:v19];
      }
      if ([v15 count])
      {
        v20 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"!(%K IN %@)", *MEMORY[0x1E4F1AE08], v15];
        [v18 addObject:v20];
      }
      v21 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v18];
      [v9 setPredicateForEnablingContact:v21];

      if ([(NSArray *)self->_suggestedContacts count])
      {
        [v9 setShouldDisplaySuggestionsController:1];
        [v9 setContactSuggestions:self->_suggestedContacts];
      }
      v22 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"phoneNumbers.@count = 1"];
      [v9 setPredicateForSelectionOfContact:v22];

      v23 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"property == 'phoneNumbers'"];
      [v9 setPredicateForSelectionOfProperty:v23];

      v24 = [(HKEmergencyContactPicker *)self owningViewController];
      [v24 presentViewController:v9 animated:1 completion:0];
    }
  }
}

- (void)presentMaximumEmergencyContactAlert
{
  v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v12 = [v3 localizedStringForKey:@"EMERGENCY_CONTACT_MAX_NUMBER_REACHED_ALERT_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

  id v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v5 = [v4 localizedStringForKey:@"EMERGENCY_CONTACT_MAX_NUMBER_REACHED_ALERT_BODY" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

  uint64_t v6 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v12 message:v5 preferredStyle:1];
  v7 = (void *)MEMORY[0x1E4FB1410];
  v8 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v9 = [v8 localizedStringForKey:@"EMERGENCY_CONTACT_MAX_NUMBER_REACHED_ALERT_OK_ACTION" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  uint64_t v10 = [v7 actionWithTitle:v9 style:1 handler:0];

  [v6 addAction:v10];
  v11 = [(HKEmergencyContactPicker *)self owningViewController];
  [v11 presentViewController:v6 animated:1 completion:0];
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained emergencyContactPicker:self didSelectContact:v6];
}

- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained emergencyContactPicker:self didSelectContactProperty:v6];
}

- (id)_meContactIdentifier
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F1B980] authorizationStatusForEntityType:0] == 3)
  {
    v2 = [MEMORY[0x1E4F1B980] storeWithOptions:1];
    v10[0] = *MEMORY[0x1E4F1AE08];
    v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    id v9 = 0;
    id v4 = objc_msgSend(v2, "_ios_meContactWithKeysToFetch:error:", v3, &v9);
    id v5 = v9;

    if (v5)
    {
      _HKInitializeLogging();
      id v6 = *MEMORY[0x1E4F29F28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_ERROR)) {
        [(HKEmergencyContactPicker *)(uint64_t)v5 _meContactIdentifier];
      }
    }
    v7 = [v4 identifier];
  }
  else
  {
    v7 = &stru_1F3B9CF20;
  }
  return v7;
}

- (UIViewController)owningViewController
{
  return self->_owningViewController;
}

- (void)setOwningViewController:(id)a3
{
}

- (HKEmergencyContactPickerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HKEmergencyContactPickerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isSecondaryProfile
{
  return self->_isSecondaryProfile;
}

- (void)setIsSecondaryProfile:(BOOL)a3
{
  self->_isSecondaryProfile = a3;
}

- (NSArray)suggestedContacts
{
  return self->_suggestedContacts;
}

- (void)setSuggestedContacts:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedContacts, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_owningViewController, 0);
}

- (void)_meContactIdentifier
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E0B26000, a2, OS_LOG_TYPE_ERROR, "Error fetching me contact: %@", (uint8_t *)&v2, 0xCu);
}

@end