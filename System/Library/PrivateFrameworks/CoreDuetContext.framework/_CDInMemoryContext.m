@interface _CDInMemoryContext
+ (id)context;
+ (id)contextWithDeviceID:(id)a3;
- (BOOL)addObjects:(id)a3 andRemoveObjects:(id)a4 fromArrayAtKeyPath:(id)a5;
- (BOOL)addObjects:(id)a3 toArrayAtKeyPath:(id)a4;
- (BOOL)evaluatePredicate:(id)a3 date:(id)a4;
- (BOOL)hasKnowledgeOfContextualKeyPath:(id)a3;
- (BOOL)removeObjects:(id)a3 fromArrayAtKeyPath:(id)a4;
- (BOOL)setObject:(id)a3 forContextualKeyPath:(id)a4;
- (NSMutableDictionary)context;
- (NSMutableDictionary)registrations;
- (NSString)deviceID;
- (OS_dispatch_queue)syncQueue;
- (OS_dispatch_workloop)callbackWorkloop;
- (_CDContextualLocationRegistrationMonitor)locationRegistrationMonitor;
- (_CDDevice)device;
- (_CDInMemoryContext)init;
- (_CDSystemTimeCallbackScheduler)systemTimeCallbackScheduler;
- (id)addObjects:(id)a3 andRemoveObjects:(id)a4 fromArrayAtKeyPath:(id)a5 valueDidChange:(BOOL *)a6;
- (id)allRegistrations;
- (id)description;
- (id)lastModifiedDateForContextualKeyPath:(id)a3;
- (id)objectForContextualKeyPath:(id)a3;
- (id)propertiesForContextualKeyPath:(id)a3;
- (id)removeObjectsMatchingPredicate:(id)a3 fromArrayAtKeyPath:(id)a4;
- (id)removeObjectsMatchingPredicate:(id)a3 fromArrayAtKeyPath:(id)a4 removedObjects:(id *)a5;
- (id)setObject:(id)a3 returningMetadataForContextualKeyPath:(id)a4;
- (id)unsafe_addObjects:(id)a3 andRemoveObjects:(id)a4 fromArrayAtKeyPath:(id)a5 valueDidChange:(BOOL *)a6;
- (id)unsafe_evaluatedContextWithRegistration:(id)a3 date:(id)a4;
- (id)unsafe_setObject:(id)a3 returningMetadataForContextualKeyPath:(id)a4;
- (void)addCallback:(id)a3 forKeyPath:(id)a4;
- (void)dealloc;
- (void)deregisterCallback:(id)a3;
- (void)evalutateRegistrationPredicatesWithPreviousContextValue:(id)a3 date:(id)a4 keyPath:(id)a5;
- (void)locationCoordinatorCircularRegionsDidChange:(id)a3;
- (void)receiveSystemTimeCallback:(id)a3;
- (void)registerCallback:(id)a3;
- (void)setCallbackWorkloop:(id)a3;
- (void)setContext:(id)a3;
- (void)setContextValue:(id)a3 forContextualKeyPath:(id)a4;
- (void)setDevice:(id)a3;
- (void)setDeviceID:(id)a3;
- (void)setLocationRegistrationMonitor:(id)a3;
- (void)setRegistrations:(id)a3;
- (void)setSyncQueue:(id)a3;
- (void)setSystemTimeCallbackScheduler:(id)a3;
- (void)unsafe_deregisterCallback:(id)a3;
- (void)unsafe_deregisterForSystemTimeBasedCallbacksForRegistration:(id)a3;
- (void)unsafe_evalutateRegistrationPredicate:(id)a3 previousContextValue:(id)a4 date:(id)a5 keyPath:(id)a6;
- (void)unsafe_evalutateRegistrationPredicatesWithPreviousContextValue:(id)a3 date:(id)a4 keyPath:(id)a5;
- (void)unsafe_registerFutureSystemTimeBasedCallbacksForRegistration:(id)a3 date:(id)a4;
- (void)unsafe_registerFutureSystemTimeBasedCallbacksForRegistrations:(id)a3 date:(id)a4;
@end

@implementation _CDInMemoryContext

- (id)propertiesForContextualKeyPath:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53___CDInMemoryContext_propertiesForContextualKeyPath___block_invoke;
  block[3] = &unk_1E56094B8;
  id v10 = v4;
  v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(syncQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)unsafe_evalutateRegistrationPredicate:(id)a3 previousContextValue:(id)a4 date:(id)a5 keyPath:(id)a6
{
  uint64_t v114 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  unint64_t v11 = (unint64_t)a4;
  id v12 = a5;
  id v13 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_syncQueue);
  v95 = self;
  v97 = [(_CDInMemoryContext *)self unsafe_evaluatedContextWithRegistration:v10 date:v12];
  uint64_t v14 = [v97 objectForKeyedSubscript:v13];
  v15 = +[_CDContextQueries keyPathForSystemTime];
  int v16 = [v13 isEqual:v15];

  v94 = (void *)v14;
  if ((v16 & 1) == 0)
  {
    if (!(v11 | v14)
      || v11
      && v14
      && ([(id)v14 value],
          v20 = objc_claimAutoreleasedReturnValue(),
          [(id)v11 value],
          v21 = objc_claimAutoreleasedReturnValue(),
          int v22 = [v20 isEqual:v21],
          v21,
          v20,
          v22))
    {
      id v17 = [v10 predicate];
      int v18 = [v17 evaluateOnEveryKeyPathUpdate];

      if (!v18) {
        goto LABEL_59;
      }
      v19 = [MEMORY[0x1E4F5B418] contextChannel];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        -[_CDInMemoryContext unsafe_evalutateRegistrationPredicate:previousContextValue:date:keyPath:](v19);
      }
    }
  }
  v23 = [v10 predicate];
  char v24 = [v23 firesOnAnyChange];

  v96 = v13;
  if (v24) {
    goto LABEL_11;
  }
  v26 = [v10 predicate];
  v27 = [v26 keyPaths];

  long long v110 = 0u;
  long long v111 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  id v28 = v27;
  uint64_t v29 = [v28 countByEnumeratingWithState:&v108 objects:v113 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v109;
    while (2)
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v109 != v31) {
          objc_enumerationMutation(v28);
        }
        v33 = [v97 objectForKeyedSubscript:*(void *)(*((void *)&v108 + 1) + 8 * i)];

        if (!v33)
        {
          id v38 = v28;
          id v13 = v96;
          goto LABEL_58;
        }
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v108 objects:v113 count:16];
      if (v30) {
        continue;
      }
      break;
    }
  }

  v34 = [v10 predicate];
  v35 = v34;
  id v36 = v16 ? 0 : (id)v11;
  int v37 = [v34 evaluateWithState:v97 previousValue:v36];

  id v13 = v96;
  if (v37)
  {
LABEL_11:
    if (v16)
    {
      v25 = [MEMORY[0x1E4F5B418] mdcsChannel];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
        -[_CDInMemoryContext unsafe_evalutateRegistrationPredicate:previousContextValue:date:keyPath:]((uint64_t)v10, v25);
      }

      [(_CDInMemoryContext *)v95 unsafe_deregisterCallback:v10];
    }
    else
    {
      v39 = [v10 predicate];
      [v39 minimumDurationInPreviousState];
      double v41 = v40;

      if (v11 && v41 > 2.22507386e-308)
      {
        v42 = [(id)v11 lastModifiedDate];
        if (!v42
          || ([(id)v11 metadata],
              v43 = objc_claimAutoreleasedReturnValue(),
              [v43 objectForKeyedSubscript:@"_CDContextMetadataKeyFirstValueAfterReboot"],
              v44 = objc_claimAutoreleasedReturnValue(),
              int v45 = [v44 BOOLValue],
              v44,
              v43,
              v45))
        {
          uint64_t v46 = [MEMORY[0x1E4F1C9C8] distantPast];

          v42 = (void *)v46;
        }
        [v12 timeIntervalSinceDate:v42];
        double v48 = v47;
        v49 = [v10 predicate];
        [v49 minimumDurationInPreviousState];
        double v51 = v50;

        if (v48 < v51) {
          goto LABEL_59;
        }
      }
    }
    v52 = [v10 informativeCallback];

    if (v52)
    {
      id v91 = v12;
      v53 = (void *)MEMORY[0x1E4F1CA60];
      v54 = [v10 predicate];
      v55 = [v54 keyPaths];
      v56 = objc_msgSend(v53, "dictionaryWithCapacity:", objc_msgSend(v55, "count") + 4);

      v92 = (void *)v11;
      v57 = (void *)[(id)v11 copy];
      [v56 setObject:v57 forKeyedSubscript:@"OldValue"];

      long long v106 = 0u;
      long long v107 = 0u;
      long long v104 = 0u;
      long long v105 = 0u;
      id v93 = v10;
      v58 = [v10 predicate];
      v59 = [v58 keyPaths];

      uint64_t v60 = [v59 countByEnumeratingWithState:&v104 objects:v112 count:16];
      if (v60)
      {
        uint64_t v61 = v60;
        v62 = 0;
        uint64_t v63 = *(void *)v105;
        do
        {
          for (uint64_t j = 0; j != v61; ++j)
          {
            if (*(void *)v105 != v63) {
              objc_enumerationMutation(v59);
            }
            id v65 = *(id *)(*((void *)&v104 + 1) + 8 * j);
            v66 = [v97 objectForKeyedSubscript:v65];
            v67 = [v65 deviceID];

            if (!v67)
            {
              v68 = (void *)[v65 copy];

              [v68 setDeviceID:v95->_deviceID];
              id v65 = v68;
            }
            v69 = (void *)[v66 copy];

            if ([v65 isEqual:v96])
            {
              v70 = [v96 deviceID];

              if (v70)
              {
                v71 = (void *)[v65 copy];

                v72 = [v96 deviceID];
                [v71 setDeviceID:v72];

                id v65 = v71;
              }
              [v56 setObject:v65 forKeyedSubscript:@"KeyPath"];
              [v56 setObject:v69 forKeyedSubscript:@"NewValue"];
              id v73 = v69;

              v62 = v73;
            }
            [v56 setObject:v69 forKeyedSubscript:v65];
          }
          uint64_t v61 = [v59 countByEnumeratingWithState:&v104 objects:v112 count:16];
        }
        while (v61);
      }
      else
      {
        v62 = 0;
      }

      unint64_t v11 = (unint64_t)v92;
      if (v92)
      {
        uint64_t v74 = [v92 value];
        id v10 = v93;
        if (!v74) {
          goto LABEL_54;
        }
        v75 = (void *)v74;
        v76 = [v92 value];
        v77 = [MEMORY[0x1E4F1CA98] null];
        char v78 = [v76 isEqual:v77];

        if ((v78 & 1) == 0)
        {
          if (v62)
          {
            uint64_t v86 = [v62 value];
            v79 = _CDInformativeContextualChangeRemoval;
            if (v86)
            {
              v87 = (void *)v86;
              v88 = [v62 value];
              v89 = [MEMORY[0x1E4F1CA98] null];
              int v90 = [v88 isEqual:v89];

              if (!v90) {
                v79 = _CDInformativeContextualChangeReplacement;
              }
            }
          }
          else
          {
            v79 = _CDInformativeContextualChangeRemoval;
          }
        }
        else
        {
LABEL_54:
          v79 = _CDInformativeContextualChangeInsertion;
        }
      }
      else
      {
        v79 = _CDInformativeContextualChangeInsertion;
        id v10 = v93;
      }
      [v56 setObject:*v79 forKeyedSubscript:@"Kind"];
      v52 = (void *)[v56 copy];

      id v12 = v91;
      id v13 = v96;
    }
    v80 = [v10 callback];
    v81 = (void *)os_transaction_create();
    dispatch_qos_class_t v82 = [v10 qualityOfService];
    callbackWorkloop = v95->_callbackWorkloop;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __94___CDInMemoryContext_unsafe_evalutateRegistrationPredicate_previousContextValue_date_keyPath___block_invoke;
    block[3] = &unk_1E56095C8;
    id v99 = v10;
    id v100 = v13;
    id v101 = v52;
    id v102 = v81;
    id v103 = v80;
    id v84 = v81;
    id v28 = v80;
    id v38 = v52;
    dispatch_block_t v85 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v82, -15, block);
    dispatch_async(callbackWorkloop, v85);

LABEL_58:
  }
LABEL_59:
}

- (id)unsafe_setObject:(id)a3 returningMetadataForContextualKeyPath:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  unint64_t v6 = (unint64_t)a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_syncQueue);
  v8 = _os_activity_create(&dword_18EC9B000, "Duet: ContextStore setObject:forContextualKeyPath:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  *(void *)v23 = 0;
  *(void *)&v23[8] = 0;
  os_activity_scope_enter(v8, (os_activity_scope_state_t)v23);
  os_activity_scope_leave((os_activity_scope_state_t)v23);

  v9 = [MEMORY[0x1E4F5B418] contextChannel];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    if ([(id)v6 conformsToProtocol:&unk_1EDDEDEA8])
    {
      id v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
    }
    else
    {
      _CDRedactedObjectForKeyPath(v7, (void *)v6);
    unint64_t v11 = };
    *(_DWORD *)v23 = 138543618;
    *(void *)&v23[4] = v7;
    *(_WORD *)&v23[12] = 2112;
    *(void *)&v23[14] = v11;
    _os_log_impl(&dword_18EC9B000, v9, OS_LOG_TYPE_INFO, "Setting value for %{public}@: %@", v23, 0x16u);
  }
  id v12 = [v7 key];
  _cdcontextstore_signpost_set_object_begin();

  id v13 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v14 = [(NSMutableDictionary *)self->_context objectForKeyedSubscript:v7];
  uint64_t v15 = [v14 value];
  int v16 = (void *)v15;
  if (v6 | v15)
  {
    if (!v6 || !v15 || ![(id)v6 isEqual:v15]) {
      goto LABEL_13;
    }
    id v17 = [MEMORY[0x1E4F5B418] contextChannel];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v23 = 138543362;
      *(void *)&v23[4] = v7;
      _os_log_impl(&dword_18EC9B000, v17, OS_LOG_TYPE_INFO, "Setting value for %{public}@ is equal to previous value", v23, 0xCu);
    }

    if (([v7 isEphemeral] & 1) == 0)
    {
      _cdcontextstore_signpost_set_object_end();
      v21 = v14;
    }
    else
    {
LABEL_13:
      int v18 = objc_alloc_init(_CDContextValue);
      v19 = (void *)[(id)v6 copy];
      [(_CDContextValue *)v18 setValue:v19];

      [(_CDContextValue *)v18 setLastModifiedDate:v13];
      if (!v14)
      {
        v20 = [(_CDContextValue *)v18 metadata];
        [v20 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"_CDContextMetadataKeyFirstValueAfterReboot"];
      }
      [(NSMutableDictionary *)self->_context setObject:v18 forKeyedSubscript:v7];
      v21 = v18;
      [(_CDInMemoryContext *)self unsafe_evalutateRegistrationPredicatesWithPreviousContextValue:v14 date:v13 keyPath:v7];
      _cdcontextstore_signpost_set_object_end();
    }
  }
  else
  {
    _cdcontextstore_signpost_set_object_end();
    v21 = 0;
  }

  return v21;
}

- (id)unsafe_evaluatedContextWithRegistration:(id)a3 date:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_syncQueue);
  v8 = (void *)[(NSMutableDictionary *)self->_context mutableCopy];
  v9 = objc_alloc_init(_CDContextValue);
  [(_CDContextValue *)v9 setValue:v7];
  [(_CDContextValue *)v9 setLastModifiedDate:v7];
  id v10 = +[_CDContextQueries keyPathForSystemTime];
  [v8 setObject:v9 forKeyedSubscript:v10];

  unint64_t v11 = [v6 locationManagerEffectiveBundleID];
  if (v11)
  {
    id v12 = [(_CDInMemoryContext *)self locationRegistrationMonitor];
    id v13 = [v12 regionInfosForRegistration:v6];

    uint64_t v14 = objc_alloc_init(_CDContextValue);
    [(_CDContextValue *)v14 setValue:v13];
    [(_CDContextValue *)v14 setLastModifiedDate:v7];
    uint64_t v15 = +[_CDContextQueries keyPathForCircularLocationRegions];
    [v8 setObject:v14 forKeyedSubscript:v15];
  }
  int v16 = (void *)[v8 copy];

  return v16;
}

- (void)unsafe_evalutateRegistrationPredicatesWithPreviousContextValue:(id)a3 date:(id)a4 keyPath:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_syncQueue);
  unint64_t v11 = [(NSMutableDictionary *)self->_registrations objectForKeyedSubscript:v10];
  id v12 = (void *)[v11 copy];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v13 = v12;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        -[_CDInMemoryContext unsafe_evalutateRegistrationPredicate:previousContextValue:date:keyPath:](self, "unsafe_evalutateRegistrationPredicate:previousContextValue:date:keyPath:", *(void *)(*((void *)&v18 + 1) + 8 * v17++), v8, v9, v10, (void)v18);
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v15);
  }

  [(_CDInMemoryContext *)self unsafe_registerFutureSystemTimeBasedCallbacksForRegistrations:v13 date:v9];
}

- (void)unsafe_registerFutureSystemTimeBasedCallbacksForRegistrations:(id)a3 date:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v17 = self;
  id v18 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_syncQueue);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v13 = objc_msgSend(v12, "predicate", v17);
        uint64_t v14 = [v13 keyPaths];
        uint64_t v15 = +[_CDContextQueries keyPathForSystemTime];
        int v16 = [v14 containsObject:v15];

        if (v16) {
          [(_CDInMemoryContext *)v17 unsafe_registerFutureSystemTimeBasedCallbacksForRegistration:v12 date:v18];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }
}

- (id)setObject:(id)a3 returningMetadataForContextualKeyPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  long long v20 = __Block_byref_object_copy_;
  long long v21 = __Block_byref_object_dispose_;
  id v22 = 0;
  syncQueue = self->_syncQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __70___CDInMemoryContext_setObject_returningMetadataForContextualKeyPath___block_invoke;
  v13[3] = &unk_1E56094E0;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  int v16 = &v17;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(syncQueue, v13);
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

- (id)addObjects:(id)a3 andRemoveObjects:(id)a4 fromArrayAtKeyPath:(id)a5 valueDidChange:(BOOL *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy_;
  v33 = __Block_byref_object_dispose_;
  id v34 = 0;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  syncQueue = self->_syncQueue;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __84___CDInMemoryContext_addObjects_andRemoveObjects_fromArrayAtKeyPath_valueDidChange___block_invoke;
  v19[3] = &unk_1E5609530;
  uint64_t v23 = &v29;
  v19[4] = self;
  id v14 = v10;
  id v20 = v14;
  id v15 = v11;
  id v21 = v15;
  id v16 = v12;
  id v22 = v16;
  uint64_t v24 = &v25;
  dispatch_sync(syncQueue, v19);
  if (a6) {
    *a6 = *((unsigned char *)v26 + 24);
  }
  id v17 = (id)v30[5];

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);

  return v17;
}

- (void)deregisterCallback:(id)a3
{
  id v4 = a3;
  syncQueue = self->_syncQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41___CDInMemoryContext_deregisterCallback___block_invoke;
  v7[3] = &unk_1E56091D8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(syncQueue, v7);
}

- (void)unsafe_deregisterCallback:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_syncQueue);
  v5 = _os_activity_create(&dword_18EC9B000, "Duet: ContextStore Deregister", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  *(void *)state = 0;
  *(void *)&state[8] = 0;
  os_activity_scope_enter(v5, (os_activity_scope_state_t)state);
  os_activity_scope_leave((os_activity_scope_state_t)state);

  id v6 = [v4 clientIdentifier];

  id v7 = [MEMORY[0x1E4F5B418] contextChannel];
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (!v8) {
      goto LABEL_7;
    }
    id v9 = [v4 clientIdentifier];
    id v10 = [v4 identifier];
    *(_DWORD *)state = 138543618;
    *(void *)&state[4] = v9;
    *(_WORD *)&state[12] = 2112;
    *(void *)&state[14] = v10;
    _os_log_impl(&dword_18EC9B000, v7, OS_LOG_TYPE_INFO, "Deregistering callback for client: %{public}@, registration: %@", state, 0x16u);
  }
  else
  {
    if (!v8) {
      goto LABEL_7;
    }
    id v9 = [v4 identifier];
    *(_DWORD *)state = 138412290;
    *(void *)&state[4] = v9;
    _os_log_impl(&dword_18EC9B000, v7, OS_LOG_TYPE_INFO, "Deregistering callback for registration: %@", state, 0xCu);
  }

LABEL_7:
  id v11 = [v4 predicate];
  id v12 = [v11 keyPaths];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v13 = v12;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v26 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v19 = -[NSMutableDictionary objectForKeyedSubscript:](self->_registrations, "objectForKeyedSubscript:", v18, (void)v25);
        [v19 removeObject:v4];

        id v20 = +[_CDContextQueries keyPathForSystemTime];
        int v21 = [v18 isEqual:v20];

        if (v21) {
          [(_CDInMemoryContext *)self unsafe_deregisterForSystemTimeBasedCallbacksForRegistration:v4];
        }
        id v22 = +[_CDContextQueries keyPathForCircularLocationRegions];
        int v23 = [v18 isEqual:v22];

        if (v23)
        {
          uint64_t v24 = [(_CDInMemoryContext *)self locationRegistrationMonitor];
          [v24 removeRegistration:v4];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v15);
  }
}

- (id)unsafe_addObjects:(id)a3 andRemoveObjects:(id)a4 fromArrayAtKeyPath:(id)a5 valueDidChange:(BOOL *)a6
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_syncQueue);
  if (a6) {
    *a6 = 0;
  }
  id v13 = [(NSMutableDictionary *)self->_context objectForKeyedSubscript:v12];
  if (![v10 count] && !objc_msgSend(v11, "count")) {
    goto LABEL_33;
  }
  if (!v13) {
    goto LABEL_8;
  }
  uint64_t v14 = [v13 value];
  if (!v14
    || (uint64_t v15 = (void *)v14,
        [v13 value],
        uint64_t v16 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v16,
        v15,
        (isKindOfClass & 1) != 0))
  {
LABEL_8:
    id v38 = v12;
    id v18 = [v13 value];
    uint64_t v19 = (void *)[v18 mutableCopy];

    if (!v19)
    {
      uint64_t v19 = [MEMORY[0x1E4F1CA48] array];
    }
    if ([v19 count])
    {
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v20 = v11;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v43 objects:v48 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v44;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v44 != v23) {
              objc_enumerationMutation(v20);
            }
            [v19 removeObject:*(void *)(*((void *)&v43 + 1) + 8 * i)];
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v43 objects:v48 count:16];
        }
        while (v22);
      }
    }
    int v37 = a6;
    id v25 = v11;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v26 = v10;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v39 objects:v47 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v40;
      do
      {
        for (uint64_t j = 0; j != v28; ++j)
        {
          if (*(void *)v40 != v29) {
            objc_enumerationMutation(v26);
          }
          uint64_t v31 = *(void *)(*((void *)&v39 + 1) + 8 * j);
          if ((objc_msgSend(v19, "containsObject:", v31, v37) & 1) == 0) {
            [v19 addObject:v31];
          }
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v39 objects:v47 count:16];
      }
      while (v28);
    }

    v32 = [v13 value];
    int v33 = [v19 isEqual:v32];

    if (v33)
    {
      id v34 = v13;
      id v11 = v25;
      id v12 = v38;
    }
    else
    {
      v35 = (void *)[v19 copy];
      id v12 = v38;
      id v34 = [(_CDInMemoryContext *)self unsafe_setObject:v35 returningMetadataForContextualKeyPath:v38];

      id v11 = v25;
      if (v37) {
        *int v37 = 1;
      }
    }
  }
  else
  {
LABEL_33:
    id v34 = v13;
  }

  return v34;
}

- (void)unsafe_registerFutureSystemTimeBasedCallbacksForRegistration:(id)a3 date:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_syncQueue);
  unsigned int v8 = [v6 qualityOfService];
  id v9 = [v6 predicate];
  uint64_t v27 = [v6 identifier];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v10 = [v9 timeBasedPredicateEvaluationIntervals];
  uint64_t v28 = [v10 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v28)
  {
    uint64_t v26 = *(void *)v30;
    *(void *)&long long v11 = 138412546;
    long long v24 = v11;
    id v25 = v10;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v30 != v26) {
          objc_enumerationMutation(v10);
        }
        id v13 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend(v13, "startDate", v24);
        uint64_t v15 = [v13 endDate];
        uint64_t v16 = [v15 compare:v7];

        if (v16 != 1) {
          goto LABEL_12;
        }
        id v17 = [(_CDInMemoryContext *)self unsafe_evaluatedContextWithRegistration:v6 date:v14];
        if (([v9 evaluateWithState:v17 previousValue:0] & 1) == 0)
        {

LABEL_12:
          id v17 = [(_CDInMemoryContext *)self systemTimeCallbackScheduler];
          [v17 unscheduleCallbackAtDate:v14 identifier:v27 requiringDeviceWake:v8 > 0x18];
          goto LABEL_13;
        }
        id v18 = v9;
        id v19 = v7;
        id v20 = v6;
        uint64_t v21 = [MEMORY[0x1E4F5B418] contextChannel];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v23 = _CDFormattedDate();
          *(_DWORD *)buf = v24;
          id v34 = v23;
          __int16 v35 = 2112;
          id v36 = v27;
          _os_log_debug_impl(&dword_18EC9B000, v21, OS_LOG_TYPE_DEBUG, "Registering system time callback at %@ for registration %@", buf, 0x16u);
        }
        uint64_t v22 = [(_CDInMemoryContext *)self systemTimeCallbackScheduler];
        [v22 scheduleCallbackAtDate:v14 identifier:v27 requiringDeviceWake:v8 > 0x18];

        id v6 = v20;
        id v7 = v19;
        id v9 = v18;
        id v10 = v25;
LABEL_13:
      }
      uint64_t v28 = [v10 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v28);
  }
}

- (_CDInMemoryContext)init
{
  v19.receiver = self;
  v19.super_class = (Class)_CDInMemoryContext;
  v2 = [(_CDInMemoryContext *)&v19 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.cdcontext.inmemorycontext", v3);
    syncQueue = v2->_syncQueue;
    v2->_syncQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
    context = v2->_context;
    v2->_context = (NSMutableDictionary *)v6;

    dispatch_workloop_t v8 = dispatch_workloop_create("com.apple.cdcontext.inmemorycontext");
    callbackWorkloop = v2->_callbackWorkloop;
    v2->_callbackWorkloop = (OS_dispatch_workloop *)v8;

    uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
    registrations = v2->_registrations;
    v2->_registrations = (NSMutableDictionary *)v10;

    uint64_t v12 = +[_CDSystemTimeCallbackScheduler sharedInstance];
    systemTimeCallbackScheduler = v2->_systemTimeCallbackScheduler;
    v2->_systemTimeCallbackScheduler = (_CDSystemTimeCallbackScheduler *)v12;

    uint64_t v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 addObserver:v2 selector:sel_receiveSystemTimeCallback_ name:@"_CDSystemTimeCallbackNotification" object:v2->_systemTimeCallbackScheduler];

    uint64_t v15 = objc_alloc_init(_CDContextualLocationRegistrationMonitor);
    locationRegistrationMonitor = v2->_locationRegistrationMonitor;
    v2->_locationRegistrationMonitor = v15;

    id v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v17 addObserver:v2 selector:sel_locationCoordinatorCircularRegionsDidChange_ name:@"_CDCircularRegionsForRegistrationDidChangeNotification" object:v2->_locationRegistrationMonitor];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"_CDSystemTimeCallbackNotification" object:self->_systemTimeCallbackScheduler];

  dispatch_queue_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:@"_CDCircularRegionsForRegistrationDidChangeNotification" object:self->_locationRegistrationMonitor];

  v5.receiver = self;
  v5.super_class = (Class)_CDInMemoryContext;
  [(_CDInMemoryContext *)&v5 dealloc];
}

+ (id)context
{
  v2 = objc_alloc_init(_CDInMemoryContext);
  return v2;
}

+ (id)contextWithDeviceID:(id)a3
{
  id v3 = a3;
  dispatch_queue_t v4 = objc_alloc_init(_CDInMemoryContext);
  [(_CDInMemoryContext *)v4 setDeviceID:v3];

  return v4;
}

- (void)locationCoordinatorCircularRegionsDidChange:(id)a3
{
  id v4 = a3;
  syncQueue = self->_syncQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66___CDInMemoryContext_locationCoordinatorCircularRegionsDidChange___block_invoke;
  v11[3] = &unk_1E56091D8;
  id v12 = v4;
  id v13 = self;
  uint64_t v6 = v11;
  id v7 = syncQueue;
  id v8 = v4;
  id v9 = (void *)os_transaction_create();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cd_dispatch_async_capture_tx_block_invoke;
  block[3] = &unk_1E56095F0;
  id v15 = v9;
  id v16 = v6;
  id v10 = v9;
  dispatch_async(v7, block);
}

- (void)receiveSystemTimeCallback:(id)a3
{
  id v4 = [a3 userInfo];
  id v7 = [v4 objectForKeyedSubscript:@"_CDSystemTimeCallbackDateKey"];

  objc_super v5 = objc_alloc_init(_CDContextValue);
  [(_CDContextValue *)v5 setValue:v7];
  [(_CDContextValue *)v5 setLastModifiedDate:v7];
  uint64_t v6 = +[_CDContextQueries keyPathForSystemTime];
  [(_CDInMemoryContext *)self evalutateRegistrationPredicatesWithPreviousContextValue:v5 date:v7 keyPath:v6];
}

- (BOOL)hasKnowledgeOfContextualKeyPath:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54___CDInMemoryContext_hasKnowledgeOfContextualKeyPath___block_invoke;
  block[3] = &unk_1E5609490;
  id v9 = v4;
  id v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(syncQueue, block);
  LOBYTE(syncQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)syncQueue;
}

- (id)objectForContextualKeyPath:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 key];
  _cdcontextstore_signpost_get_object_begin();

  uint64_t v13 = 0;
  char v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy_;
  id v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49___CDInMemoryContext_objectForContextualKeyPath___block_invoke;
  block[3] = &unk_1E56094B8;
  id v12 = &v13;
  void block[4] = self;
  id v7 = v4;
  id v11 = v7;
  dispatch_sync(syncQueue, block);
  _cdcontextstore_signpost_get_object_end();
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (void)setContextValue:(id)a3 forContextualKeyPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59___CDInMemoryContext_setContextValue_forContextualKeyPath___block_invoke;
  block[3] = &unk_1E56091B0;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(syncQueue, block);
}

- (BOOL)setObject:(id)a3 forContextualKeyPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  objc_super v19 = __Block_byref_object_copy_;
  id v20 = __Block_byref_object_dispose_;
  id v21 = 0;
  syncQueue = self->_syncQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __53___CDInMemoryContext_setObject_forContextualKeyPath___block_invoke;
  v12[3] = &unk_1E56094E0;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  uint64_t v15 = &v16;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(syncQueue, v12);
  LOBYTE(syncQueue) = v17[5] != 0;

  _Block_object_dispose(&v16, 8);
  return (char)syncQueue;
}

- (id)lastModifiedDateForContextualKeyPath:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy_;
  uint64_t v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59___CDInMemoryContext_lastModifiedDateForContextualKeyPath___block_invoke;
  block[3] = &unk_1E56094B8;
  id v10 = v4;
  id v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(syncQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)removeObjectsMatchingPredicate:(id)a3 fromArrayAtKeyPath:(id)a4
{
  id v7 = 0;
  id v4 = [(_CDInMemoryContext *)self removeObjectsMatchingPredicate:a3 fromArrayAtKeyPath:a4 removedObjects:&v7];
  id v5 = v7;
  return v5;
}

- (id)removeObjectsMatchingPredicate:(id)a3 fromArrayAtKeyPath:(id)a4 removedObjects:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  long long v29 = __Block_byref_object_copy_;
  long long v30 = __Block_byref_object_dispose_;
  id v31 = 0;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy_;
  long long v24 = __Block_byref_object_dispose_;
  id v25 = 0;
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87___CDInMemoryContext_removeObjectsMatchingPredicate_fromArrayAtKeyPath_removedObjects___block_invoke;
  block[3] = &unk_1E5609508;
  void block[4] = self;
  id v11 = v9;
  id v16 = v11;
  uint64_t v18 = &v20;
  id v12 = v8;
  id v17 = v12;
  objc_super v19 = &v26;
  dispatch_sync(syncQueue, block);
  if (a5) {
    *a5 = (id) v27[5];
  }
  id v13 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v13;
}

- (BOOL)addObjects:(id)a3 andRemoveObjects:(id)a4 fromArrayAtKeyPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count] || objc_msgSend(v9, "count"))
  {
    char v14 = 0;
    id v11 = [(_CDInMemoryContext *)self addObjects:v8 andRemoveObjects:v9 fromArrayAtKeyPath:v10 valueDidChange:&v14];
    BOOL v12 = v14 != 0;
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)addObjects:(id)a3 toArrayAtKeyPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    char v11 = 0;
    id v8 = [(_CDInMemoryContext *)self addObjects:v6 andRemoveObjects:0 fromArrayAtKeyPath:v7 valueDidChange:&v11];
    BOOL v9 = v11 != 0;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)removeObjects:(id)a3 fromArrayAtKeyPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    char v11 = 0;
    id v8 = [(_CDInMemoryContext *)self addObjects:0 andRemoveObjects:v6 fromArrayAtKeyPath:v7 valueDidChange:&v11];
    BOOL v9 = v11 != 0;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)addCallback:(id)a3 forKeyPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45___CDInMemoryContext_addCallback_forKeyPath___block_invoke;
  block[3] = &unk_1E56091B0;
  id v12 = v6;
  id v13 = v7;
  char v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(syncQueue, block);
}

- (void)registerCallback:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = objc_msgSend(v4, "predicate", 0);
  id v6 = [v5 keyPaths];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [(_CDInMemoryContext *)self addCallback:v4 forKeyPath:*(void *)(*((void *)&v11 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (BOOL)evaluatePredicate:(id)a3 date:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  syncQueue = self->_syncQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __45___CDInMemoryContext_evaluatePredicate_date___block_invoke;
  v12[3] = &unk_1E5609578;
  v12[4] = self;
  id v13 = v7;
  id v14 = v6;
  uint64_t v15 = &v16;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(syncQueue, v12);
  LOBYTE(v6) = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)v6;
}

- (void)evalutateRegistrationPredicatesWithPreviousContextValue:(id)a3 date:(id)a4 keyPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  syncQueue = self->_syncQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __91___CDInMemoryContext_evalutateRegistrationPredicatesWithPreviousContextValue_date_keyPath___block_invoke;
  v15[3] = &unk_1E56095A0;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_sync(syncQueue, v15);
}

- (void)unsafe_deregisterForSystemTimeBasedCallbacksForRegistration:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_syncQueue);
  id v5 = [v4 identifier];
  if (v5)
  {
    id v6 = [MEMORY[0x1E4F5B418] contextChannel];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[_CDInMemoryContext unsafe_deregisterForSystemTimeBasedCallbacksForRegistration:]((uint64_t)v5, v6);
    }

    unsigned int v7 = [v4 qualityOfService];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v17 = v4;
    id v8 = [v4 predicate];
    id v9 = [v8 timeBasedPredicateEvaluationIntervals];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v18 + 1) + 8 * v13);
          uint64_t v15 = [(_CDInMemoryContext *)self systemTimeCallbackScheduler];
          id v16 = [v14 startDate];
          [v15 unscheduleCallbackAtDate:v16 identifier:v5 requiringDeviceWake:v7 > 0x18];

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }

    id v4 = v17;
  }
}

- (id)allRegistrations
{
  id v3 = objc_opt_new();
  syncQueue = self->_syncQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __38___CDInMemoryContext_allRegistrations__block_invoke;
  v9[3] = &unk_1E56091D8;
  v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  dispatch_sync(syncQueue, v9);
  id v6 = v10;
  id v7 = v5;

  return v7;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"%@\nRegistrations: %@", self->_context, self->_registrations];
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (void)setDeviceID:(id)a3
{
}

- (OS_dispatch_queue)syncQueue
{
  return self->_syncQueue;
}

- (void)setSyncQueue:(id)a3
{
}

- (OS_dispatch_workloop)callbackWorkloop
{
  return self->_callbackWorkloop;
}

- (void)setCallbackWorkloop:(id)a3
{
}

- (NSMutableDictionary)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (_CDContextualLocationRegistrationMonitor)locationRegistrationMonitor
{
  return self->_locationRegistrationMonitor;
}

- (void)setLocationRegistrationMonitor:(id)a3
{
}

- (NSMutableDictionary)registrations
{
  return self->_registrations;
}

- (void)setRegistrations:(id)a3
{
}

- (_CDSystemTimeCallbackScheduler)systemTimeCallbackScheduler
{
  return self->_systemTimeCallbackScheduler;
}

- (void)setSystemTimeCallbackScheduler:(id)a3
{
}

- (_CDDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_systemTimeCallbackScheduler, 0);
  objc_storeStrong((id *)&self->_registrations, 0);
  objc_storeStrong((id *)&self->_locationRegistrationMonitor, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_callbackWorkloop, 0);
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
}

- (void)unsafe_evalutateRegistrationPredicate:(uint64_t)a1 previousContextValue:(NSObject *)a2 date:keyPath:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_18EC9B000, a2, OS_LOG_TYPE_DEBUG, "Automatically de-registering system time registration callback: %@", (uint8_t *)&v2, 0xCu);
}

- (void)unsafe_evalutateRegistrationPredicate:(os_log_t)log previousContextValue:date:keyPath:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_18EC9B000, log, OS_LOG_TYPE_DEBUG, "Evaluating registration predicate even though value is same value as previous value.", v1, 2u);
}

- (void)unsafe_deregisterForSystemTimeBasedCallbacksForRegistration:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_18EC9B000, a2, OS_LOG_TYPE_DEBUG, "Deregistering system time callbacks for registration %@", (uint8_t *)&v2, 0xCu);
}

@end