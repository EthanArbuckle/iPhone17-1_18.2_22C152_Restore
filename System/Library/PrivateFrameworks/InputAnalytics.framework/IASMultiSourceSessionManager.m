@interface IASMultiSourceSessionManager
- (BOOL)associateAnalyticsSessionID:(id)a3 withAnalyzerID:(id)a4;
- (BOOL)createAnalyzerForSessionID:(id)a3;
- (Class)analyzerClass;
- (IASMultiSourceSessionManager)initWithEventHandler:(id)a3 serverDelegate:(id)a4;
- (NSMutableDictionary)analyzerIdToAnalyzerMap;
- (NSMutableDictionary)analyzerIdToSessionIdsMap;
- (NSMutableDictionary)sessionIdToAnalyzerIdMap;
- (id)analyzerForAnalyzerID:(id)a3;
- (id)analyzerForSessionID:(id)a3;
- (id)analyzerIdForSessionID:(id)a3;
- (id)garbageCollect;
- (id)sessionIDsForAnalyzerID:(id)a3;
- (void)periodic24HourEvents;
- (void)reportStatus;
- (void)setAnalyzerClass:(Class)a3;
- (void)setAnalyzerIdToAnalyzerMap:(id)a3;
- (void)setAnalyzerIdToSessionIdsMap:(id)a3;
- (void)setSessionIdToAnalyzerIdMap:(id)a3;
- (void)terminateAnalyzerSession:(id)a3;
@end

@implementation IASMultiSourceSessionManager

- (IASMultiSourceSessionManager)initWithEventHandler:(id)a3 serverDelegate:(id)a4
{
  v15.receiver = self;
  v15.super_class = (Class)IASMultiSourceSessionManager;
  v4 = [(IASSessionManager *)&v15 initWithEventHandler:a3 serverDelegate:a4];
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    objc_msgSend_setSessionIdToAnalyzerIdMap_(v4, v6, (uint64_t)v5, v7);

    id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    objc_msgSend_setAnalyzerIdToSessionIdsMap_(v4, v9, (uint64_t)v8, v10);

    id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    objc_msgSend_setAnalyzerIdToAnalyzerMap_(v4, v12, (uint64_t)v11, v13);
  }
  return v4;
}

- (id)analyzerIdForSessionID:(id)a3
{
  id v4 = a3;
  id v8 = objc_msgSend_sessionIdToAnalyzerIdMap(self, v5, v6, v7);
  id v11 = objc_msgSend_objectForKeyedSubscript_(v8, v9, (uint64_t)v4, v10);

  return v11;
}

- (id)analyzerForAnalyzerID:(id)a3
{
  id v4 = a3;
  id v8 = objc_msgSend_analyzerIdToAnalyzerMap(self, v5, v6, v7);
  id v11 = objc_msgSend_objectForKeyedSubscript_(v8, v9, (uint64_t)v4, v10);

  return v11;
}

- (id)analyzerForSessionID:(id)a3
{
  id v5 = objc_msgSend_analyzerIdForSessionID_(self, a2, (uint64_t)a3, v3);
  v9 = objc_msgSend_analyzerIdToAnalyzerMap(self, v6, v7, v8);
  v12 = objc_msgSend_objectForKeyedSubscript_(v9, v10, (uint64_t)v5, v11);

  return v12;
}

- (id)sessionIDsForAnalyzerID:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_analyzerIdToSessionIdsMap(self, v5, v6, v7);
  uint64_t v11 = objc_msgSend_objectForKeyedSubscript_(v8, v9, (uint64_t)v4, v10);

  return v11;
}

- (BOOL)associateAnalyticsSessionID:(id)a3 withAnalyzerID:(id)a4
{
  v56[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v12 = objc_msgSend_sessionIdToAnalyzerIdMap(self, v9, v10, v11);
  objc_super v15 = objc_msgSend_objectForKeyedSubscript_(v12, v13, (uint64_t)v7, v14);

  if (v15)
  {
    v19 = sub_252A04944();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_252A0FD34((uint64_t)v7, v19);
    }
LABEL_4:
    BOOL v20 = 0;
    goto LABEL_5;
  }
  v22 = objc_msgSend_analyzerIdToAnalyzerMap(self, v16, v17, v18);
  v25 = objc_msgSend_objectForKeyedSubscript_(v22, v23, (uint64_t)v8, v24);

  if (!v25)
  {
    v19 = sub_252A04944();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_252A0FC9C(v8, (char *)v19, v42, v43);
    }
    goto LABEL_4;
  }
  v29 = objc_msgSend_sessionIdToAnalyzerIdMap(self, v26, v27, v28);
  objc_msgSend_setObject_forKeyedSubscript_(v29, v30, (uint64_t)v8, (uint64_t)v7);

  v34 = objc_msgSend_analyzerIdToSessionIdsMap(self, v31, v32, v33);
  v19 = objc_msgSend_objectForKeyedSubscript_(v34, v35, (uint64_t)v8, v36);

  if (v19)
  {
    if (objc_msgSend_containsObject_(v19, v37, (uint64_t)v7, v38))
    {
      v54 = objc_msgSend_currentHandler(MEMORY[0x263F08690], v39, v40, v41);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v54, v55, (uint64_t)a2, (uint64_t)self, @"IASSessionManager.m", 197, @"Corrupted mapping: Analytics session ID string %@ did not exist in forward mapping but exists in reverse mapping", v7);
    }
    objc_msgSend_addObject_(v19, v39, (uint64_t)v7, v41);
    BOOL v20 = 1;
  }
  else
  {
    id v44 = objc_alloc(MEMORY[0x263EFF9C0]);
    v56[0] = v7;
    BOOL v20 = 1;
    v46 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v45, (uint64_t)v56, 1);
    v19 = objc_msgSend_initWithArray_(v44, v47, (uint64_t)v46, v48);

    v52 = objc_msgSend_analyzerIdToSessionIdsMap(self, v49, v50, v51);
    objc_msgSend_setObject_forKeyedSubscript_(v52, v53, (uint64_t)v19, (uint64_t)v8);
  }
LABEL_5:

  return v20;
}

- (BOOL)createAnalyzerForSessionID:(id)a3
{
  id v5 = a3;
  uint64_t v8 = objc_msgSend_analyzerIdForSessionID_(self, v6, (uint64_t)v5, v7);
  if (v8)
  {
    id v12 = (id)v8;
    uint64_t v13 = objc_msgSend_analyzerIdToAnalyzerMap(self, v9, v10, v11);
    v16 = objc_msgSend_objectForKeyedSubscript_(v13, v14, (uint64_t)v12, v15);

    if (!v16)
    {
      v35 = objc_msgSend_currentHandler(MEMORY[0x263F08690], v17, v18, v19);
      v39 = objc_msgSend_description(v12, v36, v37, v38);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v35, v40, (uint64_t)a2, (uint64_t)self, @"IASSessionManager.m", 210, @"analyzerId %@ exists without analyzer", v39);
    }
    BOOL v20 = sub_252A04944();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      sub_252A0FDAC((uint64_t)v5, (uint64_t)v16, v20);
    }

    char v21 = 0;
  }
  else
  {
    id v12 = objc_alloc_init(MEMORY[0x263F08C38]);
    uint64_t v25 = objc_msgSend_analyzerClass(self, v22, v23, v24);
    uint64_t v27 = objc_msgSend_createAnalyzerWithId_class_(self, v26, (uint64_t)v12, v25);
    v31 = objc_msgSend_analyzerIdToAnalyzerMap(self, v28, v29, v30);
    objc_msgSend_setObject_forKeyedSubscript_(v31, v32, (uint64_t)v27, (uint64_t)v12);

    char v21 = objc_msgSend_associateAnalyticsSessionID_withAnalyzerID_(self, v33, (uint64_t)v5, (uint64_t)v12);
  }

  return v21;
}

- (void)terminateAnalyzerSession:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v8 = objc_msgSend_analyzerIdToAnalyzerMap(self, v5, v6, v7);
  objc_msgSend_removeObjectForKey_(v8, v9, (uint64_t)v4, v10);

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v14 = objc_msgSend_analyzerIdToSessionIdsMap(self, v11, v12, v13, 0);
  uint64_t v17 = objc_msgSend_objectForKeyedSubscript_(v14, v15, (uint64_t)v4, v16);

  uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v36, (uint64_t)v40, 16);
  if (v19)
  {
    uint64_t v23 = v19;
    uint64_t v24 = *(void *)v37;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v37 != v24) {
          objc_enumerationMutation(v17);
        }
        uint64_t v26 = *(void *)(*((void *)&v36 + 1) + 8 * v25);
        uint64_t v27 = objc_msgSend_sessionIdToAnalyzerIdMap(self, v20, v21, v22);
        objc_msgSend_removeObjectForKey_(v27, v28, v26, v29);

        ++v25;
      }
      while (v23 != v25);
      uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v36, (uint64_t)v40, 16);
    }
    while (v23);
  }

  uint64_t v33 = objc_msgSend_analyzerIdToSessionIdsMap(self, v30, v31, v32);
  objc_msgSend_removeObjectForKey_(v33, v34, (uint64_t)v4, v35);
}

- (id)garbageCollect
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  uint64_t v7 = objc_msgSend_analyzerIdToAnalyzerMap(self, v4, v5, v6);
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v48, (uint64_t)v53, 16);
  if (v9)
  {
    uint64_t v13 = v9;
    uint64_t v14 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v49 != v14) {
          objc_enumerationMutation(v7);
        }
        uint64_t v16 = *(void *)(*((void *)&v48 + 1) + 8 * i);
        uint64_t v17 = objc_msgSend_analyzerIdToAnalyzerMap(self, v10, v11, v12);
        BOOL v20 = objc_msgSend_objectForKeyedSubscript_(v17, v18, v16, v19);

        if (objc_msgSend_shouldBeGarbageCollected(v20, v21, v22, v23))
        {
          uint64_t v27 = objc_msgSend_analyzerSessionId(v20, v24, v25, v26);
          objc_msgSend_addObject_(v3, v28, (uint64_t)v27, v29);
        }
      }
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v48, (uint64_t)v53, 16);
    }
    while (v13);
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v30 = v3;
  uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v31, (uint64_t)&v44, (uint64_t)v52, 16);
  if (v32)
  {
    uint64_t v36 = v32;
    uint64_t v37 = *(void *)v45;
    do
    {
      for (uint64_t j = 0; j != v36; ++j)
      {
        if (*(void *)v45 != v37) {
          objc_enumerationMutation(v30);
        }
        uint64_t v39 = *(void *)(*((void *)&v44 + 1) + 8 * j);
        uint64_t v40 = objc_msgSend_analyzerIdToAnalyzerMap(self, v33, v34, v35, (void)v44);
        objc_msgSend_removeObjectForKey_(v40, v41, v39, v42);
      }
      uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v33, (uint64_t)&v44, (uint64_t)v52, 16);
    }
    while (v36);
  }

  return v30;
}

- (void)periodic24HourEvents
{
  id v4 = objc_msgSend_analyzerClass(self, a2, v2, v3);
  objc_msgSend_periodic24HourEvents(v4, v5, v6, v7);
}

- (void)reportStatus
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  if (os_variant_has_internal_diagnostics())
  {
    uint64_t v25 = 0;
    uint64_t v26 = &v25;
    uint64_t v27 = 0x3032000000;
    uint64_t v28 = sub_2529F3EE4;
    uint64_t v29 = sub_2529F3EF4;
    uint64_t v3 = NSString;
    id v4 = (objc_class *)objc_opt_class();
    uint64_t v5 = NSStringFromClass(v4);
    uint64_t v9 = objc_msgSend_analyzerIdToAnalyzerMap(self, v6, v7, v8);
    uint64_t v13 = objc_msgSend_count(v9, v10, v11, v12);
    objc_msgSend_stringWithFormat_(v3, v14, @"%@ status:\nActive sessions: %lu\n", v15, v5, v13);
    id v30 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v19 = objc_msgSend_analyzerIdToAnalyzerMap(self, v16, v17, v18);
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = sub_2529F4D60;
    v24[3] = &unk_265387178;
    v24[4] = self;
    v24[5] = &v25;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v19, v20, (uint64_t)v24, v21);

    uint64_t v22 = sub_252A04944();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      uint64_t v23 = v26[5];
      *(_DWORD *)buf = 138477827;
      uint64_t v32 = v23;
      _os_log_impl(&dword_2529F1000, v22, OS_LOG_TYPE_INFO, "%{private}@", buf, 0xCu);
    }

    _Block_object_dispose(&v25, 8);
  }
}

- (Class)analyzerClass
{
  return self->_analyzerClass;
}

- (void)setAnalyzerClass:(Class)a3
{
}

- (NSMutableDictionary)analyzerIdToAnalyzerMap
{
  return self->_analyzerIdToAnalyzerMap;
}

- (void)setAnalyzerIdToAnalyzerMap:(id)a3
{
}

- (NSMutableDictionary)sessionIdToAnalyzerIdMap
{
  return self->_sessionIdToAnalyzerIdMap;
}

- (void)setSessionIdToAnalyzerIdMap:(id)a3
{
}

- (NSMutableDictionary)analyzerIdToSessionIdsMap
{
  return self->_analyzerIdToSessionIdsMap;
}

- (void)setAnalyzerIdToSessionIdsMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyzerIdToSessionIdsMap, 0);
  objc_storeStrong((id *)&self->_sessionIdToAnalyzerIdMap, 0);
  objc_storeStrong((id *)&self->_analyzerIdToAnalyzerMap, 0);
  objc_storeStrong((id *)&self->_analyzerClass, 0);
}

@end