@interface CLSSocialServiceContacts
+ (BOOL)canAccessContactsStore;
+ (id)defaultKeysToFetch;
- (CLSSocialServiceContacts)initWithLocationCache:(id)a3;
- (CLSSocialServiceContactsDelegate)delegate;
- (NSMutableDictionary)personByFullName;
- (NSMutableDictionary)personByHandle;
- (NSMutableSet)nonFoundFullNames;
- (NSMutableSet)nonFoundHandles;
- (float)_confidenceInPersonRecord:(id)a3 viewPerson:(id)a4 forName:(id)a5 components:(id)a6;
- (float)_fuzzyMatchingScoreBetweenNameComponents:(id)a3 andNameComponents:(id)a4;
- (id)__newPersonWithContact:(id)a3 viewPerson:(id)a4;
- (id)_allPersons;
- (id)_cnPostalAddressForGDLocationAddress:(id)a3;
- (id)_firstNameForPersonRecord:(id)a3;
- (id)_fullNameWithContact:(id)a3;
- (id)_initializeVisualIdentifierView;
- (id)_lastNameForPersonRecord:(id)a3;
- (id)_maidenNameForPersonRecord:(id)a3;
- (id)_nicknameForPersonRecord:(id)a3;
- (id)_personResultsForPersonLocalIdentifier:(id)a3 isLackingFaces:(BOOL *)a4 inPhotoLibrary:(id)a5;
- (id)_personResultsForfullName:(id)a3;
- (id)_personWithContact:(id)a3 viewPerson:(id)a4 createPersonIfNeeded:(BOOL)a5;
- (id)_personWithContactIdentifier:(id)a3;
- (id)_personsMatchingPredicate:(id)a3;
- (id)contactsByIdentifierForIdentifiers:(id)a3;
- (id)contactsForIdentifiers:(id)a3;
- (id)fetchMeCardFromContactStore:(id)a3;
- (id)inferredDeviceOwnerForPhotoLibrary:(id)a3 ignoreContactLinking:(BOOL)a4;
- (id)matchingDictionaryForContactIdentifier:(id)a3;
- (id)mePerson;
- (id)personForIdentifier:(id)a3;
- (id)personForPersonHandle:(id)a3;
- (id)personLocalIdentifierMatchingContactPictureForContactIdentifier:(id)a3;
- (id)personResultsForName:(id)a3 inPhotoLibrary:(id)a4;
- (id)personsInContactStoreForContactIdentifiers:(id)a3 needsRefetching:(BOOL)a4 progressBlock:(id)a5;
- (id)potentialBirthdayDateForCNIdentifier:(id)a3 fullName:(id)a4;
- (id)suggestionsService;
- (id)visionCacheStorageDirectoryURLForPhotoLibrary:(id)a3;
- (unint64_t)_ageCategoryFromFaceAgeType:(unsigned __int16)a3;
- (unint64_t)_relationshipForContact:(id)a3;
- (unint64_t)_relationshipForLabel:(id)a3;
- (unint64_t)_sexFromFaceBiologicalSex:(unsigned __int16)a3;
- (void)_addAddressesToPerson:(id)a3 withContact:(id)a4;
- (void)_addDelegateAddressesToPerson:(id)a3 ofType:(unint64_t)a4;
- (void)_addMissingPropertiesToPerson:(id)a3 withViewPerson:(id)a4;
- (void)enumerateAllPersonsUsingBlock:(id)a3;
- (void)enumeratePersonsAndPotentialBirthdayDateForContactIdentifiers:(id)a3 usingBlock:(id)a4;
- (void)enumeratePersonsAndRelationshipUsingBlock:(id)a3;
- (void)enumeratePersonsForFullName:(id)a3 usingBlock:(id)a4;
- (void)enumeratePersonsForIdentifiers:(id)a3 usingBlock:(id)a4;
- (void)invalidateCacheForPersonInContactStoreWithContactIdentifiers:(id)a3;
- (void)invalidateCacheForPersonWithContactIdentifiers:(id)a3;
- (void)invalidateCacheForPersonWithLocalIdentifiers:(id)a3;
- (void)invalidateMePerson;
- (void)invalidateMemoryCaches;
- (void)refreshMeContactIfNeeded;
- (void)setDelegate:(id)a3;
- (void)setNonFoundFullNames:(id)a3;
- (void)setNonFoundHandles:(id)a3;
- (void)setPersonByFullName:(id)a3;
- (void)setPersonByHandle:(id)a3;
@end

@implementation CLSSocialServiceContacts

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonFoundHandles, 0);
  objc_storeStrong((id *)&self->_personByHandle, 0);
  objc_storeStrong((id *)&self->_nonFoundFullNames, 0);
  objc_storeStrong((id *)&self->_personByFullName, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_suggestionsService, 0);
  objc_storeStrong((id *)&self->_personsForLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_personsForGDIdentifiers, 0);
  objc_storeStrong((id *)&self->_personsInContactStoreForCNIdentifiers, 0);
  objc_storeStrong((id *)&self->_personsForCNIdentifiers, 0);
  objc_storeStrong((id *)&self->_allPersons, 0);
  objc_storeStrong((id *)&self->_meViewPerson, 0);
  objc_storeStrong((id *)&self->_mePerson, 0);
  objc_storeStrong((id *)&self->_visualIdentifierView, 0);
  objc_storeStrong((id *)&self->_meContact, 0);
  objc_storeStrong((id *)&self->_locationCache, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)setNonFoundHandles:(id)a3
{
}

- (NSMutableSet)nonFoundHandles
{
  return self->_nonFoundHandles;
}

- (void)setPersonByHandle:(id)a3
{
}

- (NSMutableDictionary)personByHandle
{
  return self->_personByHandle;
}

- (void)setNonFoundFullNames:(id)a3
{
}

- (NSMutableSet)nonFoundFullNames
{
  return self->_nonFoundFullNames;
}

- (void)setPersonByFullName:(id)a3
{
}

- (NSMutableDictionary)personByFullName
{
  return self->_personByFullName;
}

- (void)setDelegate:(id)a3
{
}

- (CLSSocialServiceContactsDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CLSSocialServiceContactsDelegate *)WeakRetained;
}

- (float)_confidenceInPersonRecord:(id)a3 viewPerson:(id)a4 forName:(id)a5 components:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  if (!v13)
  {
    id v13 = [v12 clsBetterComponentsSeparatedByCharactersInSet:v14];
  }
  v15 = [(CLSSocialServiceContacts *)self _fullNameWithContact:v10];
  v16 = [v15 stringByTrimmingCharactersInSet:v14];

  v17 = [v11 names];
  v18 = [v17 firstObject];
  v19 = [v18 stringByTrimmingCharactersInSet:v14];

  if ((!v16 || [v16 compare:v12]) && (!v19 || objc_msgSend(v19, "compare:", v12)))
  {
    v62 = v19;
    v65 = [v11 nameComponents];
    v20 = [(CLSSocialServiceContacts *)self _firstNameForPersonRecord:v10];
    v21 = v20;
    id v61 = v11;
    if (v20)
    {
      id v22 = v20;
    }
    else
    {
      v24 = [v11 nameComponents];
      v25 = [v24 givenNames];
      id v22 = [v25 firstObject];
    }
    v26 = [v22 stringByTrimmingCharactersInSet:v14];

    v27 = [(CLSSocialServiceContacts *)self _lastNameForPersonRecord:v10];
    v28 = v27;
    if (v27)
    {
      id v29 = v27;
    }
    else
    {
      v30 = [v65 familyNames];
      id v29 = [v30 firstObject];
    }
    v31 = [v29 stringByTrimmingCharactersInSet:v14];

    v32 = [(CLSSocialServiceContacts *)self _nicknameForPersonRecord:v10];
    v33 = v32;
    if (v32)
    {
      id v34 = v32;
    }
    else
    {
      [v65 nicknames];
      v63 = self;
      id v35 = v10;
      id v36 = v13;
      v37 = v16;
      id v38 = v12;
      v39 = v26;
      v41 = v40 = v31;
      id v34 = [v41 firstObject];

      v31 = v40;
      v26 = v39;
      id v12 = v38;
      v16 = v37;
      id v13 = v36;
      id v10 = v35;
      self = v63;
    }

    v42 = [v34 stringByTrimmingCharactersInSet:v14];

    v43 = [(CLSSocialServiceContacts *)self _maidenNameForPersonRecord:v10];
    v64 = [v43 stringByTrimmingCharactersInSet:v14];

    if ([v13 count] == 1 && v26)
    {
      v44 = v64;
      if (![v12 compare:v26 options:129]
        || ![v12 compare:v31 options:129]
        || ![v12 compare:v42 options:129]
        || (float v23 = 0.0, ![v12 compare:v64 options:129]))
      {
        float v23 = 0.5;
      }
      goto LABEL_42;
    }
    v58 = v42;
    v60 = v31;
    id v45 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (v26)
    {
      v46 = [v26 clsBetterComponentsSeparatedByCharactersInSet:v14];
      [v45 addObjectsFromArray:v46];
    }
    if (v31)
    {
      v47 = [v31 clsBetterComponentsSeparatedByCharactersInSet:v14];
      [v45 addObjectsFromArray:v47];
    }
    float v23 = 0.0;
    if (!objc_msgSend(v45, "count", v58))
    {
      if (v16)
      {
        v48 = [v16 clsBetterComponentsSeparatedByCharactersInSet:v14];
        [(CLSSocialServiceContacts *)self _fuzzyMatchingScoreBetweenNameComponents:v13 andNameComponents:v48];
        float v23 = v49;
      }
      if (v62)
      {
        v50 = [v62 clsBetterComponentsSeparatedByCharactersInSet:v14];
        [(CLSSocialServiceContacts *)self _fuzzyMatchingScoreBetweenNameComponents:v13 andNameComponents:v50];
        if (v51 > v23) {
          float v23 = v51;
        }
      }
    }
    if (v26)
    {
      v44 = v64;
      if (!v64)
      {
LABEL_41:

        v42 = v59;
        v31 = v60;
LABEL_42:

        id v11 = v61;
        v19 = v62;
        goto LABEL_43;
      }
      id v52 = objc_alloc(MEMORY[0x1E4F1CA48]);
      v53 = [v26 clsBetterComponentsSeparatedByCharactersInSet:v14];
      v54 = (void *)[v52 initWithArray:v53];

      v55 = [v64 clsBetterComponentsSeparatedByCharactersInSet:v14];
      [v54 addObjectsFromArray:v55];

      [(CLSSocialServiceContacts *)self _fuzzyMatchingScoreBetweenNameComponents:v13 andNameComponents:v54];
      if (v56 > v23) {
        float v23 = v56;
      }
    }
    v44 = v64;
    goto LABEL_41;
  }
  float v23 = 1.0;
LABEL_43:

  return v23;
}

- (float)_fuzzyMatchingScoreBetweenNameComponents:(id)a3 andNameComponents:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unint64_t v7 = [v5 count];
  unint64_t v8 = [v6 count];
  BOOL v9 = v7 >= v8;
  if (v7 >= v8) {
    id v10 = v6;
  }
  else {
    id v10 = v5;
  }
  uint64_t v29 = 0;
  v30 = (float *)&v29;
  if (!v9) {
    id v5 = v6;
  }
  uint64_t v31 = 0x2020000000;
  int v32 = 0;
  id v11 = (void *)[v5 mutableCopy];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __87__CLSSocialServiceContacts__fuzzyMatchingScoreBetweenNameComponents_andNameComponents___block_invoke;
  v25[3] = &unk_1E6910090;
  id v12 = v11;
  v27 = &v29;
  uint64_t v28 = 129;
  id v26 = v12;
  [v10 enumerateObjectsUsingBlock:v25];
  if ([v12 count])
  {
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    v20 = __87__CLSSocialServiceContacts__fuzzyMatchingScoreBetweenNameComponents_andNameComponents___block_invoke_2;
    v21 = &unk_1E6910090;
    uint64_t v24 = 129;
    id v22 = v12;
    float v23 = &v29;
    [v10 enumerateObjectsUsingBlock:&v18];
  }
  float v13 = v30[6];
  unint64_t v14 = objc_msgSend(v10, "count", v18, v19, v20, v21);
  unint64_t v15 = [v12 count];
  float v16 = (float)(v13 / (float)v14)
      * (float)(1.0 - (float)((float)v15 / (float)(unint64_t)[v5 count]));

  _Block_object_dispose(&v29, 8);
  return v16;
}

void __87__CLSSocialServiceContacts__fuzzyMatchingScoreBetweenNameComponents_andNameComponents___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if ([*(id *)(a1 + 32) count])
  {
    uint64_t v3 = 0;
    while (1)
    {
      v4 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v3];
      uint64_t v5 = [v6 compare:v4 options:*(void *)(a1 + 48)];

      if (!v5) {
        break;
      }
      if (++v3 >= (unint64_t)[*(id *)(a1 + 32) count]) {
        goto LABEL_7;
      }
    }
    [*(id *)(a1 + 32) removeObjectAtIndex:v3];
    *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(float *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 24)
                                                               + 1.0;
  }
LABEL_7:
}

void __87__CLSSocialServiceContacts__fuzzyMatchingScoreBetweenNameComponents_andNameComponents___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([*(id *)(a1 + 32) count])
  {
    uint64_t v3 = 0;
    while (1)
    {
      v4 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v3];
      if (![v5 rangeOfString:v4 options:*(void *)(a1 + 48)]
        || ![v4 rangeOfString:v5 options:*(void *)(a1 + 48)])
      {
        break;
      }

      if (++v3 >= (unint64_t)[*(id *)(a1 + 32) count]) {
        goto LABEL_8;
      }
    }
    [*(id *)(a1 + 32) removeObjectAtIndex:v3];
    *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(float *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 24)
                                                               + 0.5;
  }
LABEL_8:
}

- (id)potentialBirthdayDateForCNIdentifier:(id)a3 fullName:(id)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(CLSSocialServiceContacts *)self suggestionsService];
  id v54 = 0;
  BOOL v9 = [v8 contactMatchesWithContactIdentifier:v6 limitTo:10 error:&v54];
  id v10 = v54;
  if (v10)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      id v11 = [v10 description];
      *(_DWORD *)buf = 138412290;
      v58 = v11;
      _os_log_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Error suggestionService contactMatchesWithContactIdentifier: %@", buf, 0xCu);
    }
  }
  else
  {
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v12 = v9;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v50 objects:v56 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      v39 = v9;
      v41 = v8;
      id v43 = v6;
      unint64_t v15 = 0;
      uint64_t v16 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v51 != v16) {
            objc_enumerationMutation(v12);
          }
          uint64_t v18 = [*(id *)(*((void *)&v50 + 1) + 8 * i) contact];
          uint64_t v19 = [v18 birthday];
          v20 = [v19 dateComponents];

          v21 = +[CLSCalendar dateFromComponents:v20 inTimeZone:0];
          id v22 = v21;
          if (v21)
          {
            id v23 = v21;

            unint64_t v15 = v23;
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v50 objects:v56 count:16];
      }
      while (v14);

      id v6 = v43;
      BOOL v9 = v39;
      unint64_t v8 = v41;
      if (v15)
      {
        id v10 = 0;
        goto LABEL_35;
      }
    }
    else
    {
    }
  }
  if ([v7 length])
  {

    id v49 = 0;
    uint64_t v24 = [v8 suggestContactMatchesWithFullTextSearch:v7 limitTo:10 error:&v49];
    id v10 = v49;
    if (v10)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        v25 = [v10 description];
        *(_DWORD *)buf = 138412290;
        v58 = v25;
        _os_log_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Error suggestionService suggestContactMatchesWithFullTextSearch: %@", buf, 0xCu);
      }
      unint64_t v15 = 0;
    }
    else
    {
      v40 = v9;
      v42 = v8;
      id v44 = v6;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id v38 = v24;
      id v26 = v24;
      uint64_t v27 = [v26 countByEnumeratingWithState:&v45 objects:v55 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        unint64_t v15 = 0;
        uint64_t v29 = *(void *)v46;
        do
        {
          for (uint64_t j = 0; j != v28; ++j)
          {
            if (*(void *)v46 != v29) {
              objc_enumerationMutation(v26);
            }
            uint64_t v31 = [*(id *)(*((void *)&v45 + 1) + 8 * j) contact];
            int v32 = [v31 birthday];
            v33 = [v32 dateComponents];

            id v34 = +[CLSCalendar dateFromComponents:v33 inTimeZone:0];
            id v35 = v34;
            if (v34)
            {
              id v36 = v34;

              unint64_t v15 = v36;
            }
          }
          uint64_t v28 = [v26 countByEnumeratingWithState:&v45 objects:v55 count:16];
        }
        while (v28);
      }
      else
      {
        unint64_t v15 = 0;
      }

      id v6 = v44;
      BOOL v9 = v40;
      unint64_t v8 = v42;
      uint64_t v24 = v38;
    }
  }
  else
  {
    unint64_t v15 = 0;
  }
LABEL_35:

  return v15;
}

- (void)enumeratePersonsAndPotentialBirthdayDateForContactIdentifiers:(id)a3 usingBlock:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void *, void *, unsigned char *))a4;
  v17 = [MEMORY[0x1E4F1CA60] dictionary];
  unsigned __int8 v22 = 0;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v14 = [(CLSSocialServiceContacts *)self potentialBirthdayDateForCNIdentifier:v13 fullName:0];
        if (v14)
        {
          [v17 setObject:v14 forKeyedSubscript:v13];
          unint64_t v15 = [(CLSSocialServiceContacts *)self personForIdentifier:v13];
          v7[2](v7, v15, v14, &v22);
          int v16 = v22;

          if (v16)
          {

            goto LABEL_12;
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_12:
}

- (id)suggestionsService
{
  suggestionsService = self->_suggestionsService;
  if (!suggestionsService)
  {
    v4 = [MEMORY[0x1E4F5DB70] serviceForContacts];
    id v5 = self->_suggestionsService;
    self->_suggestionsService = v4;

    [(SGSuggestionsServiceContactsProtocol *)self->_suggestionsService setSyncTimeout:30.0];
    suggestionsService = self->_suggestionsService;
  }
  return suggestionsService;
}

- (unint64_t)_ageCategoryFromFaceAgeType:(unsigned __int16)a3
{
  if (a3 > 5u) {
    return 0;
  }
  else {
    return qword_1D21C53D0[a3];
  }
}

- (unint64_t)_sexFromFaceBiologicalSex:(unsigned __int16)a3
{
  if (a3 > 2u) {
    return 0;
  }
  else {
    return qword_1D21C53B8[a3];
  }
}

- (void)invalidateCacheForPersonInContactStoreWithContactIdentifiers:(id)a3
{
  id v5 = a3;
  v4 = self->_personsInContactStoreForCNIdentifiers;
  objc_sync_enter(v4);
  [(NSMutableDictionary *)self->_personsInContactStoreForCNIdentifiers removeObjectsForKeys:v5];
  objc_sync_exit(v4);
}

- (void)invalidateCacheForPersonWithContactIdentifiers:(id)a3
{
  id v5 = a3;
  v4 = self->_personsForCNIdentifiers;
  objc_sync_enter(v4);
  [(NSMutableDictionary *)self->_personsForCNIdentifiers removeObjectsForKeys:v5];
  objc_sync_exit(v4);
}

- (void)invalidateCacheForPersonWithLocalIdentifiers:(id)a3
{
  id v5 = a3;
  v4 = self->_personsForLocalIdentifier;
  objc_sync_enter(v4);
  [(NSMutableDictionary *)self->_personsForLocalIdentifier removeObjectsForKeys:v5];
  objc_sync_exit(v4);
}

- (id)_personsMatchingPredicate:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  contactStore = self->_contactStore;
  id v6 = +[CLSSocialServiceContacts defaultKeysToFetch];
  id v27 = 0;
  id v7 = [(CNContactStore *)contactStore unifiedContactsMatchingPredicate:v4 keysToFetch:v6 error:&v27];
  id v8 = v27;

  if (v8)
  {
    uint64_t v9 = +[CLSLogging sharedLogging];
    uint64_t v10 = [v9 loggingConnection];

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v8;
      _os_log_error_impl(&dword_1D2150000, v10, OS_LOG_TYPE_ERROR, "Error fetching contact from predicate %@", buf, 0xCu);
    }
    uint64_t v11 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v10 = v7;
    uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      unsigned __int8 v22 = v7;
      uint64_t v14 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v24 != v14) {
            objc_enumerationMutation(v10);
          }
          int v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          visualIdentifierView = self->_visualIdentifierView;
          long long v18 = [v16 identifier];
          long long v19 = [(GDVisualIdentifierView *)visualIdentifierView personForIdentifier:v18];

          long long v20 = [(CLSSocialServiceContacts *)self _personWithContact:v16 viewPerson:v19 createPersonIfNeeded:1];
          [v11 addObject:v20];
        }
        uint64_t v13 = [v10 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v13);
      id v7 = v22;
      id v8 = 0;
    }
  }

  return v11;
}

- (void)enumeratePersonsForFullName:(id)a3 usingBlock:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void, uint8_t *))a4;
  if (v7 && ([(NSMutableSet *)self->_nonFoundFullNames containsObject:v6] & 1) == 0)
  {
    uint64_t v8 = [(NSMutableDictionary *)self->_personByFullName objectForKey:v6];
    if (v8)
    {
      id v9 = (id)v8;
      [(NSMutableDictionary *)self->_personByFullName setObject:v8 forKeyedSubscript:v6];
    }
    else
    {
      uint64_t v10 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingName:v6];
      id v9 = [(CLSSocialServiceContacts *)self _personsMatchingPredicate:v10];
      if (![v9 count])
      {
        unint64_t v15 = +[CLSLogging sharedLogging];
        int v16 = [v15 loggingConnection];

        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v23 = v6;
          _os_log_impl(&dword_1D2150000, v16, OS_LOG_TYPE_INFO, "Contact %@ not found in Contact DB@", buf, 0xCu);
        }

        [(NSMutableSet *)self->_nonFoundFullNames addObject:v6];
LABEL_16:

        goto LABEL_17;
      }
    }
    buf[0] = 0;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v9 = v9;
    uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
LABEL_9:
      uint64_t v14 = 0;
      while (1)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v9);
        }
        if (buf[0]) {
          break;
        }
        v7[2](v7, *(void *)(*((void *)&v17 + 1) + 8 * v14++), buf);
        if (v12 == v14)
        {
          uint64_t v12 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
          if (v12) {
            goto LABEL_9;
          }
          break;
        }
      }
    }

    goto LABEL_16;
  }
LABEL_17:
}

- (id)personForPersonHandle:(id)a3
{
  id v4 = a3;
  if (v4 && ([(NSMutableSet *)self->_nonFoundHandles containsObject:v4] & 1) == 0)
  {
    id v5 = [(NSMutableDictionary *)self->_personByHandle objectForKey:v4];
    if (!v5)
    {
      if ([v4 containsString:@"@"])
      {
        id v6 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingEmailAddress:v4];
      }
      else
      {
        id v7 = [MEMORY[0x1E4F1BA70] phoneNumberWithStringValue:v4];
        id v6 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingPhoneNumber:v7];
      }
      uint64_t v8 = [(CLSSocialServiceContacts *)self _personsMatchingPredicate:v6];
      if ([v8 count])
      {
        id v5 = [v8 firstObject];
        [(NSMutableDictionary *)self->_personByHandle setObject:v5 forKeyedSubscript:v4];
      }
      else
      {
        [(NSMutableSet *)self->_nonFoundHandles addObject:v4];
        id v5 = 0;
      }
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)personLocalIdentifierMatchingContactPictureForContactIdentifier:(id)a3
{
  v43[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CLSSocialServiceContacts *)self personForIdentifier:v4];
  if ([v5 hasContactProfilePicture])
  {
    v43[0] = *MEMORY[0x1E4F1AF98];
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:1];
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F1B908]) initWithKeysToFetch:v6];
    uint64_t v8 = (void *)MEMORY[0x1E4F1B8F8];
    id v42 = v4;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v42 count:1];
    uint64_t v10 = [v8 predicateForContactsWithIdentifiers:v9];
    [v7 setPredicate:v10];

    dispatch_group_t v11 = dispatch_group_create();
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v38 = 0x3032000000;
    v39 = __Block_byref_object_copy__5704;
    v40 = __Block_byref_object_dispose__5705;
    id v41 = 0;
    uint64_t v27 = 0;
    uint64_t v28 = &v27;
    uint64_t v29 = 0x3032000000;
    id v30 = __Block_byref_object_copy__5704;
    uint64_t v31 = __Block_byref_object_dispose__5705;
    id v32 = 0;
    contactStore = self->_contactStore;
    id v26 = 0;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __92__CLSSocialServiceContacts_personLocalIdentifierMatchingContactPictureForContactIdentifier___block_invoke;
    v21[3] = &unk_1E6910068;
    id v13 = v4;
    id v22 = v13;
    p_long long buf = &buf;
    uint64_t v14 = v11;
    id v23 = v14;
    long long v25 = &v27;
    [(CNContactStore *)contactStore enumerateContactsWithFetchRequest:v7 error:&v26 usingBlock:v21];
    id v15 = v26;
    if (v15)
    {
      int v16 = +[CLSLogging sharedLogging];
      long long v17 = [v16 loggingConnection];

      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v33 = 138412546;
        id v34 = v13;
        __int16 v35 = 2112;
        id v36 = v15;
        _os_log_error_impl(&dword_1D2150000, v17, OS_LOG_TYPE_ERROR, "Error while enumerating contacts for identifier %@: %@", v33, 0x16u);
      }
    }
    id v18 = (id)v28[5];

    _Block_object_dispose(&v27, 8);
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    long long v19 = +[CLSLogging sharedLogging];
    id v6 = [v19 loggingConnection];

    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v4;
      _os_log_impl(&dword_1D2150000, v6, OS_LOG_TYPE_INFO, "ContactImage: Contact %@ has no profile picture", (uint8_t *)&buf, 0xCu);
    }
    id v18 = 0;
  }

  return v18;
}

void __92__CLSSocialServiceContacts_personLocalIdentifierMatchingContactPictureForContactIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = (void *)MEMORY[0x1D2602300]();
  id v7 = [v5 thumbnailImageData];
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F1E050] imageWithData:v7];
    if (v8)
    {
      if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
      {
        uint64_t v9 = [MEMORY[0x1E4F74680] service];
        uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
        dispatch_group_t v11 = *(void **)(v10 + 40);
        *(void *)(v10 + 40) = v9;
      }
      id v12 = objc_alloc_init(MEMORY[0x1E4F74628]);
      [v12 setMaximumFaceCount:1];
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
      id v13 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      id v26 = v12;
      uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __92__CLSSocialServiceContacts_personLocalIdentifierMatchingContactPictureForContactIdentifier___block_invoke_236;
      v20[3] = &unk_1E6910040;
      id v21 = *(id *)(a1 + 32);
      id v22 = v12;
      uint64_t v24 = *(void *)(a1 + 56);
      uint64_t v25 = a3;
      id v23 = *(id *)(a1 + 40);
      id v15 = v12;
      [v13 performRequests:v14 onCIImage:v8 withOrientation:1 andIdentifier:0 completionHandler:v20];

      dispatch_group_wait(*(dispatch_group_t *)(a1 + 40), 0xFFFFFFFFFFFFFFFFLL);
    }
    else
    {
      id v18 = +[CLSLogging sharedLogging];
      id v15 = [v18 loggingConnection];

      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = *(void *)(a1 + 32);
        *(_DWORD *)long long buf = 138412290;
        uint64_t v28 = v19;
        _os_log_error_impl(&dword_1D2150000, v15, OS_LOG_TYPE_ERROR, "ContactImage: Cannot get CIImage from thumbnailImageData of contact %@", buf, 0xCu);
      }
    }
  }
  else
  {
    int v16 = +[CLSLogging sharedLogging];
    uint64_t v8 = [v16 loggingConnection];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v28 = v17;
      _os_log_error_impl(&dword_1D2150000, v8, OS_LOG_TYPE_ERROR, "ContactImage: Contact %@ has a nil thumbnailImageData", buf, 0xCu);
    }
  }
}

void __92__CLSSocialServiceContacts_personLocalIdentifierMatchingContactPictureForContactIdentifier___block_invoke_236(uint64_t a1, int a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = +[CLSLogging sharedLogging];
    id v7 = [v6 loggingConnection];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 67109634;
      *(_DWORD *)id v34 = a2;
      *(_WORD *)&v34[4] = 2112;
      *(void *)&v34[6] = v8;
      *(_WORD *)&v34[14] = 2112;
      *(void *)&v34[16] = v5;
      _os_log_error_impl(&dword_1D2150000, v7, OS_LOG_TYPE_ERROR, "ContactImage: Error while performRequest %d for %@: %@", buf, 0x1Cu);
    }
  }
  else
  {
    uint64_t v9 = [*(id *)(a1 + 40) results];
    uint64_t v10 = [v9 firstObject];

    dispatch_group_t v11 = +[CLSLogging sharedLogging];
    id v12 = [v11 loggingConnection];

    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      uint64_t v14 = [v10 resultItems];
      *(_DWORD *)long long buf = 138412546;
      *(void *)id v34 = v13;
      *(_WORD *)&v34[8] = 2048;
      *(void *)&v34[10] = [v14 count];
      _os_log_impl(&dword_1D2150000, v12, OS_LOG_TYPE_INFO, "ContactImage: Image data processed for contact %@, Result count: %zu", buf, 0x16u);
    }
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v27 = v10;
    id v15 = [v10 resultItems];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v29 != v18) {
            objc_enumerationMutation(v15);
          }
          long long v20 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          id v21 = [v20 personIdentifier];
          [v20 confidence];
          float v23 = v22;
          uint64_t v24 = +[CLSLogging sharedLogging];
          uint64_t v25 = [v24 loggingConnection];

          BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_INFO);
          if (v23 >= 0.45)
          {
            if (v26)
            {
              *(_DWORD *)long long buf = 138412290;
              *(void *)id v34 = v21;
              _os_log_impl(&dword_1D2150000, v25, OS_LOG_TYPE_INFO, "ContactImage: MAD Resolved personId = %@", buf, 0xCu);
            }

            objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v21);
            **(unsigned char **)(a1 + 64) = 1;
          }
          else
          {
            if (v26)
            {
              *(_DWORD *)long long buf = 134218242;
              *(double *)id v34 = v23;
              *(_WORD *)&v34[8] = 2112;
              *(void *)&v34[10] = v21;
              _os_log_impl(&dword_1D2150000, v25, OS_LOG_TYPE_INFO, "ContactImage: MAD Resolved personId below confidence (%.2f) = %@", buf, 0x16u);
            }
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v17);
    }

    id v7 = v27;
    id v5 = 0;
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

- (void)enumeratePersonsAndRelationshipUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __70__CLSSocialServiceContacts_enumeratePersonsAndRelationshipUsingBlock___block_invoke;
    v6[3] = &unk_1E6910018;
    id v7 = v4;
    [(CLSSocialServiceContacts *)self enumerateAllPersonsUsingBlock:v6];
  }
}

void __70__CLSSocialServiceContacts_enumeratePersonsAndRelationshipUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 relationship]) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (id)_maidenNameForPersonRecord:(id)a3
{
  return (id)[a3 previousFamilyName];
}

- (id)_nicknameForPersonRecord:(id)a3
{
  return (id)[a3 nickname];
}

- (id)_lastNameForPersonRecord:(id)a3
{
  return (id)[a3 familyName];
}

- (id)_firstNameForPersonRecord:(id)a3
{
  return (id)[a3 givenName];
}

- (id)_fullNameWithContact:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
  v12[0] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  int v6 = [v3 areKeysAvailable:v5];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F1B910] stringFromContact:v3 style:0];
  }
  else
  {
    uint64_t v8 = NSString;
    uint64_t v9 = [v3 givenName];
    uint64_t v10 = [v3 familyName];
    id v7 = [v8 stringWithFormat:@"%@ %@", v9, v10];
  }
  return v7;
}

- (id)personForIdentifier:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__5704;
  uint64_t v13 = __Block_byref_object_dispose__5705;
  id v14 = 0;
  v15[0] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__CLSSocialServiceContacts_personForIdentifier___block_invoke;
  v8[3] = &unk_1E690FF20;
  v8[4] = &v9;
  [(CLSSocialServiceContacts *)self enumeratePersonsForIdentifiers:v5 usingBlock:v8];

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __48__CLSSocialServiceContacts_personForIdentifier___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  *a3 = 1;
}

- (void)enumeratePersonsForIdentifiers:(id)a3 usingBlock:(id)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v37 = (void (**)(id, void *, unsigned char *))a4;
  if (!v37) {
    goto LABEL_36;
  }
  id v38 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v48 objects:v54 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v49 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v48 + 1) + 8 * i);
        uint64_t v13 = [(NSMutableDictionary *)self->_personsForCNIdentifiers objectForKeyedSubscript:v12];
        if (!v13) {
          [v38 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v48 objects:v54 count:16];
    }
    while (v9);
  }

  id v14 = (void *)[v38 count];
  id v35 = v6;
  if (v14)
  {
    id v14 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v14];
    id v15 = [MEMORY[0x1E4F1CAD0] setWithArray:v7];
    uint64_t v16 = [(CLSSocialServiceContacts *)self contactsForIdentifiers:v15];

    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v17 = v16;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v44 objects:v53 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v45;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v45 != v20) {
            objc_enumerationMutation(v17);
          }
          float v22 = *(void **)(*((void *)&v44 + 1) + 8 * j);
          float v23 = objc_msgSend(v22, "identifier", v35);
          [v14 setObject:v22 forKeyedSubscript:v23];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v44 objects:v53 count:16];
      }
      while (v19);
    }
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  obuint64_t j = v7;
  uint64_t v24 = [obj countByEnumeratingWithState:&v40 objects:v52 count:16];
  if (!v24) {
    goto LABEL_35;
  }
  uint64_t v25 = v24;
  uint64_t v26 = *(void *)v41;
  while (2)
  {
    for (uint64_t k = 0; k != v25; ++k)
    {
      if (*(void *)v41 != v26) {
        objc_enumerationMutation(obj);
      }
      uint64_t v28 = *(void *)(*((void *)&v40 + 1) + 8 * k);
      if (v14
        && ([v14 objectForKeyedSubscript:*(void *)(*((void *)&v40 + 1) + 8 * k)],
            (long long v29 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        long long v30 = v29;
        visualIdentifierView = self->_visualIdentifierView;
        id v32 = [v29 identifier];
        v33 = [(GDVisualIdentifierView *)visualIdentifierView personForIdentifier:v32];

        id v34 = [(CLSSocialServiceContacts *)self _personWithContact:v30 viewPerson:v33 createPersonIfNeeded:1];

        if (!v34) {
          goto LABEL_31;
        }
      }
      else
      {
        id v34 = -[NSMutableDictionary objectForKeyedSubscript:](self->_personsForCNIdentifiers, "objectForKeyedSubscript:", v28, v35);
        long long v30 = 0;
        if (!v34) {
          goto LABEL_31;
        }
      }
      char v39 = 0;
      v37[2](v37, v34, &v39);
      if (v39)
      {

        goto LABEL_35;
      }
LABEL_31:
    }
    uint64_t v25 = [obj countByEnumeratingWithState:&v40 objects:v52 count:16];
    if (v25) {
      continue;
    }
    break;
  }
LABEL_35:

  id v6 = v35;
LABEL_36:
}

- (id)personsInContactStoreForContactIdentifiers:(id)a3 needsRefetching:(BOOL)a4 progressBlock:(id)a5
{
  BOOL v6 = a4;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v38 = a3;
  char v39 = (void (**)(id, unsigned char *, double))a5;
  unsigned __int8 v54 = 0;
  uint64_t v8 = self;
  objc_sync_enter(v8);
  id v41 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v40 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  if (v6)
  {
    [v40 unionSet:v38];
  }
  else
  {
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v9 = v38;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v50 objects:v57 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v51 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v13 = *(void **)(*((void *)&v50 + 1) + 8 * i);
          if ([v13 length])
          {
            id v14 = [(NSMutableDictionary *)v8->_personsInContactStoreForCNIdentifiers objectForKeyedSubscript:v13];
            id v15 = v14;
            if (v14)
            {
              uint64_t v16 = [v14 CNIdentifier];
              BOOL v17 = [v16 length] == 0;

              if (!v17) {
                [v41 setObject:v15 forKeyedSubscript:v13];
              }
            }
            else
            {
              [v40 addObject:v13];
            }
          }
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v50 objects:v57 count:16];
      }
      while (v10);
    }
  }
  if ([v40 count])
  {
    [(CLSSocialServiceContacts *)v8 contactsForIdentifiers:v38];
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = [v18 countByEnumeratingWithState:&v46 objects:v56 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v47;
      while (2)
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v47 != v20) {
            objc_enumerationMutation(v18);
          }
          float v22 = *(void **)(*((void *)&v46 + 1) + 8 * j);
          float v23 = (void *)MEMORY[0x1D2602300]();
          v39[2](v39, &v54, 0.5);
          int v24 = v54;
          if (!v54)
          {
            uint64_t v25 = [v22 identifier];
            if ([v25 length])
            {
              id v26 = [(CLSSocialServiceContacts *)v8 __newPersonWithContact:v22 viewPerson:0];
              [v26 prefetchPersonAddressesIfNeededWithLocationCache:v8->_locationCache];
              [v41 setObject:v26 forKeyedSubscript:v25];
              [(NSMutableDictionary *)v8->_personsInContactStoreForCNIdentifiers setObject:v26 forKeyedSubscript:v25];
            }
          }
          if (v24)
          {

            id v35 = (id)MEMORY[0x1E4F1CC08];
            goto LABEL_42;
          }
        }
        uint64_t v19 = [v18 countByEnumeratingWithState:&v46 objects:v56 count:16];
        if (v19) {
          continue;
        }
        break;
      }
    }

    uint64_t v27 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v28 = [v41 allKeys];
    v37 = [v27 setWithArray:v28];

    [v40 minusSet:v37];
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v29 = v40;
    uint64_t v30 = [v29 countByEnumeratingWithState:&v42 objects:v55 count:16];
    if (v30)
    {
      uint64_t v31 = *(void *)v43;
      do
      {
        for (uint64_t k = 0; k != v30; ++k)
        {
          if (*(void *)v43 != v31) {
            objc_enumerationMutation(v29);
          }
          v33 = *(void **)(*((void *)&v42 + 1) + 8 * k);
          if ([v33 length])
          {
            id v34 = objc_alloc_init(CLSPersonIdentity);
            [(NSMutableDictionary *)v8->_personsInContactStoreForCNIdentifiers setObject:v34 forKeyedSubscript:v33];
          }
        }
        uint64_t v30 = [v29 countByEnumeratingWithState:&v42 objects:v55 count:16];
      }
      while (v30);
    }
  }
  id v35 = v41;
LABEL_42:

  objc_sync_exit(v8);
  return v35;
}

- (id)matchingDictionaryForContactIdentifier:(id)a3
{
  id v4 = [MEMORY[0x1E4F1CAD0] setWithObject:a3];
  id v5 = [(CLSSocialServiceContacts *)self contactsForIdentifiers:v4];

  if ([v5 count] == 1)
  {
    BOOL v6 = [v5 anyObject];
    id v7 = [MEMORY[0x1E4F8A768] matchingDictionaryForContact:v6 contactStore:self->_contactStore];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)contactsByIdentifierForIdentifiers:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = objc_alloc(MEMORY[0x1E4F1B908]);
    BOOL v6 = +[CLSSocialServiceContacts defaultKeysToFetch];
    id v7 = (void *)[v5 initWithKeysToFetch:v6];

    uint64_t v8 = (void *)MEMORY[0x1E4F1B8F8];
    id v9 = [v4 allObjects];
    uint64_t v10 = [v8 predicateForContactsWithIdentifiers:v9];
    [v7 setPredicate:v10];

    uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
    contactStore = self->_contactStore;
    id v18 = 0;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __63__CLSSocialServiceContacts_contactsByIdentifierForIdentifiers___block_invoke;
    v16[3] = &unk_1E690FFF0;
    id v13 = v11;
    id v17 = v13;
    [(CNContactStore *)contactStore enumerateContactsWithFetchRequest:v7 error:&v18 usingBlock:v16];
    id v14 = v18;
  }
  else
  {
    id v13 = (id)MEMORY[0x1E4F1CC08];
  }

  return v13;
}

void __63__CLSSocialServiceContacts_contactsByIdentifierForIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 identifier];
  [v2 setObject:v3 forKeyedSubscript:v4];
}

- (id)contactsForIdentifiers:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1B908];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v7 = +[CLSSocialServiceContacts defaultKeysToFetch];
  uint64_t v8 = (void *)[v6 initWithKeysToFetch:v7];

  id v9 = (void *)MEMORY[0x1E4F1B8F8];
  uint64_t v10 = [v5 allObjects];

  uint64_t v11 = [v9 predicateForContactsWithIdentifiers:v10];
  [v8 setPredicate:v11];

  uint64_t v12 = [MEMORY[0x1E4F1CA80] set];
  contactStore = self->_contactStore;
  id v19 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __51__CLSSocialServiceContacts_contactsForIdentifiers___block_invoke;
  v17[3] = &unk_1E690FFF0;
  id v14 = v12;
  id v18 = v14;
  [(CNContactStore *)contactStore enumerateContactsWithFetchRequest:v8 error:&v19 usingBlock:v17];
  id v15 = v19;

  return v14;
}

uint64_t __51__CLSSocialServiceContacts_contactsForIdentifiers___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)_allPersons
{
  [(CLSSocialServiceContacts *)self enumerateAllPersonsUsingBlock:0];
  allPersons = self->_allPersons;
  return allPersons;
}

- (void)enumerateAllPersonsUsingBlock:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void, uint8_t *))a3;
  id v5 = self;
  objc_sync_enter(v5);
  allPersons = v5->_allPersons;
  if (allPersons)
  {
    if (v4)
    {
      buf[0] = 0;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v7 = allPersons;
      uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v20 objects:v27 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v21;
LABEL_5:
        uint64_t v10 = 0;
        while (1)
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v7);
          }
          v4[2](v4, *(void *)(*((void *)&v20 + 1) + 8 * v10), buf);
          if (buf[0]) {
            break;
          }
          if (v8 == ++v10)
          {
            uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v20 objects:v27 count:16];
            if (v8) {
              goto LABEL_5;
            }
            break;
          }
        }
      }
    }
  }
  else
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v12 = v5->_allPersons;
    v5->_allPersons = (NSMutableArray *)v11;

    id v13 = objc_alloc(MEMORY[0x1E4F1B908]);
    id v14 = +[CLSSocialServiceContacts defaultKeysToFetch];
    id v15 = (void *)[v13 initWithKeysToFetch:v14];

    contactStore = v5->_contactStore;
    id v26 = 0;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __58__CLSSocialServiceContacts_enumerateAllPersonsUsingBlock___block_invoke;
    v24[3] = &unk_1E690FFC8;
    v24[4] = v5;
    uint64_t v25 = v4;
    [(CNContactStore *)contactStore enumerateContactsWithFetchRequest:v15 error:&v26 usingBlock:v24];
    id v17 = v26;
    if (v17)
    {
      id v18 = +[CLSLogging sharedLogging];
      id v19 = [v18 loggingConnection];

      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        id v29 = v17;
        _os_log_error_impl(&dword_1D2150000, v19, OS_LOG_TYPE_ERROR, "Error fetching all persons: %@", buf, 0xCu);
      }
    }
  }
  objc_sync_exit(v5);
}

void __58__CLSSocialServiceContacts_enumerateAllPersonsUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(*(void *)(a1 + 32) + 40);
  id v6 = a2;
  id v7 = [v6 identifier];
  id v10 = [v5 personForIdentifier:v7];

  uint64_t v8 = [*(id *)(a1 + 32) _personWithContact:v6 viewPerson:v10 createPersonIfNeeded:1];

  if (v8) {
    [*(id *)(*(void *)(a1 + 32) + 64) addObject:v8];
  }
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, void *, uint64_t))(v9 + 16))(v9, v8, a3);
  }
}

- (unint64_t)_relationshipForContact:(id)a3
{
  v41[13] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 identifier];
  id v6 = [(CNContact *)self->_meContact identifier];
  char v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    unint64_t v8 = 14;
  }
  else
  {
    uint64_t v9 = *MEMORY[0x1E4F1B408];
    v41[0] = *MEMORY[0x1E4F1B2B8];
    v41[1] = v9;
    uint64_t v10 = *MEMORY[0x1E4F1B0D8];
    v41[2] = *MEMORY[0x1E4F1B490];
    v41[3] = v10;
    uint64_t v11 = *MEMORY[0x1E4F1B128];
    v41[4] = *MEMORY[0x1E4F1B508];
    v41[5] = v11;
    uint64_t v12 = *MEMORY[0x1E4F1B578];
    v41[6] = *MEMORY[0x1E4F1B2F8];
    v41[7] = v12;
    uint64_t v13 = *MEMORY[0x1E4F1B058];
    v41[8] = *MEMORY[0x1E4F1B4E8];
    v41[9] = v13;
    uint64_t v14 = *MEMORY[0x1E4F1B558];
    v41[10] = *MEMORY[0x1E4F1B400];
    v41[11] = v14;
    v41[12] = *MEMORY[0x1E4F1B1F0];
    id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:13];
    uint64_t v16 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    id v17 = [(CLSSocialServiceContacts *)self _fullNameWithContact:v4];
    id v18 = [v17 clsBetterComponentsSeparatedByCharactersInSet:v16];

    [(CNContact *)self->_meContact contactRelations];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    unint64_t v8 = [v19 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v8)
    {
      id v35 = v15;
      id v34 = v4;
      uint64_t v20 = *(void *)v37;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v37 != v20) {
            objc_enumerationMutation(v19);
          }
          long long v22 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          long long v23 = [v22 value];
          int v24 = [v23 name];

          uint64_t v25 = [v24 clsBetterComponentsSeparatedByCharactersInSet:v16];
          [(CLSSocialServiceContacts *)self _fuzzyMatchingScoreBetweenNameComponents:v25 andNameComponents:v18];
          double v27 = v26;

          if (v27 >= 0.8)
          {
            uint64_t v28 = [v22 label];
            id v15 = v35;
            unint64_t v29 = [v35 indexOfObject:v28];
            if (v29 > 0xC) {
              unint64_t v8 = 0;
            }
            else {
              unint64_t v8 = qword_1D21C5350[v29];
            }
            id v4 = v34;

            goto LABEL_16;
          }
        }
        unint64_t v8 = [v19 countByEnumeratingWithState:&v36 objects:v40 count:16];
        if (v8) {
          continue;
        }
        break;
      }
      id v4 = v34;
      id v15 = v35;
    }
LABEL_16:

    uint64_t v30 = [(CNContact *)self->_meContact organizationName];
    uint64_t v31 = [v4 organizationName];
    id v32 = (void *)v31;
    if (v30
      && v31
      && (![v30 rangeOfString:v31 options:129]
       || ![v32 rangeOfString:v30 options:129]))
    {
      v8 |= 1uLL;
    }
  }
  return v8;
}

- (void)_addAddressesToPerson:(id)a3 withContact:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  id v5 = a4;
  id v6 = [MEMORY[0x1E4F1CA48] array];
  char v7 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v20 = v5;
  unint64_t v8 = [v5 postalAddresses];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    uint64_t v12 = (void *)*MEMORY[0x1E4F1B6F8];
    uint64_t v13 = (void *)*MEMORY[0x1E4F1B770];
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        id v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v16 = [v15 label];
        id v17 = v16;
        if (v16 == v12 || [v16 isEqualToString:v12])
        {
          id v18 = [v15 value];
          id v19 = v6;
LABEL_12:
          [v19 addObject:v18];

          goto LABEL_13;
        }
        if (v17 == v13 || [v17 isEqualToString:v13])
        {
          id v18 = [v15 value];
          id v19 = v7;
          goto LABEL_12;
        }
LABEL_13:
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v10);
  }
  if ([v6 count]) {
    [v21 addAddresses:v6 ofType:0];
  }
  if ([v7 count]) {
    [v21 addAddresses:v7 ofType:1];
  }
}

- (id)_cnPostalAddressForGDLocationAddress:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1BA80]);
  uint64_t v5 = [v3 thoroughfare];
  if (v5)
  {
    id v6 = (void *)v5;
    char v7 = [v3 subThoroughfare];
    if (v7)
    {
      uint64_t v8 = [NSString stringWithFormat:@"%@ %@", v6, v7];

      id v6 = (void *)v8;
    }
    [v4 setValue:v6 forKey:*MEMORY[0x1E4F1B7C8]];
  }
  uint64_t v9 = [v3 subLocality];
  if (v9) {
    [v4 setValue:v9 forKey:*MEMORY[0x1E4F1B7D8]];
  }
  uint64_t v10 = [v3 locality];
  if (v10) {
    [v4 setValue:v10 forKey:*MEMORY[0x1E4F1B798]];
  }
  uint64_t v11 = [v3 postalCode];
  if (v11) {
    [v4 setValue:v11 forKey:*MEMORY[0x1E4F1B7B0]];
  }
  uint64_t v12 = [v3 subAdministrativeArea];
  if (v12) {
    [v4 setValue:v12 forKey:*MEMORY[0x1E4F1B7D0]];
  }
  uint64_t v13 = [v3 administrativeArea];
  if (v13) {
    [v4 setValue:v13 forKey:*MEMORY[0x1E4F1B7C0]];
  }
  uint64_t v14 = [v3 country];
  if (v14) {
    [v4 setValue:v14 forKey:*MEMORY[0x1E4F1B7A0]];
  }
  id v15 = [v3 ISOCountryCode];
  if (v15) {
    [v4 setValue:v15 forKey:*MEMORY[0x1E4F1B7A8]];
  }

  return v4;
}

- (unint64_t)_relationshipForLabel:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:*MEMORY[0x1E4F1B2B8]])
  {
    unint64_t v4 = 10;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F1B408]])
  {
    unint64_t v4 = 9;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F1B490]])
  {
    unint64_t v4 = 8;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F1B0D8]])
  {
    unint64_t v4 = 11;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F1B508]])
  {
    unint64_t v4 = 12;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F1B128]])
  {
    unint64_t v4 = 5;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F1B2F8]])
  {
    unint64_t v4 = 2;
  }
  else if (([v3 isEqualToString:*MEMORY[0x1E4F1B4E8]] & 1) != 0 {
         || ([v3 isEqualToString:*MEMORY[0x1E4F1B578]] & 1) != 0)
  }
  {
    unint64_t v4 = 13;
  }
  else if (([v3 isEqualToString:*MEMORY[0x1E4F1B058]] & 1) != 0 {
         || ([v3 isEqualToString:*MEMORY[0x1E4F1B400]] & 1) != 0)
  }
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F1B558]])
  {
    unint64_t v4 = 7;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F1B1F0]])
  {
    unint64_t v4 = 6;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (void)_addMissingPropertiesToPerson:(id)a3 withViewPerson:(id)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v50 = v5;
  char v7 = [v5 anniversaryDate];
  if (!v7)
  {
    uint64_t v8 = [v6 anniversary];

    if (!v8) {
      goto LABEL_5;
    }
    char v7 = [v6 anniversary];
    uint64_t v9 = +[CLSCalendar dateFromComponents:v7 inTimeZone:0];
    [v5 setAnniversaryDate:v9];
  }
LABEL_5:
  uint64_t v10 = [v5 birthdayDate];
  if (v10)
  {
LABEL_8:

    goto LABEL_9;
  }
  uint64_t v11 = [v6 dateOfBirth];

  if (v11)
  {
    uint64_t v10 = [v6 dateOfBirth];
    uint64_t v12 = +[CLSCalendar dateFromComponents:v10 inTimeZone:0];
    [v5 setBirthdayDate:v12];

    goto LABEL_8;
  }
LABEL_9:
  if (([v5 hasAddresses] & 1) == 0)
  {
    uint64_t v13 = [v6 locations];
    uint64_t v14 = [v13 count];

    if (v14)
    {
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      id v48 = v6;
      id v15 = [v6 locations];
      uint64_t v16 = [v15 countByEnumeratingWithState:&v55 objects:v62 count:16];
      if (!v16) {
        goto LABEL_24;
      }
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v56;
      uint64_t v19 = *MEMORY[0x1E4F1B6F8];
      uint64_t v20 = *MEMORY[0x1E4F1B770];
      while (1)
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v56 != v18) {
            objc_enumerationMutation(v15);
          }
          long long v22 = *(void **)(*((void *)&v55 + 1) + 8 * i);
          long long v23 = [v22 label];
          if ([v23 length])
          {
            if ([v23 isEqualToString:v19])
            {
              long long v24 = [v22 addresses];
              long long v25 = [v24 firstObject];
              float v26 = [(CLSSocialServiceContacts *)self _cnPostalAddressForGDLocationAddress:v25];

              id v61 = v26;
              uint64_t v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v61 count:1];
              uint64_t v28 = v50;
              unint64_t v29 = v27;
              uint64_t v30 = 0;
            }
            else
            {
              if (![v23 isEqualToString:v20]) {
                goto LABEL_22;
              }
              uint64_t v31 = [v22 addresses];
              id v32 = [v31 firstObject];
              float v26 = [(CLSSocialServiceContacts *)self _cnPostalAddressForGDLocationAddress:v32];

              v60 = v26;
              uint64_t v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v60 count:1];
              uint64_t v28 = v50;
              unint64_t v29 = v27;
              uint64_t v30 = 1;
            }
            [v28 addAddresses:v29 ofType:v30];
          }
LABEL_22:
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v55 objects:v62 count:16];
        if (!v17)
        {
LABEL_24:

          id v6 = v48;
          break;
        }
      }
    }
  }
  if (self->_meViewPerson)
  {
    if (![v50 relationship])
    {
      v33 = [v6 relatedPeople];
      uint64_t v34 = [v33 count];

      if (v34)
      {
        id v35 = [(GDVisualIdentifierViewPerson *)self->_meViewPerson entityIdentifier];
        long long v36 = [v35 stringValue];

        long long v53 = 0u;
        long long v54 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        id v37 = v6;
        long long v38 = [v6 relatedPeople];
        uint64_t v39 = [v38 countByEnumeratingWithState:&v51 objects:v59 count:16];
        if (v39)
        {
          uint64_t v40 = v39;
          uint64_t v41 = *(void *)v52;
          do
          {
            for (uint64_t j = 0; j != v40; ++j)
            {
              if (*(void *)v52 != v41) {
                objc_enumerationMutation(v38);
              }
              long long v43 = *(void **)(*((void *)&v51 + 1) + 8 * j);
              long long v44 = [v43 linkedPersonEntityIdentifier];
              long long v45 = [v44 stringValue];
              int v46 = [v45 isEqualToString:v36];

              if (v46)
              {
                long long v47 = [v43 relationshipLabel];
                objc_msgSend(v50, "setRelationship:", -[CLSSocialServiceContacts _relationshipForLabel:](self, "_relationshipForLabel:", v47));
              }
            }
            uint64_t v40 = [v38 countByEnumeratingWithState:&v51 objects:v59 count:16];
          }
          while (v40);
        }

        id v6 = v37;
      }
    }
  }
}

- (void)_addDelegateAddressesToPerson:(id)a3 ofType:(unint64_t)a4
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v8 = [WeakRetained mePersonAddressesOfType:a4];

  [v6 prefetchPersonAddressesIfNeededWithLocationCache:self->_locationCache];
  uint64_t v9 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  id v15 = __65__CLSSocialServiceContacts__addDelegateAddressesToPerson_ofType___block_invoke;
  uint64_t v16 = &unk_1E690FFA0;
  id v10 = v6;
  id v17 = v10;
  unint64_t v18 = a4;
  uint64_t v11 = [v9 predicateWithBlock:&v13];
  uint64_t v12 = objc_msgSend(v8, "filteredArrayUsingPredicate:", v11, v13, v14, v15, v16);

  if ([v12 count]) {
    [v10 addAddresses:v12 ofType:a4];
  }
}

BOOL __65__CLSSocialServiceContacts__addDelegateAddressesToPerson_ofType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  char v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __65__CLSSocialServiceContacts__addDelegateAddressesToPerson_ofType___block_invoke_2;
  v12[3] = &unk_1E690FF78;
  uint64_t v14 = &v15;
  id v9 = v5;
  id v13 = v9;
  [v7 enumerateAddressesOfType:v8 asPlacemarkWithBlock:v12];
  BOOL v10 = *((unsigned char *)v16 + 24) == 0;

  _Block_object_dispose(&v15, 8);
  return v10;
}

void __65__CLSSocialServiceContacts__addDelegateAddressesToPerson_ofType___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = [a2 location];
  id v6 = [*(id *)(a1 + 32) location];
  [v5 distanceFromLocation:v6];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v7 <= 100.0;

  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a3 = 1;
  }
}

- (id)__newPersonWithContact:(id)a3 viewPerson:(id)a4
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (!v6)
  {
    if (v7) {
      goto LABEL_46;
    }
    BOOL v10 = 0;
    goto LABEL_48;
  }
  id v9 = [v6 identifier];
  BOOL v10 = +[CLSPersonIdentity personWithCNIdentifier:v9];

  uint64_t v11 = [v6 givenName];
  if ([v11 length])
  {
  }
  else
  {
    uint64_t v12 = [v6 familyName];
    uint64_t v13 = [v12 length];

    if (!v13) {
      goto LABEL_8;
    }
  }
  id v14 = objc_alloc_init(MEMORY[0x1E4F28F30]);
  uint64_t v15 = [v6 givenName];
  [v14 setGivenName:v15];

  uint64_t v16 = [v6 familyName];
  [v14 setFamilyName:v16];

  uint64_t v17 = [MEMORY[0x1E4F28F38] localizedStringFromPersonNameComponents:v14 style:1 options:0];
  [v10 setLocalizedShortName:v17];

LABEL_8:
  v71 = v8;
  uint64_t v18 = [(CLSSocialServiceContacts *)self _fullNameWithContact:v6];
  [v10 setFullName:v18];
  uint64_t v19 = [v6 givenName];
  [v10 setFirstName:v19];

  uint64_t v20 = [v6 middleName];
  [v10 setMiddleName:v20];

  id v21 = [v6 familyName];
  [v10 setLastName:v21];

  long long v22 = [v6 nickname];
  [v10 setNickname:v22];

  long long v23 = [v6 birthday];
  long long v24 = +[CLSCalendar dateFromComponents:v23 inTimeZone:0];
  [v10 setBirthdayDate:v24];

  long long v25 = [v10 birthdayDate];

  if (!v25)
  {
    float v26 = [v6 identifier];
    uint64_t v27 = [(CLSSocialServiceContacts *)self potentialBirthdayDateForCNIdentifier:v26 fullName:v18];

    [v10 setPotentialBirthdayDate:v27];
  }
  v69 = (void *)v18;
  uint64_t v28 = [v6 organizationName];
  [v10 setCompanyName:v28];

  objc_msgSend(v10, "setRelationship:", -[CLSSocialServiceContacts _relationshipForContact:](self, "_relationshipForContact:", v6));
  [v6 dates];
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  id v29 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v30 = [v29 countByEnumeratingWithState:&v83 objects:v89 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v84;
    v33 = (void *)*MEMORY[0x1E4F1B6E8];
    while (2)
    {
      for (uint64_t i = 0; i != v31; ++i)
      {
        if (*(void *)v84 != v32) {
          objc_enumerationMutation(v29);
        }
        id v35 = *(void **)(*((void *)&v83 + 1) + 8 * i);
        long long v36 = [v35 label];
        if (v36 == v33) {
          goto LABEL_21;
        }
        id v37 = v36;
        if ([v36 isEqualToString:v33])
        {
          v33 = v37;
LABEL_21:
          long long v38 = [v35 value];
          uint64_t v39 = +[CLSCalendar dateFromComponents:v38 inTimeZone:0];
          [v10 setAnniversaryDate:v39];

          goto LABEL_22;
        }
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v83 objects:v89 count:16];
      if (v31) {
        continue;
      }
      break;
    }
  }
LABEL_22:
  v70 = self;

  uint64_t v40 = [v6 phoneNumbers];
  uint64_t v41 = [v40 count];

  if (v41) {
    [v10 setHasPhoneNumber:1];
  }
  id v42 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v43 = [v6 emailAddresses];
  uint64_t v44 = [v43 countByEnumeratingWithState:&v79 objects:v88 count:16];
  if (v44)
  {
    uint64_t v45 = v44;
    uint64_t v46 = *(void *)v80;
    do
    {
      for (uint64_t j = 0; j != v45; ++j)
      {
        if (*(void *)v80 != v46) {
          objc_enumerationMutation(v43);
        }
        id v48 = [*(id *)(*((void *)&v79 + 1) + 8 * j) value];
        long long v49 = [v48 lowercaseString];
        [v42 addObject:v49];
      }
      uint64_t v45 = [v43 countByEnumeratingWithState:&v79 objects:v88 count:16];
    }
    while (v45);
  }

  [v10 setEmailAddresses:v42];
  id v50 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v51 = [v6 phoneNumbers];
  uint64_t v52 = [v51 countByEnumeratingWithState:&v75 objects:v87 count:16];
  if (v52)
  {
    uint64_t v53 = v52;
    uint64_t v54 = *(void *)v76;
    do
    {
      for (uint64_t k = 0; k != v53; ++k)
      {
        if (*(void *)v76 != v54) {
          objc_enumerationMutation(v51);
        }
        long long v56 = [*(id *)(*((void *)&v75 + 1) + 8 * k) value];
        long long v57 = [v56 stringValue];
        [v50 addObject:v57];
      }
      uint64_t v53 = [v51 countByEnumeratingWithState:&v75 objects:v87 count:16];
    }
    while (v53);
  }

  [v10 setPhoneNumbers:v50];
  self = v70;
  [(CLSSocialServiceContacts *)v70 _addAddressesToPerson:v10 withContact:v6];
  uint64_t v8 = v71;
  if ([v10 isMe])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&v70->_delegate);
    if ([WeakRetained hasAddressesForMePerson])
    {
      [(CLSSocialServiceContacts *)v70 _addDelegateAddressesToPerson:v10 ofType:0];
      [(CLSSocialServiceContacts *)v70 _addDelegateAddressesToPerson:v10 ofType:1];
    }
  }
  uint64_t v59 = [v6 socialProfiles];
  uint64_t v60 = [v59 count];

  if (v60)
  {
    id v61 = objc_opt_new();
    v62 = [v6 socialProfiles];
    v72[0] = MEMORY[0x1E4F143A8];
    v72[1] = 3221225472;
    v72[2] = __62__CLSSocialServiceContacts___newPersonWithContact_viewPerson___block_invoke;
    v72[3] = &unk_1E690FF48;
    id v63 = v10;
    id v73 = v63;
    id v74 = v61;
    id v64 = v61;
    [v62 enumerateObjectsUsingBlock:v72];

    [v63 setSocialProfiles:v64];
  }
  objc_msgSend(v10, "setHasContactProfilePicture:", objc_msgSend(v6, "imageDataAvailable"));
  v65 = [v6 identifier];
  [v10 setSourceService:@"contacts" andID:v65];

  if (v71)
  {
    if (v10)
    {
LABEL_47:
      [(CLSSocialServiceContacts *)self _addMissingPropertiesToPerson:v10 withViewPerson:v8];
      goto LABEL_48;
    }
LABEL_46:
    v66 = [v8 entityIdentifier];
    v67 = [v66 stringValue];

    BOOL v10 = +[CLSPersonIdentity personWithGDIdentifier:v67];
    [v10 setSourceService:@"megadome" andID:v67];

    goto LABEL_47;
  }
LABEL_48:

  return v10;
}

void __62__CLSSocialServiceContacts___newPersonWithContact_viewPerson___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = [v3 value];
  id v10 = [v4 service];

  id v5 = [v3 value];

  id v6 = [v5 username];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [*(id *)(a1 + 32) fullName];
  }
  id v9 = v8;

  if (v10 && v9) {
    [*(id *)(a1 + 40) setObject:v9 forKey:v10];
  }
}

- (id)_personWithContactIdentifier:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__5704;
  uint64_t v17 = __Block_byref_object_dispose__5705;
  id v18 = 0;
  if (v4)
  {
    id v5 = self;
    objc_sync_enter(v5);
    uint64_t v6 = [(NSMutableDictionary *)v5->_personsForCNIdentifiers objectForKeyedSubscript:v4];
    id v7 = (void *)v14[5];
    v14[5] = v6;

    objc_sync_exit(v5);
    id v8 = (void *)v14[5];
    if (!v8)
    {
      v19[0] = v4;
      id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      void v12[2] = __57__CLSSocialServiceContacts__personWithContactIdentifier___block_invoke;
      v12[3] = &unk_1E690FF20;
      void v12[4] = &v13;
      [(CLSSocialServiceContacts *)v5 enumeratePersonsForIdentifiers:v9 usingBlock:v12];

      id v8 = (void *)v14[5];
    }
  }
  else
  {
    id v8 = 0;
  }
  id v10 = v8;
  _Block_object_dispose(&v13, 8);

  return v10;
}

void __57__CLSSocialServiceContacts__personWithContactIdentifier___block_invoke(uint64_t a1, void *a2)
{
}

- (id)_personWithContact:(id)a3 viewPerson:(id)a4 createPersonIfNeeded:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = self;
  objc_sync_enter(v10);
  if (v8)
  {
    uint64_t v11 = [v8 identifier];
    id v12 = [(NSMutableDictionary *)v10->_personsForCNIdentifiers objectForKeyedSubscript:v11];
    if (v12) {
      BOOL v13 = 1;
    }
    else {
      BOOL v13 = !v5;
    }
    if (!v13)
    {
      id v12 = [(CLSSocialServiceContacts *)v10 __newPersonWithContact:v8 viewPerson:v9];
      if (v12) {
        [(NSMutableDictionary *)v10->_personsForCNIdentifiers setObject:v12 forKeyedSubscript:v11];
      }
    }
LABEL_15:

    goto LABEL_16;
  }
  if (v9)
  {
    id v14 = [v9 entityIdentifier];
    uint64_t v11 = [v14 stringValue];

    id v12 = [(NSMutableDictionary *)v10->_personsForGDIdentifiers objectForKeyedSubscript:v11];
    if (v12) {
      BOOL v15 = 1;
    }
    else {
      BOOL v15 = !v5;
    }
    if (!v15)
    {
      id v12 = [(CLSSocialServiceContacts *)v10 __newPersonWithContact:0 viewPerson:v9];
      if (v12) {
        [(NSMutableDictionary *)v10->_personsForGDIdentifiers setObject:v12 forKeyedSubscript:v11];
      }
    }
    goto LABEL_15;
  }
  id v12 = 0;
LABEL_16:
  objc_sync_exit(v10);

  return v12;
}

- (id)_personResultsForPersonLocalIdentifier:(id)a3 isLackingFaces:(BOOL *)a4 inPhotoLibrary:(id)a5
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = v9;
  if (a4) {
    *a4 = 0;
  }
  id v37 = [v9 librarySpecificFetchOptions];
  uint64_t v11 = (void *)MEMORY[0x1E4F391F0];
  v40[0] = v8;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:1];
  BOOL v13 = [v11 fetchPersonsWithLocalIdentifiers:v12 options:v37];

  if ([v13 count])
  {
    id v14 = [v13 firstObject];
    BOOL v15 = [v10 librarySpecificFetchOptions];
    uint64_t v39 = *MEMORY[0x1E4F39618];
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
    [v15 setFetchPropertySets:v16];

    uint64_t v17 = [MEMORY[0x1E4F39050] fetchKeyFaceForPerson:v14 options:v15];
    id v18 = [v17 firstObject];
    unint64_t v36 = -[CLSSocialServiceContacts _sexFromFaceBiologicalSex:](self, "_sexFromFaceBiologicalSex:", [v18 sexType]);
    unint64_t v35 = -[CLSSocialServiceContacts _ageCategoryFromFaceAgeType:](self, "_ageCategoryFromFaceAgeType:", [v18 ageType]);
    uint64_t v19 = [v14 name];
    uint64_t v20 = [v14 personUri];

    if (v20 && [v20 length])
    {
      id v21 = [(CLSSocialServiceContacts *)self _personWithContactIdentifier:v20];
    }
    else
    {
      id v21 = 0;
    }
    float v22 = 1.0;
    if (v19 && [v19 length] && !v21)
    {
      long long v23 = [(CLSSocialServiceContacts *)self _personResultsForfullName:v19];
      if ([v23 count])
      {
        long long v24 = [v23 firstObject];
        [v24 confidence];
        if (v25 >= 1.0)
        {
          id v21 = [v24 person];
          [v24 confidence];
          float v22 = v27;
        }
        else
        {
          id v21 = 0;
        }
      }
      else
      {
        id v21 = 0;
      }
    }
    if (v21)
    {
      uint64_t v28 = [v21 sourceService];
      int v29 = [v28 isEqualToString:@"megadome"];

      if (v29)
      {
        uint64_t v30 = [v14 name];
        [v21 setFullName:v30];
      }
      [v21 setLocalIdentifier:v8];
      objc_msgSend(v21, "setIsFavorite:", objc_msgSend(v14, "type") == 1);
      objc_msgSend(v21, "setIsHidden:", objc_msgSend(v14, "type") == -1);
      [v21 setIsUserCreated:1];
    }
    else
    {
      id v21 = +[CLSPersonIdentity personWithPHPerson:v14];
    }
    [v21 setAgeCategory:v35];
    [v21 setSex:v36];
    uint64_t v31 = self->_personsForLocalIdentifier;
    objc_sync_enter(v31);
    [(NSMutableDictionary *)self->_personsForLocalIdentifier setObject:v21 forKeyedSubscript:v8];
    objc_sync_exit(v31);

    *(float *)&double v32 = v22;
    v33 = +[CLSPersonIdentityResult personResultWithPerson:v21 andConfidence:v32];
    long long v38 = v33;
    float v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
  }
  else
  {
    float v26 = 0;
  }

  return v26;
}

- (id)_personResultsForfullName:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __54__CLSSocialServiceContacts__personResultsForfullName___block_invoke;
  v46[3] = &unk_1E690FE80;
  v46[4] = self;
  id v6 = v4;
  id v47 = v6;
  char v50 = 0;
  id v7 = v5;
  id v48 = v7;
  id v49 = 0;
  id v8 = (void *)MEMORY[0x1D2602540](v46);
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __54__CLSSocialServiceContacts__personResultsForfullName___block_invoke_2;
  v44[3] = &unk_1E690FEA8;
  id v9 = v8;
  id v45 = v9;
  uint64_t v10 = MEMORY[0x1D2602540](v44);
  uint64_t v11 = (void *)v10;
  if (self->_visualIdentifierView)
  {
    unint64_t v35 = (void *)v10;
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    visualIdentifierView = self->_visualIdentifierView;
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __54__CLSSocialServiceContacts__personResultsForfullName___block_invoke_3;
    v41[3] = &unk_1E690FED0;
    id v15 = v13;
    id v42 = v15;
    id v16 = v12;
    id v43 = v16;
    id v36 = v6;
    [(GDVisualIdentifierView *)visualIdentifierView enumeratePeopleMatchingName:v6 block:v41];
    id v34 = v16;
    uint64_t v17 = [(CLSSocialServiceContacts *)self contactsByIdentifierForIdentifiers:v16];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v18 = v15;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v37 objects:v51 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v38 != v21) {
            objc_enumerationMutation(v18);
          }
          long long v23 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          long long v24 = [v23 contactIdentifiers];
          float v25 = [v24 firstObject];

          if ([v25 length])
          {
            float v26 = [v17 objectForKeyedSubscript:v25];
          }
          else
          {
            float v26 = 0;
          }
          (*((void (**)(id, void *, void *))v9 + 2))(v9, v26, v23);
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v37 objects:v51 count:16];
      }
      while (v20);
    }

    id v6 = v36;
    float v27 = v34;
    uint64_t v11 = v35;
  }
  else
  {
    id v28 = objc_alloc(MEMORY[0x1E4F1B908]);
    int v29 = +[CLSSocialServiceContacts defaultKeysToFetch];
    float v27 = (void *)[v28 initWithKeysToFetch:v29];

    uint64_t v30 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingName:v6];
    [v27 setPredicate:v30];

    [(CNContactStore *)self->_contactStore enumerateContactsAndMatchInfoWithFetchRequest:v27 error:0 usingBlock:v11];
  }

  if ((unint64_t)[0 count] < 2)
  {
    id v31 = v7;
  }
  else
  {
    id v31 = [v7 sortedArrayUsingComparator:&__block_literal_global_213];
  }
  id v32 = v31;

  return v32;
}

void __54__CLSSocialServiceContacts__personResultsForfullName___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  [*(id *)(a1 + 32) _confidenceInPersonRecord:v14 viewPerson:v5 forName:*(void *)(a1 + 40) components:0];
  float v7 = v6;
  if (*(unsigned char *)(a1 + 64))
  {
    id v8 = v14;
    if (v6 != 1.0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  if (v6 == 1.0)
  {
    [*(id *)(a1 + 48) removeAllObjects];
LABEL_7:
    id v9 = [*(id *)(a1 + 32) _personWithContact:v14 viewPerson:v5 createPersonIfNeeded:1];
    uint64_t v10 = *(void **)(a1 + 48);
    *(float *)&double v11 = v7;
    id v12 = +[CLSPersonIdentityResult personResultWithPerson:v9 andConfidence:v11];
    [v10 addObject:v12];

    id v8 = v14;
    goto LABEL_8;
  }
  id v8 = v14;
  if (v6 >= 0.5) {
    goto LABEL_7;
  }
LABEL_8:
  if (v8)
  {
    id v13 = *(void **)(a1 + 56);
    if (v13) {
      [v13 addObject:v14];
    }
  }
}

uint64_t __54__CLSSocialServiceContacts__personResultsForfullName___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __54__CLSSocialServiceContacts__personResultsForfullName___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 addObject:v4];
  id v5 = [v4 contactIdentifiers];

  id v6 = [v5 firstObject];

  if ([v6 length]) {
    [*(id *)(a1 + 40) addObject:v6];
  }
}

uint64_t __54__CLSSocialServiceContacts__personResultsForfullName___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 confidence];
  float v7 = v6;
  [v5 confidence];
  if (v7 >= v8)
  {
    [v4 confidence];
    float v11 = v10;
    [v5 confidence];
    uint64_t v9 = v11 > v12;
  }
  else
  {
    uint64_t v9 = -1;
  }

  return v9;
}

- (id)personResultsForName:(id)a3 inPhotoLibrary:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  float v8 = self->_personsForLocalIdentifier;
  objc_sync_enter(v8);
  uint64_t v9 = [(NSMutableDictionary *)self->_personsForLocalIdentifier objectForKeyedSubscript:v6];
  objc_sync_exit(v8);

  if (v9
    || (float v11 = self->_personsInContactStoreForCNIdentifiers,
        objc_sync_enter(v11),
        [(NSMutableDictionary *)self->_personsInContactStoreForCNIdentifiers objectForKeyedSubscript:v6], uint64_t v9 = objc_claimAutoreleasedReturnValue(), objc_sync_exit(v11), v11, v9))
  {
    LODWORD(v10) = 1.0;
    float v12 = +[CLSPersonIdentityResult personResultWithPerson:v9 andConfidence:v10];
    v16[0] = v12;
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];

    char v15 = 0;
    if (v13) {
      goto LABEL_11;
    }
    if (!v7) {
      goto LABEL_10;
    }
  }
  else
  {
    char v15 = 0;
    if (!v7) {
      goto LABEL_10;
    }
  }
  id v13 = [(CLSSocialServiceContacts *)self _personResultsForPersonLocalIdentifier:v6 isLackingFaces:&v15 inPhotoLibrary:v7];
  if (v13) {
    goto LABEL_11;
  }
  if (v15)
  {
    id v13 = 0;
    goto LABEL_11;
  }
LABEL_10:
  id v13 = [(CLSSocialServiceContacts *)self _personResultsForfullName:v6];
LABEL_11:

  return v13;
}

- (id)mePerson
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_mePerson)
  {
    meContact = v2->_meContact;
    if (meContact)
    {
      visualIdentifierView = v2->_visualIdentifierView;
      id v5 = [(CNContact *)meContact identifier];
      uint64_t v6 = [(GDVisualIdentifierView *)visualIdentifierView personForIdentifier:v5];

      id v7 = v2->_meContact;
    }
    else
    {
      id v7 = 0;
      uint64_t v6 = 0;
    }
    float v8 = [(CLSSocialServiceContacts *)v2 _personWithContact:v7 viewPerson:v6 createPersonIfNeeded:1];
    uint64_t v9 = v8;
    if (!v8)
    {
LABEL_14:
      mePerson = v2->_mePerson;
      v2->_mePerson = v9;
      uint64_t v19 = v9;

      meViewPerson = v2->_meViewPerson;
      v2->_meViewPerson = (GDVisualIdentifierViewPerson *)v6;

      goto LABEL_15;
    }
    double v10 = [(CLSPersonIdentity *)v8 localIdentifier];
    if (!v10)
    {
      float v11 = [(CLSPersonIdentity *)v9 fullName];

      if (!v11) {
        goto LABEL_10;
      }
      double v10 = v2->_personsForLocalIdentifier;
      objc_sync_enter(v10);
      personsForLocalIdentifier = v2->_personsForLocalIdentifier;
      id v13 = [(CLSPersonIdentity *)v9 fullName];
      id v14 = [(NSMutableDictionary *)personsForLocalIdentifier objectForKeyedSubscript:v13];
      char v15 = [v14 localIdentifier];
      [(CLSPersonIdentity *)v9 setLocalIdentifier:v15];

      objc_sync_exit(v10);
    }

LABEL_10:
    if (![(CLSPersonIdentity *)v9 isMe])
    {
      id v16 = +[CLSLogging sharedLogging];
      uint64_t v17 = [v16 loggingConnection];

      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        uint64_t v23 = [(CLSPersonIdentity *)v9 relationship];
        long long v24 = [(CNContact *)v2->_meContact identifier];
        float v25 = [(CLSPersonIdentity *)v9 CNIdentifier];
        int v26 = 134218754;
        uint64_t v27 = v23;
        __int16 v28 = 2048;
        uint64_t v29 = 14;
        __int16 v30 = 2112;
        id v31 = v24;
        __int16 v32 = 2112;
        v33 = v25;
        _os_log_fault_impl(&dword_1D2150000, v17, OS_LOG_TYPE_FAULT, "mePerson has invalid relationship: %tu, expected %tu. meContact id: %@, mePerson id: %@", (uint8_t *)&v26, 0x2Au);
      }
    }
    goto LABEL_14;
  }
LABEL_15:
  objc_sync_exit(v2);

  uint64_t v21 = v2->_mePerson;
  return v21;
}

- (void)refreshMeContactIfNeeded
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_meContact && v2->_contactStore)
  {
    uint64_t v3 = -[CLSSocialServiceContacts fetchMeCardFromContactStore:](v2, "fetchMeCardFromContactStore:");
    meContact = v2->_meContact;
    v2->_meContact = (CNContact *)v3;

    id v5 = +[CLSLogging sharedLogging];
    uint64_t v6 = [v5 loggingConnection];

    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = v2->_meContact;
      int v8 = 138412290;
      uint64_t v9 = v7;
      _os_log_impl(&dword_1D2150000, v6, OS_LOG_TYPE_INFO, "Fetched me contact card, got %@", (uint8_t *)&v8, 0xCu);
    }
  }
  objc_sync_exit(v2);
}

- (id)inferredDeviceOwnerForPhotoLibrary:(id)a3 ignoreContactLinking:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(CLSSocialServiceContacts *)self visionCacheStorageDirectoryURLForPhotoLibrary:v6];
  id v28 = 0;
  int v8 = [[CLSVisualUnderstandingServiceClient alloc] initWithVisionCacheURL:v7 error:&v28];
  id v9 = v28;
  if (v8)
  {
    uint64_t v10 = [(CLSVisualUnderstandingServiceClient *)v8 deviceOwnerPersonUUIDWithIgnoreContactsLinking:v4];
    float v11 = +[CLSLogging sharedLogging];
    float v12 = [v11 loggingConnection];

    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v31 = v10;
      _os_log_impl(&dword_1D2150000, v12, OS_LOG_TYPE_INFO, "Device owner uuid %@", buf, 0xCu);
    }

    if (v10)
    {
      id v13 = [v6 librarySpecificFetchOptions];
      [v13 setPersonContext:1];
      [v13 setFetchLimit:1];
      uint64_t v27 = v7;
      id v14 = v9;
      char v15 = (void *)MEMORY[0x1E4F391F0];
      id v16 = [v10 UUIDString];
      uint64_t v17 = [v15 localIdentifierWithUUID:v16];

      id v18 = (void *)MEMORY[0x1E4F391F0];
      uint64_t v29 = v17;
      uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
      uint64_t v20 = [v18 fetchPersonsWithLocalIdentifiers:v19 options:v13];
      uint64_t v21 = [v20 fetchedObjects];
      float v22 = [v21 firstObject];

      id v9 = v14;
      id v7 = v27;
    }
    else
    {
      float v22 = 0;
    }
    long long v24 = v22;

    float v25 = v24;
  }
  else
  {
    uint64_t v23 = +[CLSLogging sharedLogging];
    long long v24 = [v23 loggingConnection];

    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v31 = v9;
      _os_log_error_impl(&dword_1D2150000, v24, OS_LOG_TYPE_ERROR, "Failed to get VU Service %@", buf, 0xCu);
    }
    float v25 = 0;
  }

  return v25;
}

- (id)visionCacheStorageDirectoryURLForPhotoLibrary:(id)a3
{
  id v3 = a3;
  if ([v3 isSystemPhotoLibrary])
  {
    BOOL v4 = [v3 urlForApplicationDataFolderIdentifier:2];
  }
  else
  {
    id v5 = [v3 photoLibraryURL];

    BOOL v4 = [v5 URLByAppendingPathComponent:@"private/com.apple.mediaanalysisd/caches/vision"];
    id v3 = v5;
  }

  return v4;
}

- (void)invalidateMemoryCaches
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  personByHandle = self->_personByHandle;
  self->_personByHandle = v3;

  id v5 = [MEMORY[0x1E4F1CA80] set];
  nonFoundHandles = self->_nonFoundHandles;
  self->_nonFoundHandles = v5;

  id v7 = [MEMORY[0x1E4F1CA60] dictionary];
  personByFullName = self->_personByFullName;
  self->_personByFullName = v7;

  id v9 = [MEMORY[0x1E4F1CA80] set];
  nonFoundFullNames = self->_nonFoundFullNames;
  self->_nonFoundFullNames = v9;

  float v11 = [MEMORY[0x1E4F1CA60] dictionary];
  personsForLocalIdentifier = self->_personsForLocalIdentifier;
  self->_personsForLocalIdentifier = v11;

  id v13 = [MEMORY[0x1E4F1CA60] dictionary];
  personsForCNIdentifiers = self->_personsForCNIdentifiers;
  self->_personsForCNIdentifiers = v13;

  self->_personsForGDIdentifiers = [MEMORY[0x1E4F1CA60] dictionary];
  MEMORY[0x1F41817F8]();
}

- (void)invalidateMePerson
{
  obuint64_t j = self;
  objc_sync_enter(obj);
  mePerson = obj->_mePerson;
  obj->_mePerson = 0;

  objc_sync_exit(obj);
}

- (id)_initializeVisualIdentifierView
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F706F0] defaultService];
  id v9 = 0;
  id v3 = [v2 visualIdentifierViewWithError:&v9];
  id v4 = v9;
  if (v3)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v11 = 0x2020000000;
    char v12 = 0;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __59__CLSSocialServiceContacts__initializeVisualIdentifierView__block_invoke;
    v8[3] = &unk_1E690FE58;
    v8[4] = &buf;
    [v3 enumeratePeopleWithBlock:v8];
    if (*(unsigned char *)(*((void *)&buf + 1) + 24))
    {
      id v5 = v3;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v7 = 0;
        _os_log_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "[Megadome] failed to get visualIdentifierView with error: Graph has not yet been run", v7, 2u);
      }
      id v5 = 0;
    }
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v4;
      _os_log_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "[Megadome] failed to get visualIdentifierView with error: %@", (uint8_t *)&buf, 0xCu);
    }
    id v5 = 0;
  }

  return v5;
}

uint64_t __59__CLSSocialServiceContacts__initializeVisualIdentifierView__block_invoke(uint64_t result, uint64_t a2, unsigned char *a3)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  *a3 = 1;
  return result;
}

- (id)fetchMeCardFromContactStore:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = +[CLSSocialServiceContacts defaultKeysToFetch];
  id v11 = 0;
  id v5 = [v3 _crossPlatformUnifiedMeContactWithKeysToFetch:v4 error:&v11];

  id v6 = v11;
  if (v6)
  {
    id v7 = +[CLSLogging sharedLogging];
    int v8 = [v7 loggingConnection];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v13 = v6;
      _os_log_error_impl(&dword_1D2150000, v8, OS_LOG_TYPE_ERROR, "Error gaining access to me: %@", buf, 0xCu);
    }

    id v9 = 0;
  }
  else
  {
    id v9 = v5;
  }

  return v9;
}

- (CLSSocialServiceContacts)initWithLocationCache:(id)a3
{
  id v5 = a3;
  v47.receiver = self;
  v47.super_class = (Class)CLSSocialServiceContacts;
  id v6 = [(CLSSocialServiceContacts *)&v47 init];
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = [(CLSSocialServiceContacts *)v6 _initializeVisualIdentifierView];
    visualIdentifierView = v7->_visualIdentifierView;
    v7->_visualIdentifierView = (GDVisualIdentifierView *)v8;

    uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
    personByFullName = v7->_personByFullName;
    v7->_personByFullName = (NSMutableDictionary *)v10;

    uint64_t v12 = [MEMORY[0x1E4F1CA80] set];
    nonFoundFullNames = v7->_nonFoundFullNames;
    v7->_nonFoundFullNames = (NSMutableSet *)v12;

    uint64_t v14 = [MEMORY[0x1E4F1CA60] dictionary];
    personByHandle = v7->_personByHandle;
    v7->_personByHandle = (NSMutableDictionary *)v14;

    uint64_t v16 = [MEMORY[0x1E4F1CA80] set];
    nonFoundHandles = v7->_nonFoundHandles;
    v7->_nonFoundHandles = (NSMutableSet *)v16;

    objc_storeStrong((id *)&v7->_locationCache, a3);
    id v18 = objc_alloc_init(MEMORY[0x1E4F1B980]);
    uint64_t v41 = 0;
    id v42 = &v41;
    uint64_t v43 = 0x3032000000;
    uint64_t v44 = __Block_byref_object_copy__5704;
    id v45 = __Block_byref_object_dispose__5705;
    id v46 = 0;
    uint64_t v37 = 0;
    long long v38 = &v37;
    uint64_t v39 = 0x2020000000;
    char v40 = 1;
    dispatch_semaphore_t v19 = dispatch_semaphore_create(0);
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __50__CLSSocialServiceContacts_initWithLocationCache___block_invoke;
    v31[3] = &unk_1E690FE30;
    unint64_t v35 = &v37;
    id v36 = &v41;
    id v7 = v7;
    uint64_t v32 = v7;
    id v20 = v18;
    id v33 = v20;
    uint64_t v21 = v19;
    uint64_t v34 = v21;
    [v20 requestAccessForEntityType:0 completionHandler:v31];
    dispatch_semaphore_wait(v21, 0xFFFFFFFFFFFFFFFFLL);
    if (*((unsigned char *)v38 + 24))
    {
      objc_storeStrong((id *)&v7->_contactStore, v18);
      objc_storeStrong((id *)&v7->_meContact, (id)v42[5]);
      uint64_t v22 = [MEMORY[0x1E4F1CA60] dictionary];
      personsForCNIdentifiers = v7->_personsForCNIdentifiers;
      v7->_personsForCNIdentifiers = (NSMutableDictionary *)v22;

      uint64_t v24 = [MEMORY[0x1E4F1CA60] dictionary];
      personsInContactStoreForCNIdentifiers = v7->_personsInContactStoreForCNIdentifiers;
      v7->_personsInContactStoreForCNIdentifiers = (NSMutableDictionary *)v24;

      uint64_t v26 = [MEMORY[0x1E4F1CA60] dictionary];
      personsForGDIdentifiers = v7->_personsForGDIdentifiers;
      v7->_personsForGDIdentifiers = (NSMutableDictionary *)v26;

      uint64_t v28 = [MEMORY[0x1E4F1CA60] dictionary];
      personsForLocalIdentifier = v7->_personsForLocalIdentifier;
      v7->_personsForLocalIdentifier = (NSMutableDictionary *)v28;
    }
    else
    {
      personsForLocalIdentifier = v7;
      id v7 = 0;
    }

    _Block_object_dispose(&v37, 8);
    _Block_object_dispose(&v41, 8);
  }
  return v7;
}

void __50__CLSSocialServiceContacts_initWithLocationCache___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5 || (a2 & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    uint64_t v12 = +[CLSLogging sharedLogging];
    uint64_t v10 = [v12 loggingConnection];

    if (v5)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v13 = 138412290;
        id v14 = v5;
        _os_log_error_impl(&dword_1D2150000, v10, OS_LOG_TYPE_ERROR, "Error gaining access to Contacts: %@", (uint8_t *)&v13, 0xCu);
      }
      goto LABEL_12;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LOWORD(v13) = 0;
      id v11 = "Not authorized to access Contacts";
      goto LABEL_11;
    }
LABEL_12:

    goto LABEL_13;
  }
  uint64_t v6 = [*(id *)(a1 + 32) fetchMeCardFromContactStore:*(void *)(a1 + 40)];
  uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    id v9 = +[CLSLogging sharedLogging];
    uint64_t v10 = [v9 loggingConnection];

    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LOWORD(v13) = 0;
      id v11 = "Contact for me is nil";
LABEL_11:
      _os_log_impl(&dword_1D2150000, v10, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v13, 2u);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
LABEL_13:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

+ (id)defaultKeysToFetch
{
  v10[15] = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(MEMORY[0x1E4F1B910], "descriptorForRequiredKeysForStyle:", 0, *MEMORY[0x1E4F1ADF0], *MEMORY[0x1E4F1AEA0], *MEMORY[0x1E4F1ADE0], *MEMORY[0x1E4F1AF30], *MEMORY[0x1E4F1AEC0]);
  uint64_t v3 = *MEMORY[0x1E4F1AED8];
  v10[5] = v2;
  v10[6] = v3;
  uint64_t v4 = *MEMORY[0x1E4F1ADC8];
  v10[7] = *MEMORY[0x1E4F1AD90];
  v10[8] = v4;
  uint64_t v5 = *MEMORY[0x1E4F1AF10];
  v10[9] = *MEMORY[0x1E4F1AEE0];
  v10[10] = v5;
  uint64_t v6 = *MEMORY[0x1E4F1AF50];
  v10[11] = *MEMORY[0x1E4F1ADB0];
  v10[12] = v6;
  uint64_t v7 = *MEMORY[0x1E4F1AE20];
  v10[13] = *MEMORY[0x1E4F1AF78];
  v10[14] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:15];

  return v8;
}

+ (BOOL)canAccessContactsStore
{
  if (canAccessContactsStore_onceToken != -1) {
    dispatch_once(&canAccessContactsStore_onceToken, &__block_literal_global_5754);
  }
  return !canAccessContactsStore_isDeviceGreenTea
      || [MEMORY[0x1E4F1B980] authorizationStatusForEntityType:0] == 3;
}

uint64_t __50__CLSSocialServiceContacts_canAccessContactsStore__block_invoke()
{
  uint64_t result = PLIsChinaSKU();
  canAccessContactsStore_isDeviceGreenTea = result;
  return result;
}

@end