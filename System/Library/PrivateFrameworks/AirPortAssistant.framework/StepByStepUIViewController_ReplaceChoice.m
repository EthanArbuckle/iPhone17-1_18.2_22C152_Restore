@interface StepByStepUIViewController_ReplaceChoice
- (void)loadView;
- (void)setupTable;
- (void)touchInCellAtIndexPath:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation StepByStepUIViewController_ReplaceChoice

- (void)setupTable
{
  v4 = objc_msgSend_inParamDict(self, a2, v2);
  v6 = objc_msgSend_objectForKey_(v4, v5, @"kSBSKey_SelectorChoice");
  v9 = v6;
  if (v6)
  {
    uint64_t v10 = objc_msgSend_integerValue(v6, v7, v8);
    if (v10 == 320) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = 2 * (v10 == 330);
    }
    objc_msgSend_setRightNavigationButton_enable_hide_(self, v11, @"kNext", 1, 0);
  }
  else
  {
    uint64_t v12 = 0;
  }
  v13 = objc_msgSend_tableManager(self, v7, v8);
  if (objc_msgSend_indexOfSectionWithIdentifier_(v13, v14, @"ReplaceChoice") == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v17 = objc_alloc_init(MEMORY[0x263EFF980]);
    v20 = objc_msgSend_tableManager(self, v18, v19);
    uint64_t v21 = sub_22685D62C(@"kReplaceBaseStationLabel", qword_268148378);
    uint64_t RowStyleBasicWithImage_text1_text2_withTag = objc_msgSend_createRowStyleBasicWithImage_text1_text2_withTag_(v20, v22, 0, v21, 0, 0);
    objc_msgSend_addObject_(v17, v24, RowStyleBasicWithImage_text1_text2_withTag);
    v27 = objc_msgSend_tableManager(self, v25, v26);
    uint64_t v28 = sub_22685D62C(@"kReplaceOtherLabel", qword_268148378);
    uint64_t v30 = objc_msgSend_createRowStyleBasicWithImage_text1_text2_withTag_(v27, v29, 0, v28, 0, 2);
    objc_msgSend_addObject_(v17, v31, v30);
    v34 = objc_msgSend_tableManager(self, v32, v33);
    v35 = (void *)MEMORY[0x263EFF9A0];
    uint64_t v38 = objc_msgSend_numberWithBool_(NSNumber, v36, 1);
    if (v9) {
      uint64_t v39 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v37, v12);
    }
    else {
      uint64_t v39 = 0;
    }
    uint64_t v40 = objc_msgSend_dictionaryWithObjectsAndKeys_(v35, v37, (uint64_t)v17, @"sectionRows", v38, @"sectionIsMenu", @"ReplaceChoice", @"identifier", v39, @"selectedMenuItemTag", 0);
    objc_msgSend_addSectionInfo_(v34, v41, v40);
  }
  v42 = objc_msgSend_parentController(self, v15, v16);
  uint64_t v45 = objc_msgSend_tableHeaderContainerView(self, v43, v44);
  v46 = (void *)MEMORY[0x263EFF8C0];
  uint64_t v49 = objc_msgSend_justTextContainerView(self, v47, v48);
  uint64_t v52 = objc_msgSend_topoView(self, v50, v51);
  uint64_t v54 = objc_msgSend_arrayWithObjects_(v46, v53, v49, v52, 0);
  objc_msgSend_replaceSubviewsInView_newSubviews_withAnimation_(v42, v55, v45, v54, 1);
  uint64_t v58 = objc_msgSend_tableHeaderContainerView(self, v56, v57);
  v61 = objc_msgSend_tableView(self, v59, v60);

  objc_msgSend_setTableHeaderView_(v61, v62, v58);
}

- (void)loadView
{
  v22.receiver = self;
  v22.super_class = (Class)StepByStepUIViewController_ReplaceChoice;
  [(StepByStepUIViewController *)&v22 loadView];
  objc_msgSend_setRightNavigationButton_enable_hide_(self, v3, @"kNext", 0, 0);
  justTextLabel = self->super.justTextLabel;
  v7 = (char *)objc_msgSend_justTextContainerView(self, v5, v6);
  ProductLocalizedStringWithFormat = objc_msgSend_getProductLocalizedStringWithFormat_(self, v8, @"StepByStepStatus_ReplaceChoice%@");
  sub_22684E878(justTextLabel, v7, ProductLocalizedStringWithFormat);
  uint64_t v12 = objc_msgSend_tableHeaderContainerView(self, v10, v11);
  objc_msgSend_readjustSubviewsInContainer_(AssistantUIViewController, v13, v12);
  uint64_t v16 = objc_msgSend_tableHeaderContainerView(self, v14, v15);
  uint64_t v19 = objc_msgSend_tableView(self, v17, v18);
  objc_msgSend_setTableHeaderView_(v19, v20, v16);
  objc_msgSend_setDelegate_(self, v21, (uint64_t)self);
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  objc_msgSend_setupTable(self, a2, a3);
  v7 = objc_msgSend_inParamDict(self, v5, v6);
  uint64_t v9 = objc_msgSend_objectForKey_(v7, v8, @"kSBSKey_TargetBase");
  objc_msgSend_syncTopoUIForTarget_andSource_andNetwork_connectionType_(self, v10, v9, 0, 0, 0);
  v11.receiver = self;
  v11.super_class = (Class)StepByStepUIViewController_ReplaceChoice;
  [(StepByStepUIViewController *)&v11 viewWillAppear:v3];
}

- (void)touchInCellAtIndexPath:(id)a3
{
  v5 = objc_msgSend_tableManager(self, a2, (uint64_t)a3);
  uint64_t v8 = objc_msgSend_section(a3, v6, v7);
  uint64_t v10 = objc_msgSend_tagOfSelectedRowInMenuSection_(v5, v9, v8);
  uint64_t v12 = 310;
  if (v10 == 1) {
    uint64_t v12 = 320;
  }
  if (v10 == 2) {
    uint64_t v13 = 330;
  }
  else {
    uint64_t v13 = v12;
  }
  objc_msgSend_setRightNavigationButton_enable_hide_(self, v11, @"kNext", 1, 0);
  outResultsDict = self->super.super._outResultsDict;
  uint64_t v17 = objc_msgSend_numberWithInteger_(NSNumber, v15, v13);

  objc_msgSend_setObject_forKey_(outResultsDict, v16, v17, @"kSBSKey_SelectorChoice");
}

@end