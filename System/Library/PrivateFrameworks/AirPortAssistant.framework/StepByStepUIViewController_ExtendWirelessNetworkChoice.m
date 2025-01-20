@interface StepByStepUIViewController_ExtendWirelessNetworkChoice
- (BOOL)canBeExtendedWithDWDS;
- (id)devicePickerLabel;
- (id)deviceTableLabel;
- (void)addBrowsedRecords:(id)a3 toDestList:(id)a4;
- (void)selectedDeviceUpdated;
- (void)setupDevices;
- (void)setupHeaderAndFooter;
- (void)stepByStepUpdateProgress:(id)a3 forState:(int)a4;
- (void)touchInCellAtIndexPath:(id)a3;
- (void)updateNavigationButtons;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation StepByStepUIViewController_ExtendWirelessNetworkChoice

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7 = objc_msgSend_objectForKey_(self->super.super.super._outResultsDict, a2, @"kSBSKey_SelectorChoice");
  if (!v7)
  {
    v8 = objc_msgSend_inParamDict(self, v5, v6);
    v7 = objc_msgSend_objectForKey_(v8, v9, @"kSBSKey_SelectorChoice");
    if (!v7) {
      v7 = objc_msgSend_numberWithInteger_(NSNumber, v10, 211);
    }
    objc_msgSend_setObject_forKey_(self->super.super.super._outResultsDict, v10, (uint64_t)v7, @"kSBSKey_SelectorChoice");
  }
  *(_DWORD *)(&self->super.showFullList + 3) = objc_msgSend_integerValue(v7, v5, v6);
  sourceNetwork = self->super._sourceNetwork;
  if (sourceNetwork) {
    objc_msgSend_setObject_forKey_(self->super.super.super._outResultsDict, v11, (uint64_t)sourceNetwork, @"kSBSKey_SourceNetwork");
  }
  sourceBase = self->super._sourceBase;
  if (sourceBase) {
    objc_msgSend_setObject_forKey_(self->super.super.super._outResultsDict, v11, (uint64_t)sourceBase, @"kSBSKey_SourceBase");
  }
  v14.receiver = self;
  v14.super_class = (Class)StepByStepUIViewController_ExtendWirelessNetworkChoice;
  [(StepByStepUIViewController_DevicePicker *)&v14 viewWillAppear:v3];
}

- (void)setupHeaderAndFooter
{
  v4 = (void *)MEMORY[0x263EFF8C0];
  uint64_t v5 = objc_msgSend_justTextContainerView(self, a2, v2);
  uint64_t v8 = objc_msgSend_topoView(self, v6, v7);
  uint64_t v10 = objc_msgSend_arrayWithObjects_(v4, v9, v5, v8, 0);
  v13 = objc_msgSend_parentController(self, v11, v12);
  uint64_t v16 = objc_msgSend_tableHeaderContainerView(self, v14, v15);
  objc_msgSend_replaceSubviewsInView_newSubviews_withAnimation_(v13, v17, v16, v10, 1);
  uint64_t v20 = objc_msgSend_tableHeaderContainerView(self, v18, v19);
  v23 = objc_msgSend_tableView(self, v21, v22);

  objc_msgSend_setTableHeaderView_(v23, v24, v20);
}

- (void)selectedDeviceUpdated
{
  int canBeExtendedWithDWDS = objc_msgSend_canBeExtendedWithDWDS(self, a2, v2);
  if (canBeExtendedWithDWDS) {
    uint64_t v6 = @"StepByStepStatus_ExtendWireless%@";
  }
  else {
    uint64_t v6 = @"PrimarySetupRecommendation_Join.Specific%@";
  }
  if (canBeExtendedWithDWDS) {
    uint64_t v7 = 211;
  }
  else {
    uint64_t v7 = 212;
  }
  uint64_t ProductLocalizedStringWithFormat = objc_msgSend_getProductLocalizedStringWithFormat_(self, v5, (uint64_t)v6);
  outResultsDict = self->super.super.super._outResultsDict;
  uint64_t v11 = objc_msgSend_numberWithInteger_(NSNumber, v10, v7);
  objc_msgSend_setObject_forKey_(outResultsDict, v12, v11, @"kSBSKey_SelectorChoice");
  uint64_t v14 = objc_msgSend_nameForNetworkOrDevice_(StepByStepUtilities, v13, (uint64_t)self->super._selectedDevice);
  justTextLabel = self->super.super.justTextLabel;
  justTextContainerView = (char *)self->super.super.justTextContainerView;
  valid = objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(NSString, v17, ProductLocalizedStringWithFormat, @"%@", 0, v14);
  sub_22684E878(justTextLabel, justTextContainerView, valid);
  uint64_t v21 = objc_msgSend_tableHeaderContainerView(self, v19, v20);
  objc_msgSend_readjustSubviewsInContainer_(AssistantUIViewController, v22, v21);
  uint64_t v25 = objc_msgSend_tableHeaderContainerView(self, v23, v24);
  v28 = objc_msgSend_tableView(self, v26, v27);

  objc_msgSend_setTableHeaderView_(v28, v29, v25);
}

- (void)updateNavigationButtons
{
}

- (void)setupDevices
{
  v4 = (void *)MEMORY[0x263EFF980];
  uint64_t v5 = objc_msgSend_inParamDict(self, a2, v2);
  uint64_t v7 = objc_msgSend_objectForKey_(v5, v6, @"kSBSKey_NetworkScanRecordList");
  uint64_t v9 = objc_msgSend_arrayWithArray_(v4, v8, v7);
  if (v9)
  {
    uint64_t v12 = (void *)v9;
    v13 = objc_msgSend_inParamDict(self, v10, v11);
    uint64_t v15 = objc_msgSend_objectForKey_(v13, v14, @"kSBSKey_BrowseRecordList");
    objc_msgSend_addBrowsedRecords_toDestList_(self, v16, v15, v12);
    uint64_t v18 = objc_msgSend_sortedArrayUsingSelector_(v12, v17, (uint64_t)sel_ssidAndBaseNameLocalizedCaseInsensitiveCompare_);
    objc_msgSend_setSortedDevices_(self, v19, v18);
    sourceBase = self->super._sourceBase;
    self->super._selectedDevice = sourceBase;
    if (!sourceBase) {
      self->super._selectedDevice = self->super._sourceNetwork;
    }
    uint64_t v21 = off_268147F78[0];
    MEMORY[0x270F9A6D0](self, sel_setConnectionMedium_, v21);
  }
}

- (id)deviceTableLabel
{
  return (id)sub_22685D62C(@"StepByStepStatus_ExtendWirelessNetworkChoice.NetworkToConnectTo", qword_268148378);
}

- (id)devicePickerLabel
{
  return (id)sub_22685D62C(@"StepByStepStatus_ExtendWirelessNetworkChoice.ChooseANetwork", qword_268148378);
}

- (void)touchInCellAtIndexPath:(id)a3
{
  uint64_t v5 = objc_msgSend_section(a3, a2, (uint64_t)a3);
  uint64_t v8 = objc_msgSend_tableManager(self, v6, v7);
  if (v5 == objc_msgSend_indexOfSectionWithIdentifier_(v8, v9, (uint64_t)off_268148098))
  {
    uint64_t v12 = objc_msgSend_tableManager(self, v10, v11);
    unsigned int v14 = objc_msgSend_tagOfSelectedRowInMenuSection_(v12, v13, v5);
    *(_DWORD *)(&self->super.showFullList + 3) = v14;
    outResultsDict = self->super.super.super._outResultsDict;
    uint64_t v17 = objc_msgSend_numberWithInteger_(NSNumber, v16, v14);
    objc_msgSend_setObject_forKey_(outResultsDict, v18, v17, @"kSBSKey_SelectorChoice");
    objc_msgSend_selectedDeviceUpdated(self, v19, v20);
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)StepByStepUIViewController_ExtendWirelessNetworkChoice;
    [(StepByStepUIViewController_DevicePicker *)&v21 touchInCellAtIndexPath:a3];
  }
}

- (void)stepByStepUpdateProgress:(id)a3 forState:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v7 = objc_msgSend_tableManager(self, a2, (uint64_t)a3);
  uint64_t v9 = objc_msgSend_indexOfSectionWithIdentifier_(v7, v8, (uint64_t)off_268148098);
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v12 = v9;
    v13 = objc_msgSend_tableManager(self, v10, v11);
    objc_msgSend_deleteSection_(v13, v14, v12);
  }
  v15.receiver = self;
  v15.super_class = (Class)StepByStepUIViewController_ExtendWirelessNetworkChoice;
  [(StepByStepUIViewController *)&v15 stepByStepUpdateProgress:a3 forState:v4];
}

- (BOOL)canBeExtendedWithDWDS
{
  uint64_t v4 = objc_msgSend_inParamDict(self, a2, v2);
  uint64_t v6 = objc_msgSend_objectForKey_(v4, v5, @"kSBSKey_Mode");
  if (objc_msgSend_integerValue(v6, v7, v8) != 1) {
    return 0;
  }
  selectedDevice = self->super._selectedDevice;
  if (!selectedDevice) {
    return 0;
  }
  uint64_t v11 = objc_msgSend_productIDForNetworkOrDevice_(StepByStepUtilities, v9, (uint64_t)selectedDevice);
  uint64_t v14 = objc_msgSend_integerValue(v11, v12, v13);
  BOOL result = 0;
  if (v14) {
    BOOL v16 = v14 == 3;
  }
  else {
    BOOL v16 = 1;
  }
  if (!v16 && v14 != 102) {
    return 1;
  }
  return result;
}

- (void)addBrowsedRecords:(id)a3 toDestList:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v6 = objc_msgSend_array(MEMORY[0x263EFF980], a2, (uint64_t)a3);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v7 = a3;
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v8, (uint64_t)&v24, v28, 16);
  if (v9)
  {
    uint64_t v12 = v9;
    uint64_t v13 = *(void *)v25;
LABEL_3:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v25 != v13) {
        objc_enumerationMutation(v7);
      }
      objc_super v15 = *(void **)(*((void *)&v24 + 1) + 8 * v14);
      BOOL v16 = (__CFString *)objc_msgSend_objectForKey_(v15, v10, @"raMA");
      uint64_t v18 = (__CFString *)objc_msgSend_objectForKey_(v15, v17, @"raM2");
      if (!objc_msgSend_length(v16, v19, v20)) {
        break;
      }
      if (sub_22685C1DC(v16, 0, (CFArrayRef)a4) != -1
        || objc_msgSend_length(v18, v10, v21) && sub_22685C1DC(v18, 0, (CFArrayRef)a4) != -1)
      {
        objc_msgSend_addObject_(v6, v10, (uint64_t)v15);
      }
      if (v12 == ++v14)
      {
        uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v24, v28, 16);
        uint64_t v12 = v22;
        if (v22) {
          goto LABEL_3;
        }
        goto LABEL_15;
      }
    }
  }
  else
  {
LABEL_15:
    if (objc_msgSend_count(v6, v10, v11)) {
      objc_msgSend_addObjectsFromArray_(a4, v23, (uint64_t)v6);
    }
  }
}

@end