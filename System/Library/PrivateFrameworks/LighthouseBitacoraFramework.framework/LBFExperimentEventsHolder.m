@interface LBFExperimentEventsHolder
- (BOOL)dumpFetchedEvents;
- (LBFExperimentEventsHolder)initWithExperimentOrTaskId:(id)a3;
- (NSMutableDictionary)deploymentEventsHolders;
- (NSString)experimentOrTaskId;
- (id)ensureDeploymentEventsHolder:(id)a3;
- (id)fetchedEventsInDictionaries;
@end

@implementation LBFExperimentEventsHolder

- (LBFExperimentEventsHolder)initWithExperimentOrTaskId:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LBFExperimentEventsHolder;
  v6 = [(LBFExperimentEventsHolder *)&v10 init];
  if (v6)
  {
    LBFLoggingUtilsInit();
    objc_storeStrong((id *)&v6->_experimentOrTaskId, a3);
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    deploymentEventsHolders = v6->_deploymentEventsHolders;
    v6->_deploymentEventsHolders = v7;
  }
  return v6;
}

- (id)ensureDeploymentEventsHolder:(id)a3
{
  id v4 = a3;
  v8 = objc_msgSend_objectForKey_(self->_deploymentEventsHolders, v5, (uint64_t)v4, v6, v7);
  if (!v8)
  {
    v9 = [LBFDeploymentEventsHolder alloc];
    v8 = objc_msgSend_initWithExperimentOrTaskId_deploymentId_(v9, v10, (uint64_t)self->_experimentOrTaskId, (uint64_t)v4, v11);
    objc_msgSend_setValue_forKey_(self->_deploymentEventsHolders, v12, (uint64_t)v8, (uint64_t)v4, v13);
  }
  id v14 = v8;

  return v14;
}

- (BOOL)dumpFetchedEvents
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v3 = LBFLogContextEventsHolder;
  if (os_log_type_enabled((os_log_t)LBFLogContextEventsHolder, OS_LOG_TYPE_INFO))
  {
    experimentOrTaskId = self->_experimentOrTaskId;
    *(_DWORD *)buf = 138412290;
    v26 = experimentOrTaskId;
    _os_log_impl(&dword_254547000, v3, OS_LOG_TYPE_INFO, "dumpFetchedEvents experimentId %@", buf, 0xCu);
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v9 = objc_msgSend_allValues(self->_deploymentEventsHolders, v4, v5, v6, v7, 0);
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v20, (uint64_t)v24, 16);
  if (v11)
  {
    uint64_t v16 = v11;
    uint64_t v17 = *(void *)v21;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend_dumpFetchedEvents(*(void **)(*((void *)&v20 + 1) + 8 * v18++), v12, v13, v14, v15);
      }
      while (v16 != v18);
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v20, (uint64_t)v24, 16);
    }
    while (v16);
  }

  return 1;
}

- (id)fetchedEventsInDictionaries
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v4 = LBFLogContextEventsHolder;
  if (os_log_type_enabled((os_log_t)LBFLogContextEventsHolder, OS_LOG_TYPE_INFO))
  {
    experimentOrTaskId = self->_experimentOrTaskId;
    *(_DWORD *)buf = 138412290;
    v31 = experimentOrTaskId;
    _os_log_impl(&dword_254547000, v4, OS_LOG_TYPE_INFO, "dumpFetchedEvents experimentId %@", buf, 0xCu);
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  objc_super v10 = objc_msgSend_allValues(self->_deploymentEventsHolders, v5, v6, v7, v8, 0);
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v25, (uint64_t)v29, 16);
  if (v12)
  {
    uint64_t v17 = v12;
    uint64_t v18 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(v10);
        }
        long long v20 = objc_msgSend_fetchedEventsInDictionaries(*(void **)(*((void *)&v25 + 1) + 8 * i), v13, v14, v15, v16);
        objc_msgSend_addObjectsFromArray_(v3, v21, (uint64_t)v20, v22, v23);
      }
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v25, (uint64_t)v29, 16);
    }
    while (v17);
  }

  return v3;
}

- (NSString)experimentOrTaskId
{
  return self->_experimentOrTaskId;
}

- (NSMutableDictionary)deploymentEventsHolders
{
  return self->_deploymentEventsHolders;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deploymentEventsHolders, 0);
  objc_storeStrong((id *)&self->_experimentOrTaskId, 0);
}

@end