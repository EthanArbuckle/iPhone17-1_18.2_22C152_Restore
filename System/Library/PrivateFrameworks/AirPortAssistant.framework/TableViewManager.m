@interface TableViewManager
+ (id)boldSystemLabelFont;
+ (id)smallSystemLabelFont;
+ (id)systemLabelFont;
- (BOOL)becomeFirstResponderAtIndexPath:(id)a3;
- (BOOL)checkIfSectionDataSameInTable:(id)a3;
- (BOOL)isCellAtIndexPath:(id)a3 identicalToNewRow:(id)a4;
- (BOOL)setNewRow:(id)a3 itemAttribute:(id)a4 forItemOfType:(id)a5 atItemTypeIndex:(unint64_t)a6 toValue:(id)a7;
- (BOOL)tableView:(id)a3 canPerformAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6;
- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldShowMenuForRowAtIndexPath:(id)a4;
- (BOOL)tagOfCellAtIndexPath:(id)a3 tag:(int64_t *)a4;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldHasVerifierAtIndexPath:(id)a3;
- (BOOL)textFieldIsSecureAndUnchanged:(id)a3;
- (BOOL)textFieldShouldBeginEditing:(id)a3;
- (BOOL)textFieldShouldClear:(id)a3;
- (BOOL)textFieldShouldReturn:(id)a3;
- (BOOL)textFieldVerifiedAtIndexPath:(id)a3;
- (BOOL)updateRowAtIndexPath:(id)a3 withNewRowInfo:(id)a4;
- (BOOL)updateSectionsIfMatchingExisting:(id)a3;
- (BOOL)verifyStr1:(id)a3 forTag1:(unint64_t)a4 matchesStr2:(id)a5 forTag2:(unint64_t)a6;
- (TableViewManager)init;
- (TableViewManagerDelegate)delegate;
- (UITableView)managedTableView;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (double)totalTableHeight;
- (double)totalTableSectionsHeight;
- (id)activityView:(id)a3;
- (id)buttonView:(id)a3;
- (id)cellInfoOfSelectedRowInMenuSection:(unint64_t)a3;
- (id)commonAddOptionalBasicImage:(id)a3 withNeighborItem:(id)a4 toCellItems:(id)a5;
- (id)commonAddOptionalStaticText:(id)a3 withNeighborItem:(id)a4 toCellItems:(id)a5;
- (id)createRowStyleActivityStatus:(BOOL)a3 text1:(id)a4 grayedText1:(BOOL)a5 text2:(id)a6 grayedText2:(BOOL)a7 withTag:(unint64_t)a8;
- (id)createRowStyleBasicButtons:(id)a3 title2:(id)a4 withTag:(unint64_t)a5;
- (id)createRowStyleBasicEditableWithImage:(id)a3 labelText:(id)a4 currentValue:(id)a5 placeholderText:(id)a6 isSecure:(BOOL)a7 keyboardType:(int64_t)a8 withTag:(unint64_t)a9;
- (id)createRowStyleBasicOnOffWithImage:(id)a3 labelText:(id)a4 isOn:(BOOL)a5 withTag:(unint64_t)a6;
- (id)createRowStyleBasicWholeCellButton:(id)a3 withTag:(unint64_t)a4;
- (id)createRowStyleBasicWithImage:(id)a3 text1:(id)a4 text2:(id)a5 withTag:(unint64_t)a6;
- (id)createRowStyleBasicWithText:(id)a3 centerImage:(id)a4 text2:(id)a5 withTag:(unint64_t)a6;
- (id)createRowStyleBasicWithUnreadBubble:(unint64_t)a3 text1:(id)a4 text2:(id)a5 withTag:(unint64_t)a6;
- (id)createRowStyleDatePicker:(id)a3 minimumDate:(id)a4 maximumDate:(id)a5 withMode:(int64_t)a6 withTag:(unint64_t)a7;
- (id)createRowStyleProgressViewWithCancelAndStatus:(id)a3 statusText:(id)a4 altText:(id)a5 withTag:(unint64_t)a6;
- (id)createRowStyleSegmentedControlWithItems:(id)a3 selectedSegmentIndex:(id)a4 enabled:(BOOL)a5 withTag:(unint64_t)a6;
- (id)createRowStyleSubtitleWitImage:(id)a3 mainText:(id)a4 subtitleText:(id)a5 withTag:(unint64_t)a6;
- (id)createRowStyleSubtitleWithRightImage:(id)a3 subtitleText:(id)a4 rightImage:(id)a5 withTag:(unint64_t)a6;
- (id)createRowStyleSubtitleWithRightText:(id)a3 subtitleText:(id)a4 rightText:(id)a5 withTag:(unint64_t)a6;
- (id)createRowStyleTitledParagraph:(id)a3 titleImage:(id)a4 bodyText:(id)a5 withTag:(unint64_t)a6;
- (id)createRowStyleTitledParagraphWithLeftImage:(id)a3 title:(id)a4 bodyText:(id)a5 withTag:(unint64_t)a6;
- (id)createRowStyleTitledStaticMultiline:(id)a3 titleImage:(id)a4 bodyText:(id)a5 withTag:(unint64_t)a6;
- (id)datePicker:(id)a3;
- (id)editTextView:(id)a3;
- (id)findFirstResponderInTableView:(id)a3 foundParentCell:(id *)a4;
- (id)findFirstResponderInTableView:(id)a3 fromSection:(unint64_t)a4 fromRow:(unint64_t)a5 foundParentCell:(id *)a6;
- (id)findFirstResponderInView:(id)a3;
- (id)findNextResponderInTableView:(id)a3 foundParentCell:(id *)a4;
- (id)getCellDictForCellAtIndexPath:(id)a3;
- (id)getDescriptorObjectForKey:(id)a3 inSection:(int64_t)a4;
- (id)getInfoForItemOfType:(id)a3 atItemTypeIndex:(unint64_t)a4 inCell:(id)a5;
- (id)getRepresentedObjectForCellAtIndexPath:(id)a3;
- (id)getRowArrayForSection:(unint64_t)a3;
- (id)getSectionDictForSection:(int64_t)a3;
- (id)getValueForFirstItemOfType:(id)a3 inCellAtIndexPath:(id)a4;
- (id)getValueForFirstItemOfType:(id)a3 inCellWithTag:(int64_t)a4;
- (id)getValueForItemOfType:(id)a3 atItemTypeIndex:(unint64_t)a4 inCell:(id)a5;
- (id)getValueForItemOfType:(id)a3 atItemTypeIndex:(unint64_t)a4 inCellAtIndexPath:(id)a5;
- (id)getValueForItemOfType:(id)a3 atItemTypeIndex:(unint64_t)a4 inCellWithTag:(int64_t)a5;
- (id)imageView:(id)a3;
- (id)indexPathOfCellWithTag:(int64_t)a3;
- (id)indexPathOfFirstCellWithUnverifiedVerifier;
- (id)labelView:(id)a3;
- (id)multilineLabelView:(id)a3;
- (id)progressView:(id)a3;
- (id)segmentedControlView:(id)a3;
- (id)switchView:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 layoutMode:(BOOL)a5;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (id)unreadBubbleCount:(id)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)findAndSetItemObject:(id)a3 toValue:(id)a4 inCellWithInternalRowSectionTagValue:(unint64_t)a5;
- (unint64_t)indexOfSectionWithIdentifier:(id)a3;
- (unint64_t)indexOfSelectedRowInMenuSection:(unint64_t)a3;
- (unint64_t)tagOfSelectedRowInMenuSection:(unint64_t)a3;
- (void)addSectionInfo:(id)a3;
- (void)addSectionInfo:(id)a3 animated:(BOOL)a4;
- (void)appendNewRow:(id)a3 forSection:(unint64_t)a4;
- (void)awakeFromNib;
- (void)bulkUpdateBegin;
- (void)bulkUpdateEnd;
- (void)buttonAction:(id)a3;
- (void)cleanTableViewForReuse;
- (void)dealloc;
- (void)deferedTouchInCellAtIndexPath:(id)a3;
- (void)deleteAllRowsInSection:(unint64_t)a3;
- (void)deleteAllRowsInSectionCore:(unint64_t)a3;
- (void)deleteRowInSection:(unint64_t)a3 withTag:(int64_t)a4;
- (void)deleteRowsAtIndexPaths:(id)a3 withRowAnimation:(int64_t)a4;
- (void)deleteSection:(unint64_t)a3;
- (void)deleteSectionWithIdentifier:(id)a3;
- (void)deleteSectionWithIdentifier:(id)a3 animated:(BOOL)a4;
- (void)deleteSections:(id)a3 withRowAnimation:(int64_t)a4;
- (void)endEditing;
- (void)informOfNewCellLeftEdge:(double)a3 andWidth:(double)a4;
- (void)initializeTableViewManagerCommon;
- (void)insertNewRows:(id)a3 atIndexPaths:(id)a4 withRowAnimation:(int64_t)a5;
- (void)insertSectionInfo:(id)a3 atIndex:(unint64_t)a4 withRowAnimation:(int64_t)a5;
- (void)makeFirstEditableCellCurrentResponder;
- (void)recordInitialSelectedMenuItemsForNewSection:(int64_t)a3;
- (void)reloadSection:(unint64_t)a3;
- (void)segmentedControlValueChanged:(id)a3;
- (void)selectMenuCellAtIndexPath:(id)a3;
- (void)selectedDateChanged:(id)a3;
- (void)setActivityViewValue:(id)a3 usingItemInfo:(id)a4;
- (void)setButtonViewValue:(id)a3 usingItemInfo:(id)a4;
- (void)setCellRowInfoItem:(id)a3 atIndex:(unint64_t)a4 forKey:(id)a5 toValue:(id)a6;
- (void)setDatePickerValue:(id)a3 usingItemInfo:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setDescriptorObject:(id)a3 forKey:(id)a4 inSection:(int64_t)a5;
- (void)setEditTextViewValue:(id)a3 usingItemInfo:(id)a4;
- (void)setImageViewValue:(id)a3 usingItemInfo:(id)a4;
- (void)setLabelViewValue:(id)a3 usingItemInfo:(id)a4;
- (void)setManagedTableView:(id)a3;
- (void)setMenuCell:(id)a3 visualStateToSelected:(BOOL)a4 atIndexPath:(id)a5;
- (void)setMinValue:(id)a3 andMaxValue:(id)a4 forItem:(id)a5;
- (void)setMinValue:(id)a3 andMaxValue:(id)a4 forItemOfType:(id)a5 atItemTypeIndex:(unint64_t)a6 inCellWithTag:(int64_t)a7;
- (void)setMultilineLabelViewValue:(id)a3 usingItemInfo:(id)a4;
- (void)setNewRow:(id)a3 accessoryType:(int64_t)a4;
- (void)setNewRow:(id)a3 accessoryView:(id)a4;
- (void)setNewRow:(id)a3 editingAccessoryType:(int64_t)a4;
- (void)setNewRow:(id)a3 editingAccessoryView:(id)a4;
- (void)setNewRow:(id)a3 editingStyle:(int64_t)a4;
- (void)setNewRow:(id)a3 representedObject:(id)a4;
- (void)setNewRow:(id)a3 selectableCell:(BOOL)a4;
- (void)setNewRow:(id)a3 tag:(unint64_t)a4;
- (void)setNewRow:(id)a3 textFieldViewMode:(int64_t)a4;
- (void)setNewRow:(id)a3 verifierAccessoryType:(int)a4;
- (void)setProgressViewValue:(id)a3 usingItemInfo:(id)a4;
- (void)setRepresentedObject:(id)a3 forCellAtIndexPath:(id)a4;
- (void)setSectionValue:(id)a3 forKey:(id)a4 inSection:(unint64_t)a5;
- (void)setSwitchViewValue:(id)a3 usingItemInfo:(id)a4;
- (void)setUnreadBubbleCountValue:(id)a3 usingItemInfo:(id)a4;
- (void)setValue:(id)a3 forItem:(id)a4;
- (void)setValue:(id)a3 forItemOfType:(id)a4 atItemTypeIndex:(unint64_t)a5 inCellAtIndexPath:(id)a6;
- (void)setValue:(id)a3 forItemOfType:(id)a4 atItemTypeIndex:(unint64_t)a5 inCellWithTag:(int64_t)a6;
- (void)setVerifierAccessoryView:(int)a3 forCell:(id)a4;
- (void)setVerifierCellAccessoryType:(int)a3 forCellsAtIndexPaths:(id)a4;
- (void)switchAction:(id)a3;
- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 performAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
- (void)uiTextFieldDidChange:(id)a3;
- (void)updateCellAtIndexPath:(id)a3 withNewRowInfo:(id)a4;
- (void)updateFooter:(id)a3 forSectionWithIdentifier:(id)a4;
- (void)updateFooter:(id)a3 inSection:(unint64_t)a4;
- (void)updateHeader:(id)a3 forSectionWithIdentifier:(id)a4;
- (void)updateHeader:(id)a3 inSection:(unint64_t)a4;
- (void)updateSectionDataInIdenticalTable:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TableViewManager

- (void)informOfNewCellLeftEdge:(double)a3 andWidth:(double)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  self->_cellLeftEdgeOrigin = a3;
  self->_cellContentWidth = a4;
  v5 = objc_msgSend_objectForKey_(self->_tableDescriptorDict, a2, @"tableSectionArray");
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  obuint64_t j = v5;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v29, v34, 16);
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v30 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = objc_msgSend_objectForKey_(*(void **)(*((void *)&v29 + 1) + 8 * i), v8, @"headerCache");
        if (v12)
        {
          long long v27 = 0u;
          long long v28 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          v14 = objc_msgSend_subviews(v12, v8, v13);
          uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v25, v33, 16);
          if (v16)
          {
            uint64_t v18 = v16;
            uint64_t v19 = *(void *)v26;
            do
            {
              for (uint64_t j = 0; j != v18; ++j)
              {
                if (*(void *)v26 != v19) {
                  objc_enumerationMutation(v14);
                }
                v21 = *(void **)(*((void *)&v25 + 1) + 8 * j);
                objc_msgSend_frame(v21, v8, v17);
                objc_msgSend_setFrame_(v21, v22, v23, self->_cellLeftEdgeOrigin + 10.0);
              }
              uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v8, (uint64_t)&v25, v33, 16);
            }
            while (v18);
          }
        }
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v29, v34, 16);
    }
    while (v9);
  }
}

- (void)endEditing
{
  objc_msgSend_resignFirstResponder(self->_currentFirstResponder, a2, v2);
  self->_currentFirstResponder = 0;

  self->_currentFirstResponderCellPath = 0;
}

- (void)initializeTableViewManagerCommon
{
  self->_detailTextColor = (UIColor *)(id)objc_msgSend__labelColor(MEMORY[0x263F1C550], a2, v2);
  self->_selectedTextColor = (UIColor *)(id)objc_msgSend__labelColor(MEMORY[0x263F1C550], v4, v5);
  self->_editTextColor = (UIColor *)(id)objc_msgSend_systemBlueColor(MEMORY[0x263F1C550], v6, v7);
  self->_subtitleColor = (UIColor *)(id)objc_msgSend__secondaryLabelColor(MEMORY[0x263F1C550], v8, v9);
  uint64_t v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  self->_tableDescriptorDict = v10;
  id v12 = objc_alloc_init(MEMORY[0x263EFF980]);

  objc_msgSend_setObject_forKey_(v10, v11, (uint64_t)v12, @"tableSectionArray");
}

- (void)awakeFromNib
{
  objc_msgSend_initializeTableViewManagerCommon(self, a2, v2);
  v4.receiver = self;
  v4.super_class = (Class)TableViewManager;
  [(TableViewManager *)&v4 awakeFromNib];
}

- (TableViewManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)TableViewManager;
  uint64_t v2 = [(TableViewManager *)&v7 init];
  uint64_t v5 = v2;
  if (v2) {
    objc_msgSend_initializeTableViewManagerCommon(v2, v3, v4);
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v4 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], a2, v2);
  objc_msgSend_removeObserver_(v4, v5, (uint64_t)self);
  objc_msgSend_setManagedTableView_(self, v6, 0);

  v7.receiver = self;
  v7.super_class = (Class)TableViewManager;
  [(TableViewManager *)&v7 dealloc];
}

- (void)setManagedTableView:(id)a3
{
  if (dword_268147B18 <= 800 && (dword_268147B18 != -1 || sub_226865630((uint64_t)&dword_268147B18, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147B18, (uint64_t)"-[TableViewManager setManagedTableView:]", 800, (uint64_t)"%@\n", v3, v4, v5, v6, (uint64_t)a3);
  }
  objc_msgSend_setDelegate_(a3, a2, (uint64_t)self);
  objc_msgSend_setDataSource_(a3, v9, (uint64_t)self);
  managedTableView = self->_managedTableView;
  if (managedTableView != a3)
  {
    objc_msgSend_setDataSource_(managedTableView, v10, 0);
    objc_msgSend_setDelegate_(self->_managedTableView, v12, 0);

    id v13 = a3;
    self->_managedTableView = (UITableView *)a3;
  }
}

- (UITableView)managedTableView
{
  return self->_managedTableView;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = a3;
}

- (TableViewManagerDelegate)delegate
{
  if (*((void *)self + 3)) {
    return (TableViewManagerDelegate *)*((void *)self + 3);
  }
  return self;
}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v4 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], a2, a3);
  uint64_t v6 = *MEMORY[0x263F1D778];

  objc_msgSend_addObserver_selector_name_object_(v4, v5, (uint64_t)self, sel_uiTextFieldDidChange_, v6, 0);
}

- (void)viewWillDisappear:(BOOL)a3
{
  uint64_t v4 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], a2, a3);
  uint64_t v6 = *MEMORY[0x263F1D778];

  objc_msgSend_removeObserver_name_object_(v4, v5, (uint64_t)self, v6, 0);
}

- (void)insertNewRows:(id)a3 atIndexPaths:(id)a4 withRowAnimation:(int64_t)a5
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(a4, a2, (uint64_t)&v50, v54, 16);
  if (v8)
  {
    uint64_t v11 = v8;
    uint64_t v12 = 0;
    uint64_t v13 = *(void *)v51;
    int64_t v48 = a5;
LABEL_3:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v51 != v13) {
        objc_enumerationMutation(a4);
      }
      v15 = *(void **)(*((void *)&v50 + 1) + 8 * v14);
      unint64_t v16 = objc_msgSend_row(v15, v9, v10);
      unint64_t v24 = objc_msgSend_section(v15, v17, v18);
      if (dword_268147B18 <= 800 && (dword_268147B18 != -1 || sub_226865630((uint64_t)&dword_268147B18, 0x320u))) {
        sub_226865EB4((uint64_t)&dword_268147B18, (uint64_t)"-[TableViewManager insertNewRows:atIndexPaths:withRowAnimation:]", 800, (uint64_t)"section %d  row %d\n", v20, v21, v22, v23, v24);
      }
      long long v25 = objc_msgSend_objectForKey_(self->_tableDescriptorDict, v19, @"tableSectionArray");
      unint64_t v28 = objc_msgSend_count(v25, v26, v27);
      if (v24 > v28) {
        break;
      }
      if (v24 >= v28)
      {
        id v34 = objc_alloc_init(MEMORY[0x263EFF980]);
        uint64_t v37 = objc_msgSend_dictionaryWithObject_forKey_(MEMORY[0x263EFF9A0], v36, (uint64_t)v34, @"sectionRows");
        objc_msgSend_addObject_(v25, v38, v37);
        managedTableView = self->_managedTableView;
        uint64_t v41 = objc_msgSend_indexSetWithIndex_(MEMORY[0x263F088D0], v40, v24);
        objc_msgSend_insertSections_withRowAnimation_(managedTableView, v42, v41, 3);
      }
      else
      {
        long long v30 = objc_msgSend_objectAtIndex_(v25, v29, v24);
        id v34 = (id)objc_msgSend_objectForKey_(v30, v31, @"sectionRows");
        if (!v34)
        {
          id v34 = objc_alloc_init(MEMORY[0x263EFF980]);
          objc_msgSend_setObject_forKey_(v30, v35, (uint64_t)v34, @"sectionRows");
        }
      }
      if (v16 > objc_msgSend_count(v34, v32, v33) || v12 + v14 >= (unint64_t)objc_msgSend_count(a3, v43, v44)) {
        break;
      }
      uint64_t v46 = objc_msgSend_objectAtIndex_(a3, v45, v12 + v14);
      objc_msgSend_insertObject_atIndex_(v34, v47, v46, v16);
      if (v11 == ++v14)
      {
        uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(a4, v9, (uint64_t)&v50, v54, 16);
        v12 += v14;
        a5 = v48;
        if (v11) {
          goto LABEL_3;
        }
        goto LABEL_19;
      }
    }
  }
  else
  {
LABEL_19:
    objc_msgSend_insertRowsAtIndexPaths_withRowAnimation_(self->_managedTableView, v9, (uint64_t)a4, a5);
  }
}

- (void)appendNewRow:(id)a3 forSection:(unint64_t)a4
{
  objc_super v7 = objc_msgSend_objectForKey_(self->_tableDescriptorDict, a2, @"tableSectionArray");
  unint64_t v10 = objc_msgSend_count(v7, v8, v9);
  if (v10 >= a4)
  {
    if (v10 > a4)
    {
      uint64_t v12 = objc_msgSend_objectAtIndex_(v7, v11, a4);
      id v14 = (id)objc_msgSend_objectForKey_(v12, v13, @"sectionRows");
    }
    else
    {
      id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
      uint64_t v16 = objc_msgSend_dictionaryWithObject_forKey_(MEMORY[0x263EFF9A0], v15, (uint64_t)v14, @"sectionRows");
      objc_msgSend_addObject_(v7, v17, v16);
      managedTableView = self->_managedTableView;
      uint64_t v20 = objc_msgSend_indexSetWithIndex_(MEMORY[0x263F088D0], v19, a4);
      objc_msgSend_insertSections_withRowAnimation_(managedTableView, v21, v20, 100);
    }
    if (dword_268147B18 <= 800 && (dword_268147B18 != -1 || sub_226865630((uint64_t)&dword_268147B18, 0x320u))) {
      sub_226865EB4((uint64_t)&dword_268147B18, (uint64_t)"-[TableViewManager appendNewRow:forSection:]", 800, (uint64_t)"appending row to section %d\n", v24, v25, v26, v27, a4);
    }
    unint64_t v28 = (void *)MEMORY[0x263F088C8];
    uint64_t v29 = objc_msgSend_count(v14, v22, v23);
    uint64_t v31 = objc_msgSend_indexPathForRow_inSection_(v28, v30, v29, a4);
    objc_msgSend_addObject_(v14, v32, (uint64_t)a3);
    uint64_t v33 = self->_managedTableView;
    uint64_t v36 = objc_msgSend_arrayWithObject_(MEMORY[0x263EFF8C0], v34, v31);
    objc_msgSend_insertRowsAtIndexPaths_withRowAnimation_(v33, v35, v36, 100);
  }
}

- (void)updateCellAtIndexPath:(id)a3 withNewRowInfo:(id)a4
{
  id v34 = a4;
  if (dword_268147C58 <= 800 && (dword_268147C58 != -1 || sub_226865630((uint64_t)&dword_268147C58, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147C58, (uint64_t)"-[TableViewManager updateCellAtIndexPath:withNewRowInfo:]", 800, (uint64_t)"\n", v4, v5, v6, v7, (uint64_t)v34);
  }
  uint64_t CellDictForCellAtIndexPath = objc_msgSend_getCellDictForCellAtIndexPath_(self, a2, (uint64_t)a3, v34);
  if (CellDictForCellAtIndexPath)
  {
    unint64_t v10 = (void *)CellDictForCellAtIndexPath;
    uint64_t v11 = objc_msgSend_objectForKey_(v35, v9, @"representedObject");
    if (v11) {
      objc_msgSend_setObject_forKey_(v10, v12, v11, @"representedObject");
    }
    v38 = objc_msgSend_objectForKey_(v35, v12, @"items");
    uint64_t v15 = objc_msgSend_count(v38, v13, v14);
    if (v15)
    {
      uint64_t v17 = v15;
      uint64_t v18 = 0;
      uint64_t v19 = 0;
      uint64_t v20 = 0;
      uint64_t v21 = 0;
      while (1)
      {
        uint64_t v22 = objc_msgSend_objectAtIndex_(v38, v16, v21);
        uint64_t v24 = objc_msgSend_objectForKey_(v22, v23, @"itemType");
        if (objc_msgSend_isEqualToString_(v24, v25, @"editTextView"))
        {
          uint64_t v26 = objc_msgSend_objectForKey_(v35, v16, @"tag");
          if (objc_msgSend_integerValue(v26, v27, v28) != 1987203160)
          {
            uint64_t v30 = v20 + 1;
            uint64_t v29 = v19;
            uint64_t v31 = v18;
            goto LABEL_17;
          }
        }
        if (objc_msgSend_isEqualToString_(v24, v16, @"labelView")) {
          break;
        }
        if (objc_msgSend_isEqualToString_(v24, v16, @"multilineLabelView"))
        {
          uint64_t v31 = v18 + 1;
          uint64_t v30 = v20;
          uint64_t v29 = v19;
          uint64_t v20 = v18;
          goto LABEL_17;
        }
LABEL_18:
        if (v17 == ++v21) {
          return;
        }
      }
      uint64_t v29 = v19 + 1;
      uint64_t v30 = v20;
      uint64_t v31 = v18;
      uint64_t v20 = v19;
LABEL_17:
      uint64_t v32 = objc_msgSend_objectForKey_(v22, v16, @"startValue");
      objc_msgSend_setValue_forItemOfType_atItemTypeIndex_inCellAtIndexPath_(self, v33, v32, v24, v20, a3);
      uint64_t v18 = v31;
      uint64_t v19 = v29;
      uint64_t v20 = v30;
      goto LABEL_18;
    }
  }
}

- (BOOL)isCellAtIndexPath:(id)a3 identicalToNewRow:(id)a4
{
  if (dword_268147C58 <= 800 && (dword_268147C58 != -1 || sub_226865630((uint64_t)&dword_268147C58, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147C58, (uint64_t)"-[TableViewManager isCellAtIndexPath:identicalToNewRow:]", 800, (uint64_t)"\n", v4, v5, v6, v7, v49);
  }
  uint64_t CellDictForCellAtIndexPath = objc_msgSend_getCellDictForCellAtIndexPath_(self, a2, (uint64_t)a3);
  if (CellDictForCellAtIndexPath)
  {
    uint64_t v13 = (void *)CellDictForCellAtIndexPath;
    uint64_t v14 = objc_msgSend_objectForKey_(a4, v12, @"representedObject");
    uint64_t v18 = objc_msgSend_objectForKey_(v13, v15, @"representedObject");
    LOBYTE(CellDictForCellAtIndexPath) = 0;
    if (v14)
    {
      if (v18)
      {
        uint64_t CellDictForCellAtIndexPath = objc_msgSend_delegate(self, v16, v17);
        if (CellDictForCellAtIndexPath)
        {
          objc_msgSend_delegate(self, v19, v20);
          if (objc_opt_respondsToSelector())
          {
            uint64_t v23 = objc_msgSend_delegate(self, v21, v22);
            LODWORD(CellDictForCellAtIndexPath) = objc_msgSend_isRepresentedObject_identicalToRepresentedObject_(v23, v24, v14, v18);
            if (CellDictForCellAtIndexPath)
            {
              uint64_t v26 = objc_msgSend_objectForKey_(a4, v25, @"items");
              uint64_t v28 = objc_msgSend_objectForKey_(v13, v27, @"items");
              uint64_t v31 = objc_msgSend_count(v26, v29, v30);
              uint64_t v35 = objc_msgSend_count(v28, v32, v33);
              LOBYTE(CellDictForCellAtIndexPath) = 1;
              if (v31 == v35)
              {
                uint64_t v36 = v31 - 1;
                if (v31 >= 1)
                {
                  uint64_t v37 = 0;
                  do
                  {
                    v38 = objc_msgSend_objectAtIndex_(v26, v34, v37);
                    v40 = objc_msgSend_objectForKey_(v38, v39, @"itemType");
                    v42 = objc_msgSend_objectAtIndex_(v28, v41, v37);
                    uint64_t v44 = objc_msgSend_objectForKey_(v42, v43, @"itemType");
                    int isEqualToString = objc_msgSend_isEqualToString_(v40, v45, v44);
                    LOBYTE(CellDictForCellAtIndexPath) = 1;
                    if (!isEqualToString) {
                      break;
                    }
                  }
                  while (v36 != v37++);
                }
              }
            }
          }
          else
          {
            LOBYTE(CellDictForCellAtIndexPath) = 0;
          }
        }
      }
    }
  }
  return CellDictForCellAtIndexPath;
}

- (BOOL)updateRowAtIndexPath:(id)a3 withNewRowInfo:(id)a4
{
  if (dword_268147C58 <= 800 && (dword_268147C58 != -1 || sub_226865630((uint64_t)&dword_268147C58, 0x320u)))
  {
    uint64_t v7 = objc_msgSend_section(a3, a2, (uint64_t)a3);
    objc_msgSend_row(a3, v8, v9);
    sub_226865EB4((uint64_t)&dword_268147C58, (uint64_t)"-[TableViewManager updateRowAtIndexPath:withNewRowInfo:]", 800, (uint64_t)"section %d  row %d\n", v10, v11, v12, v13, v7);
  }
  int isCellAtIndexPath_identicalToNewRow = objc_msgSend_isCellAtIndexPath_identicalToNewRow_(self, a2, (uint64_t)a3, a4);
  if (isCellAtIndexPath_identicalToNewRow) {
    objc_msgSend_updateCellAtIndexPath_withNewRowInfo_(self, v14, (uint64_t)a3, a4);
  }
  return isCellAtIndexPath_identicalToNewRow;
}

- (void)updateSectionDataInIdenticalTable:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  if (dword_268147C58 <= 800 && (dword_268147C58 != -1 || sub_226865630((uint64_t)&dword_268147C58, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147C58, (uint64_t)"-[TableViewManager updateSectionDataInIdenticalTable:]", 800, (uint64_t)"\n", v3, v4, v5, v6, v21);
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, a2, (uint64_t)&v29, v34, 16);
  if (v24)
  {
    uint64_t v9 = 0;
    uint64_t v23 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v30 != v23) {
          objc_enumerationMutation(a3);
        }
        uint64_t v11 = objc_msgSend_objectForKey_(*(void **)(*((void *)&v29 + 1) + 8 * i), v8, @"sectionRows");
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v25, v33, 16);
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = 0;
          uint64_t v16 = *(void *)v26;
          do
          {
            for (uint64_t j = 0; j != v14; ++j)
            {
              if (*(void *)v26 != v16) {
                objc_enumerationMutation(v11);
              }
              uint64_t v18 = *(void *)(*((void *)&v25 + 1) + 8 * j);
              uint64_t v19 = objc_msgSend_indexPathForRow_inSection_(MEMORY[0x263F088C8], v8, v15 + j, v9);
              objc_msgSend_updateCellAtIndexPath_withNewRowInfo_(self, v20, v19, v18);
            }
            uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v8, (uint64_t)&v25, v33, 16);
            v15 += j;
          }
          while (v14);
        }
        ++v9;
      }
      uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v8, (uint64_t)&v29, v34, 16);
    }
    while (v24);
  }
}

- (BOOL)checkIfSectionDataSameInTable:(id)a3
{
  id v7 = a3;
  uint64_t v55 = *MEMORY[0x263EF8340];
  if (dword_268147C58 <= 800 && (dword_268147C58 != -1 || sub_226865630((uint64_t)&dword_268147C58, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147C58, (uint64_t)"-[TableViewManager checkIfSectionDataSameInTable:]", 800, (uint64_t)"\n", v3, v4, v5, v6, v41);
  }
  uint64_t v9 = objc_msgSend_count(v7, a2, (uint64_t)a3);
  uint64_t v12 = objc_msgSend_managedTableView(self, v10, v11);
  if (v9 == objc_msgSend_numberOfSections(v12, v13, v14))
  {
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v15, (uint64_t)&v49, v54, 16);
    if (!v16)
    {
      LOBYTE(isCellAtIndexPath_identicalToNewRow) = 1;
      return isCellAtIndexPath_identicalToNewRow;
    }
    uint64_t v18 = v16;
    uint64_t v19 = 0;
    uint64_t v20 = *(void *)v50;
    uint64_t v42 = *(void *)v50;
    v43 = v7;
LABEL_8:
    uint64_t v21 = 0;
    uint64_t v44 = v18;
    while (1)
    {
      if (*(void *)v50 != v20) {
        objc_enumerationMutation(v7);
      }
      uint64_t v22 = objc_msgSend_objectForKey_(*(void **)(*((void *)&v49 + 1) + 8 * v21), v17, @"sectionRows");
      uint64_t v25 = objc_msgSend_count(v22, v23, v24);
      long long v28 = objc_msgSend_managedTableView(self, v26, v27);
      if (v25 != objc_msgSend_numberOfRowsInSection_(v28, v29, v19)) {
        break;
      }
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v30, (uint64_t)&v45, v53, 16);
      if (v31)
      {
        uint64_t v32 = v31;
        uint64_t v33 = 0;
        uint64_t v34 = *(void *)v46;
LABEL_14:
        uint64_t v35 = 0;
        while (1)
        {
          if (*(void *)v46 != v34) {
            objc_enumerationMutation(v22);
          }
          uint64_t v36 = *(void *)(*((void *)&v45 + 1) + 8 * v35);
          uint64_t v37 = objc_msgSend_indexPathForRow_inSection_(MEMORY[0x263F088C8], v17, v33 + v35, v19);
          int isCellAtIndexPath_identicalToNewRow = objc_msgSend_isCellAtIndexPath_identicalToNewRow_(self, v38, v37, v36);
          if (!isCellAtIndexPath_identicalToNewRow) {
            return isCellAtIndexPath_identicalToNewRow;
          }
          if (v32 == ++v35)
          {
            uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v17, (uint64_t)&v45, v53, 16);
            v33 += v35;
            if (v32) {
              goto LABEL_14;
            }
            break;
          }
        }
      }
      ++v19;
      ++v21;
      id v7 = v43;
      uint64_t v20 = v42;
      if (v21 == v44)
      {
        uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v17, (uint64_t)&v49, v54, 16);
        LOBYTE(isCellAtIndexPath_identicalToNewRow) = 1;
        if (v18) {
          goto LABEL_8;
        }
        return isCellAtIndexPath_identicalToNewRow;
      }
    }
  }
  LOBYTE(isCellAtIndexPath_identicalToNewRow) = 0;
  return isCellAtIndexPath_identicalToNewRow;
}

- (BOOL)updateSectionsIfMatchingExisting:(id)a3
{
  if (dword_268147C58 <= 800 && (dword_268147C58 != -1 || sub_226865630((uint64_t)&dword_268147C58, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147C58, (uint64_t)"-[TableViewManager updateSectionsIfMatchingExisting:]", 800, (uint64_t)"\n", v3, v4, v5, v6, v12);
  }
  int v10 = objc_msgSend_checkIfSectionDataSameInTable_(self, a2, (uint64_t)a3);
  if (v10) {
    objc_msgSend_updateSectionDataInIdenticalTable_(self, v9, (uint64_t)a3);
  }
  return v10;
}

- (void)deleteRowsAtIndexPaths:(id)a3 withRowAnimation:(int64_t)a4
{
  uint64_t v127 = *MEMORY[0x263EF8340];
  if (dword_268147B58 <= 800 && (dword_268147B58 != -1 || sub_226865630((uint64_t)&dword_268147B58, 0x320u)))
  {
    uint64_t v5 = objc_msgSend_managedTableView(self, a2, (uint64_t)a3);
    sub_226865EB4((uint64_t)&dword_268147B58, (uint64_t)"-[TableViewManager deleteRowsAtIndexPaths:withRowAnimation:]", 800, (uint64_t)"managedTableView %@\n", v6, v7, v8, v9, v5);
  }
  v109 = self;
  if (objc_msgSend_count(a3, a2, (uint64_t)a3))
  {
    uint64_t v11 = objc_msgSend_objectForKey_(self->_tableDescriptorDict, v10, @"tableSectionArray");
    long long v120 = 0u;
    long long v121 = 0u;
    long long v122 = 0u;
    long long v123 = 0u;
    uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v12, (uint64_t)&v120, v126, 16);
    if (v13)
    {
      uint64_t v16 = v13;
      uint64_t v17 = *(void *)v121;
LABEL_8:
      uint64_t v18 = 0;
      while (1)
      {
        if (*(void *)v121 != v17) {
          objc_enumerationMutation(a3);
        }
        uint64_t v19 = *(void **)(*((void *)&v120 + 1) + 8 * v18);
        unint64_t v20 = objc_msgSend_row(v19, v14, v15);
        unint64_t v23 = objc_msgSend_section(v19, v21, v22);
        if (v23 >= objc_msgSend_count(v11, v24, v25)) {
          break;
        }
        uint64_t v27 = objc_msgSend_objectAtIndex_(v11, v26, v23);
        long long v29 = objc_msgSend_objectForKey_(v27, v28, @"sectionRows");
        if (v20 >= objc_msgSend_count(v29, v30, v31)) {
          break;
        }
        if (dword_268147B18 <= 800 && (dword_268147B18 != -1 || sub_226865630((uint64_t)&dword_268147B18, 0x320u))) {
          sub_226865EB4((uint64_t)&dword_268147B18, (uint64_t)"-[TableViewManager deleteRowsAtIndexPaths:withRowAnimation:]", 800, (uint64_t)"row %d in section %d valid to delete\n", v32, v33, v34, v35, v20);
        }
        if (v16 == ++v18)
        {
          uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v14, (uint64_t)&v120, v126, 16);
          if (v16) {
            goto LABEL_8;
          }
          goto LABEL_19;
        }
      }
    }
    else
    {
LABEL_19:
      uint64_t v36 = objc_msgSend_arrayWithArray_(MEMORY[0x263EFF980], v14, (uint64_t)a3);
      objc_msgSend_sortUsingSelector_(v36, v37, (uint64_t)sel_compare_);
      if (objc_msgSend_count(v36, v38, v39))
      {
        uint64_t v42 = objc_msgSend_array(MEMORY[0x263EFF980], v40, v41);
        id v111 = (id)objc_msgSend_array(MEMORY[0x263EFF980], v43, v44);
        long long v46 = objc_msgSend_objectAtIndex_(v36, v45, 0);
        uint64_t v49 = objc_msgSend_section(v46, v47, v48);
        long long v51 = objc_msgSend_objectAtIndex_(v11, v50, v49);
        long long v53 = objc_msgSend_objectForKey_(v51, v52, @"sectionRows");
        long long v116 = 0u;
        long long v117 = 0u;
        long long v118 = 0u;
        long long v119 = 0u;
        uint64_t v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v54, (uint64_t)&v116, v125, 16);
        if (v55)
        {
          uint64_t v58 = v55;
          uint64_t v59 = *(void *)v117;
          do
          {
            for (uint64_t i = 0; i != v58; ++i)
            {
              if (*(void *)v117 != v59) {
                objc_enumerationMutation(v36);
              }
              v61 = *(void **)(*((void *)&v116 + 1) + 8 * i);
              if (objc_msgSend_section(v61, v56, v57) == v49)
              {
                uint64_t v64 = objc_msgSend_row(v61, v62, v63);
                uint64_t v66 = objc_msgSend_objectAtIndex_(v53, v65, v64);
                objc_msgSend_addObject_(v42, v67, v66);
              }
              else
              {
                objc_msgSend_removeObjectsInArray_(v53, v62, (uint64_t)v42);
                v69 = objc_msgSend_objectAtIndex_(v11, v68, v49);
                v71 = objc_msgSend_objectForKey_(v69, v70, @"rowsOKToBeEmpty");
                char v74 = objc_msgSend_BOOLValue(v71, v72, v73);
                if (!objc_msgSend_count(v53, v75, v76) && (v74 & 1) == 0) {
                  objc_msgSend_addObject_(v111, v77, (uint64_t)v69);
                }
                objc_msgSend_removeAllObjects(v42, v77, v78);
                uint64_t v49 = objc_msgSend_section(v61, v79, v80);
                v82 = objc_msgSend_objectAtIndex_(v11, v81, v49);
                long long v53 = objc_msgSend_objectForKey_(v82, v83, @"sectionRows");
              }
            }
            uint64_t v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v56, (uint64_t)&v116, v125, 16);
          }
          while (v58);
        }
        if (objc_msgSend_count(v42, v56, v57))
        {
          objc_msgSend_removeObjectsInArray_(v53, v84, (uint64_t)v42);
          v86 = objc_msgSend_objectAtIndex_(v11, v85, v49);
          v88 = objc_msgSend_objectForKey_(v86, v87, @"rowsOKToBeEmpty");
          char v91 = objc_msgSend_BOOLValue(v88, v89, v90);
          if (!objc_msgSend_count(v53, v92, v93) && (v91 & 1) == 0)
          {
            uint64_t v94 = objc_msgSend_objectAtIndex_(v11, v84, v49);
            objc_msgSend_addObject_(v111, v95, v94);
          }
        }
        objc_msgSend_deleteRowsAtIndexPaths_withRowAnimation_(v109->_managedTableView, v84, (uint64_t)a3, a4);
        long long v114 = 0u;
        long long v115 = 0u;
        long long v112 = 0u;
        long long v113 = 0u;
        uint64_t v97 = objc_msgSend_countByEnumeratingWithState_objects_count_(v111, v96, (uint64_t)&v112, v124, 16);
        if (v97)
        {
          uint64_t v99 = v97;
          uint64_t v100 = *(void *)v113;
          do
          {
            for (uint64_t j = 0; j != v99; ++j)
            {
              if (*(void *)v113 != v100) {
                objc_enumerationMutation(v111);
              }
              uint64_t v102 = objc_msgSend_indexOfObject_(v11, v98, *(void *)(*((void *)&v112 + 1) + 8 * j));
              if (v102 != 0x7FFFFFFFFFFFFFFFLL)
              {
                uint64_t v103 = v102;
                objc_msgSend_removeObjectAtIndex_(v11, v98, v102);
                managedTableView = v109->_managedTableView;
                uint64_t v106 = objc_msgSend_indexSetWithIndex_(MEMORY[0x263F088D0], v105, v103);
                objc_msgSend_deleteSections_withRowAnimation_(managedTableView, v107, v106, a4);
              }
            }
            uint64_t v99 = objc_msgSend_countByEnumeratingWithState_objects_count_(v111, v98, (uint64_t)&v112, v124, 16);
          }
          while (v99);
        }
      }
    }
  }
}

- (void)deleteRowInSection:(unint64_t)a3 withTag:(int64_t)a4
{
  if (dword_268147B58 <= 800 && (dword_268147B58 != -1 || sub_226865630((uint64_t)&dword_268147B58, 0x320u)))
  {
    uint64_t v7 = objc_msgSend_managedTableView(self, a2, a3);
    sub_226865EB4((uint64_t)&dword_268147B58, (uint64_t)"-[TableViewManager deleteRowInSection:withTag:]", 800, (uint64_t)"managedTableView %@\n", v8, v9, v10, v11, v7);
  }
  uint64_t v12 = objc_msgSend_indexPathOfCellWithTag_(self, a2, a4);
  if (v12)
  {
    uint64_t v15 = (uint64_t)v12;
    if (objc_msgSend_section(v12, v13, v14) == a3)
    {
      uint64_t v18 = objc_msgSend_arrayWithObject_(MEMORY[0x263EFF8C0], v16, v15);
      objc_msgSend_deleteRowsAtIndexPaths_withRowAnimation_(self, v17, v18, 100);
    }
  }
}

- (void)cleanTableViewForReuse
{
  if (dword_268147B58 <= 800 && (dword_268147B58 != -1 || sub_226865630((uint64_t)&dword_268147B58, 0x320u)))
  {
    uint64_t v4 = objc_msgSend_managedTableView(self, a2, v2);
    sub_226865EB4((uint64_t)&dword_268147B58, (uint64_t)"-[TableViewManager cleanTableViewForReuse]", 800, (uint64_t)"managedTableView %@\n", v5, v6, v7, v8, v4);
  }
  uint64_t v9 = objc_msgSend_objectForKey_(self->_tableDescriptorDict, a2, @"tableSectionArray");
  if (objc_msgSend_count(v9, v10, v11))
  {
    uint64_t v14 = objc_msgSend_areAnimationsEnabled(MEMORY[0x263F1CB60], v12, v13);
    objc_msgSend_setAnimationsEnabled_(MEMORY[0x263F1CB60], v15, 0);
    objc_msgSend_endEditing(self, v16, v17);
    uint64_t v18 = (void *)MEMORY[0x263F088D0];
    uint64_t v21 = objc_msgSend_count(v9, v19, v20);
    uint64_t v23 = objc_msgSend_indexSetWithIndexesInRange_(v18, v22, 0, v21);
    objc_msgSend_deleteSections_withRowAnimation_(self, v24, v23, 5);
    long long v26 = (void *)MEMORY[0x263F1CB60];
    objc_msgSend_setAnimationsEnabled_(v26, v25, v14);
  }
}

- (void)deleteAllRowsInSectionCore:(unint64_t)a3
{
  if (dword_268147B58 <= 800 && (dword_268147B58 != -1 || sub_226865630((uint64_t)&dword_268147B58, 0x320u)))
  {
    uint64_t v5 = objc_msgSend_managedTableView(self, a2, a3);
    sub_226865EB4((uint64_t)&dword_268147B58, (uint64_t)"-[TableViewManager deleteAllRowsInSectionCore:]", 800, (uint64_t)"managedTableView %@\n", v6, v7, v8, v9, v5);
  }
  uint64_t v10 = objc_msgSend_objectForKey_(self->_tableDescriptorDict, a2, @"tableSectionArray");
  if (objc_msgSend_count(v10, v11, v12) > a3)
  {
    uint64_t v14 = objc_msgSend_objectAtIndex_(v10, v13, a3);
    uint64_t v16 = objc_msgSend_objectForKey_(v14, v15, @"sectionRows");
    objc_msgSend_removeAllObjects(v16, v17, v18);
  }
}

- (void)deleteAllRowsInSection:(unint64_t)a3
{
  if (dword_268147B18 <= 800 && (dword_268147B18 != -1 || sub_226865630((uint64_t)&dword_268147B18, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147B18, (uint64_t)"-[TableViewManager deleteAllRowsInSection:]", 800, (uint64_t)"attempting to delete everything in section %d\n", v3, v4, v5, v6, a3);
  }
  objc_msgSend_deleteAllRowsInSectionCore_(self, a2, a3);

  MEMORY[0x270F9A6D0](self, sel_reloadSection_, a3);
}

- (void)deleteSections:(id)a3 withRowAnimation:(int64_t)a4
{
  uint64_t v7 = objc_msgSend_objectForKey_(self->_tableDescriptorDict, a2, @"tableSectionArray");
  uint64_t v10 = objc_msgSend_count(v7, v8, v9);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_2268E5200;
  v13[3] = &unk_2647BABA8;
  v13[5] = v7;
  v13[6] = v10;
  v13[4] = self;
  objc_msgSend_enumerateIndexesWithOptions_usingBlock_(a3, v11, 2, v13);
  objc_msgSend_deleteSections_withRowAnimation_(self->_managedTableView, v12, (uint64_t)a3, a4);
}

- (void)recordInitialSelectedMenuItemsForNewSection:(int64_t)a3
{
  SectionDictForSection = objc_msgSend_getSectionDictForSection_(self, a2, a3);
  if (SectionDictForSection)
  {
    uint64_t v6 = SectionDictForSection;
    uint64_t v7 = objc_msgSend_objectForKey_(SectionDictForSection, v5, @"sectionIsMenu");
    if (objc_msgSend_BOOLValue(v7, v8, v9))
    {
      uint64_t v11 = objc_msgSend_objectForKey_(v6, v10, @"sectionRows");
      if (v11)
      {
        uint64_t v13 = (void *)v11;
        uint64_t v14 = objc_msgSend_objectForKey_(v6, v12, @"selectedMenuItemIndexSet");
        uint64_t v16 = objc_msgSend_objectForKey_(v6, v15, @"selectedMenuItemTag");
        if (v14)
        {
          uint64_t Index = objc_msgSend_firstIndex(v14, v17, v18);
          if (Index != 0x7FFFFFFFFFFFFFFFLL)
          {
            for (uint64_t i = Index; i != 0x7FFFFFFFFFFFFFFFLL; uint64_t i = objc_msgSend_indexGreaterThanIndex_(v14, v26, i))
            {
              uint64_t v22 = objc_msgSend_objectAtIndex_(v13, v20, i);
              uint64_t v24 = objc_msgSend_numberWithBool_(NSNumber, v23, 1);
              objc_msgSend_setObject_forKey_(v22, v25, v24, @"menuSelected");
            }
          }
        }
        else if (v16)
        {
          uint64_t v27 = objc_msgSend_integerValue(v16, v17, v18);
          long long v29 = objc_msgSend_indexPathOfCellWithTag_(self, v28, v27);
          uint64_t v32 = objc_msgSend_row(v29, v30, v31);
          uint64_t v34 = objc_msgSend_objectAtIndex_(v13, v33, v32);
          uint64_t v37 = objc_msgSend_numberWithBool_(NSNumber, v35, 1);
          objc_msgSend_setObject_forKey_(v34, v36, v37, @"menuSelected");
        }
      }
    }
  }
}

- (void)addSectionInfo:(id)a3 animated:(BOOL)a4
{
  if (dword_268147B58 <= 800 && (dword_268147B58 != -1 || sub_226865630((uint64_t)&dword_268147B58, 0x320u)))
  {
    uint64_t v7 = objc_msgSend_managedTableView(self, a2, (uint64_t)a3);
    sub_226865EB4((uint64_t)&dword_268147B58, (uint64_t)"-[TableViewManager addSectionInfo:animated:]", 800, (uint64_t)"managedTableView %@\n", v8, v9, v10, v11, v7);
  }
  uint64_t v12 = objc_msgSend_objectForKey_(self->_tableDescriptorDict, a2, @"tableSectionArray");
  uint64_t v15 = v12;
  if (a4)
  {
    uint64_t v17 = objc_msgSend_count(v12, v13, v14);
    objc_msgSend_insertSectionInfo_atIndex_withRowAnimation_(self, v16, (uint64_t)a3, v17, 0);
  }
  else
  {
    objc_msgSend_setAnimationsEnabled_(MEMORY[0x263F1CB60], v13, 0);
    uint64_t v20 = objc_msgSend_count(v15, v18, v19);
    objc_msgSend_insertSectionInfo_atIndex_withRowAnimation_(self, v21, (uint64_t)a3, v20, 5);
    uint64_t v23 = (void *)MEMORY[0x263F1CB60];
    objc_msgSend_setAnimationsEnabled_(v23, v22, 1);
  }
}

- (void)addSectionInfo:(id)a3
{
}

- (void)insertSectionInfo:(id)a3 atIndex:(unint64_t)a4 withRowAnimation:(int64_t)a5
{
  if (dword_268147B18 <= 800 && (dword_268147B18 != -1 || sub_226865630((uint64_t)&dword_268147B18, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147B18, (uint64_t)"-[TableViewManager insertSectionInfo:atIndex:withRowAnimation:]", 800, (uint64_t)"\n", a5, v5, v6, v7, v23);
  }
  uint64_t v12 = objc_msgSend_objectForKey_(self->_tableDescriptorDict, a2, @"tableSectionArray");
  if (objc_msgSend_count(v12, v13, v14) <= a4) {
    objc_msgSend_addObject_(v12, v15, (uint64_t)a3);
  }
  else {
    objc_msgSend_insertObject_atIndex_(v12, v15, (uint64_t)a3, a4);
  }
  objc_msgSend_recordInitialSelectedMenuItemsForNewSection_(self, v16, a4);
  uint64_t v19 = objc_msgSend_managedTableView(self, v17, v18);
  uint64_t v22 = objc_msgSend_indexSetWithIndex_(MEMORY[0x263F088D0], v20, a4);

  objc_msgSend_insertSections_withRowAnimation_(v19, v21, v22, a5);
}

- (void)deleteSection:(unint64_t)a3
{
  uint64_t v5 = objc_msgSend_indexSetWithIndex_(MEMORY[0x263F088D0], a2, a3);

  objc_msgSend_deleteSections_withRowAnimation_(self, v4, v5, 0);
}

- (void)deleteSectionWithIdentifier:(id)a3 animated:(BOOL)a4
{
  uint64_t v6 = objc_msgSend_indexOfSectionWithIdentifier_(self, a2, (uint64_t)a3);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = v6;
    if (a4)
    {
      uint64_t v10 = objc_msgSend_indexSetWithIndex_(MEMORY[0x263F088D0], v7, v6);
      objc_msgSend_deleteSections_withRowAnimation_(self, v9, v10, 0);
    }
    else
    {
      objc_msgSend_setAnimationsEnabled_(MEMORY[0x263F1CB60], v7, 0);
      uint64_t v12 = objc_msgSend_indexSetWithIndex_(MEMORY[0x263F088D0], v11, v8);
      objc_msgSend_deleteSections_withRowAnimation_(self, v13, v12, 5);
      uint64_t v15 = (void *)MEMORY[0x263F1CB60];
      objc_msgSend_setAnimationsEnabled_(v15, v14, 1);
    }
  }
}

- (void)deleteSectionWithIdentifier:(id)a3
{
}

- (void)setSectionValue:(id)a3 forKey:(id)a4 inSection:(unint64_t)a5
{
  uint64_t v8 = objc_msgSend_objectForKey_(self->_tableDescriptorDict, a2, @"tableSectionArray");
  if (objc_msgSend_count(v8, v9, v10) > a5)
  {
    uint64_t v12 = objc_msgSend_objectAtIndex_(v8, v11, a5);
    objc_msgSend_setObject_forKey_(v12, v13, (uint64_t)a3, a4);
  }
}

- (id)commonAddOptionalBasicImage:(id)a3 withNeighborItem:(id)a4 toCellItems:(id)a5
{
  if (!a3) {
    return 0;
  }
  uint64_t v8 = objc_msgSend_dictionaryWithObjectsAndKeys_(MEMORY[0x263EFF9A0], a2, @"imageView", @"itemType", @"left", @"position", 0);
  objc_msgSend_setObject_forKey_(v8, v9, (uint64_t)a3, @"startValue");
  if (a4)
  {
    objc_msgSend_setValue_forKey_(v8, v10, (uint64_t)a4, @"neighbor");
    objc_msgSend_setValue_forKey_(v8, v11, @"right", @"position");
  }
  objc_msgSend_addObject_(a5, v10, (uint64_t)v8);
  return v8;
}

- (id)commonAddOptionalStaticText:(id)a3 withNeighborItem:(id)a4 toCellItems:(id)a5
{
  uint64_t v8 = objc_msgSend_dictionaryWithObjectsAndKeys_(MEMORY[0x263EFF9A0], a2, @"labelView", @"itemType", 0);
  uint64_t v10 = v8;
  if (a3) {
    objc_msgSend_setValue_forKey_(v8, v9, (uint64_t)a3, @"startValue");
  }
  if (a4)
  {
    objc_msgSend_setValue_forKey_(v10, v9, (uint64_t)a4, @"neighbor");
    objc_msgSend_setValue_forKey_(v10, v11, @"right", @"position");
  }
  objc_msgSend_addObject_(a5, v9, (uint64_t)v10);
  return v10;
}

- (id)createRowStyleBasicWithImage:(id)a3 text1:(id)a4 text2:(id)a5 withTag:(unint64_t)a6
{
  if (dword_268147B58 <= 800 && (dword_268147B58 != -1 || sub_226865630((uint64_t)&dword_268147B58, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147B58, (uint64_t)"-[TableViewManager createRowStyleBasicWithImage:text1:text2:withTag:]", 800, (uint64_t)"\n", (uint64_t)a5, a6, v6, v7, v41);
  }
  id v13 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v15 = objc_msgSend_commonAddOptionalBasicImage_withNeighborItem_toCellItems_(self, v14, (uint64_t)a3, 0, v13);
  objc_msgSend_commonAddOptionalStaticText_withNeighborItem_toCellItems_(self, v16, (uint64_t)a4, v15, v13);
  if (a5)
  {
    id v18 = objc_alloc(MEMORY[0x263EFF9A0]);
    detailTextColor = self->_detailTextColor;
    uint64_t v22 = objc_msgSend_systemLabelFont(TableViewManager, v20, v21);
    uint64_t v23 = NSNumber;
    long long v26 = objc_msgSend_sharedApplication(MEMORY[0x263F1C408], v24, v25);
    uint64_t v29 = objc_msgSend_userInterfaceLayoutDirection(v26, v27, v28);
    uint64_t v31 = objc_msgSend_numberWithInteger_(v23, v30, 2 * (v29 == 0));
    uint64_t v33 = objc_msgSend_initWithObjectsAndKeys_(v18, v32, @"labelView", @"itemType", detailTextColor, @"color", v22, @"font", v31, @"alignment", @"right", @"position", 0);
    objc_msgSend_setObject_forKey_(v33, v34, (uint64_t)a5, @"startValue");
    objc_msgSend_addObject_(v13, v35, (uint64_t)v33);
  }
  uint64_t v36 = (void *)MEMORY[0x263EFF9A0];
  uint64_t v37 = objc_msgSend_numberWithInteger_(NSNumber, v17, a6);
  uint64_t v39 = objc_msgSend_dictionaryWithObjectsAndKeys_(v36, v38, (uint64_t)v13, @"items", v37, @"tag", 0);

  return v39;
}

- (id)createRowStyleSubtitleWitImage:(id)a3 mainText:(id)a4 subtitleText:(id)a5 withTag:(unint64_t)a6
{
  if (dword_268147B58 <= 800 && (dword_268147B58 != -1 || sub_226865630((uint64_t)&dword_268147B58, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147B58, (uint64_t)"-[TableViewManager createRowStyleSubtitleWitImage:mainText:subtitleText:withTag:]", 800, (uint64_t)"\n", (uint64_t)a5, a6, v6, v7, v39);
  }
  if (!a4) {
    return 0;
  }
  id v13 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v15 = objc_msgSend_commonAddOptionalBasicImage_withNeighborItem_toCellItems_(self, v14, (uint64_t)a3, 0, v13);
  uint64_t v17 = objc_msgSend_commonAddOptionalStaticText_withNeighborItem_toCellItems_(self, v16, (uint64_t)a4, v15, v13);
  objc_msgSend_setValue_forKey_(v17, v18, @"topRight", @"position");
  if (a5)
  {
    id v20 = objc_alloc(MEMORY[0x263EFF9A0]);
    subtitleColor = self->_subtitleColor;
    uint64_t v24 = objc_msgSend_smallSystemLabelFont(TableViewManager, v22, v23);
    uint64_t v26 = objc_msgSend_numberWithInteger_(NSNumber, v25, 4);
    uint64_t Object = objc_msgSend_lastObject(v13, v27, v28);
    uint64_t v31 = objc_msgSend_initWithObjectsAndKeys_(v20, v30, @"labelView", @"itemType", subtitleColor, @"color", v24, @"font", v26, @"alignment", Object, @"neighbor", @"bottomLeft", @"position", 0);
    objc_msgSend_setObject_forKey_(v31, v32, (uint64_t)a5, @"startValue");
    objc_msgSend_addObject_(v13, v33, (uint64_t)v31);
  }
  uint64_t v34 = (void *)MEMORY[0x263EFF9A0];
  uint64_t v35 = objc_msgSend_numberWithInteger_(NSNumber, v19, a6);
  uint64_t v37 = objc_msgSend_dictionaryWithObjectsAndKeys_(v34, v36, (uint64_t)v13, @"items", v35, @"tag", 0);

  return v37;
}

- (id)createRowStyleSubtitleWithRightImage:(id)a3 subtitleText:(id)a4 rightImage:(id)a5 withTag:(unint64_t)a6
{
  if (dword_268147B58 <= 800 && (dword_268147B58 != -1 || sub_226865630((uint64_t)&dword_268147B58, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147B58, (uint64_t)"-[TableViewManager createRowStyleSubtitleWithRightImage:subtitleText:rightImage:withTag:]", 800, (uint64_t)"\n", (uint64_t)a5, a6, v6, v7, v42);
  }
  if (!a3) {
    return 0;
  }
  id v13 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v14 = objc_alloc(MEMORY[0x263EFF9A0]);
  uint64_t v16 = objc_msgSend_initWithObjectsAndKeys_(v14, v15, @"labelView", @"itemType", a3, @"startValue", @"topLeft", @"position", 0);
  objc_msgSend_addObject_(v13, v17, (uint64_t)v16);

  if (a4)
  {
    id v19 = objc_alloc(MEMORY[0x263EFF9A0]);
    subtitleColor = self->_subtitleColor;
    uint64_t v23 = objc_msgSend_smallSystemLabelFont(TableViewManager, v21, v22);
    uint64_t v25 = objc_msgSend_numberWithInteger_(NSNumber, v24, 4);
    uint64_t v27 = objc_msgSend_objectAtIndex_(v13, v26, 0);
    uint64_t v29 = objc_msgSend_initWithObjectsAndKeys_(v19, v28, @"labelView", @"itemType", subtitleColor, @"color", v23, @"font", v25, @"alignment", v27, @"neighbor", @"bottomLeft", @"position", 0);
    objc_msgSend_setObject_forKey_(v29, v30, (uint64_t)a4, @"startValue");
    objc_msgSend_addObject_(v13, v31, (uint64_t)v29);
  }
  if (a5)
  {
    id v32 = objc_alloc(MEMORY[0x263EFF9A0]);
    uint64_t v34 = objc_msgSend_initWithObjectsAndKeys_(v32, v33, @"imageView", @"itemType", @"right", @"position", 0);
    objc_msgSend_setObject_forKey_(v34, v35, (uint64_t)a5, @"startValue");
    objc_msgSend_addObject_(v13, v36, (uint64_t)v34);
  }
  uint64_t v37 = (void *)MEMORY[0x263EFF9A0];
  uint64_t v38 = objc_msgSend_numberWithInteger_(NSNumber, v18, a6);
  v40 = objc_msgSend_dictionaryWithObjectsAndKeys_(v37, v39, (uint64_t)v13, @"items", v38, @"tag", 0);

  return v40;
}

- (id)createRowStyleSubtitleWithRightText:(id)a3 subtitleText:(id)a4 rightText:(id)a5 withTag:(unint64_t)a6
{
  if (dword_268147B58 <= 800 && (dword_268147B58 != -1 || sub_226865630((uint64_t)&dword_268147B58, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147B58, (uint64_t)"-[TableViewManager createRowStyleSubtitleWithRightText:subtitleText:rightText:withTag:]", 800, (uint64_t)"\n", (uint64_t)a5, a6, v6, v7, v41);
  }
  if (!a3) {
    return 0;
  }
  unint64_t v42 = a6;
  id v13 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v14 = objc_alloc(MEMORY[0x263EFF9A0]);
  uint64_t v16 = objc_msgSend_initWithObjectsAndKeys_(v14, v15, @"labelView", @"itemType", a3, @"startValue", @"topLeft", @"position", 0);
  objc_msgSend_addObject_(v13, v17, (uint64_t)v16);

  id v18 = objc_alloc(MEMORY[0x263EFF9A0]);
  id v20 = objc_msgSend_initWithObjectsAndKeys_(v18, v19, @"labelView", @"itemType", @"right", @"position", a5, @"startValue", 0);
  objc_msgSend_addObject_(v13, v21, (uint64_t)v20);

  if (a4)
  {
    id v23 = objc_alloc(MEMORY[0x263EFF9A0]);
    subtitleColor = self->_subtitleColor;
    uint64_t v27 = objc_msgSend_smallSystemLabelFont(TableViewManager, v25, v26);
    uint64_t v29 = objc_msgSend_numberWithInteger_(NSNumber, v28, 4);
    uint64_t v31 = objc_msgSend_objectAtIndex_(v13, v30, 0);
    uint64_t v33 = objc_msgSend_initWithObjectsAndKeys_(v23, v32, @"labelView", @"itemType", subtitleColor, @"color", v27, @"font", v29, @"alignment", v31, @"neighbor", @"bottomLeft", @"position", 0);
    objc_msgSend_setObject_forKey_(v33, v34, (uint64_t)a4, @"startValue");
    objc_msgSend_addObject_(v13, v35, (uint64_t)v33);
  }
  uint64_t v36 = (void *)MEMORY[0x263EFF9A0];
  uint64_t v37 = objc_msgSend_numberWithInteger_(NSNumber, v22, v42);
  uint64_t v39 = objc_msgSend_dictionaryWithObjectsAndKeys_(v36, v38, (uint64_t)v13, @"items", v37, @"tag", 0);

  return v39;
}

- (id)createRowStyleBasicWithText:(id)a3 centerImage:(id)a4 text2:(id)a5 withTag:(unint64_t)a6
{
  if (dword_268147B58 <= 800 && (dword_268147B58 != -1 || sub_226865630((uint64_t)&dword_268147B58, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147B58, (uint64_t)"-[TableViewManager createRowStyleBasicWithText:centerImage:text2:withTag:]", 800, (uint64_t)"\n", (uint64_t)a5, a6, v6, v7, v41);
  }
  id v13 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v15 = objc_msgSend_commonAddOptionalStaticText_withNeighborItem_toCellItems_(self, v14, (uint64_t)a3, 0, v13);
  objc_msgSend_commonAddOptionalBasicImage_withNeighborItem_toCellItems_(self, v16, (uint64_t)a4, v15, v13);
  if (a5)
  {
    id v18 = objc_alloc(MEMORY[0x263EFF9A0]);
    detailTextColor = self->_detailTextColor;
    uint64_t v22 = objc_msgSend_systemLabelFont(TableViewManager, v20, v21);
    id v23 = NSNumber;
    uint64_t v26 = objc_msgSend_sharedApplication(MEMORY[0x263F1C408], v24, v25);
    uint64_t v29 = objc_msgSend_userInterfaceLayoutDirection(v26, v27, v28);
    uint64_t v31 = objc_msgSend_numberWithInteger_(v23, v30, 2 * (v29 == 0));
    uint64_t v33 = objc_msgSend_initWithObjectsAndKeys_(v18, v32, @"labelView", @"itemType", detailTextColor, @"color", v22, @"font", v31, @"alignment", @"right", @"position", 0);
    objc_msgSend_setObject_forKey_(v33, v34, (uint64_t)a5, @"startValue");
    objc_msgSend_addObject_(v13, v35, (uint64_t)v33);
  }
  uint64_t v36 = (void *)MEMORY[0x263EFF9A0];
  uint64_t v37 = objc_msgSend_numberWithInteger_(NSNumber, v17, a6);
  uint64_t v39 = objc_msgSend_dictionaryWithObjectsAndKeys_(v36, v38, (uint64_t)v13, @"items", v37, @"tag", 0);

  return v39;
}

- (id)createRowStyleBasicEditableWithImage:(id)a3 labelText:(id)a4 currentValue:(id)a5 placeholderText:(id)a6 isSecure:(BOOL)a7 keyboardType:(int64_t)a8 withTag:(unint64_t)a9
{
  BOOL v10 = a7;
  if (dword_268147B58 <= 800 && (dword_268147B58 != -1 || sub_226865630((uint64_t)&dword_268147B58, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147B58, (uint64_t)"-[TableViewManager createRowStyleBasicEditableWithImage:labelText:currentValue:placeholderText:isSecure:keyboardType:withTag:]", 800, (uint64_t)"\n", (uint64_t)a5, (uint64_t)a6, a7, a8, v39);
  }
  id v16 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v18 = objc_msgSend_commonAddOptionalBasicImage_withNeighborItem_toCellItems_(self, v17, (uint64_t)a3, 0, v16);
  objc_msgSend_commonAddOptionalStaticText_withNeighborItem_toCellItems_(self, v19, (uint64_t)a4, v18, v16);
  if (a5) {
    id v20 = (__CFString *)a5;
  }
  else {
    id v20 = &stru_26DA6BE88;
  }
  id v21 = objc_alloc(MEMORY[0x263EFF9A0]);
  editTextColor = self->_editTextColor;
  uint64_t v24 = objc_msgSend_numberWithInteger_(NSNumber, v23, 4);
  uint64_t v26 = objc_msgSend_initWithObjectsAndKeys_(v21, v25, @"editTextView", @"itemType", v20, @"startValue", editTextColor, @"color", @"right", @"position", v24, @"alignment", 0);
  uint64_t v28 = v26;
  if (a6) {
    objc_msgSend_setObject_forKey_(v26, v27, (uint64_t)a6, @"placeholder");
  }
  if (v10)
  {
    uint64_t v29 = objc_msgSend_numberWithBool_(NSNumber, v27, 1);
    objc_msgSend_setObject_forKey_(v28, v30, v29, @"secure");
  }
  if (a8)
  {
    uint64_t v31 = objc_msgSend_numberWithInteger_(NSNumber, v27, a8);
    objc_msgSend_setObject_forKey_(v28, v32, v31, @"keyboardType");
  }
  objc_msgSend_addObject_(v16, v27, (uint64_t)v28);

  uint64_t v33 = (void *)MEMORY[0x263EFF9A0];
  uint64_t v35 = objc_msgSend_numberWithInteger_(NSNumber, v34, a9);
  uint64_t v37 = objc_msgSend_dictionaryWithObjectsAndKeys_(v33, v36, (uint64_t)v16, @"items", v35, @"tag", 0);

  return v37;
}

- (id)createRowStyleBasicOnOffWithImage:(id)a3 labelText:(id)a4 isOn:(BOOL)a5 withTag:(unint64_t)a6
{
  BOOL v9 = a5;
  if (dword_268147B58 <= 800 && (dword_268147B58 != -1 || sub_226865630((uint64_t)&dword_268147B58, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147B58, (uint64_t)"-[TableViewManager createRowStyleBasicOnOffWithImage:labelText:isOn:withTag:]", 800, (uint64_t)"\n", a5, a6, v6, v7, v29);
  }
  id v13 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v15 = objc_msgSend_commonAddOptionalBasicImage_withNeighborItem_toCellItems_(self, v14, (uint64_t)a3, 0, v13);
  objc_msgSend_commonAddOptionalStaticText_withNeighborItem_toCellItems_(self, v16, (uint64_t)a4, v15, v13);
  id v17 = objc_alloc(MEMORY[0x263EFF9A0]);
  uint64_t v19 = objc_msgSend_numberWithBool_(NSNumber, v18, v9);
  id v21 = objc_msgSend_initWithObjectsAndKeys_(v17, v20, @"switchView", @"itemType", @"right", @"position", v19, @"startValue", 0);
  objc_msgSend_addObject_(v13, v22, (uint64_t)v21);

  id v23 = (void *)MEMORY[0x263EFF9A0];
  uint64_t v25 = objc_msgSend_numberWithInteger_(NSNumber, v24, a6);
  uint64_t v27 = objc_msgSend_dictionaryWithObjectsAndKeys_(v23, v26, (uint64_t)v13, @"items", v25, @"tag", 0);

  return v27;
}

- (id)createRowStyleBasicWholeCellButton:(id)a3 withTag:(unint64_t)a4
{
  if (dword_268147B58 <= 800 && (dword_268147B58 != -1 || sub_226865630((uint64_t)&dword_268147B58, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147B58, (uint64_t)"-[TableViewManager createRowStyleBasicWholeCellButton:withTag:]", 800, (uint64_t)"\n", v4, v5, v6, v7, v23);
  }
  id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v11 = objc_alloc(MEMORY[0x263EFF9A0]);
  uint64_t v13 = objc_msgSend_numberWithInteger_(NSNumber, v12, 1);
  uint64_t v15 = objc_msgSend_initWithObjectsAndKeys_(v11, v14, @"wholeCellButtonView", @"itemType", a3, @"startValue", @"center", @"position", v13, @"alignment", 0);
  objc_msgSend_addObject_(v10, v16, (uint64_t)v15);

  id v17 = (void *)MEMORY[0x263EFF9A0];
  uint64_t v19 = objc_msgSend_numberWithInteger_(NSNumber, v18, a4);
  id v21 = objc_msgSend_dictionaryWithObjectsAndKeys_(v17, v20, (uint64_t)v10, @"items", v19, @"tag", 0);

  return v21;
}

- (id)createRowStyleBasicButtons:(id)a3 title2:(id)a4 withTag:(unint64_t)a5
{
  if (dword_268147B58 <= 800 && (dword_268147B58 != -1 || sub_226865630((uint64_t)&dword_268147B58, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147B58, (uint64_t)"-[TableViewManager createRowStyleBasicButtons:title2:withTag:]", 800, (uint64_t)"\n", a5, v5, v6, v7, v28);
  }
  if (!a3) {
    return 0;
  }
  id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v12 = objc_alloc(MEMORY[0x263EFF9A0]);
  id v14 = objc_msgSend_initWithObjectsAndKeys_(v12, v13, @"buttonView", @"itemType", a3, @"startValue", 0);
  id v16 = v14;
  if (a4)
  {
    objc_msgSend_addObject_(v11, v15, (uint64_t)v14);

    id v17 = objc_alloc(MEMORY[0x263EFF9A0]);
    id v16 = objc_msgSend_initWithObjectsAndKeys_(v17, v18, @"buttonView", @"itemType", a4, @"startValue", @"right", @"position", 0);
  }
  else
  {
    objc_msgSend_setObject_forKey_(v14, v15, @"center", @"position");
  }
  objc_msgSend_addObject_(v11, v19, (uint64_t)v16);

  id v21 = (void *)MEMORY[0x263EFF9A0];
  uint64_t v23 = objc_msgSend_numberWithInteger_(NSNumber, v22, a5);
  uint64_t v25 = objc_msgSend_numberWithBool_(NSNumber, v24, 1);
  uint64_t v27 = objc_msgSend_dictionaryWithObjectsAndKeys_(v21, v26, (uint64_t)v11, @"items", v23, @"tag", v25, @"noBackground", 0);

  return v27;
}

- (id)createRowStyleTitledStaticMultiline:(id)a3 titleImage:(id)a4 bodyText:(id)a5 withTag:(unint64_t)a6
{
  if (dword_268147B58 <= 800 && (dword_268147B58 != -1 || sub_226865630((uint64_t)&dword_268147B58, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147B58, (uint64_t)"-[TableViewManager createRowStyleTitledStaticMultiline:titleImage:bodyText:withTag:]", 800, (uint64_t)"\n", (uint64_t)a5, a6, v6, v7, v51);
  }
  if (!a3 || !a5) {
    return 0;
  }
  id v13 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v15 = objc_msgSend_commonAddOptionalStaticText_withNeighborItem_toCellItems_(self, v14, (uint64_t)a3, 0, v13);
  objc_msgSend_setObject_forKey_(v15, v16, @"topLeft", @"position");
  if (a4)
  {
    id v17 = objc_alloc(MEMORY[0x263EFF9A0]);
    uint64_t v19 = objc_msgSend_objectAtIndex_(v13, v18, 0);
    id v21 = objc_msgSend_initWithObjectsAndKeys_(v17, v20, @"imageView", @"itemType", @"right", @"position", v19, @"neighbor", 0);
    objc_msgSend_setObject_forKey_(v21, v22, (uint64_t)a4, @"startValue");
    objc_msgSend_addObject_(v13, v23, (uint64_t)v21);
  }
  id v24 = objc_alloc(MEMORY[0x263EFF9A0]);
  detailTextColor = self->_detailTextColor;
  uint64_t v28 = objc_msgSend_systemLabelFont(TableViewManager, v26, v27);
  uint64_t v30 = objc_msgSend_objectAtIndex_(v13, v29, 0);
  uint64_t v31 = NSNumber;
  uint64_t v34 = objc_msgSend_sharedApplication(MEMORY[0x263F1C408], v32, v33);
  uint64_t v37 = objc_msgSend_userInterfaceLayoutDirection(v34, v35, v36);
  uint64_t v39 = objc_msgSend_numberWithInteger_(v31, v38, 2 * (v37 == 0));
  uint64_t v41 = objc_msgSend_numberWithBool_(NSNumber, v40, 1);
  v43 = objc_msgSend_initWithObjectsAndKeys_(v24, v42, @"multilineLabelView", @"itemType", a5, @"startValue", detailTextColor, @"color", v28, @"font", v30, @"neighbor", @"right", @"position", v39, @"alignment", v41, @"canCopy", 0);
  objc_msgSend_addObject_(v13, v44, (uint64_t)v43);

  long long v45 = (void *)MEMORY[0x263EFF9A0];
  uint64_t v47 = objc_msgSend_numberWithInteger_(NSNumber, v46, a6);
  uint64_t v49 = objc_msgSend_dictionaryWithObjectsAndKeys_(v45, v48, (uint64_t)v13, @"items", v47, @"tag", 0);

  return v49;
}

- (id)createRowStyleTitledParagraph:(id)a3 titleImage:(id)a4 bodyText:(id)a5 withTag:(unint64_t)a6
{
  if (dword_268147B58 <= 800 && (dword_268147B58 != -1 || sub_226865630((uint64_t)&dword_268147B58, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147B58, (uint64_t)"-[TableViewManager createRowStyleTitledParagraph:titleImage:bodyText:withTag:]", 800, (uint64_t)"\n", (uint64_t)a5, a6, v6, v7, v40);
  }
  if (!a3 || !a5) {
    return 0;
  }
  id v13 = objc_msgSend_array(MEMORY[0x263EFF980], a2, (uint64_t)a3);
  uint64_t v15 = objc_msgSend_commonAddOptionalStaticText_withNeighborItem_toCellItems_(self, v14, (uint64_t)a3, 0, v13);
  objc_msgSend_setObject_forKey_(v15, v16, @"topLeft", @"position");
  if (a4)
  {
    uint64_t v19 = (void *)MEMORY[0x263EFF9A0];
    uint64_t v20 = objc_msgSend_objectAtIndex_(v13, v17, 0);
    uint64_t v22 = objc_msgSend_dictionaryWithObjectsAndKeys_(v19, v21, @"imageView", @"itemType", @"right", @"position", v20, @"neighbor", 0);
    objc_msgSend_setObject_forKey_(v22, v23, (uint64_t)a4, @"startValue");
    objc_msgSend_addObject_(v13, v24, (uint64_t)v22);
  }
  uint64_t v25 = (void *)MEMORY[0x263EFF9A0];
  detailTextColor = self->_detailTextColor;
  uint64_t v27 = objc_msgSend_systemLabelFont(TableViewManager, v17, v18);
  uint64_t v29 = objc_msgSend_objectAtIndex_(v13, v28, 0);
  uint64_t v31 = objc_msgSend_numberWithBool_(NSNumber, v30, 1);
  uint64_t v33 = objc_msgSend_dictionaryWithObjectsAndKeys_(v25, v32, @"multilineLabelView", @"itemType", a5, @"startValue", detailTextColor, @"color", v27, @"font", v29, @"neighbor", @"bottomLeft", @"position", v31, @"canCopy", 0);
  objc_msgSend_addObject_(v13, v34, v33);
  uint64_t v35 = (void *)MEMORY[0x263EFF9A0];
  uint64_t v37 = objc_msgSend_numberWithInteger_(NSNumber, v36, a6);
  return (id)objc_msgSend_dictionaryWithObjectsAndKeys_(v35, v38, (uint64_t)v13, @"items", v37, @"tag", 0);
}

- (id)createRowStyleTitledParagraphWithLeftImage:(id)a3 title:(id)a4 bodyText:(id)a5 withTag:(unint64_t)a6
{
  if (dword_268147B58 <= 800 && (dword_268147B58 != -1 || sub_226865630((uint64_t)&dword_268147B58, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147B58, (uint64_t)"-[TableViewManager createRowStyleTitledParagraphWithLeftImage:title:bodyText:withTag:]", 800, (uint64_t)"\n", (uint64_t)a5, a6, v6, v7, v36);
  }
  if (!a4 || !a5) {
    return 0;
  }
  id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (a3)
  {
    id v15 = objc_alloc(MEMORY[0x263EFF9A0]);
    a3 = (id)objc_msgSend_initWithObjectsAndKeys_(v15, v16, @"imageView", @"itemType", @"topLeft", @"position", a3, @"startValue", 0);
    objc_msgSend_addObject_(v14, v17, (uint64_t)a3);
  }
  objc_msgSend_commonAddOptionalStaticText_withNeighborItem_toCellItems_(self, v13, (uint64_t)a4, a3, v14);
  id v18 = objc_alloc(MEMORY[0x263EFF9A0]);
  detailTextColor = self->_detailTextColor;
  uint64_t v22 = objc_msgSend_systemLabelFont(TableViewManager, v20, v21);
  uint64_t v24 = objc_msgSend_objectAtIndex_(v14, v23, 0);
  uint64_t v26 = objc_msgSend_numberWithBool_(NSNumber, v25, 1);
  uint64_t v28 = objc_msgSend_initWithObjectsAndKeys_(v18, v27, @"multilineLabelView", @"itemType", a5, @"startValue", detailTextColor, @"color", v22, @"font", v24, @"neighbor", @"bottomLeft", @"position", v26, @"canCopy", 0);
  objc_msgSend_addObject_(v14, v29, (uint64_t)v28);

  uint64_t v30 = (void *)MEMORY[0x263EFF9A0];
  uint64_t v32 = objc_msgSend_numberWithInteger_(NSNumber, v31, a6);
  uint64_t v34 = objc_msgSend_dictionaryWithObjectsAndKeys_(v30, v33, (uint64_t)v14, @"items", v32, @"tag", 0);

  return v34;
}

- (id)createRowStyleSegmentedControlWithItems:(id)a3 selectedSegmentIndex:(id)a4 enabled:(BOOL)a5 withTag:(unint64_t)a6
{
  if (dword_268147B58 <= 800 && (dword_268147B58 != -1 || sub_226865630((uint64_t)&dword_268147B58, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147B58, (uint64_t)"-[TableViewManager createRowStyleSegmentedControlWithItems:selectedSegmentIndex:enabled:withTag:]", 800, (uint64_t)"\n", a5, a6, v6, v7, v24);
  }
  id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v12 = objc_alloc(MEMORY[0x263EFF9A0]);
  id v14 = objc_msgSend_initWithObjectsAndKeys_(v12, v13, @"segmentedControlView", @"itemType", a3, @"segmentedControlItems", a4, @"startValue", @"center", @"position", 0);
  objc_msgSend_addObject_(v11, v15, (uint64_t)v14);

  id v16 = (void *)MEMORY[0x263EFF9A0];
  uint64_t v18 = objc_msgSend_numberWithInteger_(NSNumber, v17, a6);
  uint64_t v20 = objc_msgSend_numberWithBool_(NSNumber, v19, 1);
  uint64_t v22 = objc_msgSend_dictionaryWithObjectsAndKeys_(v16, v21, (uint64_t)v11, @"items", v18, @"tag", v20, @"noBackground", 0);

  return v22;
}

- (id)createRowStyleProgressViewWithCancelAndStatus:(id)a3 statusText:(id)a4 altText:(id)a5 withTag:(unint64_t)a6
{
  if (dword_268147B58 <= 800 && (dword_268147B58 != -1 || sub_226865630((uint64_t)&dword_268147B58, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147B58, (uint64_t)"-[TableViewManager createRowStyleProgressViewWithCancelAndStatus:statusText:altText:withTag:]", 800, (uint64_t)"\n", (uint64_t)a5, a6, v6, v7, v62);
  }
  if (!a3 || !a4) {
    return 0;
  }
  id v63 = a5;
  id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v14 = objc_msgSend_dictionaryWithObjectsAndKeys_(MEMORY[0x263EFF9A0], v13, @"progressView", @"itemType", a3, @"startValue", @"top", @"position", 0);
  if (sub_2269050C4((uint64_t)v14, v15, v16))
  {
    uint64_t v18 = objc_msgSend_numberWithInt_(NSNumber, v17, 15);
    objc_msgSend_setObject_forKey_(v14, v19, v18, @"edgeInset");
  }
  objc_msgSend_addObject_(v12, v17, (uint64_t)v14);
  uint64_t v20 = (void *)MEMORY[0x263EFF9A0];
  uint64_t v22 = objc_msgSend_objectAtIndex_(v12, v21, 0);
  uint64_t v24 = objc_msgSend_dictionaryWithObjectsAndKeys_(v20, v23, @"buttonView", @"itemType", @"UITextFieldClearButton", @"buttonImage", @"UITextFieldClearButtonPressed", @"buttonSelectedImage", &stru_26DA6BE88, @"startValue", v22, @"neighbor", @"right", @"position", 0);
  objc_msgSend_addObject_(v12, v25, v24);
  id v26 = objc_alloc(MEMORY[0x263EFF9A0]);
  uint64_t v28 = objc_msgSend_numberWithInt_(NSNumber, v27, 0);
  uint64_t v31 = objc_msgSend_smallSystemLabelFont(TableViewManager, v29, v30);
  uint64_t v33 = objc_msgSend_objectAtIndex_(v12, v32, 0);
  uint64_t v35 = objc_msgSend_numberWithInteger_(NSNumber, v34, 1);
  uint64_t v37 = objc_msgSend_initWithObjectsAndKeys_(v26, v36, @"multilineLabelView", @"itemType", v28, @"lineCount", v31, @"font", v33, @"neighbor", v35, @"alignment", @"bottom", @"position", 0);
  objc_msgSend_setObject_forKey_(v37, v38, (uint64_t)a4, @"startValue");
  objc_msgSend_addObject_(v12, v39, (uint64_t)v37);

  if (v63)
  {
    id v41 = objc_alloc(MEMORY[0x263EFF9A0]);
    uint64_t v43 = objc_msgSend_numberWithInt_(NSNumber, v42, 0);
    uint64_t v46 = objc_msgSend_smallSystemLabelFont(TableViewManager, v44, v45);
    uint64_t v48 = objc_msgSend_objectAtIndex_(v12, v47, 2);
    uint64_t v50 = objc_msgSend_numberWithInteger_(NSNumber, v49, 1);
    long long v52 = objc_msgSend_initWithObjectsAndKeys_(v41, v51, @"multilineLabelView", @"itemType", v43, @"lineCount", v46, @"font", v48, @"neighbor", v50, @"alignment", @"bottom", @"position", 0);
    objc_msgSend_setObject_forKey_(v52, v53, (uint64_t)v63, @"startValue");
    objc_msgSend_addObject_(v12, v54, (uint64_t)v52);
  }
  uint64_t v55 = (void *)MEMORY[0x263EFF9A0];
  uint64_t v56 = objc_msgSend_numberWithInteger_(NSNumber, v40, a6);
  uint64_t v58 = objc_msgSend_numberWithBool_(NSNumber, v57, 1);
  v60 = objc_msgSend_dictionaryWithObjectsAndKeys_(v55, v59, (uint64_t)v12, @"items", v56, @"tag", v58, @"noBackground", 0);

  return v60;
}

- (id)createRowStyleActivityStatus:(BOOL)a3 text1:(id)a4 grayedText1:(BOOL)a5 text2:(id)a6 grayedText2:(BOOL)a7 withTag:(unint64_t)a8
{
  BOOL v8 = a7;
  BOOL v10 = a5;
  BOOL v12 = a3;
  if (dword_268147B58 <= 800 && (dword_268147B58 != -1 || sub_226865630((uint64_t)&dword_268147B58, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147B58, (uint64_t)"-[TableViewManager createRowStyleActivityStatus:text1:grayedText1:text2:grayedText2:withTag:]", 800, (uint64_t)"\n", a5, (uint64_t)a6, a7, a8, v50);
  }
  id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v16 = objc_msgSend_commonAddOptionalStaticText_withNeighborItem_toCellItems_(self, v15, (uint64_t)a4, 0, v14);
  if (v10) {
    objc_msgSend_setObject_forKey_(v16, v17, (uint64_t)self->_subtitleColor, @"color");
  }
  uint64_t v18 = (void *)MEMORY[0x263EFF9A0];
  uint64_t v19 = objc_msgSend_numberWithBool_(NSNumber, v17, v12);
  uint64_t v21 = objc_msgSend_dictionaryWithObjectsAndKeys_(v18, v20, @"activityView", @"itemType", v19, @"startValue", @"right", @"position", 0);
  objc_msgSend_addObject_(v14, v22, v21);
  uint64_t v25 = (void *)MEMORY[0x263EFF9A0];
  uint64_t v26 = 72;
  if (v8) {
    uint64_t v26 = 96;
  }
  uint64_t v27 = *(uint64_t *)((char *)&self->super.isa + v26);
  uint64_t v28 = objc_msgSend_systemLabelFont(TableViewManager, v23, v24);
  uint64_t v29 = NSNumber;
  uint64_t v32 = objc_msgSend_sharedApplication(MEMORY[0x263F1C408], v30, v31);
  uint64_t v35 = objc_msgSend_userInterfaceLayoutDirection(v32, v33, v34);
  uint64_t v37 = objc_msgSend_numberWithInteger_(v29, v36, 2 * (v35 == 0));
  uint64_t v39 = objc_msgSend_objectAtIndex_(v14, v38, 1);
  id v41 = objc_msgSend_dictionaryWithObjectsAndKeys_(v25, v40, @"labelView", @"itemType", v27, @"color", v28, @"font", v37, @"alignment", v39, @"neighbor", @"left", @"position", 0);
  uint64_t v43 = (uint64_t)v41;
  if (a6) {
    objc_msgSend_setObject_forKey_(v41, v42, (uint64_t)a6, @"startValue");
  }
  objc_msgSend_addObject_(v14, v42, v43);
  uint64_t v44 = (void *)MEMORY[0x263EFF9A0];
  uint64_t v46 = objc_msgSend_numberWithInteger_(NSNumber, v45, a8);
  uint64_t v48 = objc_msgSend_dictionaryWithObjectsAndKeys_(v44, v47, (uint64_t)v14, @"items", v46, @"tag", 0);

  return v48;
}

- (id)createRowStyleDatePicker:(id)a3 minimumDate:(id)a4 maximumDate:(id)a5 withMode:(int64_t)a6 withTag:(unint64_t)a7
{
  if (dword_268147B58 <= 800 && (dword_268147B58 != -1 || sub_226865630((uint64_t)&dword_268147B58, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147B58, (uint64_t)"-[TableViewManager createRowStyleDatePicker:minimumDate:maximumDate:withMode:withTag:]", 800, (uint64_t)"\n", (uint64_t)a5, a6, a7, v7, v27);
  }
  if (!a3) {
    return 0;
  }
  id v13 = (void *)MEMORY[0x263EFF9A0];
  uint64_t v14 = objc_msgSend_numberWithInteger_(NSNumber, a2, a6);
  uint64_t v16 = objc_msgSend_dictionaryWithObjectsAndKeys_(v13, v15, @"datePicker", @"itemType", a3, @"startValue", v14, @"datePickerMode", @"top", @"position", 0);
  uint64_t v19 = v16;
  if (a4) {
    objc_msgSend_setObject_forKey_(v16, v17, (uint64_t)a4, @"minValue");
  }
  if (a5) {
    objc_msgSend_setObject_forKey_(v19, v17, (uint64_t)a5, @"maxValue");
  }
  uint64_t v20 = objc_msgSend_array(MEMORY[0x263EFF980], v17, v18);
  objc_msgSend_addObject_(v20, v21, (uint64_t)v19);
  uint64_t v22 = (void *)MEMORY[0x263EFF9A0];
  uint64_t v24 = objc_msgSend_numberWithInteger_(NSNumber, v23, a7);
  return (id)objc_msgSend_dictionaryWithObjectsAndKeys_(v22, v25, (uint64_t)v20, @"items", v24, @"tag", 0);
}

- (id)createRowStyleBasicWithUnreadBubble:(unint64_t)a3 text1:(id)a4 text2:(id)a5 withTag:(unint64_t)a6
{
  if (dword_268147B58 <= 800 && (dword_268147B58 != -1 || sub_226865630((uint64_t)&dword_268147B58, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147B58, (uint64_t)"-[TableViewManager createRowStyleBasicWithUnreadBubble:text1:text2:withTag:]", 800, (uint64_t)"\n", (uint64_t)a5, a6, v6, v7, v45);
  }
  BOOL v12 = objc_msgSend_array(MEMORY[0x263EFF980], a2, a3);
  objc_msgSend_commonAddOptionalStaticText_withNeighborItem_toCellItems_(self, v13, (uint64_t)a4, 0, v12);
  uint64_t v14 = (void *)MEMORY[0x263EFF9A0];
  uint64_t v16 = objc_msgSend_numberWithInteger_(NSNumber, v15, a3);
  uint64_t v18 = objc_msgSend_dictionaryWithObjectsAndKeys_(v14, v17, @"unreadBubbleCount", @"itemType", v16, @"startValue", @"right", @"position", 0);
  objc_msgSend_addObject_(v12, v19, v18);
  uint64_t v20 = (void *)MEMORY[0x263EFF9A0];
  detailTextColor = self->_detailTextColor;
  uint64_t v24 = objc_msgSend_systemLabelFont(TableViewManager, v22, v23);
  uint64_t v25 = NSNumber;
  uint64_t v28 = objc_msgSend_sharedApplication(MEMORY[0x263F1C408], v26, v27);
  uint64_t v31 = objc_msgSend_userInterfaceLayoutDirection(v28, v29, v30);
  uint64_t v33 = objc_msgSend_numberWithInteger_(v25, v32, 2 * (v31 == 0));
  uint64_t v35 = objc_msgSend_objectAtIndex_(v12, v34, 1);
  uint64_t v37 = objc_msgSend_dictionaryWithObjectsAndKeys_(v20, v36, @"labelView", @"itemType", detailTextColor, @"color", v24, @"font", v33, @"alignment", v35, @"neighbor", @"left", @"position", 0);
  uint64_t v39 = (uint64_t)v37;
  if (a5) {
    objc_msgSend_setObject_forKey_(v37, v38, (uint64_t)a5, @"startValue");
  }
  objc_msgSend_addObject_(v12, v38, v39);
  uint64_t v40 = (void *)MEMORY[0x263EFF9A0];
  uint64_t v42 = objc_msgSend_numberWithInteger_(NSNumber, v41, a6);
  return (id)objc_msgSend_dictionaryWithObjectsAndKeys_(v40, v43, (uint64_t)v12, @"items", v42, @"tag", 0);
}

- (unint64_t)findAndSetItemObject:(id)a3 toValue:(id)a4 inCellWithInternalRowSectionTagValue:(unint64_t)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  unint64_t v7 = a5 >> 16;
  RowArrayForSection = objc_msgSend_getRowArrayForSection_(self, a2, (unsigned __int16)a5);
  if (v7 >= objc_msgSend_count(RowArrayForSection, v9, v10)) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  BOOL v12 = objc_msgSend_objectAtIndex_(RowArrayForSection, v11, v7);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v14 = objc_msgSend_objectForKey_(v12, v13, @"items");
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v29, v33, 16);
  if (!v16) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v22 = v16;
  unint64_t v23 = 0;
  uint64_t v24 = *(void *)v30;
  while (2)
  {
    for (uint64_t i = 0; i != v22; ++i)
    {
      if (*(void *)v30 != v24) {
        objc_enumerationMutation(v14);
      }
      uint64_t v26 = *(void **)(*((void *)&v29 + 1) + 8 * i);
      if (dword_268147B18 <= 800 && (dword_268147B18 != -1 || sub_226865630((uint64_t)&dword_268147B18, 0x320u))) {
        sub_226865EB4((uint64_t)&dword_268147B18, (uint64_t)"-[TableViewManager findAndSetItemObject:toValue:inCellWithInternalRowSectionTagValue:]", 800, (uint64_t)"curItem %@\n", v18, v19, v20, v21, (uint64_t)v26);
      }
      if ((id)objc_msgSend_objectForKey_(v26, v17, @"cachedView") == a3)
      {
        if (a4) {
          objc_msgSend_setObject_forKey_(v26, v27, (uint64_t)a4, @"currentValue");
        }
        return v23;
      }
      objc_opt_class();
      v23 += objc_opt_isKindOfClass() & 1;
    }
    uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v29, v33, 16);
    unint64_t result = 0x7FFFFFFFFFFFFFFFLL;
    if (v22) {
      continue;
    }
    break;
  }
  return result;
}

- (id)getInfoForItemOfType:(id)a3 atItemTypeIndex:(unint64_t)a4 inCell:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  unint64_t v7 = objc_msgSend_objectForKey_(a5, a2, @"items", 0);
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v17, v21, 16);
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = 0;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v7);
        }
        id v15 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ((id)objc_msgSend_objectForKey_(v15, v10, @"itemType") == a3)
        {
          if (v12 == a4) {
            return v15;
          }
          ++v12;
        }
      }
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v17, v21, 16);
    }
    while (v11);
  }
  return 0;
}

- (id)getValueForItemOfType:(id)a3 atItemTypeIndex:(unint64_t)a4 inCell:(id)a5
{
  id result = (id)objc_msgSend_getInfoForItemOfType_atItemTypeIndex_inCell_(self, a2, (uint64_t)a3, a4, a5);
  if (result)
  {
    id v7 = result;
    id result = (id)objc_msgSend_objectForKey_(result, v6, @"currentValue");
    if (!result)
    {
      return (id)objc_msgSend_objectForKey_(v7, v8, @"startValue");
    }
  }
  return result;
}

- (id)getValueForItemOfType:(id)a3 atItemTypeIndex:(unint64_t)a4 inCellAtIndexPath:(id)a5
{
  id result = (id)objc_msgSend_getCellDictForCellAtIndexPath_(self, a2, (uint64_t)a5);
  if (result)
  {
    return (id)objc_msgSend_getValueForItemOfType_atItemTypeIndex_inCell_(self, v9, (uint64_t)a3, a4, result);
  }
  return result;
}

- (id)getValueForFirstItemOfType:(id)a3 inCellAtIndexPath:(id)a4
{
  return (id)MEMORY[0x270F9A6D0](self, sel_getValueForItemOfType_atItemTypeIndex_inCellAtIndexPath_, a3);
}

- (id)getValueForFirstItemOfType:(id)a3 inCellWithTag:(int64_t)a4
{
  return (id)MEMORY[0x270F9A6D0](self, sel_getValueForItemOfType_atItemTypeIndex_inCellWithTag_, a3);
}

- (id)getValueForItemOfType:(id)a3 atItemTypeIndex:(unint64_t)a4 inCellWithTag:(int64_t)a5
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  uint64_t v9 = objc_msgSend_objectForKey_(self->_tableDescriptorDict, a2, @"tableSectionArray");
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id result = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v33, v38, 16);
  if (result)
  {
    uint64_t v13 = (uint64_t)result;
    uint64_t v26 = self;
    id v27 = a3;
    unint64_t v28 = a4;
    uint64_t v14 = *(void *)v34;
    uint64_t v25 = *(void *)v34;
LABEL_3:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v34 != v14) {
        objc_enumerationMutation(v9);
      }
      id result = (id)objc_msgSend_objectForKey_(*(void **)(*((void *)&v33 + 1) + 8 * v15), v12, @"sectionRows", v25);
      if (!result) {
        break;
      }
      id v17 = result;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(result, v16, (uint64_t)&v29, v37, 16);
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v30;
        while (2)
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v30 != v20) {
              objc_enumerationMutation(v17);
            }
            uint64_t v22 = *(void **)(*((void *)&v29 + 1) + 8 * i);
            unint64_t v23 = objc_msgSend_objectForKey_(v22, v12, @"tag");
            if (v23 && objc_msgSend_integerValue(v23, v12, v24) == a5) {
              return (id)objc_msgSend_getValueForItemOfType_atItemTypeIndex_inCell_(v26, v12, (uint64_t)v27, v28, v22);
            }
          }
          uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v12, (uint64_t)&v29, v37, 16);
          if (v19) {
            continue;
          }
          break;
        }
      }
      ++v15;
      uint64_t v14 = v25;
      if (v15 == v13)
      {
        uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v33, v38, 16);
        id result = 0;
        if (v13) {
          goto LABEL_3;
        }
        return result;
      }
    }
  }
  return result;
}

- (void)setValue:(id)a3 forItem:(id)a4
{
  if (dword_268147C18 <= 800 && (dword_268147C18 != -1 || sub_226865630((uint64_t)&dword_268147C18, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147C18, (uint64_t)"-[TableViewManager setValue:forItem:]", 800, (uint64_t)"\n", v4, v5, v6, v7, v26);
  }
  uint64_t v12 = objc_msgSend_objectForKey_(a4, a2, @"itemType");
  if (a3)
  {
    objc_msgSend_setObject_forKey_(a4, v11, (uint64_t)a3, @"startValue");
    objc_msgSend_setObject_forKey_(a4, v13, (uint64_t)a3, @"currentValue");
  }
  else
  {
    objc_msgSend_removeObjectForKey_(a4, v11, @"currentValue");
    objc_msgSend_removeObjectForKey_(a4, v15, @"startValue");
  }
  uint64_t v16 = objc_msgSend_objectForKey_(a4, v14, @"cachedView");
  if (v16)
  {
    uint64_t v17 = v16;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v20 = NSString;
      uint64_t Letter = objc_msgSend_stringByCapitalizingFirstLetter(v12, v18, v19);
      unint64_t v23 = (NSString *)objc_msgSend_stringWithFormat_(v20, v22, @"set%@Value:usingItemInfo:", Letter);
      SEL v24 = NSSelectorFromString(v23);
      if (objc_opt_respondsToSelector())
      {
        objc_msgSend_performSelector_withObject_withObject_(self, v25, (uint64_t)v24, v17, a4);
      }
    }
  }
}

- (void)setMinValue:(id)a3 andMaxValue:(id)a4 forItem:(id)a5
{
  if (dword_268147C18 <= 800 && (dword_268147C18 != -1 || sub_226865630((uint64_t)&dword_268147C18, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147C18, (uint64_t)"-[TableViewManager setMinValue:andMaxValue:forItem:]", 800, (uint64_t)"\n", (uint64_t)a5, v5, v6, v7, v26);
  }
  uint64_t v13 = objc_msgSend_objectForKey_(a5, a2, @"itemType");
  if (!a3)
  {
    objc_msgSend_removeObjectForKey_(a5, v12, @"minValue");
    if (a4) {
      goto LABEL_7;
    }
LABEL_9:
    objc_msgSend_removeObjectForKey_(a5, v14, @"maxValue");
    goto LABEL_10;
  }
  objc_msgSend_setObject_forKey_(a5, v12, (uint64_t)a3, @"minValue");
  if (!a4) {
    goto LABEL_9;
  }
LABEL_7:
  objc_msgSend_setObject_forKey_(a5, v14, (uint64_t)a4, @"maxValue");
LABEL_10:
  uint64_t v16 = objc_msgSend_objectForKey_(a5, v15, @"cachedView");
  if (v16)
  {
    uint64_t v17 = v16;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v20 = NSString;
      uint64_t Letter = objc_msgSend_stringByCapitalizingFirstLetter(v13, v18, v19);
      unint64_t v23 = (NSString *)objc_msgSend_stringWithFormat_(v20, v22, @"set%@Value:usingItemInfo:", Letter);
      SEL v24 = NSSelectorFromString(v23);
      if (objc_opt_respondsToSelector())
      {
        objc_msgSend_performSelector_withObject_withObject_(self, v25, (uint64_t)v24, v17, a5);
      }
    }
  }
}

- (void)setValue:(id)a3 forItemOfType:(id)a4 atItemTypeIndex:(unint64_t)a5 inCellWithTag:(int64_t)a6
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  if (dword_268147C18 <= 800 && (dword_268147C18 != -1 || sub_226865630((uint64_t)&dword_268147C18, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147C18, (uint64_t)"-[TableViewManager setValue:forItemOfType:atItemTypeIndex:inCellWithTag:]", 800, (uint64_t)"type = %@  index = %d  cell tag = %d\n", a5, a6, v6, v7, (uint64_t)a4);
  }
  id v35 = a4;
  unint64_t v36 = a5;
  uint64_t v12 = objc_msgSend_objectForKey_(self->_tableDescriptorDict, a2, @"tableSectionArray");
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v41, v46, 16);
  if (v14)
  {
    uint64_t v16 = v14;
    uint64_t v17 = *(void *)v42;
    uint64_t v32 = *(void *)v42;
    long long v33 = v12;
LABEL_7:
    uint64_t v18 = 0;
    while (1)
    {
      if (*(void *)v42 != v17) {
        objc_enumerationMutation(v12);
      }
      uint64_t v19 = objc_msgSend_objectForKey_(*(void **)(*((void *)&v41 + 1) + 8 * v18), v15, @"sectionRows");
      if (!v19) {
        break;
      }
      uint64_t v21 = v19;
      uint64_t v22 = self;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v37, v45, 16);
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v38;
        while (2)
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v38 != v25) {
              objc_enumerationMutation(v21);
            }
            id v27 = *(void **)(*((void *)&v37 + 1) + 8 * i);
            unint64_t v28 = objc_msgSend_objectForKey_(v27, v15, @"tag");
            if (v28 && objc_msgSend_integerValue(v28, v15, v29) == a6)
            {
              uint64_t InfoForItemOfType_atItemTypeIndex_inCell = objc_msgSend_getInfoForItemOfType_atItemTypeIndex_inCell_(v22, v15, (uint64_t)v35, v36, v27);
              if (InfoForItemOfType_atItemTypeIndex_inCell) {
                objc_msgSend_setValue_forItem_(v22, v31, (uint64_t)a3, InfoForItemOfType_atItemTypeIndex_inCell);
              }
              return;
            }
          }
          uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v15, (uint64_t)&v37, v45, 16);
          if (v24) {
            continue;
          }
          break;
        }
      }
      ++v18;
      self = v22;
      uint64_t v17 = v32;
      uint64_t v12 = v33;
      if (v18 == v16)
      {
        uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v15, (uint64_t)&v41, v46, 16);
        if (v16) {
          goto LABEL_7;
        }
        return;
      }
    }
  }
}

- (void)setMinValue:(id)a3 andMaxValue:(id)a4 forItemOfType:(id)a5 atItemTypeIndex:(unint64_t)a6 inCellWithTag:(int64_t)a7
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  if (dword_268147C18 <= 800 && (dword_268147C18 != -1 || sub_226865630((uint64_t)&dword_268147C18, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147C18, (uint64_t)"-[TableViewManager setMinValue:andMaxValue:forItemOfType:atItemTypeIndex:inCellWithTag:]", 800, (uint64_t)"type = %@  index = %d  cell tag = %d\n", (uint64_t)a5, a6, a7, v7, (uint64_t)a5);
  }
  id v35 = a5;
  unint64_t v36 = a6;
  uint64_t v12 = objc_msgSend_objectForKey_(self->_tableDescriptorDict, a2, @"tableSectionArray");
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v41, v46, 16);
  if (v14)
  {
    uint64_t v16 = v14;
    uint64_t v17 = *(void *)v42;
    uint64_t v31 = *(void *)v42;
    uint64_t v32 = v12;
LABEL_7:
    uint64_t v18 = 0;
    while (1)
    {
      if (*(void *)v42 != v17) {
        objc_enumerationMutation(v12);
      }
      uint64_t v19 = objc_msgSend_objectForKey_(*(void **)(*((void *)&v41 + 1) + 8 * v18), v15, @"sectionRows");
      if (!v19) {
        break;
      }
      uint64_t v21 = v19;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v37, v45, 16);
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v38;
        while (2)
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v38 != v24) {
              objc_enumerationMutation(v21);
            }
            uint64_t v26 = *(void **)(*((void *)&v37 + 1) + 8 * i);
            id v27 = objc_msgSend_objectForKey_(v26, v15, @"tag");
            if (v27 && objc_msgSend_integerValue(v27, v15, v28) == a7)
            {
              uint64_t InfoForItemOfType_atItemTypeIndex_inCell = objc_msgSend_getInfoForItemOfType_atItemTypeIndex_inCell_(self, v15, (uint64_t)v35, v36, v26);
              if (InfoForItemOfType_atItemTypeIndex_inCell) {
                objc_msgSend_setMinValue_andMaxValue_forItem_(self, v30, (uint64_t)a3, a4, InfoForItemOfType_atItemTypeIndex_inCell);
              }
              return;
            }
          }
          uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v15, (uint64_t)&v37, v45, 16);
          if (v23) {
            continue;
          }
          break;
        }
      }
      ++v18;
      uint64_t v17 = v31;
      uint64_t v12 = v32;
      if (v18 == v16)
      {
        uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v15, (uint64_t)&v41, v46, 16);
        if (v16) {
          goto LABEL_7;
        }
        return;
      }
    }
  }
}

- (void)setValue:(id)a3 forItemOfType:(id)a4 atItemTypeIndex:(unint64_t)a5 inCellAtIndexPath:(id)a6
{
  if (dword_268147C18 <= 800 && (dword_268147C18 != -1 || sub_226865630((uint64_t)&dword_268147C18, 0x320u)))
  {
    objc_msgSend_section(a6, a2, (uint64_t)a3);
    objc_msgSend_row(a6, v11, v12);
    sub_226865EB4((uint64_t)&dword_268147C18, (uint64_t)"-[TableViewManager setValue:forItemOfType:atItemTypeIndex:inCellAtIndexPath:]", 800, (uint64_t)"type = %@  index = %d  section = %d  row = %d\n", v13, v14, v15, v16, (uint64_t)a4);
  }
  uint64_t CellDictForCellAtIndexPath = objc_msgSend_getCellDictForCellAtIndexPath_(self, a2, (uint64_t)a6);
  if (CellDictForCellAtIndexPath)
  {
    uint64_t InfoForItemOfType_atItemTypeIndex_inCell = objc_msgSend_getInfoForItemOfType_atItemTypeIndex_inCell_(self, v18, (uint64_t)a4, a5, CellDictForCellAtIndexPath);
    if (InfoForItemOfType_atItemTypeIndex_inCell)
    {
      objc_msgSend_setValue_forItem_(self, v20, (uint64_t)a3, InfoForItemOfType_atItemTypeIndex_inCell);
    }
  }
}

- (BOOL)setNewRow:(id)a3 itemAttribute:(id)a4 forItemOfType:(id)a5 atItemTypeIndex:(unint64_t)a6 toValue:(id)a7
{
  uint64_t v7 = self;
  LOBYTE(self) = 0;
  if (a3)
  {
    if (a4)
    {
      if (a5)
      {
        if (a7)
        {
          self = (TableViewManager *)objc_msgSend_getInfoForItemOfType_atItemTypeIndex_inCell_(v7, a2, (uint64_t)a5, a6, a3);
          if (self)
          {
            if (a5 == @"editTextView" || a5 == @"labelView" || a5 == @"multilineLabelView")
            {
              objc_msgSend_setObject_forKey_(self, v11, (uint64_t)a7, a4);
              LOBYTE(self) = 1;
            }
            else
            {
              LOBYTE(self) = 0;
            }
          }
        }
      }
    }
  }
  return (char)self;
}

- (void)setNewRow:(id)a3 tag:(unint64_t)a4
{
  uint64_t v6 = objc_msgSend_numberWithInteger_(NSNumber, a2, a4);

  objc_msgSend_setObject_forKey_(a3, v5, v6, @"tag");
}

- (void)setNewRow:(id)a3 representedObject:(id)a4
{
}

- (void)setNewRow:(id)a3 accessoryType:(int64_t)a4
{
  uint64_t v6 = objc_msgSend_numberWithInteger_(NSNumber, a2, a4);

  objc_msgSend_setObject_forKey_(a3, v5, v6, @"accessory");
}

- (void)setNewRow:(id)a3 editingAccessoryType:(int64_t)a4
{
  uint64_t v6 = objc_msgSend_numberWithInteger_(NSNumber, a2, a4);

  objc_msgSend_setObject_forKey_(a3, v5, v6, @"editingAccessory");
}

- (void)setNewRow:(id)a3 accessoryView:(id)a4
{
}

- (void)setNewRow:(id)a3 editingAccessoryView:(id)a4
{
}

- (void)setNewRow:(id)a3 verifierAccessoryType:(int)a4
{
  if (dword_268147B98 <= 800 && (dword_268147B98 != -1 || sub_226865630((uint64_t)&dword_268147B98, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147B98, (uint64_t)"-[TableViewManager setNewRow:verifierAccessoryType:]", 800, (uint64_t)"\n", v4, v5, v6, v7, v12);
  }
  uint64_t v11 = objc_msgSend_numberWithInteger_(NSNumber, a2, a4);

  objc_msgSend_setObject_forKey_(a3, v10, v11, @"verifierAccessory");
}

- (void)setNewRow:(id)a3 editingStyle:(int64_t)a4
{
  uint64_t v6 = objc_msgSend_numberWithInteger_(NSNumber, a2, a4);

  objc_msgSend_setObject_forKey_(a3, v5, v6, @"editingStyle");
}

- (void)setNewRow:(id)a3 textFieldViewMode:(int64_t)a4
{
  uint64_t v6 = objc_msgSend_numberWithInteger_(NSNumber, a2, a4);

  objc_msgSend_setObject_forKey_(a3, v5, v6, @"textFieldViewMode");
}

- (void)setNewRow:(id)a3 selectableCell:(BOOL)a4
{
  uint64_t v6 = objc_msgSend_numberWithInteger_(NSNumber, a2, a4);

  objc_msgSend_setObject_forKey_(a3, v5, v6, @"selectableCell");
}

- (void)setCellRowInfoItem:(id)a3 atIndex:(unint64_t)a4 forKey:(id)a5 toValue:(id)a6
{
  if (a3)
  {
    if (a5)
    {
      if (a6)
      {
        uint64_t v9 = objc_msgSend_valueForKey_(a3, a2, @"items");
        if (v9)
        {
          uint64_t v11 = objc_msgSend_objectAtIndex_(v9, v10, a4);
          if (v11)
          {
            objc_msgSend_setObject_forKey_(v11, v12, (uint64_t)a6, a5);
          }
        }
      }
    }
  }
}

- (void)makeFirstEditableCellCurrentResponder
{
  if (dword_268147B18 <= 800 && (dword_268147B18 != -1 || sub_226865630((uint64_t)&dword_268147B18, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147B18, (uint64_t)"-[TableViewManager makeFirstEditableCellCurrentResponder]", 800, (uint64_t)"\n", v2, v3, v4, v5, v13);
  }
  uint64_t v14 = 0;
  self->_currentFirstResponder = 0;

  self->_currentFirstResponderCellPath = 0;
  FirstResponderInTableView_foundParentCell = (UIView *)objc_msgSend_findFirstResponderInTableView_foundParentCell_(self, v7, (uint64_t)self->_managedTableView, &v14);
  if (FirstResponderInTableView_foundParentCell)
  {
    uint64_t v11 = FirstResponderInTableView_foundParentCell;
    objc_msgSend_becomeFirstResponder(FirstResponderInTableView_foundParentCell, v9, v10);
    self->_currentFirstResponder = v11;
    self->_currentFirstResponderCellPath = (NSIndexPath *)(id)objc_msgSend_indexPathForCell_(self->_managedTableView, v12, v14);
  }
}

- (id)findFirstResponderInView:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (dword_268147B18 <= 800 && (dword_268147B18 != -1 || sub_226865630((uint64_t)&dword_268147B18, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147B18, (uint64_t)"-[TableViewManager findFirstResponderInView:]", 800, (uint64_t)"view = %@\n", v3, v4, v5, v6, (uint64_t)a3);
  }
  BOOL v8 = objc_msgSend_subviews(a3, a2, (uint64_t)a3);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v21, v25, 16);
  if (v10)
  {
    uint64_t v15 = v10;
    uint64_t v16 = *(void *)v22;
LABEL_7:
    uint64_t v17 = 0;
    while (1)
    {
      if (*(void *)v22 != v16) {
        objc_enumerationMutation(v8);
      }
      uint64_t v18 = *(void **)(*((void *)&v21 + 1) + 8 * v17);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      if (v15 == ++v17)
      {
        uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v19, (uint64_t)&v21, v25, 16);
        if (v15) {
          goto LABEL_7;
        }
        goto LABEL_13;
      }
    }
  }
  else
  {
LABEL_13:
    uint64_t v18 = 0;
  }
  if (dword_268147B18 <= 800 && (dword_268147B18 != -1 || sub_226865630((uint64_t)&dword_268147B18, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147B18, (uint64_t)"-[TableViewManager findFirstResponderInView:]", 800, (uint64_t)"returning %@\n", v11, v12, v13, v14, (uint64_t)v18);
  }
  return v18;
}

- (id)findFirstResponderInTableView:(id)a3 fromSection:(unint64_t)a4 fromRow:(unint64_t)a5 foundParentCell:(id *)a6
{
  unint64_t v9 = a5;
  if (dword_268147B18 <= 800 && (dword_268147B18 != -1 || sub_226865630((uint64_t)&dword_268147B18, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147B18, (uint64_t)"-[TableViewManager findFirstResponderInTableView:fromSection:fromRow:foundParentCell:]", 800, (uint64_t)"section %d  from row %d\n", a5, (uint64_t)a6, v6, v7, a4);
  }
  if (objc_msgSend_numberOfRowsInSection_(a3, a2, a4) <= v9)
  {
LABEL_11:
    uint64_t v26 = 0;
    goto LABEL_12;
  }
  while (1)
  {
    uint64_t v18 = objc_msgSend_indexPathForRow_inSection_(MEMORY[0x263F088C8], v13, v9, a4);
    if (v18) {
      break;
    }
LABEL_10:
    if (v9 >= objc_msgSend_numberOfRowsInSection_(a3, v19, a4)) {
      goto LABEL_11;
    }
  }
  uint64_t v20 = objc_msgSend_cellForRowAtIndexPath_(a3, v19, v18);
  if (!v20
    || (long long v22 = v20,
        uint64_t v23 = objc_msgSend_contentView(v20, v19, v21),
        (uint64_t FirstResponderInView = objc_msgSend_findFirstResponderInView_(self, v24, v23)) == 0))
  {
    ++v9;
    goto LABEL_10;
  }
  uint64_t v26 = (void *)FirstResponderInView;
  if (a6) {
    *a6 = v22;
  }
LABEL_12:
  if (dword_268147B18 <= 800 && (dword_268147B18 != -1 || sub_226865630((uint64_t)&dword_268147B18, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147B18, (uint64_t)"-[TableViewManager findFirstResponderInTableView:fromSection:fromRow:foundParentCell:]", 800, (uint64_t)"returning %@\n", v14, v15, v16, v17, (uint64_t)v26);
  }
  return v26;
}

- (id)findFirstResponderInTableView:(id)a3 foundParentCell:(id *)a4
{
  if (dword_268147B18 <= 800 && (dword_268147B18 != -1 || sub_226865630((uint64_t)&dword_268147B18, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147B18, (uint64_t)"-[TableViewManager findFirstResponderInTableView:foundParentCell:]", 800, (uint64_t)"\n", v4, v5, v6, v7, v22);
  }
  if (objc_msgSend_numberOfSections(a3, a2, (uint64_t)a3) < 1)
  {
LABEL_9:
    uint64_t v20 = 0;
  }
  else
  {
    uint64_t v16 = 0;
    while (1)
    {
      uint64_t FirstResponderInTableView_fromSection_fromRow_foundParentCell = objc_msgSend_findFirstResponderInTableView_fromSection_fromRow_foundParentCell_(self, v11, (uint64_t)a3, v16, 0, a4);
      if (FirstResponderInTableView_fromSection_fromRow_foundParentCell) {
        break;
      }
      if (++v16 >= objc_msgSend_numberOfSections(a3, v18, v19)) {
        goto LABEL_9;
      }
    }
    uint64_t v20 = (void *)FirstResponderInTableView_fromSection_fromRow_foundParentCell;
  }
  if (dword_268147B18 <= 800 && (dword_268147B18 != -1 || sub_226865630((uint64_t)&dword_268147B18, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147B18, (uint64_t)"-[TableViewManager findFirstResponderInTableView:foundParentCell:]", 800, (uint64_t)"returning %@\n", v12, v13, v14, v15, (uint64_t)v20);
  }
  return v20;
}

- (BOOL)becomeFirstResponderAtIndexPath:(id)a3
{
  managedTableView = self->_managedTableView;
  uint64_t v6 = objc_msgSend_section(a3, a2, (uint64_t)a3);
  uint64_t v9 = objc_msgSend_row(a3, v7, v8);
  uint64_t FirstResponderInTableView_fromSection_fromRow_foundParentCell = objc_msgSend_findFirstResponderInTableView_fromSection_fromRow_foundParentCell_(self, v10, (uint64_t)managedTableView, v6, v9, 0);
  objc_msgSend_becomeFirstResponder(FirstResponderInTableView_fromSection_fromRow_foundParentCell, v12, v13);
  return FirstResponderInTableView_fromSection_fromRow_foundParentCell != 0;
}

- (id)findNextResponderInTableView:(id)a3 foundParentCell:(id *)a4
{
  if (dword_268147B18 <= 800 && (dword_268147B18 != -1 || sub_226865630((uint64_t)&dword_268147B18, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147B18, (uint64_t)"-[TableViewManager findNextResponderInTableView:foundParentCell:]", 800, (uint64_t)"\n", v4, v5, v6, v7, v27);
  }
  unint64_t v11 = objc_msgSend_section(self->_currentFirstResponderCellPath, a2, (uint64_t)a3);
  uint64_t FirstResponderInTableView_fromSection_fromRow_foundParentCell = (void *)(objc_msgSend_row(self->_currentFirstResponderCellPath, v12, v13)+ 1);
  if (dword_268147B18 <= 800 && (dword_268147B18 != -1 || sub_226865630((uint64_t)&dword_268147B18, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147B18, (uint64_t)"-[TableViewManager findNextResponderInTableView:foundParentCell:]", 800, (uint64_t)"current responder section %d  row %d\n", v16, v17, v18, v19, v11);
  }
  while (v11 < objc_msgSend_numberOfSections(a3, v14, v15))
  {
    uint64_t FirstResponderInTableView_fromSection_fromRow_foundParentCell = objc_msgSend_findFirstResponderInTableView_fromSection_fromRow_foundParentCell_(self, v25, (uint64_t)a3, v11, FirstResponderInTableView_fromSection_fromRow_foundParentCell, a4);
    if (FirstResponderInTableView_fromSection_fromRow_foundParentCell) {
      goto LABEL_13;
    }
    ++v11;
  }
  uint64_t FirstResponderInTableView_fromSection_fromRow_foundParentCell = 0;
LABEL_13:
  if (dword_268147B18 <= 800 && (dword_268147B18 != -1 || sub_226865630((uint64_t)&dword_268147B18, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147B18, (uint64_t)"-[TableViewManager findNextResponderInTableView:foundParentCell:]", 800, (uint64_t)"returning %@\n", v21, v22, v23, v24, (uint64_t)FirstResponderInTableView_fromSection_fromRow_foundParentCell);
  }
  return FirstResponderInTableView_fromSection_fromRow_foundParentCell;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  uint64_t v3 = objc_msgSend_objectForKey_(self->_tableDescriptorDict, a2, @"tableSectionArray");
  uint64_t v10 = objc_msgSend_count(v3, v4, v5);
  if (dword_268147B18 <= 800 && (dword_268147B18 != -1 || sub_226865630((uint64_t)&dword_268147B18, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147B18, (uint64_t)"-[TableViewManager numberOfSectionsInTableView:]", 800, (uint64_t)"section count = %d\n", v6, v7, v8, v9, v10);
  }
  return v10;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  RowArrayForSection = objc_msgSend_getRowArrayForSection_(self, a2, a4);
  if (!RowArrayForSection) {
    return 0;
  }
  int64_t v12 = objc_msgSend_count(RowArrayForSection, v6, v7);
  if (dword_268147B18 <= 800 && (dword_268147B18 != -1 || sub_226865630((uint64_t)&dword_268147B18, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147B18, (uint64_t)"-[TableViewManager tableView:numberOfRowsInSection:]", 800, (uint64_t)"section %d row count = %d\n", v8, v9, v10, v11, a4);
  }
  return v12;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 layoutMode:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v194 = *MEMORY[0x263EF8340];
  if (dword_268147B58 <= 800 && (dword_268147B58 != -1 || sub_226865630((uint64_t)&dword_268147B58, 0x320u)))
  {
    uint64_t v9 = objc_msgSend_managedTableView(self, a2, (uint64_t)a3);
    sub_226865EB4((uint64_t)&dword_268147B58, (uint64_t)"-[TableViewManager tableView:cellForRowAtIndexPath:layoutMode:]", 800, (uint64_t)"managedTableView %@\n", v10, v11, v12, v13, v9);
  }
  unint64_t v14 = objc_msgSend_row(a4, a2, (uint64_t)a3);
  uint64_t v17 = objc_msgSend_section(a4, v15, v16);
  v186 = self;
  SectionDictForSection = objc_msgSend_getSectionDictForSection_(self, v18, v17);
  uint64_t v21 = objc_msgSend_objectForKey_(SectionDictForSection, v20, @"sectionRows");
  uint64_t v23 = objc_msgSend_objectForKey_(SectionDictForSection, v22, @"sectionIsMenu");
  unsigned int v184 = objc_msgSend_BOOLValue(v23, v24, v25);
  if (v14 >= objc_msgSend_count(v21, v26, v27)) {
    return 0;
  }
  long long v34 = objc_msgSend_objectAtIndex_(v21, v28, v14);
  if (dword_268147B18 <= 800 && (dword_268147B18 != -1 || sub_226865630((uint64_t)&dword_268147B18, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147B18, (uint64_t)"-[TableViewManager tableView:cellForRowAtIndexPath:layoutMode:]", 800, (uint64_t)"section %d row %d\n", v30, v31, v32, v33, v17);
  }
  id v35 = objc_msgSend_objectForKey_(v34, v29, @"accessory");
  if (v35) {
    uint64_t v38 = objc_msgSend_integerValue(v35, v36, v37);
  }
  else {
    uint64_t v38 = 0;
  }
  long long v40 = objc_msgSend_objectForKey_(v34, v36, @"editingAccessory");
  if (v40) {
    obuint64_t j = (id)objc_msgSend_integerValue(v40, v41, v42);
  }
  else {
    obuint64_t j = 0;
  }
  long long v43 = objc_msgSend_valueForKey_(v34, v41, @"selectableCell");
  uint64_t InfoForItemOfType_atItemTypeIndex_inCell = objc_msgSend_getInfoForItemOfType_atItemTypeIndex_inCell_(v186, v44, @"wholeCellButtonView", 0, v34);
  uint64_t v185 = v38;
  BOOL v49 = (objc_msgSend_BOOLValue(v43, v46, v47) & 1) != 0
     || InfoForItemOfType_atItemTypeIndex_inCell && !v43
     || v38 == 1
     || obj == (id)1;
  int v51 = v49 | v184;
  uint64_t v52 = objc_msgSend_numberWithBool_(NSNumber, v48, v49 | v184);
  objc_msgSend_setObject_forKey_(v34, v53, v52, @"selectable");
  uint64_t v55 = objc_msgSend_objectForKey_(v34, v54, @"noBackground");
  uint64_t v56 = v34;
  uint64_t v57 = v55;
  if (v55) {
    uint64_t v58 = @"NoBackgroundTypeCellID";
  }
  else {
    uint64_t v58 = @"GenericTypeCellID";
  }
  v183 = v56;
  uint64_t v59 = objc_msgSend_objectForKey_(v56, (const char *)v56, @"lastOwningCell");
  if (v59)
  {
    gLayoutNoBackgroundCell = (ManagedTableViewCell *)v59;
    if (dword_268147B18 <= 800 && (dword_268147B18 != -1 || sub_226865630((uint64_t)&dword_268147B18, 0x320u))) {
      sub_226865EB4((uint64_t)&dword_268147B18, (uint64_t)"-[TableViewManager tableView:cellForRowAtIndexPath:layoutMode:]", 800, (uint64_t)"cell is cached, freeing\n", v62, v63, v64, v65, v180);
    }
    v67 = gLayoutNoBackgroundCell;
    v68 = v183;
    objc_msgSend_removeObjectForKey_(v183, v69, @"lastOwningCell");
    id v70 = a4;
    v71 = v186;
    objc_msgSend_setParentTableManager_(gLayoutNoBackgroundCell, v72, (uint64_t)v186);
  }
  else
  {
    if (v5)
    {
      if (v57)
      {
        gLayoutNoBackgroundCell = v186->_gLayoutNoBackgroundCell;
        if (!gLayoutNoBackgroundCell)
        {
          char v74 = [ManagedTableViewCell alloc];
          gLayoutNoBackgroundCell = (ManagedTableViewCell *)objc_msgSend_initWithStyle_reuseIdentifier_(v74, v75, 0, @"NoBackgroundTypeCellID");
          v186->_gLayoutNoBackgroundCell = gLayoutNoBackgroundCell;
        }
      }
      else
      {
        gLayoutNoBackgroundCell = v186->_gLayoutGenericCell;
        if (!gLayoutNoBackgroundCell)
        {
          v81 = [ManagedTableViewCell alloc];
          gLayoutNoBackgroundCell = (ManagedTableViewCell *)objc_msgSend_initWithStyle_reuseIdentifier_(v81, v82, 0, @"GenericTypeCellID");
          v186->_gLayoutGenericCell = gLayoutNoBackgroundCell;
        }
      }
      objc_msgSend_bounds(a3, v60, v61);
      id v70 = a4;
      v68 = v183;
      if (v84 <= 0.0)
      {
        v71 = v186;
      }
      else
      {
        objc_msgSend_frame(gLayoutNoBackgroundCell, v76, v83);
        double v86 = v85;
        objc_msgSend_bounds(a3, v87, v88);
        v71 = v186;
        if (v86 != v90)
        {
          objc_msgSend_frame(gLayoutNoBackgroundCell, v76, v89);
          double v92 = v91;
          double v94 = v93;
          objc_msgSend_bounds(a3, v95, v96);
          objc_msgSend_setFrame_(gLayoutNoBackgroundCell, v97, v98, v92, v94);
        }
      }
    }
    else
    {
      gLayoutNoBackgroundCell = (ManagedTableViewCell *)objc_msgSend_dequeueReusableCellWithIdentifier_(a3, v60, (uint64_t)v58);
      id v70 = a4;
      v71 = v186;
      v68 = v183;
    }
    if (!gLayoutNoBackgroundCell)
    {
      if (dword_268147B18 <= 800 && (dword_268147B18 != -1 || sub_226865630((uint64_t)&dword_268147B18, 0x320u))) {
        sub_226865EB4((uint64_t)&dword_268147B18, (uint64_t)"-[TableViewManager tableView:cellForRowAtIndexPath:layoutMode:]", 800, (uint64_t)"creating cell from scratch\n", v77, v78, v79, v80, v180);
      }
      uint64_t v99 = [ManagedTableViewCell alloc];
      gLayoutNoBackgroundCell = (ManagedTableViewCell *)(id)objc_msgSend_initWithStyle_reuseIdentifier_(v99, v100, 0, v58);
    }
    objc_msgSend_setParentTableManager_(gLayoutNoBackgroundCell, v76, (uint64_t)v71);
  }
  v101 = objc_msgSend_objectForKey_(SectionDictForSection, v73, @"furthestTextInset");
  uint64_t v104 = objc_msgSend_integerValue(v101, v102, v103);
  objc_msgSend_setForcedRightmostEditTextInset_(gLayoutNoBackgroundCell, v105, v106, (double)v104);
  if (dword_268147B18 <= 800 && (dword_268147B18 != -1 || sub_226865630((uint64_t)&dword_268147B18, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147B18, (uint64_t)"-[TableViewManager tableView:cellForRowAtIndexPath:layoutMode:]", 800, (uint64_t)"cell is %@\n", v108, v109, v110, v111, (uint64_t)gLayoutNoBackgroundCell);
  }
  objc_msgSend_setAccessoryType_(gLayoutNoBackgroundCell, v107, v185);
  objc_msgSend_setAccessoryView_(gLayoutNoBackgroundCell, v112, 0);
  objc_msgSend_setEditingAccessoryType_(gLayoutNoBackgroundCell, v113, (uint64_t)obj);
  objc_msgSend_setEditingAccessoryView_(gLayoutNoBackgroundCell, v114, 0);
  long long v116 = objc_msgSend_objectForKey_(v68, v115, @"verifierAccessory");
  if (v116)
  {
    uint64_t v119 = objc_msgSend_integerValue(v116, v117, v118);
    objc_msgSend_setVerifierAccessoryView_forCell_(v71, v120, v119, gLayoutNoBackgroundCell);
  }
  if (v51)
  {
    objc_msgSend_setSelectionStyle_(gLayoutNoBackgroundCell, v117, 1);
    uint64_t v123 = objc_msgSend_accessibilityTraits(gLayoutNoBackgroundCell, v121, v122);
    objc_msgSend_setAccessibilityTraits_(gLayoutNoBackgroundCell, v124, *MEMORY[0x263F1CEE8] | v123);
  }
  else
  {
    objc_msgSend_setSelectionStyle_(gLayoutNoBackgroundCell, v117, 0);
  }
  v126 = objc_msgSend_objectForKey_(v68, v125, @"tag");
  if (v126)
  {
    uint64_t v129 = objc_msgSend_integerValue(v126, v127, v128);
    objc_msgSend_setTag_(gLayoutNoBackgroundCell, v130, v129);
  }
  id v182 = v70;
  objc_msgSend_setCurrentIndexPath_(gLayoutNoBackgroundCell, v127, (uint64_t)v70);
  long long v191 = 0u;
  long long v192 = 0u;
  long long v189 = 0u;
  long long v190 = 0u;
  id obja = (id)objc_msgSend_objectForKey_(v68, v131, @"items");
  uint64_t v133 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v132, (uint64_t)&v189, v193, 16);
  if (!v133)
  {
LABEL_90:
    long long v39 = gLayoutNoBackgroundCell;
    if (v184)
    {
      v172 = objc_msgSend_objectForKey_(v183, v134, @"menuSelected");
      uint64_t v175 = objc_msgSend_BOOLValue(v172, v173, v174);
      objc_msgSend_setMenuCell_visualStateToSelected_atIndexPath_(v71, v176, (uint64_t)gLayoutNoBackgroundCell, v175, v182);
    }
    uint64_t v177 = objc_msgSend_objectForKey_(v183, v134, @"accessibilityLabel");
    if (v177) {
      objc_msgSend_setAccessibilityLabel_(gLayoutNoBackgroundCell, v178, v177);
    }
    objc_msgSend_setCellDict_(gLayoutNoBackgroundCell, v178, (uint64_t)v183);
    return v39;
  }
  uint64_t v135 = v133;
  uint64_t v136 = v17 | (v14 << 16);
  uint64_t v137 = *(void *)v190;
LABEL_67:
  uint64_t v138 = 0;
  while (1)
  {
    if (*(void *)v190 != v137) {
      objc_enumerationMutation(obja);
    }
    v139 = *(void **)(*((void *)&v189 + 1) + 8 * v138);
    v140 = objc_msgSend_objectForKey_(v139, v134, @"itemType");
    uint64_t v142 = objc_msgSend_objectForKey_(v139, v141, @"startValue");
    if (v142)
    {
      v144 = (void *)v142;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && objc_msgSend_isEqualToString_(v144, v145, @"dynamicValue"))
      {
        objc_msgSend_delegate(v71, v145, v146);
        if (objc_opt_respondsToSelector())
        {
          v148 = objc_msgSend_delegate(v71, v143, v147);
          uint64_t v151 = objc_msgSend_tag(gLayoutNoBackgroundCell, v149, v150);
          uint64_t v153 = objc_msgSend_valueForItemOfType_atTypeIndex_inCellWithTag_(v148, v152, (uint64_t)v140, 0, v151);
          objc_msgSend_setObject_forKey_(v139, v154, v153, @"currentValue");
        }
      }
      else if (!objc_msgSend_objectForKey_(v139, v145, @"currentValue"))
      {
        objc_msgSend_setObject_forKey_(v139, v143, (uint64_t)v144, @"currentValue");
      }
    }
    v155 = objc_msgSend_objectForKey_(v139, v143, @"cachedView");
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (v155)
    {
      if (isKindOfClass)
      {
        v159 = NSString;
        uint64_t Letter = objc_msgSend_stringByCapitalizingFirstLetter(v140, v157, v158);
        v160 = v159;
        v71 = v186;
        v162 = (NSString *)objc_msgSend_stringWithFormat_(v160, v161, @"set%@Value:usingItemInfo:", Letter);
        SEL v163 = NSSelectorFromString(v162);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend_performSelector_withObject_withObject_(v186, v157, (uint64_t)v163, v155, v139);
        }
      }
      goto LABEL_88;
    }
    if (isKindOfClass)
    {
      v164 = (NSString *)objc_msgSend_stringWithFormat_(NSString, v157, @"%@:", v140);
      SEL v165 = NSSelectorFromString(v164);
      if ((objc_opt_respondsToSelector() & 1) == 0) {
        return gLayoutNoBackgroundCell;
      }
      v155 = objc_msgSend_performSelector_withObject_(v71, v166, (uint64_t)v165, v139);
      if (!v155) {
        return gLayoutNoBackgroundCell;
      }
      goto LABEL_87;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      break;
    }
    v155 = v140;
    if (!v140) {
      return gLayoutNoBackgroundCell;
    }
LABEL_87:
    objc_msgSend_setObject_forKey_(v139, v167, (uint64_t)v155, @"cachedView");
LABEL_88:
    objc_msgSend_setTag_(v155, v157, v136);
    if (v135 == ++v138)
    {
      uint64_t v135 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v134, (uint64_t)&v189, v193, 16);
      if (v135) {
        goto LABEL_67;
      }
      goto LABEL_90;
    }
  }
  if (dword_268147B18 > 800) {
    return gLayoutNoBackgroundCell;
  }
  long long v39 = gLayoutNoBackgroundCell;
  if (dword_268147B18 != -1 || sub_226865630((uint64_t)&dword_268147B18, 0x320u)) {
    sub_226865EB4((uint64_t)&dword_268147B18, (uint64_t)"-[TableViewManager tableView:cellForRowAtIndexPath:layoutMode:]", 800, (uint64_t)"invalid kTableCellItemTypeKey value '%@'\n", v168, v169, v170, v171, (uint64_t)v140);
  }
  return v39;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  return (id)objc_msgSend_tableView_cellForRowAtIndexPath_layoutMode_(self, a2, (uint64_t)a3, a4, 0);
}

- (id)getRepresentedObjectForCellAtIndexPath:(id)a3
{
  id result = (id)objc_msgSend_getCellDictForCellAtIndexPath_(self, a2, (uint64_t)a3);
  if (result)
  {
    return (id)objc_msgSend_objectForKey_(result, v4, @"representedObject");
  }
  return result;
}

- (void)updateHeader:(id)a3 forSectionWithIdentifier:(id)a4
{
  objc_msgSend_indexOfSectionWithIdentifier_(self, a2, (uint64_t)a4);

  MEMORY[0x270F9A6D0](self, sel_updateHeader_inSection_, a3);
}

- (void)updateHeader:(id)a3 inSection:(unint64_t)a4
{
  if (a4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend_setDescriptorObject_forKey_inSection_(self, a2, (uint64_t)a3, @"header", a4);
    MEMORY[0x270F9A6D0](self, sel_reloadSection_, a4);
  }
}

- (void)updateFooter:(id)a3 forSectionWithIdentifier:(id)a4
{
  objc_msgSend_indexOfSectionWithIdentifier_(self, a2, (uint64_t)a4);

  MEMORY[0x270F9A6D0](self, sel_updateFooter_inSection_, a3);
}

- (void)updateFooter:(id)a3 inSection:(unint64_t)a4
{
  if (a4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend_setDescriptorObject_forKey_inSection_(self, a2, (uint64_t)a3, @"footer", a4);
    if (!self->_handlingBulkUpdate)
    {
      uint64_t v8 = objc_msgSend_areAnimationsEnabled(MEMORY[0x263F1CB60], v6, v7);
      objc_msgSend_setAnimationsEnabled_(MEMORY[0x263F1CB60], v9, 0);
      managedTableView = self->_managedTableView;
      uint64_t v12 = objc_msgSend_indexSetWithIndex_(MEMORY[0x263F088D0], v11, a4);
      objc_msgSend_reloadSections_withRowAnimation_(managedTableView, v13, v12, 5);
      uint64_t v15 = (void *)MEMORY[0x263F1CB60];
      objc_msgSend_setAnimationsEnabled_(v15, v14, v8);
    }
  }
}

- (void)setRepresentedObject:(id)a3 forCellAtIndexPath:(id)a4
{
  uint64_t CellDictForCellAtIndexPath = objc_msgSend_getCellDictForCellAtIndexPath_(self, a2, (uint64_t)a4);
  if (CellDictForCellAtIndexPath)
  {
    objc_msgSend_setObject_forKey_(CellDictForCellAtIndexPath, v6, (uint64_t)a3, @"representedObject");
  }
}

- (double)totalTableHeight
{
  uint64_t v4 = objc_msgSend_tableHeaderView(self->_managedTableView, a2, v2);
  objc_msgSend_frame(v4, v5, v6);
  double v8 = v7 + 0.0;
  objc_msgSend_totalTableSectionsHeight(self, v9, v10);
  double v12 = v11 + v8;
  uint64_t v15 = objc_msgSend_tableFooterView(self->_managedTableView, v13, v14);
  objc_msgSend_frame(v15, v16, v17);
  return v12 + v18;
}

- (double)totalTableSectionsHeight
{
  v34[1] = *MEMORY[0x263EF8340];
  if (objc_msgSend_numberOfSections(self->_managedTableView, a2, v2) < 1)
  {
    double v11 = 0.0;
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v10 = *MEMORY[0x263F1C238];
    double v11 = 0.0;
    do
    {
      objc_msgSend_rectForSection_(self->_managedTableView, v4, v9);
      uint64_t v18 = v17;
      if (dword_268147B18 <= 800 && (dword_268147B18 != -1 || sub_226865630((uint64_t)&dword_268147B18, 0x320u))) {
        sub_226865EB4((uint64_t)&dword_268147B18, (uint64_t)"-[TableViewManager totalTableSectionsHeight]", 800, (uint64_t)"section %f\n", v13, v14, v15, v16, v18);
      }
      double v11 = v11 + *(double *)&v18;
      uint64_t DescriptorObjectForKey_inSection = objc_msgSend_getDescriptorObjectForKey_inSection_(self, v12, @"footer", v9);
      if (DescriptorObjectForKey_inSection)
      {
        uint64_t v22 = (void *)DescriptorObjectForKey_inSection;
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v33 = v10;
          v34[0] = objc_msgSend_systemFontOfSize_(MEMORY[0x263F1C658], v20, v21, 15.0);
          uint64_t v24 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v23, (uint64_t)v34, &v33, 1);
          objc_msgSend_boundingRectWithSize_options_attributes_context_(v22, v25, 1, v24, 0, 300.0, 1024.0);
          double v11 = v11 + v30;
          if (dword_268147B18 <= 800)
          {
            uint64_t v31 = *(void *)&v30;
            if (dword_268147B18 != -1 || sub_226865630((uint64_t)&dword_268147B18, 0x320u)) {
              sub_226865EB4((uint64_t)&dword_268147B18, (uint64_t)"-[TableViewManager totalTableSectionsHeight]", 800, (uint64_t)"Footer text %f\n", v26, v27, v28, v29, v31);
            }
          }
        }
      }
      ++v9;
    }
    while (v9 < objc_msgSend_numberOfSections(self->_managedTableView, v20, v21));
  }
  if (dword_268147B18 <= 800 && (dword_268147B18 != -1 || sub_226865630((uint64_t)&dword_268147B18, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147B18, (uint64_t)"-[TableViewManager totalTableSectionsHeight]", 800, (uint64_t)"returning %f\n", v5, v6, v7, v8, *(uint64_t *)&v11);
  }
  return v11;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  if (dword_268147B58 <= 800 && (dword_268147B58 != -1 || sub_226865630((uint64_t)&dword_268147B58, 0x320u)))
  {
    uint64_t v7 = objc_msgSend_managedTableView(self, a2, (uint64_t)a3);
    sub_226865EB4((uint64_t)&dword_268147B58, (uint64_t)"-[TableViewManager tableView:heightForRowAtIndexPath:]", 800, (uint64_t)"managedTableView %@\n", v8, v9, v10, v11, v7);
  }
  uint64_t CellDictForCellAtIndexPath = objc_msgSend_getCellDictForCellAtIndexPath_(self, a2, (uint64_t)a4);
  if (!CellDictForCellAtIndexPath) {
    return 44.0;
  }
  uint64_t v14 = objc_msgSend_objectForKey_(CellDictForCellAtIndexPath, v13, @"cachedHeight");
  uint64_t v15 = NSNumber;
  objc_msgSend_bounds(a3, v16, v17);
  *(float *)&double v19 = v18;
  uint64_t v22 = objc_msgSend_numberWithFloat_(v15, v20, v21, v19);
  uint64_t v24 = objc_msgSend_objectForKey_(v14, v23, v22);
  if (!v24)
  {
    uint64_t v33 = objc_msgSend_tableView_cellForRowAtIndexPath_layoutMode_(self, v25, (uint64_t)a3, a4, 1);
    if (v33)
    {
      unint64_t v36 = v33;
      objc_msgSend_layoutSubviews(v33, v34, v35);
      objc_msgSend_neededContentHeight(v36, v37, v38);
      double v32 = v39;
      uint64_t v42 = objc_msgSend_section(a4, v40, v41);
      SectionDictForSection = objc_msgSend_getSectionDictForSection_(self, v43, v42);
      uint64_t v46 = objc_msgSend_objectForKey_(SectionDictForSection, v45, @"furthestTextInset");
      double v49 = (double)objc_msgSend_integerValue(v46, v47, v48);
      objc_msgSend_computedRightmostEditTextInset(v36, v50, v51);
      if (v54 > v49)
      {
        if (dword_268147B18 <= 800 && (dword_268147B18 != -1 || sub_226865630((uint64_t)&dword_268147B18, 0x320u)))
        {
          objc_msgSend_computedRightmostEditTextInset(v36, v52, v53);
          sub_226865EB4((uint64_t)&dword_268147B18, (uint64_t)"-[TableViewManager tableView:heightForRowAtIndexPath:]", 800, (uint64_t)"computed max edit text inset = %.1f\n", v55, v56, v57, v58, v59);
        }
        v60 = NSNumber;
        objc_msgSend_computedRightmostEditTextInset(v36, v52, v53);
        uint64_t v63 = objc_msgSend_numberWithInteger_(v60, v62, (uint64_t)v61);
        objc_msgSend_setObject_forKey_(SectionDictForSection, v64, v63, @"furthestTextInset");
      }
      goto LABEL_18;
    }
    return 44.0;
  }
  objc_msgSend_floatValue(v24, v25, v26);
  double v32 = v31;
  if (dword_268147B58 <= 800 && (dword_268147B58 != -1 || sub_226865630((uint64_t)&dword_268147B58, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147B58, (uint64_t)"-[TableViewManager tableView:heightForRowAtIndexPath:]", 800, (uint64_t)"using cached height: %.0f\n", v27, v28, v29, v30, *(uint64_t *)&v32);
  }
LABEL_18:
  if (dword_268147B18 <= 800 && (dword_268147B18 != -1 || sub_226865630((uint64_t)&dword_268147B18, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147B18, (uint64_t)"-[TableViewManager tableView:heightForRowAtIndexPath:]", 800, (uint64_t)"returning %f\n", v27, v28, v29, v30, *(uint64_t *)&v32);
  }
  return v32;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  uint64_t DescriptorObjectForKey_inSection = objc_msgSend_getDescriptorObjectForKey_inSection_(self, a2, @"headerCache");
  if (DescriptorObjectForKey_inSection)
  {
    objc_msgSend_bounds(DescriptorObjectForKey_inSection, v6, v7);
    double v13 = v12;
  }
  else
  {
    double v13 = *MEMORY[0x263F1D600];
  }
  if (dword_268147BD8 <= 800 && (dword_268147BD8 != -1 || sub_226865630((uint64_t)&dword_268147BD8, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147BD8, (uint64_t)"-[TableViewManager tableView:heightForHeaderInSection:]", 800, (uint64_t)"section %d returning %f\n", v8, v9, v10, v11, a4);
  }
  return v13;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if (dword_268147BD8 <= 800 && (dword_268147BD8 != -1 || sub_226865630((uint64_t)&dword_268147BD8, 0x320u)))
  {
    uint64_t v6 = objc_msgSend_managedTableView(self, a2, (uint64_t)a3);
    sub_226865EB4((uint64_t)&dword_268147BD8, (uint64_t)"-[TableViewManager tableView:titleForHeaderInSection:]", 800, (uint64_t)"managedTableView %@\n", v7, v8, v9, v10, v6);
  }
  uint64_t DescriptorObjectForKey_inSection = objc_msgSend_getDescriptorObjectForKey_inSection_(self, a2, @"header", a4);
  if (DescriptorObjectForKey_inSection)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      uint64_t DescriptorObjectForKey_inSection = 0;
    }
  }
  if (dword_268147BD8 <= 800 && (dword_268147BD8 != -1 || sub_226865630((uint64_t)&dword_268147BD8, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147BD8, (uint64_t)"-[TableViewManager tableView:titleForHeaderInSection:]", 800, (uint64_t)"section %d returning %@\n", v11, v12, v13, v14, a4);
  }
  return DescriptorObjectForKey_inSection;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  uint64_t DescriptorObjectForKey_inSection = objc_msgSend_getDescriptorObjectForKey_inSection_(self, a2, @"header");
  if (DescriptorObjectForKey_inSection)
  {
    SectionDictForSection = objc_msgSend_getSectionDictForSection_(self, v6, a4);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend_setObject_forKey_(SectionDictForSection, v13, (uint64_t)DescriptorObjectForKey_inSection, @"headerCache");
    }
    else {
      uint64_t DescriptorObjectForKey_inSection = 0;
    }
  }
  if (dword_268147BD8 <= 800 && (dword_268147BD8 != -1 || sub_226865630((uint64_t)&dword_268147BD8, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147BD8, (uint64_t)"-[TableViewManager tableView:viewForHeaderInSection:]", 800, (uint64_t)"section %d returning %@\n", v7, v8, v9, v10, a4);
  }
  return DescriptorObjectForKey_inSection;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  double v8 = *MEMORY[0x263F1D600];
  if (dword_268147BD8 <= 800 && (dword_268147BD8 != -1 || sub_226865630((uint64_t)&dword_268147BD8, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147BD8, (uint64_t)"-[TableViewManager tableView:heightForFooterInSection:]", 800, (uint64_t)"section %d returning %f\n", v4, v5, v6, v7, a4);
  }
  return v8;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id result = (id)objc_msgSend_getDescriptorObjectForKey_inSection_(self, a2, @"footer", a4);
  if (result)
  {
    id v5 = result;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      return v5;
    }
    else {
      return 0;
    }
  }
  return result;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id result = (id)objc_msgSend_getDescriptorObjectForKey_inSection_(self, a2, @"footer", a4);
  if (result)
  {
    id v5 = result;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      return 0;
    }
    else {
      return v5;
    }
  }
  return result;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  if (dword_268147B18 <= 800 && (dword_268147B18 != -1 || sub_226865630((uint64_t)&dword_268147B18, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147B18, (uint64_t)"-[TableViewManager tableView:willSelectRowAtIndexPath:]", 800, (uint64_t)"\n", v4, v5, v6, v7, v30);
  }
  uint64_t v10 = objc_msgSend_section(a4, a2, (uint64_t)a3);
  SectionDictForSection = objc_msgSend_getSectionDictForSection_(self, v11, v10);
  if (!SectionDictForSection) {
    return 0;
  }
  uint64_t v14 = objc_msgSend_objectForKey_(SectionDictForSection, v13, @"sectionRows");
  unint64_t v17 = objc_msgSend_row(a4, v15, v16);
  if (v17 >= objc_msgSend_count(v14, v18, v19)) {
    return 0;
  }
  uint64_t v22 = objc_msgSend_row(a4, v20, v21);
  uint64_t v24 = objc_msgSend_objectAtIndex_(v14, v23, v22);
  uint64_t v26 = objc_msgSend_objectForKey_(v24, v25, @"selectable");
  if ((objc_msgSend_BOOLValue(v26, v27, v28) & 1) == 0) {
    return 0;
  }
  return a4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  if (dword_268147B18 <= 800 && (dword_268147B18 != -1 || sub_226865630((uint64_t)&dword_268147B18, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147B18, (uint64_t)"-[TableViewManager tableView:didSelectRowAtIndexPath:]", 800, (uint64_t)"\n", v4, v5, v6, v7, v26);
  }
  uint64_t v11 = objc_msgSend_section(a4, a2, (uint64_t)a3);
  uint64_t SectionDictForSection = objc_msgSend_getSectionDictForSection_(self, v12, v11);
  if (SectionDictForSection)
  {
    uint64_t v15 = (void *)SectionDictForSection;
    uint64_t v16 = objc_msgSend_cellForRowAtIndexPath_(self->_managedTableView, v14, (uint64_t)a4);
    double v18 = objc_msgSend_objectForKey_(v15, v17, @"sectionIsMenu");
    double v22 = 0.0;
    if (objc_msgSend_BOOLValue(v18, v19, v20))
    {
      objc_msgSend_selectMenuCellAtIndexPath_(self, v21, (uint64_t)a4);
      double v22 = 0.15;
    }
    objc_msgSend_deselectRowAtIndexPath_animated_(a3, v21, (uint64_t)a4, 1);
    if (v16 && objc_msgSend_delegate(self, v23, v24))
    {
      objc_msgSend_performSelector_withObject_afterDelay_(self, v25, (uint64_t)sel_deferedTouchInCellAtIndexPath_, a4, v22);
    }
  }
  else
  {
    objc_msgSend_deselectRowAtIndexPath_animated_(a3, v14, (uint64_t)a4, 1);
  }
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  uint64_t CellDictForCellAtIndexPath = objc_msgSend_getCellDictForCellAtIndexPath_(self, a2, (uint64_t)a4);
  if (!CellDictForCellAtIndexPath) {
    return 0;
  }
  uint64_t v6 = objc_msgSend_valueForKey_(CellDictForCellAtIndexPath, v5, @"editingStyle");
  if (!v6) {
    return 0;
  }

  return objc_msgSend_integerValue(v6, v7, v8);
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  objc_msgSend_delegate(self, a2, (uint64_t)a3);
  if (objc_opt_respondsToSelector())
  {
    uint64_t v9 = objc_msgSend_delegate(self, v7, v8);
    MEMORY[0x270F9A6D0](v9, sel_commitEditingStyle_forRowAtIndexPath_, a4);
  }
}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  objc_msgSend_delegate(self, a2, (uint64_t)a3);
  if (objc_opt_respondsToSelector())
  {
    uint64_t v8 = objc_msgSend_delegate(self, v6, v7);
    MEMORY[0x270F9A6D0](v8, sel_accessoryButtonTappedForRowWithIndexPath_, a4);
  }
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  objc_msgSend_delegate(self, a2, (uint64_t)a3);
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 1;
  }
  uint64_t v8 = objc_msgSend_delegate(self, v6, v7);

  return MEMORY[0x270F9A6D0](v8, sel_shouldIndentWhileEditingRowAtIndexPath_, a4);
}

- (BOOL)tableView:(id)a3 shouldShowMenuForRowAtIndexPath:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (dword_268147B18 <= 800 && (dword_268147B18 != -1 || sub_226865630((uint64_t)&dword_268147B18, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147B18, (uint64_t)"-[TableViewManager tableView:shouldShowMenuForRowAtIndexPath:]", 800, (uint64_t)"\n", v4, v5, v6, v7, v21);
  }
  uint64_t CellDictForCellAtIndexPath = objc_msgSend_getCellDictForCellAtIndexPath_(self, a2, (uint64_t)a4);
  if (CellDictForCellAtIndexPath)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v12 = objc_msgSend_objectForKey_(CellDictForCellAtIndexPath, v11, @"items", 0);
    uint64_t CellDictForCellAtIndexPath = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v21, v25, 16);
    if (CellDictForCellAtIndexPath)
    {
      uint64_t v15 = (uint64_t)CellDictForCellAtIndexPath;
      uint64_t v16 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v22 != v16) {
            objc_enumerationMutation(v12);
          }
          double v18 = objc_msgSend_objectForKey_(*(void **)(*((void *)&v21 + 1) + 8 * i), v14, @"canCopy");
          if (v18 && (objc_msgSend_BOOLValue(v18, v14, v19) & 1) != 0)
          {
            LOBYTE(CellDictForCellAtIndexPath) = 1;
            return (char)CellDictForCellAtIndexPath;
          }
        }
        uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v14, (uint64_t)&v21, v25, 16);
        LOBYTE(CellDictForCellAtIndexPath) = 0;
        if (v15) {
          continue;
        }
        break;
      }
    }
  }
  return (char)CellDictForCellAtIndexPath;
}

- (BOOL)tableView:(id)a3 canPerformAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (dword_268147B18 <= 800 && (dword_268147B18 != -1 || sub_226865630((uint64_t)&dword_268147B18, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147B18, (uint64_t)"-[TableViewManager tableView:canPerformAction:forRowAtIndexPath:withSender:]", 800, (uint64_t)"\n", (uint64_t)a5, (uint64_t)a6, v6, v7, v22);
  }
  if (sel_copy_ == a4)
  {
    uint64_t CellDictForCellAtIndexPath = objc_msgSend_getCellDictForCellAtIndexPath_(self, a2, (uint64_t)a5);
    if (CellDictForCellAtIndexPath)
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      uint64_t v13 = objc_msgSend_objectForKey_(CellDictForCellAtIndexPath, v12, @"items", 0);
      uint64_t CellDictForCellAtIndexPath = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v22, v26, 16);
      if (CellDictForCellAtIndexPath)
      {
        uint64_t v16 = (uint64_t)CellDictForCellAtIndexPath;
        uint64_t v17 = *(void *)v23;
        while (2)
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v23 != v17) {
              objc_enumerationMutation(v13);
            }
            uint64_t v19 = objc_msgSend_objectForKey_(*(void **)(*((void *)&v22 + 1) + 8 * i), v15, @"canCopy");
            if (v19 && (objc_msgSend_BOOLValue(v19, v15, v20) & 1) != 0)
            {
              LOBYTE(CellDictForCellAtIndexPath) = 1;
              return (char)CellDictForCellAtIndexPath;
            }
          }
          uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v15, (uint64_t)&v22, v26, 16);
          LOBYTE(CellDictForCellAtIndexPath) = 0;
          if (v16) {
            continue;
          }
          break;
        }
      }
    }
  }
  else
  {
    LOBYTE(CellDictForCellAtIndexPath) = 0;
  }
  return (char)CellDictForCellAtIndexPath;
}

- (void)tableView:(id)a3 performAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  if (dword_268147B18 <= 800 && (dword_268147B18 != -1 || sub_226865630((uint64_t)&dword_268147B18, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147B18, (uint64_t)"-[TableViewManager tableView:performAction:forRowAtIndexPath:withSender:]", 800, (uint64_t)"\n", (uint64_t)a5, (uint64_t)a6, v6, v7, v30);
  }
  if (sel_copy_ == a4)
  {
    if (dword_268147B18 <= 800 && (dword_268147B18 != -1 || sub_226865630((uint64_t)&dword_268147B18, 0x320u))) {
      sub_226865EB4((uint64_t)&dword_268147B18, (uint64_t)"-[TableViewManager tableView:performAction:forRowAtIndexPath:withSender:]", 800, (uint64_t)"copy:\n", (uint64_t)a5, (uint64_t)a6, v6, v7, v30);
    }
    uint64_t CellDictForCellAtIndexPath = objc_msgSend_getCellDictForCellAtIndexPath_(self, a2, (uint64_t)a5);
    if (CellDictForCellAtIndexPath)
    {
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      uint64_t v13 = objc_msgSend_objectForKey_(CellDictForCellAtIndexPath, v12, @"items");
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v31, v35, 16);
      if (v15)
      {
        uint64_t v18 = v15;
        uint64_t v19 = 0;
        uint64_t v20 = *(void *)v32;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v32 != v20) {
              objc_enumerationMutation(v13);
            }
            long long v22 = *(void **)(*((void *)&v31 + 1) + 8 * i);
            long long v23 = objc_msgSend_objectForKey_(v22, v16, @"canCopy");
            if (v23)
            {
              if (objc_msgSend_BOOLValue(v23, v16, v24))
              {
                uint64_t v25 = objc_msgSend_objectForKey_(v22, v16, @"currentValue");
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  if (v19) {
                    objc_msgSend_appendFormat_(v19, v16, @" %@", v25);
                  }
                  else {
                    uint64_t v19 = objc_msgSend_stringWithString_(MEMORY[0x263F089D8], v16, v25);
                  }
                }
              }
            }
          }
          uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v31, v35, 16);
        }
        while (v18);
      }
      else
      {
        uint64_t v19 = 0;
      }
      if (objc_msgSend_length(v19, v16, v17))
      {
        uint64_t v28 = objc_msgSend_generalPasteboard(MEMORY[0x263F1C840], v26, v27);
        objc_msgSend_setString_(v28, v29, (uint64_t)v19);
      }
    }
  }
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if (dword_268147B18 <= 800 && (dword_268147B18 != -1 || sub_226865630((uint64_t)&dword_268147B18, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147B18, (uint64_t)"-[TableViewManager textField:shouldChangeCharactersInRange:replacementString:]", 800, (uint64_t)"textField %@\n", a4.length, (uint64_t)a5, v5, v6, (uint64_t)a3);
  }
  if (location == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  uint64_t v13 = (void *)MEMORY[0x263F088C8];
  uint64_t v14 = objc_msgSend_tag(a3, a2, (uint64_t)a3) >> 16;
  unsigned __int16 v17 = objc_msgSend_tag(a3, v15, v16);
  uint64_t v68 = objc_msgSend_indexPathForRow_inSection_(v13, v18, v14, v17);
  uint64_t v21 = objc_msgSend_text(a3, v19, v20);
  int IsSecureAndUnchanged = objc_msgSend_textFieldIsSecureAndUnchanged_(self, v22, (uint64_t)a3);
  if (IsSecureAndUnchanged)
  {
    uint64_t v21 = objc_msgSend_string(NSString, v23, v24);
    long long v31 = objc_msgSend_stringWithString_(MEMORY[0x263F089D8], v25, (uint64_t)a5);
    if (dword_268147B18 > 800) {
      goto LABEL_21;
    }
    if (dword_268147B18 != -1 || sub_226865630((uint64_t)&dword_268147B18, 0x320u)) {
      sub_226865EB4((uint64_t)&dword_268147B18, (uint64_t)"-[TableViewManager textField:shouldChangeCharactersInRange:replacementString:]", 800, (uint64_t)"starting secure text field edit (erasing old value)\n", v27, v28, v29, v30, v66);
    }
  }
  else
  {
    long long v31 = objc_msgSend_stringWithString_(MEMORY[0x263F089D8], v23, v21);
    if (dword_268147B18 <= 800 && (dword_268147B18 != -1 || sub_226865630((uint64_t)&dword_268147B18, 0x320u))) {
      sub_226865EB4((uint64_t)&dword_268147B18, (uint64_t)"-[TableViewManager textField:shouldChangeCharactersInRange:replacementString:]", 800, (uint64_t)"current text %@\n", v33, v34, v35, v36, (uint64_t)v31);
    }
    objc_msgSend_replaceCharactersInRange_withString_(v31, v32, location, length, a5);
  }
  if (dword_268147B18 <= 800 && (dword_268147B18 != -1 || sub_226865630((uint64_t)&dword_268147B18, 0x320u)))
  {
    id v37 = a5;
    sub_226865EB4((uint64_t)&dword_268147B18, (uint64_t)"-[TableViewManager textField:shouldChangeCharactersInRange:replacementString:]", 800, (uint64_t)"text as it will be %@\n", v27, v28, v29, v30, (uint64_t)v31);
    goto LABEL_22;
  }
LABEL_21:
  id v37 = a5;
LABEL_22:
  uint64_t CellDictForCellAtIndexPath = objc_msgSend_getCellDictForCellAtIndexPath_(self, v26, v68);
  uint64_t v40 = objc_msgSend_objectForKey_(CellDictForCellAtIndexPath, v39, @"nsFormatter");
  if (v40)
  {
    long long v43 = (void *)v40;
    v69[0] = location;
    v69[1] = length;
    uint64_t v70 = 0;
    v71 = objc_msgSend_stringWithString_(MEMORY[0x263F089D8], v41, (uint64_t)v31);
    int isPartialStringValid_proposedSelectedRange_originalString_originalSelectedRange_errorDescription = objc_msgSend_isPartialStringValid_proposedSelectedRange_originalString_originalSelectedRange_errorDescription_(v43, v44, (uint64_t)&v71, v69, v21, location, length, &v70);
    if (isPartialStringValid_proposedSelectedRange_originalString_originalSelectedRange_errorDescription
      && (objc_msgSend_isEqualToString_(v71, v41, (uint64_t)v31) & 1) == 0)
    {
      long long v31 = objc_msgSend_stringWithString_(MEMORY[0x263F089D8], v41, (uint64_t)v71);
      objc_msgSend_setText_(a3, v51, (uint64_t)v31);
      char v50 = 1;
    }
    else
    {
      char v50 = 0;
    }
    if (dword_268147B18 <= 800 && (dword_268147B18 != -1 || sub_226865630((uint64_t)&dword_268147B18, 0x320u))) {
      sub_226865EB4((uint64_t)&dword_268147B18, (uint64_t)"-[TableViewManager textField:shouldChangeCharactersInRange:replacementString:]", 800, (uint64_t)"formatter error: %@ outStr: %@\n", v45, v46, v47, v48, v70);
    }
    if (!isPartialStringValid_proposedSelectedRange_originalString_originalSelectedRange_errorDescription) {
      goto LABEL_40;
    }
  }
  else
  {
    char v50 = 0;
  }
  if (!objc_msgSend_delegate(self, v41, v42)
    || (objc_msgSend_delegate(self, v52, v53), (objc_opt_respondsToSelector() & 1) == 0)
    || (double v54 = objc_msgSend_delegate(self, v52, v53),
        objc_msgSend_shouldChangeTextField_atIndexPath_forTextIndex_toString_(v54, v55, (uint64_t)a3, v68, 0, v31)))
  {
    uint64_t v56 = objc_msgSend_tag(a3, v52, v53);
    objc_msgSend_findAndSetItemObject_toValue_inCellWithInternalRowSectionTagValue_(self, v57, (uint64_t)a3, v31, v56);
    if (IsSecureAndUnchanged)
    {
      uint64_t v60 = objc_msgSend_string(NSString, v58, v59);
      if (objc_msgSend_isEqualToString_(v37, v61, v60))
      {
        uint64_t v63 = objc_msgSend_notificationWithName_object_(MEMORY[0x263F089F8], v62, @"TVM::Internal", a3);
        objc_msgSend_uiTextFieldDidChange_(self, v64, v63);
      }
    }
    char v65 = 1;
    return v65 & (v50 ^ 1);
  }
LABEL_40:
  char v65 = 0;
  return v65 & (v50 ^ 1);
}

- (void)uiTextFieldDidChange:(id)a3
{
  uint64_t v4 = objc_msgSend_object(a3, a2, (uint64_t)a3);
  if (objc_msgSend_isDescendantOfView_(v4, v5, (uint64_t)self->_managedTableView))
  {
    uint64_t v8 = objc_msgSend_tag(v4, v6, v7);
    uint64_t v10 = objc_msgSend_indexPathForRow_inSection_(MEMORY[0x263F088C8], v9, v8 >> 16, (unsigned __int16)v8);
    objc_msgSend_delegate(self, v11, v12);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v15 = objc_msgSend_delegate(self, v13, v14);
      MEMORY[0x270F9A6D0](v15, sel_textFieldDidChangeAtIndexPath_, v10);
    }
  }
}

- (BOOL)textFieldShouldClear:(id)a3
{
  uint64_t v5 = objc_msgSend_string(MEMORY[0x263F089D8], a2, (uint64_t)a3);
  if (objc_msgSend_isEditing(a3, v6, v7))
  {
    uint64_t v10 = (void *)MEMORY[0x263F088C8];
    uint64_t v11 = objc_msgSend_tag(a3, v8, v9) >> 16;
    unsigned __int16 v14 = objc_msgSend_tag(a3, v12, v13);
    uint64_t v16 = objc_msgSend_indexPathForRow_inSection_(v10, v15, v11, v14);
    uint64_t CellDictForCellAtIndexPath = objc_msgSend_getCellDictForCellAtIndexPath_(self, v17, v16);
    if (objc_msgSend_objectForKey_(CellDictForCellAtIndexPath, v19, @"nsFormatter")
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      long long v22 = (void *)MEMORY[0x263F089D8];
      uint64_t v23 = objc_msgSend_text(a3, v20, v21);
      uint64_t v5 = objc_msgSend_stringWithString_(v22, v24, v23);
      uint64_t v27 = objc_msgSend_length(v5, v25, v26);
      if (v27)
      {
        unint64_t v29 = v27;
        uint64_t v30 = v27 - 1;
        for (unint64_t i = 1; i <= v29; ++i)
        {
          if (!objc_msgSend_textField_shouldChangeCharactersInRange_replacementString_(self, v28, (uint64_t)a3, v30, i, &stru_26DA6BE88))break; {
          --v30;
          }
        }
        if (i != 1)
        {
          objc_msgSend_replaceCharactersInRange_withString_(v5, v28, v29 - (i - 1), i - 1, &stru_26DA6BE88);
          if (!objc_msgSend_delegate(self, v32, v33)
            || (objc_msgSend_delegate(self, v34, v35), (objc_opt_respondsToSelector() & 1) == 0)
            || (id v37 = objc_msgSend_delegate(self, v34, v36),
                objc_msgSend_shouldChangeTextField_atIndexPath_forTextIndex_toString_(v37, v38, (uint64_t)a3, v16, 0, v5)))
          {
            objc_msgSend_setText_(a3, v34, (uint64_t)v5);
            BOOL v41 = 0;
LABEL_18:
            uint64_t v44 = objc_msgSend_tag(a3, v39, v40);
            objc_msgSend_findAndSetItemObject_toValue_inCellWithInternalRowSectionTagValue_(self, v45, (uint64_t)a3, v5, v44);
            return v41;
          }
        }
      }
    }
    else if (!objc_msgSend_delegate(self, v20, v21) {
           || (objc_msgSend_delegate(self, v39, v40), (objc_opt_respondsToSelector() & 1) == 0)
    }
           || (uint64_t v42 = objc_msgSend_delegate(self, v39, v40),
               objc_msgSend_shouldChangeTextField_atIndexPath_forTextIndex_toString_(v42, v43, (uint64_t)a3, v16, 0, v5)))
    {
      BOOL v41 = 1;
      goto LABEL_18;
    }
    return 0;
  }
  return 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  if (dword_268147B18 <= 800 && (dword_268147B18 != -1 || sub_226865630((uint64_t)&dword_268147B18, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147B18, (uint64_t)"-[TableViewManager textFieldShouldReturn:]", 800, (uint64_t)"textField %@\n", v3, v4, v5, v6, (uint64_t)a3);
  }
  objc_msgSend_delegate(self, a2, (uint64_t)a3);
  if (objc_opt_respondsToSelector())
  {
    uint64_t v11 = objc_msgSend_tag(a3, v9, v10) >> 16;
    uint64_t v14 = (unsigned __int16)objc_msgSend_tag(a3, v12, v13);
    unsigned __int16 v17 = objc_msgSend_delegate(self, v15, v16);
    uint64_t v19 = objc_msgSend_indexPathForRow_inSection_(MEMORY[0x263F088C8], v18, v11, v14);
    if (!objc_msgSend_shouldHandleReturnForTextField_atIndexPath_forTextIndex_(v17, v20, (uint64_t)a3, v19, 0))return 0; {
  }
    }
  uint64_t v35 = 0;
  uint64_t NextResponderInTableView_foundParentCell = objc_msgSend_findNextResponderInTableView_foundParentCell_(self, v9, (uint64_t)self->_managedTableView, &v35);
  if (NextResponderInTableView_foundParentCell)
  {
    uint64_t v28 = (UIView *)NextResponderInTableView_foundParentCell;
    if (dword_268147B18 <= 800 && (dword_268147B18 != -1 || sub_226865630((uint64_t)&dword_268147B18, 0x320u))) {
      sub_226865EB4((uint64_t)&dword_268147B18, (uint64_t)"-[TableViewManager textFieldShouldReturn:]", 800, (uint64_t)"got a nextResponder %@\n", v24, v25, v26, v27, (uint64_t)v28);
    }
    objc_msgSend_becomeFirstResponder(v28, v22, v23);
    self->_currentFirstResponder = v28;

    uint64_t v30 = (NSIndexPath *)(id)objc_msgSend_indexPathForCell_(self->_managedTableView, v29, v35);
    self->_currentFirstResponderCellPath = v30;
    managedTableView = self->_managedTableView;
    BOOL v32 = 1;
    objc_msgSend_scrollToRowAtIndexPath_atScrollPosition_animated_(managedTableView, v33, (uint64_t)v30, 0, 1);
  }
  else
  {
    objc_msgSend_resignFirstResponder(self->_currentFirstResponder, v22, v23);
    self->_currentFirstResponder = 0;

    self->_currentFirstResponderCellPath = 0;
    return 1;
  }
  return v32;
}

- (void)textFieldDidEndEditing:(id)a3
{
  if (dword_268147B18 <= 800 && (dword_268147B18 != -1 || sub_226865630((uint64_t)&dword_268147B18, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147B18, (uint64_t)"-[TableViewManager textFieldDidEndEditing:]", 800, (uint64_t)"textField %@\n", v3, v4, v5, v6, (uint64_t)a3);
  }
  if ((objc_msgSend_textFieldIsSecureAndUnchanged_(self, a2, (uint64_t)a3) & 1) == 0)
  {
    if (objc_msgSend_text(a3, v9, v10))
    {
      uint64_t v13 = objc_msgSend_text(a3, v11, v12);
      uint64_t v16 = objc_msgSend_tag(a3, v14, v15);
      objc_msgSend_findAndSetItemObject_toValue_inCellWithInternalRowSectionTagValue_(self, v17, (uint64_t)a3, v13, v16);
    }
    if (objc_msgSend_delegate(self, v11, v12))
    {
      objc_msgSend_delegate(self, v18, v19);
      if (objc_opt_respondsToSelector())
      {
        long long v22 = (void *)MEMORY[0x263F088C8];
        uint64_t v23 = objc_msgSend_tag(a3, v20, v21) >> 16;
        unsigned __int16 v26 = objc_msgSend_tag(a3, v24, v25);
        uint64_t v28 = objc_msgSend_indexPathForRow_inSection_(v22, v27, v23, v26);
        uint64_t v31 = objc_msgSend_delegate(self, v29, v30);
        MEMORY[0x270F9A6D0](v31, sel_textFieldDidEndEditingAtIndexPath_, v28);
      }
    }
  }
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  if (dword_268147B18 <= 800 && (dword_268147B18 != -1 || sub_226865630((uint64_t)&dword_268147B18, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147B18, (uint64_t)"-[TableViewManager textFieldShouldBeginEditing:]", 800, (uint64_t)"textField %@\n", v3, v4, v5, v6, (uint64_t)a3);
  }
  if (objc_msgSend_isSecureTextEntry(a3, a2, (uint64_t)a3))
  {
    uint64_t v11 = (void *)MEMORY[0x263F088C8];
    uint64_t v12 = objc_msgSend_tag(a3, v9, v10) >> 16;
    unsigned __int16 v15 = objc_msgSend_tag(a3, v13, v14);
    uint64_t v17 = objc_msgSend_indexPathForRow_inSection_(v11, v16, v12, v15);
    uint64_t v20 = objc_msgSend_text(a3, v18, v19);
    objc_msgSend_setValue_forItemOfType_atItemTypeIndex_inCellAtIndexPath_(self, v21, v20, @"editTextView", 0, v17);
  }
  return 1;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  uint64_t v5 = objc_msgSend_tag(a3, a2, (uint64_t)a3);
  unsigned __int16 v12 = objc_msgSend_tag(a3, v6, v7);
  if (dword_268147B18 <= 800 && (dword_268147B18 != -1 || sub_226865630((uint64_t)&dword_268147B18, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147B18, (uint64_t)"-[TableViewManager textFieldDidBeginEditing:]", 800, (uint64_t)"textField %@\n", v8, v9, v10, v11, (uint64_t)a3);
  }
  self->_currentFirstResponder = (UIView *)a3;

  self->_currentFirstResponderCellPath = (NSIndexPath *)(id)objc_msgSend_indexPathForRow_inSection_(MEMORY[0x263F088C8], v13, v5 >> 16, v12);
}

- (void)switchAction:(id)a3
{
  uint64_t v5 = objc_msgSend_tag(a3, a2, (uint64_t)a3);
  unsigned __int16 v8 = objc_msgSend_tag(a3, v6, v7);
  uint64_t v11 = objc_msgSend_isOn(a3, v9, v10);
  uint64_t v13 = objc_msgSend_numberWithBool_(NSNumber, v12, v11);
  uint64_t v16 = objc_msgSend_tag(a3, v14, v15);
  if (objc_msgSend_findAndSetItemObject_toValue_inCellWithInternalRowSectionTagValue_(self, v17, (uint64_t)a3, v13, v16) != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (objc_msgSend_delegate(self, v18, v19))
    {
      objc_msgSend_delegate(self, v20, v21);
      if (objc_opt_respondsToSelector())
      {
        uint64_t v24 = objc_msgSend_delegate(self, v22, v23);
        uint64_t v26 = objc_msgSend_indexPathForRow_inSection_(MEMORY[0x263F088C8], v25, v5 >> 16, v8);
        MEMORY[0x270F9A6D0](v24, sel_switchTouchedInCellAtIndexPath_forSwitchIndex_isOn_, v26);
      }
    }
  }
}

- (void)buttonAction:(id)a3
{
  uint64_t v5 = objc_msgSend_tag(a3, a2, (uint64_t)a3);
  unsigned __int16 v8 = objc_msgSend_tag(a3, v6, v7);
  uint64_t v11 = objc_msgSend_tag(a3, v9, v10);
  if (objc_msgSend_findAndSetItemObject_toValue_inCellWithInternalRowSectionTagValue_(self, v12, (uint64_t)a3, 0, v11) != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (objc_msgSend_delegate(self, v13, v14))
    {
      objc_msgSend_delegate(self, v15, v16);
      if (objc_opt_respondsToSelector())
      {
        uint64_t v19 = objc_msgSend_delegate(self, v17, v18);
        uint64_t v21 = objc_msgSend_indexPathForRow_inSection_(MEMORY[0x263F088C8], v20, v5 >> 16, v8);
        MEMORY[0x270F9A6D0](v19, sel_buttonTouchedInCellAtIndexPath_forButtonIndex_, v21);
      }
    }
  }
}

- (void)segmentedControlValueChanged:(id)a3
{
  uint64_t v5 = objc_msgSend_tag(a3, a2, (uint64_t)a3);
  unsigned __int16 v8 = objc_msgSend_tag(a3, v6, v7);
  uint64_t v11 = objc_msgSend_selectedSegmentIndex(a3, v9, v10);
  uint64_t v13 = objc_msgSend_numberWithInteger_(NSNumber, v12, v11);
  uint64_t v16 = objc_msgSend_tag(a3, v14, v15);
  if (objc_msgSend_findAndSetItemObject_toValue_inCellWithInternalRowSectionTagValue_(self, v17, (uint64_t)a3, v13, v16) != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (objc_msgSend_delegate(self, v18, v19))
    {
      objc_msgSend_delegate(self, v20, v21);
      if (objc_opt_respondsToSelector())
      {
        uint64_t v24 = objc_msgSend_delegate(self, v22, v23);
        uint64_t v26 = objc_msgSend_indexPathForRow_inSection_(MEMORY[0x263F088C8], v25, v5 >> 16, v8);
        MEMORY[0x270F9A6D0](v24, sel_segmentedControlTouchedInCellAtIndexPath_forSegmentedControlIndex_selectedSegment_, v26);
      }
    }
  }
}

- (void)selectedDateChanged:(id)a3
{
  uint64_t v5 = objc_msgSend_tag(a3, a2, (uint64_t)a3);
  unsigned __int16 v8 = objc_msgSend_tag(a3, v6, v7);
  uint64_t v11 = objc_msgSend_tag(a3, v9, v10);
  if (objc_msgSend_findAndSetItemObject_toValue_inCellWithInternalRowSectionTagValue_(self, v12, (uint64_t)a3, 0, v11) != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (objc_msgSend_delegate(self, v13, v14))
    {
      objc_msgSend_delegate(self, v15, v16);
      if (objc_opt_respondsToSelector())
      {
        uint64_t v19 = objc_msgSend_delegate(self, v17, v18);
        uint64_t v21 = objc_msgSend_indexPathForRow_inSection_(MEMORY[0x263F088C8], v20, v5 >> 16, v8);
        objc_msgSend_date(a3, v22, v23);
        MEMORY[0x270F9A6D0](v19, sel_selectedDateChangedInCellAtIndexPath_forDatePickerIndex_withDate_, v21);
      }
    }
  }
}

- (void)bulkUpdateBegin
{
  if (!self->_handlingBulkUpdate)
  {
    objc_msgSend_beginUpdates(self->_managedTableView, a2, v2);
    self->_handlingBulkUpdate = 1;
  }
}

- (void)bulkUpdateEnd
{
  if (self->_handlingBulkUpdate)
  {
    objc_msgSend_endUpdates(self->_managedTableView, a2, v2);
    self->_handlingBulkUpdate = 0;
  }
}

- (void)selectMenuCellAtIndexPath:(id)a3
{
  uint64_t v5 = objc_msgSend_section(a3, a2, (uint64_t)a3);
  uint64_t SectionDictForSection = objc_msgSend_getSectionDictForSection_(self, v6, v5);
  if (SectionDictForSection)
  {
    uint64_t v9 = SectionDictForSection;
    uint64_t v10 = objc_msgSend_objectForKey_(SectionDictForSection, v8, @"sectionIsMenu");
    if (objc_msgSend_BOOLValue(v10, v11, v12))
    {
      uint64_t v14 = objc_msgSend_indexOfSelectedRowInMenuSection_(self, v13, v5);
      uint64_t v16 = objc_msgSend_objectForKey_(v9, v15, @"sectionMenuOptions");
      char v19 = objc_msgSend_integerValue(v16, v17, v18);
      if (v14 != objc_msgSend_row(a3, v20, v21) || v5 != objc_msgSend_section(a3, v22, v23))
      {
        if (v14 != 0x7FFFFFFFFFFFFFFFLL && (v19 & 1) == 0)
        {
          uint64_t v24 = objc_msgSend_indexPathForRow_inSection_(MEMORY[0x263F088C8], v22, v14, v5);
          uint64_t v26 = objc_msgSend_cellForRowAtIndexPath_(self->_managedTableView, v25, v24);
          objc_msgSend_setMenuCell_visualStateToSelected_atIndexPath_(self, v27, v26, 0, v24);
        }
        uint64_t v29 = objc_msgSend_cellForRowAtIndexPath_(self->_managedTableView, v22, (uint64_t)a3);
        objc_msgSend_setMenuCell_visualStateToSelected_atIndexPath_(self, v28, v29, 1, a3);
      }
    }
  }
}

- (id)cellInfoOfSelectedRowInMenuSection:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  RowArrayForSection = objc_msgSend_getRowArrayForSection_(self, a2, a3);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(RowArrayForSection, v4, (uint64_t)&v14, v18, 16);
  if (!v5) {
    return 0;
  }
  uint64_t v7 = v5;
  uint64_t v8 = *(void *)v15;
LABEL_3:
  uint64_t v9 = 0;
  while (1)
  {
    if (*(void *)v15 != v8) {
      objc_enumerationMutation(RowArrayForSection);
    }
    uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * v9);
    uint64_t v11 = objc_msgSend_objectForKey_(v10, v6, @"menuSelected");
    if (v11)
    {
      if (objc_msgSend_BOOLValue(v11, v6, v12)) {
        return v10;
      }
    }
    if (v7 == ++v9)
    {
      uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(RowArrayForSection, v6, (uint64_t)&v14, v18, 16);
      if (v7) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (unint64_t)indexOfSelectedRowInMenuSection:(unint64_t)a3
{
  RowArrayForSection = objc_msgSend_getRowArrayForSection_(self, a2, a3);
  uint64_t v7 = objc_msgSend_cellInfoOfSelectedRowInMenuSection_(self, v6, a3);
  if (!v7 || !RowArrayForSection) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }

  return objc_msgSend_indexOfObject_(RowArrayForSection, v8, v7);
}

- (unint64_t)tagOfSelectedRowInMenuSection:(unint64_t)a3
{
  unint64_t result = objc_msgSend_cellInfoOfSelectedRowInMenuSection_(self, a2, a3);
  if (result)
  {
    uint64_t v5 = objc_msgSend_objectForKey_((void *)result, v4, @"tag");
    return objc_msgSend_integerValue(v5, v6, v7);
  }
  return result;
}

- (void)setMenuCell:(id)a3 visualStateToSelected:(BOOL)a4 atIndexPath:(id)a5
{
  BOOL v6 = a4;
  unint64_t v9 = objc_msgSend_row(a5, a2, (uint64_t)a3);
  uint64_t v12 = objc_msgSend_section(a5, v10, v11);
  uint64_t SectionDictForSection = objc_msgSend_getSectionDictForSection_(self, v13, v12);
  if (SectionDictForSection)
  {
    long long v16 = SectionDictForSection;
    uint64_t v19 = objc_msgSend_objectForKey_(SectionDictForSection, v15, @"sectionRows");
    if (dword_268147B18 <= 800 && (dword_268147B18 != -1 || sub_226865630((uint64_t)&dword_268147B18, 0x320u)))
    {
      uint64_t v20 = objc_msgSend_section(a5, v17, v18);
      sub_226865EB4((uint64_t)&dword_268147B18, (uint64_t)"-[TableViewManager setMenuCell:visualStateToSelected:atIndexPath:]", 800, (uint64_t)"section %d, row %d, selected = %s\n", v21, v22, v23, v24, v20);
    }
    if (v9 < objc_msgSend_count(v19, v17, v18))
    {
      uint64_t v26 = objc_msgSend_objectForKey_(v16, v25, @"sectionMenuOptions");
      char v29 = objc_msgSend_integerValue(v26, v27, v28);
      uint64_t v31 = objc_msgSend_objectAtIndex_(v19, v30, v9);
      uint64_t v33 = objc_msgSend_numberWithBool_(NSNumber, v32, v6);
      objc_msgSend_setObject_forKey_(v31, v34, v33, @"menuSelected");
      uint64_t InfoForItemOfType_atItemTypeIndex_inCell = objc_msgSend_getInfoForItemOfType_atItemTypeIndex_inCell_(self, v35, @"labelView", 0, v31);
      uint64_t v38 = objc_msgSend_getInfoForItemOfType_atItemTypeIndex_inCell_(self, v37, @"imageView", 0, v31);
      uint64_t v40 = objc_msgSend_objectForKey_(InfoForItemOfType_atItemTypeIndex_inCell, v39, @"cachedView");
      long long v43 = objc_msgSend_objectForKey_(v38, v41, @"cachedView");
      if (a3)
      {
        if (v6)
        {
          objc_msgSend_setObject_forKey_(InfoForItemOfType_atItemTypeIndex_inCell, v42, (uint64_t)self->_selectedTextColor, @"color");
          objc_msgSend_setTextColor_(v40, v44, (uint64_t)self->_selectedTextColor);
          if ((v29 & 4) == 0)
          {
            id v45 = a3;
            uint64_t v46 = 3;
LABEL_16:
            objc_msgSend_setAccessoryType_(v45, v42, v46);
            return;
          }
          goto LABEL_13;
        }
        objc_msgSend_setObject_forKey_(InfoForItemOfType_atItemTypeIndex_inCell, v42, (uint64_t)self->_detailTextColor, @"color");
        objc_msgSend_setTextColor_(v40, v52, (uint64_t)self->_detailTextColor);
        if ((v29 & 4) == 0)
        {
          id v45 = a3;
          uint64_t v46 = 0;
          goto LABEL_16;
        }
      }
      else
      {
        if (v6)
        {
          if ((v29 & 4) == 0) {
            return;
          }
LABEL_13:
          uint64_t v47 = objc_msgSend_kitImageOfType_(ImageStore, v42, 1);
          objc_msgSend_setImage_(v43, v48, v47);
          uint64_t v50 = objc_msgSend_kitImageOfType_(ImageStore, v49, 2);
          uint64_t v51 = v43;
LABEL_22:
          MEMORY[0x270F9A6D0](v51, sel_setHighlightedImage_, v50);
          return;
        }
        if ((v29 & 4) == 0) {
          return;
        }
      }
      objc_msgSend_setImage_(v43, v42, 0);
      uint64_t v51 = v43;
      uint64_t v50 = 0;
      goto LABEL_22;
    }
  }
}

- (unint64_t)indexOfSectionWithIdentifier:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v4 = objc_msgSend_objectForKey_(self->_tableDescriptorDict, a2, @"tableSectionArray");
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v15, v19, 16);
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v4);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend_objectForKey_(v11, v7, @"identifier");
        if (objc_msgSend_isEqualToString_(v12, v13, (uint64_t)a3)) {
          return objc_msgSend_indexOfObject_(v4, v7, (uint64_t)v11);
        }
      }
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v15, v19, 16);
      if (v8) {
        continue;
      }
      break;
    }
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)indexPathOfCellWithTag:(int64_t)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  uint64_t v4 = objc_msgSend_objectForKey_(self->_tableDescriptorDict, a2, @"tableSectionArray");
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id result = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v33, v38, 16);
  if (result)
  {
    uint64_t v8 = (uint64_t)result;
    uint64_t v9 = *(void *)v34;
    uint64_t v27 = *(void *)v34;
LABEL_3:
    uint64_t v10 = 0;
    uint64_t v28 = v8;
    while (1)
    {
      if (*(void *)v34 != v9) {
        objc_enumerationMutation(v4);
      }
      uint64_t v11 = *(void **)(*((void *)&v33 + 1) + 8 * v10);
      id result = (id)objc_msgSend_objectForKey_(v11, v7, @"sectionRows", v27);
      if (!result) {
        break;
      }
      id v13 = result;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(result, v12, (uint64_t)&v29, v37, 16);
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v30;
        while (2)
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v30 != v16) {
              objc_enumerationMutation(v13);
            }
            long long v18 = *(void **)(*((void *)&v29 + 1) + 8 * i);
            uint64_t v19 = objc_msgSend_objectForKey_(v18, v7, @"tag");
            if (objc_msgSend_integerValue(v19, v20, v21) == a3)
            {
              uint64_t v22 = (void *)MEMORY[0x263F088C8];
              uint64_t v23 = objc_msgSend_indexOfObject_(v13, v7, (uint64_t)v18);
              uint64_t v25 = objc_msgSend_indexOfObject_(v4, v24, (uint64_t)v11);
              return (id)objc_msgSend_indexPathForRow_inSection_(v22, v26, v23, v25);
            }
          }
          uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v7, (uint64_t)&v29, v37, 16);
          if (v15) {
            continue;
          }
          break;
        }
      }
      ++v10;
      uint64_t v9 = v27;
      if (v10 == v28)
      {
        uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v33, v38, 16);
        id result = 0;
        if (v8) {
          goto LABEL_3;
        }
        return result;
      }
    }
  }
  return result;
}

- (id)indexPathOfFirstCellWithUnverifiedVerifier
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_msgSend_objectForKey_(self->_tableDescriptorDict, a2, @"tableSectionArray");
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v30, v35, 16);
  if (v24)
  {
    uint64_t v25 = *(void *)v31;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v31 != v25) {
        objc_enumerationMutation(v3);
      }
      uint64_t v7 = *(void **)(*((void *)&v30 + 1) + 8 * v6);
      uint64_t v8 = objc_msgSend_objectForKey_(v7, v5, @"sectionRows");
      if (!v8) {
        break;
      }
      uint64_t v10 = v8;
      uint64_t v23 = v6;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v26, v34, 16);
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v27;
LABEL_9:
        uint64_t v14 = 0;
        while (1)
        {
          if (*(void *)v27 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = (void *)MEMORY[0x263F088C8];
          uint64_t v16 = objc_msgSend_indexOfObject_(v10, v5, *(void *)(*((void *)&v26 + 1) + 8 * v14));
          uint64_t v18 = objc_msgSend_indexOfObject_(v3, v17, (uint64_t)v7);
          uint64_t v20 = objc_msgSend_indexPathForRow_inSection_(v15, v19, v16, v18);
          if (objc_msgSend_textFieldHasVerifierAtIndexPath_(self, v21, (uint64_t)v20))
          {
            if (!objc_msgSend_textFieldVerifiedAtIndexPath_(self, v5, (uint64_t)v20)) {
              return v20;
            }
          }
          if (v12 == ++v14)
          {
            uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v5, (uint64_t)&v26, v34, 16);
            if (v12) {
              goto LABEL_9;
            }
            break;
          }
        }
      }
      uint64_t v6 = v23 + 1;
      if (v23 + 1 == v24)
      {
        uint64_t v20 = 0;
        uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v5, (uint64_t)&v30, v35, 16);
        if (v24) {
          goto LABEL_3;
        }
        return v20;
      }
    }
  }
  return 0;
}

- (BOOL)tagOfCellAtIndexPath:(id)a3 tag:(int64_t *)a4
{
  unint64_t v7 = objc_msgSend_row(a3, a2, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_section(a3, v8, v9);
  RowArrayForSection = objc_msgSend_getRowArrayForSection_(self, v11, v10);
  if (v7 >= objc_msgSend_count(RowArrayForSection, v13, v14)) {
    return 0;
  }
  uint64_t v16 = objc_msgSend_objectAtIndex_(RowArrayForSection, v15, v7);
  uint64_t v20 = objc_msgSend_objectForKey_(v16, v17, @"tag");
  BOOL result = v20 != 0;
  if (a4)
  {
    if (v20)
    {
      *a4 = objc_msgSend_integerValue(v20, v18, v19);
      return 1;
    }
  }
  return result;
}

- (BOOL)textFieldHasVerifierAtIndexPath:(id)a3
{
  uint64_t v11 = 0;
  int v3 = objc_msgSend_tagOfCellAtIndexPath_tag_(self, a2, (uint64_t)a3, &v11);
  if ((unint64_t)(v11 - 1987203159) < 2) {
    BOOL v8 = v3;
  }
  else {
    BOOL v8 = 0;
  }
  if (dword_268147B98 <= 800 && (dword_268147B98 != -1 || sub_226865630((uint64_t)&dword_268147B98, 0x320u)))
  {
    uint64_t v9 = "NO";
    if (v8) {
      uint64_t v9 = "YES";
    }
    sub_226865EB4((uint64_t)&dword_268147B98, (uint64_t)"-[TableViewManager textFieldHasVerifierAtIndexPath:]", 800, (uint64_t)"returning %s\n", v4, v5, v6, v7, (uint64_t)v9);
  }
  return v8;
}

- (void)setVerifierCellAccessoryType:(int)a3 forCellsAtIndexPaths:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v43 = *MEMORY[0x263EF8340];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(a4, a2, (uint64_t)&v38, v42, 16);
  if (v7)
  {
    uint64_t v10 = v7;
    uint64_t v11 = *(void *)v39;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v39 != v11) {
        objc_enumerationMutation(a4);
      }
      uint64_t v13 = *(void **)(*((void *)&v38 + 1) + 8 * v12);
      unint64_t v14 = objc_msgSend_row(v13, v8, v9);
      uint64_t v17 = objc_msgSend_section(v13, v15, v16);
      uint64_t SectionDictForSection = objc_msgSend_getSectionDictForSection_(self, v18, v17);
      if (!SectionDictForSection) {
        break;
      }
      uint64_t v21 = objc_msgSend_objectForKey_(SectionDictForSection, v20, @"sectionRows");
      if (v14 < objc_msgSend_count(v21, v22, v23))
      {
        uint64_t v24 = objc_msgSend_objectAtIndex_(v21, v8, v14);
        uint64_t v26 = objc_msgSend_numberWithInteger_(NSNumber, v25, v5);
        objc_msgSend_setObject_forKey_(v24, v27, v26, @"verifierAccessory");
        if (dword_268147B98 <= 800 && (dword_268147B98 != -1 || sub_226865630((uint64_t)&dword_268147B98, 0x320u)))
        {
          uint64_t v30 = objc_msgSend_section(v13, v28, v29);
          sub_226865EB4((uint64_t)&dword_268147B98, (uint64_t)"-[TableViewManager setVerifierCellAccessoryType:forCellsAtIndexPaths:]", 800, (uint64_t)"section %d, row %d, type = %d\n", v31, v32, v33, v34, v30);
        }
        long long v35 = objc_msgSend_managedTableView(self, v28, v29);
        uint64_t v37 = objc_msgSend_cellForRowAtIndexPath_(v35, v36, (uint64_t)v13);
        if (v37) {
          objc_msgSend_setVerifierAccessoryView_forCell_(self, v8, v5, v37);
        }
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(a4, v8, (uint64_t)&v38, v42, 16);
        if (v10) {
          goto LABEL_3;
        }
        return;
      }
    }
  }
}

- (BOOL)verifyStr1:(id)a3 forTag1:(unint64_t)a4 matchesStr2:(id)a5 forTag2:(unint64_t)a6
{
  uint64_t v9 = objc_msgSend_indexPathOfCellWithTag_(self, a2, a4);
  uint64_t v11 = objc_msgSend_indexPathOfCellWithTag_(self, v10, a6);
  LOBYTE(a6) = 0;
  if (v9)
  {
    uint64_t v14 = v11;
    if (v11)
    {
      LODWORD(a6) = objc_msgSend_isEqualToString_(a3, v12, (uint64_t)a5);
      if (a6)
      {
        uint64_t v19 = objc_msgSend_length(a3, v15, v16) ? 4 * (objc_msgSend_length(a5, v17, v18) != 0) : 0;
      }
      else
      {
        unint64_t v20 = objc_msgSend_length(a5, v15, v16);
        uint64_t v19 = v20 >= objc_msgSend_length(a3, v21, v22) ? 1 : 2;
      }
      uint64_t v23 = objc_msgSend_arrayWithObjects_(MEMORY[0x263EFF8C0], v17, v9, v14, 0);
      objc_msgSend_setVerifierCellAccessoryType_forCellsAtIndexPaths_(self, v24, v19, v23);
      if (dword_268147B98 <= 800 && (dword_268147B98 != -1 || sub_226865630((uint64_t)&dword_268147B98, 0x320u)))
      {
        uint64_t v29 = "NO";
        if (a6) {
          uint64_t v29 = "YES";
        }
        sub_226865EB4((uint64_t)&dword_268147B98, (uint64_t)"-[TableViewManager verifyStr1:forTag1:matchesStr2:forTag2:]", 800, (uint64_t)"returning match = %s\n", v25, v26, v27, v28, (uint64_t)v29);
      }
    }
  }
  return a6;
}

- (BOOL)textFieldVerifiedAtIndexPath:(id)a3
{
  if (dword_268147B98 <= 800 && (dword_268147B98 != -1 || sub_226865630((uint64_t)&dword_268147B98, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147B98, (uint64_t)"-[TableViewManager textFieldVerifiedAtIndexPath:]", 800, (uint64_t)"\n", v3, v4, v5, v6, v21);
  }
  if (objc_msgSend_textFieldHasVerifierAtIndexPath_(self, a2, (uint64_t)a3))
  {
    uint64_t ValueForFirstItemOfType_inCellWithTag = objc_msgSend_getValueForFirstItemOfType_inCellWithTag_(self, v9, @"editTextView", 1987203159);
    uint64_t v16 = objc_msgSend_getValueForFirstItemOfType_inCellWithTag_(self, v15, @"editTextView", 1987203160);
    int v18 = 1;
    if (ValueForFirstItemOfType_inCellWithTag)
    {
      uint64_t v10 = v16;
      if (v16) {
        int v18 = objc_msgSend_verifyStr1_forTag1_matchesStr2_forTag2_(self, v17, ValueForFirstItemOfType_inCellWithTag, 1987203159, v16, 1987203160);
      }
    }
  }
  else
  {
    int v18 = 1;
  }
  if (dword_268147B98 <= 800 && (dword_268147B98 != -1 || sub_226865630((uint64_t)&dword_268147B98, 0x320u)))
  {
    uint64_t v19 = "NO";
    if (v18) {
      uint64_t v19 = "YES";
    }
    sub_226865EB4((uint64_t)&dword_268147B98, (uint64_t)"-[TableViewManager textFieldVerifiedAtIndexPath:]", 800, (uint64_t)"returning %s\n", v10, v11, v12, v13, (uint64_t)v19);
  }
  return v18;
}

+ (id)boldSystemLabelFont
{
  int v3 = sub_2269050C4((uint64_t)a1, a2, v2);
  uint64_t v4 = (void *)MEMORY[0x263F1C658];
  objc_msgSend_labelFontSize(MEMORY[0x263F1C658], v5, v6);
  if (v3)
  {
    return (id)objc_msgSend_systemFontOfSize_(v4, v7, v8);
  }
  else
  {
    return (id)objc_msgSend_boldSystemFontOfSize_(v4, v7, v8);
  }
}

+ (id)systemLabelFont
{
  sub_2269050C4((uint64_t)a1, a2, v2);
  int v3 = (void *)MEMORY[0x263F1C658];
  objc_msgSend_labelFontSize(MEMORY[0x263F1C658], v4, v5);

  return (id)objc_msgSend_systemFontOfSize_(v3, v6, v7);
}

+ (id)smallSystemLabelFont
{
  int v3 = sub_2269050C4((uint64_t)a1, a2, v2);
  uint64_t v6 = (void *)MEMORY[0x263F1C658];
  if (v3)
  {
    objc_msgSend_smallSystemFontSize(MEMORY[0x263F1C658], v4, v5);
  }
  else
  {
    objc_msgSend_labelFontSize(MEMORY[0x263F1C658], v4, v5);
    double v9 = v10 + -4.0;
  }

  return (id)objc_msgSend_systemFontOfSize_(v6, v7, v8, v9);
}

- (BOOL)textFieldIsSecureAndUnchanged:(id)a3
{
  if (dword_268147B18 <= 800 && (dword_268147B18 != -1 || sub_226865630((uint64_t)&dword_268147B18, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147B18, (uint64_t)"-[TableViewManager(private) textFieldIsSecureAndUnchanged:]", 800, (uint64_t)"textField %@\n", v3, v4, v5, v6, (uint64_t)a3);
  }
  double v9 = (void *)MEMORY[0x263F088C8];
  uint64_t v10 = objc_msgSend_tag(a3, a2, (uint64_t)a3) >> 16;
  unsigned __int16 v13 = objc_msgSend_tag(a3, v11, v12);
  uint64_t v15 = objc_msgSend_indexPathForRow_inSection_(v9, v14, v10, v13);
  if (!objc_msgSend_isSecureTextEntry(a3, v16, v17)) {
    return 0;
  }
  uint64_t CellDictForCellAtIndexPath = objc_msgSend_getCellDictForCellAtIndexPath_(self, v18, v15);
  uint64_t InfoForItemOfType_atItemTypeIndex_inCell = objc_msgSend_getInfoForItemOfType_atItemTypeIndex_inCell_(self, v20, @"editTextView", 0, CellDictForCellAtIndexPath);
  uint64_t v24 = objc_msgSend_text(a3, v22, v23);
  uint64_t v26 = objc_msgSend_objectForKey_(InfoForItemOfType_atItemTypeIndex_inCell, v25, @"startValue");
  if (!objc_msgSend_isEqualToString_(v24, v27, v26)) {
    return 0;
  }
  uint64_t v30 = objc_msgSend_text(a3, v28, v29);
  uint64_t v33 = objc_msgSend_objectForKey_(InfoForItemOfType_atItemTypeIndex_inCell, v31, @"currentValue");

  return objc_msgSend_isEqualToString_(v30, v32, v33);
}

- (void)deferedTouchInCellAtIndexPath:(id)a3
{
  if (a3)
  {
    if (objc_msgSend_delegate(self, a2, (uint64_t)a3))
    {
      objc_msgSend_delegate(self, v5, v6);
      if (objc_opt_respondsToSelector())
      {
        double v9 = objc_msgSend_delegate(self, v7, v8);
        objc_msgSend_touchInCellAtIndexPath_(v9, v10, (uint64_t)a3);
      }
    }
  }
}

- (id)getCellDictForCellAtIndexPath:(id)a3
{
  unint64_t v5 = objc_msgSend_row(a3, a2, (uint64_t)a3);
  uint64_t v8 = objc_msgSend_section(a3, v6, v7);
  RowArrayForSection = objc_msgSend_getRowArrayForSection_(self, v9, v8);
  if (!RowArrayForSection) {
    return 0;
  }
  unsigned __int16 v13 = RowArrayForSection;
  if (v5 >= objc_msgSend_count(RowArrayForSection, v11, v12)) {
    return 0;
  }

  return (id)objc_msgSend_objectAtIndex_(v13, v14, v5);
}

- (void)reloadSection:(unint64_t)a3
{
  if (!self->_handlingBulkUpdate)
  {
    if (dword_268147B58 <= 800 && (dword_268147B58 != -1 || sub_226865630((uint64_t)&dword_268147B58, 0x320u)))
    {
      uint64_t v5 = objc_msgSend_managedTableView(self, a2, a3);
      sub_226865EB4((uint64_t)&dword_268147B58, (uint64_t)"-[TableViewManager(private) reloadSection:]", 800, (uint64_t)"managedTableView %@\n", v6, v7, v8, v9, v5);
    }
    managedTableView = self->_managedTableView;
    uint64_t v12 = objc_msgSend_indexSetWithIndex_(MEMORY[0x263F088D0], a2, a3);
    objc_msgSend_reloadSections_withRowAnimation_(managedTableView, v11, v12, 0);
  }
}

- (id)getSectionDictForSection:(int64_t)a3
{
  uint64_t v4 = objc_msgSend_objectForKey_(self->_tableDescriptorDict, a2, @"tableSectionArray");
  if (objc_msgSend_count(v4, v5, v6) <= (unint64_t)a3) {
    return 0;
  }

  return (id)objc_msgSend_objectAtIndex_(v4, v7, a3);
}

- (id)getDescriptorObjectForKey:(id)a3 inSection:(int64_t)a4
{
  id result = (id)objc_msgSend_getSectionDictForSection_(self, a2, a4);
  if (result)
  {
    return (id)objc_msgSend_objectForKey_(result, v6, (uint64_t)a3);
  }
  return result;
}

- (void)setDescriptorObject:(id)a3 forKey:(id)a4 inSection:(int64_t)a5
{
  uint64_t SectionDictForSection = objc_msgSend_getSectionDictForSection_(self, a2, a5);
  if (SectionDictForSection)
  {
    if (a3)
    {
      objc_msgSend_setObject_forKey_(SectionDictForSection, v8, (uint64_t)a3, a4);
    }
    else
    {
      objc_msgSend_removeObjectForKey_(SectionDictForSection, v8, (uint64_t)a4);
    }
  }
}

- (id)getRowArrayForSection:(unint64_t)a3
{
  return (id)objc_msgSend_getDescriptorObjectForKey_inSection_(self, a2, @"sectionRows", a3);
}

- (void)setImageViewValue:(id)a3 usingItemInfo:(id)a4
{
  if (dword_268147C18 <= 800 && (dword_268147C18 != -1 || sub_226865630((uint64_t)&dword_268147C18, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147C18, (uint64_t)"-[TableViewManager(private) setImageViewValue:usingItemInfo:]", 800, (uint64_t)"\n", v4, v5, v6, v7, v36);
  }
  objc_msgSend_frame(a3, a2, (uint64_t)a3);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  uint64_t v17 = objc_msgSend_objectForKey_(a4, v16, @"currentValue");
  objc_msgSend_setImage_(a3, v18, v17);
  if (v17)
  {
    uint64_t v21 = objc_msgSend_image(a3, v19, v20);
    objc_msgSend_size(v21, v22, v23);
    double v25 = v24;
    uint64_t v28 = objc_msgSend_image(a3, v26, v27);
    objc_msgSend_size(v28, v29, v30);
    double v15 = v33;
  }
  else
  {
    uint64_t v34 = objc_msgSend_objectForKey_(a4, v19, @"defaultHeight");
    double v25 = 0.0;
    if (v34)
    {
      objc_msgSend_floatValue(v34, v31, v32);
      double v15 = v35;
    }
  }

  objc_msgSend_setFrame_(a3, v31, v32, v11, v13, v25, v15);
}

- (id)imageView:(id)a3
{
  if (dword_268147B18 <= 800 && (dword_268147B18 != -1 || sub_226865630((uint64_t)&dword_268147B18, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147B18, (uint64_t)"-[TableViewManager(private) imageView:]", 800, (uint64_t)"\n", v3, v4, v5, v6, v12);
  }
  id v9 = objc_alloc_init(MEMORY[0x263F1C6D0]);
  objc_msgSend_setImageViewValue_usingItemInfo_(self, v10, (uint64_t)v9, a3);
  return v9;
}

- (void)setLabelViewValue:(id)a3 usingItemInfo:(id)a4
{
  if (dword_268147C18 <= 800 && (dword_268147C18 != -1 || sub_226865630((uint64_t)&dword_268147C18, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147C18, (uint64_t)"-[TableViewManager(private) setLabelViewValue:usingItemInfo:]", 800, (uint64_t)"\n", v4, v5, v6, v7, v19);
  }
  double v10 = objc_msgSend_objectForKey_(a4, a2, @"currentValue");
  objc_msgSend_setText_(a3, v11, (uint64_t)v10);
  if (v10
    && (uint64_t v14 = objc_msgSend_newlineCharacterSet(MEMORY[0x263F08708], v12, v13),
        (uint64_t v16 = objc_msgSend_componentsSeparatedByCharactersInSet_(v10, v15, v14)) != 0))
  {
    uint64_t v18 = objc_msgSend_count(v16, v12, v17);
  }
  else
  {
    uint64_t v18 = 1;
  }

  objc_msgSend_setNumberOfLines_(a3, v12, v18);
}

- (id)labelView:(id)a3
{
  if (dword_268147B18 <= 800 && (dword_268147B18 != -1 || sub_226865630((uint64_t)&dword_268147B18, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147B18, (uint64_t)"-[TableViewManager(private) labelView:]", 800, (uint64_t)"\n", v3, v4, v5, v6, v51);
  }
  id v9 = objc_alloc_init(MEMORY[0x263F1C768]);
  uint64_t v12 = objc_msgSend_clearColor(MEMORY[0x263F1C550], v10, v11);
  objc_msgSend_setBackgroundColor_(v9, v13, v12);
  objc_msgSend_setLabelViewValue_usingItemInfo_(self, v14, (uint64_t)v9, a3);
  uint64_t v16 = objc_msgSend_objectForKey_(a3, v15, @"font");
  if (!v16) {
    uint64_t v16 = objc_msgSend_boldSystemLabelFont(TableViewManager, v17, v18);
  }
  objc_msgSend_setFont_(v9, v17, v16);
  uint64_t v20 = objc_msgSend_valueForKey_(a3, v19, @"itemEnabled");
  if (v20)
  {
    char v23 = objc_msgSend_BOOLValue(v20, v21, v22);
    uint64_t v25 = objc_msgSend_objectForKey_(a3, v24, @"color");
    if ((v23 & 1) == 0)
    {
      objc_msgSend_setTextColor_(v9, v26, (uint64_t)self->_subtitleColor);
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v25 = objc_msgSend_objectForKey_(a3, v21, @"color");
  }
  detailTextColor = (UIColor *)v25;
  if (!v25) {
    detailTextColor = self->_detailTextColor;
  }
  objc_msgSend_setTextColor_(v9, v26, (uint64_t)detailTextColor);
LABEL_14:
  uint64_t v29 = objc_msgSend_objectForKey_(a3, v27, @"alignment");
  if (v29)
  {
    uint64_t v32 = objc_msgSend_integerValue(v29, v30, v31);
    objc_msgSend_setTextAlignment_(v9, v33, v32);
  }
  else
  {
    objc_msgSend_setTextAlignment_(v9, v30, 4);
  }
  objc_msgSend_setAdjustsFontSizeToFitWidth_(v9, v34, 1);
  uint64_t v37 = objc_msgSend_font(v9, v35, v36);
  objc_msgSend_pointSize(v37, v38, v39);
  double v41 = v40 + -4.0;
  uint64_t v44 = objc_msgSend_font(v9, v42, v43);
  objc_msgSend_pointSize(v44, v45, v46);
  objc_msgSend_setMinimumScaleFactor_(v9, v48, v49, v41 / v47);
  return v9;
}

- (void)setMultilineLabelViewValue:(id)a3 usingItemInfo:(id)a4
{
  if (dword_268147C18 <= 800 && (dword_268147C18 != -1 || sub_226865630((uint64_t)&dword_268147C18, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147C18, (uint64_t)"-[TableViewManager(private) setMultilineLabelViewValue:usingItemInfo:]", 800, (uint64_t)"\n", v4, v5, v6, v7, v12);
  }
  uint64_t v11 = objc_msgSend_objectForKey_(a4, a2, @"currentValue");

  objc_msgSend_setText_(a3, v10, v11);
}

- (id)multilineLabelView:(id)a3
{
  uint64_t v3 = objc_msgSend_labelView_(self, a2, (uint64_t)a3);
  objc_msgSend_setNumberOfLines_(v3, v4, 0);
  return v3;
}

- (void)setEditTextViewValue:(id)a3 usingItemInfo:(id)a4
{
  if (dword_268147C18 <= 800 && (dword_268147C18 != -1 || sub_226865630((uint64_t)&dword_268147C18, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147C18, (uint64_t)"-[TableViewManager(private) setEditTextViewValue:usingItemInfo:]", 800, (uint64_t)"\n", v4, v5, v6, v7, v12);
  }
  uint64_t v11 = objc_msgSend_objectForKey_(a4, a2, @"currentValue");

  objc_msgSend_setText_(a3, v10, v11);
}

- (id)editTextView:(id)a3
{
  id v5 = objc_alloc(MEMORY[0x263F1CA98]);
  id v8 = (id)objc_msgSend_initWithFrame_(v5, v6, v7, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  objc_msgSend_setBorderStyle_(v8, v9, 0);
  uint64_t v12 = objc_msgSend_clearColor(MEMORY[0x263F1C550], v10, v11);
  objc_msgSend_setBackgroundColor_(v8, v13, v12);
  objc_msgSend_setAutocorrectionType_(v8, v14, 1);
  objc_msgSend_setAutocapitalizationType_(v8, v15, 0);
  objc_msgSend_setEnablesReturnKeyAutomatically_(v8, v16, 1);
  objc_msgSend_setDelegate_(v8, v17, (uint64_t)self);
  uint64_t v19 = objc_msgSend_objectForKey_(a3, v18, @"placeholder");
  objc_msgSend_setPlaceholder_(v8, v20, v19);
  objc_msgSend_setEditTextViewValue_usingItemInfo_(self, v21, (uint64_t)v8, a3);
  char v23 = objc_msgSend_objectForKey_(a3, v22, @"secure");
  if (v23)
  {
    uint64_t v26 = objc_msgSend_BOOLValue(v23, v24, v25);
    objc_msgSend_setSecureTextEntry_(v8, v27, v26);
  }
  else
  {
    objc_msgSend_setSecureTextEntry_(v8, v24, 0);
  }
  uint64_t v29 = objc_msgSend_objectForKey_(a3, v28, @"textFieldViewMode");
  if (v29)
  {
    uint64_t v32 = objc_msgSend_integerValue(v29, v30, v31);
    objc_msgSend_setClearButtonMode_(v8, v33, v32);
  }
  else
  {
    objc_msgSend_setClearButtonMode_(v8, v30, 0);
  }
  uint64_t v35 = objc_msgSend_objectForKey_(a3, v34, @"font");
  if (!v35) {
    uint64_t v35 = objc_msgSend_systemLabelFont(TableViewManager, v36, v37);
  }
  objc_msgSend_setFont_(v8, v36, v35);
  uint64_t v39 = objc_msgSend_objectForKey_(a3, v38, @"color");
  if (v39) {
    objc_msgSend_setTextColor_(v8, v40, v39);
  }
  else {
    objc_msgSend_setTextColor_(v8, v40, (uint64_t)self->_editTextColor);
  }
  uint64_t v42 = objc_msgSend_objectForKey_(a3, v41, @"keyboardType");
  if (v42)
  {
    uint64_t v45 = objc_msgSend_integerValue(v42, v43, v44);
    objc_msgSend_setKeyboardType_(v8, v46, v45);
  }
  double v47 = objc_msgSend_objectForKey_(a3, v43, @"returnKeyType");
  if (v47)
  {
    uint64_t v50 = objc_msgSend_integerValue(v47, v48, v49);
    objc_msgSend_setReturnKeyType_(v8, v51, v50);
  }
  uint64_t v52 = objc_msgSend_objectForKey_(a3, v48, @"alignment");
  if (v52)
  {
    uint64_t v56 = objc_msgSend_integerValue(v52, v53, v54);
  }
  else
  {
    uint64_t v57 = objc_msgSend_sharedApplication(MEMORY[0x263F1C408], v53, v54);
    uint64_t v56 = 2 * (objc_msgSend_userInterfaceLayoutDirection(v57, v58, v59) == 0);
  }
  objc_msgSend_setTextAlignment_(v8, v55, v56);
  objc_msgSend_setAdjustsFontSizeToFitWidth_(v8, v60, 1);
  uint64_t v63 = objc_msgSend_font(v8, v61, v62);
  objc_msgSend_pointSize(v63, v64, v65);
  objc_msgSend_setMinimumFontSize_(v8, v67, v68, v66 + -4.0);
  return v8;
}

- (void)setSwitchViewValue:(id)a3 usingItemInfo:(id)a4
{
  if (dword_268147C18 <= 800 && (dword_268147C18 != -1 || sub_226865630((uint64_t)&dword_268147C18, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147C18, (uint64_t)"-[TableViewManager(private) setSwitchViewValue:usingItemInfo:]", 800, (uint64_t)"\n", v4, v5, v6, v7, v14);
  }
  double v10 = objc_msgSend_objectForKey_(a4, a2, @"currentValue");
  uint64_t v13 = objc_msgSend_BOOLValue(v10, v11, v12);

  MEMORY[0x270F9A6D0](a3, sel_setOn_, v13);
}

- (id)switchView:(id)a3
{
  id v5 = objc_alloc(MEMORY[0x263F1CA10]);
  id v8 = (id)objc_msgSend_initWithFrame_(v5, v6, v7, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  objc_msgSend_addTarget_action_forControlEvents_(v8, v9, (uint64_t)self, sel_switchAction_, 4096);
  uint64_t v12 = objc_msgSend_clearColor(MEMORY[0x263F1C550], v10, v11);
  objc_msgSend_setBackgroundColor_(v8, v13, v12);
  objc_msgSend_setSwitchViewValue_usingItemInfo_(self, v14, (uint64_t)v8, a3);
  return v8;
}

- (void)setActivityViewValue:(id)a3 usingItemInfo:(id)a4
{
  if (dword_268147C18 <= 800 && (dword_268147C18 != -1 || sub_226865630((uint64_t)&dword_268147C18, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147C18, (uint64_t)"-[TableViewManager(private) setActivityViewValue:usingItemInfo:]", 800, (uint64_t)"\n", v4, v5, v6, v7, v15);
  }
  double v10 = objc_msgSend_objectForKey_(a4, a2, @"currentValue");
  if (objc_msgSend_BOOLValue(v10, v11, v12))
  {
    objc_msgSend_startAnimating(a3, v13, v14);
  }
  else
  {
    objc_msgSend_stopAnimating(a3, v13, v14);
  }
}

- (id)activityView:(id)a3
{
  if (dword_268147B18 <= 800 && (dword_268147B18 != -1 || sub_226865630((uint64_t)&dword_268147B18, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147B18, (uint64_t)"-[TableViewManager(private) activityView:]", 800, (uint64_t)"\n", v3, v4, v5, v6, v15);
  }
  id v9 = objc_alloc(MEMORY[0x263F1C3D8]);
  id v11 = (id)objc_msgSend_initWithActivityIndicatorStyle_(v9, v10, 100);
  objc_msgSend_setHidesWhenStopped_(v11, v12, 1);
  objc_msgSend_setActivityViewValue_usingItemInfo_(self, v13, (uint64_t)v11, a3);
  return v11;
}

- (void)setButtonViewValue:(id)a3 usingItemInfo:(id)a4
{
  if (dword_268147C18 <= 800 && (dword_268147C18 != -1 || sub_226865630((uint64_t)&dword_268147C18, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147C18, (uint64_t)"-[TableViewManager(private) setButtonViewValue:usingItemInfo:]", 800, (uint64_t)"\n", v4, v5, v6, v7, v12);
  }
  uint64_t v11 = objc_msgSend_objectForKey_(a4, a2, @"currentValue");

  objc_msgSend_setTitle_forState_(a3, v10, v11, 0);
}

- (id)buttonView:(id)a3
{
  if (dword_268147B18 <= 800 && (dword_268147B18 != -1 || sub_226865630((uint64_t)&dword_268147B18, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147B18, (uint64_t)"-[TableViewManager(private) buttonView:]", 800, (uint64_t)"\n", v3, v4, v5, v6, v22);
  }
  uint64_t v9 = objc_msgSend_objectForKey_(a3, a2, @"buttonImage");
  uint64_t v11 = objc_msgSend_objectForKey_(a3, v10, @"buttonSelectedImage");
  uint64_t v14 = objc_msgSend_buttonWithType_(MEMORY[0x263F1C488], v12, (v9 | v11) == 0);
  if (v9)
  {
    uint64_t v15 = objc_msgSend_imageNamed_(MEMORY[0x263F1C6B0], v13, v9);
    objc_msgSend_setImage_forState_(v14, v16, v15, 0);
  }
  if (v11)
  {
    uint64_t v17 = objc_msgSend_imageNamed_(MEMORY[0x263F1C6B0], v13, v11);
    objc_msgSend_setImage_forState_(v14, v18, v17, 1);
  }
  objc_msgSend_addTarget_action_forControlEvents_(v14, v13, (uint64_t)self, sel_buttonAction_, 64);
  objc_msgSend_setButtonViewValue_usingItemInfo_(self, v19, (uint64_t)v14, a3);
  objc_msgSend_setTitleColor_forState_(v14, v20, (uint64_t)self->_detailTextColor, 0);
  return v14;
}

- (id)segmentedControlView:(id)a3
{
  if (dword_268147B18 <= 800 && (dword_268147B18 != -1 || sub_226865630((uint64_t)&dword_268147B18, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147B18, (uint64_t)"-[TableViewManager(private) segmentedControlView:]", 800, (uint64_t)"\n", v3, v4, v5, v6, v28);
  }
  uint64_t v9 = objc_msgSend_valueForKey_(a3, a2, @"segmentedControlItems");
  if (!v9) {
    return 0;
  }
  uint64_t v11 = v9;
  uint64_t v12 = objc_msgSend_valueForKey_(a3, v10, @"currentValue");
  uint64_t v14 = objc_msgSend_valueForKey_(a3, v13, @"itemEnabled");
  id v15 = objc_alloc(MEMORY[0x263F1C968]);
  id v17 = (id)objc_msgSend_initWithItems_(v15, v16, v11);
  objc_msgSend_addTarget_action_forControlEvents_(v17, v18, (uint64_t)self, sel_segmentedControlValueChanged_, 4096);
  uint64_t v21 = objc_msgSend_integerValue(v12, v19, v20);
  objc_msgSend_setSelectedSegmentIndex_(v17, v22, v21);
  if (v14)
  {
    uint64_t v25 = objc_msgSend_BOOLValue(v14, v23, v24);
    objc_msgSend_setEnabled_(v17, v26, v25);
  }
  else
  {
    objc_msgSend_setEnabled_(v17, v23, 1);
  }
  return v17;
}

- (void)setProgressViewValue:(id)a3 usingItemInfo:(id)a4
{
  if (dword_268147C18 <= 800 && (dword_268147C18 != -1 || sub_226865630((uint64_t)&dword_268147C18, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147C18, (uint64_t)"-[TableViewManager(private) setProgressViewValue:usingItemInfo:]", 800, (uint64_t)"\n", v4, v5, v6, v7, v14);
  }
  double v10 = objc_msgSend_objectForKey_(a4, a2, @"currentValue");
  if (v10)
  {
    objc_msgSend_floatValue(v10, v11, v12);
    MEMORY[0x270F9A6D0](a3, sel_setProgress_, v13);
  }
}

- (id)progressView:(id)a3
{
  if (dword_268147B18 <= 800 && (dword_268147B18 != -1 || sub_226865630((uint64_t)&dword_268147B18, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147B18, (uint64_t)"-[TableViewManager(private) progressView:]", 800, (uint64_t)"\n", v3, v4, v5, v6, v14);
  }
  id v9 = objc_alloc(MEMORY[0x263F1C8E0]);
  id v11 = (id)objc_msgSend_initWithProgressViewStyle_(v9, v10, 0);
  objc_msgSend_setProgressViewValue_usingItemInfo_(self, v12, (uint64_t)v11, a3);
  return v11;
}

- (void)setDatePickerValue:(id)a3 usingItemInfo:(id)a4
{
  if (dword_268147C18 <= 800 && (dword_268147C18 != -1 || sub_226865630((uint64_t)&dword_268147C18, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147C18, (uint64_t)"-[TableViewManager(private) setDatePickerValue:usingItemInfo:]", 800, (uint64_t)"\n", v4, v5, v6, v7, v22);
  }
  uint64_t v10 = objc_msgSend_objectForKey_(a4, a2, @"currentValue");
  if (v10) {
    objc_msgSend_setDate_(a3, v11, v10);
  }
  uint64_t v12 = objc_msgSend_valueForKey_(a4, v11, @"datePickerMode");
  uint64_t v15 = objc_msgSend_integerValue(v12, v13, v14);
  objc_msgSend_setDatePickerMode_(a3, v16, v15);
  uint64_t v18 = objc_msgSend_valueForKey_(a4, v17, @"minValue");
  objc_msgSend_setMinimumDate_(a3, v19, v18);
  uint64_t v21 = objc_msgSend_valueForKey_(a4, v20, @"maxValue");

  MEMORY[0x270F9A6D0](a3, sel_setMaximumDate_, v21);
}

- (id)datePicker:(id)a3
{
  if (dword_268147B18 <= 800 && (dword_268147B18 != -1 || sub_226865630((uint64_t)&dword_268147B18, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147B18, (uint64_t)"-[TableViewManager(private) datePicker:]", 800, (uint64_t)"\n", v3, v4, v5, v6, v16);
  }
  id v9 = objc_alloc(MEMORY[0x263F1C5B0]);
  id v12 = (id)objc_msgSend_initWithFrame_(v9, v10, v11, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  objc_msgSend_addTarget_action_forControlEvents_(v12, v13, (uint64_t)self, sel_selectedDateChanged_, 4096);
  objc_msgSend_setDatePickerValue_usingItemInfo_(self, v14, (uint64_t)v12, a3);
  return v12;
}

- (void)setVerifierAccessoryView:(int)a3 forCell:(id)a4
{
  int isEditing = objc_msgSend_isEditing(a4, a2, *(uint64_t *)&a3);
  if (dword_268147B98 <= 800)
  {
    if (dword_268147B98 != -1 || sub_226865630((uint64_t)&dword_268147B98, 0x320u))
    {
      uint64_t v13 = "is NOT";
      if (isEditing) {
        uint64_t v13 = "is";
      }
      sub_226865EB4((uint64_t)&dword_268147B98, (uint64_t)"-[TableViewManager(private) setVerifierAccessoryView:forCell:]", 800, (uint64_t)"cell %s editing\n", v8, v9, v10, v11, (uint64_t)v13);
    }
    if (dword_268147B98 <= 800)
    {
      if (dword_268147B98 != -1 || sub_226865630((uint64_t)&dword_268147B98, 0x320u))
      {
        uint64_t v14 = objc_msgSend_editingAccessoryView(a4, v6, v7);
        sub_226865EB4((uint64_t)&dword_268147B98, (uint64_t)"-[TableViewManager(private) setVerifierAccessoryView:forCell:]", 800, (uint64_t)"cell.editingAccessoryView = %@\n", v15, v16, v17, v18, v14);
      }
      if (dword_268147B98 <= 800 && (dword_268147B98 != -1 || sub_226865630((uint64_t)&dword_268147B98, 0x320u)))
      {
        uint64_t v19 = objc_msgSend_accessoryView(a4, v6, v7);
        sub_226865EB4((uint64_t)&dword_268147B98, (uint64_t)"-[TableViewManager(private) setVerifierAccessoryView:forCell:]", 800, (uint64_t)"cell.accessoryView = %@\n", v20, v21, v22, v23, v19);
      }
    }
  }
  switch(a3)
  {
    case 0:
      if (dword_268147B98 <= 800 && (dword_268147B98 != -1 || sub_226865630((uint64_t)&dword_268147B98, 0x320u))) {
        sub_226865EB4((uint64_t)&dword_268147B98, (uint64_t)"-[TableViewManager(private) setVerifierAccessoryView:forCell:]", 800, (uint64_t)"verifier accessory type = kVerifierAccessoryTypeNone for cell %@\n", v8, v9, v10, v11, (uint64_t)a4);
      }
      if (isEditing && objc_msgSend_editingAccessoryView(a4, v6, v7))
      {
        objc_msgSend_setEditingAccessoryView_(a4, v6, 0);
      }
      else if (objc_msgSend_accessoryView(a4, v6, v7))
      {
        objc_msgSend_setAccessoryView_(a4, v25, 0);
      }
      return;
    case 1:
      if (dword_268147B98 > 800) {
        goto LABEL_35;
      }
      if (dword_268147B98 == -1)
      {
        uint64_t v24 = @"NotVerifiedFlat.png";
        if (!sub_226865630((uint64_t)&dword_268147B98, 0x320u)) {
          goto LABEL_56;
        }
      }
      else
      {
        uint64_t v24 = @"NotVerifiedFlat.png";
      }
      uint64_t v26 = "verifier accessory type = kVerifierAccessoryTypeInvalid for cell %@\n";
      goto LABEL_55;
    case 2:
      if (dword_268147B98 <= 800 && (dword_268147B98 != -1 || sub_226865630((uint64_t)&dword_268147B98, 0x320u))) {
        sub_226865EB4((uint64_t)&dword_268147B98, (uint64_t)"-[TableViewManager(private) setVerifierAccessoryView:forCell:]", 800, (uint64_t)"verifier accessory type = kVerifierAccessoryTypeSmartInvalid for cell %@\n", v8, v9, v10, v11, (uint64_t)a4);
      }
      if ((!isEditing || !objc_msgSend_editingAccessoryView(a4, v6, v7)) && !objc_msgSend_accessoryView(a4, v6, v7)) {
        return;
      }
LABEL_35:
      uint64_t v24 = @"NotVerifiedFlat.png";
      goto LABEL_56;
    case 3:
      if (dword_268147B98 > 800) {
        goto LABEL_46;
      }
      if (dword_268147B98 == -1)
      {
        uint64_t v24 = @"VerifiedFlat.png";
        if (!sub_226865630((uint64_t)&dword_268147B98, 0x320u)) {
          goto LABEL_56;
        }
      }
      else
      {
        uint64_t v24 = @"VerifiedFlat.png";
      }
      uint64_t v26 = "verifier accessory type = kVerifierAccessoryTypeValid for cell %@\n";
LABEL_55:
      sub_226865EB4((uint64_t)&dword_268147B98, (uint64_t)"-[TableViewManager(private) setVerifierAccessoryView:forCell:]", 800, (uint64_t)v26, v8, v9, v10, v11, (uint64_t)a4);
LABEL_56:
      uint64_t v27 = (void *)MEMORY[0x263F086E0];
      uint64_t v28 = objc_opt_class();
      uint64_t v30 = objc_msgSend_bundleForClass_(v27, v29, v28);
      uint64_t v32 = objc_msgSend_imageNamed_inBundle_(ImageStore, v31, (uint64_t)v24, v30);
      if (v32)
      {
        uint64_t v33 = v32;
        id v34 = objc_alloc(MEMORY[0x263F1C6D0]);
        id v39 = (id)objc_msgSend_initWithImage_(v34, v35, v33);
        if (isEditing)
        {
          objc_msgSend_setEditingAccessoryType_(a4, v36, 0);
          objc_msgSend_setEditingAccessoryView_(a4, v37, (uint64_t)v39);
        }
        else
        {
          objc_msgSend_setAccessoryType_(a4, v36, 0);
          objc_msgSend_setAccessoryView_(a4, v38, (uint64_t)v39);
        }
      }
      return;
    case 4:
      if (dword_268147B98 <= 800 && (dword_268147B98 != -1 || sub_226865630((uint64_t)&dword_268147B98, 0x320u))) {
        sub_226865EB4((uint64_t)&dword_268147B98, (uint64_t)"-[TableViewManager(private) setVerifierAccessoryView:forCell:]", 800, (uint64_t)"verifier accessory type = kVerifierAccessoryTypeSmartValid for cell %@\n", v8, v9, v10, v11, (uint64_t)a4);
      }
      if ((!isEditing || !objc_msgSend_editingAccessoryView(a4, v6, v7)) && !objc_msgSend_accessoryView(a4, v6, v7)) {
        return;
      }
LABEL_46:
      uint64_t v24 = @"VerifiedFlat.png";
      goto LABEL_56;
    default:
      return;
  }
}

- (void)setUnreadBubbleCountValue:(id)a3 usingItemInfo:(id)a4
{
  if (dword_268147C18 <= 800 && (dword_268147C18 != -1 || sub_226865630((uint64_t)&dword_268147C18, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147C18, (uint64_t)"-[TableViewManager(private) setUnreadBubbleCountValue:usingItemInfo:]", 800, (uint64_t)"\n", v4, v5, v6, v7, v15);
  }
  uint64_t v10 = objc_msgSend_objectForKey_(a4, a2, @"currentValue");
  if (v10)
  {
    uint64_t v14 = objc_msgSend_integerValue(v10, v11, v12);
    objc_msgSend_setCount_(a3, v13, v14);
  }
}

- (id)unreadBubbleCount:(id)a3
{
  if (dword_268147B18 <= 800 && (dword_268147B18 != -1 || sub_226865630((uint64_t)&dword_268147B18, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147B18, (uint64_t)"-[TableViewManager(private) unreadBubbleCount:]", 800, (uint64_t)"\n", v3, v4, v5, v6, v15);
  }
  uint64_t v9 = [UnreadBubbleCount alloc];
  id v12 = (id)objc_msgSend_initWithFrame_(v9, v10, v11, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  objc_msgSend_setUnreadBubbleCountValue_usingItemInfo_(self, v13, (uint64_t)v12, a3);
  return v12;
}

@end