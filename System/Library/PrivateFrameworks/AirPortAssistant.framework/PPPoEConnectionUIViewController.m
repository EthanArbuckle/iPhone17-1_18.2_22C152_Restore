@interface PPPoEConnectionUIViewController
- (void)loadView;
- (void)touchInCellAtIndexPath:(id)a3;
@end

@implementation PPPoEConnectionUIViewController

- (void)loadView
{
  v85.receiver = self;
  v85.super_class = (Class)PPPoEConnectionUIViewController;
  [(AUUITableViewController *)&v85 loadView];
  v5 = objc_msgSend_view(self, v3, v4);
  objc_msgSend_frame(v5, v6, v7);
  double v9 = v8;
  v12 = objc_msgSend_view(self, v10, v11);
  objc_msgSend_frame(v12, v13, v14);
  v18 = objc_msgSend_tableViewWithWidth_height_(AssistantSubUIViewController, v15, v16, v9, v17);
  objc_msgSend_setTableView_(self, v19, (uint64_t)v18);
  uint64_t v22 = objc_msgSend_parentController(self, v20, v21);
  objc_msgSend_setParentController_(self, v23, v22);
  objc_msgSend_setDelegate_(self, v24, (uint64_t)self);
  v27 = objc_msgSend_view(self, v25, v26);
  objc_msgSend_frame(v27, v28, v29);
  uint64_t v33 = objc_msgSend_containerViewWithWidth_(AssistantSubUIViewController, v30, v31, v32);
  objc_msgSend_setTableHeaderView_(v18, v34, v33);
  objc_msgSend_setLeftNavigationButton_enable_hide_(self, v35, @"kBack", 1, 0);
  objc_msgSend_setRightNavigationButton_enable_hide_(self, v36, @"kNext", 0, 1);
  uint64_t v37 = sub_22685D6E8(1651724355);
  v41 = objc_msgSend_objectForKey_(self->super._outResultsDict, v38, v37);
  if (!v41) {
    v41 = objc_msgSend_numberWithInteger_(NSNumber, v39, 0);
  }
  v42 = objc_msgSend_tableManager(self, v39, v40);
  if (objc_msgSend_indexOfSectionWithIdentifier_(v42, v43, @"PPPoEAccountInfo") == 0x7FFFFFFFFFFFFFFFLL)
  {
    v46 = objc_msgSend_array(MEMORY[0x263EFF980], v44, v45);
    v49 = objc_msgSend_tableManager(self, v47, v48);
    v50 = sub_22685DF10(1651724355, 0);
    uint64_t RowStyleBasicWithImage_text1_text2_withTag = objc_msgSend_createRowStyleBasicWithImage_text1_text2_withTag_(v49, v51, 0, v50, 0, 0);
    objc_msgSend_addObject_(v46, v53, RowStyleBasicWithImage_text1_text2_withTag);
    v56 = objc_msgSend_tableManager(self, v54, v55);
    v57 = sub_22685DF10(1651724355, (const char *)1);
    uint64_t v59 = objc_msgSend_createRowStyleBasicWithImage_text1_text2_withTag_(v56, v58, 0, v57, 0, 1);
    objc_msgSend_addObject_(v46, v60, v59);
    v63 = objc_msgSend_tableManager(self, v61, v62);
    v64 = sub_22685DF10(1651724355, (const char *)2);
    uint64_t v66 = objc_msgSend_createRowStyleBasicWithImage_text1_text2_withTag_(v63, v65, 0, v64, 0, 2);
    objc_msgSend_addObject_(v46, v67, v66);
    v70 = objc_msgSend_tableManager(self, v68, v69);
    v71 = (void *)MEMORY[0x263EFF9A0];
    uint64_t v72 = sub_22685DE10(1651724355);
    uint64_t v74 = objc_msgSend_numberWithBool_(NSNumber, v73, 1);
    uint64_t v76 = objc_msgSend_dictionaryWithObjectsAndKeys_(v71, v75, (uint64_t)v46, @"sectionRows", @"PPPoEConnectionSelectionInfo", @"identifier", v72, @"header", v74, @"sectionIsMenu", v41, @"selectedMenuItemTag", 0);
    objc_msgSend_addSectionInfo_(v70, v77, v76);
  }
  v78 = objc_msgSend_tableManager(self, v44, v45);
  uint64_t v81 = objc_msgSend_integerValue(v41, v79, v80);
  uint64_t v83 = objc_msgSend_indexPathOfCellWithTag_(v78, v82, v81);
  objc_msgSend_touchInCellAtIndexPath_(self, v84, v83);
}

- (void)touchInCellAtIndexPath:(id)a3
{
  uint64_t v4 = objc_msgSend_tableManager(self, a2, (uint64_t)a3);
  uint64_t v6 = objc_msgSend_indexOfSectionWithIdentifier_(v4, v5, @"PPPoEConnectionSelectionInfo");
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v10 = v6;
    uint64_t v11 = objc_msgSend_tableManager(self, v7, v8);
    uint64_t v9 = objc_msgSend_tagOfSelectedRowInMenuSection_(v11, v12, v10);
  }
  outResultsDict = self->super._outResultsDict;
  uint64_t v14 = objc_msgSend_numberWithInteger_(NSNumber, v7, v9);
  uint64_t v16 = sub_22685D6E8(1651724355);

  objc_msgSend_setObject_forKey_(outResultsDict, v15, v14, v16);
}

@end