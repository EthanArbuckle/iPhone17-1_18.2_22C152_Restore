@interface CDInMemoryContext
@end

@implementation CDInMemoryContext

void __53___CDInMemoryContext_propertiesForContextualKeyPath___block_invoke(void *a1)
{
  id v5 = [*(id *)(a1[4] + 32) objectForKeyedSubscript:a1[5]];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t __94___CDInMemoryContext_unsafe_evalutateRegistrationPredicate_previousContextValue_date_keyPath___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _os_activity_create(&dword_18EC9B000, "Duet: ContextStore Callback", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  *(void *)v17 = 0;
  *(void *)&v17[8] = 0;
  os_activity_scope_enter(v2, (os_activity_scope_state_t)v17);
  os_activity_scope_leave((os_activity_scope_state_t)v17);

  uint64_t v3 = [*(id *)(a1 + 32) clientIdentifier];

  v4 = [MEMORY[0x1E4F5B418] contextChannel];
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (!v5) {
      goto LABEL_7;
    }
    v6 = [*(id *)(a1 + 32) clientIdentifier];
    v7 = [*(id *)(a1 + 32) identifier];
    uint64_t v8 = *(void *)(a1 + 40);
    *(_DWORD *)v17 = 138543874;
    *(void *)&v17[4] = v6;
    *(_WORD *)&v17[12] = 2112;
    *(void *)&v17[14] = v7;
    __int16 v18 = 2114;
    uint64_t v19 = v8;
    _os_log_impl(&dword_18EC9B000, v4, OS_LOG_TYPE_INFO, "Executing callback for client: %{public}@, registration: %@, based on keypath change: %{public}@", v17, 0x20u);
  }
  else
  {
    if (!v5) {
      goto LABEL_7;
    }
    v6 = [*(id *)(a1 + 32) identifier];
    uint64_t v9 = *(void *)(a1 + 40);
    *(_DWORD *)v17 = 138412546;
    *(void *)&v17[4] = v6;
    *(_WORD *)&v17[12] = 2114;
    *(void *)&v17[14] = v9;
    _os_log_impl(&dword_18EC9B000, v4, OS_LOG_TYPE_INFO, "Executing callback for registration: %@, based on keypath change: %{public}@", v17, 0x16u);
  }

LABEL_7:
  v10 = [*(id *)(a1 + 32) identifier];
  v11 = [*(id *)(a1 + 40) key];
  _cdcontextstore_signpost_evaluateCallback_begin();

  v12 = [*(id *)(a1 + 32) informativeCallback];

  if (v12)
  {
    v13 = [*(id *)(a1 + 32) informativeCallback];
    v14 = [*(id *)(a1 + 32) identifier];
    ((void (**)(void, void *, void))v13)[2](v13, v14, *(void *)(a1 + 48));
  }
  else
  {
    uint64_t v15 = *(void *)(a1 + 64);
    v13 = [*(id *)(a1 + 32) identifier];
    (*(void (**)(uint64_t, void (**)(void, void, void)))(v15 + 16))(v15, v13);
  }

  return _cdcontextstore_signpost_evaluateCallback_end();
}

uint64_t __41___CDInMemoryContext_deregisterCallback___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) identifier];
  _cdcontextstore_signpost_deregister_begin();

  uint64_t v3 = objc_msgSend(*(id *)(a1 + 40), "unsafe_deregisterCallback:", *(void *)(a1 + 32));
  return MEMORY[0x1F4113B30](v3);
}

uint64_t __84___CDInMemoryContext_addObjects_andRemoveObjects_fromArrayAtKeyPath_valueDidChange___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "unsafe_addObjects:andRemoveObjects:fromArrayAtKeyPath:valueDidChange:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(*(void *)(a1 + 72) + 8) + 24);
  return MEMORY[0x1F41817F8]();
}

uint64_t __70___CDInMemoryContext_setObject_returningMetadataForContextualKeyPath___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "unsafe_setObject:returningMetadataForContextualKeyPath:", *(void *)(a1 + 40), *(void *)(a1 + 48));
  return MEMORY[0x1F41817F8]();
}

void __66___CDInMemoryContext_locationCoordinatorCircularRegionsDidChange___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) userInfo];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"previousRegistrationRegionInfos"];

  v4 = [*(id *)(v1 + 32) userInfo];
  v35 = [v4 objectForKeyedSubscript:@"regionStateChangeDate"];

  id v34 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  obuint64_t j = v3;
  uint64_t v38 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
  if (v38)
  {
    uint64_t v36 = v1;
    uint64_t v37 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v38; uint64_t i = v28 + 1)
      {
        if (*(void *)v52 != v37) {
          objc_enumerationMutation(obj);
        }
        uint64_t v41 = i;
        uint64_t v42 = *(void *)(*((void *)&v51 + 1) + 8 * i);
        v6 = objc_msgSend(obj, "objectForKeyedSubscript:");
        v7 = [MEMORY[0x1E4F1C9C8] distantPast];
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        id v8 = v6;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v47 objects:v56 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v48;
          do
          {
            for (uint64_t j = 0; j != v10; ++j)
            {
              if (*(void *)v48 != v11) {
                objc_enumerationMutation(v8);
              }
              v13 = *(void **)(*((void *)&v47 + 1) + 8 * j);
              v14 = +[_CDContextQueries changeDateKey];
              uint64_t v15 = [v13 objectForKeyedSubscript:v14];

              if (v15 && [v7 compare:v15] == -1)
              {
                id v16 = v15;

                v7 = v16;
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v47 objects:v56 count:16];
          }
          while (v10);
        }

        v17 = objc_alloc_init(_CDContextValue);
        [(_CDContextValue *)v17 setValue:v8];
        [(_CDContextValue *)v17 setLastModifiedDate:v7];
        long long v45 = 0u;
        long long v46 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        __int16 v18 = *(void **)(*(void *)(v1 + 40) + 48);
        uint64_t v19 = +[_CDContextQueries keyPathForCircularLocationRegions];
        uint64_t v20 = [v18 objectForKeyedSubscript:v19];

        uint64_t v21 = [v20 countByEnumeratingWithState:&v43 objects:v55 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          v39 = v17;
          uint64_t v23 = *(void *)v44;
LABEL_18:
          uint64_t v24 = 0;
          while (1)
          {
            if (*(void *)v44 != v23) {
              objc_enumerationMutation(v20);
            }
            v25 = *(void **)(*((void *)&v43 + 1) + 8 * v24);
            v26 = [v25 identifier];
            char v27 = [v26 isEqualToString:v42];

            if (v27) {
              break;
            }
            if (v22 == ++v24)
            {
              uint64_t v22 = [v20 countByEnumeratingWithState:&v43 objects:v55 count:16];
              if (v22) {
                goto LABEL_18;
              }
              uint64_t v1 = v36;
              uint64_t v28 = v41;
              v17 = v39;
              goto LABEL_28;
            }
          }
          id v29 = v25;

          uint64_t v1 = v36;
          uint64_t v28 = v41;
          v17 = v39;
          if (!v29) {
            goto LABEL_29;
          }
          [v34 addObject:v29];
          v30 = *(void **)(v36 + 40);
          v31 = +[_CDContextQueries keyPathForCircularLocationRegions];
          objc_msgSend(v30, "unsafe_evalutateRegistrationPredicate:previousContextValue:date:keyPath:", v29, v39, v35, v31);

          uint64_t v20 = v29;
        }
        else
        {
          uint64_t v28 = v41;
        }
LABEL_28:

LABEL_29:
      }
      uint64_t v38 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
    }
    while (v38);
  }

  v32 = *(void **)(v1 + 40);
  v33 = (void *)[v34 copy];
  objc_msgSend(v32, "unsafe_registerFutureSystemTimeBasedCallbacksForRegistrations:date:", v33, v35);
}

void __54___CDInMemoryContext_hasKnowledgeOfContextualKeyPath___block_invoke(uint64_t a1)
{
  id v4 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "unsafe_evaluatedContextWithRegistration:date:", 0, v4);
  uint64_t v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v3 != 0;
}

void __49___CDInMemoryContext_objectForContextualKeyPath___block_invoke(void *a1)
{
  id v6 = [*(id *)(a1[4] + 32) objectForKeyedSubscript:a1[5]];
  uint64_t v2 = [v6 value];
  uint64_t v3 = [v2 copy];
  uint64_t v4 = *(void *)(a1[6] + 8);
  BOOL v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __59___CDInMemoryContext_setContextValue_forContextualKeyPath___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 32) objectForKeyedSubscript:a1[5]];

  if (!v2)
  {
    uint64_t v4 = a1[5];
    uint64_t v3 = a1[6];
    BOOL v5 = *(void **)(a1[4] + 32);
    [v5 setObject:v3 forKeyedSubscript:v4];
  }
}

uint64_t __53___CDInMemoryContext_setObject_forContextualKeyPath___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "unsafe_setObject:returningMetadataForContextualKeyPath:", *(void *)(a1 + 40), *(void *)(a1 + 48));
  return MEMORY[0x1F41817F8]();
}

void __59___CDInMemoryContext_lastModifiedDateForContextualKeyPath___block_invoke(void *a1)
{
  id v5 = [*(id *)(a1[4] + 32) objectForKeyedSubscript:a1[5]];
  uint64_t v2 = [v5 lastModifiedDate];
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __87___CDInMemoryContext_removeObjectsMatchingPredicate_fromArrayAtKeyPath_removedObjects___block_invoke(uint64_t a1)
{
  id v13 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v13);
  if (*(void *)(a1 + 48))
  {
    if (!v13) {
      goto LABEL_5;
    }
    uint64_t v2 = [v13 value];
    if (!v2
      || (uint64_t v3 = (void *)v2,
          [v13 value],
          uint64_t v4 = objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          char isKindOfClass = objc_opt_isKindOfClass(),
          v4,
          v3,
          (isKindOfClass & 1) != 0))
    {
LABEL_5:
      id v6 = [v13 value];
      uint64_t v7 = [v6 filteredArrayUsingPredicate:*(void *)(a1 + 48)];
      uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
      uint64_t v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;

      uint64_t v10 = objc_msgSend(*(id *)(a1 + 32), "unsafe_addObjects:andRemoveObjects:fromArrayAtKeyPath:valueDidChange:", 0, *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), *(void *)(a1 + 40), 0);
      uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
      v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;
    }
  }
}

void __45___CDInMemoryContext_addCallback_forKeyPath___block_invoke(id *a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v3 = _os_activity_create(&dword_18EC9B000, "Duet: ContextStore Register", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  *(void *)__int16 v18 = 0;
  *(void *)&v18[8] = 0;
  os_activity_scope_enter(v3, (os_activity_scope_state_t)v18);
  os_activity_scope_leave((os_activity_scope_state_t)v18);

  uint64_t v4 = [a1[4] clientIdentifier];

  id v5 = [MEMORY[0x1E4F5B418] contextChannel];
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (!v6) {
      goto LABEL_7;
    }
    uint64_t v7 = [a1[4] clientIdentifier];
    uint64_t v8 = [a1[4] identifier];
    *(_DWORD *)__int16 v18 = 138543618;
    *(void *)&v18[4] = v7;
    *(_WORD *)&v18[12] = 2112;
    *(void *)&v18[14] = v8;
    _os_log_impl(&dword_18EC9B000, v5, OS_LOG_TYPE_INFO, "Registering callback for client: %{public}@, registration: %@", v18, 0x16u);
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    uint64_t v7 = [a1[4] identifier];
    *(_DWORD *)__int16 v18 = 138412290;
    *(void *)&v18[4] = v7;
    _os_log_impl(&dword_18EC9B000, v5, OS_LOG_TYPE_INFO, "Registering callback for registration: %@", v18, 0xCu);
  }

LABEL_7:
  uint64_t v9 = [a1[4] identifier];
  uint64_t v10 = [a1[5] key];
  _cdcontextstore_signpost_register_begin();

  id v11 = [*((id *)a1[6] + 6) objectForKeyedSubscript:a1[5]];
  if (!v11)
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
    [*((id *)a1[6] + 6) setObject:v11 forKeyedSubscript:a1[5]];
  }
  if ([v11 containsObject:a1[4]]) {
    objc_msgSend(a1[6], "unsafe_deregisterCallback:", a1[4]);
  }
  uint64_t v12 = objc_msgSend(v11, "indexOfObject:inSortedRange:options:usingComparator:", a1[4], 0, objc_msgSend(v11, "count"), 1024, &__block_literal_global_19);
  if (v12 != 0x7FFFFFFFFFFFFFFFLL) {
    [v11 insertObject:a1[4] atIndex:v12];
  }
  id v13 = a1[5];
  v14 = +[_CDContextQueries keyPathForSystemTime];
  LODWORD(v13) = [v13 isEqual:v14];

  if (v13) {
    objc_msgSend(a1[6], "unsafe_registerFutureSystemTimeBasedCallbacksForRegistration:date:", a1[4], v2);
  }
  id v15 = a1[5];
  id v16 = +[_CDContextQueries keyPathForCircularLocationRegions];
  LODWORD(v15) = [v15 isEqual:v16];

  if (v15)
  {
    v17 = [a1[6] locationRegistrationMonitor];
    [v17 addRegistration:a1[4]];
  }
  _cdcontextstore_signpost_register_end();
}

uint64_t __45___CDInMemoryContext_addCallback_forKeyPath___block_invoke_27(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = NSNumber;
  id v5 = a2;
  BOOL v6 = objc_msgSend(v4, "numberWithUnsignedInt:", objc_msgSend(a3, "qualityOfService"));
  uint64_t v7 = NSNumber;
  uint64_t v8 = [v5 qualityOfService];

  uint64_t v9 = [v7 numberWithUnsignedInt:v8];
  uint64_t v10 = [v6 compare:v9];

  return v10;
}

void __45___CDInMemoryContext_evaluatePredicate_date___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "unsafe_evaluatedContextWithRegistration:date:", 0, *(void *)(a1 + 40));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 48) evaluateWithState:v2 previousValue:0];
}

uint64_t __91___CDInMemoryContext_evalutateRegistrationPredicatesWithPreviousContextValue_date_keyPath___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "unsafe_evalutateRegistrationPredicatesWithPreviousContextValue:date:keyPath:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
}

void __38___CDInMemoryContext_allRegistrations__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 48);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "objectForKeyedSubscript:", *(void *)(*((void *)&v10 + 1) + 8 * v6), (void)v10);
        if ([v7 count])
        {
          uint64_t v8 = *(void **)(a1 + 40);
          uint64_t v9 = [v7 array];
          [v8 addObjectsFromArray:v9];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

@end