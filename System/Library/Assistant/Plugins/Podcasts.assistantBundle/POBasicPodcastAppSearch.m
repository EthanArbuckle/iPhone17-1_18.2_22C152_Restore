@interface POBasicPodcastAppSearch
- (id)_perform;
- (id)_validate;
- (id)modelObjectsAsSAMPCollections:(id)a3;
- (void)performWithCompletion:(id)a3;
@end

@implementation POBasicPodcastAppSearch

- (id)_validate
{
  return 0;
}

- (id)modelObjectsAsSAMPCollections:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v8 = objc_msgSend_array(MEMORY[0x263EFF980], v4, v5, v6, v7);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v9 = v3;
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v24, (uint64_t)v28, 16);
  if (v11)
  {
    uint64_t v16 = v11;
    uint64_t v17 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(v9);
        }
        v19 = objc_msgSend_SAMPCollection(*(void **)(*((void *)&v24 + 1) + 8 * i), v12, v13, v14, v15, (void)v24);
        objc_msgSend_addObject_(v8, v20, (uint64_t)v19, v21, v22);
      }
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v24, (uint64_t)v28, 16);
    }
    while (v16);
  }

  return v8;
}

- (void)performWithCompletion:(id)a3
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, void *))a3;
  POLogInitIfNeeded();
  uint64_t v5 = &_os_log_internal;
  if (POLogContextCommand) {
    uint64_t v6 = POLogContextCommand;
  }
  else {
    uint64_t v6 = &_os_log_internal;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = v6;
    v12 = objc_msgSend_query(self, v8, v9, v10, v11);
    int v71 = 138412290;
    v72 = v12;
    _os_log_impl(&dword_222EBF000, v7, OS_LOG_TYPE_INFO, "Going to do a basic search for %@", (uint8_t *)&v71, 0xCu);
  }
  uint64_t v13 = objc_alloc_init(POBasicPodcastAppSearchCompleted);
  if (objc_msgSend_acceptPodcastCollections(self, v14, v15, v16, v17))
  {
    uint64_t v22 = objc_msgSend_sharedInstance(PODataSource, v18, v19, v20, v21);
    long long v27 = objc_msgSend_query(self, v23, v24, v25, v26);
    uint64_t v32 = objc_msgSend_maxResults(self, v28, v29, v30, v31);
    v35 = objc_msgSend_podcastCollectionsMatchingString_maxResults_(v22, v33, (uint64_t)v27, v32, v34);

    POLogInitIfNeeded();
    if (POLogContextCommand) {
      v36 = POLogContextCommand;
    }
    else {
      v36 = v5;
    }
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      int v71 = 138412290;
      v72 = v35;
      _os_log_impl(&dword_222EBF000, v36, OS_LOG_TYPE_INFO, "Data source podcasts are %@", (uint8_t *)&v71, 0xCu);
    }
    v40 = objc_msgSend_modelObjectsAsSAMPCollections_(self, v37, (uint64_t)v35, v38, v39);
    objc_msgSend_setPodcastCollections_(v13, v41, (uint64_t)v40, v42, v43);
  }
  if (objc_msgSend_acceptPodcastStations(self, v18, v19, v20, v21))
  {
    v48 = objc_msgSend_sharedInstance(PODataSource, v44, v45, v46, v47);
    v53 = objc_msgSend_query(self, v49, v50, v51, v52);
    uint64_t v58 = objc_msgSend_maxResults(self, v54, v55, v56, v57);
    v61 = objc_msgSend_podcastStationsMatchingString_maxResults_(v48, v59, (uint64_t)v53, v58, v60);

    POLogInitIfNeeded();
    if (POLogContextCommand) {
      v62 = POLogContextCommand;
    }
    else {
      v62 = v5;
    }
    if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
    {
      int v71 = 138412290;
      v72 = v61;
      _os_log_impl(&dword_222EBF000, v62, OS_LOG_TYPE_INFO, "Data source stations are %@", (uint8_t *)&v71, 0xCu);
    }
    v66 = objc_msgSend_modelObjectsAsSAMPCollections_(self, v63, (uint64_t)v61, v64, v65);
    objc_msgSend_setPodcastStations_(v13, v67, (uint64_t)v66, v68, v69);
  }
  v70 = objc_msgSend_dictionary(v13, v44, v45, v46, v47);
  v4[2](v4, v70);
}

- (id)_perform
{
  return 0;
}

@end