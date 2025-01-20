@interface ABSQLPredicate
+ (id)_sqlListOfLength:(unint64_t)a3;
+ (id)_sqlValuesTableOfLength:(unint64_t)a3 columnCount:(unint64_t)a4;
+ (id)bindPlaceholderStringOfCount:(unint64_t)a3;
+ (id)predicateForAllContacts;
+ (id)predicateForContactsInContainerWithIdentifier:(id)a3;
+ (id)predicateForContactsInGroupWithIdentifier:(id)a3;
+ (id)predicateForContactsInRange:(_NSRange)a3 allowedStoreIdentifiers:(id)a4 sortOrder:(int)a5;
+ (id)predicateForContactsInRange:(_NSRange)a3 sortOrder:(int)a4;
+ (id)predicateForContactsMatchingMultivalueProperty:(int)a3 value:(id)a4;
+ (id)predicateForContactsMatchingMultivalueProperty:(int)a3 values:(id)a4 groupIdentifiers:(id)a5 containerIdentifiers:(id)a6 limitToOneResult:(BOOL)a7 map:(id)a8;
+ (id)predicateForContactsMatchingName:(id)a3 addressBook:(void *)a4;
+ (id)predicateForContactsMatchingOrganizationName:(id)a3;
+ (id)predicateForContactsMatchingPhoneNumber:(id)a3 country:(id)a4 homeCountryCode:(id)a5 prefixHint:(id)a6 groupIdentifiers:(id)a7 limitToOneResult:(BOOL)a8;
+ (id)predicateForContactsMatchingPhoneNumbers:(id)a3 containerIdentifiers:(id)a4 map:(id)a5;
+ (id)predicateForContactsMatchingPhoneNumbers:(id)a3 emailAddresses:(id)a4 containerIdentifiers:(id)a5 map:(id)a6;
+ (id)predicateForContactsMatchingPreferredChannel:(id)a3 limitOne:(BOOL)a4;
+ (id)predicateForContactsMatchingSmartDialerString:(id)a3 tokenizer:(__CFStringTokenizer *)a4 collator:(UCollator *)a5;
+ (id)predicateForContactsMatchingText:(id)a3 tokenizer:(__CFStringTokenizer *)a4 collator:(UCollator *)a5 matchNameFieldsOnly:(BOOL)a6;
+ (id)predicateForContactsMissingBackgroundColors;
+ (id)predicateForContactsWithExternalUUIDs:(id)a3;
+ (id)predicateForContactsWithLegacyIdentifier:(int)a3;
+ (id)predicateForContactsWithUUIDs:(id)a3 ignoreUnifiedIdentifiers:(BOOL)a4;
+ (id)predicateForContactsWithWallpaperMetadata;
+ (id)predicateForMeContact;
+ (id)predicateForNoContacts;
+ (id)predicateForSingleContactMatchingMultivalueProperty:(int)a3 value:(id)a4;
+ (id)predicateUnioningPredicate:(id)a3 withPredicate:(id)a4;
- (BOOL)isNullPredicate;
- (NSString)query;
- (id)bindBlock;
- (id)matchInfoProvider;
- (id)storage;
- (void)dealloc;
- (void)setBindBlock:(id)a3;
- (void)setIsNullPredicate:(BOOL)a3;
- (void)setMatchInfoProvider:(id)a3;
- (void)setQuery:(id)a3;
- (void)setStorage:(id)a3;
@end

@implementation ABSQLPredicate

- (id)bindBlock
{
  return self->_bindBlock;
}

- (NSString)query
{
  return self->_query;
}

- (id)matchInfoProvider
{
  return self->_matchInfoProvider;
}

uint64_t __127__ABSQLPredicate_predicateForContactsMatchingPhoneNumber_country_homeCountryCode_prefixHint_groupIdentifiers_limitToOneResult___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = [a2 pointerBinder];
  (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, [*(id *)(a1 + 32) decomposedPhoneNumberPointer]);
  uint64_t v5 = [a2 stringBinder];
  (*(void (**)(uint64_t, void))(v5 + 16))(v5, *(void *)(a1 + 40));
  uint64_t v6 = [a2 blobBinder];
  (*(void (**)(uint64_t, void, uint64_t))(v6 + 16))(v6, *(void *)(a1 + 48), 8);
  uint64_t v7 = [a2 stringBinder];
  (*(void (**)(uint64_t, void))(v7 + 16))(v7, *(void *)(a1 + 56));
  v8 = *(void **)(a1 + 64);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __127__ABSQLPredicate_predicateForContactsMatchingPhoneNumber_country_homeCountryCode_prefixHint_groupIdentifiers_limitToOneResult___block_invoke_2;
  v10[3] = &unk_1E5989558;
  v10[4] = a2;
  return [v8 enumerateObjectsUsingBlock:v10];
}

uint64_t __73__ABSQLPredicate_predicateForContactsWithUUIDs_ignoreUnifiedIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t result = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (result)
  {
    uint64_t v6 = result;
    uint64_t v7 = *(void *)v22;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v21 + 1) + 8 * v8);
        uint64_t v10 = [a2 stringBinder];
        (*(void (**)(uint64_t, uint64_t))(v10 + 16))(v10, v9);
        ++v8;
      }
      while (v6 != v8);
      uint64_t result = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
      uint64_t v6 = result;
    }
    while (result);
  }
  if (!*(unsigned char *)(a1 + 40))
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v11 = *(void **)(a1 + 32);
    uint64_t result = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (result)
    {
      uint64_t v12 = result;
      uint64_t v13 = *(void *)v18;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v15 = *(void *)(*((void *)&v17 + 1) + 8 * v14);
          uint64_t v16 = [a2 stringBinder];
          (*(void (**)(uint64_t, uint64_t))(v16 + 16))(v16, v15);
          ++v14;
        }
        while (v12 != v14);
        uint64_t result = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
        uint64_t v12 = result;
      }
      while (result);
    }
  }
  return result;
}

uint64_t __84__ABSQLPredicate_predicateForContactsMatchingPhoneNumbers_containerIdentifiers_map___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = [*(id *)(a1 + 32) stringBinder];
  (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, a2);
  uint64_t v7 = [*(id *)(a1 + 32) stringBinder];
  (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, [a3 lastFour]);
  uint64_t v8 = [*(id *)(a1 + 32) pointerBinder];
  uint64_t v9 = [a3 decomposedPhoneNumberPointer];
  uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t))(v8 + 16);
  return v10(v8, v9);
}

void *__99__ABSQLPredicate_predicateForContactsMatchingPhoneNumbers_emailAddresses_containerIdentifiers_map___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a1 + 32);
  if (v4)
  {
    uint64_t v5 = [v4 bindBlock];
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, a2);
  }
  uint64_t result = *(void **)(a1 + 40);
  if (result)
  {
    uint64_t v7 = *(uint64_t (**)(void))([result bindBlock] + 16);
    return (void *)v7();
  }
  return result;
}

uint64_t __84__ABSQLPredicate_predicateForContactsMatchingPhoneNumbers_containerIdentifiers_map___block_invoke(void *a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)a1[4];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __84__ABSQLPredicate_predicateForContactsMatchingPhoneNumbers_containerIdentifiers_map___block_invoke_2;
  v18[3] = &unk_1E59895A8;
  v18[4] = a2;
  [v4 enumerateKeysAndObjectsUsingBlock:v18];
  if (a1[5])
  {
    uint64_t v5 = [a2 blobBinder];
    (*(void (**)(uint64_t, void, uint64_t))(v5 + 16))(v5, a1[5], 8);
  }
  uint64_t v6 = [a2 blobBinder];
  (*(void (**)(uint64_t, void, uint64_t))(v6 + 16))(v6, a1[6], 8);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = (void *)a1[7];
  uint64_t result = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (result)
  {
    uint64_t v9 = result;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * v11);
        uint64_t v13 = [a2 stringBinder];
        (*(void (**)(uint64_t, uint64_t))(v13 + 16))(v13, v12);
        ++v11;
      }
      while (v9 != v11);
      uint64_t result = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
      uint64_t v9 = result;
    }
    while (result);
  }
  return result;
}

uint64_t __56__ABSQLPredicate_predicateForContactsInRange_sortOrder___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = [a2 intBinder];
  (*(void (**)(uint64_t, void))(v4 + 16))(v4, *(unsigned int *)(a1 + 40));
  uint64_t v5 = *(uint64_t (**)(void))([a2 intBinder] + 16);
  return v5();
}

uint64_t __131__ABSQLPredicate_predicateForContactsMatchingMultivalueProperty_values_groupIdentifiers_containerIdentifiers_limitToOneResult_map___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __131__ABSQLPredicate_predicateForContactsMatchingMultivalueProperty_values_groupIdentifiers_containerIdentifiers_limitToOneResult_map___block_invoke_2;
  v12[3] = &unk_1E5989558;
  v12[4] = a2;
  [v4 enumerateObjectsUsingBlock:v12];
  if (*(void *)(a1 + 40))
  {
    uint64_t v5 = [a2 blobBinder];
    (*(void (**)(uint64_t, void, uint64_t))(v5 + 16))(v5, *(void *)(a1 + 40), 8);
  }
  uint64_t v6 = [a2 intBinder];
  (*(void (**)(uint64_t, void))(v6 + 16))(v6, *(unsigned int *)(a1 + 64));
  uint64_t v7 = *(void **)(a1 + 48);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __131__ABSQLPredicate_predicateForContactsMatchingMultivalueProperty_values_groupIdentifiers_containerIdentifiers_limitToOneResult_map___block_invoke_3;
  v11[3] = &unk_1E5989558;
  v11[4] = a2;
  [v7 enumerateObjectsUsingBlock:v11];
  uint64_t v8 = *(void **)(a1 + 56);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __131__ABSQLPredicate_predicateForContactsMatchingMultivalueProperty_values_groupIdentifiers_containerIdentifiers_limitToOneResult_map___block_invoke_4;
  v10[3] = &unk_1E5989558;
  v10[4] = a2;
  return [v8 enumerateObjectsUsingBlock:v10];
}

- (BOOL)isNullPredicate
{
  return self->_isNullPredicate;
}

+ (id)predicateForMeContact
{
  v2 = objc_opt_new();
  [v2 setQuery:objc_msgSend(NSString, "stringWithFormat:", @"SELECT MeIdentifier from ABStore where ROWID = (SELECT value from _SqliteDatabaseProperties where key = '%@')", @"MeSourceID"];
  return v2;
}

+ (id)predicateForContactsMatchingMultivalueProperty:(int)a3 values:(id)a4 groupIdentifiers:(id)a5 containerIdentifiers:(id)a6 limitToOneResult:(BOOL)a7 map:(id)a8
{
  BOOL v8 = a7;
  uint64_t v13 = objc_opt_new();
  uint64_t v14 = objc_msgSend(a1, "_sqlValuesTableOfLength:columnCount:", objc_msgSend(a4, "count"), 1);
  unint64_t v15 = 0x1E4F29000uLL;
  if (a5)
  {
    long long v16 = (__CFString *)[NSString stringWithFormat:@"AND groups.guid in %@", objc_msgSend(a1, "_sqlListOfLength:", objc_msgSend(a5, "count"))];
    long long v17 = @"JOIN ABGroupMembers members ON members.member_id = abmv.record_id AND member_type = 0 JOIN ABGroup groups on groups.rowid = members.group_id";
  }
  else
  {
    long long v17 = &stru_1EF03E278;
    long long v16 = &stru_1EF03E278;
  }
  long long v18 = &stru_1EF03E278;
  if (a6)
  {
    uint64_t v19 = v14;
    id v20 = a4;
    BOOL v21 = v8;
    long long v22 = NSString;
    long long v23 = v13;
    long long v24 = v16;
    v25 = v17;
    uint64_t v32 = objc_msgSend(a1, "_sqlListOfLength:", objc_msgSend(a6, "count"));
    v26 = v22;
    BOOL v8 = v21;
    a4 = v20;
    uint64_t v14 = v19;
    unint64_t v15 = 0x1E4F29000;
    uint64_t v27 = (__CFString *)[v26 stringWithFormat:@"AND store.guid in %@", v32];
    long long v18 = &stru_1EF03E278;
    long long v17 = v25;
    long long v16 = v24;
    uint64_t v13 = v23;
    v28 = @"JOIN ABPerson person ON person.ROWID = abmv.record_id JOIN ABStore store ON store.ROWID = person.storeID";
  }
  else
  {
    uint64_t v27 = &stru_1EF03E278;
    v28 = &stru_1EF03E278;
  }
  v29 = @"ab_collect_value_row_map(?, ABQuery.term, abmv.record_id)";
  if (v8) {
    long long v18 = @"LIMIT 1";
  }
  if (!a8) {
    v29 = @"abmv.record_id";
  }
  uint64_t v30 = [*(id *)(v15 + 24) stringWithFormat:@"WITH ABQuery(term) AS(%@) SELECT %@ FROM ABMultivalue abmv JOIN ABQuery ON term = value collate nocase %@ %@ WHERE property = ? %@ %@ %@", v14, v29, v17, v28, v16, v27, v18];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __131__ABSQLPredicate_predicateForContactsMatchingMultivalueProperty_values_groupIdentifiers_containerIdentifiers_limitToOneResult_map___block_invoke;
  v35[3] = &unk_1E59895F8;
  v35[4] = a4;
  v35[5] = a8;
  int v36 = a3;
  v35[6] = a5;
  v35[7] = a6;
  [v13 setBindBlock:v35];
  [v13 setQuery:v30];
  return v13;
}

+ (id)predicateForContactsInRange:(_NSRange)a3 sortOrder:(int)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v7 = objc_opt_new();
  BOOL v8 = @" ORDER BY LastSortLanguageIndex, LastSortSection, LastSort";
  if (!a4) {
    BOOL v8 = @" ORDER BY FirstSortLanguageIndex, FirstSortSection, FirstSort";
  }
  [v7 setQuery:objc_msgSend(NSString, "stringWithFormat:", @"SELECT abp.rowid FROM ABPerson abp WHERE abp.IsPreferredName = 1 %@ LIMIT ? OFFSET ?", v8)];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__ABSQLPredicate_predicateForContactsInRange_sortOrder___block_invoke;
  v10[3] = &__block_descriptor_48_e19_v16__0__ABBinders_8l;
  v10[4] = location;
  void v10[5] = length;
  [v7 setBindBlock:v10];
  return v7;
}

+ (id)predicateForContactsMatchingPhoneNumbers:(id)a3 emailAddresses:(id)a4 containerIdentifiers:(id)a5 map:(id)a6
{
  if ([a3 count] || (id result = (id)objc_msgSend(a4, "count")) != 0)
  {
    uint64_t v12 = objc_opt_new();
    if ([a3 count])
    {
      uint64_t v13 = (void *)[a1 predicateForContactsMatchingPhoneNumbers:a3 containerIdentifiers:a5 map:a6];
      if (![a4 count])
      {
        uint64_t v14 = 0;
LABEL_10:
        if (v13)
        {
          uint64_t v16 = [v13 query];
          goto LABEL_12;
        }
LABEL_13:
        uint64_t v17 = [v14 query];
        uint64_t v13 = 0;
        goto LABEL_14;
      }
    }
    else
    {
      uint64_t v13 = 0;
      uint64_t v14 = 0;
      if (![a4 count]) {
        goto LABEL_13;
      }
    }
    unint64_t v15 = (void *)[a1 predicateForContactsMatchingMultivalueProperty:kABPersonEmailProperty values:a4 groupIdentifiers:0 containerIdentifiers:a5 limitToOneResult:0 map:a6];
    uint64_t v14 = v15;
    if (v13 && v15)
    {
      uint64_t v16 = [NSString stringWithFormat:@"SELECT * FROM (%@) UNION SELECT * FROM  (%@)", objc_msgSend(v13, "query"), objc_msgSend(v15, "query")];
LABEL_12:
      uint64_t v17 = v16;
LABEL_14:
      [v12 setQuery:v17];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __99__ABSQLPredicate_predicateForContactsMatchingPhoneNumbers_emailAddresses_containerIdentifiers_map___block_invoke;
      v19[3] = &unk_1E5989620;
      v19[4] = v13;
      v19[5] = v14;
      [v12 setBindBlock:v19];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __99__ABSQLPredicate_predicateForContactsMatchingPhoneNumbers_emailAddresses_containerIdentifiers_map___block_invoke_2;
      v18[3] = &unk_1E5989648;
      v18[4] = a6;
      [v12 setMatchInfoProvider:v18];
      return v12;
    }
    goto LABEL_10;
  }
  return result;
}

- (void)setMatchInfoProvider:(id)a3
{
}

+ (id)predicateForContactsMatchingPhoneNumbers:(id)a3 containerIdentifiers:(id)a4 map:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id result = (id)[a3 count];
  if (result)
  {
    id v26 = a5;
    cf = (void *)CPPhoneNumberCopyHomeCountryCode();
    uint64_t v10 = [cf lowercaseString];
    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(a3, "count"));
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v12 = [a3 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v29 != v14) {
            objc_enumerationMutation(a3);
          }
          uint64_t v16 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          uint64_t v17 = [[ABPhoneNumber alloc] initWithPhoneNumberString:v16 countryCode:v10];
          if (v17)
          {
            long long v18 = v17;
            [v11 setObject:v17 forKey:v16];
          }
        }
        uint64_t v13 = [a3 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v13);
    }
    uint64_t v19 = objc_opt_new();
    if (v26) {
      id v20 = @"ab_collect_value_row_map(?, ABQuery.term, abmv.record_id)";
    }
    else {
      id v20 = @"abmv.record_id";
    }
    if (a4)
    {
      id v21 = a1;
      long long v22 = (__CFString *)[NSString stringWithFormat:@"AND store.guid in %@", objc_msgSend(a1, "_sqlListOfLength:", objc_msgSend(a4, "count"))];
      long long v23 = @"JOIN ABPerson person ON person.ROWID = abmv.record_id JOIN ABStore store ON store.ROWID = person.storeID";
    }
    else
    {
      long long v22 = &stru_1EF03E278;
      long long v23 = &stru_1EF03E278;
      id v21 = a1;
    }
    uint64_t v24 = objc_msgSend(v21, "_sqlValuesTableOfLength:columnCount:", objc_msgSend(v11, "count"), 3);
    [v19 setQuery:objc_msgSend(NSString, "stringWithFormat:", @"WITH ABQuery(term, termlastfour, termdecomposed) AS(%@) SELECT %@ FROM ABPhoneLastFour four JOIN ABQuery on ABQuery.termlastfour = four.value JOIN ABMultiValue abmv on abmv.rowid = four.multivalue_id %@ where ab_compare_phone_numbers(ABQuery.termdecomposed, null, abmv.value, ?) %@", v24, v20, v23, v22)];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __84__ABSQLPredicate_predicateForContactsMatchingPhoneNumbers_containerIdentifiers_map___block_invoke;
    v27[3] = &unk_1E59895D0;
    v27[4] = v11;
    v27[5] = v26;
    v27[6] = v10;
    v27[7] = a4;
    [v19 setBindBlock:v27];
    if (cf) {
      CFRelease(cf);
    }
    return v19;
  }
  return result;
}

+ (id)predicateForContactsMatchingPhoneNumber:(id)a3 country:(id)a4 homeCountryCode:(id)a5 prefixHint:(id)a6 groupIdentifiers:(id)a7 limitToOneResult:(BOOL)a8
{
  if (!a3) {
    return 0;
  }
  BOOL v8 = a8;
  id result = (id)_PNCopyLastFourDigitsOfLocalNumber();
  if (result)
  {
    id v16 = result;
    id result = (id)[result length];
    if (result)
    {
      uint64_t v17 = objc_opt_new();
      long long v18 = &stru_1EF03E278;
      if (v8) {
        uint64_t v19 = @"LIMIT 1";
      }
      else {
        uint64_t v19 = &stru_1EF03E278;
      }
      unint64_t v20 = 0x1E4F29000uLL;
      if (a7)
      {
        long long v18 = (__CFString *)[NSString stringWithFormat:@"AND groups.guid in %@", objc_msgSend(a1, "_sqlListOfLength:", objc_msgSend(a7, "count"))];
        unint64_t v20 = 0x1E4F29000;
        id v21 = @"JOIN ABGroupMembers members ON members.member_id = abmv.record_id AND member_type = 0 JOIN ABGroup groups on groups.rowid = members.group_id";
      }
      else
      {
        id v21 = &stru_1EF03E278;
      }
      [v17 setQuery:objc_msgSend(*(id *)(v20 + 24), "stringWithFormat:", @"WITH PhoneRanked (personrow, phonescore) as (SELECT abmv.record_id, ab_compare_phone_numbers( ?, ?, abmv.value, ?) FROM ABMultivalue abmv %@ WHERE abmv.UID IN (SELECT multivalue_id FROM ABPhoneLastFour WHERE value = ?) %@) SELECT personrow FROM PhoneRanked WHERE phonescore %@ %@", v21, v18, @"= MAX(1, (SELECT max(phonescore) FROM PhoneRanked))", v19)];
      long long v22 = -[ABPhoneNumber initWithPhoneNumberString:countryCode:]([ABPhoneNumber alloc], "initWithPhoneNumberString:countryCode:", a3, [a4 lowercaseString]);
      if (!a5)
      {
        long long v23 = (const void *)CPPhoneNumberCopyHomeCountryCode();
        a5 = (id)CFAutorelease(v23);
      }
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __127__ABSQLPredicate_predicateForContactsMatchingPhoneNumber_country_homeCountryCode_prefixHint_groupIdentifiers_limitToOneResult___block_invoke;
      v24[3] = &unk_1E5989580;
      v24[4] = v22;
      v24[5] = a6;
      v24[6] = a5;
      v24[7] = v16;
      v24[8] = a7;
      [v17 setBindBlock:v24];

      return v17;
    }
  }
  return result;
}

+ (id)predicateForContactsWithUUIDs:(id)a3 ignoreUnifiedIdentifiers:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = objc_opt_new();
  uint64_t v8 = objc_msgSend(a1, "bindPlaceholderStringOfCount:", objc_msgSend(a3, "count"));
  if (v4) {
    uint64_t v9 = [NSString stringWithFormat:@"SELECT rowid FROM ABPerson WHERE guid IN(%@)", v8, v11];
  }
  else {
    uint64_t v9 = [NSString stringWithFormat:@"SELECT rowid FROM(SELECT abp.ROWID FROM ABPerson abp LEFT JOIN ABPersonLink abpl ON abpl.rowid = abp.personlink WHERE abpl.guid IN(%@) UNION SELECT abp.ROWID FROM ABPerson abp  WHERE abp.guid IN(%@))", v8, v8];
  }
  [v7 setQuery:v9];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73__ABSQLPredicate_predicateForContactsWithUUIDs_ignoreUnifiedIdentifiers___block_invoke;
  v12[3] = &unk_1E5989450;
  v12[4] = a3;
  BOOL v13 = v4;
  [v7 setBindBlock:v12];
  return v7;
}

- (void)setQuery:(id)a3
{
}

- (void)setBindBlock:(id)a3
{
}

+ (id)bindPlaceholderStringOfCount:(unint64_t)a3
{
  BOOL v4 = (void *)[MEMORY[0x1E4F28E78] string];
  if (a3)
  {
    uint64_t v5 = 0;
    do
    {
      if (v5) {
        uint64_t v6 = @", ?";
      }
      else {
        uint64_t v6 = @"?";
      }
      [v4 appendString:v6];
      ++v5;
    }
    while (a3 != v5);
  }
  return v4;
}

+ (id)_sqlValuesTableOfLength:(unint64_t)a3 columnCount:(unint64_t)a4
{
  if (!a3) {
    return @"SELECT 1 WHERE 1 = 0";
  }
  uint64_t v7 = (void *)[MEMORY[0x1E4F28E78] stringWithString:@"VALUES "];
  uint64_t v8 = [a1 _sqlListOfLength:a4];
  uint64_t v9 = 0;
  do
  {
    if (v9) {
      [v7 appendString:@", "];
    }
    [v7 appendString:v8];
    ++v9;
  }
  while (a3 != v9);
  return v7;
}

+ (id)_sqlListOfLength:(unint64_t)a3
{
  BOOL v4 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithString:", @"(");
  if (a3)
  {
    uint64_t v5 = 0;
    do
    {
      if (v5) {
        uint64_t v6 = @",?";
      }
      else {
        uint64_t v6 = @"?";
      }
      [v4 appendString:v6];
      ++v5;
    }
    while (a3 != v5);
  }
  [v4 appendString:@""]);
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)ABSQLPredicate;
  [(ABSQLPredicate *)&v3 dealloc];
}

+ (id)predicateForAllContacts
{
  v2 = objc_opt_new();
  return v2;
}

uint64_t __131__ABSQLPredicate_predicateForContactsMatchingMultivalueProperty_values_groupIdentifiers_containerIdentifiers_limitToOneResult_map___block_invoke_2(uint64_t a1)
{
  v1 = *(uint64_t (**)(void))([*(id *)(a1 + 32) stringBinder] + 16);
  return v1();
}

+ (id)predicateForNoContacts
{
  v2 = objc_opt_new();
  [v2 setQuery:@" "];
  [v2 setIsNullPredicate:1];
  return v2;
}

+ (id)predicateForContactsWithLegacyIdentifier:(int)a3
{
  BOOL v4 = objc_opt_new();
  [v4 setQuery:@"SELECT rowid FROM ABPerson WHERE rowid = ?"];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__ABSQLPredicate_predicateForContactsWithLegacyIdentifier___block_invoke;
  v6[3] = &__block_descriptor_36_e19_v16__0__ABBinders_8l;
  int v7 = a3;
  [v4 setBindBlock:v6];
  return v4;
}

uint64_t __59__ABSQLPredicate_predicateForContactsWithLegacyIdentifier___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(uint64_t (**)(void))([a2 intBinder] + 16);
  return v2();
}

+ (id)predicateForContactsMatchingName:(id)a3 addressBook:(void *)a4
{
  uint64_t SearchCollator = ABAddressBookGetSearchCollator((uint64_t)a4);
  WordTokenizer = ABAddressBookGetWordTokenizer((uint64_t)a4);
  id v8 = 0;
  uint64_t v15 = 0;
  if (SearchCollator && WordTokenizer)
  {
    CFArrayRef v9 = ABCCreateArrayOfTokenizationsBySeparatingWordsInCompositeName(WordTokenizer, (const __CFString *)a3, 1);
    if ([(__CFArray *)v9 count]
      && (uint64_t v14 = 0,
          uint64_t v10 = (__CFString *)[MEMORY[0x1E4F28E78] stringWithString:@"SELECT abp.ROWID FROM ABPersonSearchKey abs JOIN ABPerson abp ON abs.person_id = abp.ROWID WHERE "], appendTokenizations(a3, v9, SearchCollator, v10, &v14, &v15, 0, 0), v15 >= 1))
    {
      id v11 = (id)objc_opt_new();
      [v11 setTokenizationSortKeys:v14];
      id v8 = (id)objc_opt_new();
      [v8 setQuery:v10];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __63__ABSQLPredicate_predicateForContactsMatchingName_addressBook___block_invoke;
      v13[3] = &unk_1E5989498;
      v13[4] = v11;
      [v8 setBindBlock:v13];
    }
    else
    {
      id v8 = 0;
    }
  }
  return v8;
}

uint64_t __63__ABSQLPredicate_predicateForContactsMatchingName_addressBook___block_invoke(uint64_t a1, void *a2)
{
  CFArrayRef v3 = (const __CFArray *)[*(id *)(a1 + 32) tokenizationSortKeys];
  uint64_t result = CFArrayGetCount(v3);
  if (result >= 0) {
    uint64_t v5 = result;
  }
  else {
    uint64_t v5 = result + 1;
  }
  if (result >= 2)
  {
    uint64_t v6 = 0;
    uint64_t v7 = v5 >> 1;
    do
    {
      uint64_t ValueAtIndex = (uint64_t)CFArrayGetValueAtIndex(v3, 2 * v6);
      uint64_t result = (uint64_t)CFArrayGetValueAtIndex(v3, (2 * v6) | 1);
      if (ValueAtIndex >= 1)
      {
        CFArrayRef v9 = (const char **)result;
        if (ValueAtIndex <= 1) {
          uint64_t v10 = 1;
        }
        else {
          uint64_t v10 = ValueAtIndex;
        }
        do
        {
          id v11 = *v9++;
          uint64_t v12 = [a2 blobBinder];
          size_t v13 = strlen(v11);
          uint64_t result = (*(uint64_t (**)(uint64_t, const char *, size_t))(v12 + 16))(v12, v11, v13);
          --v10;
        }
        while (v10);
      }
      ++v6;
    }
    while (v6 != v7);
  }
  return result;
}

+ (id)predicateForContactsInGroupWithIdentifier:(id)a3
{
  BOOL v4 = objc_opt_new();
  [v4 setQuery:@"SELECT abp.rowid from ABPerson abp JOIN ABGroupMembers abgm ON abgm.member_id = abp.ROWID AND abgm.member_type = 0 JOIN ABGroup abg ON abgm.group_id = abg.ROWID WHERE abg.guid = ?"];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__ABSQLPredicate_predicateForContactsInGroupWithIdentifier___block_invoke;
  v6[3] = &unk_1E5989498;
  void v6[4] = a3;
  [v4 setBindBlock:v6];
  return v4;
}

uint64_t __60__ABSQLPredicate_predicateForContactsInGroupWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(uint64_t (**)(void))([a2 stringBinder] + 16);
  return v2();
}

+ (id)predicateForContactsInContainerWithIdentifier:(id)a3
{
  BOOL v4 = objc_opt_new();
  [v4 setQuery:@"SELECT abp.rowid FROM ABPerson abp JOIN ABStore abs ON abp.storeid = abs.ROWID WHERE abs.guid = ?"];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__ABSQLPredicate_predicateForContactsInContainerWithIdentifier___block_invoke;
  v6[3] = &unk_1E5989498;
  void v6[4] = a3;
  [v4 setBindBlock:v6];
  return v4;
}

uint64_t __64__ABSQLPredicate_predicateForContactsInContainerWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(uint64_t (**)(void))([a2 stringBinder] + 16);
  return v2();
}

+ (id)predicateForContactsMatchingMultivalueProperty:(int)a3 value:(id)a4
{
  uint64_t v6 = objc_opt_new();
  [v6 setQuery:@"SELECT abp.rowid FROM ABPerson abp WHERE abp.rowid IN (SELECT record_id FROM ABMultiValue WHERE property = ? AND value LIKE ?)"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __71__ABSQLPredicate_predicateForContactsMatchingMultivalueProperty_value___block_invoke;
  v8[3] = &unk_1E59894C0;
  int v9 = a3;
  v8[4] = a4;
  [v6 setBindBlock:v8];
  return v6;
}

uint64_t __71__ABSQLPredicate_predicateForContactsMatchingMultivalueProperty_value___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = [a2 intBinder];
  (*(void (**)(uint64_t, void))(v4 + 16))(v4, *(unsigned int *)(a1 + 40));
  uint64_t v5 = *(uint64_t (**)(void))([a2 stringBinder] + 16);
  return v5();
}

+ (id)predicateForSingleContactMatchingMultivalueProperty:(int)a3 value:(id)a4
{
  uint64_t v6 = objc_opt_new();
  [v6 setQuery:@"SELECT abp.rowid FROM ABPerson abp WHERE abp.rowid IN (SELECT record_id FROM ABMultiValue WHERE property = ? AND value COLLATE NOCASE = ? LIMIT 1)"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __76__ABSQLPredicate_predicateForSingleContactMatchingMultivalueProperty_value___block_invoke;
  v8[3] = &unk_1E59894C0;
  int v9 = a3;
  v8[4] = a4;
  [v6 setBindBlock:v8];
  return v6;
}

uint64_t __76__ABSQLPredicate_predicateForSingleContactMatchingMultivalueProperty_value___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = [a2 intBinder];
  (*(void (**)(uint64_t, void))(v4 + 16))(v4, *(unsigned int *)(a1 + 40));
  uint64_t v5 = *(uint64_t (**)(void))([a2 stringBinder] + 16);
  return v5();
}

+ (id)predicateForContactsMatchingOrganizationName:(id)a3
{
  id result = (id)[a3 length];
  if (result)
  {
    uint64_t v5 = objc_opt_new();
    [v5 setQuery:@"SELECT abp.rowid FROM ABPerson abp WHERE abp.Organization LIKE ?"];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __63__ABSQLPredicate_predicateForContactsMatchingOrganizationName___block_invoke;
    v6[3] = &unk_1E5989498;
    void v6[4] = a3;
    [v5 setBindBlock:v6];
    return v5;
  }
  return result;
}

uint64_t __63__ABSQLPredicate_predicateForContactsMatchingOrganizationName___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 stringBinder];
  uint64_t v4 = [NSString stringWithFormat:@"%%%@%%", *(void *)(a1 + 32)];
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v3 + 16);
  return v5(v3, v4);
}

+ (id)predicateForContactsInRange:(_NSRange)a3 allowedStoreIdentifiers:(id)a4 sortOrder:(int)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v10 = objc_opt_new();
  uint64_t v11 = objc_msgSend(a1, "_sqlListOfLength:", objc_msgSend(a4, "count"));
  uint64_t v12 = @" ORDER BY FirstSortLanguageIndex, FirstSortSection, FirstSort";
  if (a5) {
    uint64_t v12 = @" ORDER BY LastSortLanguageIndex, LastSortSection, LastSort";
  }
  uint64_t v13 = [MEMORY[0x1E4F28E78] stringWithFormat:@"SELECT rowid FROM ABPerson WHERE rowid IN (SELECT rowid FROM ABPerson WHERE personlink = -1 AND StoreID IN %@ UNION SELECT ab_allowed_preferred_contact(abp.rowid, abp.StoreID, abp.IsPreferredName, ?) FROM ABPerson abp JOIN ABPersonLink abpl ON abpl.rowid = abp.PersonLink WHERE abp.StoreID IN %@ GROUP BY abpl.rowid) %@ LIMIT ? OFFSET ? ", v11, v11, v12];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __80__ABSQLPredicate_predicateForContactsInRange_allowedStoreIdentifiers_sortOrder___block_invoke;
  v15[3] = &unk_1E5989530;
  v15[4] = a4;
  v15[5] = location;
  v15[6] = length;
  [v10 setBindBlock:v15];
  [v10 setQuery:v13];
  return v10;
}

uint64_t __80__ABSQLPredicate_predicateForContactsInRange_allowedStoreIdentifiers_sortOrder___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __80__ABSQLPredicate_predicateForContactsInRange_allowedStoreIdentifiers_sortOrder___block_invoke_2;
  v11[3] = &unk_1E5989508;
  v11[4] = a2;
  [v4 enumerateIndexesUsingBlock:v11];
  uint64_t v5 = [a2 blobBinder];
  (*(void (**)(uint64_t, void, uint64_t))(v5 + 16))(v5, *(void *)(a1 + 32), 8);
  uint64_t v6 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __80__ABSQLPredicate_predicateForContactsInRange_allowedStoreIdentifiers_sortOrder___block_invoke_3;
  v10[3] = &unk_1E5989508;
  v10[4] = a2;
  [v6 enumerateIndexesUsingBlock:v10];
  uint64_t v7 = [a2 intBinder];
  (*(void (**)(uint64_t, void))(v7 + 16))(v7, *(unsigned int *)(a1 + 48));
  uint64_t v8 = [a2 intBinder];
  return (*(uint64_t (**)(uint64_t, void))(v8 + 16))(v8, *(unsigned int *)(a1 + 40));
}

uint64_t __80__ABSQLPredicate_predicateForContactsInRange_allowedStoreIdentifiers_sortOrder___block_invoke_2(uint64_t a1)
{
  v1 = *(uint64_t (**)(void))([*(id *)(a1 + 32) intBinder] + 16);
  return v1();
}

uint64_t __80__ABSQLPredicate_predicateForContactsInRange_allowedStoreIdentifiers_sortOrder___block_invoke_3(uint64_t a1)
{
  v1 = *(uint64_t (**)(void))([*(id *)(a1 + 32) intBinder] + 16);
  return v1();
}

uint64_t __127__ABSQLPredicate_predicateForContactsMatchingPhoneNumber_country_homeCountryCode_prefixHint_groupIdentifiers_limitToOneResult___block_invoke_2(uint64_t a1)
{
  v1 = *(uint64_t (**)(void))([*(id *)(a1 + 32) stringBinder] + 16);
  return v1();
}

uint64_t __131__ABSQLPredicate_predicateForContactsMatchingMultivalueProperty_values_groupIdentifiers_containerIdentifiers_limitToOneResult_map___block_invoke_3(uint64_t a1)
{
  v1 = *(uint64_t (**)(void))([*(id *)(a1 + 32) stringBinder] + 16);
  return v1();
}

uint64_t __131__ABSQLPredicate_predicateForContactsMatchingMultivalueProperty_values_groupIdentifiers_containerIdentifiers_limitToOneResult_map___block_invoke_4(uint64_t a1)
{
  v1 = *(uint64_t (**)(void))([*(id *)(a1 + 32) stringBinder] + 16);
  return v1();
}

+ (id)predicateForContactsMatchingPreferredChannel:(id)a3 limitOne:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = &stru_1EF03E278;
  if (v4) {
    uint64_t v7 = @"LIMIT 1";
  }
  [v6 setQuery:objc_msgSend(NSString, "stringWithFormat:", @"SELECT abp.rowid FROM ABPerson abp WHERE abp.PreferredChannel = ? %@", v7)];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__ABSQLPredicate_predicateForContactsMatchingPreferredChannel_limitOne___block_invoke;
  v9[3] = &unk_1E5989498;
  v9[4] = a3;
  [v6 setBindBlock:v9];
  return v6;
}

uint64_t __72__ABSQLPredicate_predicateForContactsMatchingPreferredChannel_limitOne___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(uint64_t (**)(void))([a2 stringBinder] + 16);
  return v2();
}

void *__99__ABSQLPredicate_predicateForContactsMatchingPhoneNumbers_emailAddresses_containerIdentifiers_map___block_invoke_2(uint64_t a1, int a2)
{
  id result = NSMapGet(*(NSMapTable **)(a1 + 32), (const void *)a2);
  if (result)
  {
    uint64_t v3 = result;
    BOOL v4 = (void *)MEMORY[0x1E4F1C9E8];
    return (void *)[v4 dictionaryWithObject:v3 forKey:@"matchedTerms"];
  }
  return result;
}

+ (id)predicateForContactsMatchingText:(id)a3 tokenizer:(__CFStringTokenizer *)a4 collator:(UCollator *)a5 matchNameFieldsOnly:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v10 = objc_opt_new();
  uint64_t v11 = (const void *)ABTokenListCreate();
  ABTokenListPopulateFromString((uint64_t)v11, a4, (uint64_t)a5, (const __CFString *)a3, 0, 1, 0);
  uint64_t v12 = (void *)[MEMORY[0x1E4F1CA48] array];
  uint64_t Count = ABTokenListGetCount((uint64_t)v11);
  uint64_t v14 = (void *)[@"SELECT rowid from ABPersonFullTextSearch WHERE ABPersonFullTextSearch MATCH " mutableCopy];
  [v10 setQuery:v14];

  if (Count < 1)
  {
    if (v6)
    {
      long long v18 = @"'";
      [v14 appendString:@"'"];
      goto LABEL_18;
    }
LABEL_17:
    long long v18 = @"?";
    goto LABEL_18;
  }
  for (uint64_t i = 0; i != Count; ++i)
    objc_msgSend(v12, "addObject:", ABTokenListGetTokenAtIndex((uint64_t)v11, i));
  if (!v6) {
    goto LABEL_17;
  }
  [v14 appendString:@"'"];
  BOOL v20 = v6;
  id v21 = v10;
  for (uint64_t j = 0; j != Count; ++j)
  {
    if (j) {
      [v14 appendString:@" AND "];
    }
    objc_msgSend(v14, "appendString:", @"(");
    uint64_t v17 = 0;
    while (1)
    {
      do
      {
        [v14 appendString:FTSearchNameOnlyProperties[v17]];
        [v14 appendString:@":' || ? || '"];
        ++v17;
      }
      while (!v17);
      if (v17 == 15) {
        break;
      }
      [v14 appendString:@" OR "];
    }
    [v14 appendString:@""]);
  }
  uint64_t v10 = v21;
  LOBYTE(v6) = v20;
  long long v18 = @"'";
LABEL_18:
  [v14 appendString:v18];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __90__ABSQLPredicate_predicateForContactsMatchingText_tokenizer_collator_matchNameFieldsOnly___block_invoke;
  v22[3] = &unk_1E5989450;
  BOOL v23 = v6;
  v22[4] = v12;
  [v10 setBindBlock:v22];
  CFRelease(v11);
  return v10;
}

uint64_t __90__ABSQLPredicate_predicateForContactsMatchingText_tokenizer_collator_matchNameFieldsOnly___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 40))
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    BOOL v4 = *(void **)(a1 + 32);
    uint64_t result = [v4 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (result)
    {
      uint64_t v6 = result;
      uint64_t v7 = *(void *)v20;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v20 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = [MEMORY[0x1E4F28E78] stringWithFormat:@"##&%@* ", *(void *)(*((void *)&v19 + 1) + 8 * v8)];
          int v10 = 15;
          do
          {
            uint64_t v11 = [a2 stringBinder];
            (*(void (**)(uint64_t, uint64_t))(v11 + 16))(v11, v9);
            --v10;
          }
          while (v10);
          ++v8;
        }
        while (v8 != v6);
        uint64_t result = [v4 countByEnumeratingWithState:&v19 objects:v27 count:16];
        uint64_t v6 = result;
      }
      while (result);
    }
  }
  else
  {
    uint64_t v12 = (void *)[MEMORY[0x1E4F28E78] string];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v13 = *(void **)(a1 + 32);
    uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v24 != v16) {
            objc_enumerationMutation(v13);
          }
          [v12 appendFormat:@"##&%@* ", *(void *)(*((void *)&v23 + 1) + 8 * i)];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v15);
    }
    uint64_t v18 = [a2 stringBinder];
    return (*(uint64_t (**)(uint64_t, void *))(v18 + 16))(v18, v12);
  }
  return result;
}

+ (id)predicateForContactsMatchingSmartDialerString:(id)a3 tokenizer:(__CFStringTokenizer *)a4 collator:(UCollator *)a5
{
  uint64_t v8 = objc_opt_new();
  uint64_t v9 = (const void *)ABTokenListCreate();
  ABTokenListPopulateFromString((uint64_t)v9, a4, (uint64_t)a5, (const __CFString *)a3, 0, 1, 0);
  int v10 = (void *)[MEMORY[0x1E4F1CA48] array];
  uint64_t Count = ABTokenListGetCount((uint64_t)v9);
  uint64_t v12 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:1282 valueOptions:0];
  uint64_t v13 = @"ab_cf_tokenizer_sd_match_collect(?, matchinfo(ABPersonSmartDialerFullTextSearch), ?, rowid)";
  uint64_t v14 = @"rowid";
  if (v12) {
    uint64_t v14 = @"ab_cf_tokenizer_match_collect(?, matchinfo(ABPersonFullTextSearch), ?, rowid)";
  }
  else {
    uint64_t v13 = @"rowid";
  }
  [v8 setQuery:objc_msgSend(NSString, "stringWithFormat:", @"SELECT %@ from ABPersonSmartDialerFullTextSearch WHERE ABPersonSmartDialerFullTextSearch MATCH ? UNION SELECT %@ from ABPersonFullTextSearch WHERE ABPersonFullTextSearch.Phone MATCH ? ", v13, v14)];
  uint64_t v15 = (void *)[MEMORY[0x1E4F28E78] string];
  if (Count >= 1)
  {
    for (uint64_t i = 0; i != Count; ++i)
    {
      uint64_t TokenAtIndex = ABTokenListGetTokenAtIndex((uint64_t)v9, i);
      [v15 appendFormat:@"##&%@* ", TokenAtIndex];
      [v10 addObject:TokenAtIndex];
    }
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __83__ABSQLPredicate_predicateForContactsMatchingSmartDialerString_tokenizer_collator___block_invoke;
  v20[3] = &unk_1E59896F0;
  v20[4] = v12;
  v20[5] = v10;
  v20[6] = v15;
  [v8 setBindBlock:v20];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __83__ABSQLPredicate_predicateForContactsMatchingSmartDialerString_tokenizer_collator___block_invoke_2;
  v19[3] = &unk_1E5989648;
  v19[4] = v12;
  [v8 setMatchInfoProvider:v19];
  CFRelease(v9);
  return v8;
}

uint64_t __83__ABSQLPredicate_predicateForContactsMatchingSmartDialerString_tokenizer_collator___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = [a2 blobBinder];
  (*(void (**)(uint64_t, void, uint64_t))(v4 + 16))(v4, *(void *)(a1 + 32), 8);
  uint64_t v5 = [a2 blobBinder];
  CFTypeRef v6 = CFRetain(*(CFTypeRef *)(a1 + 40));
  (*(void (**)(uint64_t, CFTypeRef, uint64_t))(v5 + 16))(v5, v6, 8);
  uint64_t v7 = [a2 stringBinder];
  (*(void (**)(uint64_t, void))(v7 + 16))(v7, *(void *)(a1 + 48));
  uint64_t v8 = [a2 blobBinder];
  (*(void (**)(uint64_t, void, uint64_t))(v8 + 16))(v8, *(void *)(a1 + 32), 8);
  uint64_t v9 = [a2 blobBinder];
  CFTypeRef v10 = CFRetain(*(CFTypeRef *)(a1 + 40));
  (*(void (**)(uint64_t, CFTypeRef, uint64_t))(v9 + 16))(v9, v10, 8);
  uint64_t v11 = *(uint64_t (**)(void))([a2 stringBinder] + 16);
  return v11();
}

void *__83__ABSQLPredicate_predicateForContactsMatchingSmartDialerString_tokenizer_collator___block_invoke_2(uint64_t a1, int a2)
{
  v4[1] = *MEMORY[0x1E4F143B8];
  uint64_t result = NSMapGet(*(NSMapTable **)(a1 + 32), (const void *)a2);
  if (result)
  {
    uint64_t v3 = @"matchedProperties";
    v4[0] = result;
    return (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:&v3 count:1];
  }
  return result;
}

+ (id)predicateForContactsWithExternalUUIDs:(id)a3
{
  uint64_t v5 = objc_opt_new();
  uint64_t v6 = objc_msgSend(a1, "bindPlaceholderStringOfCount:", objc_msgSend(a3, "count"));
  [v5 setQuery:objc_msgSend(NSString, "stringWithFormat:", @"SELECT rowid FROM ABPerson WHERE ExternalUUID IN(%@)", v6)];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__ABSQLPredicate_predicateForContactsWithExternalUUIDs___block_invoke;
  v8[3] = &unk_1E5989498;
  v8[4] = a3;
  [v5 setBindBlock:v8];
  return v5;
}

uint64_t __56__ABSQLPredicate_predicateForContactsWithExternalUUIDs___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t result = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * v7);
        uint64_t v9 = [a2 stringBinder];
        (*(void (**)(uint64_t, uint64_t))(v9 + 16))(v9, v8);
        ++v7;
      }
      while (v5 != v7);
      uint64_t result = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      uint64_t v5 = result;
    }
    while (result);
  }
  return result;
}

+ (id)predicateForContactsMissingBackgroundColors
{
  v2 = objc_opt_new();
  [v2 setQuery:objc_msgSend(NSString, "stringWithFormat:", @"SELECT rowid FROM ABPerson WHERE ImageType is NOT NULL and ImageBackgroundColorsData is NULL"];
  return v2;
}

+ (id)predicateForContactsWithWallpaperMetadata
{
  v2 = objc_opt_new();
  [v2 setQuery:objc_msgSend(NSString, "stringWithFormat:", @"SELECT rowid FROM ABPerson WHERE WallpaperMetadata is NOT NULL"];
  return v2;
}

+ (id)predicateUnioningPredicate:(id)a3 withPredicate:(id)a4
{
  uint64_t v6 = objc_opt_new();
  [v6 setQuery:objc_msgSend(NSString, "stringWithFormat:", @"SELECT * FROM (%@) UNION SELECT * FROM  (%@)", objc_msgSend(a3, "query"), objc_msgSend(a4, "query"))];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__ABSQLPredicate_predicateUnioningPredicate_withPredicate___block_invoke;
  v8[3] = &unk_1E5989620;
  v8[4] = a3;
  void v8[5] = a4;
  [v6 setBindBlock:v8];
  return v6;
}

uint64_t __59__ABSQLPredicate_predicateUnioningPredicate_withPredicate___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) bindBlock];
  (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, a2);
  uint64_t v5 = *(uint64_t (**)(void))([*(id *)(a1 + 40) bindBlock] + 16);
  return v5();
}

- (id)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
}

- (void)setIsNullPredicate:(BOOL)a3
{
  self->_isNullPredicate = a3;
}

@end