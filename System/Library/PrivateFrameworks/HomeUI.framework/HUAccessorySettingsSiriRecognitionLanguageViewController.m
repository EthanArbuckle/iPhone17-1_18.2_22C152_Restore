@interface HUAccessorySettingsSiriRecognitionLanguageViewController
- (BOOL)_isAnyMediaAccessoryOnSupportedVoiceRecognitionLanguage;
- (BOOL)_shouldPresentAlertRequestingToTurnOffVoiceRecognition:(id)a3;
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (HUAccessorySettingsSiriRecognitionLanguageViewController)initWithAccessoryGroupItem:(id)a3;
- (HUAccessorySettingsSiriRecognitionLanguageViewController)initWithAccessorySettingItem:(id)a3 module:(id)a4;
- (HUAccessorySettingsSiriRecognitionLanguageViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4;
- (NAFuture)changeLanguageFuture;
- (id)_allMediaAccessories;
- (id)_siriLanguageOptionForMediaProfile:(id)a3;
- (int64_t)selectedLanguageIndex;
- (void)_attemptToFixVoiceRecognitionOnboardingFailures:(id)a3;
- (void)_changeSiriLanguageOnlyForThisMediaAccessory:(id)a3 turnOffVoiceID:(BOOL)a4;
- (void)_clearSpinner;
- (void)_presentAlertConfirmingLanguageChangeAndTurnOffVoiceRecognition:(id)a3 indexPath:(id)a4;
- (void)_presentAlertConfirmingLanguageChangeForAllHomeMembers:(id)a3 indexPath:(id)a4;
- (void)_presentAlertConfirmingLanguageChangeForThisORAllMediaAccessories:(id)a3 indexPath:(id)a4;
- (void)_turnOffVoiceIDAndChangeSiriLanguageForAllMediaAccessories:(id)a3;
- (void)_turnOffVoiceIDForTargetLanguageOption:(id)a3;
- (void)setChangeLanguageFuture:(id)a3;
- (void)setSelectedLanguageIndex:(int64_t)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6;
@end

@implementation HUAccessorySettingsSiriRecognitionLanguageViewController

- (HUAccessorySettingsSiriRecognitionLanguageViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  v7 = NSStringFromSelector(sel_initWithAccessoryGroupItem_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUAccessorySettingsSiriRecognitionLanguageViewController.m", 44, @"%s is unavailable; use %@ instead",
    "-[HUAccessorySettingsSiriRecognitionLanguageViewController initWithItemManager:tableViewStyle:]",
    v7);

  return 0;
}

- (HUAccessorySettingsSiriRecognitionLanguageViewController)initWithAccessoryGroupItem:(id)a3
{
  id v4 = a3;
  v5 = [[HUAccessorySettingsSiriRecognitionLanguageItemManager alloc] initWithDelegate:self groupItem:v4];

  v9.receiver = self;
  v9.super_class = (Class)HUAccessorySettingsSiriRecognitionLanguageViewController;
  v6 = [(HUItemTableViewController *)&v9 initWithItemManager:v5 tableViewStyle:1];
  v7 = v6;
  if (v6) {
    v6->_selectedLanguageIndex = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (HUAccessorySettingsSiriRecognitionLanguageViewController)initWithAccessorySettingItem:(id)a3 module:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [HUAccessorySettingsSiriRecognitionLanguageItemManager alloc];
  objc_super v9 = [v6 sourceItem];

  v10 = [(HUAccessorySettingsSiriRecognitionLanguageItemManager *)v8 initWithDelegate:self accessorySettingItem:v7 accessoryItem:v9];
  v14.receiver = self;
  v14.super_class = (Class)HUAccessorySettingsSiriRecognitionLanguageViewController;
  v11 = [(HUItemTableViewController *)&v14 initWithItemManager:v10 tableViewStyle:1];
  v12 = v11;
  if (v11) {
    v11->_selectedLanguageIndex = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v12;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  return (Class)objc_opt_class();
}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  v21.receiver = self;
  v21.super_class = (Class)HUAccessorySettingsSiriRecognitionLanguageViewController;
  id v11 = a5;
  id v12 = a4;
  [(HUItemTableViewController *)&v21 updateCell:v10 forItem:v12 indexPath:v11 animated:v6];
  v13 = objc_msgSend(v12, "latestResults", v21.receiver, v21.super_class);
  objc_super v14 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  v15 = [v10 textLabel];
  [v15 setText:v14];

  v16 = [v12 latestResults];

  v17 = [v16 objectForKeyedSubscript:*MEMORY[0x1E4F68B40]];
  if ([v17 BOOLValue]) {
    uint64_t v18 = 3;
  }
  else {
    uint64_t v18 = 0;
  }
  [v10 setAccessoryType:v18];

  uint64_t v19 = [v11 row];
  if (v19 - 1 == [(HUAccessorySettingsSiriRecognitionLanguageViewController *)self selectedLanguageIndex])
  {
    v20 = (void *)[objc_alloc(MEMORY[0x1E4F42708]) initWithActivityIndicatorStyle:100];
    [v20 startAnimating];
    [v10 setAccessoryView:v20];
  }
  else
  {
    [v10 setAccessoryView:0];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HUAccessorySettingsSiriRecognitionLanguageViewController;
  [(HUItemTableViewController *)&v17 tableView:v6 didSelectRowAtIndexPath:v7];
  v8 = [(HUItemTableViewController *)self itemManager];
  objc_super v9 = [v8 displayedItemAtIndexPath:v7];

  objc_opt_class();
  id v10 = v9;
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }
  id v12 = v11;

  if (v12)
  {
    v13 = [v12 languageOption];
    objc_super v14 = [v13 recognitionLanguage];

    -[HUAccessorySettingsSiriRecognitionLanguageViewController setSelectedLanguageIndex:](self, "setSelectedLanguageIndex:", [v7 row] - 1);
    if ([(HUAccessorySettingsSiriRecognitionLanguageViewController *)self _shouldPresentAlertRequestingToTurnOffVoiceRecognition:v14])
    {
      [(HUAccessorySettingsSiriRecognitionLanguageViewController *)self _presentAlertConfirmingLanguageChangeAndTurnOffVoiceRecognition:v10 indexPath:v7];
    }
    else
    {
      v15 = [(HUAccessorySettingsSiriRecognitionLanguageViewController *)self _allMediaAccessories];
      unint64_t v16 = [v15 count];

      if (v16 < 2) {
        [(HUAccessorySettingsSiriRecognitionLanguageViewController *)self _changeSiriLanguageOnlyForThisMediaAccessory:v10 turnOffVoiceID:0];
      }
      else {
        [(HUAccessorySettingsSiriRecognitionLanguageViewController *)self _presentAlertConfirmingLanguageChangeForThisORAllMediaAccessories:v10 indexPath:v7];
      }
      [(HUAccessorySettingsSiriRecognitionLanguageViewController *)self _attemptToFixVoiceRecognitionOnboardingFailures:v14];
    }
    [v6 deselectRowAtIndexPath:v7 animated:1];
  }
  else
  {
    NSLog(&cfstr_MisconfiguredH.isa);
  }
}

- (void)setSelectedLanguageIndex:(int64_t)a3
{
  if (self->_selectedLanguageIndex != a3)
  {
    v5 = objc_opt_new();
    id v6 = [(HUItemTableViewController *)self itemManager];
    id v7 = [v6 displayedItemsInSection:0];
    int64_t v8 = [v7 count];

    int64_t selectedLanguageIndex = self->_selectedLanguageIndex;
    if (selectedLanguageIndex != 0x7FFFFFFFFFFFFFFFLL && selectedLanguageIndex + 1 < v8)
    {
      id v11 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:");
      [v5 addObject:v11];
    }
    if (a3 != 0x7FFFFFFFFFFFFFFFLL && a3 + 1 < v8)
    {
      id v12 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:");
      [v5 addObject:v12];
    }
    self->_int64_t selectedLanguageIndex = a3;
    if ([v5 count])
    {
      v13 = [(HUItemTableViewController *)self itemManager];
      int v14 = [v13 diffableDataSourceDisabled];

      if (v14)
      {
        v15 = [(HUAccessorySettingsSiriRecognitionLanguageViewController *)self tableView];
        [v15 reloadRowsAtIndexPaths:v5 withRowAnimation:5];
      }
      else
      {
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __85__HUAccessorySettingsSiriRecognitionLanguageViewController_setSelectedLanguageIndex___block_invoke;
        v18[3] = &unk_1E6389690;
        v18[4] = self;
        unint64_t v16 = objc_msgSend(v5, "na_map:", v18);
        objc_super v17 = [(HUItemTableViewController *)self itemManager];
        [v17 reloadUIRepresentationForItems:v16 withAnimation:0];
      }
    }
  }
}

id __85__HUAccessorySettingsSiriRecognitionLanguageViewController_setSelectedLanguageIndex___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 itemManager];
  v5 = [v4 displayedItemAtIndexPath:v3];

  return v5;
}

- (BOOL)_shouldPresentAlertRequestingToTurnOffVoiceRecognition:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x1E4F69710]);
  v5 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  id v6 = [v5 home];
  id v7 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  int64_t v8 = [v7 home];
  objc_super v9 = [v8 currentUser];
  id v10 = (void *)[v4 initWithHome:v6 user:v9 nameStyle:0];

  if (![v10 isIdentifyVoiceEnabled]) {
    goto LABEL_5;
  }
  id v11 = +[HUHomeFeatureOnboardingUtilities fetchSupportedVoiceRecognitionLanguages];
  if (([v11 containsObject:v3] & 1) == 0)
  {
    v13 = HFLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412546;
      id v18 = v3;
      __int16 v19 = 2112;
      v20 = v11;
      _os_log_impl(&dword_1BE345000, v13, OS_LOG_TYPE_DEFAULT, "Alerting the user that Voice Recognition will be disabled: the selected voice recognition language (%@), is not in the set of supported VR languages: %@", (uint8_t *)&v17, 0x16u);
    }
    goto LABEL_11;
  }
  id v12 = [MEMORY[0x1E4F4E538] sharedPreferences];
  v13 = [v12 languageCode];

  if (![v3 isEqualToString:v13])
  {
    v15 = HFLogForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412546;
      id v18 = v3;
      __int16 v19 = 2112;
      v20 = v13;
      _os_log_impl(&dword_1BE345000, v15, OS_LOG_TYPE_DEFAULT, "Alerting the user that Voice Recognition will be disabled: the selected voice recognition language (%@), though supported, is not the Siri language of this phone: %@", (uint8_t *)&v17, 0x16u);
    }

LABEL_11:
    BOOL v14 = 1;
    goto LABEL_12;
  }

LABEL_5:
  BOOL v14 = 0;
LABEL_12:

  return v14;
}

- (void)_presentAlertConfirmingLanguageChangeAndTurnOffVoiceRecognition:(id)a3 indexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = HULocalizedModelString(@"HUSiriLanguageChange_TurnOff_VoiceID_Confirmation_Title");
  objc_opt_class();
  objc_super v9 = [(HUItemTableViewController *)self itemManager];
  id v10 = [v9 groupItem];
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }
  id v12 = v11;

  if (v12)
  {
    v13 = [MEMORY[0x1E4F691A0] sharedDispatcher];
    BOOL v14 = [v13 home];
    v15 = [v12 accessoryIdentifier];
    unint64_t v16 = objc_msgSend(v14, "hf_accessoryWithIdentifier:", v15);

    int v17 = objc_msgSend(v16, "hf_categoryOrPrimaryServiceType");
    uint64_t v18 = HULocalizedCategoryOrPrimaryServiceTypeModelString(@"HUSiriLanguageChange_TurnOff_VoiceID_Confirmation_Title", v17);

    int64_t v8 = (void *)v18;
  }
  __int16 v19 = [(UITableViewController *)self hu_actionSheetWithTitle:0 message:v8 indexPath:v7];
  v20 = [(HUAccessorySettingsSiriRecognitionLanguageViewController *)self _allMediaAccessories];
  uint64_t v21 = [v20 count];

  v22 = (void *)MEMORY[0x1E4F42720];
  v23 = _HULocalizedStringWithDefaultValue(@"HUSiriLanguageChange_TurnOff_VoiceID_Confirmation_Button_Title", @"HUSiriLanguageChange_TurnOff_VoiceID_Confirmation_Button_Title", 1);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __134__HUAccessorySettingsSiriRecognitionLanguageViewController__presentAlertConfirmingLanguageChangeAndTurnOffVoiceRecognition_indexPath___block_invoke;
  v31[3] = &unk_1E63896B8;
  v31[4] = self;
  id v32 = v6;
  id v33 = v7;
  uint64_t v34 = v21;
  id v24 = v6;
  id v25 = v7;
  v26 = [v22 actionWithTitle:v23 style:0 handler:v31];
  [v19 addAction:v26];

  v27 = (void *)MEMORY[0x1E4F42720];
  v28 = _HULocalizedStringWithDefaultValue(@"HUSiriLanguageChange_TurnOff_VoiceID_Cancel_Button_Title", @"HUSiriLanguageChange_TurnOff_VoiceID_Cancel_Button_Title", 1);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __134__HUAccessorySettingsSiriRecognitionLanguageViewController__presentAlertConfirmingLanguageChangeAndTurnOffVoiceRecognition_indexPath___block_invoke_2;
  v30[3] = &unk_1E6385188;
  v30[4] = self;
  v29 = [v27 actionWithTitle:v28 style:1 handler:v30];
  [v19 addAction:v29];

  [(HUAccessorySettingsSiriRecognitionLanguageViewController *)self presentViewController:v19 animated:1 completion:0];
}

uint64_t __134__HUAccessorySettingsSiriRecognitionLanguageViewController__presentAlertConfirmingLanguageChangeAndTurnOffVoiceRecognition_indexPath___block_invoke(void *a1)
{
  v2 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  id v3 = [v2 home];
  id v4 = [v3 users];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    id v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    uint64_t v8 = a1[6];
    return [v6 _presentAlertConfirmingLanguageChangeForAllHomeMembers:v7 indexPath:v8];
  }
  else
  {
    id v10 = (void *)a1[4];
    uint64_t v11 = a1[5];
    if (a1[7] < 2uLL)
    {
      return [v10 _changeSiriLanguageOnlyForThisMediaAccessory:v11 turnOffVoiceID:1];
    }
    else
    {
      uint64_t v12 = a1[6];
      return [v10 _presentAlertConfirmingLanguageChangeForThisORAllMediaAccessories:v11 indexPath:v12];
    }
  }
}

uint64_t __134__HUAccessorySettingsSiriRecognitionLanguageViewController__presentAlertConfirmingLanguageChangeAndTurnOffVoiceRecognition_indexPath___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _clearSpinner];
}

- (void)_presentAlertConfirmingLanguageChangeForAllHomeMembers:(id)a3 indexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _HULocalizedStringWithDefaultValue(@"HUSiriLanguageChange_OtherUsers_Confirmation_Title", @"HUSiriLanguageChange_OtherUsers_Confirmation_Title", 1);
  objc_super v9 = [(UITableViewController *)self hu_actionSheetWithTitle:0 message:v8 indexPath:v7];

  id v10 = (void *)MEMORY[0x1E4F42720];
  uint64_t v11 = _HULocalizedStringWithDefaultValue(@"HULanguageChangeLanguage_Button_Title", @"HULanguageChangeLanguage_Button_Title", 1);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __125__HUAccessorySettingsSiriRecognitionLanguageViewController__presentAlertConfirmingLanguageChangeForAllHomeMembers_indexPath___block_invoke;
  v19[3] = &unk_1E63896E0;
  v19[4] = self;
  id v20 = v6;
  id v21 = v7;
  id v12 = v7;
  id v13 = v6;
  BOOL v14 = [v10 actionWithTitle:v11 style:0 handler:v19];
  [v9 addAction:v14];

  v15 = (void *)MEMORY[0x1E4F42720];
  unint64_t v16 = _HULocalizedStringWithDefaultValue(@"HUSiriLanguageChange_TurnOff_VoiceID_Cancel_Button_Title", @"HUSiriLanguageChange_TurnOff_VoiceID_Cancel_Button_Title", 1);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __125__HUAccessorySettingsSiriRecognitionLanguageViewController__presentAlertConfirmingLanguageChangeForAllHomeMembers_indexPath___block_invoke_2;
  v18[3] = &unk_1E6385188;
  v18[4] = self;
  int v17 = [v15 actionWithTitle:v16 style:1 handler:v18];
  [v9 addAction:v17];

  [(HUAccessorySettingsSiriRecognitionLanguageViewController *)self presentViewController:v9 animated:1 completion:0];
}

uint64_t __125__HUAccessorySettingsSiriRecognitionLanguageViewController__presentAlertConfirmingLanguageChangeForAllHomeMembers_indexPath___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _allMediaAccessories];
  unint64_t v3 = [v2 count];

  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  if (v3 < 2)
  {
    return [v4 _changeSiriLanguageOnlyForThisMediaAccessory:v5 turnOffVoiceID:1];
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 48);
    return [v4 _presentAlertConfirmingLanguageChangeForThisORAllMediaAccessories:v5 indexPath:v6];
  }
}

uint64_t __125__HUAccessorySettingsSiriRecognitionLanguageViewController__presentAlertConfirmingLanguageChangeForAllHomeMembers_indexPath___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _clearSpinner];
}

- (void)_presentAlertConfirmingLanguageChangeForThisORAllMediaAccessories:(id)a3 indexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _HULocalizedStringWithDefaultValue(@"HUSiriLanguageChange_AllHomePods_Confirmation_Title", @"HUSiriLanguageChange_AllHomePods_Confirmation_Title", 1);
  objc_super v9 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  id v10 = [v9 home];
  uint64_t v11 = objc_msgSend(v10, "hf_siriEndPointAccessories");
  uint64_t v12 = [v11 count];

  if (v12)
  {
    uint64_t v13 = _HULocalizedStringWithDefaultValue(@"HUSiriLanguageChange_AllHomePods_Confirmation_Title_Accessory", @"HUSiriLanguageChange_AllHomePods_Confirmation_Title_Accessory", 1);

    uint64_t v8 = (void *)v13;
  }
  v47 = v8;
  v48 = v7;
  BOOL v14 = [(UITableViewController *)self hu_actionSheetWithTitle:0 message:v8 indexPath:v7];
  v15 = (void *)MEMORY[0x1E4F42720];
  unint64_t v16 = _HULocalizedStringWithDefaultValue(@"HUSiriLanguageChange_AllHomePods_Confirmation_Button_Title", @"HUSiriLanguageChange_AllHomePods_Confirmation_Button_Title", 1);
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __136__HUAccessorySettingsSiriRecognitionLanguageViewController__presentAlertConfirmingLanguageChangeForThisORAllMediaAccessories_indexPath___block_invoke;
  v52[3] = &unk_1E6389708;
  v52[4] = self;
  id v17 = v6;
  id v53 = v17;
  uint64_t v18 = [v15 actionWithTitle:v16 style:0 handler:v52];
  [v14 addAction:v18];

  objc_opt_class();
  __int16 v19 = [(HUItemTableViewController *)self itemManager];
  id v20 = [v19 groupItem];
  if (objc_opt_isKindOfClass()) {
    id v21 = v20;
  }
  else {
    id v21 = 0;
  }
  id v22 = v21;

  if (v22)
  {
    v23 = [MEMORY[0x1E4F691A0] sharedDispatcher];
    id v24 = [v23 home];
    id v25 = [v22 accessoryIdentifier];
    v26 = objc_msgSend(v24, "hf_accessoryWithIdentifier:", v25);

    v27 = [v26 mediaProfile];
    v28 = objc_msgSend(v27, "hf_displayName");
    v29 = 0;
  }
  else
  {
    v26 = [(HUItemTableViewController *)self itemManager];
    v27 = [v26 groupItem];
    v29 = [v27 homeKitSettingsVendor];
    v28 = 0;
  }

  v36 = [v29 homeKitObject];
  if (!v28)
  {
    objc_opt_class();
    objc_opt_isKindOfClass();
    objc_opt_class();
    id v37 = v36;
    if (objc_opt_isKindOfClass()) {
      v38 = v37;
    }
    else {
      v38 = 0;
    }
    id v39 = v38;

    v28 = objc_msgSend(v39, "hf_displayName");
  }
  v40 = HULocalizedStringWithFormat(@"HUSiriLanguageChange_ThisHomePod_Confirmation_Button_Title", @"%@", v30, v31, v32, v33, v34, v35, (uint64_t)v28);
  v41 = (void *)MEMORY[0x1E4F42720];
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __136__HUAccessorySettingsSiriRecognitionLanguageViewController__presentAlertConfirmingLanguageChangeForThisORAllMediaAccessories_indexPath___block_invoke_2;
  v50[3] = &unk_1E6389708;
  v50[4] = self;
  id v51 = v17;
  id v42 = v17;
  v43 = [v41 actionWithTitle:v40 style:0 handler:v50];
  [v14 addAction:v43];

  v44 = (void *)MEMORY[0x1E4F42720];
  v45 = _HULocalizedStringWithDefaultValue(@"HUSiriLanguageChange_TurnOff_VoiceID_Cancel_Button_Title", @"HUSiriLanguageChange_TurnOff_VoiceID_Cancel_Button_Title", 1);
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __136__HUAccessorySettingsSiriRecognitionLanguageViewController__presentAlertConfirmingLanguageChangeForThisORAllMediaAccessories_indexPath___block_invoke_3;
  v49[3] = &unk_1E6385188;
  v49[4] = self;
  v46 = [v44 actionWithTitle:v45 style:1 handler:v49];
  [v14 addAction:v46];

  [(HUAccessorySettingsSiriRecognitionLanguageViewController *)self presentViewController:v14 animated:1 completion:0];
}

uint64_t __136__HUAccessorySettingsSiriRecognitionLanguageViewController__presentAlertConfirmingLanguageChangeForThisORAllMediaAccessories_indexPath___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _turnOffVoiceIDAndChangeSiriLanguageForAllMediaAccessories:*(void *)(a1 + 40)];
}

uint64_t __136__HUAccessorySettingsSiriRecognitionLanguageViewController__presentAlertConfirmingLanguageChangeForThisORAllMediaAccessories_indexPath___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _changeSiriLanguageOnlyForThisMediaAccessory:*(void *)(a1 + 40) turnOffVoiceID:0];
}

uint64_t __136__HUAccessorySettingsSiriRecognitionLanguageViewController__presentAlertConfirmingLanguageChangeForThisORAllMediaAccessories_indexPath___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _clearSpinner];
}

- (void)_attemptToFixVoiceRecognitionOnboardingFailures:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F4E538] sharedPreferences];
  id v7 = [v6 languageCode];

  id v8 = objc_alloc(MEMORY[0x1E4F69710]);
  objc_super v9 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  id v10 = [v9 home];
  uint64_t v11 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  uint64_t v12 = [v11 home];
  uint64_t v13 = [v12 currentUser];
  BOOL v14 = (void *)[v8 initWithHome:v10 user:v13 nameStyle:0];

  if ([v14 hasDismissedIdentifyVoiceReminderBanner])
  {
    v15 = +[HUHomeFeatureOnboardingUtilities fetchSupportedVoiceRecognitionLanguages];
    if ([v15 containsObject:v5]
      && [v5 isEqualToString:v7]
      && ([v14 isIdentifyVoiceEnabled] & 1) == 0)
    {
      uint64_t v21 = MEMORY[0x1E4F143A8];
      uint64_t v22 = 3221225472;
      v23 = __108__HUAccessorySettingsSiriRecognitionLanguageViewController__attemptToFixVoiceRecognitionOnboardingFailures___block_invoke;
      id v24 = &unk_1E6387070;
      id v25 = self;
      id v26 = v7;
      unint64_t v16 = _Block_copy(&v21);
      id v17 = [(HUAccessorySettingsSiriRecognitionLanguageViewController *)self _allMediaAccessories];
      if (objc_msgSend(v17, "na_all:", v16))
      {
        uint64_t v18 = HFLogForCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v19 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412546;
          v28 = self;
          __int16 v29 = 2112;
          uint64_t v30 = v19;
          _os_log_impl(&dword_1BE345000, v18, OS_LOG_TYPE_DEFAULT, "%@:%@: User may be trying to fix Voice Recognition, enabling Reminder Banner", buf, 0x16u);
        }
        id v20 = (id)[v14 setDismissIdentifyVoiceReminderBanner:0];
      }
    }
  }
}

uint64_t __108__HUAccessorySettingsSiriRecognitionLanguageViewController__attemptToFixVoiceRecognitionOnboardingFailures___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = [a2 mediaProfile];
  id v4 = [*(id *)(a1 + 32) _siriLanguageOptionForMediaProfile:v3];
  id v5 = [v4 recognitionLanguage];
  uint64_t v6 = [v5 isEqualToString:*(void *)(a1 + 40)];

  return v6;
}

- (void)_turnOffVoiceIDForTargetLanguageOption:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4F4E538] sharedPreferences];
  id v7 = [v6 languageCode];

  objc_opt_class();
  id v8 = v5;
  if (objc_opt_isKindOfClass()) {
    objc_super v9 = v8;
  }
  else {
    objc_super v9 = 0;
  }
  id v10 = v9;

  uint64_t v11 = [v10 languageOption];
  uint64_t v12 = [v11 recognitionLanguage];
  char v13 = [v7 isEqualToString:v12];

  BOOL v14 = HFLogForCategory();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (v15)
    {
      unint64_t v16 = NSStringFromSelector(a2);
      id v17 = [v10 languageOption];
      uint64_t v18 = [v17 recognitionLanguage];
      int v29 = 138413058;
      uint64_t v30 = self;
      __int16 v31 = 2112;
      uint64_t v32 = v16;
      __int16 v33 = 2112;
      uint64_t v34 = v18;
      __int16 v35 = 2112;
      v36 = v7;
      _os_log_impl(&dword_1BE345000, v14, OS_LOG_TYPE_DEFAULT, "%@:%@: NOT Turning OFF Voice ID since Siri language changed to [%@] which is the same Siri language as this iOS Device [%@]", (uint8_t *)&v29, 0x2Au);
    }
  }
  else
  {
    if (v15)
    {
      __int16 v19 = NSStringFromSelector(a2);
      id v20 = [v10 languageOption];
      uint64_t v21 = [v20 recognitionLanguage];
      int v29 = 138413058;
      uint64_t v30 = self;
      __int16 v31 = 2112;
      uint64_t v32 = v19;
      __int16 v33 = 2112;
      uint64_t v34 = v21;
      __int16 v35 = 2112;
      v36 = v7;
      _os_log_impl(&dword_1BE345000, v14, OS_LOG_TYPE_DEFAULT, "%@:%@: Turning OFF Voice ID since Siri language changed to [%@] which is NOT the same Siri language as this iOS Device [%@]", (uint8_t *)&v29, 0x2Au);
    }
    id v22 = objc_alloc(MEMORY[0x1E4F69710]);
    v23 = [MEMORY[0x1E4F691A0] sharedDispatcher];
    id v24 = [v23 home];
    id v25 = [MEMORY[0x1E4F691A0] sharedDispatcher];
    id v26 = [v25 home];
    v27 = [v26 currentUser];
    BOOL v14 = [v22 initWithHome:v24 user:v27 nameStyle:0];

    id v28 = (id)[v14 setEnableIdentifyVoice:0];
  }
}

- (void)_changeSiriLanguageOnlyForThisMediaAccessory:(id)a3 turnOffVoiceID:(BOOL)a4
{
  id v7 = a3;
  id v8 = [(HUItemTableViewController *)self itemManager];
  objc_super v9 = [v8 updateSelectionWithOptionItem:v7];

  id v10 = (id)[v9 addFailureBlock:&__block_literal_global_78];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __120__HUAccessorySettingsSiriRecognitionLanguageViewController__changeSiriLanguageOnlyForThisMediaAccessory_turnOffVoiceID___block_invoke_2;
  v13[3] = &unk_1E6389730;
  BOOL v16 = a4;
  id v14 = v7;
  SEL v15 = a2;
  v13[4] = self;
  id v11 = v7;
  id v12 = (id)[v9 addSuccessBlock:v13];
}

void __120__HUAccessorySettingsSiriRecognitionLanguageViewController__changeSiriLanguageOnlyForThisMediaAccessory_turnOffVoiceID___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  int v3 = objc_msgSend(v2, "na_isCancelledError");
  id v4 = [MEMORY[0x1E4F69110] sharedHandler];
  id v5 = v4;
  if (v3) {
    [v4 logError:v2 operationDescription:@"Updating siri recognition language"];
  }
  else {
    [v4 handleError:v2];
  }
}

uint64_t __120__HUAccessorySettingsSiriRecognitionLanguageViewController__changeSiriLanguageOnlyForThisMediaAccessory_turnOffVoiceID___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _clearSpinner];
  uint64_t result = [*(id *)(a1 + 32) _isAnyMediaAccessoryOnSupportedVoiceRecognitionLanguage];
  int v3 = result;
  if (*(unsigned char *)(a1 + 56) || (result & 1) == 0)
  {
    id v4 = HFLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = NSStringFromSelector(*(SEL *)(a1 + 48));
      int v7 = *(unsigned __int8 *)(a1 + 56);
      int v8 = 138413058;
      uint64_t v9 = v5;
      __int16 v10 = 2112;
      id v11 = v6;
      __int16 v12 = 1024;
      int v13 = v7;
      __int16 v14 = 1024;
      int v15 = v3;
      _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@: Turning OFF Voice ID because turnOffVoiceID = [%d] and anyMediaAccessoriesOnSupportedVoiceRecognitionLanguage = [%d]", (uint8_t *)&v8, 0x22u);
    }
    return [*(id *)(a1 + 32) _turnOffVoiceIDForTargetLanguageOption:*(void *)(a1 + 40)];
  }
  return result;
}

- (BOOL)_isAnyMediaAccessoryOnSupportedVoiceRecognitionLanguage
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = [(HUAccessorySettingsSiriRecognitionLanguageViewController *)self _allMediaAccessories];
  uint64_t v5 = +[HUHomeFeatureOnboardingUtilities fetchSupportedVoiceRecognitionLanguages];
  uint64_t v6 = [MEMORY[0x1E4F4E538] sharedPreferences];
  int v7 = [v6 languageCode];

  if (v5)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __115__HUAccessorySettingsSiriRecognitionLanguageViewController__isAnyMediaAccessoryOnSupportedVoiceRecognitionLanguage__block_invoke;
    v16[3] = &unk_1E6389758;
    v16[4] = self;
    id v8 = v7;
    id v17 = v8;
    id v18 = v5;
    LODWORD(v9) = objc_msgSend(v4, "na_any:", v16);
    __int16 v10 = HFLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = NSStringFromSelector(a2);
      __int16 v12 = (void *)v11;
      int v13 = @"No Media Accessories";
      *(_DWORD *)buf = 138413058;
      id v20 = self;
      __int16 v21 = 2112;
      if (v9) {
        int v13 = @"At least one Media Accessory";
      }
      uint64_t v22 = v11;
      __int16 v23 = 2112;
      id v24 = v13;
      __int16 v25 = 2112;
      id v26 = v8;
      _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "%@:%@: %@ in this Home support the voice recognition language and matches the iPhone language [%@]", buf, 0x2Au);
    }
  }
  else
  {
    uint64_t v9 = HFLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v14 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      id v20 = self;
      __int16 v21 = 2112;
      uint64_t v22 = (uint64_t)v14;
      _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "%@:%@:  returning NO, because supported voice recognition languages could not be found ", buf, 0x16u);
    }
    LOBYTE(v9) = 0;
  }

  return (char)v9;
}

uint64_t __115__HUAccessorySettingsSiriRecognitionLanguageViewController__isAnyMediaAccessoryOnSupportedVoiceRecognitionLanguage__block_invoke(uint64_t a1, void *a2)
{
  int v3 = [a2 mediaProfile];
  id v4 = [*(id *)(a1 + 32) _siriLanguageOptionForMediaProfile:v3];
  uint64_t v5 = *(void **)(a1 + 40);
  uint64_t v6 = [v4 recognitionLanguage];
  LODWORD(v5) = [v5 isEqualToString:v6];

  if (v5)
  {
    int v7 = *(void **)(a1 + 48);
    id v8 = [v4 recognitionLanguage];
    uint64_t v9 = [v7 containsObject:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (void)_clearSpinner
{
}

- (void)_turnOffVoiceIDAndChangeSiriLanguageForAllMediaAccessories:(id)a3
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(HUAccessorySettingsSiriRecognitionLanguageViewController *)self _turnOffVoiceIDForTargetLanguageOption:v4];
  val = self;
  uint64_t v5 = [(HUAccessorySettingsSiriRecognitionLanguageViewController *)self _allMediaAccessories];
  objc_opt_class();
  id v6 = v4;
  if (objc_opt_isKindOfClass()) {
    int v7 = v6;
  }
  else {
    int v7 = 0;
  }
  id v8 = v7;
  v66 = v6;

  v56 = v8;
  uint64_t v9 = [v8 languageOption];
  v59 = [v9 recognitionLanguage];

  v58 = [MEMORY[0x1E4F1CA48] array];
  objc_opt_class();
  __int16 v10 = [(HUItemTableViewController *)val itemManager];
  uint64_t v11 = [v10 mediaProfileContainer];
  if (objc_opt_isKindOfClass()) {
    __int16 v12 = v11;
  }
  else {
    __int16 v12 = 0;
  }
  id v68 = v12;

  objc_opt_class();
  int v13 = [(HUItemTableViewController *)val itemManager];
  __int16 v14 = [v13 groupItem];
  if (objc_opt_isKindOfClass()) {
    int v15 = v14;
  }
  else {
    int v15 = 0;
  }
  id v16 = v15;

  v57 = v16;
  if (v16)
  {
    id v17 = [MEMORY[0x1E4F691A0] sharedDispatcher];
    id v18 = [v17 home];
    __int16 v19 = [v57 accessoryIdentifier];
    id v20 = objc_msgSend(v18, "hf_accessoryWithIdentifier:", v19);

    id v63 = [v20 mediaProfile];
  }
  else
  {
    objc_opt_class();
    id v20 = [(HUItemTableViewController *)val itemManager];
    __int16 v21 = [v20 mediaProfileContainer];
    if (objc_opt_isKindOfClass()) {
      uint64_t v22 = v21;
    }
    else {
      uint64_t v22 = 0;
    }
    id v63 = v22;
  }
  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id obj = v5;
  uint64_t v67 = [obj countByEnumeratingWithState:&v79 objects:v91 count:16];
  if (v67)
  {
    uint64_t v65 = *(void *)v80;
    uint64_t v64 = *MEMORY[0x1E4F67FC0];
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v80 != v65) {
          objc_enumerationMutation(obj);
        }
        id v24 = *(void **)(*((void *)&v79 + 1) + 8 * v23);
        __int16 v25 = [v24 mediaProfile];
        id v26 = [v24 home];
        uint64_t v27 = objc_msgSend(v26, "hf_mediaSystemForAccessory:", v24);

        if (v27) {
          objc_msgSend(v27, "hf_settingsAdapterManager");
        }
        else {
        v70 = objc_msgSend(v25, "hf_settingsAdapterManager");
        }
        id v28 = [v70 adapterForIdentifier:v64];
        objc_opt_class();
        id v29 = v28;
        if (objc_opt_isKindOfClass()) {
          uint64_t v30 = v29;
        }
        else {
          uint64_t v30 = 0;
        }
        id v69 = v30;

        objc_opt_class();
        id v31 = v66;
        if (objc_opt_isKindOfClass()) {
          uint64_t v32 = v31;
        }
        else {
          uint64_t v32 = 0;
        }
        id v33 = v32;

        if (v68)
        {
          uint64_t v34 = [v68 accessories];
          v77[0] = MEMORY[0x1E4F143A8];
          v77[1] = 3221225472;
          v77[2] = __119__HUAccessorySettingsSiriRecognitionLanguageViewController__turnOffVoiceIDAndChangeSiriLanguageForAllMediaAccessories___block_invoke;
          v77[3] = &unk_1E63869C8;
          id v78 = v25;
          char v35 = objc_msgSend(v34, "na_any:", v77);

          if (v35) {
            goto LABEL_44;
          }
        }
        else if (v63 && ([v63 isEqual:v25] & 1) != 0)
        {
          goto LABEL_44;
        }
        v36 = HFLogForCategory();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          NSStringFromSelector(a2);
          uint64_t v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          v84 = val;
          __int16 v85 = 2112;
          v86 = v37;
          __int16 v87 = 2112;
          v88 = v59;
          __int16 v89 = 2112;
          v90 = v25;
          _os_log_impl(&dword_1BE345000, v36, OS_LOG_TYPE_DEFAULT, "%@:%@: Changing Siri language to [%@] for [%@]", buf, 0x2Au);
        }
        v38 = [v33 languageOption];
        if (v38 && objc_msgSend(v25, "hf_isReachable"))
        {
          id v39 = [v24 mediaProfile];
          v40 = objc_msgSend(v39, "hf_siriLanguageOptionsManager");
          v41 = [v24 uniqueIdentifier];
          id v42 = [v40 updateSelectedLanguageOption:v38 accessoryIdentifier:v41];

          if (!v42)
          {
            id v42 = [v69 updateSelectedLanguageOption:v38];
          }
          v74[0] = MEMORY[0x1E4F143A8];
          v74[1] = 3221225472;
          v74[2] = __119__HUAccessorySettingsSiriRecognitionLanguageViewController__turnOffVoiceIDAndChangeSiriLanguageForAllMediaAccessories___block_invoke_73;
          v74[3] = &unk_1E6386978;
          SEL v76 = a2;
          id v75 = v25;
          id v43 = (id)[v42 addFailureBlock:v74];
          [v58 addObject:v42];
        }
        else
        {
          id v42 = HFLogForCategory();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(a2);
            v44 = (HUAccessorySettingsSiriRecognitionLanguageViewController *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v25, "hf_isReachable")) {
              v45 = &stru_1F18F92B8;
            }
            else {
              v45 = @"un";
            }
            v46 = objc_msgSend(v25, "hf_displayName");
            *(_DWORD *)buf = 138412802;
            v84 = v44;
            __int16 v85 = 2112;
            v86 = v45;
            __int16 v87 = 2112;
            v88 = v46;
            _os_log_error_impl(&dword_1BE345000, v42, OS_LOG_TYPE_ERROR, "%@ Controller is %@reachable. Language change failed for [%@]", buf, 0x20u);
          }
        }

LABEL_44:
        ++v23;
      }
      while (v67 != v23);
      uint64_t v47 = [obj countByEnumeratingWithState:&v79 objects:v91 count:16];
      uint64_t v67 = v47;
    }
    while (v47);
  }

  v48 = [(HUItemTableViewController *)val itemManager];
  v49 = [v48 updateSelectionWithOptionItem:v66];

  id v50 = (id)[v49 addFailureBlock:&__block_literal_global_82_0];
  [v58 addObject:v49];
  id v51 = [MEMORY[0x1E4F7A0D8] chainFutures:v58];
  [(HUAccessorySettingsSiriRecognitionLanguageViewController *)val setChangeLanguageFuture:v51];

  v52 = (void *)[v58 count];
  objc_initWeak((id *)buf, val);
  id v53 = [(HUAccessorySettingsSiriRecognitionLanguageViewController *)val changeLanguageFuture];
  v71[0] = MEMORY[0x1E4F143A8];
  v71[1] = 3221225472;
  v71[2] = __119__HUAccessorySettingsSiriRecognitionLanguageViewController__turnOffVoiceIDAndChangeSiriLanguageForAllMediaAccessories___block_invoke_2;
  v71[3] = &unk_1E6389780;
  objc_copyWeak(v73, (id *)buf);
  v73[1] = (id)a2;
  id v54 = v59;
  id v72 = v54;
  v73[2] = v52;
  id v55 = (id)[v53 addCompletionBlock:v71];

  objc_destroyWeak(v73);
  objc_destroyWeak((id *)buf);
}

uint64_t __119__HUAccessorySettingsSiriRecognitionLanguageViewController__turnOffVoiceIDAndChangeSiriLanguageForAllMediaAccessories___block_invoke(uint64_t a1, void *a2)
{
  int v3 = [a2 mediaProfile];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

void __119__HUAccessorySettingsSiriRecognitionLanguageViewController__turnOffVoiceIDAndChangeSiriLanguageForAllMediaAccessories___block_invoke_73(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "hf_displayName");
    int v5 = 138412546;
    id v6 = v3;
    __int16 v7 = 2112;
    id v8 = v4;
    _os_log_error_impl(&dword_1BE345000, v2, OS_LOG_TYPE_ERROR, "%@ Language change failed for %@", (uint8_t *)&v5, 0x16u);
  }
}

void __119__HUAccessorySettingsSiriRecognitionLanguageViewController__turnOffVoiceIDAndChangeSiriLanguageForAllMediaAccessories___block_invoke_80(uint64_t a1, void *a2)
{
  id v2 = a2;
  int v3 = objc_msgSend(v2, "na_isCancelledError");
  uint64_t v4 = [MEMORY[0x1E4F69110] sharedHandler];
  id v5 = v4;
  if (v3) {
    [v4 logError:v2 operationDescription:@"Updating siri recognition language"];
  }
  else {
    [v4 handleError:v2];
  }
}

void __119__HUAccessorySettingsSiriRecognitionLanguageViewController__turnOffVoiceIDAndChangeSiriLanguageForAllMediaAccessories___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _clearSpinner];
  int v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = NSStringFromSelector(*(SEL *)(a1 + 48));
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 56);
    int v7 = 138413058;
    id v8 = WeakRetained;
    __int16 v9 = 2112;
    __int16 v10 = v4;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    __int16 v13 = 2048;
    uint64_t v14 = v6;
    _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "%@:%@: Finished changing Siri language to [%@] for %lu Media Accessories", (uint8_t *)&v7, 0x2Au);
  }
}

- (id)_allMediaAccessories
{
  id v2 = objc_opt_new();
  int v3 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  uint64_t v4 = [v3 home];
  uint64_t v5 = objc_msgSend(v4, "hf_homePods");
  objc_msgSend(v2, "na_safeAddObjectsFromArray:", v5);

  uint64_t v6 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  int v7 = [v6 home];
  id v8 = objc_msgSend(v7, "hf_siriEndPointAccessories");
  objc_msgSend(v2, "na_safeAddObjectsFromArray:", v8);

  __int16 v9 = (void *)[v2 copy];

  return v9;
}

- (id)_siriLanguageOptionForMediaProfile:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  uint64_t v5 = [v4 homeManager];
  if ([v5 hasOptedToHH2])
  {
  }
  else
  {
    uint64_t v6 = [v3 accessory];
    int v7 = objc_msgSend(v6, "hf_isSiriEndpoint");

    if (!v7)
    {
      id v8 = objc_msgSend(v3, "hf_settingsAdapterManager");
      __int16 v10 = [v8 adapterForIdentifier:*MEMORY[0x1E4F67FC0]];
      objc_opt_class();
      id v11 = v10;
      if (objc_opt_isKindOfClass()) {
        uint64_t v12 = v11;
      }
      else {
        uint64_t v12 = 0;
      }
      id v13 = v12;

      __int16 v9 = [v13 selectedLanguageOption];

      goto LABEL_9;
    }
  }
  id v8 = objc_msgSend(v3, "hf_siriLanguageOptionsManager");
  __int16 v9 = [v8 selectedLanguageOption];
LABEL_9:

  return v9;
}

- (NAFuture)changeLanguageFuture
{
  return self->_changeLanguageFuture;
}

- (void)setChangeLanguageFuture:(id)a3
{
}

- (int64_t)selectedLanguageIndex
{
  return self->_selectedLanguageIndex;
}

- (void).cxx_destruct
{
}

@end