@interface CESRSpeechProfileUpdater
+ (id)updaterForInstance:(id)a3 atSpeechProfileSite:(id)a4;
+ (unint64_t)updateModeForSet:(id)a3 speechProfileInstance:(id)a4 isSetNew:(BOOL *)a5;
+ (unint64_t)updateModeForSets:(id)a3 speechProfileInstance:(id)a4 speechProfileSite:(id)a5 isAnySetNew:(BOOL *)a6;
- (BOOL)_errorRequiresCleanRebuild:(id)a3;
- (BOOL)detectCategoriesToRebuild:(id *)a3 error:(id *)a4;
- (BOOL)rebuildCategoryGroup:(id)a3 withSets:(id)a4 version:(id)a5 error:(id *)a6;
- (BOOL)removeProfile:(id *)a3;
- (CESRSpeechProfileBuilder)builder;
- (CESRSpeechProfileUpdater)initWithInstance:(id)a3 speechProfileSite:(id)a4 builder:(id)a5;
- (id)_versionForCategory:(id)a3 error:(id *)a4;
- (id)categoriesToRebuildForAllSets:(id)a3;
- (void)_endSpeechProfileUpdateSignpost:(unint64_t)a3 updateResult:(unsigned __int8)a4 updateType:(unsigned __int8)a5 categoryCount:(unint64_t)a6 itemCount:(unint64_t)a7;
- (void)refreshRankedItemCaches;
@end

@implementation CESRSpeechProfileUpdater

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_builder, 0);
  objc_storeStrong((id *)&self->_speechProfileSite, 0);

  objc_storeStrong((id *)&self->_instance, 0);
}

- (CESRSpeechProfileBuilder)builder
{
  return self->_builder;
}

- (void)refreshRankedItemCaches
{
}

- (BOOL)removeProfile:(id *)a3
{
  v5 = [(CESRSpeechProfileSite *)self->_speechProfileSite speechProfileSiteURL];
  v6 = [(CESRSpeechProfileInstance *)self->_instance locale];
  v7 = [(CESRSpeechProfileSite *)self->_speechProfileSite userId];
  LOBYTE(a3) = +[CESRSpeechProfileBuilder deleteProfileAtDirectory:v5 locale:v6 userId:v7 error:a3];

  return (char)a3;
}

- (BOOL)_errorRequiresCleanRebuild:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 code];
  v5 = [v3 domain];

  int v6 = [v5 isEqual:@"CESRProfileErrorDomain"];
  BOOL v8 = v4 == 6 || (unint64_t)(v4 - 1) < 2;
  if (v6) {
    BOOL v9 = v8;
  }
  else {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)_versionForCategory:(id)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  builder = self->_builder;
  id v13 = 0;
  uint64_t v8 = [(CESRSpeechProfileBuilder *)builder getVersionForCategory:v6 error:&v13];
  id v9 = v13;
  if (v9)
  {
    v10 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v15 = "-[CESRSpeechProfileUpdater _versionForCategory:error:]";
      __int16 v16 = 2112;
      id v17 = v6;
      __int16 v18 = 2112;
      id v19 = v9;
      _os_log_error_impl(&dword_1B8CCB000, v10, OS_LOG_TYPE_ERROR, "%s Checking version for category (%@) produced error: %@", buf, 0x20u);
      if (a4) {
        goto LABEL_4;
      }
    }
    else if (a4)
    {
LABEL_4:
      v11 = 0;
      *a4 = v9;
      goto LABEL_8;
    }
    v11 = 0;
  }
  else
  {
    v11 = [NSNumber numberWithLongLong:v8];
  }
LABEL_8:

  return v11;
}

- (id)categoriesToRebuildForAllSets:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(CESRSpeechProfileInstance *)self->_instance changeRegistry];
  id v25 = 0;
  char v6 = [v5 cleanupWithAllSets:v4 error:&v25];
  id v7 = v25;

  if (v6)
  {
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v9 = v4;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          buf[0] = 0;
          unint64_t v15 = +[CESRSpeechProfileUpdater updateModeForSet:speechProfileInstance:isSetNew:](CESRSpeechProfileUpdater, "updateModeForSet:speechProfileInstance:isSetNew:", v14, self->_instance, buf, (void)v21);
          if (buf[0]) {
            BOOL v16 = 0;
          }
          else {
            BOOL v16 = v15 == 0;
          }
          if (!v16) {
            [v8 addObject:v14];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v11);
    }

    if ([v8 count])
    {
      id v17 = +[CESRSpeechProfileCategoryGroup groupForSets:v8];
    }
    else
    {
      id v17 = 0;
    }
  }
  else
  {
    __int16 v18 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      instance = self->_instance;
      *(_DWORD *)buf = 136315650;
      v28 = "-[CESRSpeechProfileUpdater categoriesToRebuildForAllSets:]";
      __int16 v29 = 2112;
      v30 = instance;
      __int16 v31 = 2112;
      id v32 = v7;
      _os_log_impl(&dword_1B8CCB000, v18, OS_LOG_TYPE_INFO, "%s (%@) Registry cleanup failed: %@", buf, 0x20u);
    }
    id v17 = +[CESRSpeechProfileCategoryGroup all];
  }

  return v17;
}

- (BOOL)detectCategoriesToRebuild:(id *)a3 error:(id *)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v7 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    instance = self->_instance;
    *(_DWORD *)buf = 136315394;
    v49 = "-[CESRSpeechProfileUpdater detectCategoriesToRebuild:error:]";
    __int16 v50 = 2112;
    v51 = instance;
    _os_log_impl(&dword_1B8CCB000, v7, OS_LOG_TYPE_INFO, "%s (%@) Verifying profile", buf, 0x16u);
  }
  v39 = a3;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v9 = +[CESRSpeechProfileCategoryGroup all];
  uint64_t v10 = [v9 speechCategories];

  id obj = v10;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v44 objects:v60 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    v38 = a4;
    id v13 = 0;
    id v14 = 0;
    uint64_t v41 = *(void *)v45;
LABEL_5:
    uint64_t v15 = 0;
    BOOL v16 = v14;
    while (1)
    {
      if (*(void *)v45 != v41) {
        objc_enumerationMutation(obj);
      }
      id v17 = *(void **)(*((void *)&v44 + 1) + 8 * v15);
      id v43 = v16;
      __int16 v18 = -[CESRSpeechProfileUpdater _versionForCategory:error:](self, "_versionForCategory:error:", v17, &v43, v38);
      id v14 = v43;

      if (!v18)
      {
        if ([(CESRSpeechProfileUpdater *)self _errorRequiresCleanRebuild:v14])
        {
          v30 = *MEMORY[0x1E4F4E380];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
          {
            __int16 v31 = self->_instance;
            *(_DWORD *)buf = 136315650;
            v49 = "-[CESRSpeechProfileUpdater detectCategoriesToRebuild:error:]";
            __int16 v50 = 2112;
            v51 = v31;
            __int16 v52 = 2112;
            id v53 = v14;
            _os_log_impl(&dword_1B8CCB000, v30, OS_LOG_TYPE_INFO, "%s (%@) Verification error requires profile rebuild: %@", buf, 0x20u);
          }
          id v42 = 0;
          BOOL v32 = [(CESRSpeechProfileUpdater *)self removeProfile:&v42];
          id v33 = v42;
          if (!v32)
          {
            v34 = *MEMORY[0x1E4F4E380];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
            {
              v37 = self->_instance;
              *(_DWORD *)buf = 136315650;
              v49 = "-[CESRSpeechProfileUpdater detectCategoriesToRebuild:error:]";
              __int16 v50 = 2112;
              v51 = v37;
              __int16 v52 = 2112;
              id v53 = v33;
              _os_log_error_impl(&dword_1B8CCB000, v34, OS_LOG_TYPE_ERROR, "%s (%@) Failed to remove profile: %@", buf, 0x20u);
            }
          }
        }
        if (v38 && v14) {
          id *v38 = v14;
        }

        BOOL v35 = 0;
        goto LABEL_40;
      }
      id v19 = [(CESRSpeechProfileInstance *)self->_instance lastCompletedVersionForSpeechCategory:v17];
      uint64_t v20 = [(CESRSpeechProfileInstance *)self->_instance lastRegisteredVersionForSpeechCategory:v17];
      long long v21 = *MEMORY[0x1E4F4E380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_DEBUG))
      {
        __int16 v29 = self->_instance;
        *(_DWORD *)buf = 136316418;
        v49 = "-[CESRSpeechProfileUpdater detectCategoriesToRebuild:error:]";
        __int16 v50 = 2112;
        v51 = v29;
        __int16 v52 = 2112;
        id v53 = v17;
        __int16 v54 = 2112;
        v55 = v18;
        __int16 v56 = 2112;
        v57 = v19;
        __int16 v58 = 2112;
        v59 = v20;
        _os_log_debug_impl(&dword_1B8CCB000, v21, OS_LOG_TYPE_DEBUG, "%s (%@) Checking category (%@) built version (%@) last completed update (%@) last registered update (%@)", buf, 0x3Eu);
      }
      if (([v18 isEqual:v19] & 1) == 0) {
        break;
      }
      uint64_t v22 = [v20 longLongValue];
      if (v22 > [v19 longLongValue])
      {
        long long v23 = *MEMORY[0x1E4F4E380];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
        {
          long long v24 = self->_instance;
          *(_DWORD *)buf = 136316162;
          v49 = "-[CESRSpeechProfileUpdater detectCategoriesToRebuild:error:]";
          __int16 v50 = 2112;
          v51 = v24;
          __int16 v52 = 2112;
          id v53 = v20;
          __int16 v54 = 2112;
          v55 = v19;
          __int16 v56 = 2112;
          v57 = v17;
          id v25 = v23;
          v26 = "%s (%@) Found deferred update registered (%@) more recently than last completed (%@) for category (%@)";
          goto LABEL_17;
        }
        goto LABEL_18;
      }
LABEL_21:

      ++v15;
      BOOL v16 = v14;
      if (v12 == v15)
      {
        uint64_t v12 = [obj countByEnumeratingWithState:&v44 objects:v60 count:16];
        if (v12) {
          goto LABEL_5;
        }
        goto LABEL_36;
      }
    }
    v27 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      v28 = self->_instance;
      *(_DWORD *)buf = 136316162;
      v49 = "-[CESRSpeechProfileUpdater detectCategoriesToRebuild:error:]";
      __int16 v50 = 2112;
      v51 = v28;
      __int16 v52 = 2112;
      id v53 = v17;
      __int16 v54 = 2112;
      v55 = v18;
      __int16 v56 = 2112;
      v57 = v19;
      id v25 = v27;
      v26 = "%s (%@) Built category (%@) has version (%@) inconsistent with instance info file (%@)";
LABEL_17:
      _os_log_impl(&dword_1B8CCB000, v25, OS_LOG_TYPE_INFO, v26, buf, 0x34u);
    }
LABEL_18:
    if (!v13) {
      id v13 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    }
    [v13 addObject:v17];
    goto LABEL_21;
  }
  id v13 = 0;
  id v14 = 0;
LABEL_36:

  if (v39 && [v13 count])
  {
    id *v39 = +[CESRSpeechProfileCategoryGroup groupForSpeechCategories:v13];
  }
  BOOL v35 = 1;
LABEL_40:

  return v35;
}

- (void)_endSpeechProfileUpdateSignpost:(unint64_t)a3 updateResult:(unsigned __int8)a4 updateType:(unsigned __int8)a5 categoryCount:(unint64_t)a6 itemCount:(unint64_t)a7
{
  int v7 = a7;
  int v8 = a6;
  int v9 = a5;
  int v10 = a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = (id)*MEMORY[0x1E4F4E380];
  id v13 = v12;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    if ((v9 - 1) > 2) {
      id v14 = @"Undefined";
    }
    else {
      id v14 = off_1E61C2A18[(v9 - 1)];
    }
    uint64_t v15 = v14;
    if ((v10 - 1) > 5) {
      BOOL v16 = @"Undefined";
    }
    else {
      BOOL v16 = off_1E61C2A78[(v10 - 1)];
    }
    id v17 = v16;
    int v18 = 138544130;
    id v19 = v15;
    __int16 v20 = 2114;
    long long v21 = v17;
    __int16 v22 = 1026;
    int v23 = v7;
    __int16 v24 = 1026;
    int v25 = v8;
    _os_signpost_emit_with_name_impl(&dword_1B8CCB000, v13, OS_SIGNPOST_INTERVAL_END, a3, "speechProfileUpdate", " updateType=%{public,signpost.telemetry:string1}@  updateResult=%{public,signpost.telemetry:string2}@  itemCount=%{public,signpost.telemetry:number1}d  speechCategoriesCount=%{public,signpost.telemetry:number2}d ", (uint8_t *)&v18, 0x22u);
  }
}

- (BOOL)rebuildCategoryGroup:(id)a3 withSets:(id)a4 version:(id)a5 error:(id *)a6
{
  uint64_t v140 = *MEMORY[0x1E4F143B8];
  id v94 = a3;
  id v90 = a4;
  id v101 = a5;
  int v9 = (id *)MEMORY[0x1E4F4E380];
  os_signpost_id_t v10 = os_signpost_id_generate((os_log_t)*MEMORY[0x1E4F4E380]);
  uint64_t v11 = *v9;
  uint64_t v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B8CCB000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "speechProfileUpdate", " enableTelemetry=YES ", buf, 2u);
  }
  os_signpost_id_t v89 = v10;

  id v13 = +[CESRSpeechProfileCategoryGroup all];
  if ([v94 isEqual:v13]) {
    int v14 = 3;
  }
  else {
    int v14 = 1;
  }
  unsigned int v88 = v14;

  uint64_t v15 = [v94 speechCategories];
  uint64_t v91 = [v15 count];

  if (v91)
  {
    v86 = +[CESRSpeechItemRanker rankersForInstance:self->_instance speechProfileSite:self->_speechProfileSite categoryGroup:v94 sets:v90];
    v100 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v91];
    long long v128 = 0u;
    long long v129 = 0u;
    long long v126 = 0u;
    long long v127 = 0u;
    BOOL v16 = [v94 speechCategories];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v126 objects:v139 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v127;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v127 != v18) {
            objc_enumerationMutation(v16);
          }
          [v100 setObject:v101 forKey:*(void *)(*((void *)&v126 + 1) + 8 * i)];
        }
        uint64_t v17 = [v16 countByEnumeratingWithState:&v126 objects:v139 count:16];
      }
      while (v17);
    }

    id v20 = *v9;
    if (os_log_type_enabled((os_log_t)*v9, OS_LOG_TYPE_INFO))
    {
      instance = self->_instance;
      __int16 v22 = v20;
      int v23 = [v94 speechCategoriesDescription];
      *(_DWORD *)buf = 136315906;
      v134 = "-[CESRSpeechProfileUpdater rebuildCategoryGroup:withSets:version:error:]";
      __int16 v135 = 2112;
      *(void *)v136 = instance;
      *(_WORD *)&v136[8] = 2112;
      *(void *)&v136[10] = v101;
      __int16 v137 = 2112;
      id v138 = v23;
      _os_log_impl(&dword_1B8CCB000, v22, OS_LOG_TYPE_INFO, "%s (%@) Updating version: %@ for categories: %@", buf, 0x2Au);
    }
    builder = self->_builder;
    id v125 = 0;
    BOOL v25 = [(CESRSpeechProfileBuilder *)builder beginWithCategoriesAndVersions:v100 bundleId:0 error:&v125];
    id v26 = v125;
    id v27 = v26;
    if (v25)
    {
      id v98 = v26;
      long long v123 = 0u;
      long long v124 = 0u;
      long long v121 = 0u;
      long long v122 = 0u;
      id obj = v86;
      uint64_t v95 = [obj countByEnumeratingWithState:&v121 objects:v132 count:16];
      if (v95)
      {
        LODWORD(v97) = 0;
        uint64_t v93 = *(void *)v122;
        while (2)
        {
          uint64_t v28 = 0;
          __int16 v29 = v98;
          do
          {
            if (*(void *)v122 != v93)
            {
              uint64_t v30 = v28;
              objc_enumerationMutation(obj);
              uint64_t v28 = v30;
            }
            uint64_t v96 = v28;
            __int16 v31 = *(void **)(*((void *)&v121 + 1) + 8 * v28);
            uint64_t v117 = 0;
            v118 = &v117;
            uint64_t v119 = 0x2020000000;
            int v120 = 0;
            v115[5] = &v117;
            id v116 = v29;
            v115[0] = MEMORY[0x1E4F143A8];
            v115[1] = 3221225472;
            v115[2] = __72__CESRSpeechProfileUpdater_rebuildCategoryGroup_withSets_version_error___block_invoke;
            v115[3] = &unk_1E61C2DC8;
            v115[4] = self;
            v99 = v31;
            char v32 = [v31 enumerateRankedItemsWithError:&v116 usingBlock:v115];
            id v98 = v116;

            if ((v32 & 1) == 0)
            {
              v62 = *v9;
              v63 = v98;
              if (os_log_type_enabled((os_log_t)*v9, OS_LOG_TYPE_ERROR))
              {
                v82 = self->_instance;
                *(_DWORD *)buf = 136315906;
                v134 = "-[CESRSpeechProfileUpdater rebuildCategoryGroup:withSets:version:error:]";
                __int16 v135 = 2112;
                *(void *)v136 = v82;
                *(_WORD *)&v136[8] = 2112;
                *(void *)&v136[10] = v99;
                __int16 v137 = 2112;
                id v138 = v98;
                _os_log_error_impl(&dword_1B8CCB000, v62, OS_LOG_TYPE_ERROR, "%s (%@) Failed to enumerate and add items from ranker: %@ error: %@", buf, 0x2Au);
              }
              if (a6 && v98)
              {
                *a6 = v98;
                v63 = v98;
              }

              v64 = self->_builder;
              id v114 = 0;
              BOOL v65 = [(CESRSpeechProfileBuilder *)v64 cancelCategoriesWithError:&v114];
              id v27 = v114;
              if (!v65)
              {
                v66 = *v9;
                if (os_log_type_enabled((os_log_t)*v9, OS_LOG_TYPE_ERROR))
                {
                  v83 = self->_instance;
                  *(_DWORD *)buf = 136315906;
                  v134 = "-[CESRSpeechProfileUpdater rebuildCategoryGroup:withSets:version:error:]";
                  __int16 v135 = 2112;
                  *(void *)v136 = v83;
                  *(_WORD *)&v136[8] = 2112;
                  *(void *)&v136[10] = v100;
                  __int16 v137 = 2112;
                  id v138 = v27;
                  _os_log_error_impl(&dword_1B8CCB000, v66, OS_LOG_TYPE_ERROR, "%s (%@) Failed to cancel categories: %@ error: %@", buf, 0x2Au);
                }
              }
              v67 = [(CESRSpeechProfileInstance *)self->_instance changeRegistry];
              [v67 rollbackAllBookmarkUpdates];

              [(CESRSpeechProfileUpdater *)self _endSpeechProfileUpdateSignpost:v89 updateResult:4 updateType:v88 categoryCount:v91 itemCount:0];
              _Block_object_dispose(&v117, 8);

              goto LABEL_69;
            }
            long long v110 = 0u;
            long long v111 = 0u;
            long long v112 = 0u;
            long long v113 = 0u;
            id v33 = [v99 getAllCodepathIds];
            v34 = 0;
            uint64_t v35 = [v33 countByEnumeratingWithState:&v110 objects:v131 count:16];
            if (v35)
            {
              uint64_t v36 = *(void *)v111;
              do
              {
                for (uint64_t j = 0; j != v35; ++j)
                {
                  if (*(void *)v111 != v36) {
                    objc_enumerationMutation(v33);
                  }
                  uint64_t v38 = *(void *)(*((void *)&v110 + 1) + 8 * j);
                  v39 = self->_builder;
                  id v109 = v34;
                  BOOL v40 = [(CESRSpeechProfileBuilder *)v39 removeCodepathId:v38 error:&v109];
                  id v41 = v109;

                  v34 = v41;
                  if (!v40)
                  {
                    id v42 = *v9;
                    if (os_log_type_enabled((os_log_t)*v9, OS_LOG_TYPE_ERROR))
                    {
                      id v43 = self->_instance;
                      *(_DWORD *)buf = 136315906;
                      v134 = "-[CESRSpeechProfileUpdater rebuildCategoryGroup:withSets:version:error:]";
                      __int16 v135 = 2112;
                      *(void *)v136 = v43;
                      *(_WORD *)&v136[8] = 2112;
                      *(void *)&v136[10] = v38;
                      __int16 v137 = 2112;
                      id v138 = v41;
                      _os_log_error_impl(&dword_1B8CCB000, v42, OS_LOG_TYPE_ERROR, "%s (%@) Failed to remove codepathId=%@ from the profile: %@", buf, 0x2Au);
                    }
                  }
                }
                uint64_t v35 = [v33 countByEnumeratingWithState:&v110 objects:v131 count:16];
              }
              while (v35);
            }

            long long v107 = 0u;
            long long v108 = 0u;
            long long v105 = 0u;
            long long v106 = 0u;
            long long v44 = [v99 getActivatedCodepathIds];
            uint64_t v45 = [v44 countByEnumeratingWithState:&v105 objects:v130 count:16];
            if (v45)
            {
              uint64_t v46 = *(void *)v106;
              do
              {
                for (uint64_t k = 0; k != v45; ++k)
                {
                  if (*(void *)v106 != v46) {
                    objc_enumerationMutation(v44);
                  }
                  uint64_t v48 = *(void *)(*((void *)&v105 + 1) + 8 * k);
                  v49 = *v9;
                  if (os_log_type_enabled((os_log_t)*v9, OS_LOG_TYPE_DEBUG))
                  {
                    __int16 v54 = self->_instance;
                    *(_DWORD *)buf = 136315650;
                    v134 = "-[CESRSpeechProfileUpdater rebuildCategoryGroup:withSets:version:error:]";
                    __int16 v135 = 2112;
                    *(void *)v136 = v54;
                    *(_WORD *)&v136[8] = 2112;
                    *(void *)&v136[10] = v48;
                    _os_log_debug_impl(&dword_1B8CCB000, v49, OS_LOG_TYPE_DEBUG, "%s (%@) Adding codepathId=%@ to the profile for trigger logging", buf, 0x20u);
                  }
                  __int16 v50 = self->_builder;
                  id v104 = v34;
                  BOOL v51 = [(CESRSpeechProfileBuilder *)v50 addCodepathId:v48 error:&v104];
                  id v52 = v104;

                  v34 = v52;
                  if (!v51)
                  {
                    id v53 = *v9;
                    if (os_log_type_enabled((os_log_t)*v9, OS_LOG_TYPE_ERROR))
                    {
                      v55 = self->_instance;
                      *(_DWORD *)buf = 136315906;
                      v134 = "-[CESRSpeechProfileUpdater rebuildCategoryGroup:withSets:version:error:]";
                      __int16 v135 = 2112;
                      *(void *)v136 = v55;
                      *(_WORD *)&v136[8] = 2112;
                      *(void *)&v136[10] = v48;
                      __int16 v137 = 2112;
                      id v138 = v52;
                      _os_log_error_impl(&dword_1B8CCB000, v53, OS_LOG_TYPE_ERROR, "%s (%@) Failed to add codepathId=%@ to the profile: %@", buf, 0x2Au);
                    }
                  }
                }
                uint64_t v45 = [v44 countByEnumeratingWithState:&v105 objects:v130 count:16];
              }
              while (v45);
            }

            int v56 = *((_DWORD *)v118 + 6);
            v57 = *v9;
            if (os_log_type_enabled((os_log_t)*v9, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315650;
              v134 = "-[CESRSpeechProfileUpdater rebuildCategoryGroup:withSets:version:error:]";
              __int16 v135 = 1024;
              *(_DWORD *)v136 = v56;
              *(_WORD *)&v136[4] = 2112;
              *(void *)&v136[6] = v99;
              _os_log_impl(&dword_1B8CCB000, v57, OS_LOG_TYPE_INFO, "%s Enumerated %u total items from ranker: %@", buf, 0x1Cu);
            }

            uint64_t v97 = (v56 + v97);
            _Block_object_dispose(&v117, 8);
            uint64_t v28 = v96 + 1;
            __int16 v29 = v98;
          }
          while (v96 + 1 != v95);
          uint64_t v95 = [obj countByEnumeratingWithState:&v121 objects:v132 count:16];
          if (v95) {
            continue;
          }
          break;
        }
      }
      else
      {
        uint64_t v97 = 0;
      }

      v69 = self->_builder;
      id v103 = v98;
      BOOL v70 = [(CESRSpeechProfileBuilder *)v69 finishAndSaveProfile:1 error:&v103];
      id v71 = v103;

      v72 = *v9;
      v73 = *v9;
      if (v70)
      {
        if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
        {
          v74 = self->_instance;
          v75 = v72;
          v76 = [v94 speechCategoriesDescription];
          *(_DWORD *)buf = 136315906;
          v134 = "-[CESRSpeechProfileUpdater rebuildCategoryGroup:withSets:version:error:]";
          __int16 v135 = 2112;
          *(void *)v136 = v74;
          *(_WORD *)&v136[8] = 2112;
          *(void *)&v136[10] = v101;
          __int16 v137 = 2112;
          id v138 = v76;
          _os_log_impl(&dword_1B8CCB000, v75, OS_LOG_TYPE_INFO, "%s (%@) Completed profile update version: %@ for categories: %@", buf, 0x2Au);
        }
        v77 = [(CESRSpeechProfileInstance *)self->_instance changeRegistry];
        id v102 = v71;
        char v78 = [v77 commitAllBookmarkUpdates:&v102];
        id v27 = v102;

        if ((v78 & 1) == 0)
        {
          v79 = *v9;
          if (os_log_type_enabled((os_log_t)*v9, OS_LOG_TYPE_ERROR))
          {
            v85 = self->_instance;
            *(_DWORD *)buf = 136315650;
            v134 = "-[CESRSpeechProfileUpdater rebuildCategoryGroup:withSets:version:error:]";
            __int16 v135 = 2112;
            *(void *)v136 = v85;
            *(_WORD *)&v136[8] = 2112;
            *(void *)&v136[10] = v27;
            _os_log_error_impl(&dword_1B8CCB000, v79, OS_LOG_TYPE_ERROR, "%s (%@) Failed to commit bookmark updates: %@", buf, 0x20u);
          }
        }
        [(CESRSpeechProfileUpdater *)self _endSpeechProfileUpdateSignpost:v89 updateResult:6 updateType:v88 categoryCount:v91 itemCount:v97];
        BOOL v60 = 1;
      }
      else
      {
        if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
        {
          v84 = self->_instance;
          *(_DWORD *)buf = 136315650;
          v134 = "-[CESRSpeechProfileUpdater rebuildCategoryGroup:withSets:version:error:]";
          __int16 v135 = 2112;
          *(void *)v136 = v84;
          *(_WORD *)&v136[8] = 2112;
          *(void *)&v136[10] = v71;
          _os_log_error_impl(&dword_1B8CCB000, v72, OS_LOG_TYPE_ERROR, "%s (%@) Failed to finish profile due to error: %@", buf, 0x20u);
        }
        if (a6 && v71) {
          *a6 = v71;
        }
        v80 = [(CESRSpeechProfileInstance *)self->_instance changeRegistry];
        [v80 rollbackAllBookmarkUpdates];

        [(CESRSpeechProfileUpdater *)self _endSpeechProfileUpdateSignpost:v89 updateResult:1 updateType:v88 categoryCount:v91 itemCount:v97];
        BOOL v60 = 0;
        id v27 = v71;
      }
    }
    else
    {
      uint64_t v61 = *v9;
      if (os_log_type_enabled((os_log_t)*v9, OS_LOG_TYPE_ERROR))
      {
        v81 = self->_instance;
        *(_DWORD *)buf = 136315906;
        v134 = "-[CESRSpeechProfileUpdater rebuildCategoryGroup:withSets:version:error:]";
        __int16 v135 = 2112;
        *(void *)v136 = v81;
        *(_WORD *)&v136[8] = 2112;
        *(void *)&v136[10] = v100;
        __int16 v137 = 2112;
        id v138 = v27;
        _os_log_error_impl(&dword_1B8CCB000, v61, OS_LOG_TYPE_ERROR, "%s (%@) Failed to begin building categories: %@ error: %@", buf, 0x2Au);
      }
      if (a6 && v27) {
        *a6 = v27;
      }
      [(CESRSpeechProfileUpdater *)self _endSpeechProfileUpdateSignpost:v89 updateResult:3 updateType:v88 categoryCount:v91 itemCount:0];
LABEL_69:
      BOOL v60 = 0;
    }
  }
  else
  {
    __int16 v58 = *v9;
    if (os_log_type_enabled((os_log_t)*v9, OS_LOG_TYPE_INFO))
    {
      v59 = self->_instance;
      *(_DWORD *)buf = 136315650;
      v134 = "-[CESRSpeechProfileUpdater rebuildCategoryGroup:withSets:version:error:]";
      __int16 v135 = 2112;
      *(void *)v136 = v59;
      *(_WORD *)&v136[8] = 2112;
      *(void *)&v136[10] = v94;
      _os_log_impl(&dword_1B8CCB000, v58, OS_LOG_TYPE_INFO, "%s (%@) Skipping update for group: %@", buf, 0x20u);
    }
    [(CESRSpeechProfileUpdater *)self _endSpeechProfileUpdateSignpost:v10 updateResult:5 updateType:v88 categoryCount:0 itemCount:0];
    BOOL v60 = 1;
  }

  return v60;
}

uint64_t __72__CESRSpeechProfileUpdater_rebuildCategoryGroup_withSets_version_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) addVocabularyItem:a2 isBoosted:a3 error:a4];
}

- (CESRSpeechProfileUpdater)initWithInstance:(id)a3 speechProfileSite:(id)a4 builder:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CESRSpeechProfileUpdater;
  uint64_t v12 = [(CESRSpeechProfileUpdater *)&v15 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_instance, a3);
    objc_storeStrong((id *)&v13->_speechProfileSite, a4);
    objc_storeStrong((id *)&v13->_builder, a5);
  }

  return v13;
}

+ (unint64_t)updateModeForSet:(id)a3 speechProfileInstance:(id)a4 isSetNew:(BOOL *)a5
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v32 = 0;
  id v33 = &v32;
  uint64_t v34 = 0x3032000000;
  uint64_t v35 = __Block_byref_object_copy_;
  uint64_t v36 = __Block_byref_object_dispose_;
  id v37 = 0;
  uint64_t v28 = 0;
  __int16 v29 = &v28;
  uint64_t v30 = 0x2020000000;
  uint64_t v31 = 0;
  id v9 = [v8 changeRegistry];
  id v10 = [v9 bookmarkForSet:v7];

  if (!v10)
  {
    uint64_t v18 = *MEMORY[0x1E4F4E380];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO)) {
      goto LABEL_8;
    }
    *(_DWORD *)buf = 136315650;
    v39 = "+[CESRSpeechProfileUpdater updateModeForSet:speechProfileInstance:isSetNew:]";
    __int16 v40 = 2112;
    id v41 = v8;
    __int16 v42 = 2112;
    id v43 = v7;
    objc_super v15 = "%s (%@) No bookmark found for set: %@";
    BOOL v16 = v18;
    uint32_t v17 = 32;
LABEL_7:
    _os_log_impl(&dword_1B8CCB000, v16, OS_LOG_TYPE_INFO, v15, buf, v17);
LABEL_8:
    if (a5) {
      *a5 = 1;
    }
    goto LABEL_21;
  }
  id v11 = [v7 changePublisherWithUseCase:@"SpeechProfile"];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __76__CESRSpeechProfileUpdater_updateModeForSet_speechProfileInstance_isSetNew___block_invoke;
  v27[3] = &unk_1E61C2DF0;
  v27[4] = &v32;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __76__CESRSpeechProfileUpdater_updateModeForSet_speechProfileInstance_isSetNew___block_invoke_2;
  v26[3] = &unk_1E61C2E18;
  v26[4] = &v28;
  id v12 = (id)[v11 drivableSinkWithBookmark:v10 completion:v27 shouldContinue:v26];

  id v13 = (__CFString *)v33[5];
  int v14 = *MEMORY[0x1E4F4E380];
  if (v13)
  {
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO)) {
      goto LABEL_8;
    }
    *(_DWORD *)buf = 136315906;
    v39 = "+[CESRSpeechProfileUpdater updateModeForSet:speechProfileInstance:isSetNew:]";
    __int16 v40 = 2112;
    id v41 = v8;
    __int16 v42 = 2112;
    id v43 = v7;
    __int16 v44 = 2112;
    uint64_t v45 = v13;
    objc_super v15 = "%s (%@) Failed to enumerate set: %@ error: %@";
    BOOL v16 = v14;
    uint32_t v17 = 42;
    goto LABEL_7;
  }
  id v19 = v14;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    uint64_t v20 = v29[3];
    if (v20)
    {
      long long v21 = @"Add";
      __int16 v22 = &stru_1F1291150;
      if ((v20 & 1) == 0) {
        long long v21 = &stru_1F1291150;
      }
      if ((v20 & 2) != 0) {
        __int16 v22 = @"Remove";
      }
      int v23 = [NSString stringWithFormat:@"[%@|%@]", v21, v22];
    }
    else
    {
      int v23 = @"NO";
    }
    *(_DWORD *)buf = 136315906;
    v39 = "+[CESRSpeechProfileUpdater updateModeForSet:speechProfileInstance:isSetNew:]";
    __int16 v40 = 2112;
    id v41 = v8;
    __int16 v42 = 2112;
    id v43 = v7;
    __int16 v44 = 2112;
    uint64_t v45 = v23;
    _os_log_impl(&dword_1B8CCB000, v19, OS_LOG_TYPE_INFO, "%s (%@) Set %@ has %@ updates since last enumeration", buf, 0x2Au);
    if (v20) {
  }
    }
LABEL_21:
  unint64_t v24 = v29[3];

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);

  return v24;
}

uint64_t __76__CESRSpeechProfileUpdater_updateModeForSet_speechProfileInstance_isSetNew___block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a2 error];

  return MEMORY[0x1F41817F8]();
}

BOOL __76__CESRSpeechProfileUpdater_updateModeForSet_speechProfileInstance_isSetNew___block_invoke_2(uint64_t a1, void *a2)
{
  int v3 = [a2 sharedItemChangeType];
  if (!v3)
  {
    uint64_t v4 = 1;
    goto LABEL_5;
  }
  if (v3 == 2)
  {
    uint64_t v4 = 2;
LABEL_5:
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) |= v4;
  }
  return (~*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) & 3) != 0;
}

+ (unint64_t)updateModeForSets:(id)a3 speechProfileInstance:(id)a4 speechProfileSite:(id)a5 isAnySetNew:(BOOL *)a6
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  BOOL v21 = 0;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    unint64_t v13 = 0;
    uint64_t v14 = *(void *)v18;
LABEL_3:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v18 != v14) {
        objc_enumerationMutation(v10);
      }
      v13 |= +[CESRSpeechProfileUpdater updateModeForSet:speechProfileInstance:isSetNew:](CESRSpeechProfileUpdater, "updateModeForSet:speechProfileInstance:isSetNew:", *(void *)(*((void *)&v17 + 1) + 8 * v15), v9, &v21, (void)v17);
      if (v21) {
        break;
      }
      if (v12 == ++v15)
      {
        uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
        if (v12) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    unint64_t v13 = 0;
  }

  if (a6) {
    *a6 = v21;
  }

  return v13;
}

+ (id)updaterForInstance:(id)a3 atSpeechProfileSite:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [CESRSpeechProfileBuilder alloc];
  id v8 = [v5 speechProfileSiteURL];
  id v9 = [v6 locale];
  id v10 = [v5 userId];
  uint64_t v11 = -[CESRSpeechProfileBuilder initWithDirectory:locale:userId:dataProtectionClass:](v7, "initWithDirectory:locale:userId:dataProtectionClass:", v8, v9, v10, (int)[v5 dataProtectionClass]);

  uint64_t v12 = (void *)[objc_alloc((Class)objc_opt_class()) initWithInstance:v6 speechProfileSite:v5 builder:v11];

  return v12;
}

@end