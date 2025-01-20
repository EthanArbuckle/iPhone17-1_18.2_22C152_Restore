@interface IASStatelessSessionManager
- (IASStatelessSessionManager)init;
- (IASStatelessSessionManager)initWithEventHandler:(id)a3 serverDelegate:(id)a4;
- (NSUUID)genericAnalyzerId;
- (void)didAction:(id)a3;
- (void)setGenericAnalyzerId:(id)a3;
@end

@implementation IASStatelessSessionManager

- (IASStatelessSessionManager)initWithEventHandler:(id)a3 serverDelegate:(id)a4
{
  v66[1] = *MEMORY[0x263EF8340];
  v65.receiver = self;
  v65.super_class = (Class)IASStatelessSessionManager;
  v4 = [(IASMultiClassSessionManager *)&v65 initWithEventHandler:a3 serverDelegate:a4];
  if (v4)
  {
    v66[0] = objc_opt_class();
    v6 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v5, (uint64_t)v66, 1);
    objc_msgSend_setAnalyzerClasses_(v4, v7, (uint64_t)v6, v8);

    id v9 = objc_alloc_init(MEMORY[0x263F08C38]);
    objc_msgSend_setGenericAnalyzerId_(v4, v10, (uint64_t)v9, v11);

    id v12 = objc_alloc(MEMORY[0x263EFF980]);
    v16 = objc_msgSend_analyzerClasses(v4, v13, v14, v15);
    uint64_t v20 = objc_msgSend_count(v16, v17, v18, v19);
    v23 = objc_msgSend_initWithCapacity_(v12, v21, v20, v22);

    v27 = objc_msgSend_analyzerClasses(v4, v24, v25, v26);
    uint64_t v31 = objc_msgSend_count(v27, v28, v29, v30);

    if (v31)
    {
      unint64_t v35 = 0;
      do
      {
        v36 = objc_msgSend_genericAnalyzerId(v4, v32, v33, v34);
        v40 = objc_msgSend_analyzerClasses(v4, v37, v38, v39);
        uint64_t v43 = objc_msgSend_objectAtIndexedSubscript_(v40, v41, v35, v42);
        v45 = objc_msgSend_createAnalyzerWithId_class_(v4, v44, (uint64_t)v36, v43);
        objc_msgSend_setObject_atIndexedSubscript_(v23, v46, (uint64_t)v45, v35);

        ++v35;
        v50 = objc_msgSend_analyzerClasses(v4, v47, v48, v49);
        unint64_t v54 = objc_msgSend_count(v50, v51, v52, v53);
      }
      while (v35 < v54);
    }
    v55 = objc_msgSend_analyzerIdToAnalyzersMap(v4, v32, v33, v34);
    v59 = objc_msgSend_genericAnalyzerId(v4, v56, v57, v58);
    objc_msgSend_setObject_forKeyedSubscript_(v55, v60, (uint64_t)v23, (uint64_t)v59);

    sub_252A04B0C();
    v61 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v61, OS_LOG_TYPE_DEBUG)) {
      sub_252A10C7C(v23, v61, v62, v63);
    }
  }
  return v4;
}

- (IASStatelessSessionManager)init
{
  return (IASStatelessSessionManager *)MEMORY[0x270F9A6D0](self, sel_initWithEventHandler_serverDelegate_, 0, 0);
}

- (void)didAction:(id)a3
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = sub_252A04B0C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_252A10D08(v5, v6);
  }

  v10 = objc_msgSend_analyzerIdToAnalyzersMap(self, v7, v8, v9);
  uint64_t v14 = objc_msgSend_count(v10, v11, v12, v13);

  if (v14 != 1)
  {
    uint64_t v34 = objc_msgSend_currentHandler(MEMORY[0x263F08690], v15, v16, v17);
    uint64_t v38 = objc_msgSend_analyzerIdToAnalyzersMap(self, v35, v36, v37);
    uint64_t v42 = objc_msgSend_count(v38, v39, v40, v41);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v34, v43, (uint64_t)a2, (uint64_t)self, @"IASStatelessSessionManager.m", 54, @"Stateless analyzers can only have 1 UUID by design. This condition should never be violated. Got %lu", v42);
  }
  uint64_t v18 = objc_msgSend_analyzerIdToAnalyzersMap(self, v15, v16, v17);
  uint64_t v22 = objc_msgSend_genericAnalyzerId(self, v19, v20, v21);
  uint64_t v25 = objc_msgSend_objectForKeyedSubscript_(v18, v23, (uint64_t)v22, v24);

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v26 = v25;
  uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v44, (uint64_t)v48, 16);
  if (v28)
  {
    uint64_t v31 = v28;
    uint64_t v32 = *(void *)v45;
    do
    {
      uint64_t v33 = 0;
      do
      {
        if (*(void *)v45 != v32) {
          objc_enumerationMutation(v26);
        }
        objc_msgSend_consumeAction_(*(void **)(*((void *)&v44 + 1) + 8 * v33++), v29, (uint64_t)v5, v30);
      }
      while (v31 != v33);
      uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v29, (uint64_t)&v44, (uint64_t)v48, 16);
    }
    while (v31);
  }
}

- (NSUUID)genericAnalyzerId
{
  return self->_genericAnalyzerId;
}

- (void)setGenericAnalyzerId:(id)a3
{
}

- (void).cxx_destruct
{
}

@end