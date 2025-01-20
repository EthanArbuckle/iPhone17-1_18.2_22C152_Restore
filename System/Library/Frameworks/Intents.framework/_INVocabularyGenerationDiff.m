@interface _INVocabularyGenerationDiff
- (BOOL)hasChanges;
- (BOOL)isFullReset;
- (NSArray)updatedVocabularyItems;
- (NSSet)deletedSiriIDs;
- (NSString)appBundleID;
- (NSString)intentSlotName;
- (id)description;
- (int64_t)countOfVocabularyItemsAfterApplying;
- (void)setAppBundleID:(id)a3;
- (void)setCountOfVocabularyItemsAfterApplying:(int64_t)a3;
- (void)setDeletedSiriIDs:(id)a3;
- (void)setIntentSlotName:(id)a3;
- (void)setIsFullReset:(BOOL)a3;
- (void)setUpdatedVocabularyItems:(id)a3;
@end

@implementation _INVocabularyGenerationDiff

- (void)setIsFullReset:(BOOL)a3
{
  self->_isFullReset = a3;
}

- (void)setUpdatedVocabularyItems:(id)a3
{
}

- (void)setIntentSlotName:(id)a3
{
}

- (void)setDeletedSiriIDs:(id)a3
{
}

- (void)setCountOfVocabularyItemsAfterApplying:(int64_t)a3
{
  self->_countOfVocabularyItemsAfterApplying = a3;
}

- (void)setAppBundleID:(id)a3
{
}

- (BOOL)hasChanges
{
  if ([(_INVocabularyGenerationDiff *)self isFullReset]) {
    return 1;
  }
  v4 = [(_INVocabularyGenerationDiff *)self deletedSiriIDs];
  if ([v4 count])
  {
    BOOL v3 = 1;
  }
  else
  {
    v5 = [(_INVocabularyGenerationDiff *)self updatedVocabularyItems];
    BOOL v3 = [v5 count] != 0;
  }
  return v3;
}

- (BOOL)isFullReset
{
  return self->_isFullReset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appBundleID, 0);
  objc_storeStrong((id *)&self->_intentSlotName, 0);
  objc_storeStrong((id *)&self->_updatedVocabularyItems, 0);

  objc_storeStrong((id *)&self->_deletedSiriIDs, 0);
}

- (NSString)appBundleID
{
  return self->_appBundleID;
}

- (NSString)intentSlotName
{
  return self->_intentSlotName;
}

- (int64_t)countOfVocabularyItemsAfterApplying
{
  return self->_countOfVocabularyItemsAfterApplying;
}

- (NSArray)updatedVocabularyItems
{
  return self->_updatedVocabularyItems;
}

- (NSSet)deletedSiriIDs
{
  return self->_deletedSiriIDs;
}

- (id)description
{
  BOOL v3 = NSString;
  uint64_t v4 = objc_opt_class();
  BOOL v5 = [(_INVocabularyGenerationDiff *)self isFullReset];
  v6 = [(_INVocabularyGenerationDiff *)self deletedSiriIDs];
  v7 = [(_INVocabularyGenerationDiff *)self updatedVocabularyItems];
  v8 = [v3 stringWithFormat:@"<%@ %p>{\n  Reset=%d\n  deletedSiriIDs=%@\n  updatedVocabularyItems=%@\n}", v4, self, v5, v6, v7];

  return v8;
}

@end