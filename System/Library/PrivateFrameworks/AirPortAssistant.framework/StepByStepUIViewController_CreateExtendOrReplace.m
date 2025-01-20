@interface StepByStepUIViewController_CreateExtendOrReplace
- (void)handleSelectorChoiceWithTag:(unint64_t)a3;
- (void)loadView;
- (void)setupInitialTableHeaderConfiguration;
- (void)setupTable;
- (void)touchInCellAtIndexPath:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation StepByStepUIViewController_CreateExtendOrReplace

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
  v23 = objc_msgSend_tableView(self, v21, v22);

  objc_msgSend_setTableHeaderView_(v23, v24, v20);
}

- (void)setupTable
{
  objc_msgSend_setDelegate_(self, a2, (uint64_t)self);
  uint64_t v5 = objc_msgSend_inParamDict(self, v3, v4);
  uint64_t v7 = objc_msgSend_objectForKey_(v5, v6, @"kSBSKey_SelectorChoice");
  if (v7)
  {
    uint64_t v10 = objc_msgSend_integerValue(v7, v8, v9);
    uint64_t v12 = objc_msgSend_selectorChoiceToMatrixTag_(StepByStepUtilities, v11, v10);
LABEL_5:
    uint64_t v20 = v12;
    goto LABEL_6;
  }
  uint64_t v15 = objc_msgSend_inParamDict(self, v8, v9);
  v17 = objc_msgSend_objectForKey_(v15, v16, @"kSBSKey_AutoGuessRecommendation");
  if (objc_msgSend_length(v17, v18, v19))
  {
    uint64_t v12 = objc_msgSend_autoGuessRecommendationToMatrixTag_(StepByStepUtilities, v13, (uint64_t)v17);
    goto LABEL_5;
  }
  uint64_t v20 = 1131570529;
LABEL_6:
  v21 = objc_msgSend_tableManager(self, v13, v14);
  if (objc_msgSend_indexOfSectionWithIdentifier_(v21, v22, @"CERR") == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v25 = objc_alloc_init(MEMORY[0x263EFF980]);
    v28 = objc_msgSend_tableManager(self, v26, v27);
    uint64_t v29 = sub_22685D62C(@"kCreateNetworkLabel", qword_268148378);
    uint64_t RowStyleBasicWithImage_text1_text2_withTag = objc_msgSend_createRowStyleBasicWithImage_text1_text2_withTag_(v28, v30, 0, v29, 0, 1131570529);
    objc_msgSend_addObject_(v25, v32, RowStyleBasicWithImage_text1_text2_withTag);
    v35 = objc_msgSend_tableManager(self, v33, v34);
    uint64_t v36 = sub_22685D62C(@"AddToExistingNetwork", qword_268148378);
    uint64_t v38 = objc_msgSend_createRowStyleBasicWithImage_text1_text2_withTag_(v35, v37, 0, v36, 0, 1165522021);
    objc_msgSend_addObject_(v25, v39, v38);
    v42 = objc_msgSend_tableManager(self, v40, v41);
    uint64_t v43 = sub_22685D62C(@"kReplaceABaseStationLabel", qword_268148378);
    uint64_t v45 = objc_msgSend_createRowStyleBasicWithImage_text1_text2_withTag_(v42, v44, 0, v43, 0, 1382379628);
    objc_msgSend_addObject_(v25, v46, v45);
    v49 = objc_msgSend_inParamDict(self, v47, v48);
    if (objc_msgSend_objectForKey_(v49, v50, @"kSBSKey_RestoreRecommendation"))
    {
      v53 = objc_msgSend_tableManager(self, v51, v52);
      uint64_t v54 = sub_22685D62C(@"kRestorePreviousConfig", qword_268148378);
      uint64_t v56 = objc_msgSend_createRowStyleBasicWithImage_text1_text2_withTag_(v53, v55, 0, v54, 0, 1382380404);
      objc_msgSend_addObject_(v25, v57, v56);
    }
    v58 = objc_msgSend_tableManager(self, v51, v52);
    v59 = (void *)MEMORY[0x263EFF9A0];
    uint64_t v61 = objc_msgSend_numberWithBool_(NSNumber, v60, 1);
    uint64_t v63 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v62, v20);
    uint64_t v65 = objc_msgSend_dictionaryWithObjectsAndKeys_(v59, v64, (uint64_t)v25, @"sectionRows", v61, @"sectionIsMenu", v63, @"selectedMenuItemTag", @"CERR", @"identifier", 0);
    objc_msgSend_addSectionInfo_(v58, v66, v65);
  }
  v67 = objc_msgSend_tableManager(self, v23, v24);
  if (objc_msgSend_indexOfSectionWithIdentifier_(v67, v68, @"CERRFooter") == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v69 = objc_alloc_init(MEMORY[0x263EFF980]);
    v72 = objc_msgSend_tableManager(self, v70, v71);
    uint64_t v74 = objc_msgSend_dictionaryWithObjectsAndKeys_(MEMORY[0x263EFF9A0], v73, (uint64_t)v69, @"sectionRows", &stru_26DA6BE88, @"footer", @"CERRFooter", @"identifier", 0);
    objc_msgSend_addSectionInfo_(v72, v75, v74);
  }

  MEMORY[0x270F9A6D0](self, sel_handleSelectorChoiceWithTag_, v20);
}

- (void)loadView
{
  v20.receiver = self;
  v20.super_class = (Class)StepByStepUIViewController_CreateExtendOrReplace;
  [(StepByStepUIViewController *)&v20 loadView];
  uint64_t v5 = objc_msgSend_view(self, v3, v4);
  objc_msgSend_frame(v5, v6, v7);
  double v9 = v8;
  uint64_t v12 = objc_msgSend_view(self, v10, v11);
  objc_msgSend_frame(v12, v13, v14);
  uint64_t v18 = objc_msgSend_tableViewWithWidth_height_(AssistantSubUIViewController, v15, v16, v9, v17);
  objc_msgSend_setTableView_(self, v19, v18);
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  objc_msgSend_setRightNavigationButton_enable_hide_(self, a2, @"kNext", 0, 0);
  objc_msgSend_setupTable(self, v5, v6);
  justTextLabel = self->super.justTextLabel;
  justTextContainerView = (char *)self->super.justTextContainerView;
  ProductLocalizedStringWithFormat = objc_msgSend_getProductLocalizedStringWithFormat_(self, v9, @"StepByStepStatus_CreateExtendReplace%@");
  sub_22684E878(justTextLabel, justTextContainerView, ProductLocalizedStringWithFormat);
  uint64_t v13 = objc_msgSend_tableHeaderContainerView(self, v11, v12);
  objc_msgSend_readjustSubviewsInContainer_(AssistantUIViewController, v14, v13);
  uint64_t v17 = objc_msgSend_tableHeaderContainerView(self, v15, v16);
  objc_super v20 = objc_msgSend_tableView(self, v18, v19);
  objc_msgSend_setTableHeaderView_(v20, v21, v17);
  objc_msgSend_setupInitialTableHeaderConfiguration(self, v22, v23);
  v26 = objc_msgSend_inParamDict(self, v24, v25);
  uint64_t v28 = objc_msgSend_objectForKey_(v26, v27, @"kSBSKey_TargetBase");
  objc_msgSend_syncTopoUIForTarget_andSource_andNetwork_connectionType_(self, v29, v28, 0, 0, 0);
  v30.receiver = self;
  v30.super_class = (Class)StepByStepUIViewController_CreateExtendOrReplace;
  [(StepByStepUIViewController *)&v30 viewWillAppear:v3];
}

- (void)touchInCellAtIndexPath:(id)a3
{
  uint64_t v5 = objc_msgSend_tableManager(self, a2, (uint64_t)a3);
  uint64_t v8 = objc_msgSend_section(a3, v6, v7);
  uint64_t v10 = objc_msgSend_tagOfSelectedRowInMenuSection_(v5, v9, v8);

  MEMORY[0x270F9A6D0](self, sel_handleSelectorChoiceWithTag_, v10);
}

- (void)handleSelectorChoiceWithTag:(unint64_t)a3
{
  unsigned int v5 = objc_msgSend_matrixTagToSelectorChoice_(StepByStepUtilities, a2, a3);
  outResultsDict = self->super.super._outResultsDict;
  uint64_t v8 = objc_msgSend_numberWithInteger_(NSNumber, v7, v5);
  objc_msgSend_setObject_forKey_(outResultsDict, v9, v8, @"kSBSKey_SelectorChoice");
  objc_msgSend_setRightNavigationButton_enable_hide_(self, v10, @"kNext", 1, 0);
  uint64_t v13 = &stru_26DA6BE88;
  if ((uint64_t)a3 > 1382379627)
  {
    if (a3 == 1382379628)
    {
      uint64_t ProductLocalizedStringWithFormat = objc_msgSend_getProductLocalizedStringWithFormat_(self, v11, @"ReplaceFooter%@");
    }
    else
    {
      if (a3 != 1382380404) {
        goto LABEL_11;
      }
      uint64_t ProductLocalizedStringWithFormat = objc_msgSend_getProductLocalizedStringWithFormat_(self, v11, @"RestoreFooter%@");
    }
  }
  else if (a3 == 1131570529)
  {
    uint64_t ProductLocalizedStringWithFormat = objc_msgSend_getProductLocalizedStringWithFormat_(self, v11, @"CreateFooter%@");
  }
  else
  {
    if (a3 != 1165522021) {
      goto LABEL_11;
    }
    uint64_t ProductLocalizedStringWithFormat = objc_msgSend_getProductLocalizedStringWithFormat_(self, v11, @"AddToFooter%@");
  }
  uint64_t v13 = (__CFString *)ProductLocalizedStringWithFormat;
LABEL_11:
  uint64_t v15 = objc_msgSend_tableManager(self, v11, v12);

  MEMORY[0x270F9A6D0](v15, sel_updateFooter_forSectionWithIdentifier_, v13);
}

@end