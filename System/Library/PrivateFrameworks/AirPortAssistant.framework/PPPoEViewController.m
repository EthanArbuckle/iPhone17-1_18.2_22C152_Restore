@interface PPPoEViewController
- (BOOL)shouldChangeTextField:(id)a3 atIndexPath:(id)a4 forTextIndex:(unint64_t)a5 toString:(id)a6;
- (PPPoEConnectionUIViewController)pppoeConnectionUIViewController;
- (UILabel)justTextLabel;
- (UIView)justTextContainerView;
- (UIView)tableHeaderContainerView;
- (id)valueForItemOfType:(id)a3 atTypeIndex:(unint64_t)a4 inCellWithTag:(int64_t)a5;
- (void)dealloc;
- (void)loadView;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)setJustTextContainerView:(id)a3;
- (void)setJustTextLabel:(id)a3;
- (void)setPppoeConnectionUIViewController:(id)a3;
- (void)setTableHeaderContainerView:(id)a3;
- (void)setupInitialTableHeaderConfiguration;
- (void)touchInCellAtIndexPath:(id)a3;
@end

@implementation PPPoEViewController

- (void)setupInitialTableHeaderConfiguration
{
  objc_msgSend_setLeftNavigationButton_enable_hide_(self, a2, @"kBack", 1, 0);
  objc_msgSend_setRightNavigationButton_enable_hide_(self, v3, @"kNext", 1, 0);
  objc_msgSend_setDelegate_(self, v4, (uint64_t)self);
  v5 = (void *)sub_22685D62C(@"PPPoESetupInfo", qword_268148378);
  v8 = objc_msgSend_parentController(self, v6, v7);
  tableHeaderContainerView = self->tableHeaderContainerView;
  uint64_t v11 = objc_msgSend_arrayWithObject_(MEMORY[0x263EFF8C0], v10, (uint64_t)self->justTextContainerView);
  objc_msgSend_replaceSubviewsInView_newSubviews_withAnimation_(v8, v12, (uint64_t)tableHeaderContainerView, v11, 1);
  sub_22684E878(self->justTextLabel, (char *)self->justTextContainerView, v5);
  objc_msgSend_readjustSubviewsInContainer_(AssistantUIViewController, v13, (uint64_t)self->tableHeaderContainerView);
  v14 = self->tableHeaderContainerView;
  v17 = objc_msgSend_tableView(self, v15, v16);

  objc_msgSend_setTableHeaderView_(v17, v18, (uint64_t)v14);
}

- (void)loadView
{
  v119.receiver = self;
  v119.super_class = (Class)PPPoEViewController;
  [(AUUITableViewController *)&v119 loadView];
  uint64_t v118 = 0;
  v5 = objc_msgSend_view(self, v3, v4);
  objc_msgSend_frame(v5, v6, v7);
  self->justTextLabel = (UILabel *)objc_msgSend_labelViewInContainer_width_(AssistantSubUIViewController, v8, (uint64_t)&v118, v9);
  objc_msgSend_setJustTextContainerView_(self, v10, v118);
  v13 = objc_msgSend_view(self, v11, v12);
  objc_msgSend_frame(v13, v14, v15);
  uint64_t v19 = objc_msgSend_containerViewWithWidth_(AssistantSubUIViewController, v16, v17, v18);
  objc_msgSend_setTableHeaderContainerView_(self, v20, v19);
  v23 = objc_msgSend_view(self, v21, v22);
  objc_msgSend_frame(v23, v24, v25);
  double v27 = v26;
  v30 = objc_msgSend_view(self, v28, v29);
  objc_msgSend_frame(v30, v31, v32);
  uint64_t v36 = objc_msgSend_tableViewWithWidth_height_(AssistantSubUIViewController, v33, v34, v27, v35);
  objc_msgSend_setTableView_(self, v37, v36);
  objc_msgSend_setupInitialTableHeaderConfiguration(self, v38, v39);
  v42 = objc_msgSend_tableManager(self, v40, v41);
  unint64_t v46 = 0x263EFF000;
  if (objc_msgSend_indexOfSectionWithIdentifier_(v42, v43, @"PPPoEAccountInfo") == 0x7FFFFFFFFFFFFFFFLL)
  {
    v47 = objc_msgSend_array(MEMORY[0x263EFF980], v44, v45);
    outResultsDict = self->super._outResultsDict;
    uint64_t v49 = sub_22685D6E8(1885689166);
    uint64_t v51 = objc_msgSend_objectForKey_(outResultsDict, v50, v49);
    if (v51) {
      v54 = (__CFString *)v51;
    }
    else {
      v54 = &stru_26DA6BE88;
    }
    v55 = objc_msgSend_tableManager(self, v52, v53);
    uint64_t v56 = sub_22685DE10(1885689166);
    uint64_t isSecure_keyboardType_withTag = objc_msgSend_createRowStyleBasicEditableWithImage_labelText_currentValue_placeholderText_isSecure_keyboardType_withTag_(v55, v57, 0, v56, v54, 0, 0, 0, 1885689166);
    objc_msgSend_addObject_(v47, v59, isSecure_keyboardType_withTag);
    v60 = self->super._outResultsDict;
    uint64_t v61 = sub_22685D6E8(1885687895);
    uint64_t v63 = objc_msgSend_objectForKey_(v60, v62, v61);
    if (v63) {
      v66 = (__CFString *)v63;
    }
    else {
      v66 = &stru_26DA6BE88;
    }
    v67 = objc_msgSend_tableManager(self, v64, v65);
    uint64_t v68 = sub_22685DE10(1885687895);
    uint64_t v70 = objc_msgSend_createRowStyleBasicEditableWithImage_labelText_currentValue_placeholderText_isSecure_keyboardType_withTag_(v67, v69, 0, v68, v66, 0, 1, 0, 1885687895);
    objc_msgSend_addObject_(v47, v71, v70);
    v72 = self->super._outResultsDict;
    unint64_t v46 = 0x263EFF000uLL;
    uint64_t v73 = sub_22685D6E8(1885688654);
    uint64_t v75 = objc_msgSend_objectForKey_(v72, v74, v73);
    if (v75) {
      v78 = (__CFString *)v75;
    }
    else {
      v78 = &stru_26DA6BE88;
    }
    v79 = objc_msgSend_tableManager(self, v76, v77);
    uint64_t v80 = sub_22685DE10(1885688654);
    uint64_t v82 = objc_msgSend_createRowStyleBasicEditableWithImage_labelText_currentValue_placeholderText_isSecure_keyboardType_withTag_(v79, v81, 0, v80, v78, 0, 0, 0, 1885688654);
    objc_msgSend_addObject_(v47, v83, v82);
    v86 = objc_msgSend_tableManager(self, v84, v85);
    v87 = (void *)MEMORY[0x263EFF9A0];
    uint64_t v88 = sub_22685D62C(@"PPPoEAccountInformation", qword_268148378);
    uint64_t v90 = objc_msgSend_dictionaryWithObjectsAndKeys_(v87, v89, (uint64_t)v47, @"sectionRows", v88, @"header", @"PPPoEAccountInfo", @"identifier", 0);
    objc_msgSend_addSectionInfo_(v86, v91, v90);
  }
  v92 = objc_msgSend_tableManager(self, v44, v45);
  if (objc_msgSend_indexOfSectionWithIdentifier_(v92, v93, @"PPPoEConnectionInfo") == 0x7FFFFFFFFFFFFFFFLL)
  {
    v96 = objc_msgSend_array(MEMORY[0x263EFF980], v94, v95);
    v99 = objc_msgSend_tableManager(self, v97, v98);
    uint64_t v100 = sub_22685DE10(1651724355);
    uint64_t RowStyleBasicWithImage_text1_text2_withTag = objc_msgSend_createRowStyleBasicWithImage_text1_text2_withTag_(v99, v101, 0, v100, @"dynamicValue", 1651724355);
    v105 = objc_msgSend_tableManager(self, v103, v104);
    objc_msgSend_setNewRow_accessoryType_(v105, v106, RowStyleBasicWithImage_text1_text2_withTag, 1);
    objc_msgSend_addObject_(v96, v107, RowStyleBasicWithImage_text1_text2_withTag);
    v110 = objc_msgSend_tableManager(self, v108, v109);
    uint64_t v112 = objc_msgSend_dictionaryWithObjectsAndKeys_(*(void **)(v46 + 2464), v111, (uint64_t)v96, @"sectionRows", @"PPPoEConnectionInfo", @"identifier", 0);
    objc_msgSend_addSectionInfo_(v110, v113, v112);
  }
  v114 = self->super._outResultsDict;
  uint64_t v115 = objc_msgSend_numberWithInteger_(NSNumber, v94, 0);
  uint64_t v116 = sub_22685D6E8(1651724355);
  objc_msgSend_setObject_forKey_(v114, v117, v115, v116);
}

- (void)dealloc
{
  objc_msgSend_setPppoeConnectionUIViewController_(self, a2, 0);
  objc_msgSend_setTableHeaderContainerView_(self, v3, 0);
  objc_msgSend_setJustTextContainerView_(self, v4, 0);
  v5.receiver = self;
  v5.super_class = (Class)PPPoEViewController;
  [(AssistantSubUIViewController *)&v5 dealloc];
}

- (id)valueForItemOfType:(id)a3 atTypeIndex:(unint64_t)a4 inCellWithTag:(int64_t)a5
{
  if (a5 != 1651724355) {
    return &stru_26DA6BE88;
  }
  outResultsDict = self->super._outResultsDict;
  uint64_t v7 = sub_22685D6E8(1651724355);
  double v9 = objc_msgSend_objectForKey_(outResultsDict, v8, v7);
  uint64_t v12 = (const char *)objc_msgSend_integerValue(v9, v10, v11);
  return sub_22685DF10(1651724355, v12);
}

- (BOOL)shouldChangeTextField:(id)a3 atIndexPath:(id)a4 forTextIndex:(unint64_t)a5 toString:(id)a6
{
  uint64_t v15 = 0;
  double v9 = objc_msgSend_tableManager(self, a2, (uint64_t)a3, a4, a5);
  if (objc_msgSend_tagOfCellAtIndexPath_tag_(v9, v10, (uint64_t)a4, &v15))
  {
    if (!a6) {
      a6 = &stru_26DA6BE88;
    }
    outResultsDict = self->super._outResultsDict;
    uint64_t v12 = sub_22685D6E8(v15);
    objc_msgSend_setObject_forKey_(outResultsDict, v13, (uint64_t)a6, v12);
  }
  return 1;
}

- (void)touchInCellAtIndexPath:(id)a3
{
  uint64_t v37 = 0;
  uint64_t v5 = objc_msgSend_tableManager(self, a2, (uint64_t)a3);
  if (objc_msgSend_tagOfCellAtIndexPath_tag_(v5, v6, (uint64_t)a3, &v37) && v37 == 1651724355)
  {
    uint64_t v7 = sub_22685D6E8(1651724355);
    uint64_t v10 = objc_msgSend_objectForKey_(self->super._outResultsDict, v8, v7);
    if (!v10) {
      uint64_t v10 = objc_msgSend_numberWithInteger_(NSNumber, v9, 0);
    }
    uint64_t v11 = [PPPoEConnectionUIViewController alloc];
    id v13 = (id)objc_msgSend_initWithNibName_bundle_(v11, v12, 0, 0);
    objc_msgSend_setPppoeConnectionUIViewController_(self, v14, (uint64_t)v13);
    uint64_t v17 = objc_msgSend_outResultsDict(self->pppoeConnectionUIViewController, v15, v16);
    objc_msgSend_setObject_forKey_(v17, v18, v10, v7);
    v21 = objc_msgSend_tableManager(self, v19, v20);
    objc_msgSend_endEditing(v21, v22, v23);
    double v26 = objc_msgSend_navigationController(self, v24, v25);
    self->previousNavDelegate = (id)objc_msgSend_delegate(v26, v27, v28);
    v31 = objc_msgSend_navigationController(self, v29, v30);
    objc_msgSend_setDelegate_(v31, v32, (uint64_t)self);
    double v35 = objc_msgSend_navigationController(self, v33, v34);
    objc_msgSend_pushViewController_animated_(v35, v36, (uint64_t)self->pppoeConnectionUIViewController, 1);
  }
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  if (self->pppoeConnectionUIViewController != a4)
  {
    uint64_t v6 = sub_22685D6E8(1651724355);
    double v9 = objc_msgSend_outResultsDict(self->pppoeConnectionUIViewController, v7, v8);
    uint64_t v11 = objc_msgSend_objectForKey_(v9, v10, v6);
    if (v11)
    {
      objc_msgSend_setObject_forKey_(self->super._outResultsDict, v12, v11, v6);
      uint64_t v15 = objc_msgSend_tableView(self, v13, v14);
      objc_msgSend_reloadData(v15, v16, v17);
      id previousNavDelegate = self->previousNavDelegate;
      v21 = objc_msgSend_navigationController(self, v19, v20);
      objc_msgSend_setDelegate_(v21, v22, (uint64_t)previousNavDelegate);
    }
  }
}

- (PPPoEConnectionUIViewController)pppoeConnectionUIViewController
{
  return (PPPoEConnectionUIViewController *)objc_getProperty(self, a2, 1080, 1);
}

- (void)setPppoeConnectionUIViewController:(id)a3
{
}

- (UIView)tableHeaderContainerView
{
  return self->tableHeaderContainerView;
}

- (void)setTableHeaderContainerView:(id)a3
{
}

- (UIView)justTextContainerView
{
  return self->justTextContainerView;
}

- (void)setJustTextContainerView:(id)a3
{
}

- (UILabel)justTextLabel
{
  return self->justTextLabel;
}

- (void)setJustTextLabel:(id)a3
{
  self->justTextLabel = (UILabel *)a3;
}

@end