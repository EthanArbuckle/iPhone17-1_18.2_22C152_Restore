@interface HKMedicalIDEmergencyContactFlow
- (BOOL)isSecondaryProfile;
- (BOOL)shouldShowSuggestedContacts;
- (HKCoreTelephonyUtilities)coreTelephonyUtilities;
- (HKMedicalIDEmergencyContactFlow)initWithPresentingViewController:(id)a3 forMedicalIDData:(id)a4;
- (HKMedicalIDEmergencyContactFlowDelegate)delegate;
- (UIViewController)owningViewController;
- (void)_didSelectContact:(id)a3 property:(id)a4;
- (void)emergencyContactPicker:(id)a3 didSelectContact:(id)a4;
- (void)emergencyContactPicker:(id)a3 didSelectContactProperty:(id)a4;
- (void)emergencyContactRelationshipPicker:(id)a3 didChooseRelationshipNamed:(id)a4;
- (void)emergencyContactRelationshipPickerDidCancel:(id)a3;
- (void)fetchFamilyContactsForSuggestion;
- (void)presentEmergencyContactFlow;
- (void)setCoreTelephonyUtilities:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsSecondaryProfile:(BOOL)a3;
- (void)setOwningViewController:(id)a3;
- (void)setShouldShowSuggestedContacts:(BOOL)a3;
- (void)setSuggestedContacts:(id)a3;
@end

@implementation HKMedicalIDEmergencyContactFlow

- (HKMedicalIDEmergencyContactFlow)initWithPresentingViewController:(id)a3 forMedicalIDData:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKMedicalIDEmergencyContactFlow;
  v9 = [(HKMedicalIDEmergencyContactFlow *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_medicalIDData, a4);
    objc_storeStrong((id *)&v10->_owningViewController, a3);
    v11 = [[HKEmergencyContactPicker alloc] initWithOwningViewController:v10->_owningViewController];
    contactPicker = v10->_contactPicker;
    v10->_contactPicker = v11;
  }
  return v10;
}

- (void)setShouldShowSuggestedContacts:(BOOL)a3
{
  self->_shouldShowSuggestedContacts = a3;
}

- (void)fetchFamilyContactsForSuggestion
{
  objc_initWeak(&location, self);
  v2 = dispatch_get_global_queue(2, 0);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __67__HKMedicalIDEmergencyContactFlow_fetchFamilyContactsForSuggestion__block_invoke;
  v3[3] = &unk_1E6D51C48;
  objc_copyWeak(&v4, &location);
  dispatch_async(v2, v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __67__HKMedicalIDEmergencyContactFlow_fetchFamilyContactsForSuggestion__block_invoke(uint64_t a1)
{
  v1[0] = MEMORY[0x1E4F143A8];
  v1[1] = 3221225472;
  v1[2] = __67__HKMedicalIDEmergencyContactFlow_fetchFamilyContactsForSuggestion__block_invoke_2;
  v1[3] = &unk_1E6D522A8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  +[HKFamilyCircleUtilities fetchFamilyContacts:v1];
  objc_destroyWeak(&v2);
}

void __67__HKMedicalIDEmergencyContactFlow_fetchFamilyContactsForSuggestion__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained setSuggestedContacts:v3];
}

- (void)setSuggestedContacts:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__HKMedicalIDEmergencyContactFlow_setSuggestedContacts___block_invoke;
  v6[3] = &unk_1E6D513B0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __56__HKMedicalIDEmergencyContactFlow_setSuggestedContacts___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 41) = 1;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), *(id *)(a1 + 40));
}

- (void)presentEmergencyContactFlow
{
  [(HKEmergencyContactPicker *)self->_contactPicker setDelegate:self];
  [(HKEmergencyContactPicker *)self->_contactPicker setIsSecondaryProfile:[(HKMedicalIDEmergencyContactFlow *)self isSecondaryProfile]];
  if (self->_shouldShowSuggestedContacts
    && ![(HKMedicalIDEmergencyContactFlow *)self isSecondaryProfile])
  {
    [(HKEmergencyContactPicker *)self->_contactPicker setSuggestedContacts:self->_suggestedContacts];
  }
  contactPicker = self->_contactPicker;
  medicalIDData = self->_medicalIDData;
  [(HKEmergencyContactPicker *)contactPicker presentEmergencyContactPickerForMedicalIDDataIfPossible:medicalIDData];
}

- (HKCoreTelephonyUtilities)coreTelephonyUtilities
{
  coreTelephonyUtilities = self->_coreTelephonyUtilities;
  if (!coreTelephonyUtilities)
  {
    id v4 = objc_alloc_init(HKCoreTelephonyUtilities);
    id v5 = self->_coreTelephonyUtilities;
    self->_coreTelephonyUtilities = v4;

    coreTelephonyUtilities = self->_coreTelephonyUtilities;
  }
  return coreTelephonyUtilities;
}

- (void)emergencyContactPicker:(id)a3 didSelectContact:(id)a4
{
}

- (void)emergencyContactPicker:(id)a3 didSelectContactProperty:(id)a4
{
}

- (void)_didSelectContact:(id)a3 property:(id)a4
{
  id v5 = [MEMORY[0x1E4F2B8D0] emergencyContactWithContact:a3 property:a4];
  v6 = [(HKMedicalIDEmergencyContactFlow *)self coreTelephonyUtilities];
  id v7 = [v5 phoneNumber];
  int v8 = [v6 isEmergencyServicePhoneNumber:v7];

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E4FB1418];
    v10 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v11 = [v10 localizedStringForKey:@"EMERGENCY_CONTACT_NO_EMERGENCY_SERVICE_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    v12 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v13 = [v12 localizedStringForKey:@"EMERGENCY_CONTACT_NO_EMERGENCY_SERVICE_BODY" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    objc_super v14 = [v9 alertControllerWithTitle:v11 message:v13 preferredStyle:1];

    v15 = (void *)MEMORY[0x1E4FB1410];
    v16 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v17 = [(HKEmergencyContactRelationshipPicker *)v16 localizedStringForKey:@"EMERGENCY_CONTACT_NO_EMERGENCY_SERVICE_BUTTON" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    v18 = [v15 actionWithTitle:v17 style:0 handler:0];
    [(HKNavigationController *)v14 addAction:v18];
  }
  else
  {
    v16 = objc_alloc_init(HKEmergencyContactRelationshipPicker);
    [(HKEmergencyContactRelationshipPicker *)v16 setDelegate:self];
    objc_storeStrong((id *)&self->_selectedContact, v5);
    objc_super v14 = [[HKNavigationController alloc] initWithRootViewController:v16];
  }

  [(HKMedicalIDEmergencyContactFlow *)self setCoreTelephonyUtilities:0];
  owningViewController = self->_owningViewController;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __62__HKMedicalIDEmergencyContactFlow__didSelectContact_property___block_invoke;
  v21[3] = &unk_1E6D513B0;
  v21[4] = self;
  v22 = v14;
  v20 = v14;
  [(UIViewController *)owningViewController dismissViewControllerAnimated:1 completion:v21];
}

uint64_t __62__HKMedicalIDEmergencyContactFlow__didSelectContact_property___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

- (void)emergencyContactRelationshipPicker:(id)a3 didChooseRelationshipNamed:(id)a4
{
  id v5 = a4;
  if (!self)
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E4F29F28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_ERROR)) {
      -[HKMedicalIDEmergencyContactFlow emergencyContactRelationshipPicker:didChooseRelationshipNamed:](v6);
    }
  }
  [(_HKEmergencyContact *)self->_selectedContact setRelationship:v5];
  id v7 = [(HKMedicalIDEmergencyContactFlow *)self delegate];
  [v7 emergencyContactFlow:self didSelectContact:self->_selectedContact];

  selectedContact = self->_selectedContact;
  self->_selectedContact = 0;

  [(UIViewController *)self->_owningViewController dismissViewControllerAnimated:1 completion:0];
}

- (void)emergencyContactRelationshipPickerDidCancel:(id)a3
{
  if (!self)
  {
    _HKInitializeLogging();
    id v4 = *MEMORY[0x1E4F29F28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_ERROR)) {
      -[HKMedicalIDEmergencyContactFlow emergencyContactRelationshipPicker:didChooseRelationshipNamed:](v4);
    }
  }
  id v5 = [(HKMedicalIDEmergencyContactFlow *)self delegate];
  [v5 emergencyContactFlowDidCancel:self];

  selectedContact = self->_selectedContact;
  self->_selectedContact = 0;

  [(UIViewController *)self->_owningViewController dismissViewControllerAnimated:1 completion:0];
}

- (HKMedicalIDEmergencyContactFlowDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HKMedicalIDEmergencyContactFlowDelegate *)WeakRetained;
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

- (BOOL)shouldShowSuggestedContacts
{
  return self->_shouldShowSuggestedContacts;
}

- (void)setCoreTelephonyUtilities:(id)a3
{
}

- (UIViewController)owningViewController
{
  return self->_owningViewController;
}

- (void)setOwningViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_owningViewController, 0);
  objc_storeStrong((id *)&self->_coreTelephonyUtilities, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_suggestedContacts, 0);
  objc_storeStrong((id *)&self->_contactPicker, 0);
  objc_storeStrong((id *)&self->_selectedContact, 0);
  objc_storeStrong((id *)&self->_medicalIDData, 0);
}

- (void)emergencyContactRelationshipPicker:(os_log_t)log didChooseRelationshipNamed:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1E0B26000, log, OS_LOG_TYPE_ERROR, "HKEmergencyContactRelationshipPicker instance was not properly retained for delegate callback.", v1, 2u);
}

@end