@interface _CDSpotlightItemRecorder
+ (_CDSpotlightItemRecorder)spotlightItemRecorderWithInteractionRecorder:(id)a3;
+ (_CDSpotlightItemRecorder)spotlightItemRecorderWithInteractionRecorder:(id)a3 knowledgeStore:(id)a4;
+ (_CDSpotlightItemRecorder)spotlightItemRecorderWithKnowledgeStore:(id)a3;
+ (id)spotlightItemRecorder;
+ (void)recordAggdReceiverAction:(void *)a3 bundleID:(uint64_t)a4 count:;
- (_CDSpotlightItemRecorder)initWithInteractionRecorder:(id)a3;
- (_CDSpotlightItemRecorder)initWithInteractionRecorder:(id)a3 knowledgeStore:(id)a4;
- (_CDSpotlightItemRecorder)initWithInteractionRecorder:(id)a3 knowledgeStore:(id)a4 rateLimitEnforcer:(id)a5;
- (_CDSpotlightItemRecorder)initWithInteractionRecorder:(id)a3 knowledgeStore:(id)a4 rateLimitEnforcer:(id)a5 deletionManagerOverride:(id)a6;
- (id)getUserNameOfDonator;
- (id)supportedINIntentClassNames;
- (id)supportedUTIs;
- (void)_addOrUpdateCoreDuetInteractions:(void *)a3 bundleID:;
- (void)_cacheUserActivity:(uint64_t)a1;
- (void)_deleteUserActivitiesWithPersistentIdentifiers:(void *)a3 bundleID:;
- (void)_enqueueOperation:(uint64_t)a1;
- (void)addInteractions:(id)a3 bundleID:(id)a4 protectionClass:(id)a5;
- (void)addInteractions:(id)a3 bundleID:(id)a4 protectionClass:(id)a5 withCompletion:(id)a6;
- (void)addOrUpdateSearchableItems:(id)a3;
- (void)addOrUpdateSearchableItems:(id)a3 bundleID:(id)a4;
- (void)addOrUpdateSearchableItems:(id)a3 bundleID:(id)a4 withCompletion:(id)a5;
- (void)addUserAction:(id)a3 withItem:(id)a4;
- (void)addUserAction:(id)a3 withItem:(id)a4 withCompletion:(id)a5;
- (void)deleteAllInteractionsWithBundleID:(id)a3 protectionClass:(id)a4;
- (void)deleteAllInteractionsWithBundleID:(id)a3 protectionClass:(id)a4 withCompletion:(id)a5;
- (void)deleteAllItemsWithBundleID:(void *)a3 completion:;
- (void)deleteAllSearchableItemsWithBundleID:(id)a3;
- (void)deleteAllSearchableItemsWithBundleID:(id)a3 withCompletion:(id)a4;
- (void)deleteAllUserActivities:(id)a3;
- (void)deleteInteractionsWithGroupIdentifiers:(id)a3 bundleID:(id)a4 protectionClass:(id)a5;
- (void)deleteInteractionsWithGroupIdentifiers:(id)a3 bundleID:(id)a4 protectionClass:(id)a5 withCompletion:(id)a6;
- (void)deleteInteractionsWithIdentifiers:(id)a3 bundleID:(id)a4 protectionClass:(id)a5;
- (void)deleteInteractionsWithIdentifiers:(id)a3 bundleID:(id)a4 protectionClass:(id)a5 withCompletion:(id)a6;
- (void)deleteKnowledgeEventsMatchingPredicate:(void *)a3 withCompletion:;
- (void)deleteSearchableItemsSinceDate:(id)a3 bundleID:(id)a4;
- (void)deleteSearchableItemsSinceDate:(id)a3 bundleID:(id)a4 withCompletion:(id)a5;
- (void)deleteSearchableItemsWithDomainIdentifiers:(id)a3 bundleID:(id)a4;
- (void)deleteSearchableItemsWithDomainIdentifiers:(id)a3 bundleID:(id)a4 withCompletion:(id)a5;
- (void)deleteSearchableItemsWithIdentifiers:(id)a3 bundleID:(id)a4;
- (void)deleteSearchableItemsWithIdentifiers:(id)a3 bundleID:(id)a4 withCompletion:(id)a5;
- (void)deleteUserActivitiesWithPersistentIdentifiers:(id)a3 bundleID:(id)a4;
- (void)donateRelevantShortcuts:(id)a3 bundleID:(id)a4;
- (void)getUidOfDonator;
- (void)getUserNameOfDonator;
- (void)registerSpotlightRecorderWithServiceName:(id)a3;
- (void)runOperation:(uint64_t)a1;
- (void)saveRateLimitedEvents:(unsigned int)a3 donatorUid:(void *)a4 responseQueue:(void *)a5 withCompletion:;
- (void)startIntentDeletionForContactDeletions;
- (void)submitOperation:(void *)a1;
@end

@implementation _CDSpotlightItemRecorder

- (void)deleteSearchableItemsWithDomainIdentifiers:(id)a3 bundleID:(id)a4
{
}

+ (void)recordAggdReceiverAction:(void *)a3 bundleID:(uint64_t)a4 count:
{
  id v9 = a3;
  self;
  if (a2 == 2)
  {
    [NSString stringWithFormat:@"%@.userAction", @"com.apple.coreduet.spotlightreceiver"];
  }
  else if (a2 == 1)
  {
    v7 = [NSString stringWithFormat:@"%@.deleting.%@", @"com.apple.coreduet.spotlightreceiver", v9];
    +[_CDDiagnosticDataReporter addValue:a4 forScalarKey:v7];

    [NSString stringWithFormat:@"%@.deleting", @"com.apple.coreduet.spotlightreceiver"];
  }
  else
  {
    if (a2) {
      goto LABEL_8;
    }
    v6 = [NSString stringWithFormat:@"%@.recording.%@", @"com.apple.coreduet.spotlightreceiver", v9];
    +[_CDDiagnosticDataReporter addValue:a4 forScalarKey:v6];

    [NSString stringWithFormat:@"%@.recording", @"com.apple.coreduet.spotlightreceiver"];
  v8 = };
  +[_CDDiagnosticDataReporter addValue:a4 forScalarKey:v8];

LABEL_8:
}

- (id)getUserNameOfDonator
{
  if (a1)
  {
    unsigned int v2 = -[_CDSpotlightItemRecorder getUidOfDonator](a1);
    v3 = +[_CDLogging spotlightReceiverChannel];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      [(_CDSpotlightItemRecorder *)v2 getUserNameOfDonator];
    }

    v4 = getpwuid(v2);
    if (v4 && (v5 = (uint64_t *)v4, v4->pw_name))
    {
      v6 = +[_CDLogging spotlightReceiverChannel];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        [(_CDSpotlightItemRecorder *)v5 getUserNameOfDonator];
      }

      a1 = [NSString stringWithUTF8String:*v5];
    }
    else
    {
      v7 = +[_CDLogging spotlightReceiverChannel];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[_CDSpotlightItemRecorder getUserNameOfDonator]();
      }

      a1 = NSUserName();
    }
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)getUidOfDonator
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_18ECEB000, v0, v1, "Key for UID on current dispatch queue is set.", v2, v3, v4, v5, v6);
}

- (void)deleteSearchableItemsWithDomainIdentifiers:(id)a3 bundleID:(id)a4 withCompletion:(id)a5
{
  v45[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 count];
  if ([v9 isEqualToString:@"com.apple.icloud.drive.fileprovider"])
  {

    id v8 = (id)MEMORY[0x1E4F1CBF0];
  }
  else if ([v9 isEqualToString:@"com.apple.shortcuts"])
  {
    id v12 = objc_alloc(MEMORY[0x1E4F93B20]);
    v45[0] = @"com.apple.duetexpertd.spotlightZKW";
    v45[1] = @"spotlightZKW";
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:2];
    v14 = (void *)[v12 initWithDomainsFromArray:v13];

    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __95___CDSpotlightItemRecorder_deleteSearchableItemsWithDomainIdentifiers_bundleID_withCompletion___block_invoke;
    v39[3] = &unk_1E560ED90;
    id v40 = v14;
    id v15 = v14;
    uint64_t v16 = objc_msgSend(v8, "_pas_filteredArrayWithTest:", v39);

    id v8 = (id)v16;
  }
  else if ([v9 isEqualToString:@"com.apple.mobilecal"] {
         && self->_calendarAddedItemsFilter)
  }
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v42 = __Block_byref_object_copy__28;
    v43 = __Block_byref_object_dispose__28;
    id v44 = 0;
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __95___CDSpotlightItemRecorder_deleteSearchableItemsWithDomainIdentifiers_bundleID_withCompletion___block_invoke_2;
    v38[3] = &unk_1E5610C70;
    v38[4] = self;
    v38[5] = buf;
    uint64_t v17 = objc_msgSend(v8, "_pas_filteredArrayWithTest:", v38);

    _Block_object_dispose(buf, 8);
    id v8 = (id)v17;
  }
  if (v11 != [v8 count])
  {
    v18 = +[_CDLogging spotlightReceiverChannel];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v11 - objc_msgSend(v8, "count"));
      v20 = [NSNumber numberWithUnsignedInteger:v11];
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = v19;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v20;
      *(_WORD *)&buf[22] = 2112;
      v42 = (uint64_t (*)(uint64_t, uint64_t))v9;
      _os_log_impl(&dword_18ECEB000, v18, OS_LOG_TYPE_DEFAULT, "Ignoring %@ of %@ domain identifiers in call to delete searchable items for bundle %@", buf, 0x20u);
    }
  }
  if ([v8 count])
  {
    v21 = _os_activity_create(&dword_18ECEB000, "Duet: deleteSearchableItemsWithDomainIdentifiers:bundleID:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    *(void *)buf = 0;
    *(void *)&buf[8] = 0;
    os_activity_scope_enter(v21, (os_activity_scope_state_t)buf);
    os_activity_scope_leave((os_activity_scope_state_t)buf);

    v22 = +[_CDLogging spotlightReceiverChannel];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = [v8 count];
      *(_DWORD *)buf = 134218498;
      *(void *)&buf[4] = v23;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v9;
      *(_WORD *)&buf[22] = 2112;
      v42 = (uint64_t (*)(uint64_t, uint64_t))v8;
      _os_log_impl(&dword_18ECEB000, v22, OS_LOG_TYPE_DEFAULT, "Deleting %lu searchable items for bundleID: %@ with domain identifiers: %@", buf, 0x20u);
    }

    if (self && self->_recorder)
    {
      objc_initWeak((id *)buf, self);
      batchExecutionSourceQueue = self->_batchExecutionSourceQueue;
      uint64_t v31 = MEMORY[0x1E4F143A8];
      uint64_t v32 = 3221225472;
      v33 = __95___CDSpotlightItemRecorder_deleteSearchableItemsWithDomainIdentifiers_bundleID_withCompletion___block_invoke_775;
      v34 = &unk_1E5610C98;
      objc_copyWeak(&v37, (id *)buf);
      id v35 = v9;
      id v36 = v8;
      dispatch_sync(batchExecutionSourceQueue, &v31);

      objc_destroyWeak(&v37);
      objc_destroyWeak((id *)buf);
    }
    int v25 = objc_msgSend(&unk_1EDE1E920, "containsObject:", v9, v31, v32, v33, v34);
    v26 = +[_CDLogging spotlightReceiverChannel];
    BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_INFO);
    if (v25)
    {
      if (v27)
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v9;
        _os_log_impl(&dword_18ECEB000, v26, OS_LOG_TYPE_INFO, "Deleting searchable items for bundleId: %@ using coalesced deletion path", buf, 0xCu);
      }

      coalescedDeletionManager = self->_coalescedDeletionManager;
      v29 = +[_CDSpotlightDeletionOperation deletionForEventsWithDomainIdentifiers:v8 bundleId:v9 completion:v10];
      [(_CDSpotlightCoalescedDeletionManager *)coalescedDeletionManager processDeletionForOperation:v29];
    }
    else
    {
      if (v27)
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v9;
        _os_log_impl(&dword_18ECEB000, v26, OS_LOG_TYPE_INFO, "Deleting searchable items for bundleId: %@ using direct deletion path", buf, 0xCu);
      }

      v30 = +[_DKQuery predicateForSpotlightEventsWithDomainIdentifiers:bundleID:]((uint64_t)_DKQuery, v8, v9);
      -[_CDSpotlightItemRecorder deleteKnowledgeEventsMatchingPredicate:withCompletion:]((uint64_t)self, v30, v10);
    }
  }
  else if (v10)
  {
    (*((void (**)(id, uint64_t, void))v10 + 2))(v10, 1, 0);
  }
}

- (void)deleteKnowledgeEventsMatchingPredicate:(void *)a3 withCompletion:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint8_t v6 = a3;
  if (a1)
  {
    v7 = +[_CDLogging spotlightReceiverChannel];
    os_signpost_id_t v8 = os_signpost_id_generate(v7);

    id v9 = +[_CDLogging spotlightReceiverChannel];
    id v10 = v9;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_18ECEB000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "_CDSpotlightReceieverDeleteKnowledgeEvents", " enableTelemetry=YES ", buf, 2u);
    }

    uint64_t v11 = *(void **)(a1 + 72);
    id v19 = 0;
    uint64_t v12 = [v11 deleteAllEventsMatchingPredicate:v5 error:&v19];
    id v13 = v19;
    v14 = +[_CDLogging spotlightReceiverChannel];
    id v15 = v14;
    if (v13)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[_CDSpotlightItemRecorder deleteKnowledgeEventsMatchingPredicate:withCompletion:](v5, (uint64_t)v13, v15);
      }
    }
    else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = objc_msgSend(v5, "cd_sanitizeForLogging");
      *(_DWORD *)buf = 134218243;
      uint64_t v21 = v12;
      __int16 v22 = 2113;
      uint64_t v23 = v16;
      _os_log_impl(&dword_18ECEB000, v15, OS_LOG_TYPE_DEFAULT, "Successfully deleted %lu knowledge events with predicate %{private}@.", buf, 0x16u);
    }
    uint64_t v17 = +[_CDLogging spotlightReceiverChannel];
    v18 = v17;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_18ECEB000, v18, OS_SIGNPOST_INTERVAL_END, v8, "_CDSpotlightReceieverDeleteKnowledgeEvents", (const char *)&unk_18EEB7986, buf, 2u);
    }

    if (v6) {
      v6[2](v6, v13 == 0, v13);
    }
  }
}

- (void)addInteractions:(id)a3 bundleID:(id)a4 protectionClass:(id)a5 withCompletion:(id)a6
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = _os_activity_create(&dword_18ECEB000, "Duet: addInteractions:bundleID:protectionClass:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  *(void *)state = 0;
  *(void *)&state[8] = 0;
  os_activity_scope_enter(v13, (os_activity_scope_state_t)state);
  os_activity_scope_leave((os_activity_scope_state_t)state);

  v14 = +[_CDLogging spotlightReceiverChannel];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    id v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
    *(_DWORD *)state = 138412546;
    *(void *)&state[4] = v15;
    *(_WORD *)&state[12] = 2112;
    *(void *)&state[14] = v10;
    _os_log_impl(&dword_18ECEB000, v14, OS_LOG_TYPE_INFO, "Adding %@ interactions for bundleID: %@", state, 0x16u);
  }
  if (([v11 isEqualToString:*MEMORY[0x1E4F28340]] & 1) == 0
    && ([v11 isEqualToString:*MEMORY[0x1E4F28348]] & 1) == 0)
  {
    id v16 = v9;
    id v17 = v10;
    v18 = +[_CDConstants mobileMessagesBundleId]();
    v71 = v17;
    LODWORD(v17) = [v17 isEqualToString:v18];

    if (v17)
    {
      id v59 = v12;
      id v61 = v11;
      id v63 = v10;
      id v65 = v9;
      id v19 = [MEMORY[0x1E4F1C9C8] date];
      id v66 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v82 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      long long v85 = 0u;
      id v58 = v16;
      obuint64_t j = v16;
      uint64_t v20 = [obj countByEnumeratingWithState:&v82 objects:state count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v83;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v83 != v22) {
              objc_enumerationMutation(obj);
            }
            uint64_t v24 = *(void **)(*((void *)&v82 + 1) + 8 * i);
            int v25 = objc_msgSend(v24, "dateInterval", v58);
            v26 = [v25 startDate];

            if (v26)
            {
              [v19 timeIntervalSinceDate:v26];
              double v28 = v27;
              if ([v24 direction] == 2)
              {
                v29 = [v24 intent];
                v30 = [v29 _className];
                uint64_t v31 = (objc_class *)objc_opt_class();
                NSStringFromClass(v31);
                v33 = uint64_t v32 = v19;
                int v34 = [v30 isEqualToString:v33];

                id v19 = v32;
                if (v34)
                {
                  if (v28 > 0.0 && v28 < 180.0)
                  {
                    id v35 = [v24 intent];
                    id v36 = +[_CDSpotlightItemUtils messageContextDictionaryForSendMessageIntent:v35];
                    if (v36) {
                      [v66 addObject:v36];
                    }
                  }
                }
              }
            }
          }
          uint64_t v21 = [obj countByEnumeratingWithState:&v82 objects:state count:16];
        }
        while (v21);
      }

      if ([v66 count])
      {
        id v37 = [get_CDContextualKeyPathClass() ephemeralKeyPathWithKey:@"/interactions/messages"];
        v38 = (void *)[v66 copy];
        v39 = [get_CDClientContextClass() userContext];
        [v39 setObject:v38 forKeyedSubscript:v37];
      }
      id v10 = v63;
      id v9 = v65;
      id v12 = v59;
      id v11 = v61;
      id v16 = v58;
    }
    id v40 = v71;

    v41 = (void *)MEMORY[0x192FB2F20]();
    v42 = self;
    if (self)
    {
      if (self->_recorder)
      {
        v43 = +[_CDConstants mobileMessagesBundleId]();
        char v44 = [v71 isEqualToString:v43];

        if ((v44 & 1) == 0)
        {
          v67 = v41;
          id v60 = v12;
          id v62 = v11;
          id v64 = v10;
          v45 = -[_CDSpotlightItemRecorder getUserNameOfDonator](self);
          v46 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"intent.cd_saveToPeopleStore = YES"];
          v47 = [v16 filteredArrayUsingPredicate:v46];

          v48 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v47, "count"));
          long long v78 = 0u;
          long long v79 = 0u;
          long long v80 = 0u;
          long long v81 = 0u;
          id obja = v47;
          uint64_t v49 = [obja countByEnumeratingWithState:&v78 objects:v86 count:16];
          v50 = self;
          if (v49)
          {
            uint64_t v51 = v49;
            uint64_t v52 = *(void *)v79;
            do
            {
              for (uint64_t j = 0; j != v51; ++j)
              {
                if (*(void *)v79 != v52) {
                  objc_enumerationMutation(obja);
                }
                uint64_t v54 = *(void *)(*((void *)&v78 + 1) + 8 * j);
                v55 = +[_CDInteraction shareSheetInteractionFromINInteraction:v54 bundleID:v71 nsUserName:v45 knowledgeStore:v50->_knowledgeStore];
                if (v55)
                {
                  [v48 addObject:v55];
                }
                else
                {
                  v56 = [[_CDInteraction alloc] initWithINInteraction:v54 bundleID:v71 nsUserName:v45];
                  if (v56) {
                    [v48 addObject:v56];
                  }

                  v50 = self;
                }
              }
              uint64_t v51 = [obja countByEnumeratingWithState:&v78 objects:v86 count:16];
            }
            while (v51);
          }

          id v40 = v71;
          -[_CDSpotlightItemRecorder _addOrUpdateCoreDuetInteractions:bundleID:]((uint64_t)v50, v48, v71);

          id v10 = v64;
          id v12 = v60;
          id v11 = v62;
          v42 = v50;
          v41 = v67;
        }
      }
    }
    *(void *)state = 0;
    *(void *)&state[8] = state;
    *(void *)&state[16] = 0x2020000000;
    unsigned int v88 = 0;
    unsigned int v88 = -[_CDSpotlightItemRecorder getUidOfDonator](v42);
    batchExecutionSourceQueue = v42->_batchExecutionSourceQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __84___CDSpotlightItemRecorder_addInteractions_bundleID_protectionClass_withCompletion___block_invoke;
    block[3] = &unk_1E5610BD0;
    id v73 = v16;
    id v74 = v40;
    v75 = v42;
    v77 = state;
    id v76 = v12;
    dispatch_sync(batchExecutionSourceQueue, block);

    _Block_object_dispose(state, 8);
  }
}

- (void)addInteractions:(id)a3 bundleID:(id)a4 protectionClass:(id)a5
{
}

- (void)_addOrUpdateCoreDuetInteractions:(void *)a3 bundleID:
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v41 = a2;
  id v40 = a3;
  if (!a1 || !*(void *)(a1 + 144)) {
    goto LABEL_61;
  }
  uint64_t v45 = a1;
  if ([v41 count])
  {
    if (*(void *)(a1 + 104) && [v40 isEqualToString:@"com.apple.mobilecal"])
    {
      long long v69 = 0u;
      long long v70 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      obuint64_t j = v41;
      uint64_t v44 = [obj countByEnumeratingWithState:&v67 objects:v77 count:16];
      if (v44)
      {
        id v5 = 0;
        uint64_t v43 = *(void *)v68;
        do
        {
          for (uint64_t i = 0; i != v44; ++i)
          {
            if (*(void *)v68 != v43) {
              objc_enumerationMutation(obj);
            }
            v47 = objc_msgSend(*(id *)(*((void *)&v67 + 1) + 8 * i), "domainIdentifier", v40);
            uint8_t v6 = v47;
            if (v47)
            {
              v7 = [*(id *)(v45 + 104) computeHashesForString:v47 reuse:v5];

              [*(id *)(v45 + 104) setWithHashes:v7];
              os_signpost_id_t v8 = v47;
              id v9 = self;

              if (!v9) {
                goto LABEL_41;
              }
              uint64_t v66 = 0;
              long long v64 = 0u;
              long long v65 = 0u;
              long long v62 = 0u;
              long long theString = 0u;
              long long v60 = 0u;
              long long v61 = 0u;
              long long v58 = 0u;
              long long v59 = 0u;
              long long v57 = 0u;
              *(_OWORD *)buffer = 0u;
              long long v56 = 0u;
              CFIndex Length = CFStringGetLength(v8);
              *(void *)&long long theString = v8;
              *((void *)&v64 + 1) = 0;
              *(void *)&long long v65 = Length;
              *((void *)&theString + 1) = CFStringGetCharactersPtr(v8);
              id v11 = *((void *)&theString + 1) ? 0 : CFStringGetCStringPtr(v8, 0x600u);
              *(void *)&long long v64 = v11;
              *((void *)&v65 + 1) = 0;
              uint64_t v66 = 0;
              if (Length >= 1)
              {
                uint64_t v12 = 0;
                uint64_t v13 = 0;
                uint64_t v14 = 64;
                do
                {
                  if ((unint64_t)v13 >= 4) {
                    uint64_t v15 = 4;
                  }
                  else {
                    uint64_t v15 = v13;
                  }
                  uint64_t v16 = v65;
                  if ((uint64_t)v65 <= v13) {
                    goto LABEL_38;
                  }
                  if (*((void *)&theString + 1))
                  {
                    UniChar v17 = *(_WORD *)(*((void *)&theString + 1) + 2 * (v13 + *((void *)&v64 + 1)));
                  }
                  else if ((void)v64)
                  {
                    UniChar v17 = *(char *)(v64 + *((void *)&v64 + 1) + v13);
                  }
                  else
                  {
                    uint64_t v18 = *((void *)&v65 + 1);
                    if (v66 <= v13 || *((void *)&v65 + 1) > v13)
                    {
                      uint64_t v20 = v13 - v15;
                      uint64_t v21 = v15 + v12;
                      uint64_t v22 = v14 - v15;
                      uint64_t v23 = v20 + 64;
                      if (v20 + 64 >= (uint64_t)v65) {
                        uint64_t v23 = v65;
                      }
                      *((void *)&v65 + 1) = v20;
                      uint64_t v66 = v23;
                      if ((uint64_t)v65 >= v22) {
                        uint64_t v16 = v22;
                      }
                      v79.length = v16 + v21;
                      v79.location = *((void *)&v64 + 1) + v20;
                      CFStringGetCharacters((CFStringRef)theString, v79, buffer);
                      uint64_t v18 = *((void *)&v65 + 1);
                    }
                    UniChar v17 = buffer[v13 - v18];
                  }
                  if (v17 == 46)
                  {
                    uint64_t v24 = (void *)MEMORY[0x192FB2F20]();
                    int v25 = *(void **)(v45 + 104);
                    v26 = [(__CFString *)v8 substringToIndex:v13];
                    id v5 = [v25 computeHashesForString:v26 reuse:v7];

                    [*(id *)(v45 + 104) setWithHashes:v5];
                  }
                  else
                  {
LABEL_38:
                    id v5 = v7;
                  }
                  ++v13;
                  --v12;
                  ++v14;
                  v7 = v5;
                }
                while (Length != v13);
              }
              else
              {
LABEL_41:
                id v5 = v7;
              }

              uint8_t v6 = v47;
            }
          }
          uint64_t v44 = [obj countByEnumeratingWithState:&v67 objects:v77 count:16];
        }
        while (v44);
      }
      else
      {
        id v5 = 0;
      }
    }
    double v27 = +[_CDConstants mobileMessagesBundleId]();
    if ([v27 isEqual:v40])
    {

LABEL_51:
      v30 = (void *)MEMORY[0x192FB2F20]();
      *(void *)buffer = 0;
      *(void *)&buffer[4] = buffer;
      *(void *)&long long v56 = 0x2020000000;
      BYTE8(v56) = 0;
      uint64_t v31 = [MEMORY[0x1E4F1C9C8] now];
      uint64_t v32 = *(void **)(v45 + 136);
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __70___CDSpotlightItemRecorder__addOrUpdateCoreDuetInteractions_bundleID___block_invoke;
      v50[3] = &unk_1E5610B10;
      id v33 = v40;
      id v51 = v33;
      id v34 = v41;
      id v52 = v34;
      id v35 = v31;
      id v53 = v35;
      uint64_t v54 = buffer;
      [v32 runWithLockAcquired:v50];
      if (*(unsigned char *)(*(void *)&buffer[4] + 24))
      {
        uint64_t v36 = [v34 count];
        v48[0] = MEMORY[0x1E4F143A8];
        v48[1] = 3221225472;
        v48[2] = __70___CDSpotlightItemRecorder__addOrUpdateCoreDuetInteractions_bundleID___block_invoke_2;
        v48[3] = &unk_1E5610B38;
        id v49 = v35;
        objc_msgSend(v34, "_pas_filteredArrayWithTest:", v48);
        id v41 = (id)objc_claimAutoreleasedReturnValue();

        uint64_t v37 = [v41 count];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218498;
          uint64_t v72 = v36;
          __int16 v73 = 2114;
          id v74 = v33;
          __int16 v75 = 2048;
          uint64_t v76 = v36 - v37;
          _os_log_impl(&dword_18ECEB000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "_addOrUpdateCoreDuetInteractions:(count %tu) bundleID:%{public}@ dropping %tu items due to throttling!", buf, 0x20u);
        }
      }
      else
      {
        id v41 = v34;
      }

      _Block_object_dispose(buffer, 8);
      goto LABEL_57;
    }
    double v28 = +[_CDConstants contactsAutocompleteBundleId]();
    int v29 = [v28 isEqual:v40];

    if (v29) {
      goto LABEL_51;
    }
  }
LABEL_57:
  if (objc_msgSend(v41, "count", v40))
  {
    v38 = objc_alloc_init(_CDSpotlightItemRecorderOperation);
    v39 = v38;
    if (v38) {
      v38->_type = 0;
    }
    -[_DKPredictionTimeline setStartDate:]((uint64_t)v38, v41);
    -[_DKSyncWindow setStartDate:]((uint64_t)v39, v40);
    -[_CDSpotlightItemRecorder submitOperation:]((void *)v45, v39);
  }
LABEL_61:
}

+ (id)spotlightItemRecorder
{
  uint64_t v3 = +[_CDInteractionRecorder interactionRecorder];
  uint64_t v4 = [a1 spotlightItemRecorderWithInteractionRecorder:v3];

  return v4;
}

+ (_CDSpotlightItemRecorder)spotlightItemRecorderWithInteractionRecorder:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [[_CDSpotlightItemRecorder alloc] initWithInteractionRecorder:v3];

  return v4;
}

+ (_CDSpotlightItemRecorder)spotlightItemRecorderWithKnowledgeStore:(id)a3
{
  return (_CDSpotlightItemRecorder *)[a1 spotlightItemRecorderWithInteractionRecorder:0 knowledgeStore:a3];
}

+ (_CDSpotlightItemRecorder)spotlightItemRecorderWithInteractionRecorder:(id)a3 knowledgeStore:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[_CDSpotlightItemRecorder alloc] initWithInteractionRecorder:v6 knowledgeStore:v5];

  return v7;
}

- (_CDSpotlightItemRecorder)initWithInteractionRecorder:(id)a3
{
  id v4 = a3;
  id v5 = +[_DKKnowledgeStore knowledgeStore];
  id v6 = [(_CDSpotlightItemRecorder *)self initWithInteractionRecorder:v4 knowledgeStore:v5];

  return v6;
}

- (_CDSpotlightItemRecorder)initWithInteractionRecorder:(id)a3 knowledgeStore:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  os_signpost_id_t v8 = +[_DKRateLimitPolicyEnforcer rateLimitPolicyEnforcer];
  id v9 = [(_CDSpotlightItemRecorder *)self initWithInteractionRecorder:v7 knowledgeStore:v6 rateLimitEnforcer:v8];

  return v9;
}

- (_CDSpotlightItemRecorder)initWithInteractionRecorder:(id)a3 knowledgeStore:(id)a4 rateLimitEnforcer:(id)a5
{
  return [(_CDSpotlightItemRecorder *)self initWithInteractionRecorder:a3 knowledgeStore:a4 rateLimitEnforcer:a5 deletionManagerOverride:0];
}

- (_CDSpotlightItemRecorder)initWithInteractionRecorder:(id)a3 knowledgeStore:(id)a4 rateLimitEnforcer:(id)a5 deletionManagerOverride:(id)a6
{
  id v11 = a3;
  id v63 = a4;
  id v62 = a5;
  id v12 = a6;
  v72.receiver = self;
  v72.super_class = (Class)_CDSpotlightItemRecorder;
  id v13 = [(_CDSpotlightItemRecorder *)&v72 init];
  if (v13)
  {
    id v14 = objc_alloc(MEMORY[0x1E4F93B70]);
    uint64_t v15 = objc_opt_new();
    uint64_t v16 = objc_msgSend(v14, "initWithGuardedData:", v15, v62, v63);
    UniChar v17 = (void *)*((void *)v13 + 17);
    *((void *)v13 + 17) = v16;

    objc_initWeak(&location, v13);
    objc_storeStrong((id *)v13 + 9, a4);
    objc_storeStrong((id *)v13 + 10, a5);
    uint64_t v18 = +[_DKPrivacyPolicyEnforcer privacyPolicyEnforcer];
    id v19 = (void *)*((void *)v13 + 11);
    *((void *)v13 + 11) = v18;

    uint64_t v20 = [_DKContactsPrivacyMaintainer alloc];
    uint64_t v21 = *((void *)v13 + 9);
    id v22 = objc_loadWeakRetained(&location);
    uint64_t v23 = [(_DKContactsPrivacyMaintainer *)v20 initWithKnowledgeStore:v21 spotlightRecorder:v22];
    uint64_t v24 = (void *)*((void *)v13 + 12);
    *((void *)v13 + 12) = v23;

    int v25 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v26 = dispatch_queue_create("rateLimiterQueue", v25);
    double v27 = (void *)*((void *)v13 + 7);
    *((void *)v13 + 7) = v26;

    uint64_t v28 = [MEMORY[0x1E4F1CA60] dictionary];
    int v29 = (void *)*((void *)v13 + 8);
    *((void *)v13 + 8) = v28;

    v30 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v31 = dispatch_queue_attr_make_with_qos_class(v30, (dispatch_qos_class_t)5u, 0);

    dispatch_queue_t v32 = dispatch_queue_create("batchExecutionSourceQueue", v31);
    id v33 = (void *)*((void *)v13 + 2);
    *((void *)v13 + 2) = v32;

    id v34 = +[_CDLogging spotlightReceiverChannel];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_18ECEB000, v34, OS_LOG_TYPE_DEFAULT, "SpotlightRecorder init biome BMLibrary.App.Intent stream", (uint8_t *)buf, 2u);
    }

    id v35 = BiomeLibrary();
    uint64_t v36 = [v35 App];
    uint64_t v37 = [v36 Intent];
    uint64_t v38 = [v37 source];
    v39 = (void *)*((void *)v13 + 19);
    *((void *)v13 + 19) = v38;

    id v40 = BiomeLibrary();
    id v41 = [v40 App];
    v42 = [v41 LocationActivity];
    uint64_t v43 = [v42 source];
    uint64_t v44 = (void *)*((void *)v13 + 21);
    *((void *)v13 + 21) = v43;

    uint64_t v45 = BiomeLibrary();
    v46 = [v45 App];
    v47 = [v46 Activity];
    uint64_t v48 = [v47 source];
    id v49 = (void *)*((void *)v13 + 20);
    *((void *)v13 + 20) = v48;

    if (v12) {
      objc_storeStrong((id *)v13 + 16, a6);
    }
    if (v11)
    {
      objc_storeStrong((id *)v13 + 18, a3);
      uint64_t v50 = [MEMORY[0x1E4F1CA48] array];
      id v51 = (void *)*((void *)v13 + 4);
      *((void *)v13 + 4) = v50;

      *((void *)v13 + 5) = 0;
      dispatch_queue_t v52 = dispatch_queue_create("batchArrayQueue", v31);
      id v53 = (void *)*((void *)v13 + 3);
      *((void *)v13 + 3) = v52;

      uint64_t v54 = (void *)*((void *)v13 + 6);
      *((void *)v13 + 6) = 0;

      dispatch_source_t v55 = dispatch_source_create(MEMORY[0x1E4F14440], 0, 0, *((dispatch_queue_t *)v13 + 2));
      long long v56 = (void *)*((void *)v13 + 1);
      *((void *)v13 + 1) = v55;

      long long v57 = *((void *)v13 + 1);
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __113___CDSpotlightItemRecorder_initWithInteractionRecorder_knowledgeStore_rateLimitEnforcer_deletionManagerOverride___block_invoke;
      handler[3] = &unk_1E5610AC0;
      id v58 = v13;
      id v69 = v58;
      objc_copyWeak(&v70, &location);
      dispatch_source_set_event_handler(v57, handler);
      dispatch_resume(*((dispatch_object_t *)v13 + 1));
      long long v59 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *((dispatch_queue_t *)v13 + 7));
      dispatch_source_set_timer(v59, 0, 0x1176592E000uLL, 0x37E11D6000uLL);
      objc_initWeak(buf, *((id *)v13 + 8));
      v64[0] = MEMORY[0x1E4F143A8];
      v64[1] = 3221225472;
      v64[2] = __113___CDSpotlightItemRecorder_initWithInteractionRecorder_knowledgeStore_rateLimitEnforcer_deletionManagerOverride___block_invoke_670;
      v64[3] = &unk_1E560D708;
      objc_copyWeak(&v66, buf);
      id v65 = v58;
      dispatch_source_set_event_handler(v59, v64);
      dispatch_resume(v59);

      objc_destroyWeak(&v66);
      objc_destroyWeak(buf);

      objc_destroyWeak(&v70);
    }
    id v60 = v13;

    objc_destroyWeak(&location);
  }

  return (_CDSpotlightItemRecorder *)v13;
}

- (void)runOperation:(uint64_t)a1
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (!a1 || !*(void *)(a1 + 144)) {
    goto LABEL_30;
  }
  if (v3)
  {
    id v5 = v3[3];
    if (v5 != (id)1)
    {
      if (v5) {
        goto LABEL_30;
      }
      goto LABEL_6;
    }
    id v13 = v3[1];
    id v14 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v13, "count"));
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v15 = v13;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v42 objects:v47 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v43;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v43 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v42 + 1) + 8 * v19);
          if ([v4[2] isEqualToString:@"com.apple.mobilemail"])
          {
            [v14 addObject:v20];
          }
          else
          {
            uint64_t v21 = +[_CDSpotlightItemUtils interactionUUIDForSearchableItemWithUID:v20 bundleID:v4[2]];
            [v14 addObject:v21];
          }
          ++v19;
        }
        while (v17 != v19);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v42 objects:v47 count:16];
      }
      while (v17);
    }

    id v22 = v4[2];
    uint64_t v23 = +[_CDConstants mobileMessagesBundleId]();
    int v24 = [v22 isEqualToString:v23];

    if (v24)
    {
      uint64_t v25 = +[_CDConstants shareSheetTargetBundleIdMessages]();
    }
    else
    {
      id v26 = v4[2];
      double v27 = +[_CDConstants mobileMailBundleId]();
      int v28 = [v26 isEqualToString:v27];

      if (!v28)
      {
        unint64_t v30 = 0x1E4F1C000uLL;
        goto LABEL_29;
      }
      uint64_t v25 = +[_CDConstants shareSheetTargetBundleIdMail]();
    }
    int v29 = (void *)v25;
    unint64_t v30 = 0x1E4F1C000;

    id v22 = v29;
LABEL_29:
    id v31 = objc_alloc(*(Class *)(v30 + 2632));
    dispatch_queue_t v32 = (void *)MEMORY[0x1E4F28F60];
    id v33 = v4[2];
    id v34 = [v32 predicateWithFormat:@"mechanism != %@ && bundleId == %@", &unk_1EDE1E1C8, v33, (void)v42];
    id v35 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"mechanism == %@ && targetBundleId == %@", &unk_1EDE1E1C8, v22];

    uint64_t v36 = objc_msgSend(v31, "initWithObjects:", v34, v35, 0);
    uint64_t v37 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v36];
    uint64_t v38 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"uuid IN %@", v14];
    v39 = (void *)MEMORY[0x1E4F28BA0];
    v46[0] = v37;
    v46[1] = v38;
    id v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:2];
    id v41 = [v39 andPredicateWithSubpredicates:v40];

    +[_CDSpotlightItemRecorder recordAggdReceiverAction:bundleID:count:]((uint64_t)_CDSpotlightItemRecorder, 1, v4[2], [*(id *)(a1 + 144) deleteInteractionsMatchingPredicate:v41 sortDescriptors:MEMORY[0x1E4F1CBF0] limit:0 debuggingReason:@"_CDSpotlightItemRecorderOperationTypeDelete" error:0]);
    goto LABEL_30;
  }
LABEL_6:
  id v6 = +[_CDInteractionPolicies interactionPolicies];
  id v7 = v6;
  if (v4) {
    uint64_t v8 = (uint64_t)v4[1];
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = [v6 filterAndModifyInteractionsWithPolicies:v8 enforceDataLimits:1 enforcePrivacy:1];

  if ([*(id *)(a1 + 144) recordInteractions:v9])
  {
    if (v4)
    {
      id v10 = v4[2];
      id v11 = v4[1];
    }
    else
    {
      id v10 = 0;
      id v11 = 0;
    }
    id v12 = v11;
    +[_CDSpotlightItemRecorder recordAggdReceiverAction:bundleID:count:]((uint64_t)_CDSpotlightItemRecorder, 0, v10, [v12 count]);
  }
LABEL_30:
}

- (void)registerSpotlightRecorderWithServiceName:(id)a3
{
  id v4 = a3;
  if (SpotlightReceiverLibraryCore())
  {
    if (!self->_coalescedDeletionManager)
    {
      id v5 = [[_CDSpotlightCoalescedDeletionManager alloc] initWithKnowledgeStore:self->_knowledgeStore];
      coalescedDeletionManager = self->_coalescedDeletionManager;
      self->_coalescedDeletionManager = v5;
    }
    cd_SpotlightReceiverRegister(v4, self);
    self->_registeredSpotlightReceiver = 1;
    id v7 = +[_CDLogging spotlightReceiverChannel];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = 0;
      uint64_t v8 = "SpotlightReceiver is available, registering receiver";
      id v9 = (uint8_t *)&v11;
LABEL_8:
      _os_log_impl(&dword_18ECEB000, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
    }
  }
  else
  {
    id v7 = +[_CDLogging spotlightReceiverChannel];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v10 = 0;
      uint64_t v8 = "SpotlightReceiver is NOT available";
      id v9 = (uint8_t *)&v10;
      goto LABEL_8;
    }
  }
}

- (void)_enqueueOperation:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1 && *(void *)(a1 + 144))
  {
    id v5 = *(NSObject **)(a1 + 24);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __46___CDSpotlightItemRecorder__enqueueOperation___block_invoke;
    v6[3] = &unk_1E560D848;
    v6[4] = a1;
    id v7 = v3;
    dispatch_sync(v5, v6);
  }
}

- (void)submitOperation:(void *)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1 && a1[18])
  {
    uint64_t v15 = 0;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x2020000000;
    char v18 = 0;
    id v5 = a1[3];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44___CDSpotlightItemRecorder_submitOperation___block_invoke;
    block[3] = &unk_1E560D380;
    id v14 = &v15;
    void block[4] = a1;
    id v6 = v3;
    id v13 = v6;
    dispatch_sync(v5, block);
    if (*((unsigned char *)v16 + 24))
    {
      objc_initWeak(&location, a1);
      id v7 = a1[2];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __44___CDSpotlightItemRecorder_submitOperation___block_invoke_2;
      v8[3] = &unk_1E560D708;
      objc_copyWeak(&v10, &location);
      id v9 = v6;
      dispatch_sync(v7, v8);

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
    else
    {
      -[_CDSpotlightItemRecorder _enqueueOperation:]((uint64_t)a1, v6);
    }

    _Block_object_dispose(&v15, 8);
  }
}

- (void)saveRateLimitedEvents:(unsigned int)a3 donatorUid:(void *)a4 responseQueue:(void *)a5 withCompletion:
{
  uint64_t v528 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a4;
  id v10 = a5;
  uint64_t v418 = a1;
  if (a1)
  {
    if ([v8 count])
    {
      __int16 v11 = *(void **)(a1 + 80);
      v193 = v10;
      if (v11)
      {
        id v12 = [v11 filterObjectsByEnforcingRateLimit:v8];
      }
      else
      {
        id v12 = (void *)[v8 copy];
      }
      v195 = v12;
      uint64_t v13 = [v12 count];
      if (v13 != [v8 count])
      {
        id v14 = MEMORY[0x1E4F14500];
        id v15 = MEMORY[0x1E4F14500];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218240;
          uint64_t v523 = [v195 count];
          __int16 v524 = 2048;
          uint64_t v525 = [v8 count];
          _os_log_impl(&dword_18ECEB000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "SpotlightRecorder rate limiting kicked in - saving %lu of %lu objects.", buf, 0x16u);
        }
      }
      id v194 = v9;
      uint64_t v16 = [*(id *)(a1 + 88) enforcePrivacy:v195];
      uint64_t v17 = [v16 count];
      if (v17 != [v8 count])
      {
        char v18 = MEMORY[0x1E4F14500];
        id v19 = MEMORY[0x1E4F14500];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          uint64_t v20 = [v16 count];
          uint64_t v21 = [v195 count];
          *(_DWORD *)buf = 134218240;
          uint64_t v523 = v20;
          __int16 v524 = 2048;
          uint64_t v525 = v21;
          _os_log_impl(&dword_18ECEB000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "SpotlightRecorder privacy policy kicked in - saving %lu of %lu objects.", buf, 0x16u);
        }
      }
      id v191 = v8;
      id v22 = *(void **)(a1 + 72);
      v516[0] = MEMORY[0x1E4F143A8];
      v516[1] = 3221225472;
      v516[2] = __90___CDSpotlightItemRecorder_saveRateLimitedEvents_donatorUid_responseQueue_withCompletion___block_invoke_2;
      v516[3] = &unk_1E5610B60;
      id v518 = v193;
      id v23 = v16;
      id v517 = v23;
      [v22 saveObjects:v23 tracker:&__block_literal_global_78 responseQueue:v194 withCompletion:v516];
      v190 = objc_opt_new();
      int v24 = objc_opt_new();
      long long v512 = 0u;
      long long v513 = 0u;
      long long v514 = 0u;
      long long v515 = 0u;
      obuint64_t j = v23;
      uint64_t v483 = [obj countByEnumeratingWithState:&v512 objects:v521 count:16];
      if (v483)
      {
        uint64_t v25 = MEMORY[0x1E4F14500];
        id v26 = off_1E560D000;
        uint64_t v482 = *(void *)v513;
        v417 = v24;
        do
        {
          uint64_t v27 = 0;
          do
          {
            if (*(void *)v513 != v482) {
              objc_enumerationMutation(obj);
            }
            int v28 = *(void **)(*((void *)&v512 + 1) + 8 * v27);
            int v29 = v25;
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
              -[_CDSpotlightItemRecorder saveRateLimitedEvents:donatorUid:responseQueue:withCompletion:](v519, (uint64_t)v28, &v520);
            }

            unint64_t v30 = [v28 stream];
            id v31 = [v30 name];
            dispatch_queue_t v32 = [(__objc2_class *)v26[17] appIntentsStream];
            id v33 = [v32 name];
            int v34 = [v31 isEqual:v33];

            if (v34)
            {
              id v35 = [v28 metadata];
              id v36 = objc_alloc(MEMORY[0x1E4F4FCA0]);
              v502 = [v28 startDate];
              v470 = [v28 source];
              v499 = [v470 bundleID];
              uint64_t v37 = [v28 source];
              v496 = [v37 sourceID];
              v464 = +[_DKIntentMetadataKey intentClass];
              uint64_t v38 = objc_msgSend(v35, "objectForKeyedSubscript:");
              v458 = [MEMORY[0x1E4F1CA98] null];
              v39 = v28;
              v443 = v36;
              if ((void *)v38 == v458)
              {
                v479 = 0;
              }
              else
              {
                v403 = +[_DKIntentMetadataKey intentClass];
                v404 = objc_msgSend(v35, "objectForKeyedSubscript:");
                v479 = v404;
              }
              uint64_t v56 = +[_DKIntentMetadataKey intentVerb];
              uint64_t v57 = [v35 objectForKeyedSubscript:v56];
              [MEMORY[0x1E4F1CA98] null];
              v449 = v452 = (void *)v57;
              if ((void *)v57 == v449)
              {
                v476 = 0;
              }
              else
              {
                v409 = +[_DKIntentMetadataKey intentVerb];
                v405 = objc_msgSend(v35, "objectForKeyedSubscript:");
                v476 = v405;
              }
              v446 = +[_DKIntentMetadataKey intentType];
              uint64_t v58 = objc_msgSend(v35, "objectForKeyedSubscript:");
              [MEMORY[0x1E4F1CA98] null];
              v490 = v493 = (void *)v58;
              if ((void *)v58 == v490)
              {
                long long v59 = 0;
              }
              else
              {
                v416 = +[_DKIntentMetadataKey intentType];
                long long v59 = objc_msgSend(v35, "objectForKeyedSubscript:");
                v412 = v59;
              }
              unint64_t v60 = [v59 integerValue];
              unint64_t v61 = v60;
              if (v60 >= 4)
              {
                id v63 = +[_CDLogging spotlightReceiverChannel];
                if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)v526 = 134217984;
                  unint64_t v527 = v61;
                  _os_log_error_impl(&dword_18ECEB000, v63, OS_LOG_TYPE_ERROR, "unable to convert _INIntentType enum value: %ld", v526, 0xCu);
                }
                uint64_t v62 = v27;

                unint64_t v434 = 0;
              }
              else
              {
                unint64_t v434 = v60;
                uint64_t v62 = v27;
              }
              uint64_t v64 = +[_DKIntentMetadataKey intentHandlingStatus];
              uint64_t v65 = [v35 objectForKeyedSubscript:v64];
              [MEMORY[0x1E4F1CA98] null];
              v487 = v437 = (void *)v65;
              v440 = (void *)v64;
              if ((void *)v65 == v487)
              {
                id v66 = 0;
              }
              else
              {
                v415 = +[_DKIntentMetadataKey intentHandlingStatus];
                id v66 = objc_msgSend(v35, "objectForKeyedSubscript:");
                v410 = v66;
              }
              uint64_t v67 = v62;
              v461 = (void *)v38;
              unint64_t v68 = [v66 integerValue];
              unint64_t v69 = v68;
              if (v68 >= 7)
              {
                id v70 = +[_CDLogging spotlightReceiverChannel];
                if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)v526 = 134217984;
                  unint64_t v527 = v69;
                  _os_log_error_impl(&dword_18ECEB000, v70, OS_LOG_TYPE_ERROR, "unable to convert INIntentHandlingStatus enum value: %ld", v526, 0xCu);
                }

                int v419 = 0;
              }
              else
              {
                int v419 = v68 + 1;
              }
              uint64_t v71 = +[_DKIntentMetadataKey serializedInteraction];
              uint64_t v72 = [v35 objectForKeyedSubscript:v71];
              __int16 v73 = [MEMORY[0x1E4F1CA98] null];
              v428 = (void *)v72;
              v467 = v37;
              v431 = (void *)v71;
              if ((void *)v72 == v73)
              {
                v473 = 0;
              }
              else
              {
                v414 = +[_DKIntentMetadataKey serializedInteraction];
                v408 = objc_msgSend(v35, "objectForKeyedSubscript:");
                v473 = v408;
              }
              v511 = v39;
              v425 = [v39 source];
              v484 = [v425 itemID];
              v422 = +[_DKIntentMetadataKey donatedBySiri];
              objc_msgSend(v35, "objectForKeyedSubscript:");
              v75 = id v74 = v35;
              uint64_t v76 = [MEMORY[0x1E4F1CA98] null];
              uint64_t v506 = v67;
              v455 = (void *)v56;
              if (v75 == v76)
              {
                uint64_t v77 = 0;
              }
              else
              {
                v413 = +[_DKIntentMetadataKey donatedBySiri];
                uint64_t v77 = objc_msgSend(v35, "objectForKeyedSubscript:");
                v407 = (void *)v77;
              }
              uint64_t v78 = +[_DKIntentMetadataKey direction];
              CFRange v79 = [v35 objectForKeyedSubscript:v78];
              long long v80 = [MEMORY[0x1E4F1CA98] null];
              v505 = v74;
              if (v79 == v80)
              {
                long long v81 = 0;
              }
              else
              {
                v411 = +[_DKIntentMetadataKey direction];
                long long v81 = objc_msgSend(v74, "objectForKeyedSubscript:");
                v406 = v81;
              }
              unint64_t v82 = [v81 integerValue];
              uint64_t v83 = v82;
              if (v82 >= 4)
              {
                long long v85 = +[_CDLogging spotlightReceiverChannel];
                if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR)) {
                  -[_CDSpotlightItemRecorder saveRateLimitedEvents:donatorUid:responseQueue:withCompletion:](buf, v83, &v523, v85);
                }

                int v84 = 0;
              }
              else
              {
                int v84 = dword_18EEAC6E0[v82];
              }
              v86 = [v511 source];
              v87 = [v86 groupID];
              LODWORD(v189) = v84;
              LODWORD(v188) = v419;
              unsigned int v88 = (void *)[v443 initWithAbsoluteTimestamp:v502 bundleID:v499 sourceID:v496 intentClass:v479 intentVerb:v476 intentType:v434 handlingStatus:v188 interaction:v473 itemID:v484 donatedBySiri:v77 interactionDirection:v189 groupIdentifier:v87];

              if (v79 != v80)
              {
              }
              int v24 = v417;
              uint64_t v25 = MEMORY[0x1E4F14500];
              if (v75 != v76)
              {
              }
              uint64_t v27 = v506;
              if (v428 != v73)
              {
              }
              id v26 = off_1E560D000;
              if (v437 != v487)
              {
              }
              if (v493 != v490)
              {
              }
              if (v452 != v449)
              {
              }
              if (v461 != v458)
              {
              }
              [*(id *)(v418 + 152) sendEvent:v88];
            }
            else
            {
              id v40 = [v28 stream];
              id v41 = [v40 name];
              long long v42 = [(__objc2_class *)v26[17] appActivityStream];
              long long v43 = [v42 name];
              int v44 = [v41 isEqual:v43];

              if (v44)
              {
                v509 = v28;
                long long v45 = [v28 metadata];
                v46 = [v45 objectForKeyedSubscript:@"com.apple.calendarUIKit.userActivity.date"];
                v47 = [MEMORY[0x1E4F1CA98] null];
                if (v46 == v47)
                {
                  id v503 = 0;
                }
                else
                {
                  id v503 = [v45 objectForKeyedSubscript:@"com.apple.calendarUIKit.userActivity.date"];
                }
                uint64_t v89 = [v45 objectForKeyedSubscript:@"com.apple.calendarUIKit.userActivity.endDate"];
                v90 = [MEMORY[0x1E4F1CA98] null];
                if (v89 == v90)
                {
                  id v500 = 0;
                }
                else
                {
                  id v500 = [v45 objectForKeyedSubscript:@"com.apple.calendarUIKit.userActivity.endDate"];
                }
                id v91 = objc_alloc(MEMORY[0x1E4F4FC90]);
                v92 = [v28 value];
                v497 = [v92 stringValue];
                uint64_t v93 = +[_DKApplicationActivityMetadataKey activityType];
                uint64_t v94 = [v45 objectForKeyedSubscript:v93];
                [MEMORY[0x1E4F1CA98] null];
                v368 = v370 = (void *)v94;
                v354 = v91;
                if ((void *)v94 == v368)
                {
                  v420 = 0;
                }
                else
                {
                  v326 = +[_DKApplicationActivityMetadataKey activityType];
                  v322 = objc_msgSend(v45, "objectForKeyedSubscript:");
                  v420 = v322;
                }
                uint64_t v95 = +[_DKApplicationActivityMetadataKey beginningOfActivity];
                uint64_t v96 = [v45 objectForKeyedSubscript:v95];
                [MEMORY[0x1E4F1CA98] null];
                v494 = v364 = (void *)v96;
                if ((void *)v96 == v494)
                {
                  v400 = 0;
                }
                else
                {
                  v325 = +[_DKApplicationActivityMetadataKey beginningOfActivity];
                  v320 = objc_msgSend(v45, "objectForKeyedSubscript:");
                  v400 = v320;
                }
                v362 = +[_DKApplicationActivityMetadataKey contentDescription];
                uint64_t v97 = objc_msgSend(v45, "objectForKeyedSubscript:");
                [MEMORY[0x1E4F1CA98] null];
                v488 = v491 = (void *)v97;
                if ((void *)v97 == v488)
                {
                  v398 = 0;
                }
                else
                {
                  v324 = +[_DKApplicationActivityMetadataKey contentDescription];
                  v318 = objc_msgSend(v45, "objectForKeyedSubscript:");
                  v398 = v318;
                }
                v360 = +[_DKApplicationActivityMetadataKey expirationDate];
                uint64_t v98 = objc_msgSend(v45, "objectForKeyedSubscript:");
                [MEMORY[0x1E4F1CA98] null];
                v480 = v485 = (void *)v98;
                if ((void *)v98 == v480)
                {
                  v396 = 0;
                }
                else
                {
                  v323 = +[_DKApplicationActivityMetadataKey expirationDate];
                  v316 = objc_msgSend(v45, "objectForKeyedSubscript:");
                  v396 = v316;
                }
                v358 = +[_DKApplicationActivityMetadataKey isEligibleForPrediction];
                uint64_t v99 = objc_msgSend(v45, "objectForKeyedSubscript:");
                [MEMORY[0x1E4F1CA98] null];
                v474 = v477 = (void *)v99;
                if ((void *)v99 == v474)
                {
                  v394 = 0;
                }
                else
                {
                  v321 = +[_DKApplicationActivityMetadataKey isEligibleForPrediction];
                  v314 = objc_msgSend(v45, "objectForKeyedSubscript:");
                  v394 = v314;
                }
                v356 = +[_DKApplicationActivityMetadataKey isPubliclyIndexable];
                uint64_t v100 = objc_msgSend(v45, "objectForKeyedSubscript:");
                [MEMORY[0x1E4F1CA98] null];
                v468 = v471 = (void *)v100;
                v374 = v92;
                if ((void *)v100 == v468)
                {
                  v392 = 0;
                }
                else
                {
                  v319 = +[_DKApplicationActivityMetadataKey isPubliclyIndexable];
                  v312 = objc_msgSend(v45, "objectForKeyedSubscript:");
                  v392 = v312;
                }
                uint64_t v101 = +[_DKApplicationActivityMetadataKey itemIdentifier];
                uint64_t v102 = [v45 objectForKeyedSubscript:v101];
                [MEMORY[0x1E4F1CA98] null];
                v462 = v465 = (void *)v102;
                uint64_t v507 = v27;
                v103 = (void *)v93;
                if ((void *)v102 == v462)
                {
                  v390 = 0;
                }
                else
                {
                  v317 = +[_DKApplicationActivityMetadataKey itemIdentifier];
                  v310 = objc_msgSend(v45, "objectForKeyedSubscript:");
                  v390 = v310;
                }
                uint64_t v104 = +[_DKApplicationActivityMetadataKey itemRelatedContentURL];
                uint64_t v105 = [v45 objectForKeyedSubscript:v104];
                [MEMORY[0x1E4F1CA98] null];
                v456 = v459 = (void *)v105;
                v372 = v103;
                v106 = (void *)v95;
                if ((void *)v105 == v456)
                {
                  v388 = 0;
                }
                else
                {
                  v315 = +[_DKApplicationActivityMetadataKey itemRelatedContentURL];
                  v308 = objc_msgSend(v45, "objectForKeyedSubscript:");
                  v388 = v308;
                }
                uint64_t v107 = +[_DKApplicationActivityMetadataKey itemRelatedUniqueIdentifier];
                uint64_t v108 = [v45 objectForKeyedSubscript:v107];
                [MEMORY[0x1E4F1CA98] null];
                v450 = v453 = (void *)v108;
                v366 = v106;
                if ((void *)v108 == v450)
                {
                  v386 = 0;
                }
                else
                {
                  v313 = +[_DKApplicationActivityMetadataKey itemRelatedUniqueIdentifier];
                  v306 = objc_msgSend(v45, "objectForKeyedSubscript:");
                  v386 = v306;
                }
                v346 = +[_DKApplicationActivityMetadataKey shortcutAvailability];
                uint64_t v109 = objc_msgSend(v45, "objectForKeyedSubscript:");
                [MEMORY[0x1E4F1CA98] null];
                v444 = v447 = (void *)v109;
                if ((void *)v109 == v444)
                {
                  v384 = 0;
                }
                else
                {
                  v311 = +[_DKApplicationActivityMetadataKey shortcutAvailability];
                  v304 = objc_msgSend(v45, "objectForKeyedSubscript:");
                  v384 = v304;
                }
                v343 = +[_DKApplicationActivityMetadataKey suggestedInvocationPhrase];
                uint64_t v110 = objc_msgSend(v45, "objectForKeyedSubscript:");
                [MEMORY[0x1E4F1CA98] null];
                v438 = v441 = (void *)v110;
                if ((void *)v110 == v438)
                {
                  v382 = 0;
                }
                else
                {
                  v309 = +[_DKApplicationActivityMetadataKey suggestedInvocationPhrase];
                  v302 = objc_msgSend(v45, "objectForKeyedSubscript:");
                  v382 = v302;
                }
                uint64_t v111 = +[_DKApplicationActivityMetadataKey title];
                uint64_t v112 = [v45 objectForKeyedSubscript:v111];
                [MEMORY[0x1E4F1CA98] null];
                v432 = v435 = (void *)v112;
                v113 = (void *)v101;
                if ((void *)v112 == v432)
                {
                  v380 = 0;
                }
                else
                {
                  v307 = +[_DKApplicationActivityMetadataKey title];
                  v300 = objc_msgSend(v45, "objectForKeyedSubscript:");
                  v380 = v300;
                }
                uint64_t v114 = +[_DKApplicationActivityMetadataKey userActivityRequiredString];
                uint64_t v115 = [v45 objectForKeyedSubscript:v114];
                [MEMORY[0x1E4F1CA98] null];
                v426 = v429 = (void *)v115;
                v116 = (void *)v104;
                if ((void *)v115 == v426)
                {
                  v378 = 0;
                }
                else
                {
                  v305 = +[_DKApplicationActivityMetadataKey userActivityRequiredString];
                  v299 = objc_msgSend(v45, "objectForKeyedSubscript:");
                  v378 = v299;
                }
                uint64_t v117 = +[_DKApplicationActivityMetadataKey userActivityUUID];
                uint64_t v118 = [v45 objectForKeyedSubscript:v117];
                [MEMORY[0x1E4F1CA98] null];
                v333 = v335 = (void *)v118;
                v352 = v113;
                v350 = v116;
                v348 = (void *)v107;
                v341 = (void *)v111;
                v339 = (void *)v114;
                v337 = (void *)v117;
                if ((void *)v118 == v333)
                {
                  v376 = 0;
                }
                else
                {
                  v303 = +[_DKApplicationActivityMetadataKey userActivityUUID];
                  v298 = objc_msgSend(v45, "objectForKeyedSubscript:");
                  v376 = v298;
                }
                v119 = [v509 source];
                v329 = [v119 sourceID];
                v327 = [v509 source];
                v423 = [v327 bundleID];
                v120 = [v509 source];
                v121 = [v120 itemID];
                v122 = [v509 source];
                v123 = [v122 groupID];
                v124 = (void *)MEMORY[0x1E4F1C9C8];
                [v503 doubleValue];
                v125 = objc_msgSend(v124, "dateWithTimeIntervalSinceReferenceDate:");
                v126 = [v45 objectForKeyedSubscript:@"com.apple.calendarUIKit.userActivity.externalID"];
                v127 = [MEMORY[0x1E4F1CA98] null];
                v505 = v45;
                v331 = v119;
                if (v126 == v127)
                {
                  uint64_t v128 = 0;
                }
                else
                {
                  uint64_t v128 = [v45 objectForKeyedSubscript:@"com.apple.calendarUIKit.userActivity.externalID"];
                  v301 = (void *)v128;
                }
                v129 = (void *)MEMORY[0x1E4F1C9C8];
                [v500 doubleValue];
                v130 = objc_msgSend(v129, "dateWithTimeIntervalSinceReferenceDate:");
                v131 = objc_msgSend(v354, "initWithBundleID:activityType:beginningOfActivity:contentDescription:expirationDate:isEligibleForPrediction:isPubliclyIndexable:itemIdentifier:itemRelatedContentURL:itemRelatedUniqueIdentifier:shortcutAvailability:suggestedInvocationPhrase:title:userActivityRequiredString:userActivityUUID:sourceID:sourceBundleID:sourceItemID:sourceGroupID:calendarUserActivityDate:calendarUserActivityExternalID:calendarUserActivityEndDate:", v497, v420, v400, v398, v396, v394, v392, v390, v388, v386, v384, v382, v380,
                                 v378,
                                 v376,
                                 v329,
                                 v423,
                                 v121,
                                 v123,
                                 v125,
                                 v128,
                                 v130);

                if (v126 != v127) {
                uint64_t v25 = MEMORY[0x1E4F14500];
                }
                if (v335 != v333)
                {
                }
                id v26 = off_1E560D000;
                uint64_t v27 = v507;
                if (v429 != v426)
                {
                }
                if (v435 != v432)
                {
                }
                if (v441 != v438)
                {
                }
                if (v447 != v444)
                {
                }
                if (v453 != v450)
                {
                }
                if (v459 != v456)
                {
                }
                if (v465 != v462)
                {
                }
                if (v471 != v468)
                {
                }
                if (v477 != v474)
                {
                }
                if (v485 != v480)
                {
                }
                if (v491 != v488)
                {
                }
                if (v364 != v494)
                {
                }
                if (v370 != v368)
                {
                }
                v132 = *(void **)(v418 + 160);
                v133 = [v509 startDate];
                [v133 timeIntervalSinceReferenceDate];
                objc_msgSend(v132, "sendEvent:timestamp:", v131);

                unsigned int v88 = v503;
                int v24 = v417;
              }
              else
              {
                uint64_t v48 = [v28 stream];
                id v49 = [v48 name];
                uint64_t v50 = [(__objc2_class *)v26[17] appLocationActivityStream];
                id v51 = [v50 name];
                int v52 = [v49 isEqual:v51];

                if (!v52) {
                  goto LABEL_306;
                }
                v510 = v28;
                id v53 = [v28 metadata];
                uint64_t v54 = [v53 objectForKeyedSubscript:@"com.apple.calendarUIKit.userActivity.date"];
                dispatch_source_t v55 = [MEMORY[0x1E4F1CA98] null];
                if (v54 == v55)
                {
                  id v504 = 0;
                }
                else
                {
                  id v504 = [v53 objectForKeyedSubscript:@"com.apple.calendarUIKit.userActivity.date"];
                }
                v134 = [v53 objectForKeyedSubscript:@"com.apple.calendarUIKit.userActivity.endDate"];
                v135 = [MEMORY[0x1E4F1CA98] null];
                if (v134 == v135)
                {
                  id v501 = 0;
                }
                else
                {
                  id v501 = [v53 objectForKeyedSubscript:@"com.apple.calendarUIKit.userActivity.endDate"];
                }
                v136 = +[_DKLocationApplicationActivityMetadataKey URL];
                v137 = [v53 objectForKeyedSubscript:v136];
                v138 = [MEMORY[0x1E4F1CA98] null];
                if (v137 == v138)
                {
                  id v140 = 0;
                }
                else
                {
                  v139 = +[_DKLocationApplicationActivityMetadataKey URL];
                  id v140 = [v53 objectForKeyedSubscript:v139];
                }
                if (v140)
                {
                  id v498 = [MEMORY[0x1E4F1CB10] URLWithString:v140];
                }
                else
                {
                  id v498 = 0;
                }
                id v141 = objc_alloc(MEMORY[0x1E4F4FD20]);
                v277 = [v510 value];
                v495 = [v277 stringValue];
                uint64_t v142 = +[_DKApplicationActivityMetadataKey activityType];
                uint64_t v143 = [v53 objectForKeyedSubscript:v142];
                v279 = [MEMORY[0x1E4F1CA98] null];
                v280 = (void *)v143;
                if ((void *)v143 == v279)
                {
                  v344 = 0;
                }
                else
                {
                  v246 = +[_DKApplicationActivityMetadataKey activityType];
                  v242 = objc_msgSend(v53, "objectForKeyedSubscript:");
                  v344 = v242;
                }
                uint64_t v144 = +[_DKApplicationActivityMetadataKey beginningOfActivity];
                uint64_t v145 = [v53 objectForKeyedSubscript:v144];
                v489 = [MEMORY[0x1E4F1CA98] null];
                v492 = (void *)v145;
                if ((void *)v145 == v489)
                {
                  v342 = 0;
                }
                else
                {
                  v245 = +[_DKApplicationActivityMetadataKey beginningOfActivity];
                  v240 = objc_msgSend(v53, "objectForKeyedSubscript:");
                  v342 = v240;
                }
                v276 = +[_DKApplicationActivityMetadataKey contentDescription];
                uint64_t v146 = objc_msgSend(v53, "objectForKeyedSubscript:");
                v481 = [MEMORY[0x1E4F1CA98] null];
                v486 = (void *)v146;
                if ((void *)v146 == v481)
                {
                  v340 = 0;
                }
                else
                {
                  v244 = +[_DKApplicationActivityMetadataKey contentDescription];
                  v238 = objc_msgSend(v53, "objectForKeyedSubscript:");
                  v340 = v238;
                }
                v275 = +[_DKApplicationActivityMetadataKey expirationDate];
                uint64_t v147 = objc_msgSend(v53, "objectForKeyedSubscript:");
                v475 = [MEMORY[0x1E4F1CA98] null];
                v478 = (void *)v147;
                if ((void *)v147 == v475)
                {
                  v338 = 0;
                }
                else
                {
                  v243 = +[_DKApplicationActivityMetadataKey expirationDate];
                  v236 = objc_msgSend(v53, "objectForKeyedSubscript:");
                  v338 = v236;
                }
                v274 = +[_DKApplicationActivityMetadataKey isEligibleForPrediction];
                uint64_t v148 = objc_msgSend(v53, "objectForKeyedSubscript:");
                v469 = [MEMORY[0x1E4F1CA98] null];
                v472 = (void *)v148;
                if ((void *)v148 == v469)
                {
                  v336 = 0;
                }
                else
                {
                  v241 = +[_DKApplicationActivityMetadataKey isEligibleForPrediction];
                  v234 = objc_msgSend(v53, "objectForKeyedSubscript:");
                  v336 = v234;
                }
                v273 = +[_DKApplicationActivityMetadataKey isPubliclyIndexable];
                uint64_t v149 = objc_msgSend(v53, "objectForKeyedSubscript:");
                v463 = [MEMORY[0x1E4F1CA98] null];
                v466 = (void *)v149;
                if ((void *)v149 == v463)
                {
                  v334 = 0;
                }
                else
                {
                  v239 = +[_DKApplicationActivityMetadataKey isPubliclyIndexable];
                  v232 = objc_msgSend(v53, "objectForKeyedSubscript:");
                  v334 = v232;
                }
                v272 = +[_DKApplicationActivityMetadataKey itemIdentifier];
                uint64_t v150 = objc_msgSend(v53, "objectForKeyedSubscript:");
                v445 = [MEMORY[0x1E4F1CA98] null];
                v460 = (void *)v150;
                v278 = (void *)v144;
                if ((void *)v150 == v445)
                {
                  v332 = 0;
                }
                else
                {
                  v237 = +[_DKApplicationActivityMetadataKey itemIdentifier];
                  v230 = objc_msgSend(v53, "objectForKeyedSubscript:");
                  v332 = v230;
                }
                v271 = +[_DKApplicationActivityMetadataKey itemRelatedContentURL];
                uint64_t v151 = objc_msgSend(v53, "objectForKeyedSubscript:");
                [MEMORY[0x1E4F1CA98] null];
                v454 = v457 = (void *)v151;
                v267 = v141;
                if ((void *)v151 == v454)
                {
                  v330 = 0;
                }
                else
                {
                  v235 = +[_DKApplicationActivityMetadataKey itemRelatedContentURL];
                  v228 = objc_msgSend(v53, "objectForKeyedSubscript:");
                  v330 = v228;
                }
                uint64_t v152 = +[_DKApplicationActivityMetadataKey itemRelatedUniqueIdentifier];
                uint64_t v153 = [v53 objectForKeyedSubscript:v152];
                [MEMORY[0x1E4F1CA98] null];
                v448 = v451 = (void *)v153;
                if ((void *)v153 == v448)
                {
                  v328 = 0;
                }
                else
                {
                  v233 = +[_DKApplicationActivityMetadataKey itemRelatedUniqueIdentifier];
                  v226 = objc_msgSend(v53, "objectForKeyedSubscript:");
                  v328 = v226;
                }
                uint64_t v154 = +[_DKApplicationActivityMetadataKey shortcutAvailability];
                uint64_t v155 = [v53 objectForKeyedSubscript:v154];
                v421 = [MEMORY[0x1E4F1CA98] null];
                v442 = (void *)v155;
                if ((void *)v155 == v421)
                {
                  id v156 = v140;
                  v297 = 0;
                }
                else
                {
                  id v156 = v140;
                  v231 = +[_DKApplicationActivityMetadataKey shortcutAvailability];
                  v224 = objc_msgSend(v53, "objectForKeyedSubscript:");
                  v297 = v224;
                }
                v268 = +[_DKApplicationActivityMetadataKey suggestedInvocationPhrase];
                uint64_t v157 = objc_msgSend(v53, "objectForKeyedSubscript:");
                [MEMORY[0x1E4F1CA98] null];
                v436 = v439 = (void *)v157;
                if ((void *)v157 == v436)
                {
                  v296 = 0;
                }
                else
                {
                  v229 = +[_DKApplicationActivityMetadataKey suggestedInvocationPhrase];
                  v222 = objc_msgSend(v53, "objectForKeyedSubscript:");
                  v296 = v222;
                }
                v266 = +[_DKApplicationActivityMetadataKey title];
                uint64_t v158 = objc_msgSend(v53, "objectForKeyedSubscript:");
                [MEMORY[0x1E4F1CA98] null];
                v430 = v433 = (void *)v158;
                if ((void *)v158 == v430)
                {
                  v295 = 0;
                }
                else
                {
                  v227 = +[_DKApplicationActivityMetadataKey title];
                  v219 = objc_msgSend(v53, "objectForKeyedSubscript:");
                  v295 = v219;
                }
                v265 = +[_DKApplicationActivityMetadataKey userActivityRequiredString];
                uint64_t v159 = objc_msgSend(v53, "objectForKeyedSubscript:");
                [MEMORY[0x1E4F1CA98] null];
                v424 = v427 = (void *)v159;
                v270 = (void *)v152;
                if ((void *)v159 == v424)
                {
                  v294 = 0;
                }
                else
                {
                  v225 = +[_DKApplicationActivityMetadataKey userActivityRequiredString];
                  v217 = objc_msgSend(v53, "objectForKeyedSubscript:");
                  v294 = v217;
                }
                v254 = +[_DKApplicationActivityMetadataKey userActivityUUID];
                uint64_t v160 = objc_msgSend(v53, "objectForKeyedSubscript:");
                [MEMORY[0x1E4F1CA98] null];
                v399 = v401 = (void *)v160;
                v281 = (void *)v142;
                if ((void *)v160 == v399)
                {
                  v293 = 0;
                }
                else
                {
                  v223 = +[_DKApplicationActivityMetadataKey userActivityUUID];
                  v215 = objc_msgSend(v53, "objectForKeyedSubscript:");
                  v293 = v215;
                }
                v161 = [v510 source];
                v397 = [v161 sourceID];
                v162 = [v510 source];
                v395 = [v162 bundleID];
                v262 = [v510 source];
                v393 = [v262 itemID];
                v261 = [v510 source];
                v391 = [v261 groupID];
                v163 = (void *)MEMORY[0x1E4F1C9C8];
                [v504 doubleValue];
                v389 = objc_msgSend(v163, "dateWithTimeIntervalSinceReferenceDate:");
                uint64_t v164 = [v53 objectForKeyedSubscript:@"com.apple.calendarUIKit.userActivity.externalID"];
                [MEMORY[0x1E4F1CA98] null];
                v385 = v387 = (void *)v164;
                if ((void *)v164 == v385)
                {
                  v292 = 0;
                }
                else
                {
                  v221 = [v53 objectForKeyedSubscript:@"com.apple.calendarUIKit.userActivity.externalID"];
                  v292 = v221;
                }
                v165 = (void *)MEMORY[0x1E4F1C9C8];
                [v501 doubleValue];
                v383 = objc_msgSend(v165, "dateWithTimeIntervalSinceReferenceDate:");
                uint64_t v166 = +[_DKLocationApplicationActivityMetadataKey locationName];
                uint64_t v167 = [v53 objectForKeyedSubscript:v166];
                [MEMORY[0x1E4F1CA98] null];
                v379 = v381 = (void *)v167;
                if ((void *)v167 == v379)
                {
                  v291 = 0;
                }
                else
                {
                  v220 = +[_DKLocationApplicationActivityMetadataKey locationName];
                  v213 = objc_msgSend(v53, "objectForKeyedSubscript:");
                  v291 = v213;
                }
                v259 = +[_DKLocationApplicationActivityMetadataKey latitude];
                uint64_t v168 = objc_msgSend(v53, "objectForKeyedSubscript:");
                [MEMORY[0x1E4F1CA98] null];
                v375 = v377 = (void *)v168;
                if ((void *)v168 == v375)
                {
                  v290 = 0;
                }
                else
                {
                  v218 = +[_DKLocationApplicationActivityMetadataKey latitude];
                  v211 = objc_msgSend(v53, "objectForKeyedSubscript:");
                  v290 = v211;
                }
                v258 = +[_DKLocationApplicationActivityMetadataKey longitude];
                uint64_t v169 = objc_msgSend(v53, "objectForKeyedSubscript:");
                [MEMORY[0x1E4F1CA98] null];
                v371 = v373 = (void *)v169;
                if ((void *)v169 == v371)
                {
                  v289 = 0;
                }
                else
                {
                  v216 = +[_DKLocationApplicationActivityMetadataKey longitude];
                  v209 = objc_msgSend(v53, "objectForKeyedSubscript:");
                  v289 = v209;
                }
                v257 = +[_DKLocationApplicationActivityMetadataKey city];
                uint64_t v170 = objc_msgSend(v53, "objectForKeyedSubscript:");
                [MEMORY[0x1E4F1CA98] null];
                v367 = v369 = (void *)v170;
                if ((void *)v170 == v367)
                {
                  v288 = 0;
                }
                else
                {
                  v214 = +[_DKLocationApplicationActivityMetadataKey city];
                  v207 = objc_msgSend(v53, "objectForKeyedSubscript:");
                  v288 = v207;
                }
                v256 = +[_DKLocationApplicationActivityMetadataKey stateOrProvince];
                uint64_t v171 = objc_msgSend(v53, "objectForKeyedSubscript:");
                [MEMORY[0x1E4F1CA98] null];
                v363 = v365 = (void *)v171;
                if ((void *)v171 == v363)
                {
                  v287 = 0;
                }
                else
                {
                  v212 = +[_DKLocationApplicationActivityMetadataKey stateOrProvince];
                  v205 = objc_msgSend(v53, "objectForKeyedSubscript:");
                  v287 = v205;
                }
                v255 = +[_DKLocationApplicationActivityMetadataKey country];
                uint64_t v172 = objc_msgSend(v53, "objectForKeyedSubscript:");
                [MEMORY[0x1E4F1CA98] null];
                v359 = v361 = (void *)v172;
                if ((void *)v172 == v359)
                {
                  v286 = 0;
                }
                else
                {
                  v210 = +[_DKLocationApplicationActivityMetadataKey country];
                  v203 = objc_msgSend(v53, "objectForKeyedSubscript:");
                  v286 = v203;
                }
                v253 = +[_DKLocationApplicationActivityMetadataKey thoroughfare];
                uint64_t v173 = objc_msgSend(v53, "objectForKeyedSubscript:");
                [MEMORY[0x1E4F1CA98] null];
                v355 = v357 = (void *)v173;
                if ((void *)v173 == v355)
                {
                  v285 = 0;
                }
                else
                {
                  v208 = +[_DKLocationApplicationActivityMetadataKey thoroughfare];
                  v201 = objc_msgSend(v53, "objectForKeyedSubscript:");
                  v285 = v201;
                }
                v252 = +[_DKLocationApplicationActivityMetadataKey fullyFormattedAddress];
                uint64_t v174 = objc_msgSend(v53, "objectForKeyedSubscript:");
                [MEMORY[0x1E4F1CA98] null];
                v351 = v353 = (void *)v174;
                if ((void *)v174 == v351)
                {
                  v284 = 0;
                }
                else
                {
                  v206 = +[_DKLocationApplicationActivityMetadataKey fullyFormattedAddress];
                  v199 = objc_msgSend(v53, "objectForKeyedSubscript:");
                  v284 = v199;
                }
                v251 = +[_DKLocationApplicationActivityMetadataKey subThoroughfare];
                uint64_t v175 = objc_msgSend(v53, "objectForKeyedSubscript:");
                [MEMORY[0x1E4F1CA98] null];
                v347 = v349 = (void *)v175;
                if ((void *)v175 == v347)
                {
                  v283 = 0;
                }
                else
                {
                  v204 = +[_DKLocationApplicationActivityMetadataKey subThoroughfare];
                  v198 = objc_msgSend(v53, "objectForKeyedSubscript:");
                  v283 = v198;
                }
                v282 = v156;
                v250 = +[_DKLocationApplicationActivityMetadataKey postalCode];
                uint64_t v176 = objc_msgSend(v53, "objectForKeyedSubscript:");
                [MEMORY[0x1E4F1CA98] null];
                v248 = v249 = (void *)v176;
                v269 = (void *)v154;
                v263 = v162;
                if ((void *)v176 == v248)
                {
                  uint64_t v177 = 0;
                }
                else
                {
                  v202 = +[_DKLocationApplicationActivityMetadataKey postalCode];
                  uint64_t v177 = objc_msgSend(v53, "objectForKeyedSubscript:");
                  v197 = (void *)v177;
                }
                uint64_t v508 = v27;
                v247 = +[_DKLocationApplicationActivityMetadataKey phoneNumbers];
                v178 = objc_msgSend(v53, "objectForKeyedSubscript:");
                v179 = [MEMORY[0x1E4F1CA98] null];
                v264 = v161;
                v260 = (void *)v166;
                if (v178 == v179)
                {
                  uint64_t v180 = 0;
                }
                else
                {
                  v200 = +[_DKLocationApplicationActivityMetadataKey phoneNumbers];
                  uint64_t v180 = objc_msgSend(v53, "objectForKeyedSubscript:");
                  v196 = (void *)v180;
                }
                v181 = +[_DKLocationApplicationActivityMetadataKey displayName];
                v182 = [v53 objectForKeyedSubscript:v181];
                v183 = [MEMORY[0x1E4F1CA98] null];
                v505 = v53;
                if (v182 == v183)
                {
                  v345 = objc_msgSend(v267, "initWithBundleID:activityType:beginningOfActivity:contentDescription:expirationDate:isEligibleForPrediction:isPubliclyIndexable:itemIdentifier:itemRelatedContentURL:itemRelatedUniqueIdentifier:shortcutAvailability:suggestedInvocationPhrase:title:userActivityRequiredString:userActivityUUID:sourceID:sourceBundleID:sourceItemID:sourceGroupID:calendarUserActivityDate:calendarUserActivityExternalID:calendarUserActivityEndDate:locationName:latitude:longitude:city:stateOrProvince:country:thoroughfare:fullyFormattedAddress:subThoroughfare:postalCode:phoneNumbers:displayName:URL:", v495, v344, v342, v340, v338, v336, v334, v332, v330, v328, v297,
                                   v296,
                                   v295,
                                   v294,
                                   v293,
                                   v397,
                                   v395,
                                   v393,
                                   v391,
                                   v389,
                                   v292,
                                   v383,
                                   v291,
                                   v290,
                                   v289,
                                   v288,
                                   v287,
                                   v286,
                                   v285,
                                   v284,
                                   v283,
                                   v177,
                                   v180,
                                   0,
                                   v498);
                }
                else
                {
                  v184 = +[_DKLocationApplicationActivityMetadataKey displayName];
                  v185 = [v53 objectForKeyedSubscript:v184];
                  v345 = objc_msgSend(v267, "initWithBundleID:activityType:beginningOfActivity:contentDescription:expirationDate:isEligibleForPrediction:isPubliclyIndexable:itemIdentifier:itemRelatedContentURL:itemRelatedUniqueIdentifier:shortcutAvailability:suggestedInvocationPhrase:title:userActivityRequiredString:userActivityUUID:sourceID:sourceBundleID:sourceItemID:sourceGroupID:calendarUserActivityDate:calendarUserActivityExternalID:calendarUserActivityEndDate:locationName:latitude:longitude:city:stateOrProvince:country:thoroughfare:fullyFormattedAddress:subThoroughfare:postalCode:phoneNumbers:displayName:URL:", v495, v344, v342, v340, v338, v336, v334, v332, v330, v328, v297,
                                   v296,
                                   v295,
                                   v294,
                                   v293,
                                   v397,
                                   v395,
                                   v393,
                                   v391,
                                   v389,
                                   v292,
                                   v383,
                                   v291,
                                   v290,
                                   v289,
                                   v288,
                                   v287,
                                   v286,
                                   v285,
                                   v284,
                                   v283,
                                   v177,
                                   v180,
                                   v185,
                                   v498);
                }
                id v26 = off_1E560D000;
                uint64_t v27 = v508;
                if (v178 != v179)
                {
                }
                uint64_t v25 = MEMORY[0x1E4F14500];
                if (v249 != v248)
                {
                }
                int v24 = v417;
                if (v349 != v347)
                {
                }
                if (v353 != v351)
                {
                }
                if (v357 != v355)
                {
                }
                if (v361 != v359)
                {
                }
                if (v365 != v363)
                {
                }
                if (v369 != v367)
                {
                }
                if (v373 != v371)
                {
                }
                if (v377 != v375)
                {
                }
                if (v381 != v379)
                {
                }
                if (v387 != v385) {

                }
                if (v401 != v399)
                {
                }
                if (v427 != v424)
                {
                }
                if (v433 != v430)
                {
                }
                if (v439 != v436)
                {
                }
                if (v442 != v421)
                {
                }
                if (v451 != v448)
                {
                }
                if (v457 != v454)
                {
                }
                if (v460 != v445)
                {
                }
                if (v466 != v463)
                {
                }
                if (v472 != v469)
                {
                }
                if (v478 != v475)
                {
                }
                if (v486 != v481)
                {
                }
                if (v492 != v489)
                {
                }
                if (v280 != v279)
                {
                }
                v186 = *(void **)(v418 + 168);
                v187 = [v510 startDate];
                [v187 timeIntervalSinceReferenceDate];
                objc_msgSend(v186, "sendEvent:timestamp:", v345);

                unsigned int v88 = v504;
              }
            }

LABEL_306:
            ++v27;
          }
          while (v483 != v27);
          uint64_t v483 = [obj countByEnumeratingWithState:&v512 objects:v521 count:16];
        }
        while (v483);
      }

      if ([v190 count]) {
        [*(id *)(v418 + 176) publishXPCEventForAppIntents:v190 appActivities:v24 uid:a3];
      }

      id v10 = v193;
      id v9 = v194;
      id v8 = v191;
    }
    else if (v10)
    {
      (*((void (**)(id, void, void))v10 + 2))(v10, MEMORY[0x1E4F1CBF0], 0);
    }
  }
}

- (void)donateRelevantShortcuts:(id)a3 bundleID:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_18ECEB000, "Duet: donateRelevantShortcuts:bundleID:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  *(void *)state = 0;
  *(void *)&state[8] = 0;
  os_activity_scope_enter(v8, (os_activity_scope_state_t)state);
  os_activity_scope_leave((os_activity_scope_state_t)state);

  id v9 = +[_CDLogging spotlightReceiverChannel];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
    *(_DWORD *)state = 138412546;
    *(void *)&state[4] = v10;
    *(_WORD *)&state[12] = 2112;
    *(void *)&state[14] = v7;
    _os_log_impl(&dword_18ECEB000, v9, OS_LOG_TYPE_INFO, "Donate %@ relevant shortcuts for bundleID: %@", state, 0x16u);
  }
  if (v7)
  {
    __int16 v11 = +[_DKSystemEventStreams appRelevantShortcutsStream];
    id v12 = [v11 name];
    uint64_t v13 = +[_DKQuery predicateForEventsWithStreamName:v12];

    uint64_t v14 = +[_DKQuery predicateForEventsWithStringValue:v7];
    id v15 = (void *)MEMORY[0x1E4F28BA0];
    int v34 = (void *)v14;
    id v35 = (void *)v13;
    v42[0] = v13;
    v42[1] = v14;
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:2];
    uint64_t v17 = [v15 andPredicateWithSubpredicates:v16];

    if (self) {
      -[_CDSpotlightItemRecorder deleteKnowledgeEventsMatchingPredicate:withCompletion:]((uint64_t)self, v17, 0);
    }
    dispatch_queue_t v32 = v17;
    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v36 = v6;
    id v19 = v6;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v38;
      do
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v38 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void *)(*((void *)&v37 + 1) + 8 * v23);
          uint64_t v25 = (void *)MEMORY[0x192FB2F20](v20);
          id v26 = +[_DKEvent eventWithRelevantShortcut:bundleID:](_DKEvent, "eventWithRelevantShortcut:bundleID:", v24, v7, v32);
          if (v26) {
            [v18 addObject:v26];
          }

          ++v23;
        }
        while (v21 != v23);
        uint64_t v20 = [v19 countByEnumeratingWithState:&v37 objects:v41 count:16];
        uint64_t v21 = v20;
      }
      while (v20);
    }

    unint64_t v27 = [v19 count];
    if (v27 > [v18 count])
    {
      int v28 = +[_CDLogging knowledgeChannel];
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        id v31 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v19, "count") - objc_msgSend(v18, "count"));
        *(_DWORD *)state = 138412546;
        *(void *)&state[4] = v31;
        *(_WORD *)&state[12] = 2112;
        *(void *)&state[14] = v7;
        _os_log_error_impl(&dword_18ECEB000, v28, OS_LOG_TYPE_ERROR, "Unable to convert %@ relevant shortcuts for bundleID %@ to knowledge events", state, 0x16u);
      }
    }
    if (objc_msgSend(v18, "count", v32))
    {
      _CDCollectDonationMetricsForEventsInDomain(v18, @"relevantShortcuts");
      int v29 = +[_CDLogging knowledgeChannel];
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
        -[_CDSpotlightItemRecorder donateRelevantShortcuts:bundleID:](v18, (uint64_t)v7, v29);
      }

      unsigned int v30 = -[_CDSpotlightItemRecorder getUidOfDonator](self);
      -[_CDSpotlightItemRecorder saveRateLimitedEvents:donatorUid:responseQueue:withCompletion:]((uint64_t)self, v18, v30, 0, &__block_literal_global_739);
    }

    id v6 = v36;
  }
}

- (void)addOrUpdateSearchableItems:(id)a3
{
}

- (id)supportedUTIs
{
  return +[_CDSpotlightItemUtils expectedSupportedUTIs];
}

- (id)supportedINIntentClassNames
{
  return 0;
}

- (void)addOrUpdateSearchableItems:(id)a3 bundleID:(id)a4
{
}

- (void)addOrUpdateSearchableItems:(id)a3 bundleID:(id)a4 withCompletion:(id)a5
{
  v66[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v47 = a4;
  id v43 = a5;
  id v8 = _os_activity_create(&dword_18ECEB000, "Duet: addOrUpdateSearchableItems:bundleID:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  *(void *)state = 0;
  *(void *)&state[8] = 0;
  os_activity_scope_enter(v8, (os_activity_scope_state_t)state);
  os_activity_scope_leave((os_activity_scope_state_t)state);

  id v9 = +[_CDLogging spotlightReceiverChannel];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
    *(_DWORD *)state = 138412546;
    *(void *)&state[4] = v10;
    *(_WORD *)&state[12] = 2112;
    *(void *)&state[14] = v47;
    _os_log_impl(&dword_18ECEB000, v9, OS_LOG_TYPE_INFO, "Adding %@ searchable items for bundleID: %@", state, 0x16u);
  }
  if ([v47 isEqualToString:@"com.apple.mobilesafari"]
    && [v7 count] == 1)
  {
    __int16 v11 = [v7 firstObject];
    id v12 = [v11 attributeSet];
    uint64_t v13 = [v12 contentURL];

    if (v13)
    {
      uint64_t v14 = [get_CDContextQueriesClass() keyPathForMostRecentSafariSpotlightDonation];
      id v15 = [get_CDContextQueriesClass() mostRecentSafariSearchableItem];
      v65[0] = v15;
      v66[0] = v11;
      uint64_t v16 = [get_CDContextQueriesClass() safariURLInMostRecentSearchableItem];
      v65[1] = v16;
      v66[1] = v13;
      uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v66 forKeys:v65 count:2];
      id v18 = [get_CDClientContextClass() userContext];
      [v18 setObject:v17 forKeyedSubscript:v14];
    }
  }
  uint64_t v19 = [v7 count];
  if ([v47 isEqualToString:@"com.apple.icloud.drive.fileprovider"])
  {
    long long v45 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_12:

    goto LABEL_14;
  }
  if ([v47 isEqualToString:@"com.apple.shortcuts"])
  {
    id v20 = objc_alloc(MEMORY[0x1E4F93B20]);
    v64[0] = @"com.apple.duetexpertd.spotlightZKW";
    v64[1] = @"spotlightZKW";
    uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:2];
    uint64_t v22 = (void *)[v20 initWithDomainsFromArray:v21];

    v59[0] = MEMORY[0x1E4F143A8];
    v59[1] = 3221225472;
    v59[2] = __79___CDSpotlightItemRecorder_addOrUpdateSearchableItems_bundleID_withCompletion___block_invoke;
    v59[3] = &unk_1E5610BF8;
    id v60 = v22;
    id v23 = v22;
    long long v45 = objc_msgSend(v7, "_pas_filteredArrayWithTest:", v59);

    id v7 = v23;
    goto LABEL_12;
  }
  long long v45 = v7;
LABEL_14:
  if (v19 != [v45 count])
  {
    uint64_t v24 = +[_CDLogging spotlightReceiverChannel];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      uint64_t v25 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v19 - objc_msgSend(v45, "count"));
      id v26 = [NSNumber numberWithUnsignedInteger:v19];
      *(_DWORD *)state = 138412802;
      *(void *)&state[4] = v25;
      *(_WORD *)&state[12] = 2112;
      *(void *)&state[14] = v26;
      *(_WORD *)&unsigned char state[22] = 2112;
      id v63 = v47;
      _os_log_impl(&dword_18ECEB000, v24, OS_LOG_TYPE_INFO, "Ignoring %@ of %@ searchable items added for bundleID: %@", state, 0x20u);
    }
  }
  if ([v45 count])
  {
    unint64_t v27 = self;
    if (self && self->_recorder)
    {
      context = (void *)MEMORY[0x192FB2F20]();
      int v28 = -[_CDSpotlightItemRecorder getUserNameOfDonator](self);
      uint64_t v48 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v45, "count"));
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      obuint64_t j = v45;
      uint64_t v29 = [obj countByEnumeratingWithState:&v55 objects:v61 count:16];
      if (!v29) {
        goto LABEL_34;
      }
      uint64_t v30 = *(void *)v56;
      while (1)
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v56 != v30) {
            objc_enumerationMutation(obj);
          }
          dispatch_queue_t v32 = *(void **)(*((void *)&v55 + 1) + 8 * i);
          id v33 = +[_CDSpotlightItemUtils interactionForSearchableItem:nsUserName:](_CDSpotlightItemUtils, "interactionForSearchableItem:nsUserName:", v32, v28, context);
          if (v33)
          {
            [v48 addObject:v33];
            int v34 = +[_CDConstants mobileMessagesBundleId]();
            if ([v47 isEqualToString:v34])
            {
              int v35 = [v33 isGroupChat];

              if (!v35) {
                goto LABEL_32;
              }
              int v34 = +[_CDSpotlightItemUtils interactionForSearchableItem:v32 nsUserName:v28];
              id v36 = [v32 uniqueIdentifier];
              long long v37 = +[_CDConstants contactsAutocompleteBundleId]();
              long long v38 = +[_CDSpotlightItemUtils interactionUUIDForSearchableItemWithUID:v36 bundleID:v37];
              [v34 setUuid:v38];

              long long v39 = +[_CDConstants contactsAutocompleteBundleId]();
              [v34 setBundleId:v39];

              if (v34) {
                [v48 addObject:v34];
              }
            }
          }
LABEL_32:
        }
        uint64_t v29 = [obj countByEnumeratingWithState:&v55 objects:v61 count:16];
        if (!v29)
        {
LABEL_34:

          -[_CDSpotlightItemRecorder _addOrUpdateCoreDuetInteractions:bundleID:]((uint64_t)self, v48, v47);
          unint64_t v27 = self;
          break;
        }
      }
    }
    *(void *)state = 0;
    *(void *)&state[8] = state;
    *(void *)&state[16] = 0x2020000000;
    LODWORD(v63) = 0;
    LODWORD(v63) = -[_CDSpotlightItemRecorder getUidOfDonator](v27);
    long long v40 = (void *)MEMORY[0x192FB2F20]();
    batchExecutionSourceQueue = self->_batchExecutionSourceQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __79___CDSpotlightItemRecorder_addOrUpdateSearchableItems_bundleID_withCompletion___block_invoke_761;
    block[3] = &unk_1E5610BD0;
    id v50 = v45;
    id v51 = v47;
    int v52 = self;
    uint64_t v54 = state;
    id v53 = v43;
    dispatch_sync(batchExecutionSourceQueue, block);

    _Block_object_dispose(state, 8);
  }
  else if (v43)
  {
    (*((void (**)(id, uint64_t, void))v43 + 2))(v43, 1, 0);
  }
}

- (void)addUserAction:(id)a3 withItem:(id)a4
{
}

- (void)_cacheUserActivity:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 112);
    if (v4)
    {
      id v11 = v3;
      id v5 = [v3 source];
      id v6 = [v5 sourceID];
      id v7 = [v11 value];
      id v8 = [v7 stringValue];
      id v9 = [v11 source];
      id v10 = [v9 itemID];
      [v4 addSourceID:v6 bundleID:v8 itemID:v10];

      id v3 = v11;
    }
  }
}

- (void)addUserAction:(id)a3 withItem:(id)a4 withCompletion:(id)a5
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v30 = a3;
  id v8 = a4;
  id v29 = a5;
  id v9 = _os_activity_create(&dword_18ECEB000, "Duet: addUserAction:withItem:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  os_activity_scope_leave(&state);

  id v10 = +[_CDLogging spotlightReceiverChannel];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = [v8 bundleID];
    LODWORD(state.opaque[0]) = 138412290;
    *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)v11;
    _os_log_impl(&dword_18ECEB000, v10, OS_LOG_TYPE_INFO, "Adding user action for bundleID: %@", (uint8_t *)&state, 0xCu);
  }
  id v12 = +[_CDSpotlightItemUtils knowledgeEventsForSearchableItem:v8 userAction:v30];
  unsigned int v28 = -[_CDSpotlightItemRecorder getUidOfDonator](self);
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v26 = v12;
  uint64_t v13 = [v26 countByEnumeratingWithState:&v40 objects:v48 count:16];
  if (v13)
  {
    uint64_t v27 = *(void *)v41;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v41 != v27) {
          objc_enumerationMutation(v26);
        }
        id v15 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        -[_CDSpotlightItemRecorder _cacheUserActivity:]((uint64_t)self, v15);
        state.opaque[0] = 0;
        state.opaque[1] = (uint64_t)&state;
        uint64_t v46 = 0x2020000000;
        char v47 = 1;
        uint64_t v16 = NSString;
        uint64_t v17 = [v8 bundleID];
        id v18 = [v15 stream];
        uint64_t v19 = [v18 name];
        id v20 = [v16 stringWithFormat:@"%@_%@", v17, v19];

        activityRateLimiterQueue = self->_activityRateLimiterQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __66___CDSpotlightItemRecorder_addUserAction_withItem_withCompletion___block_invoke;
        block[3] = &unk_1E560FDA8;
        void block[4] = self;
        id v22 = v20;
        id v36 = v22;
        long long v37 = v15;
        id v23 = v8;
        id v38 = v23;
        p_os_activity_scope_state_s state = &state;
        dispatch_sync(activityRateLimiterQueue, block);
        int v24 = *(unsigned __int8 *)(state.opaque[1] + 24);
        if (!*(unsigned char *)(state.opaque[1] + 24))
        {

          _Block_object_dispose(&state, 8);
          goto LABEL_14;
        }
        uint64_t v44 = v15;
        uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v44 count:1];
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __66___CDSpotlightItemRecorder_addUserAction_withItem_withCompletion___block_invoke_771;
        v31[3] = &unk_1E5610C20;
        id v32 = v23;
        id v33 = v30;
        id v34 = v29;
        -[_CDSpotlightItemRecorder saveRateLimitedEvents:donatorUid:responseQueue:withCompletion:]((uint64_t)self, v25, v28, 0, v31);

        _Block_object_dispose(&state, 8);
        if (!v24) {
          goto LABEL_14;
        }
      }
      uint64_t v13 = [v26 countByEnumeratingWithState:&v40 objects:v48 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
LABEL_14:
}

- (void)deleteAllUserActivities:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _os_activity_create(&dword_18ECEB000, "Duet: deleteAllUserActivities:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v7.opaque[0] = 0;
  v7.opaque[1] = 0;
  os_activity_scope_enter(v5, &v7);
  os_activity_scope_leave(&v7);

  id v6 = +[_CDLogging spotlightReceiverChannel];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v7.opaque[0]) = 138412290;
    *(uint64_t *)((char *)v7.opaque + 4) = (uint64_t)v4;
    _os_log_impl(&dword_18ECEB000, v6, OS_LOG_TYPE_DEFAULT, "Deleting user activies with bundleID: %@", (uint8_t *)&v7, 0xCu);
  }

  -[_CDSpotlightItemRecorder _deleteUserActivitiesWithPersistentIdentifiers:bundleID:]((uint64_t)self, 0, v4);
}

- (void)_deleteUserActivitiesWithPersistentIdentifiers:(void *)a3 bundleID:
{
  v37[2] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  os_activity_scope_state_s v7 = v6;
  if (a1)
  {
    if (!v6)
    {
      id v10 = +[_CDLogging knowledgeChannel];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[_CDSpotlightItemRecorder _deleteUserActivitiesWithPersistentIdentifiers:bundleID:]();
      }
      goto LABEL_28;
    }
    uint64_t v8 = +[_DKSystemEventStreams appActivityStream];
    id v9 = [v8 name];
    id v10 = +[_DKQuery predicateForEventsWithStreamName:v9];

    id v11 = +[_DKSystemEventStreams appLocationActivityStream];
    id v12 = [v11 name];
    uint64_t v13 = +[_DKQuery predicateForEventsWithStreamName:v12];

    uint64_t v14 = (void *)MEMORY[0x1E4F28BA0];
    v37[0] = v10;
    v37[1] = v13;
    id v32 = (void *)v13;
    id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];
    uint64_t v16 = [v14 orPredicateWithSubpredicates:v15];

    uint64_t v17 = *(void *)(a1 + 112);
    BOOL v18 = v17 == 0;
    if (v17)
    {
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __84___CDSpotlightItemRecorder__deleteUserActivitiesWithPersistentIdentifiers_bundleID___block_invoke;
      v34[3] = &unk_1E5610C48;
      v34[4] = a1;
      id v35 = v7;
      objc_msgSend(v5, "_pas_filteredArrayWithTest:", v34);
      id v19 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v19 = v5;
    }
    if ([v19 count]) {
      BOOL v20 = arc4random_uniform(0x64u) == 0;
    }
    else {
      BOOL v20 = 0;
    }
    uint64_t v21 = *(void **)(a1 + 112);
    if (v21)
    {
      int v22 = [v21 count];
      if (v19) {
        int v23 = v20;
      }
      else {
        int v23 = 1;
      }
      if (!v22) {
        int v23 = 0;
      }
      if (v17) {
        BOOL v18 = v23;
      }
      else {
        BOOL v18 = 1;
      }
    }
    if (v19)
    {
      if (![v19 count])
      {
        id v26 = +[_CDLogging knowledgeChannel];
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18ECEB000, v26, OS_LOG_TYPE_INFO, "Skipping deletion, all identifiers filterd by cache", buf, 2u);
        }
        goto LABEL_27;
      }
      int v24 = +[_DKSource spotlightSourceID];
      uint64_t v25 = +[_DKQuery predicateForEventsWithSourceID:v24 bundleID:v7 itemIDs:v19];
    }
    else
    {
      int v24 = +[_DKSource spotlightSourceID];
      uint64_t v25 = +[_DKQuery predicateForEventsWithSourceID:v24 bundleID:v7];
    }
    id v26 = v25;

    uint64_t v27 = (void *)MEMORY[0x1E4F28BA0];
    v36[0] = v16;
    v36[1] = v26;
    unsigned int v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
    id v29 = [v27 andPredicateWithSubpredicates:v28];

    -[_CDSpotlightItemRecorder deleteKnowledgeEventsMatchingPredicate:withCompletion:](a1, v29, 0);
    if (v18)
    {
      id v30 = [[_CDUserActivityCache alloc] initWithKnowledgeStore:*(void *)(a1 + 72)];
      [(_CDUserActivityCache *)v30 populateCache];
      id v31 = *(void **)(a1 + 112);
      *(void *)(a1 + 112) = v30;
    }
LABEL_27:

LABEL_28:
  }
}

- (void)deleteUserActivitiesWithPersistentIdentifiers:(id)a3 bundleID:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _os_activity_create(&dword_18ECEB000, "Duet: deleteUserActivitiesWithPersistentIdentifiers:bundleID:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  *(void *)id v11 = 0;
  *(void *)&v11[8] = 0;
  os_activity_scope_enter(v8, (os_activity_scope_state_t)v11);
  os_activity_scope_leave((os_activity_scope_state_t)v11);

  id v9 = +[_CDLogging spotlightReceiverChannel];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = [v6 count];
    *(_DWORD *)id v11 = 138412802;
    *(void *)&v11[4] = v6;
    *(_WORD *)&v11[12] = 1024;
    *(_DWORD *)&v11[14] = v10;
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl(&dword_18ECEB000, v9, OS_LOG_TYPE_DEFAULT, "Deleting user activies with persistent identifiers: %@, count: %u, bundleID: %@", v11, 0x1Cu);
  }

  if (v6 && [v6 count]) {
    -[_CDSpotlightItemRecorder _deleteUserActivitiesWithPersistentIdentifiers:bundleID:]((uint64_t)self, v6, v7);
  }
}

- (void)deleteAllSearchableItemsWithBundleID:(id)a3
{
}

- (void)deleteAllSearchableItemsWithBundleID:(id)a3 withCompletion:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  if ([v6 isEqualToString:@"com.apple.icloud.drive.fileprovider"])
  {
    uint64_t v8 = +[_CDLogging spotlightReceiverChannel];
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    LODWORD(v17.opaque[0]) = 138412290;
    *(uint64_t *)((char *)v17.opaque + 4) = (uint64_t)v6;
    goto LABEL_11;
  }
  int v9 = [v6 isEqualToString:@"com.apple.mobilecal"];
  if (self && v9 && self->_recorder)
  {
    LODWORD(v10) = 953267991;
    id v11 = [MEMORY[0x1E4F93AB8] bloomFilterInMemoryWithNumberOfValuesN:13355 errorRateP:v10];
    calendarAddedItemsFilter = self->_calendarAddedItemsFilter;
    self->_calendarAddedItemsFilter = v11;
  }
  id v13 = +[_CDConstants mobileMessagesBundleId]();
  int v14 = [v6 isEqualToString:v13];

  if (v14)
  {
    uint64_t v8 = +[_CDLogging spotlightReceiverChannel];
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    LODWORD(v17.opaque[0]) = 138412290;
    *(uint64_t *)((char *)v17.opaque + 4) = (uint64_t)v6;
LABEL_11:
    _os_log_impl(&dword_18ECEB000, v8, OS_LOG_TYPE_DEFAULT, "Ignoring call to delete all searchable items for %@", (uint8_t *)&v17, 0xCu);
LABEL_12:

    if (v7) {
      v7[2](v7, 1, 0);
    }
    goto LABEL_17;
  }
  id v15 = _os_activity_create(&dword_18ECEB000, "Duet: deleteAllSearchableItemsWithBundleID:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v17.opaque[0] = 0;
  v17.opaque[1] = 0;
  os_activity_scope_enter(v15, &v17);
  os_activity_scope_leave(&v17);

  uint64_t v16 = +[_CDLogging spotlightReceiverChannel];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v17.opaque[0]) = 138412290;
    *(uint64_t *)((char *)v17.opaque + 4) = (uint64_t)v6;
    _os_log_impl(&dword_18ECEB000, v16, OS_LOG_TYPE_DEFAULT, "Deleting searchable items with bundleID: %@", (uint8_t *)&v17, 0xCu);
  }

  -[_CDSpotlightItemRecorder deleteAllItemsWithBundleID:completion:](self, v6, v7);
LABEL_17:
}

- (void)deleteAllItemsWithBundleID:(void *)a3 completion:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    if (a1[18])
    {
      objc_initWeak(&location, a1);
      id v7 = a1[2];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __66___CDSpotlightItemRecorder_deleteAllItemsWithBundleID_completion___block_invoke;
      block[3] = &unk_1E560D708;
      objc_copyWeak(&v11, &location);
      id v10 = v5;
      dispatch_sync(v7, block);

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
    uint64_t v8 = +[_DKQuery predicateForSpotlightEventsWithBundleID:]((uint64_t)_DKQuery, v5);
    -[_CDSpotlightItemRecorder deleteKnowledgeEventsMatchingPredicate:withCompletion:]((uint64_t)a1, v8, v6);
  }
}

- (void)deleteSearchableItemsWithIdentifiers:(id)a3 bundleID:(id)a4
{
}

- (void)deleteSearchableItemsWithIdentifiers:(id)a3 bundleID:(id)a4 withCompletion:(id)a5
{
  uint64_t v115 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  int v9 = (void (**)(id, uint64_t, void))a5;
  if ([v8 isEqualToString:@"com.apple.icloud.drive.fileprovider"])
  {
    id v10 = +[_CDLogging spotlightReceiverChannel];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v8;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v11;
      _os_log_impl(&dword_18ECEB000, v10, OS_LOG_TYPE_DEFAULT, "Ignoring call to delete searchable items for %@ with %@ item identifiers", buf, 0x16u);
    }
    if (v9) {
      v9[2](v9, 1, 0);
    }
    goto LABEL_70;
  }
  __int16 v12 = _os_activity_create(&dword_18ECEB000, "Duet: deleteSearchableItemsWithIdentifiers:bundleID:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = 0;
  os_activity_scope_enter(v12, (os_activity_scope_state_t)buf);
  os_activity_scope_leave((os_activity_scope_state_t)buf);

  id v13 = +[_CDLogging spotlightReceiverChannel];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v14;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v8;
    _os_log_impl(&dword_18ECEB000, v13, OS_LOG_TYPE_DEFAULT, "Deleting seachable items from %@ identifiers with bundleID: %@", buf, 0x16u);
  }
  if (self && self->_recorder)
  {
    id v15 = +[_CDConstants mobileMailBundleId]();
    int v16 = [v8 containsString:v15];

    if (!v16)
    {
LABEL_52:
      uint64_t v64 = objc_alloc_init(_CDSpotlightItemRecorderOperation);
      uint64_t v65 = v64;
      if (v64) {
        v64->_type = 1;
      }
      -[_DKPredictionTimeline setStartDate:]((uint64_t)v64, v7);
      -[_DKSyncWindow setStartDate:]((uint64_t)v65, v8);
      -[_CDSpotlightItemRecorder submitOperation:](self, v65);
      id v66 = +[_CDConstants mobilePhoneBundleId]();
      int v67 = [v8 isEqualToString:v66];

      if (v67)
      {
        unint64_t v68 = objc_alloc_init(_CDSpotlightItemRecorderOperation);
        unint64_t v69 = v68;
        if (v68) {
          v68->_type = 1;
        }
        -[_DKPredictionTimeline setStartDate:]((uint64_t)v68, v7);
        id v70 = +[_CDConstants facetimeBundleId]();
        -[_DKSyncWindow setStartDate:]((uint64_t)v69, v70);

        -[_CDSpotlightItemRecorder submitOperation:](self, v69);
      }
      uint64_t v71 = +[_CDConstants mobileMessagesBundleId]();
      int v72 = [v8 isEqualToString:v71];

      if (v72)
      {
        __int16 v73 = objc_alloc_init(_CDSpotlightItemRecorderOperation);
        id v74 = v73;
        if (v73) {
          v73->_type = 1;
        }
        -[_DKPredictionTimeline setStartDate:]((uint64_t)v73, v7);
        __int16 v75 = +[_CDConstants contactsAutocompleteBundleId]();
        -[_DKSyncWindow setStartDate:]((uint64_t)v74, v75);

        -[_CDSpotlightItemRecorder submitOperation:](self, v74);
      }

      goto LABEL_63;
    }
    long long v85 = v9;
    uint64_t v96 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    long long v107 = 0u;
    long long v108 = 0u;
    long long v109 = 0u;
    long long v110 = 0u;
    obuint64_t j = v7;
    uint64_t v17 = [obj countByEnumeratingWithState:&v107 objects:v113 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v108;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v108 != v19) {
            objc_enumerationMutation(obj);
          }
          uint64_t v21 = *(void *)(*((void *)&v107 + 1) + 8 * i);
          int v22 = +[_CDSpotlightItemUtils interactionUUIDForSearchableItemWithUID:v21 bundleID:v8];
          [v96 addObject:v22];
          int v23 = +[_CDConstants mobileMessagesBundleId]();
          int v24 = [v8 isEqualToString:v23];

          if (v24)
          {
            uint64_t v25 = +[_CDConstants contactsAutocompleteBundleId]();
            id v26 = +[_CDSpotlightItemUtils interactionUUIDForSearchableItemWithUID:v21 bundleID:v25];

            [v96 addObject:v26];
          }
        }
        uint64_t v18 = [obj countByEnumeratingWithState:&v107 objects:v113 count:16];
      }
      while (v18);
    }

    uint64_t v27 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"((bundleId == %@) AND (uuid IN %@))", v8, v96];
    recorder = self->_recorder;
    id v106 = 0;
    id v29 = recorder;
    int v84 = (void *)v27;
    id v30 = [(_CDInteractionQuerying *)v29 queryInteractionsUsingPredicate:v27 sortDescriptors:0 limit:0 error:&v106];
    id v31 = v106;

    if (v31)
    {
      id v32 = +[_CDLogging spotlightReceiverChannel];
      int v9 = v85;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        -[_CDSpotlightItemRecorder deleteSearchableItemsWithIdentifiers:bundleID:withCompletion:]();
      }
    }
    else
    {
      int v9 = v85;
      if (![v30 count])
      {
LABEL_51:
        id v7 = (id)[v96 copy];

        goto LABEL_52;
      }
      id v33 = (void *)MEMORY[0x1E4F28F60];
      id v34 = +[_CDConstants shareSheetTargetBundleIdMail]();
      uint64_t v35 = [v33 predicateWithFormat:@"((mechanism == %@) AND (targetBundleId == %@) AND (mailShareSheetDeletionCandidate == %@))", &unk_1EDE1E1C8, v34, &unk_1EDE1E210];

      id v36 = self->_recorder;
      id v105 = 0;
      long long v37 = v36;
      unint64_t v82 = v35;
      id v38 = [(_CDInteractionQuerying *)v37 queryInteractionsUsingPredicate:v35 sortDescriptors:0 limit:0 error:&v105];
      id v39 = v105;

      id v83 = v39;
      if (v39)
      {
        long long v40 = +[_CDLogging spotlightReceiverChannel];
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
          -[_CDSpotlightItemRecorder deleteSearchableItemsWithIdentifiers:bundleID:withCompletion:]();
        }
      }
      long long v103 = 0u;
      long long v104 = 0u;
      long long v101 = 0u;
      long long v102 = 0u;
      id v87 = v38;
      uint64_t v91 = [v87 countByEnumeratingWithState:&v101 objects:v112 count:16];
      if (v91)
      {
        id v89 = v8;
        uint64_t v90 = *(void *)v102;
        unsigned int v88 = v30;
        do
        {
          for (uint64_t j = 0; j != v91; ++j)
          {
            if (*(void *)v102 != v90) {
              objc_enumerationMutation(v87);
            }
            long long v42 = *(void **)(*((void *)&v101 + 1) + 8 * j);
            long long v43 = (void *)MEMORY[0x192FB2F20]();
            uint64_t v44 = [v42 recipients];
            uint64_t v45 = [v44 count];

            if (v45)
            {
              v92 = v43;
              uint64_t v93 = j;
              uint64_t v46 = (void *)MEMORY[0x1E4F1CAD0];
              uint64_t v95 = v42;
              char v47 = [v42 recipients];
              uint64_t v48 = [v47 valueForKey:@"identifier"];
              uint64_t v49 = [v46 setWithArray:v48];

              long long v99 = 0u;
              long long v100 = 0u;
              long long v97 = 0u;
              long long v98 = 0u;
              id v50 = v30;
              uint64_t v51 = [v50 countByEnumeratingWithState:&v97 objects:v111 count:16];
              if (v51)
              {
                uint64_t v52 = v51;
                uint64_t v53 = *(void *)v98;
                do
                {
                  for (uint64_t k = 0; k != v52; ++k)
                  {
                    if (*(void *)v98 != v53) {
                      objc_enumerationMutation(v50);
                    }
                    long long v55 = *(void **)(*((void *)&v97 + 1) + 8 * k);
                    long long v56 = (void *)MEMORY[0x192FB2F20]();
                    if ([v55 direction])
                    {
                      long long v57 = [v55 recipients];
                      uint64_t v58 = [v57 count];

                      if (v58)
                      {
                        long long v59 = (void *)MEMORY[0x1E4F1CAD0];
                        id v60 = [v55 recipients];
                        unint64_t v61 = [v60 valueForKey:@"identifier"];
                        uint64_t v62 = [v59 setWithArray:v61];

                        if ([v49 isEqualToSet:v62])
                        {
                          id v63 = [v95 uuid];
                          [v96 addObject:v63];
                        }
                      }
                    }
                  }
                  uint64_t v52 = [v50 countByEnumeratingWithState:&v97 objects:v111 count:16];
                }
                while (v52);
              }

              id v30 = v88;
              id v8 = v89;
              long long v43 = v92;
              uint64_t j = v93;
            }
          }
          uint64_t v91 = [v87 countByEnumeratingWithState:&v101 objects:v112 count:16];
        }
        while (v91);
      }

      int v9 = v85;
      id v32 = v82;
      id v31 = v83;
    }

    goto LABEL_51;
  }
LABEL_63:
  int v76 = [&unk_1EDE1E938 containsObject:v8];
  uint64_t v77 = +[_CDLogging spotlightReceiverChannel];
  BOOL v78 = os_log_type_enabled(v77, OS_LOG_TYPE_INFO);
  if (v76)
  {
    if (v78)
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v8;
      _os_log_impl(&dword_18ECEB000, v77, OS_LOG_TYPE_INFO, "Deleting searchable items for bundleId: %@ using coalesced deletion path", buf, 0xCu);
    }

    coalescedDeletionManager = self->_coalescedDeletionManager;
    long long v80 = +[_CDSpotlightDeletionOperation deletionForEventsWithItemIdentifiers:v7 bundleId:v8 completion:v9];
    [(_CDSpotlightCoalescedDeletionManager *)coalescedDeletionManager processDeletionForOperation:v80];
  }
  else
  {
    if (v78)
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v8;
      _os_log_impl(&dword_18ECEB000, v77, OS_LOG_TYPE_INFO, "Deleting searchable items for bundleId: %@ using direct deletion path", buf, 0xCu);
    }

    long long v81 = +[_DKQuery predicateForSpotlightEventsWithItemIdentifiers:bundleID:]((uint64_t)_DKQuery, v7, v8);
    -[_CDSpotlightItemRecorder deleteKnowledgeEventsMatchingPredicate:withCompletion:]((uint64_t)self, v81, v9);
  }
LABEL_70:
}

- (void)deleteSearchableItemsSinceDate:(id)a3 bundleID:(id)a4
{
}

- (void)deleteSearchableItemsSinceDate:(id)a3 bundleID:(id)a4 withCompletion:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t, void))a5;
  if ([v9 isEqualToString:@"com.apple.icloud.drive.fileprovider"])
  {
    id v11 = +[_CDLogging spotlightReceiverChannel];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v12 = _CDFormattedDate(v8);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v9;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v12;
      _os_log_impl(&dword_18ECEB000, v11, OS_LOG_TYPE_DEFAULT, "Ignoring call to delete searchable items for %@ since date %@", buf, 0x16u);
    }
    if (v10) {
      v10[2](v10, 1, 0);
    }
  }
  else
  {
    id v13 = _os_activity_create(&dword_18ECEB000, "Duet: deleteSearchableItemsSinceDate:bundleID:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = 0;
    os_activity_scope_enter(v13, (os_activity_scope_state_t)buf);
    os_activity_scope_leave((os_activity_scope_state_t)buf);

    int v14 = +[_CDLogging spotlightReceiverChannel];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = _CDFormattedDate(v8);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v15;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v9;
      _os_log_impl(&dword_18ECEB000, v14, OS_LOG_TYPE_DEFAULT, "Deleting searchable items since date %@ with bundleID %@", buf, 0x16u);
    }
    objc_initWeak((id *)buf, self);
    batchExecutionSourceQueue = self->_batchExecutionSourceQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __83___CDSpotlightItemRecorder_deleteSearchableItemsSinceDate_bundleID_withCompletion___block_invoke;
    block[3] = &unk_1E560DC98;
    id v17 = v8;
    id v21 = v17;
    id v18 = v9;
    id v22 = v18;
    objc_copyWeak(&v23, (id *)buf);
    dispatch_sync(batchExecutionSourceQueue, block);
    uint64_t v19 = +[_DKQuery predicateForSpotlightEventsWithBundleID:sinceDate:]((uint64_t)_DKQuery, v18, v17);
    -[_CDSpotlightItemRecorder deleteKnowledgeEventsMatchingPredicate:withCompletion:]((uint64_t)self, v19, v10);

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }
}

- (void)startIntentDeletionForContactDeletions
{
  [(_DKContactsPrivacyMaintainer *)self->_contactsPrivacyMaintainer registerContactDeletionNotifications];
  contactsPrivacyMaintainer = self->_contactsPrivacyMaintainer;
  [(_DKContactsPrivacyMaintainer *)contactsPrivacyMaintainer scheduleIntentsPruningXPCActivity];
}

- (void)deleteInteractionsWithIdentifiers:(id)a3 bundleID:(id)a4 protectionClass:(id)a5
{
}

- (void)deleteInteractionsWithIdentifiers:(id)a3 bundleID:(id)a4 protectionClass:(id)a5 withCompletion:(id)a6
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  int v14 = _os_activity_create(&dword_18ECEB000, "Duet: deleteInteractionsWithIdentifiers:bundleID:protectionClass:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  *(void *)uint64_t v19 = 0;
  *(void *)&v19[8] = 0;
  os_activity_scope_enter(v14, (os_activity_scope_state_t)v19);
  os_activity_scope_leave((os_activity_scope_state_t)v19);

  id v15 = +[_CDLogging spotlightReceiverChannel];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
    *(_DWORD *)uint64_t v19 = 138412546;
    *(void *)&v19[4] = v16;
    *(_WORD *)&v19[12] = 2112;
    *(void *)&v19[14] = v11;
    _os_log_impl(&dword_18ECEB000, v15, OS_LOG_TYPE_DEFAULT, "Deleting interactions from %@ identifiers with bundleID: %@", v19, 0x16u);
  }
  if (([v12 isEqualToString:*MEMORY[0x1E4F28340]] & 1) != 0
    || [v12 isEqualToString:*MEMORY[0x1E4F28348]])
  {
    id v17 = +[_CDLogging spotlightReceiverChannel];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl(&dword_18ECEB000, v17, OS_LOG_TYPE_INFO, "Request to delete items with identifiers with protectionClass A or B when in class C, D.", v19, 2u);
    }
  }
  [(_CDSpotlightItemRecorder *)self deleteSearchableItemsWithIdentifiers:v10 bundleID:v11 withCompletion:v13];
  id v18 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v10];
  [getBMLibraryStreamsPrunerClass() pruneWithDeletedIntentIdentifiers:v18 bundleId:v11];
}

- (void)deleteAllInteractionsWithBundleID:(id)a3 protectionClass:(id)a4
{
}

- (void)deleteAllInteractionsWithBundleID:(id)a3 protectionClass:(id)a4 withCompletion:(id)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = _os_activity_create(&dword_18ECEB000, "Duet: deleteAllInteractionsWithBundleID:protectionClass:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v14.opaque[0] = 0;
  v14.opaque[1] = 0;
  os_activity_scope_enter(v11, &v14);
  os_activity_scope_leave(&v14);

  id v12 = +[_CDLogging spotlightReceiverChannel];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v14.opaque[0]) = 138412290;
    *(uint64_t *)((char *)v14.opaque + 4) = (uint64_t)v8;
    _os_log_impl(&dword_18ECEB000, v12, OS_LOG_TYPE_DEFAULT, "Deleting interactions with bundleID: %@", (uint8_t *)&v14, 0xCu);
  }

  if (([v9 isEqualToString:*MEMORY[0x1E4F28340]] & 1) != 0
    || [v9 isEqualToString:*MEMORY[0x1E4F28348]])
  {
    id v13 = +[_CDLogging spotlightReceiverChannel];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      LOWORD(v14.opaque[0]) = 0;
      _os_log_impl(&dword_18ECEB000, v13, OS_LOG_TYPE_INFO, "Request to delete items with identifiers with protectionClass A or B when in class C, D.", (uint8_t *)&v14, 2u);
    }
  }
  -[_CDSpotlightItemRecorder deleteAllItemsWithBundleID:completion:](self, v8, v10);
}

- (void)deleteInteractionsWithGroupIdentifiers:(id)a3 bundleID:(id)a4 protectionClass:(id)a5
{
}

- (void)deleteInteractionsWithGroupIdentifiers:(id)a3 bundleID:(id)a4 protectionClass:(id)a5 withCompletion:(id)a6
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  os_activity_scope_state_s v14 = _os_activity_create(&dword_18ECEB000, "Duet: deleteInteractionsWithGroupIdentifiers:bundleID:protectionClass:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  *(void *)id v21 = 0;
  *(void *)&v21[8] = 0;
  os_activity_scope_enter(v14, (os_activity_scope_state_t)v21);
  os_activity_scope_leave((os_activity_scope_state_t)v21);

  uint64_t v15 = +[_CDLogging spotlightReceiverChannel];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id v21 = 138412546;
    *(void *)&v21[4] = v10;
    *(_WORD *)&v21[12] = 2112;
    *(void *)&v21[14] = v11;
    _os_log_impl(&dword_18ECEB000, v15, OS_LOG_TYPE_DEFAULT, "Deleting interactions with group identifiers %@, bundleID: %@", v21, 0x16u);
  }

  if (([v12 isEqualToString:*MEMORY[0x1E4F28340]] & 1) != 0
    || [v12 isEqualToString:*MEMORY[0x1E4F28348]])
  {
    int v16 = +[_CDLogging spotlightReceiverChannel];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v21 = 0;
      _os_log_impl(&dword_18ECEB000, v16, OS_LOG_TYPE_INFO, "Request to delete items with identifiers with protectionClass A or B when in class C, D.", v21, 2u);
    }
  }
  [(_CDSpotlightItemRecorder *)self deleteSearchableItemsWithDomainIdentifiers:v10 bundleID:v11 withCompletion:v13];
  id v17 = +[_CDConstants mobileMessagesBundleId]();
  int v18 = [v11 isEqualToString:v17];

  if (v18)
  {
    uint64_t v19 = +[_CDConstants contactsAutocompleteBundleId]();
    [(_CDSpotlightItemRecorder *)self deleteSearchableItemsWithDomainIdentifiers:v10 bundleID:v19 withCompletion:0];
  }
  uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v10];
  [getBMLibraryStreamsPrunerClass() pruneWithDeletedIntentGroupIdentifiers:v20 bundleId:v11];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_receiverNotifier, 0);
  objc_storeStrong((id *)&self->_appLocationActivitySource, 0);
  objc_storeStrong((id *)&self->_appActivitySource, 0);
  objc_storeStrong((id *)&self->_intentSource, 0);
  objc_storeStrong((id *)&self->_recorder, 0);
  objc_storeStrong((id *)&self->_throttleStateByBundleId, 0);
  objc_storeStrong((id *)&self->_coalescedDeletionManager, 0);
  objc_storeStrong((id *)&self->_userActivityCache, 0);
  objc_storeStrong((id *)&self->_calendarAddedItemsFilter, 0);
  objc_storeStrong((id *)&self->_contactsPrivacyMaintainer, 0);
  objc_storeStrong((id *)&self->_privacyEnforcer, 0);
  objc_storeStrong((id *)&self->_rateLimitEnforcer, 0);
  objc_storeStrong((id *)&self->_knowledgeStore, 0);
  objc_storeStrong((id *)&self->_activityPerBundleRateLimit, 0);
  objc_storeStrong((id *)&self->_activityRateLimiterQueue, 0);
  objc_storeStrong((id *)&self->_pendingOperationsTransaction, 0);
  objc_storeStrong((id *)&self->_pendingOperations, 0);
  objc_storeStrong((id *)&self->_pendingOperationsQueue, 0);
  objc_storeStrong((id *)&self->_batchExecutionSourceQueue, 0);
  objc_storeStrong((id *)&self->_batchExecutionSource, 0);
}

- (void)getUserNameOfDonator
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_18ECEB000, a2, OS_LOG_TYPE_DEBUG, "Spotlight Receiver donator UID is %u", (uint8_t *)v2, 8u);
}

- (void)saveRateLimitedEvents:(uint8_t *)a1 donatorUid:(uint64_t)a2 responseQueue:(void *)a3 withCompletion:(NSObject *)a4 .cold.1(uint8_t *a1, uint64_t a2, void *a3, NSObject *a4)
{
  id v7 = [NSNumber numberWithInteger:a2];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_18ECEB000, a4, OS_LOG_TYPE_ERROR, "unable to convert _CDInteractionDirection enum value: %@", a1, 0xCu);
}

- (void)saveRateLimitedEvents:(void *)a3 donatorUid:responseQueue:withCompletion:.cold.2(uint8_t *buf, uint64_t a2, void *a3)
{
  *(_DWORD *)buf = 138412290;
  *a3 = a2;
  _os_log_debug_impl(&dword_18ECEB000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "SpotlightRecorder trying to donate to biome with event: %@", buf, 0xCu);
}

- (void)donateRelevantShortcuts:(NSObject *)a3 bundleID:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "count"));
  OUTLINED_FUNCTION_1();
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_debug_impl(&dword_18ECEB000, a3, OS_LOG_TYPE_DEBUG, "Saving %@ relevant shortcuts with bundleID %@ to knowledge store", v6, 0x16u);
}

- (void)_deleteUserActivitiesWithPersistentIdentifiers:bundleID:.cold.1()
{
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_18ECEB000, v0, OS_LOG_TYPE_ERROR, "Delete user activities failed because the bundleID is nil.", v1, 2u);
}

- (void)deleteKnowledgeEventsMatchingPredicate:(NSObject *)a3 withCompletion:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend(a1, "cd_sanitizeForLogging");
  OUTLINED_FUNCTION_1();
  __int16 v7 = 2114;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_18ECEB000, a3, OS_LOG_TYPE_ERROR, "Failed to delete knowledge events with predicate %{private}@. Error = %{public}@.", v6, 0x16u);
}

- (void)deleteSearchableItemsWithIdentifiers:bundleID:withCompletion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_18ECEB000, v0, v1, "Error retrieving share sheet interactions marked as mail special deletion candidates: %@", v2, v3, v4, v5, v6);
}

- (void)deleteSearchableItemsWithIdentifiers:bundleID:withCompletion:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_18ECEB000, v0, v1, "Error retrieving mail interactions to delete by identifiers: %@", v2, v3, v4, v5, v6);
}

@end