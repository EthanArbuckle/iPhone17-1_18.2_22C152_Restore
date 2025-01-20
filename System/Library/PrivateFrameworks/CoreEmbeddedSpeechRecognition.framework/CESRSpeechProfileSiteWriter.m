@interface CESRSpeechProfileSiteWriter
- (BOOL)_refreshRankedItemCaches:(id)a3;
- (BOOL)_removeProfileInstance:(id)a3;
- (BOOL)_shouldDeferRadioStationUpdate;
- (BOOL)_shouldDeferUpdateForInstance:(id)a3 categoryGroup:(id)a4 sets:(id)a5;
- (BOOL)_updateProfileInstance:(id)a3 categoryGroup:(id)a4 sets:(id)a5 shouldDefer:(id)a6;
- (BOOL)_updateProfilesWithSets:(id)a3 allSets:(id)a4 shouldDefer:(id)a5;
- (BOOL)_verifyProfileInstance:(id)a3 locale:(id)a4 options:(unsigned __int8)a5 allSets:(id)a6 shouldDefer:(id)a7;
- (BOOL)_verifyProfileInstance:(id)a3 withAllSets:(id)a4 shouldDefer:(id)a5;
- (BOOL)_verifyProfilesWithAllSets:(id)a3 shouldDefer:(id)a4;
- (BOOL)rebuildWithAllSets:(id)a3 shouldDefer:(id)a4;
- (CESRSpeechProfileSiteWriter)initWithSpeechProfileSite:(id)a3 settings:(id)a4;
- (id)_calculateSets:(id)a3 applicableToGroup:(id)a4 withAllSets:(id)a5;
- (id)_filterSets:(id)a3 supportedByInstance:(id)a4;
- (id)_sortInstancesByLocale:(id)a3;
- (id)description;
- (void)logCurrentStateWithAllSets:(id)a3;
@end

@implementation CESRSpeechProfileSiteWriter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);

  objc_storeStrong((id *)&self->_speechProfileSite, 0);
}

- (id)_sortInstancesByLocale:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "locale", (void)v13);
        [v4 setObject:v10 forKey:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

- (BOOL)_verifyProfileInstance:(id)a3 locale:(id)a4 options:(unsigned __int8)a5 allSets:(id)a6 shouldDefer:(id)a7
{
  uint64_t v9 = a5;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if (!v12)
  {
    v21 = (os_log_t *)MEMORY[0x1E4F4E380];
    v22 = (void *)*MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      v23 = v22;
      v24 = [v13 localeIdentifier];
      *(_DWORD *)buf = 136315394;
      v43 = "-[CESRSpeechProfileSiteWriter _verifyProfileInstance:locale:options:allSets:shouldDefer:]";
      __int16 v44 = 2112;
      id v45 = v24;
      _os_log_impl(&dword_1B8CCB000, v23, OS_LOG_TYPE_INFO, "%s No profile instance exists with locale: %@", buf, 0x16u);
    }
    speechProfileSite = self->_speechProfileSite;
    id v41 = 0;
    id v12 = [(CESRSpeechProfileSite *)speechProfileSite instanceWithLocale:v13 options:v9 error:&v41];
    id v26 = v41;
    if (v12) {
      goto LABEL_17;
    }
    os_log_t v27 = *v21;
    if (os_log_type_enabled(*v21, OS_LOG_TYPE_INFO))
    {
      v28 = v27;
      v29 = [v13 localeIdentifier];
      v30 = CESRSpeechProfileInstanceOptionsDescription(v9);
      *(_DWORD *)buf = 136315906;
      v43 = "-[CESRSpeechProfileSiteWriter _verifyProfileInstance:locale:options:allSets:shouldDefer:]";
      __int16 v44 = 2112;
      id v45 = v29;
      __int16 v46 = 2112;
      id v47 = v30;
      __int16 v48 = 2112;
      id v49 = v26;
      _os_log_impl(&dword_1B8CCB000, v28, OS_LOG_TYPE_INFO, "%s Failed create instance with locale: %@ options: %@ error: %@", buf, 0x2Au);
    }
    id v12 = 0;
    goto LABEL_20;
  }
  int v16 = [v12 options];
  v17 = (NSObject **)MEMORY[0x1E4F4E380];
  uint64_t v18 = *MEMORY[0x1E4F4E380];
  BOOL v19 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO);
  if (v16 != v9)
  {
    if (v19)
    {
      v31 = v18;
      v32 = CESRSpeechProfileInstanceOptionsDescription(v9);
      *(_DWORD *)buf = 136315650;
      v43 = "-[CESRSpeechProfileSiteWriter _verifyProfileInstance:locale:options:allSets:shouldDefer:]";
      __int16 v44 = 2112;
      id v45 = v12;
      __int16 v46 = 2112;
      id v47 = v32;
      _os_log_impl(&dword_1B8CCB000, v31, OS_LOG_TYPE_INFO, "%s Profile instance (%@) requires new options [%@] following settings refresh", buf, 0x20u);
    }
    id v40 = 0;
    char v33 = [v12 updateOptions:v9 error:&v40];
    id v26 = v40;
    v34 = *v17;
    v35 = *v17;
    if (v33)
    {
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v43 = "-[CESRSpeechProfileSiteWriter _verifyProfileInstance:locale:options:allSets:shouldDefer:]";
        __int16 v44 = 2112;
        id v45 = v12;
        _os_log_impl(&dword_1B8CCB000, v34, OS_LOG_TYPE_INFO, "%s Profile instance (%@) options updated", buf, 0x16u);
      }
LABEL_17:
      v36 = +[CESRSpeechProfileCategoryGroup all];
      BOOL v20 = [(CESRSpeechProfileSiteWriter *)self _updateProfileInstance:v12 categoryGroup:v36 sets:v14 shouldDefer:v15];

LABEL_21:
      goto LABEL_22;
    }
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v38 = v34;
      v39 = CESRSpeechProfileInstanceOptionsDescription(v9);
      *(_DWORD *)buf = 136315906;
      v43 = "-[CESRSpeechProfileSiteWriter _verifyProfileInstance:locale:options:allSets:shouldDefer:]";
      __int16 v44 = 2112;
      id v45 = v39;
      __int16 v46 = 2112;
      id v47 = v12;
      __int16 v48 = 2112;
      id v49 = v26;
      _os_log_error_impl(&dword_1B8CCB000, v38, OS_LOG_TYPE_ERROR, "%s Failed to update options [%@] for profile instance (%@) error: %@", buf, 0x2Au);
    }
LABEL_20:
    BOOL v20 = 0;
    goto LABEL_21;
  }
  if (v19)
  {
    *(_DWORD *)buf = 136315394;
    v43 = "-[CESRSpeechProfileSiteWriter _verifyProfileInstance:locale:options:allSets:shouldDefer:]";
    __int16 v44 = 2112;
    id v45 = v12;
    _os_log_impl(&dword_1B8CCB000, v18, OS_LOG_TYPE_INFO, "%s Verifying profile instance (%@)", buf, 0x16u);
  }
  BOOL v20 = [(CESRSpeechProfileSiteWriter *)self _verifyProfileInstance:v12 withAllSets:v14 shouldDefer:v15];
LABEL_22:

  return v20;
}

- (BOOL)_verifyProfilesWithAllSets:(id)a3 shouldDefer:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x2020000000;
  char v38 = 1;
  uint64_t v8 = [(CESRSpeechProfileSite *)self->_speechProfileSite instances];
  uint64_t v9 = [(CESRSpeechProfileSiteWriter *)self _sortInstancesByLocale:v8];

  settings = self->_settings;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __70__CESRSpeechProfileSiteWriter__verifyProfilesWithAllSets_shouldDefer___block_invoke;
  v29[3] = &unk_1E61C2CF0;
  id v11 = v9;
  id v30 = v11;
  v31 = self;
  id v12 = v6;
  id v32 = v12;
  id v13 = v7;
  id v33 = v13;
  v34 = &v35;
  [(CESRSpeechProfileSettings *)settings enumerateRequiredInstances:v29];
  v23 = v13;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v24 = v11;
  id v14 = [v11 allValues];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v43 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v26;
    v17 = (os_log_t *)MEMORY[0x1E4F4E380];
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v26 != v16) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        BOOL v20 = *v17;
        if (os_log_type_enabled(*v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          id v40 = "-[CESRSpeechProfileSiteWriter _verifyProfilesWithAllSets:shouldDefer:]";
          __int16 v41 = 2112;
          uint64_t v42 = v19;
          _os_log_impl(&dword_1B8CCB000, v20, OS_LOG_TYPE_INFO, "%s Profile Instance (%@) is no longer required following settings refresh", buf, 0x16u);
        }
        [(CESRSpeechProfileSiteWriter *)self _removeProfileInstance:v19];
      }
      uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v43 count:16];
    }
    while (v15);
  }

  BOOL v21 = *((unsigned char *)v36 + 24) != 0;
  _Block_object_dispose(&v35, 8);

  return v21;
}

void __70__CESRSpeechProfileSiteWriter__verifyProfilesWithAllSets_shouldDefer___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  id v5 = (void *)MEMORY[0x1BA9CC310]();
  id v6 = [*(id *)(a1 + 32) objectForKey:v7];
  [*(id *)(a1 + 32) removeObjectForKey:v7];
  if (([*(id *)(a1 + 40) _verifyProfileInstance:v6 locale:v7 options:a3 allSets:*(void *)(a1 + 48) shouldDefer:*(void *)(a1 + 56)] & 1) == 0)*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0; {
}
  }

- (BOOL)_refreshRankedItemCaches:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v4 = (unsigned int (**)(void))a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = [(CESRSpeechProfileSite *)self->_speechProfileSite instances];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        if (v4 && v4[2](v4))
        {
          id v13 = *MEMORY[0x1E4F4E380];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
          {
            speechProfileSite = self->_speechProfileSite;
            *(_DWORD *)buf = 136315394;
            BOOL v21 = "-[CESRSpeechProfileSiteWriter _refreshRankedItemCaches:]";
            __int16 v22 = 2112;
            v23 = speechProfileSite;
            _os_log_impl(&dword_1B8CCB000, v13, OS_LOG_TYPE_INFO, "%s (%@) Aborting update due to deferral signal", buf, 0x16u);
          }
          BOOL v12 = 0;
          goto LABEL_14;
        }
        id v11 = +[CESRSpeechProfileUpdater updaterForInstance:v10 atSpeechProfileSite:self->_speechProfileSite];
        [v11 refreshRankedItemCaches];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 1;
LABEL_14:

  return v12;
}

- (BOOL)_shouldDeferUpdateForInstance:(id)a3 categoryGroup:(id)a4 sets:(id)a5
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  char v56 = 0;
  unint64_t v11 = +[CESRSpeechProfileUpdater updateModeForSets:v10 speechProfileInstance:v8 speechProfileSite:self->_speechProfileSite isAnySetNew:&v56];
  if (v56)
  {
    BOOL v12 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v58 = "-[CESRSpeechProfileSiteWriter _shouldDeferUpdateForInstance:categoryGroup:sets:]";
      __int16 v59 = 2112;
      id v60 = v8;
      _os_log_impl(&dword_1B8CCB000, v12, OS_LOG_TYPE_INFO, "%s (%@) No deferral - one or more sets are new", buf, 0x16u);
    }
    BOOL v13 = 0;
    goto LABEL_52;
  }
  unint64_t v14 = v11;
  if (!v11)
  {
    char v38 = *MEMORY[0x1E4F4E380];
    BOOL v13 = 1;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v58 = "-[CESRSpeechProfileSiteWriter _shouldDeferUpdateForInstance:categoryGroup:sets:]";
      __int16 v59 = 2112;
      id v60 = v8;
      __int16 v61 = 2112;
      v62[0] = v10;
      _os_log_impl(&dword_1B8CCB000, v38, OS_LOG_TYPE_INFO, "%s (%@) Skipping empty update for sets: %@", buf, 0x20u);
    }
    goto LABEL_52;
  }
  id v45 = v9;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v15 = v10;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v52 objects:v64 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v53 != v18) {
          objc_enumerationMutation(v15);
        }
        if ([*(id *)(*((void *)&v52 + 1) + 8 * i) itemType] == 49066
          && ![(CESRSpeechProfileSiteWriter *)self _shouldDeferRadioStationUpdate])
        {
          v39 = *MEMORY[0x1E4F4E380];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315138;
            v58 = "-[CESRSpeechProfileSiteWriter _shouldDeferUpdateForInstance:categoryGroup:sets:]";
            _os_log_impl(&dword_1B8CCB000, v39, OS_LOG_TYPE_INFO, "%s Overriding deferral for CarPlay radio entities donated at the start of a CarPlay session.", buf, 0xCu);
          }

          BOOL v13 = 0;
          goto LABEL_51;
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v52 objects:v64 count:16];
    }
    while (v17);
  }

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  obuint64_t j = [v45 speechCategories];
  uint64_t v20 = [obj countByEnumeratingWithState:&v48 objects:v63 count:16];
  if (!v20)
  {
    uint64_t v44 = 0;
    char v37 = 1;
    goto LABEL_48;
  }
  uint64_t v22 = v20;
  uint64_t v44 = 0;
  uint64_t v47 = *(void *)v49;
  *(void *)&long long v21 = 136315394;
  long long v43 = v21;
  while (2)
  {
    for (uint64_t j = 0; j != v22; ++j)
    {
      if (*(void *)v49 != v47) {
        objc_enumerationMutation(obj);
      }
      v24 = *(void **)(*((void *)&v48 + 1) + 8 * j);
      if (+[CESRSpeechProfileBuilder shouldOverrideDeferralForCategory:updateMode:](CESRSpeechProfileBuilder, "shouldOverrideDeferralForCategory:updateMode:", v24, v14, v43))
      {
        id v40 = *MEMORY[0x1E4F4E380];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          v58 = "-[CESRSpeechProfileSiteWriter _shouldDeferUpdateForInstance:categoryGroup:sets:]";
          __int16 v59 = 2112;
          id v60 = v24;
          __int16 v61 = 1024;
          LODWORD(v62[0]) = v14;
          _os_log_impl(&dword_1B8CCB000, v40, OS_LOG_TYPE_INFO, "%s No deferral - At least one speech category (%@) qualifies for deferral override with updateMode: %X", buf, 0x1Cu);
        }
        goto LABEL_47;
      }
      uint64_t v25 = [v8 lastCompletedVersionForSpeechCategory:v24];
      uint64_t v26 = [v8 lastRegisteredVersionForSpeechCategory:v24];
      long long v27 = (void *)v26;
      if (!v25)
      {
        __int16 v41 = *MEMORY[0x1E4F4E380];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v43;
          v58 = "-[CESRSpeechProfileSiteWriter _shouldDeferUpdateForInstance:categoryGroup:sets:]";
          __int16 v59 = 2112;
          id v60 = v24;
          _os_log_impl(&dword_1B8CCB000, v41, OS_LOG_TYPE_INFO, "%s No deferral - At least one speech category (%@) has not completed an update", buf, 0x16u);
        }

LABEL_47:
        char v37 = 0;
        goto LABEL_48;
      }
      if (!v26)
      {
        v34 = *MEMORY[0x1E4F4E380];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR)) {
          goto LABEL_33;
        }
        *(_DWORD *)buf = v43;
        v58 = "-[CESRSpeechProfileSiteWriter _shouldDeferUpdateForInstance:categoryGroup:sets:]";
        __int16 v59 = 2112;
        id v60 = v24;
        id v32 = v34;
        id v33 = "%s No registered update for category (%@)";
        goto LABEL_28;
      }
      uint64_t v28 = [v25 longLongValue];
      uint64_t v29 = [v27 longLongValue];
      uint64_t v30 = v29 - v28;
      if (v29 < v28)
      {
        v31 = *MEMORY[0x1E4F4E380];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR)) {
          goto LABEL_33;
        }
        *(_DWORD *)buf = v43;
        v58 = "-[CESRSpeechProfileSiteWriter _shouldDeferUpdateForInstance:categoryGroup:sets:]";
        __int16 v59 = 2112;
        id v60 = v24;
        id v32 = v31;
        id v33 = "%s Unexpected last registered update occurred prior to last completed update (%@)";
LABEL_28:
        _os_log_error_impl(&dword_1B8CCB000, v32, OS_LOG_TYPE_ERROR, v33, buf, 0x16u);
        goto LABEL_33;
      }
      if (v30 <= 1799999999)
      {
        uint64_t v35 = *MEMORY[0x1E4F4E380];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
        {
          double v36 = (double)v30 / 1000000.0;
          *(_DWORD *)buf = 136315906;
          v58 = "-[CESRSpeechProfileSiteWriter _shouldDeferUpdateForInstance:categoryGroup:sets:]";
          __int16 v59 = 2112;
          id v60 = v24;
          __int16 v61 = 1024;
          LODWORD(v62[0]) = (int)v36 / 60;
          WORD2(v62[0]) = 2048;
          *(double *)((char *)v62 + 6) = v36 - (double)(60 * LODWORD(v62[0]));
          _os_log_impl(&dword_1B8CCB000, v35, OS_LOG_TYPE_INFO, "%s At least one speech category (%@) has completed an update within the deferral window (%i minutes, %lf seconds ago)", buf, 0x26u);
        }
        ++v44;
      }
LABEL_33:
    }
    uint64_t v22 = [obj countByEnumeratingWithState:&v48 objects:v63 count:16];
    char v37 = 1;
    if (v22) {
      continue;
    }
    break;
  }
LABEL_48:

  if (v44) {
    BOOL v13 = v37;
  }
  else {
    BOOL v13 = 0;
  }
LABEL_51:
  id v9 = v45;
LABEL_52:

  return v13;
}

- (BOOL)_shouldDeferRadioStationUpdate
{
  v2 = BiomeLibrary();
  id v3 = [v2 CarPlay];
  v4 = [v3 Connected];

  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E8]) initWithStartDate:0 endDate:0 maxEvents:0 lastN:1 reversed:0];
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  uint64_t v11 = 0;
  BOOL v12 = (double *)&v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  uint64_t v6 = [v4 publisherWithUseCase:@"SpeechProfile" options:v5];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__CESRSpeechProfileSiteWriter__shouldDeferRadioStationUpdate__block_invoke_2;
  v10[3] = &unk_1E61C2CC8;
  v10[4] = &v11;
  v10[5] = &v15;
  id v7 = (id)[v6 sinkWithCompletion:&__block_literal_global_383 receiveInput:v10];

  BOOL v8 = !*((unsigned char *)v16 + 24) || CFAbsoluteTimeGetCurrent() - v12[3] >= 30.0;
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);

  return v8;
}

void __61__CESRSpeechProfileSiteWriter__shouldDeferRadioStationUpdate__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 timestamp];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4;
  id v5 = [v3 eventBody];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v5 starting];
}

- (BOOL)_verifyProfileInstance:(id)a3 withAllSets:(id)a4 shouldDefer:(id)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = +[CESRSpeechProfileUpdater updaterForInstance:v8 atSpeechProfileSite:self->_speechProfileSite];
  id v36 = 0;
  id v37 = 0;
  int v12 = [v11 detectCategoriesToRebuild:&v37 error:&v36];
  id v13 = v37;
  id v14 = v36;
  uint64_t v15 = *MEMORY[0x1E4F4E380];
  uint64_t v16 = &off_1E61C2000;
  uint64_t v17 = *MEMORY[0x1E4F4E380];
  if (!v12)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      id v40 = "-[CESRSpeechProfileSiteWriter _verifyProfileInstance:withAllSets:shouldDefer:]";
      __int16 v41 = 2112;
      id v42 = v8;
      __int16 v43 = 2112;
      id v44 = v14;
      _os_log_error_impl(&dword_1B8CCB000, v15, OS_LOG_TYPE_ERROR, "%s (%@) Failed to detect categories for rebuild: %@", buf, 0x20u);
    }
    id v25 = +[CESRSpeechProfileCategoryGroup all];
    char v18 = v13;
LABEL_12:
    id v13 = v25;
    goto LABEL_13;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v40 = "-[CESRSpeechProfileSiteWriter _verifyProfileInstance:withAllSets:shouldDefer:]";
    __int16 v41 = 2112;
    id v42 = v8;
    __int16 v43 = 2112;
    id v44 = v13;
    _os_log_impl(&dword_1B8CCB000, v15, OS_LOG_TYPE_INFO, "%s (%@) Categories with an invalid version: %@", buf, 0x20u);
  }
  char v18 = [v11 categoriesToRebuildForAllSets:v9];
  long long v19 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v40 = "-[CESRSpeechProfileSiteWriter _verifyProfileInstance:withAllSets:shouldDefer:]";
    __int16 v41 = 2112;
    id v42 = v8;
    __int16 v43 = 2112;
    id v44 = v18;
    _os_log_impl(&dword_1B8CCB000, v19, OS_LOG_TYPE_INFO, "%s (%@) Categories with a set update: %@", buf, 0x20u);
  }
  if (v18)
  {
    if (v13)
    {
      v38[0] = v13;
      v38[1] = v18;
      [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
      id v20 = v9;
      id v21 = v10;
      v23 = id v22 = v14;
      uint64_t v24 = +[CESRSpeechProfileCategoryGroup mergeGroups:v23];

      id v14 = v22;
      id v10 = v21;
      id v9 = v20;
      uint64_t v16 = &off_1E61C2000;
      id v13 = (id)v24;
      goto LABEL_13;
    }
    id v25 = v18;
    char v18 = v25;
    goto LABEL_12;
  }
LABEL_13:

  uint64_t v26 = *MEMORY[0x1E4F4E380];
  BOOL v27 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO);
  if (v13)
  {
    uint64_t v28 = v16;
    id v29 = v14;
    if (v27)
    {
      *(_DWORD *)buf = 136315650;
      id v40 = "-[CESRSpeechProfileSiteWriter _verifyProfileInstance:withAllSets:shouldDefer:]";
      __int16 v41 = 2112;
      id v42 = v8;
      __int16 v43 = 2112;
      id v44 = v13;
      _os_log_impl(&dword_1B8CCB000, v26, OS_LOG_TYPE_INFO, "%s (%@) Profile instance requires rebuild for category group: %@", buf, 0x20u);
    }
    uint64_t v30 = [(CESRSpeechProfileSiteWriter *)self _filterSets:v9 supportedByInstance:v8];
    v31 = [v28[186] all];
    char v32 = [v13 isEqual:v31];

    if ((v32 & 1) == 0)
    {
      uint64_t v33 = [(CESRSpeechProfileSiteWriter *)self _calculateSets:v30 applicableToGroup:v13 withAllSets:0];

      uint64_t v30 = (void *)v33;
    }

    BOOL v34 = [(CESRSpeechProfileSiteWriter *)self _updateProfileInstance:v8 categoryGroup:v13 sets:v30 shouldDefer:v10];
    uint64_t v11 = v30;
    id v14 = v29;
  }
  else if (v27)
  {
    *(_DWORD *)buf = 136315394;
    id v40 = "-[CESRSpeechProfileSiteWriter _verifyProfileInstance:withAllSets:shouldDefer:]";
    __int16 v41 = 2112;
    id v42 = v8;
    BOOL v34 = 1;
    _os_log_impl(&dword_1B8CCB000, v26, OS_LOG_TYPE_INFO, "%s (%@) Verified profile instance - no rebuild required", buf, 0x16u);
  }
  else
  {
    BOOL v34 = 1;
  }

  return v34;
}

- (BOOL)_updateProfileInstance:(id)a3 categoryGroup:(id)a4 sets:(id)a5 shouldDefer:(id)a6
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  uint64_t v11 = (__CFString *)a4;
  int v12 = (__CFString *)a5;
  id v13 = (unsigned int (**)(void))a6;
  id v14 = NSNumber;
  uint64_t v15 = [MEMORY[0x1E4F1C9C8] date];
  [v15 timeIntervalSince1970];
  uint64_t v17 = [v14 numberWithLongLong:(uint64_t)(v16 * 1000000.0)];

  char v18 = [(__CFString *)v11 speechCategories];
  [v10 registerUpdateForSpeechCategories:v18 version:v17];

  if (!v13 || !v13[2](v13))
  {
    id v21 = +[CESRSpeechProfileCategoryGroup all];
    int v22 = [(__CFString *)v11 isEqual:v21];

    v23 = (os_log_t *)MEMORY[0x1E4F4E380];
    uint64_t v24 = (void *)*MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      if (v22) {
        id v25 = @"ALL";
      }
      else {
        id v25 = @"selected";
      }
      uint64_t v26 = v24;
      BOOL v27 = [(__CFString *)v11 speechCategories];
      *(_DWORD *)buf = 136315906;
      long long v48 = "-[CESRSpeechProfileSiteWriter _updateProfileInstance:categoryGroup:sets:shouldDefer:]";
      __int16 v49 = 2112;
      id v50 = v10;
      __int16 v51 = 2112;
      long long v52 = v25;
      __int16 v53 = 2112;
      long long v54 = v27;
      _os_log_impl(&dword_1B8CCB000, v26, OS_LOG_TYPE_INFO, "%s (%@) Preparing to rebuild %@ categories: %@ with all applicable sets available", buf, 0x2Au);

      v23 = (os_log_t *)MEMORY[0x1E4F4E380];
    }
    if (v22)
    {
      uint64_t v28 = [v10 changeRegistry];
      [v28 clearAllBookmarks];
    }
    id v29 = +[CESRSpeechProfileUpdater updaterForInstance:v10 atSpeechProfileSite:self->_speechProfileSite];
    id v46 = 0;
    char v30 = [v29 rebuildCategoryGroup:v11 withSets:v12 version:v17 error:&v46];
    v31 = (__CFString *)v46;
    if (v30)
    {
      char v32 = [(__CFString *)v11 speechCategories];
      [v10 recordUpdateCompletedForSpeechCategories:v32 version:v17];

      uint64_t v33 = *v23;
      if (os_log_type_enabled(*v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315906;
        long long v48 = "-[CESRSpeechProfileSiteWriter _updateProfileInstance:categoryGroup:sets:shouldDefer:]";
        __int16 v49 = 2112;
        id v50 = v10;
        __int16 v51 = 2112;
        long long v52 = v11;
        __int16 v53 = 2112;
        long long v54 = v12;
        _os_log_impl(&dword_1B8CCB000, v33, OS_LOG_TYPE_INFO, "%s (%@) Completed Speech Profile update for category group: %@ with sets: %@", buf, 0x2Au);
      }
      BOOL v34 = [v10 changeRegistry];
      uint64_t v45 = v31;
      char v35 = [v34 commitAllBookmarkUpdates:&v45];
      id v36 = v45;

      if (v35)
      {
        BOOL v20 = 1;
        v31 = v36;
LABEL_22:

        goto LABEL_23;
      }
      id v40 = *MEMORY[0x1E4F4E380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        long long v48 = "-[CESRSpeechProfileSiteWriter _updateProfileInstance:categoryGroup:sets:shouldDefer:]";
        __int16 v49 = 2112;
        id v50 = v10;
        __int16 v51 = 2112;
        long long v52 = v36;
        _os_log_error_impl(&dword_1B8CCB000, v40, OS_LOG_TYPE_ERROR, "%s (%@) Failed to commit change registry transaction: %@", buf, 0x20u);
      }
      __int16 v41 = [v10 changeRegistry];
      id v44 = v36;
      char v42 = [v41 clearAllBookmarksAndCommit:&v44];
      v31 = v44;

      if (v42)
      {
        BOOL v20 = 1;
        goto LABEL_22;
      }
      __int16 v43 = *MEMORY[0x1E4F4E380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        long long v48 = "-[CESRSpeechProfileSiteWriter _updateProfileInstance:categoryGroup:sets:shouldDefer:]";
        __int16 v49 = 2112;
        id v50 = v10;
        __int16 v51 = 2112;
        long long v52 = v31;
        _os_log_error_impl(&dword_1B8CCB000, v43, OS_LOG_TYPE_ERROR, "%s (%@) Failed to reset change registry: %@", buf, 0x20u);
      }
    }
    else
    {
      id v37 = *v23;
      if (os_log_type_enabled(*v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        long long v48 = "-[CESRSpeechProfileSiteWriter _updateProfileInstance:categoryGroup:sets:shouldDefer:]";
        __int16 v49 = 2112;
        id v50 = v10;
        __int16 v51 = 2112;
        long long v52 = v11;
        __int16 v53 = 2112;
        long long v54 = v12;
        __int16 v55 = 2112;
        char v56 = v31;
        _os_log_error_impl(&dword_1B8CCB000, v37, OS_LOG_TYPE_ERROR, "%s (%@) Failed to rebuild category group: %@ with sets: %@ error: %@", buf, 0x34u);
      }
      char v38 = [v10 changeRegistry];
      [v38 rollbackAllBookmarkUpdates];
    }
    BOOL v20 = 0;
    goto LABEL_22;
  }
  long long v19 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    long long v48 = "-[CESRSpeechProfileSiteWriter _updateProfileInstance:categoryGroup:sets:shouldDefer:]";
    __int16 v49 = 2112;
    id v50 = v10;
    __int16 v51 = 2112;
    long long v52 = v12;
    __int16 v53 = 2112;
    long long v54 = v11;
    _os_log_impl(&dword_1B8CCB000, v19, OS_LOG_TYPE_INFO, "%s (%@) Deferring update for sets: %@ to category group: %@", buf, 0x2Au);
  }
  BOOL v20 = 0;
LABEL_23:

  return v20;
}

- (id)_calculateSets:(id)a3 applicableToGroup:(id)a4 withAllSets:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v28 = a5;
  char v30 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v7, "count"));
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  obuint64_t j = v7;
  uint64_t v9 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v36 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        id v14 = [v8 itemTypes];
        uint64_t v15 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v13, "itemType"));
        int v16 = [v14 containsObject:v15];

        if (v16) {
          [v30 addObject:v13];
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v10);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v17 = v28;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v32 != v20) {
          objc_enumerationMutation(v17);
        }
        int v22 = *(void **)(*((void *)&v31 + 1) + 8 * j);
        v23 = [v8 itemTypes];
        uint64_t v24 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v22, "itemType"));
        int v25 = [v23 containsObject:v24];

        if (v25) {
          [v30 addObject:v22];
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v19);
  }

  uint64_t v26 = [v30 allObjects];

  return v26;
}

- (id)_filterSets:(id)a3 supportedByInstance:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        if (-[CESRSpeechProfileSettings isSupportedSet:instanceOptions:](self->_settings, "isSupportedSet:instanceOptions:", v14, objc_msgSend(v7, "options", (void)v16)))
        {
          [v8 addObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return v8;
}

- (BOOL)_removeProfileInstance:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[CESRSpeechProfileUpdater updaterForInstance:v4 atSpeechProfileSite:self->_speechProfileSite];
  id v18 = 0;
  char v6 = [v5 removeProfile:&v18];
  id v7 = v18;
  if (v6)
  {
    speechProfileSite = self->_speechProfileSite;
    id v17 = v7;
    BOOL v9 = [(CESRSpeechProfileSite *)speechProfileSite removeInstance:v4 error:&v17];
    id v10 = v17;

    if (v9)
    {
      BOOL v11 = 1;
    }
    else
    {
      id v13 = *MEMORY[0x1E4F4E380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
      {
        long long v16 = self->_speechProfileSite;
        *(_DWORD *)buf = 136315906;
        uint64_t v20 = "-[CESRSpeechProfileSiteWriter _removeProfileInstance:]";
        __int16 v21 = 2112;
        int v22 = v16;
        __int16 v23 = 2112;
        id v24 = v4;
        __int16 v25 = 2112;
        id v26 = v10;
        _os_log_error_impl(&dword_1B8CCB000, v13, OS_LOG_TYPE_ERROR, "%s (%@) Failed to remove instance info (%@) error: %@", buf, 0x2Au);
      }
      BOOL v11 = 0;
    }
    id v7 = v10;
  }
  else
  {
    uint64_t v12 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = self->_speechProfileSite;
      *(_DWORD *)buf = 136315906;
      uint64_t v20 = "-[CESRSpeechProfileSiteWriter _removeProfileInstance:]";
      __int16 v21 = 2112;
      int v22 = v15;
      __int16 v23 = 2112;
      id v24 = v4;
      __int16 v25 = 2112;
      id v26 = v7;
      _os_log_error_impl(&dword_1B8CCB000, v12, OS_LOG_TYPE_ERROR, "%s (%@) Failed to remove profile (%@) error: %@", buf, 0x2Au);
    }
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)_updateProfilesWithSets:(id)a3 allSets:(id)a4 shouldDefer:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 1;
  settings = self->_settings;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __75__CESRSpeechProfileSiteWriter__updateProfilesWithSets_allSets_shouldDefer___block_invoke;
  v15[3] = &unk_1E61C2C80;
  v15[4] = self;
  id v18 = &v19;
  id v12 = v8;
  id v16 = v12;
  id v13 = v9;
  id v17 = v13;
  [(CESRSpeechProfileSettings *)settings enumerateRequiredInstances:v15];
  LOBYTE(v8) = *((unsigned char *)v20 + 24);

  _Block_object_dispose(&v19, 8);
  return (char)v8;
}

void __75__CESRSpeechProfileSiteWriter__updateProfilesWithSets_allSets_shouldDefer___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  char v6 = (void *)MEMORY[0x1BA9CC310]();
  id v7 = *(void **)(*(void *)(a1 + 32) + 8);
  id v35 = 0;
  id v8 = [v7 instanceWithLocale:v5 options:a3 error:&v35];
  id v9 = v35;
  if (v8)
  {
    uint64_t v10 = *(void *)(a1 + 40);
    if (v10)
    {
      id v11 = [*(id *)(a1 + 32) _filterSets:v10 supportedByInstance:v8];
      uint64_t v12 = [v11 count];
      if (!v12)
      {
        id v29 = *MEMORY[0x1E4F4E380];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          long long v37 = "-[CESRSpeechProfileSiteWriter _updateProfilesWithSets:allSets:shouldDefer:]_block_invoke";
          __int16 v38 = 2112;
          id v39 = v8;
          _os_log_impl(&dword_1B8CCB000, v29, OS_LOG_TYPE_INFO, "%s (%@) No applicable sets", buf, 0x16u);
        }
        id v14 = 0;
        goto LABEL_22;
      }
      int v13 = v12;
      id v14 = +[CESRSpeechProfileCategoryGroup groupForSets:v11];
      uint64_t v15 = [*(id *)(a1 + 32) _calculateSets:v11 applicableToGroup:v14 withAllSets:*(void *)(a1 + 48)];

      uint64_t v16 = [v15 count];
      id v17 = *MEMORY[0x1E4F4E380];
      BOOL v18 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO);
      if (!v16)
      {
        if (v18)
        {
          *(_DWORD *)buf = 136315650;
          long long v37 = "-[CESRSpeechProfileSiteWriter _updateProfilesWithSets:allSets:shouldDefer:]_block_invoke";
          __int16 v38 = 2112;
          id v39 = v8;
          __int16 v40 = 2112;
          *(void *)&long long v41 = v14;
          _os_log_impl(&dword_1B8CCB000, v17, OS_LOG_TYPE_INFO, "%s (%@) No applicable sets after mapping to category group: %@", buf, 0x20u);
        }
        id v11 = v15;
        goto LABEL_22;
      }
      if (v18)
      {
        uint64_t v19 = v17;
        int v20 = [v15 count];
        int v21 = [*(id *)(a1 + 40) count];
        *(_DWORD *)buf = 136316674;
        long long v37 = "-[CESRSpeechProfileSiteWriter _updateProfilesWithSets:allSets:shouldDefer:]_block_invoke";
        __int16 v38 = 2112;
        id v39 = v8;
        __int16 v40 = 1024;
        LODWORD(v41) = v20;
        WORD2(v41) = 1024;
        *(_DWORD *)((char *)&v41 + 6) = v13;
        WORD5(v41) = 1024;
        HIDWORD(v41) = v21;
        *(_WORD *)char v42 = 2112;
        *(void *)&v42[2] = v14;
        __int16 v43 = 2112;
        id v44 = v15;
        _os_log_impl(&dword_1B8CCB000, v19, OS_LOG_TYPE_INFO, "%s (%@) Calculated %u total sets from %u applicable out of %u updated sets to category group: %@ sets: %@", buf, 0x3Cu);
      }
      id v11 = v15;
    }
    else
    {
      id v14 = +[CESRSpeechProfileCategoryGroup all];
      id v11 = *(id *)(a1 + 48);
      __int16 v23 = (void *)*MEMORY[0x1E4F4E380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
      {
        id v24 = v23;
        int v25 = [v11 count];
        *(_DWORD *)buf = 136316162;
        long long v37 = "-[CESRSpeechProfileSiteWriter _updateProfilesWithSets:allSets:shouldDefer:]_block_invoke";
        __int16 v38 = 2112;
        id v39 = v8;
        __int16 v40 = 1024;
        LODWORD(v41) = v25;
        WORD2(v41) = 2112;
        *(void *)((char *)&v41 + 6) = v14;
        HIWORD(v41) = 2112;
        *(void *)char v42 = v11;
        _os_log_impl(&dword_1B8CCB000, v24, OS_LOG_TYPE_INFO, "%s (%@) Rebuilding with %u total sets with category group: %@ sets: %@", buf, 0x30u);
      }
    }
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __75__CESRSpeechProfileSiteWriter__updateProfilesWithSets_allSets_shouldDefer___block_invoke_15;
    v30[3] = &unk_1E61C2C58;
    id v26 = *(void **)(a1 + 32);
    id v27 = *(id *)(a1 + 40);
    uint64_t v28 = *(void *)(a1 + 32);
    id v31 = v27;
    uint64_t v32 = v28;
    id v33 = v8;
    id v14 = v14;
    id v34 = v14;
    if (([v26 _updateProfileInstance:v33 categoryGroup:v14 sets:v11 shouldDefer:v30] & 1) == 0) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    }

LABEL_22:
    goto LABEL_23;
  }
  char v22 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    long long v37 = "-[CESRSpeechProfileSiteWriter _updateProfilesWithSets:allSets:shouldDefer:]_block_invoke";
    __int16 v38 = 2112;
    id v39 = v9;
    _os_log_error_impl(&dword_1B8CCB000, v22, OS_LOG_TYPE_ERROR, "%s Failed to resolve / create instance: %@", buf, 0x16u);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
LABEL_23:
}

uint64_t __75__CESRSpeechProfileSiteWriter__updateProfilesWithSets_allSets_shouldDefer___block_invoke_15(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    return objc_msgSend(*(id *)(a1 + 40), "_shouldDeferUpdateForInstance:categoryGroup:sets:", *(void *)(a1 + 48), *(void *)(a1 + 56));
  }
  else {
    return 0;
  }
}

- (void)logCurrentStateWithAllSets:(id)a3
{
  id v4 = a3;
  id v5 = [(CESRSpeechProfileSite *)self->_speechProfileSite description];
  settings = self->_settings;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__CESRSpeechProfileSiteWriter_logCurrentStateWithAllSets___block_invoke;
  v9[3] = &unk_1E61C2C30;
  v9[4] = self;
  id v10 = v4;
  id v11 = v5;
  id v7 = v5;
  id v8 = v4;
  [(CESRSpeechProfileSettings *)settings enumerateRequiredInstances:v9];
}

void __58__CESRSpeechProfileSiteWriter_logCurrentStateWithAllSets___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v42 = a2;
  context = (void *)MEMORY[0x1BA9CC310]();
  uint64_t v46 = a1;
  id v5 = *(void **)(*(void *)(a1 + 32) + 8);
  id v63 = 0;
  id v44 = [v5 instanceWithLocale:v42 options:a3 error:&v63];
  id v6 = v63;
  id v7 = v44;
  if (v44)
  {
    id v8 = [v44 description];
    id v9 = (void *)MEMORY[0x1E4F1CA80];
    id v10 = [*(id *)(a1 + 32) _filterSets:*(void *)(a1 + 40) supportedByInstance:v44];
    id v11 = [v9 setWithArray:v10];

    uint64_t v12 = [v44 changeRegistry];
    uint64_t v59 = 0;
    id v60 = &v59;
    uint64_t v61 = 0x2020000000;
    int v62 = 0;
    int v13 = (id *)MEMORY[0x1E4F4E380];
    id v14 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = *(void **)(v46 + 48);
      *(_DWORD *)buf = 136315650;
      uint64_t v65 = "-[CESRSpeechProfileSiteWriter logCurrentStateWithAllSets:]_block_invoke";
      __int16 v66 = 2112;
      id v67 = v15;
      __int16 v68 = 2112;
      id v69 = v8;
      _os_log_impl(&dword_1B8CCB000, v14, OS_LOG_TYPE_INFO, "%s (%@) [%@] Enumerating all registered bookmarks...", buf, 0x20u);
    }
    id v58 = v6;
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __58__CESRSpeechProfileSiteWriter_logCurrentStateWithAllSets___block_invoke_8;
    v52[3] = &unk_1E61C2C08;
    __int16 v53 = v12;
    id v54 = *(id *)(v46 + 48);
    id v45 = v8;
    id v55 = v45;
    uint64_t v16 = v11;
    char v56 = v16;
    uint64_t v57 = &v59;
    __int16 v40 = v53;
    char v17 = [(__CFString *)v53 enumerateAllBookmarks:&v58 usingBlock:v52];
    id v41 = v58;

    if (v17)
    {

      BOOL v18 = *v13;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        uint64_t v19 = *(void **)(v46 + 48);
        int v20 = *((_DWORD *)v60 + 6);
        uint64_t v21 = [(__CFString *)v16 count];
        uint64_t v65 = "-[CESRSpeechProfileSiteWriter logCurrentStateWithAllSets:]_block_invoke";
        char v22 = @"none";
        *(_DWORD *)buf = 136316162;
        __int16 v66 = 2112;
        if (v21) {
          char v22 = v16;
        }
        id v67 = v19;
        __int16 v68 = 2112;
        id v69 = v45;
        __int16 v70 = 1024;
        *(_DWORD *)v71 = v20;
        *(_WORD *)&v71[4] = 2112;
        *(void *)&v71[6] = v22;
        _os_log_impl(&dword_1B8CCB000, v18, OS_LOG_TYPE_INFO, "%s (%@) [%@] Enumerated %u bookmarks for sets excluding: %@", buf, 0x30u);
      }

      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      __int16 v23 = v16;
      uint64_t v24 = [(__CFString *)v23 countByEnumeratingWithState:&v48 objects:v74 count:16];
      if (v24)
      {
        uint64_t v25 = *(void *)v49;
        do
        {
          uint64_t v26 = 0;
          uint64_t v47 = v24;
          do
          {
            if (*(void *)v49 != v25) {
              objc_enumerationMutation(v23);
            }
            id v27 = *(void **)(*((void *)&v48 + 1) + 8 * v26);
            uint64_t v28 = [v27 changePublisherWithUseCase:@"SpeechProfile"];
            id v29 = *v13;
            if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
            {
              uint64_t v30 = v25;
              id v31 = v23;
              uint64_t v32 = v13;
              id v33 = v16;
              id v34 = *(void **)(v46 + 48);
              uint64_t v35 = [v28 sharedItemCount];
              uint64_t v36 = [v28 localItemInstanceCount];
              *(_DWORD *)buf = 136316418;
              uint64_t v65 = "-[CESRSpeechProfileSiteWriter logCurrentStateWithAllSets:]_block_invoke";
              __int16 v66 = 2112;
              id v67 = v34;
              __int16 v68 = 2112;
              id v69 = v45;
              __int16 v70 = 2112;
              *(void *)v71 = v27;
              *(_WORD *)&v71[8] = 2048;
              *(void *)&v71[10] = v35;
              __int16 v72 = 2048;
              uint64_t v73 = v36;
              _os_log_impl(&dword_1B8CCB000, v29, OS_LOG_TYPE_INFO, "%s (%@) [%@] EXCLUDED applicable set: %@ (sharedItemCount: %lu, localItemInstanceCount: %lu)", buf, 0x3Eu);
              uint64_t v16 = v33;
              int v13 = v32;
              __int16 v23 = v31;
              uint64_t v25 = v30;
              uint64_t v24 = v47;
            }

            ++v26;
          }
          while (v24 != v26);
          uint64_t v24 = [(__CFString *)v23 countByEnumeratingWithState:&v48 objects:v74 count:16];
        }
        while (v24);
      }
    }
    else
    {
      __int16 v38 = *v13;
      if (os_log_type_enabled((os_log_t)*v13, OS_LOG_TYPE_ERROR))
      {
        id v39 = *(void **)(v46 + 48);
        *(_DWORD *)buf = 136315906;
        uint64_t v65 = "-[CESRSpeechProfileSiteWriter logCurrentStateWithAllSets:]_block_invoke";
        __int16 v66 = 2112;
        id v67 = v39;
        __int16 v68 = 2112;
        id v69 = v45;
        __int16 v70 = 2112;
        *(void *)v71 = v41;
        _os_log_error_impl(&dword_1B8CCB000, v38, OS_LOG_TYPE_ERROR, "%s (%@) [%@] Failed to enumerate change registry, error: %@", buf, 0x2Au);
      }

      __int16 v23 = v53;
    }

    _Block_object_dispose(&v59, 8);
    id v6 = v41;
    id v7 = v44;
  }
  else
  {
    long long v37 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v65 = "-[CESRSpeechProfileSiteWriter logCurrentStateWithAllSets:]_block_invoke";
      __int16 v66 = 2112;
      id v67 = v6;
      _os_log_error_impl(&dword_1B8CCB000, v37, OS_LOG_TYPE_ERROR, "%s Failed to get/create instance, error: %@", buf, 0x16u);
    }
  }
}

void __58__CESRSpeechProfileSiteWriter_logCurrentStateWithAllSets___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 changePublisherWithUseCase:@"SpeechProfile"];
  id v8 = [*(id *)(a1 + 32) descriptionForBookmark:v6];
  int v9 = [v7 isBookmarkUpToDate:v6];

  id v10 = *MEMORY[0x1E4F4E380];
  BOOL v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO);
  if (v9)
  {
    if (v11)
    {
      uint64_t v12 = *(void *)(a1 + 40);
      uint64_t v13 = *(void *)(a1 + 48);
      int v17 = 136315906;
      BOOL v18 = "-[CESRSpeechProfileSiteWriter logCurrentStateWithAllSets:]_block_invoke";
      __int16 v19 = 2112;
      uint64_t v20 = v12;
      __int16 v21 = 2112;
      uint64_t v22 = v13;
      __int16 v23 = 2112;
      uint64_t v24 = v8;
      _os_log_impl(&dword_1B8CCB000, v10, OS_LOG_TYPE_INFO, "%s (%@) [%@] Up-to-date: %@", (uint8_t *)&v17, 0x2Au);
    }
  }
  else if (v11)
  {
    uint64_t v14 = *(void *)(a1 + 40);
    uint64_t v15 = *(void *)(a1 + 48);
    uint64_t v16 = v10;
    int v17 = 136316674;
    BOOL v18 = "-[CESRSpeechProfileSiteWriter logCurrentStateWithAllSets:]_block_invoke";
    __int16 v19 = 2112;
    uint64_t v20 = v14;
    __int16 v21 = 2112;
    uint64_t v22 = v15;
    __int16 v23 = 2112;
    uint64_t v24 = v8;
    __int16 v25 = 2112;
    id v26 = v5;
    __int16 v27 = 2048;
    uint64_t v28 = [v7 sharedItemCount];
    __int16 v29 = 2048;
    uint64_t v30 = [v7 localItemInstanceCount];
    _os_log_impl(&dword_1B8CCB000, v16, OS_LOG_TYPE_INFO, "%s (%@) [%@] OUTDATED: %@ with current set %@ (sharedItemCount: %lu, localItemInstanceCount: %lu)", (uint8_t *)&v17, 0x48u);
  }
  [*(id *)(a1 + 56) removeObject:v5];
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
}

- (BOOL)rebuildWithAllSets:(id)a3 shouldDefer:(id)a4
{
  return [(CESRSpeechProfileSiteWriter *)self _updateProfilesWithSets:0 allSets:a3 shouldDefer:a4];
}

- (id)description
{
  id v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)CESRSpeechProfileSiteWriter;
  id v4 = [(CESRSpeechProfileSiteWriter *)&v7 description];
  id v5 = [v3 stringWithFormat:@"%@ %@", v4, self->_speechProfileSite];

  return v5;
}

- (CESRSpeechProfileSiteWriter)initWithSpeechProfileSite:(id)a3 settings:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CESRSpeechProfileSiteWriter;
  int v9 = [(CESRSpeechProfileSiteWriter *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_speechProfileSite, a3);
    objc_storeStrong((id *)&v10->_settings, a4);
  }

  return v10;
}

@end