@interface NSPredicate(ABPredicateRunner)
- (void)ab_runPredicateWithSortOrder:()ABPredicateRunner ranked:inAddressBook:withDelegate:;
@end

@implementation NSPredicate(ABPredicateRunner)

- (void)ab_runPredicateWithSortOrder:()ABPredicateRunner ranked:inAddressBook:withDelegate:
{
  theDict[1] = a6;
  theDict[2] = a1;
  theDict[4] = 0;
  theDict[5] = 0;
  theDict[3] = a5;
  if (a5 && *((void *)a5 + 2))
  {
    long long v17 = 0u;
    long long v18 = 0u;
    *(void *)&long long v18 = ABCRecordStoreReadColumns();
    if ([(__CFDictionary *)a6 predicateShouldContinue:a1])
    {
      CPRecordStoreGetDatabase();
      uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
      if ([(__CFDictionary *)a1 ab_hasCallback]) {
        CPSqliteDatabaseRegisterFunction();
      }
      theDict[0] = 0;
      v12 = (void *)[(__CFDictionary *)a1 ab_newQueryWithSortOrder:a3 ranked:a4 addressBook:a5 propertyIndices:theDict];
      *((void *)&v17 + 1) = CFDictionaryGetCount(theDict[0]) + 1;
      [(__CFDictionary *)a1 ab_addCallbackContextToArray:v11];
      uint64_t v13 = CPSqliteDatabaseStatementForReading();
      ABRegulatoryLogReadContactsData((uint64_t)a5);
      if (v13)
      {
        int v15 = 1;
        [(__CFDictionary *)a1 ab_bindSelectClauseComponentOfStatement:v13 withBindingOffset:&v15 predicateIdentifier:0];
        [(__CFDictionary *)a1 ab_bindJoinClauseComponentOfStatement:v13 withBindingOffset:&v15 predicateIdentifier:0];
        [(__CFDictionary *)a1 ab_bindWhereClauseComponentOfStatement:v13 withBindingOffset:&v15 predicateIdentifier:0];
        if ([(__CFDictionary *)a6 predicateShouldContinue:a1])
        {
          CPSqliteConnectionEnableProgressHandlerCallback();
          v14 = (const void *)CPRecordStoreProcessRecordStatementWithPropertyIndices();
          CPSqliteConnectionDisableProgressHandlerCallback();
          if (v14) {
            CFRelease(v14);
          }
        }
      }
      if (theDict[0]) {
        CFRelease(theDict[0]);
      }
    }
    if ((void)v18) {
      free((void *)v18);
    }
  }
}

- (void)ab_runPredicateWithSortOrder:()ABPredicateRunner ranked:inAddressBook:withDelegate:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_fault_impl(&dword_19DCDB000, log, OS_LOG_TYPE_FAULT, "Exception: %@ trying to create a SQLite statement for query: %@", (uint8_t *)&v3, 0x16u);
}

@end