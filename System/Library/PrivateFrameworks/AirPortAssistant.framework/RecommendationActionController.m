@interface RecommendationActionController
+ (RecommendationActionController)recommendationActionControllerWithTableManager:(id)a3 andAssistantUIViewController:(id)a4;
- (BOOL)isPrimaryRecommendation;
- (NSString)actionKey;
- (NSString)sectionIdentifier;
- (TableViewManager)tableManager;
- (id)getSectionInfoWithLongStrings:(BOOL)a3;
- (void)selectPrimaryRecommendation;
- (void)setActionKey:(id)a3;
- (void)setSectionIdentifier:(id)a3;
- (void)setTableManager:(id)a3;
@end

@implementation RecommendationActionController

+ (RecommendationActionController)recommendationActionControllerWithTableManager:(id)a3 andAssistantUIViewController:(id)a4
{
  v4 = 0;
  if (a3 && a4)
  {
    v4 = objc_alloc_init(RecommendationActionController);
    objc_msgSend_setSectionIdentifier_(v4, v7, @"ActionTableSection");
    objc_msgSend_setTableManager_(v4, v8, (uint64_t)a3);
    v11 = objc_msgSend_recommendationParamDict(a4, v9, v10);
    uint64_t v13 = objc_msgSend_objectForKey_(v11, v12, @"actionKey");
    objc_msgSend_setActionKey_(v4, v14, v13);
  }
  return v4;
}

- (id)getSectionInfoWithLongStrings:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t valid = sub_22685D62C((uint64_t)self->actionKey, qword_268148378);
  uint64_t v10 = objc_msgSend_array(MEMORY[0x263EFF980], v6, v7);
  if (v3)
  {
    uint64_t v11 = sub_22685D62C(@"TextualSentenceConcatenator", qword_268148378);
    v12 = NSString;
    uint64_t v13 = sub_22685D62C(@"RecommendedInParens", qword_268148378);
    uint64_t valid = objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(v12, v14, v11, @"%@%@", 0, valid, v13);
  }
  v15 = objc_msgSend_tableManager(self, v8, v9);
  uint64_t RowStyleBasicWithImage_text1_text2_withTag = objc_msgSend_createRowStyleBasicWithImage_text1_text2_withTag_(v15, v16, 0, valid, 0, 1349675373);
  objc_msgSend_addObject_(v10, v18, RowStyleBasicWithImage_text1_text2_withTag);
  v21 = objc_msgSend_tableManager(self, v19, v20);
  uint64_t v22 = sub_22685D62C(@"OtherOptionsEllipsis", qword_268148378);
  uint64_t v24 = objc_msgSend_createRowStyleBasicWithImage_text1_text2_withTag_(v21, v23, 0, v22, 0, 1299149413);
  objc_msgSend_addObject_(v10, v25, v24);
  v26 = (void *)MEMORY[0x263EFF9A0];
  uint64_t v28 = objc_msgSend_numberWithBool_(NSNumber, v27, 1);
  uint64_t v30 = objc_msgSend_numberWithInteger_(NSNumber, v29, 1349675373);
  return (id)objc_msgSend_dictionaryWithObjectsAndKeys_(v26, v31, (uint64_t)v10, @"sectionRows", v28, @"sectionIsMenu", v30, @"selectedMenuItemTag", self->sectionIdentifier, @"identifier", 0);
}

- (BOOL)isPrimaryRecommendation
{
  tableManager = self->tableManager;
  uint64_t v3 = objc_msgSend_indexOfSectionWithIdentifier_(tableManager, a2, (uint64_t)self->sectionIdentifier);
  return objc_msgSend_tagOfSelectedRowInMenuSection_(tableManager, v4, v3) == 1349675373;
}

- (void)selectPrimaryRecommendation
{
  tableManager = self->tableManager;
  uint64_t v4 = objc_msgSend_indexPathOfCellWithTag_(tableManager, a2, 1349675373);

  objc_msgSend_selectMenuCellAtIndexPath_(tableManager, v3, v4);
}

- (NSString)actionKey
{
  return self->actionKey;
}

- (void)setActionKey:(id)a3
{
}

- (NSString)sectionIdentifier
{
  return self->sectionIdentifier;
}

- (void)setSectionIdentifier:(id)a3
{
}

- (TableViewManager)tableManager
{
  return self->tableManager;
}

- (void)setTableManager:(id)a3
{
  self->tableManager = (TableViewManager *)a3;
}

@end