@interface LBFDeploymentEventsHolder
- (BOOL)appendDprivacydEvent:(id)a3;
- (BOOL)appendLighthousePluginEvent:(id)a3;
- (BOOL)appendMlruntimedEvent:(id)a3;
- (BOOL)appendTrialEvent:(id)a3;
- (BOOL)dumpFetchedEvents;
- (LBFDeploymentEventsHolder)initWithExperimentOrTaskId:(id)a3 deploymentId:(id)a4;
- (NSMutableArray)dprivacydEvents;
- (NSMutableArray)lighthousePluginEvents;
- (NSMutableArray)mlruntimedEvents;
- (NSMutableArray)trialdEvents;
- (NSString)deploymentId;
- (NSString)experimentOrTaskId;
- (id)eventToJSONDictionary:(id)a3;
- (id)eventToJSONString:(id)a3;
- (id)fetchedEventsInDictionaries;
- (id)getSortedEvents;
@end

@implementation LBFDeploymentEventsHolder

- (LBFDeploymentEventsHolder)initWithExperimentOrTaskId:(id)a3 deploymentId:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)LBFDeploymentEventsHolder;
  v9 = [(LBFDeploymentEventsHolder *)&v19 init];
  if (v9)
  {
    LBFLoggingUtilsInit();
    objc_storeStrong((id *)&v9->_experimentOrTaskId, a3);
    objc_storeStrong((id *)&v9->_deploymentId, a4);
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mlruntimedEvents = v9->_mlruntimedEvents;
    v9->_mlruntimedEvents = v10;

    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    lighthousePluginEvents = v9->_lighthousePluginEvents;
    v9->_lighthousePluginEvents = v12;

    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    trialdEvents = v9->_trialdEvents;
    v9->_trialdEvents = v14;

    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    dprivacydEvents = v9->_dprivacydEvents;
    v9->_dprivacydEvents = v16;
  }
  return v9;
}

- (BOOL)appendMlruntimedEvent:(id)a3
{
  objc_msgSend_addObject_(self->_mlruntimedEvents, a2, (uint64_t)a3, v3, v4);
  return 1;
}

- (BOOL)appendLighthousePluginEvent:(id)a3
{
  objc_msgSend_addObject_(self->_lighthousePluginEvents, a2, (uint64_t)a3, v3, v4);
  return 1;
}

- (BOOL)appendTrialEvent:(id)a3
{
  objc_msgSend_addObject_(self->_trialdEvents, a2, (uint64_t)a3, v3, v4);
  return 1;
}

- (BOOL)appendDprivacydEvent:(id)a3
{
  objc_msgSend_addObject_(self->_dprivacydEvents, a2, (uint64_t)a3, v3, v4);
  return 1;
}

- (id)eventToJSONDictionary:(id)a3
{
  v101[4] = *MEMORY[0x263EF8340];
  id v3 = a3;
  v100[0] = &unk_2703E3D70;
  v100[1] = &unk_2703E3D88;
  v101[0] = @"Unknown";
  v101[1] = @"Allocation";
  v100[2] = &unk_2703E3DA0;
  v100[3] = &unk_2703E3DB8;
  v101[2] = @"Activation";
  v101[3] = @"Deactivation";
  v5 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v4, (uint64_t)v101, (uint64_t)v100, 4);
  objc_msgSend_json(v3, v6, v7, v8, v9);
  v91 = id v98 = 0;
  v11 = objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x263F08900], v10, (uint64_t)v91, 0, (uint64_t)&v98);
  id v89 = v98;
  v90 = v11;
  v16 = objc_msgSend_mutableCopy(v11, v12, v13, v14, v15);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v21 = objc_msgSend_eventType(v3, v17, v18, v19, v20);
    v25 = objc_msgSend_numberWithInt_(NSNumber, v22, v21, v23, v24);
    v29 = objc_msgSend_objectForKey_(v5, v26, (uint64_t)v25, v27, v28);

    objc_msgSend_setObject_forKey_(v16, v30, (uint64_t)v29, @"eventType", v31);
  }
  v92 = v5;
  v93 = v3;
  v32 = objc_msgSend_null(MEMORY[0x263EFF9D0], v17, v18, v19, v20);
  uint64_t v36 = objc_msgSend_allKeysForObject_(v16, v33, (uint64_t)v32, v34, v35);

  v88 = (void *)v36;
  objc_msgSend_removeObjectsForKeys_(v16, v37, v36, v38, v39);
  v44 = objc_msgSend_mutableCopy(v16, v40, v41, v42, v43);
  long long v94 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  id v45 = v16;
  uint64_t v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v46, (uint64_t)&v94, (uint64_t)v99, 16);
  if (v47)
  {
    uint64_t v51 = v47;
    uint64_t v52 = *(void *)v95;
    do
    {
      for (uint64_t i = 0; i != v51; ++i)
      {
        if (*(void *)v95 != v52) {
          objc_enumerationMutation(v45);
        }
        uint64_t v54 = *(void *)(*((void *)&v94 + 1) + 8 * i);
        v55 = objc_msgSend_objectForKey_(v45, v48, v54, v49, v50);
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          v57 = objc_msgSend_objectForKey_(v45, v48, v54, v49, v50);
          v62 = objc_msgSend_mutableCopy(v57, v58, v59, v60, v61);

          v67 = objc_msgSend_null(MEMORY[0x263EFF9D0], v63, v64, v65, v66);
          v71 = objc_msgSend_allKeysForObject_(v62, v68, (uint64_t)v67, v69, v70);

          objc_msgSend_removeObjectsForKeys_(v62, v72, (uint64_t)v71, v73, v74);
          v79 = objc_msgSend_copy(v62, v75, v76, v77, v78);
          objc_msgSend_setObject_forKey_(v44, v80, (uint64_t)v79, v54, v81);
        }
      }
      uint64_t v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v48, (uint64_t)&v94, (uint64_t)v99, 16);
    }
    while (v51);
  }

  v86 = objc_msgSend_copy(v44, v82, v83, v84, v85);
  return v86;
}

- (id)eventToJSONString:(id)a3
{
  v5 = (void *)MEMORY[0x263F08900];
  v6 = objc_msgSend_eventToJSONDictionary_(self, a2, (uint64_t)a3, v3, v4);
  uint64_t v14 = 0;
  uint64_t v8 = objc_msgSend_dataWithJSONObject_options_error_(v5, v7, (uint64_t)v6, 1, (uint64_t)&v14);

  id v9 = [NSString alloc];
  v12 = objc_msgSend_initWithData_encoding_(v9, v10, (uint64_t)v8, 4, v11);

  return v12;
}

- (id)getSortedEvents
{
  v26[1] = *MEMORY[0x263EF8340];
  v5 = objc_msgSend_arrayByAddingObjectsFromArray_(self->_mlruntimedEvents, a2, (uint64_t)self->_lighthousePluginEvents, v2, v3);
  id v9 = objc_msgSend_arrayByAddingObjectsFromArray_(v5, v6, (uint64_t)self->_trialdEvents, v7, v8);
  uint64_t v13 = objc_msgSend_arrayByAddingObjectsFromArray_(v9, v10, (uint64_t)self->_dprivacydEvents, v11, v12);

  id v14 = objc_alloc(MEMORY[0x263F08B30]);
  v17 = objc_msgSend_initWithKey_ascending_(v14, v15, @"timestamp", 1, v16);
  v26[0] = v17;
  uint64_t v20 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v18, (uint64_t)v26, 1, v19);
  uint64_t v24 = objc_msgSend_sortedArrayUsingDescriptors_(v13, v21, (uint64_t)v20, v22, v23);

  return v24;
}

- (BOOL)dumpFetchedEvents
{
  uint64_t v96 = *MEMORY[0x263EF8340];
  uint64_t v3 = LBFLogContextEventsHolder;
  if (os_log_type_enabled((os_log_t)LBFLogContextEventsHolder, OS_LOG_TYPE_INFO))
  {
    deploymentId = self->_deploymentId;
    *(_DWORD *)buf = 138412290;
    long long v95 = deploymentId;
    _os_log_impl(&dword_254547000, v3, OS_LOG_TYPE_INFO, "dumpFetchedEvents deploymentId %@", buf, 0xCu);
  }
  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  v5 = self->_mlruntimedEvents;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v86, (uint64_t)v93, 16);
  if (v7)
  {
    uint64_t v11 = v7;
    uint64_t v12 = *(void *)v87;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v87 != v12) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend_eventToJSONString_(self, v8, *(void *)(*((void *)&v86 + 1) + 8 * i), v9, v10);
        id v14 = (NSString *)objc_claimAutoreleasedReturnValue();
        uint64_t v15 = LBFLogContextEventsHolder;
        if (os_log_type_enabled((os_log_t)LBFLogContextEventsHolder, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          long long v95 = v14;
          _os_log_impl(&dword_254547000, v15, OS_LOG_TYPE_INFO, "Dump: MLRuntimed Event - BMLighthouseLedgerMlruntimedEvent:\n%@\n\n", buf, 0xCu);
        }
        uint64_t v16 = v14;
        uint64_t v21 = (const char *)objc_msgSend_UTF8String(v16, v17, v18, v19, v20);
        printf("Dump: MLRuntimed Event - BMLighthouseLedgerMlruntimedEvent:\n%s\n\n", v21);
      }
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v86, (uint64_t)v93, 16);
    }
    while (v11);
  }

  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  uint64_t v22 = self->_lighthousePluginEvents;
  uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v82, (uint64_t)v92, 16);
  if (v24)
  {
    uint64_t v28 = v24;
    uint64_t v29 = *(void *)v83;
    do
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v83 != v29) {
          objc_enumerationMutation(v22);
        }
        objc_msgSend_eventToJSONString_(self, v25, *(void *)(*((void *)&v82 + 1) + 8 * j), v26, v27);
        uint64_t v31 = (NSString *)objc_claimAutoreleasedReturnValue();
        v32 = LBFLogContextEventsHolder;
        if (os_log_type_enabled((os_log_t)LBFLogContextEventsHolder, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          long long v95 = v31;
          _os_log_impl(&dword_254547000, v32, OS_LOG_TYPE_INFO, "Dump: Lighthouse Event - BMLighthouseLedgerLighthousePluginEvent:\n%@\n\n", buf, 0xCu);
        }
        v33 = v31;
        uint64_t v38 = (const char *)objc_msgSend_UTF8String(v33, v34, v35, v36, v37);
        printf("Dump: Lighthouse Event - BMLighthouseLedgerLighthousePluginEvent:\n%s\n\n", v38);
      }
      uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v25, (uint64_t)&v82, (uint64_t)v92, 16);
    }
    while (v28);
  }

  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  uint64_t v39 = self->_trialdEvents;
  uint64_t v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v39, v40, (uint64_t)&v78, (uint64_t)v91, 16);
  if (v41)
  {
    uint64_t v45 = v41;
    uint64_t v46 = *(void *)v79;
    do
    {
      for (uint64_t k = 0; k != v45; ++k)
      {
        if (*(void *)v79 != v46) {
          objc_enumerationMutation(v39);
        }
        objc_msgSend_eventToJSONString_(self, v42, *(void *)(*((void *)&v78 + 1) + 8 * k), v43, v44);
        v48 = (NSString *)objc_claimAutoreleasedReturnValue();
        uint64_t v49 = LBFLogContextEventsHolder;
        if (os_log_type_enabled((os_log_t)LBFLogContextEventsHolder, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          long long v95 = v48;
          _os_log_impl(&dword_254547000, v49, OS_LOG_TYPE_INFO, "Dump: Triald Event - BMLighthouseLedgerTrialdEvent:\n%@\n\n", buf, 0xCu);
        }
        uint64_t v50 = v48;
        v55 = (const char *)objc_msgSend_UTF8String(v50, v51, v52, v53, v54);
        printf("Dump: Triald Event - BMLighthouseLedgerTrialdEvent:\n%s\n\n", v55);
      }
      uint64_t v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v39, v42, (uint64_t)&v78, (uint64_t)v91, 16);
    }
    while (v45);
  }

  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  v56 = self->_dprivacydEvents;
  uint64_t v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v56, v57, (uint64_t)&v74, (uint64_t)v90, 16);
  if (v58)
  {
    uint64_t v62 = v58;
    uint64_t v63 = *(void *)v75;
    do
    {
      for (uint64_t m = 0; m != v62; ++m)
      {
        if (*(void *)v75 != v63) {
          objc_enumerationMutation(v56);
        }
        objc_msgSend_eventToJSONString_(self, v59, *(void *)(*((void *)&v74 + 1) + 8 * m), v60, v61);
        uint64_t v65 = (NSString *)objc_claimAutoreleasedReturnValue();
        uint64_t v66 = LBFLogContextEventsHolder;
        if (os_log_type_enabled((os_log_t)LBFLogContextEventsHolder, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          long long v95 = v65;
          _os_log_impl(&dword_254547000, v66, OS_LOG_TYPE_INFO, "Dump: Dprivacyd Event - BMLighthouseLedgerDediscoPrivacyEvent:\n%@\n\n", buf, 0xCu);
        }
        v67 = v65;
        v72 = (const char *)objc_msgSend_UTF8String(v67, v68, v69, v70, v71);
        printf("Dump: Dprivacyd Event - BMLighthouseLedgerDediscoPrivacyEvent:\n%s\n\n", v72);
      }
      uint64_t v62 = objc_msgSend_countByEnumeratingWithState_objects_count_(v56, v59, (uint64_t)&v74, (uint64_t)v90, 16);
    }
    while (v62);
  }

  return 1;
}

- (id)fetchedEventsInDictionaries
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v4 = LBFLogContextEventsHolder;
  if (os_log_type_enabled((os_log_t)LBFLogContextEventsHolder, OS_LOG_TYPE_INFO))
  {
    deploymentId = self->_deploymentId;
    *(_DWORD *)buf = 138412290;
    uint64_t v62 = deploymentId;
    _os_log_impl(&dword_254547000, v4, OS_LOG_TYPE_INFO, "fetchedEventsInDictionaries deploymentId %@", buf, 0xCu);
  }
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  v6 = self->_mlruntimedEvents;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v54, (uint64_t)v60, 16);
  if (v8)
  {
    uint64_t v12 = v8;
    uint64_t v13 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v55 != v13) {
          objc_enumerationMutation(v6);
        }
        uint64_t v15 = objc_msgSend_eventToJSONDictionary_(self, v9, *(void *)(*((void *)&v54 + 1) + 8 * i), v10, v11);
        objc_msgSend_addObject_(v3, v16, (uint64_t)v15, v17, v18);
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v54, (uint64_t)v60, 16);
    }
    while (v12);
  }

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  uint64_t v19 = self->_lighthousePluginEvents;
  uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v50, (uint64_t)v59, 16);
  if (v21)
  {
    uint64_t v25 = v21;
    uint64_t v26 = *(void *)v51;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v51 != v26) {
          objc_enumerationMutation(v19);
        }
        uint64_t v28 = objc_msgSend_eventToJSONDictionary_(self, v22, *(void *)(*((void *)&v50 + 1) + 8 * j), v23, v24);
        objc_msgSend_addObject_(v3, v29, (uint64_t)v28, v30, v31);
      }
      uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v22, (uint64_t)&v50, (uint64_t)v59, 16);
    }
    while (v25);
  }

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  v32 = self->_trialdEvents;
  uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v33, (uint64_t)&v46, (uint64_t)v58, 16);
  if (v34)
  {
    uint64_t v38 = v34;
    uint64_t v39 = *(void *)v47;
    do
    {
      for (uint64_t k = 0; k != v38; ++k)
      {
        if (*(void *)v47 != v39) {
          objc_enumerationMutation(v32);
        }
        uint64_t v41 = objc_msgSend_eventToJSONDictionary_(self, v35, *(void *)(*((void *)&v46 + 1) + 8 * k), v36, v37, (void)v46);
        objc_msgSend_addObject_(v3, v42, (uint64_t)v41, v43, v44);
      }
      uint64_t v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v35, (uint64_t)&v46, (uint64_t)v58, 16);
    }
    while (v38);
  }

  return v3;
}

- (NSString)experimentOrTaskId
{
  return self->_experimentOrTaskId;
}

- (NSString)deploymentId
{
  return self->_deploymentId;
}

- (NSMutableArray)lighthousePluginEvents
{
  return self->_lighthousePluginEvents;
}

- (NSMutableArray)mlruntimedEvents
{
  return self->_mlruntimedEvents;
}

- (NSMutableArray)trialdEvents
{
  return self->_trialdEvents;
}

- (NSMutableArray)dprivacydEvents
{
  return self->_dprivacydEvents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dprivacydEvents, 0);
  objc_storeStrong((id *)&self->_trialdEvents, 0);
  objc_storeStrong((id *)&self->_mlruntimedEvents, 0);
  objc_storeStrong((id *)&self->_lighthousePluginEvents, 0);
  objc_storeStrong((id *)&self->_deploymentId, 0);
  objc_storeStrong((id *)&self->_experimentOrTaskId, 0);
}

@end