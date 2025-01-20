@interface IASMultiClassSessionManager
- (IASMultiClassSessionManager)initWithEventHandler:(id)a3 serverDelegate:(id)a4;
- (NSArray)analyzerClasses;
- (NSMutableDictionary)analyzerIdToAnalyzersMap;
- (id)garbageCollect;
- (void)periodic24HourEvents;
- (void)reportStatus;
- (void)setAnalyzerClasses:(id)a3;
- (void)setAnalyzerIdToAnalyzersMap:(id)a3;
@end

@implementation IASMultiClassSessionManager

- (IASMultiClassSessionManager)initWithEventHandler:(id)a3 serverDelegate:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)IASMultiClassSessionManager;
  v4 = [(IASSessionManager *)&v9 initWithEventHandler:a3 serverDelegate:a4];
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    objc_msgSend_setAnalyzerIdToAnalyzersMap_(v4, v6, (uint64_t)v5, v7);
  }
  return v4;
}

- (id)garbageCollect
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  objc_msgSend_analyzerIdToAnalyzersMap(self, v4, v5, v6);
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v56, (uint64_t)v62, 16);
  if (v8)
  {
    uint64_t v12 = v8;
    uint64_t v13 = *(void *)v57;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v57 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v56 + 1) + 8 * i);
        v16 = objc_msgSend_analyzerIdToAnalyzersMap(self, v9, v10, v11);
        v19 = objc_msgSend_objectForKeyedSubscript_(v16, v17, v15, v18);

        long long v54 = 0u;
        long long v55 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        id v20 = v19;
        uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v52, (uint64_t)v61, 16);
        if (v22)
        {
          uint64_t v26 = v22;
          uint64_t v27 = *(void *)v53;
          do
          {
            for (uint64_t j = 0; j != v26; ++j)
            {
              if (*(void *)v53 != v27) {
                objc_enumerationMutation(v20);
              }
              v29 = *(void **)(*((void *)&v52 + 1) + 8 * j);
              if (objc_msgSend_shouldBeGarbageCollected(v29, v23, v24, v25))
              {
                v30 = objc_msgSend_analyzerSessionId(v29, v23, v24, v25);
                objc_msgSend_addObject_(v3, v31, (uint64_t)v30, v32);
              }
            }
            uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v23, (uint64_t)&v52, (uint64_t)v61, 16);
          }
          while (v26);
        }
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v56, (uint64_t)v62, 16);
    }
    while (v12);
  }

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v33 = v3;
  uint64_t v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v34, (uint64_t)&v48, (uint64_t)v60, 16);
  if (v35)
  {
    uint64_t v39 = v35;
    uint64_t v40 = *(void *)v49;
    do
    {
      for (uint64_t k = 0; k != v39; ++k)
      {
        if (*(void *)v49 != v40) {
          objc_enumerationMutation(v33);
        }
        uint64_t v42 = *(void *)(*((void *)&v48 + 1) + 8 * k);
        v43 = objc_msgSend_analyzerIdToAnalyzersMap(self, v36, v37, v38);
        objc_msgSend_removeObjectForKey_(v43, v44, v42, v45);
      }
      uint64_t v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v36, (uint64_t)&v48, (uint64_t)v60, 16);
    }
    while (v39);
  }

  return v33;
}

- (void)periodic24HourEvents
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v4 = objc_msgSend_analyzerClasses(self, a2, v2, v3, 0);
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v13, (uint64_t)v17, 16);
  if (v6)
  {
    uint64_t v10 = v6;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend_periodic24HourEvents(*(void **)(*((void *)&v13 + 1) + 8 * v12++), v7, v8, v9);
      }
      while (v10 != v12);
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v13, (uint64_t)v17, 16);
    }
    while (v10);
  }
}

- (void)reportStatus
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  if (os_variant_has_internal_diagnostics())
  {
    uint64_t v25 = 0;
    uint64_t v26 = &v25;
    uint64_t v27 = 0x3032000000;
    v28 = sub_2529F3EE4;
    v29 = sub_2529F3EF4;
    uint64_t v3 = NSString;
    v4 = (objc_class *)objc_opt_class();
    uint64_t v5 = NSStringFromClass(v4);
    uint64_t v9 = objc_msgSend_analyzerIdToAnalyzersMap(self, v6, v7, v8);
    uint64_t v13 = objc_msgSend_count(v9, v10, v11, v12);
    objc_msgSend_stringWithFormat_(v3, v14, @"%@ status:\nActive sessions: %lu\n", v15, v5, v13);
    id v30 = (id)objc_claimAutoreleasedReturnValue();

    v19 = objc_msgSend_analyzerIdToAnalyzersMap(self, v16, v17, v18);
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = sub_2529F3EFC;
    v24[3] = &unk_265387150;
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

- (NSMutableDictionary)analyzerIdToAnalyzersMap
{
  return self->_analyzerIdToAnalyzersMap;
}

- (void)setAnalyzerIdToAnalyzersMap:(id)a3
{
}

- (NSArray)analyzerClasses
{
  return self->_analyzerClasses;
}

- (void)setAnalyzerClasses:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyzerClasses, 0);
  objc_storeStrong((id *)&self->_analyzerIdToAnalyzersMap, 0);
}

@end