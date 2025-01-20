@interface CESRSpeechProfileSiteManager
+ (id)defaultManager;
- (BOOL)_didHandleUpdatedSets:(id)a3 shouldDefer:(id)a4;
- (BOOL)_didPerformVerification:(id)a3;
- (BOOL)_isDataProtectionError:(id)a3;
- (BOOL)_loadSpeechProfileSites;
- (BOOL)_performRebuildWithUserId:(id)a3;
- (BOOL)_processUpdatesToSets:(id)a3 shouldDefer:(id)a4;
- (BOOL)_rebuildAll:(id)a3;
- (BOOL)_rebuildAllSpeechProfilesWithSerializedSets:(id)a3;
- (BOOL)_removeSiteWithUserId:(id)a3;
- (BOOL)_resetRootDirectory;
- (BOOL)clearAllState;
- (BOOL)clearSpeechProfileSiteWithUserId:(id)a3;
- (BOOL)handleAssetUpdate;
- (BOOL)handleSettingsChange;
- (BOOL)handleUpdatedSets:(id)a3;
- (BOOL)performMaintenance:(id)a3;
- (BOOL)rebuildAllSpeechProfilesWithSerializedSets:(id)a3;
- (BOOL)rebuildSpeechProfileSiteWithUserId:(id)a3;
- (CESRSpeechProfileSiteManager)initWithRootDirectoryURL:(id)a3 setEnumerator:(id)a4 settings:(id)a5;
- (CESRSpeechProfileSiteManager)initWithRootDirectoryURL:(id)a3 setEnumerator:(id)a4 settings:(id)a5 queue:(id)a6 siteCache:(id)a7 siteWriterCache:(id)a8 managerInfo:(id)a9;
- (id)_allSetsSortedBySpeechProfileSite:(id *)a3;
- (id)_cachedWriterAtSpeechProfileSiteURL:(id)a3;
- (id)_cachedWriterForSpeechProfileSite:(id)a3;
- (id)_sortBySpeechProfileSite:(id)a3 error:(id *)a4;
- (void)_loadOrCreateManagerInfo;
- (void)_registerTrialExperimentUpdateHandler;
@end

@implementation CESRSpeechProfileSiteManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialClient, 0);
  objc_storeStrong((id *)&self->_speechProfileSiteWriterCache, 0);
  objc_storeStrong((id *)&self->_speechProfileSiteCache, 0);
  objc_storeStrong((id *)&self->_managerInfo, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_setEnumerator, 0);
  objc_storeStrong((id *)&self->_settings, 0);

  objc_storeStrong((id *)&self->_rootDirectoryURL, 0);
}

- (BOOL)_didPerformVerification:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v34 = a3;
  v4 = (NSObject **)MEMORY[0x1E4F4E380];
  v5 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v44 = "-[CESRSpeechProfileSiteManager _didPerformVerification:]";
    _os_log_impl(&dword_1B8CCB000, v5, OS_LOG_TYPE_INFO, "%s Refreshing Settings", buf, 0xCu);
  }
  [(CESRSpeechProfileSettings *)self->_settings refreshLocalesIfNeeded];
  id v42 = 0;
  v6 = [(CESRSpeechProfileSiteManager *)self _allSetsSortedBySpeechProfileSite:&v42];
  v7 = (NSMutableDictionary *)v42;
  v8 = *v4;
  v35 = v6;
  v9 = *v4;
  if (!v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v44 = "-[CESRSpeechProfileSiteManager _didPerformVerification:]";
      __int16 v45 = 2112;
      v46 = v7;
      _os_log_error_impl(&dword_1B8CCB000, v8, OS_LOG_TYPE_ERROR, "%s Failed to resolve all sets: %@", buf, 0x16u);
    }
    BOOL v26 = 0;
    goto LABEL_33;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v44 = "-[CESRSpeechProfileSiteManager _didPerformVerification:]";
    __int16 v45 = 2112;
    v46 = v6;
    _os_log_impl(&dword_1B8CCB000, v8, OS_LOG_TYPE_INFO, "%s Performing verification with all sets: %@", buf, 0x16u);
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = [(NSMutableDictionary *)v6 allKeys];
  uint64_t v10 = [obj countByEnumeratingWithState:&v38 objects:v49 count:16];
  if (!v10) {
    goto LABEL_19;
  }
  uint64_t v12 = v10;
  uint64_t v13 = *(void *)v39;
  *(void *)&long long v11 = 136315394;
  long long v32 = v11;
  while (2)
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v39 != v13) {
        objc_enumerationMutation(obj);
      }
      v15 = *(NSMutableDictionary **)(*((void *)&v38 + 1) + 8 * i);
      speechProfileSiteCache = self->_speechProfileSiteCache;
      v37 = v7;
      -[CESRSpeechProfileSiteCache speechProfileSiteAtURL:error:](speechProfileSiteCache, "speechProfileSiteAtURL:error:", v15, &v37, v32);
      v17 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      v18 = v37;

      if (!v17)
      {
        v28 = *MEMORY[0x1E4F4E380];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v44 = "-[CESRSpeechProfileSiteManager _didPerformVerification:]";
          __int16 v45 = 2112;
          v46 = v15;
          __int16 v47 = 2112;
          v48 = v18;
          _os_log_error_impl(&dword_1B8CCB000, v28, OS_LOG_TYPE_ERROR, "%s Failed to resolve speech profile site (%@) error: %@", buf, 0x20u);
        }
        goto LABEL_32;
      }
      v19 = [(NSMutableDictionary *)v17 speechProfileSiteURL];
      v20 = [(NSMutableDictionary *)v35 objectForKey:v19];

      if (!v20)
      {
        v21 = *MEMORY[0x1E4F4E380];
        BOOL v22 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO);
        v20 = (void *)MEMORY[0x1E4F1CBF0];
        if (v22)
        {
          *(_DWORD *)buf = v32;
          v44 = "-[CESRSpeechProfileSiteManager _didPerformVerification:]";
          __int16 v45 = 2112;
          v46 = v17;
          _os_log_impl(&dword_1B8CCB000, v21, OS_LOG_TYPE_INFO, "%s No available sets at speech profile site: %@", buf, 0x16u);
        }
      }
      v23 = [(CESRSpeechProfileSiteManager *)self _cachedWriterForSpeechProfileSite:v17];
      if (([(NSMutableDictionary *)v23 performVerificationWithAllSets:v20 shouldDefer:v34] & 1) == 0)
      {
        v29 = *MEMORY[0x1E4F4E380];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v32;
          v44 = "-[CESRSpeechProfileSiteManager _didPerformVerification:]";
          __int16 v45 = 2112;
          v46 = v23;
          _os_log_error_impl(&dword_1B8CCB000, v29, OS_LOG_TYPE_ERROR, "%s Maintenance incomplete at speech profile site: %@", buf, 0x16u);
        }
LABEL_31:

LABEL_32:
        BOOL v26 = 0;
        v7 = v18;
        goto LABEL_33;
      }
      v36 = v18;
      char v24 = [(NSMutableDictionary *)v17 recordMaintenance:&v36];
      v7 = v36;

      if ((v24 & 1) == 0)
      {
        v30 = *MEMORY[0x1E4F4E380];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v44 = "-[CESRSpeechProfileSiteManager _didPerformVerification:]";
          __int16 v45 = 2112;
          v46 = v17;
          __int16 v47 = 2112;
          v48 = v7;
          _os_log_error_impl(&dword_1B8CCB000, v30, OS_LOG_TYPE_ERROR, "%s Failed to record maintenance at speech profile site: %@ error: %@", buf, 0x20u);
        }
        v18 = v7;
        goto LABEL_31;
      }
    }
    uint64_t v12 = [obj countByEnumeratingWithState:&v38 objects:v49 count:16];
    v4 = (NSObject **)MEMORY[0x1E4F4E380];
    if (v12) {
      continue;
    }
    break;
  }
LABEL_19:

  v25 = *v4;
  BOOL v26 = 1;
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    speechProfileSiteWriterCache = self->_speechProfileSiteWriterCache;
    *(_DWORD *)buf = 136315394;
    v44 = "-[CESRSpeechProfileSiteManager _didPerformVerification:]";
    __int16 v45 = 2112;
    v46 = speechProfileSiteWriterCache;
    _os_log_impl(&dword_1B8CCB000, v25, OS_LOG_TYPE_INFO, "%s Completed maintenance at all speech profile sites: %@", buf, 0x16u);
  }
LABEL_33:

  return v26;
}

- (BOOL)_rebuildAll:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v23 = 0;
  v5 = [(CESRSpeechProfileSiteManager *)self _allSetsSortedBySpeechProfileSite:&v23];
  id v6 = v23;
  if (v5)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v7 = objc_msgSend(v5, "allKeys", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v30 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          uint64_t v13 = [v5 objectForKey:v12];
          v14 = [(CESRSpeechProfileSiteManager *)self _cachedWriterAtSpeechProfileSiteURL:v12];
          if (([v14 rebuildWithAllSets:v13 shouldDefer:v4] & 1) == 0)
          {
            v16 = *MEMORY[0x1E4F4E380];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315650;
              v25 = "-[CESRSpeechProfileSiteManager _rebuildAll:]";
              __int16 v26 = 2112;
              id v27 = v14;
              __int16 v28 = 2112;
              v29 = v13;
              _os_log_error_impl(&dword_1B8CCB000, v16, OS_LOG_TYPE_ERROR, "%s Failed to rebuild Default speech profile site (%@) with sets: %@", buf, 0x20u);
            }

            BOOL v15 = 0;
            goto LABEL_14;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v30 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    BOOL v15 = 1;
LABEL_14:
  }
  else
  {
    v17 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "-[CESRSpeechProfileSiteManager _rebuildAll:]";
      __int16 v26 = 2112;
      id v27 = v6;
      _os_log_error_impl(&dword_1B8CCB000, v17, OS_LOG_TYPE_ERROR, "%s Failed to resolve all sets: %@", buf, 0x16u);
    }
    BOOL v15 = 0;
  }

  return v15;
}

- (BOOL)_processUpdatesToSets:(id)a3 shouldDefer:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v23 = a4;
  id v28 = 0;
  v7 = [(CESRSpeechProfileSiteManager *)self _allSetsSortedBySpeechProfileSite:&v28];
  id v8 = v28;
  if (v7)
  {
    if (!v6) {
      id v6 = v7;
    }
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v9 = [v7 allKeys];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v35 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      id v22 = v8;
      uint64_t v12 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          BOOL v15 = objc_msgSend(v6, "objectForKey:", v14, v22);
          v16 = [v7 objectForKey:v14];
          if ([v15 count])
          {
            v17 = [(CESRSpeechProfileSiteManager *)self _cachedWriterAtSpeechProfileSiteURL:v14];
            if (([v17 processUpdatesToSets:v15 allSets:v16 shouldDefer:v23] & 1) == 0)
            {
              long long v20 = *MEMORY[0x1E4F4E380];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315650;
                v30 = "-[CESRSpeechProfileSiteManager _processUpdatesToSets:shouldDefer:]";
                __int16 v31 = 2112;
                id v32 = v17;
                __int16 v33 = 2112;
                id v34 = v15;
                _os_log_impl(&dword_1B8CCB000, v20, OS_LOG_TYPE_INFO, "%s Did not update default speech profile site (%@) with sets: %@", buf, 0x20u);
              }

              BOOL v18 = 0;
              goto LABEL_21;
            }
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v35 count:16];
        if (v11) {
          continue;
        }
        break;
      }
      BOOL v18 = 1;
LABEL_21:
      id v8 = v22;
    }
    else
    {
      BOOL v18 = 1;
    }
  }
  else
  {
    long long v19 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v30 = "-[CESRSpeechProfileSiteManager _processUpdatesToSets:shouldDefer:]";
      __int16 v31 = 2112;
      id v32 = v8;
      _os_log_error_impl(&dword_1B8CCB000, v19, OS_LOG_TYPE_ERROR, "%s Failed to resolve all sets: %@", buf, 0x16u);
    }
    BOOL v18 = 0;
  }

  return v18;
}

- (id)_allSetsSortedBySpeechProfileSite:(id *)a3
{
  v5 = -[CCSetEnumerator allSets:](self->_setEnumerator, "allSets:");
  if (v5)
  {
    id v6 = [(CESRSpeechProfileSiteManager *)self _sortBySpeechProfileSite:v5 error:a3];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_sortBySpeechProfileSite:(id)a3 error:(id *)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if ([(CESRSpeechProfileSettings *)self->_settings isUserExclusiveSet:v11])
        {
          uint64_t v12 = [v11 account];
          uint64_t v13 = [v12 accountIdentifier];
        }
        else
        {
          uint64_t v13 = 0;
        }
        uint64_t v14 = [(CESRSpeechProfileSiteCache *)self->_speechProfileSiteCache speechProfileSiteWithUserId:v13 error:a4];
        if (!v14)
        {

          long long v19 = obj;
          id v20 = 0;
          goto LABEL_16;
        }
        BOOL v15 = v14;
        v16 = [v14 speechProfileSiteURL];
        id v17 = [v6 objectForKey:v16];

        if (!v17)
        {
          id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          BOOL v18 = [v15 speechProfileSiteURL];
          [v6 setObject:v17 forKey:v18];
        }
        [v17 addObject:v11];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  long long v19 = obj;

  id v20 = v6;
LABEL_16:

  return v20;
}

- (BOOL)_didHandleUpdatedSets:(id)a3 shouldDefer:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (os_log_t *)MEMORY[0x1E4F4E380];
  uint64_t v9 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v22 = "-[CESRSpeechProfileSiteManager _didHandleUpdatedSets:shouldDefer:]";
    __int16 v23 = 2112;
    id v24 = v6;
    _os_log_impl(&dword_1B8CCB000, v9, OS_LOG_TYPE_INFO, "%s Handling update(s) to set(s): %@", buf, 0x16u);
  }
  id v20 = 0;
  uint64_t v10 = [(CESRSpeechProfileSiteManager *)self _sortBySpeechProfileSite:v6 error:&v20];
  id v11 = v20;
  if (!v10)
  {
    id v17 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      id v22 = "-[CESRSpeechProfileSiteManager _didHandleUpdatedSets:shouldDefer:]";
      __int16 v23 = 2112;
      id v24 = v6;
      __int16 v25 = 2112;
      id v26 = v11;
      _os_log_error_impl(&dword_1B8CCB000, v17, OS_LOG_TYPE_ERROR, "%s Failed to resolve speech profile sites for set(s): %@ error: %@", buf, 0x20u);
    }
    goto LABEL_10;
  }
  if ([v10 count])
  {
    if ([(CESRSpeechProfileSiteManager *)self _processUpdatesToSets:v10 shouldDefer:v7])
    {
      uint64_t v12 = *v8;
      BOOL v13 = 1;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        id v22 = "-[CESRSpeechProfileSiteManager _didHandleUpdatedSets:shouldDefer:]";
        uint64_t v14 = "%s Finished processing all set updates";
        BOOL v15 = v12;
        uint32_t v16 = 12;
LABEL_13:
        _os_log_impl(&dword_1B8CCB000, v15, OS_LOG_TYPE_INFO, v14, buf, v16);
        goto LABEL_14;
      }
      goto LABEL_14;
    }
LABEL_10:
    BOOL v13 = 0;
    goto LABEL_14;
  }
  BOOL v18 = *v8;
  BOOL v13 = 1;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v22 = "-[CESRSpeechProfileSiteManager _didHandleUpdatedSets:shouldDefer:]";
    __int16 v23 = 2112;
    id v24 = v6;
    uint64_t v14 = "%s No applicable speech profile sites for set(s): %@";
    BOOL v15 = v18;
    uint32_t v16 = 22;
    goto LABEL_13;
  }
LABEL_14:

  return v13;
}

- (id)_cachedWriterForSpeechProfileSite:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_speechProfileSiteWriterCache objectForKey:v4];
  if (!v5)
  {
    id v6 = [[CESRSpeechProfileSiteWriter alloc] initWithSpeechProfileSite:v4 settings:self->_settings];
    if (v6)
    {
      id v5 = v6;
      speechProfileSiteWriterCache = self->_speechProfileSiteWriterCache;
      if (!speechProfileSiteWriterCache)
      {
        uint64_t v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        uint64_t v9 = self->_speechProfileSiteWriterCache;
        self->_speechProfileSiteWriterCache = v8;

        speechProfileSiteWriterCache = self->_speechProfileSiteWriterCache;
      }
      [(NSMutableDictionary *)speechProfileSiteWriterCache setObject:v5 forKey:v4];
    }
    else
    {
      uint64_t v10 = *MEMORY[0x1E4F4E380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
      {
        int v12 = 136315394;
        BOOL v13 = "-[CESRSpeechProfileSiteManager _cachedWriterForSpeechProfileSite:]";
        __int16 v14 = 2112;
        id v15 = v4;
        _os_log_error_impl(&dword_1B8CCB000, v10, OS_LOG_TYPE_ERROR, "%s Failed to initialize writer for speech profile site: %@", (uint8_t *)&v12, 0x16u);
      }
      id v5 = 0;
    }
  }

  return v5;
}

- (id)_cachedWriterAtSpeechProfileSiteURL:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  speechProfileSiteCache = self->_speechProfileSiteCache;
  id v11 = 0;
  id v6 = [(CESRSpeechProfileSiteCache *)speechProfileSiteCache speechProfileSiteAtURL:v4 error:&v11];
  id v7 = v11;
  if (v6)
  {
    uint64_t v8 = [(CESRSpeechProfileSiteManager *)self _cachedWriterForSpeechProfileSite:v6];
  }
  else
  {
    uint64_t v9 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      BOOL v13 = "-[CESRSpeechProfileSiteManager _cachedWriterAtSpeechProfileSiteURL:]";
      __int16 v14 = 2112;
      id v15 = v4;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_error_impl(&dword_1B8CCB000, v9, OS_LOG_TYPE_ERROR, "%s Failed to resolve speech profile site (%@) error: %@", buf, 0x20u);
    }
    uint64_t v8 = 0;
  }

  return v8;
}

- (BOOL)_removeSiteWithUserId:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  speechProfileSiteCache = self->_speechProfileSiteCache;
  id v18 = 0;
  id v6 = [(CESRSpeechProfileSiteCache *)speechProfileSiteCache speechProfileSiteWithUserId:v4 error:&v18];
  id v7 = v18;
  if (v6)
  {
    uint64_t v8 = self->_speechProfileSiteCache;
    id v17 = v7;
    BOOL v9 = [(CESRSpeechProfileSiteCache *)v8 removeSpeechProfileSite:v6 error:&v17];
    id v10 = v17;

    if (v9)
    {
      [(NSMutableDictionary *)self->_speechProfileSiteWriterCache removeObjectForKey:v6];
      BOOL v11 = 1;
    }
    else
    {
      BOOL v13 = *MEMORY[0x1E4F4E380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        id v20 = "-[CESRSpeechProfileSiteManager _removeSiteWithUserId:]";
        __int16 v21 = 2112;
        id v22 = v6;
        __int16 v23 = 2112;
        id v24 = v10;
        _os_log_error_impl(&dword_1B8CCB000, v13, OS_LOG_TYPE_ERROR, "%s Failed to remove speech profile site (%@) error: %@", buf, 0x20u);
      }
      BOOL v11 = 0;
    }
    id v7 = v10;
  }
  else
  {
    int v12 = (void *)*MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      id v15 = v12;
      __int16 v16 = SFUserDescription();
      *(_DWORD *)buf = 136315650;
      id v20 = "-[CESRSpeechProfileSiteManager _removeSiteWithUserId:]";
      __int16 v21 = 2112;
      id v22 = v16;
      __int16 v23 = 2112;
      id v24 = v7;
      _os_log_error_impl(&dword_1B8CCB000, v15, OS_LOG_TYPE_ERROR, "%s Failed to resolve speech profile site (%@) error: %@", buf, 0x20u);
    }
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)_resetRootDirectory
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = (os_log_t *)MEMORY[0x1E4F4E380];
  id v4 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    rootDirectoryURL = self->_rootDirectoryURL;
    *(_DWORD *)buf = 136315394;
    id v20 = "-[CESRSpeechProfileSiteManager _resetRootDirectory]";
    __int16 v21 = 2112;
    id v22 = rootDirectoryURL;
    _os_log_impl(&dword_1B8CCB000, v4, OS_LOG_TYPE_INFO, "%s Clearing root directory: %@", buf, 0x16u);
  }
  v18[2] = 0;
  char v6 = SFRemoveItemIfExistsAtURL();
  id v7 = (NSURL *)0;
  if ((v6 & 1) == 0)
  {
    BOOL v13 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v20 = "-[CESRSpeechProfileSiteManager _resetRootDirectory]";
      __int16 v21 = 2112;
      id v22 = v7;
      id v15 = "%s Failed to remove root directory: %@";
LABEL_15:
      _os_log_error_impl(&dword_1B8CCB000, v13, OS_LOG_TYPE_ERROR, v15, buf, 0x16u);
    }
LABEL_16:
    BOOL v14 = 0;
    goto LABEL_17;
  }
  [(CESRSpeechProfileSiteCache *)self->_speechProfileSiteCache clear];
  speechProfileSiteWriterCache = self->_speechProfileSiteWriterCache;
  self->_speechProfileSiteWriterCache = 0;

  v18[1] = v7;
  BOOL v9 = SFGetOrCreateDirectoryURL();
  id v10 = v7;

  if (v9)
  {
    [(CESRSpeechProfileSiteManager *)self _loadOrCreateManagerInfo];
    managerInfo = self->_managerInfo;
    v18[0] = v10;
    BOOL v12 = [(CESRDictionaryLog *)managerInfo writeUpdatedObject:&unk_1F129E2C0 forKey:@"schemaVersion" error:v18];
    id v7 = (NSURL *)v18[0];

    BOOL v13 = *v3;
    if (v12)
    {
      BOOL v14 = 1;
      if (os_log_type_enabled(*v3, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        id v20 = "-[CESRSpeechProfileSiteManager _resetRootDirectory]";
        __int16 v21 = 2112;
        id v22 = (NSURL *)&unk_1F129E2C0;
        _os_log_impl(&dword_1B8CCB000, v13, OS_LOG_TYPE_INFO, "%s Root directory initialized with schema version: %@", buf, 0x16u);
      }
      goto LABEL_17;
    }
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v20 = "-[CESRSpeechProfileSiteManager _resetRootDirectory]";
      __int16 v21 = 2112;
      id v22 = v7;
      id v15 = "%s Failed to record schema version: %@";
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  __int16 v16 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    id v20 = "-[CESRSpeechProfileSiteManager _resetRootDirectory]";
    __int16 v21 = 2112;
    id v22 = v10;
    _os_log_error_impl(&dword_1B8CCB000, v16, OS_LOG_TYPE_ERROR, "%s Failed to create root directory: %@", buf, 0x16u);
  }
  BOOL v14 = 0;
  id v7 = v10;
LABEL_17:

  return v14;
}

- (void)_loadOrCreateManagerInfo
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = [CESRDictionaryLog alloc];
  rootDirectoryURL = self->_rootDirectoryURL;
  id v9 = 0;
  id v5 = [(CESRDictionaryLog *)v3 initWithFilename:@"Manager" protectionClass:4 directory:rootDirectoryURL readOnly:0 create:1 error:&v9];
  id v6 = v9;
  managerInfo = self->_managerInfo;
  self->_managerInfo = v5;

  if (!self->_managerInfo)
  {
    uint64_t v8 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      BOOL v11 = "-[CESRSpeechProfileSiteManager _loadOrCreateManagerInfo]";
      __int16 v12 = 2112;
      id v13 = v6;
      _os_log_error_impl(&dword_1B8CCB000, v8, OS_LOG_TYPE_ERROR, "%s Failed to load manager info: %@", buf, 0x16u);
    }
  }
}

- (void)_registerTrialExperimentUpdateHandler
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!self->_trialClient)
  {
    v3 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v12 = "-[CESRSpeechProfileSiteManager _registerTrialExperimentUpdateHandler]";
      __int16 v13 = 2112;
      uint64_t v14 = @"SIRI_SPEECH_SV_SPEECH_PROFILE";
      _os_log_impl(&dword_1B8CCB000, v3, OS_LOG_TYPE_INFO, "%s Registering trial experiment update handler for %@", buf, 0x16u);
    }
    id v4 = [MEMORY[0x1E4FB0098] clientWithIdentifier:111];
    trialClient = self->_trialClient;
    self->_trialClient = v4;

    objc_initWeak((id *)buf, self);
    id v6 = self->_trialClient;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __69__CESRSpeechProfileSiteManager__registerTrialExperimentUpdateHandler__block_invoke;
    v8[3] = &unk_1E61C31B0;
    objc_copyWeak(&v10, (id *)buf);
    id v9 = @"SIRI_SPEECH_SV_SPEECH_PROFILE";
    id v7 = (id)[(TRIClient *)v6 addUpdateHandlerForNamespaceName:@"SIRI_SPEECH_SV_SPEECH_PROFILE" usingBlock:v8];

    objc_destroyWeak(&v10);
    objc_destroyWeak((id *)buf);
  }
}

void __69__CESRSpeechProfileSiteManager__registerTrialExperimentUpdateHandler__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    id v10 = "-[CESRSpeechProfileSiteManager _registerTrialExperimentUpdateHandler]_block_invoke";
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    _os_log_impl(&dword_1B8CCB000, v3, OS_LOG_TYPE_INFO, "%s Trial updates detected to %@. Rebuilding speech profile for personalization experiments.", buf, 0x16u);
  }
  id v5 = WeakRetained[4];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__CESRSpeechProfileSiteManager__registerTrialExperimentUpdateHandler__block_invoke_21;
  block[3] = &unk_1E61C38C0;
  id v8 = WeakRetained;
  id v6 = WeakRetained;
  dispatch_sync(v5, block);
}

uint64_t __69__CESRSpeechProfileSiteManager__registerTrialExperimentUpdateHandler__block_invoke_21(uint64_t a1)
{
  return [*(id *)(a1 + 32) _rebuildAll:0];
}

- (BOOL)_isDataProtectionError:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 domain];
  if (![v4 isEqual:@"com.apple.siri.speech-dictionary-log"])
  {
    BOOL v8 = 0;
LABEL_9:

    goto LABEL_10;
  }
  uint64_t v5 = [v3 code];

  if (v5 == 7)
  {
    id v6 = [v3 underlyingErrors];
    uint64_t v4 = [v6 firstObject];

    id v7 = [v4 domain];
    if ([v7 isEqual:*MEMORY[0x1E4F281F8]]) {
      BOOL v8 = [v4 code] == 257;
    }
    else {
      BOOL v8 = 0;
    }

    goto LABEL_9;
  }
  BOOL v8 = 0;
LABEL_10:

  return v8;
}

- (BOOL)_loadSpeechProfileSites
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  uint64_t v36 = 0;
  id v3 = SFGetOrCreateDirectoryURL();
  uint64_t v4 = (__CFString *)0;

  if (v3)
  {
    [(CESRSpeechProfileSiteManager *)self _loadOrCreateManagerInfo];
    uint64_t v5 = [(CESRDictionaryLog *)self->_managerInfo objectForKey:@"schemaVersion"];
    if ([&unk_1F129E2C0 isEqual:v5])
    {
      v30 = v5;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v6 = MEMORY[0x1BA9CBE80](self->_rootDirectoryURL);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v32 objects:v37 count:16];
      if (!v7) {
        goto LABEL_25;
      }
      uint64_t v8 = v7;
      id v9 = (os_log_t *)MEMORY[0x1E4F4E380];
      uint64_t v10 = *(void *)v33;
      while (1)
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v33 != v10) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = *(NSURL **)(*((void *)&v32 + 1) + 8 * v11);
          speechProfileSiteCache = self->_speechProfileSiteCache;
          __int16 v31 = v4;
          uint64_t v14 = [(CESRSpeechProfileSiteCache *)speechProfileSiteCache speechProfileSiteAtURL:v12 error:&v31];
          uint64_t v15 = v31;

          if (v14)
          {
LABEL_9:
            uint64_t v4 = v15;
            goto LABEL_10;
          }
          if ([(CESRSpeechProfileSiteManager *)self _isDataProtectionError:v15])
          {
            if (SFProtectionClassForDataSiteURL() != 6) {
              goto LABEL_9;
            }
            os_log_t v16 = *v9;
            if (os_log_type_enabled(*v9, OS_LOG_TYPE_INFO))
            {
              id v17 = v16;
              id v18 = [(NSURL *)v12 path];
              *(_DWORD *)buf = 136315394;
              long long v39 = "-[CESRSpeechProfileSiteManager _loadSpeechProfileSites]";
              __int16 v40 = 2112;
              long long v41 = v18;
              _os_log_impl(&dword_1B8CCB000, v17, OS_LOG_TYPE_INFO, "%s Class F speech profile site (%@) is inaccessible - Resetting speech profile site", buf, 0x16u);
LABEL_16:
            }
          }
          else
          {
            os_log_t v19 = *v9;
            if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
            {
              id v17 = v19;
              id v18 = [(NSURL *)v12 path];
              *(_DWORD *)buf = 136315650;
              long long v39 = "-[CESRSpeechProfileSiteManager _loadSpeechProfileSites]";
              __int16 v40 = 2112;
              long long v41 = v18;
              __int16 v42 = 2112;
              v43 = v15;
              _os_log_error_impl(&dword_1B8CCB000, v17, OS_LOG_TYPE_ERROR, "%s Failed to load speech profile site (%@) due to error: %@", buf, 0x20u);
              goto LABEL_16;
            }
          }
          int v20 = SFRemoveItemIfExistsAtURL();
          uint64_t v4 = v15;

          __int16 v21 = *v9;
          id v22 = *v9;
          if (v20)
          {
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              long long v39 = "-[CESRSpeechProfileSiteManager _loadSpeechProfileSites]";
              __int16 v40 = 2112;
              long long v41 = v12;
              _os_log_impl(&dword_1B8CCB000, v21, OS_LOG_TYPE_INFO, "%s Speech Profile site removed: %@", buf, 0x16u);
            }
          }
          else if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            long long v39 = "-[CESRSpeechProfileSiteManager _loadSpeechProfileSites]";
            __int16 v40 = 2112;
            long long v41 = v12;
            __int16 v42 = 2112;
            v43 = v4;
            _os_log_error_impl(&dword_1B8CCB000, v21, OS_LOG_TYPE_ERROR, "%s Failed to remove speech profile site: %@ error: %@", buf, 0x20u);
          }
LABEL_10:
          ++v11;
        }
        while (v8 != v11);
        uint64_t v23 = [v6 countByEnumeratingWithState:&v32 objects:v37 count:16];
        uint64_t v8 = v23;
        if (!v23)
        {
LABEL_25:

          BOOL v24 = 1;
          uint64_t v5 = v30;
          goto LABEL_34;
        }
      }
    }
    id v26 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      uint64_t v27 = @"empty";
      *(_DWORD *)buf = 136315650;
      long long v39 = "-[CESRSpeechProfileSiteManager _loadSpeechProfileSites]";
      __int16 v40 = 2112;
      if (v5) {
        uint64_t v27 = v5;
      }
      long long v41 = (NSURL *)&unk_1F129E2C0;
      __int16 v42 = 2112;
      v43 = v27;
      _os_log_impl(&dword_1B8CCB000, v26, OS_LOG_TYPE_INFO, "%s Current schema (expected: %@) not initialized yet (found: %@)", buf, 0x20u);
    }
    BOOL v24 = [(CESRSpeechProfileSiteManager *)self _resetRootDirectory];
LABEL_34:
  }
  else
  {
    uint64_t v25 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      rootDirectoryURL = self->_rootDirectoryURL;
      *(_DWORD *)buf = 136315650;
      long long v39 = "-[CESRSpeechProfileSiteManager _loadSpeechProfileSites]";
      __int16 v40 = 2112;
      long long v41 = rootDirectoryURL;
      __int16 v42 = 2112;
      v43 = v4;
      _os_log_error_impl(&dword_1B8CCB000, v25, OS_LOG_TYPE_ERROR, "%s Failed to resolve / create root directory: %@ error: %@", buf, 0x20u);
    }
    BOOL v24 = 0;
  }

  return v24;
}

- (BOOL)_rebuildAllSpeechProfilesWithSerializedSets:(id)a3
{
  uint64_t v5 = self->_setEnumerator;
  id v6 = [MEMORY[0x1E4F57FB0] setEnumeratorWithSerializedSets:a3];
  setEnumerator = self->_setEnumerator;
  self->_setEnumerator = v6;

  if ([(CESRSpeechProfileSiteManager *)self _resetRootDirectory]) {
    BOOL v8 = [(CESRSpeechProfileSiteManager *)self _rebuildAll:0];
  }
  else {
    BOOL v8 = 0;
  }
  id v9 = self->_setEnumerator;
  self->_setEnumerator = v5;

  return v8;
}

- (BOOL)_performRebuildWithUserId:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v18 = 0;
  uint64_t v5 = [(CESRSpeechProfileSiteManager *)self _allSetsSortedBySpeechProfileSite:&v18];
  id v6 = v18;
  if (v5)
  {
    speechProfileSiteCache = self->_speechProfileSiteCache;
    id v17 = v6;
    BOOL v8 = [(CESRSpeechProfileSiteCache *)speechProfileSiteCache speechProfileSiteWithUserId:v4 error:&v17];
    id v9 = v17;

    if (v8)
    {
      uint64_t v10 = [(CESRSpeechProfileSiteManager *)self _cachedWriterForSpeechProfileSite:v8];
      uint64_t v11 = [v8 speechProfileSiteURL];
      uint64_t v12 = [v5 objectForKey:v11];
      char v13 = [v10 rebuildWithAllSets:v12 shouldDefer:0];
    }
    else
    {
      uint64_t v15 = *MEMORY[0x1E4F4E380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        int v20 = "-[CESRSpeechProfileSiteManager _performRebuildWithUserId:]";
        __int16 v21 = 2112;
        id v22 = v9;
        _os_log_error_impl(&dword_1B8CCB000, v15, OS_LOG_TYPE_ERROR, "%s Failed to resolve speech profile site: %@", buf, 0x16u);
      }
      char v13 = 0;
    }
  }
  else
  {
    uint64_t v14 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      int v20 = "-[CESRSpeechProfileSiteManager _performRebuildWithUserId:]";
      __int16 v21 = 2112;
      id v22 = v6;
      _os_log_error_impl(&dword_1B8CCB000, v14, OS_LOG_TYPE_ERROR, "%s Failed to resolve all sets: %@", buf, 0x16u);
    }
    char v13 = 0;
    id v9 = v6;
  }

  return v13;
}

- (BOOL)clearAllState
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__CESRSpeechProfileSiteManager_clearAllState__block_invoke;
  v5[3] = &unk_1E61C3138;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __45__CESRSpeechProfileSiteManager_clearAllState__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _resetRootDirectory];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)clearSpeechProfileSiteWithUserId:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__CESRSpeechProfileSiteManager_clearSpeechProfileSiteWithUserId___block_invoke;
  block[3] = &unk_1E61C3188;
  id v9 = v4;
  uint64_t v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

uint64_t __65__CESRSpeechProfileSiteManager_clearSpeechProfileSiteWithUserId___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _removeSiteWithUserId:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)rebuildAllSpeechProfilesWithSerializedSets:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__CESRSpeechProfileSiteManager_rebuildAllSpeechProfilesWithSerializedSets___block_invoke;
  block[3] = &unk_1E61C3188;
  id v9 = v4;
  uint64_t v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

uint64_t __75__CESRSpeechProfileSiteManager_rebuildAllSpeechProfilesWithSerializedSets___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _rebuildAllSpeechProfilesWithSerializedSets:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)rebuildSpeechProfileSiteWithUserId:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__CESRSpeechProfileSiteManager_rebuildSpeechProfileSiteWithUserId___block_invoke;
  block[3] = &unk_1E61C3188;
  id v9 = v4;
  uint64_t v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

uint64_t __67__CESRSpeechProfileSiteManager_rebuildSpeechProfileSiteWithUserId___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _performRebuildWithUserId:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)performMaintenance:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__CESRSpeechProfileSiteManager_performMaintenance___block_invoke;
  block[3] = &unk_1E61C3160;
  id v9 = v4;
  uint64_t v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

uint64_t __51__CESRSpeechProfileSiteManager_performMaintenance___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _didPerformVerification:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)handleSettingsChange
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__CESRSpeechProfileSiteManager_handleSettingsChange__block_invoke;
  v5[3] = &unk_1E61C3138;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __52__CESRSpeechProfileSiteManager_handleSettingsChange__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) refreshLocalesIfNeeded];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)handleAssetUpdate
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__CESRSpeechProfileSiteManager_handleAssetUpdate__block_invoke;
  v5[3] = &unk_1E61C3138;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __49__CESRSpeechProfileSiteManager_handleAssetUpdate__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) refreshLocales];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)handleUpdatedSets:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__CESRSpeechProfileSiteManager_handleUpdatedSets___block_invoke;
  block[3] = &unk_1E61C3188;
  id v9 = v4;
  uint64_t v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

uint64_t __50__CESRSpeechProfileSiteManager_handleUpdatedSets___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _didHandleUpdatedSets:*(void *)(a1 + 40) shouldDefer:0];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (CESRSpeechProfileSiteManager)initWithRootDirectoryURL:(id)a3 setEnumerator:(id)a4 settings:(id)a5 queue:(id)a6 siteCache:(id)a7 siteWriterCache:(id)a8 managerInfo:(id)a9
{
  id v25 = a3;
  id v24 = a4;
  id v23 = a5;
  id v22 = a6;
  id v21 = a7;
  id v16 = a8;
  id v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)CESRSpeechProfileSiteManager;
  id v18 = [(CESRSpeechProfileSiteManager *)&v26 init];
  os_log_t v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_rootDirectoryURL, a3);
    objc_storeStrong((id *)&v19->_setEnumerator, a4);
    objc_storeStrong((id *)&v19->_settings, a5);
    objc_storeStrong((id *)&v19->_queue, a6);
    objc_storeStrong((id *)&v19->_speechProfileSiteCache, a7);
    objc_storeStrong((id *)&v19->_speechProfileSiteWriterCache, a8);
    objc_storeStrong((id *)&v19->_managerInfo, a9);
  }

  return v19;
}

- (CESRSpeechProfileSiteManager)initWithRootDirectoryURL:(id)a3 setEnumerator:(id)a4 settings:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v24.receiver = self;
  v24.super_class = (Class)CESRSpeechProfileSiteManager;
  uint64_t v12 = [(CESRSpeechProfileSiteManager *)&v24 init];
  uint64_t v13 = v12;
  if (!v12) {
    goto LABEL_4;
  }
  objc_storeStrong((id *)&v12->_rootDirectoryURL, a3);
  objc_storeStrong((id *)&v13->_setEnumerator, a4);
  objc_storeStrong((id *)&v13->_settings, a5);
  char v14 = (objc_class *)objc_opt_class();
  NSStringFromClass(v14);
  id v15 = objc_claimAutoreleasedReturnValue();
  id v16 = (const char *)[v15 cStringUsingEncoding:4];
  id v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v18 = dispatch_queue_create(v16, v17);
  queue = v13->_queue;
  v13->_queue = (OS_dispatch_queue *)v18;

  int v20 = [[CESRSpeechProfileSiteCache alloc] initWithRootDirectoryURL:v13->_rootDirectoryURL readOnly:0];
  speechProfileSiteCache = v13->_speechProfileSiteCache;
  v13->_speechProfileSiteCache = v20;

  id v22 = 0;
  if ([(CESRSpeechProfileSiteManager *)v13 _loadSpeechProfileSites])
  {
    [(CESRSpeechProfileSiteManager *)v13 _registerTrialExperimentUpdateHandler];
LABEL_4:
    id v22 = v13;
  }

  return v22;
}

+ (id)defaultManager
{
  id v2 = objc_alloc((Class)objc_opt_class());
  char v3 = SFSpeechProfileRootDirectoryURL();
  id v4 = [MEMORY[0x1E4F57FB8] setEnumeratorWithUseCase:@"SpeechProfile"];
  uint64_t v5 = +[CESRSpeechProfileSettings defaultSettings];
  id v6 = (void *)[v2 initWithRootDirectoryURL:v3 setEnumerator:v4 settings:v5];

  return v6;
}

@end