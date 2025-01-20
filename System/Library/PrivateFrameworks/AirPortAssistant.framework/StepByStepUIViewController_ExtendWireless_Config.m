@interface StepByStepUIViewController_ExtendWireless_Config
- (BOOL)shouldChangeTextField:(id)a3 atIndexPath:(id)a4 forTextIndex:(unint64_t)a5 toString:(id)a6;
- (NSString)personalizedBaseName;
- (StepByStepUIViewController_ExtendWireless_Config)initWithNibName:(id)a3 bundle:(id)a4;
- (id)devicePickerLabel;
- (id)deviceTableLabel;
- (void)primaryActionSelected:(BOOL)a3;
- (void)selectedDeviceUpdated;
- (void)setPersonalizedBaseName:(id)a3;
- (void)setupAndShowEditableBaseStationName;
- (void)setupDevices;
- (void)setupHeaderAndFooter;
- (void)updateNavigationButtons;
- (void)validateAndUpdateNextButton;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation StepByStepUIViewController_ExtendWireless_Config

- (StepByStepUIViewController_ExtendWireless_Config)initWithNibName:(id)a3 bundle:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)StepByStepUIViewController_ExtendWireless_Config;
  result = [(StepByStepUIViewController_DevicePicker *)&v5 initWithNibName:a3 bundle:a4];
  if (result)
  {
    result->connectionType = &off_268147F78[0]->isa;
    result->unlocalizedStatusString = (NSString *)@"StepByStepStatus_ExtendWireless%@";
    result->isReallyJoin = 0;
  }
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = objc_msgSend_inParamDict(self, a2, a3);
  v7 = objc_msgSend_valueForKey_(v5, v6, @"kSBSKey_SelectorChoice");
  if (v7 && objc_msgSend_integerValue(v7, v8, v9) == 212)
  {
    self->isReallyJoin = 1;
    self->unlocalizedStatusString = (NSString *)@"PrimarySetupRecommendation_Join.Specific";
  }
  v10.receiver = self;
  v10.super_class = (Class)StepByStepUIViewController_ExtendWireless_Config;
  [(StepByStepUIViewController_DevicePicker *)&v10 viewWillAppear:v3];
}

- (void)setupAndShowEditableBaseStationName
{
  v4 = objc_msgSend_tableManager(self, a2, v2);
  if (objc_msgSend_indexOfSectionWithIdentifier_(v4, v5, @"WiFiName") == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = objc_msgSend_array(MEMORY[0x263EFF980], v6, v7);
    v11 = objc_msgSend_inParamDict(self, v9, v10);
    CFStringRef v13 = (const __CFString *)objc_msgSend_objectForKey_(v11, v12, @"kSBSKey_TargetBase");
    unsigned int v21 = sub_22685AB94(v13, v14, v15, v16, v17, v18, v19, v20);
    v24 = objc_msgSend_inParamDict(self, v22, v23);
    uint64_t v26 = objc_msgSend_objectForKey_(v24, v25, @"kSBSKey_TargetBase");
    int v34 = sub_22685AB68(v26, v27, v28, v29, v30, v31, v32, v33);
    v35 = sub_22685E04C(v21, v34);
    objc_msgSend_setPersonalizedBaseName_(self, v36, (uint64_t)v35);
    v39 = objc_msgSend_personalizedBaseName(self, v37, v38);
    if (!objc_msgSend_length(v39, v40, v41))
    {
      v44 = sub_22685E098(v21, v34);
      objc_msgSend_setPersonalizedBaseName_(self, v45, (uint64_t)v44);
    }
    v46 = objc_msgSend_outResultsDict(self, v42, v43);
    uint64_t v49 = objc_msgSend_personalizedBaseName(self, v47, v48);
    objc_msgSend_setValue_forKey_(v46, v50, v49, @"kSBSKey_BaseName");
    v53 = objc_msgSend_tableManager(self, v51, v52);
    uint64_t v54 = sub_22685D62C(@"CustomBaseName", qword_268148378);
    uint64_t v57 = objc_msgSend_personalizedBaseName(self, v55, v56);
    uint64_t v58 = sub_22685D62C(@"CustomBaseNamePlaceholder", qword_268148378);
    uint64_t isSecure_keyboardType_withTag = objc_msgSend_createRowStyleBasicEditableWithImage_labelText_currentValue_placeholderText_isSecure_keyboardType_withTag_(v53, v59, 0, v54, v57, v58, 0, 0, 1937329773);
    objc_msgSend_addObject_(v8, v61, isSecure_keyboardType_withTag);
    v64 = objc_msgSend_tableManager(self, v62, v63);
    uint64_t v67 = objc_msgSend_dictionaryWithObjectsAndKeys_(MEMORY[0x263EFF9A0], v65, (uint64_t)v8, @"sectionRows", @"WiFiName", @"identifier", 0);
    objc_msgSend_addSectionInfo_(v64, v66, v67);
  }
}

- (void)setupHeaderAndFooter
{
  v4 = (void *)MEMORY[0x263EFF8C0];
  uint64_t v5 = objc_msgSend_justTextContainerView(self, a2, v2);
  uint64_t v8 = objc_msgSend_topoView(self, v6, v7);
  uint64_t v10 = objc_msgSend_arrayWithObjects_(v4, v9, v5, v8, 0);
  CFStringRef v13 = objc_msgSend_parentController(self, v11, v12);
  uint64_t v16 = objc_msgSend_tableHeaderContainerView(self, v14, v15);
  objc_msgSend_replaceSubviewsInView_newSubviews_withAnimation_(v13, v17, v16, v10, 1);
  uint64_t v20 = objc_msgSend_tableHeaderContainerView(self, v18, v19);
  uint64_t v23 = objc_msgSend_tableView(self, v21, v22);
  objc_msgSend_setTableHeaderView_(v23, v24, v20);

  MEMORY[0x270F9A6D0](self, sel_setupAndShowEditableBaseStationName, v25);
}

- (void)primaryActionSelected:(BOOL)a3
{
  if (a3)
  {
    MEMORY[0x270F9A6D0](self, sel_setupAndShowEditableBaseStationName, a3);
  }
  else
  {
    v4 = objc_msgSend_tableManager(self, a2, a3);
    objc_msgSend_deleteSectionWithIdentifier_(v4, v5, @"WiFiName");
  }
}

- (void)selectedDeviceUpdated
{
  uint64_t v3 = objc_msgSend_nameForNetworkOrDevice_(StepByStepUtilities, a2, (uint64_t)self->super._selectedDevice);
  uint64_t ProductLocalizedStringWithFormat = objc_msgSend_getProductLocalizedStringWithFormat_(self, v4, (uint64_t)self->unlocalizedStatusString);
  justTextLabel = self->super.super.justTextLabel;
  uint64_t v9 = (char *)objc_msgSend_justTextContainerView(self, v7, v8);
  valid = objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(NSString, v10, ProductLocalizedStringWithFormat, @"%@", 0, v3);
  sub_22684E878(justTextLabel, v9, valid);
  uint64_t v14 = objc_msgSend_tableHeaderContainerView(self, v12, v13);
  objc_msgSend_readjustSubviewsInContainer_(AssistantUIViewController, v15, v14);
  uint64_t v18 = objc_msgSend_tableHeaderContainerView(self, v16, v17);
  unsigned int v21 = objc_msgSend_tableView(self, v19, v20);

  objc_msgSend_setTableHeaderView_(v21, v22, v18);
}

- (void)updateNavigationButtons
{
}

- (id)deviceTableLabel
{
  if (self->isReallyJoin) {
    uint64_t v2 = @"StepByStepStatus_ExtendWireless_Config.DeviceToJoin";
  }
  else {
    uint64_t v2 = @"StepByStepStatus_ExtendWireless_Config.DeviceToExtend";
  }
  return (id)sub_22685D62C((uint64_t)v2, qword_268148378);
}

- (id)devicePickerLabel
{
  return (id)sub_22685D62C(@"StepByStepStatus_ExtendWiredNetworkChoice.ChooseABaseStation", qword_268148378);
}

- (void)setupDevices
{
  v4 = (void *)MEMORY[0x263EFF980];
  uint64_t v5 = objc_msgSend_inParamDict(self, a2, v2);
  uint64_t v7 = objc_msgSend_objectForKey_(v5, v6, @"kSBSKey_BrowseRecordList");
  uint64_t v9 = objc_msgSend_arrayWithArray_(v4, v8, v7);
  if (v9)
  {
    uint64_t v11 = objc_msgSend_sortedArrayUsingSelector_(v9, v10, (uint64_t)sel_ssidAndBaseNameLocalizedCaseInsensitiveCompare_);
    objc_msgSend_setSortedDevices_(self, v12, v11);
    self->super._selectedDevice = self->super._sourceBase;
    connectionType = self->connectionType;
    MEMORY[0x270F9A6D0](self, sel_setConnectionMedium_, connectionType);
  }
}

- (void)validateAndUpdateNextButton
{
  v4 = objc_msgSend_outResultsDict(self, a2, v2);
  if (objc_msgSend_valueForKey_(v4, v5, @"kSBSKey_SourceBase"))
  {
    uint64_t v8 = objc_msgSend_outResultsDict(self, v6, v7);
    uint64_t v10 = objc_msgSend_valueForKey_(v8, v9, @"kSBSKey_BaseName");
    BOOL v13 = objc_msgSend_length(v10, v11, v12) != 0;
    uint64_t v16 = objc_msgSend_navigationItem(self, v14, v15);
    uint64_t v19 = objc_msgSend_rightBarButtonItem(v16, v17, v18);
    objc_msgSend_setEnabled_(v19, v20, v13);
  }
}

- (BOOL)shouldChangeTextField:(id)a3 atIndexPath:(id)a4 forTextIndex:(unint64_t)a5 toString:(id)a6
{
  uint64_t v8 = objc_msgSend_outResultsDict(self, a2, (uint64_t)a3, a4, a5);
  objc_msgSend_setValue_forKey_(v8, v9, (uint64_t)a6, @"kSBSKey_BaseName");
  objc_msgSend_validateAndUpdateNextButton(self, v10, v11);
  return 1;
}

- (NSString)personalizedBaseName
{
  return self->personalizedBaseName;
}

- (void)setPersonalizedBaseName:(id)a3
{
}

@end