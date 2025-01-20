@interface GEOSearchAttributionLoader
- (GEOSearchAttributionLoader)initWithAttributionManifest:(id)a3;
- (void)loadAttributionInfoForIdentifier:(id)a3 allowNetwork:(BOOL)a4 completionHandler:(id)a5;
@end

@implementation GEOSearchAttributionLoader

- (void).cxx_destruct
{
}

- (void)loadAttributionInfoForIdentifier:(id)a3 allowNetwork:(BOOL)a4 completionHandler:(id)a5
{
  uint64_t v117 = *MEMORY[0x1E4F143B8];
  id v66 = a3;
  v70 = (void (**)(id, GEOSearchAttributionInfo *, void))a5;
  v8 = GEOFindOrCreateLog("com.apple.GeoServices", "SearchAttribution");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&buf[4] = v66;
    _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_DEBUG, "Loading attribution for identifier: (%{public}@)", buf, 0xCu);
  }

  v63 = +[GEOFilePaths pathFor:16];
  if ([v63 length])
  {
    long long v108 = 0u;
    long long v109 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    v9 = -[GEOSearchAttributionManifest searchAttributionSources]((id *)&self->_attributionManifest->super.super.isa);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v106 objects:v116 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v107;
LABEL_6:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v107 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = *(id **)(*((void *)&v106 + 1) + 8 * v12);
        v14 = -[GEOSearchAttributionSource sourceIdentifier](v13);
        char v15 = [v66 isEqualToString:v14];

        if (v15) {
          break;
        }
        if (v10 == ++v12)
        {
          uint64_t v10 = [v9 countByEnumeratingWithState:&v106 objects:v116 count:16];
          if (v10) {
            goto LABEL_6;
          }
          goto LABEL_12;
        }
      }
      v62 = v13;

      if (!v62) {
        goto LABEL_42;
      }
      uint64_t v16 = -[GEOSearchAttributionSource bestLocalizedAttribution](v62);
      v60 = (id *)v16;
      if (v16)
      {
        -[GEOLocalizedAttribution _readLogoURLs](v16);
        if ([v60[6] count]
          || (-[GEOLocalizedAttribution _readSnippetLogoURLs]((uint64_t)v60), [v60[7] count]))
        {
          v17 = [MEMORY[0x1E4F1CA60] dictionary];
          v18 = [MEMORY[0x1E4F1CA48] array];
          v19 = [MEMORY[0x1E4F1CA48] array];
          v100[0] = MEMORY[0x1E4F143A8];
          v100[1] = 3221225472;
          v100[2] = __94__GEOSearchAttributionLoader_loadAttributionInfoForIdentifier_allowNetwork_completionHandler___block_invoke;
          v100[3] = &unk_1E53F7038;
          v57 = v60;
          v101 = v57;
          id v20 = v63;
          id v102 = v20;
          id v21 = v17;
          id v103 = v21;
          id v59 = v19;
          id v104 = v59;
          id v58 = v18;
          id v105 = v58;
          v64 = (void (**)(void, void, double))MEMORY[0x18C120660](v100);
          for (unint64_t i = 1; i != 4; ++i)
          {
            v64[2](v64, 0, (double)i);
            v64[2](v64, 1, (double)i);
          }
          v23 = [MEMORY[0x1E4F28CB8] defaultManager];
          v73 = [v23 contentsOfDirectoryAtPath:v20 error:0];

          v71 = [MEMORY[0x1E4F1CA48] array];
          long long v98 = 0u;
          long long v99 = 0u;
          long long v96 = 0u;
          long long v97 = 0u;
          v24 = (GEOSearchAttributionInfo *)v21;
          uint64_t v25 = [(GEOSearchAttributionInfo *)v24 countByEnumeratingWithState:&v96 objects:v115 count:16];
          if (v25)
          {
            uint64_t v26 = *(void *)v97;
            do
            {
              for (uint64_t j = 0; j != v25; ++j)
              {
                if (*(void *)v97 != v26) {
                  objc_enumerationMutation(v24);
                }
                v28 = *(void **)(*((void *)&v96 + 1) + 8 * j);
                v29 = [v28 lastPathComponent];
                if (([v73 containsObject:v29] & 1) == 0) {
                  [v71 addObject:v28];
                }
              }
              uint64_t v25 = [(GEOSearchAttributionInfo *)v24 countByEnumeratingWithState:&v96 objects:v115 count:16];
            }
            while (v25);
          }

          BOOL v30 = [v71 count] == 0;
          v31 = GEOFindOrCreateLog("com.apple.GeoServices", "SearchAttribution");
          v32 = v31;
          if (v30)
          {
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              *(void *)&buf[4] = v66;
              _os_log_impl(&dword_188D96000, v32, OS_LOG_TYPE_DEBUG, "All necessary logos for '%{public}@' are already loaded", buf, 0xCu);
            }

            v53 = [[GEOSearchAttributionInfo alloc] initWithSource:v62 localizedAttribution:v57 logoPaths:v58 snippetLogoPaths:v59];
            if (v70) {
              v70[2](v70, v53, 0);
            }
          }
          else
          {
            if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138543618;
              *(void *)&buf[4] = v66;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v71;
              _os_log_impl(&dword_188D96000, v32, OS_LOG_TYPE_INFO, "Missing some logos for '%{public}@': %{public}@", buf, 0x16u);
            }

            if (a4)
            {
              v94[0] = 0;
              v94[1] = v94;
              v94[2] = 0x2020000000;
              char v95 = 0;
              v33 = GEOFindOrCreateLog("com.apple.GeoServices", "SearchAttribution");
              if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_188D96000, v33, OS_LOG_TYPE_INFO, "Loading missing logos", buf, 2u);
              }

              v68 = [MEMORY[0x1E4F1CA48] array];
              group = dispatch_group_create();
              id v34 = MEMORY[0x1E4F14428];
              long long v90 = 0u;
              long long v91 = 0u;
              long long v92 = 0u;
              long long v93 = 0u;
              obuint64_t j = v71;
              uint64_t v35 = [obj countByEnumeratingWithState:&v90 objects:v114 count:16];
              if (v35)
              {
                uint64_t v67 = *(void *)v91;
                do
                {
                  uint64_t v36 = 0;
                  do
                  {
                    if (*(void *)v91 != v67) {
                      objc_enumerationMutation(obj);
                    }
                    uint64_t v72 = v36;
                    uint64_t v37 = *(void *)(*((void *)&v90 + 1) + 8 * v36);
                    v38 = (void *)MEMORY[0x1E4F1CB10];
                    v39 = [(GEOSearchAttributionInfo *)v24 objectForKeyedSubscript:v37];
                    v40 = [v38 URLWithString:v39];

                    v41 = +[GEOApplicationAuditToken currentProcessAuditToken];
                    v42 = +[GEORequestCounter sharedCounter];
                    v43 = [v42 requestCounterTicketForType:5 auditToken:v41 traits:0];

                    dispatch_group_enter(group);
                    *(void *)buf = 0;
                    *(void *)&buf[8] = buf;
                    *(void *)&buf[16] = 0x3032000000;
                    v111 = __Block_byref_object_copy__106;
                    v112 = __Block_byref_object_dispose__106;
                    id v113 = 0;
                    v82[0] = MEMORY[0x1E4F143A8];
                    v82[1] = 3221225472;
                    v82[2] = __94__GEOSearchAttributionLoader_loadAttributionInfoForIdentifier_allowNetwork_completionHandler___block_invoke_21;
                    v82[3] = &unk_1E53F7088;
                    id v44 = v68;
                    id v83 = v44;
                    v88 = buf;
                    v89 = v94;
                    v84 = group;
                    v87 = v70;
                    id v45 = v40;
                    id v85 = v45;
                    uint64_t v86 = v37;
                    uint64_t v46 = +[GEODataURLSession asynchronousGetURL:v45 kind:5 auditToken:v41 requestCounterTicket:v43 queue:MEMORY[0x1E4F14428] completionHandler:v82];
                    v47 = *(void **)(*(void *)&buf[8] + 40);
                    *(void *)(*(void *)&buf[8] + 40) = v46;

                    [v44 addObject:*(void *)(*(void *)&buf[8] + 40)];
                    _Block_object_dispose(buf, 8);

                    uint64_t v36 = v72 + 1;
                  }
                  while (v35 != v72 + 1);
                  uint64_t v35 = [obj countByEnumeratingWithState:&v90 objects:v114 count:16];
                }
                while (v35);
              }

              block[0] = MEMORY[0x1E4F143A8];
              block[1] = 3221225472;
              block[2] = __94__GEOSearchAttributionLoader_loadAttributionInfoForIdentifier_allowNetwork_completionHandler___block_invoke_24;
              block[3] = &unk_1E53F70B0;
              id v75 = v66;
              v76 = v62;
              v77 = v57;
              id v78 = v58;
              id v79 = v59;
              v81 = v94;
              v80 = v70;
              dispatch_group_notify(group, MEMORY[0x1E4F14428], block);

              _Block_object_dispose(v94, 8);
            }
            else
            {
              v54 = GEOFindOrCreateLog("com.apple.GeoServices", "SearchAttribution");
              if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138543362;
                *(void *)&buf[4] = @"Attribution loader is not allowed to access the network, but cannot continue without it.";
                _os_log_impl(&dword_188D96000, v54, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
              }

              if (v70)
              {
                v55 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-13, @"Attribution loader is not allowed to access the network, but cannot continue without it." reason];
                ((void (**)(id, GEOSearchAttributionInfo *, void *))v70)[2](v70, 0, v55);
              }
            }
          }
        }
        else
        {
          v56 = GEOFindOrCreateLog("com.apple.GeoServices", "SearchAttribution");
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_188D96000, v56, OS_LOG_TYPE_DEBUG, "Attribution source has no logos. Calling back immediately.", buf, 2u);
          }

          v24 = [[GEOSearchAttributionInfo alloc] initWithSource:v62 localizedAttribution:v60 logoPaths:0 snippetLogoPaths:0];
          if (v70) {
            ((void (*)(void))v70[2])();
          }
        }
      }
      else
      {
        v24 = [NSString stringWithFormat:@"No matching localized attribution found for source: %@", v62];
        v51 = GEOFindOrCreateLog("com.apple.GeoServices", "SearchAttribution");
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)&buf[4] = v24;
          _os_log_impl(&dword_188D96000, v51, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
        }

        if (v70)
        {
          v52 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-8 reason:v24];
          ((void (**)(id, GEOSearchAttributionInfo *, void *))v70)[2](v70, 0, v52);
        }
      }
    }
    else
    {
LABEL_12:

LABEL_42:
      v62 = [NSString stringWithFormat:@"No matching attribution source found for %@", v66];
      v48 = GEOFindOrCreateLog("com.apple.GeoServices", "SearchAttribution");
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v62;
        _os_log_impl(&dword_188D96000, v48, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
      }

      if (v70)
      {
        v61 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-8 reason:v62];
        ((void (**)(id, GEOSearchAttributionInfo *, void *))v70)[2](v70, 0, v61);
      }
    }
    v50 = v62;
  }
  else
  {
    v49 = GEOFindOrCreateLog("com.apple.GeoServices", "SearchAttribution");
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = @"Attribution logos container is missing.";
      _os_log_impl(&dword_188D96000, v49, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
    }

    v50 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-8 reason:@"Attribution logos container is missing."];
    if (v70) {
      ((void (*)(void))v70[2])();
    }
  }
}

void __94__GEOSearchAttributionLoader_loadAttributionInfoForIdentifier_allowNetwork_completionHandler___block_invoke(uint64_t a1, int a2, double a3)
{
  v6 = *(id **)(a1 + 32);
  if (a2) {
    -[GEOLocalizedAttribution snippetLogoURLs](v6);
  }
  else {
  v7 = -[GEOLocalizedAttribution logoURLs](v6);
  }
  id v11 = [v6 bestURLForLogos:v7 scale:a3];

  v8 = [v11 lastPathComponent];
  v9 = [*(id *)(a1 + 40) stringByAppendingPathComponent:v8];
  if ([v11 length])
  {
    [*(id *)(a1 + 48) setObject:v11 forKey:v9];
    uint64_t v10 = 64;
    if (a2) {
      uint64_t v10 = 56;
    }
    [*(id *)(a1 + v10) addObject:v9];
  }
}

- (GEOSearchAttributionLoader)initWithAttributionManifest:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOSearchAttributionLoader;
  v6 = [(GEOSearchAttributionLoader *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_attributionManifest, a3);
    v8 = v7;
  }

  return v7;
}

void __94__GEOSearchAttributionLoader_loadAttributionInfoForIdentifier_allowNetwork_completionHandler___block_invoke_21(uint64_t a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [*(id *)(a1 + 32) removeObject:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
  uint64_t v4 = *(void *)(a1 + 80);
  if (!*(unsigned char *)(*(void *)(v4 + 8) + 24))
  {
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __94__GEOSearchAttributionLoader_loadAttributionInfoForIdentifier_allowNetwork_completionHandler___block_invoke_2;
    v30[3] = &unk_1E53F7060;
    uint64_t v33 = v4;
    id v32 = *(id *)(a1 + 64);
    id v31 = *(id *)(a1 + 40);
    id v5 = (void (**)(void, void))MEMORY[0x18C120660](v30);
    v6 = [v3 error];

    if (v6)
    {
      v7 = GEOFindOrCreateLog("com.apple.GeoServices", "SearchAttribution");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = *(void **)(a1 + 48);
        v9 = [v3 error];
        *(_DWORD *)buf = 138543618;
        id v35 = v8;
        __int16 v36 = 2114;
        id v37 = v9;
        _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_ERROR, "Failed to load attribution logo from '%{public}@': %{public}@", buf, 0x16u);
      }
      uint64_t v10 = [v3 error];
    }
    else
    {
      uint64_t v12 = [v3 receivedData];
      uint64_t v13 = [v12 length];

      v14 = GEOFindOrCreateLog("com.apple.GeoServices", "SearchAttribution");
      char v15 = v14;
      if (v13)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v16 = *(void **)(a1 + 48);
          *(_DWORD *)buf = 138543362;
          id v35 = v16;
          _os_log_impl(&dword_188D96000, v15, OS_LOG_TYPE_DEBUG, "Loaded attribution logo from '%{public}@'. Writing to disk.", buf, 0xCu);
        }

        id v11 = [*(id *)(a1 + 56) stringByDeletingLastPathComponent];
        v17 = [MEMORY[0x1E4F28CB8] defaultManager];
        id v29 = 0;
        char v18 = [v17 createDirectoryAtPath:v11 withIntermediateDirectories:1 attributes:0 error:&v29];
        id v19 = v29;
        if ((v18 & 1) == 0)
        {
          id v20 = GEOFindOrCreateLog("com.apple.GeoServices", "SearchAttribution");
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            id v35 = v19;
            _os_log_impl(&dword_188D96000, v20, OS_LOG_TYPE_ERROR, "Unable to create parent directory: %{public}@", buf, 0xCu);
          }
        }
        id v21 = [v3 receivedData];
        uint64_t v22 = *(void *)(a1 + 56);
        id v28 = v19;
        char v23 = [v21 writeToFile:v22 options:268435457 error:&v28];
        id v24 = v28;

        if (v23)
        {
          dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
        }
        else
        {
          uint64_t v26 = GEOFindOrCreateLog("com.apple.GeoServices", "SearchAttribution");
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            v27 = *(void **)(a1 + 56);
            *(_DWORD *)buf = 138543618;
            id v35 = v27;
            __int16 v36 = 2114;
            id v37 = v24;
            _os_log_impl(&dword_188D96000, v26, OS_LOG_TYPE_ERROR, "Failed to write attribution logo %{public}@' to disk: %{public}@", buf, 0x16u);
          }

          ((void (**)(void, id))v5)[2](v5, v24);
        }

        goto LABEL_24;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v25 = *(void **)(a1 + 56);
        *(_DWORD *)buf = 138543362;
        id v35 = v25;
        _os_log_impl(&dword_188D96000, v15, OS_LOG_TYPE_ERROR, "Didn't receive any data for '%{public}@'", buf, 0xCu);
      }

      uint64_t v10 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-11 reason:0];
    }
    id v11 = (void *)v10;
    v5[2](v5, v10);
LABEL_24:

    goto LABEL_25;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
LABEL_25:
}

void __94__GEOSearchAttributionLoader_loadAttributionInfoForIdentifier_allowNetwork_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  if (!*(unsigned char *)(v3 + 24))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    if (v4)
    {
      (*(void (**)(uint64_t, void, id))(v4 + 16))(v4, 0, v5);
      uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
    }
  }
  *(unsigned char *)(v3 + 24) = 1;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __94__GEOSearchAttributionLoader_loadAttributionInfoForIdentifier_allowNetwork_completionHandler___block_invoke_24(void *a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = GEOFindOrCreateLog("com.apple.GeoServices", "SearchAttribution");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = a1[4];
    int v7 = 138543362;
    uint64_t v8 = v3;
    _os_log_impl(&dword_188D96000, v2, OS_LOG_TYPE_DEBUG, "Finished loading attribution logos for '%{public}@'", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v4 = [[GEOSearchAttributionInfo alloc] initWithSource:a1[5] localizedAttribution:a1[6] logoPaths:a1[7] snippetLogoPaths:a1[8]];
  uint64_t v5 = *(void *)(a1[10] + 8);
  if (!*(unsigned char *)(v5 + 24))
  {
    uint64_t v6 = a1[9];
    if (v6)
    {
      (*(void (**)(uint64_t, GEOSearchAttributionInfo *, void))(v6 + 16))(v6, v4, 0);
      uint64_t v5 = *(void *)(a1[10] + 8);
    }
  }
  *(unsigned char *)(v5 + 24) = 1;
}

@end