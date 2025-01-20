@interface _CDPeopleSuggester
+ (id)createAdvisorSettingsFromContext:(id)a3 settings:(id)a4;
+ (id)loggingTagForAutocompleteFeedback;
+ (id)peopleSuggesterUsingDaemon;
+ (id)peopleSuggesterWithDirectDBAccess;
+ (id)restrictedPrefixForPrefix:(id)a3;
+ (void)peopleSuggesterUsingDaemon;
+ (void)peopleSuggesterWithDirectDBAccess;
- (BOOL)enableCaching;
- (_CDPeopleSuggester)init;
- (_CDPeopleSuggester)initWithAdvisor:(id)a3;
- (_CDPeopleSuggesterContext)context;
- (_CDPeopleSuggesterSettings)settings;
- (double)cacheTimeoutSeconds;
- (id)suggestPeopleWithError:(id *)a3;
- (void)dealloc;
- (void)invalidateCache;
- (void)setCacheTimeoutSeconds:(double)a3;
- (void)setContext:(id)a3;
- (void)setEnableCaching:(BOOL)a3;
- (void)setSettings:(id)a3;
- (void)suggestPeopleWithCompletionHandler:(id)a3;
- (void)updateSettings;
@end

@implementation _CDPeopleSuggester

- (id)suggestPeopleWithError:(id *)a3
{
  uint64_t v130 = *MEMORY[0x1E4F143B8];
  v4 = _os_activity_create(&dword_18ECEB000, "Duet: suggestPeople sync", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);
  os_activity_scope_leave(&state);

  v5 = +[_CDLogging interactionChannel];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[_CDPeopleSuggester suggestPeopleWithError:].cold.4(self, v5);
  }

  v6 = self;
  objc_sync_enter(v6);
  v94 = v6;
  if (v6->_enableCaching)
  {
    cache = v6->_cache;
    if (cache)
    {
      if ([(_CDCachedPeopleSuggestion *)cache isValidForContext:v6->_context settings:v6->_settings timeoutSeconds:v6->_cacheTimeoutSeconds])
      {
        v8 = +[_CDLogging interactionChannel];
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
          -[_CDPeopleSuggester suggestPeopleWithError:]();
        }

        v9 = +[_CDLogging interactionSignpost];
        if (os_signpost_enabled(v9))
        {
          LOWORD(state.opaque[0]) = 0;
          _os_signpost_emit_with_name_impl(&dword_18ECEB000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PeopleSuggester", "Early-out: Cache hit enableTelemetry=YES ", (uint8_t *)&state, 2u);
        }

        v10 = [(_CDCachedPeopleSuggestion *)v94->_cache suggestions];
        goto LABEL_87;
      }
      v11 = +[_CDLogging interactionChannel];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[_CDPeopleSuggester suggestPeopleWithError:]();
      }

      v12 = +[_CDLogging interactionSignpost];
      if (os_signpost_enabled(v12))
      {
        LOWORD(state.opaque[0]) = 0;
        _os_signpost_emit_with_name_impl(&dword_18ECEB000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PeopleSuggester", "Cache miss enableTelemetry=YES ", (uint8_t *)&state, 2u);
      }
    }
  }
  v13 = +[_CDLogging interactionSignpost];
  if (os_signpost_enabled(v13))
  {
    LOWORD(state.opaque[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_18ECEB000, v13, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SuggestPeople", " enableTelemetry=YES ", (uint8_t *)&state, 2u);
  }

  v93 = [(_CDPeopleSuggester *)v94 context];
  v96 = [(_CDPeopleSuggester *)v94 settings];
  v91 = [(id)objc_opt_class() createAdvisorSettingsFromContext:v93 settings:v96];
  v14 = -[_CDInteractionAdvising adviseInteractionsUsingSettings:](v94->_advisor, "adviseInteractionsUsingSettings:");
  v15 = (void *)[v14 mutableCopy];

  uint64_t v16 = objc_opt_new();
  v99 = objc_opt_new();
  v98 = (void *)v16;
  v17 = [(_CDPeopleSuggester *)v94 context];
  v18 = [v17 activeInteraction];

  if (v18)
  {
    v19 = objc_alloc_init(_CDAdvisedInteraction);
    v20 = [(_CDPeopleSuggester *)v94 context];
    v21 = [v20 activeInteraction];

    v22 = [v21 recipients];
    v23 = [v22 firstObject];
    [(_CDAdvisedInteraction *)v19 setContact:v23];

    v24 = [v21 account];
    [(_CDAdvisedInteraction *)v19 setAccount:v24];

    v25 = [v21 bundleId];
    [(_CDAdvisedInteraction *)v19 setBundleId:v25];

    -[_CDAdvisedInteraction setMechanism:](v19, "setMechanism:", [v21 mechanism]);
    [(_CDAdvisedInteraction *)v19 setScore:INFINITY];
    [(_CDAdvisedInteraction *)v19 addReason:9];
    [v15 insertObject:v19 atIndex:0];
    v26 = +[_CDLogging interactionChannel];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      -[_CDPeopleSuggester suggestPeopleWithError:]();
    }

    unint64_t v101 = 1;
  }
  else
  {
    unint64_t v101 = 0;
  }
  long long v120 = 0u;
  long long v121 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  obuint64_t j = v15;
  uint64_t v27 = [obj countByEnumeratingWithState:&v118 objects:v128 count:16];
  if (v27)
  {
    uint64_t v28 = *(void *)v119;
    unint64_t v29 = 1;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v119 != v28) {
          objc_enumerationMutation(obj);
        }
        v31 = *(void **)(*((void *)&v118 + 1) + 8 * i);
        v32 = [v31 contact];
        char v33 = [v99 containsObject:v32];

        if ((v33 & 1) == 0)
        {
          v34 = objc_alloc_init(_CDSuggestedPerson);
          [v31 score];
          -[_CDSuggestedPerson setScore:](v34, "setScore:");
          [(_CDSuggestedPerson *)v34 setRank:(double)v29];
          v127 = v31;
          v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v127 count:1];
          [(_CDSuggestedPerson *)v34 setInteractions:v35];

          v36 = [v31 contact];
          [(_CDSuggestedPerson *)v34 setContact:v36];

          v37 = [v31 bundleId];
          [(_CDSuggestedPerson *)v34 setInteractionBundleID:v37];

          [v98 addObject:v34];
          v38 = [(_CDSuggestedPerson *)v34 contact];
          [v99 addObject:v38];

          uint64_t v39 = [v98 count];
          LOBYTE(v39) = v39 == [v96 maxNumberOfPeopleSuggested];

          if (v39) {
            goto LABEL_33;
          }
          ++v29;
        }
      }
      uint64_t v27 = [obj countByEnumeratingWithState:&v118 objects:v128 count:16];
    }
    while (v27);
  }
LABEL_33:

  v100 = objc_opt_new();
  v40 = [(_CDPeopleSuggester *)v94 context];
  v41 = [v40 nearbyPeople];
  uint64_t v42 = [v41 count];

  if (v42)
  {
    v43 = [(_CDPeopleSuggester *)v94 context];
    v44 = [v43 nearbyPeople];
    v92 = (void *)[v44 mutableCopy];

    v95 = (void *)[v92 mutableCopy];
    v45 = v98;
    [v95 intersectSet:v99];
    if ([v95 count])
    {
      long long v116 = 0u;
      long long v117 = 0u;
      long long v114 = 0u;
      long long v115 = 0u;
      id v46 = v98;
      char v47 = 0;
      uint64_t v48 = [v46 countByEnumeratingWithState:&v114 objects:v126 count:16];
      if (v48)
      {
        uint64_t v49 = *(void *)v115;
        while (2)
        {
          for (uint64_t j = 0; j != v48; ++j)
          {
            if (*(void *)v115 != v49) {
              objc_enumerationMutation(v46);
            }
            v51 = *(void **)(*((void *)&v114 + 1) + 8 * j);
            v52 = [v51 contact];
            int v53 = [v95 containsObject:v52];

            if (!v53) {
              goto LABEL_50;
            }
            v54 = [v51 contact];
            [v95 removeObject:v54];

            long long v112 = 0u;
            long long v113 = 0u;
            long long v110 = 0u;
            long long v111 = 0u;
            v55 = [v51 interactions];
            uint64_t v56 = [v55 countByEnumeratingWithState:&v110 objects:v125 count:16];
            if (v56)
            {
              uint64_t v57 = *(void *)v111;
              do
              {
                for (uint64_t k = 0; k != v56; ++k)
                {
                  if (*(void *)v111 != v57) {
                    objc_enumerationMutation(v55);
                  }
                  [*(id *)(*((void *)&v110 + 1) + 8 * k) addReason:10];
                }
                uint64_t v56 = [v55 countByEnumeratingWithState:&v110 objects:v125 count:16];
              }
              while (v56);
            }

            [v51 rank];
            if (v59 > (double)v101)
            {
              [v100 insertObject:v51 atIndex:v101++];
              char v47 = 1;
            }
            else
            {
LABEL_50:
              [v100 addObject:v51];
            }
            if (![v95 count])
            {
              uint64_t v60 = [v46 indexOfObject:v51];
              v61 = objc_msgSend(v46, "subarrayWithRange:", v60 + 1, objc_msgSend(v46, "count") - (v60 + 1));
              [v100 addObjectsFromArray:v61];

              goto LABEL_57;
            }
          }
          uint64_t v48 = [v46 countByEnumeratingWithState:&v114 objects:v126 count:16];
          if (v48) {
            continue;
          }
          break;
        }
      }
LABEL_57:

      v45 = v98;
    }
    else
    {
      char v47 = 0;
    }
    [v92 minusSet:v99];
    if ([v92 count])
    {
      if ((v47 & 1) == 0)
      {
        id v62 = v45;

        v100 = v62;
      }
      long long v108 = 0u;
      long long v109 = 0u;
      long long v106 = 0u;
      long long v107 = 0u;
      id v63 = v92;
      uint64_t v64 = [v63 countByEnumeratingWithState:&v106 objects:v124 count:16];
      if (v64)
      {
        uint64_t v65 = *(void *)v107;
        do
        {
          for (uint64_t m = 0; m != v64; ++m)
          {
            if (*(void *)v107 != v65) {
              objc_enumerationMutation(v63);
            }
            uint64_t v67 = *(void *)(*((void *)&v106 + 1) + 8 * m);
            v68 = objc_alloc_init(_CDSuggestedPerson);
            [(_CDSuggestedPerson *)v68 setContact:v67];
            [(_CDSuggestedPerson *)v68 setInteractionBundleID:0];
            v69 = objc_alloc_init(_CDAdvisedInteraction);
            [(_CDAdvisedInteraction *)v69 setContact:v67];
            v70 = [(_CDSuggestedPerson *)v68 interactionBundleID];
            [(_CDAdvisedInteraction *)v69 setBundleId:v70];

            [(_CDSuggestedPerson *)v68 score];
            -[_CDAdvisedInteraction setScore:](v69, "setScore:");
            [(_CDAdvisedInteraction *)v69 addReason:10];
            v123 = v69;
            v71 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v123 count:1];
            [(_CDSuggestedPerson *)v68 setInteractions:v71];

            [v100 insertObject:v68 atIndex:v101 + m];
          }
          uint64_t v64 = [v63 countByEnumeratingWithState:&v106 objects:v124 count:16];
          v101 += m;
        }
        while (v64);
      }

      goto LABEL_71;
    }

    if (v47)
    {
LABEL_71:
      unint64_t v73 = [v100 count];
      unint64_t v74 = [v96 maxNumberOfPeopleSuggested];
      if (v73 >= v74) {
        unint64_t v75 = v74;
      }
      else {
        unint64_t v75 = v73;
      }
      v76 = objc_msgSend(v100, "subarrayWithRange:", 0, v75);
      v77 = (void *)[v76 mutableCopy];

      long long v104 = 0u;
      long long v105 = 0u;
      long long v102 = 0u;
      long long v103 = 0u;
      id v78 = v77;
      uint64_t v79 = [v78 countByEnumeratingWithState:&v102 objects:v122 count:16];
      if (v79)
      {
        uint64_t v80 = *(void *)v103;
        uint64_t v81 = 1;
        do
        {
          for (uint64_t n = 0; n != v79; ++n)
          {
            if (*(void *)v103 != v80) {
              objc_enumerationMutation(v78);
            }
            [*(id *)(*((void *)&v102 + 1) + 8 * n) setRank:(double)(unint64_t)(v81 + n)];
          }
          uint64_t v79 = [v78 countByEnumeratingWithState:&v102 objects:v122 count:16];
          v81 += n;
        }
        while (v79);
      }
      v72 = v78;

      goto LABEL_82;
    }
  }
  v72 = v98;
LABEL_82:
  v10 = (void *)[v72 copy];

  if (v94->_enableCaching)
  {
    v83 = objc_alloc_init(_CDCachedPeopleSuggestion);
    v84 = v94->_cache;
    v94->_cache = v83;

    v85 = [MEMORY[0x1E4F1C9C8] date];
    [(_CDCachedPeopleSuggestion *)v94->_cache setDate:v85];

    v86 = (void *)[v93 copy];
    [(_CDCachedPeopleSuggestion *)v94->_cache setContext:v86];

    v87 = (void *)[v96 copy];
    [(_CDCachedPeopleSuggestion *)v94->_cache setSettings:v87];

    [(_CDCachedPeopleSuggestion *)v94->_cache setSuggestions:v10];
  }
  v88 = +[_CDLogging interactionSignpost];
  if (os_signpost_enabled(v88))
  {
    uint64_t v89 = [v10 count];
    LODWORD(state.opaque[0]) = 134349056;
    *(uint64_t *)((char *)state.opaque + 4) = v89;
    _os_signpost_emit_with_name_impl(&dword_18ECEB000, v88, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SuggestPeople", "SuggestionsCount=%{signpost.telemetry:number1,public}lu", (uint8_t *)&state, 0xCu);
  }

LABEL_87:
  objc_sync_exit(v94);

  return v10;
}

+ (id)peopleSuggesterWithDirectDBAccess
{
  v2 = +[_CDLogging interactionChannel];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    +[_CDPeopleSuggester peopleSuggesterWithDirectDBAccess]();
  }

  v3 = +[_CDInteractionStore defaultDatabaseDirectory];
  v4 = +[_CDInteractionStore storeWithDirectory:v3 readOnly:1];
  int v5 = [v4 openAndCheckIfReadable];
  v6 = +[_CDLogging interactionChannel];
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v7) {
      +[_CDPeopleSuggester peopleSuggesterWithDirectDBAccess]();
    }
  }
  else if (v7)
  {
    +[_CDPeopleSuggester peopleSuggesterWithDirectDBAccess]();
  }

  v8 = +[_CDInteractionAdviceEngine interactionAdviceEngineWithStore:v4];
  v9 = [[_CDPeopleSuggester alloc] initWithAdvisor:v8];

  return v9;
}

+ (id)peopleSuggesterUsingDaemon
{
  v2 = +[_CDLogging interactionChannel];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    +[_CDPeopleSuggester peopleSuggesterUsingDaemon]();
  }

  v3 = objc_alloc_init(_CDPeopleSuggester);
  return v3;
}

- (_CDPeopleSuggester)init
{
  v3 = +[_CDInteractionAdvisor sharedInteractionAdvisor];
  v4 = [(_CDPeopleSuggester *)self initWithAdvisor:v3];

  return v4;
}

- (_CDPeopleSuggester)initWithAdvisor:(id)a3
{
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)_CDPeopleSuggester;
  id v6 = [(_CDPeopleSuggester *)&v23 init];
  if (v6)
  {
    BOOL v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.coreduet.people.suggest", v7);
    v9 = (void *)*((void *)v6 + 2);
    *((void *)v6 + 2) = v8;

    objc_storeStrong((id *)v6 + 1, a3);
    uint64_t v10 = +[_CDPeopleSuggesterContext currentContext];
    v11 = (void *)*((void *)v6 + 6);
    *((void *)v6 + 6) = v10;

    uint64_t v12 = +[_CDPeopleSuggesterSettings defaultSettings];
    v13 = (void *)*((void *)v6 + 7);
    *((void *)v6 + 7) = v12;

    v14 = (void *)*((void *)v6 + 3);
    *((void *)v6 + 3) = 0;

    *((unsigned char *)v6 + 44) = 1;
    *((void *)v6 + 8) = 0x403E000000000000;
    uint64_t v15 = objc_opt_new();
    uint64_t v16 = (void *)*((void *)v6 + 4);
    *((void *)v6 + 4) = v15;

    [v6 updateSettings];
    objc_initWeak(&location, v6);
    v17 = (const char *)[@"com.apple.coreduet.CDPeopleSettingsDidChange" UTF8String];
    v18 = *((void *)v6 + 2);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __38___CDPeopleSuggester_initWithAdvisor___block_invoke;
    v20[3] = &unk_1E560EEE8;
    objc_copyWeak(&v21, &location);
    notify_register_dispatch(v17, (int *)v6 + 10, v18, v20);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return (_CDPeopleSuggester *)v6;
}

- (void)dealloc
{
  notify_cancel(self->_settingsNotifyToken);
  v3.receiver = self;
  v3.super_class = (Class)_CDPeopleSuggester;
  [(_CDPeopleSuggester *)&v3 dealloc];
}

- (void)invalidateCache
{
  obuint64_t j = self;
  objc_sync_enter(obj);
  cache = obj->_cache;
  obj->_cache = 0;

  objc_sync_exit(obj);
}

- (BOOL)enableCaching
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL enableCaching = v2->_enableCaching;
  objc_sync_exit(v2);

  return enableCaching;
}

- (void)setEnableCaching:(BOOL)a3
{
  obuint64_t j = self;
  objc_sync_enter(obj);
  obj->_BOOL enableCaching = a3;
  if (!a3) {
    [(_CDPeopleSuggester *)obj invalidateCache];
  }
  objc_sync_exit(obj);
}

- (void)updateSettings
{
  id v9 = (id)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.CoreDuet"];
  objc_super v3 = [v9 valueForKey:@"com.apple.coreduet.peoplePrediction.heuristic.nearbyPeople"];
  v4 = v3;
  if (v3 && ([v3 BOOLValue] & 1) == 0)
  {
    id v5 = [(_CDPeopleSuggester *)self context];
    [v5 setNearbyPeople:0];
  }
  id v6 = [v9 valueForKey:@"com.apple.coreduet.peoplePrediction.heuristic.activeInteraction"];
  BOOL v7 = v6;
  if (v6 && ([v6 BOOLValue] & 1) == 0)
  {
    dispatch_queue_t v8 = [(_CDPeopleSuggester *)self context];
    [v8 setActiveInteraction:0];
  }
}

- (void)suggestPeopleWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = _os_activity_create(&dword_18ECEB000, "Duet: suggestPeople async", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v5, &state);
    os_activity_scope_leave(&state);

    id v6 = +[_CDLogging interactionSignpost];
    if (os_signpost_enabled(v6))
    {
      LOWORD(state.opaque[0]) = 0;
      _os_signpost_emit_with_name_impl(&dword_18ECEB000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SuggestPeopleAsync", " enableTelemetry=YES ", (uint8_t *)&state, 2u);
    }

    queue = self->_queue;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __57___CDPeopleSuggester_suggestPeopleWithCompletionHandler___block_invoke;
    v12[3] = &unk_1E560D618;
    v12[4] = self;
    id v13 = v4;
    dispatch_queue_t v8 = v12;
    id v9 = queue;
    uint64_t v10 = (void *)os_transaction_create();
    state.opaque[0] = MEMORY[0x1E4F143A8];
    state.opaque[1] = 3221225472;
    uint64_t v15 = __cd_dispatch_async_capture_tx_block_invoke_5;
    uint64_t v16 = &unk_1E560D978;
    id v17 = v10;
    id v18 = v8;
    id v11 = v10;
    dispatch_async(v9, &state);
  }
}

+ (id)restrictedPrefixForPrefix:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend(v3, "substringToIndex:", objc_msgSend(v3, "length") != 0);

  return v4;
}

+ (id)createAdvisorSettingsFromContext:(id)a3 settings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_t v8 = +[_CDInteractionAdvisorSettings interactionAdvisorSettingsDefault];
  id v9 = [v6 date];
  [v8 setInteractionDate:v9];

  uint64_t v10 = [v6 title];
  [v8 setInteractionTitle:v10];

  id v11 = [v6 seedContactIdentifiers];
  [v8 setSeedIdentifiers:v11];

  uint64_t v12 = [v6 locationUUID];
  [v8 setInteractionLocationUUID:v12];

  id v13 = [v6 contactPrefix];
  v14 = [a1 restrictedPrefixForPrefix:v13];
  [v8 setContactPrefix:v14];

  uint64_t v15 = [v7 constrainMechanisms];
  [v8 setConstrainMechanisms:v15];

  uint64_t v16 = [v7 constrainAccounts];
  [v8 setConstrainAccounts:v16];

  id v17 = [v7 constrainBundleIds];
  [v8 setConstrainBundleIds:v17];

  id v18 = [v7 constrainDomainIdentifiers];
  [v8 setConstrainDomainIdentifiers:v18];

  objc_msgSend(v8, "setResultLimit:", objc_msgSend(v7, "maxNumberOfPeopleSuggested"));
  v19 = [v7 constrainIdentifiers];
  [v8 setConstrainIdentifiers:v19];

  v20 = [v7 constrainPersonIds];
  [v8 setConstrainPersonIds:v20];

  id v21 = [v7 constrainPersonIdType];
  [v8 setConstrainPersonIdType:v21];

  v22 = [v7 ignoreContactIdentifiers];
  [v8 setIgnoreContactIdentifiers:v22];

  objc_msgSend(v8, "setUseFuture:", objc_msgSend(v7, "useFuture"));
  objc_msgSend(v8, "setAggregateByIdentifier:", objc_msgSend(v7, "aggregateByIdentifier"));
  objc_msgSend(v8, "setRequireOutgoingInteraction:", objc_msgSend(v7, "requireOutgoingInteraction"));
  objc_msgSend(v8, "setConstrainMaxRecipientCount:", objc_msgSend(v7, "constrainMaxRecipientCount"));
  objc_super v23 = [v6 consumerIdentifier];
  [v8 setConsumerIdentifier:v23];

  LODWORD(v23) = [v7 useTitleToContrainKeywords];
  if (v23)
  {
    v24 = [v6 title];

    if (v24)
    {
      v25 = [v6 title];
      v26 = +[_CDStringTokenizer extractNormalizedKeywords:v25];
      [v8 setConstrainKeywords:v26];
    }
  }

  return v8;
}

+ (id)loggingTagForAutocompleteFeedback
{
  return @"Model0";
}

- (_CDPeopleSuggesterContext)context
{
  return (_CDPeopleSuggesterContext *)objc_getProperty(self, a2, 48, 1);
}

- (void)setContext:(id)a3
{
}

- (_CDPeopleSuggesterSettings)settings
{
  return (_CDPeopleSuggesterSettings *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSettings:(id)a3
{
}

- (double)cacheTimeoutSeconds
{
  return self->_cacheTimeoutSeconds;
}

- (void)setCacheTimeoutSeconds:(double)a3
{
  self->_cacheTimeoutSeconds = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_receiver, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_advisor, 0);
}

+ (void)peopleSuggesterWithDirectDBAccess
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_18ECEB000, v0, v1, "Creating _CDPeopleSuggester with direct access", v2, v3, v4, v5, v6);
}

+ (void)peopleSuggesterUsingDaemon
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_18ECEB000, v0, v1, "Creating _CDPeopleSuggester using coreduetd", v2, v3, v4, v5, v6);
}

- (void)suggestPeopleWithError:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_18ECEB000, v0, v1, "_CDPeopleSuggester: Prioritizing active interaction", v2, v3, v4, v5, v6);
}

- (void)suggestPeopleWithError:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_18ECEB000, v0, v1, "_CDPeopleSuggester: Using cached results", v2, v3, v4, v5, v6);
}

- (void)suggestPeopleWithError:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_18ECEB000, v0, v1, "_CDPeopleSuggester: Cache miss", v2, v3, v4, v5, v6);
}

- (void)suggestPeopleWithError:(void *)a1 .cold.4(void *a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 context];
  uint64_t v5 = [a1 settings];
  int v6 = 138412546;
  id v7 = v4;
  __int16 v8 = 2114;
  id v9 = v5;
  _os_log_debug_impl(&dword_18ECEB000, a2, OS_LOG_TYPE_DEBUG, "_CDPeopleSuggester:suggestPeopleWithError. context: %@, settings: %{public}@", (uint8_t *)&v6, 0x16u);
}

@end