@interface StepByStepUIViewController_Join_Config
- (BOOL)shouldChangeTextField:(id)a3 atIndexPath:(id)a4 forTextIndex:(unint64_t)a5 toString:(id)a6;
- (BOOL)shouldEnableNextButton;
- (BOOL)showMoreOptions;
- (NSString)personalizedBaseName;
- (StepByStepUIViewController_Join_Config)initWithNibName:(id)a3 bundle:(id)a4;
- (id)devicePickerLabel;
- (id)deviceTableLabel;
- (void)loadView;
- (void)prepareParams;
- (void)primaryActionSelected:(BOOL)a3;
- (void)selectedDeviceUpdated;
- (void)setPersonalizedBaseName:(id)a3;
- (void)setupDevices;
- (void)setupEditableBaseStationName;
- (void)setupHeaderAndFooter;
- (void)setupTable;
- (void)syncTopoUIForTarget:(id)a3 andSource:(id)a4 andNetwork:(id)a5 connectionType:(id)a6;
- (void)updateNavigationButtons;
- (void)validateAndUpdateNextButton;
@end

@implementation StepByStepUIViewController_Join_Config

- (StepByStepUIViewController_Join_Config)initWithNibName:(id)a3 bundle:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)StepByStepUIViewController_Join_Config;
  v4 = [(StepByStepUIViewController_DevicePicker *)&v8 initWithNibName:a3 bundle:a4];
  v6 = v4;
  if (v4)
  {
    v4->super._showSingleBaseTopo = 1;
    objc_msgSend_setDelegate_(v4, v5, (uint64_t)v4);
  }
  return v6;
}

- (void)loadView
{
  v10.receiver = self;
  v10.super_class = (Class)StepByStepUIViewController_Join_Config;
  [(StepByStepUIViewController_DevicePicker *)&v10 loadView];
  v5 = objc_msgSend_inParamDict(self, v3, v4);
  v7 = objc_msgSend_objectForKey_(v5, v6, @"kSBSKey_Mode");
  if (objc_msgSend_integerValue(v7, v8, v9) == 2) {
    self->super.showFullList = 0;
  }
}

- (BOOL)shouldChangeTextField:(id)a3 atIndexPath:(id)a4 forTextIndex:(unint64_t)a5 toString:(id)a6
{
  uint64_t v16 = 0;
  uint64_t v9 = objc_msgSend_tableManager(self, a2, (uint64_t)a3, a4, a5);
  objc_msgSend_tagOfCellAtIndexPath_tag_(v9, v10, (uint64_t)a4, &v16);
  if (v16 == 1937329773)
  {
    v13 = objc_msgSend_outResultsDict(self, v11, v12);
    objc_msgSend_setValue_forKey_(v13, v14, (uint64_t)a6, @"kSBSKey_BaseName");
  }
  return 1;
}

- (void)setupEditableBaseStationName
{
  uint64_t v3 = sub_22684EA54(1937329773, a2);
  v6 = objc_msgSend_array(MEMORY[0x263EFF980], v4, v5);
  uint64_t v9 = objc_msgSend_personalizedBaseName(self, v7, v8);
  if (!objc_msgSend_length(v9, v10, v11))
  {
    v14 = sub_22685E04C(self->productID, self->deviceKind);
    objc_msgSend_setPersonalizedBaseName_(self, v15, (uint64_t)v14);
  }
  uint64_t v16 = objc_msgSend_personalizedBaseName(self, v12, v13);
  if (!objc_msgSend_length(v16, v17, v18))
  {
    v21 = sub_22685E098(self->productID, self->deviceKind);
    objc_msgSend_setPersonalizedBaseName_(self, v22, (uint64_t)v21);
  }
  v23 = objc_msgSend_outResultsDict(self, v19, v20);
  uint64_t v26 = objc_msgSend_personalizedBaseName(self, v24, v25);
  objc_msgSend_setValue_forKey_(v23, v27, v26, @"kSBSKey_BaseName");
  char v29 = objc_msgSend_scanInfoSupportsSpruce_(WiFiUtils, v28, (uint64_t)self->super.super.super._inParamDict);
  self->supportsSpruce = v29;
  if ((v29 & 1) == 0)
  {
    int deviceKind = self->deviceKind;
    if ((deviceKind - 2) >= 2)
    {
      if (deviceKind == 4) {
        v33 = @"CustomBaseName.MFiAccessory";
      }
      else {
        v33 = @"CustomBaseName";
      }
    }
    else
    {
      uint64_t v3 = sub_22684EA54(1635077710, v30);
      v33 = @"CustomBaseName.Airplay";
    }
    v34 = objc_msgSend_tableManager(self, v30, v31);
    uint64_t v35 = sub_22685D62C((uint64_t)v33, qword_268148378);
    uint64_t v38 = objc_msgSend_personalizedBaseName(self, v36, v37);
    uint64_t v39 = sub_22685D62C(@"CustomBaseNamePlaceholder", qword_268148378);
    isSecure_keyboardType_withTag = objc_msgSend_createRowStyleBasicEditableWithImage_labelText_currentValue_placeholderText_isSecure_keyboardType_withTag_(v34, v40, 0, v35, v38, v39, 0, 0, 1937329773);
    uint64_t v43 = (uint64_t)isSecure_keyboardType_withTag;
    if (v3) {
      objc_msgSend_setObject_forKey_(isSecure_keyboardType_withTag, v42, v3, @"nsFormatter");
    }
    objc_msgSend_addObject_(v6, v42, v43);
    v46 = objc_msgSend_tableManager(self, v44, v45);
    uint64_t v49 = objc_msgSend_dictionaryWithObjectsAndKeys_(MEMORY[0x263EFF9A0], v47, (uint64_t)v6, @"sectionRows", @"WiFiName", @"identifier", 0);
    objc_msgSend_addSectionInfo_(v46, v48, v49);
  }
}

- (void)setupHeaderAndFooter
{
  uint64_t v4 = (void *)MEMORY[0x263EFF980];
  uint64_t v5 = objc_msgSend_justTextContainerView(self, a2, v2);
  uint64_t v9 = objc_msgSend_arrayWithObject_(v4, v6, v5);
  if ((self->deviceKind - 2) >= 3)
  {
    uint64_t v10 = objc_msgSend_topoView(self, v7, v8);
    objc_msgSend_addObject_(v9, v11, v10);
  }
  uint64_t v12 = objc_msgSend_parentController(self, v7, v8);
  uint64_t v15 = objc_msgSend_tableHeaderContainerView(self, v13, v14);
  objc_msgSend_replaceSubviewsInView_newSubviews_withAnimation_(v12, v16, v15, v9, 1);
  uint64_t v19 = objc_msgSend_tableHeaderContainerView(self, v17, v18);
  v22 = objc_msgSend_tableView(self, v20, v21);
  objc_msgSend_setTableHeaderView_(v22, v23, v19);
  justTextLabel = self->super.super.justTextLabel;
  v27 = (char *)objc_msgSend_justTextContainerView(self, v25, v26);
  ProductLocalizedStringWithFormat = objc_msgSend_getProductLocalizedStringWithFormat_(self, v28, @"PrimarySetupRecommendation_Join%@");
  sub_22684E878(justTextLabel, v27, ProductLocalizedStringWithFormat);
  uint64_t v32 = objc_msgSend_tableHeaderContainerView(self, v30, v31);
  objc_msgSend_readjustSubviewsInContainer_(AssistantUIViewController, v33, v32);
  uint64_t v36 = objc_msgSend_tableHeaderContainerView(self, v34, v35);
  uint64_t v39 = objc_msgSend_tableView(self, v37, v38);
  objc_msgSend_setTableHeaderView_(v39, v40, v36);

  objc_msgSend_setupTable(self, v41, v42);
}

- (void)primaryActionSelected:(BOOL)a3
{
  objc_msgSend_setupTable(self, a2, a3);

  objc_msgSend_validateAndUpdateNextButton(self, v4, v5);
}

- (void)prepareParams
{
  uint64_t v4 = objc_msgSend_inParamDict(self, a2, v2);
  uint64_t v6 = objc_msgSend_objectForKey_(v4, v5, @"kSBSKey_NetworkPassword");
  if (v6) {
    objc_msgSend_setValue_forKey_(self->super.super.super._outResultsDict, v7, v6, @"kSBSKey_NetworkPassword");
  }
  uint64_t v9 = objc_msgSend_inParamDict(self, v7, v8);
  uint64_t v11 = objc_msgSend_objectForKey_(v9, v10, @"kSBSKey_Mode");
  if (objc_msgSend_integerValue(v11, v12, v13) == 2) {
    objc_msgSend_setLeftNavigationButton_enable_hide_(self, v14, @"kCancel", 1, 0);
  }
  uint64_t v16 = objc_msgSend_inParamDict(self, v14, v15);
  CFStringRef v18 = (const __CFString *)objc_msgSend_objectForKey_(v16, v17, @"kSBSKey_TargetBase");
  if (v18)
  {
    uint64_t v26 = (uint64_t)v18;
    self->productID = sub_22685AB94(v18, (uint64_t)v19, v20, v21, v22, v23, v24, v25);
    self->int deviceKind = sub_22685AB68(v26, v27, v28, v29, v30, v31, v32, v33);
  }
  else
  {
    v34 = objc_msgSend_inParamDict(self, v19, v20);
    uint64_t v36 = objc_msgSend_objectForKey_(v34, v35, @"kSBSKey_TargetNetwork");
    self->productID = objc_msgSend_scanInfoAppleProductID_(WiFiUtils, v37, v36);
    int v38 = sub_22685AAD0(v36);
    self->int deviceKind = v38;
    if ((v38 - 3) <= 1)
    {
      uint64_t v41 = objc_msgSend_scanInfoFriendlyName_(WiFiUtils, v39, v36);
      objc_msgSend_setPersonalizedBaseName_(self, v40, v41);
    }
  }
}

- (void)updateNavigationButtons
{
}

- (void)setupDevices
{
  uint64_t v4 = (void *)MEMORY[0x263EFF980];
  uint64_t v5 = objc_msgSend_inParamDict(self, a2, v2);
  uint64_t v7 = objc_msgSend_objectForKey_(v5, v6, @"kSBSKey_NetworkScanRecordList");
  uint64_t v9 = objc_msgSend_arrayWithArray_(v4, v8, v7);
  if (v9)
  {
    uint64_t v11 = objc_msgSend_sortedArrayUsingSelector_(v9, v10, (uint64_t)sel_ssidLocalizedCaseInsensitiveCompare_);
    objc_msgSend_setSortedDevices_(self, v12, v11);
    self->super._selectedDevice = self->super._sourceNetwork;
    uint64_t v13 = off_268147F78[0];
    MEMORY[0x270F9A6D0](self, sel_setConnectionMedium_, v13);
  }
}

- (id)deviceTableLabel
{
  return (id)sub_22685D62C(@"StepByStepStatus_Join.ChosenNetwork", qword_268148378);
}

- (id)devicePickerLabel
{
  return (id)sub_22685D62C(@"StepByStepStatus_Join.ChooseANetwork", qword_268148378);
}

- (void)selectedDeviceUpdated
{
  uint64_t v3 = objc_msgSend_nameForNetworkOrDevice_(StepByStepUtilities, a2, (uint64_t)self->super._selectedDevice);
  uint64_t ProductLocalizedStringWithFormat = objc_msgSend_getProductLocalizedStringWithFormat_(self, v4, @"PrimarySetupRecommendation_Join.Specific%@");
  justTextLabel = self->super.super.justTextLabel;
  uint64_t v9 = (char *)objc_msgSend_justTextContainerView(self, v7, v8);
  valid = objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(NSString, v10, ProductLocalizedStringWithFormat, @"%@", 0, v3);
  sub_22684E878(justTextLabel, v9, valid);
  uint64_t v14 = objc_msgSend_tableHeaderContainerView(self, v12, v13);
  objc_msgSend_readjustSubviewsInContainer_(AssistantUIViewController, v15, v14);
  uint64_t v18 = objc_msgSend_tableHeaderContainerView(self, v16, v17);
  uint64_t v21 = objc_msgSend_tableView(self, v19, v20);
  objc_msgSend_setTableHeaderView_(v21, v22, v18);
  uint64_t shouldEnableNextButton = objc_msgSend_shouldEnableNextButton(self, v23, v24);

  objc_msgSend_setRightNavigationButton_enable_hide_(self, v25, @"kNext", shouldEnableNextButton, 0);
}

- (BOOL)showMoreOptions
{
  return (self->deviceKind - 5) < 0xFFFFFFFD;
}

- (NSString)personalizedBaseName
{
  return self->personalizedBaseName;
}

- (void)setPersonalizedBaseName:(id)a3
{
}

- (BOOL)shouldEnableNextButton
{
  actionController = self->super.actionController;
  if (actionController && !objc_msgSend_isPrimaryRecommendation(actionController, a2, v2)) {
    goto LABEL_5;
  }
  uint64_t v5 = objc_msgSend_nameForNetworkOrDevice_(StepByStepUtilities, a2, (uint64_t)self->super._selectedDevice);
  uint64_t v8 = objc_msgSend_length(v5, v6, v7);
  if (v8)
  {
    if (self->supportsSpruce)
    {
LABEL_5:
      LOBYTE(v8) = 1;
      return v8;
    }
    uint64_t v11 = objc_msgSend_outResultsDict(self, v9, v10);
    uint64_t v13 = objc_msgSend_valueForKey_(v11, v12, @"kSBSKey_BaseName");
    uint64_t v16 = (const char *)objc_msgSend_UTF8String(v13, v14, v15);
    LODWORD(v8) = sub_22685C500(v16);
    if (!v8) {
      return v8;
    }
    int deviceKind = self->deviceKind;
    if ((deviceKind - 2) > 2)
    {
      v40 = objc_msgSend_tableManager(self, v17, v18);
      ValueForFirstItemOfType_inCellWithTag = objc_msgSend_getValueForFirstItemOfType_inCellWithTag_(v40, v41, @"editTextView", 1113673825);
      v44 = objc_msgSend_tableManager(self, v42, v43);
      uint64_t v46 = objc_msgSend_getValueForFirstItemOfType_inCellWithTag_(v44, v45, @"editTextView", 1113673814);
      uint64_t v49 = objc_msgSend_tableManager(self, v47, v48);
      LODWORD(v8) = objc_msgSend_verifyStr1_forTag1_matchesStr2_forTag2_(v49, v50, (uint64_t)ValueForFirstItemOfType_inCellWithTag, 1113673825, v46, 1113673814);
      if (v8)
      {
        v53 = (const char *)objc_msgSend_UTF8String(ValueForFirstItemOfType_inCellWithTag, v51, v52);
        LODWORD(v8) = sub_22685C544(v53);
        if (v8)
        {
          p_outResultsDict = (void **)&self->super.super.super._outResultsDict;
          goto LABEL_19;
        }
      }
    }
    else
    {
      if (deviceKind == 4) {
        goto LABEL_5;
      }
      uint64_t v20 = objc_msgSend_tableManager(self, v17, v18);
      ValueForFirstItemOfType_inCellWithTag = objc_msgSend_getValueForFirstItemOfType_inCellWithTag_(v20, v21, @"editTextView", 1097420897);
      uint64_t v25 = objc_msgSend_tableManager(self, v23, v24);
      uint64_t v27 = objc_msgSend_getValueForFirstItemOfType_inCellWithTag_(v25, v26, @"editTextView", 1097420886);
      uint64_t v30 = objc_msgSend_tableManager(self, v28, v29);
      LODWORD(v8) = objc_msgSend_verifyStr1_forTag1_matchesStr2_forTag2_(v30, v31, (uint64_t)ValueForFirstItemOfType_inCellWithTag, 1097420897, v27, 1097420886);
      if (!v8) {
        return v8;
      }
      if (!objc_msgSend_length(ValueForFirstItemOfType_inCellWithTag, v32, v33) && !objc_msgSend_length(v27, v34, v35)) {
        goto LABEL_5;
      }
      uint64_t v36 = (const char *)objc_msgSend_UTF8String(ValueForFirstItemOfType_inCellWithTag, v34, v35);
      LODWORD(v8) = sub_22685C588(v36);
      if (v8)
      {
        LODWORD(v8) = sub_22685C544(v36);
        if (v8)
        {
          p_outResultsDict = (void **)&self->super.super.super._outResultsDict;
          objc_msgSend_setValue_forKey_(*p_outResultsDict, v37, (uint64_t)ValueForFirstItemOfType_inCellWithTag, @"kSBSKey_AirPlayPassword");
LABEL_19:
          objc_msgSend_setValue_forKey_(*p_outResultsDict, v39, (uint64_t)ValueForFirstItemOfType_inCellWithTag, @"kSBSKey_BasePassword");
          goto LABEL_5;
        }
      }
    }
  }
  return v8;
}

- (void)validateAndUpdateNextButton
{
  uint64_t shouldEnableNextButton = objc_msgSend_shouldEnableNextButton(self, a2, v2);

  objc_msgSend_setRightNavigationButton_enable_hide_(self, v4, @"kNext", shouldEnableNextButton, 0);
}

- (void)setupTable
{
  actionController = self->super.actionController;
  if (actionController && !objc_msgSend_isPrimaryRecommendation(actionController, a2, v2))
  {
    v90 = objc_msgSend_tableManager(self, a2, v2);
    objc_msgSend_deleteSectionWithIdentifier_(v90, v91, @"kBasePasswordIdentifier");
    v94 = objc_msgSend_tableManager(self, v92, v93);
    objc_msgSend_deleteSectionWithIdentifier_(v94, v95, @"WiFiName");
    v98 = objc_msgSend_tableManager(self, v96, v97);
    objc_msgSend_deleteSectionWithIdentifier_(v98, v99, @"kirPlayPasswordIdentifier");
  }
  else
  {
    uint64_t v5 = objc_msgSend_tableManager(self, a2, v2);
    if (objc_msgSend_indexOfSectionWithIdentifier_(v5, v6, @"WiFiName") == 0x7FFFFFFFFFFFFFFFLL) {
      objc_msgSend_setupEditableBaseStationName(self, v7, v8);
    }
    if ((self->deviceKind - 2) >= 3)
    {
      uint64_t v9 = objc_msgSend_tableManager(self, v7, v8);
      if (objc_msgSend_indexOfSectionWithIdentifier_(v9, v10, @"kBasePasswordIdentifier") == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v11 = objc_msgSend_objectForKey_(self->super.super.super._outResultsDict, v7, @"kSBSKey_BasePassword");
        uint64_t v14 = objc_msgSend_array(MEMORY[0x263EFF980], v12, v13);
        uint64_t v17 = objc_msgSend_tableManager(self, v15, v16);
        uint64_t v18 = sub_22685D62C(@"PasswordLabel", qword_268148378);
        uint64_t v19 = sub_22685D62C(@"CreatePasswordPlaceholder", qword_268148378);
        isSecure_keyboardType_withTag = objc_msgSend_createRowStyleBasicEditableWithImage_labelText_currentValue_placeholderText_isSecure_keyboardType_withTag_(v17, v20, 0, v18, v11, v19, 1, 1, 1113673825);
        uint64_t v25 = sub_22684EA54(1651721296, v22);
        if (v25) {
          objc_msgSend_setObject_forKey_(isSecure_keyboardType_withTag, v23, v25, @"nsFormatter");
        }
        uint64_t v26 = objc_msgSend_tableManager(self, v23, v24);
        objc_msgSend_setNewRow_verifierAccessoryType_(v26, v27, (uint64_t)isSecure_keyboardType_withTag, 0);
        objc_msgSend_addObject_(v14, v28, (uint64_t)isSecure_keyboardType_withTag);
        uint64_t v31 = objc_msgSend_tableManager(self, v29, v30);
        uint64_t v32 = sub_22685D62C(@"VerifyLabel", qword_268148378);
        uint64_t v33 = sub_22685D62C(@"VerifyPlaceholder", qword_268148378);
        uint64_t v35 = objc_msgSend_createRowStyleBasicEditableWithImage_labelText_currentValue_placeholderText_isSecure_keyboardType_withTag_(v31, v34, 0, v32, v11, v33, 1, 1, 1113673814);
        uint64_t v38 = (uint64_t)v35;
        if (v25) {
          objc_msgSend_setObject_forKey_(v35, v36, v25, @"nsFormatter");
        }
        uint64_t v39 = objc_msgSend_tableManager(self, v36, v37);
        objc_msgSend_setNewRow_verifierAccessoryType_(v39, v40, v38, 0);
        objc_msgSend_addObject_(v14, v41, v38);
        uint64_t v42 = sub_22685D62C(@"AdminPasswordSectionTitle", qword_268148378);
        uint64_t v45 = objc_msgSend_tableManager(self, v43, v44);
        uint64_t v47 = objc_msgSend_dictionaryWithObjectsAndKeys_(MEMORY[0x263EFF9A0], v46, (uint64_t)v14, @"sectionRows", v42, @"header", @"kBasePasswordIdentifier", @"identifier", 0);
        objc_msgSend_addSectionInfo_(v45, v48, v47);
      }
    }
    if ((self->deviceKind & 0xFFFFFFFE) == 2)
    {
      uint64_t v49 = objc_msgSend_tableManager(self, v7, v8);
      if (objc_msgSend_indexOfSectionWithIdentifier_(v49, v50, @"kirPlayPasswordIdentifier") == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v52 = objc_msgSend_objectForKey_(self->super.super.super._outResultsDict, v51, @"kSBSKey_AirPlayPassword");
        v55 = objc_msgSend_array(MEMORY[0x263EFF980], v53, v54);
        v58 = objc_msgSend_tableManager(self, v56, v57);
        uint64_t v59 = sub_22685D62C(@"PasswordLabel", qword_268148378);
        uint64_t v60 = sub_22685D62C(@"AirPlayPasswordPlaceholder", qword_268148378);
        v62 = objc_msgSend_createRowStyleBasicEditableWithImage_labelText_currentValue_placeholderText_isSecure_keyboardType_withTag_(v58, v61, 0, v59, v52, v60, 1, 1, 1097420897);
        uint64_t v66 = sub_22684EA54(1651720528, v63);
        if (v66) {
          objc_msgSend_setObject_forKey_(v62, v64, v66, @"nsFormatter");
        }
        v67 = objc_msgSend_tableManager(self, v64, v65);
        objc_msgSend_setNewRow_verifierAccessoryType_(v67, v68, (uint64_t)v62, 0);
        objc_msgSend_addObject_(v55, v69, (uint64_t)v62);
        v72 = objc_msgSend_tableManager(self, v70, v71);
        uint64_t v73 = sub_22685D62C(@"VerifyLabel", qword_268148378);
        uint64_t v74 = sub_22685D62C(@"AirPlayVerifyPlaceholder", qword_268148378);
        v76 = objc_msgSend_createRowStyleBasicEditableWithImage_labelText_currentValue_placeholderText_isSecure_keyboardType_withTag_(v72, v75, 0, v73, v52, v74, 1, 1, 1097420886);
        uint64_t v79 = (uint64_t)v76;
        if (v66) {
          objc_msgSend_setObject_forKey_(v76, v77, v66, @"nsFormatter");
        }
        v80 = objc_msgSend_tableManager(self, v77, v78);
        objc_msgSend_setNewRow_verifierAccessoryType_(v80, v81, v79, 0);
        objc_msgSend_addObject_(v55, v82, v79);
        uint64_t v83 = sub_22685D62C(@"AirPlayPasswordSectionTitle", qword_268148378);
        v86 = objc_msgSend_tableManager(self, v84, v85);
        uint64_t v89 = objc_msgSend_dictionaryWithObjectsAndKeys_(MEMORY[0x263EFF9A0], v87, (uint64_t)v55, @"sectionRows", v83, @"header", @"kirPlayPasswordIdentifier", @"identifier", 0);
        objc_msgSend_addSectionInfo_(v86, v88, v89);
      }
    }
  }
}

- (void)syncTopoUIForTarget:(id)a3 andSource:(id)a4 andNetwork:(id)a5 connectionType:(id)a6
{
  if (a4)
  {
    uint64_t v9 = NSNumber;
    unsigned int v10 = objc_msgSend_scanInfoAppleProductID_(WiFiUtils, a2, (uint64_t)a4);
    uint64_t v12 = objc_msgSend_numberWithInteger_(v9, v11, v10);
    if (v12)
    {
      uint64_t v14 = (void *)v12;
      uint64_t v15 = NSNumber;
      unsigned int v16 = sub_22685AAD0((uint64_t)a3);
      uint64_t v18 = objc_msgSend_numberWithInteger_(v15, v17, v16);
      LODWORD(v15) = objc_msgSend_integerValue(v14, v19, v20);
      uint64_t v78 = (uint64_t)v18;
      int v23 = objc_msgSend_integerValue(v18, v21, v22);
      uint64_t v24 = (uint64_t)sub_22685E098(v15, v23);
    }
    else
    {
      uint64_t v25 = objc_msgSend_objectForKey_(a4, v13, @"txt");
      uint64_t v14 = objc_msgSend_objectForKey_(v25, v26, @"syAP");
      uint64_t v27 = NSNumber;
      unsigned int v35 = sub_22685AB68((uint64_t)a4, v28, v29, v30, v31, v32, v33, v34);
      uint64_t v78 = objc_msgSend_numberWithInteger_(v27, v36, v35);
      uint64_t v24 = objc_msgSend_objectForKey_(a4, v37, @"name");
    }
    uint64_t v77 = v24;
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t v77 = 0;
    uint64_t v78 = 0;
  }
  uint64_t v38 = sub_22685E098(self->productID, self->deviceKind);
  uint64_t v41 = objc_msgSend_parentController(self, v39, v40);
  uint64_t v44 = objc_msgSend__assistantUIController(v41, v42, v43);
  uint64_t v47 = objc_msgSend_topoView(self, v45, v46);
  uint64_t v50 = objc_msgSend_layer(v47, v48, v49);
  uint64_t v53 = objc_msgSend_topoLayout(self, v51, v52);
  uint64_t v56 = objc_msgSend_topoView(self, v54, v55);
  uint64_t v58 = objc_msgSend_numberWithInteger_(NSNumber, v57, self->productID);
  uint64_t v60 = objc_msgSend_numberWithInteger_(NSNumber, v59, self->deviceKind);
  uint64_t v62 = objc_msgSend_modifyTopoUIInLayer_withLayout_andOwningView_targetProductID_targetDeviceKind_targetName_targetWiFiName_sourceProductID_sourceDeviceKind_sourceName_sourceWiFiName_connectionType_(v44, v61, v50, v53, v56, v58, v60, v38, &stru_26DA6BE88, v14, v78, v77, &stru_26DA6BE88, a6);
  objc_msgSend_setTopoLayout_(self, v63, v62);
  v64 = NSString;
  uint64_t v65 = sub_22685D7D0(self->productID, self->deviceKind, 0);
  uint64_t v66 = sub_22685D62C(@"Password", qword_268148378);
  uint64_t v68 = objc_msgSend_stringWithFormat_(v64, v67, @"%@ %@", v65, v66);
  uint64_t v71 = objc_msgSend_tableManager(self, v69, v70);
  objc_msgSend_updateHeader_forSectionWithIdentifier_(v71, v72, v68, @"kBasePasswordIdentifier");
  uint64_t v73 = sub_22685D62C(@"BasePasswordExplanation", qword_268148378);
  uint64_t v76 = objc_msgSend_tableManager(self, v74, v75);

  MEMORY[0x270F9A6D0](v76, sel_updateFooter_forSectionWithIdentifier_, v73);
}

@end