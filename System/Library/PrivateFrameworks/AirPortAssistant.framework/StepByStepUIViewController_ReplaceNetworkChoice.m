@interface StepByStepUIViewController_ReplaceNetworkChoice
- (id)devicePickerLabel;
- (id)deviceTableLabel;
- (void)setupDevices;
- (void)setupHeaderAndFooter;
- (void)updateNavigationButtons;
@end

@implementation StepByStepUIViewController_ReplaceNetworkChoice

- (void)setupHeaderAndFooter
{
  justTextLabel = self->super.super.justTextLabel;
  v5 = (char *)objc_msgSend_justTextContainerView(self, a2, v2);
  ProductLocalizedStringWithFormat = objc_msgSend_getProductLocalizedStringWithFormat_(self, v6, @"StepByStepStatus_ReplaceNetworkChoice%@");
  sub_22684E878(justTextLabel, v5, ProductLocalizedStringWithFormat);
  uint64_t v10 = objc_msgSend_tableHeaderContainerView(self, v8, v9);
  objc_msgSend_readjustSubviewsInContainer_(AssistantUIViewController, v11, v10);
  v14 = objc_msgSend_parentController(self, v12, v13);
  uint64_t v17 = objc_msgSend_tableHeaderContainerView(self, v15, v16);
  v18 = (void *)MEMORY[0x263EFF8C0];
  uint64_t v21 = objc_msgSend_justTextContainerView(self, v19, v20);
  uint64_t v24 = objc_msgSend_topoView(self, v22, v23);
  uint64_t v26 = objc_msgSend_arrayWithObjects_(v18, v25, v21, v24, 0);
  objc_msgSend_replaceSubviewsInView_newSubviews_withAnimation_(v14, v27, v17, v26, 1);
  uint64_t v30 = objc_msgSend_tableHeaderContainerView(self, v28, v29);
  v33 = objc_msgSend_tableView(self, v31, v32);

  objc_msgSend_setTableHeaderView_(v33, v34, v30);
}

- (void)updateNavigationButtons
{
}

- (void)setupDevices
{
  v4 = (void *)MEMORY[0x263EFF980];
  v5 = objc_msgSend_inParamDict(self, a2, v2);
  uint64_t v7 = objc_msgSend_objectForKey_(v5, v6, @"kSBSKey_NetworkScanRecordList");
  uint64_t v9 = objc_msgSend_arrayWithArray_(v4, v8, v7);
  if (v9)
  {
    uint64_t v11 = objc_msgSend_sortedArrayUsingSelector_(v9, v10, (uint64_t)sel_ssidLocalizedCaseInsensitiveCompare_);
    objc_msgSend_setSortedDevices_(self, v12, v11);
    self->super._selectedDevice = self->super._sourceNetwork;
    uint64_t v13 = off_268147F80;
    MEMORY[0x270F9A6D0](self, sel_setConnectionMedium_, v13);
  }
}

- (id)deviceTableLabel
{
  return (id)sub_22685D62C(@"StepByStepStatus_ReplaceNetworkChoice.ChosenNetwork", qword_268148378);
}

- (id)devicePickerLabel
{
  return (id)sub_22685D62C(@"StepByStepStatus_ReplaceNetworkChoice.ChooseANetwork", qword_268148378);
}

@end