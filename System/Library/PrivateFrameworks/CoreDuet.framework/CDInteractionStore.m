@interface CDInteractionStore
@end

@implementation CDInteractionStore

void __100___CDInteractionStore_queryInteractionsUsingPredicate_sortDescriptors_limit_offset_objectIDs_error___block_invoke(uint64_t a1)
{
  v42[4] = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) begin];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
  v3 = [MEMORY[0x1E4F1C0A8] entityForName:@"Interactions" inManagedObjectContext:*(void *)(a1 + 40)];
  [v2 setEntity:v3];

  [v2 setReturnsObjectsAsFaults:0];
  v42[0] = @"sender";
  v42[1] = @"recipients";
  v42[2] = @"keywords";
  v42[3] = @"attachments";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:4];
  [v2 setRelationshipKeyPathsForPrefetching:v4];

  v5 = +[_CDInteractionStore predicateFilteringUsernameForPredicate:*(void *)(a1 + 48)];
  [v2 setPredicate:v5];

  [v2 setFetchLimit:*(void *)(a1 + 96)];
  [v2 setFetchOffset:*(void *)(a1 + 104)];
  v6 = *(void **)(a1 + 56);
  if (v6 && [v6 count]) {
    [v2 setSortDescriptors:*(void *)(a1 + 56)];
  }
  v7 = [MEMORY[0x1E4F1C9C8] date];
  v8 = *(void **)(a1 + 40);
  id v32 = 0;
  id v9 = [v8 executeFetchRequest:v2 error:&v32];
  id v10 = v32;
  id v11 = v32;
  if (v11) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), v10);
  }

  v12 = +[_CDLogging instrumentationChannel];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = [v2 fetchLimit];
    [v7 timeIntervalSinceNow];
    double v15 = v14;
    uint64_t v16 = [v9 count];
    v17 = [v2 predicate];
    *(_DWORD *)buf = 134218755;
    uint64_t v35 = v13;
    __int16 v36 = 2048;
    double v37 = -v15;
    __int16 v38 = 2048;
    uint64_t v39 = v16;
    __int16 v40 = 2113;
    v41 = v17;
    _os_log_impl(&dword_18ECEB000, v12, OS_LOG_TYPE_INFO, "queryInteractionsUsingPredicate finished executeFetchRequest, fetchLimit %lu object(s), elapsed %f(sec), returned %lu object(s), Predicate: %{private}@", buf, 0x2Au);
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40))
  {
    v18 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v9, "count"));
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v9 = v9;
    uint64_t v19 = [v9 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v29 != v20) {
            objc_enumerationMutation(v9);
          }
          v22 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          v23 = objc_msgSend(*(id *)(a1 + 64), "createInteractionFromRecord:", v22, (void)v28);
          [v18 addObject:v23];

          v24 = *(void **)(a1 + 72);
          v25 = [v22 objectID];
          [v24 addObject:v25];
        }
        uint64_t v19 = [v9 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v19);
    }

    uint64_t v26 = *(void *)(*(void *)(a1 + 88) + 8);
    v27 = *(void **)(v26 + 40);
    *(void *)(v26 + 40) = v18;
  }
}

void __42___CDInteractionStore_setMetadata_forKey___block_invoke(uint64_t a1)
{
  v24[1] = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) _deleteMetadataForKey:*(void *)(a1 + 40) moc:*(void *)(a1 + 48)]&& *(void *)(a1 + 56))
  {
    if (!*(void *)(a1 + 64)) {
      __42___CDInteractionStore_setMetadata_forKey___block_invoke_cold_1();
    }
    id v2 = [MEMORY[0x1E4F1C0A8] entityForName:@"Metadata" inManagedObjectContext:*(void *)(a1 + 48)];
    id v3 = objc_alloc(MEMORY[0x1E4F1C028]);
    uint64_t v4 = *(void *)(a1 + 40);
    v22[0] = @"key";
    v22[1] = @"value";
    uint64_t v5 = *(void *)(a1 + 64);
    v23[0] = v4;
    v23[1] = v5;
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
    v24[0] = v6;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
    v8 = (void *)[v3 initWithEntity:v2 objects:v7];

    id v9 = *(void **)(a1 + 48);
    id v15 = 0;
    id v10 = (id)[v9 executeRequest:v8 error:&v15];
    id v11 = v15;
    if (v11)
    {
      v12 = +[_CDLogging interactionChannel];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        uint64_t v13 = *(void *)(a1 + 56);
        uint64_t v14 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138478339;
        uint64_t v17 = v13;
        __int16 v18 = 2114;
        uint64_t v19 = v14;
        __int16 v20 = 2113;
        id v21 = v11;
        _os_log_fault_impl(&dword_18ECEB000, v12, OS_LOG_TYPE_FAULT, "metadata: failed to set %{private}@ for key %{public}@: %{private}@", buf, 0x20u);
      }
    }
  }
}

void __38___CDInteractionStore_metadataForKey___block_invoke(void *a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
  id v3 = [MEMORY[0x1E4F1C0A8] entityForName:@"Metadata" inManagedObjectContext:a1[4]];
  [v2 setEntity:v3];

  [v2 setResultType:2];
  uint64_t v4 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"key = %@", a1[5]];
  [v2 setPredicate:v4];

  [v2 setFetchLimit:1];
  uint64_t v5 = (void *)a1[4];
  id v14 = 0;
  v6 = [v5 executeFetchRequest:v2 error:&v14];
  id v7 = v14;
  if (v7)
  {
    v8 = +[_CDLogging interactionChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      __38___CDInteractionStore_metadataForKey___block_invoke_cold_1(a1 + 5, (uint64_t)v7, v8);
    }
  }
  id v9 = [v6 firstObject];
  id v10 = [v9 objectForKeyedSubscript:@"value"];

  if (v10)
  {
    uint64_t v11 = [MEMORY[0x1E4F28F98] propertyListWithData:v10 options:0 format:0 error:0];
    uint64_t v12 = *(void *)(a1[6] + 8);
    uint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }
}

id __78___CDInteractionStore_deleteInteractionsWithBundleId_domainIdentifiers_error___block_invoke(uint64_t a1, void *a2)
{
  v10[3] = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  v10[0] = a2;
  v9[0] = @"domainIdentifier";
  v9[1] = @"domainIdentifierDot";
  id v3 = a2;
  uint64_t v4 = [v3 stringByAppendingString:@"."];
  v10[1] = v4;
  v9[2] = @"domainIdentifierSlash";
  uint64_t v5 = [v3 stringByAppendingString:@"/"];
  v10[2] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:3];
  id v7 = [v2 predicateWithSubstitutionVariables:v6];

  return v7;
}

void __70___CDInteractionStore_fetchOrCreateKeywordRecord_context_cache_error___block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) begin];
  id v2 = *(void **)(a1 + 40);
  BOOL v3 = v2 == 0;
  if (!v2)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
    uint64_t v11 = [MEMORY[0x1E4F1C0A8] entityForName:@"Keywords" inManagedObjectContext:*(void *)(a1 + 56)];
    [v4 setEntity:v11];

    uint64_t v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"keyword == %@", *(void *)(a1 + 48)];
    [v4 setPredicate:v12];

    id v10 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v13 = *(void **)(a1 + 56);
    id v30 = 0;
    id v14 = [v13 executeFetchRequest:v4 error:&v30];
    id v8 = v30;
    uint64_t v15 = [v14 lastObject];
    uint64_t v16 = *(void *)(*(void *)(a1 + 72) + 8);
    uint64_t v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;

    __int16 v18 = +[_CDLogging instrumentationChannel];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = [v4 fetchLimit];
      [v10 timeIntervalSinceNow];
      double v21 = v20;
      BOOL v22 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) != 0;
      v23 = [v4 predicate];
      *(_DWORD *)buf = 134218755;
      uint64_t v33 = v19;
      __int16 v34 = 2048;
      double v35 = -v21;
      __int16 v36 = 1024;
      BOOL v37 = v22;
      __int16 v38 = 2113;
      uint64_t v39 = v23;
      _os_log_impl(&dword_18ECEB000, v18, OS_LOG_TYPE_INFO, "fetchOrCreateKeywordRecord finished executeFetchRequest, fetchLimit %lu object(s), elapsed %f(sec), returned %i object(s), Predicate: %{private}@", buf, 0x26u);
    }
    goto LABEL_7;
  }
  id v4 = [v2 objectForKeyedSubscript:*(void *)(a1 + 48)];
  BOOL v5 = v4 == 0;
  if (v4)
  {
    v6 = *(void **)(a1 + 56);
    id v31 = 0;
    uint64_t v7 = [v6 existingObjectWithID:v4 error:&v31];
    id v8 = v31;
    uint64_t v9 = *(void *)(*(void *)(a1 + 72) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v7;
LABEL_7:

    BOOL v5 = v3;
    goto LABEL_9;
  }
  id v8 = 0;
LABEL_9:

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), v8);
  if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
  {
    if (!v5) {
      goto LABEL_16;
    }
  }
  else
  {
    uint64_t v24 = [MEMORY[0x1E4F1C0A8] insertNewObjectForEntityForName:@"Keywords" inManagedObjectContext:*(void *)(a1 + 56)];
    uint64_t v25 = *(void *)(*(void *)(a1 + 72) + 8);
    uint64_t v26 = *(void **)(v25 + 40);
    *(void *)(v25 + 40) = v24;

    v27 = [MEMORY[0x1E4F1C9C8] date];
    [v27 timeIntervalSinceReferenceDate];
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), "setCreationDate:");

    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setKeyword:*(void *)(a1 + 48)];
  }
  if (*(void *)(a1 + 40))
  {
    long long v28 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    if (v28)
    {
      long long v29 = [v28 objectID];
      [*(id *)(a1 + 40) setObject:v29 forKeyedSubscript:*(void *)(a1 + 48)];
    }
  }
LABEL_16:
}

void __73___CDInteractionStore_fetchOrCreateAttachmentRecord_context_cache_error___block_invoke(uint64_t a1)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) begin];
  id v2 = *(void **)(a1 + 40);
  BOOL v3 = v2 == 0;
  if (!v2)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
    uint64_t v11 = [MEMORY[0x1E4F1C0A8] entityForName:@"Attachment" inManagedObjectContext:*(void *)(a1 + 56)];
    [v4 setEntity:v11];

    uint64_t v12 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v13 = [*(id *)(a1 + 48) identifier];
    id v14 = [*(id *)(a1 + 48) cloudIdentifier];
    uint64_t v15 = [*(id *)(a1 + 48) uti];
    uint64_t v16 = [*(id *)(a1 + 48) personInPhoto];
    uint64_t v17 = [*(id *)(a1 + 48) photoSceneDescriptor];
    __int16 v18 = [v12 predicateWithFormat:@"identifier == %@ AND cloudIdentifier == %@ AND uti == %@ AND personInPhoto == %@ AND photoSceneDescriptor == %@", v13, v14, v15, v16, v17];
    [v4 setPredicate:v18];

    id v10 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v19 = *(void **)(a1 + 56);
    id v45 = 0;
    double v20 = [v19 executeFetchRequest:v4 error:&v45];
    id v8 = v45;
    uint64_t v21 = [v20 lastObject];
    uint64_t v22 = *(void *)(*(void *)(a1 + 72) + 8);
    v23 = *(void **)(v22 + 40);
    *(void *)(v22 + 40) = v21;

    uint64_t v24 = +[_CDLogging instrumentationChannel];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      uint64_t v25 = [v4 fetchLimit];
      [v10 timeIntervalSinceNow];
      double v27 = v26;
      BOOL v28 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) != 0;
      long long v29 = [v4 predicate];
      *(_DWORD *)buf = 134218755;
      uint64_t v48 = v25;
      __int16 v49 = 2048;
      double v50 = -v27;
      __int16 v51 = 1024;
      BOOL v52 = v28;
      __int16 v53 = 2113;
      v54 = v29;
      _os_log_impl(&dword_18ECEB000, v24, OS_LOG_TYPE_INFO, "fetchOrCreateAttachmentRecord finished executeFetchRequest, fetchLimit %lu object(s), elapsed %f(sec), returned %i object(s), Predicate: %{private}@", buf, 0x26u);
    }
    goto LABEL_7;
  }
  id v4 = [v2 objectForKeyedSubscript:*(void *)(a1 + 48)];
  BOOL v5 = v4 == 0;
  if (v4)
  {
    v6 = *(void **)(a1 + 56);
    id v46 = 0;
    uint64_t v7 = [v6 existingObjectWithID:v4 error:&v46];
    id v8 = v46;
    uint64_t v9 = *(void *)(*(void *)(a1 + 72) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v7;
LABEL_7:

    BOOL v5 = v3;
    goto LABEL_9;
  }
  id v8 = 0;
LABEL_9:

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), v8);
  if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
  {
    if (!v5) {
      goto LABEL_16;
    }
  }
  else
  {
    uint64_t v30 = [MEMORY[0x1E4F1C0A8] insertNewObjectForEntityForName:@"Attachment" inManagedObjectContext:*(void *)(a1 + 56)];
    uint64_t v31 = *(void *)(*(void *)(a1 + 72) + 8);
    id v32 = *(void **)(v31 + 40);
    *(void *)(v31 + 40) = v30;

    uint64_t v33 = [*(id *)(a1 + 48) creationDate];
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setCreationDate:v33];

    __int16 v34 = [*(id *)(a1 + 48) identifier];
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setIdentifier:v34];

    double v35 = [*(id *)(a1 + 48) photoLocalIdentifier];
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setPhotoLocalIdentifier:v35];

    __int16 v36 = [*(id *)(a1 + 48) cloudIdentifier];
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setCloudIdentifier:v36];

    BOOL v37 = [*(id *)(a1 + 48) size];
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), "setSizeInBytes:", objc_msgSend(v37, "longLongValue"));

    __int16 v38 = [*(id *)(a1 + 48) uti];
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setUti:v38];

    uint64_t v39 = [*(id *)(a1 + 48) contentText];
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setContentText:v39];

    uint64_t v40 = [*(id *)(a1 + 48) contentURL];
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setContentURL:v40];

    v41 = [*(id *)(a1 + 48) personInPhoto];
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setPersonInPhoto:v41];

    v42 = [*(id *)(a1 + 48) photoSceneDescriptor];
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setPhotoSceneDescriptor:v42];
  }
  if (*(void *)(a1 + 40))
  {
    v43 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    if (v43)
    {
      v44 = [v43 objectID];
      [*(id *)(a1 + 40) setObject:v44 forKeyedSubscript:*(void *)(a1 + 48)];
    }
  }
LABEL_16:
}

void __70___CDInteractionStore_fetchOrCreateContactRecord_context_cache_error___block_invoke(uint64_t a1)
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) begin];
  id v2 = *(void **)(a1 + 40);
  BOOL v47 = v2 == 0;
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
    id v10 = [MEMORY[0x1E4F1C0A8] entityForName:@"Contacts" inManagedObjectContext:*(void *)(a1 + 56)];
    [v3 setEntity:v10];

    uint64_t v11 = (void *)MEMORY[0x1E4F28F60];
    id v46 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 48), "personIdType"));
    uint64_t v12 = [*(id *)(a1 + 48) personId];
    uint64_t v13 = [*(id *)(a1 + 48) identifier];
    id v14 = [*(id *)(a1 + 48) displayName];
    uint64_t v15 = [*(id *)(a1 + 48) customIdentifier];
    uint64_t v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 48), "displayType"));
    uint64_t v17 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 48), "participantStatus"));
    __int16 v18 = [v11 predicateWithFormat:@"personIdType == %@ AND personId == %@ AND identifier == %@ AND displayName == %@ AND customIdentifier == %@ AND displayType == %@ AND participantStatus == %@", v46, v12, v13, v14, v15, v16, v17];
    [v3 setPredicate:v18];

    uint64_t v9 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v19 = *(void **)(a1 + 56);
    id v48 = 0;
    double v20 = [v19 executeFetchRequest:v3 error:&v48];
    id v7 = v48;
    uint64_t v21 = [v20 lastObject];
    uint64_t v22 = *(void *)(*(void *)(a1 + 72) + 8);
    v23 = *(void **)(v22 + 40);
    *(void *)(v22 + 40) = v21;

    uint64_t v24 = +[_CDLogging instrumentationChannel];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      uint64_t v25 = [v3 fetchLimit];
      [v9 timeIntervalSinceNow];
      double v27 = v26;
      BOOL v28 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) != 0;
      long long v29 = [v3 predicate];
      *(_DWORD *)buf = 134218755;
      uint64_t v51 = v25;
      __int16 v52 = 2048;
      double v53 = -v27;
      __int16 v54 = 1024;
      BOOL v55 = v28;
      __int16 v56 = 2113;
      v57 = v29;
      _os_log_impl(&dword_18ECEB000, v24, OS_LOG_TYPE_INFO, "fetchOrCreateContactRecord finished executeFetchRequest, fetchLimit %lu object(s), elapsed %f(sec), returned %i object(s), Predicate: %{private}@", buf, 0x26u);
    }
    goto LABEL_7;
  }
  id v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 48)];
  BOOL v4 = v3 == 0;
  if (v3)
  {
    BOOL v5 = *(void **)(a1 + 56);
    id v49 = 0;
    uint64_t v6 = [v5 existingObjectWithID:v3 error:&v49];
    id v7 = v49;
    uint64_t v8 = *(void *)(*(void *)(a1 + 72) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v6;
LABEL_7:

    BOOL v4 = v47;
    goto LABEL_9;
  }
  id v7 = 0;
LABEL_9:

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), v7);
  uint64_t v30 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  if (v30)
  {
    buf[0] = 0;
    uint64_t v31 = [*(id *)(a1 + 64) appendMissingInformationForRecord:v30 fromContact:*(void *)(a1 + 48) cacheUpdateRequired:buf];
    uint64_t v32 = *(void *)(*(void *)(a1 + 72) + 8);
    uint64_t v33 = *(void **)(v32 + 40);
    *(void *)(v32 + 40) = v31;

    if (buf[0]) {
      BOOL v4 = 1;
    }
  }
  else
  {
    uint64_t v34 = [MEMORY[0x1E4F1C0A8] insertNewObjectForEntityForName:@"Contacts" inManagedObjectContext:*(void *)(a1 + 56)];
    uint64_t v35 = *(void *)(*(void *)(a1 + 72) + 8);
    __int16 v36 = *(void **)(v35 + 40);
    *(void *)(v35 + 40) = v34;

    BOOL v37 = [MEMORY[0x1E4F1C9C8] date];
    [v37 timeIntervalSinceReferenceDate];
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), "setCreationDate:");

    __int16 v38 = [*(id *)(a1 + 48) identifier];
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setIdentifier:v38];

    uint64_t v39 = [*(id *)(a1 + 48) customIdentifier];
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setCustomIdentifier:v39];

    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), "setPersonIdType:", objc_msgSend(*(id *)(a1 + 48), "personIdType"));
    uint64_t v40 = [*(id *)(a1 + 48) personId];
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setPersonId:v40];

    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), "setType:", objc_msgSend(*(id *)(a1 + 48), "type"));
    v41 = [*(id *)(a1 + 48) displayName];
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setDisplayName:v41];

    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), "setDisplayType:", objc_msgSend(*(id *)(a1 + 48), "displayType"));
    v42 = [*(id *)(a1 + 48) displayImageURL];
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setDisplayImageURL:v42];

    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), "setParticipantStatus:", objc_msgSend(*(id *)(a1 + 48), "participantStatus"));
    BOOL v4 = 1;
  }
  uint64_t v43 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) participantStatus];
  if (v43 != [*(id *)(a1 + 48) participantStatus]) {
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), "setParticipantStatus:", objc_msgSend(*(id *)(a1 + 48), "participantStatus"));
  }
  if (v4)
  {
    if (*(void *)(a1 + 40))
    {
      v44 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
      if (v44)
      {
        id v45 = [v44 objectID];
        [*(id *)(a1 + 40) setObject:v45 forKeyedSubscript:*(void *)(a1 + 48)];
      }
    }
  }
}

void __70___CDInteractionStore_batchFetchExistingKeywordRecords_context_error___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) begin];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
  id v3 = [MEMORY[0x1E4F1C0A8] entityForName:@"Keywords" inManagedObjectContext:*(void *)(a1 + 40)];
  [v2 setEntity:v3];

  BOOL v4 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"keyword in %@", *(void *)(a1 + 48)];
  [v2 setPredicate:v4];

  BOOL v5 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v6 = *(void **)(a1 + 40);
  id v26 = 0;
  id v7 = [v6 executeFetchRequest:v2 error:&v26];
  id v8 = v26;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v8);
  uint64_t v9 = +[_CDLogging instrumentationChannel];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = [v2 fetchLimit];
    [v5 timeIntervalSinceNow];
    double v12 = v11;
    uint64_t v13 = [v7 count];
    id v14 = [v2 predicate];
    *(_DWORD *)buf = 134218755;
    uint64_t v29 = v10;
    __int16 v30 = 2048;
    double v31 = -v12;
    __int16 v32 = 2048;
    uint64_t v33 = v13;
    __int16 v34 = 2113;
    uint64_t v35 = v14;
    _os_log_impl(&dword_18ECEB000, v9, OS_LOG_TYPE_INFO, "batchFetchExistingKeywordRecords finished executeFetchRequest, fetchLimit %lu object(s), elapsed %f(sec), returned %lu object(s), Predicate: %{private}@", buf, 0x2Au);
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v15 = v7;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v15);
        }
        uint64_t v19 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        double v20 = [*(id *)(a1 + 56) createKeywordFromRecord:v19];
        uint64_t v21 = [v19 objectID];
        [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setObject:v21 forKeyedSubscript:v20];
      }
      uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v16);
  }
}

void __73___CDInteractionStore_batchFetchExistingAttachmentRecords_context_error___block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) begin];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
  id v3 = [MEMORY[0x1E4F1C0A8] entityForName:@"Attachment" inManagedObjectContext:*(void *)(a1 + 40)];
  [v2 setEntity:v3];

  BOOL v4 = [*(id *)(a1 + 48) valueForKey:@"identifier"];
  BOOL v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"identifier in %@", v4];
  [v2 setPredicate:v5];

  long long v22 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v6 = *(void **)(a1 + 40);
  id v27 = 0;
  id v7 = [v6 executeFetchRequest:v2 error:&v27];
  id v8 = v27;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v8);
  uint64_t v9 = +[_CDLogging instrumentationChannel];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = [v2 fetchLimit];
    [v22 timeIntervalSinceNow];
    double v12 = v11;
    uint64_t v13 = [v7 count];
    id v14 = [v2 predicate];
    *(_DWORD *)buf = 134218755;
    uint64_t v30 = v10;
    __int16 v31 = 2048;
    double v32 = -v12;
    __int16 v33 = 2048;
    uint64_t v34 = v13;
    __int16 v35 = 2113;
    uint64_t v36 = v14;
    _os_log_impl(&dword_18ECEB000, v9, OS_LOG_TYPE_INFO, "batchFetchExistingAttachmentRecords finished executeFetchRequest, fetchLimit %lu object(s), elapsed %f(sec), returned %lu object(s), Predicate: %{private}@", buf, 0x2Au);
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v15 = v7;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(v15);
        }
        uint64_t v19 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        double v20 = [*(id *)(a1 + 56) createAttachmentFromRecord:v19];
        uint64_t v21 = [v19 objectID];
        [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setObject:v21 forKeyedSubscript:v20];
      }
      uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v16);
  }
}

void __70___CDInteractionStore_batchFetchExistingContactRecords_context_error___block_invoke(uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) begin];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
  id v3 = [MEMORY[0x1E4F1C0A8] entityForName:@"Contacts" inManagedObjectContext:*(void *)(a1 + 40)];
  [v2 setEntity:v3];

  BOOL v4 = [MEMORY[0x1E4F1CA80] set];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v36 objects:v49 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v37 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        uint64_t v10 = [v9 identifier];

        if (v10)
        {
          double v11 = [v9 identifier];
          [v4 addObject:v11];
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v36 objects:v49 count:16];
    }
    while (v6);
  }

  double v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"identifier in %@", v4];
  [v2 setPredicate:v12];

  uint64_t v30 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v13 = *(void **)(a1 + 40);
  id v35 = 0;
  id v14 = [v13 executeFetchRequest:v2 error:&v35];
  id v29 = v35;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v29);
  id v15 = +[_CDLogging instrumentationChannel];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    uint64_t v16 = [v2 fetchLimit];
    [v30 timeIntervalSinceNow];
    double v18 = v17;
    uint64_t v19 = [v14 count];
    double v20 = [v2 predicate];
    *(_DWORD *)buf = 134218755;
    uint64_t v42 = v16;
    __int16 v43 = 2048;
    double v44 = -v18;
    __int16 v45 = 2048;
    uint64_t v46 = v19;
    __int16 v47 = 2113;
    id v48 = v20;
    _os_log_impl(&dword_18ECEB000, v15, OS_LOG_TYPE_INFO, "batchFetchExistingContactRecords finished executeFetchRequest, fetchLimit %lu object(s), elapsed %f(sec), returned %lu object(s), Predicate: %{private}@", buf, 0x2Au);
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v21 = v14;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v31 objects:v40 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v32 != v23) {
          objc_enumerationMutation(v21);
        }
        long long v25 = *(void **)(*((void *)&v31 + 1) + 8 * j);
        long long v26 = (void *)MEMORY[0x192FB2F20]();
        id v27 = [*(id *)(a1 + 56) getContactForRecord:v25];
        BOOL v28 = [v25 objectID];
        [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setObject:v28 forKeyedSubscript:v27];
      }
      uint64_t v22 = [v21 countByEnumeratingWithState:&v31 objects:v40 count:16];
    }
    while (v22);
  }
}

void __77___CDInteractionStore_batchFetchExistingInteractionsWithUUIDs_context_error___block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) begin];
  id v26 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
  id v2 = [MEMORY[0x1E4F1C0A8] entityForName:@"Interactions" inManagedObjectContext:*(void *)(a1 + 40)];
  [v26 setEntity:v2];

  id v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"uuid in %@", *(void *)(a1 + 48)];
  BOOL v4 = +[_CDInteractionStore predicateFilteringUsernameForPredicate:v3];
  [v26 setPredicate:v4];

  long long v25 = [MEMORY[0x1E4F1C9C8] date];
  id v5 = *(void **)(a1 + 40);
  id v31 = 0;
  uint64_t v6 = [v5 executeFetchRequest:v26 error:&v31];
  id v24 = v31;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v24);
  uint64_t v7 = +[_CDLogging instrumentationChannel];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = [v26 fetchLimit];
    [v25 timeIntervalSinceNow];
    double v10 = v9;
    uint64_t v11 = [v6 count];
    double v12 = [v26 predicate];
    *(_DWORD *)buf = 134218755;
    uint64_t v34 = v8;
    __int16 v35 = 2048;
    double v36 = -v10;
    __int16 v37 = 2048;
    uint64_t v38 = v11;
    __int16 v39 = 2113;
    uint64_t v40 = v12;
    _os_log_impl(&dword_18ECEB000, v7, OS_LOG_TYPE_INFO, "batchFetchExistingInteractionsWithUUIDs finished executeFetchRequest, fetchLimit %lu object(s), elapsed %f(sec), returned %lu object(s), Predicate: %{private}@", buf, 0x2Au);
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v13 = v6;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v32 count:16];
  id v15 = v13;
  if (!v14) {
    goto LABEL_16;
  }
  uint64_t v16 = 0;
  uint64_t v17 = *(void *)v28;
  do
  {
    for (uint64_t i = 0; i != v14; ++i)
    {
      if (*(void *)v28 != v17) {
        objc_enumerationMutation(v13);
      }
      uint64_t v19 = *(void **)(*((void *)&v27 + 1) + 8 * i);
      double v20 = [v19 uuid];
      if (v20)
      {
        id v21 = [v19 objectID];
        uint64_t v22 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
        uint64_t v23 = [v19 uuid];
        [v22 setObject:v21 forKeyedSubscript:v23];
      }
      else
      {
        v16 += [v19 isDeleted] ^ 1;
      }
    }
    uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v32 count:16];
  }
  while (v14);

  if (v16)
  {
    id v15 = +[_CDLogging interactionChannel];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      __77___CDInteractionStore_batchFetchExistingInteractionsWithUUIDs_context_error___block_invoke_cold_1((void *)(a1 + 48), v16, v15);
    }
LABEL_16:
  }
}

void __103___CDInteractionStore_createInteractionRecord_context_keywordCache_attachmentCache_contactCache_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1C0A8] insertNewObjectForEntityForName:@"Interactions" inManagedObjectContext:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 80) + 8);
  BOOL v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = [MEMORY[0x1E4F1C9C8] date];
  [v5 timeIntervalSinceReferenceDate];
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), "setCreationDate:");

  [*(id *)(a1 + 40) fillWithoutRelationshipsInteractionRecord:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) fromInteraction:*(void *)(a1 + 48)];
  uint64_t v6 = *(void **)(a1 + 40);
  uint64_t v7 = [*(id *)(a1 + 48) sender];
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 56);
  id v60 = 0;
  double v10 = [v6 fetchOrCreateContactRecord:v7 context:v8 cache:v9 error:&v60];
  id v11 = v60;
  id v12 = v60;
  [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) setSender:v10];

  uint64_t v13 = *(void **)(a1 + 40);
  uint64_t v14 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) sender];
  [v13 updateCachedStatsForContactRecord:v14 isSender:1 withInteraction:*(void *)(a1 + 48)];

  if (v12) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40), v11);
  }
  id v15 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
  id v16 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v17 = [*(id *)(a1 + 48) recipients];
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __103___CDInteractionStore_createInteractionRecord_context_keywordCache_attachmentCache_contactCache_error___block_invoke_2;
  v55[3] = &unk_1E560E9D8;
  int8x16_t v41 = *(int8x16_t *)(a1 + 32);
  id v18 = (id)v41.i64[0];
  int8x16_t v56 = vextq_s8(v41, v41, 8uLL);
  id v57 = *(id *)(a1 + 56);
  id v19 = *(id *)(a1 + 48);
  uint64_t v20 = *(void *)(a1 + 88);
  id v58 = v19;
  uint64_t v59 = v20;
  id v21 = objc_msgSend(v17, "_pas_mappedArrayWithTransform:", v55);
  uint64_t v22 = (void *)[v16 initWithArray:v21];
  [v15 addRecipients:v22];

  uint64_t v23 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
  id v24 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  long long v25 = [*(id *)(a1 + 48) keywords];
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __103___CDInteractionStore_createInteractionRecord_context_keywordCache_attachmentCache_contactCache_error___block_invoke_3;
  v51[3] = &unk_1E560EA00;
  int8x16_t v42 = *(int8x16_t *)(a1 + 32);
  id v26 = (id)v42.i64[0];
  int8x16_t v52 = vextq_s8(v42, v42, 8uLL);
  id v27 = *(id *)(a1 + 64);
  uint64_t v28 = *(void *)(a1 + 88);
  id v53 = v27;
  uint64_t v54 = v28;
  long long v29 = objc_msgSend(v25, "_pas_mappedArrayWithTransform:", v51);
  long long v30 = (void *)[v24 initWithArray:v29];
  [v23 addKeywords:v30];

  id v31 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
  id v32 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  long long v33 = [*(id *)(a1 + 48) attachments];
  uint64_t v44 = MEMORY[0x1E4F143A8];
  uint64_t v45 = 3221225472;
  uint64_t v46 = __103___CDInteractionStore_createInteractionRecord_context_keywordCache_attachmentCache_contactCache_error___block_invoke_4;
  __int16 v47 = &unk_1E560EA28;
  int8x16_t v43 = *(int8x16_t *)(a1 + 32);
  id v34 = (id)v43.i64[0];
  int8x16_t v48 = vextq_s8(v43, v43, 8uLL);
  id v35 = *(id *)(a1 + 72);
  uint64_t v36 = *(void *)(a1 + 88);
  id v49 = v35;
  uint64_t v50 = v36;
  __int16 v37 = objc_msgSend(v33, "_pas_mappedArrayWithTransform:", &v44);
  uint64_t v38 = (void *)[v32 initWithArray:v37];
  [v31 addAttachments:v38];

  __int16 v39 = [*(id *)(a1 + 48) nsUserName];
  if (v39) {
    [*(id *)(a1 + 48) nsUserName];
  }
  else {
  uint64_t v40 = NSUserName();
  }
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), "setNsUserName:", v40, *(_OWORD *)&v43, v44, v45, v46, v47, v48.i64[0]);
}

id __103___CDInteractionStore_createInteractionRecord_context_keywordCache_attachmentCache_contactCache_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v10 = 0;
  uint64_t v6 = [v3 fetchOrCreateContactRecord:a2 context:v4 cache:v5 error:&v10];
  id v7 = v10;
  id v8 = v10;
  [*(id *)(a1 + 32) updateCachedStatsForContactRecord:v6 isSender:0 withInteraction:*(void *)(a1 + 56)];
  if (v8) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v7);
  }

  return v6;
}

id __103___CDInteractionStore_createInteractionRecord_context_keywordCache_attachmentCache_contactCache_error___block_invoke_3(void *a1, uint64_t a2)
{
  uint64_t v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  id v10 = 0;
  uint64_t v6 = [v3 fetchOrCreateKeywordRecord:a2 context:v4 cache:v5 error:&v10];
  id v7 = v10;
  id v8 = v10;
  if (v8) {
    objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), v7);
  }

  return v6;
}

id __103___CDInteractionStore_createInteractionRecord_context_keywordCache_attachmentCache_contactCache_error___block_invoke_4(void *a1, uint64_t a2)
{
  uint64_t v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  id v10 = 0;
  uint64_t v6 = [v3 fetchOrCreateAttachmentRecord:a2 context:v4 cache:v5 error:&v10];
  id v7 = v10;
  id v8 = v10;
  if (v8) {
    objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), v7);
  }

  return v6;
}

void __60___CDInteractionStore_recordInteractions_completionHandler___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v7 = 0;
  uint64_t v4 = [v2 recordInteractionsBatch:v3 error:&v7];
  id v5 = v7;
  uint64_t v6 = a1[6];
  if (v6) {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, v4, v5);
  }
}

void __53___CDInteractionStore_recordInteractionsBatch_error___block_invoke(id *a1)
{
  uint64_t v114 = *MEMORY[0x1E4F143B8];
  long long v96 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  id v1 = a1[4];
  uint64_t v2 = [v1 countByEnumeratingWithState:&v96 objects:v110 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v97;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v97 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = *(void **)(*((void *)&v96 + 1) + 8 * i);
        if ([v6 mechanism] == 13 && (objc_msgSend(v6, "forcePersistInteraction") & 1) == 0)
        {
          id v7 = [v6 targetBundleId];
          id v8 = (void *)MEMORY[0x1E4F1CAD0];
          uint64_t v9 = +[_CDConstants shareSheetTargetBundleIdMessages]();
          id v10 = objc_msgSend(v8, "setWithObjects:", v9, 0);

          if (v7 && [v10 containsObject:v7])
          {
            [a1[5] removeObject:v6];
            if (*((void *)a1[6] + 6)
              && ((_os_feature_enabled_impl() & 1) != 0 || _os_feature_enabled_impl()))
            {
              [v6 fetchAndAddShareSheetContentToInteractionWithKnowledgeStore:*((void *)a1[6] + 6)];
            }
            [a1[6] setPendingShareSheetInteraction:v6];
            id v11 = +[_CDLogging interactionChannel];
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v113 = v7;
              _os_log_debug_impl(&dword_18ECEB000, v11, OS_LOG_TYPE_DEBUG, "Storing pending interaction for %@", buf, 0xCu);
            }
          }
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v96 objects:v110 count:16];
    }
    while (v3);
  }

  id v12 = a1;
  uint64_t v13 = a1 + 6;
  uint64_t v14 = [a1[6] pendingShareSheetInteraction];

  v82 = a1 + 6;
  if (!v14) {
    goto LABEL_74;
  }
  long long v94 = 0u;
  long long v95 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  obuint64_t j = (id)[a1[5] copy];
  uint64_t v86 = [obj countByEnumeratingWithState:&v92 objects:v109 count:16];
  if (!v86) {
    goto LABEL_73;
  }
  uint64_t v85 = *(void *)v93;
  while (2)
  {
    uint64_t v15 = 0;
    do
    {
      if (*(void *)v93 != v85) {
        objc_enumerationMutation(obj);
      }
      id v16 = *(void **)(*((void *)&v92 + 1) + 8 * v15);
      id v17 = [*v13 pendingShareSheetInteraction];
      id v18 = v16;
      if ([v18 direction] != 1) {
        goto LABEL_63;
      }
      id v19 = [v17 targetBundleId];
      uint64_t v20 = +[_CDConstants shareSheetTargetBundleIdMessages]();
      if ([v19 isEqualToString:v20])
      {
        id v21 = [v18 bundleId];
        uint64_t v22 = +[_CDConstants mobileMessagesBundleId]();
        int v23 = [v21 isEqualToString:v22];

        if (v23)
        {
          uint64_t v24 = [v17 domainIdentifier];
          if (!v24) {
            goto LABEL_63;
          }
          long long v25 = (void *)v24;
          uint64_t v26 = [v18 domainIdentifier];
          if (!v26) {
            goto LABEL_62;
          }
          id v27 = (void *)v26;
          uint64_t v28 = [v17 domainIdentifier];
          long long v29 = [v18 domainIdentifier];
          char v30 = [v28 isEqualToString:v29];

          if (v30) {
            goto LABEL_70;
          }
          goto LABEL_65;
        }
      }
      else
      {
      }
      long long v25 = [v17 targetBundleId];
      id v31 = +[_CDConstants shareSheetTargetBundleIdMail]();
      if (([v25 isEqualToString:v31] & 1) == 0)
      {

LABEL_62:
LABEL_63:

LABEL_64:
        goto LABEL_65;
      }
      id v32 = [v18 bundleId];
      long long v33 = +[_CDConstants mobileMailBundleId]();
      int v34 = [v32 isEqualToString:v33];

      if (!v34) {
        goto LABEL_63;
      }
      v83 = v18;
      id v35 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      long long v104 = 0u;
      long long v105 = 0u;
      long long v106 = 0u;
      long long v107 = 0u;
      uint64_t v36 = [v17 recipients];
      uint64_t v37 = [v36 countByEnumeratingWithState:&v104 objects:buf count:16];
      if (v37)
      {
        uint64_t v38 = v37;
        uint64_t v39 = *(void *)v105;
        do
        {
          for (uint64_t j = 0; j != v38; ++j)
          {
            if (*(void *)v105 != v39) {
              objc_enumerationMutation(v36);
            }
            int8x16_t v41 = *(void **)(*((void *)&v104 + 1) + 8 * j);
            if ([v41 type] == 2)
            {
              int8x16_t v42 = [v41 handle];

              if (v42)
              {
                int8x16_t v43 = [v41 handle];
                [v35 addObject:v43];
              }
            }
          }
          uint64_t v38 = [v36 countByEnumeratingWithState:&v104 objects:buf count:16];
        }
        while (v38);
      }

      id v44 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      long long v100 = 0u;
      long long v101 = 0u;
      long long v102 = 0u;
      long long v103 = 0u;
      uint64_t v45 = [v83 recipients];
      uint64_t v46 = [v45 countByEnumeratingWithState:&v100 objects:v111 count:16];
      if (v46)
      {
        uint64_t v47 = v46;
        uint64_t v48 = *(void *)v101;
        do
        {
          for (uint64_t k = 0; k != v47; ++k)
          {
            if (*(void *)v101 != v48) {
              objc_enumerationMutation(v45);
            }
            uint64_t v50 = *(void **)(*((void *)&v100 + 1) + 8 * k);
            if ([v50 type] == 2)
            {
              uint64_t v51 = [v50 handle];

              if (v51)
              {
                int8x16_t v52 = [v50 handle];
                [v44 addObject:v52];
              }
            }
          }
          uint64_t v47 = [v45 countByEnumeratingWithState:&v100 objects:v111 count:16];
        }
        while (v47);
      }

      if (![v35 isEqualToSet:v44])
      {

        uint64_t v13 = a1 + 6;
        goto LABEL_64;
      }
      id v53 = [v17 startDate];
      uint64_t v54 = [v83 startDate];
      [v53 timeIntervalSinceDate:v54];
      double v56 = v55;

      id v18 = v83;
      if (v56 < 0.0) {
        double v56 = -v56;
      }

      uint64_t v13 = a1 + 6;
      if (v56 < 10.0)
      {
LABEL_70:
        [v18 setMechanism:13];
        [*v13 pendingShareSheetInteraction];
        v59 = id v58 = v18;
        id v60 = [v59 bundleId];
        [v58 setBundleId:v60];

        v61 = [*v13 pendingShareSheetInteraction];
        v62 = [v61 targetBundleId];
        [v58 setTargetBundleId:v62];

        v63 = [*v13 pendingShareSheetInteraction];
        v64 = [v63 attachments];
        [v58 setAttachments:v64];

        v65 = +[_CDLogging interactionChannel];
        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG)) {
          __53___CDInteractionStore_recordInteractionsBatch_error___block_invoke_cold_2(v58, v65);
        }

        [*v13 setPendingShareSheetInteraction:0];
        goto LABEL_73;
      }
LABEL_65:
      ++v15;
    }
    while (v15 != v86);
    uint64_t v57 = [obj countByEnumeratingWithState:&v92 objects:v109 count:16];
    uint64_t v86 = v57;
    if (v57) {
      continue;
    }
    break;
  }
LABEL_73:

  id v12 = a1;
LABEL_74:
  if ([v12[5] count])
  {
    v66 = [*v13 pendingShareSheetInteraction];

    if (v66)
    {
      long long v90 = 0u;
      long long v91 = 0u;
      long long v88 = 0u;
      long long v89 = 0u;
      id v67 = v12[5];
      uint64_t v68 = [v67 countByEnumeratingWithState:&v88 objects:v108 count:16];
      if (v68)
      {
        uint64_t v69 = v68;
        v70 = 0;
        uint64_t v71 = *(void *)v89;
        do
        {
          for (uint64_t m = 0; m != v69; ++m)
          {
            if (*(void *)v89 != v71) {
              objc_enumerationMutation(v67);
            }
            uint64_t v73 = [*(id *)(*((void *)&v88 + 1) + 8 * m) startDate];
            v74 = (void *)v73;
            if (v70)
            {
              uint64_t v75 = [v70 laterDate:v73];

              v70 = (void *)v75;
            }
            else
            {
              v70 = (void *)v73;
            }
          }
          uint64_t v69 = [v67 countByEnumeratingWithState:&v88 objects:v108 count:16];
        }
        while (v69);
      }
      else
      {
        v70 = 0;
      }

      v76 = [*v82 pendingShareSheetInteraction];
      v77 = [v76 startDate];
      [v70 timeIntervalSinceDate:v77];
      double v79 = v78;

      if (v79 < 0.0 || v79 > 60.0)
      {
        v81 = +[_CDLogging interactionChannel];
        if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR)) {
          __53___CDInteractionStore_recordInteractionsBatch_error___block_invoke_cold_1(v82, v81);
        }

        [*v82 setPendingShareSheetInteraction:0];
      }
    }
  }
}

uint64_t __53___CDInteractionStore_recordInteractionsBatch_error___block_invoke_245(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 startDate];
  uint64_t v6 = [v4 startDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

void __53___CDInteractionStore_recordInteractionsBatch_error___block_invoke_281(uint64_t a1)
{
  uint64_t v106 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) begin];
  id v1 = [MEMORY[0x1E4F1CA80] set];
  v84 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v2 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
  long long v100 = 0u;
  long long v101 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v98 objects:v105 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v99;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v99 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v98 + 1) + 8 * i);
        uint64_t v9 = (void *)MEMORY[0x192FB2F20]();
        id v10 = [v8 recipients];

        if (v10)
        {
          id v11 = [v8 recipients];
          [v1 addObjectsFromArray:v11];
        }
        id v12 = [v8 sender];

        if (v12)
        {
          uint64_t v13 = [v8 sender];
          [v1 addObject:v13];
        }
        uint64_t v14 = [v8 keywords];

        if (v14)
        {
          uint64_t v15 = [v8 keywords];
          [v84 addObjectsFromArray:v15];
        }
        id v16 = [v8 attachments];

        if (v16)
        {
          id v17 = [v8 attachments];
          [v2 addObjectsFromArray:v17];
        }
        id v18 = [v8 uuid];

        if (v18)
        {
          id v19 = [v8 uuid];
          [v3 addObject:v19];
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v98 objects:v105 count:16];
    }
    while (v5);
  }

  uint64_t v20 = *(void **)(a1 + 48);
  uint64_t v21 = *(void *)(a1 + 56);
  id v97 = 0;
  v77 = [v20 batchFetchExistingContactRecords:v1 context:v21 error:&v97];
  id v22 = v97;
  if (v22)
  {
    uint64_t v23 = *(void *)(*(void *)(a1 + 64) + 8);
    id v24 = v22;
    long long v25 = *(void **)(v23 + 40);
    *(void *)(v23 + 40) = v24;
    goto LABEL_69;
  }
  uint64_t v26 = *(void **)(a1 + 48);
  uint64_t v27 = *(void *)(a1 + 56);
  id v96 = 0;
  uint64_t v76 = [v26 batchFetchExistingKeywordRecords:v84 context:v27 error:&v96];
  id v28 = v96;
  if (v28)
  {
    uint64_t v29 = *(void *)(*(void *)(a1 + 64) + 8);
    id v24 = v28;
    char v30 = *(void **)(v29 + 40);
    *(void *)(v29 + 40) = v24;
    goto LABEL_68;
  }
  id v31 = *(void **)(a1 + 48);
  uint64_t v32 = *(void *)(a1 + 56);
  id v95 = 0;
  uint64_t v75 = [v31 batchFetchExistingAttachmentRecords:v2 context:v32 error:&v95];
  id v33 = v95;
  if (v33)
  {
    uint64_t v34 = *(void *)(*(void *)(a1 + 64) + 8);
    id v24 = v33;
    id v35 = *(void **)(v34 + 40);
    *(void *)(v34 + 40) = v24;
    goto LABEL_67;
  }
  uint64_t v36 = *(void **)(a1 + 48);
  uint64_t v37 = *(void *)(a1 + 56);
  id v94 = 0;
  double v78 = [v36 batchFetchExistingInteractionsWithUUIDs:v3 context:v37 error:&v94];
  id v38 = v94;
  if (v38)
  {
    uint64_t v39 = *(void *)(*(void *)(a1 + 64) + 8);
    id v24 = v38;
    uint64_t v40 = *(void **)(v39 + 40);
    *(void *)(v39 + 40) = v24;
    goto LABEL_66;
  }
  id v41 = *(id *)(a1 + 40);
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  obuint64_t j = v41;
  uint64_t v83 = [obj countByEnumeratingWithState:&v90 objects:v104 count:16];
  if (!v83)
  {
    v81 = 0;
    id v24 = 0;
    goto LABEL_61;
  }
  id v24 = 0;
  v81 = 0;
  uint64_t v82 = *(void *)v91;
  do
  {
    uint64_t v42 = 0;
    do
    {
      if (*(void *)v91 != v82) {
        objc_enumerationMutation(obj);
      }
      int8x16_t v43 = *(void **)(*((void *)&v90 + 1) + 8 * v42);
      id v44 = (void *)MEMORY[0x192FB2F20]();
      if ([v43 isValidInteraction])
      {
        uint64_t v45 = [v43 domainIdentifier];
        if (v45) {
          goto LABEL_34;
        }
        uint64_t v45 = [v43 derivedIntentIdentifier];
        if (v45) {
          goto LABEL_34;
        }
        v66 = [v43 recipients];
        BOOL v67 = v66 == 0;

        if (v67)
        {
          uint64_t v45 = +[_CDLogging interactionChannel];
          if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
          {
            uint64_t v68 = [v43 targetBundleId];
            uint64_t v69 = v68;
            if (!v68)
            {
              v74 = [v43 bundleId];
              uint64_t v69 = v74;
            }
            *(_DWORD *)buf = 138412290;
            long long v103 = v69;
            _os_log_fault_impl(&dword_18ECEB000, v45, OS_LOG_TYPE_FAULT, "Interaction from %@ does not have recipients, domain or derived intent identifier set. Suggestions for this intent will be suppressed as no recipient, domain, or derived intent identifier exists", buf, 0xCu);
            if (!v68) {
          }
            }
LABEL_34:
        }
        uint64_t v46 = [v43 uuid];
        BOOL v47 = v46 == 0;

        if (v47)
        {
          uint64_t v54 = +[_CDLogging instrumentationChannel];
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG)) {
            __53___CDInteractionStore_recordInteractionsBatch_error___block_invoke_281_cold_2(&v88, v89, v54);
          }
        }
        else
        {
          uint64_t v48 = [v43 uuid];
          id v49 = [v78 objectForKeyedSubscript:v48];
          BOOL v50 = v49 == 0;

          if (v50)
          {
            double v55 = *(void **)(a1 + 48);
            uint64_t v56 = *(void *)(a1 + 56);
            id v87 = v24;
            uint64_t v57 = [v55 createInteractionRecord:v43 context:v56 keywordCache:v76 attachmentCache:v75 contactCache:v77 error:&v87];
            id v58 = v87;
            id v53 = v87;

            if (v53) {
              objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v58);
            }
          }
          else
          {
            uint64_t v51 = [v43 updateDate];
            char v52 = [v81 isEqualToDate:v51];

            if (v52)
            {
              id v53 = v24;
              goto LABEL_47;
            }
            uint64_t v59 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
            id v60 = [v43 uuid];
            [v59 addObject:v60];

            v61 = *(void **)(a1 + 48);
            uint64_t v62 = *(void *)(a1 + 56);
            id v86 = v24;
            uint64_t v57 = [v61 createInteractionRecord:v43 context:v62 keywordCache:v76 attachmentCache:v75 contactCache:v77 error:&v86];
            id v63 = v86;
            id v53 = v86;

            if (v53) {
              objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v63);
            }
          }
          v64 = [v57 objectID];
          v65 = [v43 uuid];
          [v78 setObject:v64 forKeyedSubscript:v65];

LABEL_47:
          [v43 updateDate];
          v81 = uint64_t v54 = v81;
          id v24 = v53;
        }
      }
      ++v42;
    }
    while (v83 != v42);
    uint64_t v70 = [obj countByEnumeratingWithState:&v90 objects:v104 count:16];
    uint64_t v83 = v70;
  }
  while (v70);
LABEL_61:

  uint64_t v71 = (void *)MEMORY[0x192FB2F20]();
  if ([*(id *)(a1 + 56) hasChanges])
  {
    v72 = *(void **)(a1 + 56);
    id v85 = v24;
    [v72 save:&v85];
    id v73 = v85;

    id v24 = v73;
  }
  [*(id *)(a1 + 56) reset];
  if (v24) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v24);
  }

  uint64_t v40 = obj;
LABEL_66:

  id v35 = v78;
LABEL_67:

  char v30 = (void *)v75;
LABEL_68:

  long long v25 = (void *)v76;
LABEL_69:
}

uint64_t __48___CDInteractionStore_predicateForInteractions___block_invoke(uint64_t a1, void *a2)
{
  return [a2 uuid];
}

void __73___CDInteractionStore_countInteractionsUsingPredicate_completionHandler___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v5 = 0;
  [v2 countInteractionsUsingPredicate:v3 error:&v5];
  id v4 = v5;
  (*(void (**)(void))(a1[6] + 16))();
}

void __69___CDInteractionStore_countContactsUsingPredicate_completionHandler___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v5 = 0;
  [v2 countContactsUsingPredicate:v3 error:&v5];
  id v4 = v5;
  (*(void (**)(void))(a1[6] + 16))();
}

void __95___CDInteractionStore_queryInteractionsUsingPredicate_sortDescriptors_limit_completionHandler___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[8];
  id v8 = 0;
  uint64_t v6 = [v2 queryInteractionsUsingPredicate:v3 sortDescriptors:v4 limit:v5 error:&v8];
  id v7 = v8;
  (*(void (**)(void))(a1[7] + 16))();
}

void __79___CDInteractionStore_queryContactsUsingPredicate_sortDescriptors_limit_error___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) begin];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
  uint64_t v3 = [MEMORY[0x1E4F1C0A8] entityForName:@"Contacts" inManagedObjectContext:*(void *)(a1 + 40)];
  [v2 setEntity:v3];

  if (*(void *)(a1 + 48)) {
    objc_msgSend(v2, "setPredicate:");
  }
  if (*(void *)(a1 + 56)) {
    objc_msgSend(v2, "setSortDescriptors:");
  }
  [v2 setFetchLimit:*(void *)(a1 + 88)];
  uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v5 = *(void **)(a1 + 40);
  id v26 = 0;
  id v6 = [v5 executeFetchRequest:v2 error:&v26];
  id v7 = v26;
  id v8 = v26;
  if (v8) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), v7);
  }

  uint64_t v9 = +[_CDLogging instrumentationChannel];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = [v2 fetchLimit];
    [v4 timeIntervalSinceNow];
    double v12 = v11;
    uint64_t v13 = [v6 count];
    uint64_t v14 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 134218755;
    uint64_t v29 = v10;
    __int16 v30 = 2048;
    double v31 = -v12;
    __int16 v32 = 2048;
    uint64_t v33 = v13;
    __int16 v34 = 2113;
    uint64_t v35 = v14;
    _os_log_impl(&dword_18ECEB000, v9, OS_LOG_TYPE_INFO, "queryContactsUsingPredicate finished executeFetchRequest, fetchLimit %lu object(s), elapsed %f(sec), returned %lu object(s), Predicate: %{private}@", buf, 0x2Au);
  }

  if (!*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
  {
    uint64_t v15 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v6 = v6;
    uint64_t v16 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v23;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v23 != v17) {
            objc_enumerationMutation(v6);
          }
          id v19 = objc_msgSend(*(id *)(a1 + 64), "getContactForRecord:", *(void *)(*((void *)&v22 + 1) + 8 * v18), (void)v22);
          [v15 addObject:v19];

          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v16);
    }

    uint64_t v20 = *(void *)(*(void *)(a1 + 80) + 8);
    uint64_t v21 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = v15;
  }
}

void __91___CDInteractionStore_queryContactsUsingPredicate_sortDescriptors_limit_completionHandler___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[8];
  id v8 = 0;
  id v6 = [v2 queryContactsUsingPredicate:v3 sortDescriptors:v4 limit:v5 error:&v8];
  id v7 = v8;
  (*(void (**)(void))(a1[7] + 16))();
}

void __72___CDInteractionStore_queryContactInteractionsUsingPredicate_withLimit___block_invoke(uint64_t a1)
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) begin];
  id v35 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
  id v2 = [MEMORY[0x1E4F1C0A8] entityForName:@"Contacts" inManagedObjectContext:*(void *)(a1 + 40)];
  [v35 setEntity:v2];

  [v35 setPredicate:*(void *)(a1 + 48)];
  [v35 setFetchLimit:*(void *)(a1 + 72)];
  __int16 v34 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v3 = *(void **)(a1 + 40);
  id v51 = 0;
  uint64_t v4 = [v3 executeFetchRequest:v35 error:&v51];
  id v5 = v51;
  id v6 = +[_CDLogging instrumentationChannel];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = [v35 fetchLimit];
    [v34 timeIntervalSinceNow];
    double v9 = v8;
    uint64_t v10 = [v4 count];
    double v11 = [v35 predicate];
    *(_DWORD *)buf = 134218755;
    uint64_t v56 = v7;
    __int16 v57 = 2048;
    double v58 = -v9;
    __int16 v59 = 2048;
    uint64_t v60 = v10;
    __int16 v61 = 2113;
    uint64_t v62 = v11;
    _os_log_impl(&dword_18ECEB000, v6, OS_LOG_TYPE_INFO, "queryContactInteractionsUsingPredicate finished executeFetchRequest, fetchLimit %lu object(s), elapsed %f(sec), returned %lu object(s), Predicate: %{private}@", buf, 0x2Au);
  }
  if (v5)
  {
    double v12 = +[_CDLogging interactionChannel];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __72___CDInteractionStore_queryContactInteractionsUsingPredicate_withLimit___block_invoke_cold_1();
    }
  }
  else
  {
    id v38 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    obuint64_t j = v4;
    uint64_t v13 = [obj countByEnumeratingWithState:&v47 objects:v54 count:16];
    if (v13)
    {
      uint64_t v37 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v48 != v37) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void **)(*((void *)&v47 + 1) + 8 * i);
          uint64_t v16 = [v15 interactionRecipient];
          uint64_t v17 = [v16 count];
          uint64_t v18 = [v15 interactionSender];
          uint64_t v19 = [v18 count];

          uint64_t v20 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v19 + v17];
          long long v45 = 0u;
          long long v46 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          uint64_t v21 = [v15 interactionRecipient];
          uint64_t v22 = [v21 countByEnumeratingWithState:&v43 objects:v53 count:16];
          if (v22)
          {
            uint64_t v23 = *(void *)v44;
            do
            {
              for (uint64_t j = 0; j != v22; ++j)
              {
                if (*(void *)v44 != v23) {
                  objc_enumerationMutation(v21);
                }
                long long v25 = [*(id *)(a1 + 56) createInteractionFromRecord:*(void *)(*((void *)&v43 + 1) + 8 * j)];
                [v20 addObject:v25];
              }
              uint64_t v22 = [v21 countByEnumeratingWithState:&v43 objects:v53 count:16];
            }
            while (v22);
          }

          long long v41 = 0u;
          long long v42 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          id v26 = [v15 interactionSender];
          uint64_t v27 = [v26 countByEnumeratingWithState:&v39 objects:v52 count:16];
          if (v27)
          {
            uint64_t v28 = *(void *)v40;
            do
            {
              for (uint64_t k = 0; k != v27; ++k)
              {
                if (*(void *)v40 != v28) {
                  objc_enumerationMutation(v26);
                }
                __int16 v30 = [*(id *)(a1 + 56) createInteractionFromRecord:*(void *)(*((void *)&v39 + 1) + 8 * k)];
                [v20 addObject:v30];
              }
              uint64_t v27 = [v26 countByEnumeratingWithState:&v39 objects:v52 count:16];
            }
            while (v27);
          }

          double v31 = [*(id *)(a1 + 56) getContactForRecord:v15];
          [v38 setObject:v20 forKeyedSubscript:v31];
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v47 objects:v54 count:16];
      }
      while (v13);
    }

    uint64_t v32 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v33 = *(void **)(v32 + 40);
    *(void *)(v32 + 40) = v38;
  }
}

void __76___CDInteractionStore_histogramContactInteractionsUsingPredicate_withLimit___block_invoke(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) begin];
  id v27 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
  id v2 = [MEMORY[0x1E4F1C0A8] entityForName:@"Contacts" inManagedObjectContext:*(void *)(a1 + 40)];
  [v27 setEntity:v2];

  [v27 setPredicate:*(void *)(a1 + 48)];
  [v27 setFetchLimit:*(void *)(a1 + 72)];
  id v26 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v3 = *(void **)(a1 + 40);
  id v33 = 0;
  uint64_t v4 = [v3 executeFetchRequest:v27 error:&v33];
  id v5 = v33;
  id v6 = +[_CDLogging instrumentationChannel];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = [v27 fetchLimit];
    [v26 timeIntervalSinceNow];
    double v9 = v8;
    uint64_t v10 = [v4 count];
    double v11 = [v27 predicate];
    *(_DWORD *)buf = 134218755;
    uint64_t v36 = v7;
    __int16 v37 = 2048;
    double v38 = -v9;
    __int16 v39 = 2048;
    uint64_t v40 = v10;
    __int16 v41 = 2113;
    long long v42 = v11;
    _os_log_impl(&dword_18ECEB000, v6, OS_LOG_TYPE_INFO, "histogramContactInteractionsUsingPredicate finished executeFetchRequest, fetchLimit %lu object(s), elapsed %f(sec), returned %lu object(s), Predicate: %{private}@", buf, 0x2Au);
  }
  if (v5)
  {
    double v12 = +[_CDLogging interactionChannel];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __72___CDInteractionStore_queryContactInteractionsUsingPredicate_withLimit___block_invoke_cold_1();
    }
  }
  else
  {
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
    uint64_t v14 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    obuint64_t j = v4;
    uint64_t v16 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v30 != v17) {
            objc_enumerationMutation(obj);
          }
          uint64_t v19 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          uint64_t v20 = NSNumber;
          uint64_t v21 = [v19 interactionRecipient];
          uint64_t v22 = [v21 count];
          uint64_t v23 = [v19 interactionSender];
          long long v24 = objc_msgSend(v20, "numberWithUnsignedInteger:", objc_msgSend(v23, "count") + v22);

          long long v25 = [*(id *)(a1 + 56) getContactForRecord:v19];
          [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setObject:v24 forKeyedSubscript:v25];
        }
        uint64_t v16 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v16);
    }
  }
}

void __44___CDInteractionStore_usersWithInteractions__block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) begin];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
  uint64_t v3 = [MEMORY[0x1E4F1C0A8] entityForName:@"Interactions" inManagedObjectContext:*(void *)(a1 + 40)];
  [v2 setEntity:v3];

  [v2 setPropertiesToFetch:&unk_1EDE1E620];
  [v2 setReturnsDistinctResults:1];
  uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
  id v5 = *(void **)(a1 + 40);
  id v26 = 0;
  id v6 = [v5 executeFetchRequest:v2 error:&v26];
  id v7 = v26;
  double v8 = +[_CDLogging instrumentationChannel];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = [v2 fetchLimit];
    [v4 timeIntervalSinceNow];
    double v11 = v10;
    uint64_t v12 = [v6 count];
    *(_DWORD *)buf = 134218496;
    uint64_t v29 = v9;
    __int16 v30 = 2048;
    double v31 = -v11;
    __int16 v32 = 2048;
    uint64_t v33 = v12;
    _os_log_impl(&dword_18ECEB000, v8, OS_LOG_TYPE_INFO, "usersWithInteractions: finished executeFetchRequest, fetchLimit %lu object(s), elapsed %f(sec), returned %lu object(s)", buf, 0x20u);
  }

  if (v7)
  {
    uint64_t v13 = +[_CDLogging interactionChannel];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __44___CDInteractionStore_usersWithInteractions__block_invoke_cold_1();
    }
  }
  else
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v14 = v6;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v23 != v16) {
            objc_enumerationMutation(v14);
          }
          uint64_t v18 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          uint64_t v19 = objc_msgSend(v18, "nsUserName", (void)v22);

          if (v19)
          {
            uint64_t v20 = *(void **)(a1 + 48);
            uint64_t v21 = [v18 nsUserName];
            [v20 addObject:v21];
          }
        }
        uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v15);
    }
  }
}

void __52___CDInteractionStore_conversationsWithInteractions__block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) begin];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
  uint64_t v3 = [MEMORY[0x1E4F1C0A8] entityForName:@"Interactions" inManagedObjectContext:*(void *)(a1 + 40)];
  [v2 setEntity:v3];

  [v2 setPropertiesToFetch:&unk_1EDE1E638];
  [v2 setReturnsDistinctResults:1];
  uint64_t v4 = +[_CDInteractionStore predicateFilteringUsernameForPredicate:0];
  [v2 setPredicate:v4];

  id v5 = [MEMORY[0x1E4F1C9C8] date];
  id v6 = *(void **)(a1 + 40);
  id v25 = 0;
  id v7 = [v6 executeFetchRequest:v2 error:&v25];
  id v8 = v25;
  uint64_t v9 = +[_CDLogging instrumentationChannel];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = [v2 fetchLimit];
    [v5 timeIntervalSinceNow];
    double v12 = v11;
    uint64_t v13 = [v7 count];
    *(_DWORD *)buf = 134218496;
    uint64_t v28 = v10;
    __int16 v29 = 2048;
    double v30 = -v12;
    __int16 v31 = 2048;
    uint64_t v32 = v13;
    _os_log_impl(&dword_18ECEB000, v9, OS_LOG_TYPE_INFO, "conversationsWithInteractions: finished executeFetchRequest, fetchLimit %lu object(s), elapsed %f(sec), returned %lu object(s)", buf, 0x20u);
  }

  if (v8)
  {
    id v14 = +[_CDLogging interactionChannel];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __52___CDInteractionStore_conversationsWithInteractions__block_invoke_cold_1();
    }
  }
  else
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v15 = v7;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v15);
          }
          uint64_t v19 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          uint64_t v20 = objc_msgSend(v19, "domainIdentifier", (void)v21);
          if (!v20)
          {
            uint64_t v20 = [v19 derivedIntentIdentifier];
            if (!v20) {
              continue;
            }
          }
          [*(id *)(a1 + 48) addObject:v20];
        }
        uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v16);
    }
  }
}

void __67___CDInteractionStore_kMostRecentConversationsWithLimit_predicate___block_invoke(uint64_t a1)
{
  v37[1] = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) begin];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
  uint64_t v3 = [MEMORY[0x1E4F1C0A8] entityForName:@"Interactions" inManagedObjectContext:*(void *)(a1 + 40)];
  [v2 setEntity:v3];

  [v2 setPropertiesToFetch:&unk_1EDE1E650];
  [v2 setReturnsDistinctResults:1];
  uint64_t v4 = [objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"startDate" ascending:0];
  id v5 = (void *)MEMORY[0x192FB2F20]();
  long long v24 = (void *)v4;
  v37[0] = v4;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:1];
  [v2 setSortDescriptors:v6];
  id v7 = +[_CDInteractionStore predicateFilteringUsernameForPredicate:*(void *)(a1 + 48)];
  [v2 setPredicate:v7];

  id v8 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v9 = *(void **)(a1 + 40);
  id v29 = 0;
  uint64_t v10 = [v9 executeFetchRequest:v2 error:&v29];
  id v11 = v29;
  double v12 = +[_CDLogging instrumentationChannel];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = [v2 fetchLimit];
    [v8 timeIntervalSinceNow];
    double v15 = v14;
    uint64_t v16 = [v10 count];
    *(_DWORD *)buf = 134218496;
    uint64_t v32 = v13;
    __int16 v33 = 2048;
    double v34 = -v15;
    __int16 v35 = 2048;
    uint64_t v36 = v16;
    _os_log_impl(&dword_18ECEB000, v12, OS_LOG_TYPE_INFO, "kMostRecentConversationsWithLimit: finished executeFetchRequest, fetchLimit %lu object(s), elapsed %f(sec), returned %lu object(s)", buf, 0x20u);
  }

  if (v11)
  {
    uint64_t v17 = +[_CDLogging interactionChannel];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      __52___CDInteractionStore_conversationsWithInteractions__block_invoke_cold_1();
    }
  }
  else
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v18 = v10;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v26;
      while (2)
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v26 != v20) {
            objc_enumerationMutation(v18);
          }
          long long v22 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          long long v23 = [v22 domainIdentifier];
          if (!v23)
          {
            long long v23 = [v22 derivedIntentIdentifier];
            if (!v23) {
              continue;
            }
          }
          if ((unint64_t)[*(id *)(a1 + 56) count] >= *(void *)(a1 + 64))
          {

            goto LABEL_20;
          }
          [*(id *)(a1 + 56) addObject:v23];
        }
        uint64_t v19 = [v18 countByEnumeratingWithState:&v25 objects:v30 count:16];
        if (v19) {
          continue;
        }
        break;
      }
    }
LABEL_20:
  }
}

void __58___CDInteractionStore_getInteractionsStatisticsForConfig___block_invoke(uint64_t a1)
{
  v78[4] = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) begin];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
  uint64_t v3 = [MEMORY[0x1E4F1C0A8] entityForName:@"Interactions" inManagedObjectContext:*(void *)(a1 + 40)];
  [v2 setEntity:v3];

  [v2 setReturnsObjectsAsFaults:0];
  v78[0] = @"sender";
  v78[1] = @"recipients";
  v78[2] = @"keywords";
  v78[3] = @"attachments";
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v78 count:4];
  [v2 setRelationshipKeyPathsForPrefetching:v4];

  objc_msgSend(v2, "setFetchLimit:", objc_msgSend(*(id *)(a1 + 48), "fetchLimit"));
  objc_msgSend(v2, "setFetchBatchSize:", (int)objc_msgSend(*(id *)(a1 + 48), "fetchBatchSize"));
  long long v49 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"startDate" ascending:0];
  id v5 = (void *)MEMORY[0x192FB2F20]();
  v77 = v49;
  long long v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v77 count:1];
  [v2 setSortDescriptors:v48];
  id v6 = [*(id *)(a1 + 48) predicate];
  id v7 = +[_CDInteractionStore predicateFilteringUsernameForPredicate:v6];
  [v2 setPredicate:v7];

  long long v50 = [MEMORY[0x1E4F1C9C8] date];
  id v8 = *(void **)(a1 + 40);
  id v64 = 0;
  uint64_t v9 = [v8 executeFetchRequest:v2 error:&v64];
  id v10 = v64;
  id v11 = [MEMORY[0x1E4F1C9C8] date];
  [v11 timeIntervalSinceDate:v50];
  double v13 = v12;

  double v14 = +[_CDLogging instrumentationChannel];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = [v2 fetchLimit];
    [v50 timeIntervalSinceNow];
    double v17 = v16;
    uint64_t v18 = [v9 count];
    *(_DWORD *)buf = 134218496;
    uint64_t v68 = v15;
    __int16 v69 = 2048;
    double v70 = -v17;
    __int16 v71 = 2048;
    uint64_t v72 = v18;
    _os_log_impl(&dword_18ECEB000, v14, OS_LOG_TYPE_DEFAULT, "getInteractionsStatisticsForConfig: finished executeFetchRequest, fetchLimit %tu object(s), elapsed %f(sec), found %tu object(s)", buf, 0x20u);
  }

  if (v10)
  {
    uint64_t v19 = +[_CDLogging interactionChannel];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      __58___CDInteractionStore_getInteractionsStatisticsForConfig___block_invoke_cold_1();
    }
  }
  else
  {
    long long v47 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v60 = 0;
    __int16 v61 = &v60;
    uint64_t v62 = 0x2020000000;
    uint64_t v63 = 0;
    v58[0] = 0;
    v58[1] = v58;
    v58[2] = 0x2020000000;
    int v59 = 0;
    uint64_t v20 = [v2 fetchBatchSize];
    unint64_t v21 = [v2 fetchBatchSize];
    long long v22 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"getInteractionsStatisticsForConfig processing"];
    uint64_t v23 = [v2 fetchBatchSize];
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __58___CDInteractionStore_getInteractionsStatisticsForConfig___block_invoke_365;
    v51[3] = &unk_1E560EB88;
    double v55 = v58;
    unint64_t v57 = (v20 + 999) / v21;
    id v52 = *(id *)(a1 + 48);
    long long v24 = v22;
    id v53 = v24;
    id v54 = *(id *)(a1 + 56);
    uint64_t v56 = &v60;
    objc_msgSend(v9, "_pas_enumerateChunksOfSize:usingBlock:", v23, v51);
    long long v44 = v24;
    dispatch_sync(v24, &__block_literal_global_370);
    long long v25 = [MEMORY[0x1E4F1C9C8] date];
    [v25 timeIntervalSinceDate:v47];
    double v27 = v26;

    long long v28 = +[_CDLogging instrumentationChannel];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v29 = [v2 fetchLimit];
      [v50 timeIntervalSinceNow];
      double v31 = v30;
      uint64_t v32 = [v9 count];
      uint64_t v33 = v61[3];
      uint64_t v34 = [v9 count];
      uint64_t v35 = v34 - v61[3];
      *(_DWORD *)buf = 134219008;
      uint64_t v68 = v29;
      __int16 v69 = 2048;
      double v70 = -v31;
      __int16 v71 = 2048;
      uint64_t v72 = v32;
      __int16 v73 = 2048;
      uint64_t v74 = v33;
      __int16 v75 = 2048;
      uint64_t v76 = v35;
      _os_log_impl(&dword_18ECEB000, v28, OS_LOG_TYPE_DEFAULT, "getInteractionsStatisticsForConfig: finished processing, fetchLimit %tu object(s), elapsed %f(sec), found %tu object(s), processed %tu object(s) (%tu were skipped due to timeout)", buf, 0x34u);
    }

    v65[0] = @"request.fetchLimit";
    long long v46 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", objc_msgSend(v2, "fetchLimit"));
    v66[0] = v46;
    v65[1] = @"request.fetchBatchSize";
    long long v45 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", objc_msgSend(v2, "fetchBatchSize"));
    v66[1] = v45;
    v65[2] = @"managedResult.count";
    uint64_t v36 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", objc_msgSend(v9, "count"));
    v66[2] = v36;
    v65[3] = @"processedCount";
    __int16 v37 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v61[3]);
    v66[3] = v37;
    v65[4] = @"request.predicate";
    double v38 = NSString;
    __int16 v39 = [v2 predicate];
    uint64_t v40 = [v38 stringWithFormat:@"%@", v39];
    v66[4] = v40;
    v65[5] = @"interactionStoreQueryTimeInMillis";
    __int16 v41 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", (unint64_t)(v13 * 1000.0));
    v66[5] = v41;
    v65[6] = @"featureComputationTimeInMillis";
    long long v42 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", (unint64_t)(v27 * 1000.0));
    v66[6] = v42;
    uint64_t v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v66 forKeys:v65 count:7];

    [*(id *)(a1 + 56) setQueryStats:v43];
    _Block_object_dispose(v58, 8);
    _Block_object_dispose(&v60, 8);

    id v10 = 0;
  }
}

void __58___CDInteractionStore_getInteractionsStatisticsForConfig___block_invoke_365(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  id v6 = (id)[v5 firstObject];
  if (*(void *)(a1 + 72) <= (unint64_t)*(int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)
    && (id v7 = *(void **)(a1 + 32),
        [v5 firstObject],
        id v8 = objc_claimAutoreleasedReturnValue(),
        LODWORD(v7) = [v7 shouldStopRecordProcessing:v8],
        v8,
        v7))
  {
    *a3 = 1;
  }
  else
  {
    dispatch_sync(*(dispatch_queue_t *)(a1 + 40), &__block_literal_global_367);
    uint64_t v9 = *(NSObject **)(a1 + 40);
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    uint64_t v15 = __58___CDInteractionStore_getInteractionsStatisticsForConfig___block_invoke_3;
    double v16 = &unk_1E560E058;
    id v10 = v5;
    id v17 = v10;
    id v18 = *(id *)(a1 + 32);
    id v11 = *(id *)(a1 + 48);
    uint64_t v12 = *(void *)(a1 + 56);
    id v19 = v11;
    uint64_t v20 = v12;
    dispatch_async(v9, &v13);
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) += objc_msgSend(v10, "count", v13, v14, v15, v16);
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  }
}

void __58___CDInteractionStore_getInteractionsStatisticsForConfig___block_invoke_3(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v9 + 1) + 8 * v6);
        id v8 = (void *)MEMORY[0x192FB2F20](v3);
        objc_msgSend(*(id *)(a1 + 40), "computeStatsForInteractionRecord:inInteractionsStatistics:chunkIndex:", v7, *(void *)(a1 + 48), *(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24), (void)v9);
        ++v6;
      }
      while (v4 != v6);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      uint64_t v4 = v3;
    }
    while (v3);
  }
}

void __41___CDInteractionStore_queryVersionNumber__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
  uint64_t v3 = [MEMORY[0x1E4F1C0A8] entityForName:@"Version" inManagedObjectContext:*(void *)(a1 + 32)];
  [v2 setEntity:v3];

  [v2 setFetchLimit:1];
  uint64_t v4 = *(void **)(a1 + 32);
  id v10 = 0;
  uint64_t v5 = [v4 executeFetchRequest:v2 error:&v10];
  id v6 = v10;
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = +[_CDLogging interactionChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __72___CDInteractionStore_queryContactInteractionsUsingPredicate_withLimit___block_invoke_cold_1();
    }
  }
  else
  {
    if (v5 && [v5 count])
    {
      long long v9 = [v5 firstObject];
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v9 number];
    }
    uint64_t v7 = 0;
  }
}

void __43___CDInteractionStore_recordVersionNumber___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
  uint64_t v3 = [MEMORY[0x1E4F1C0A8] entityForName:@"Version" inManagedObjectContext:*(void *)(a1 + 32)];
  [v2 setEntity:v3];

  [v2 setFetchLimit:1];
  uint64_t v4 = *(void **)(a1 + 32);
  id v9 = 0;
  uint64_t v5 = [v4 executeFetchRequest:v2 error:&v9];
  id v6 = v9;
  if (v6 || !v5) {
    goto LABEL_6;
  }
  if (![v5 count])
  {
    id v6 = 0;
LABEL_6:
    uint64_t v7 = [MEMORY[0x1E4F1C0A8] insertNewObjectForEntityForName:@"Version" inManagedObjectContext:*(void *)(a1 + 32)];
    goto LABEL_7;
  }
  uint64_t v7 = [v5 firstObject];
  id v6 = 0;
LABEL_7:
  id v8 = [MEMORY[0x1E4F1C9C8] date];
  [v8 timeIntervalSinceReferenceDate];
  objc_msgSend(v7, "setCreationDate:");

  [v7 setNumber:*(void *)(a1 + 40)];
  [v7 setKey:@"store_version"];
  [*(id *)(a1 + 32) save:0];
}

void __41___CDInteractionStore_metadataDictionary__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
  uint64_t v3 = [MEMORY[0x1E4F1C0A8] entityForName:@"Metadata" inManagedObjectContext:*(void *)(a1 + 32)];
  [v2 setEntity:v3];

  [v2 setResultType:2];
  uint64_t v4 = *(void **)(a1 + 32);
  id v13 = 0;
  uint64_t v5 = [v4 executeFetchRequest:v2 error:&v13];
  id v6 = v13;
  id v7 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  id v8 = objc_msgSend(v5, "_pas_mappedArrayWithTransform:", &__block_literal_global_417_0);
  id v9 = objc_msgSend(v5, "_pas_mappedArrayWithTransform:", &__block_literal_global_423);
  uint64_t v10 = [v7 initWithObjects:v8 forKeys:v9];
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  long long v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

id __41___CDInteractionStore_metadataDictionary__block_invoke_414(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F28F98];
  uint64_t v3 = [a2 objectForKeyedSubscript:@"value"];
  uint64_t v4 = [v2 propertyListWithData:v3 options:0 format:0 error:0];

  return v4;
}

uint64_t __41___CDInteractionStore_metadataDictionary__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 objectForKeyedSubscript:@"key"];
}

__CFString *__103___CDInteractionStore_deleteInteractionsMatchingPredicate_sortDescriptors_limit_debuggingReason_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 derivedIntentIdentifier];
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = v3;
  }
  else
  {
    uint64_t v6 = [v2 domainIdentifier];
    id v7 = (void *)v6;
    id v8 = @"(no supported identifier)";
    if (v6) {
      id v8 = (__CFString *)v6;
    }
    uint64_t v5 = v8;
  }
  return v5;
}

void __115___CDInteractionStore_deleteInteractionsMatchingPredicate_sortDescriptors_limit_debuggingReason_completionHandler___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[9];
  uint64_t v6 = a1[7];
  id v10 = 0;
  uint64_t v7 = [v2 deleteInteractionsMatchingPredicate:v3 sortDescriptors:v4 limit:v5 debuggingReason:v6 error:&v10];
  id v8 = v10;
  uint64_t v9 = a1[8];
  if (v9) {
    (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, v7, v8);
  }
}

void __72___CDInteractionStore_deleteInteractionsWithBundleId_completionHandler___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v7 = 0;
  uint64_t v4 = [v2 deleteInteractionsWithBundleId:v3 error:&v7];
  id v5 = v7;
  uint64_t v6 = a1[6];
  if (v6) {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, v4, v5);
  }
}

void __80___CDInteractionStore_deleteInteractionsWithBundleId_account_completionHandler___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  id v8 = 0;
  uint64_t v5 = [v2 deleteInteractionsWithBundleId:v3 account:v4 error:&v8];
  id v6 = v8;
  uint64_t v7 = a1[7];
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, v5, v6);
  }
}

void __89___CDInteractionStore_deleteInteractionsWithBundleId_domainIdentifier_completionHandler___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  id v8 = 0;
  uint64_t v5 = [v2 deleteInteractionsWithBundleId:v3 domainIdentifier:v4 error:&v8];
  id v6 = v8;
  uint64_t v7 = a1[7];
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, v5, v6);
  }
}

void __90___CDInteractionStore_deleteInteractionsWithBundleId_domainIdentifiers_completionHandler___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  id v8 = 0;
  uint64_t v5 = [v2 deleteInteractionsWithBundleId:v3 domainIdentifiers:v4 error:&v8];
  id v6 = v8;
  uint64_t v7 = a1[7];
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, v5, v6);
  }
}

void __70___CDInteractionStore_fetchOrCreateKeywordRecord_context_cache_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_18ECEB000, v0, v1, "fetchOrCreateKeywordRecord: %@", v2, v3, v4, v5, v6);
}

void __73___CDInteractionStore_fetchOrCreateAttachmentRecord_context_cache_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_18ECEB000, v0, v1, "fetchOrCreateAttachmentRecord caught %@", v2, v3, v4, v5, v6);
}

void __70___CDInteractionStore_fetchOrCreateContactRecord_context_cache_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_18ECEB000, v0, v1, "fetchOrCreateContactRecord Caught %@", v2, v3, v4, v5, v6);
}

void __70___CDInteractionStore_batchFetchExistingKeywordRecords_context_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_18ECEB000, v0, v1, "batchFetchExistingKeywords: %@", v2, v3, v4, v5, v6);
}

void __73___CDInteractionStore_batchFetchExistingAttachmentRecords_context_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_18ECEB000, v0, v1, "batchFetchExistingAttachmentRecords: %@", v2, v3, v4, v5, v6);
}

void __70___CDInteractionStore_batchFetchExistingContactRecords_context_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_18ECEB000, v0, v1, "batchFetchExistingContactRecords: %@", v2, v3, v4, v5, v6);
}

void __77___CDInteractionStore_batchFetchExistingInteractionsWithUUIDs_context_error___block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 134218242;
  *(void *)&v3[4] = a2;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = *a1;
  OUTLINED_FUNCTION_3_5(&dword_18ECEB000, a2, a3, "got %tu non-deleted record(s) with a nil UUID when querying for UUIDs %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

void __77___CDInteractionStore_batchFetchExistingInteractionsWithUUIDs_context_error___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_18ECEB000, v0, v1, "batchFetchExistingInteractionsWithUUIDs: %@", v2, v3, v4, v5, v6);
}

void __53___CDInteractionStore_recordInteractionsBatch_error___block_invoke_cold_1(id *a1, NSObject *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [*a1 pendingShareSheetInteraction];
  uint64_t v5 = [v4 bundleId];
  uint8_t v6 = [*a1 pendingShareSheetInteraction];
  uint64_t v7 = [v6 targetBundleId];
  int v8 = 138412546;
  uint64_t v9 = v5;
  __int16 v10 = 2112;
  uint64_t v11 = v7;
  _os_log_error_impl(&dword_18ECEB000, a2, OS_LOG_TYPE_ERROR, "Pending sharesheet interaction from %@ to %@ dropped because no matching interaction was found", (uint8_t *)&v8, 0x16u);
}

void __53___CDInteractionStore_recordInteractionsBatch_error___block_invoke_cold_2(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 uuid];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_18ECEB000, a2, OS_LOG_TYPE_DEBUG, "Associating share information from pending share interaction to interaction with uuid %@", v4, 0xCu);
}

void __53___CDInteractionStore_recordInteractionsBatch_error___block_invoke_281_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_18ECEB000, v0, v1, "recordInteractionsBatch: %@", v2, v3, v4, v5, v6);
}

void __53___CDInteractionStore_recordInteractionsBatch_error___block_invoke_281_cold_2(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_18ECEB000, log, OS_LOG_TYPE_DEBUG, "Missing uuid in interaction - not storing", buf, 2u);
}

void __100___CDInteractionStore_queryInteractionsUsingPredicate_sortDescriptors_limit_offset_objectIDs_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_18ECEB000, v0, v1, "Caught Exception: %@", v2, v3, v4, v5, v6);
}

void __72___CDInteractionStore_queryContactInteractionsUsingPredicate_withLimit___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_18ECEB000, v0, v1, "Query error: %@", v2, v3, v4, v5, v6);
}

void __72___CDInteractionStore_queryContactInteractionsUsingPredicate_withLimit___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_18ECEB000, v0, v1, "queryContactInteractionsUsingPredicate: %@", v2, v3, v4, v5, v6);
}

void __76___CDInteractionStore_histogramContactInteractionsUsingPredicate_withLimit___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_18ECEB000, v0, v1, "histogramContactInteractionsUsingPredicate: %@", v2, v3, v4, v5, v6);
}

void __44___CDInteractionStore_usersWithInteractions__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_18ECEB000, v0, v1, "usersWithInteractions: query error: %@", v2, v3, v4, v5, v6);
}

void __44___CDInteractionStore_usersWithInteractions__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_18ECEB000, v0, v1, "usersWithInteractions: query exception: %@", v2, v3, v4, v5, v6);
}

void __52___CDInteractionStore_conversationsWithInteractions__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_18ECEB000, v0, v1, "conversationsWithInteractions: query error: %@", v2, v3, v4, v5, v6);
}

void __52___CDInteractionStore_conversationsWithInteractions__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_18ECEB000, v0, v1, "conversationsWithInteractions: query exception: %@", v2, v3, v4, v5, v6);
}

void __67___CDInteractionStore_kMostRecentConversationsWithLimit_predicate___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_18ECEB000, v0, v1, "kMostRecentConversationsWithLimit: query exception: %@", v2, v3, v4, v5, v6);
}

void __58___CDInteractionStore_getInteractionsStatisticsForConfig___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_18ECEB000, v0, v1, "getInteractionsStatisticsForConfig: query error: %@", v2, v3, v4, v5, v6);
}

void __58___CDInteractionStore_getInteractionsStatisticsForConfig___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_18ECEB000, v0, v1, "getInteractionsStatisticsForConfig: query exception: %@", v2, v3, v4, v5, v6);
}

void __41___CDInteractionStore_queryVersionNumber__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_18ECEB000, v0, v1, "queryVersionNumber: %@", v2, v3, v4, v5, v6);
}

void __43___CDInteractionStore_recordVersionNumber___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_18ECEB000, v0, v1, "recordVersionNumber: %@", v2, v3, v4, v5, v6);
}

void __41___CDInteractionStore_metadataDictionary__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_18ECEB000, v0, v1, "metadata: failed to load metadataDictionary: %{private}@", v2, v3, v4, v5, v6);
}

void __38___CDInteractionStore_metadataForKey___block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138543619;
  *(void *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2113;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_3_5(&dword_18ECEB000, a2, a3, "metadata: failed to set get key %{public}@: %{private}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

void __42___CDInteractionStore_setMetadata_forKey___block_invoke_cold_1()
{
  __assert_rtn("-[_CDInteractionStore setMetadata:forKey:]_block_invoke", "_CDInteractionStore.m", 2486, "serialized != nil");
}

@end