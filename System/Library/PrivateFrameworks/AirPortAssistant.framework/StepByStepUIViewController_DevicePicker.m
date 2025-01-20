@interface StepByStepUIViewController_DevicePicker
- (BOOL)showMoreOptions;
- (NSArray)sortedDevices;
- (NSString)connectionMedium;
- (RecommendationActionController)actionController;
- (StepByStepUIViewController_DevicePicker)initWithNibName:(id)a3 bundle:(id)a4;
- (id)pickerContent;
- (id)valueForItemOfType:(id)a3 atTypeIndex:(unint64_t)a4 inCellWithTag:(int64_t)a5;
- (void)loadView;
- (void)setActionController:(id)a3;
- (void)setConnectionMedium:(id)a3;
- (void)setSortedDevices:(id)a3;
- (void)setupPickerTable;
- (void)touchInCellAtIndexPath:(id)a3;
- (void)updateSelections;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation StepByStepUIViewController_DevicePicker

- (StepByStepUIViewController_DevicePicker)initWithNibName:(id)a3 bundle:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)StepByStepUIViewController_DevicePicker;
  result = [(AssistantSubUIViewController *)&v5 initWithNibName:a3 bundle:a4];
  if (result) {
    result->showFullList = 1;
  }
  return result;
}

- (void)loadView
{
  v36.receiver = self;
  v36.super_class = (Class)StepByStepUIViewController_DevicePicker;
  [(StepByStepUIViewController *)&v36 loadView];
  objc_msgSend_setDelegate_(self, v3, (uint64_t)self);
  v6 = objc_msgSend_inParamDict(self, v4, v5);
  self->_sourceBase = (NSDictionary *)objc_msgSend_objectForKey_(v6, v7, @"kSBSKey_SourceBase");
  v10 = objc_msgSend_inParamDict(self, v8, v9);
  self->_sourceNetwork = (NSDictionary *)objc_msgSend_objectForKey_(v10, v11, @"kSBSKey_SourceNetwork");
  v14 = objc_msgSend_inParamDict(self, v12, v13);
  self->_targetBase = (NSDictionary *)objc_msgSend_objectForKey_(v14, v15, @"kSBSKey_TargetBase");
  objc_msgSend_setupDevices(self, v16, v17);
  if (!self->_selectedDevice)
  {
    v20 = objc_msgSend_sortedDevices(self, v18, v19);
    if (objc_msgSend_count(v20, v21, v22))
    {
      v25 = objc_msgSend_sortedDevices(self, v23, v24);
      v27 = (NSDictionary *)objc_msgSend_objectAtIndex_(v25, v26, 0);
      self->_selectedDevice = v27;
      if (!v27) {
        return;
      }
    }
    else if (!self->_selectedDevice)
    {
      return;
    }
  }
  if (objc_opt_respondsToSelector()) {
    objc_msgSend_prepareParams(self, v28, v29);
  }
  v30 = objc_msgSend_inParamDict(self, v28, v29);
  v32 = objc_msgSend_objectForKey_(v30, v31, @"kSBSKey_Mode");
  if (objc_msgSend_integerValue(v32, v33, v34) == 2) {
    objc_msgSend_setLeftNavigationButton_enable_hide_(self, v35, @"kCancel", 1, 0);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = objc_msgSend_inParamDict(self, a2, a3);
  v7 = objc_msgSend_objectForKey_(v5, v6, @"kSBSKey_Mode");
  if (objc_msgSend_integerValue(v7, v8, v9) == 2)
  {
    objc_msgSend_setLeftNavigationButton_enable_hide_(self, v10, @"kCancel", 1, 0);
    if (objc_msgSend_showMoreOptions(self, v11, v12))
    {
      if (!objc_msgSend_actionController(self, v10, v13))
      {
        uint64_t v15 = objc_msgSend_tableManager(self, v10, v14);
        uint64_t v18 = objc_msgSend_parentController(self, v16, v17);
        uint64_t v20 = objc_msgSend_recommendationActionControllerWithTableManager_andAssistantUIViewController_(RecommendationActionController, v19, v15, v18);
        objc_msgSend_setActionController_(self, v21, v20);
      }
    }
  }
  if (objc_msgSend_conformsToProtocol_(self, v10, (uint64_t)&unk_26DA983A0))
  {
    objc_msgSend_setupPickerTable(self, v22, v23);
    objc_msgSend_setupHeaderAndFooter(self, v24, v25);
    if (objc_opt_respondsToSelector()) {
      objc_msgSend_updateNavigationButtons(self, v22, v23);
    }
  }
  objc_msgSend_updateSelections(self, v22, v23);
  v26.receiver = self;
  v26.super_class = (Class)StepByStepUIViewController_DevicePicker;
  [(StepByStepUIViewController *)&v26 viewWillAppear:v3];
}

- (id)valueForItemOfType:(id)a3 atTypeIndex:(unint64_t)a4 inCellWithTag:(int64_t)a5
{
  return (id)objc_msgSend_nameForNetworkOrDevice_(StepByStepUtilities, a2, (uint64_t)self->_selectedDevice, a4, a5);
}

- (void)touchInCellAtIndexPath:(id)a3
{
  uint64_t v5 = objc_msgSend_section(a3, a2, (uint64_t)a3);
  v8 = objc_msgSend_tableManager(self, v6, v7);
  if (v5 == objc_msgSend_indexOfSectionWithIdentifier_(v8, v9, qword_268148090))
  {
    if (objc_opt_respondsToSelector())
    {
      uint64_t v50 = 0;
      uint64_t v14 = objc_msgSend_tableManager(self, v12, v13);
      if (objc_msgSend_tagOfCellAtIndexPath_tag_(v14, v15, (uint64_t)a3, &v50))
      {
        if (v50 != 1400203111)
        {
          if (v50 == 1333028978)
          {
            self->showFullList = 1;
            uint64_t v18 = objc_msgSend_tableManager(self, v16, v17);
            objc_msgSend_deleteSectionWithIdentifier_animated_(v18, v19, qword_268148090, 1);
            objc_msgSend_setupPickerTable(self, v20, v21);
          }
          else
          {
            unint64_t v32 = objc_msgSend_row(a3, v16, v17);
            if (objc_msgSend_sortedDevices(self, v33, v34))
            {
              v37 = objc_msgSend_sortedDevices(self, v35, v36);
              if (v32 < objc_msgSend_count(v37, v38, v39))
              {
                v42 = objc_msgSend_sortedDevices(self, v40, v41);
                uint64_t v45 = objc_msgSend_row(a3, v43, v44);
                v47 = (NSDictionary *)objc_msgSend_objectAtIndex_(v42, v46, v45);
                self->_selectedDevice = v47;
                if (v47) {
                  objc_msgSend_updateSelections(self, v48, v49);
                }
              }
            }
          }
        }
      }
    }
  }
  else
  {
    uint64_t v22 = objc_msgSend_tableManager(self, v10, v11);
    if (v5 == objc_msgSend_indexOfSectionWithIdentifier_(v22, v23, @"ActionTableSection"))
    {
      actionController = self->actionController;
      if (actionController)
      {
        uint64_t isPrimaryRecommendation = objc_msgSend_isPrimaryRecommendation(actionController, v24, v25);
        if (isPrimaryRecommendation)
        {
          objc_msgSend_setupPickerTable(self, v27, v28);
        }
        else
        {
          v30 = objc_msgSend_tableManager(self, v27, v28);
          objc_msgSend_deleteSectionWithIdentifier_(v30, v31, qword_268148090);
        }
        if (objc_opt_respondsToSelector())
        {
          MEMORY[0x270F9A6D0](self, sel_primaryActionSelected_, isPrimaryRecommendation);
        }
      }
    }
  }
}

- (void)setupPickerTable
{
  if (self->actionController)
  {
    v4 = objc_msgSend_tableManager(self, a2, v2);
    uint64_t v7 = objc_msgSend_sectionIdentifier(self->actionController, v5, v6);
    if (objc_msgSend_indexOfSectionWithIdentifier_(v4, v8, v7) == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v11 = objc_msgSend_tableManager(self, v9, v10);
      actionController = self->actionController;
      BOOL v15 = sub_22690522C(self, v13, v14) != 1;
      uint64_t SectionInfoWithLongStrings = objc_msgSend_getSectionInfoWithLongStrings_(actionController, v16, v15);
      objc_msgSend_addSectionInfo_(v11, v18, SectionInfoWithLongStrings);
    }
    else
    {
      objc_msgSend_selectPrimaryRecommendation(self->actionController, v9, v10);
    }
  }
  uint64_t v19 = objc_msgSend_tableManager(self, a2, v2);
  if (objc_msgSend_indexOfSectionWithIdentifier_(v19, v20, qword_268148090) == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (!self->actionController
      || (uint64_t v23 = objc_msgSend_sortedDevices(self, v21, v22),
          (unint64_t)objc_msgSend_count(v23, v24, v25) >= 2))
    {
      objc_super v26 = objc_msgSend_sortedDevices(self, v21, v22);
      if (objc_msgSend_count(v26, v27, v28))
      {
        uint64_t v51 = objc_msgSend_deviceTableLabel(self, v29, v30);
        v33 = objc_msgSend_sortedDevices(self, v31, v32);
        uint64_t v35 = objc_msgSend_indexOfObject_(v33, v34, (uint64_t)self->_selectedDevice);
        uint64_t v50 = objc_msgSend_tableManager(self, v36, v37);
        v38 = (void *)MEMORY[0x263EFF9A0];
        uint64_t v41 = objc_msgSend_pickerContent(self, v39, v40);
        uint64_t v42 = qword_268148090;
        uint64_t v44 = objc_msgSend_numberWithBool_(NSNumber, v43, 1);
        uint64_t v46 = objc_msgSend_numberWithInteger_(NSNumber, v45, v35);
        uint64_t v49 = objc_msgSend_dictionaryWithObjectsAndKeys_(v38, v47, v41, @"sectionRows", v42, @"identifier", v44, @"sectionIsMenu", v51, @"header", v46, @"selectedMenuItemTag", 0);
        objc_msgSend_insertSectionInfo_atIndex_withRowAnimation_(v50, v48, v49, 0, 100);
      }
    }
  }
}

- (void)updateSelections
{
  if (objc_opt_respondsToSelector()) {
    objc_msgSend_selectedDeviceUpdated(self, v3, v4);
  }
  uint64_t v6 = objc_msgSend_objectForKey_(self->_selectedDevice, v3, @"BSSID");
  selectedDevice = self->_selectedDevice;
  if (v6)
  {
    self->_sourceNetwork = selectedDevice;
    objc_msgSend_objectForKey_(selectedDevice, v5, @"SSID_STR");
    if (self->_showSingleBaseTopo) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = self->_selectedDevice;
    }
    self->_sourceBase = v9;
    uint64_t v30 = self->_selectedDevice;
    if (v30) {
      objc_msgSend_setObject_forKey_(self->super.super._outResultsDict, v8, (uint64_t)v30, @"kSBSKey_SourceNetwork");
    }
    uint64_t v80 = 0;
    uint64_t v81 = 0;
  }
  else
  {
    self->_sourceBase = selectedDevice;
    objc_msgSend_objectForKey_(selectedDevice, v5, @"raNm");
    v16 = self->_selectedDevice;
    if (v16) {
      objc_msgSend_setObject_forKey_(self->super.super._outResultsDict, v10, (uint64_t)v16, @"kSBSKey_SourceBase");
    }
    uint64_t v17 = NSNumber;
    unsigned int v18 = sub_22685AB94((const __CFString *)self->_sourceBase, (uint64_t)v10, (uint64_t)v16, v11, v12, v13, v14, v15);
    uint64_t v81 = objc_msgSend_numberWithInteger_(v17, v19, v18);
    uint64_t v20 = NSNumber;
    unsigned int v28 = sub_22685AB68((uint64_t)self->_sourceBase, v21, v22, v23, v24, v25, v26, v27);
    uint64_t v80 = objc_msgSend_numberWithInteger_(v20, v29, v28);
  }
  v31 = NSNumber;
  uint64_t v32 = objc_msgSend_inParamDict(self, v8, (uint64_t)v30);
  unsigned int ProductIDFromParamDict = objc_msgSend_getProductIDFromParamDict_(StepByStepUtilities, v33, v32);
  uint64_t v36 = objc_msgSend_numberWithInteger_(v31, v35, ProductIDFromParamDict);
  uint64_t v37 = NSNumber;
  uint64_t v40 = objc_msgSend_inParamDict(self, v38, v39);
  unsigned int DeviceKindFromParamDict = objc_msgSend_getDeviceKindFromParamDict_(StepByStepUtilities, v41, v40);
  uint64_t v44 = objc_msgSend_numberWithInteger_(v37, v43, DeviceKindFromParamDict);
  v47 = objc_msgSend_parentController(self, v45, v46);
  uint64_t v50 = objc_msgSend__assistantUIController(v47, v48, v49);
  v53 = objc_msgSend_topoView(self, v51, v52);
  uint64_t v56 = objc_msgSend_layer(v53, v54, v55);
  uint64_t v59 = objc_msgSend_topoLayout(self, v57, v58);
  uint64_t v62 = objc_msgSend_topoView(self, v60, v61);
  v65 = objc_msgSend_inParamDict(self, v63, v64);
  uint64_t v67 = objc_msgSend_objectForKey_(v65, v66, @"kSBSKey_TargetNetwork");
  v70 = (const char *)objc_msgSend_integerValue(v36, v68, v69);
  v71 = sub_22685D9D0(v67, v70, 0);
  uint64_t v73 = objc_msgSend_objectForKey_(self->_sourceBase, v72, @"name");
  uint64_t v76 = objc_msgSend_connectionMedium(self, v74, v75);
  uint64_t v79 = objc_msgSend_modifyTopoUIInLayer_withLayout_andOwningView_targetProductID_targetDeviceKind_targetName_targetWiFiName_sourceProductID_sourceDeviceKind_sourceName_sourceWiFiName_connectionType_(v50, v77, v56, v59, v62, v36, v44, v71, 0, v81, v80, v73, 0, v76);

  objc_msgSend_setTopoLayout_(self, v78, v79);
}

- (BOOL)showMoreOptions
{
  return 1;
}

- (id)pickerContent
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  uint64_t v6 = objc_msgSend_array(MEMORY[0x263EFF980], a2, v2);
  if (self->showFullList)
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id obj = (id)objc_msgSend_sortedDevices(self, v4, v5);
    uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v37, v41, 16);
    if (v8)
    {
      uint64_t v11 = v8;
      uint64_t v12 = 0;
      uint64_t v13 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v38 != v13) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void *)(*((void *)&v37 + 1) + 8 * i);
          v16 = objc_msgSend_tableManager(self, v9, v10);
          uint64_t v18 = objc_msgSend_nameForNetworkOrDevice_(StepByStepUtilities, v17, v15);
          uint64_t RowStyleBasicWithImage_text1_text2_withTag = objc_msgSend_createRowStyleBasicWithImage_text1_text2_withTag_(v16, v19, 0, v18, 0, v12 + i);
          objc_msgSend_addObject_(v6, v21, RowStyleBasicWithImage_text1_text2_withTag);
        }
        uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v37, v41, 16);
        v12 += i;
      }
      while (v11);
    }
  }
  else
  {
    uint64_t v22 = objc_msgSend_tableManager(self, v4, v5);
    uint64_t v24 = objc_msgSend_nameForNetworkOrDevice_(StepByStepUtilities, v23, (uint64_t)self->_selectedDevice);
    uint64_t v26 = objc_msgSend_createRowStyleBasicWithImage_text1_text2_withTag_(v22, v25, 0, v24, 0, 1400203111);
    objc_msgSend_addObject_(v6, v27, v26);
    uint64_t v30 = objc_msgSend_tableManager(self, v28, v29);
    uint64_t v31 = sub_22685D62C(@"ShowOtherNetworksEllipsis", qword_268148378);
    uint64_t v33 = objc_msgSend_createRowStyleBasicWithImage_text1_text2_withTag_(v30, v32, 0, v31, 0, 1333028978);
    objc_msgSend_addObject_(v6, v34, v33);
  }
  return v6;
}

- (NSArray)sortedDevices
{
  return self->sortedDevices;
}

- (void)setSortedDevices:(id)a3
{
}

- (NSString)connectionMedium
{
  return self->connectionMedium;
}

- (void)setConnectionMedium:(id)a3
{
  self->connectionMedium = (NSString *)a3;
}

- (RecommendationActionController)actionController
{
  return self->actionController;
}

- (void)setActionController:(id)a3
{
}

@end