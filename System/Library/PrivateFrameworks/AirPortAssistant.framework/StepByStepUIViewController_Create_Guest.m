@interface StepByStepUIViewController_Create_Guest
- (BOOL)guestNetworkEnabled;
- (BOOL)shouldChangeTextField:(id)a3 atIndexPath:(id)a4 forTextIndex:(unint64_t)a5 toString:(id)a6;
- (BOOL)validateAndSetValues;
- (NSString)wifiName;
- (NSString)wifiPassword;
- (int)guestNetSecMode;
- (void)addGuestNetworkIsEnabledSection;
- (void)addGuestNetworkPasswordSection;
- (void)loadView;
- (void)setGuestNetSecMode:(int)a3;
- (void)setGuestNetworkEnabled:(BOOL)a3;
- (void)setWifiName:(id)a3;
- (void)setWifiPassword:(id)a3;
- (void)setupInitialTableHeaderConfiguration;
- (void)setupTable;
- (void)switchTouchedInCellAtIndexPath:(id)a3 forSwitchIndex:(unint64_t)a4 isOn:(BOOL)a5;
- (void)updateTable;
- (void)validateAndUpdateNextButton;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation StepByStepUIViewController_Create_Guest

- (void)loadView
{
  v40.receiver = self;
  v40.super_class = (Class)StepByStepUIViewController_Create_Guest;
  [(StepByStepUIViewController *)&v40 loadView];
  objc_msgSend_setGuestNetworkEnabled_(self, v3, 0);
  objc_msgSend_setGuestNetSecMode_(self, v4, 1);
  outResultsDict = self->super.super._outResultsDict;
  v6 = NSNumber;
  uint64_t v9 = objc_msgSend_guestNetworkEnabled(self, v7, v8);
  uint64_t v11 = objc_msgSend_numberWithBool_(v6, v10, v9);
  objc_msgSend_setValue_forKey_(outResultsDict, v12, v11, @"kSBSKey_GuestNetwork_On");
  objc_msgSend_setValue_forKey_(self->super.super._outResultsDict, v13, (uint64_t)&stru_26DA6BE88, @"kSBSKey_GuestNetwork_Name");
  v14 = self->super.super._outResultsDict;
  v15 = NSNumber;
  unsigned int v18 = objc_msgSend_guestNetSecMode(self, v16, v17);
  uint64_t v20 = objc_msgSend_numberWithInteger_(v15, v19, v18);
  objc_msgSend_setValue_forKey_(v14, v21, v20, @"kSBSKey_GuestNetwork_Security");
  objc_msgSend_setValue_forKey_(self->super.super._outResultsDict, v22, (uint64_t)&stru_26DA6BE88, @"kSBSKey_GuestNetwork_Password");
  objc_msgSend_setRightNavigationButton_enable_hide_(self, v23, @"kNext", 0, 0);
  justTextLabel = self->super.justTextLabel;
  justTextContainerView = (char *)self->super.justTextContainerView;
  ProductLocalizedStringWithFormat = objc_msgSend_getProductLocalizedStringWithFormat_(self, v26, @"StepByStepChoice_Create_Guest.GuestNetworkInfo%@");
  sub_22684E878(justTextLabel, justTextContainerView, ProductLocalizedStringWithFormat);
  uint64_t v30 = objc_msgSend_tableHeaderContainerView(self, v28, v29);
  objc_msgSend_readjustSubviewsInContainer_(AssistantUIViewController, v31, v30);
  uint64_t v34 = objc_msgSend_tableHeaderContainerView(self, v32, v33);
  v37 = objc_msgSend_tableView(self, v35, v36);
  objc_msgSend_setTableHeaderView_(v37, v38, v34);
  objc_msgSend_setDelegate_(self, v39, (uint64_t)self);
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = objc_msgSend_valueForKey_(self->super.super._outResultsDict, a2, @"kSBSKey_GuestNetwork_On");
  uint64_t v8 = objc_msgSend_BOOLValue(v5, v6, v7);
  objc_msgSend_setGuestNetworkEnabled_(self, v9, v8);
  uint64_t v11 = objc_msgSend_valueForKey_(self->super.super._outResultsDict, v10, @"kSBSKey_GuestNetwork_Name");
  if (v11) {
    objc_msgSend_setWifiName_(self, v12, v11);
  }
  else {
    objc_msgSend_setWifiName_(self, v12, (uint64_t)&stru_26DA6BE88);
  }
  v14 = objc_msgSend_valueForKey_(self->super.super._outResultsDict, v13, @"kSBSKey_GuestNetwork_Security");
  uint64_t v17 = objc_msgSend_integerValue(v14, v15, v16);
  objc_msgSend_setGuestNetSecMode_(self, v18, v17);
  uint64_t v20 = objc_msgSend_valueForKey_(self->super.super._outResultsDict, v19, @"kSBSKey_GuestNetwork_Password");
  if (v20) {
    objc_msgSend_setWifiPassword_(self, v21, v20);
  }
  else {
    objc_msgSend_setWifiPassword_(self, v21, (uint64_t)&stru_26DA6BE88);
  }
  v24 = objc_msgSend_inParamDict(self, v22, v23);
  uint64_t v26 = objc_msgSend_objectForKey_(v24, v25, @"kSBSKey_TargetBase");
  objc_msgSend_syncTopoUIForTarget_andSource_andNetwork_connectionType_(self, v27, v26, 0, 0, 0);
  objc_msgSend_setupTable(self, v28, v29);
  objc_msgSend_updateTable(self, v30, v31);
  objc_msgSend_validateAndUpdateNextButton(self, v32, v33);
  v34.receiver = self;
  v34.super_class = (Class)StepByStepUIViewController_Create_Guest;
  [(StepByStepUIViewController *)&v34 viewWillAppear:v3];
}

- (void)setupInitialTableHeaderConfiguration
{
  v4 = (void *)MEMORY[0x263EFF8C0];
  uint64_t v5 = objc_msgSend_justTextContainerView(self, a2, v2);
  uint64_t v8 = objc_msgSend_topoView(self, v6, v7);
  uint64_t v10 = objc_msgSend_arrayWithObjects_(v4, v9, v5, v8, 0);
  v13 = objc_msgSend_parentController(self, v11, v12);
  uint64_t v16 = objc_msgSend_tableHeaderContainerView(self, v14, v15);
  objc_msgSend_replaceSubviewsInView_newSubviews_withAnimation_(v13, v17, v16, v10, 1);
  uint64_t v20 = objc_msgSend_tableHeaderContainerView(self, v18, v19);
  uint64_t v23 = objc_msgSend_tableView(self, v21, v22);

  objc_msgSend_setTableHeaderView_(v23, v24, v20);
}

- (BOOL)validateAndSetValues
{
  v4 = objc_msgSend_tableManager(self, a2, v2);
  ValueForFirstItemOfType_inCellWithTag = objc_msgSend_getValueForFirstItemOfType_inCellWithTag_(v4, v5, @"editTextView", 1196314221);
  uint64_t v9 = (const char *)objc_msgSend_UTF8String(ValueForFirstItemOfType_inCellWithTag, v7, v8);
  unsigned int v10 = sub_22685C484(v9);
  if (v10)
  {
    objc_msgSend_setWifiName_(self, v11, (uint64_t)ValueForFirstItemOfType_inCellWithTag);
    if (objc_msgSend_guestNetSecMode(self, v12, v13) != 7)
    {
LABEL_6:
      LOBYTE(v10) = 1;
      return v10;
    }
    uint64_t v16 = objc_msgSend_tableManager(self, v14, v15);
    unsigned int v18 = objc_msgSend_getValueForFirstItemOfType_inCellWithTag_(v16, v17, @"editTextView", 1196314743);
    v21 = objc_msgSend_tableManager(self, v19, v20);
    uint64_t v23 = objc_msgSend_getValueForFirstItemOfType_inCellWithTag_(v21, v22, @"editTextView", 1196314710);
    uint64_t v26 = objc_msgSend_tableManager(self, v24, v25);
    unsigned int v10 = objc_msgSend_verifyStr1_forTag1_matchesStr2_forTag2_(v26, v27, (uint64_t)v18, 1196314743, v23, 1196314710);
    if (v10)
    {
      uint64_t v30 = (const char *)objc_msgSend_UTF8String(v18, v28, v29);
      unsigned int v10 = sub_22685C4C8(v30);
      if (v10)
      {
        objc_msgSend_setWifiPassword_(self, v31, (uint64_t)v18);
        goto LABEL_6;
      }
    }
  }
  return v10;
}

- (void)switchTouchedInCellAtIndexPath:(id)a3 forSwitchIndex:(unint64_t)a4 isOn:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v15 = 0;
  uint64_t v8 = objc_msgSend_tableManager(self, a2, (uint64_t)a3, a4);
  if (objc_msgSend_tagOfCellAtIndexPath_tag_(v8, v9, (uint64_t)a3, &v15))
  {
    if (v15 == 1196314707)
    {
      if (v5) {
        objc_msgSend_setGuestNetSecMode_(self, v10, 7);
      }
      else {
        objc_msgSend_setGuestNetSecMode_(self, v10, 1);
      }
    }
    else
    {
      if (v15 != 1196315511) {
        return;
      }
      objc_msgSend_setGuestNetworkEnabled_(self, v10, v5);
    }
    objc_msgSend_updateTable(self, v11, v12);
    objc_msgSend_validateAndUpdateNextButton(self, v13, v14);
  }
}

- (BOOL)shouldChangeTextField:(id)a3 atIndexPath:(id)a4 forTextIndex:(unint64_t)a5 toString:(id)a6
{
  return 1;
}

- (NSString)wifiName
{
  return self->_wifiName;
}

- (void)setWifiName:(id)a3
{
}

- (NSString)wifiPassword
{
  return self->_wifiPassword;
}

- (void)setWifiPassword:(id)a3
{
}

- (BOOL)guestNetworkEnabled
{
  return self->_guestNetworkEnabled;
}

- (void)setGuestNetworkEnabled:(BOOL)a3
{
  self->_guestNetworkEnabled = a3;
}

- (int)guestNetSecMode
{
  return self->_guestNetSecMode;
}

- (void)setGuestNetSecMode:(int)a3
{
  self->_guestNetSecMode = a3;
}

- (void)setupTable
{
  v4 = objc_msgSend_tableManager(self, a2, v2);
  objc_msgSend_cleanTableViewForReuse(v4, v5, v6);
  uint64_t v9 = objc_msgSend_array(MEMORY[0x263EFF980], v7, v8);
  uint64_t v12 = objc_msgSend_tableManager(self, v10, v11);
  uint64_t v13 = sub_22685D62C(@"StepByStepChoice_Create_Guest.GuestNetSwitchLabel", qword_268148378);
  uint64_t v16 = objc_msgSend_guestNetworkEnabled(self, v14, v15);
  uint64_t v18 = objc_msgSend_createRowStyleBasicOnOffWithImage_labelText_isOn_withTag_(v12, v17, 0, v13, v16, 1196315511);
  objc_msgSend_addObject_(v9, v19, v18);
  uint64_t v22 = objc_msgSend_tableManager(self, v20, v21);
  uint64_t v24 = objc_msgSend_dictionaryWithObjectsAndKeys_(MEMORY[0x263EFF9A0], v23, (uint64_t)v9, @"sectionRows", @"GuestNetworkSwitch", @"identifier", 0);
  objc_msgSend_addSectionInfo_(v22, v25, v24);

  objc_msgSend_setupInitialTableHeaderConfiguration(self, v26, v27);
}

- (void)updateTable
{
  if (objc_msgSend_guestNetworkEnabled(self, a2, v2))
  {
    objc_msgSend_addGuestNetworkIsEnabledSection(self, v4, v5);
    if (objc_msgSend_guestNetSecMode(self, v6, v7) != 1)
    {
      MEMORY[0x270F9A6D0](self, sel_addGuestNetworkPasswordSection, v9);
      return;
    }
  }
  else
  {
    unsigned int v10 = objc_msgSend_tableManager(self, v4, v5);
    objc_msgSend_deleteSectionWithIdentifier_(v10, v11, @"GuestNetworkWiFiName");
    uint64_t v14 = objc_msgSend_tableManager(self, v12, v13);
    objc_msgSend_deleteSectionWithIdentifier_(v14, v15, @"GuestNetworkWPASwitch");
  }
  uint64_t v16 = objc_msgSend_tableManager(self, v8, v9);

  objc_msgSend_deleteSectionWithIdentifier_(v16, v17, @"GuestNetworkPassword");
}

- (void)addGuestNetworkIsEnabledSection
{
  v4 = objc_msgSend_tableManager(self, a2, v2);
  if (objc_msgSend_indexOfSectionWithIdentifier_(v4, v5, @"GuestNetworkWiFiName") == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = objc_msgSend_array(MEMORY[0x263EFF980], v6, v7);
    uint64_t v11 = objc_msgSend_tableManager(self, v9, v10);
    uint64_t v12 = sub_22685D62C(@"CustomWiFiName", qword_268148378);
    uint64_t v13 = sub_22685D62C(@"CustomWiFiNamePlaceholder", qword_268148378);
    isSecure_keyboardType_withTag = objc_msgSend_createRowStyleBasicEditableWithImage_labelText_currentValue_placeholderText_isSecure_keyboardType_withTag_(v11, v14, 0, v12, &stru_26DA6BE88, v13, 0, 0, 1196314221);
    uint64_t v17 = sub_22684EA54(1651722062, v16);
    if (v17) {
      objc_msgSend_setObject_forKey_(isSecure_keyboardType_withTag, v18, v17, @"nsFormatter");
    }
    objc_msgSend_addObject_(v8, v18, (uint64_t)isSecure_keyboardType_withTag);
    uint64_t v21 = objc_msgSend_tableManager(self, v19, v20);
    uint64_t v23 = objc_msgSend_dictionaryWithObjectsAndKeys_(MEMORY[0x263EFF9A0], v22, (uint64_t)v8, @"sectionRows", @"GuestNetworkWiFiName", @"identifier", 0);
    objc_msgSend_addSectionInfo_(v21, v24, v23);
  }
  uint64_t v25 = objc_msgSend_tableManager(self, v6, v7);
  if (objc_msgSend_indexOfSectionWithIdentifier_(v25, v26, @"GuestNetworkWPASwitch") == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v29 = objc_msgSend_array(MEMORY[0x263EFF980], v27, v28);
    v32 = objc_msgSend_tableManager(self, v30, v31);
    uint64_t v33 = sub_22685D62C(@"StepByStepChoice_Create_Guest.GuestNetWPASwitchLabel", qword_268148378);
    BOOL v36 = objc_msgSend_guestNetSecMode(self, v34, v35) != 1;
    uint64_t v38 = objc_msgSend_createRowStyleBasicOnOffWithImage_labelText_isOn_withTag_(v32, v37, 0, v33, v36, 1196314707);
    objc_msgSend_addObject_(v29, v39, v38);
    v42 = objc_msgSend_tableManager(self, v40, v41);
    uint64_t v45 = objc_msgSend_dictionaryWithObjectsAndKeys_(MEMORY[0x263EFF9A0], v43, (uint64_t)v29, @"sectionRows", @"GuestNetworkWPASwitch", @"identifier", 0);
    objc_msgSend_addSectionInfo_(v42, v44, v45);
  }
}

- (void)addGuestNetworkPasswordSection
{
  v4 = objc_msgSend_tableManager(self, a2, v2);
  if (objc_msgSend_indexOfSectionWithIdentifier_(v4, v5, @"GuestNetworkPassword") == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = objc_msgSend_array(MEMORY[0x263EFF980], v6, v7);
    uint64_t v11 = objc_msgSend_tableManager(self, v9, v10);
    uint64_t v12 = sub_22685D62C(@"PasswordLabel", qword_268148378);
    uint64_t v15 = objc_msgSend_wifiPassword(self, v13, v14);
    uint64_t v16 = sub_22685D62C(@"CreatePasswordPlaceholder", qword_268148378);
    isSecure_keyboardType_withTag = objc_msgSend_createRowStyleBasicEditableWithImage_labelText_currentValue_placeholderText_isSecure_keyboardType_withTag_(v11, v17, 0, v12, v15, v16, 1, 0, 1196314743);
    uint64_t v22 = sub_22684EA54(1651722064, v19);
    if (v22) {
      objc_msgSend_setObject_forKey_(isSecure_keyboardType_withTag, v20, v22, @"nsFormatter");
    }
    uint64_t v23 = objc_msgSend_tableManager(self, v20, v21);
    objc_msgSend_setNewRow_verifierAccessoryType_(v23, v24, (uint64_t)isSecure_keyboardType_withTag, 0);
    objc_msgSend_addObject_(v8, v25, (uint64_t)isSecure_keyboardType_withTag);
    uint64_t v28 = objc_msgSend_tableManager(self, v26, v27);
    uint64_t v29 = sub_22685D62C(@"VerifyLabel", qword_268148378);
    uint64_t v32 = objc_msgSend_wifiPassword(self, v30, v31);
    uint64_t v33 = sub_22685D62C(@"VerifyPlaceholder", qword_268148378);
    uint64_t v35 = objc_msgSend_createRowStyleBasicEditableWithImage_labelText_currentValue_placeholderText_isSecure_keyboardType_withTag_(v28, v34, 0, v29, v32, v33, 1, 0, 1196314710);
    uint64_t v38 = (uint64_t)v35;
    if (v22) {
      objc_msgSend_setObject_forKey_(v35, v36, v22, @"nsFormatter");
    }
    v39 = objc_msgSend_tableManager(self, v36, v37);
    objc_msgSend_setNewRow_verifierAccessoryType_(v39, v40, v38, 0);
    objc_msgSend_addObject_(v8, v41, v38);
    v44 = objc_msgSend_tableManager(self, v42, v43);
    uint64_t v45 = (void *)MEMORY[0x263EFF9A0];
    uint64_t v46 = sub_22685D62C(@"WiFiPasswordRequirement", qword_268148378);
    uint64_t v49 = objc_msgSend_dictionaryWithObjectsAndKeys_(v45, v47, (uint64_t)v8, @"sectionRows", v46, @"footer", @"GuestNetworkPassword", @"identifier", 0);
    objc_msgSend_addSectionInfo_(v44, v48, v49);
  }
}

- (void)validateAndUpdateNextButton
{
  outResultsDict = self->super.super._outResultsDict;
  uint64_t v5 = NSNumber;
  uint64_t v6 = objc_msgSend_guestNetworkEnabled(self, a2, v2);
  uint64_t v8 = objc_msgSend_numberWithBool_(v5, v7, v6);
  objc_msgSend_setValue_forKey_(outResultsDict, v9, v8, @"kSBSKey_GuestNetwork_On");
  if (!objc_msgSend_guestNetworkEnabled(self, v10, v11))
  {
LABEL_5:
    uint64_t v30 = 1;
    goto LABEL_7;
  }
  if (objc_msgSend_validateAndSetValues(self, v12, v13))
  {
    uint64_t v14 = self->super.super._outResultsDict;
    uint64_t v15 = objc_msgSend_wifiName(self, v12, v13);
    objc_msgSend_setValue_forKey_(v14, v16, v15, @"kSBSKey_GuestNetwork_Name");
    uint64_t v17 = self->super.super._outResultsDict;
    uint64_t v18 = NSNumber;
    unsigned int v21 = objc_msgSend_guestNetSecMode(self, v19, v20);
    uint64_t v23 = objc_msgSend_numberWithInteger_(v18, v22, v21);
    objc_msgSend_setValue_forKey_(v17, v24, v23, @"kSBSKey_GuestNetwork_Security");
    if (objc_msgSend_guestNetSecMode(self, v25, v26) != 1)
    {
      uint64_t v27 = self->super.super._outResultsDict;
      uint64_t v28 = objc_msgSend_wifiPassword(self, v12, v13);
      objc_msgSend_setValue_forKey_(v27, v29, v28, @"kSBSKey_GuestNetwork_Password");
    }
    goto LABEL_5;
  }
  uint64_t v30 = 0;
LABEL_7:
  uint64_t v31 = objc_msgSend_navigationItem(self, v12, v13);
  objc_super v34 = objc_msgSend_rightBarButtonItem(v31, v32, v33);

  objc_msgSend_setEnabled_(v34, v35, v30);
}

@end