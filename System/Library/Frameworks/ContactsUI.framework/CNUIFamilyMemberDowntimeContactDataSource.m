@interface CNUIFamilyMemberDowntimeContactDataSource
+ (BOOL)isErrorPossiblyRelatedToExtraStores:(id)a3;
- (BOOL)isShowingFamilyMemberContacts;
- (BOOL)meContactNeedsUpdate;
- (CNContact)meContact;
- (CNContactStore)store;
- (CNUIFamilyMemberDowntimeContactDataSource)initWithStore:(id)a3 familyMembers:(id)a4 requiredKeys:(id)a5;
- (NSArray)familyMembers;
- (NSArray)filteredSections;
- (NSArray)requiredKeys;
- (NSArray)sections;
- (NSMutableArray)selectedContactItems;
- (NSString)filterString;
- (id)completeContactFromContact:(id)a3 fromMainStoreOnly:(BOOL)a4 keysToFetch:(id)a5;
- (id)contactItemForIndexPath:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)labelForFamilyMember:(id)a3;
- (id)preferredForNameMeContactIdentifier;
- (id)preferredForNameMeContactWithKeysToFetch:(id)a3;
- (id)selectedContacts;
- (id)titleForSection:(int64_t)a3;
- (int64_t)numberOfRowsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
- (int64_t)sortOrder;
- (void)_loadAllContactsIfNeeded;
- (void)filterSectionsForString:(id)a3;
- (void)postProcessForFamilyMembersWithContacts:(id)a3;
- (void)setContactItemSelected:(BOOL)a3 forIndexPath:(id)a4;
- (void)setFamilyMembers:(id)a3;
- (void)setFilterString:(id)a3;
- (void)setFilteredSections:(id)a3;
- (void)setIsShowingFamilyMemberContacts:(BOOL)a3;
- (void)setMeContact:(id)a3;
- (void)setMeContactNeedsUpdate:(BOOL)a3;
- (void)setSections:(id)a3;
- (void)setSelectedContactItems:(id)a3;
- (void)setStore:(id)a3;
@end

@implementation CNUIFamilyMemberDowntimeContactDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredKeys, 0);
  objc_storeStrong((id *)&self->_selectedContactItems, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_filteredSections, 0);
  objc_storeStrong((id *)&self->_familyMembers, 0);
  objc_storeStrong((id *)&self->_meContact, 0);
  objc_storeStrong((id *)&self->_store, 0);

  objc_storeStrong((id *)&self->_filterString, 0);
}

- (NSArray)requiredKeys
{
  return self->_requiredKeys;
}

- (void)setSelectedContactItems:(id)a3
{
}

- (NSMutableArray)selectedContactItems
{
  return self->_selectedContactItems;
}

- (void)setSections:(id)a3
{
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setFilteredSections:(id)a3
{
}

- (NSArray)filteredSections
{
  return self->_filteredSections;
}

- (void)setFamilyMembers:(id)a3
{
}

- (NSArray)familyMembers
{
  return self->_familyMembers;
}

- (void)setMeContact:(id)a3
{
}

- (CNContact)meContact
{
  return self->_meContact;
}

- (void)setMeContactNeedsUpdate:(BOOL)a3
{
  self->_meContactNeedsUpdate = a3;
}

- (BOOL)meContactNeedsUpdate
{
  return self->_meContactNeedsUpdate;
}

- (void)setStore:(id)a3
{
}

- (CNContactStore)store
{
  return self->_store;
}

- (void)setIsShowingFamilyMemberContacts:(BOOL)a3
{
  self->_isShowingFamilyMemberContacts = a3;
}

- (BOOL)isShowingFamilyMemberContacts
{
  return self->_isShowingFamilyMemberContacts;
}

- (NSString)filterString
{
  return self->_filterString;
}

- (id)preferredForNameMeContactWithKeysToFetch:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if ([(CNUIFamilyMemberDowntimeContactDataSource *)v5 meContactNeedsUpdate]
    || ([(CNUIFamilyMemberDowntimeContactDataSource *)v5 meContact],
        (v6 = objc_claimAutoreleasedReturnValue()) != 0)
    && ([(CNUIFamilyMemberDowntimeContactDataSource *)v5 meContact],
        v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v7 areKeysAvailable:v4],
        v7,
        v6,
        (v8 & 1) == 0))
  {
    v9 = [MEMORY[0x1E4F1CA48] array];
    v10 = v9;
    if (v4) {
      [v9 addObjectsFromArray:v4];
    }
    v11 = [(CNUIFamilyMemberDowntimeContactDataSource *)v5 meContact];

    if (v11)
    {
      v12 = [(CNUIFamilyMemberDowntimeContactDataSource *)v5 meContact];
      v13 = [v12 availableKeyDescriptor];
      [v10 addObject:v13];
    }
    v14 = (void *)[objc_alloc(MEMORY[0x1E4F1B908]) initWithKeysToFetch:v10];
    v15 = [MEMORY[0x1E4F1B8F8] predicateForMeContact];
    [v14 setPredicate:v15];

    [v14 setUnifyResults:0];
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__4180;
    v31 = __Block_byref_object_dispose__4181;
    id v32 = 0;
    v16 = [(CNUIFamilyMemberDowntimeContactDataSource *)v5 store];
    v25[4] = &v27;
    id v26 = 0;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __86__CNUIFamilyMemberDowntimeContactDataSource_preferredForNameMeContactWithKeysToFetch___block_invoke;
    v25[3] = &unk_1E549B878;
    char v17 = [v16 enumerateNonUnifiedContactsWithFetchRequest:v14 error:&v26 usingBlock:v25];
    id v18 = v26;

    if (v17)
    {
      [(CNUIFamilyMemberDowntimeContactDataSource *)v5 setMeContactNeedsUpdate:0];
      [(CNUIFamilyMemberDowntimeContactDataSource *)v5 setMeContact:v28[5]];
    }
    else
    {
      _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNUIFamilyMemberDowntimeContactDataSource.m", 335, 3, @"Error fetching the me card: %@", v19, v20, v21, v22, (uint64_t)v18);
    }

    _Block_object_dispose(&v27, 8);
  }
  v23 = [(CNUIFamilyMemberDowntimeContactDataSource *)v5 meContact];
  objc_sync_exit(v5);

  return v23;
}

void __86__CNUIFamilyMemberDowntimeContactDataSource_preferredForNameMeContactWithKeysToFetch___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  *a3 = 1;
}

- (id)preferredForNameMeContactIdentifier
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v7[0] = *MEMORY[0x1E4F1AE08];
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  id v4 = [(CNUIFamilyMemberDowntimeContactDataSource *)self preferredForNameMeContactWithKeysToFetch:v3];
  v5 = [v4 identifier];

  return v5;
}

- (id)completeContactFromContact:(id)a3 fromMainStoreOnly:(BOOL)a4 keysToFetch:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if ([v8 isUnknown] && (objc_msgSend(v8, "isSuggestedMe") & 1) == 0)
  {
    id v23 = v8;
  }
  else
  {
    v10 = [v8 identifier];
    v11 = [(CNUIFamilyMemberDowntimeContactDataSource *)self preferredForNameMeContactIdentifier];
    char v12 = [v10 isEqual:v11];

    uint64_t v44 = 0;
    v45 = &v44;
    uint64_t v46 = 0x3032000000;
    v47 = __Block_byref_object_copy__4180;
    v48 = __Block_byref_object_dispose__4181;
    id v49 = 0;
    uint64_t v38 = 0;
    v39 = &v38;
    uint64_t v40 = 0x3032000000;
    v41 = __Block_byref_object_copy__4180;
    v42 = __Block_byref_object_dispose__4181;
    id v43 = 0;
    uint64_t v34 = 0;
    v35 = &v34;
    uint64_t v36 = 0x2020000000;
    char v37 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __102__CNUIFamilyMemberDowntimeContactDataSource_completeContactFromContact_fromMainStoreOnly_keysToFetch___block_invoke;
    aBlock[3] = &unk_1E549AA70;
    id v27 = v9;
    char v33 = v12;
    id v13 = v10;
    id v28 = v13;
    uint64_t v29 = self;
    v30 = &v34;
    v31 = &v38;
    id v32 = &v44;
    v14 = (void (**)(void *, BOOL))_Block_copy(aBlock);
    v14[2](v14, v6);
    if (!*((unsigned char *)v35 + 24))
    {
      _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNUIFamilyMemberDowntimeContactDataSource.m", 295, 3, @"Error completing contact: %@", v15, v16, v17, v18, v39[5]);
      if ([(id)objc_opt_class() isErrorPossiblyRelatedToExtraStores:v39[5]])
      {
        _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNUIFamilyMemberDowntimeContactDataSource.m", 297, 3, @"Will re-fetch from main store", v19, v20, v21, v22, v25);
        v14[2](v14, 1);
      }
    }
    id v23 = (id)v45[5];

    _Block_object_dispose(&v34, 8);
    _Block_object_dispose(&v38, 8);

    _Block_object_dispose(&v44, 8);
  }

  return v23;
}

void __102__CNUIFamilyMemberDowntimeContactDataSource_completeContactFromContact_fromMainStoreOnly_keysToFetch___block_invoke(uint64_t a1, uint64_t a2)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1B908]) initWithKeysToFetch:*(void *)(a1 + 32)];
  v5 = (void *)MEMORY[0x1E4F1B8F8];
  if (*(unsigned char *)(a1 + 80))
  {
    BOOL v6 = [MEMORY[0x1E4F1B8F8] predicateForMeContact];
    [v4 setPredicate:v6];
  }
  else
  {
    v19[0] = *(void *)(a1 + 40);
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    id v8 = [v5 predicateForContactsWithIdentifiers:v7];
    [v4 setPredicate:v8];
  }
  [v4 setUnifyResults:0];
  [v4 setOnlyMainStore:a2];
  id v9 = [*(id *)(a1 + 48) store];
  uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8);
  v11 = *(void **)(v10 + 40);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __102__CNUIFamilyMemberDowntimeContactDataSource_completeContactFromContact_fromMainStoreOnly_keysToFetch___block_invoke_2;
  v17[3] = &unk_1E549B878;
  v17[4] = *(void *)(a1 + 72);
  id obj = v11;
  char v12 = [v9 enumerateContactsWithFetchRequest:v4 error:&obj usingBlock:v17];
  objc_storeStrong((id *)(v10 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v12;

  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNUIFamilyMemberDowntimeContactDataSource.m", 289, 3, @"Error completing contact: %@", v13, v14, v15, v16, *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40));
  }
}

void __102__CNUIFamilyMemberDowntimeContactDataSource_completeContactFromContact_fromMainStoreOnly_keysToFetch___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v16 = a2;
  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v12 = *(void *)(v10 + 40);
  v11 = (id *)(v10 + 40);
  if (v12)
  {
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNUIFamilyMemberDowntimeContactDataSource.m", 282, 3, @"Error: got more than one contact instead of a unified one", v6, v7, v8, v9, v15);
    uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = 0;

    *a3 = 1;
  }
  else
  {
    objc_storeStrong(v11, a2);
  }
}

- (id)labelForFamilyMember:(id)a3
{
  id v3 = a3;
  if ([v3 isMe])
  {
    id v4 = CNContactsUIBundle();
    v5 = v4;
    uint64_t v6 = @"DOWNTIME_PICKER_CONTACT_LABEL_ME";
LABEL_5:
    uint64_t v7 = [v4 localizedStringForKey:v6 value:&stru_1ED8AC728 table:@"Localized"];

    goto LABEL_7;
  }
  if ([v3 isParent])
  {
    id v4 = CNContactsUIBundle();
    v5 = v4;
    uint64_t v6 = @"DOWNTIME_PICKER_CONTACT_LABEL_PARENT";
    goto LABEL_5;
  }
  uint64_t v7 = 0;
LABEL_7:

  return v7;
}

- (void)postProcessForFamilyMembersWithContacts:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v30 = a3;
  v31 = (void *)[v30 mutableCopy];
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x3032000000;
  uint64_t v44 = __Block_byref_object_copy__4180;
  v45 = __Block_byref_object_dispose__4181;
  id v46 = [MEMORY[0x1E4F1CA48] array];
  id v3 = [MEMORY[0x1E4F28E60] indexSet];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __85__CNUIFamilyMemberDowntimeContactDataSource_postProcessForFamilyMembersWithContacts___block_invoke;
  v38[3] = &unk_1E5496EB0;
  v38[4] = self;
  uint64_t v40 = &v41;
  id v4 = v3;
  id v39 = v4;
  [v30 enumerateObjectsUsingBlock:v38];
  [v31 removeObjectsAtIndexes:v4];
  uint64_t v29 = v4;
  id v32 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
  if ([(id)v42[5] count])
  {
    v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v42[5], "count"));
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v6 = (id)v42[5];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v34 objects:v47 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v35 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          v11 = [v10 second];
          uint64_t v12 = [(CNUIFamilyMemberDowntimeContactDataSource *)self labelForFamilyMember:v11];

          uint64_t v13 = [CNUIFamilyMemberDowntimeContactItem alloc];
          uint64_t v14 = [v10 first];
          uint64_t v15 = [(CNUIFamilyMemberDowntimeContactItem *)v13 initWithContact:v14 label:v12];

          [v5 addObject:v15];
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v34 objects:v47 count:16];
      }
      while (v7);
    }

    id v16 = [CNUIFamilyMemberDowntimeContactSection alloc];
    uint64_t v17 = CNContactsUIBundle();
    uint64_t v18 = [v17 localizedStringForKey:@"DOWNTIME_PICKER_FAMILY_SECTION_TITLE" value:&stru_1ED8AC728 table:@"Localized"];
    uint64_t v19 = [(CNUIFamilyMemberDowntimeContactSection *)v16 initWithContactItems:v5 title:v18];
    [v32 addObject:v19];
  }
  uint64_t v20 = objc_msgSend(v31, "_cn_map:", &__block_literal_global_75_4207);
  BOOL v21 = [(CNUIFamilyMemberDowntimeContactDataSource *)self isShowingFamilyMemberContacts];
  uint64_t v22 = CNContactsUIBundle();
  id v23 = v22;
  if (v21) {
    v24 = @"DOWNTIME_PICKER_CONTACTS_SECTION_TITLE_MEMBER";
  }
  else {
    v24 = @"DOWNTIME_PICKER_CONTACTS_SECTION_TITLE_THIS_DEVICE";
  }
  uint64_t v25 = [v22 localizedStringForKey:v24 value:&stru_1ED8AC728 table:@"Localized"];

  id v26 = [[CNUIFamilyMemberDowntimeContactSection alloc] initWithContactItems:v20 title:v25];
  [v32 addObject:v26];

  id v27 = (NSArray *)[v32 copy];
  sections = self->_sections;
  self->_sections = v27;

  [(CNUIFamilyMemberDowntimeContactDataSource *)self filterSectionsForString:self->_filterString];
  _Block_object_dispose(&v41, 8);
}

void __85__CNUIFamilyMemberDowntimeContactDataSource_postProcessForFamilyMembersWithContacts___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = *(void **)(*(void *)(a1 + 32) + 40);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __85__CNUIFamilyMemberDowntimeContactDataSource_postProcessForFamilyMembersWithContacts___block_invoke_2;
  v10[3] = &unk_1E5496E88;
  id v11 = v5;
  long long v9 = *(_OWORD *)(a1 + 40);
  id v7 = (id)v9;
  long long v12 = v9;
  uint64_t v13 = a3;
  id v8 = v5;
  [v6 enumerateObjectsUsingBlock:v10];
}

CNUIFamilyMemberDowntimeContactItem *__85__CNUIFamilyMemberDowntimeContactDataSource_postProcessForFamilyMembersWithContacts___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[CNUIFamilyMemberDowntimeContactItem alloc] initWithContact:v2 label:0];

  return v3;
}

void __85__CNUIFamilyMemberDowntimeContactDataSource_postProcessForFamilyMembersWithContacts___block_invoke_2(uint64_t a1, void *a2)
{
  id v11 = a2;
  id v3 = [*(id *)(a1 + 32) givenName];
  id v4 = [v11 firstName];
  if ([v3 isEqualToString:v4])
  {
    id v5 = [*(id *)(a1 + 32) familyName];
    id v6 = [v11 lastName];
    int v7 = [v5 isEqualToString:v6];

    id v8 = v11;
    if (!v7) {
      goto LABEL_6;
    }
    long long v9 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    uint64_t v10 = [MEMORY[0x1E4F5A490] pairWithFirst:*(void *)(a1 + 32) second:v11];
    [v9 addObject:v10];

    [*(id *)(a1 + 40) addIndex:*(void *)(a1 + 56)];
  }
  else
  {
  }
  id v8 = v11;
LABEL_6:
}

- (void)_loadAllContactsIfNeeded
{
  if (!self->_sections)
  {
    id v3 = (void *)[objc_alloc(MEMORY[0x1E4F1B908]) initWithKeysToFetch:self->_requiredKeys];
    [v3 setUnifyResults:0];
    objc_msgSend(v3, "setSortOrder:", -[CNUIFamilyMemberDowntimeContactDataSource sortOrder](self, "sortOrder"));
    id v4 = [MEMORY[0x1E4F1CA48] array];
    id v5 = [(CNUIFamilyMemberDowntimeContactDataSource *)self store];
    id v15 = 0;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __69__CNUIFamilyMemberDowntimeContactDataSource__loadAllContactsIfNeeded__block_invoke;
    v13[3] = &unk_1E549A990;
    id v6 = v4;
    id v14 = v6;
    int v7 = [v5 enumerateContactsAndMatchInfoWithFetchRequest:v3 error:&v15 usingBlock:v13];
    id v8 = v15;

    if (v7)
    {
      if (v8) {
        _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNUIFamilyMemberDowntimeContactDataSource.m", 203, 4, @"Non fatal error during contacts fetching: %@", v9, v10, v11, v12, (uint64_t)v8);
      }
      [(CNUIFamilyMemberDowntimeContactDataSource *)self postProcessForFamilyMembersWithContacts:v6];
    }
    else
    {
      _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNUIFamilyMemberDowntimeContactDataSource.m", 207, 3, @"Error fetching contacts: %@", v9, v10, v11, v12, (uint64_t)v8);
    }
  }
}

uint64_t __69__CNUIFamilyMemberDowntimeContactDataSource__loadAllContactsIfNeeded__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (void)filterSectionsForString:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 localizedLowercaseString];
  id v6 = [v5 componentsSeparatedByString:@" "];
  int v7 = objc_msgSend(v6, "_cn_filter:", &__block_literal_global_47);

  if (((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A298] + 16))() & 1) != 0 || ![v7 count])
  {
    objc_storeStrong((id *)&self->_filteredSections, self->_sections);
  }
  else
  {
    id v8 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    BOOL v21 = self;
    id obj = self->_sections;
    uint64_t v9 = [(NSArray *)obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v26 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          id v14 = objc_msgSend(v13, "contactItems", v21);
          v23[0] = MEMORY[0x1E4F143A8];
          v23[1] = 3221225472;
          v23[2] = __69__CNUIFamilyMemberDowntimeContactDataSource_filterSectionsForString___block_invoke_2;
          v23[3] = &unk_1E5496E60;
          id v24 = v7;
          id v15 = objc_msgSend(v14, "_cn_filter:", v23);

          id v16 = [CNUIFamilyMemberDowntimeContactSection alloc];
          uint64_t v17 = [v13 title];
          uint64_t v18 = [(CNUIFamilyMemberDowntimeContactSection *)v16 initWithContactItems:v15 title:v17];

          [v8 addObject:v18];
        }
        uint64_t v10 = [(NSArray *)obj countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v10);
    }

    uint64_t v19 = [v8 copy];
    filteredSections = v21->_filteredSections;
    v21->_filteredSections = (NSArray *)v19;
  }
}

uint64_t __69__CNUIFamilyMemberDowntimeContactDataSource_filterSectionsForString___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__CNUIFamilyMemberDowntimeContactDataSource_filterSectionsForString___block_invoke_3;
  v8[3] = &unk_1E549A598;
  id v9 = v3;
  id v5 = v3;
  uint64_t v6 = objc_msgSend(v4, "_cn_any:", v8);

  return v6;
}

uint64_t __69__CNUIFamilyMemberDowntimeContactDataSource_filterSectionsForString___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) contact];
  id v5 = [v4 givenName];
  uint64_t v6 = [v5 localizedLowercaseString];
  if ([v6 hasPrefix:v3])
  {
    uint64_t v7 = 1;
  }
  else
  {
    id v8 = [*(id *)(a1 + 32) contact];
    id v9 = [v8 familyName];
    uint64_t v10 = [v9 localizedLowercaseString];
    uint64_t v7 = [v10 hasPrefix:v3];
  }
  return v7;
}

uint64_t __69__CNUIFamilyMemberDowntimeContactDataSource_filterSectionsForString___block_invoke()
{
  return (*(unsigned int (**)(void))(*MEMORY[0x1E4F5A298] + 16))() ^ 1;
}

- (void)setFilterString:(id)a3
{
  id v6 = a3;
  if (!-[NSString isEqualToString:](self->_filterString, "isEqualToString:"))
  {
    id v4 = (NSString *)[v6 copy];
    filterString = self->_filterString;
    self->_filterString = v4;

    [(CNUIFamilyMemberDowntimeContactDataSource *)self filterSectionsForString:v6];
  }
}

- (void)setContactItemSelected:(BOOL)a3 forIndexPath:(id)a4
{
  BOOL v4 = a3;
  id v8 = [(CNUIFamilyMemberDowntimeContactDataSource *)self contactItemForIndexPath:a4];
  [v8 setSelected:v4];
  id v6 = [(CNUIFamilyMemberDowntimeContactDataSource *)self selectedContactItems];
  uint64_t v7 = v6;
  if (v4) {
    objc_msgSend(v6, "_cn_addNonNilObjectIfNotPresent:", v8);
  }
  else {
    [v6 removeObject:v8];
  }
}

- (id)selectedContacts
{
  id v2 = [(CNUIFamilyMemberDowntimeContactDataSource *)self selectedContactItems];
  id v3 = objc_msgSend(v2, "_cn_map:", &__block_literal_global_4223);

  return v3;
}

uint64_t __61__CNUIFamilyMemberDowntimeContactDataSource_selectedContacts__block_invoke(uint64_t a1, void *a2)
{
  return [a2 contact];
}

- (id)contactItemForIndexPath:(id)a3
{
  id v4 = a3;
  [(CNUIFamilyMemberDowntimeContactDataSource *)self _loadAllContactsIfNeeded];
  id v5 = -[NSArray objectAtIndexedSubscript:](self->_filteredSections, "objectAtIndexedSubscript:", [v4 section]);
  id v6 = [v5 contactItems];
  uint64_t v7 = [v4 row];

  id v8 = [v6 objectAtIndexedSubscript:v7];

  return v8;
}

- (int64_t)numberOfRowsInSection:(int64_t)a3
{
  [(CNUIFamilyMemberDowntimeContactDataSource *)self _loadAllContactsIfNeeded];
  id v5 = [(NSArray *)self->_filteredSections objectAtIndexedSubscript:a3];
  id v6 = [v5 contactItems];
  int64_t v7 = [v6 count];

  return v7;
}

- (int64_t)numberOfSections
{
  [(CNUIFamilyMemberDowntimeContactDataSource *)self _loadAllContactsIfNeeded];
  filteredSections = self->_filteredSections;

  return [(NSArray *)filteredSections count];
}

- (id)titleForSection:(int64_t)a3
{
  id v3 = [(NSArray *)self->_filteredSections objectAtIndexedSubscript:a3];
  id v4 = [v3 title];

  return v4;
}

- (int64_t)sortOrder
{
  id v2 = [MEMORY[0x1E4F1B9A8] sharedDefaults];
  int64_t v3 = [v2 sortOrder];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [CNUIFamilyMemberDowntimeContactDataSource alloc];
  store = self->_store;
  familyMembers = self->_familyMembers;
  requiredKeys = self->_requiredKeys;

  return [(CNUIFamilyMemberDowntimeContactDataSource *)v4 initWithStore:store familyMembers:familyMembers requiredKeys:requiredKeys];
}

- (CNUIFamilyMemberDowntimeContactDataSource)initWithStore:(id)a3 familyMembers:(id)a4 requiredKeys:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)CNUIFamilyMemberDowntimeContactDataSource;
  uint64_t v12 = [(CNUIFamilyMemberDowntimeContactDataSource *)&v18 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_store, a3);
    objc_storeStrong((id *)&v13->_familyMembers, a4);
    objc_storeStrong((id *)&v13->_requiredKeys, a5);
    uint64_t v14 = [MEMORY[0x1E4F1CA48] array];
    selectedContactItems = v13->_selectedContactItems;
    v13->_selectedContactItems = (NSMutableArray *)v14;

    id v16 = v13;
  }

  return v13;
}

+ (BOOL)isErrorPossiblyRelatedToExtraStores:(id)a3
{
  id v3 = a3;
  uint64_t v4 = *MEMORY[0x1E4F281F8];
  if (([MEMORY[0x1E4F5A3F0] isError:v3 errorWithDomain:*MEMORY[0x1E4F281F8] code:4099] & 1) != 0
    || ([MEMORY[0x1E4F5A3F0] isError:v3 errorWithDomain:v4 code:4097] & 1) != 0)
  {
    char v5 = 1;
  }
  else
  {
    char v5 = [MEMORY[0x1E4F5A3F0] isError:v3 errorWithDomain:v4 code:4101];
  }

  return v5;
}

@end