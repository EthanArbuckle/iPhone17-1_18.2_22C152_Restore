@interface GEODataRequestThrottler
+ (GEODataRequestThrottler)sharedThrottler;
- (BOOL)allowRequest:(id)a3 forClient:(id)a4 throttlerToken:(id *)a5 error:(id *)a6;
- (GEODataRequestThrottler)init;
- (NSString)description;
- (id)_init;
- (id)throttlerForKeyPath:(id)a3;
- (void)_pruneThrottlers;
- (void)_reset;
- (void)_updateSavedState:(id)a3;
- (void)_withThrottlersForKey:(GEOThrottleKey)a3 auditToken:(id)a4 do:(id)a5;
- (void)dealloc;
- (void)getInfoForRequest:(id)a3 client:(id)a4 timeUntilNextReset:(double *)a5 availableRequestCount:(unsigned int *)a6;
- (void)pruneThrottlers;
- (void)reset;
@end

@implementation GEODataRequestThrottler

- (void)_reset
{
  if (GEOConfigGetBOOL(GeoServicesConfig_ThrottlerLogAsFault, (uint64_t)off_1E91140D8)) {
    unsigned __int8 v3 = 17;
  }
  else {
    unsigned __int8 v3 = 16;
  }
  self->_throttleEventLogLevel = v3;
  self->_throttlePoliciesCached = 0;
  [(GEODataRequestThrottler *)self _pruneThrottlers];
  throttlers = self->_throttlers;

  [(NSMutableDictionary *)throttlers removeAllObjects];
}

void __71__GEODataRequestThrottler_allowRequest_forClient_throttlerToken_error___block_invoke(uint64_t a1)
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1 + 56;
  long long v3 = *(_OWORD *)(a1 + 56);
  uint64_t v4 = *(unsigned int *)(a1 + 88);
  v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(v2 - 16);
  v78[0] = MEMORY[0x1E4F143A8];
  v78[1] = 3221225472;
  v78[2] = __71__GEODataRequestThrottler_allowRequest_forClient_throttlerToken_error___block_invoke_2;
  v78[3] = &unk_1E53E4438;
  long long v79 = v3;
  char v81 = *(unsigned char *)(v2 + 44);
  uint64_t v80 = *(void *)(v2 + 16);
  [v5 _withThrottlersForKey:v4 auditToken:v6 do:v78];
  if (*(unsigned char *)(*(void *)(*(void *)v2 + 8) + 24))
  {
    LODWORD(v77) = *(_DWORD *)(a1 + 88);
    objc_msgSend(*(id *)(a1 + 32), "_withThrottlersForKey:auditToken:do:", MEMORY[0x1E4F143A8], 3221225472, __71__GEODataRequestThrottler_allowRequest_forClient_throttlerToken_error___block_invoke_155, &unk_1E53E4460, *(void *)(a1 + 32), *(void *)v2, *(void *)(a1 + 92), v77);
  }
  else
  {
    if ([*(id *)(a1 + 48) isEqualToString:@"<unknown>"])
    {
      v7 = GEOGetGEODataRequestThrottlerLog();
      os_log_type_t v8 = *(unsigned char *)(*(void *)(a1 + 32) + 72);
      if (os_log_type_enabled(v7, v8))
      {
        v9 = GEODataRequestKindAsString(*(void *)(a1 + 92));
        int v10 = *(_DWORD *)(a1 + 88);
        uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
        *(_DWORD *)buf = 138412802;
        v85 = v9;
        __int16 v86 = 1024;
        int v87 = v10;
        __int16 v88 = 2112;
        uint64_t v89 = v11;
        _os_log_impl(&dword_188D96000, v7, v8, "Throttled {unknown>?? request %@ for key %#x: %@", buf, 0x1Cu);
      }
    }
    else if ([*(id *)(a1 + 48) isEqualToString:@"com.apple.Maps"])
    {
      v7 = GEOGetGEODataRequestThrottlerLog();
      os_log_type_t v12 = *(unsigned char *)(*(void *)(a1 + 32) + 72);
      if (os_log_type_enabled(v7, v12))
      {
        v13 = GEODataRequestKindAsString(*(void *)(a1 + 92));
        int v14 = *(_DWORD *)(a1 + 88);
        uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
        *(_DWORD *)buf = 138412802;
        v85 = v13;
        __int16 v86 = 1024;
        int v87 = v14;
        __int16 v88 = 2112;
        uint64_t v89 = v15;
        _os_log_impl(&dword_188D96000, v7, v12, "Throttled com.apple.Maps request %@ for key %#x: %@", buf, 0x1Cu);
      }
    }
    else if ([*(id *)(a1 + 48) isEqualToString:@"com.apple.navd"])
    {
      v7 = GEOGetGEODataRequestThrottlerLog();
      os_log_type_t v16 = *(unsigned char *)(*(void *)(a1 + 32) + 72);
      if (os_log_type_enabled(v7, v16))
      {
        v17 = GEODataRequestKindAsString(*(void *)(a1 + 92));
        int v18 = *(_DWORD *)(a1 + 88);
        uint64_t v19 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
        *(_DWORD *)buf = 138412802;
        v85 = v17;
        __int16 v86 = 1024;
        int v87 = v18;
        __int16 v88 = 2112;
        uint64_t v89 = v19;
        _os_log_impl(&dword_188D96000, v7, v16, "Throttled com.apple.navd request %@ for key %#x: %@", buf, 0x1Cu);
      }
    }
    else if ([*(id *)(a1 + 48) isEqualToString:@"com.apple.destinationd"])
    {
      v7 = GEOGetGEODataRequestThrottlerLog();
      os_log_type_t v20 = *(unsigned char *)(*(void *)(a1 + 32) + 72);
      if (os_log_type_enabled(v7, v20))
      {
        v21 = GEODataRequestKindAsString(*(void *)(a1 + 92));
        int v22 = *(_DWORD *)(a1 + 88);
        uint64_t v23 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
        *(_DWORD *)buf = 138412802;
        v85 = v21;
        __int16 v86 = 1024;
        int v87 = v22;
        __int16 v88 = 2112;
        uint64_t v89 = v23;
        _os_log_impl(&dword_188D96000, v7, v20, "Throttled com.apple.destinationd request %@ for key %#x: %@", buf, 0x1Cu);
      }
    }
    else if ([*(id *)(a1 + 48) isEqualToString:@"com.apple.photoanalysisd"])
    {
      v7 = GEOGetGEODataRequestThrottlerLog();
      os_log_type_t v24 = *(unsigned char *)(*(void *)(a1 + 32) + 72);
      if (os_log_type_enabled(v7, v24))
      {
        v25 = GEODataRequestKindAsString(*(void *)(a1 + 92));
        int v26 = *(_DWORD *)(a1 + 88);
        uint64_t v27 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
        *(_DWORD *)buf = 138412802;
        v85 = v25;
        __int16 v86 = 1024;
        int v87 = v26;
        __int16 v88 = 2112;
        uint64_t v89 = v27;
        _os_log_impl(&dword_188D96000, v7, v24, "Throttled com.apple.photoanalysisd request %@ for key %#x: %@", buf, 0x1Cu);
      }
    }
    else if ([*(id *)(a1 + 48) isEqualToString:@"com.apple.reminders"])
    {
      v7 = GEOGetGEODataRequestThrottlerLog();
      os_log_type_t v28 = *(unsigned char *)(*(void *)(a1 + 32) + 72);
      if (os_log_type_enabled(v7, v28))
      {
        v29 = GEODataRequestKindAsString(*(void *)(a1 + 92));
        int v30 = *(_DWORD *)(a1 + 88);
        uint64_t v31 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
        *(_DWORD *)buf = 138412802;
        v85 = v29;
        __int16 v86 = 1024;
        int v87 = v30;
        __int16 v88 = 2112;
        uint64_t v89 = v31;
        _os_log_impl(&dword_188D96000, v7, v28, "Throttled com.apple.reminders request %@ for key %#x: %@", buf, 0x1Cu);
      }
    }
    else if ([*(id *)(a1 + 48) isEqualToString:@"com.apple.mobilecal"])
    {
      v7 = GEOGetGEODataRequestThrottlerLog();
      os_log_type_t v32 = *(unsigned char *)(*(void *)(a1 + 32) + 72);
      if (os_log_type_enabled(v7, v32))
      {
        v33 = GEODataRequestKindAsString(*(void *)(a1 + 92));
        int v34 = *(_DWORD *)(a1 + 88);
        uint64_t v35 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
        *(_DWORD *)buf = 138412802;
        v85 = v33;
        __int16 v86 = 1024;
        int v87 = v34;
        __int16 v88 = 2112;
        uint64_t v89 = v35;
        _os_log_impl(&dword_188D96000, v7, v32, "Throttled com.apple.mobilecal request %@ for key %#x: %@", buf, 0x1Cu);
      }
    }
    else if ([*(id *)(a1 + 48) isEqualToString:@"com.apple.findmy"])
    {
      v7 = GEOGetGEODataRequestThrottlerLog();
      os_log_type_t v36 = *(unsigned char *)(*(void *)(a1 + 32) + 72);
      if (os_log_type_enabled(v7, v36))
      {
        v37 = GEODataRequestKindAsString(*(void *)(a1 + 92));
        int v38 = *(_DWORD *)(a1 + 88);
        uint64_t v39 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
        *(_DWORD *)buf = 138412802;
        v85 = v37;
        __int16 v86 = 1024;
        int v87 = v38;
        __int16 v88 = 2112;
        uint64_t v89 = v39;
        _os_log_impl(&dword_188D96000, v7, v36, "Throttled com.apple.findmy request %@ for key %#x: %@", buf, 0x1Cu);
      }
    }
    else if ([*(id *)(a1 + 48) isEqualToString:@"com.apple.CoreRoutine.helperservice"])
    {
      v7 = GEOGetGEODataRequestThrottlerLog();
      os_log_type_t v40 = *(unsigned char *)(*(void *)(a1 + 32) + 72);
      if (os_log_type_enabled(v7, v40))
      {
        v41 = GEODataRequestKindAsString(*(void *)(a1 + 92));
        int v42 = *(_DWORD *)(a1 + 88);
        uint64_t v43 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
        *(_DWORD *)buf = 138412802;
        v85 = v41;
        __int16 v86 = 1024;
        int v87 = v42;
        __int16 v88 = 2112;
        uint64_t v89 = v43;
        _os_log_impl(&dword_188D96000, v7, v40, "Throttled com.apple.CoreRoutine.helperservice request %@ for key %#x: %@", buf, 0x1Cu);
      }
    }
    else if ([*(id *)(a1 + 48) isEqualToString:@"com.apple.wifid"])
    {
      v7 = GEOGetGEODataRequestThrottlerLog();
      os_log_type_t v44 = *(unsigned char *)(*(void *)(a1 + 32) + 72);
      if (os_log_type_enabled(v7, v44))
      {
        v45 = GEODataRequestKindAsString(*(void *)(a1 + 92));
        int v46 = *(_DWORD *)(a1 + 88);
        uint64_t v47 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
        *(_DWORD *)buf = 138412802;
        v85 = v45;
        __int16 v86 = 1024;
        int v87 = v46;
        __int16 v88 = 2112;
        uint64_t v89 = v47;
        _os_log_impl(&dword_188D96000, v7, v44, "Throttled com.apple.wifid request %@ for key %#x: %@", buf, 0x1Cu);
      }
    }
    else if ([*(id *)(a1 + 48) isEqualToString:@"com.apple.MobileSMS"])
    {
      v7 = GEOGetGEODataRequestThrottlerLog();
      os_log_type_t v48 = *(unsigned char *)(*(void *)(a1 + 32) + 72);
      if (os_log_type_enabled(v7, v48))
      {
        v49 = GEODataRequestKindAsString(*(void *)(a1 + 92));
        int v50 = *(_DWORD *)(a1 + 88);
        uint64_t v51 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
        *(_DWORD *)buf = 138412802;
        v85 = v49;
        __int16 v86 = 1024;
        int v87 = v50;
        __int16 v88 = 2112;
        uint64_t v89 = v51;
        _os_log_impl(&dword_188D96000, v7, v48, "Throttled com.apple.MobileSMS request %@ for key %#x: %@", buf, 0x1Cu);
      }
    }
    else if ([*(id *)(a1 + 48) isEqualToString:@"com.apple.corecontextd"])
    {
      v7 = GEOGetGEODataRequestThrottlerLog();
      os_log_type_t v52 = *(unsigned char *)(*(void *)(a1 + 32) + 72);
      if (os_log_type_enabled(v7, v52))
      {
        v53 = GEODataRequestKindAsString(*(void *)(a1 + 92));
        int v54 = *(_DWORD *)(a1 + 88);
        uint64_t v55 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
        *(_DWORD *)buf = 138412802;
        v85 = v53;
        __int16 v86 = 1024;
        int v87 = v54;
        __int16 v88 = 2112;
        uint64_t v89 = v55;
        _os_log_impl(&dword_188D96000, v7, v52, "Throttled com.apple.corecontextd request %@ for key %#x: %@", buf, 0x1Cu);
      }
    }
    else if ([*(id *)(a1 + 48) isEqualToString:@"com.apple.geotool"])
    {
      v7 = GEOGetGEODataRequestThrottlerLog();
      os_log_type_t v56 = *(unsigned char *)(*(void *)(a1 + 32) + 72);
      if (os_log_type_enabled(v7, v56))
      {
        v57 = GEODataRequestKindAsString(*(void *)(a1 + 92));
        int v58 = *(_DWORD *)(a1 + 88);
        uint64_t v59 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
        *(_DWORD *)buf = 138412802;
        v85 = v57;
        __int16 v86 = 1024;
        int v87 = v58;
        __int16 v88 = 2112;
        uint64_t v89 = v59;
        _os_log_impl(&dword_188D96000, v7, v56, "Throttled com.apple.geotool request %@ for key %#x: %@", buf, 0x1Cu);
      }
    }
    else if (([*(id *)(a1 + 48) hasPrefix:@"com.apple."] & 1) != 0 {
           || ([*(id *)(a1 + 48) containsString:@"."] & 1) == 0)
    }
    {
      v7 = GEOGetGEODataRequestThrottlerLog();
      os_log_type_t v64 = *(unsigned char *)(*(void *)(a1 + 32) + 72);
      if (os_log_type_enabled(v7, v64))
      {
        v65 = GEODataRequestKindAsString(*(void *)(a1 + 92));
        int v66 = *(_DWORD *)(a1 + 88);
        uint64_t v67 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
        *(_DWORD *)buf = 138412802;
        v85 = v65;
        __int16 v86 = 1024;
        int v87 = v66;
        __int16 v88 = 2112;
        uint64_t v89 = v67;
        _os_log_impl(&dword_188D96000, v7, v64, "Throttled Internal request %@ for key %#x: %@", buf, 0x1Cu);
      }
    }
    else
    {
      v7 = GEOGetGEODataRequestThrottlerLog();
      os_log_type_t v60 = *(unsigned char *)(*(void *)(a1 + 32) + 72);
      if (os_log_type_enabled(v7, v60))
      {
        v61 = GEODataRequestKindAsString(*(void *)(a1 + 92));
        int v62 = *(_DWORD *)(a1 + 88);
        uint64_t v63 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
        *(_DWORD *)buf = 138412802;
        v85 = v61;
        __int16 v86 = 1024;
        int v87 = v62;
        __int16 v88 = 2112;
        uint64_t v89 = v63;
        _os_log_impl(&dword_188D96000, v7, v60, "Throttled External request %@ for key %#x: %@", buf, 0x1Cu);
      }
    }

    if (*(unsigned char *)(a1 + 100))
    {
      v68 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v69 = *(void *)(a1 + 64);
      v83[0] = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
      v82[0] = @"details";
      v82[1] = @"timeUntilReset";
      v70 = [NSNumber numberWithDouble:*(double *)(*(void *)(v69 + 8) + 24)];
      v83[1] = v70;
      v82[2] = @"requestKind";
      v71 = [NSNumber numberWithInt:(*(_DWORD *)(a1 + 96) | *(_DWORD *)(a1 + 92))];
      v83[2] = v71;
      v82[3] = @"requestKindString";
      v72 = GEODataRequestKindAsString(*(void *)(a1 + 92));
      v83[3] = v72;
      v73 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v83 forKeys:v82 count:4];
      uint64_t v74 = [v68 GEOErrorWithCode:-3 userInfo:v73];
      uint64_t v75 = *(void *)(*(void *)(a1 + 80) + 8);
      v76 = *(void **)(v75 + 40);
      *(void *)(v75 + 40) = v74;
    }
  }
}

- (void)_withThrottlersForKey:(GEOThrottleKey)a3 auditToken:(id)a4 do:(id)a5
{
  uint64_t v6 = *(void *)&a3.var0;
  id v8 = a4;
  v9 = (void (**)(id, void *, void *))a5;
  geo_assert_isolated();
  unint64_t v10 = 0;
  uint64_t v18 = v6;
  do
  {
    id v19 = v8;
    uint64_t v11 = @"all";
    if (v10 <= 1)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"%#x", v18);
      uint64_t v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    os_log_type_t v12 = @"long";
    if ((v10 & 0x7FFFFFFFFFFFFFFDLL) == 0) {
      os_log_type_t v12 = @"short";
    }
    v13 = v12;
    int v14 = [v19 bundleId];
    if ([v14 length])
    {
      uint64_t v15 = [v19 bundleId];
    }
    else
    {
      uint64_t v15 = @"<unknown>";
    }

    os_log_type_t v16 = [NSString stringWithFormat:@"%@%@/%@/%@", @"app:", v15, v11, v13];

    v17 = [(GEODataRequestThrottler *)self throttlerForKeyPath:v16];
    if (v17) {
      v9[2](v9, v17, v16);
    }

    ++v10;
  }
  while (v10 != 4);
}

- (id)throttlerForKeyPath:(id)a3
{
  v69[2] = *MEMORY[0x1E4F143B8];
  id v47 = a3;
  uint64_t v4 = -[NSMutableDictionary objectForKeyedSubscript:](self->_throttlers, "objectForKeyedSubscript:");
  if (!v4)
  {
    uint64_t v43 = self;
    if (!self->_throttlePoliciesCached)
    {
      v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v6 = [v5 URLForResource:@"ThrottlerDefaults" withExtension:@"plist"];

      if (v6)
      {
        id v49 = 0;
        uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v6 error:&v49];
        id v8 = v49;
        defaultThrottlePolicy = self->_defaultThrottlePolicy;
        p_defaultThrottlePolicy = &self->_defaultThrottlePolicy;
        *p_defaultThrottlePolicy = (NSDictionary *)v7;

        if (!*p_defaultThrottlePolicy)
        {
          uint64_t v11 = GEOGetGEODataRequestThrottlerLog();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v67 = v8;
            _os_log_impl(&dword_188D96000, v11, OS_LOG_TYPE_FAULT, "Unable to load throttler default values resource: %@", buf, 0xCu);
          }
        }
      }
      else
      {
        id v8 = GEOGetGEODataRequestThrottlerLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_FAULT, "Unable to locate throttler default values resource", buf, 2u);
        }
      }

      if (GEOConfigGetBOOL(GeoServicesConfig_ThrottlePolicyIgnoreConfig, (uint64_t)off_1E91140A8))
      {
        globalThrottlePolicy = v43->_globalThrottlePolicy;
        v43->_globalThrottlePolicy = 0;
      }
      else
      {
        uint64_t v13 = _getValue(GeoServicesConfig_ThrottlePolicy, (uint64_t)off_1E91140B8, 1, 0, 0, 0);
        globalThrottlePolicy = v43->_globalThrottlePolicy;
        v43->_globalThrottlePolicy = (NSDictionary *)v13;
      }

      v43->_throttlePoliciesCached = 1;
      self = v43;
    }
    int v14 = self->_defaultThrottlePolicy;
    uint64_t v15 = self->_globalThrottlePolicy;
    id v16 = v47;
    os_log_type_t v48 = v14;
    v17 = v15;
    v45 = v16;
    uint64_t v18 = [v16 componentsSeparatedByString:@"/"];
    os_log_type_t v40 = v18;
    if ([v18 count] == 3)
    {
      double v62 = 0.0;
      unint64_t v63 = 0;
      os_log_type_t v44 = [v18 objectAtIndexedSubscript:0];
      int v42 = [v18 objectAtIndexedSubscript:1];
      id v19 = [v18 objectAtIndexedSubscript:2];
      if ([v42 isEqualToString:@"all"])
      {
        v69[0] = @"all";
        [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:1];
      }
      else
      {
        v69[0] = v42;
        v69[1] = @"any";
        [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:2];
      uint64_t v39 = };
      v68[0] = v44;
      v68[1] = @"global";
      os_log_type_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:2];
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      obuint64_t j = v39;
      v41 = v20;
      uint64_t v21 = [obj countByEnumeratingWithState:&v58 objects:buf count:16];
      if (v21)
      {
        uint64_t v22 = *(void *)v59;
        uint64_t v38 = *(void *)v59;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v59 != v22) {
              objc_enumerationMutation(obj);
            }
            os_log_type_t v24 = *(NSString **)(*((void *)&v58 + 1) + 8 * i);
            long long v54 = 0u;
            long long v55 = 0u;
            long long v56 = 0u;
            long long v57 = 0u;
            id v25 = v20;
            uint64_t v26 = [v25 countByEnumeratingWithState:&v54 objects:v65 count:16];
            if (v26)
            {
              uint64_t v27 = *(void *)v55;
              while (2)
              {
                for (uint64_t j = 0; j != v26; ++j)
                {
                  if (*(void *)v55 != v27) {
                    objc_enumerationMutation(v25);
                  }
                  v29 = *(NSString **)(*((void *)&v54 + 1) + 8 * j);
                  if (v17
                    && parseThrottlePolicy(v17, *(NSString **)(*((void *)&v54 + 1) + 8 * j), v24, v19, &v63, &v62)|| parseThrottlePolicy(v48, v29, v24, v19, &v63, &v62))
                  {
                    uint64_t v35 = [v45 stringByAppendingFormat:@"(%@/%@)", v29, v24];
                    uint64_t v4 = createThrottler((NSString *)v45, v35, v63, v62);

                    id v30 = obj;
LABEL_46:

                    goto LABEL_47;
                  }
                }
                uint64_t v26 = [v25 countByEnumeratingWithState:&v54 objects:v65 count:16];
                uint64_t v22 = v38;
                if (v26) {
                  continue;
                }
                break;
              }
            }

            os_log_type_t v20 = v41;
          }
          uint64_t v21 = [obj countByEnumeratingWithState:&v58 objects:buf count:16];
        }
        while (v21);
      }

      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      id v30 = obj;
      uint64_t v31 = [v30 countByEnumeratingWithState:&v50 objects:v64 count:16];
      if (v31)
      {
        uint64_t v32 = *(void *)v51;
        while (2)
        {
          for (uint64_t k = 0; k != v31; ++k)
          {
            if (*(void *)v51 != v32) {
              objc_enumerationMutation(v30);
            }
            int v34 = *(NSString **)(*((void *)&v50 + 1) + 8 * k);
            if (parseThrottlePolicy(v48, &cfstr_Default.isa, v34, v19, &v63, &v62))
            {
              id v25 = [v45 stringByAppendingFormat:@"(%@/%@)", @"default", v34];
              uint64_t v4 = createThrottler((NSString *)v45, (NSString *)v25, v63, v62);
              goto LABEL_46;
            }
          }
          uint64_t v31 = [v30 countByEnumeratingWithState:&v50 objects:v64 count:16];
          if (v31) {
            continue;
          }
          break;
        }
      }

      id v30 = [v45 stringByAppendingString:@"(fallback)"];
      uint64_t v4 = createThrottler((NSString *)v45, (NSString *)v30, 5, 60.0);
LABEL_47:
    }
    else
    {
      uint64_t v4 = 0;
    }

    if (v4) {
      [(NSMutableDictionary *)v43->_throttlers setObject:v4 forKeyedSubscript:v45];
    }
  }
  id v36 = v4;

  return v36;
}

void __71__GEODataRequestThrottler_allowRequest_forClient_throttlerToken_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v12 = a2;
  if (![v12 remainingEntries])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    [v12 timeUntilReset];
    double v4 = v3;
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    double v6 = *(double *)(v5 + 24);
    if (v4 > v6)
    {
      [v12 timeUntilReset];
      uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    }
    *(double *)(v5 + 24) = v6;
    if (*(unsigned char *)(a1 + 56))
    {
      uint64_t v7 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      if (!v7)
      {
        uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
        uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
        unint64_t v10 = *(void **)(v9 + 40);
        *(void *)(v9 + 40) = v8;

        uint64_t v7 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      }
      uint64_t v11 = [v12 userInfoForError];
      [v7 addObject:v11];
    }
  }
}

void __71__GEODataRequestThrottler_allowRequest_forClient_throttlerToken_error___block_invoke_155(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v5 addRequestTimestamp];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    uint64_t v7 = GEOGetGEODataRequestThrottlerLog();
    os_log_type_t v8 = *(unsigned char *)(*(void *)(a1 + 32) + 72);
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = GEODataRequestKindAsString(*(void *)(a1 + 48));
      int v10 = *(_DWORD *)(a1 + 56);
      int v11 = 138412802;
      id v12 = v9;
      __int16 v13 = 1024;
      int v14 = v10;
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl(&dword_188D96000, v7, v8, "!!Unexpected!! Throttled request %@ for key %#x / \"%@\"", (uint8_t *)&v11, 0x1Cu);
    }
  }
}

- (void)_pruneThrottlers
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  double v3 = [MEMORY[0x1E4F1CA48] array];
  [(NSMutableDictionary *)self->_throttlers allKeys];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        uint64_t v9 = -[NSMutableDictionary objectForKeyedSubscript:](self->_throttlers, "objectForKeyedSubscript:", v8, (void)v11);
        [v9 timeUntilReset];
        if (v10 <= 0.0 && [v9 isExpired])
        {
          [v3 addObject:v8];
          [(NSMutableDictionary *)self->_throttlers removeObjectForKey:v8];
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  [(GEODataRequestThrottler *)self _updateSavedState:v3];
}

void __45__GEODataRequestThrottler__updateSavedState___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  uint64_t v5 = [a3 captureState];
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = [v8 stringByReplacingOccurrencesOfString:@"/" withString:@"_"];
  [v6 setObject:v5 forKeyedSubscript:v7];
}

- (void)_updateSavedState:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v25 = self;
  id v26 = a3;
  geo_assert_isolated();
  GEOGetMonotonicTime();
  double v4 = v3;
  uint64_t v27 = readSavedState();
  uint64_t v5 = (void *)[v27 mutableCopy];
  [v5 setObject:0 forKeyedSubscript:@"savedAtTime"];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  obuint64_t j = v26;
  uint64_t v6 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v37 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(id *)(*((void *)&v36 + 1) + 8 * i);
        double v10 = [v9 stringByReplacingOccurrencesOfString:@"/" withString:@"_"];

        [v5 removeObjectForKey:v10];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v6);
  }

  [v5 allKeys];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v28 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v28 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v33;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v33 != v12) {
          objc_enumerationMutation(v28);
        }
        uint64_t v14 = *(void *)(*((void *)&v32 + 1) + 8 * j);
        objc_msgSend(v5, "objectForKeyedSubscript:", v14, v25);
        id v15 = (id)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_18;
        }
        uint64_t v16 = [v15 objectForKeyedSubscript:@"type"];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || (int v17 = [v16 intValue], v17 != 16) && v17 != 32)
        {

LABEL_18:
          goto LABEL_21;
        }
        int v18 = [(id)objc_opt_class() stateIsExpired:v15];

        if (v18) {
          [v5 removeObjectForKey:v14];
        }
LABEL_21:
      }
      uint64_t v11 = [v28 countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v11);
  }

  throttlers = v25->_throttlers;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __45__GEODataRequestThrottler__updateSavedState___block_invoke;
  v30[3] = &unk_1E53E4500;
  id v20 = v5;
  id v31 = v20;
  [(NSMutableDictionary *)throttlers enumerateKeysAndObjectsUsingBlock:v30];
  if ([v20 count])
  {
    uint64_t v21 = [v27 objectForKeyedSubscript:@"savedAtTime"];
    [v20 setObject:v21 forKeyedSubscript:@"savedAtTime"];

    if ([v20 isEqual:v27])
    {
      uint64_t v22 = [v27 objectForKeyedSubscript:@"savedAtTime"];
      if (!v22
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
        || ([v22 doubleValue], v23 + 300.0 >= v4))
      {

        goto LABEL_32;
      }
    }
    os_log_type_t v24 = objc_msgSend(NSNumber, "numberWithDouble:", v4, v25);
    [v20 setObject:v24 forKeyedSubscript:@"savedAtTime"];

    _setValue(GeoServicesConfig_ThrottlerState, (uint64_t)off_1E91139B8, v20, 1, 0);
  }
  else
  {
    _setValue(GeoServicesConfig_ThrottlerState, (uint64_t)off_1E91139B8, 0, 0, 0);
  }
LABEL_32:
}

uint64_t __42__GEODataRequestThrottler_pruneThrottlers__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pruneThrottlers];
}

- (BOOL)allowRequest:(id)a3 forClient:(id)a4 throttlerToken:(id *)a5 error:(id *)a6
{
  id v9 = a4;
  if (qword_1EB29FC18 != -1) {
    dispatch_once(&qword_1EB29FC18, &__block_literal_global_93);
  }
  id v10 = (id)qword_1EB29FC10;
  uint64_t v11 = [v9 bundleId];
  int v12 = [v10 containsObject:v11];

  if (v12)
  {
    if (a5) {
      *a5 = [[GEODataRequestThrottlerToken alloc] initWithRequest:a3 forClient:v9];
    }
    LOBYTE(a6) = 1;
    goto LABEL_31;
  }
  unint64_t v13 = HIDWORD(*(unint64_t *)&a3);
  if (checkEntitlements(a3.var0, v9))
  {
    uint64_t v14 = [v9 bundleId];
    if ([v14 length])
    {
      id v15 = [v9 bundleId];
    }
    else
    {
      id v15 = @"<unknown>";
    }

    if (!a3.var0)
    {
      if (a6)
      {
        uint64_t v21 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v22 = NSString;
        double v23 = GEODataRequestKindAsString(*(void *)&a3);
        os_log_type_t v24 = [v22 stringWithFormat:@"Unknown request type: %#x \"%@\"", v13 | *(void *)&a3, v23];
        *a6 = [v21 GEOErrorWithCode:-10 reason:v24];

        LOBYTE(a6) = 0;
      }
      goto LABEL_30;
    }
    if (a5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [*a5 isValidForRequest:a3 client:v9])
      {
        [*a5 refresh];
LABEL_29:
        LOBYTE(a6) = 1;
LABEL_30:

        goto LABEL_31;
      }
      if (!GEOThrottleKeyMakeFromRequestKind(*(void *)&a3))
      {
        *a5 = [[GEODataRequestThrottlerToken alloc] initWithRequest:a3 forClient:v9];
        goto LABEL_29;
      }
    }
    else if (!GEOThrottleKeyMakeFromRequestKind(*(void *)&a3))
    {
      goto LABEL_29;
    }
    uint64_t v38 = 0;
    long long v39 = &v38;
    uint64_t v40 = 0x2020000000;
    char v41 = 1;
    uint64_t v32 = 0;
    long long v33 = &v32;
    uint64_t v34 = 0x3032000000;
    long long v35 = __Block_byref_object_copy__45;
    long long v36 = __Block_byref_object_dispose__45;
    id v37 = 0;
    v31[0] = 0;
    v31[1] = v31;
    v31[2] = 0x2020000000;
    v31[3] = 0;
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x3032000000;
    v29[3] = __Block_byref_object_copy__45;
    v29[4] = __Block_byref_object_dispose__45;
    id v30 = 0;
    id v25 = v9;
    id v28 = v15;
    geo_isolate_sync_data();
    if (a6) {
      *a6 = (id) v33[5];
    }
    int v26 = *((unsigned __int8 *)v39 + 24);
    if (a5 && *((unsigned char *)v39 + 24))
    {
      *a5 = [[GEODataRequestThrottlerToken alloc] initWithRequest:a3 forClient:v25];
      int v26 = *((unsigned __int8 *)v39 + 24);
    }
    LOBYTE(a6) = v26 != 0;

    _Block_object_dispose(v29, 8);
    _Block_object_dispose(v31, 8);
    _Block_object_dispose(&v32, 8);

    _Block_object_dispose(&v38, 8);
    goto LABEL_30;
  }
  if (a6)
  {
    uint64_t v16 = (void *)MEMORY[0x1E4F28C58];
    int v17 = NSString;
    int v18 = [v9 bundleId];
    id v19 = GEODataRequestKindAsString(*(void *)&a3);
    id v20 = [v17 stringWithFormat:@"Client \"%@\" is not entitled to issue request type: %#x \"%@\"", v18, v13 | *(void *)&a3, v19];
    *a6 = [v16 GEOErrorWithCode:-5 reason:v20];

    LOBYTE(a6) = 0;
  }
LABEL_31:

  return (char)a6;
}

+ (GEODataRequestThrottler)sharedThrottler
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__GEODataRequestThrottler_sharedThrottler__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals_242 != -1) {
    dispatch_once(&_MergedGlobals_242, block);
  }
  uint64_t v2 = (void *)qword_1EB29FC08;

  return (GEODataRequestThrottler *)v2;
}

uint64_t __32__GEODataRequestThrottler_reset__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reset];
}

void __32__GEODataRequestThrottler__init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained pruneThrottlers];
}

- (void)pruneThrottlers
{
}

void __32__GEODataRequestThrottler__init__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reset];
}

- (void)reset
{
}

void __32__GEODataRequestThrottler__init__block_invoke_2(uint64_t a1)
{
  objc_copyWeak(&v1, (id *)(a1 + 32));
  geo_dispatch_async_qos();
  objc_destroyWeak(&v1);
}

void __42__GEODataRequestThrottler_sharedThrottler__block_invoke(uint64_t a1)
{
  uint64_t v1 = [objc_alloc(*(Class *)(a1 + 32)) _init];
  uint64_t v2 = (void *)qword_1EB29FC08;
  qword_1EB29FC08 = v1;
}

- (GEODataRequestThrottler)init
{
  result = (GEODataRequestThrottler *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (id)_init
{
  v27.receiver = self;
  v27.super_class = (Class)GEODataRequestThrottler;
  id v2 = [(GEODataRequestThrottler *)&v27 init];
  if (v2)
  {
    if (GEOConfigGetBOOL(GeoServicesConfig_ThrottlerLogAsFault, (uint64_t)off_1E91140D8)) {
      char v3 = 17;
    }
    else {
      char v3 = 16;
    }
    *((unsigned char *)v2 + 72) = v3;
    uint64_t v4 = geo_isolater_create();
    uint64_t v5 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v4;

    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v7 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v6;

    *((unsigned char *)v2 + 32) = 0;
    objc_initWeak(&location, v2);
    v24[1] = (id)MEMORY[0x1E4F143A8];
    v24[2] = (id)3221225472;
    v24[3] = __32__GEODataRequestThrottler__init__block_invoke;
    v24[4] = &unk_1E53D88B0;
    objc_copyWeak(&v25, &location);
    uint64_t v8 = geo_dispatch_timer_create_on_qos();
    id v9 = (void *)*((void *)v2 + 6);
    *((void *)v2 + 6) = v8;

    *((_DWORD *)v2 + 14) = -1;
    uint64_t v10 = GeoServicesConfig_ThrottlePolicy;
    uint64_t v11 = off_1E91140B8;
    global_queue = (void *)geo_get_global_queue();
    _GEOConfigAddDelegateListenerForKey(v10, (uint64_t)v11, global_queue, v2);

    uint64_t v13 = GeoServicesConfig_ThrottlePolicyIgnoreConfig;
    uint64_t v14 = off_1E91140A8;
    id v15 = (void *)geo_get_global_queue();
    _GEOConfigAddDelegateListenerForKey(v13, (uint64_t)v14, v15, v2);

    uint64_t v16 = GeoServicesConfig_ThrottlerLogAsFault;
    int v17 = off_1E91140D8;
    int v18 = (void *)geo_get_global_queue();
    _GEOConfigAddDelegateListenerForKey(v16, (uint64_t)v17, v18, v2);

    id v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __32__GEODataRequestThrottler__init__block_invoke_2;
    v23[3] = &unk_1E53E4410;
    objc_copyWeak(v24, &location);
    uint64_t v20 = [v19 addObserverForName:@"GEONetworkDefaultsDidChangeNotification" object:0 queue:0 usingBlock:v23];
    uint64_t v21 = (void *)*((void *)v2 + 8);
    *((void *)v2 + 8) = v20;

    dispatch_activate(*((dispatch_object_t *)v2 + 6));
    objc_destroyWeak(v24);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)dealloc
{
  dispatch_source_cancel((dispatch_source_t)self->_updateStateTimer);
  notify_cancel(self->_defaultChangedNotification);
  char v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self->_networkChangedNotification];

  GEOConfigRemoveDelegateListenerForKey(GEOConfigKey_Invalid, unk_1E91186C0, self);
  v4.receiver = self;
  v4.super_class = (Class)GEODataRequestThrottler;
  [(GEODataRequestThrottler *)&v4 dealloc];
}

- (void)getInfoForRequest:(id)a3 client:(id)a4 timeUntilNextReset:(double *)a5 availableRequestCount:(unsigned int *)a6
{
  id v9 = a4;
  if (!a3.var0) {
    goto LABEL_7;
  }
  if (!GEOThrottleKeyMakeFromRequestKind(*(void *)&a3))
  {
    *a6 = -1;
    *a5 = 0.0;
    goto LABEL_8;
  }
  if ((checkEntitlements(a3.var0, v9) & 1) == 0)
  {
LABEL_7:
    uint64_t v10 = [MEMORY[0x1E4F1C9C8] distantFuture];
    [v10 timeIntervalSinceReferenceDate];
    *(void *)a5 = v11;

    *a6 = 0;
    goto LABEL_8;
  }
  uint64_t v17 = 0;
  int v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0xFFFFFFFFLL;
  uint64_t v13 = 0;
  uint64_t v14 = (double *)&v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  id v12 = v9;
  geo_isolate_sync_data();
  *a5 = v14[3];
  *a6 = v18[3];

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
LABEL_8:
}

uint64_t __93__GEODataRequestThrottler_getInfoForRequest_client_timeUntilNextReset_availableRequestCount___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 64);
  char v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __93__GEODataRequestThrottler_getInfoForRequest_client_timeUntilNextReset_availableRequestCount___block_invoke_2;
  v5[3] = &unk_1E53E44B0;
  long long v6 = *(_OWORD *)(a1 + 48);
  return [v3 _withThrottlersForKey:v1 auditToken:v2 do:v5];
}

void __93__GEODataRequestThrottler_getInfoForRequest_client_timeUntilNextReset_availableRequestCount___block_invoke_2(uint64_t a1, void *a2)
{
  id v10 = a2;
  [v10 timeUntilReset];
  double v4 = v3;
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  double v6 = *(double *)(v5 + 24);
  if (v4 > v6)
  {
    [v10 timeUntilReset];
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  }
  *(double *)(v5 + 24) = v6;
  unint64_t v7 = [v10 remainingEntries];
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  unint64_t v9 = *(void *)(v8 + 24);
  if (v7 < v9)
  {
    unint64_t v9 = [v10 remainingEntries];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  }
  *(void *)(v8 + 24) = v9;
}

- (NSString)description
{
  id v4 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p> {\n", objc_opt_class(), self];
  geo_isolate_sync_data();
  [v4 appendString:@"}"];
  id v2 = v4;

  return (NSString *)v2;
}

void __38__GEODataRequestThrottler_description__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 40);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __38__GEODataRequestThrottler_description__block_invoke_2;
  v2[3] = &unk_1E53E4500;
  id v3 = *(id *)(a1 + 40);
  [v1 enumerateKeysAndObjectsUsingBlock:v2];
}

uint64_t __38__GEODataRequestThrottler_description__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) appendFormat:@"key '%@': %@\n", a2, a3];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_networkChangedNotification, 0);
  objc_storeStrong((id *)&self->_updateStateTimer, 0);
  objc_storeStrong((id *)&self->_throttlers, 0);
  objc_storeStrong((id *)&self->_globalThrottlePolicy, 0);
  objc_storeStrong((id *)&self->_defaultThrottlePolicy, 0);

  objc_storeStrong((id *)&self->_isolation, 0);
}

@end