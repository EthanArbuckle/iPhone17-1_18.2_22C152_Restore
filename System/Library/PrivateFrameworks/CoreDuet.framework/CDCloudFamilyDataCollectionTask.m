@interface CDCloudFamilyDataCollectionTask
@end

@implementation CDCloudFamilyDataCollectionTask

id *__167___CDCloudFamilyDataCollectionTask_initWithStorage_contactStore_medicalIDStore_activity_sessionPath_dataDirectory_collectionDate_samplingRate_maxBatches_daysPerBatch___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_alloc_init((Class)getCHManagerClass());
  if (WeakRetained) {
    v3 = (void *)WeakRetained[8];
  }
  else {
    v3 = 0;
  }
  id v4 = v3;
  v5 = -[_CDCloudFamilyDataCollectionTask contactKeysToFetch]((uint64_t)WeakRetained);
  v6 = objc_msgSend(v4, "_ios_meContactWithKeysToFetch:error:", v5, 0);

  v7 = -[_CDCloudFamilyDataCollectionTask contactRelationsUsingMe:]((uint64_t)WeakRetained, v6);
  v8 = -[_CDCloudFamilyDataCollectionTask avgOfAllCallsUsingManager:]((uint64_t)WeakRetained, v2);
  v18 = -[_CDCloudFamilyDataCollectionTask contactsEmergencyFamily]((uint64_t)WeakRetained);
  v17 = -[_CDCloudFamilyDataCollectionTask contactsEmergency]((uint64_t)WeakRetained);
  v9 = -[_CDCloudFamilyDataCollectionTask contactsInContactStore]((uint64_t)WeakRetained);
  v10 = -[_CDCloudFamilyDataCollectionTask contactParentsUsingRegexNamesUsingContacts:](WeakRetained, v9);

  v11 = -[_CDCloudFamilyDataCollectionTask photosPeople]((uint64_t)WeakRetained);
  v12 = -[_CDCloudFamilyDataCollectionTask airDropPeople]((uint64_t)WeakRetained);
  v13 = -[_CDCloudFamilyDataCollectionTask airDropPeopleAtHome]((uint64_t)WeakRetained);
  v14 = -[_CDCloudFamilyDataCollectionTask contactsInHome]((uint64_t)WeakRetained);
  v16 = -[_CDEventDictsForContactsState initWithMngr:me:relationshipContacts:avgOfAllCalls:emergencyFamilyContacts:emergencyContacts:contactParents:photosContactIds:airDropDict:airDropDictAtHome:homeContacts:]((id *)[_CDEventDictsForContactsState alloc], v2, v6, v7, v8, v18, v17, v10, v11, v12, v13, v14);

  return v16;
}

void __167___CDCloudFamilyDataCollectionTask_initWithStorage_contactStore_medicalIDStore_activity_sessionPath_dataDirectory_collectionDate_samplingRate_maxBatches_daysPerBatch___block_invoke_1071(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  v6 = +[_CDLogging dataCollectionChannel];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __167___CDCloudFamilyDataCollectionTask_initWithStorage_contactStore_medicalIDStore_activity_sessionPath_dataDirectory_collectionDate_samplingRate_maxBatches_daysPerBatch___block_invoke_1071_cold_1();
  }

  v8 = v4;
  id v7 = v4;
  OSAWriteLogForSubmission();
}

uint64_t __167___CDCloudFamilyDataCollectionTask_initWithStorage_contactStore_medicalIDStore_activity_sessionPath_dataDirectory_collectionDate_samplingRate_maxBatches_daysPerBatch___block_invoke_1076(uint64_t a1, void *a2)
{
  return [a2 writeData:*(void *)(a1 + 32)];
}

uint64_t __58___CDCloudFamilyDataCollectionTask_contactsInContactStore__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:a2];
}

uint64_t __60___CDCloudFamilyDataCollectionTask_indexToInsertDate_array___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 timeIntervalSinceDate:v5];
  if (v6 >= 0.0)
  {
    [v4 timeIntervalSinceDate:v5];
    uint64_t v7 = v8 > 0.0;
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

void __48___CDCloudFamilyDataCollectionTask_labelMembers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = +[_CDLogging dataCollectionChannel];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __48___CDCloudFamilyDataCollectionTask_labelMembers__block_invoke_cold_1();
    }
  }
  v27 = v6;
  v28 = v5;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = [v5 members];
  uint64_t v8 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v39;
    uint64_t v29 = *(void *)v39;
    do
    {
      uint64_t v11 = 0;
      uint64_t v30 = v9;
      do
      {
        if (*(void *)v39 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v38 + 1) + 8 * v11);
        v13 = [v12 dictionary];
        v33 = [v13 objectForKeyedSubscript:@"member-phone-numbers"];
        if ((unint64_t)[v33 length] >= 2)
        {
          v32 = v13;
          v14 = [v33 componentsSeparatedByString:@", "];
          long long v34 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          uint64_t v15 = [v14 countByEnumeratingWithState:&v34 objects:v42 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v35;
            do
            {
              for (uint64_t i = 0; i != v16; ++i)
              {
                if (*(void *)v35 != v17) {
                  objc_enumerationMutation(v14);
                }
                v19 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
                v20 = +[_CDContactResolver normalizedStringFromContactString:*(void *)(*((void *)&v34 + 1) + 8 * i)];
                [v19 addObject:v20];
              }
              uint64_t v16 = [v14 countByEnumeratingWithState:&v34 objects:v42 count:16];
            }
            while (v16);
          }

          uint64_t v10 = v29;
          uint64_t v9 = v30;
          v13 = v32;
        }
        v21 = [v12 appleID];

        if (v21)
        {
          v22 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
          v23 = [v12 appleID];
          [v22 addObject:v23];
        }
        v24 = [v12 inviteEmail];

        if (v24)
        {
          v25 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
          v26 = [v12 inviteEmail];
          [v25 addObject:v26];
        }
        ++v11;
      }
      while (v11 != v9);
      uint64_t v9 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v9);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __48___CDCloudFamilyDataCollectionTask_labelMembers__block_invoke_1137(uint64_t a1, void *a2, void *a3)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = +[_CDLogging dataCollectionChannel];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __48___CDCloudFamilyDataCollectionTask_labelMembers__block_invoke_1137_cold_1();
    }
  }
  v27 = v6;
  v28 = v5;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = [v5 members];
  uint64_t v8 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v39;
    uint64_t v29 = *(void *)v39;
    do
    {
      uint64_t v11 = 0;
      uint64_t v30 = v9;
      do
      {
        if (*(void *)v39 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v38 + 1) + 8 * v11);
        v13 = [v12 dictionary];
        v33 = [v13 objectForKeyedSubscript:@"member-phone-numbers"];
        if ((unint64_t)[v33 length] >= 2)
        {
          v32 = v13;
          v14 = [v33 componentsSeparatedByString:@", "];
          long long v34 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          uint64_t v15 = [v14 countByEnumeratingWithState:&v34 objects:v42 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v35;
            do
            {
              for (uint64_t i = 0; i != v16; ++i)
              {
                if (*(void *)v35 != v17) {
                  objc_enumerationMutation(v14);
                }
                v19 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
                v20 = +[_CDContactResolver normalizedStringFromContactString:*(void *)(*((void *)&v34 + 1) + 8 * i)];
                [v19 addObject:v20];
              }
              uint64_t v16 = [v14 countByEnumeratingWithState:&v34 objects:v42 count:16];
            }
            while (v16);
          }

          uint64_t v10 = v29;
          uint64_t v9 = v30;
          v13 = v32;
        }
        v21 = [v12 appleID];

        if (v21)
        {
          v22 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
          v23 = [v12 appleID];
          [v22 addObject:v23];
        }
        v24 = [v12 inviteEmail];

        if (v24)
        {
          v25 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
          v26 = [v12 inviteEmail];
          [v25 addObject:v26];
        }
        ++v11;
      }
      while (v11 != v9);
      uint64_t v9 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v9);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __82___CDCloudFamilyDataCollectionTask_personRelationshipVocabularyByLocaleDictionary__block_invoke()
{
  v0 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v3 = [v0 URLForResource:@"vocab" withExtension:@"plist"];

  uint64_t v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v3];
  id v2 = (void *)personRelationshipVocabularyByLocaleDictionary_sPersonRelationshipVocabularyByLocaleDictionary;
  personRelationshipVocabularyByLocaleDictionary_sPersonRelationshipVocabularyByLocaleDictionary = v1;
}

void __58___CDCloudFamilyDataCollectionTask_fetchEmergencyContacts__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __53___CDCloudFamilyDataCollectionTask_contactsEmergency__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __55___CDCloudFamilyDataCollectionTask_airDropPeopleAtHome__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __167___CDCloudFamilyDataCollectionTask_initWithStorage_contactStore_medicalIDStore_activity_sessionPath_dataDirectory_collectionDate_samplingRate_maxBatches_daysPerBatch___block_invoke_1071_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_18ECEB000, v0, v1, "Submitting compressed json to crash reporter", v2, v3, v4, v5, v6);
}

void __48___CDCloudFamilyDataCollectionTask_labelMembers__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_18ECEB000, v0, v1, "FAFamilyMember request error %@", v2, v3, v4, v5, v6);
}

void __48___CDCloudFamilyDataCollectionTask_labelMembers__block_invoke_1137_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_18ECEB000, v0, v1, "FAFamilyMember (force fetch server) request error %@", v2, v3, v4, v5, v6);
}

@end