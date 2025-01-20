@interface CESRSpeechProfileSiteResolver
+ (id)defaultResolver;
- (BOOL)_enumerateSiteURLsUsingBlock:(id)a3;
- (BOOL)_handleUpdatedSets:(id)a3;
- (BOOL)_handleUpdatedSets:(id)a3 siteURL:(id)a4;
- (BOOL)_loadAllSites;
- (BOOL)_loadOrCreateResolverInfo;
- (BOOL)_loadSiteAtURL:(id)a3 shouldBootstrap:(BOOL)a4;
- (BOOL)_maintainAllSites:(id)a3;
- (BOOL)_maintainSiteAtURL:(id)a3 shouldDefer:(id)a4;
- (BOOL)_prepareUpdateParametersForSiteURL:(id)a3 site:(id *)a4 siteWriter:(id *)a5 allSets:(id *)a6;
- (BOOL)_rebuildAllSites:(id)a3;
- (BOOL)_rebuildAllSitesWithSerializedSets:(id)a3;
- (BOOL)_rebuildSiteAtURL:(id)a3 shouldDefer:(id)a4;
- (BOOL)_recordGlobalMaintenanceAttempt:(id *)a3;
- (BOOL)_recordGlobalRebuildAttempt:(id *)a3;
- (BOOL)_recordGlobalResetAttempt:(id *)a3;
- (BOOL)_resetAllSites;
- (BOOL)_resetSiteAtURL:(id)a3;
- (BOOL)_siteRequiresMaintenance:(id)a3;
- (BOOL)_siteRequiresRebuild:(id)a3;
- (BOOL)_siteRequiresReset:(id)a3;
- (BOOL)clearAllState;
- (BOOL)clearSpeechProfileSiteWithUserId:(id)a3;
- (BOOL)handleAssetUpdate;
- (BOOL)handleSettingsChange;
- (BOOL)handleUpdatedSets:(id)a3;
- (BOOL)performMaintenance:(id)a3;
- (BOOL)rebuildAllSpeechProfilesWithSerializedSets:(id)a3;
- (BOOL)rebuildSpeechProfileSiteWithUserId:(id)a3;
- (CCSetEnumerator)setEnumerator;
- (CESRDictionaryLog)resolverInfo;
- (CESRSpeechProfileSettings)settings;
- (CESRSpeechProfileSiteResolver)initWithSetEnumerator:(id)a3 settings:(id)a4;
- (NSMutableDictionary)siteForURL;
- (OS_dispatch_queue)queue;
- (TRIClient)trialClient;
- (id)_allSetsAcrossUsers:(id *)a3;
- (id)_applicableSetsForSite:(id)a3 allSets:(id)a4;
- (id)_commonSiteURLForPersonaId:(id)a3;
- (id)_lastGlobalMaintenanceAttempt;
- (id)_lastGlobalRebuildAttempt;
- (id)_lastGlobalResetAttempt;
- (id)_retrieveOrLoadSiteAtURL:(id)a3 error:(id *)a4;
- (id)_siteURLsForPersonaId:(id)a3;
- (id)_userVaultSiteURLForPersonaId:(id)a3;
- (void)_handleSysdiagnoseStarted;
- (void)_registerTrialExperimentUpdateHandler;
- (void)handleSiteAvailableForPersona:(id)a3;
- (void)handleSiteUnavailableForPersona:(id)a3;
- (void)handleSysdiagnoseStarted;
- (void)setQueue:(id)a3;
- (void)setResolverInfo:(id)a3;
- (void)setSetEnumerator:(id)a3;
- (void)setSettings:(id)a3;
- (void)setSiteForURL:(id)a3;
- (void)setTrialClient:(id)a3;
@end

@implementation CESRSpeechProfileSiteResolver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialClient, 0);
  objc_storeStrong((id *)&self->_resolverInfo, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_setEnumerator, 0);
  objc_storeStrong((id *)&self->_siteForURL, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setTrialClient:(id)a3
{
}

- (TRIClient)trialClient
{
  return self->_trialClient;
}

- (void)setResolverInfo:(id)a3
{
}

- (CESRDictionaryLog)resolverInfo
{
  return self->_resolverInfo;
}

- (void)setSettings:(id)a3
{
}

- (CESRSpeechProfileSettings)settings
{
  return self->_settings;
}

- (void)setSetEnumerator:(id)a3
{
}

- (CCSetEnumerator)setEnumerator
{
  return self->_setEnumerator;
}

- (void)setSiteForURL:(id)a3
{
}

- (NSMutableDictionary)siteForURL
{
  return self->_siteForURL;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)handleSiteUnavailableForPersona:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__CESRSpeechProfileSiteResolver_handleSiteUnavailableForPersona___block_invoke;
  v7[3] = &unk_1E61C3C70;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __65__CESRSpeechProfileSiteResolver_handleSiteUnavailableForPersona___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v6 = 136315394;
    v7 = "-[CESRSpeechProfileSiteResolver handleSiteUnavailableForPersona:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = v3;
    _os_log_impl(&dword_1B8CCB000, v2, OS_LOG_TYPE_INFO, "%s Handling site unavailable for persona: %@", (uint8_t *)&v6, 0x16u);
  }
  id v4 = [*(id *)(a1 + 40) _userVaultSiteURLForPersonaId:*(void *)(a1 + 32)];
  if (v4) {
    [*(id *)(*(void *)(a1 + 40) + 16) removeObjectForKey:v4];
  }
  v5 = [MEMORY[0x1E4F3C290] sharedInstance];
  [v5 releaseContainerForPersona:*(void *)(a1 + 32)];
}

- (void)handleSiteAvailableForPersona:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__CESRSpeechProfileSiteResolver_handleSiteAvailableForPersona___block_invoke;
  v7[3] = &unk_1E61C3C70;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __63__CESRSpeechProfileSiteResolver_handleSiteAvailableForPersona___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v11 = "-[CESRSpeechProfileSiteResolver handleSiteAvailableForPersona:]_block_invoke";
    __int16 v12 = 2112;
    uint64_t v13 = v3;
    _os_log_impl(&dword_1B8CCB000, v2, OS_LOG_TYPE_INFO, "%s Handling site available for persona: %@", buf, 0x16u);
  }
  id v4 = [*(id *)(a1 + 40) _userVaultSiteURLForPersonaId:*(void *)(a1 + 32)];
  v5 = v4;
  if (v4)
  {
    id v6 = (void *)MEMORY[0x1E4F3C278];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __63__CESRSpeechProfileSiteResolver_handleSiteAvailableForPersona___block_invoke_305;
    v8[3] = &unk_1E61C3C70;
    uint64_t v7 = *(void *)(a1 + 32);
    v8[4] = *(void *)(a1 + 40);
    id v9 = v4;
    [v6 runAsPersona:v7 block:v8];
  }
}

uint64_t __63__CESRSpeechProfileSiteResolver_handleSiteAvailableForPersona___block_invoke_305(uint64_t a1)
{
  return [*(id *)(a1 + 32) _loadSiteAtURL:*(void *)(a1 + 40) shouldBootstrap:1];
}

- (void)_handleSysdiagnoseStarted
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __58__CESRSpeechProfileSiteResolver__handleSysdiagnoseStarted__block_invoke;
  v2[3] = &unk_1E61C31D8;
  v2[4] = self;
  [(CESRSpeechProfileSiteResolver *)self _enumerateSiteURLsUsingBlock:v2];
}

uint64_t __58__CESRSpeechProfileSiteResolver__handleSysdiagnoseStarted__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v9 = 0;
  id v10 = 0;
  id v8 = 0;
  uint64_t v3 = [v2 _prepareUpdateParametersForSiteURL:a2 site:&v10 siteWriter:&v9 allSets:&v8];
  id v4 = v10;
  id v5 = v9;
  id v6 = v8;
  if (v3) {
    [v5 logCurrentStateWithAllSets:v6];
  }

  return v3;
}

- (id)_applicableSetsForSite:(id)a3 allSets:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v34 = [MEMORY[0x1E4F1CA48] array];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v35 objects:v47 count:16];
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v36;
    *(void *)&long long v9 = 136315906;
    long long v33 = v9;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v36 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(__CFString **)(*((void *)&v35 + 1) + 8 * i);
        uint64_t v14 = [(__CFString *)v13 personaIdentifier];

        if (v14)
        {
          v15 = [MEMORY[0x1E4F3C278] sharedInstance];
          v16 = [(__CFString *)v13 personaIdentifier];
          char v17 = [v15 personaMatchesEnrolledUser:v16];

          if ((v17 & 1) == 0)
          {
            v28 = *MEMORY[0x1E4F4E380];
            if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR)) {
              continue;
            }
            *(_DWORD *)buf = 136315650;
            v40 = "-[CESRSpeechProfileSiteResolver _applicableSetsForSite:allSets:]";
            __int16 v41 = 2112;
            id v42 = v5;
            __int16 v43 = 2112;
            v44 = v13;
            v29 = v28;
            v30 = "%s Site (%@) ignoring set with invalid persona: %@";
LABEL_20:
            _os_log_error_impl(&dword_1B8CCB000, v29, OS_LOG_TYPE_ERROR, v30, buf, 0x20u);
            continue;
          }
          uint64_t v18 = [v5 personaId];
          if (v18)
          {
            v19 = (void *)v18;
            v20 = [v5 personaId];
            v21 = [(__CFString *)v13 personaIdentifier];
            char v22 = [v20 isEqualToString:v21];

            if ((v22 & 1) == 0)
            {
              v31 = *MEMORY[0x1E4F4E380];
              if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR)) {
                continue;
              }
              *(_DWORD *)buf = 136315650;
              v40 = "-[CESRSpeechProfileSiteResolver _applicableSetsForSite:allSets:]";
              __int16 v41 = 2112;
              id v42 = v5;
              __int16 v43 = 2112;
              v44 = v13;
              v29 = v31;
              v30 = "%s Site (%@) ignoring set with mismatched persona: %@";
              goto LABEL_20;
            }
          }
        }
        int v23 = [v5 isInUserVault];
        if (v23 == [(__CFString *)v13 isInUserVault])
        {
          [v34 addObject:v13];
        }
        else
        {
          v24 = (void *)*MEMORY[0x1E4F4E380];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
          {
            v25 = v24;
            int v26 = [(__CFString *)v13 isInUserVault];
            *(_DWORD *)buf = v33;
            v27 = @"is NOT";
            if (v26) {
              v27 = @"is";
            }
            v40 = "-[CESRSpeechProfileSiteResolver _applicableSetsForSite:allSets:]";
            __int16 v41 = 2112;
            id v42 = v5;
            __int16 v43 = 2112;
            v44 = v27;
            __int16 v45 = 2112;
            v46 = v13;
            _os_log_error_impl(&dword_1B8CCB000, v25, OS_LOG_TYPE_ERROR, "%s Site (%@) ignoring set since it %@ from UserVault: %@", buf, 0x2Au);
          }
        }
      }
      uint64_t v10 = [v7 countByEnumeratingWithState:&v35 objects:v47 count:16];
    }
    while (v10);
  }

  return v34;
}

- (id)_allSetsAcrossUsers:(id *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  int v23 = __Block_byref_object_copy__1873;
  v24 = __Block_byref_object_dispose__1874;
  id v25 = [MEMORY[0x1E4F1CA48] array];
  id v5 = [MEMORY[0x1E4F3C278] sharedInstance];
  id v6 = [v5 personaIds];

  v15 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(MEMORY[0x1E4F3C278], "runAsPersona:block:", v15, MEMORY[0x1E4F143A8], 3221225472, __53__CESRSpeechProfileSiteResolver__allSetsAcrossUsers___block_invoke, &unk_1E61C3188, self, *(void *)(*((void *)&v16 + 1) + 8 * i), &v20, (void)v16);
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v30 count:16];
    }
    while (v8);
  }

  voucher_adopt();
  uint64_t v11 = [(CCSetEnumerator *)self->_setEnumerator allSetsWithOptions:0 error:v15];
  if (v11)
  {
    __int16 v12 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v27 = "-[CESRSpeechProfileSiteResolver _allSetsAcrossUsers:]";
      __int16 v28 = 2112;
      v29 = v11;
      _os_log_impl(&dword_1B8CCB000, v12, OS_LOG_TYPE_INFO, "%s Resolved all system sets: %@", buf, 0x16u);
    }
    objc_msgSend((id)v21[5], "addObjectsFromArray:", v11, v15);

    id v13 = (id)v21[5];
  }
  else
  {

    id v13 = 0;
  }

  _Block_object_dispose(&v20, 8);

  return v13;
}

void __53__CESRSpeechProfileSiteResolver__allSetsAcrossUsers___block_invoke(void *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1[4] + 24);
  id v9 = 0;
  uint64_t v3 = [v2 allSetsWithOptions:0 error:&v9];
  id v4 = v9;
  id v5 = *MEMORY[0x1E4F4E380];
  id v6 = *MEMORY[0x1E4F4E380];
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = a1[5];
      *(_DWORD *)buf = 136315650;
      uint64_t v11 = "-[CESRSpeechProfileSiteResolver _allSetsAcrossUsers:]_block_invoke";
      __int16 v12 = 2112;
      uint64_t v13 = v7;
      __int16 v14 = 2112;
      id v15 = v3;
      _os_log_impl(&dword_1B8CCB000, v5, OS_LOG_TYPE_INFO, "%s Resolved all sets for persona (%@): %@", buf, 0x20u);
    }
    [*(id *)(*(void *)(a1[6] + 8) + 40) addObjectsFromArray:v3];
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = a1[5];
    *(_DWORD *)buf = 136315650;
    uint64_t v11 = "-[CESRSpeechProfileSiteResolver _allSetsAcrossUsers:]_block_invoke";
    __int16 v12 = 2112;
    uint64_t v13 = v8;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_error_impl(&dword_1B8CCB000, v5, OS_LOG_TYPE_ERROR, "%s Failed to resolve all sets for persona (%@), error: %@", buf, 0x20u);
  }
}

- (BOOL)_prepareUpdateParametersForSiteURL:(id)a3 site:(id *)a4 siteWriter:(id *)a5 allSets:(id *)a6
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v28 = 0;
  uint64_t v11 = [(CESRSpeechProfileSiteResolver *)self _retrieveOrLoadSiteAtURL:v10 error:&v28];
  id v12 = v28;
  if (v11)
  {
    uint64_t v13 = [v11 isInUserVault];
    if (AFIsATVOnly())
    {
      id v27 = v12;
      __int16 v14 = &v27;
      uint64_t v15 = [(CESRSpeechProfileSiteResolver *)self _allSetsAcrossUsers:&v27];
    }
    else
    {
      setEnumerator = self->_setEnumerator;
      id v26 = v12;
      __int16 v14 = &v26;
      uint64_t v15 = [(CCSetEnumerator *)setEnumerator allSetsWithOptions:v13 error:&v26];
    }
    uint64_t v20 = (void *)v15;
    id v18 = *v14;

    if (v20)
    {
      v21 = [(CESRSpeechProfileSiteResolver *)self _applicableSetsForSite:v11 allSets:v20];
      uint64_t v22 = [v21 count];
      BOOL v17 = v22 != 0;
      if (v22)
      {
        if (a4) {
          *a4 = v11;
        }
        if (a5) {
          *a5 = [[CESRSpeechProfileSiteWriter alloc] initWithSpeechProfileSite:v11 settings:self->_settings];
        }
        if (a6) {
          *a6 = v21;
        }
      }
      else
      {
        v24 = *MEMORY[0x1E4F4E380];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v30 = "-[CESRSpeechProfileSiteResolver _prepareUpdateParametersForSiteURL:site:siteWriter:allSets:]";
          __int16 v31 = 2112;
          id v32 = v11;
          _os_log_error_impl(&dword_1B8CCB000, v24, OS_LOG_TYPE_ERROR, "%s No applicable sets for site: %@", buf, 0x16u);
        }
      }
    }
    else
    {
      int v23 = *MEMORY[0x1E4F4E380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v30 = "-[CESRSpeechProfileSiteResolver _prepareUpdateParametersForSiteURL:site:siteWriter:allSets:]";
        __int16 v31 = 2112;
        id v32 = v18;
        _os_log_error_impl(&dword_1B8CCB000, v23, OS_LOG_TYPE_ERROR, "%s Failed to resolve all sets, error: %@", buf, 0x16u);
      }
      BOOL v17 = 0;
    }
  }
  else
  {
    uint64_t v16 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v30 = "-[CESRSpeechProfileSiteResolver _prepareUpdateParametersForSiteURL:site:siteWriter:allSets:]";
      __int16 v31 = 2112;
      id v32 = v10;
      __int16 v33 = 2112;
      id v34 = v12;
      _os_log_error_impl(&dword_1B8CCB000, v16, OS_LOG_TYPE_ERROR, "%s Failed to load site at URL (%@), error: %@", buf, 0x20u);
    }
    BOOL v17 = 0;
    id v18 = v12;
  }

  return v17;
}

- (BOOL)_handleUpdatedSets:(id)a3 siteURL:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v21 = 0;
  id v22 = 0;
  id v20 = 0;
  BOOL v7 = [(CESRSpeechProfileSiteResolver *)self _prepareUpdateParametersForSiteURL:a4 site:&v22 siteWriter:&v21 allSets:&v20];
  id v8 = v22;
  id v9 = v21;
  id v10 = v20;
  if (v7)
  {
    uint64_t v11 = [(CESRSpeechProfileSiteResolver *)self _applicableSetsForSite:v8 allSets:v6];
    uint64_t v12 = [v11 count];
    uint64_t v13 = (os_log_t *)MEMORY[0x1E4F4E380];
    __int16 v14 = *MEMORY[0x1E4F4E380];
    if (v12)
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v24 = "-[CESRSpeechProfileSiteResolver _handleUpdatedSets:siteURL:]";
        __int16 v25 = 2112;
        id v26 = v8;
        __int16 v27 = 2112;
        id v28 = v11;
        _os_log_impl(&dword_1B8CCB000, v14, OS_LOG_TYPE_INFO, "%s Site (%@) processing update(s) to set(s): %@", buf, 0x20u);
      }
      char v15 = [v9 processUpdatesToSets:v11 allSets:v10 shouldDefer:0];
      uint64_t v16 = *v13;
      BOOL v17 = os_log_type_enabled(*v13, OS_LOG_TYPE_INFO);
      if (v15)
      {
        if (v17)
        {
          *(_DWORD *)buf = 136315394;
          v24 = "-[CESRSpeechProfileSiteResolver _handleUpdatedSets:siteURL:]";
          __int16 v25 = 2112;
          id v26 = v8;
          BOOL v18 = 1;
          _os_log_impl(&dword_1B8CCB000, v16, OS_LOG_TYPE_INFO, "%s Finished processing all set updates for site: %@", buf, 0x16u);
        }
        else
        {
          BOOL v18 = 1;
        }
        goto LABEL_14;
      }
      if (v17)
      {
        *(_DWORD *)buf = 136315650;
        v24 = "-[CESRSpeechProfileSiteResolver _handleUpdatedSets:siteURL:]";
        __int16 v25 = 2112;
        id v26 = v8;
        __int16 v27 = 2112;
        id v28 = v11;
        _os_log_impl(&dword_1B8CCB000, v16, OS_LOG_TYPE_INFO, "%s Did not update site (%@) with sets: %@", buf, 0x20u);
      }
    }
    else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[CESRSpeechProfileSiteResolver _handleUpdatedSets:siteURL:]";
      __int16 v25 = 2112;
      id v26 = v8;
      _os_log_error_impl(&dword_1B8CCB000, v14, OS_LOG_TYPE_ERROR, "%s No applicable sets for site: %@", buf, 0x16u);
    }
    BOOL v18 = 0;
LABEL_14:

    goto LABEL_15;
  }
  BOOL v18 = 0;
LABEL_15:

  return v18;
}

- (BOOL)_handleUpdatedSets:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  id v6 = [MEMORY[0x1E4F1CA48] array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = v4;
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
        uint64_t v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v12, "isInUserVault", (void)v19)) {
          uint64_t v13 = v5;
        }
        else {
          uint64_t v13 = v6;
        }
        [v13 addObject:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }

  __int16 v14 = [MEMORY[0x1E4F3C278] currentPersonaId];
  char v15 = [(CESRSpeechProfileSiteResolver *)self _userVaultSiteURLForPersonaId:v14];
  uint64_t v16 = [(CESRSpeechProfileSiteResolver *)self _commonSiteURLForPersonaId:v14];
  int v17 = !v15
     || ![v5 count]
     || [(CESRSpeechProfileSiteResolver *)self _handleUpdatedSets:v5 siteURL:v15];
  if (objc_msgSend(v6, "count", (void)v19)) {
    v17 &= [(CESRSpeechProfileSiteResolver *)self _handleUpdatedSets:v6 siteURL:v16];
  }

  return v17;
}

- (BOOL)_maintainSiteAtURL:(id)a3 shouldDefer:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v19 = 0;
  id v20 = 0;
  id v18 = 0;
  int v7 = [(CESRSpeechProfileSiteResolver *)self _prepareUpdateParametersForSiteURL:a3 site:&v20 siteWriter:&v19 allSets:&v18];
  id v8 = v20;
  id v9 = v19;
  id v10 = v18;
  if (v7)
  {
    uint64_t v11 = (os_log_t *)MEMORY[0x1E4F4E380];
    uint64_t v12 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      long long v22 = "-[CESRSpeechProfileSiteResolver _maintainSiteAtURL:shouldDefer:]";
      __int16 v23 = 2112;
      id v24 = v8;
      __int16 v25 = 2112;
      id v26 = v10;
      _os_log_impl(&dword_1B8CCB000, v12, OS_LOG_TYPE_INFO, "%s Performing maintenance at site (%@) with sets: %@", buf, 0x20u);
    }
    if ([v9 performVerificationWithAllSets:v10 shouldDefer:v6])
    {
      id v17 = 0;
      LOBYTE(v7) = [v8 recordMaintenance:&v17];
      id v13 = v17;
      __int16 v14 = *v11;
      if (v7)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          long long v22 = "-[CESRSpeechProfileSiteResolver _maintainSiteAtURL:shouldDefer:]";
          __int16 v23 = 2112;
          id v24 = v8;
          _os_log_impl(&dword_1B8CCB000, v14, OS_LOG_TYPE_INFO, "%s Completed maintenance at site: %@", buf, 0x16u);
        }
      }
      else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        long long v22 = "-[CESRSpeechProfileSiteResolver _maintainSiteAtURL:shouldDefer:]";
        __int16 v23 = 2112;
        id v24 = v8;
        __int16 v25 = 2112;
        id v26 = v13;
        _os_log_error_impl(&dword_1B8CCB000, v14, OS_LOG_TYPE_ERROR, "%s Failed to record maintenance at site (%@), error: %@", buf, 0x20u);
      }
    }
    else
    {
      char v15 = *v11;
      if (os_log_type_enabled(*v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        long long v22 = "-[CESRSpeechProfileSiteResolver _maintainSiteAtURL:shouldDefer:]";
        __int16 v23 = 2112;
        id v24 = v8;
        _os_log_error_impl(&dword_1B8CCB000, v15, OS_LOG_TYPE_ERROR, "%s Maintenance incomplete at site: %@", buf, 0x16u);
      }
      LOBYTE(v7) = 0;
    }
  }

  return v7;
}

- (BOOL)_maintainAllSites:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (os_log_t *)MEMORY[0x1E4F4E380];
  id v6 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v17 = "-[CESRSpeechProfileSiteResolver _maintainAllSites:]";
    _os_log_impl(&dword_1B8CCB000, v6, OS_LOG_TYPE_INFO, "%s Performing maintenance at all sites...", buf, 0xCu);
  }
  id v15 = 0;
  BOOL v7 = [(CESRSpeechProfileSiteResolver *)self _recordGlobalMaintenanceAttempt:&v15];
  id v8 = v15;
  if (!v7)
  {
    id v9 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v17 = "-[CESRSpeechProfileSiteResolver _maintainAllSites:]";
      __int16 v18 = 2112;
      id v19 = v8;
      _os_log_error_impl(&dword_1B8CCB000, v9, OS_LOG_TYPE_ERROR, "%s Failed to record global maintenance attempt, error: %@", buf, 0x16u);
    }
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __51__CESRSpeechProfileSiteResolver__maintainAllSites___block_invoke;
  v13[3] = &unk_1E61C3200;
  v13[4] = self;
  id v14 = v4;
  id v10 = v4;
  BOOL v11 = [(CESRSpeechProfileSiteResolver *)self _enumerateSiteURLsUsingBlock:v13];

  return v11;
}

uint64_t __51__CESRSpeechProfileSiteResolver__maintainAllSites___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _maintainSiteAtURL:a2 shouldDefer:*(void *)(a1 + 40)];
}

- (BOOL)_rebuildSiteAtURL:(id)a3 shouldDefer:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v19 = 0;
  id v20 = 0;
  id v18 = 0;
  int v7 = [(CESRSpeechProfileSiteResolver *)self _prepareUpdateParametersForSiteURL:a3 site:&v20 siteWriter:&v19 allSets:&v18];
  id v8 = v20;
  id v9 = v19;
  id v10 = v18;
  if (v7)
  {
    BOOL v11 = (os_log_t *)MEMORY[0x1E4F4E380];
    uint64_t v12 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      long long v22 = "-[CESRSpeechProfileSiteResolver _rebuildSiteAtURL:shouldDefer:]";
      __int16 v23 = 2112;
      id v24 = v8;
      __int16 v25 = 2112;
      id v26 = v10;
      _os_log_impl(&dword_1B8CCB000, v12, OS_LOG_TYPE_INFO, "%s Rebuilding site (%@) with sets: %@", buf, 0x20u);
    }
    if ([v9 rebuildWithAllSets:v10 shouldDefer:v6])
    {
      id v17 = 0;
      LOBYTE(v7) = [v8 recordRebuild:&v17];
      id v13 = v17;
      id v14 = *v11;
      if (v7)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          long long v22 = "-[CESRSpeechProfileSiteResolver _rebuildSiteAtURL:shouldDefer:]";
          __int16 v23 = 2112;
          id v24 = v8;
          _os_log_impl(&dword_1B8CCB000, v14, OS_LOG_TYPE_INFO, "%s Rebuilt all profiles at site: %@", buf, 0x16u);
        }
      }
      else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        long long v22 = "-[CESRSpeechProfileSiteResolver _rebuildSiteAtURL:shouldDefer:]";
        __int16 v23 = 2112;
        id v24 = v8;
        __int16 v25 = 2112;
        id v26 = v13;
        _os_log_error_impl(&dword_1B8CCB000, v14, OS_LOG_TYPE_ERROR, "%s Failed to record rebuild at site (%@), error: %@", buf, 0x20u);
      }
    }
    else
    {
      id v15 = *v11;
      if (os_log_type_enabled(*v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        long long v22 = "-[CESRSpeechProfileSiteResolver _rebuildSiteAtURL:shouldDefer:]";
        __int16 v23 = 2112;
        id v24 = v8;
        __int16 v25 = 2112;
        id v26 = v10;
        _os_log_error_impl(&dword_1B8CCB000, v15, OS_LOG_TYPE_ERROR, "%s Failed to rebuild site (%@) with sets: %@", buf, 0x20u);
      }
      LOBYTE(v7) = 0;
    }
  }

  return v7;
}

- (BOOL)_rebuildAllSites:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (os_log_t *)MEMORY[0x1E4F4E380];
  id v6 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v17 = "-[CESRSpeechProfileSiteResolver _rebuildAllSites:]";
    _os_log_impl(&dword_1B8CCB000, v6, OS_LOG_TYPE_INFO, "%s Rebuilding all sites...", buf, 0xCu);
  }
  id v15 = 0;
  BOOL v7 = [(CESRSpeechProfileSiteResolver *)self _recordGlobalRebuildAttempt:&v15];
  id v8 = v15;
  if (!v7)
  {
    id v9 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v17 = "-[CESRSpeechProfileSiteResolver _rebuildAllSites:]";
      __int16 v18 = 2112;
      id v19 = v8;
      _os_log_error_impl(&dword_1B8CCB000, v9, OS_LOG_TYPE_ERROR, "%s Failed to record global rebuild attempt, error: %@", buf, 0x16u);
    }
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __50__CESRSpeechProfileSiteResolver__rebuildAllSites___block_invoke;
  v13[3] = &unk_1E61C3200;
  v13[4] = self;
  id v14 = v4;
  id v10 = v4;
  BOOL v11 = [(CESRSpeechProfileSiteResolver *)self _enumerateSiteURLsUsingBlock:v13];

  return v11;
}

uint64_t __50__CESRSpeechProfileSiteResolver__rebuildAllSites___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _rebuildSiteAtURL:a2 shouldDefer:*(void *)(a1 + 40)];
}

- (BOOL)_rebuildAllSitesWithSerializedSets:(id)a3
{
  id v5 = self->_setEnumerator;
  id v6 = [MEMORY[0x1E4F57FB0] setEnumeratorWithSerializedSets:a3];
  setEnumerator = self->_setEnumerator;
  self->_setEnumerator = v6;

  if ([(CESRSpeechProfileSiteResolver *)self _resetAllSites]) {
    BOOL v8 = [(CESRSpeechProfileSiteResolver *)self _rebuildAllSites:0];
  }
  else {
    BOOL v8 = 0;
  }
  id v9 = self->_setEnumerator;
  self->_setEnumerator = v5;

  return v8;
}

- (BOOL)_resetSiteAtURL:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (os_log_t *)MEMORY[0x1E4F4E380];
  id v6 = *MEMORY[0x1E4F4E380];
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v31 = "-[CESRSpeechProfileSiteResolver _resetSiteAtURL:]";
      __int16 v32 = 2112;
      id v33 = v4;
      _os_log_impl(&dword_1B8CCB000, v6, OS_LOG_TYPE_INFO, "%s Resetting site at URL: %@", buf, 0x16u);
    }
    [(NSMutableDictionary *)self->_siteForURL removeObjectForKey:v4];
    uint64_t v29 = 0;
    char v7 = SFRemoveItemIfExistsAtURL();
    id v8 = 0;
    id v9 = v8;
    if ((v7 & 1) == 0)
    {
      __int16 v18 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        __int16 v31 = "-[CESRSpeechProfileSiteResolver _resetSiteAtURL:]";
        __int16 v32 = 2112;
        id v33 = v4;
        __int16 v34 = 2112;
        uint64_t v35 = v9;
        _os_log_error_impl(&dword_1B8CCB000, v18, OS_LOG_TYPE_ERROR, "%s Failed to remove site at URL (%@), error: %@", buf, 0x20u);
      }
      BOOL v17 = 0;
      goto LABEL_28;
    }
    id v28 = v8;
    id v10 = SFGetOrCreateDirectoryURL();
    id v11 = v28;

    if (!v10)
    {
      id v19 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        __int16 v31 = "-[CESRSpeechProfileSiteResolver _resetSiteAtURL:]";
        __int16 v32 = 2112;
        id v33 = v4;
        __int16 v34 = 2112;
        uint64_t v35 = v11;
        _os_log_error_impl(&dword_1B8CCB000, v19, OS_LOG_TYPE_ERROR, "%s Failed to create site at URL (%@), error: %@", buf, 0x20u);
      }
      BOOL v17 = 0;
      id v9 = v11;
      goto LABEL_28;
    }
    id v27 = v11;
    uint64_t v12 = [(CESRSpeechProfileSiteResolver *)self _retrieveOrLoadSiteAtURL:v4 error:&v27];
    id v9 = v27;

    if (v12)
    {
      id v26 = v9;
      char v13 = [v12 recordSchemaVersion:&v26];
      id v14 = v26;

      if ((v13 & 1) == 0)
      {
        __int16 v23 = *v5;
        if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          __int16 v31 = "-[CESRSpeechProfileSiteResolver _resetSiteAtURL:]";
          __int16 v32 = 2112;
          id v33 = v12;
          __int16 v34 = 2112;
          uint64_t v35 = v14;
          _os_log_error_impl(&dword_1B8CCB000, v23, OS_LOG_TYPE_ERROR, "%s Failed to record schema version for site (%@), error: %@", buf, 0x20u);
        }
        BOOL v17 = 0;
        id v9 = v14;
        goto LABEL_27;
      }
      id v25 = v14;
      char v15 = [v12 recordReset:&v25];
      id v9 = v25;

      uint64_t v16 = *v5;
      if (v15)
      {
        BOOL v17 = 1;
        if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          __int16 v31 = "-[CESRSpeechProfileSiteResolver _resetSiteAtURL:]";
          __int16 v32 = 2112;
          id v33 = v12;
          __int16 v34 = 2112;
          uint64_t v35 = &unk_1F129E830;
          _os_log_impl(&dword_1B8CCB000, v16, OS_LOG_TYPE_INFO, "%s Site (%@) initialized with schema version: %@", buf, 0x20u);
        }
        goto LABEL_27;
      }
      if (!os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
      {
LABEL_26:
        BOOL v17 = 0;
LABEL_27:

LABEL_28:
        goto LABEL_29;
      }
      *(_DWORD *)buf = 136315650;
      __int16 v31 = "-[CESRSpeechProfileSiteResolver _resetSiteAtURL:]";
      __int16 v32 = 2112;
      id v33 = v12;
      __int16 v34 = 2112;
      uint64_t v35 = v9;
      long long v21 = "%s Failed to record reset for site (%@), error: %@";
      long long v22 = v16;
    }
    else
    {
      os_log_t v20 = *v5;
      if (!os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR)) {
        goto LABEL_26;
      }
      *(_DWORD *)buf = 136315650;
      __int16 v31 = "-[CESRSpeechProfileSiteResolver _resetSiteAtURL:]";
      __int16 v32 = 2112;
      id v33 = v4;
      __int16 v34 = 2112;
      uint64_t v35 = v9;
      long long v21 = "%s Failed to load site at URL (%@), error: %@";
      long long v22 = v20;
    }
    _os_log_error_impl(&dword_1B8CCB000, v22, OS_LOG_TYPE_ERROR, v21, buf, 0x20u);
    goto LABEL_26;
  }
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v31 = "-[CESRSpeechProfileSiteResolver _resetSiteAtURL:]";
    _os_log_error_impl(&dword_1B8CCB000, v6, OS_LOG_TYPE_ERROR, "%s siteURL cannot be nil.", buf, 0xCu);
  }
  BOOL v17 = 0;
LABEL_29:

  return v17;
}

- (BOOL)_resetAllSites
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (os_log_t *)MEMORY[0x1E4F4E380];
  id v4 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    char v13 = "-[CESRSpeechProfileSiteResolver _resetAllSites]";
    _os_log_impl(&dword_1B8CCB000, v4, OS_LOG_TYPE_INFO, "%s Resetting all sites...", buf, 0xCu);
  }
  id v11 = 0;
  BOOL v5 = [(CESRSpeechProfileSiteResolver *)self _recordGlobalResetAttempt:&v11];
  id v6 = v11;
  if (!v5)
  {
    char v7 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      char v13 = "-[CESRSpeechProfileSiteResolver _resetAllSites]";
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_error_impl(&dword_1B8CCB000, v7, OS_LOG_TYPE_ERROR, "%s Failed to record global reset attempt, error: %@", buf, 0x16u);
    }
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47__CESRSpeechProfileSiteResolver__resetAllSites__block_invoke;
  v10[3] = &unk_1E61C31D8;
  v10[4] = self;
  BOOL v8 = [(CESRSpeechProfileSiteResolver *)self _enumerateSiteURLsUsingBlock:v10];

  return v8;
}

uint64_t __47__CESRSpeechProfileSiteResolver__resetAllSites__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _resetSiteAtURL:a2];
}

- (BOOL)_loadSiteAtURL:(id)a3 shouldBootstrap:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  char v7 = (os_log_t *)MEMORY[0x1E4F4E380];
  BOOL v8 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v19 = "-[CESRSpeechProfileSiteResolver _loadSiteAtURL:shouldBootstrap:]";
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl(&dword_1B8CCB000, v8, OS_LOG_TYPE_INFO, "%s Loading site at URL: %@", buf, 0x16u);
  }
  v17[1] = 0;
  id v9 = SFGetOrCreateDirectoryURL();
  id v10 = 0;

  if (v9)
  {
    v17[0] = v10;
    id v11 = [(CESRSpeechProfileSiteResolver *)self _retrieveOrLoadSiteAtURL:v6 error:v17];
    id v12 = v17[0];

    if (v11 && ![(CESRSpeechProfileSiteResolver *)self _siteRequiresReset:v11])
    {
      if (![(CESRSpeechProfileSiteResolver *)self _siteRequiresRebuild:v11])
      {
        if (![(CESRSpeechProfileSiteResolver *)self _siteRequiresMaintenance:v11])
        {
          LOBYTE(v13) = 1;
          goto LABEL_15;
        }
        BOOL v15 = [(CESRSpeechProfileSiteResolver *)self _maintainSiteAtURL:v6 shouldDefer:0];
LABEL_14:
        LOBYTE(v13) = v15;
LABEL_15:

        id v10 = v12;
        goto LABEL_16;
      }
    }
    else
    {
      BOOL v13 = [(CESRSpeechProfileSiteResolver *)self _resetSiteAtURL:v6];
      if (!v13 || !v4) {
        goto LABEL_15;
      }
    }
    BOOL v15 = [(CESRSpeechProfileSiteResolver *)self _rebuildSiteAtURL:v6 shouldDefer:0];
    goto LABEL_14;
  }
  __int16 v14 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    id v19 = "-[CESRSpeechProfileSiteResolver _loadSiteAtURL:shouldBootstrap:]";
    __int16 v20 = 2112;
    id v21 = v6;
    __int16 v22 = 2112;
    id v23 = v10;
    _os_log_error_impl(&dword_1B8CCB000, v14, OS_LOG_TYPE_ERROR, "%s Failed to get/create site at URL (%@), error: %@", buf, 0x20u);
  }
  LOBYTE(v13) = 0;
LABEL_16:

  return v13;
}

- (BOOL)_loadAllSites
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    char v7 = "-[CESRSpeechProfileSiteResolver _loadAllSites]";
    _os_log_impl(&dword_1B8CCB000, v3, OS_LOG_TYPE_INFO, "%s Loading all sites...", buf, 0xCu);
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__CESRSpeechProfileSiteResolver__loadAllSites__block_invoke;
  v5[3] = &unk_1E61C31D8;
  v5[4] = self;
  return [(CESRSpeechProfileSiteResolver *)self _enumerateSiteURLsUsingBlock:v5];
}

uint64_t __46__CESRSpeechProfileSiteResolver__loadAllSites__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _loadSiteAtURL:a2 shouldBootstrap:0];
}

- (BOOL)_enumerateSiteURLsUsingBlock:(id)a3
{
  BOOL v4 = (uint64_t (**)(id, void *))a3;
  BOOL v5 = [(CESRSpeechProfileSiteResolver *)self _commonSiteURLForPersonaId:0];
  char v6 = v4[2](v4, v5);

  return v6;
}

- (BOOL)_siteRequiresMaintenance:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [v4 lastRebuild];
  char v6 = [v4 lastMaintenance];
  char v7 = CESRLaterDate(v5, v6);

  uint64_t v8 = [(CESRSpeechProfileSiteResolver *)self _lastGlobalMaintenanceAttempt];
  id v9 = (void *)v8;
  BOOL v10 = 0;
  if (v7 && v8)
  {
    if ([v7 compare:v8] == -1)
    {
      id v11 = (void *)*MEMORY[0x1E4F4E380];
      BOOL v10 = 1;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
      {
        id v12 = v11;
        BOOL v13 = [v4 speechProfileSiteURL];
        __int16 v14 = CESRISO8601StringForDate(v9);
        BOOL v15 = CESRISO8601StringForDate(v7);
        int v17 = 136315906;
        __int16 v18 = "-[CESRSpeechProfileSiteResolver _siteRequiresMaintenance:]";
        __int16 v19 = 2112;
        __int16 v20 = v13;
        __int16 v21 = 2112;
        __int16 v22 = v14;
        __int16 v23 = 2112;
        uint64_t v24 = v15;
        _os_log_impl(&dword_1B8CCB000, v12, OS_LOG_TYPE_INFO, "%s Site (%@) missed the last global maintenance attempt (%@), last rebuilt/maintained: %@", (uint8_t *)&v17, 0x2Au);
      }
    }
    else
    {
      BOOL v10 = 0;
    }
  }

  return v10;
}

- (BOOL)_siteRequiresRebuild:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [v4 lastRebuild];
  uint64_t v6 = [(CESRSpeechProfileSiteResolver *)self _lastGlobalRebuildAttempt];
  char v7 = (void *)v6;
  BOOL v8 = 0;
  if (v5 && v6)
  {
    if ([v5 compare:v6] == -1)
    {
      id v9 = (void *)*MEMORY[0x1E4F4E380];
      BOOL v8 = 1;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
      {
        BOOL v10 = v9;
        id v11 = CESRISO8601StringForDate(v7);
        id v12 = CESRISO8601StringForDate(v5);
        int v14 = 136315906;
        BOOL v15 = "-[CESRSpeechProfileSiteResolver _siteRequiresRebuild:]";
        __int16 v16 = 2112;
        id v17 = v4;
        __int16 v18 = 2112;
        __int16 v19 = v11;
        __int16 v20 = 2112;
        __int16 v21 = v12;
        _os_log_impl(&dword_1B8CCB000, v10, OS_LOG_TYPE_INFO, "%s Site (%@) missed the last global rebuild attempt (%@), last rebuilt: %@", (uint8_t *)&v14, 0x2Au);
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (BOOL)_siteRequiresReset:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [v4 schemaVersion];
  if ([v5 isEqual:&unk_1F129E830])
  {
    uint64_t v6 = [v4 lastReset];
    uint64_t v7 = [(CESRSpeechProfileSiteResolver *)self _lastGlobalResetAttempt];
    BOOL v8 = (void *)v7;
    BOOL v9 = 0;
    if (v6 && v7)
    {
      if ([v6 compare:v7] == -1)
      {
        id v11 = (void *)*MEMORY[0x1E4F4E380];
        BOOL v9 = 1;
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
        {
          id v12 = v11;
          BOOL v13 = CESRISO8601StringForDate(v8);
          int v14 = CESRISO8601StringForDate(v6);
          int v16 = 136315906;
          id v17 = "-[CESRSpeechProfileSiteResolver _siteRequiresReset:]";
          __int16 v18 = 2112;
          id v19 = v4;
          __int16 v20 = 2112;
          __int16 v21 = v13;
          __int16 v22 = 2112;
          __int16 v23 = v14;
          _os_log_impl(&dword_1B8CCB000, v12, OS_LOG_TYPE_INFO, "%s Site (%@) missed the last global reset attempt (%@), last reset: %@", (uint8_t *)&v16, 0x2Au);
        }
      }
      else
      {
        BOOL v9 = 0;
      }
    }
  }
  else
  {
    BOOL v10 = *MEMORY[0x1E4F4E380];
    BOOL v9 = 1;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      int v16 = 136315906;
      id v17 = "-[CESRSpeechProfileSiteResolver _siteRequiresReset:]";
      __int16 v18 = 2112;
      id v19 = v4;
      __int16 v20 = 2112;
      __int16 v21 = v5;
      __int16 v22 = 2112;
      __int16 v23 = &unk_1F129E830;
      _os_log_impl(&dword_1B8CCB000, v10, OS_LOG_TYPE_INFO, "%s Site (%@) schema version (%@) is invalid, expected: %@", (uint8_t *)&v16, 0x2Au);
    }
  }

  return v9;
}

- (id)_retrieveOrLoadSiteAtURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = [(NSMutableDictionary *)self->_siteForURL objectForKey:v6];
    if (!v7)
    {
      uint64_t v7 = +[CESRSpeechProfileSite speechProfileSiteAtURL:v6 readOnly:0 error:a4];
      if (v7) {
        [(NSMutableDictionary *)self->_siteForURL setObject:v7 forKey:v6];
      }
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)_userVaultSiteURLForPersonaId:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F3C278] sharedInstance];
  int v5 = [v4 personaMatchesEnrolledUser:v3];

  if (v5)
  {
    id v6 = [MEMORY[0x1E4F3C290] sharedInstance];
    uint64_t v7 = [v6 containerForPersona:v3];
    BOOL v8 = [v7 url];

    if (v8)
    {
      BOOL v9 = SFDataSiteURL();
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)_commonSiteURLForPersonaId:(id)a3
{
  id v3 = SFSpeechProfileRootDirectoryURL();
  id v4 = SFDataSiteURL();

  return v4;
}

- (id)_siteURLsForPersonaId:(id)a3
{
  id v4 = a3;
  int v5 = [MEMORY[0x1E4F1CA48] array];
  id v6 = [(CESRSpeechProfileSiteResolver *)self _userVaultSiteURLForPersonaId:v4];
  if (v6) {
    [v5 addObject:v6];
  }
  uint64_t v7 = [(CESRSpeechProfileSiteResolver *)self _commonSiteURLForPersonaId:v4];
  [v5 addObject:v7];

  return v5;
}

- (BOOL)_recordGlobalResetAttempt:(id *)a3
{
  resolverInfo = self->_resolverInfo;
  int v5 = [MEMORY[0x1E4F1C9C8] now];
  LOBYTE(a3) = [(CESRDictionaryLog *)resolverInfo writeUpdatedObject:v5 forKey:@"lastGlobalResetAttempt" error:a3];

  return (char)a3;
}

- (id)_lastGlobalResetAttempt
{
  return [(CESRDictionaryLog *)self->_resolverInfo objectForKey:@"lastGlobalResetAttempt"];
}

- (BOOL)_recordGlobalMaintenanceAttempt:(id *)a3
{
  resolverInfo = self->_resolverInfo;
  int v5 = [MEMORY[0x1E4F1C9C8] now];
  LOBYTE(a3) = [(CESRDictionaryLog *)resolverInfo writeUpdatedObject:v5 forKey:@"lastGlobalMaintenanceAttempt" error:a3];

  return (char)a3;
}

- (id)_lastGlobalMaintenanceAttempt
{
  return [(CESRDictionaryLog *)self->_resolverInfo objectForKey:@"lastGlobalMaintenanceAttempt"];
}

- (BOOL)_recordGlobalRebuildAttempt:(id *)a3
{
  resolverInfo = self->_resolverInfo;
  int v5 = [MEMORY[0x1E4F1C9C8] now];
  LOBYTE(a3) = [(CESRDictionaryLog *)resolverInfo writeUpdatedObject:v5 forKey:@"lastGlobalRebuildAttempt" error:a3];

  return (char)a3;
}

- (id)_lastGlobalRebuildAttempt
{
  return [(CESRDictionaryLog *)self->_resolverInfo objectForKey:@"lastGlobalRebuildAttempt"];
}

- (BOOL)_loadOrCreateResolverInfo
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = SFSpeechProfileRootDirectoryURL();
  v13[1] = 0;
  id v4 = SFGetOrCreateDirectoryURL();
  id v5 = 0;

  if (v4)
  {
    v13[0] = v5;
    BOOL v6 = 1;
    uint64_t v7 = [[CESRDictionaryLog alloc] initWithFilename:@"Manager" protectionClass:4 directory:v3 readOnly:0 create:1 error:v13];
    id v8 = v13[0];

    resolverInfo = self->_resolverInfo;
    self->_resolverInfo = v7;

    if (!self->_resolverInfo)
    {
      BOOL v10 = *MEMORY[0x1E4F4E380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        BOOL v15 = "-[CESRSpeechProfileSiteResolver _loadOrCreateResolverInfo]";
        __int16 v16 = 2112;
        id v17 = v8;
        _os_log_error_impl(&dword_1B8CCB000, v10, OS_LOG_TYPE_ERROR, "%s Failed to load resolver info: %@", buf, 0x16u);
      }
      BOOL v6 = 0;
    }
    id v5 = v8;
  }
  else
  {
    id v11 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      BOOL v15 = "-[CESRSpeechProfileSiteResolver _loadOrCreateResolverInfo]";
      __int16 v16 = 2112;
      id v17 = v3;
      __int16 v18 = 2112;
      id v19 = v5;
      _os_log_error_impl(&dword_1B8CCB000, v11, OS_LOG_TYPE_ERROR, "%s Failed to get/create root directory at URL (%@), error: %@", buf, 0x20u);
    }
    BOOL v6 = 0;
  }

  return v6;
}

- (void)_registerTrialExperimentUpdateHandler
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v12 = "-[CESRSpeechProfileSiteResolver _registerTrialExperimentUpdateHandler]";
    __int16 v13 = 2112;
    int v14 = @"SIRI_SPEECH_SV_SPEECH_PROFILE";
    _os_log_impl(&dword_1B8CCB000, v3, OS_LOG_TYPE_INFO, "%s Registering Trial experiment update handler for namespace: %@", buf, 0x16u);
  }
  id v4 = [MEMORY[0x1E4FB0098] clientWithIdentifier:111];
  trialClient = self->_trialClient;
  self->_trialClient = v4;

  objc_initWeak((id *)buf, self);
  BOOL v6 = self->_trialClient;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__CESRSpeechProfileSiteResolver__registerTrialExperimentUpdateHandler__block_invoke;
  v8[3] = &unk_1E61C31B0;
  objc_copyWeak(&v10, (id *)buf);
  BOOL v9 = @"SIRI_SPEECH_SV_SPEECH_PROFILE";
  id v7 = (id)[(TRIClient *)v6 addUpdateHandlerForNamespaceName:@"SIRI_SPEECH_SV_SPEECH_PROFILE" usingBlock:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

void __70__CESRSpeechProfileSiteResolver__registerTrialExperimentUpdateHandler__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    id v10 = "-[CESRSpeechProfileSiteResolver _registerTrialExperimentUpdateHandler]_block_invoke";
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    _os_log_impl(&dword_1B8CCB000, v3, OS_LOG_TYPE_INFO, "%s Trial updates detected for namespace (%@), rebuilding all profiles for personalization experiments.", buf, 0x16u);
  }
  id v5 = WeakRetained[1];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__CESRSpeechProfileSiteResolver__registerTrialExperimentUpdateHandler__block_invoke_288;
  block[3] = &unk_1E61C38C0;
  id v8 = WeakRetained;
  BOOL v6 = WeakRetained;
  dispatch_sync(v5, block);
}

uint64_t __70__CESRSpeechProfileSiteResolver__registerTrialExperimentUpdateHandler__block_invoke_288(uint64_t a1)
{
  return [*(id *)(a1 + 32) _rebuildAllSites:0];
}

- (BOOL)clearSpeechProfileSiteWithUserId:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 1;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__CESRSpeechProfileSiteResolver_clearSpeechProfileSiteWithUserId___block_invoke;
  block[3] = &unk_1E61C3188;
  void block[4] = self;
  id v9 = v4;
  id v10 = &v11;
  id v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

void __66__CESRSpeechProfileSiteResolver_clearSpeechProfileSiteWithUserId___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) _siteURLsForPersonaId:*(void *)(a1 + 40)];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
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
        char v7 = [*(id *)(a1 + 32) _resetSiteAtURL:*(void *)(*((void *)&v10 + 1) + 8 * v6)];
        uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
        if (*(unsigned char *)(v8 + 24)) {
          char v9 = v7;
        }
        else {
          char v9 = 0;
        }
        *(unsigned char *)(v8 + 24) = v9;
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

- (BOOL)clearAllState
{
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__CESRSpeechProfileSiteResolver_clearAllState__block_invoke;
  v5[3] = &unk_1E61C3138;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __46__CESRSpeechProfileSiteResolver_clearAllState__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _resetAllSites];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)rebuildSpeechProfileSiteWithUserId:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 1;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__CESRSpeechProfileSiteResolver_rebuildSpeechProfileSiteWithUserId___block_invoke;
  block[3] = &unk_1E61C3188;
  void block[4] = self;
  id v9 = v4;
  long long v10 = &v11;
  id v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

void __68__CESRSpeechProfileSiteResolver_rebuildSpeechProfileSiteWithUserId___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) _siteURLsForPersonaId:*(void *)(a1 + 40)];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
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
        char v7 = [*(id *)(a1 + 32) _rebuildSiteAtURL:*(void *)(*((void *)&v10 + 1) + 8 * v6) shouldDefer:0];
        uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
        if (*(unsigned char *)(v8 + 24)) {
          char v9 = v7;
        }
        else {
          char v9 = 0;
        }
        *(unsigned char *)(v8 + 24) = v9;
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

- (BOOL)rebuildAllSpeechProfilesWithSerializedSets:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__CESRSpeechProfileSiteResolver_rebuildAllSpeechProfilesWithSerializedSets___block_invoke;
  block[3] = &unk_1E61C3188;
  id v9 = v4;
  long long v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

uint64_t __76__CESRSpeechProfileSiteResolver_rebuildAllSpeechProfilesWithSerializedSets___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _rebuildAllSitesWithSerializedSets:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)performMaintenance:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__CESRSpeechProfileSiteResolver_performMaintenance___block_invoke;
  block[3] = &unk_1E61C3160;
  id v9 = v4;
  long long v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

uint64_t __52__CESRSpeechProfileSiteResolver_performMaintenance___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _maintainAllSites:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (void)handleSysdiagnoseStarted
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__CESRSpeechProfileSiteResolver_handleSysdiagnoseStarted__block_invoke;
  block[3] = &unk_1E61C38C0;
  void block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __57__CESRSpeechProfileSiteResolver_handleSysdiagnoseStarted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSysdiagnoseStarted];
}

- (BOOL)handleSettingsChange
{
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__CESRSpeechProfileSiteResolver_handleSettingsChange__block_invoke;
  v5[3] = &unk_1E61C3138;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __53__CESRSpeechProfileSiteResolver_handleSettingsChange__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 32) refreshLocalesIfNeeded];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)handleAssetUpdate
{
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__CESRSpeechProfileSiteResolver_handleAssetUpdate__block_invoke;
  v5[3] = &unk_1E61C3138;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __50__CESRSpeechProfileSiteResolver_handleAssetUpdate__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 32) refreshLocales];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)handleUpdatedSets:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__CESRSpeechProfileSiteResolver_handleUpdatedSets___block_invoke;
  block[3] = &unk_1E61C3188;
  id v9 = v4;
  long long v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

uint64_t __51__CESRSpeechProfileSiteResolver_handleUpdatedSets___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _handleUpdatedSets:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (CESRSpeechProfileSiteResolver)initWithSetEnumerator:(id)a3 settings:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CESRSpeechProfileSiteResolver;
  id v9 = [(CESRSpeechProfileSiteResolver *)&v20 init];
  if (!v9)
  {
LABEL_5:
    __int16 v18 = v9;
    goto LABEL_7;
  }
  long long v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  id v11 = objc_claimAutoreleasedReturnValue();
  long long v12 = (const char *)[v11 cStringUsingEncoding:4];
  uint64_t v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v14 = dispatch_queue_create(v12, v13);
  queue = v9->_queue;
  v9->_queue = (OS_dispatch_queue *)v14;

  uint64_t v16 = [MEMORY[0x1E4F1CA60] dictionary];
  siteForURL = v9->_siteForURL;
  v9->_siteForURL = (NSMutableDictionary *)v16;

  objc_storeStrong((id *)&v9->_setEnumerator, a3);
  objc_storeStrong((id *)&v9->_settings, a4);
  __int16 v18 = 0;
  if ([(CESRSpeechProfileSiteResolver *)v9 _loadOrCreateResolverInfo])
  {
    if (![(CESRSpeechProfileSiteResolver *)v9 _loadAllSites])
    {
      __int16 v18 = 0;
      goto LABEL_7;
    }
    [(CESRSpeechProfileSiteResolver *)v9 _registerTrialExperimentUpdateHandler];
    goto LABEL_5;
  }
LABEL_7:

  return v18;
}

+ (id)defaultResolver
{
  id v2 = objc_alloc((Class)objc_opt_class());
  char v3 = [MEMORY[0x1E4F57FB8] setEnumeratorWithUseCase:@"SpeechProfile"];
  id v4 = +[CESRSpeechProfileSettings defaultSettings];
  uint64_t v5 = (void *)[v2 initWithSetEnumerator:v3 settings:v4];

  return v5;
}

@end