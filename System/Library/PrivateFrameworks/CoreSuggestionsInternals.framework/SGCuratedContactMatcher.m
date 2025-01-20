@interface SGCuratedContactMatcher
+ (BOOL)_compareContact:(id)a3 cnContact:(id)a4 newDetails:(id *)a5 matchedDetails:(id *)a6 matchPreference:(int64_t)a7 stopOnNewDetail:(BOOL)a8 stopOnMatchedDetail:(BOOL)a9;
+ (BOOL)_isMeContact:(id)a3 withContactStore:(id)a4;
+ (BOOL)compareContact:(id)a3 cnContact:(id)a4 stopOnNewDetail:(BOOL)a5 stopOnMatchedDetail:(BOOL)a6 matchPreference:(int64_t)a7;
+ (id)_birthdayDateFormatter;
+ (id)_filterCandidates:(id)a3 similarToName:(id)a4 exceedingThreshold:(double)a5;
+ (id)_filterCandidates:(id)a3 withUniqueDetailMatchesToContact:(id)a4 andFeatures:(id *)a5;
+ (id)_findContactsMatchingPseudoContact:(id)a3 withName:(id)a4 andFeatures:(id *)a5 fromContactStore:(id)a6 withKeysToFetch:(id)a7;
+ (id)_findFuzzyNameCandidatesMatchingPseudoContact:(id)a3 withName:(id)a4 andFeatures:(id *)a5 fromContactStore:(id)a6 withKeysToFetch:(id)a7;
+ (id)_getPeopleWithNameToken:(id)a3 fromContactStore:(id)a4 withKeysToFetch:(id)a5 ifMatchingPredicate:(id)a6;
+ (id)_lookupContact:(id)a3 andFeatures:(id *)a4 fromContactStore:(id)a5 withKeysToFetch:(id)a6;
+ (id)_realtimeContactFromPseudoContact:(id)a3 andFeatures:(id *)a4 assimilatingMatchingCuratedContacts:(id)a5;
+ (id)_realtimeContactWithContactStore:(id)a3 forPseudoContact:(id)a4 fromEntity:(id)a5 normalizedName:(id)a6 error:(id *)a7;
+ (id)curatedContactsFromContactStore:(id)a3 matchingPseudoContact:(id)a4 error:(id *)a5;
+ (id)fetchMeContactFromContactStore:(id)a3;
+ (id)filterCandidates:(id)a3 withDetailSubsetOfCNContact:(id)a4;
+ (id)realtimeContactWithContactStore:(id)a3 forPseudoContact:(id)a4 error:(id *)a5;
+ (id)realtimeContactWithContactStore:(id)a3 forPseudoContact:(id)a4 fromEntity:(id)a5 error:(id *)a6;
+ (id)stripBirthdayFromSGContact:(id)a3;
+ (id)stripStaleBirthdayFromSGContact:(id)a3 withEntity:(id)a4;
+ (void)clearMeContactCache;
+ (void)compareContact:(id)a3 cnContact:(id)a4 newDetails:(id *)a5 matchedDetails:(id *)a6 matchPreference:(int64_t)a7;
@end

@implementation SGCuratedContactMatcher

+ (id)curatedContactsFromContactStore:(id)a3 matchingPseudoContact:(id)a4 error:(id *)a5
{
  v5 = 0;
  v24[7] = *MEMORY[0x1E4F143B8];
  if (a3 && a4)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v21 = 0u;
    int v20 = 130815;
    v8 = (void *)MEMORY[0x1E4F1B910];
    id v9 = a4;
    id v10 = a3;
    v11 = [v8 descriptorForRequiredKeysForStyle:0];
    uint64_t v12 = *MEMORY[0x1E4F1ADF0];
    v24[0] = v11;
    v24[1] = v12;
    uint64_t v13 = *MEMORY[0x1E4F1ADE0];
    v24[2] = *MEMORY[0x1E4F1AEA0];
    v24[3] = v13;
    uint64_t v14 = *MEMORY[0x1E4F1AEE0];
    v24[4] = *MEMORY[0x1E4F1ADC8];
    v24[5] = v14;
    v24[6] = *MEMORY[0x1E4F1AF78];
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:7];

    v16 = [v9 name];
    v17 = [v16 fullName];
    v18 = SGNormalizeName((uint64_t)v17);
    v5 = [a1 _findContactsMatchingPseudoContact:v9 withName:v18 andFeatures:&v20 fromContactStore:v10 withKeysToFetch:v15];
  }
  return v5;
}

+ (id)realtimeContactWithContactStore:(id)a3 forPseudoContact:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [v8 name];
  v11 = [v10 fullName];
  uint64_t v12 = SGNormalizeName((uint64_t)v11);
  uint64_t v13 = [a1 _realtimeContactWithContactStore:v9 forPseudoContact:v8 fromEntity:0 normalizedName:v12 error:a5];

  return v13;
}

+ (id)realtimeContactWithContactStore:(id)a3 forPseudoContact:(id)a4 fromEntity:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = [v11 name];
  uint64_t v14 = [v13 fullName];
  v15 = SGNormalizeName((uint64_t)v14);
  v16 = [a1 _realtimeContactWithContactStore:v12 forPseudoContact:v11 fromEntity:v10 normalizedName:v15 error:a6];

  return v16;
}

+ (id)_realtimeContactWithContactStore:(id)a3 forPseudoContact:(id)a4 fromEntity:(id)a5 normalizedName:(id)a6 error:(id *)a7
{
  v38[6] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = 0;
  if (v11 && v12)
  {
    if ([a1 _isMeContact:v12 withContactStore:v11])
    {
      v16 = sgLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v35 = 0;
        _os_log_debug_impl(&dword_1CA650000, v16, OS_LOG_TYPE_DEBUG, "Extracted pseudo-contact matches \"me\" contact, Suggestion suppressed", v35, 2u);
      }

      v15 = 0;
    }
    else
    {
      memset(&v35[4], 0, 48);
      *(_DWORD *)v35 = 130815;
      v17 = objc_msgSend(MEMORY[0x1E4F1B910], "descriptorForRequiredKeysForStyle:", 0, *(void *)v35, 0, *(void *)&v35[16], 0, *(void *)&v35[32], 0, *(void *)&v35[48]);
      uint64_t v18 = *MEMORY[0x1E4F1ADC8];
      v38[0] = v17;
      v38[1] = v18;
      uint64_t v19 = *MEMORY[0x1E4F1AF10];
      v38[2] = *MEMORY[0x1E4F1AEE0];
      v38[3] = v19;
      uint64_t v20 = *MEMORY[0x1E4F1AD90];
      v38[4] = *MEMORY[0x1E4F1AF78];
      v38[5] = v20;
      long long v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:6];

      long long v22 = [a1 _findContactsMatchingPseudoContact:v12 withName:v14 andFeatures:v35 fromContactStore:v11 withKeysToFetch:v21];
      long long v23 = sgLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v24 = [v22 count];
        *(_DWORD *)buf = 134217984;
        uint64_t v37 = v24;
        _os_log_impl(&dword_1CA650000, v23, OS_LOG_TYPE_DEFAULT, "Found %lu curated contacts for pseudo-contact", buf, 0xCu);
      }

      if (v13)
      {
        uint64_t v25 = +[SGCuratedContactMatcher stripStaleBirthdayFromSGContact:v12 withEntity:v13];

        id v12 = (id)v25;
      }
      if ([v22 count])
      {
        [a1 _realtimeContactFromPseudoContact:v12 andFeatures:v35 assimilatingMatchingCuratedContacts:v22];
      }
      else
      {
        v26 = [v12 phones];
        *(_DWORD *)&v35[28] = [v26 count];

        v27 = [v12 emailAddresses];
        *(_DWORD *)&v35[32] = [v27 count];

        v28 = [v12 postalAddresses];
        *(_DWORD *)&v35[40] = [v28 count];

        v29 = [v12 socialProfiles];
        *(_DWORD *)&v35[36] = [v29 count];

        [MEMORY[0x1E4F5DAF8] realtimeContactForNewContact:v12];
      v15 = };
      if (v15)
      {
        v30 = [v12 name];
        v31 = [v30 fullName];
        *(_DWORD *)&v35[44] = [v31 length];

        v32 = [v12 name];
        v33 = [v32 fullName];
        v35[48] = [v33 rangeOfString:@"@" options:2] != 0x7FFFFFFFFFFFFFFFLL;
      }
      SGFeatureVectorLog((uint64_t)v35);
    }
  }

  return v15;
}

+ (id)_birthdayDateFormatter
{
  if (_birthdayDateFormatter_onceToken != -1) {
    dispatch_once(&_birthdayDateFormatter_onceToken, &__block_literal_global_41_32933);
  }
  v2 = (void *)_birthdayDateFormatter_birthdayDateFormatter;
  return v2;
}

uint64_t __49__SGCuratedContactMatcher__birthdayDateFormatter__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)_birthdayDateFormatter_birthdayDateFormatter;
  _birthdayDateFormatter_birthdayDateFormatter = v0;

  [(id)_birthdayDateFormatter_birthdayDateFormatter setDateStyle:1];
  v2 = (void *)_birthdayDateFormatter_birthdayDateFormatter;
  return [v2 setTimeStyle:0];
}

+ (id)stripStaleBirthdayFromSGContact:(id)a3 withEntity:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void *)MEMORY[0x1E4F1C9A8];
  id v8 = a4;
  id v9 = [v7 currentCalendar];
  id v10 = objc_opt_new();
  id v11 = [v9 components:28 fromDate:v10];

  [v8 creationTimestamp];
  double v13 = v12;

  id v14 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSince1970:v13];
  v15 = [v9 components:28 fromDate:v14];

  if ([v15 isEqual:v11])
  {
    v16 = sgLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = [a1 _birthdayDateFormatter];
      uint64_t v18 = [v9 dateFromComponents:v11];
      uint64_t v19 = [v17 stringFromDate:v18];
      int v23 = 138412290;
      uint64_t v24 = v19;
      _os_log_impl(&dword_1CA650000, v16, OS_LOG_TYPE_DEFAULT, "Detected birthday matches today's date %@. Returning contact information", (uint8_t *)&v23, 0xCu);
    }
    id v20 = v6;
  }
  else
  {
    id v20 = +[SGCuratedContactMatcher stripBirthdayFromSGContact:v6];
  }
  long long v21 = v20;

  return v21;
}

+ (id)stripBirthdayFromSGContact:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F5D9B0];
  id v4 = a3;
  v5 = [v4 recordId];
  id v6 = [v4 name];
  v7 = [v4 emailAddresses];
  id v8 = [v4 phones];
  id v9 = [v4 postalAddresses];
  id v10 = [v4 socialProfiles];
  id v11 = [v4 photoPath];

  double v12 = [v3 contactWithId:v5 name:v6 emailAddresses:v7 phones:v8 postalAddresses:v9 socialProfiles:v10 birthday:0 photoPath:v11];

  return v12;
}

+ (id)_realtimeContactFromPseudoContact:(id)a3 andFeatures:(id *)a4 assimilatingMatchingCuratedContacts:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = [a5 objectAtIndexedSubscript:0];
  id v31 = 0;
  id v32 = 0;
  [a1 compareContact:v8 cnContact:v9 newDetails:&v32 matchedDetails:&v31 matchPreference:2];
  id v10 = v32;
  id v11 = v31;
  double v12 = [v9 postalAddresses];
  uint64_t v13 = [v12 count];

  if (v13) {
    a4->var8 = 1;
  }
  id v14 = [v11 emailAddresses];
  uint64_t v15 = [v14 count];

  if (v15) {
    a4->var6 = 1;
  }
  v16 = [v11 phones];
  uint64_t v17 = [v16 count];

  if (v17) {
    a4->var4 = 1;
  }
  uint64_t v18 = [v11 postalAddresses];
  uint64_t v19 = [v18 count];

  if (v19) {
    a4->var9 = 1.0;
  }
  id v20 = [v11 socialProfiles];
  uint64_t v21 = [v20 count];

  if (v21) {
    a4->var7 = 1;
  }
  long long v22 = [v10 emailAddresses];
  a4->var11 = [v22 count];

  int v23 = [v10 socialProfiles];
  a4->var12 = [v23 count];

  uint64_t v24 = [v10 phones];
  a4->var10 = [v24 count];

  uint64_t v25 = [v10 postalAddresses];
  a4->var13 = [v25 count];

  v26 = sgLogHandle();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v34 = v10;
    _os_log_debug_impl(&dword_1CA650000, v26, OS_LOG_TYPE_DEBUG, "Filtered contact: %@", buf, 0xCu);
  }

  objc_msgSend(v10, "setUpdatedFields:", objc_msgSend(v8, "updatedFields"));
  v27 = (void *)MEMORY[0x1E4F5DAF8];
  v28 = [v9 identifier];
  v29 = [v27 realtimeContactForFields:v10 updatedFields:0 addedToCuratedContact:v28];

  return v29;
}

+ (id)_findContactsMatchingPseudoContact:(id)a3 withName:(id)a4 andFeatures:(id *)a5 fromContactStore:(id)a6 withKeysToFetch:(id)a7
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if ([v13 length])
  {
LABEL_2:
    v16 = [a1 _findFuzzyNameCandidatesMatchingPseudoContact:v12 withName:v13 andFeatures:a5 fromContactStore:v14 withKeysToFetch:v15];
    uint64_t v17 = [a1 _filterCandidates:v16 withUniqueDetailMatchesToContact:v12 andFeatures:a5];
    if ([v17 count])
    {
      id v18 = v15;
      uint64_t v19 = [v17 array];
      double v20 = -INFINITY;
      id v21 = a1;
      long long v22 = v19;
    }
    else
    {
      uint64_t v19 = [a1 _lookupContact:v12 andFeatures:a5 fromContactStore:v14 withKeysToFetch:v15];
      if ([v19 count]) {
        goto LABEL_27;
      }
      id v18 = v15;
      double v20 = 4.0;
      id v21 = a1;
      long long v22 = v16;
    }
    uint64_t v23 = [v21 _filterCandidates:v22 similarToName:v13 exceedingThreshold:v20];

    uint64_t v19 = (void *)v23;
    id v15 = v18;
LABEL_27:

    goto LABEL_28;
  }
  uint64_t v24 = [v12 socialProfiles];
  if (![v24 count])
  {

    goto LABEL_2;
  }
  uint64_t v25 = [v12 phones];
  uint64_t v26 = [v25 count];

  if (!v26) {
    goto LABEL_2;
  }
  id v48 = v13;
  v27 = objc_opt_new();
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v49 = v12;
  id obj = [v12 phones];
  uint64_t v28 = [obj countByEnumeratingWithState:&v63 objects:v68 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v64;
    unint64_t v31 = 0x1E4F1B000uLL;
    id v51 = v15;
    id v52 = v14;
    uint64_t v50 = *(void *)v64;
    do
    {
      uint64_t v32 = 0;
      uint64_t v53 = v29;
      do
      {
        if (*(void *)v64 != v30) {
          objc_enumerationMutation(obj);
        }
        v33 = *(void **)(*((void *)&v63 + 1) + 8 * v32);
        context = (void *)MEMORY[0x1CB79B230]();
        id v34 = *(void **)(v31 + 2672);
        uint64_t v35 = [v33 phoneNumber];
        v36 = [v34 phoneNumberWithStringValue:v35];

        if (v36)
        {
          uint64_t v37 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingPhoneNumber:v36];
          id v62 = 0;
          v38 = +[SGContactsInterface unifiedContactsMatchingPredicate:v37 keysToFetch:v15 usingContactStore:v14 error:&v62];
          id v56 = v62;
          if ([v38 count])
          {
            v55 = v37;
            long long v60 = 0u;
            long long v61 = 0u;
            long long v58 = 0u;
            long long v59 = 0u;
            id v39 = v38;
            uint64_t v40 = [v39 countByEnumeratingWithState:&v58 objects:v67 count:16];
            if (v40)
            {
              uint64_t v41 = v40;
              uint64_t v42 = *(void *)v59;
              do
              {
                for (uint64_t i = 0; i != v41; ++i)
                {
                  if (*(void *)v59 != v42) {
                    objc_enumerationMutation(v39);
                  }
                  v44 = *(void **)(*((void *)&v58 + 1) + 8 * i);
                  v45 = objc_msgSend(v44, "identifier", v48);
                  [v27 setObject:v44 forKeyedSubscript:v45];
                }
                uint64_t v41 = [v39 countByEnumeratingWithState:&v58 objects:v67 count:16];
              }
              while (v41);
            }

            id v15 = v51;
            id v14 = v52;
            uint64_t v30 = v50;
            unint64_t v31 = 0x1E4F1B000;
            uint64_t v29 = v53;
            uint64_t v37 = v55;
          }
        }
        ++v32;
      }
      while (v32 != v29);
      uint64_t v29 = [obj countByEnumeratingWithState:&v63 objects:v68 count:16];
    }
    while (v29);
  }

  v46 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v19 = [v27 allValues];

  id v13 = v48;
  id v12 = v49;
LABEL_28:

  return v19;
}

+ (id)_filterCandidates:(id)a3 similarToName:(id)a4 exceedingThreshold:(double)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v27 = a4;
  uint64_t v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v7, "count"));
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v29;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        id v14 = (void *)MEMORY[0x1CB79B230]();
        uint64_t v15 = [MEMORY[0x1E4F1B910] stringFromContact:v13 style:0];
        v16 = (void *)v15;
        if (v15)
        {
          uint64_t v17 = SGNormalizeName(v15);
          +[SGNames nameSimilarity:v27 and:v17];
          double v19 = v18;

          if (v19 > a5)
          {
            double v20 = [NSNumber numberWithDouble:v19];
            [v26 setObject:v20 forKeyedSubscript:v13];

            if ((unint64_t)[v26 count] >= 0x65)
            {

              goto LABEL_13;
            }
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  id v21 = (void *)MEMORY[0x1CB79B230]();
  long long v22 = [v26 keysSortedByValueUsingSelector:sel_compare_];
  uint64_t v23 = [v22 reverseObjectEnumerator];
  uint64_t v24 = [v23 allObjects];

  return v24;
}

+ (BOOL)_compareContact:(id)a3 cnContact:(id)a4 newDetails:(id *)a5 matchedDetails:(id *)a6 matchPreference:(int64_t)a7 stopOnNewDetail:(BOOL)a8 stopOnMatchedDetail:(BOOL)a9
{
  BOOL v9 = a8;
  uint64_t v186 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  BOOL v136 = v9;
  v124 = a6;
  if ((((unint64_t)a5 | (unint64_t)a6) != 0) == (v9 || a9))
  {
    id v118 = v16;
    v119 = [MEMORY[0x1E4F28B00] currentHandler];
    [v119 handleFailureInMethod:a2 object:a1 file:@"SGCuratedContactMatcher.m" lineNumber:417 description:@"Asking to stopOnNewDetail or stopOnMatchedDetail does not make sense alonside providing newDetails or matchedDetails"];

    id v16 = v118;
  }
  v128 = v16;
  uint64_t v17 = [v16 emailAddresses];
  v138 = objc_msgSend(v17, "_pas_mappedArrayWithTransform:", &__block_literal_global_28_32952);

  if (a5) {
    v135 = objc_opt_new();
  }
  else {
    v135 = 0;
  }
  if (v124) {
    v134 = objc_opt_new();
  }
  else {
    v134 = 0;
  }
  long long v176 = 0u;
  long long v177 = 0u;
  long long v174 = 0u;
  long long v175 = 0u;
  id obj = [v15 emailAddresses];
  uint64_t v18 = [obj countByEnumeratingWithState:&v174 objects:v185 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v175;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v175 != v20) {
          objc_enumerationMutation(obj);
        }
        long long v22 = *(void **)(*((void *)&v174 + 1) + 8 * i);
        uint64_t v23 = [v22 emailAddress];
        uint64_t v24 = SGNormalizeEmailAddress();
        int v25 = [v138 containsObject:v24];

        if (v25)
        {
          [v134 addObject:v22];
          if (a9) {
            goto LABEL_22;
          }
        }
        else
        {
          [v135 addObject:v22];
          if (v136)
          {
LABEL_22:
            BOOL v28 = 1;
            goto LABEL_136;
          }
        }
      }
      uint64_t v19 = [obj countByEnumeratingWithState:&v174 objects:v185 count:16];
    }
    while (v19);
  }

  uint64_t v26 = objc_opt_new();
  id v27 = [v128 phoneNumbers];
  v172[0] = MEMORY[0x1E4F143A8];
  v172[1] = 3221225472;
  v172[2] = __131__SGCuratedContactMatcher__compareContact_cnContact_newDetails_matchedDetails_matchPreference_stopOnNewDetail_stopOnMatchedDetail___block_invoke_2;
  v172[3] = &unk_1E65BC0E0;
  id obj = v26;
  id v173 = obj;
  v133 = objc_msgSend(v27, "_pas_mappedArrayWithTransform:", v172);

  if (a5) {
    v130 = objc_opt_new();
  }
  else {
    v130 = 0;
  }
  if (v124) {
    v129 = objc_opt_new();
  }
  else {
    v129 = 0;
  }
  long long v170 = 0u;
  long long v171 = 0u;
  long long v168 = 0u;
  long long v169 = 0u;
  id v132 = [v15 phones];
  uint64_t v29 = [v132 countByEnumeratingWithState:&v168 objects:v184 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v169;
    do
    {
      for (uint64_t j = 0; j != v30; ++j)
      {
        if (*(void *)v169 != v31) {
          objc_enumerationMutation(v132);
        }
        uint64_t v33 = *(void **)(*((void *)&v168 + 1) + 8 * j);
        id v34 = (void *)MEMORY[0x1CB79B230]();
        uint64_t v35 = [v33 phoneNumber];
        int v36 = SGPhoneNumberMatchInSet(obj, v35, v133);

        if (v36)
        {
          [v129 addObject:v33];
          if (a9) {
            goto LABEL_40;
          }
        }
        else
        {
          [v130 addObject:v33];
          if (v136)
          {
LABEL_40:
            BOOL v28 = 1;
            goto LABEL_135;
          }
        }
      }
      uint64_t v30 = [v132 countByEnumeratingWithState:&v168 objects:v184 count:16];
    }
    while (v30);
  }

  uint64_t v37 = [v128 postalAddresses];
  objc_msgSend(v37, "_pas_mappedArrayWithTransform:", &__block_literal_global_30_32954);
  id v132 = (id)objc_claimAutoreleasedReturnValue();

  if (a5) {
    v122 = objc_opt_new();
  }
  else {
    v122 = 0;
  }
  v120 = a5;
  if (v124) {
    v121 = objc_opt_new();
  }
  else {
    v121 = 0;
  }
  long long v166 = 0u;
  long long v167 = 0u;
  long long v164 = 0u;
  long long v165 = 0u;
  v38 = [v15 postalAddresses];
  v123 = v15;
  uint64_t v126 = [v38 countByEnumeratingWithState:&v164 objects:v183 count:16];
  if (!v126) {
    goto LABEL_85;
  }
  uint64_t v125 = *(void *)v165;
  while (2)
  {
    uint64_t v39 = 0;
    do
    {
      if (*(void *)v165 != v125) {
        objc_enumerationMutation(v38);
      }
      uint64_t v131 = v39;
      uint64_t v40 = *(void **)(*((void *)&v164 + 1) + 8 * v39);
      uint64_t v41 = [v40 address];
      uint64_t v42 = SGNormalizeAddress(v41);

      v140 = v40;
      v43 = [v40 address];
      v141 = SGPostalAddressParse(v43);

      long long v162 = 0u;
      long long v163 = 0u;
      long long v160 = 0u;
      long long v161 = 0u;
      id v44 = v132;
      uint64_t v45 = [v44 countByEnumeratingWithState:&v160 objects:v182 count:16];
      v142 = v42;
      if (!v45)
      {

        if (a7 == 2)
        {
LABEL_64:
          long long v158 = 0u;
          long long v159 = 0u;
          long long v156 = 0u;
          long long v157 = 0u;
          v57 = [v128 postalAddresses];
          uint64_t v58 = [v57 countByEnumeratingWithState:&v156 objects:v181 count:16];
          if (v58)
          {
            uint64_t v59 = v58;
            uint64_t v60 = *(void *)v157;
            while (2)
            {
              for (uint64_t k = 0; k != v59; ++k)
              {
                if (*(void *)v157 != v60) {
                  objc_enumerationMutation(v57);
                }
                id v62 = *(void **)(*((void *)&v156 + 1) + 8 * k);
                long long v63 = [v62 value];
                long long v64 = [v63 street];

                long long v65 = [v62 value];
                long long v66 = SGNormalizeCNAddress(v65);

                uint64_t v42 = v142;
                if (v64 && [v142 rangeOfString:v64] != 0x7FFFFFFFFFFFFFFFLL)
                {

LABEL_81:
                  goto LABEL_82;
                }
                double v67 = (double)+[SGLevenshtein distanceBetweenStrings:v142 and:v66];
                unint64_t v68 = [v142 length];
                unint64_t v69 = [v66 length];
                if (v68 <= v69) {
                  unint64_t v70 = v69;
                }
                else {
                  unint64_t v70 = v68;
                }
                double v71 = 1.0 - v67 / (double)v70;

                if (v71 > 0.8) {
                  goto LABEL_81;
                }
              }
              uint64_t v59 = [v57 countByEnumeratingWithState:&v156 objects:v181 count:16];
              if (v59) {
                continue;
              }
              break;
            }
          }
        }
LABEL_78:
        [v122 addObject:v140];
        if (v136) {
          goto LABEL_101;
        }
        goto LABEL_83;
      }
      uint64_t v46 = v45;
      uint64_t v47 = *(void *)v161;
      char v48 = 1;
      id v139 = v44;
      do
      {
        for (uint64_t m = 0; m != v46; ++m)
        {
          if (*(void *)v161 != v47) {
            objc_enumerationMutation(v139);
          }
          uint64_t v50 = *(void **)(*((void *)&v160 + 1) + 8 * m);
          id v51 = [v140 address];
          id v52 = [v50 first];
          uint64_t v53 = [v50 first];
          v54 = [v50 second];
          char v55 = SGPostalAddressesMatchWithParsed(v51, v52, v142, v53, v141, v54, (unint64_t)(a7 - 1) < 2);

          v48 &= v55 ^ 1;
        }
        uint64_t v46 = [v139 countByEnumeratingWithState:&v160 objects:v182 count:16];
      }
      while (v46);

      if (a7 == 2) {
        char v56 = v48;
      }
      else {
        char v56 = 0;
      }
      id v15 = v123;
      uint64_t v42 = v142;
      if (v56) {
        goto LABEL_64;
      }
      if (v48) {
        goto LABEL_78;
      }
LABEL_82:
      [v121 addObject:v140];
      if (a9)
      {
LABEL_101:
        BOOL v28 = 1;
        goto LABEL_134;
      }
LABEL_83:

      uint64_t v39 = v131 + 1;
    }
    while (v131 + 1 != v126);
    uint64_t v126 = [v38 countByEnumeratingWithState:&v164 objects:v183 count:16];
    if (v126) {
      continue;
    }
    break;
  }
LABEL_85:

  v38 = objc_opt_new();
  long long v152 = 0u;
  long long v153 = 0u;
  long long v154 = 0u;
  long long v155 = 0u;
  v72 = [v128 socialProfiles];
  uint64_t v73 = [v72 countByEnumeratingWithState:&v152 objects:v180 count:16];
  if (v73)
  {
    uint64_t v74 = v73;
    uint64_t v75 = *(void *)v153;
    do
    {
      for (uint64_t n = 0; n != v74; ++n)
      {
        if (*(void *)v153 != v75) {
          objc_enumerationMutation(v72);
        }
        v77 = *(void **)(*((void *)&v152 + 1) + 8 * n);
        v78 = [SGSocialProfileDetails alloc];
        v79 = [v77 value];
        v80 = [(SGSocialProfileDetails *)v78 initWithCNSocialProfile:v79];

        long long v150 = 0u;
        long long v151 = 0u;
        long long v148 = 0u;
        long long v149 = 0u;
        v81 = [(SGSocialProfileDetails *)v80 uniqueIdentifiers];
        uint64_t v82 = [v81 countByEnumeratingWithState:&v148 objects:v179 count:16];
        if (v82)
        {
          uint64_t v83 = v82;
          uint64_t v84 = *(void *)v149;
          do
          {
            for (iuint64_t i = 0; ii != v83; ++ii)
            {
              if (*(void *)v149 != v84) {
                objc_enumerationMutation(v81);
              }
              [v38 addObject:*(void *)(*((void *)&v148 + 1) + 8 * ii)];
            }
            uint64_t v83 = [v81 countByEnumeratingWithState:&v148 objects:v179 count:16];
          }
          while (v83);
        }
      }
      uint64_t v74 = [v72 countByEnumeratingWithState:&v152 objects:v180 count:16];
    }
    while (v74);
  }

  if (v120) {
    uint64_t v42 = objc_opt_new();
  }
  else {
    uint64_t v42 = 0;
  }
  if (v124) {
    v141 = objc_opt_new();
  }
  else {
    v141 = 0;
  }
  long long v146 = 0u;
  long long v147 = 0u;
  long long v144 = 0u;
  long long v145 = 0u;
  v86 = [v123 socialProfiles];
  uint64_t v87 = [v86 countByEnumeratingWithState:&v144 objects:v178 count:16];
  if (v87)
  {
    uint64_t v88 = v87;
    uint64_t v89 = *(void *)v145;
    do
    {
      for (juint64_t j = 0; jj != v88; ++jj)
      {
        v91 = v42;
        if (*(void *)v145 != v89) {
          objc_enumerationMutation(v86);
        }
        uint64_t v92 = *(void *)(*((void *)&v144 + 1) + 8 * jj);
        v93 = [[SGSocialProfileDetails alloc] initWithSocialProfile:v92];
        v94 = [(SGSocialProfileDetails *)v93 preferredUniqueIdentifier];
        int v95 = [v38 containsObject:v94];

        if (v95)
        {
          [v141 addObject:v92];
          uint64_t v42 = v91;
          if (a9) {
            goto LABEL_132;
          }
        }
        else
        {
          uint64_t v42 = v91;
          [v91 addObject:v92];
          if (v136) {
            goto LABEL_132;
          }
        }
      }
      uint64_t v88 = [v86 countByEnumeratingWithState:&v144 objects:v178 count:16];
    }
    while (v88);
  }

  v96 = [v123 birthday];
  v97 = [v96 dateComponents];

  v143 = v42;
  if (!v97)
  {
LABEL_125:
    v86 = 0;
    v93 = 0;
    goto LABEL_126;
  }
  v98 = [v128 birthday];
  uint64_t v99 = [v98 day];
  v100 = [v123 birthday];
  v101 = [v100 dateComponents];
  if (v99 != [v101 day])
  {

    goto LABEL_124;
  }
  v102 = [v128 birthday];
  uint64_t v103 = [v102 month];
  v104 = [v123 birthday];
  v105 = [v104 dateComponents];
  uint64_t v106 = [v105 month];

  BOOL v107 = v103 == v106;
  uint64_t v42 = v143;
  if (v107)
  {
    v93 = [v123 birthday];
    v86 = 0;
    if (a9) {
      goto LABEL_132;
    }
    goto LABEL_126;
  }
LABEL_124:
  v108 = [v128 birthday];

  if (v108) {
    goto LABEL_125;
  }
  v86 = [v123 birthday];
  v93 = 0;
  if (!v136)
  {
LABEL_126:
    if (v120)
    {
      v109 = (void *)MEMORY[0x1E4F5D9B0];
      v110 = [v123 recordId];
      v111 = [v123 name];
      v112 = [v123 photoPath];
      id *v120 = [v109 contactWithId:v110 name:v111 emailAddresses:v135 phones:v130 postalAddresses:v122 socialProfiles:v143 birthday:v86 photoPath:v112];
    }
    if (v124)
    {
      v113 = (void *)MEMORY[0x1E4F5D9B0];
      v114 = [v123 recordId];
      v115 = [v123 name];
      v116 = [v123 photoPath];
      id *v124 = [v113 contactWithId:v114 name:v115 emailAddresses:v134 phones:v129 postalAddresses:v121 socialProfiles:v141 birthday:v93 photoPath:v116];
    }
    BOOL v28 = 0;
    uint64_t v42 = v143;
    goto LABEL_133;
  }
LABEL_132:
  BOOL v28 = 1;
LABEL_133:

  id v15 = v123;
LABEL_134:

LABEL_135:
LABEL_136:

  return v28;
}

id __131__SGCuratedContactMatcher__compareContact_cnContact_newDetails_matchedDetails_matchPreference_stopOnNewDetail_stopOnMatchedDetail___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 value];
  v3 = [v2 stringValue];
  id v4 = SGNormalizePhoneNumberCached();

  return v4;
}

id __131__SGCuratedContactMatcher__compareContact_cnContact_newDetails_matchedDetails_matchPreference_stopOnNewDetail_stopOnMatchedDetail___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F93BB8];
  id v3 = a2;
  id v4 = [v3 value];
  v5 = SGNormalizeCNAddress(v4);
  id v6 = [v3 value];

  id v7 = SGPostalAddressParseCNPostalAddress(v6);
  id v8 = [v2 tupleWithFirst:v5 second:v7];

  return v8;
}

id __131__SGCuratedContactMatcher__compareContact_cnContact_newDetails_matchedDetails_matchPreference_stopOnNewDetail_stopOnMatchedDetail___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 value];
  id v3 = SGNormalizeEmailAddress();

  return v3;
}

+ (BOOL)compareContact:(id)a3 cnContact:(id)a4 stopOnNewDetail:(BOOL)a5 stopOnMatchedDetail:(BOOL)a6 matchPreference:(int64_t)a7
{
  LOBYTE(v8) = a6;
  return [a1 _compareContact:a3 cnContact:a4 newDetails:0 matchedDetails:0 matchPreference:a7 stopOnNewDetail:a5 stopOnMatchedDetail:v8];
}

+ (void)compareContact:(id)a3 cnContact:(id)a4 newDetails:(id *)a5 matchedDetails:(id *)a6 matchPreference:(int64_t)a7
{
  LOBYTE(v7) = 0;
  [a1 _compareContact:a3 cnContact:a4 newDetails:a5 matchedDetails:a6 matchPreference:a7 stopOnNewDetail:0 stopOnMatchedDetail:v7];
}

+ (id)filterCandidates:(id)a3 withDetailSubsetOfCNContact:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__SGCuratedContactMatcher_filterCandidates_withDetailSubsetOfCNContact___block_invoke;
  v10[3] = &unk_1E65BC098;
  id v11 = v6;
  id v12 = a1;
  id v7 = v6;
  uint64_t v8 = objc_msgSend(a3, "_pas_filteredArrayWithTest:", v10);

  return v8;
}

uint64_t __72__SGCuratedContactMatcher_filterCandidates_withDetailSubsetOfCNContact___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 40) compareContact:a2 cnContact:*(void *)(a1 + 32) stopOnNewDetail:1 stopOnMatchedDetail:0 matchPreference:0] ^ 1;
}

+ (id)_filterCandidates:(id)a3 withUniqueDetailMatchesToContact:(id)a4 andFeatures:(id *)a5
{
  uint64_t v142 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v79 = v6;
  id v72 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA70]), "initWithCapacity:", objc_msgSend(v6, "count"));
  int v95 = objc_opt_new();
  long long v128 = 0u;
  long long v129 = 0u;
  long long v130 = 0u;
  long long v131 = 0u;
  long long v63 = v7;
  id obj = [v7 phones];
  uint64_t v69 = [obj countByEnumeratingWithState:&v128 objects:v141 count:16];
  if (v69)
  {
    id v66 = *(id *)v129;
    do
    {
      for (uint64_t i = 0; i != v69; ++i)
      {
        if (*(id *)v129 != v66) {
          objc_enumerationMutation(obj);
        }
        BOOL v9 = *(void **)(*((void *)&v128 + 1) + 8 * i);
        uint64_t v10 = (void *)MEMORY[0x1CB79B230]();
        id v11 = [v9 phoneNumber];
        id v12 = SGNormalizePhoneNumberCached();

        long long v126 = 0u;
        long long v127 = 0u;
        long long v124 = 0u;
        long long v125 = 0u;
        id v13 = v79;
        uint64_t v86 = [v13 countByEnumeratingWithState:&v124 objects:v140 count:16];
        if (!v86) {
          goto LABEL_27;
        }
        id v80 = v13;
        uint64_t v73 = v10;
        uint64_t v76 = i;
        id v13 = 0;
        id v83 = *(id *)v125;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(id *)v125 != v83) {
              objc_enumerationMutation(v80);
            }
            id v15 = *(void **)(*((void *)&v124 + 1) + 8 * v14);
            long long v120 = 0u;
            long long v121 = 0u;
            long long v122 = 0u;
            long long v123 = 0u;
            uint64_t v89 = v14;
            uint64_t v92 = v15;
            id v16 = [v15 phoneNumbers];
            uint64_t v17 = [v16 countByEnumeratingWithState:&v120 objects:v139 count:16];
            if (v17)
            {
              uint64_t v18 = v17;
              uint64_t v19 = *(void *)v121;
              while (2)
              {
                for (uint64_t j = 0; j != v18; ++j)
                {
                  if (*(void *)v121 != v19) {
                    objc_enumerationMutation(v16);
                  }
                  id v21 = [*(id *)(*((void *)&v120 + 1) + 8 * j) value];
                  long long v22 = [v21 stringValue];
                  v138 = v12;
                  uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v138 count:1];
                  int v24 = SGPhoneNumberMatchInSet(v95, v22, v23);

                  if (v24)
                  {
                    if (v13)
                    {

                      id v13 = 0;
                      goto LABEL_23;
                    }
                    id v13 = v92;
                  }
                }
                uint64_t v18 = [v16 countByEnumeratingWithState:&v120 objects:v139 count:16];
                if (v18) {
                  continue;
                }
                break;
              }
            }
LABEL_23:

            uint64_t v14 = v89 + 1;
          }
          while (v89 + 1 != v86);
          uint64_t v86 = [v80 countByEnumeratingWithState:&v124 objects:v140 count:16];
        }
        while (v86);

        uint64_t v10 = v73;
        uint64_t i = v76;
        if (v13)
        {
          [v72 addObject:v13];
LABEL_27:
        }
      }
      uint64_t v69 = [obj countByEnumeratingWithState:&v128 objects:v141 count:16];
    }
    while (v69);
  }

  int v25 = [v72 count];
  a5->var1 = v25;
  a5->var3 = v25;
  long long v116 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  id v67 = [v63 emailAddresses];
  uint64_t v74 = [v67 countByEnumeratingWithState:&v116 objects:v137 count:16];
  if (!v74) {
    goto LABEL_59;
  }
  uint64_t v70 = *(void *)v117;
  do
  {
    for (id k = 0; k != (id)v74; id k = (char *)k + 1)
    {
      if (*(void *)v117 != v70) {
        objc_enumerationMutation(v67);
      }
      id v27 = *(void **)(*((void *)&v116 + 1) + 8 * (void)k);
      BOOL v28 = (void *)MEMORY[0x1CB79B230]();
      uint64_t v29 = [v27 emailAddress];
      uint64_t v30 = SGNormalizeEmailAddress();

      long long v114 = 0u;
      long long v115 = 0u;
      long long v112 = 0u;
      long long v113 = 0u;
      id v31 = v79;
      uint64_t v90 = [v31 countByEnumeratingWithState:&v112 objects:v136 count:16];
      if (!v90) {
        goto LABEL_56;
      }
      id v81 = k;
      id v84 = v31;
      v77 = v28;
      id v31 = 0;
      uint64_t v87 = *(void *)v113;
      do
      {
        uint64_t v32 = 0;
        do
        {
          if (*(void *)v113 != v87) {
            objc_enumerationMutation(v84);
          }
          uint64_t v93 = v32;
          uint64_t v33 = *(void **)(*((void *)&v112 + 1) + 8 * v32);
          long long v108 = 0u;
          long long v109 = 0u;
          long long v110 = 0u;
          long long v111 = 0u;
          id v34 = [v33 emailAddresses];
          uint64_t v35 = [v34 countByEnumeratingWithState:&v108 objects:v135 count:16];
          if (v35)
          {
            uint64_t v36 = v35;
            uint64_t v37 = *(void *)v109;
            while (2)
            {
              for (uint64_t m = 0; m != v36; ++m)
              {
                if (*(void *)v109 != v37) {
                  objc_enumerationMutation(v34);
                }
                uint64_t v39 = [*(id *)(*((void *)&v108 + 1) + 8 * m) value];
                uint64_t v40 = SGNormalizeEmailAddress();
                int v41 = [v30 isEqualToString:v40];

                if (v41)
                {
                  if (v31)
                  {

                    id v31 = 0;
                    goto LABEL_52;
                  }
                  id v31 = v33;
                }
              }
              uint64_t v36 = [v34 countByEnumeratingWithState:&v108 objects:v135 count:16];
              if (v36) {
                continue;
              }
              break;
            }
          }
LABEL_52:

          uint64_t v32 = v93 + 1;
        }
        while (v93 + 1 != v90);
        uint64_t v90 = [v84 countByEnumeratingWithState:&v112 objects:v136 count:16];
      }
      while (v90);

      id k = v81;
      BOOL v28 = v77;
      if (v31)
      {
        [v72 addObject:v31];
LABEL_56:
      }
    }
    uint64_t v74 = [v67 countByEnumeratingWithState:&v116 objects:v137 count:16];
  }
  while (v74);
LABEL_59:

  long long v106 = 0u;
  long long v107 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  id obja = [v63 socialProfiles];
  uint64_t v71 = [obja countByEnumeratingWithState:&v104 objects:v134 count:16];
  if (!v71) {
    goto LABEL_88;
  }
  id v68 = *(id *)v105;
  while (2)
  {
    uint64_t v42 = 0;
    while (2)
    {
      if (*(id *)v105 != v68) {
        objc_enumerationMutation(obja);
      }
      uint64_t v43 = *(void *)(*((void *)&v104 + 1) + 8 * v42);
      id v44 = (void *)MEMORY[0x1CB79B230]();
      uint64_t v45 = [[SGSocialProfileDetails alloc] initWithSocialProfile:v43];
      long long v100 = 0u;
      long long v101 = 0u;
      long long v102 = 0u;
      long long v103 = 0u;
      id v46 = v79;
      uint64_t v88 = [v46 countByEnumeratingWithState:&v100 objects:v133 count:16];
      if (v88)
      {
        id v82 = v46;
        uint64_t v75 = v44;
        uint64_t v78 = v42;
        id v46 = 0;
        id v85 = *(id *)v101;
        do
        {
          uint64_t v47 = 0;
          do
          {
            if (*(id *)v101 != v85) {
              objc_enumerationMutation(v82);
            }
            char v48 = *(void **)(*((void *)&v100 + 1) + 8 * v47);
            long long v96 = 0u;
            long long v97 = 0u;
            long long v98 = 0u;
            long long v99 = 0u;
            uint64_t v91 = v47;
            v94 = v48;
            id v49 = [v48 socialProfiles];
            uint64_t v50 = [v49 countByEnumeratingWithState:&v96 objects:v132 count:16];
            if (v50)
            {
              uint64_t v51 = v50;
              uint64_t v52 = *(void *)v97;
              while (2)
              {
                for (uint64_t n = 0; n != v51; ++n)
                {
                  if (*(void *)v97 != v52) {
                    objc_enumerationMutation(v49);
                  }
                  v54 = *(void **)(*((void *)&v96 + 1) + 8 * n);
                  char v55 = [SGSocialProfileDetails alloc];
                  char v56 = [v54 value];
                  v57 = [(SGSocialProfileDetails *)v55 initWithCNSocialProfile:v56];

                  uint64_t v58 = [(SGSocialProfileDetails *)v57 preferredUniqueIdentifier];
                  uint64_t v59 = [(SGSocialProfileDetails *)v45 preferredUniqueIdentifier];
                  int v60 = [v58 isEqual:v59];

                  if (v60)
                  {
                    if (v46)
                    {

                      id v46 = 0;
                      goto LABEL_81;
                    }
                    id v46 = v94;
                  }
                }
                uint64_t v51 = [v49 countByEnumeratingWithState:&v96 objects:v132 count:16];
                if (v51) {
                  continue;
                }
                break;
              }
            }
LABEL_81:

            uint64_t v47 = v91 + 1;
          }
          while (v91 + 1 != v88);
          uint64_t v88 = [v82 countByEnumeratingWithState:&v100 objects:v133 count:16];
        }
        while (v88);

        id v44 = v75;
        uint64_t v42 = v78;
        if (v46)
        {
          [v72 addObject:v46];
          goto LABEL_85;
        }
      }
      else
      {
LABEL_85:
      }
      if (++v42 != v71) {
        continue;
      }
      break;
    }
    uint64_t v71 = [obja countByEnumeratingWithState:&v104 objects:v134 count:16];
    if (v71) {
      continue;
    }
    break;
  }
LABEL_88:

  return v72;
}

+ (id)_lookupContact:(id)a3 andFeatures:(id *)a4 fromContactStore:(id)a5 withKeysToFetch:(id)a6
{
  id v42 = a1;
  uint64_t v43 = a4;
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v47 = a5;
  id v9 = a6;
  id v44 = objc_opt_new();
  uint64_t v45 = v8;
  id v46 = objc_opt_new();
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  uint64_t v10 = [v8 phones];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v58 objects:v64 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v59;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v59 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        id v16 = (void *)MEMORY[0x1CB79B230]();
        uint64_t v17 = (void *)MEMORY[0x1E4F1BA70];
        uint64_t v18 = [v15 phoneNumber];
        uint64_t v19 = [v17 phoneNumberWithStringValue:v18];

        if (v19)
        {
          uint64_t v20 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingPhoneNumber:v19];
          uint64_t v57 = 0;
          id v21 = +[SGContactsInterface unifiedContactsMatchingPredicate:v20 keysToFetch:v9 usingContactStore:v47 error:&v57];
          if ([v21 count]) {
            [v46 addObjectsFromArray:v21];
          }
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v58 objects:v64 count:16];
    }
    while (v12);
  }

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v22 = [v8 emailAddresses];
  uint64_t v23 = [v22 countByEnumeratingWithState:&v53 objects:v63 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v54;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v54 != v25) {
          objc_enumerationMutation(v22);
        }
        id v27 = *(void **)(*((void *)&v53 + 1) + 8 * j);
        BOOL v28 = (void *)MEMORY[0x1CB79B230]();
        uint64_t v29 = [v27 emailAddress];
        if (v29)
        {
          uint64_t v30 = [MEMORY[0x1E4F1B8F8] predicateForContactMatchingEmailAddress:v29];
          uint64_t v52 = 0;
          id v31 = +[SGContactsInterface unifiedContactsMatchingPredicate:v30 keysToFetch:v9 usingContactStore:v47 error:&v52];
          if ([v31 count]) {
            [v46 addObjectsFromArray:v31];
          }
        }
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v53 objects:v63 count:16];
    }
    while (v24);
  }

  [v42 _filterCandidates:v46 withUniqueDetailMatchesToContact:v45 andFeatures:v43];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v32 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v33 = [v32 countByEnumeratingWithState:&v48 objects:v62 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v49;
    do
    {
      for (uint64_t k = 0; k != v34; ++k)
      {
        if (*(void *)v49 != v35) {
          objc_enumerationMutation(v32);
        }
        uint64_t v37 = *(void **)(*((void *)&v48 + 1) + 8 * k);
        v38 = objc_msgSend(v37, "identifier", v42, v43);
        [v44 setObject:v37 forKeyedSubscript:v38];
      }
      uint64_t v34 = [v32 countByEnumeratingWithState:&v48 objects:v62 count:16];
    }
    while (v34);
  }

  uint64_t v39 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v40 = [v44 allValues];

  return v40;
}

+ (id)_findFuzzyNameCandidatesMatchingPseudoContact:(id)a3 withName:(id)a4 andFeatures:(id *)a5 fromContactStore:(id)a6 withKeysToFetch:(id)a7
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  id v15 = (void *)MEMORY[0x1CB79B230]();
  id v16 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  uint64_t v17 = [v12 componentsSeparatedByCharactersInSet:v16];

  uint64_t v18 = objc_opt_new();
  if ([v17 count])
  {
    id v37 = v12;
    id v38 = v11;
    context = (void *)MEMORY[0x1CB79B230]();
    uint64_t v19 = [v17 objectAtIndexedSubscript:0];
    uint64_t v20 = [a1 _getPeopleWithNameToken:v19 fromContactStore:v13 withKeysToFetch:v14 ifMatchingPredicate:&__block_literal_global_32969];
    [v18 unionOrderedSet:v20];

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    uint64_t v36 = v17;
    id v21 = [v17 objectAtIndexedSubscript:0];
    long long v22 = +[SGNicknames nicknamesForName:v21];

    uint64_t v23 = [v22 countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v42 != v25) {
            objc_enumerationMutation(v22);
          }
          id v27 = [a1 _getPeopleWithNameToken:*(void *)(*((void *)&v41 + 1) + 8 * i) fromContactStore:v13 withKeysToFetch:v14 ifMatchingPredicate:&__block_literal_global_13];
          [v18 unionOrderedSet:v27];
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v41 objects:v45 count:16];
      }
      while (v24);
    }

    id v12 = v37;
    id v11 = v38;
    uint64_t v17 = v36;
  }
  BOOL v28 = +[SGNames sketchesForName:v12];
  if ((unint64_t)[v17 count] >= 2)
  {
    uint64_t v29 = (void *)MEMORY[0x1CB79B230]();
    uint64_t v30 = objc_msgSend(v17, "objectAtIndexedSubscript:", objc_msgSend(v17, "count") - 1);
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __127__SGCuratedContactMatcher__findFuzzyNameCandidatesMatchingPseudoContact_withName_andFeatures_fromContactStore_withKeysToFetch___block_invoke_3;
    v39[3] = &unk_1E65BC070;
    id v40 = v28;
    id v31 = [a1 _getPeopleWithNameToken:v30 fromContactStore:v13 withKeysToFetch:v14 ifMatchingPredicate:v39];

    [v18 unionOrderedSet:v31];
  }
  id v32 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v33 = [v18 array];

  return v33;
}

BOOL __127__SGCuratedContactMatcher__findFuzzyNameCandidatesMatchingPseudoContact_withName_andFeatures_fromContactStore_withKeysToFetch___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F1B910] stringFromContact:v3 style:0];
  v5 = +[SGNames sketchesForName:v4];
  id v6 = (void *)MEMORY[0x1CB79B230]();
  id v7 = [*(id *)(a1 + 32) firstObjectCommonWithArray:v5];
  BOOL v8 = v7 != 0;

  return v8;
}

uint64_t __127__SGCuratedContactMatcher__findFuzzyNameCandidatesMatchingPseudoContact_withName_andFeatures_fromContactStore_withKeysToFetch___block_invoke_2()
{
  return 1;
}

uint64_t __127__SGCuratedContactMatcher__findFuzzyNameCandidatesMatchingPseudoContact_withName_andFeatures_fromContactStore_withKeysToFetch___block_invoke()
{
  return 1;
}

+ (id)_getPeopleWithNameToken:(id)a3 fromContactStore:(id)a4 withKeysToFetch:(id)a5 ifMatchingPredicate:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([v9 length])
  {
    if ([v9 length] != 1
      || (id v13 = 0, [v9 characterAtIndex:0] >> 7 >= 0x5D))
    {
      id v14 = objc_opt_new();
      id v22 = 0;
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __104__SGCuratedContactMatcher__getPeopleWithNameToken_fromContactStore_withKeysToFetch_ifMatchingPredicate___block_invoke;
      v19[3] = &unk_1E65BC028;
      id v21 = v12;
      id v15 = v14;
      id v20 = v15;
      +[SGContactsInterface enumerateContactsMatchingName:v9 withKeysToFetch:v11 usingContactStore:v10 error:&v22 usingBlock:v19];
      id v16 = v22;
      uint64_t v17 = v20;
      id v13 = v15;
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

void __104__SGCuratedContactMatcher__getPeopleWithNameToken_fromContactStore_withKeysToFetch_ifMatchingPredicate___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = (void *)MEMORY[0x1CB79B230]();
  int v4 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v4) {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

+ (BOOL)_isMeContact:(id)a3 withContactStore:(id)a4
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = 0;
  if (v6 && a4)
  {
    BOOL v8 = [a1 fetchMeContactFromContactStore:a4];
    if (!v8)
    {
      BOOL v7 = 0;
LABEL_47:

      goto LABEL_48;
    }
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v54 = v6;
    id v9 = [v6 emailAddresses];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v67 objects:v76 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v68;
LABEL_6:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v68 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v67 + 1) + 8 * v13);
        id v15 = [v8 emailAddresses];
        id v16 = [v14 emailAddress];
        uint64_t v17 = SGNormalizeEmailAddress();
        int v18 = [v15 containsObject:v17];

        if (v18) {
          break;
        }
        if (v11 == ++v13)
        {
          uint64_t v11 = [v9 countByEnumeratingWithState:&v67 objects:v76 count:16];
          if (v11) {
            goto LABEL_6;
          }
          goto LABEL_12;
        }
      }
      sgLogHandle();
      long long v41 = (SGSocialProfileDetails *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(&v41->super, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_45;
      }
      long long v49 = [v14 emailAddress];
      *(_DWORD *)buf = 138412290;
      uint64_t v75 = v49;
      long long v50 = "Extracted pseudo-contact email address matches \"me\" contact: %@";
    }
    else
    {
LABEL_12:

      long long v65 = 0u;
      long long v66 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      id v9 = [v54 phones];
      uint64_t v19 = [v9 countByEnumeratingWithState:&v63 objects:v73 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v64;
LABEL_14:
        uint64_t v22 = 0;
        while (1)
        {
          if (*(void *)v64 != v21) {
            objc_enumerationMutation(v9);
          }
          uint64_t v23 = *(void **)(*((void *)&v63 + 1) + 8 * v22);
          uint64_t v24 = [v8 phoneNumbers];
          uint64_t v25 = [v23 phoneNumber];
          uint64_t v26 = SGNormalizePhoneNumber();
          int v27 = [v24 containsObject:v26];

          if (v27) {
            break;
          }
          if (v20 == ++v22)
          {
            uint64_t v20 = [v9 countByEnumeratingWithState:&v63 objects:v73 count:16];
            if (v20) {
              goto LABEL_14;
            }
            goto LABEL_20;
          }
        }
        sgLogHandle();
        long long v41 = (SGSocialProfileDetails *)objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(&v41->super, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_45;
        }
        long long v49 = [v23 phoneNumber];
        *(_DWORD *)buf = 138412290;
        uint64_t v75 = v49;
        long long v50 = "Extracted pseudo-contact phone number matches \"me\" contact: %@";
      }
      else
      {
LABEL_20:

        long long v61 = 0u;
        long long v62 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        id v9 = [v54 postalAddresses];
        uint64_t v28 = [v9 countByEnumeratingWithState:&v59 objects:v72 count:16];
        if (!v28)
        {
LABEL_28:

          long long v57 = 0u;
          long long v58 = 0u;
          long long v55 = 0u;
          long long v56 = 0u;
          id v6 = v54;
          id v9 = [v54 socialProfiles];
          uint64_t v37 = [v9 countByEnumeratingWithState:&v55 objects:v71 count:16];
          if (v37)
          {
            uint64_t v38 = v37;
            uint64_t v53 = *(void *)v56;
            while (2)
            {
              for (uint64_t i = 0; i != v38; ++i)
              {
                if (*(void *)v56 != v53) {
                  objc_enumerationMutation(v9);
                }
                id v40 = *(void **)(*((void *)&v55 + 1) + 8 * i);
                long long v41 = [[SGSocialProfileDetails alloc] initWithSocialProfile:v40];
                long long v42 = [v8 socialProfileIdentifiers];
                long long v43 = [(SGSocialProfileDetails *)v41 preferredUniqueIdentifier];
                int v44 = [v42 containsObject:v43];

                if (v44)
                {
                  uint64_t v52 = sgLogHandle();
                  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    uint64_t v75 = v40;
                    _os_log_debug_impl(&dword_1CA650000, v52, OS_LOG_TYPE_DEBUG, "Extracted pseudo-contact social profile matches \"me\" contact: %@", buf, 0xCu);
                  }

                  BOOL v7 = 1;
                  goto LABEL_46;
                }
              }
              uint64_t v38 = [v9 countByEnumeratingWithState:&v55 objects:v71 count:16];
              if (v38) {
                continue;
              }
              break;
            }
          }

          uint64_t v45 = [v8 formattedName];
          id v9 = SGNormalizeName((uint64_t)v45);

          long long v41 = [v54 name];
          uint64_t v46 = [(SGSocialProfileDetails *)v41 fullName];
          id v47 = SGNormalizeName((uint64_t)v46);
          +[SGNames nameSimilarity:v47 and:v9];
          BOOL v7 = v48 > 4.0;

LABEL_46:
          goto LABEL_47;
        }
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v60;
LABEL_22:
        uint64_t v31 = 0;
        while (1)
        {
          if (*(void *)v60 != v30) {
            objc_enumerationMutation(v9);
          }
          id v32 = *(void **)(*((void *)&v59 + 1) + 8 * v31);
          uint64_t v33 = [v8 postalAddresses];
          uint64_t v34 = [v32 address];
          uint64_t v35 = SGNormalizeAddress(v34);
          int v36 = [v33 containsObject:v35];

          if (v36) {
            break;
          }
          if (v29 == ++v31)
          {
            uint64_t v29 = [v9 countByEnumeratingWithState:&v59 objects:v72 count:16];
            if (v29) {
              goto LABEL_22;
            }
            goto LABEL_28;
          }
        }
        sgLogHandle();
        long long v41 = (SGSocialProfileDetails *)objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(&v41->super, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_45;
        }
        long long v49 = [v32 address];
        *(_DWORD *)buf = 138412290;
        uint64_t v75 = v49;
        long long v50 = "Extracted pseudo-contact postal address matches \"me\" contact: %@";
      }
    }
    _os_log_debug_impl(&dword_1CA650000, &v41->super, OS_LOG_TYPE_DEBUG, v50, buf, 0xCu);

LABEL_45:
    BOOL v7 = 1;
    id v6 = v54;
    goto LABEL_46;
  }
LABEL_48:

  return v7;
}

+ (void)clearMeContactCache
{
  id obj = a1;
  objc_sync_enter(obj);
  v2 = (void *)_meContact;
  _meContact = 0;

  objc_sync_exit(obj);
}

+ (id)fetchMeContactFromContactStore:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__SGCuratedContactMatcher_fetchMeContactFromContactStore___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (fetchMeContactFromContactStore__onceToken != -1) {
      dispatch_once(&fetchMeContactFromContactStore__onceToken, block);
    }
    id v5 = a1;
    objc_sync_enter(v5);
    if (_meContact)
    {
      id v6 = (id)_meContact;
      objc_sync_exit(v5);
      id v7 = v5;
    }
    else
    {
      objc_sync_exit(v5);

      BOOL v8 = +[SGMeContact keysToFetch];
      id v14 = 0;
      id v9 = +[SGContactsInterface unifiedMeContactWithKeysToFetch:v8 usingContactStore:v4 error:&v14];
      id v7 = v14;

      id v6 = 0;
      if (v9 && !v7)
      {
        id v10 = v5;
        objc_sync_enter(v10);
        uint64_t v11 = [[SGMeContact alloc] initWithContact:v9];
        uint64_t v12 = (void *)_meContact;
        _meContact = (uint64_t)v11;

        id v6 = (id)_meContact;
        objc_sync_exit(v10);
      }
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void __58__SGCuratedContactMatcher_fetchMeContactFromContactStore___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = *MEMORY[0x1E4F1AF88];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__SGCuratedContactMatcher_fetchMeContactFromContactStore___block_invoke_2;
  v5[3] = &__block_descriptor_40_e24_v16__0__NSNotification_8l;
  v5[4] = *(void *)(a1 + 32);
  id v4 = (id)[v2 addObserverForName:v3 object:0 queue:0 usingBlock:v5];
}

void __58__SGCuratedContactMatcher_fetchMeContactFromContactStore___block_invoke_2(uint64_t a1)
{
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  v1 = (void *)_meContact;
  _meContact = 0;

  objc_sync_exit(obj);
}

@end