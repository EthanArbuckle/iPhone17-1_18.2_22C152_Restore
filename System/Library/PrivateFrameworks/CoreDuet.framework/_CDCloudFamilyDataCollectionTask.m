@interface _CDCloudFamilyDataCollectionTask
- (BOOL)regexMatchForRegex:(void *)a3 string:;
- (BOOL)submitDataForCollection;
- (OS_xpc_object)activity;
- (_CDCloudFamilyDataCollectionTask)initWithActivity:(id)a3;
- (id)aggregateInteractionDataUsingStore:(void *)a3 contact:(void *)a4 callHistoryManager:(void *)a5 avgCallDur:;
- (id)airDropPeople;
- (id)airDropPeopleAtHome;
- (id)allAirDropInteractionsFromStore:(uint64_t)a3 fetchLimit:;
- (id)allEmailAndPhoneNumberHandlesForContact:(void *)a1;
- (id)avgOfAllCallsUsingManager:(uint64_t)a1;
- (id)callFeaturesFromInteractions:(void *)a3 avgCallLength:(double)a4 contact:;
- (id)contactEmergencyForContact:(void *)a3 contactEmergency:;
- (id)contactFamilyEmergencyForContact:(void *)a3 contactFamilyEmergency:;
- (id)contactFamilyNameForContact:(void *)a3 me:;
- (id)contactFamilyRelationForContact:(void *)a3 contactRelations:(void *)a4 me:;
- (id)contactKeysToFetch;
- (id)contactParentsForContact:(void *)a3 contactParents:;
- (id)contactParentsUsingRegexNamesUsingContacts:(void *)a1;
- (id)contactRelationsUsingMe:(uint64_t)a1;
- (id)contactsEmergency;
- (id)contactsEmergencyFamily;
- (id)contactsInContactStore;
- (id)contactsInHome;
- (id)contactsInHomeForContact:(void *)a3 homeContacts:;
- (id)dataPath;
- (id)fetchEmergencyContacts;
- (id)fetchInteractionFeatureDictionaryWithPredicate:(void *)a3 store:(void *)a4 sortDescription:;
- (id)getThirdPartyPredicateForContact:(void *)a3 handles:;
- (id)initWithStorage:(void *)a3 contactStore:(void *)a4 medicalIDStore:(void *)a5 activity:(void *)a6 sessionPath:(void *)a7 dataDirectory:(void *)a8 collectionDate:(double)a9 samplingRate:(void *)a10 maxBatches:(void *)a11 daysPerBatch:;
- (id)labelMembers;
- (id)personRelationshipVocabularyByLocaleDictionary;
- (id)photosPeople;
- (id)queryContactsForGivenName:(uint64_t)a1;
- (id)relationshipRegularExpressionForRelationship;
- (id)submissionBlock;
- (id)thirdPartyMessageFeaturesFromFeatureDictionary:(uint64_t)a1;
- (id)truncatedFileHandle;
- (uint64_t)indexToInsertDate:(void *)a3 array:;
- (void)_execute;
- (void)airDropPeopleAtHome;
- (void)cleanup;
- (void)contactsEmergency;
- (void)execute;
- (void)labelMembers;
- (void)messagesCumulativeFeaturesFromInteractionsBatch:(void *)a3 mutableMessagesDictionary:;
- (void)messagesFeaturesFromCumulativeDict:(uint64_t)a1;
- (void)setSubmissionBlock:(id)a3;
- (void)submitDataForCollection;
- (void)truncatedFileHandle;
@end

@implementation _CDCloudFamilyDataCollectionTask

- (_CDCloudFamilyDataCollectionTask)initWithActivity:(id)a3
{
  id v4 = a3;
  v5 = NSTemporaryDirectory();
  uint64_t v6 = [v5 stringByAppendingPathComponent:@"CoreDuet/DataCollection/CloudFamily"];

  v7 = [MEMORY[0x1E4F1C9C8] date];
  double v8 = 1.0;
  if (!CRIsAppleInternal())
  {
    v9 = OSAGetDATaskingValue();
    if (v9)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v9 doubleValue];
        double v8 = v10;
      }
    }
  }
  v11 = OSAGetDATaskingValue();
  v28 = (void *)v6;
  if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    uint64_t v26 = [v11 unsignedIntegerValue];
  }
  else {
    uint64_t v26 = 12;
  }
  v12 = OSAGetDATaskingValue();
  v27 = v11;
  if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    uint64_t v13 = [v12 unsignedIntegerValue];
  }
  else {
    uint64_t v13 = 30;
  }
  v14 = +[_CDInteractionStore defaultDatabaseDirectory];
  v15 = +[_CDInteractionStore storeWithDirectory:v14 readOnly:1];
  id v16 = objc_alloc_init((Class)getCNContactStoreClass());
  id v17 = objc_alloc((Class)getHKMedicalIDStoreClass());
  id v18 = objc_alloc_init((Class)getHKHealthStoreClass());
  v19 = (void *)[v17 initWithHealthStore:v18];
  v20 = self;
  v21 = v4;
  v22 = v4;
  v23 = v7;
  v24 = (_CDCloudFamilyDataCollectionTask *)-[_CDCloudFamilyDataCollectionTask initWithStorage:contactStore:medicalIDStore:activity:sessionPath:dataDirectory:collectionDate:samplingRate:maxBatches:daysPerBatch:]((id *)&v20->super.isa, v15, v16, v19, v22, @"/var/mobile/Library/CoreDuet/DataCollection/CloudFamily/session.archive", v28, v7, v8, (void *)v26, (void *)v13);

  return v24;
}

- (id)initWithStorage:(void *)a3 contactStore:(void *)a4 medicalIDStore:(void *)a5 activity:(void *)a6 sessionPath:(void *)a7 dataDirectory:(void *)a8 collectionDate:(double)a9 samplingRate:(void *)a10 maxBatches:(void *)a11 daysPerBatch:
{
  id v20 = a2;
  id v41 = a3;
  id v40 = a4;
  id v39 = a5;
  id v21 = a6;
  id v22 = a7;
  id v23 = a8;
  if (a1)
  {
    v46.receiver = a1;
    v46.super_class = (Class)_CDCloudFamilyDataCollectionTask;
    a1 = (id *)objc_msgSendSuper2(&v46, sel_init);
    if (a1)
    {
      objc_initWeak(&location, a1);
      id v24 = objc_alloc(MEMORY[0x1E4F93B68]);
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __167___CDCloudFamilyDataCollectionTask_initWithStorage_contactStore_medicalIDStore_activity_sessionPath_dataDirectory_collectionDate_samplingRate_maxBatches_daysPerBatch___block_invoke;
      v43[3] = &unk_1E560F898;
      objc_copyWeak(&v44, &location);
      uint64_t v25 = [v24 initWithBlock:v43];
      id v26 = a1[16];
      a1[16] = (id)v25;

      objc_storeStrong(a1 + 7, a2);
      objc_storeStrong(a1 + 8, a3);
      objc_storeStrong(a1 + 9, a4);
      objc_storeStrong(a1 + 2, a5);
      uint64_t v27 = [v21 copy];
      id v28 = a1[5];
      a1[5] = (id)v27;

      v29 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:a1[5] options:0 error:0];
      if (v29)
      {
        id v42 = 0;
        v30 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v29 error:&v42];
        id v31 = v42;
        if (v31)
        {
          v32 = +[_CDLogging dataCollectionChannel];
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
            -[_CDCloudFamilyDataCollectionTask initWithStorage:contactStore:medicalIDStore:activity:sessionPath:dataDirectory:collectionDate:samplingRate:maxBatches:daysPerBatch:]();
          }
        }
      }
      else
      {
        v30 = 0;
      }
      objc_storeStrong(a1 + 11, v30);
      uint64_t v33 = [v22 copy];
      id v34 = a1[4];
      a1[4] = (id)v33;

      uint64_t v35 = [v23 copy];
      id v36 = a1[6];
      a1[6] = (id)v35;

      *((double *)a1 + 12) = a9;
      a1[13] = a10;
      a1[14] = a11;
      *((unsigned char *)a1 + 9) = 1;
      id v37 = a1[3];
      a1[3] = &__block_literal_global_47;

      objc_destroyWeak(&v44);
      objc_destroyWeak(&location);
    }
  }

  return a1;
}

- (id)contactKeysToFetch
{
  v12[9] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v1 = getCNContactIdentifierKey();
    v12[0] = v1;
    v2 = getCNContactBirthdayKey();
    v12[1] = v2;
    v3 = getCNContactRelationsKey();
    v12[2] = v3;
    id v4 = getCNContactGivenNameKey();
    v12[3] = v4;
    v5 = getCNContactMiddleNameKey();
    v12[4] = v5;
    uint64_t v6 = getCNContactFamilyNameKey();
    v12[5] = v6;
    v7 = getCNContactNicknameKey();
    v12[6] = v7;
    double v8 = getCNContactPhoneNumbersKey();
    v12[7] = v8;
    v9 = getCNContactEmailAddressesKey();
    v12[8] = v9;
    double v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:9];
  }
  else
  {
    double v10 = 0;
  }
  return v10;
}

- (id)contactRelationsUsingMe:(uint64_t)a1
{
  v43[7] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v30 = v3;
  uint64_t v31 = a1;
  if (a1)
  {
    id v4 = v3;
    v5 = [MEMORY[0x1E4F1CA80] set];
    uint64_t v6 = getCNLabelContactRelationManager();
    v43[0] = v6;
    v7 = getCNLabelContactRelationAssistant();
    v43[1] = v7;
    double v8 = getCNLabelContactRelationColleague();
    v43[2] = v8;
    v9 = getCNLabelContactRelationTeacher();
    v43[3] = v9;
    double v10 = getCNLabelContactRelationFriend();
    void v43[4] = v10;
    v11 = getCNLabelContactRelationMaleFriend();
    v43[5] = v11;
    v12 = getCNLabelContactRelationFemaleFriend();
    v43[6] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:7];

    [v4 contactRelations];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v38 != v16) {
            objc_enumerationMutation(obj);
          }
          id v18 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          v19 = [v18 label];
          char v20 = [v13 containsObject:v19];

          if ((v20 & 1) == 0)
          {
            id v21 = [v18 value];
            id v22 = [v21 name];

            id v23 = -[_CDCloudFamilyDataCollectionTask queryContactsForGivenName:](v31, v22);
            long long v33 = 0u;
            long long v34 = 0u;
            long long v35 = 0u;
            long long v36 = 0u;
            uint64_t v24 = [v23 countByEnumeratingWithState:&v33 objects:v41 count:16];
            if (v24)
            {
              uint64_t v25 = v24;
              uint64_t v26 = *(void *)v34;
              do
              {
                for (uint64_t j = 0; j != v25; ++j)
                {
                  if (*(void *)v34 != v26) {
                    objc_enumerationMutation(v23);
                  }
                  [v5 addObject:*(void *)(*((void *)&v33 + 1) + 8 * j)];
                }
                uint64_t v25 = [v23 countByEnumeratingWithState:&v33 objects:v41 count:16];
              }
              while (v25);
            }
          }
        }
        uint64_t v15 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v15);
    }
    id v28 = [v5 allObjects];
  }
  else
  {
    id v28 = 0;
  }

  return v28;
}

- (id)avgOfAllCallsUsingManager:(uint64_t)a1
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = [a2 callsWithPredicate:0 limit:0 offset:0 batchSize:0];
    uint64_t v3 = [v2 count];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v4 = v2;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
      double v8 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "duration", (void)v13);
          double v8 = v8 + v10;
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v6);
    }
    else
    {
      double v8 = 0.0;
    }

    v11 = [NSNumber numberWithDouble:v8 / (double)v3];
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (id)contactsEmergencyFamily
{
  v47[7] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    long long v34 = [MEMORY[0x1E4F1CA80] set];
    v2 = getCNLabelContactRelationManager();
    v47[0] = v2;
    uint64_t v3 = getCNLabelContactRelationAssistant();
    v47[1] = v3;
    id v4 = getCNLabelContactRelationColleague();
    v47[2] = v4;
    uint64_t v5 = getCNLabelContactRelationTeacher();
    v47[3] = v5;
    uint64_t v6 = getCNLabelContactRelationFriend();
    v47[4] = v6;
    uint64_t v7 = getCNLabelContactRelationMaleFriend();
    v47[5] = v7;
    double v8 = getCNLabelContactRelationFemaleFriend();
    v47[6] = v8;
    long long v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:7];

    -[_CDCloudFamilyDataCollectionTask fetchEmergencyContacts](a1);
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
    if (v9)
    {
      uint64_t v11 = v9;
      uint64_t v36 = a1;
      id v12 = 0;
      uint64_t v13 = *(void *)v41;
      *(void *)&long long v10 = 138412290;
      long long v33 = v10;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v41 != v13) {
            objc_enumerationMutation(obj);
          }
          long long v15 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          long long v16 = objc_msgSend(v15, "relationship", v33);
          char v17 = [v37 containsObject:v16];

          if ((v17 & 1) == 0)
          {
            uint64_t v18 = [v15 nameContactIdentifier];

            if (v18)
            {
              id v19 = *(id *)(v36 + 64);
              char v20 = [v15 nameContactIdentifier];
              id v21 = -[_CDCloudFamilyDataCollectionTask contactKeysToFetch](v36);
              id v39 = v12;
              id v22 = [v19 unifiedContactWithIdentifier:v20 keysToFetch:v21 error:&v39];
              id v23 = v39;

              uint64_t v24 = +[_CDLogging dataCollectionChannel];
              if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v33;
                id v45 = v23;
                _os_log_error_impl(&dword_18ECEB000, v24, OS_LOG_TYPE_ERROR, "Error querying contacts %@", buf, 0xCu);
              }

              if (v22) {
                [v34 addObject:v22];
              }
            }
            else
            {
              id v23 = v12;
            }
            uint64_t v25 = [v15 phoneNumberContactIdentifier];

            if (v25)
            {
              id v26 = *(id *)(v36 + 64);
              uint64_t v27 = [v15 phoneNumberContactIdentifier];
              id v28 = -[_CDCloudFamilyDataCollectionTask contactKeysToFetch](v36);
              id v38 = v23;
              v29 = [v26 unifiedContactWithIdentifier:v27 keysToFetch:v28 error:&v38];
              id v12 = v38;

              v30 = +[_CDLogging dataCollectionChannel];
              if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v33;
                id v45 = v12;
                _os_log_error_impl(&dword_18ECEB000, v30, OS_LOG_TYPE_ERROR, "Error querying contacts %@", buf, 0xCu);
              }

              if (v29) {
                [v34 addObject:v29];
              }
            }
            else
            {
              id v12 = v23;
            }
          }
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
      }
      while (v11);
    }
    else
    {
      id v12 = 0;
    }
    uint64_t v31 = [v34 allObjects];
  }
  else
  {
    uint64_t v31 = 0;
  }
  return v31;
}

- (id)contactsEmergency
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v25 = *(id *)(a1 + 72);
    id v28 = [MEMORY[0x1E4F1CA80] set];
    uint64_t v39 = 0;
    long long v40 = &v39;
    uint64_t v41 = 0x3032000000;
    long long v42 = __Block_byref_object_copy__14;
    long long v43 = __Block_byref_object_dispose__14;
    id v44 = 0;
    dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __53___CDCloudFamilyDataCollectionTask_contactsEmergency__block_invoke;
    v36[3] = &unk_1E560F978;
    id v38 = &v39;
    dispatch_semaphore_t dsema = v2;
    dispatch_semaphore_t v37 = dsema;
    [v25 fetchMedicalIDEmergencyContactsWithCompletion:v36];
    dispatch_time_t v3 = dispatch_time(0, 300000000000);
    if (dispatch_semaphore_wait(dsema, v3))
    {
      id v4 = +[_CDLogging dataCollectionChannel];
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
        -[_CDCloudFamilyDataCollectionTask contactsEmergency]();
      }

      uint64_t v5 = [MEMORY[0x1E4F1CA80] set];

      id v28 = (void *)v5;
    }
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    obuint64_t j = (id)v40[5];
    id v6 = 0;
    uint64_t v7 = [obj countByEnumeratingWithState:&v32 objects:v47 count:16];
    if (v7)
    {
      uint64_t v29 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v33 != v29) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          long long v10 = [v9 nameContactIdentifier];

          if (v10)
          {
            id v11 = *(id *)(a1 + 64);
            id v12 = [v9 nameContactIdentifier];
            uint64_t v13 = -[_CDCloudFamilyDataCollectionTask contactKeysToFetch](a1);
            id v31 = v6;
            long long v14 = [v11 unifiedContactWithIdentifier:v12 keysToFetch:v13 error:&v31];
            id v15 = v31;

            long long v16 = +[_CDLogging dataCollectionChannel];
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v46 = v15;
              _os_log_error_impl(&dword_18ECEB000, v16, OS_LOG_TYPE_ERROR, "Error querying contacts %@", buf, 0xCu);
            }

            if (v14) {
              [v28 addObject:v14];
            }
          }
          else
          {
            id v15 = v6;
          }
          char v17 = [v9 phoneNumberContactIdentifier];

          if (v17)
          {
            id v18 = *(id *)(a1 + 64);
            id v19 = [v9 phoneNumberContactIdentifier];
            char v20 = -[_CDCloudFamilyDataCollectionTask contactKeysToFetch](a1);
            id v30 = v15;
            id v21 = [v18 unifiedContactWithIdentifier:v19 keysToFetch:v20 error:&v30];
            id v6 = v30;

            id v22 = +[_CDLogging dataCollectionChannel];
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v46 = v6;
              _os_log_error_impl(&dword_18ECEB000, v22, OS_LOG_TYPE_ERROR, "Error querying contacts %@", buf, 0xCu);
            }

            if (v21) {
              [v28 addObject:v21];
            }
          }
          else
          {
            id v6 = v15;
          }
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v32 objects:v47 count:16];
      }
      while (v7);
    }

    id v23 = [v28 allObjects];

    _Block_object_dispose(&v39, 8);
  }
  else
  {
    id v23 = 0;
  }
  return v23;
}

- (id)contactsInContactStore
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v11 = 0;
    id v12 = &v11;
    uint64_t v13 = 0x3032000000;
    long long v14 = __Block_byref_object_copy__14;
    id v15 = __Block_byref_object_dispose__14;
    id v16 = [MEMORY[0x1E4F1CA80] set];
    id v2 = objc_alloc_init((Class)getCNContactStoreClass());
    id v3 = objc_alloc((Class)getCNContactFetchRequestClass());
    id v4 = -[_CDCloudFamilyDataCollectionTask contactKeysToFetch](a1);
    uint64_t v5 = (void *)[v3 initWithKeysToFetch:v4];

    [v5 setContactBatchCount:25];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __58___CDCloudFamilyDataCollectionTask_contactsInContactStore__block_invoke;
    v10[3] = &unk_1E560F908;
    v10[4] = &v11;
    [v2 enumerateContactsWithFetchRequest:v5 error:0 usingBlock:v10];
    id v6 = +[_CDLogging dataCollectionChannel];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = [(id)v12[5] count];
      *(_DWORD *)buf = 134217984;
      uint64_t v18 = v7;
      _os_log_impl(&dword_18ECEB000, v6, OS_LOG_TYPE_INFO, "_PSFamilyRecommender: Fetched %tu contact ids from contact store", buf, 0xCu);
    }

    double v8 = [(id)v12[5] allObjects];

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    double v8 = 0;
  }
  return v8;
}

- (id)contactParentsUsingRegexNamesUsingContacts:(void *)a1
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v23 = v3;
  if (a1)
  {
    id v4 = v3;
    id v26 = -[_CDCloudFamilyDataCollectionTask relationshipRegularExpressionForRelationship](a1);
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA80], "set", v23);
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    obuint64_t j = v4;
    uint64_t v27 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (!v27) {
      goto LABEL_26;
    }
    uint64_t v25 = *(void *)v36;
    while (1)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v36 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v28 = v6;
        uint64_t v7 = *(void **)(*((void *)&v35 + 1) + 8 * v6);
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id v8 = v26;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v31 objects:v39 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v32;
          id v29 = v8;
          do
          {
            uint64_t v12 = 0;
            uint64_t v30 = v10;
            do
            {
              if (*(void *)v32 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void **)(*((void *)&v31 + 1) + 8 * v12);
              long long v14 = [v7 givenName];
              if (-[_CDCloudFamilyDataCollectionTask regexMatchForRegex:string:]((uint64_t)a1, v13, v14)) {
                goto LABEL_17;
              }
              id v15 = [v7 middleName];
              if (-[_CDCloudFamilyDataCollectionTask regexMatchForRegex:string:]((uint64_t)a1, v13, v15)) {
                goto LABEL_16;
              }
              id v16 = [v7 familyName];
              if (-[_CDCloudFamilyDataCollectionTask regexMatchForRegex:string:]((uint64_t)a1, v13, v16))
              {

                uint64_t v10 = v30;
LABEL_16:

LABEL_17:
LABEL_18:
                [v5 addObject:v7];
                goto LABEL_19;
              }
              [v7 nickname];
              v18 = char v17 = v5;
              BOOL v19 = -[_CDCloudFamilyDataCollectionTask regexMatchForRegex:string:]((uint64_t)a1, v13, v18);

              uint64_t v5 = v17;
              id v8 = v29;

              uint64_t v10 = v30;
              if (v19) {
                goto LABEL_18;
              }
LABEL_19:
              ++v12;
            }
            while (v10 != v12);
            uint64_t v20 = [v8 countByEnumeratingWithState:&v31 objects:v39 count:16];
            uint64_t v10 = v20;
          }
          while (v20);
        }

        uint64_t v6 = v28 + 1;
      }
      while (v28 + 1 != v27);
      uint64_t v27 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
      if (!v27)
      {
LABEL_26:

        id v21 = [v5 allObjects];

        goto LABEL_27;
      }
    }
  }
  id v21 = 0;
LABEL_27:

  return v21;
}

- (id)photosPeople
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    getPHFetchOptionsClass();
    id v2 = objc_opt_new();
    [v2 setPersonContext:1];
    uint64_t v18 = v2;
    id v3 = [getPHPersonClass() fetchPersonsWithOptions:v2];
    id v19 = [MEMORY[0x1E4F1CA80] set];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v21 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          uint64_t v10 = (void *)MEMORY[0x192FB2F20]();
          id v11 = *(id *)(a1 + 64);
          uint64_t v12 = [v9 contactMatchingDictionary];
          uint64_t v13 = -[_CDCloudFamilyDataCollectionTask contactKeysToFetch](a1);
          long long v14 = [v11 contactWithMatchingDictionary:v12 keysToFetch:v13];

          id v15 = [v14 identifier];

          if (v15)
          {
            id v16 = [v14 identifier];
            [v19 addObject:v16];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v6);
    }
  }
  else
  {
    id v19 = 0;
  }
  return v19;
}

- (id)airDropPeople
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v2 = -[_CDCloudFamilyDataCollectionTask allAirDropInteractionsFromStore:fetchLimit:](a1, *(void **)(a1 + 56), 0);
    id v23 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    obuint64_t j = v2;
    uint64_t v3 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v26 != v5) {
            objc_enumerationMutation(obj);
          }
          uint64_t v7 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          id v8 = objc_msgSend(v7, "recipients", v23);
          uint64_t v9 = [v8 firstObject];
          uint64_t v10 = [v9 personId];

          if (v10)
          {
            id v11 = *(id *)(a1 + 64);
            uint64_t v12 = [v7 recipients];
            uint64_t v13 = [v12 firstObject];
            long long v14 = [v13 personId];
            id v15 = -[_CDCloudFamilyDataCollectionTask contactKeysToFetch](a1);
            id v16 = [v11 unifiedContactWithIdentifier:v14 keysToFetch:v15 error:0];

            if (v16)
            {
              char v17 = NSNumber;
              uint64_t v18 = [v16 identifier];
              id v19 = [v23 objectForKeyedSubscript:v18];
              long long v20 = objc_msgSend(v17, "numberWithInteger:", objc_msgSend(v19, "integerValue") + 1);
              long long v21 = [v16 identifier];
              [v23 setObject:v20 forKeyedSubscript:v21];
            }
          }
        }
        uint64_t v4 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v4);
    }
  }
  else
  {
    id v23 = 0;
  }
  return v23;
}

- (id)airDropPeopleAtHome
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    id v51 = 0;
    goto LABEL_38;
  }
  context = (void *)MEMORY[0x192FB2F20]();
  v50 = [getRTRoutineManagerClass() defaultManager];
  uint64_t v74 = 0;
  v75 = &v74;
  uint64_t v76 = 0x3032000000;
  v77 = __Block_byref_object_copy__14;
  v78 = __Block_byref_object_dispose__14;
  id v79 = 0;
  uint64_t v71 = 0;
  v72[0] = &v71;
  v72[1] = 0x3032000000;
  v72[2] = __Block_byref_object_copy__14;
  v72[3] = __Block_byref_object_dispose__14;
  id v73 = 0;
  v1 = [MEMORY[0x1E4F1CA48] array];
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  v67[0] = MEMORY[0x1E4F143A8];
  v67[1] = 3221225472;
  v67[2] = __55___CDCloudFamilyDataCollectionTask_airDropPeopleAtHome__block_invoke;
  v67[3] = &unk_1E560E768;
  v69 = &v74;
  v70 = &v71;
  uint64_t v3 = v2;
  v68 = v3;
  [v50 fetchLocationsOfInterestOfType:0 withHandler:v67];
  dispatch_time_t v4 = dispatch_time(0, 300000000000);
  v49 = v3;
  if (dispatch_semaphore_wait(v3, v4))
  {
    uint64_t v5 = +[_CDLogging dataCollectionChannel];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[_CDCloudFamilyDataCollectionTask airDropPeopleAtHome]();
    }
LABEL_23:

    goto LABEL_24;
  }
  if (*(void *)(v72[0] + 40))
  {
    uint64_t v5 = +[_CDLogging dataCollectionChannel];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      [(_CDCloudFamilyDataCollectionTask *)(uint64_t)v72 airDropPeopleAtHome];
    }
    goto LABEL_23;
  }
  if (v75[5])
  {
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    uint64_t v5 = (id)v75[5];
    uint64_t v12 = [v5 countByEnumeratingWithState:&v63 objects:v82 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v64;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v64 != v13) {
            objc_enumerationMutation(v5);
          }
          id v15 = *(void **)(*((void *)&v63 + 1) + 8 * i);
          long long v59 = 0u;
          long long v60 = 0u;
          long long v61 = 0u;
          long long v62 = 0u;
          id v16 = [v15 visits];
          uint64_t v17 = [v16 countByEnumeratingWithState:&v59 objects:v81 count:16];
          if (v17)
          {
            uint64_t v18 = *(void *)v60;
            do
            {
              for (uint64_t j = 0; j != v17; ++j)
              {
                if (*(void *)v60 != v18) {
                  objc_enumerationMutation(v16);
                }
                [v1 addObject:*(void *)(*((void *)&v59 + 1) + 8 * j)];
              }
              uint64_t v17 = [v16 countByEnumeratingWithState:&v59 objects:v81 count:16];
            }
            while (v17);
          }
        }
        uint64_t v12 = [v5 countByEnumeratingWithState:&v63 objects:v82 count:16];
      }
      while (v12);
    }
    goto LABEL_23;
  }
LABEL_24:
  v53 = [v1 valueForKey:@"entryDate"];
  id v51 = [MEMORY[0x1E4F1CA60] dictionary];
  id v20 = *(id *)(a1 + 56);
  long long v21 = -[_CDCloudFamilyDataCollectionTask allAirDropInteractionsFromStore:fetchLimit:](a1, v20, 0);

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  obuint64_t j = v21;
  uint64_t v22 = [obj countByEnumeratingWithState:&v55 objects:v80 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v56;
    do
    {
      for (uint64_t k = 0; k != v22; ++k)
      {
        if (*(void *)v56 != v23) {
          objc_enumerationMutation(obj);
        }
        long long v25 = *(void **)(*((void *)&v55 + 1) + 8 * k);
        long long v26 = [v25 recipients];
        long long v27 = [v26 firstObject];
        long long v28 = [v27 personId];

        if (v28)
        {
          id v29 = [v25 startDate];
          uint64_t v30 = -[_CDCloudFamilyDataCollectionTask indexToInsertDate:array:](a1, v29, v53);

          if (v30)
          {
            long long v31 = [v1 objectAtIndexedSubscript:v30 - 1];
            long long v32 = [v31 exitDate];
            long long v33 = [v25 startDate];
            [v32 timeIntervalSinceDate:v33];
            BOOL v35 = v34 > 0.0;

            if (v35)
            {
              id v36 = *(id *)(a1 + 64);
              long long v37 = [v25 recipients];
              long long v38 = [v37 firstObject];
              uint64_t v39 = [v38 personId];
              long long v40 = -[_CDCloudFamilyDataCollectionTask contactKeysToFetch](a1);
              uint64_t v41 = [v36 unifiedContactWithIdentifier:v39 keysToFetch:v40 error:0];

              if (v41)
              {
                long long v42 = NSNumber;
                long long v43 = [v41 identifier];
                id v44 = [v51 objectForKeyedSubscript:v43];
                id v45 = objc_msgSend(v42, "numberWithInteger:", objc_msgSend(v44, "integerValue") + 1);
                id v46 = [v41 identifier];
                [v51 setObject:v45 forKeyedSubscript:v46];
              }
            }
          }
        }
      }
      uint64_t v22 = [obj countByEnumeratingWithState:&v55 objects:v80 count:16];
    }
    while (v22);
  }

  _Block_object_dispose(&v71, 8);
  _Block_object_dispose(&v74, 8);

LABEL_38:
  return v51;
}

- (id)contactsInHome
{
  if (a1)
  {
    v1 = +[_CDHomeManagerUtilities sharedInstance];
    dispatch_semaphore_t v2 = [v1 contactsInHome];
  }
  else
  {
    dispatch_semaphore_t v2 = 0;
  }
  return v2;
}

- (void)execute
{
  -[_CDCloudFamilyDataCollectionTask _execute](self);
  -[_CDCloudFamilyDataCollectionTask cleanup]((uint64_t)self);
}

- (void)_execute
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_18ECEB000, v0, v1, "Selected for cloud family data collection", v2, v3, v4, v5, v6);
}

- (void)cleanup
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_18ECEB000, v0, v1, "Error remove previous session file: %@", v2, v3, v4, v5, v6);
}

- (id)labelMembers
{
  if (a1)
  {
    id v1 = objc_alloc_init((Class)getFAFetchFamilyCircleRequestClass());
    uint64_t v24 = 0;
    long long v25 = &v24;
    uint64_t v26 = 0x3032000000;
    long long v27 = __Block_byref_object_copy__14;
    long long v28 = __Block_byref_object_dispose__14;
    id v29 = [MEMORY[0x1E4F1CA48] array];
    dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __48___CDCloudFamilyDataCollectionTask_labelMembers__block_invoke;
    v21[3] = &unk_1E560F950;
    uint64_t v23 = &v24;
    uint64_t v3 = v2;
    uint64_t v22 = v3;
    [v1 startRequestWithCompletionHandler:v21];
    dispatch_time_t v4 = dispatch_time(0, 300000000000);
    if (dispatch_semaphore_wait(v3, v4))
    {
      uint64_t v5 = +[_CDLogging dataCollectionChannel];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[_CDCloudFamilyDataCollectionTask labelMembers]();
      }

      uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v7 = (void *)v25[5];
      v25[5] = v6;
    }
    if (![(id)v25[5] count])
    {
      [v1 setForceServerFetch:1];
      dispatch_semaphore_t v8 = dispatch_semaphore_create(0);

      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      uint64_t v17 = __48___CDCloudFamilyDataCollectionTask_labelMembers__block_invoke_1137;
      uint64_t v18 = &unk_1E560F950;
      id v20 = &v24;
      uint64_t v3 = v8;
      id v19 = v3;
      [v1 startRequestWithCompletionHandler:&v15];
      dispatch_time_t v9 = dispatch_time(0, 300000000000);
      if (dispatch_semaphore_wait(v3, v9))
      {
        uint64_t v10 = +[_CDLogging dataCollectionChannel];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
          -[_CDCloudFamilyDataCollectionTask labelMembers]();
        }

        uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
        uint64_t v12 = (void *)v25[5];
        v25[5] = v11;
      }
    }
    uint64_t v13 = objc_msgSend((id)v25[5], "copy", v15, v16, v17, v18);

    _Block_object_dispose(&v24, 8);
  }
  else
  {
    uint64_t v13 = 0;
  }
  return v13;
}

- (id)truncatedFileHandle
{
  if (a1)
  {
    id v1 = -[_CDCloudFamilyDataCollectionTask dataPath](a1);
    dispatch_semaphore_t v2 = [v1 stringByDeletingLastPathComponent];
    uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v10 = 0;
    [v3 createDirectoryAtPath:v2 withIntermediateDirectories:1 attributes:0 error:&v10];
    id v4 = v10;

    if (v4)
    {
      uint64_t v5 = +[_CDLogging dataCollectionChannel];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[_CDCloudFamilyDataCollectionTask truncatedFileHandle]();
      }

      uint64_t v6 = 0;
    }
    else
    {
      uint64_t v7 = [MEMORY[0x1E4F28CB8] defaultManager];
      dispatch_semaphore_t v8 = [MEMORY[0x1E4F1C9B8] data];
      [v7 createFileAtPath:v1 contents:v8 attributes:0];

      uint64_t v6 = [MEMORY[0x1E4F28CB0] fileHandleForWritingAtPath:v1];
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  return v6;
}

- (id)allEmailAndPhoneNumberHandlesForContact:(void *)a1
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    uint64_t v5 = [v3 phoneNumbers];
    uint64_t v6 = [v5 valueForKey:@"value"];

    a1 = [MEMORY[0x1E4F1CA48] array];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          uint64_t v13 = objc_msgSend(v12, "unformattedInternationalStringValue", (void)v18);

          if (v13)
          {
            long long v14 = [v12 unformattedInternationalStringValue];
            [a1 addObject:v14];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }

    uint64_t v15 = [v4 emailAddresses];
    uint64_t v16 = [v15 valueForKey:@"value"];

    [a1 addObjectsFromArray:v16];
  }

  return a1;
}

- (id)aggregateInteractionDataUsingStore:(void *)a3 contact:(void *)a4 callHistoryManager:(void *)a5 avgCallDur:
{
  v46[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v9 = (objc_class *)MEMORY[0x1E4F1CA60];
    id v40 = a5;
    id v39 = a4;
    id v42 = a3;
    id v10 = a2;
    id v35 = objc_alloc_init(v9);
    uint64_t v11 = -[_CDCloudFamilyDataCollectionTask allEmailAndPhoneNumberHandlesForContact:](a1, v42);
    uint64_t v41 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:0];
    uint64_t v12 = (void *)MEMORY[0x1E4F28F60];
    v46[0] = @"com.apple.MobileSMS";
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:1];
    long long v38 = [v12 predicateWithFormat:@"bundleId IN %@", v13];

    long long v14 = (void *)MEMORY[0x1E4F28F60];
    id v45 = @"com.apple.UIKit.activity.Message";
    uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1];
    long long v37 = [v14 predicateWithFormat:@"targetBundleId IN %@", v15];

    uint64_t v16 = (void *)MEMORY[0x1E4F28BA0];
    v44[0] = v38;
    v44[1] = v37;
    uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:2];
    id v36 = [v16 orPredicateWithSubpredicates:v17];

    double v34 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY recipients.identifier IN %@", v11];
    long long v18 = (void *)MEMORY[0x1E4F28BA0];
    v43[0] = v36;
    v43[1] = v34;
    long long v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:2];
    long long v20 = [v18 andPredicateWithSubpredicates:v19];

    long long v21 = -[_CDCloudFamilyDataCollectionTask fetchInteractionFeatureDictionaryWithPredicate:store:sortDescription:]((uint64_t)a1, v20, v10, v41);
    uint64_t v22 = v35;
    [v35 addEntriesFromDictionary:v21];
    uint64_t v23 = v11;
    long long v33 = v11;
    uint64_t v24 = -[_CDCloudFamilyDataCollectionTask getThirdPartyPredicateForContact:handles:]((uint64_t)a1, v42, v11);
    long long v25 = -[_CDCloudFamilyDataCollectionTask fetchInteractionFeatureDictionaryWithPredicate:store:sortDescription:]((uint64_t)a1, v24, v10, v41);

    uint64_t v26 = -[_CDCloudFamilyDataCollectionTask thirdPartyMessageFeaturesFromFeatureDictionary:]((uint64_t)a1, v25);
    [v35 addEntriesFromDictionary:v26];
    long long v27 = [getCHRecentCallClass() predicateForCallsWithAnyRemoteParticipantHandleNormalizedValues:v23];
    long long v28 = [v39 callsWithPredicate:v27 limit:0 offset:0 batchSize:0];

    [v40 doubleValue];
    double v30 = v29;

    long long v31 = -[_CDCloudFamilyDataCollectionTask callFeaturesFromInteractions:avgCallLength:contact:]((uint64_t)a1, v28, v42, v30);

    [v35 addEntriesFromDictionary:v31];
  }
  else
  {
    uint64_t v22 = 0;
  }
  return v22;
}

- (id)contactFamilyRelationForContact:(void *)a3 contactRelations:(void *)a4 me:
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v28 = v8;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v33 objects:v44 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v34;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v34 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          uint64_t v16 = [v7 identifier];
          uint64_t v17 = [v15 identifier];
          char v18 = [v16 isEqualToString:v17];

          if (v18)
          {
            id v42 = @"contactFamilyRelation";
            long long v43 = &unk_1EDE1DD00;
            a1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
            id v8 = v28;
            goto LABEL_21;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v33 objects:v44 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    -[_CDCloudFamilyDataCollectionTask contactRelationsUsingMe:]((uint64_t)a1, v7);
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = [v10 countByEnumeratingWithState:&v29 objects:v41 count:16];
    id v8 = v28;
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v30;
      while (2)
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v30 != v21) {
            objc_enumerationMutation(v10);
          }
          uint64_t v23 = *(void **)(*((void *)&v29 + 1) + 8 * j);
          uint64_t v24 = [v9 identifier];
          long long v25 = [v23 identifier];
          char v26 = [v24 isEqualToString:v25];

          if (v26)
          {
            id v39 = @"contactFamilyRelation";
            id v40 = &unk_1EDE1DD00;
            a1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v40 forKeys:&v39 count:1];

            goto LABEL_21;
          }
        }
        uint64_t v20 = [v10 countByEnumeratingWithState:&v29 objects:v41 count:16];
        if (v20) {
          continue;
        }
        break;
      }
    }

    long long v37 = @"contactFamilyRelation";
    long long v38 = &unk_1EDE1DCE8;
    a1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
LABEL_21:
  }
  return a1;
}

- (id)contactFamilyEmergencyForContact:(void *)a3 contactFamilyEmergency:
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (a1)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          long long v14 = objc_msgSend(v5, "identifier", (void)v19);
          uint64_t v15 = [v13 identifier];
          char v16 = [v14 isEqualToString:v15];

          if (v16)
          {
            long long v25 = @"contactEmergencyFamily";
            char v26 = &unk_1EDE1DD00;
            uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];

            goto LABEL_12;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    uint64_t v23 = @"contactEmergencyFamily";
    uint64_t v24 = &unk_1EDE1DCE8;
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
  }
  else
  {
    uint64_t v17 = 0;
  }
LABEL_12:

  return v17;
}

- (id)contactEmergencyForContact:(void *)a3 contactEmergency:
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (a1)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          long long v14 = objc_msgSend(v5, "identifier", (void)v19);
          uint64_t v15 = [v13 identifier];
          char v16 = [v14 isEqualToString:v15];

          if (v16)
          {
            long long v25 = @"contactEmergency";
            char v26 = &unk_1EDE1DD00;
            uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];

            goto LABEL_12;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    uint64_t v23 = @"contactEmergency";
    uint64_t v24 = &unk_1EDE1DCE8;
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
  }
  else
  {
    uint64_t v17 = 0;
  }
LABEL_12:

  return v17;
}

- (id)contactParentsForContact:(void *)a3 contactParents:
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (a1)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          long long v14 = objc_msgSend(v5, "identifier", (void)v19);
          uint64_t v15 = [v13 identifier];
          char v16 = [v14 isEqualToString:v15];

          if (v16)
          {
            long long v25 = @"contactParent";
            char v26 = &unk_1EDE1DD00;
            uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];

            goto LABEL_12;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    uint64_t v23 = @"contactParent";
    uint64_t v24 = &unk_1EDE1DCE8;
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
  }
  else
  {
    uint64_t v17 = 0;
  }
LABEL_12:

  return v17;
}

- (id)contactsInHomeForContact:(void *)a3 homeContacts:
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (a1)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          long long v14 = objc_msgSend(v5, "identifier", (void)v19);
          uint64_t v15 = [v13 identifier];
          char v16 = [v14 isEqualToString:v15];

          if (v16)
          {
            long long v25 = @"contactInHome";
            char v26 = &unk_1EDE1DD00;
            uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];

            goto LABEL_12;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    uint64_t v23 = @"contactInHome";
    uint64_t v24 = &unk_1EDE1DCE8;
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
  }
  else
  {
    uint64_t v17 = 0;
  }
LABEL_12:

  return v17;
}

- (id)contactFamilyNameForContact:(void *)a3 me:
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (a1)
  {
    id v8 = [v6 familyName];
    uint64_t v9 = [v7 familyName];
    if (v9)
    {
      uint64_t v10 = (void *)v9;
      uint64_t v11 = [v5 familyName];
      if (v11)
      {
        uint64_t v12 = (void *)v11;
        uint64_t v13 = [v7 familyName];
        long long v14 = [v5 familyName];
        uint64_t v15 = [v8 length];
        char v16 = [MEMORY[0x1E4F1CA20] currentLocale];
        uint64_t v17 = objc_msgSend(v13, "compare:options:range:locale:", v14, 129, 0, v15, v16);

        if (!v17)
        {
          long long v25 = @"contactFamilyName";
          v26[0] = &unk_1EDE1DD00;
          char v18 = (void *)MEMORY[0x1E4F1C9E8];
          long long v19 = (void **)v26;
          long long v20 = &v25;
LABEL_8:
          long long v21 = [v18 dictionaryWithObjects:v19 forKeys:v20 count:1];

          goto LABEL_9;
        }
      }
      else
      {
      }
    }
    uint64_t v23 = @"contactFamilyName";
    uint64_t v24 = &unk_1EDE1DCE8;
    char v18 = (void *)MEMORY[0x1E4F1C9E8];
    long long v19 = &v24;
    long long v20 = &v23;
    goto LABEL_8;
  }
  long long v21 = 0;
LABEL_9:

  return v21;
}

- (BOOL)submitDataForCollection
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  dispatch_semaphore_t v2 = +[_CDLogging dataCollectionChannel];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    -[_CDCloudFamilyDataCollectionTask submitDataForCollection]();
  }

  id v3 = -[_CDCloudFamilyDataCollectionTask dataPath](a1);
  id v4 = [v3 stringByAppendingPathExtension:@"tar.gz"];
  id v5 = v3;
  id v6 = (const char *)[v5 fileSystemRepresentation];
  id v7 = [v5 lastPathComponent];
  [v7 fileSystemRepresentation];

  id v8 = v4;
  [v8 fileSystemRepresentation];
  archive_write_new();
  if (!archive_write_add_filter_gzip()
    && !archive_write_set_format_pax_restricted()
    && !archive_write_open_filename())
  {
    memset(&v20, 0, sizeof(v20));
    stat(v6, &v20);
    archive_entry_new();
    archive_entry_set_size();
    archive_entry_set_filetype();
    archive_entry_set_perm();
    archive_entry_set_pathname();
    if (!archive_write_header())
    {
      int v14 = open(v6, 0);
      while (read(v14, v21, 0x2000uLL))
        archive_write_data();
      close(v14);
      archive_entry_free();
      archive_write_close();
      archive_write_free();
      id v19 = 0;
      uint64_t v15 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v8 options:8 error:&v19];
      id v16 = v19;
      BOOL v12 = v16 == 0;
      if (v16)
      {
        uint64_t v17 = +[_CDLogging dataCollectionChannel];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          -[_CDCloudFamilyDataCollectionTask submitDataForCollection]();
        }
      }
      else
      {
        uint64_t v17 = [v8 lastPathComponent];
        char v18 = [a1 submissionBlock];
        ((void (**)(void, NSObject *, void *))v18)[2](v18, v17, v15);
      }
      goto LABEL_12;
    }
    archive_entry_free();
  }
  uint64_t v9 = archive_errno();
  uint64_t v10 = archive_error_string();
  uint64_t v11 = +[_CDLogging dataCollectionChannel];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    [(_CDCloudFamilyDataCollectionTask *)v9 submitDataForCollection];
  }

  archive_write_close();
  archive_write_free();
  BOOL v12 = 0;
LABEL_12:

  return v12;
}

- (id)dataPath
{
  id v1 = a1;
  if (a1)
  {
    if (a1[11])
    {
      dispatch_semaphore_t v2 = a1[11];
      if (v2) {
        id v3 = (void *)v2[1];
      }
      else {
        id v3 = 0;
      }
      id v4 = NSNumber;
      id v5 = a1[11];
      if (v5) {
        uint64_t v6 = v5[5];
      }
      else {
        uint64_t v6 = 0;
      }
      id v7 = v5;
      id v8 = v3;
      uint64_t v9 = v2;
      uint64_t v10 = [v4 numberWithUnsignedInteger:v6];
      uint64_t v11 = [v8 stringByAppendingFormat:@".%@.json", v10];

      id v1 = [v1[4] stringByAppendingPathComponent:v11];
    }
    else
    {
      id v1 = 0;
    }
  }
  return v1;
}

- (uint64_t)indexToInsertDate:(void *)a3 array:
{
  if (result)
  {
    id v4 = a3;
    id v5 = a2;
    uint64_t v6 = objc_msgSend(v4, "indexOfObject:inSortedRange:options:usingComparator:", v5, 0, objc_msgSend(v4, "count"), 1024, &__block_literal_global_1108);

    return v6;
  }
  return result;
}

- (id)allAirDropInteractionsFromStore:(uint64_t)a3 fetchLimit:
{
  v19[2] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v4 = (void *)MEMORY[0x1E4F28F60];
    id v5 = a2;
    uint64_t v6 = [v4 predicateWithFormat:@"(targetBundleId == %@)", @"com.apple.UIKit.activity.AirDrop"];
    id v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(mechanism == %@)", &unk_1EDE1DD18];
    id v8 = (void *)MEMORY[0x1E4F28BA0];
    v19[0] = v7;
    v19[1] = v6;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
    uint64_t v10 = [v8 andPredicateWithSubpredicates:v9];

    uint64_t v11 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:0];
    char v18 = v11;
    BOOL v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
    id v17 = 0;
    uint64_t v13 = [v5 queryInteractionsUsingPredicate:v10 sortDescriptors:v12 limit:a3 error:&v17];

    id v14 = v17;
    if (v14)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[_CDCloudFamilyDataCollectionTask allAirDropInteractionsFromStore:fetchLimit:]();
      }
      id v15 = 0;
    }
    else
    {
      id v15 = v13;
    }
  }
  else
  {
    id v15 = 0;
  }
  return v15;
}

- (id)relationshipRegularExpressionForRelationship
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v13 = -[_CDCloudFamilyDataCollectionTask personRelationshipVocabularyByLocaleDictionary](a1);
    id v1 = [v13 allValues];
    id v18 = [MEMORY[0x1E4F1CA48] array];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    obuint64_t j = v1;
    uint64_t v16 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v16)
    {
      uint64_t v15 = *(void *)v25;
      do
      {
        uint64_t v2 = 0;
        do
        {
          if (*(void *)v25 != v15) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = v2;
          id v3 = [*(id *)(*((void *)&v24 + 1) + 8 * v2) allValues];
          long long v20 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          uint64_t v4 = [v3 countByEnumeratingWithState:&v20 objects:v28 count:16];
          if (v4)
          {
            uint64_t v5 = v4;
            uint64_t v6 = *(void *)v21;
            do
            {
              for (uint64_t i = 0; i != v5; ++i)
              {
                if (*(void *)v21 != v6) {
                  objc_enumerationMutation(v3);
                }
                id v8 = NSString;
                uint64_t v9 = [*(id *)(*((void *)&v20 + 1) + 8 * i) componentsJoinedByString:@"|"];
                uint64_t v10 = [v8 stringWithFormat:@"^(%@)$", v9];

                uint64_t v19 = 0;
                uint64_t v11 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:v10 options:1 error:&v19];
                if (v11) {
                  [v18 addObject:v11];
                }
              }
              uint64_t v5 = [v3 countByEnumeratingWithState:&v20 objects:v28 count:16];
            }
            while (v5);
          }

          uint64_t v2 = v17 + 1;
        }
        while (v17 + 1 != v16);
        uint64_t v16 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v16);
    }
  }
  else
  {
    id v18 = 0;
  }
  return v18;
}

- (id)personRelationshipVocabularyByLocaleDictionary
{
  if (a1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __82___CDCloudFamilyDataCollectionTask_personRelationshipVocabularyByLocaleDictionary__block_invoke;
    block[3] = &unk_1E560D578;
    block[4] = a1;
    if (personRelationshipVocabularyByLocaleDictionary_onceToken != -1) {
      dispatch_once(&personRelationshipVocabularyByLocaleDictionary_onceToken, block);
    }
    a1 = (id)personRelationshipVocabularyByLocaleDictionary_sPersonRelationshipVocabularyByLocaleDictionary;
    uint64_t v1 = block[6];
  }
  return a1;
}

- (BOOL)regexMatchForRegex:(void *)a3 string:
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  BOOL v8 = 0;
  if (a1 && v6) {
    BOOL v8 = objc_msgSend(v5, "numberOfMatchesInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length")) != 0;
  }

  return v8;
}

- (id)queryContactsForGivenName:(uint64_t)a1
{
  if (a1)
  {
    id v4 = *(id *)(a1 + 64);
    id v5 = a2;
    id v6 = [getCNContactClass() predicateForContactsMatchingName:v5];

    id v7 = -[_CDCloudFamilyDataCollectionTask contactKeysToFetch](a1);
    id v13 = 0;
    BOOL v8 = [v4 unifiedContactsMatchingPredicate:v6 keysToFetch:v7 error:&v13];
    id v9 = v13;

    if (v9)
    {
      uint64_t v10 = +[_CDLogging dataCollectionChannel];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[_CDCloudFamilyDataCollectionTask queryContactsForGivenName:]();
      }

      id v11 = (id)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      id v11 = v8;
    }
  }
  else
  {
    id v11 = 0;
  }
  return v11;
}

- (id)fetchEmergencyContacts
{
  if (a1)
  {
    id v1 = *(id *)(a1 + 72);
    uint64_t v14 = 0;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x3032000000;
    uint64_t v17 = __Block_byref_object_copy__14;
    id v18 = __Block_byref_object_dispose__14;
    id v19 = 0;
    dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    uint64_t v10 = __58___CDCloudFamilyDataCollectionTask_fetchEmergencyContacts__block_invoke;
    id v11 = &unk_1E560F978;
    id v13 = &v14;
    id v3 = v2;
    BOOL v12 = v3;
    [v1 fetchMedicalIDEmergencyContactsWithCompletion:&v8];
    dispatch_time_t v4 = dispatch_time(0, 300000000000);
    if (dispatch_semaphore_wait(v3, v4))
    {
      id v5 = +[_CDLogging dataCollectionChannel];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[_CDCloudFamilyDataCollectionTask contactsEmergency]();
      }
    }
    id v6 = (id)v15[5];

    _Block_object_dispose(&v14, 8);
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)callFeaturesFromInteractions:(void *)a3 avgCallLength:(double)a4 contact:
{
  uint64_t v421 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  if (a1)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v411 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    [v411 setDateFormat:@"dd/MM/yyyy"];
    uint64_t v10 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v414 = [v8 birthday];
    v412 = [MEMORY[0x1E4F1CA80] set];
    id v11 = [v7 lastObject];
    BOOL v12 = [v11 date];

    if (v12
      && ([MEMORY[0x1E4F1C9C8] date],
          id v13 = objc_claimAutoreleasedReturnValue(),
          [v10 components:16 fromDate:v12 toDate:v13 options:0],
          uint64_t v14 = objc_claimAutoreleasedReturnValue(),
          v13,
          v14))
    {
      v408 = v14;
      uint64_t v15 = [v14 day];
      unint64_t v16 = 0x1E4F28000uLL;
      uint64_t v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
      [v9 setObject:v17 forKeyedSubscript:@"callTotal"];

      uint64_t v407 = v15;
      if (v15 && [v7 count])
      {
        id v18 = +[_CDContactFavoritesUtilities sharedInstance];
        id v405 = v8;
        id v19 = [v18 entriesForContact:v8];

        v403 = v19;
        if ([v19 count]) {
          [v9 setObject:&unk_1EDE1DD00 forKeyedSubscript:@"contactFavorite"];
        }
        v404 = v12;
        [v9 setObject:&unk_1EDE1E3F0 forKeyedSubscript:@"callMaxDur"];
        long long v418 = 0u;
        long long v419 = 0u;
        long long v416 = 0u;
        long long v417 = 0u;
        id v406 = v7;
        obuint64_t j = v7;
        uint64_t v413 = [obj countByEnumeratingWithState:&v416 objects:v420 count:16];
        if (v413)
        {
          uint64_t v410 = *(void *)v417;
          double v20 = a4 + a4;
          do
          {
            for (uint64_t i = 0; i != v413; ++i)
            {
              if (*(void *)v417 != v410) {
                objc_enumerationMutation(obj);
              }
              long long v22 = *(void **)(*((void *)&v416 + 1) + 8 * i);
              long long v23 = *(void **)(v16 + 3792);
              long long v24 = [v9 objectForKeyedSubscript:@"callTotalDur"];
              [v24 doubleValue];
              double v26 = v25;
              [v22 duration];
              uint64_t v28 = [v23 numberWithDouble:v26 + v27];
              [v9 setObject:v28 forKeyedSubscript:@"callTotalDur"];

              [v22 duration];
              double v30 = v29;
              long long v31 = [v9 objectForKeyedSubscript:@"callMaxDur"];
              [v31 doubleValue];
              double v33 = v32;

              if (v30 > v33)
              {
                long long v34 = *(void **)(v16 + 3792);
                [v22 duration];
                long long v35 = objc_msgSend(v34, "numberWithDouble:");
                [v9 setObject:v35 forKeyedSubscript:@"callMaxDur"];
              }
              int v36 = [v22 callStatus];
              if (v36 == getkCHCallStatusConnectedOutgoing())
              {
                long long v37 = *(void **)(v16 + 3792);
                long long v38 = [v9 objectForKeyedSubscript:@"callOutgoingRatio"];
                id v39 = objc_msgSend(v37, "numberWithInteger:", objc_msgSend(v38, "integerValue") + 1);
                [v9 setObject:v39 forKeyedSubscript:@"callOutgoingRatio"];
              }
              [v22 duration];
              double v41 = v40;
              if (v40 >= v20)
              {
                id v42 = *(void **)(v16 + 3792);
                long long v43 = [v9 objectForKeyedSubscript:@"callLongRatio"];
                id v44 = objc_msgSend(v42, "numberWithInteger:", objc_msgSend(v43, "integerValue") + 1);
                [v9 setObject:v44 forKeyedSubscript:@"callLongRatio"];
              }
              unint64_t v45 = v16;
              id v46 = [v22 date];
              uint64_t v47 = [v411 stringFromDate:v46];

              v415 = (void *)v47;
              [v412 addObject:v47];
              uint64_t v48 = [v22 date];
              v49 = v10;
              v50 = [v10 components:568 fromDate:v48];

              uint64_t v51 = [v50 weekday];
              uint64_t v52 = [v50 hour];
              uint64_t v53 = [v50 day];
              uint64_t v54 = [v50 month];
              if ([v414 day] == v53 && objc_msgSend(v414, "month") == v54) {
                [v9 setObject:&unk_1EDE1DD00 forKeyedSubscript:@"callBirthday"];
              }
              if ((unint64_t)(v51 - 2) > 3)
              {
                uint64_t v10 = v49;
                if (v51 == 7)
                {
                  unint64_t v16 = v45;
                  if ((unint64_t)(v52 - 6) > 5)
                  {
                    if ((unint64_t)(v52 - 12) > 5)
                    {
                      unint64_t v159 = v52 - 18;
                      v160 = *(void **)(v45 + 3792);
                      if (v159 > 5)
                      {
                        v187 = [v9 objectForKeyedSubscript:@"callNightSat"];
                        v188 = objc_msgSend(v160, "numberWithInteger:", objc_msgSend(v187, "integerValue") + 1);
                        [v9 setObject:v188 forKeyedSubscript:@"callNightSat"];

                        v189 = *(void **)(v45 + 3792);
                        v190 = [v9 objectForKeyedSubscript:@"callDurNightSat"];
                        [v190 doubleValue];
                        double v192 = v191;
                        [v22 duration];
                        v194 = [v189 numberWithDouble:v192 + v193];
                        [v9 setObject:v194 forKeyedSubscript:@"callDurNightSat"];

                        if (v41 < v20) {
                          goto LABEL_70;
                        }
                        long long v64 = *(void **)(v45 + 3792);
                        long long v65 = v9;
                        long long v66 = @"callLongNightSat";
                      }
                      else
                      {
                        v161 = [v9 objectForKeyedSubscript:@"callEveSat"];
                        v162 = objc_msgSend(v160, "numberWithInteger:", objc_msgSend(v161, "integerValue") + 1);
                        [v9 setObject:v162 forKeyedSubscript:@"callEveSat"];

                        v163 = *(void **)(v45 + 3792);
                        v164 = [v9 objectForKeyedSubscript:@"callDurEveSat"];
                        [v164 doubleValue];
                        double v166 = v165;
                        [v22 duration];
                        v168 = [v163 numberWithDouble:v166 + v167];
                        [v9 setObject:v168 forKeyedSubscript:@"callDurEveSat"];

                        if (v41 < v20) {
                          goto LABEL_70;
                        }
                        long long v64 = *(void **)(v45 + 3792);
                        long long v65 = v9;
                        long long v66 = @"callLongEveSat";
                      }
                    }
                    else
                    {
                      v123 = *(void **)(v45 + 3792);
                      v124 = [v9 objectForKeyedSubscript:@"callNoonSat"];
                      v125 = objc_msgSend(v123, "numberWithInteger:", objc_msgSend(v124, "integerValue") + 1);
                      [v9 setObject:v125 forKeyedSubscript:@"callNoonSat"];

                      v126 = *(void **)(v45 + 3792);
                      v127 = [v9 objectForKeyedSubscript:@"callDurNoonSat"];
                      [v127 doubleValue];
                      double v129 = v128;
                      [v22 duration];
                      v131 = [v126 numberWithDouble:v129 + v130];
                      [v9 setObject:v131 forKeyedSubscript:@"callDurNoonSat"];

                      if (v41 < v20) {
                        goto LABEL_70;
                      }
                      long long v64 = *(void **)(v45 + 3792);
                      long long v65 = v9;
                      long long v66 = @"callLongNoonSat";
                    }
                  }
                  else
                  {
                    v86 = *(void **)(v45 + 3792);
                    v87 = [v9 objectForKeyedSubscript:@"callMorningSat"];
                    v88 = objc_msgSend(v86, "numberWithInteger:", objc_msgSend(v87, "integerValue") + 1);
                    [v9 setObject:v88 forKeyedSubscript:@"callMorningSat"];

                    v89 = *(void **)(v45 + 3792);
                    v90 = [v9 objectForKeyedSubscript:@"callDurMorningSat"];
                    [v90 doubleValue];
                    double v92 = v91;
                    [v22 duration];
                    v94 = [v89 numberWithDouble:v92 + v93];
                    [v9 setObject:v94 forKeyedSubscript:@"callDurMorningSat"];

                    if (v41 < v20) {
                      goto LABEL_70;
                    }
                    long long v64 = *(void **)(v45 + 3792);
                    long long v65 = v9;
                    long long v66 = @"callLongMorningSat";
                  }
                }
                else
                {
                  unint64_t v16 = v45;
                  unint64_t v67 = v52 - 6;
                  if (v51 == 6)
                  {
                    if (v67 > 5)
                    {
                      if ((unint64_t)(v52 - 12) > 5)
                      {
                        unint64_t v149 = v52 - 18;
                        v150 = *(void **)(v45 + 3792);
                        if (v149 > 5)
                        {
                          v179 = [v9 objectForKeyedSubscript:@"callNightFri"];
                          v180 = objc_msgSend(v150, "numberWithInteger:", objc_msgSend(v179, "integerValue") + 1);
                          [v9 setObject:v180 forKeyedSubscript:@"callNightFri"];

                          v181 = *(void **)(v45 + 3792);
                          v182 = [v9 objectForKeyedSubscript:@"callDurNightFri"];
                          [v182 doubleValue];
                          double v184 = v183;
                          [v22 duration];
                          v186 = [v181 numberWithDouble:v184 + v185];
                          [v9 setObject:v186 forKeyedSubscript:@"callDurNightFri"];

                          if (v41 < v20) {
                            goto LABEL_70;
                          }
                          long long v64 = *(void **)(v45 + 3792);
                          long long v65 = v9;
                          long long v66 = @"callLongNightFri";
                        }
                        else
                        {
                          v151 = [v9 objectForKeyedSubscript:@"callEveFri"];
                          v152 = objc_msgSend(v150, "numberWithInteger:", objc_msgSend(v151, "integerValue") + 1);
                          [v9 setObject:v152 forKeyedSubscript:@"callEveFri"];

                          v153 = *(void **)(v45 + 3792);
                          v154 = [v9 objectForKeyedSubscript:@"callDurEveFri"];
                          [v154 doubleValue];
                          double v156 = v155;
                          [v22 duration];
                          v158 = [v153 numberWithDouble:v156 + v157];
                          [v9 setObject:v158 forKeyedSubscript:@"callDurEveFri"];

                          if (v41 < v20) {
                            goto LABEL_70;
                          }
                          long long v64 = *(void **)(v45 + 3792);
                          long long v65 = v9;
                          long long v66 = @"callLongEveFri";
                        }
                      }
                      else
                      {
                        v114 = *(void **)(v45 + 3792);
                        v115 = [v9 objectForKeyedSubscript:@"callNoonFri"];
                        v116 = objc_msgSend(v114, "numberWithInteger:", objc_msgSend(v115, "integerValue") + 1);
                        [v9 setObject:v116 forKeyedSubscript:@"callNoonFri"];

                        v117 = *(void **)(v45 + 3792);
                        v118 = [v9 objectForKeyedSubscript:@"callDurNoonFri"];
                        [v118 doubleValue];
                        double v120 = v119;
                        [v22 duration];
                        v122 = [v117 numberWithDouble:v120 + v121];
                        [v9 setObject:v122 forKeyedSubscript:@"callDurNoonFri"];

                        if (v41 < v20) {
                          goto LABEL_70;
                        }
                        long long v64 = *(void **)(v45 + 3792);
                        long long v65 = v9;
                        long long v66 = @"callLongNoonFri";
                      }
                    }
                    else
                    {
                      v68 = *(void **)(v45 + 3792);
                      v69 = [v9 objectForKeyedSubscript:@"callMorningFri"];
                      v70 = objc_msgSend(v68, "numberWithInteger:", objc_msgSend(v69, "integerValue") + 1);
                      [v9 setObject:v70 forKeyedSubscript:@"callMorningFri"];

                      uint64_t v71 = *(void **)(v45 + 3792);
                      v72 = [v9 objectForKeyedSubscript:@"callDurMorningFri"];
                      [v72 doubleValue];
                      double v74 = v73;
                      [v22 duration];
                      uint64_t v76 = [v71 numberWithDouble:v74 + v75];
                      [v9 setObject:v76 forKeyedSubscript:@"callDurMorningFri"];

                      if (v41 < v20) {
                        goto LABEL_70;
                      }
                      long long v64 = *(void **)(v45 + 3792);
                      long long v65 = v9;
                      long long v66 = @"callLongMorningFri";
                    }
                  }
                  else if (v67 > 5)
                  {
                    if ((unint64_t)(v52 - 12) > 5)
                    {
                      unint64_t v169 = v52 - 18;
                      v170 = *(void **)(v45 + 3792);
                      if (v169 > 5)
                      {
                        v195 = [v9 objectForKeyedSubscript:@"callNightSun"];
                        v196 = objc_msgSend(v170, "numberWithInteger:", objc_msgSend(v195, "integerValue") + 1);
                        [v9 setObject:v196 forKeyedSubscript:@"callNightSun"];

                        v197 = *(void **)(v45 + 3792);
                        v198 = [v9 objectForKeyedSubscript:@"callDurNightSun"];
                        [v198 doubleValue];
                        double v200 = v199;
                        [v22 duration];
                        v202 = [v197 numberWithDouble:v200 + v201];
                        [v9 setObject:v202 forKeyedSubscript:@"callDurNightSun"];

                        if (v41 < v20) {
                          goto LABEL_70;
                        }
                        long long v64 = *(void **)(v45 + 3792);
                        long long v65 = v9;
                        long long v66 = @"callLongNightSun";
                      }
                      else
                      {
                        v171 = [v9 objectForKeyedSubscript:@"callEveSun"];
                        v172 = objc_msgSend(v170, "numberWithInteger:", objc_msgSend(v171, "integerValue") + 1);
                        [v9 setObject:v172 forKeyedSubscript:@"callEveSun"];

                        v173 = *(void **)(v45 + 3792);
                        v174 = [v9 objectForKeyedSubscript:@"callDurEveSun"];
                        [v174 doubleValue];
                        double v176 = v175;
                        [v22 duration];
                        v178 = [v173 numberWithDouble:v176 + v177];
                        [v9 setObject:v178 forKeyedSubscript:@"callDurEveSun"];

                        if (v41 < v20) {
                          goto LABEL_70;
                        }
                        long long v64 = *(void **)(v45 + 3792);
                        long long v65 = v9;
                        long long v66 = @"callLongEveSun";
                      }
                    }
                    else
                    {
                      v132 = *(void **)(v45 + 3792);
                      v133 = [v9 objectForKeyedSubscript:@"callNoonSun"];
                      v134 = objc_msgSend(v132, "numberWithInteger:", objc_msgSend(v133, "integerValue") + 1);
                      [v9 setObject:v134 forKeyedSubscript:@"callNoonSun"];

                      v135 = *(void **)(v45 + 3792);
                      v136 = [v9 objectForKeyedSubscript:@"callDurNoonSun"];
                      [v136 doubleValue];
                      double v138 = v137;
                      [v22 duration];
                      v140 = [v135 numberWithDouble:v138 + v139];
                      [v9 setObject:v140 forKeyedSubscript:@"callDurNoonSun"];

                      if (v41 < v20) {
                        goto LABEL_70;
                      }
                      long long v64 = *(void **)(v45 + 3792);
                      long long v65 = v9;
                      long long v66 = @"callLongNoonSun";
                    }
                  }
                  else
                  {
                    v95 = *(void **)(v45 + 3792);
                    v96 = [v9 objectForKeyedSubscript:@"callMorningSun"];
                    v97 = objc_msgSend(v95, "numberWithInteger:", objc_msgSend(v96, "integerValue") + 1);
                    [v9 setObject:v97 forKeyedSubscript:@"callMorningSun"];

                    v98 = *(void **)(v45 + 3792);
                    v99 = [v9 objectForKeyedSubscript:@"callDurMorningSun"];
                    [v99 doubleValue];
                    double v101 = v100;
                    [v22 duration];
                    v103 = [v98 numberWithDouble:v101 + v102];
                    [v9 setObject:v103 forKeyedSubscript:@"callDurMorningSun"];

                    if (v41 < v20) {
                      goto LABEL_70;
                    }
                    long long v64 = *(void **)(v45 + 3792);
                    long long v65 = v9;
                    long long v66 = @"callLongMorningSun";
                  }
                }
              }
              else
              {
                uint64_t v10 = v49;
                if ((unint64_t)(v52 - 6) > 5)
                {
                  unint64_t v16 = v45;
                  if ((unint64_t)(v52 - 12) > 5)
                  {
                    unint64_t v104 = v52 - 18;
                    v105 = *(void **)(v45 + 3792);
                    if (v104 > 5)
                    {
                      v141 = [v9 objectForKeyedSubscript:@"callNightWeekday"];
                      v142 = objc_msgSend(v105, "numberWithInteger:", objc_msgSend(v141, "integerValue") + 1);
                      [v9 setObject:v142 forKeyedSubscript:@"callNightWeekday"];

                      v143 = *(void **)(v45 + 3792);
                      v144 = [v9 objectForKeyedSubscript:@"callDurNightWeekday"];
                      [v144 doubleValue];
                      double v146 = v145;
                      [v22 duration];
                      v148 = [v143 numberWithDouble:v146 + v147];
                      [v9 setObject:v148 forKeyedSubscript:@"callDurNightWeekday"];

                      if (v41 < v20) {
                        goto LABEL_70;
                      }
                      long long v64 = *(void **)(v45 + 3792);
                      long long v65 = v9;
                      long long v66 = @"callLongNightWeekday";
                    }
                    else
                    {
                      v106 = [v9 objectForKeyedSubscript:@"callEveWeekday"];
                      v107 = objc_msgSend(v105, "numberWithInteger:", objc_msgSend(v106, "integerValue") + 1);
                      [v9 setObject:v107 forKeyedSubscript:@"callEveWeekday"];

                      v108 = *(void **)(v45 + 3792);
                      v109 = [v9 objectForKeyedSubscript:@"callDurEveWeekday"];
                      [v109 doubleValue];
                      double v111 = v110;
                      [v22 duration];
                      v113 = [v108 numberWithDouble:v111 + v112];
                      [v9 setObject:v113 forKeyedSubscript:@"callDurEveWeekday"];

                      if (v41 < v20) {
                        goto LABEL_70;
                      }
                      long long v64 = *(void **)(v45 + 3792);
                      long long v65 = v9;
                      long long v66 = @"callLongEveWeekday";
                    }
                  }
                  else
                  {
                    v77 = *(void **)(v45 + 3792);
                    v78 = [v9 objectForKeyedSubscript:@"callNoonWeekday"];
                    id v79 = objc_msgSend(v77, "numberWithInteger:", objc_msgSend(v78, "integerValue") + 1);
                    [v9 setObject:v79 forKeyedSubscript:@"callNoonWeekday"];

                    v80 = *(void **)(v45 + 3792);
                    v81 = [v9 objectForKeyedSubscript:@"callDurNoonWeekday"];
                    [v81 doubleValue];
                    double v83 = v82;
                    [v22 duration];
                    v85 = [v80 numberWithDouble:v83 + v84];
                    [v9 setObject:v85 forKeyedSubscript:@"callDurNoonWeekday"];

                    if (v41 < v20) {
                      goto LABEL_70;
                    }
                    long long v64 = *(void **)(v45 + 3792);
                    long long v65 = v9;
                    long long v66 = @"callLongNoonWeekday";
                  }
                }
                else
                {
                  unint64_t v16 = v45;
                  long long v55 = *(void **)(v45 + 3792);
                  long long v56 = [v9 objectForKeyedSubscript:@"callMorningWeekday"];
                  long long v57 = objc_msgSend(v55, "numberWithInteger:", objc_msgSend(v56, "integerValue") + 1);
                  [v9 setObject:v57 forKeyedSubscript:@"callMorningWeekday"];

                  long long v58 = *(void **)(v45 + 3792);
                  long long v59 = [v9 objectForKeyedSubscript:@"callDurMorningWeekday"];
                  [v59 doubleValue];
                  double v61 = v60;
                  [v22 duration];
                  long long v63 = [v58 numberWithDouble:v61 + v62];
                  [v9 setObject:v63 forKeyedSubscript:@"callDurMorningWeekday"];

                  if (v41 < v20) {
                    goto LABEL_70;
                  }
                  long long v64 = *(void **)(v45 + 3792);
                  long long v65 = v9;
                  long long v66 = @"callLongMorningWeekday";
                }
              }
              v203 = [v65 objectForKeyedSubscript:v66];
              v204 = objc_msgSend(v64, "numberWithInteger:", objc_msgSend(v203, "integerValue") + 1);
              [v9 setObject:v204 forKeyedSubscript:v66];

LABEL_70:
              v205 = [v22 date];
              [v205 timeIntervalSinceNow];
              double v207 = v206;

              if (v207 >= -1209600.0)
              {
                v214 = *(void **)(v16 + 3792);
                v215 = v9;
                v216 = @"callTwoWeeks";
              }
              else
              {
                v208 = [v22 date];
                [v208 timeIntervalSinceNow];
                double v210 = v209;

                if (v210 >= -3628800.0)
                {
                  v214 = *(void **)(v16 + 3792);
                  v215 = v9;
                  v216 = @"callSixWeeks";
                }
                else
                {
                  v211 = [v22 date];
                  [v211 timeIntervalSinceNow];
                  double v213 = v212;

                  if (v213 < -7257600.0) {
                    goto LABEL_77;
                  }
                  v214 = *(void **)(v16 + 3792);
                  v215 = v9;
                  v216 = @"callTwelveWeeks";
                }
              }
              v217 = [v215 objectForKeyedSubscript:v216];
              v218 = objc_msgSend(v214, "numberWithInteger:", objc_msgSend(v217, "integerValue") + 1);
              [v9 setObject:v218 forKeyedSubscript:v216];

LABEL_77:
            }
            uint64_t v413 = [obj countByEnumeratingWithState:&v416 objects:v420 count:16];
          }
          while (v413);
        }

        v219 = [v9 objectForKeyedSubscript:@"callTotal"];
        uint64_t v220 = [v219 integerValue];

        v221 = objc_msgSend(*(id *)(v16 + 3792), "numberWithDouble:", (double)(unint64_t)objc_msgSend(v412, "count") / (double)v407);
        [v9 setObject:v221 forKeyedSubscript:@"callDayRatio"];

        v222 = *(void **)(v16 + 3792);
        v223 = [v9 objectForKeyedSubscript:@"callOutgoingRatio"];
        double v224 = (double)v220;
        v225 = objc_msgSend(v222, "numberWithDouble:", (double)objc_msgSend(v223, "integerValue") / (double)v220);
        [v9 setObject:v225 forKeyedSubscript:@"callOutgoingRatio"];

        v226 = *(void **)(v16 + 3792);
        v227 = [v9 objectForKeyedSubscript:@"callTotalDur"];
        [v227 doubleValue];
        v229 = [v226 numberWithLong:10 * ((uint64_t)llround(v228 / v224) / 10)];
        [v9 setObject:v229 forKeyedSubscript:@"callAvgDur"];

        v230 = *(void **)(v16 + 3792);
        v231 = [v9 objectForKeyedSubscript:@"callTwoWeeks"];
        v232 = objc_msgSend(v230, "numberWithDouble:", (double)objc_msgSend(v231, "integerValue") / v224);
        [v9 setObject:v232 forKeyedSubscript:@"callTwoWeeks"];

        v233 = *(void **)(v16 + 3792);
        v234 = [v9 objectForKeyedSubscript:@"callSixWeeks"];
        v235 = objc_msgSend(v233, "numberWithDouble:", (double)objc_msgSend(v234, "integerValue") / v224);
        [v9 setObject:v235 forKeyedSubscript:@"callSixWeeks"];

        v236 = *(void **)(v16 + 3792);
        v237 = [v9 objectForKeyedSubscript:@"callTwelveWeeks"];
        v238 = objc_msgSend(v236, "numberWithDouble:", (double)objc_msgSend(v237, "integerValue") / v224);
        [v9 setObject:v238 forKeyedSubscript:@"callTwelveWeeks"];

        v239 = *(void **)(v16 + 3792);
        v240 = [v9 objectForKeyedSubscript:@"callMorningWeekday"];
        v241 = objc_msgSend(v239, "numberWithDouble:", (double)objc_msgSend(v240, "integerValue") / v224);
        [v9 setObject:v241 forKeyedSubscript:@"callMorningWeekday"];

        v242 = *(void **)(v16 + 3792);
        v243 = [v9 objectForKeyedSubscript:@"callNoonWeekday"];
        v244 = objc_msgSend(v242, "numberWithDouble:", (double)objc_msgSend(v243, "integerValue") / v224);
        [v9 setObject:v244 forKeyedSubscript:@"callNoonWeekday"];

        v245 = *(void **)(v16 + 3792);
        v246 = [v9 objectForKeyedSubscript:@"callEveWeekday"];
        v247 = objc_msgSend(v245, "numberWithDouble:", (double)objc_msgSend(v246, "integerValue") / v224);
        [v9 setObject:v247 forKeyedSubscript:@"callEveWeekday"];

        v248 = *(void **)(v16 + 3792);
        v249 = [v9 objectForKeyedSubscript:@"callNightWeekday"];
        v250 = objc_msgSend(v248, "numberWithDouble:", (double)objc_msgSend(v249, "integerValue") / v224);
        [v9 setObject:v250 forKeyedSubscript:@"callNightWeekday"];

        v251 = *(void **)(v16 + 3792);
        v252 = [v9 objectForKeyedSubscript:@"callMorningFri"];
        v253 = objc_msgSend(v251, "numberWithDouble:", (double)objc_msgSend(v252, "integerValue") / v224);
        [v9 setObject:v253 forKeyedSubscript:@"callMorningFri"];

        v254 = *(void **)(v16 + 3792);
        v255 = [v9 objectForKeyedSubscript:@"callNoonFri"];
        v256 = objc_msgSend(v254, "numberWithDouble:", (double)objc_msgSend(v255, "integerValue") / v224);
        [v9 setObject:v256 forKeyedSubscript:@"callNoonFri"];

        v257 = *(void **)(v16 + 3792);
        v258 = [v9 objectForKeyedSubscript:@"callEveFri"];
        v259 = objc_msgSend(v257, "numberWithDouble:", (double)objc_msgSend(v258, "integerValue") / v224);
        [v9 setObject:v259 forKeyedSubscript:@"callEveFri"];

        v260 = *(void **)(v16 + 3792);
        v261 = [v9 objectForKeyedSubscript:@"callNightFri"];
        v262 = objc_msgSend(v260, "numberWithDouble:", (double)objc_msgSend(v261, "integerValue") / v224);
        [v9 setObject:v262 forKeyedSubscript:@"callNightFri"];

        v263 = *(void **)(v16 + 3792);
        v264 = [v9 objectForKeyedSubscript:@"callMorningSat"];
        v265 = objc_msgSend(v263, "numberWithDouble:", (double)objc_msgSend(v264, "integerValue") / v224);
        [v9 setObject:v265 forKeyedSubscript:@"callMorningSat"];

        v266 = *(void **)(v16 + 3792);
        v267 = [v9 objectForKeyedSubscript:@"callNoonSat"];
        v268 = objc_msgSend(v266, "numberWithDouble:", (double)objc_msgSend(v267, "integerValue") / v224);
        [v9 setObject:v268 forKeyedSubscript:@"callNoonSat"];

        v269 = *(void **)(v16 + 3792);
        v270 = [v9 objectForKeyedSubscript:@"callEveSat"];
        v271 = objc_msgSend(v269, "numberWithDouble:", (double)objc_msgSend(v270, "integerValue") / v224);
        [v9 setObject:v271 forKeyedSubscript:@"callEveSat"];

        v272 = *(void **)(v16 + 3792);
        v273 = [v9 objectForKeyedSubscript:@"callNightSat"];
        v274 = objc_msgSend(v272, "numberWithDouble:", (double)objc_msgSend(v273, "integerValue") / v224);
        [v9 setObject:v274 forKeyedSubscript:@"callNightSat"];

        v275 = *(void **)(v16 + 3792);
        v276 = [v9 objectForKeyedSubscript:@"callMorningSun"];
        v277 = objc_msgSend(v275, "numberWithDouble:", (double)objc_msgSend(v276, "integerValue") / v224);
        [v9 setObject:v277 forKeyedSubscript:@"callMorningSun"];

        v278 = *(void **)(v16 + 3792);
        v279 = [v9 objectForKeyedSubscript:@"callNoonSun"];
        v280 = objc_msgSend(v278, "numberWithDouble:", (double)objc_msgSend(v279, "integerValue") / v224);
        [v9 setObject:v280 forKeyedSubscript:@"callNoonSun"];

        v281 = *(void **)(v16 + 3792);
        v282 = [v9 objectForKeyedSubscript:@"callEveSun"];
        v283 = objc_msgSend(v281, "numberWithDouble:", (double)objc_msgSend(v282, "integerValue") / v224);
        [v9 setObject:v283 forKeyedSubscript:@"callEveSun"];

        v284 = *(void **)(v16 + 3792);
        v285 = [v9 objectForKeyedSubscript:@"callNightSun"];
        v286 = objc_msgSend(v284, "numberWithDouble:", (double)objc_msgSend(v285, "integerValue") / v224);
        [v9 setObject:v286 forKeyedSubscript:@"callNightSun"];

        v287 = *(void **)(v16 + 3792);
        v288 = [v9 objectForKeyedSubscript:@"callDurMorningWeekday"];
        [v288 doubleValue];
        v290 = [v287 numberWithLong:10 * ((uint64_t)llround(v289 / v224) / 10)];
        [v9 setObject:v290 forKeyedSubscript:@"callDurMorningWeekday"];

        v291 = *(void **)(v16 + 3792);
        v292 = [v9 objectForKeyedSubscript:@"callDurNoonWeekday"];
        [v292 doubleValue];
        v294 = [v291 numberWithLong:10 * ((uint64_t)llround(v293 / v224) / 10)];
        [v9 setObject:v294 forKeyedSubscript:@"callDurNoonWeekday"];

        v295 = *(void **)(v16 + 3792);
        v296 = [v9 objectForKeyedSubscript:@"callDurEveWeekday"];
        [v296 doubleValue];
        v298 = [v295 numberWithLong:10 * ((uint64_t)llround(v297 / v224) / 10)];
        [v9 setObject:v298 forKeyedSubscript:@"callDurEveWeekday"];

        v299 = *(void **)(v16 + 3792);
        v300 = [v9 objectForKeyedSubscript:@"callDurNightWeekday"];
        [v300 doubleValue];
        v302 = [v299 numberWithLong:llround(v301 / v224)];
        [v9 setObject:v302 forKeyedSubscript:@"callDurNightWeekday"];

        v303 = *(void **)(v16 + 3792);
        v304 = [v9 objectForKeyedSubscript:@"callDurMorningFri"];
        [v304 doubleValue];
        v306 = [v303 numberWithLong:10 * ((uint64_t)llround(v305 / v224) / 10)];
        [v9 setObject:v306 forKeyedSubscript:@"callDurMorningFri"];

        v307 = *(void **)(v16 + 3792);
        v308 = [v9 objectForKeyedSubscript:@"callDurNoonFri"];
        [v308 doubleValue];
        v310 = [v307 numberWithLong:10 * ((uint64_t)llround(v309 / v224) / 10)];
        [v9 setObject:v310 forKeyedSubscript:@"callDurNoonFri"];

        v311 = *(void **)(v16 + 3792);
        v312 = [v9 objectForKeyedSubscript:@"callDurEveFri"];
        [v312 doubleValue];
        v314 = [v311 numberWithLong:10 * ((uint64_t)llround(v313 / v224) / 10)];
        [v9 setObject:v314 forKeyedSubscript:@"callDurEveFri"];

        v315 = *(void **)(v16 + 3792);
        v316 = [v9 objectForKeyedSubscript:@"callDurNightFri"];
        [v316 doubleValue];
        v318 = [v315 numberWithLong:10 * ((uint64_t)llround(v317 / v224) / 10)];
        [v9 setObject:v318 forKeyedSubscript:@"callDurNightFri"];

        v319 = *(void **)(v16 + 3792);
        v320 = [v9 objectForKeyedSubscript:@"callDurMorningSat"];
        [v320 doubleValue];
        v322 = [v319 numberWithLong:10 * ((uint64_t)llround(v321 / v224) / 10)];
        [v9 setObject:v322 forKeyedSubscript:@"callDurMorningSat"];

        v323 = *(void **)(v16 + 3792);
        v324 = [v9 objectForKeyedSubscript:@"callDurNoonSat"];
        [v324 doubleValue];
        v326 = [v323 numberWithLong:10 * ((uint64_t)llround(v325 / v224) / 10)];
        [v9 setObject:v326 forKeyedSubscript:@"callDurNoonSat"];

        v327 = *(void **)(v16 + 3792);
        v328 = [v9 objectForKeyedSubscript:@"callDurEveSat"];
        [v328 doubleValue];
        v330 = [v327 numberWithLong:10 * ((uint64_t)llround(v329 / v224) / 10)];
        [v9 setObject:v330 forKeyedSubscript:@"callDurEveSat"];

        v331 = *(void **)(v16 + 3792);
        v332 = [v9 objectForKeyedSubscript:@"callDurNightSat"];
        [v332 doubleValue];
        v334 = [v331 numberWithLong:10 * ((uint64_t)llround(v333 / v224) / 10)];
        [v9 setObject:v334 forKeyedSubscript:@"callDurNightSat"];

        v335 = *(void **)(v16 + 3792);
        v336 = [v9 objectForKeyedSubscript:@"callDurMorningSun"];
        [v336 doubleValue];
        v338 = [v335 numberWithLong:10 * ((uint64_t)llround(v337 / v224) / 10)];
        [v9 setObject:v338 forKeyedSubscript:@"callDurMorningSun"];

        v339 = *(void **)(v16 + 3792);
        v340 = [v9 objectForKeyedSubscript:@"callDurNoonSun"];
        [v340 doubleValue];
        v342 = [v339 numberWithLong:10 * ((uint64_t)llround(v341 / v224) / 10)];
        [v9 setObject:v342 forKeyedSubscript:@"callDurNoonSun"];

        v343 = *(void **)(v16 + 3792);
        v344 = [v9 objectForKeyedSubscript:@"callDurEveSun"];
        [v344 doubleValue];
        v346 = [v343 numberWithLong:10 * ((uint64_t)llround(v345 / v224) / 10)];
        [v9 setObject:v346 forKeyedSubscript:@"callDurEveSun"];

        v347 = *(void **)(v16 + 3792);
        v348 = [v9 objectForKeyedSubscript:@"callDurNightSun"];
        [v348 doubleValue];
        v350 = [v347 numberWithLong:10 * ((uint64_t)llround(v349 / v224) / 10)];
        [v9 setObject:v350 forKeyedSubscript:@"callDurNightSun"];

        v351 = *(void **)(v16 + 3792);
        v352 = [v9 objectForKeyedSubscript:@"callLongMorningWeekday"];
        v353 = objc_msgSend(v351, "numberWithDouble:", (double)objc_msgSend(v352, "integerValue") / v224);
        [v9 setObject:v353 forKeyedSubscript:@"callLongMorningWeekday"];

        v354 = *(void **)(v16 + 3792);
        v355 = [v9 objectForKeyedSubscript:@"callLongNoonWeekday"];
        v356 = objc_msgSend(v354, "numberWithDouble:", (double)objc_msgSend(v355, "integerValue") / v224);
        [v9 setObject:v356 forKeyedSubscript:@"callLongNoonWeekday"];

        v357 = *(void **)(v16 + 3792);
        v358 = [v9 objectForKeyedSubscript:@"callLongEveWeekday"];
        v359 = objc_msgSend(v357, "numberWithDouble:", (double)objc_msgSend(v358, "integerValue") / v224);
        [v9 setObject:v359 forKeyedSubscript:@"callLongEveWeekday"];

        v360 = *(void **)(v16 + 3792);
        v361 = [v9 objectForKeyedSubscript:@"callLongNightWeekday"];
        v362 = objc_msgSend(v360, "numberWithDouble:", (double)objc_msgSend(v361, "integerValue") / v224);
        [v9 setObject:v362 forKeyedSubscript:@"callLongNightWeekday"];

        v363 = *(void **)(v16 + 3792);
        v364 = [v9 objectForKeyedSubscript:@"callLongMorningFri"];
        v365 = objc_msgSend(v363, "numberWithDouble:", (double)objc_msgSend(v364, "integerValue") / v224);
        [v9 setObject:v365 forKeyedSubscript:@"callLongMorningFri"];

        v366 = *(void **)(v16 + 3792);
        v367 = [v9 objectForKeyedSubscript:@"callLongNoonFri"];
        v368 = objc_msgSend(v366, "numberWithDouble:", (double)objc_msgSend(v367, "integerValue") / v224);
        [v9 setObject:v368 forKeyedSubscript:@"callLongNoonFri"];

        v369 = *(void **)(v16 + 3792);
        v370 = [v9 objectForKeyedSubscript:@"callLongEveFri"];
        v371 = objc_msgSend(v369, "numberWithDouble:", (double)objc_msgSend(v370, "integerValue") / v224);
        [v9 setObject:v371 forKeyedSubscript:@"callLongEveFri"];

        v372 = *(void **)(v16 + 3792);
        v373 = [v9 objectForKeyedSubscript:@"callLongNightFri"];
        v374 = objc_msgSend(v372, "numberWithDouble:", (double)objc_msgSend(v373, "integerValue") / v224);
        [v9 setObject:v374 forKeyedSubscript:@"callLongNightFri"];

        v375 = *(void **)(v16 + 3792);
        v376 = [v9 objectForKeyedSubscript:@"callLongMorningSat"];
        v377 = objc_msgSend(v375, "numberWithDouble:", (double)objc_msgSend(v376, "integerValue") / v224);
        [v9 setObject:v377 forKeyedSubscript:@"callLongMorningSat"];

        v378 = *(void **)(v16 + 3792);
        v379 = [v9 objectForKeyedSubscript:@"callLongNoonSat"];
        v380 = objc_msgSend(v378, "numberWithDouble:", (double)objc_msgSend(v379, "integerValue") / v224);
        [v9 setObject:v380 forKeyedSubscript:@"callLongNoonSat"];

        v381 = *(void **)(v16 + 3792);
        v382 = [v9 objectForKeyedSubscript:@"callLongEveSat"];
        v383 = objc_msgSend(v381, "numberWithDouble:", (double)objc_msgSend(v382, "integerValue") / v224);
        [v9 setObject:v383 forKeyedSubscript:@"callLongEveSat"];

        v384 = *(void **)(v16 + 3792);
        v385 = [v9 objectForKeyedSubscript:@"callLongNightSat"];
        v386 = objc_msgSend(v384, "numberWithDouble:", (double)objc_msgSend(v385, "integerValue") / v224);
        [v9 setObject:v386 forKeyedSubscript:@"callLongNightSat"];

        v387 = *(void **)(v16 + 3792);
        v388 = [v9 objectForKeyedSubscript:@"callLongMorningSun"];
        v389 = objc_msgSend(v387, "numberWithDouble:", (double)objc_msgSend(v388, "integerValue") / v224);
        [v9 setObject:v389 forKeyedSubscript:@"callLongMorningSun"];

        v390 = *(void **)(v16 + 3792);
        v391 = [v9 objectForKeyedSubscript:@"callLongNoonSun"];
        v392 = objc_msgSend(v390, "numberWithDouble:", (double)objc_msgSend(v391, "integerValue") / v224);
        [v9 setObject:v392 forKeyedSubscript:@"callLongNoonSun"];

        v393 = *(void **)(v16 + 3792);
        v394 = [v9 objectForKeyedSubscript:@"callLongEveSun"];
        v395 = objc_msgSend(v393, "numberWithDouble:", (double)objc_msgSend(v394, "integerValue") / v224);
        [v9 setObject:v395 forKeyedSubscript:@"callLongEveSun"];

        v396 = *(void **)(v16 + 3792);
        v397 = [v9 objectForKeyedSubscript:@"callLongNightSun"];
        v398 = objc_msgSend(v396, "numberWithDouble:", (double)objc_msgSend(v397, "integerValue") / v224);
        [v9 setObject:v398 forKeyedSubscript:@"callLongNightSun"];

        id v399 = v9;
        id v8 = v405;
        id v7 = v406;
        BOOL v12 = v404;
      }
      else
      {
        id v401 = v9;
      }

      v400 = v9;
    }
    else
    {
      v400 = (void *)MEMORY[0x1E4F1CC08];
    }
  }
  else
  {
    v400 = 0;
  }

  return v400;
}

- (void)messagesCumulativeFeaturesFromInteractionsBatch:(void *)a3 mutableMessagesDictionary:
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!a1) {
    goto LABEL_56;
  }
  id v62 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v62 setDateFormat:@"dd/MM/yyyy"];
  double v61 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  if (![v5 count]) {
    goto LABEL_55;
  }
  id v7 = NSNumber;
  id v8 = [v6 objectForKeyedSubscript:@"firstPartyMsgTotal"];
  id v9 = objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v5, "count") + objc_msgSend(v8, "integerValue"));
  [v6 setObject:v9 forKeyedSubscript:@"firstPartyMsgTotal"];

  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v58 = v5;
  obuint64_t j = v5;
  uint64_t v10 = [obj countByEnumeratingWithState:&v64 objects:v68 count:16];
  if (!v10) {
    goto LABEL_54;
  }
  uint64_t v11 = v10;
  uint64_t v60 = *(void *)v65;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v65 != v60) {
        objc_enumerationMutation(obj);
      }
      id v13 = *(void **)(*((void *)&v64 + 1) + 8 * i);
      if (objc_msgSend(v13, "direction", v58) == 1)
      {
        uint64_t v14 = NSNumber;
        uint64_t v15 = [v6 objectForKeyedSubscript:@"firstPartyMsgOutgoingRatio"];
        unint64_t v16 = objc_msgSend(v14, "numberWithInteger:", objc_msgSend(v15, "integerValue") + 1);
        [v6 setObject:v16 forKeyedSubscript:@"firstPartyMsgOutgoingRatio"];
      }
      uint64_t v17 = [v13 startDate];
      uint64_t v18 = [v62 stringFromDate:v17];

      id v19 = [v6 objectForKeyedSubscript:@"daysSeen"];

      if (!v19)
      {
        double v20 = objc_opt_new();
        [v6 setObject:v20 forKeyedSubscript:@"daysSeen"];
      }
      long long v21 = [v6 objectForKeyedSubscript:@"fromDate"];

      if (!v21
        || ([v6 objectForKeyedSubscript:@"fromDate"],
            long long v22 = objc_claimAutoreleasedReturnValue(),
            [v13 startDate],
            long long v23 = objc_claimAutoreleasedReturnValue(),
            uint64_t v24 = [v22 compare:v23],
            v23,
            v22,
            v24 == 1))
      {
        double v25 = [v13 startDate];
        [v6 setObject:v25 forKeyedSubscript:@"fromDate"];
      }
      double v26 = [v6 objectForKeyedSubscript:@"daysSeen"];
      [v26 addObject:v18];

      double v27 = [v13 startDate];
      uint64_t v28 = [v61 components:544 fromDate:v27];

      uint64_t v29 = [v28 weekday];
      uint64_t v30 = [v28 hour];
      long long v63 = (void *)v18;
      unint64_t v31 = v30 - 6;
      if ((unint64_t)(v29 - 2) > 3)
      {
        if (v29 == 7)
        {
          if (v31 > 5)
          {
            if ((unint64_t)(v30 - 12) > 5)
            {
              unint64_t v43 = v30 - 18;
              long long v38 = NSNumber;
              id v39 = v6;
              if (v43 > 5) {
                double v40 = @"firstPartyMsgNightSat";
              }
              else {
                double v40 = @"firstPartyMsgEveSat";
              }
            }
            else
            {
              long long v38 = NSNumber;
              id v39 = v6;
              double v40 = @"firstPartyMsgNoonSat";
            }
          }
          else
          {
            long long v38 = NSNumber;
            id v39 = v6;
            double v40 = @"firstPartyMsgMorningSat";
          }
        }
        else if (v29 == 6)
        {
          if (v31 > 5)
          {
            if ((unint64_t)(v30 - 12) > 5)
            {
              unint64_t v42 = v30 - 18;
              long long v38 = NSNumber;
              id v39 = v6;
              if (v42 > 5) {
                double v40 = @"firstPartyMsgNightFri";
              }
              else {
                double v40 = @"firstPartyMsgEveFri";
              }
            }
            else
            {
              long long v38 = NSNumber;
              id v39 = v6;
              double v40 = @"firstPartyMsgNoonFri";
            }
          }
          else
          {
            long long v38 = NSNumber;
            id v39 = v6;
            double v40 = @"firstPartyMsgMorningFri";
          }
        }
        else if (v31 > 5)
        {
          if ((unint64_t)(v30 - 12) > 5)
          {
            unint64_t v44 = v30 - 18;
            long long v38 = NSNumber;
            id v39 = v6;
            if (v44 > 5) {
              double v40 = @"firstPartyMsgNightSun";
            }
            else {
              double v40 = @"firstPartyMsgEveSun";
            }
          }
          else
          {
            long long v38 = NSNumber;
            id v39 = v6;
            double v40 = @"firstPartyMsgNoonSun";
          }
        }
        else
        {
          long long v38 = NSNumber;
          id v39 = v6;
          double v40 = @"firstPartyMsgMorningSun";
        }
      }
      else
      {
        if (v31 <= 5)
        {
          double v32 = NSNumber;
          double v33 = [v6 objectForKeyedSubscript:@"firstPartyMsgMorningWeekday"];
          long long v34 = objc_msgSend(v32, "numberWithInteger:", objc_msgSend(v33, "integerValue") + 1);
          long long v35 = v6;
          int v36 = v34;
          long long v37 = @"firstPartyMsgMorningWeekday";
          goto LABEL_47;
        }
        if ((unint64_t)(v30 - 12) > 5)
        {
          unint64_t v41 = v30 - 18;
          long long v38 = NSNumber;
          id v39 = v6;
          if (v41 > 5) {
            double v40 = @"firstPartyMsgNightWeekday";
          }
          else {
            double v40 = @"firstPartyMsgEveWeekday";
          }
        }
        else
        {
          long long v38 = NSNumber;
          id v39 = v6;
          double v40 = @"firstPartyMsgNoonWeekday";
        }
      }
      double v33 = [v39 objectForKeyedSubscript:v40];
      long long v34 = objc_msgSend(v38, "numberWithInteger:", objc_msgSend(v33, "integerValue") + 1);
      long long v35 = v6;
      int v36 = v34;
      long long v37 = v40;
LABEL_47:
      [v35 setObject:v36 forKeyedSubscript:v37];

      unint64_t v45 = [v13 startDate];
      [v45 timeIntervalSinceNow];
      double v47 = v46;

      if (v47 >= -1209600.0)
      {
        long long v57 = NSNumber;
        uint64_t v52 = [v6 objectForKeyedSubscript:@"firstPartyMsgTwoWeeks"];
        uint64_t v53 = objc_msgSend(v57, "numberWithInteger:", objc_msgSend(v52, "integerValue") + 1);
        uint64_t v54 = v6;
        long long v55 = v53;
        long long v56 = @"firstPartyMsgTwoWeeks";
      }
      else
      {
        uint64_t v48 = [v13 startDate];
        [v48 timeIntervalSinceNow];
        double v50 = v49;

        if (v50 < -3628800.0) {
          goto LABEL_52;
        }
        uint64_t v51 = NSNumber;
        uint64_t v52 = [v6 objectForKeyedSubscript:@"firstPartyMsgTwoWeeks"];
        uint64_t v53 = objc_msgSend(v51, "numberWithInteger:", objc_msgSend(v52, "integerValue") + 1);
        uint64_t v54 = v6;
        long long v55 = v53;
        long long v56 = @"firstPartyMsgSixWeeks";
      }
      [v54 setObject:v55 forKeyedSubscript:v56];

LABEL_52:
    }
    uint64_t v11 = [obj countByEnumeratingWithState:&v64 objects:v68 count:16];
  }
  while (v11);
LABEL_54:

  id v5 = v58;
LABEL_55:

LABEL_56:
}

- (void)messagesFeaturesFromCumulativeDict:(uint64_t)a1
{
  id v3 = a2;
  dispatch_time_t v4 = v3;
  if (a1)
  {
    if ([v3 count])
    {
      id v5 = [v4 objectForKeyedSubscript:@"firstPartyMsgTotal"];
      uint64_t v6 = [v5 integerValue];

      if (v6)
      {
        id v7 = [v4 objectForKeyedSubscript:@"daysSeen"];
        id v8 = [v4 objectForKeyedSubscript:@"fromDate"];
        [v4 removeObjectForKey:@"daysSeen"];
        [v4 removeObjectForKey:@"fromDate"];
        if (v8)
        {
          id v9 = [MEMORY[0x1E4F1C9A8] currentCalendar];
          uint64_t v10 = [MEMORY[0x1E4F1C9C8] date];
          uint64_t v11 = [v9 components:16 fromDate:v8 toDate:v10 options:0];

          if (v11)
          {
            uint64_t v12 = [v11 day];
            if (!v12)
            {

              goto LABEL_12;
            }
            id v13 = objc_msgSend(NSNumber, "numberWithDouble:", (double)(unint64_t)objc_msgSend(v7, "count") / (double)v12);
            [v4 setObject:v13 forKeyedSubscript:@"firstPartyMsgDayRatio"];
          }
          else
          {
            [v4 setObject:&unk_1EDE1E400 forKeyedSubscript:@"firstPartyMsgDayRatio"];
            id v13 = +[_CDLogging dataCollectionChannel];
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
              -[_CDCloudFamilyDataCollectionTask messagesFeaturesFromCumulativeDict:]();
            }
          }
        }
        uint64_t v14 = NSNumber;
        uint64_t v15 = [v4 objectForKeyedSubscript:@"firstPartyMsgOutgoingRatio"];
        double v16 = (double)v6;
        uint64_t v17 = objc_msgSend(v14, "numberWithDouble:", (double)objc_msgSend(v15, "integerValue") / (double)v6);
        [v4 setObject:v17 forKeyedSubscript:@"firstPartyMsgOutgoingRatio"];

        uint64_t v18 = NSNumber;
        id v19 = [v4 objectForKeyedSubscript:@"firstPartyMsgTwoWeeks"];
        double v20 = objc_msgSend(v18, "numberWithDouble:", (double)objc_msgSend(v19, "integerValue") / v16);
        [v4 setObject:v20 forKeyedSubscript:@"firstPartyMsgTwoWeeks"];

        long long v21 = NSNumber;
        long long v22 = [v4 objectForKeyedSubscript:@"firstPartyMsgSixWeeks"];
        long long v23 = objc_msgSend(v21, "numberWithDouble:", (double)objc_msgSend(v22, "integerValue") / v16);
        [v4 setObject:v23 forKeyedSubscript:@"firstPartyMsgSixWeeks"];

        uint64_t v24 = NSNumber;
        double v25 = [v4 objectForKeyedSubscript:@"firstPartyMsgMorningWeekday"];
        double v26 = objc_msgSend(v24, "numberWithDouble:", (double)objc_msgSend(v25, "integerValue") / v16);
        [v4 setObject:v26 forKeyedSubscript:@"firstPartyMsgMorningWeekday"];

        double v27 = NSNumber;
        uint64_t v28 = [v4 objectForKeyedSubscript:@"firstPartyMsgNoonWeekday"];
        uint64_t v29 = objc_msgSend(v27, "numberWithDouble:", (double)objc_msgSend(v28, "integerValue") / v16);
        [v4 setObject:v29 forKeyedSubscript:@"firstPartyMsgNoonWeekday"];

        uint64_t v30 = NSNumber;
        unint64_t v31 = [v4 objectForKeyedSubscript:@"firstPartyMsgEveWeekday"];
        double v32 = objc_msgSend(v30, "numberWithDouble:", (double)objc_msgSend(v31, "integerValue") / v16);
        [v4 setObject:v32 forKeyedSubscript:@"firstPartyMsgEveWeekday"];

        double v33 = NSNumber;
        long long v34 = [v4 objectForKeyedSubscript:@"firstPartyMsgNightWeekday"];
        long long v35 = objc_msgSend(v33, "numberWithDouble:", (double)objc_msgSend(v34, "integerValue") / v16);
        [v4 setObject:v35 forKeyedSubscript:@"firstPartyMsgNightWeekday"];

        int v36 = NSNumber;
        long long v37 = [v4 objectForKeyedSubscript:@"firstPartyMsgMorningFri"];
        long long v38 = objc_msgSend(v36, "numberWithDouble:", (double)objc_msgSend(v37, "integerValue") / v16);
        [v4 setObject:v38 forKeyedSubscript:@"firstPartyMsgMorningFri"];

        id v39 = NSNumber;
        double v40 = [v4 objectForKeyedSubscript:@"firstPartyMsgNoonFri"];
        unint64_t v41 = objc_msgSend(v39, "numberWithDouble:", (double)objc_msgSend(v40, "integerValue") / v16);
        [v4 setObject:v41 forKeyedSubscript:@"firstPartyMsgNoonFri"];

        unint64_t v42 = NSNumber;
        unint64_t v43 = [v4 objectForKeyedSubscript:@"firstPartyMsgEveFri"];
        unint64_t v44 = objc_msgSend(v42, "numberWithDouble:", (double)objc_msgSend(v43, "integerValue") / v16);
        [v4 setObject:v44 forKeyedSubscript:@"firstPartyMsgEveFri"];

        unint64_t v45 = NSNumber;
        double v46 = [v4 objectForKeyedSubscript:@"firstPartyMsgNightFri"];
        double v47 = objc_msgSend(v45, "numberWithDouble:", (double)objc_msgSend(v46, "integerValue") / v16);
        [v4 setObject:v47 forKeyedSubscript:@"firstPartyMsgNightFri"];

        uint64_t v48 = NSNumber;
        double v49 = [v4 objectForKeyedSubscript:@"firstPartyMsgMorningSat"];
        double v50 = objc_msgSend(v48, "numberWithDouble:", (double)objc_msgSend(v49, "integerValue") / v16);
        [v4 setObject:v50 forKeyedSubscript:@"firstPartyMsgMorningSat"];

        uint64_t v51 = NSNumber;
        uint64_t v52 = [v4 objectForKeyedSubscript:@"firstPartyMsgNoonSat"];
        uint64_t v53 = objc_msgSend(v51, "numberWithDouble:", (double)objc_msgSend(v52, "integerValue") / v16);
        [v4 setObject:v53 forKeyedSubscript:@"firstPartyMsgNoonSat"];

        uint64_t v54 = NSNumber;
        long long v55 = [v4 objectForKeyedSubscript:@"firstPartyMsgEveSat"];
        long long v56 = objc_msgSend(v54, "numberWithDouble:", (double)objc_msgSend(v55, "integerValue") / v16);
        [v4 setObject:v56 forKeyedSubscript:@"firstPartyMsgEveSat"];

        long long v57 = NSNumber;
        id v58 = [v4 objectForKeyedSubscript:@"firstPartyMsgNightSat"];
        long long v59 = objc_msgSend(v57, "numberWithDouble:", (double)objc_msgSend(v58, "integerValue") / v16);
        [v4 setObject:v59 forKeyedSubscript:@"firstPartyMsgNightSat"];

        uint64_t v60 = NSNumber;
        double v61 = [v4 objectForKeyedSubscript:@"firstPartyMsgMorningSun"];
        id v62 = objc_msgSend(v60, "numberWithDouble:", (double)objc_msgSend(v61, "integerValue") / v16);
        [v4 setObject:v62 forKeyedSubscript:@"firstPartyMsgMorningSun"];

        long long v63 = NSNumber;
        long long v64 = [v4 objectForKeyedSubscript:@"firstPartyMsgNoonSun"];
        long long v65 = objc_msgSend(v63, "numberWithDouble:", (double)objc_msgSend(v64, "integerValue") / v16);
        [v4 setObject:v65 forKeyedSubscript:@"firstPartyMsgNoonSun"];

        long long v66 = NSNumber;
        long long v67 = [v4 objectForKeyedSubscript:@"firstPartyMsgEveSun"];
        v68 = objc_msgSend(v66, "numberWithDouble:", (double)objc_msgSend(v67, "integerValue") / v16);
        [v4 setObject:v68 forKeyedSubscript:@"firstPartyMsgEveSun"];

        uint64_t v69 = NSNumber;
        v70 = [v4 objectForKeyedSubscript:@"firstPartyMsgNightSun"];
        uint64_t v71 = objc_msgSend(v69, "numberWithDouble:", (double)objc_msgSend(v70, "integerValue") / v16);
        [v4 setObject:v71 forKeyedSubscript:@"firstPartyMsgNightSun"];

LABEL_12:
      }
    }
  }
}

- (id)thirdPartyMessageFeaturesFromFeatureDictionary:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if ([v3 count])
    {
      id v5 = v3;
      if ([v5 count])
      {
        uint64_t v6 = [v5 objectForKeyedSubscript:@"firstPartyMsgTotal"];
        [v4 setObject:v6 forKeyedSubscript:@"thirdPartyMsgTotal"];

        id v7 = [v5 objectForKeyedSubscript:@"firstPartyMsgDayRatio"];
        [v4 setObject:v7 forKeyedSubscript:@"thirdPartyMsgDayRatio"];

        id v8 = [v5 objectForKeyedSubscript:@"firstPartyMsgTwoWeeks"];
        [v4 setObject:v8 forKeyedSubscript:@"thirdPartyMsgTwoWeeks"];

        id v9 = [v5 objectForKeyedSubscript:@"firstPartyMsgMorningWeekday"];
        [v4 setObject:v9 forKeyedSubscript:@"thirdPartyMsgMorningWeekday"];

        uint64_t v10 = [v5 objectForKeyedSubscript:@"firstPartyMsgNoonWeekday"];
        [v4 setObject:v10 forKeyedSubscript:@"thirdPartyMsgNoonWeekday"];

        uint64_t v11 = [v5 objectForKeyedSubscript:@"firstPartyMsgEveWeekday"];
        [v4 setObject:v11 forKeyedSubscript:@"thirdPartyMsgEveWeekday"];

        uint64_t v12 = [v5 objectForKeyedSubscript:@"firstPartyMsgNightWeekday"];
        [v4 setObject:v12 forKeyedSubscript:@"thirdPartyMsgNightWeekday"];

        id v13 = [v5 objectForKeyedSubscript:@"firstPartyMsgMorningFri"];
        [v4 setObject:v13 forKeyedSubscript:@"thirdPartyMsgMorningFri"];

        uint64_t v14 = [v5 objectForKeyedSubscript:@"firstPartyMsgNoonFri"];
        [v4 setObject:v14 forKeyedSubscript:@"thirdPartyMsgNoonFri"];

        uint64_t v15 = [v5 objectForKeyedSubscript:@"firstPartyMsgEveFri"];
        [v4 setObject:v15 forKeyedSubscript:@"thirdPartyMsgEveFri"];

        double v16 = [v5 objectForKeyedSubscript:@"firstPartyMsgNightFri"];
        [v4 setObject:v16 forKeyedSubscript:@"thirdPartyMsgNightFri"];

        uint64_t v17 = [v5 objectForKeyedSubscript:@"firstPartyMsgMorningSat"];
        [v4 setObject:v17 forKeyedSubscript:@"thirdPartyMsgMorningSat"];

        uint64_t v18 = [v5 objectForKeyedSubscript:@"firstPartyMsgNoonSat"];
        [v4 setObject:v18 forKeyedSubscript:@"thirdPartyMsgNoonSat"];

        id v19 = [v5 objectForKeyedSubscript:@"firstPartyMsgEveSat"];
        [v4 setObject:v19 forKeyedSubscript:@"thirdPartyMsgEveSat"];

        double v20 = [v5 objectForKeyedSubscript:@"firstPartyMsgNightSat"];
        [v4 setObject:v20 forKeyedSubscript:@"thirdPartyMsgNightSat"];

        long long v21 = [v5 objectForKeyedSubscript:@"firstPartyMsgMorningSun"];
        [v4 setObject:v21 forKeyedSubscript:@"thirdPartyMsgMorningSun"];

        long long v22 = [v5 objectForKeyedSubscript:@"firstPartyMsgNoonSun"];
        [v4 setObject:v22 forKeyedSubscript:@"thirdPartyMsgNoonSun"];

        long long v23 = [v5 objectForKeyedSubscript:@"firstPartyMsgEveSun"];
        [v4 setObject:v23 forKeyedSubscript:@"thirdPartyMsgEveSun"];

        uint64_t v24 = [v5 objectForKeyedSubscript:@"firstPartyMsgNightSun"];
        [v4 setObject:v24 forKeyedSubscript:@"thirdPartyMsgNightSun"];

        id v25 = v4;
      }
      else
      {
        id v25 = (id)MEMORY[0x1E4F1CC08];
      }
    }
    else
    {
      id v25 = v4;
    }
  }
  else
  {
    id v25 = 0;
  }

  return v25;
}

- (id)getThirdPartyPredicateForContact:(void *)a3 handles:
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v39 = a2;
  id v5 = a3;
  long long v38 = v5;
  if (a1)
  {
    uint64_t v6 = v5;
    id v7 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"bundleId != %@", @"com.apple.MobileSMS"];
    uint64_t v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"direction IN %@", &unk_1EDE1E6F8];
    uint64_t v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"mechanism IN %@", &unk_1EDE1E710];
    int v36 = (void *)v8;
    [v7 addObject:v8];
    long long v35 = (void *)v9;
    [v7 addObject:v9];
    long long v37 = v7;
    long long v34 = (void *)v10;
    [v7 addObject:v10];
    uint64_t v11 = objc_opt_new();
    uint64_t v12 = objc_opt_new();
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    obuint64_t j = v6;
    uint64_t v13 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v42 != v15) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          uint64_t v18 = +[_CDContactResolver normalizedStringFromContactString:v17];
          id v19 = [MEMORY[0x1E4F28B88] alphanumericCharacterSet];
          double v20 = [v17 stringByAddingPercentEncodingWithAllowedCharacters:v19];

          long long v21 = [NSString stringWithFormat:@"conversationIdentifier(%@)", v20];
          [v12 addObject:v21];

          [v11 addObject:v18];
        }
        uint64_t v14 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
      }
      while (v14);
    }

    long long v22 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(ANY recipients.identifier IN %@)", v11];
    long long v23 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(derivedIntentIdentifier IN %@)", v12];
    uint64_t v24 = (void *)MEMORY[0x1E4F28F60];
    id v25 = (void *)MEMORY[0x1E4F1CAD0];
    double v26 = [v39 identifier];
    double v27 = [v25 setWithObject:v26];
    uint64_t v28 = [v24 predicateWithFormat:@"(ANY recipients.personId IN %@)", v27];

    uint64_t v29 = (void *)MEMORY[0x1E4F28BA0];
    v45[0] = v22;
    v45[1] = v23;
    v45[2] = v28;
    uint64_t v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:3];
    unint64_t v31 = [v29 orPredicateWithSubpredicates:v30];
    [v37 addObject:v31];

    double v32 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v37];
  }
  else
  {
    double v32 = 0;
  }

  return v32;
}

- (id)fetchInteractionFeatureDictionaryWithPredicate:(void *)a3 store:(void *)a4 sortDescription:
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    uint64_t v10 = objc_opt_new();
    uint64_t v11 = 0;
    uint64_t v12 = (void *)MEMORY[0x1E4F1CBF0];
    do
    {
      uint64_t v13 = v12;
      uint64_t v14 = (void *)MEMORY[0x192FB2F20]();
      v17[0] = v9;
      uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
      uint64_t v12 = [v8 queryInteractionsUsingPredicate:v7 sortDescriptors:v15 limit:128 offset:v11 error:0];

      -[_CDCloudFamilyDataCollectionTask messagesCumulativeFeaturesFromInteractionsBatch:mutableMessagesDictionary:](a1, v12, v10);
      v11 += 128;
    }
    while ([v12 count] == 128);
    -[_CDCloudFamilyDataCollectionTask messagesFeaturesFromCumulativeDict:](a1, v10);
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (OS_xpc_object)activity
{
  return self->_activity;
}

- (id)submissionBlock
{
  return self->_submissionBlock;
}

- (void)setSubmissionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventDictState, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_videoBundleIDLookup, 0);
  objc_storeStrong((id *)&self->_medicalIDStore, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_interactionStore, 0);
  objc_storeStrong((id *)&self->_collectionDate, 0);
  objc_storeStrong((id *)&self->_sessionPath, 0);
  objc_storeStrong((id *)&self->_dataDirectory, 0);
  objc_storeStrong(&self->_submissionBlock, 0);
  objc_storeStrong((id *)&self->_activity, 0);
}

- (void)initWithStorage:contactStore:medicalIDStore:activity:sessionPath:dataDirectory:collectionDate:samplingRate:maxBatches:daysPerBatch:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_18ECEB000, v0, v1, "Error unarchiving cloud family data collection session: %@", v2, v3, v4, v5, v6);
}

- (void)contactsEmergency
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_0(&dword_18ECEB000, v0, v1, "Timeout when fetching emergency contacts", v2, v3, v4, v5, v6);
}

- (void)airDropPeopleAtHome
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_0(&dword_18ECEB000, v0, v1, "Timeout when fetching Routine homeVisits", v2, v3, v4, v5, v6);
}

- (void)labelMembers
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_0(&dword_18ECEB000, v0, v1, "Timeout waiting for family cache labels", v2, v3, v4, v5, v6);
}

- (void)truncatedFileHandle
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_18ECEB000, v0, v1, "Error creating directory for data collection: %@", v2, v3, v4, v5, v6);
}

- (void)submitDataForCollection
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_18ECEB000, v0, v1, "Compressing airplay data collection json file", v2, v3, v4, v5, v6);
}

- (void)allAirDropInteractionsFromStore:fetchLimit:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_18ECEB000, MEMORY[0x1E4F14500], v0, "Error querying interactions database: %@", v1, v2, v3, v4, v5);
}

- (void)queryContactsForGivenName:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_18ECEB000, v0, v1, "Error querying contacts %@", v2, v3, v4, v5, v6);
}

- (void)messagesFeaturesFromCumulativeDict:.cold.1()
{
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_18ECEB000, v0, OS_LOG_TYPE_ERROR, "Number of days was not valid, could not calculate ratio", v1, 2u);
}

@end