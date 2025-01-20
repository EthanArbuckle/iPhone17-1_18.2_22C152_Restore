@interface CNiOSContactFetcher
+ (id)contactsForFetchRequest:(id)a3 matchInfos:(id *)a4 inAddressBook:(void *)a5 environment:(id)a6 managedConfiguration:(id)a7 error:(id *)a8;
+ (id)linkedPeopleComparator;
- (CNiOSContactFetcher)initWithFetchRequest:(id)a3 addressBook:(void *)a4 environment:(id)a5 managedConfiguration:(id)a6;
- (id)_abMatchMetadataToCNContactMatchInfoArray:(uint64_t)a1;
- (id)_contactsFromPeople:(void *)a3 abMatchInfo:(void *)a4 keysToFetch:;
- (id)executeFetchRequestWithProgressiveResults:(id)a3 completion:(id)a4;
- (id)fetchContactsReturningMatchInfos:(id *)a3 error:(id *)a4;
- (id)unifyPeople:(void *)a3 keysToFetch:(void *)a4 abMatchInfos:(void *)a5 filteredForAccountIdentifiers:(uint64_t)a6 outCNMatchInfos:;
- (void)_batchLoadPropertiesForPeople:(void *)a3 keysToFetch:;
- (void)dealloc;
@end

@implementation CNiOSContactFetcher

+ (id)contactsForFetchRequest:(id)a3 matchInfos:(id *)a4 inAddressBook:(void *)a5 environment:(id)a6 managedConfiguration:(id)a7 error:(id *)a8
{
  id v13 = a3;
  id v14 = a6;
  id v15 = a7;
  v16 = (void *)MEMORY[0x192FD3A40]();
  v17 = [[CNiOSContactFetcher alloc] initWithFetchRequest:v13 addressBook:a5 environment:v14 managedConfiguration:v15];
  v18 = v17;
  if (a4) {
    v19 = &v27;
  }
  else {
    v19 = 0;
  }
  if (a4) {
    id v27 = 0;
  }
  id v26 = 0;
  v20 = [(CNiOSContactFetcher *)v17 fetchContactsReturningMatchInfos:v19 error:&v26];
  if (a4) {
    id v21 = v27;
  }
  else {
    id v21 = 0;
  }
  id v22 = v26;

  if (a4) {
    *a4 = v21;
  }
  id v23 = v20;
  v24 = v23;
  if (a8 && !v23) {
    *a8 = v22;
  }

  return v24;
}

- (CNiOSContactFetcher)initWithFetchRequest:(id)a3 addressBook:(void *)a4 environment:(id)a5 managedConfiguration:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v23.receiver = self;
  v23.super_class = (Class)CNiOSContactFetcher;
  id v14 = [(CNiOSContactFetcher *)&v23 init];
  id v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_fetchRequest, a3);
    v16 = [(CNContactFetchRequest *)v15->_fetchRequest effectiveKeysToFetch];
    v17 = +[CNiOSABConversions personToContactTransformWithKeysToFetch:mutable:]((uint64_t)CNiOSABConversions, v16, [v11 mutableObjects]);
    uint64_t v18 = [v17 copy];
    id personToContact = v15->_personToContact;
    v15->_id personToContact = (id)v18;

    if (a4) {
      v20 = (void *)CFRetain(a4);
    }
    else {
      v20 = 0;
    }
    v15->_addressBook = v20;
    objc_storeStrong((id *)&v15->_environment, a5);
    objc_storeStrong((id *)&v15->_managedConfiguration, a6);
    id v21 = v15;
  }

  return v15;
}

- (void)dealloc
{
  addressBook = self->_addressBook;
  if (addressBook) {
    CFRelease(addressBook);
  }
  v4.receiver = self;
  v4.super_class = (Class)CNiOSContactFetcher;
  [(CNiOSContactFetcher *)&v4 dealloc];
}

- (id)_abMatchMetadataToCNContactMatchInfoArray:(uint64_t)a1
{
  if (a1)
  {
    v2 = (void *)MEMORY[0x1E4F1CA60];
    id v3 = a2;
    objc_super v4 = [v2 dictionary];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __65__CNiOSContactFetcher__abMatchMetadataToCNContactMatchInfoArray___block_invoke;
    v7[3] = &unk_1E56B50A8;
    id v5 = v4;
    id v8 = v5;
    [v3 enumerateKeysAndObjectsUsingBlock:v7];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

void __65__CNiOSContactFetcher__abMatchMetadataToCNContactMatchInfoArray___block_invoke(uint64_t a1, void *a2, void *a3)
{
  objc_super v4 = *(void **)(a1 + 32);
  id v5 = a2;
  +[CNiOSABConversions contactMatchInfoFromABMatchMetadataDictionary:]((uint64_t)CNiOSABConversions, a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v6 forKey:v5];
}

- (void)_batchLoadPropertiesForPeople:(void *)a3 keysToFetch:
{
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (a1)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __65__CNiOSContactFetcher__batchLoadPropertiesForPeople_keysToFetch___block_invoke;
    aBlock[3] = &unk_1E56B50F8;
    id v13 = v6;
    id v8 = (void (**)(void *, void *))_Block_copy(aBlock);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __65__CNiOSContactFetcher__batchLoadPropertiesForPeople_keysToFetch___block_invoke_4;
    v9[3] = &unk_1E56B5120;
    id v10 = v5;
    uint64_t v11 = a1;
    v8[2](v8, v9);
  }
}

void __65__CNiOSContactFetcher__batchLoadPropertiesForPeople_keysToFetch___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__CNiOSContactFetcher__batchLoadPropertiesForPeople_keysToFetch___block_invoke_2;
  v6[3] = &unk_1E56B50D0;
  id v7 = v3;
  id v5 = v3;
  [v4 enumerateObjectsUsingBlock:v6];
}

void __65__CNiOSContactFetcher__batchLoadPropertiesForPeople_keysToFetch___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v4 = +[CN contactPropertiesByKey];
    id v5 = [v4 objectForKeyedSubscript:v3];

    if ([v5 isMultiValue]) {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
  else
  {
    id v6 = v3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
    }
    else
    {
      int v8 = [v6 conformsToProtocol:&unk_1EE097850];

      if (!v8) {
        goto LABEL_11;
      }
    }
    id v7 = objc_msgSend(v6, "_cn_requiredKeys");
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __65__CNiOSContactFetcher__batchLoadPropertiesForPeople_keysToFetch___block_invoke_3;
    v9[3] = &unk_1E56B47D8;
    id v10 = *(id *)(a1 + 32);
    [v7 enumeratePropertiesUsingBlock:v9];
  }
LABEL_11:
}

void __65__CNiOSContactFetcher__batchLoadPropertiesForPeople_keysToFetch___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isMultiValue]) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t __65__CNiOSContactFetcher__batchLoadPropertiesForPeople_keysToFetch___block_invoke_4(uint64_t a1, void *a2)
{
  int v3 = 0;
  uint64_t result = [a2 abPropertyID:&v3];
  if (result) {
    return ABMultiValueBatchLoad();
  }
  return result;
}

- (id)_contactsFromPeople:(void *)a3 abMatchInfo:(void *)a4 keysToFetch:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    id v10 = *(void **)(a1 + 40);
    if (v10 && [v10 deviceHasManagementRestrictions])
    {
      uint64_t v11 = [[CNiOSABUtilities alloc] initWithAddressBook:*(void *)(a1 + 8)];
      id v12 = [(CNiOSABUtilities *)v11 allAccountIdentifiers];
      id v13 = [*(id *)(a1 + 40) readableAccountIdentifiersFromIdentifiers:v12];
      uint64_t v14 = [v12 count];
      if (v14 == [v13 count])
      {
        id v15 = v7;
      }
      else
      {
        id v15 = [(CNiOSABUtilities *)v11 filterPeople:v7 matchingAccountIdentifiers:v13];
      }
      id v16 = v15;
    }
    else
    {
      id v16 = v7;
      id v13 = 0;
    }
    v17 = [*(id *)(a1 + 16) predicate];
    if ((objc_msgSend(v17, "cn_supportsNativeBatchFetch") & 1) == 0) {
      -[CNiOSContactFetcher _batchLoadPropertiesForPeople:keysToFetch:](a1, v16, v9);
    }
    if ([*(id *)(a1 + 16) unifyResults])
    {
      id v23 = 0;
      uint64_t v18 = -[CNiOSContactFetcher unifyPeople:keysToFetch:abMatchInfos:filteredForAccountIdentifiers:outCNMatchInfos:](a1, v16, v9, v8, v13, (uint64_t)&v23);
      id v19 = v23;
      a1 = [MEMORY[0x1E4F5A490] pairWithFirst:v18 second:v19];
    }
    else
    {
      v20 = -[CNiOSContactFetcher _abMatchMetadataToCNContactMatchInfoArray:](a1, v8);
      id v21 = objc_msgSend(v16, "_cn_map:", *(void *)(a1 + 24));
      a1 = [MEMORY[0x1E4F5A490] pairWithFirst:v21 second:v20];
    }
  }

  return (id)a1;
}

- (id)unifyPeople:(void *)a3 keysToFetch:(void *)a4 abMatchInfos:(void *)a5 filteredForAccountIdentifiers:(uint64_t)a6 outCNMatchInfos:
{
  uint64_t v132 = *MEMORY[0x1E4F143B8];
  id v92 = a2;
  id v91 = a3;
  id v11 = a4;
  id v90 = a5;
  if (a1)
  {
    v101 = [MEMORY[0x1E4F1CA80] set];
    id v12 = [MEMORY[0x1E4F1CA48] array];
    if (a6)
    {
      id v96 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    else
    {
      id v96 = 0;
    }
    CFMutableArrayRef Mutable = CFArrayCreateMutable(0, objc_msgSend(v92, "count", a6), 0);
    uint64_t v98 = a1;
    v95 = v12;
    if (Mutable)
    {
      uint64_t v14 = Mutable;
      id v15 = [MEMORY[0x1E4F1CA80] set];
      long long v123 = 0u;
      long long v124 = 0u;
      long long v125 = 0u;
      long long v126 = 0u;
      id v16 = v92;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v123 objects:v131 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v124;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v124 != v19) {
              objc_enumerationMutation(v16);
            }
            id v21 = *(const void **)(*((void *)&v123 + 1) + 8 * i);
            int IntValue = ABRecordGetIntValue();
            id v23 = [NSNumber numberWithInt:ABRecordGetRecordID(v21)];
            [v15 addObject:v23];

            if (IntValue != -1) {
              CFArrayAppendValue(v14, (const void *)IntValue);
            }
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v123 objects:v131 count:16];
        }
        while (v18);
      }

      CFArrayRef v24 = (const __CFArray *)ABAddressBookCopyPeopleWithLinkIdentifiers();
      CFArrayRef v25 = v24;
      if (v90)
      {
        id v26 = [[CNiOSABUtilities alloc] initWithAddressBook:*(void *)(a1 + 8)];
        CFArrayRef v27 = [(CNiOSABUtilities *)v26 filterPeople:v25 matchingAccountIdentifiers:v90];
      }
      else
      {
        CFArrayRef v27 = v24;
      }
      v121[0] = MEMORY[0x1E4F143A8];
      v121[1] = 3221225472;
      v121[2] = __106__CNiOSContactFetcher_unifyPeople_keysToFetch_abMatchInfos_filteredForAccountIdentifiers_outCNMatchInfos___block_invoke;
      v121[3] = &unk_1E56B5170;
      id v29 = v15;
      id v122 = v29;
      v30 = [(__CFArray *)v27 _cn_filter:v121];
      -[CNiOSContactFetcher _batchLoadPropertiesForPeople:keysToFetch:](a1, v30, v91);
      if (v25)
      {
        v103 = v30;
        id v105 = v29;
        CFArrayRef v107 = v27;
        CFDictionaryRef v28 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, MEMORY[0x1E4F1D540]);
        CFIndex Count = CFArrayGetCount(v25);
        if (Count >= 1)
        {
          CFIndex v32 = Count;
          CFIndex v33 = 0;
          v34 = (const CFArrayCallBacks *)MEMORY[0x1E4F1D510];
          do
          {
            ValueAtIndex = CFArrayGetValueAtIndex(v25, v33);
            v36 = (const void *)(int)ABRecordGetIntValue();
            Value = (void *)CFDictionaryGetValue(v28, v36);
            if (!Value)
            {
              Value = CFArrayCreateMutable(0, 0, v34);
              CFDictionarySetValue(v28, v36, Value);
              CFRelease(Value);
            }
            CFArrayAppendValue((CFMutableArrayRef)Value, ValueAtIndex);
            ++v33;
          }
          while (v32 != v33);
        }
        CFRelease(v25);
        a1 = v98;
        id v29 = v105;
        CFArrayRef v27 = v107;
        v30 = v103;
      }
      else
      {
        CFDictionaryRef v28 = 0;
      }
      CFRelease(v14);

      id v12 = v95;
    }
    else
    {
      CFDictionaryRef v28 = 0;
    }
    long long v119 = 0u;
    long long v120 = 0u;
    long long v117 = 0u;
    long long v118 = 0u;
    id v38 = v92;
    uint64_t v100 = [v38 countByEnumeratingWithState:&v117 objects:v130 count:16];
    if (v100)
    {
      uint64_t v99 = *(void *)v118;
      id v93 = v38;
      CFDictionaryRef v94 = v28;
      do
      {
        uint64_t v39 = 0;
        do
        {
          if (*(void *)v118 != v99) {
            objc_enumerationMutation(v38);
          }
          uint64_t v40 = ABRecordGetIntValue();
          uint64_t v41 = v40;
          uint64_t v108 = v39;
          BOOL v42 = v40 != -1 && CFDictionaryContainsKey(v28, (const void *)(int)v40) != 0;
          uint64_t v106 = v41;
          v43 = [NSNumber numberWithInt:v41];
          int v44 = [v101 containsObject:v43];

          if (!v42 || (v44 & 1) == 0)
          {
            if ((!v42 | v44))
            {
              v45 = (*(void (**)(void))(*(void *)(a1 + 24) + 16))();
              v46 = [v45 identifier];
              v47 = [v11 objectForKey:v46];

              if (v47)
              {
                v48 = +[CNiOSABConversions contactMatchInfoFromABMatchMetadataDictionary:]((uint64_t)CNiOSABConversions, v47);
              }
              else
              {
                v48 = 0;
              }
            }
            else
            {
              v49 = (void *)CFDictionaryGetValue(v28, (const void *)(int)v106);
              v50 = +[CNiOSContactFetcher linkedPeopleComparator]();
              v51 = [v49 sortedArrayUsingComparator:v50];

              v102 = v51;
              v52 = objc_msgSend(v51, "_cn_map:", *(void *)(a1 + 24));
              v53 = [v52 firstObject];
              v54 = [v53 keyVector];
              v55 = (void *)[v54 mutableCopy];

              long long v115 = 0u;
              long long v116 = 0u;
              long long v113 = 0u;
              long long v114 = 0u;
              id v56 = v52;
              uint64_t v57 = [v56 countByEnumeratingWithState:&v113 objects:v129 count:16];
              if (v57)
              {
                uint64_t v58 = v57;
                char v59 = 0;
                uint64_t v60 = *(void *)v114;
                do
                {
                  for (uint64_t j = 0; j != v58; ++j)
                  {
                    if (*(void *)v114 != v60) {
                      objc_enumerationMutation(v56);
                    }
                    v62 = *(void **)(*((void *)&v113 + 1) + 8 * j);
                    v63 = [v56 objectAtIndexedSubscript:0];

                    if (v62 != v63)
                    {
                      v64 = [v62 keyVector];
                      if (([v64 isEqualToKeyVector:v55] & 1) == 0)
                      {
                        [v55 unionKeyVector:v64];
                        char v59 = 1;
                      }
                    }
                  }
                  uint64_t v58 = [v56 countByEnumeratingWithState:&v113 objects:v129 count:16];
                }
                while (v58);
              }
              else
              {
                char v59 = 0;
              }

              v97 = [MEMORY[0x1E4F1CAD0] setWithObject:v55];
              +[CNiOSABConversions personToContactTransformWithKeysToFetch:mutable:]((uint64_t)CNiOSABConversions, v97, [*(id *)(v98 + 16) mutableObjects]);
              v104 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
              v65 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v56, "count"));
              if ([v56 count])
              {
                unint64_t v66 = 0;
                do
                {
                  v67 = [v56 objectAtIndexedSubscript:v66];
                  v68 = [MEMORY[0x1E4F1CA98] null];

                  if (v67 != v68)
                  {
                    if (v59)
                    {
                      v128 = v55;
                      v69 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v128 count:1];
                      char v70 = [v67 areKeysAvailable:v69];

                      if ((v70 & 1) == 0)
                      {
                        v71 = [v102 objectAtIndexedSubscript:v66];

                        uint64_t v72 = ((void (**)(void, void *))v104)[2](v104, v71);

                        v67 = (void *)v72;
                      }
                    }
                    [v65 addObject:v67];
                  }

                  ++v66;
                }
                while (v66 < [v56 count]);
              }

              id v73 = v65;
              v74 = [MEMORY[0x1E4F1CA60] dictionary];
              long long v109 = 0u;
              long long v110 = 0u;
              long long v111 = 0u;
              long long v112 = 0u;
              id v75 = v73;
              uint64_t v76 = [v75 countByEnumeratingWithState:&v109 objects:v127 count:16];
              if (v76)
              {
                uint64_t v77 = v76;
                uint64_t v78 = *(void *)v110;
                do
                {
                  for (uint64_t k = 0; k != v77; ++k)
                  {
                    if (*(void *)v110 != v78) {
                      objc_enumerationMutation(v75);
                    }
                    v80 = *(void **)(*((void *)&v109 + 1) + 8 * k);
                    v81 = [v80 identifier];
                    v82 = [v11 objectForKey:v81];

                    if (v82)
                    {
                      v83 = +[CNiOSABConversions contactMatchInfoFromABMatchMetadataDictionary:]((uint64_t)CNiOSABConversions, v82);
                      v84 = [v80 identifier];
                      [v74 setObject:v83 forKey:v84];
                    }
                  }
                  uint64_t v77 = [v75 countByEnumeratingWithState:&v109 objects:v127 count:16];
                }
                while (v77);
              }

              id v38 = v93;
              if ([v74 count])
              {
                v48 = +[CN unifyContactMatchInfos:v74 linkedContacts:v75];
              }
              else
              {
                v48 = 0;
              }
              id v12 = v95;
              v45 = +[CN contactUnifyingContacts:v75 includingMainStoreContacts:1 allowMutableContactFreeze:1];
              v85 = [NSNumber numberWithInt:v106];
              [v101 addObject:v85];

              CFDictionaryRef v28 = v94;
              v47 = v102;
            }

            if (v48)
            {
              v86 = [v45 identifier];
              [v96 setObject:v48 forKey:v86];
            }
            [v12 addObject:v45];

            a1 = v98;
          }
          uint64_t v39 = v108 + 1;
        }
        while (v108 + 1 != v100);
        uint64_t v100 = [v38 countByEnumeratingWithState:&v117 objects:v130 count:16];
      }
      while (v100);
    }

    if (v89) {
      void *v89 = v96;
    }
    v87 = v92;
    if (v28) {
      CFRelease(v28);
    }
  }
  else
  {
    id v12 = 0;
    v87 = v92;
  }

  return v12;
}

- (id)executeFetchRequestWithProgressiveResults:(id)a3 completion:(id)a4
{
  unint64_t v6 = (unint64_t)a3;
  unint64_t v7 = (unint64_t)a4;
  if (v6 | v7)
  {
    id v8 = +[CNiOSPersonFetchRequest fetchRequestFromCNFetchRequest:self->_fetchRequest managedConfiguration:self->_managedConfiguration error:0];
    if (v8)
    {
      id v9 = [[CNiOSPersonFetcher alloc] initWithAddressBook:self->_addressBook fetchRequest:v8 environment:self->_environment];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __76__CNiOSContactFetcher_executeFetchRequestWithProgressiveResults_completion___block_invoke;
      v12[3] = &unk_1E56B5148;
      v12[4] = self;
      id v13 = (id)v6;
      id v10 = [(CNiOSPersonFetcher *)v9 executeFetchRequestWithProgressiveResults:v12 completion:v7];
    }
    else
    {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

void __76__CNiOSContactFetcher_executeFetchRequestWithProgressiveResults_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  if (*(void *)(a1 + 40))
  {
    unint64_t v6 = (void *)MEMORY[0x192FD3A40]();
    uint64_t v7 = *(void *)(a1 + 32);
    if (v7) {
      id v8 = *(void **)(v7 + 16);
    }
    else {
      id v8 = 0;
    }
    id v9 = v8;
    id v10 = [v9 effectiveKeysToFetch];
    id v11 = -[CNiOSContactFetcher _contactsFromPeople:abMatchInfo:keysToFetch:](v7, v14, v5, v10);

    id v12 = [v11 first];
    id v13 = [v11 second];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (id)fetchContactsReturningMatchInfos:(id *)a3 error:(id *)a4
{
  uint64_t v7 = +[CNiOSPersonFetchRequest fetchRequestFromCNFetchRequest:self->_fetchRequest managedConfiguration:self->_managedConfiguration error:a4];
  if (!v7)
  {
    id v14 = 0;
    goto LABEL_17;
  }
  if (a3) {
    id v8 = &v18;
  }
  else {
    id v8 = 0;
  }
  if (a3) {
    id v18 = 0;
  }
  uint64_t v9 = +[CNiOSPersonFetcher peopleForFetchRequest:v7 matchInfos:v8 inAddressBook:self->_addressBook environment:self->_environment error:a4];
  id v10 = (void *)v9;
  if (a3)
  {
    id v11 = v18;
    if (v10) {
      goto LABEL_9;
    }
  }
  else
  {
    id v11 = 0;
    if (v9)
    {
LABEL_9:
      id v12 = [(CNContactFetchRequest *)self->_fetchRequest effectiveKeysToFetch];
      id v13 = -[CNiOSContactFetcher _contactsFromPeople:abMatchInfo:keysToFetch:]((uint64_t)self, v10, v11, v12);

      id v14 = [v13 first];
      id v15 = [v13 second];
      id v16 = v15;
      if (a3 && v11) {
        *a3 = v15;
      }

      goto LABEL_16;
    }
  }
  id v14 = 0;
LABEL_16:

LABEL_17:

  return v14;
}

uint64_t __106__CNiOSContactFetcher_unifyPeople_keysToFetch_abMatchInfos_filteredForAccountIdentifiers_outCNMatchInfos___block_invoke(uint64_t a1, ABRecordRef record)
{
  uint64_t RecordID = ABRecordGetRecordID(record);
  objc_super v4 = *(void **)(a1 + 32);
  id v5 = [NSNumber numberWithInt:RecordID];
  uint64_t v6 = [v4 containsObject:v5] ^ 1;

  return v6;
}

+ (id)linkedPeopleComparator
{
  self;
  if (linkedPeopleComparator_cn_once_token_0 != -1) {
    dispatch_once(&linkedPeopleComparator_cn_once_token_0, &__block_literal_global_40);
  }
  v0 = (void *)linkedPeopleComparator_cn_once_object_0;

  return v0;
}

void __45__CNiOSContactFetcher_linkedPeopleComparator__block_invoke()
{
  v3[2] = *MEMORY[0x1E4F143B8];
  v3[0] = &__block_literal_global_26;
  v3[1] = &__block_literal_global_28;
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:2];
  uint64_t v1 = CNAggregateComparator();
  v2 = (void *)linkedPeopleComparator_cn_once_object_0;
  linkedPeopleComparator_cn_once_object_0 = v1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedConfiguration, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong(&self->_personToContact, 0);

  objc_storeStrong((id *)&self->_fetchRequest, 0);
}

@end