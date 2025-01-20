@interface CoreDAVDiscoveryTaskGroup
- (BOOL)didReceiveAuthenticationError;
- (BOOL)shouldBailEarly;
- (CoreDAVAccountInfoProvider)discoveredAccountInfo;
- (CoreDAVDiscoveryTaskGroup)initWithAccountInfoProvider:(id)a3 taskManager:(id)a4;
- (CoreDAVDiscoveryTaskGroup)initWithAccountInfoProvider:(id)a3 taskManager:(id)a4 httpPorts:(id)a5 httpsPorts:(id)a6 httpServiceString:(id)a7 httpsServiceString:(id)a8 wellKnownPath:(id)a9 potentialContextPaths:(id)a10 requiredComplianceClass:(id)a11;
- (CoreDAVDiscoveryTaskGroup)initWithAccountInfoProvider:(id)a3 taskManager:(id)a4 httpPorts:(id)a5 httpsPorts:(id)a6 httpServiceString:(id)a7 httpsServiceString:(id)a8 wellKnownPaths:(id)a9 requiredComplianceClass:(id)a10;
- (NSArray)potentialContextPaths;
- (NSString)wellKnownPath;
- (id)allDiscoveryPaths:(id)a3;
- (id)allDiscoveryPorts:(id)a3 withScheme:(id)a4;
- (id)cleanedStringsFromResponseHeaders:(id)a3 forHeader:(id)a4;
- (id)extractPrincipalURLFromPropFindTask:(id)a3 error:(id *)a4;
- (id)propFindProperties;
- (id)setupDiscoveries:(id)a3 withSchemes:(id)a4;
- (void)addToDiscoveryArray:(id *)a3 discovery:(id)a4;
- (void)cancelTaskGroup;
- (void)completeDiscovery:(id)a3 error:(id)a4;
- (void)completeOptionsTask:(id)a3 error:(id)a4;
- (void)getDiscoveryStatus:(id)a3 priorFailed:(id *)a4 subsequentFailed:(id *)a5 priorIncomplete:(id *)a6 subsequentIncomplete:(id *)a7 priorSuccess:(id *)a8 subsequentSuccess:(id *)a9;
- (void)noteDefinitiveAuthFailureFromTask:(id)a3;
- (void)optionsTask:(id)a3 error:(id)a4;
- (void)propFindTaskFinished:(id)a3;
- (void)setDidReceiveAuthenticationError:(BOOL)a3;
- (void)setDiscoveredAccountInfo:(id)a3;
- (void)setPotentialContextPaths:(id)a3;
- (void)setShouldBailEarly:(BOOL)a3;
- (void)setWellKnownPath:(id)a3;
- (void)srvLookupTask:(id)a3 error:(id)a4;
- (void)startOptionsTask:(id)a3;
- (void)startPropfindTask:(id)a3;
- (void)startSRVLookup:(id)a3 serviceString:(id)a4;
- (void)startTaskGroup;
- (void)startWellKnownFallbackHeadTask:(id)a3 withURL:(id)a4;
- (void)startWellKnownLocationTask:(id)a3 withURL:(id)a4;
- (void)task:(id)a3 didFinishWithError:(id)a4;
- (void)taskGroupWillCancelWithError:(id)a3;
@end

@implementation CoreDAVDiscoveryTaskGroup

- (CoreDAVDiscoveryTaskGroup)initWithAccountInfoProvider:(id)a3 taskManager:(id)a4 httpPorts:(id)a5 httpsPorts:(id)a6 httpServiceString:(id)a7 httpsServiceString:(id)a8 wellKnownPath:(id)a9 potentialContextPaths:(id)a10 requiredComplianceClass:(id)a11
{
  id v30 = a5;
  id v29 = a6;
  id v28 = a7;
  id v27 = a8;
  id v26 = a9;
  id v25 = a10;
  id v18 = a11;
  v31.receiver = self;
  v31.super_class = (Class)CoreDAVDiscoveryTaskGroup;
  v19 = [(CoreDAVTaskGroup *)&v31 initWithAccountInfoProvider:a3 taskManager:a4];
  if (v19)
  {
    uint64_t v20 = objc_msgSend(v18, "lowercaseString", v25, v26, v27, v28, v29, v30);
    requiredComplianceClass = v19->_requiredComplianceClass;
    v19->_requiredComplianceClass = (NSString *)v20;

    objc_storeStrong((id *)&v19->_httpPorts, a5);
    objc_storeStrong((id *)&v19->_httpsPorts, a6);
    objc_storeStrong((id *)&v19->_httpServiceString, a7);
    objc_storeStrong((id *)&v19->_httpsServiceString, a8);
    objc_storeStrong((id *)&v19->_wellKnownPath, a9);
    objc_storeStrong((id *)&v19->_potentialContextPaths, a10);
    v19->_didReceiveAuthenticationError = 0;
    v22 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    discoveries = v19->_discoveries;
    v19->_discoveries = v22;
  }
  return v19;
}

- (CoreDAVDiscoveryTaskGroup)initWithAccountInfoProvider:(id)a3 taskManager:(id)a4 httpPorts:(id)a5 httpsPorts:(id)a6 httpServiceString:(id)a7 httpsServiceString:(id)a8 wellKnownPaths:(id)a9 requiredComplianceClass:(id)a10
{
  return [(CoreDAVDiscoveryTaskGroup *)self initWithAccountInfoProvider:a3 taskManager:a4 httpPorts:a5 httpsPorts:a6 httpServiceString:a7 httpsServiceString:a8 wellKnownPath:0 potentialContextPaths:a9 requiredComplianceClass:a10];
}

- (CoreDAVDiscoveryTaskGroup)initWithAccountInfoProvider:(id)a3 taskManager:(id)a4
{
  v6 = (void *)MEMORY[0x263EFF8C0];
  id v7 = a4;
  id v8 = a3;
  v9 = objc_msgSend(v6, "cdvArrayWithIntegers:", 80, 0);
  v10 = objc_msgSend(MEMORY[0x263EFF8C0], "cdvArrayWithIntegers:", 443, 0);
  v11 = [MEMORY[0x263EFF8C0] arrayWithObject:@"/"];
  v12 = [(CoreDAVDiscoveryTaskGroup *)self initWithAccountInfoProvider:v8 taskManager:v7 httpPorts:v9 httpsPorts:v10 httpServiceString:0 httpsServiceString:0 wellKnownPath:0 potentialContextPaths:v11 requiredComplianceClass:0];

  return v12;
}

- (void)taskGroupWillCancelWithError:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __58__CoreDAVDiscoveryTaskGroup_taskGroupWillCancelWithError___block_invoke;
  v6[3] = &unk_2641DFC88;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(CoreDAVTaskGroup *)self finishCoreDAVTaskGroupWithError:v5 delegateCallbackBlock:v6];
}

void __58__CoreDAVDiscoveryTaskGroup_taskGroupWillCancelWithError___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 discoveryTask:*(void *)(a1 + 32) gotAccountInfo:0 error:*(void *)(a1 + 40)];
}

- (void)cancelTaskGroup
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = self->_discoveries;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v7++) setShouldFailAllTasks:1];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)CoreDAVDiscoveryTaskGroup;
  [(CoreDAVTaskGroup *)&v8 cancelTaskGroup];
}

- (void)startTaskGroup
{
  uint64_t v146 = *MEMORY[0x263EF8340];
  v3 = +[CoreDAVLogging sharedLogging];
  p_accountInfoProvider = &self->super._accountInfoProvider;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  uint64_t v6 = [v3 logHandleForAccountInfoProvider:WeakRetained];

  if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v141 = "-[CoreDAVDiscoveryTaskGroup startTaskGroup]";
    _os_log_impl(&dword_213BFC000, v6, OS_LOG_TYPE_INFO, "%s - Started", buf, 0xCu);
  }

  v107 = self;
  p_httpServiceString = &self->_httpServiceString;
  location = (id *)&self->super._accountInfoProvider;
  if (!self->_httpServiceString && !self->_httpsServiceString)
  {
    id v42 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    v43 = [v42 serverRoot];
    if (v43)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
      p_accountInfoProvider = [WeakRetained serverRoot];
      if ([p_accountInfoProvider length]) {
        goto LABEL_42;
      }
    }
    v44 = [(CoreDAVDiscoveryTaskGroup *)self wellKnownPath];
    if (v44)
    {
      v45 = [(CoreDAVDiscoveryTaskGroup *)self wellKnownPath];
      uint64_t v46 = [v45 length];

      if (v43)
      {
      }
      self = v107;
      if (v46)
      {
        v47 = location;
        id v48 = objc_loadWeakRetained(location);
        v49 = [v48 scheme];

        v100 = v49;
        if (v49 && [v49 length])
        {
          v50 = [MEMORY[0x263EFF8C0] arrayWithObject:v49];
        }
        else
        {
          v50 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", @"https", @"http", 0);
        }
        long long v129 = 0u;
        long long v130 = 0u;
        long long v127 = 0u;
        long long v128 = 0u;
        id obja = v50;
        uint64_t v102 = [obja countByEnumeratingWithState:&v127 objects:v138 count:16];
        if (v102)
        {
          uint64_t v101 = *(void *)v128;
          do
          {
            uint64_t v71 = 0;
            do
            {
              if (*(void *)v128 != v101) {
                objc_enumerationMutation(obja);
              }
              uint64_t v103 = v71;
              v72 = *(void **)(*((void *)&v127 + 1) + 8 * v71);
              long long v123 = 0u;
              long long v124 = 0u;
              long long v125 = 0u;
              long long v126 = 0u;
              id v73 = objc_loadWeakRetained(v47);
              v74 = [v72 lowercaseString];
              v75 = [(CoreDAVDiscoveryTaskGroup *)self allDiscoveryPorts:v73 withScheme:v74];

              id v109 = v75;
              uint64_t v76 = [v75 countByEnumeratingWithState:&v123 objects:v137 count:16];
              if (v76)
              {
                uint64_t v77 = v76;
                uint64_t v78 = *(void *)v124;
                do
                {
                  for (uint64_t i = 0; i != v77; ++i)
                  {
                    if (*(void *)v124 != v78) {
                      objc_enumerationMutation(v109);
                    }
                    v80 = *(void **)(*((void *)&v123 + 1) + 8 * i);
                    v81 = [CoreDAVDiscoveryAccountInfo alloc];
                    id v82 = objc_loadWeakRetained(v47);
                    v83 = [(CoreDAVDiscoveryAccountInfo *)v81 initWithAccountInfoProvider:v82];

                    [(CoreDAVDiscoveryAccountInfo *)v83 setScheme:v72];
                    -[CoreDAVDiscoveryAccountInfo setPort:](v83, "setPort:", [v80 integerValue]);
                    [(CoreDAVDiscoveryAccountInfo *)v83 setStarted:1];
                    [(NSMutableArray *)self->_discoveries addObject:v83];
                    v84 = +[CoreDAVLogging sharedLogging];
                    id v85 = objc_loadWeakRetained(v47);
                    v86 = [v84 logHandleForAccountInfoProvider:v85];

                    if (v86)
                    {
                      v87 = v86;
                      if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
                      {
                        uint64_t v88 = [(NSMutableArray *)self->_discoveries count] - 1;
                        v89 = [(CoreDAVDiscoveryAccountInfo *)v83 url];
                        *(_DWORD *)buf = 136315650;
                        v141 = "-[CoreDAVDiscoveryTaskGroup startTaskGroup]";
                        __int16 v142 = 2048;
                        uint64_t v143 = v88;
                        self = v107;
                        __int16 v144 = 2112;
                        v145 = v89;
                        _os_log_impl(&dword_213BFC000, v87, OS_LOG_TYPE_INFO, "%s - Index: [%lu], URL: [%@]", buf, 0x20u);
                      }
                    }

                    v47 = location;
                  }
                  uint64_t v77 = [v109 countByEnumeratingWithState:&v123 objects:v137 count:16];
                }
                while (v77);
              }

              uint64_t v71 = v103 + 1;
            }
            while (v103 + 1 != v102);
            uint64_t v102 = [obja countByEnumeratingWithState:&v127 objects:v138 count:16];
          }
          while (v102);
        }
        v41 = obja;

        if ([(NSMutableArray *)self->_discoveries count])
        {
          long long v121 = 0u;
          long long v122 = 0u;
          long long v119 = 0u;
          long long v120 = 0u;
          v90 = self->_discoveries;
          uint64_t v91 = [(NSMutableArray *)v90 countByEnumeratingWithState:&v119 objects:v136 count:16];
          if (v91)
          {
            uint64_t v92 = v91;
            uint64_t v93 = *(void *)v120;
            do
            {
              for (uint64_t j = 0; j != v92; ++j)
              {
                if (*(void *)v120 != v93) {
                  objc_enumerationMutation(v90);
                }
                v95 = *(void **)(*((void *)&v119 + 1) + 8 * j);
                v96 = [v95 serverRoot];
                v97 = [(CoreDAVDiscoveryTaskGroup *)self wellKnownPath];
                [v95 setServerRoot:v97];

                v98 = [v95 url];
                [v95 setServerRoot:v96];
                [(CoreDAVDiscoveryTaskGroup *)self startWellKnownLocationTask:v95 withURL:v98];
              }
              uint64_t v92 = [(NSMutableArray *)v90 countByEnumeratingWithState:&v119 objects:v136 count:16];
            }
            while (v92);
            v41 = obja;
          }
        }
        else
        {
          v99 = [MEMORY[0x263F087E8] errorWithDomain:@"CoreDAVErrorDomain" code:6 userInfo:0];
          v117[0] = MEMORY[0x263EF8330];
          v117[1] = 3221225472;
          v117[2] = __43__CoreDAVDiscoveryTaskGroup_startTaskGroup__block_invoke;
          v117[3] = &unk_2641DFC88;
          v117[4] = self;
          id v118 = v99;
          v90 = v99;
          [(CoreDAVTaskGroup *)self finishCoreDAVTaskGroupWithError:v90 delegateCallbackBlock:v117];
        }
        id v65 = v100;
LABEL_92:

        goto LABEL_31;
      }
LABEL_44:
      v51 = +[CoreDAVLogging sharedLogging];
      id v52 = objc_loadWeakRetained(location);
      v53 = [v51 logHandleForAccountInfoProvider:v52];

      if (v53 && os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v141 = "-[CoreDAVDiscoveryTaskGroup startTaskGroup]";
        _os_log_impl(&dword_213BFC000, v53, OS_LOG_TYPE_INFO, "%s - Attempting PROPFIND", buf, 0xCu);
      }

      id v54 = objc_loadWeakRetained(location);
      v55 = [v54 scheme];

      v56 = (__CFString *)objc_loadWeakRetained(location);
      v57 = v56;
      if (v55)
      {
        v58 = [(__CFString *)v56 scheme];
        v59 = [v58 lowercaseString];
        v60 = @"https";
        if (([v59 isEqualToString:@"https"] & 1) == 0)
        {
          id v61 = objc_loadWeakRetained(location);
          v62 = [v61 scheme];
          v60 = [v62 lowercaseString];
        }
        v63 = objc_loadWeakRetained(location);
        v64 = [MEMORY[0x263EFF8C0] arrayWithObject:v60];
        v41 = [(CoreDAVDiscoveryTaskGroup *)self setupDiscoveries:v63 withSchemes:v64];

        v57 = v60;
      }
      else
      {
        v63 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", @"https", @"http", 0);
        v41 = [(CoreDAVDiscoveryTaskGroup *)self setupDiscoveries:v57 withSchemes:v63];
      }

      if ([v41 count])
      {
        long long v115 = 0u;
        long long v116 = 0u;
        long long v113 = 0u;
        long long v114 = 0u;
        id v65 = v41;
        uint64_t v66 = [v65 countByEnumeratingWithState:&v113 objects:v135 count:16];
        if (v66)
        {
          uint64_t v67 = v66;
          uint64_t v68 = *(void *)v114;
          do
          {
            for (uint64_t k = 0; k != v67; ++k)
            {
              if (*(void *)v114 != v68) {
                objc_enumerationMutation(v65);
              }
              [(CoreDAVDiscoveryTaskGroup *)self startPropfindTask:*(void *)(*((void *)&v113 + 1) + 8 * k)];
            }
            uint64_t v67 = [v65 countByEnumeratingWithState:&v113 objects:v135 count:16];
          }
          while (v67);
        }
        v41 = v65;
      }
      else
      {
        v70 = [MEMORY[0x263F087E8] errorWithDomain:@"CoreDAVErrorDomain" code:6 userInfo:0];
        v111[0] = MEMORY[0x263EF8330];
        v111[1] = 3221225472;
        v111[2] = __43__CoreDAVDiscoveryTaskGroup_startTaskGroup__block_invoke_283;
        v111[3] = &unk_2641DFC88;
        v111[4] = self;
        id v112 = v70;
        id v65 = v70;
        [(CoreDAVTaskGroup *)self finishCoreDAVTaskGroupWithError:v65 delegateCallbackBlock:v111];
      }
      goto LABEL_92;
    }

    if (v43)
    {
LABEL_42:
    }
    goto LABEL_44;
  }
  uint64_t v7 = +[CoreDAVLogging sharedLogging];
  id v8 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  long long v9 = [v7 logHandleForAccountInfoProvider:v8];

  if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v141 = "-[CoreDAVDiscoveryTaskGroup startTaskGroup]";
    _os_log_impl(&dword_213BFC000, v9, OS_LOG_TYPE_INFO, "%s - Attempting SRV lookups first", buf, 0xCu);
  }

  p_httpsServiceString = &self->_httpsServiceString;
  if (self->_httpsServiceString)
  {
    long long v10 = [CoreDAVDiscoveryAccountInfo alloc];
    id v11 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    long long v12 = [(CoreDAVDiscoveryAccountInfo *)v10 initWithAccountInfoProvider:v11];

    [(CoreDAVDiscoveryAccountInfo *)v12 setScheme:@"https"];
    [(CoreDAVDiscoveryAccountInfo *)v12 setStarted:1];
    [(NSMutableArray *)self->_discoveries addObject:v12];
    v13 = +[CoreDAVLogging sharedLogging];
    id v14 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    v15 = [v13 logHandleForAccountInfoProvider:v14];

    if (v15)
    {
      v16 = v15;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        uint64_t v17 = [(NSMutableArray *)self->_discoveries count] - 1;
        id v18 = [(CoreDAVDiscoveryAccountInfo *)v12 url];
        *(_DWORD *)buf = 136315650;
        v141 = "-[CoreDAVDiscoveryTaskGroup startTaskGroup]";
        __int16 v142 = 2048;
        uint64_t v143 = v17;
        __int16 v144 = 2112;
        v145 = v18;
        _os_log_impl(&dword_213BFC000, v16, OS_LOG_TYPE_INFO, "%s - Index: [%lu], URL: [%@]", buf, 0x20u);
      }
    }

    p_accountInfoProvider = &self->super._accountInfoProvider;
  }
  if (*p_httpServiceString)
  {
    v19 = [CoreDAVDiscoveryAccountInfo alloc];
    id v20 = objc_loadWeakRetained((id *)p_accountInfoProvider);
    v21 = [(CoreDAVDiscoveryAccountInfo *)v19 initWithAccountInfoProvider:v20];

    [(CoreDAVDiscoveryAccountInfo *)v21 setScheme:@"http"];
    [(CoreDAVDiscoveryAccountInfo *)v21 setStarted:1];
    [(NSMutableArray *)self->_discoveries addObject:v21];
    v22 = +[CoreDAVLogging sharedLogging];
    id v23 = objc_loadWeakRetained((id *)p_accountInfoProvider);
    v24 = [v22 logHandleForAccountInfoProvider:v23];

    if (v24)
    {
      id v25 = v24;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        uint64_t v26 = [(NSMutableArray *)self->_discoveries count] - 1;
        id v27 = [(CoreDAVDiscoveryAccountInfo *)v21 url];
        *(_DWORD *)buf = 136315650;
        v141 = "-[CoreDAVDiscoveryTaskGroup startTaskGroup]";
        __int16 v142 = 2048;
        uint64_t v143 = v26;
        __int16 v144 = 2112;
        v145 = v27;
        _os_log_impl(&dword_213BFC000, v25, OS_LOG_TYPE_INFO, "%s - Index: [%lu], URL: [%@]", buf, 0x20u);
      }
    }
  }
  long long v133 = 0u;
  long long v134 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  obuint64_t j = self->_discoveries;
  uint64_t v28 = [(NSMutableArray *)obj countByEnumeratingWithState:&v131 objects:v139 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v132;
    do
    {
      for (uint64_t m = 0; m != v29; ++m)
      {
        if (*(void *)v132 != v30) {
          objc_enumerationMutation(obj);
        }
        v32 = *(void **)(*((void *)&v131 + 1) + 8 * m);
        v33 = NSString;
        v34 = [v32 scheme];
        BOOL v35 = [v34 isEqualToString:@"https"] == 0;
        v36 = p_httpServiceString;
        if (!v35) {
          v36 = p_httpsServiceString;
        }
        v37 = *v36;
        id v38 = objc_loadWeakRetained(location);
        v39 = [v38 host];
        v40 = [v33 stringWithFormat:@"%@%@", v37, v39];

        [(CoreDAVDiscoveryTaskGroup *)v107 startSRVLookup:v32 serviceString:v40];
      }
      uint64_t v29 = [(NSMutableArray *)obj countByEnumeratingWithState:&v131 objects:v139 count:16];
    }
    while (v29);
  }
  v41 = obj;
LABEL_31:
}

void __43__CoreDAVDiscoveryTaskGroup_startTaskGroup__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 discoveryTask:*(void *)(a1 + 32) gotAccountInfo:0 error:*(void *)(a1 + 40)];
}

void __43__CoreDAVDiscoveryTaskGroup_startTaskGroup__block_invoke_283(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 discoveryTask:*(void *)(a1 + 32) gotAccountInfo:0 error:*(void *)(a1 + 40)];
}

- (id)setupDiscoveries:(id)a3 withSchemes:(id)a4
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v30 = [MEMORY[0x263EFF980] array];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  obuint64_t j = v7;
  uint64_t v28 = [obj countByEnumeratingWithState:&v50 objects:v62 count:16];
  if (v28)
  {
    uint64_t v27 = *(void *)v51;
    unint64_t v8 = 0x2641DF000uLL;
    unint64_t v9 = 0x2677FD000uLL;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v51 != v27)
        {
          uint64_t v11 = v10;
          objc_enumerationMutation(obj);
          uint64_t v10 = v11;
        }
        uint64_t v29 = v10;
        v36 = *(void **)(*((void *)&v50 + 1) + 8 * v10);
        if ([v36 isEqualToString:@"https"]) {
          uint64_t v40 = 0;
        }
        else {
          uint64_t v40 = [*(id *)((char *)&self->super.super.isa + *(int *)(v9 + 848)) count];
        }
        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        id v31 = [(CoreDAVDiscoveryTaskGroup *)self allDiscoveryPorts:v6 withScheme:v36];
        uint64_t v33 = [v31 countByEnumeratingWithState:&v46 objects:v61 count:16];
        if (v33)
        {
          uint64_t v32 = *(void *)v47;
          do
          {
            for (uint64_t i = 0; i != v33; ++i)
            {
              if (*(void *)v47 != v32) {
                objc_enumerationMutation(v31);
              }
              id v38 = *(void **)(*((void *)&v46 + 1) + 8 * i);
              long long v42 = 0u;
              long long v43 = 0u;
              long long v44 = 0u;
              long long v45 = 0u;
              id v13 = [(CoreDAVDiscoveryTaskGroup *)self allDiscoveryPaths:v6];
              uint64_t v39 = [v13 countByEnumeratingWithState:&v42 objects:v60 count:16];
              if (!v39) {
                goto LABEL_29;
              }
              id v35 = v13;
              uint64_t v34 = i;
              id v13 = 0;
              uint64_t v37 = *(void *)v43;
              do
              {
                for (uint64_t j = 0; j != v39; ++j)
                {
                  id v41 = v13;
                  if (*(void *)v43 != v37) {
                    objc_enumerationMutation(v35);
                  }
                  uint64_t v15 = *(void *)(*((void *)&v42 + 1) + 8 * j);
                  v16 = (void *)[objc_alloc(*(Class *)(v8 + 2128)) initWithAccountInfoProvider:v6];
                  [v16 setScheme:v36];
                  [v16 setServerRoot:v15];
                  objc_msgSend(v16, "setPort:", objc_msgSend(v38, "integerValue"));
                  [*(id *)((char *)&self->super.super.isa + *(int *)(v9 + 848)) insertObject:v16 atIndex:v40 + j];
                  uint64_t v17 = +[CoreDAVLogging sharedLogging];
                  id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
                  v19 = [v17 logHandleForAccountInfoProvider:WeakRetained];

                  if (v19)
                  {
                    id v20 = v19;
                    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
                    {
                      [v16 url];
                      unint64_t v21 = v8;
                      v22 = self;
                      v24 = id v23 = v6;
                      *(_DWORD *)buf = 136315650;
                      v55 = "-[CoreDAVDiscoveryTaskGroup setupDiscoveries:withSchemes:]";
                      __int16 v56 = 2048;
                      uint64_t v57 = v40 + j;
                      __int16 v58 = 2112;
                      v59 = v24;
                      _os_log_impl(&dword_213BFC000, v20, OS_LOG_TYPE_INFO, "%s - Index: [%lu], URL: [%@]", buf, 0x20u);

                      id v6 = v23;
                      self = v22;
                      unint64_t v8 = v21;
                      unint64_t v9 = 0x2677FD000;
                    }
                  }
                  id v13 = v41;
                  if (!v41) {
                    id v13 = v16;
                  }
                }
                uint64_t v39 = [v35 countByEnumeratingWithState:&v42 objects:v60 count:16];
                v40 += j;
              }
              while (v39);

              if (v13)
              {
                [v13 setStarted:1];
                [v30 addObject:v13];
                uint64_t i = v34;
LABEL_29:

                continue;
              }
              uint64_t i = v34;
            }
            uint64_t v33 = [v31 countByEnumeratingWithState:&v46 objects:v61 count:16];
          }
          while (v33);
        }

        uint64_t v10 = v29 + 1;
      }
      while (v29 + 1 != v28);
      uint64_t v28 = [obj countByEnumeratingWithState:&v50 objects:v62 count:16];
    }
    while (v28);
  }

  return v30;
}

- (id)allDiscoveryPorts:(id)a3 withScheme:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [MEMORY[0x263EFF980] array];
  if ([v6 port])
  {
    unint64_t v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "port"));
    [v8 addObject:v9];
  }
  else
  {
    if ([v7 isEqualToString:@"https"]) {
      uint64_t v10 = 104;
    }
    else {
      uint64_t v10 = 96;
    }
    [v8 addObjectsFromArray:*(Class *)((char *)&self->super.super.isa + v10)];
  }

  return v8;
}

- (id)allDiscoveryPaths:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263EFF980] array];
  id v6 = [v4 serverRoot];

  if (v6)
  {
    id v7 = [v4 serverRoot];
    [v5 addObject:v7];
  }
  else
  {
    id v7 = [(CoreDAVDiscoveryTaskGroup *)self potentialContextPaths];
    [v5 addObjectsFromArray:v7];
  }

  return v5;
}

- (void)startSRVLookup:(id)a3 serviceString:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = +[CoreDAVLogging sharedLogging];
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  uint64_t v10 = [v8 logHandleForAccountInfoProvider:WeakRetained];

  if (v10)
  {
    uint64_t v11 = v10;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      long long v12 = [v6 url];
      int v15 = 136315650;
      v16 = "-[CoreDAVDiscoveryTaskGroup startSRVLookup:serviceString:]";
      __int16 v17 = 2112;
      id v18 = v12;
      __int16 v19 = 2112;
      id v20 = v7;
      _os_log_impl(&dword_213BFC000, v11, OS_LOG_TYPE_INFO, "%s - URL: [%@], serviceString: [%@]", (uint8_t *)&v15, 0x20u);
    }
  }

  [v6 setStarted:1];
  id v13 = [[CoreDAVSRVLookupTask alloc] initWithServiceString:v7];
  [(CoreDAVTask *)v13 setDelegate:self];
  [(CoreDAVTask *)v13 setAccountInfoProvider:v6];
  [(CoreDAVTask *)v13 setTimeoutInterval:self->super._timeoutInterval];
  if (self->super._isCancelling)
  {
    id v14 = [MEMORY[0x263F087E8] errorWithDomain:@"CoreDAVErrorDomain" code:1 userInfo:0];
    [(CoreDAVDiscoveryTaskGroup *)self completeDiscovery:v13 error:v14];
  }
  else
  {
    [(NSMutableSet *)self->super._outstandingTasks addObject:v13];
    id v14 = objc_loadWeakRetained((id *)&self->super._taskManager);
    [v14 submitIndependentCoreDAVTask:v13];
  }
}

- (void)startWellKnownLocationTask:(id)a3 withURL:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = +[CoreDAVLogging sharedLogging];
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  uint64_t v10 = [v8 logHandleForAccountInfoProvider:WeakRetained];

  if (v10)
  {
    uint64_t v11 = v10;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      long long v12 = [v6 url];
      *(_DWORD *)buf = 136315394;
      uint64_t v28 = "-[CoreDAVDiscoveryTaskGroup startWellKnownLocationTask:withURL:]";
      __int16 v29 = 2112;
      id v30 = v12;
      _os_log_impl(&dword_213BFC000, v11, OS_LOG_TYPE_INFO, "%s - URL: [%@]", buf, 0x16u);
    }
  }

  [v6 setStarted:1];
  id v13 = [CoreDAVPropFindTask alloc];
  id v14 = [(CoreDAVDiscoveryTaskGroup *)self propFindProperties];
  int v15 = [(CoreDAVPropFindTask *)v13 initWithPropertiesToFind:v14 atURL:v7 withDepth:2];

  [(CoreDAVTask *)v15 setAccountInfoProvider:v6];
  [(CoreDAVTask *)v15 setTimeoutInterval:self->super._timeoutInterval];
  objc_initWeak((id *)buf, v15);
  uint64_t v19 = MEMORY[0x263EF8330];
  uint64_t v20 = 3221225472;
  uint64_t v21 = __64__CoreDAVDiscoveryTaskGroup_startWellKnownLocationTask_withURL___block_invoke;
  v22 = &unk_2641DFCD8;
  objc_copyWeak(&v26, (id *)buf);
  id v23 = self;
  id v16 = v6;
  id v24 = v16;
  id v17 = v7;
  id v25 = v17;
  [(CoreDAVTask *)v15 setCompletionBlock:&v19];
  if (!v17 || self->super._isCancelling)
  {
    id v18 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"CoreDAVErrorDomain", 1, 0, v19, v20, v21, v22, v23, v24);
    [(CoreDAVDiscoveryTaskGroup *)self completeDiscovery:v15 error:v18];
  }
  else
  {
    -[NSMutableSet addObject:](self->super._outstandingTasks, "addObject:", v15, v19, v20, v21, v22, v23, v24);
    id v18 = objc_loadWeakRetained((id *)&self->super._taskManager);
    [v18 submitIndependentCoreDAVTask:v15];
  }

  objc_destroyWeak(&v26);
  objc_destroyWeak((id *)buf);
}

void __64__CoreDAVDiscoveryTaskGroup_startWellKnownLocationTask_withURL___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    [*(id *)(*(void *)(a1 + 32) + 32) removeObject:WeakRetained];
    v3 = [WeakRetained error];
    if ([WeakRetained responseStatusCode] == 405)
    {
      [*(id *)(a1 + 32) startWellKnownFallbackHeadTask:*(void *)(a1 + 40) withURL:*(void *)(a1 + 48)];
    }
    else
    {
      if (v3)
      {
        id v4 = [v3 domain];
        if ([v4 isEqualToString:@"CoreDAVHTTPStatusErrorDomain"])
        {
          uint64_t v5 = [v3 code];

          if (v5 == 401)
          {
            id v6 = +[CoreDAVLogging sharedLogging];
            id v7 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
            unint64_t v8 = [v6 logHandleForAccountInfoProvider:v7];

            if (v8 && os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315138;
              uint64_t v28 = "-[CoreDAVDiscoveryTaskGroup startWellKnownLocationTask:withURL:]_block_invoke";
              _os_log_impl(&dword_213BFC000, v8, OS_LOG_TYPE_INFO, "%s - Bailing early because of 401 on .well-known", buf, 0xCu);
            }

            [*(id *)(a1 + 32) noteDefinitiveAuthFailureFromTask:WeakRetained];
            [*(id *)(a1 + 32) propFindTaskFinished:WeakRetained];
            goto LABEL_24;
          }
        }
        else
        {
        }
        id v11 = *(id *)(*(void *)(a1 + 32) + 144);
        objc_sync_enter(v11);
        [*(id *)(*(void *)(a1 + 32) + 144) removeObject:*(void *)(a1 + 40)];
        long long v12 = *(void **)(a1 + 32);
        id v13 = *(void **)(a1 + 40);
        id v14 = (void *)MEMORY[0x263EFF8C0];
        int v15 = [v13 scheme];
        id v16 = [v14 arrayWithObject:v15];
        id v17 = [v12 setupDiscoveries:v13 withSchemes:v16];

        objc_sync_exit(v11);
        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v18 = v17;
        uint64_t v19 = [v18 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v19)
        {
          uint64_t v20 = *(void *)v23;
          do
          {
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v23 != v20) {
                objc_enumerationMutation(v18);
              }
              objc_msgSend(*(id *)(a1 + 32), "startPropfindTask:", *(void *)(*((void *)&v22 + 1) + 8 * i), (void)v22);
            }
            uint64_t v19 = [v18 countByEnumeratingWithState:&v22 objects:v26 count:16];
          }
          while (v19);
        }

        goto LABEL_24;
      }
      unint64_t v9 = [*(id *)(a1 + 32) extractPrincipalURLFromPropFindTask:WeakRetained error:0];
      uint64_t v10 = *(void **)(a1 + 32);
      if (v9) {
        [v10 propFindTaskFinished:WeakRetained];
      }
      else {
        [v10 startWellKnownFallbackHeadTask:*(void *)(a1 + 40) withURL:*(void *)(a1 + 48)];
      }
    }
LABEL_24:
  }
}

- (void)startWellKnownFallbackHeadTask:(id)a3 withURL:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = +[CoreDAVLogging sharedLogging];
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  uint64_t v10 = [v8 logHandleForAccountInfoProvider:WeakRetained];

  if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v18 = "-[CoreDAVDiscoveryTaskGroup startWellKnownFallbackHeadTask:withURL:]";
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl(&dword_213BFC000, v10, OS_LOG_TYPE_INFO, "%s - URL: [%@]", buf, 0x16u);
  }

  id v11 = [(CoreDAVTask *)[CoreDAVHeadTask alloc] initWithURL:v7];
  [(CoreDAVTask *)v11 setAccountInfoProvider:v6];
  [(CoreDAVTask *)v11 setTimeoutInterval:self->super._timeoutInterval];
  [(CoreDAVTask *)v11 setAllowAutomaticRedirects:0];
  objc_initWeak((id *)buf, v11);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __68__CoreDAVDiscoveryTaskGroup_startWellKnownFallbackHeadTask_withURL___block_invoke;
  v14[3] = &unk_2641DFD00;
  objc_copyWeak(&v16, (id *)buf);
  v14[4] = self;
  id v12 = v7;
  id v15 = v12;
  [(CoreDAVTask *)v11 setCompletionBlock:v14];
  if (self->super._isCancelling)
  {
    id v13 = [MEMORY[0x263F087E8] errorWithDomain:@"CoreDAVErrorDomain" code:1 userInfo:0];
    [(CoreDAVDiscoveryTaskGroup *)self completeDiscovery:v11 error:v13];
  }
  else
  {
    [(NSMutableSet *)self->super._outstandingTasks addObject:v11];
    id v13 = objc_loadWeakRetained((id *)&self->super._taskManager);
    [v13 submitIndependentCoreDAVTask:v11];
  }

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);
}

void __68__CoreDAVDiscoveryTaskGroup_startWellKnownFallbackHeadTask_withURL___block_invoke(id *a1)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    [*((id *)a1[4] + 4) removeObject:WeakRetained];
    v3 = a1[4];
    if (v3[40])
    {
      id v4 = [MEMORY[0x263F087E8] errorWithDomain:@"CoreDAVErrorDomain" code:1 userInfo:0];
      [v3 completeDiscovery:WeakRetained error:v4];

      goto LABEL_31;
    }
    uint64_t v5 = [WeakRetained accountInfoProvider];
    id v6 = [WeakRetained error];
    id v7 = [v6 domain];
    if ([v7 isEqualToString:@"CoreDAVErrorDomain"])
    {
      uint64_t v8 = [v6 code];

      if (v8 == 1)
      {
        unint64_t v9 = +[CoreDAVLogging sharedLogging];
        id v10 = objc_loadWeakRetained((id *)a1[4] + 2);
        id v11 = [v9 logHandleForAccountInfoProvider:v10];

        if (v11)
        {
          id v12 = v11;
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v39 = (id)objc_opt_class();
            id v13 = v39;
            _os_log_impl(&dword_213BFC000, v12, OS_LOG_TYPE_INFO, "Task cancelled: [%@]", buf, 0xCu);
          }
        }

        [a1[4] completeDiscovery:WeakRetained error:v6];
        goto LABEL_30;
      }
    }
    else
    {
    }
    if (CDVHTTPStatusCodeRepresentsRedirection([WeakRetained responseStatusCode]))
    {
      id v14 = [WeakRetained responseHeaders];
      id v15 = [v14 CDVObjectForKeyCaseInsensitive:@"Location"];

      id v16 = NSURL;
      id v17 = [WeakRetained url];
      id v18 = [v16 URLWithString:v15 relativeToURL:v17];
      __int16 v19 = [v18 absoluteURL];

      if (v19)
      {
        id v20 = [a1[5] scheme];
        if (![v20 hasPrefix:@"https"])
        {

LABEL_28:
          [a1[4] startWellKnownLocationTask:v5 withURL:v19];
LABEL_29:

LABEL_30:
          goto LABEL_31;
        }
        uint64_t v21 = [v19 scheme];
        char v22 = [v21 hasPrefix:@"https"];

        if (v22) {
          goto LABEL_28;
        }
      }
      else
      {
      }
    }
    else
    {
      __int16 v19 = 0;
    }
    id v23 = *((id *)a1[4] + 18);
    objc_sync_enter(v23);
    [*((id *)a1[4] + 18) removeObject:v5];
    id v24 = a1[4];
    long long v25 = (void *)MEMORY[0x263EFF8C0];
    id v26 = [v5 scheme];
    uint64_t v27 = [v25 arrayWithObject:v26];
    uint64_t v28 = [v24 setupDiscoveries:v5 withSchemes:v27];

    objc_sync_exit(v23);
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v29 = v28;
    uint64_t v30 = [v29 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v30)
    {
      uint64_t v31 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v34 != v31) {
            objc_enumerationMutation(v29);
          }
          objc_msgSend(a1[4], "startPropfindTask:", *(void *)(*((void *)&v33 + 1) + 8 * i), (void)v33);
        }
        uint64_t v30 = [v29 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v30);
    }

    goto LABEL_29;
  }
LABEL_31:
}

- (void)startOptionsTask:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = +[CoreDAVLogging sharedLogging];
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  id v7 = [v5 logHandleForAccountInfoProvider:WeakRetained];

  if (v7)
  {
    uint64_t v8 = v7;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      unint64_t v9 = [v4 url];
      int v14 = 136315394;
      id v15 = "-[CoreDAVDiscoveryTaskGroup startOptionsTask:]";
      __int16 v16 = 2112;
      id v17 = v9;
      _os_log_impl(&dword_213BFC000, v8, OS_LOG_TYPE_INFO, "%s - URL: [%@]", (uint8_t *)&v14, 0x16u);
    }
  }

  id v10 = [CoreDAVOptionsTask alloc];
  id v11 = [v4 url];
  id v12 = [(CoreDAVTask *)v10 initWithURL:v11];

  [(CoreDAVTask *)v12 setDelegate:self];
  [(CoreDAVTask *)v12 setAccountInfoProvider:v4];
  [(CoreDAVTask *)v12 setTimeoutInterval:self->super._timeoutInterval];
  if (self->super._isCancelling)
  {
    id v13 = [MEMORY[0x263F087E8] errorWithDomain:@"CoreDAVErrorDomain" code:1 userInfo:0];
    [(CoreDAVDiscoveryTaskGroup *)self completeDiscovery:v12 error:v13];
  }
  else
  {
    [(NSMutableSet *)self->super._outstandingTasks addObject:v12];
    id v13 = objc_loadWeakRetained((id *)&self->super._taskManager);
    [v13 submitIndependentCoreDAVTask:v12];
  }
}

- (void)startPropfindTask:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = +[CoreDAVLogging sharedLogging];
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  id v7 = [v5 logHandleForAccountInfoProvider:WeakRetained];

  if (v7)
  {
    uint64_t v8 = v7;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      unint64_t v9 = [v4 url];
      *(_DWORD *)buf = 136315394;
      char v22 = "-[CoreDAVDiscoveryTaskGroup startPropfindTask:]";
      __int16 v23 = 2112;
      id v24 = v9;
      _os_log_impl(&dword_213BFC000, v8, OS_LOG_TYPE_INFO, "%s - URL: [%@]", buf, 0x16u);
    }
  }

  [v4 setStarted:1];
  id v10 = [CoreDAVPropFindTask alloc];
  id v11 = [(CoreDAVDiscoveryTaskGroup *)self propFindProperties];
  id v12 = [v4 url];
  id v13 = [(CoreDAVPropFindTask *)v10 initWithPropertiesToFind:v11 atURL:v12 withDepth:2];

  [(CoreDAVTask *)v13 setAccountInfoProvider:v4];
  [(CoreDAVTask *)v13 setTimeoutInterval:self->super._timeoutInterval];
  objc_initWeak((id *)buf, v13);
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  id v17 = __47__CoreDAVDiscoveryTaskGroup_startPropfindTask___block_invoke;
  uint64_t v18 = &unk_2641DFC60;
  objc_copyWeak(&v20, (id *)buf);
  __int16 v19 = self;
  [(CoreDAVTask *)v13 setCompletionBlock:&v15];
  if (self->super._isCancelling)
  {
    int v14 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"CoreDAVErrorDomain", 1, 0, v15, v16, v17, v18);
    [(CoreDAVDiscoveryTaskGroup *)self completeDiscovery:v13 error:v14];
  }
  else
  {
    -[NSMutableSet addObject:](self->super._outstandingTasks, "addObject:", v13, v15, v16, v17, v18);
    int v14 = objc_loadWeakRetained((id *)&self->super._taskManager);
    [v14 submitIndependentCoreDAVTask:v13];
  }

  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);
}

void __47__CoreDAVDiscoveryTaskGroup_startPropfindTask___block_invoke(uint64_t a1)
{
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));

  if (v2)
  {
    [*(id *)(*(void *)(a1 + 32) + 32) removeObject:v2];
    [*(id *)(a1 + 32) propFindTaskFinished:v2];
  }
}

- (void)task:(id)a3 didFinishWithError:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(CoreDAVDiscoveryTaskGroup *)self srvLookupTask:v7 error:v6];
  }
}

- (void)srvLookupTask:(id)a3 error:(id)a4
{
  uint64_t v89 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v63 = a4;
  [(NSMutableSet *)self->super._outstandingTasks removeObject:v6];
  v64 = v6;
  if (!self->super._isCancelling)
  {
    id v65 = [v6 accountInfoProvider];
    uint64_t v8 = +[CoreDAVLogging sharedLogging];
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    id v10 = [v8 logHandleForAccountInfoProvider:WeakRetained];

    if (v10)
    {
      id v11 = v10;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        id v12 = [v65 url];
        *(_DWORD *)buf = 136315650;
        id v82 = "-[CoreDAVDiscoveryTaskGroup srvLookupTask:error:]";
        __int16 v83 = 2112;
        v84 = v12;
        __int16 v85 = 2112;
        v86 = v63;
        _os_log_impl(&dword_213BFC000, v11, OS_LOG_TYPE_INFO, "%s - URL: [%@],  error: [%@]", buf, 0x20u);
      }
    }

    id v13 = [v63 domain];
    if ([v13 isEqualToString:@"CoreDAVErrorDomain"])
    {
      BOOL v14 = [v63 code] == 1;

      if (v14)
      {
        uint64_t v15 = +[CoreDAVLogging sharedLogging];
        id v16 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
        id v17 = [v15 logHandleForAccountInfoProvider:v16];

        if (v17)
        {
          uint64_t v18 = v17;
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            __int16 v19 = (char *)objc_opt_class();
            *(_DWORD *)buf = 138543362;
            id v82 = v19;
            id v20 = v19;
            _os_log_impl(&dword_213BFC000, v18, OS_LOG_TYPE_INFO, "Task cancelled: [%{public}@]", buf, 0xCu);
          }
        }

        [(CoreDAVDiscoveryTaskGroup *)self completeDiscovery:v64 error:v63];
        goto LABEL_59;
      }
    }
    else
    {
    }
    v62 = [v64 fetchedRecords];
    if ([v62 count])
    {
      uint64_t v21 = [v62 objectAtIndex:0];
      char v22 = [v21 target];
      __int16 v23 = [v21 port];
      uint64_t v24 = [v23 integerValue];

      uint64_t v25 = +[CoreDAVLogging sharedLogging];
      id v26 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
      uint64_t v27 = [v25 logHandleForAccountInfoProvider:v26];

      if (v27)
      {
        uint64_t v28 = v27;
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          id v29 = [v65 url];
          *(_DWORD *)buf = 136315906;
          id v82 = "-[CoreDAVDiscoveryTaskGroup srvLookupTask:error:]";
          __int16 v83 = 2112;
          v84 = v29;
          __int16 v85 = 2112;
          v86 = v22;
          __int16 v87 = 2048;
          uint64_t v88 = v24;
          _os_log_impl(&dword_213BFC000, v28, OS_LOG_TYPE_INFO, "%s - URL: [%@] srvHost: [%@], srvPort: [%ld]", buf, 0x2Au);
        }
      }

      if ([v22 length] && v24)
      {
        [v65 setHost:v22];
        [v65 setPort:v24];
      }
    }
    else
    {
      uint64_t v21 = +[CoreDAVLogging sharedLogging];
      id v30 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
      char v22 = [v21 logHandleForAccountInfoProvider:v30];

      if (v22)
      {
        char v22 = v22;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          uint64_t v31 = [v65 url];
          *(_DWORD *)buf = 136315394;
          id v82 = "-[CoreDAVDiscoveryTaskGroup srvLookupTask:error:]";
          __int16 v83 = 2112;
          v84 = v31;
          _os_log_impl(&dword_213BFC000, v22, OS_LOG_TYPE_INFO, "%s - Could not find any SRV records.  URL: [%@]", buf, 0x16u);
        }
      }
    }

    uint64_t v32 = [v65 serverRoot];
    if (!v32
      || ([v65 serverRoot],
          char v22 = objc_claimAutoreleasedReturnValue(),
          ![v22 length]))
    {
      long long v33 = [(CoreDAVDiscoveryTaskGroup *)self wellKnownPath];
      if (v33)
      {
        long long v34 = [(CoreDAVDiscoveryTaskGroup *)self wellKnownPath];
        uint64_t v35 = [v34 length];

        if (v32)
        {

          if (!v35)
          {
LABEL_35:
            id obja = self->_discoveries;
            objc_sync_enter(obja);
            [(NSMutableArray *)self->_discoveries removeObject:v65];
            long long v36 = (void *)MEMORY[0x263EFF8C0];
            uint64_t v37 = [v65 scheme];
            id v38 = [v36 arrayWithObject:v37];
            id v39 = [(CoreDAVDiscoveryTaskGroup *)self setupDiscoveries:v65 withSchemes:v38];

            objc_sync_exit(obja);
            long long v68 = 0u;
            long long v69 = 0u;
            long long v66 = 0u;
            long long v67 = 0u;
            id v40 = v39;
            uint64_t v41 = [v40 countByEnumeratingWithState:&v66 objects:v78 count:16];
            if (v41)
            {
              uint64_t v42 = *(void *)v67;
              do
              {
                for (uint64_t i = 0; i != v41; ++i)
                {
                  if (*(void *)v67 != v42) {
                    objc_enumerationMutation(v40);
                  }
                  [(CoreDAVDiscoveryTaskGroup *)self startPropfindTask:*(void *)(*((void *)&v66 + 1) + 8 * i)];
                }
                uint64_t v41 = [v40 countByEnumeratingWithState:&v66 objects:v78 count:16];
              }
              while (v41);
            }
LABEL_58:

LABEL_59:
            goto LABEL_60;
          }
        }
        else if (!v35)
        {
          goto LABEL_35;
        }
        id v44 = objc_alloc_init(MEMORY[0x263EFF980]);
        obuint64_t j = self->_discoveries;
        objc_sync_enter(obj);
        [(NSMutableArray *)self->_discoveries removeObject:v65];
        long long v76 = 0u;
        long long v77 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        long long v45 = [v65 scheme];
        long long v46 = [v45 lowercaseString];
        long long v47 = [(CoreDAVDiscoveryTaskGroup *)self allDiscoveryPorts:v65 withScheme:v46];

        uint64_t v48 = [v47 countByEnumeratingWithState:&v74 objects:v80 count:16];
        if (v48)
        {
          uint64_t v49 = *(void *)v75;
          do
          {
            for (uint64_t j = 0; j != v48; ++j)
            {
              if (*(void *)v75 != v49) {
                objc_enumerationMutation(v47);
              }
              long long v51 = *(void **)(*((void *)&v74 + 1) + 8 * j);
              long long v52 = [[CoreDAVDiscoveryAccountInfo alloc] initWithAccountInfoProvider:v65];
              -[CoreDAVDiscoveryAccountInfo setPort:](v52, "setPort:", [v51 integerValue]);
              [(CoreDAVDiscoveryAccountInfo *)v52 setStarted:1];
              [v44 addObject:v52];
              [(NSMutableArray *)self->_discoveries addObject:v52];
            }
            uint64_t v48 = [v47 countByEnumeratingWithState:&v74 objects:v80 count:16];
          }
          while (v48);
        }

        objc_sync_exit(obj);
        long long v72 = 0u;
        long long v73 = 0u;
        long long v70 = 0u;
        long long v71 = 0u;
        id v40 = v44;
        uint64_t v53 = [v40 countByEnumeratingWithState:&v70 objects:v79 count:16];
        if (v53)
        {
          uint64_t v54 = *(void *)v71;
          do
          {
            for (uint64_t k = 0; k != v53; ++k)
            {
              if (*(void *)v71 != v54) {
                objc_enumerationMutation(v40);
              }
              __int16 v56 = *(void **)(*((void *)&v70 + 1) + 8 * k);
              uint64_t v57 = [v56 serverRoot];
              __int16 v58 = [(CoreDAVDiscoveryTaskGroup *)self wellKnownPath];
              [v56 setServerRoot:v58];

              v59 = [v56 url];
              [v56 setServerRoot:v57];
              [(CoreDAVDiscoveryTaskGroup *)self startWellKnownLocationTask:v56 withURL:v59];
            }
            uint64_t v53 = [v40 countByEnumeratingWithState:&v70 objects:v79 count:16];
          }
          while (v53);
        }
        goto LABEL_58;
      }

      if (!v32) {
        goto LABEL_35;
      }
    }

    goto LABEL_35;
  }
  id v7 = [MEMORY[0x263F087E8] errorWithDomain:@"CoreDAVErrorDomain" code:1 userInfo:0];
  [(CoreDAVDiscoveryTaskGroup *)self completeDiscovery:v6 error:v7];

LABEL_60:
}

- (void)completeOptionsTask:(id)a3 error:(id)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!self->super._isCancelling)
  {
    unint64_t v9 = [v6 accountInfoProvider];
    id v10 = +[CoreDAVLogging sharedLogging];
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    id v12 = [v10 logHandleForAccountInfoProvider:WeakRetained];

    if (v12)
    {
      id v13 = v12;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        uint64_t v32 = v9;
        BOOL v14 = [v9 url];
        requiredComplianceClass = self->_requiredComplianceClass;
        if (v7)
        {
          id v16 = 0;
        }
        else
        {
          id v16 = [v6 responseHeaders];
        }
        *(_DWORD *)buf = 136316162;
        long long v34 = "-[CoreDAVDiscoveryTaskGroup completeOptionsTask:error:]";
        __int16 v35 = 2112;
        long long v36 = v14;
        __int16 v37 = 2112;
        id v38 = requiredComplianceClass;
        __int16 v39 = 2112;
        id v40 = v7;
        __int16 v41 = 2112;
        uint64_t v42 = v16;
        _os_log_impl(&dword_213BFC000, v13, OS_LOG_TYPE_INFO, "%s - URL: [%@], requiredComplianceClass: [%@], error: [%@], responseHeaders: [%@]", buf, 0x34u);
        if (!v7) {

        }
        unint64_t v9 = v32;
      }
    }
    if (v7)
    {
      id v17 = [v7 domain];
      if ([v17 isEqualToString:@"CoreDAVHTTPStatusErrorDomain"])
      {
        uint64_t v18 = [v7 code];

        if (v18 == 401) {
          [(CoreDAVDiscoveryTaskGroup *)self setDidReceiveAuthenticationError:1];
        }
      }
      else
      {
      }
      [(CoreDAVDiscoveryTaskGroup *)self completeDiscovery:v6 error:v7];
      goto LABEL_32;
    }
    __int16 v19 = [v6 responseHeaders];
    id v20 = CDVCleanedStringsFromResponseHeaders(v19, @"DAV");

    if (self->_requiredComplianceClass)
    {
      if ((objc_msgSend(v20, "containsObject:") & 1) == 0)
      {
        uint64_t v21 = +[CoreDAVLogging sharedLogging];
        id v22 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
        __int16 v23 = [v21 logHandleForAccountInfoProvider:v22];

        if (v23)
        {
          __int16 v23 = v23;
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            uint64_t v24 = self->_requiredComplianceClass;
            uint64_t v25 = [v9 url];
            *(_DWORD *)buf = 136315650;
            long long v34 = "-[CoreDAVDiscoveryTaskGroup completeOptionsTask:error:]";
            __int16 v35 = 2112;
            long long v36 = v24;
            __int16 v37 = 2112;
            id v38 = v25;
            id v26 = "%s - No mention of compliance class [%@] in \"DAV\" header at URL: [%@]";
            uint64_t v27 = v23;
            uint32_t v28 = 32;
LABEL_28:
            _os_log_impl(&dword_213BFC000, v27, OS_LOG_TYPE_INFO, v26, buf, v28);

            goto LABEL_29;
          }
          goto LABEL_29;
        }
        goto LABEL_30;
      }
    }
    else if (![v20 count])
    {
      uint64_t v21 = +[CoreDAVLogging sharedLogging];
      id v30 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
      __int16 v23 = [v21 logHandleForAccountInfoProvider:v30];

      if (v23)
      {
        __int16 v23 = v23;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          uint64_t v25 = [v9 url];
          *(_DWORD *)buf = 136315394;
          long long v34 = "-[CoreDAVDiscoveryTaskGroup completeOptionsTask:error:]";
          __int16 v35 = 2112;
          long long v36 = v25;
          id v26 = "%s - No \"DAV\" header at URL: [%@]";
          uint64_t v27 = v23;
          uint32_t v28 = 22;
          goto LABEL_28;
        }
LABEL_29:
      }
LABEL_30:

      uint64_t v31 = [MEMORY[0x263F087E8] errorWithDomain:@"CoreDAVErrorDomain" code:6 userInfo:0];
      [(CoreDAVDiscoveryTaskGroup *)self completeDiscovery:v6 error:v31];

      goto LABEL_31;
    }
    [v9 setServerComplianceClasses:v20];
    id v29 = [v6 responseHeaders];
    [v9 setServerHeaders:v29];

    [(CoreDAVDiscoveryTaskGroup *)self completeDiscovery:v6 error:0];
LABEL_31:

LABEL_32:
    goto LABEL_33;
  }
  uint64_t v8 = [MEMORY[0x263F087E8] errorWithDomain:@"CoreDAVErrorDomain" code:1 userInfo:0];
  [(CoreDAVDiscoveryTaskGroup *)self completeDiscovery:v6 error:v8];

LABEL_33:
}

- (void)optionsTask:(id)a3 error:(id)a4
{
  outstandingTasks = self->super._outstandingTasks;
  id v7 = a4;
  id v8 = a3;
  [(NSMutableSet *)outstandingTasks removeObject:v8];
  [(CoreDAVDiscoveryTaskGroup *)self completeOptionsTask:v8 error:v7];
}

- (void)propFindTaskFinished:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 multiStatus];
  id v6 = [v5 orderedResponses];

  id v7 = [v4 error];
  [(NSMutableSet *)self->super._outstandingTasks removeObject:v4];
  if (!self->super._isCancelling)
  {
    id v8 = [v4 accountInfoProvider];
    unint64_t v9 = +[CoreDAVLogging sharedLogging];
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    id v11 = [v9 logHandleForAccountInfoProvider:WeakRetained];

    if (v11)
    {
      id v12 = v11;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        id v13 = [v8 url];
        *(_DWORD *)buf = 136315906;
        __int16 v23 = "-[CoreDAVDiscoveryTaskGroup propFindTaskFinished:]";
        __int16 v24 = 2112;
        uint64_t v25 = v13;
        __int16 v26 = 2112;
        uint64_t v27 = v6;
        __int16 v28 = 2112;
        id v29 = v7;
        _os_log_impl(&dword_213BFC000, v12, OS_LOG_TYPE_INFO, "%s - URL: [%@], parsedResponses: [%@], error: [%@]", buf, 0x2Au);
      }
    }

    if (v7)
    {
      BOOL v14 = [v7 domain];
      if ([v14 isEqualToString:@"CoreDAVHTTPStatusErrorDomain"])
      {
        uint64_t v15 = [v7 code];

        if (v15 == 401) {
          [(CoreDAVDiscoveryTaskGroup *)self setDidReceiveAuthenticationError:1];
        }
      }
      else
      {
      }
      id v16 = 0;
    }
    else
    {
      id v21 = 0;
      id v16 = [(CoreDAVDiscoveryTaskGroup *)self extractPrincipalURLFromPropFindTask:v4 error:&v21];
      id v17 = v21;
      if (!v17)
      {
        [v8 setPrincipalURL:v16];
        uint64_t v18 = [v8 principalURL];
        __int16 v19 = [v18 relativePath];
        id v20 = [v19 CDVStringByAppendingSlashIfNeeded];
        [v8 setServerRoot:v20];

        [(CoreDAVDiscoveryTaskGroup *)self startOptionsTask:v8];
        id v7 = 0;
        goto LABEL_16;
      }
      id v7 = v17;
    }
    [(CoreDAVDiscoveryTaskGroup *)self completeDiscovery:v4 error:v7];
LABEL_16:

    goto LABEL_17;
  }
  id v8 = [MEMORY[0x263F087E8] errorWithDomain:@"CoreDAVErrorDomain" code:1 userInfo:0];
  [(CoreDAVDiscoveryTaskGroup *)self completeDiscovery:v4 error:v8];
LABEL_17:
}

- (void)completeDiscovery:(id)a3 error:(id)a4
{
  uint64_t v137 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v97 = a4;
  uint64_t v92 = v5;
  v99 = [v5 accountInfoProvider];
  id v6 = +[CoreDAVLogging sharedLogging];
  p_accountInfoProvider = &self->super._accountInfoProvider;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  unint64_t v9 = [v6 logHandleForAccountInfoProvider:WeakRetained];

  if (v9)
  {
    id v10 = v9;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = [v99 url];
      id v12 = [v99 principalURL];
      id v13 = [v99 serverComplianceClasses];
      *(_DWORD *)buf = 136316162;
      long long v128 = "-[CoreDAVDiscoveryTaskGroup completeDiscovery:error:]";
      __int16 v129 = 2112;
      uint64_t v130 = (uint64_t)v11;
      __int16 v131 = 2112;
      long long v132 = v12;
      __int16 v133 = 2112;
      long long v134 = v13;
      __int16 v135 = 2112;
      id v136 = v97;
      _os_log_impl(&dword_213BFC000, v10, OS_LOG_TYPE_INFO, "%s - URL: [%@] principalURL: [%@] complianceClasses: [%@] error: [%@]", buf, 0x34u);
    }
  }

  id v124 = 0;
  id v123 = 0;
  id v122 = 0;
  id v121 = 0;
  id v120 = 0;
  [(CoreDAVDiscoveryTaskGroup *)self getDiscoveryStatus:v99 priorFailed:&v124 subsequentFailed:0 priorIncomplete:&v123 subsequentIncomplete:&v122 priorSuccess:&v121 subsequentSuccess:&v120];
  id v93 = v124;
  id v14 = v123;
  id v100 = v122;
  id v96 = v121;
  id v94 = v120;
  v95 = v14;
  uint64_t v15 = [v14 count];
  uint64_t v16 = [v100 count] + v15;
  if (v97)
  {
    objc_msgSend(v99, "setError:");
    if (![v96 count] && !-[CoreDAVDiscoveryTaskGroup shouldBailEarly](self, "shouldBailEarly"))
    {
      id v17 = self->_discoveries;
      objc_sync_enter(v17);
      uint64_t v18 = [(NSMutableArray *)self->_discoveries indexOfObject:v99];
      if (v18 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v84 = [MEMORY[0x263F08690] currentHandler];
        [v84 handleFailureInMethod:a2 object:self file:@"CoreDAVDiscoveryTaskGroup.m" lineNumber:995 description:@"Current discovery was not found."];
      }
      if (v18 + 1 < (unint64_t)[(NSMutableArray *)self->_discoveries count])
      {
        __int16 v19 = -[NSMutableArray objectAtIndex:](self->_discoveries, "objectAtIndex:");
        if (([v19 started] & 1) == 0 && !self->super._isCancelling)
        {
          [(CoreDAVDiscoveryTaskGroup *)self startPropfindTask:v19];
          ++v16;
        }
      }
      objc_sync_exit(v17);
    }
    if (v16)
    {
      id v20 = +[CoreDAVLogging sharedLogging];
      id v21 = objc_loadWeakRetained((id *)p_accountInfoProvider);
      id v22 = [v20 logHandleForAccountInfoProvider:v21];

      if (v22)
      {
        __int16 v23 = v22;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          __int16 v24 = [v99 url];
          *(_DWORD *)buf = 138412546;
          long long v128 = v24;
          __int16 v129 = 2048;
          uint64_t v130 = v16;
          _os_log_impl(&dword_213BFC000, v23, OS_LOG_TYPE_INFO, "CoreDAVDiscoveryTaskGroup.completeDiscovery:%@ failed, waiting for %lu incomplete.", buf, 0x16u);
        }
      }
    }
    else if ([v96 count] || objc_msgSend(v94, "count"))
    {
      if ([v96 count]) {
        __int16 v41 = v96;
      }
      else {
        __int16 v41 = v94;
      }
      uint64_t v42 = [v41 objectAtIndex:0];
      [(CoreDAVDiscoveryTaskGroup *)self setDiscoveredAccountInfo:v42];

      uint64_t v43 = +[CoreDAVLogging sharedLogging];
      id v44 = objc_loadWeakRetained((id *)p_accountInfoProvider);
      long long v45 = [v43 logHandleForAccountInfoProvider:v44];

      if (v45)
      {
        long long v46 = v45;
        if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
        {
          long long v47 = [v99 url];
          uint64_t v48 = [(CoreDAVDiscoveryTaskGroup *)self discoveredAccountInfo];
          uint64_t v49 = [v48 principalURL];
          *(_DWORD *)buf = 138412546;
          long long v128 = v47;
          __int16 v129 = 2112;
          uint64_t v130 = (uint64_t)v49;
          _os_log_impl(&dword_213BFC000, v46, OS_LOG_TYPE_INFO, "CoreDAVDiscoveryTaskGroup.completeDiscovery:%@ failed, returning previous success %@.", buf, 0x16u);
        }
      }

      v119[0] = MEMORY[0x263EF8330];
      v119[1] = 3221225472;
      v119[2] = __53__CoreDAVDiscoveryTaskGroup_completeDiscovery_error___block_invoke;
      v119[3] = &unk_2641DFC10;
      v119[4] = self;
      [(CoreDAVTaskGroup *)self finishCoreDAVTaskGroupWithError:0 delegateCallbackBlock:v119];
    }
    else if ([v93 count])
    {
      id v89 = v99;
      long long v115 = 0u;
      long long v116 = 0u;
      long long v117 = 0u;
      long long v118 = 0u;
      id obja = v93;
      uint64_t v60 = [obja countByEnumeratingWithState:&v115 objects:v126 count:16];
      id v61 = v89;
      if (v60)
      {
        uint64_t v62 = *(void *)v116;
        do
        {
          for (uint64_t i = 0; i != v60; ++i)
          {
            if (*(void *)v116 != v62) {
              objc_enumerationMutation(obja);
            }
            v64 = *(void **)(*((void *)&v115 + 1) + 8 * i);
            id v65 = [v64 error];
            long long v66 = [v65 domain];
            if ([v66 isEqualToString:@"CoreDAVHTTPStatusErrorDomain"])
            {
              long long v67 = [v64 error];
              BOOL v68 = [v67 code] == 401;

              if (v68)
              {
                id v61 = v64;

                goto LABEL_86;
              }
            }
            else
            {
            }
          }
          uint64_t v60 = [obja countByEnumeratingWithState:&v115 objects:v126 count:16];
        }
        while (v60);
        id v61 = v89;
      }
LABEL_86:

      long long v74 = +[CoreDAVLogging sharedLogging];
      id v75 = objc_loadWeakRetained((id *)p_accountInfoProvider);
      long long v76 = [v74 logHandleForAccountInfoProvider:v75];

      if (v76)
      {
        long long v77 = v76;
        if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
        {
          uint64_t v78 = [v89 url];
          v79 = [v61 url];
          *(_DWORD *)buf = 138412546;
          long long v128 = v78;
          __int16 v129 = 2112;
          uint64_t v130 = (uint64_t)v79;
          _os_log_impl(&dword_213BFC000, v77, OS_LOG_TYPE_INFO, "CoreDAVDiscoveryTaskGroup.completeDiscovery:%@ failed, returning prior error %@.", buf, 0x16u);
        }
      }

      v80 = [v61 error];
      v113[0] = MEMORY[0x263EF8330];
      v113[1] = 3221225472;
      v113[2] = __53__CoreDAVDiscoveryTaskGroup_completeDiscovery_error___block_invoke_295;
      v113[3] = &unk_2641DFC88;
      v113[4] = self;
      id v114 = v61;
      id v81 = v61;
      [(CoreDAVTaskGroup *)self finishCoreDAVTaskGroupWithError:v80 delegateCallbackBlock:v113];
    }
    else
    {
      long long v69 = +[CoreDAVLogging sharedLogging];
      id v70 = objc_loadWeakRetained((id *)p_accountInfoProvider);
      long long v71 = [v69 logHandleForAccountInfoProvider:v70];

      if (v71)
      {
        long long v72 = v71;
        if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
        {
          long long v73 = [v99 url];
          *(_DWORD *)buf = 138412290;
          long long v128 = v73;
          _os_log_impl(&dword_213BFC000, v72, OS_LOG_TYPE_INFO, "CoreDAVDiscoveryTaskGroup.completeDiscovery:%@ failed, returning error.", buf, 0xCu);
        }
      }

      v111[0] = MEMORY[0x263EF8330];
      v111[1] = 3221225472;
      v111[2] = __53__CoreDAVDiscoveryTaskGroup_completeDiscovery_error___block_invoke_296;
      v111[3] = &unk_2641DFC88;
      v111[4] = self;
      id v112 = v97;
      [(CoreDAVTaskGroup *)self finishCoreDAVTaskGroupWithError:v112 delegateCallbackBlock:v111];
    }
  }
  else
  {
    uint64_t v25 = [v99 principalURL];
    BOOL v26 = v25 == 0;

    if (v26)
    {
      id v82 = [MEMORY[0x263F08690] currentHandler];
      [v82 handleFailureInMethod:a2 object:self file:@"CoreDAVDiscoveryTaskGroup.m" lineNumber:1043 description:@"Should not be here without a principal URL"];
    }
    [v99 setSuccess:1];
    v110[0] = MEMORY[0x263EF8330];
    v110[1] = 3221225472;
    v110[2] = __53__CoreDAVDiscoveryTaskGroup_completeDiscovery_error___block_invoke_300;
    v110[3] = &unk_2641DFC10;
    v110[4] = self;
    obuint64_t j = (id)MEMORY[0x216694110](v110);
    dispatch_time_t when = dispatch_time(0, 5000000000);
    if ([v100 count])
    {
      uint64_t v27 = +[CoreDAVLogging sharedLogging];
      id v28 = objc_loadWeakRetained((id *)p_accountInfoProvider);
      id v29 = [v27 logHandleForAccountInfoProvider:v28];

      if (v29)
      {
        uint64_t v30 = v29;
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          uint64_t v31 = [v100 count];
          *(_DWORD *)buf = 134217984;
          long long v128 = (const char *)v31;
          _os_log_impl(&dword_213BFC000, v30, OS_LOG_TYPE_INFO, "Principal information found. Tearing down %lu outstanding tasks", buf, 0xCu);
        }
      }
      uint64_t v32 = (void *)[(NSMutableSet *)self->super._outstandingTasks copy];
      long long v108 = 0u;
      long long v109 = 0u;
      long long v107 = 0u;
      long long v106 = 0u;
      id v33 = v32;
      uint64_t v34 = [v33 countByEnumeratingWithState:&v106 objects:v125 count:16];
      if (v34)
      {
        uint64_t v35 = *(void *)v107;
        do
        {
          for (uint64_t j = 0; j != v34; ++j)
          {
            if (*(void *)v107 != v35) {
              objc_enumerationMutation(v33);
            }
            __int16 v37 = *(void **)(*((void *)&v106 + 1) + 8 * j);
            id v38 = [v37 accountInfoProvider];
            int v39 = [v100 containsObject:v38];

            if (v39)
            {
              id v40 = [MEMORY[0x263F087E8] errorWithDomain:@"CoreDAVErrorDomain" code:1 userInfo:0];
              [v37 finishCoreDAVTaskWithError:v40];

              --v16;
            }
          }
          uint64_t v34 = [v33 countByEnumeratingWithState:&v106 objects:v125 count:16];
        }
        while (v34);
      }

      if (v16 != [v95 count])
      {
        __int16 v83 = [MEMORY[0x263F08690] currentHandler];
        [v83 handleFailureInMethod:a2 object:self file:@"CoreDAVDiscoveryTaskGroup.m" lineNumber:1073 description:@"A subsequent incomplete discovery was not cancelled"];
      }
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __53__CoreDAVDiscoveryTaskGroup_completeDiscovery_error___block_invoke_304;
      block[3] = &unk_2641DFD28;
      id v105 = obj;
      dispatch_after(when, MEMORY[0x263EF83A0], block);
    }
    else if ([v95 count])
    {
      long long v50 = +[CoreDAVLogging sharedLogging];
      id v51 = objc_loadWeakRetained((id *)p_accountInfoProvider);
      long long v52 = [v50 logHandleForAccountInfoProvider:v51];

      if (v52)
      {
        uint64_t v53 = v52;
        if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
        {
          uint64_t v54 = [v99 url];
          *(_DWORD *)buf = 138412546;
          long long v128 = v54;
          __int16 v129 = 2048;
          uint64_t v130 = v16;
          _os_log_impl(&dword_213BFC000, v53, OS_LOG_TYPE_INFO, "CoreDAVDiscoveryTaskGroup.completeDiscovery:%@ success, waiting for prior %lu incomplete.", buf, 0x16u);
        }
      }

      v101[0] = MEMORY[0x263EF8330];
      v101[1] = 3221225472;
      v101[2] = __53__CoreDAVDiscoveryTaskGroup_completeDiscovery_error___block_invoke_312;
      v101[3] = &unk_2641DFD28;
      id v102 = obj;
      dispatch_after(when, MEMORY[0x263EF83A0], v101);
    }
    else
    {
      if ([v96 count])
      {
        __int16 v85 = [MEMORY[0x263F08690] currentHandler];
        [v85 handleFailureInMethod:a2 object:self file:@"CoreDAVDiscoveryTaskGroup.m" lineNumber:1083 description:@"Prior successful discovery should have already cancelled this task"];
      }
      if (v16)
      {
        v86 = [MEMORY[0x263F08690] currentHandler];
        [v86 handleFailureInMethod:a2 object:self file:@"CoreDAVDiscoveryTaskGroup.m" lineNumber:1084 description:@"Some tasks have not been not cancelled"];
      }
      [(CoreDAVDiscoveryTaskGroup *)self setDiscoveredAccountInfo:v99];
      v55 = +[CoreDAVLogging sharedLogging];
      id v56 = objc_loadWeakRetained((id *)p_accountInfoProvider);
      uint64_t v57 = [v55 logHandleForAccountInfoProvider:v56];

      if (v57)
      {
        __int16 v58 = v57;
        if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
        {
          v59 = [v99 url];
          *(_DWORD *)buf = 138412290;
          long long v128 = v59;
          _os_log_impl(&dword_213BFC000, v58, OS_LOG_TYPE_INFO, "CoreDAVDiscoveryTaskGroup.completeDiscovery:%@ success, returning.", buf, 0xCu);
        }
      }

      v103[0] = MEMORY[0x263EF8330];
      v103[1] = 3221225472;
      v103[2] = __53__CoreDAVDiscoveryTaskGroup_completeDiscovery_error___block_invoke_311;
      v103[3] = &unk_2641DFC10;
      v103[4] = self;
      [(CoreDAVTaskGroup *)self finishCoreDAVTaskGroupWithError:0 delegateCallbackBlock:v103];
    }
  }
}

void __53__CoreDAVDiscoveryTaskGroup_completeDiscovery_error___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  id v2 = *(void **)(a1 + 32);
  v3 = [v2 discoveredAccountInfo];
  [v4 discoveryTask:v2 gotAccountInfo:v3 error:0];
}

void __53__CoreDAVDiscoveryTaskGroup_completeDiscovery_error___block_invoke_295(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = [*(id *)(a1 + 40) error];
  [v4 discoveryTask:v2 gotAccountInfo:0 error:v3];
}

void __53__CoreDAVDiscoveryTaskGroup_completeDiscovery_error___block_invoke_296(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 discoveryTask:*(void *)(a1 + 32) gotAccountInfo:0 error:*(void *)(a1 + 40)];
}

void __53__CoreDAVDiscoveryTaskGroup_completeDiscovery_error___block_invoke_300(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if ([*(id *)(*(void *)(a1 + 32) + 32) count])
  {
    id v2 = +[CoreDAVLogging sharedLogging];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
    id v4 = [v2 logHandleForAccountInfoProvider:WeakRetained];

    if (v4)
    {
      id v5 = v4;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 32) count];
        *(_DWORD *)buf = 134217984;
        uint64_t v21 = v6;
        _os_log_impl(&dword_213BFC000, v5, OS_LOG_TYPE_INFO, "Giving up on all outstanding tasks since we found some information already. Tearing down %lu outstanding tasks", buf, 0xCu);
      }
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 40) = 1;
    id v7 = (void *)[*(id *)(*(void *)(a1 + 32) + 32) copy];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v15 + 1) + 8 * v12);
          id v14 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"CoreDAVErrorDomain", 1, 0, (void)v15);
          [v13 finishCoreDAVTaskWithError:v14];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }
  }
}

uint64_t __53__CoreDAVDiscoveryTaskGroup_completeDiscovery_error___block_invoke_304(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __53__CoreDAVDiscoveryTaskGroup_completeDiscovery_error___block_invoke_311(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  id v2 = *(void **)(a1 + 32);
  v3 = [v2 discoveredAccountInfo];
  [v4 discoveryTask:v2 gotAccountInfo:v3 error:0];
}

uint64_t __53__CoreDAVDiscoveryTaskGroup_completeDiscovery_error___block_invoke_312(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)noteDefinitiveAuthFailureFromTask:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(CoreDAVDiscoveryTaskGroup *)self setShouldBailEarly:1];
  id v5 = +[CoreDAVLogging sharedLogging];
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  id v7 = [v5 logHandleForAccountInfoProvider:WeakRetained];

  if (v7 && os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213BFC000, v7, OS_LOG_TYPE_INFO, "Received definitive 401, canceling remaining tasks", buf, 2u);
  }

  id v8 = (void *)[(NSMutableSet *)self->super._outstandingTasks copy];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(id *)(*((void *)&v16 + 1) + 8 * v13);
        if (v14 != v4)
        {
          long long v15 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"CoreDAVErrorDomain", 1, 0, (void)v16);
          [v14 finishCoreDAVTaskWithError:v15];
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v11);
  }
}

- (id)propFindProperties
{
  id v2 = objc_alloc_init(CoreDAVItemParserMapping);
  [(CoreDAVItemParserMapping *)v2 setNameSpace:@"DAV:"];
  [(CoreDAVItemParserMapping *)v2 setName:@"current-user-principal"];
  [(CoreDAVItemParserMapping *)v2 setParseClass:objc_opt_class()];
  v3 = objc_alloc_init(CoreDAVItemParserMapping);
  [(CoreDAVItemParserMapping *)v3 setNameSpace:@"DAV:"];
  [(CoreDAVItemParserMapping *)v3 setName:@"resourcetype"];
  [(CoreDAVItemParserMapping *)v3 setParseClass:objc_opt_class()];
  id v4 = objc_alloc_init(CoreDAVItemParserMapping);
  [(CoreDAVItemParserMapping *)v4 setNameSpace:@"DAV:"];
  [(CoreDAVItemParserMapping *)v4 setName:@"principal-URL"];
  [(CoreDAVItemParserMapping *)v4 setParseClass:objc_opt_class()];
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", v2, v3, v4, 0);

  return v5;
}

- (id)extractPrincipalURLFromPropFindTask:(id)a3 error:(id *)a4
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [v6 multiStatus];
  id v8 = [v7 orderedResponses];

  id v9 = [v6 accountInfoProvider];

  if ([v8 count] == 1)
  {
    v55 = [v8 objectAtIndex:0];
    uint64_t v10 = [v55 successfulPropertiesToValues];
    uint64_t v54 = [v10 CDVObjectForKeyWithNameSpace:@"DAV:" andName:@"resourcetype"];
    uint64_t v11 = [v54 principal];
    if (v11)
    {
      uint64_t v12 = (void *)v11;
      p_accountInfoProvider = &self->super._accountInfoProvider;
      id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
      long long v15 = [WeakRetained serverRoot];

      if (v15)
      {
        long long v16 = +[CoreDAVLogging sharedLogging];
        id v17 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
        long long v18 = [v16 logHandleForAccountInfoProvider:v17];

        if (v18)
        {
          long long v19 = v18;
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            id v20 = objc_loadWeakRetained((id *)p_accountInfoProvider);
            uint64_t v21 = [v20 serverRoot];
            *(_DWORD *)buf = 138412290;
            uint64_t v57 = v21;
            _os_log_impl(&dword_213BFC000, v19, OS_LOG_TYPE_INFO, "Returning specified user principal [%@]", buf, 0xCu);
          }
        }

        if ([v9 port])
        {
          uint64_t v22 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "port"));
        }
        else
        {
          uint64_t v22 = 0;
        }
        id v44 = NSURL;
        __int16 v37 = [v9 scheme];
        BOOL v26 = [v9 host];
        id v45 = objc_loadWeakRetained((id *)p_accountInfoProvider);
        long long v46 = [v45 serverRoot];
        uint64_t v27 = [v44 CDVURLWithScheme:v37 host:v26 port:v22 path:v46];

        uint64_t v39 = 0;
        goto LABEL_44;
      }
    }
    id v28 = [v10 CDVObjectForKeyWithNameSpace:@"DAV:" andName:@"current-user-principal"];
    uint64_t v22 = v28;
    if (v28)
    {
      id v29 = [v28 unauthenticated];

      if (v29)
      {
        uint64_t v53 = a4;
        uint64_t v30 = +[CoreDAVLogging sharedLogging];
        id v31 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
        uint64_t v32 = [v30 logHandleForAccountInfoProvider:v31];

        if (v32 && os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_213BFC000, v32, OS_LOG_TYPE_DEFAULT, "Not authenticated to get current user principal", buf, 2u);
        }

        BOOL v26 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:");
        char v52 = 1;
LABEL_25:
        long long v36 = [v10 CDVObjectForKeyWithNameSpace:@"DAV:" andName:@"principal-URL"];
        __int16 v37 = v36;
        if (v36)
        {
          id v38 = [v36 href];
          uint64_t v27 = [v38 payloadAsFullURL];

          if (v27)
          {
            uint64_t v39 = 0;
            a4 = v53;
            goto LABEL_44;
          }
          id v40 = +[CoreDAVLogging sharedLogging];
          id v48 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
          uint64_t v42 = [v40 logHandleForAccountInfoProvider:v48];

          if (!v42 || !os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
LABEL_39:

            char v49 = v52;
            if (!v26) {
              char v49 = 0;
            }
            a4 = v53;
            if (v49)
            {
              uint64_t v27 = 0;
LABEL_45:

LABEL_46:
              if (!a4) {
                goto LABEL_49;
              }
              goto LABEL_47;
            }
            uint64_t v39 = [MEMORY[0x263F087E8] errorWithDomain:@"CoreDAVErrorDomain" code:8 userInfo:0];
            uint64_t v27 = 0;
LABEL_44:

            BOOL v26 = (void *)v39;
            goto LABEL_45;
          }
          *(_DWORD *)buf = 138412290;
          uint64_t v57 = v10;
          uint64_t v43 = "Could not find the href of the user's principal URL. Found properties: [%@]";
        }
        else
        {
          id v40 = +[CoreDAVLogging sharedLogging];
          id v41 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
          uint64_t v42 = [v40 logHandleForAccountInfoProvider:v41];

          if (!v42 || !os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_39;
          }
          *(_DWORD *)buf = 138412290;
          uint64_t v57 = v10;
          uint64_t v43 = "Could not find the user's principal URL. Found properties: [%@]";
        }
        _os_log_impl(&dword_213BFC000, v42, OS_LOG_TYPE_DEFAULT, v43, buf, 0xCu);
        goto LABEL_39;
      }
      long long v47 = [v22 href];
      uint64_t v27 = [v47 payloadAsFullURL];

      if (v27)
      {
        BOOL v26 = 0;
        goto LABEL_46;
      }
      uint64_t v53 = a4;
      id v33 = +[CoreDAVLogging sharedLogging];
      id v51 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
      uint64_t v35 = [v33 logHandleForAccountInfoProvider:v51];

      if (v35 && os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v57 = v22;
        _os_log_impl(&dword_213BFC000, v35, OS_LOG_TYPE_DEFAULT, "Could not find the current user principal's HREF.  Current user principal: [%@]", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v53 = a4;
      id v33 = +[CoreDAVLogging sharedLogging];
      id v34 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
      uint64_t v35 = [v33 logHandleForAccountInfoProvider:v34];

      if (v35 && os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v57 = v10;
        _os_log_impl(&dword_213BFC000, v35, OS_LOG_TYPE_DEFAULT, "Could not find the current user principal. Found properties: [%@]", buf, 0xCu);
      }
    }

    BOOL v26 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:");
    char v52 = 0;
    goto LABEL_25;
  }
  __int16 v23 = +[CoreDAVLogging sharedLogging];
  id v24 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
  uint64_t v25 = [v23 logHandleForAccountInfoProvider:v24];

  if (v25 && os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v57 = v8;
    _os_log_impl(&dword_213BFC000, v25, OS_LOG_TYPE_DEFAULT, "We must have exactly one user principal for an account.  Parsed responses: [%@]", buf, 0xCu);
  }

  BOOL v26 = [MEMORY[0x263F087E8] errorWithDomain:@"CoreDAVErrorDomain" code:8 userInfo:0];
  uint64_t v27 = 0;
  if (a4)
  {
LABEL_47:
    if (v26) {
      *a4 = v26;
    }
  }
LABEL_49:

  return v27;
}

- (id)cleanedStringsFromResponseHeaders:(id)a3 forHeader:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v18 = a4;
  id v6 = objc_msgSend(v5, "CDVObjectForKeyCaseInsensitive:");
  id v7 = [v6 lowercaseString];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = [v7 componentsSeparatedByString:@","];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = 0;
    uint64_t v12 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v8);
        }
        id v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        long long v15 = [MEMORY[0x263F08708] whitespaceCharacterSet];
        long long v16 = [v14 stringByTrimmingCharactersInSet:v15];

        if ([v16 length])
        {
          if (v11)
          {
            [v11 addObject:v16];
          }
          else
          {
            uint64_t v11 = [MEMORY[0x263EFF9C0] setWithObject:v16];
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (void)addToDiscoveryArray:(id *)a3 discovery:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  if (a3)
  {
    id v7 = v5;
    if (*a3)
    {
      id v5 = (id)[*a3 addObject:v5];
      id v6 = v7;
    }
    else
    {
      id v5 = [MEMORY[0x263EFF980] arrayWithObject:v5];
      id v6 = v7;
      *a3 = v5;
    }
  }
  MEMORY[0x270F9A758](v5, v6);
}

- (void)getDiscoveryStatus:(id)a3 priorFailed:(id *)a4 subsequentFailed:(id *)a5 priorIncomplete:(id *)a6 subsequentIncomplete:(id *)a7 priorSuccess:(id *)a8 subsequentSuccess:(id *)a9
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v15 = a3;
  if (a4) {
    *a4 = 0;
  }
  if (a5) {
    *a5 = 0;
  }
  if (a6) {
    *a6 = 0;
  }
  if (a7) {
    *a7 = 0;
  }
  if (a8) {
    *a8 = 0;
  }
  id v29 = a4;
  if (a9) {
    *a9 = 0;
  }
  BOOL v26 = a6;
  long long v16 = a5;
  uint64_t v27 = a7;
  id v28 = a8;
  obuint64_t j = self->_discoveries;
  objc_sync_enter(obj);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v17 = self->_discoveries;
  uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v18)
  {
    char v19 = 0;
    uint64_t v20 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v31 != v20) {
          objc_enumerationMutation(v17);
        }
        id v22 = *(id *)(*((void *)&v30 + 1) + 8 * i);
        if (v22 == v15)
        {
          char v19 = 1;
        }
        else if ([*(id *)(*((void *)&v30 + 1) + 8 * i) started])
        {
          __int16 v23 = [v22 error];

          if (v23)
          {
            if (v19) {
              uint64_t v24 = v16;
            }
            else {
              uint64_t v24 = v29;
            }
          }
          else if ([v22 success])
          {
            if (v19) {
              uint64_t v24 = a9;
            }
            else {
              uint64_t v24 = v28;
            }
          }
          else if (v19)
          {
            uint64_t v24 = v27;
          }
          else
          {
            uint64_t v24 = v26;
          }
          -[CoreDAVDiscoveryTaskGroup addToDiscoveryArray:discovery:](self, "addToDiscoveryArray:discovery:", v24, v22, obj);
        }
      }
      uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v18);
  }

  objc_sync_exit(obj);
}

- (BOOL)didReceiveAuthenticationError
{
  return self->_didReceiveAuthenticationError;
}

- (void)setDidReceiveAuthenticationError:(BOOL)a3
{
  self->_didReceiveAuthenticationError = a3;
}

- (BOOL)shouldBailEarly
{
  return self->_shouldBailEarly;
}

- (void)setShouldBailEarly:(BOOL)a3
{
  self->_shouldBailEarly = a3;
}

- (CoreDAVAccountInfoProvider)discoveredAccountInfo
{
  return self->_discoveredAccountInfo;
}

- (void)setDiscoveredAccountInfo:(id)a3
{
}

- (NSString)wellKnownPath
{
  return self->_wellKnownPath;
}

- (void)setWellKnownPath:(id)a3
{
}

- (NSArray)potentialContextPaths
{
  return self->_potentialContextPaths;
}

- (void)setPotentialContextPaths:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discoveredAccountInfo, 0);
  objc_storeStrong((id *)&self->_discoveries, 0);
  objc_storeStrong((id *)&self->_potentialContextPaths, 0);
  objc_storeStrong((id *)&self->_wellKnownPath, 0);
  objc_storeStrong((id *)&self->_httpsServiceString, 0);
  objc_storeStrong((id *)&self->_httpServiceString, 0);
  objc_storeStrong((id *)&self->_httpsPorts, 0);
  objc_storeStrong((id *)&self->_httpPorts, 0);
  objc_storeStrong((id *)&self->_requiredComplianceClass, 0);
}

@end