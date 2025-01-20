@interface NWCandidatePathMonitor
- (NSArray)candidatePaths;
- (NSArray)interfaces;
- (NSArray)remoteEndpoints;
- (NSMutableDictionary)candidatePathEvaluators;
- (NWCandidatePathMonitor)init;
- (NWCandidatePathMonitor)initWithParameters:(id)a3;
- (NWParameters)parameters;
- (OS_dispatch_queue)queue;
- (OS_nw_path_evaluator)primaryEvaluator;
- (id)cParameters;
- (id)interfacesLocked;
- (id)updateHandler;
- (void)cancelCandidatePathEvaluators;
- (void)cancelWithHandler:(id)a3;
- (void)dealloc;
- (void)resetCandidatePathEvaluators;
- (void)setCandidatePathEvaluators:(id)a3;
- (void)setPrimaryEvaluator:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRemoteEndpoints:(id)a3;
- (void)setUpdateHandler:(id)a3;
- (void)startWithQueue:(id)a3 updateHandler:(id)a4;
- (void)updateRemoteEndpoints:(id)a3;
@end

@implementation NWCandidatePathMonitor

void __55__NWCandidatePathMonitor_cancelCandidatePathEvaluators__block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v2 = [*(id *)(a1 + 32) candidatePathEvaluators];
  v3 = [v2 allKeys];

  obuint64_t j = v3;
  uint64_t v18 = [v3 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v18)
  {
    uint64_t v17 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        v7 = [*(id *)(a1 + 32) candidatePathEvaluators];
        v8 = [v7 objectForKeyedSubscript:v6];

        long long v21 = 0u;
        long long v22 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        v9 = [v8 allKeys];
        uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v20;
          do
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v20 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * j);
              v15 = [v8 objectForKeyedSubscript:v14];
              nw_path_evaluator_cancel(v15);
              [v8 setObject:0 forKeyedSubscript:v14];
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }
          while (v11);
        }

        v5 = [*(id *)(a1 + 32) candidatePathEvaluators];
        [v5 setObject:0 forKeyedSubscript:v6];
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v18);
  }
}

- (void)startWithQueue:(id)a3 updateHandler:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6)
  {
    uint64_t v11 = __nwlog_obj();
    *(_DWORD *)location = 136446210;
    *(void *)&location[4] = "-[NWCandidatePathMonitor startWithQueue:updateHandler:]";
    uint64_t v12 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v27 = 0;
    if (!__nwlog_fault(v12, &type, &v27)) {
      goto LABEL_38;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      v13 = __nwlog_obj();
      os_log_type_t v14 = type;
      if (os_log_type_enabled(v13, type))
      {
        *(_DWORD *)location = 136446210;
        *(void *)&location[4] = "-[NWCandidatePathMonitor startWithQueue:updateHandler:]";
        _os_log_impl(&dword_1830D4000, v13, v14, "%{public}s called with null queue", location, 0xCu);
      }
    }
    else if (v27)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      v13 = __nwlog_obj();
      os_log_type_t v18 = type;
      BOOL v19 = os_log_type_enabled(v13, type);
      if (backtrace_string)
      {
        if (v19)
        {
          *(_DWORD *)location = 136446466;
          *(void *)&location[4] = "-[NWCandidatePathMonitor startWithQueue:updateHandler:]";
          __int16 v30 = 2082;
          v31 = backtrace_string;
          _os_log_impl(&dword_1830D4000, v13, v18, "%{public}s called with null queue, dumping backtrace:%{public}s", location, 0x16u);
        }

        free(backtrace_string);
LABEL_38:
        if (!v12) {
          goto LABEL_4;
        }
LABEL_39:
        free(v12);
        goto LABEL_4;
      }
      if (v19)
      {
        *(_DWORD *)location = 136446210;
        *(void *)&location[4] = "-[NWCandidatePathMonitor startWithQueue:updateHandler:]";
        _os_log_impl(&dword_1830D4000, v13, v18, "%{public}s called with null queue, no backtrace", location, 0xCu);
      }
    }
    else
    {
      v13 = __nwlog_obj();
      os_log_type_t v23 = type;
      if (os_log_type_enabled(v13, type))
      {
        *(_DWORD *)location = 136446210;
        *(void *)&location[4] = "-[NWCandidatePathMonitor startWithQueue:updateHandler:]";
        _os_log_impl(&dword_1830D4000, v13, v23, "%{public}s called with null queue, backtrace limit exceeded", location, 0xCu);
      }
    }
LABEL_37:

    goto LABEL_38;
  }
  if (v7)
  {
    [(NWCandidatePathMonitor *)self setQueue:v6];
    [(NWCandidatePathMonitor *)self setUpdateHandler:v8];
    objc_initWeak((id *)location, self);
    v9 = [(NWCandidatePathMonitor *)self primaryEvaluator];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __55__NWCandidatePathMonitor_startWithQueue_updateHandler___block_invoke;
    v25[3] = &unk_1E524B478;
    objc_copyWeak(&v26, (id *)location);
    nw_path_evaluator_set_update_handler(v9, v6, v25);

    uint64_t v10 = [(NWCandidatePathMonitor *)self primaryEvaluator];
    nw_path_evaluator_call_update_handler(v10);

    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)location);
    goto LABEL_4;
  }
  v15 = __nwlog_obj();
  *(_DWORD *)location = 136446210;
  *(void *)&location[4] = "-[NWCandidatePathMonitor startWithQueue:updateHandler:]";
  uint64_t v12 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v27 = 0;
  if (!__nwlog_fault(v12, &type, &v27)) {
    goto LABEL_38;
  }
  if (type == OS_LOG_TYPE_FAULT)
  {
    v13 = __nwlog_obj();
    os_log_type_t v16 = type;
    if (os_log_type_enabled(v13, type))
    {
      *(_DWORD *)location = 136446210;
      *(void *)&location[4] = "-[NWCandidatePathMonitor startWithQueue:updateHandler:]";
      _os_log_impl(&dword_1830D4000, v13, v16, "%{public}s called with null updateHandler", location, 0xCu);
    }
    goto LABEL_37;
  }
  if (!v27)
  {
    v13 = __nwlog_obj();
    os_log_type_t v24 = type;
    if (os_log_type_enabled(v13, type))
    {
      *(_DWORD *)location = 136446210;
      *(void *)&location[4] = "-[NWCandidatePathMonitor startWithQueue:updateHandler:]";
      _os_log_impl(&dword_1830D4000, v13, v24, "%{public}s called with null updateHandler, backtrace limit exceeded", location, 0xCu);
    }
    goto LABEL_37;
  }
  long long v20 = (char *)__nw_create_backtrace_string();
  v13 = __nwlog_obj();
  os_log_type_t v21 = type;
  BOOL v22 = os_log_type_enabled(v13, type);
  if (!v20)
  {
    if (v22)
    {
      *(_DWORD *)location = 136446210;
      *(void *)&location[4] = "-[NWCandidatePathMonitor startWithQueue:updateHandler:]";
      _os_log_impl(&dword_1830D4000, v13, v21, "%{public}s called with null updateHandler, no backtrace", location, 0xCu);
    }
    goto LABEL_37;
  }
  if (v22)
  {
    *(_DWORD *)location = 136446466;
    *(void *)&location[4] = "-[NWCandidatePathMonitor startWithQueue:updateHandler:]";
    __int16 v30 = 2082;
    v31 = v20;
    _os_log_impl(&dword_1830D4000, v13, v21, "%{public}s called with null updateHandler, dumping backtrace:%{public}s", location, 0x16u);
  }

  free(v20);
  if (v12) {
    goto LABEL_39;
  }
LABEL_4:
}

- (void)resetCandidatePathEvaluators
{
  uint64_t v184 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_owner(&self->lock);
  val = self;
  v3 = [(NWCandidatePathMonitor *)self primaryEvaluator];
  v4 = nw_path_evaluator_copy_path(v3);

  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  enumerate_block[0] = MEMORY[0x1E4F143A8];
  enumerate_block[1] = 3221225472;
  enumerate_block[2] = __54__NWCandidatePathMonitor_resetCandidatePathEvaluators__block_invoke;
  enumerate_block[3] = &unk_1E523E1E8;
  id v98 = v5;
  id v167 = v98;
  v95 = v4;
  nw_path_enumerate_interfaces(v4, enumerate_block);
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  id v7 = [(NWCandidatePathMonitor *)val candidatePathEvaluators];
  v8 = [v7 allKeys];
  v97 = [v6 setWithArray:v8];

  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v9 = (id)gLogObj;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
  }
  else
  {
    BOOL v10 = gLogFDOverride == -1;

    if (v10) {
      goto LABEL_23;
    }
  }
  long long v164 = 0u;
  long long v165 = 0u;
  long long v162 = 0u;
  long long v163 = 0u;
  id v11 = v98;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v162 objects:v183 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v163;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v163 != v13) {
          objc_enumerationMutation(v11);
        }
        v15 = *(void **)(*((void *)&v162 + 1) + 8 * i);
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        os_log_type_t v16 = (id)gLogObj;
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v17 = [v15 internalInterface];
          *(_DWORD *)buf = 136446466;
          v175 = "-[NWCandidatePathMonitor resetCandidatePathEvaluators]";
          __int16 v176 = 2112;
          v177 = v17;
          _os_log_impl(&dword_1830D4000, v16, OS_LOG_TYPE_DEBUG, "%{public}s Current interface: %@", buf, 0x16u);
        }
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v162 objects:v183 count:16];
    }
    while (v12);
  }

  long long v160 = 0u;
  long long v161 = 0u;
  long long v158 = 0u;
  long long v159 = 0u;
  id v18 = v97;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v158 objects:v182 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v159;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v159 != v20) {
          objc_enumerationMutation(v18);
        }
        BOOL v22 = *(void **)(*((void *)&v158 + 1) + 8 * j);
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        os_log_type_t v23 = (id)gLogObj;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          os_log_type_t v24 = [v22 internalInterface];
          *(_DWORD *)buf = 136446466;
          v175 = "-[NWCandidatePathMonitor resetCandidatePathEvaluators]";
          __int16 v176 = 2112;
          v177 = v24;
          _os_log_impl(&dword_1830D4000, v23, OS_LOG_TYPE_DEBUG, "%{public}s Existing interface: %@", buf, 0x16u);
        }
      }
      uint64_t v19 = [v18 countByEnumeratingWithState:&v158 objects:v182 count:16];
    }
    while (v19);
  }

LABEL_23:
  long long v25 = (void *)[v98 mutableCopy];
  [v25 minusSet:v97];
  v103 = (void *)[v97 mutableCopy];
  [v103 minusSet:v98];
  v101 = (void *)[v97 mutableCopy];
  [v101 intersectSet:v98];
  objc_initWeak(&location, val);
  parameters = [(NWCandidatePathMonitor *)val cParameters];
  long long v155 = 0u;
  long long v156 = 0u;
  long long v153 = 0u;
  long long v154 = 0u;
  obuint64_t j = v25;
  uint64_t v109 = [obj countByEnumeratingWithState:&v153 objects:v181 count:16];
  if (v109)
  {
    id v107 = *(id *)v154;
    do
    {
      for (uint64_t k = 0; k != v109; ++k)
      {
        if (*(id *)v154 != v107) {
          objc_enumerationMutation(obj);
        }
        id v26 = *(void **)(*((void *)&v153 + 1) + 8 * k);
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        char v27 = (id)gLogObj;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          v28 = [v26 internalInterface];
          *(_DWORD *)buf = 136446466;
          v175 = "-[NWCandidatePathMonitor resetCandidatePathEvaluators]";
          __int16 v176 = 2112;
          v177 = v28;
          _os_log_impl(&dword_1830D4000, v27, OS_LOG_TYPE_DEBUG, "%{public}s Adding interface %@", buf, 0x16u);
        }
        id v117 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        long long v151 = 0u;
        long long v152 = 0u;
        long long v149 = 0u;
        long long v150 = 0u;
        uint64_t v29 = [(NWCandidatePathMonitor *)val remoteEndpoints];
        uint64_t v30 = [v29 countByEnumeratingWithState:&v149 objects:v180 count:16];
        if (v30)
        {
          uint64_t v31 = *(void *)v150;
          v114 = v29;
          do
          {
            for (uint64_t m = 0; m != v30; ++m)
            {
              if (*(void *)v150 != v31) {
                objc_enumerationMutation(v114);
              }
              v33 = *(void **)(*((void *)&v149 + 1) + 8 * m);
              pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
              networkd_settings_init();
              v34 = (id)gLogObj;
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
              {
                v35 = [v26 internalInterface];
                *(_DWORD *)buf = 136446722;
                v175 = "-[NWCandidatePathMonitor resetCandidatePathEvaluators]";
                __int16 v176 = 2112;
                v177 = v33;
                __int16 v178 = 2112;
                v179 = v35;
                _os_log_impl(&dword_1830D4000, v34, OS_LOG_TYPE_DEBUG, "%{public}s Adding %@ over interface %@", buf, 0x20u);
              }
              v36 = [v33 internalEndpoint];
              v37 = nw_parameters_copy(parameters);
              v38 = [v26 internalInterface];
              nw_parameters_require_interface(v37, v38);

              evaluator_for_endpoint = nw_path_create_evaluator_for_endpoint(v36, v37);
              v40 = [(NWCandidatePathMonitor *)val queue];
              v147[0] = MEMORY[0x1E4F143A8];
              v147[1] = 3221225472;
              v147[2] = __54__NWCandidatePathMonitor_resetCandidatePathEvaluators__block_invoke_8;
              v147[3] = &unk_1E524B478;
              objc_copyWeak(&v148, &location);
              nw_path_evaluator_set_update_handler(evaluator_for_endpoint, v40, v147);

              [v117 setObject:evaluator_for_endpoint forKeyedSubscript:v33];
              objc_destroyWeak(&v148);
            }
            uint64_t v29 = v114;
            uint64_t v30 = [v114 countByEnumeratingWithState:&v149 objects:v180 count:16];
          }
          while (v30);
        }

        v41 = [(NWCandidatePathMonitor *)val candidatePathEvaluators];
        [v41 setObject:v117 forKeyedSubscript:v26];
      }
      uint64_t v109 = [obj countByEnumeratingWithState:&v153 objects:v181 count:16];
    }
    while (v109);
  }

  long long v145 = 0u;
  long long v146 = 0u;
  long long v143 = 0u;
  long long v144 = 0u;
  id v108 = v103;
  uint64_t v115 = [v108 countByEnumeratingWithState:&v143 objects:v173 count:16];
  if (v115)
  {
    uint64_t v113 = *(void *)v144;
    do
    {
      for (to = 0; to != (id *)v115; to = (id *)((char *)to + 1))
      {
        if (*(void *)v144 != v113) {
          objc_enumerationMutation(v108);
        }
        v42 = *(void **)(*((void *)&v143 + 1) + 8 * (void)to);
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v43 = (id)gLogObj;
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
        {
          v44 = [v42 internalInterface];
          *(_DWORD *)buf = 136446466;
          v175 = "-[NWCandidatePathMonitor resetCandidatePathEvaluators]";
          __int16 v176 = 2112;
          v177 = v44;
          _os_log_impl(&dword_1830D4000, v43, OS_LOG_TYPE_DEBUG, "%{public}s Removing interface %@", buf, 0x16u);
        }
        v45 = [(NWCandidatePathMonitor *)val candidatePathEvaluators];
        v46 = [v45 objectForKeyedSubscript:v42];

        long long v141 = 0u;
        long long v142 = 0u;
        long long v139 = 0u;
        long long v140 = 0u;
        v47 = [v46 allKeys];
        uint64_t v48 = [v47 countByEnumeratingWithState:&v139 objects:v172 count:16];
        if (v48)
        {
          uint64_t v49 = *(void *)v140;
          do
          {
            for (uint64_t n = 0; n != v48; ++n)
            {
              if (*(void *)v140 != v49) {
                objc_enumerationMutation(v47);
              }
              v51 = *(void **)(*((void *)&v139 + 1) + 8 * n);
              pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
              networkd_settings_init();
              v52 = (id)gLogObj;
              if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
              {
                v53 = [v42 internalInterface];
                *(_DWORD *)buf = 136446722;
                v175 = "-[NWCandidatePathMonitor resetCandidatePathEvaluators]";
                __int16 v176 = 2112;
                v177 = v51;
                __int16 v178 = 2112;
                v179 = v53;
                _os_log_impl(&dword_1830D4000, v52, OS_LOG_TYPE_DEBUG, "%{public}s Removing %@ from interface %@", buf, 0x20u);
              }
              v54 = [v46 objectForKeyedSubscript:v51];
              nw_path_evaluator_cancel(v54);
              [v46 setObject:0 forKeyedSubscript:v51];
            }
            uint64_t v48 = [v47 countByEnumeratingWithState:&v139 objects:v172 count:16];
          }
          while (v48);
        }

        v55 = [(NWCandidatePathMonitor *)val candidatePathEvaluators];
        [v55 setObject:0 forKeyedSubscript:v42];
      }
      uint64_t v115 = [v108 countByEnumeratingWithState:&v143 objects:v173 count:16];
    }
    while (v115);
  }

  v56 = (void *)MEMORY[0x1E4F1CAD0];
  v57 = [(NWCandidatePathMonitor *)val remoteEndpoints];
  v104 = [v56 setWithArray:v57];

  long long v137 = 0u;
  long long v138 = 0u;
  long long v135 = 0u;
  long long v136 = 0u;
  id v96 = v101;
  uint64_t v100 = [v96 countByEnumeratingWithState:&v135 objects:v171 count:16];
  if (v100)
  {
    uint64_t v99 = *(void *)v136;
    do
    {
      for (iuint64_t i = 0; ii != v100; ++ii)
      {
        if (*(void *)v136 != v99) {
          objc_enumerationMutation(v96);
        }
        v118 = *(void **)(*((void *)&v135 + 1) + 8 * ii);
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v58 = (id)gLogObj;
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
        {
          v59 = [v118 internalInterface];
          *(_DWORD *)buf = 136446466;
          v175 = "-[NWCandidatePathMonitor resetCandidatePathEvaluators]";
          __int16 v176 = 2112;
          v177 = v59;
          _os_log_impl(&dword_1830D4000, v58, OS_LOG_TYPE_DEBUG, "%{public}s Keeping interface %@", buf, 0x16u);
        }
        v60 = [(NWCandidatePathMonitor *)val candidatePathEvaluators];
        v61 = [v60 objectForKeyedSubscript:v118];

        v62 = (void *)MEMORY[0x1E4F1CAD0];
        v63 = [v61 allKeys];
        v110 = [v62 setWithArray:v63];

        v64 = (void *)[v104 mutableCopy];
        [v64 minusSet:v110];
        v65 = (void *)[v110 mutableCopy];
        [v65 minusSet:v104];
        v102 = v65;
        long long v133 = 0u;
        long long v134 = 0u;
        long long v131 = 0u;
        long long v132 = 0u;
        id v112 = v64;
        uint64_t v66 = [v112 countByEnumeratingWithState:&v131 objects:v170 count:16];
        if (v66)
        {
          uint64_t v67 = *(void *)v132;
          do
          {
            for (juint64_t j = 0; jj != v66; ++jj)
            {
              if (*(void *)v132 != v67) {
                objc_enumerationMutation(v112);
              }
              v69 = *(void **)(*((void *)&v131 + 1) + 8 * jj);
              pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
              networkd_settings_init();
              v70 = (id)gLogObj;
              if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
              {
                v71 = [v118 internalInterface];
                *(_DWORD *)buf = 136446722;
                v175 = "-[NWCandidatePathMonitor resetCandidatePathEvaluators]";
                __int16 v176 = 2112;
                v177 = v69;
                __int16 v178 = 2112;
                v179 = v71;
                _os_log_impl(&dword_1830D4000, v70, OS_LOG_TYPE_DEBUG, "%{public}s Adding %@ over interface %@", buf, 0x20u);
              }
              v72 = [v69 internalEndpoint];
              v73 = nw_parameters_copy(parameters);
              v74 = [v118 internalInterface];
              nw_parameters_require_interface(v73, v74);

              v75 = nw_path_create_evaluator_for_endpoint(v72, v73);
              v76 = [(NWCandidatePathMonitor *)val queue];
              v129[0] = MEMORY[0x1E4F143A8];
              v129[1] = 3221225472;
              v129[2] = __54__NWCandidatePathMonitor_resetCandidatePathEvaluators__block_invoke_10;
              v129[3] = &unk_1E524B478;
              objc_copyWeak(&v130, &location);
              nw_path_evaluator_set_update_handler(v75, v76, v129);

              [v61 setObject:v75 forKeyedSubscript:v69];
              objc_destroyWeak(&v130);
            }
            uint64_t v66 = [v112 countByEnumeratingWithState:&v131 objects:v170 count:16];
          }
          while (v66);
        }

        long long v127 = 0u;
        long long v128 = 0u;
        long long v125 = 0u;
        long long v126 = 0u;
        id v77 = v102;
        uint64_t v78 = [v77 countByEnumeratingWithState:&v125 objects:v169 count:16];
        if (v78)
        {
          uint64_t v79 = *(void *)v126;
          do
          {
            for (uint64_t kk = 0; kk != v78; ++kk)
            {
              if (*(void *)v126 != v79) {
                objc_enumerationMutation(v77);
              }
              v81 = *(void **)(*((void *)&v125 + 1) + 8 * kk);
              pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
              networkd_settings_init();
              v82 = (id)gLogObj;
              if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG))
              {
                v83 = [v118 internalInterface];
                *(_DWORD *)buf = 136446722;
                v175 = "-[NWCandidatePathMonitor resetCandidatePathEvaluators]";
                __int16 v176 = 2112;
                v177 = v81;
                __int16 v178 = 2112;
                v179 = v83;
                _os_log_impl(&dword_1830D4000, v82, OS_LOG_TYPE_DEBUG, "%{public}s Removing %@ from interface %@", buf, 0x20u);
              }
              v84 = [v61 objectForKeyedSubscript:v81];
              nw_path_evaluator_cancel(v84);
              [v61 setObject:0 forKeyedSubscript:v81];
            }
            uint64_t v78 = [v77 countByEnumeratingWithState:&v125 objects:v169 count:16];
          }
          while (v78);
        }

        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v85 = (id)gLogObj;
        if (os_log_type_enabled(v85, OS_LOG_TYPE_DEBUG))
        {
        }
        else
        {
          BOOL v86 = gLogFDOverride == -1;

          if (v86) {
            goto LABEL_97;
          }
        }
        v87 = (void *)[v110 mutableCopy];
        [v87 intersectSet:v104];
        long long v123 = 0u;
        long long v124 = 0u;
        long long v121 = 0u;
        long long v122 = 0u;
        id v88 = v87;
        uint64_t v89 = [v88 countByEnumeratingWithState:&v121 objects:v168 count:16];
        if (v89)
        {
          uint64_t v90 = *(void *)v122;
          do
          {
            for (muint64_t m = 0; mm != v89; ++mm)
            {
              if (*(void *)v122 != v90) {
                objc_enumerationMutation(v88);
              }
              v92 = *(void **)(*((void *)&v121 + 1) + 8 * mm);
              pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
              networkd_settings_init();
              v93 = (id)gLogObj;
              if (os_log_type_enabled(v93, OS_LOG_TYPE_DEBUG))
              {
                v94 = [v118 internalInterface];
                *(_DWORD *)buf = 136446722;
                v175 = "-[NWCandidatePathMonitor resetCandidatePathEvaluators]";
                __int16 v176 = 2112;
                v177 = v92;
                __int16 v178 = 2112;
                v179 = v94;
                _os_log_impl(&dword_1830D4000, v93, OS_LOG_TYPE_DEBUG, "%{public}s Keeping %@ on interface %@", buf, 0x20u);
              }
            }
            uint64_t v89 = [v88 countByEnumeratingWithState:&v121 objects:v168 count:16];
          }
          while (v89);
        }

LABEL_97:
      }
      uint64_t v100 = [v96 countByEnumeratingWithState:&v135 objects:v171 count:16];
    }
    while (v100);
  }

  objc_destroyWeak(&location);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong((id *)&self->_candidatePathEvaluators, 0);
  objc_storeStrong((id *)&self->_remoteEndpoints, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_primaryEvaluator, 0);
}

- (void)setUpdateHandler:(id)a3
{
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (void)setCandidatePathEvaluators:(id)a3
{
}

- (NSMutableDictionary)candidatePathEvaluators
{
  return self->_candidatePathEvaluators;
}

- (void)setRemoteEndpoints:(id)a3
{
}

- (NSArray)remoteEndpoints
{
  return self->_remoteEndpoints;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setPrimaryEvaluator:(id)a3
{
}

- (OS_nw_path_evaluator)primaryEvaluator
{
  return self->_primaryEvaluator;
}

- (void)updateRemoteEndpoints:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __48__NWCandidatePathMonitor_updateRemoteEndpoints___block_invoke;
    v15[3] = &unk_1E524B9A0;
    v15[4] = self;
    id v16 = v4;
    p_locuint64_t k = &self->lock;
    id v7 = self;
    os_unfair_lock_lock(p_lock);
    __48__NWCandidatePathMonitor_updateRemoteEndpoints___block_invoke((uint64_t)v15);
    os_unfair_lock_unlock(p_lock);

    goto LABEL_3;
  }
  v8 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  uint64_t v20 = "-[NWCandidatePathMonitor updateRemoteEndpoints:]";
  v9 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t v18 = OS_LOG_TYPE_ERROR;
  char v17 = 0;
  if (__nwlog_fault(v9, &v18, &v17))
  {
    if (v18 == OS_LOG_TYPE_FAULT)
    {
      BOOL v10 = __nwlog_obj();
      os_log_type_t v11 = v18;
      if (os_log_type_enabled(v10, v18))
      {
        *(_DWORD *)buf = 136446210;
        uint64_t v20 = "-[NWCandidatePathMonitor updateRemoteEndpoints:]";
        uint64_t v12 = "%{public}s called with null remoteEndpoints";
LABEL_17:
        _os_log_impl(&dword_1830D4000, v10, v11, v12, buf, 0xCu);
      }
    }
    else
    {
      if (v17)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        BOOL v10 = __nwlog_obj();
        os_log_type_t v11 = v18;
        BOOL v14 = os_log_type_enabled(v10, v18);
        if (backtrace_string)
        {
          if (v14)
          {
            *(_DWORD *)buf = 136446466;
            uint64_t v20 = "-[NWCandidatePathMonitor updateRemoteEndpoints:]";
            __int16 v21 = 2082;
            BOOL v22 = backtrace_string;
            _os_log_impl(&dword_1830D4000, v10, v11, "%{public}s called with null remoteEndpoints, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_19;
        }
        if (!v14) {
          goto LABEL_18;
        }
        *(_DWORD *)buf = 136446210;
        uint64_t v20 = "-[NWCandidatePathMonitor updateRemoteEndpoints:]";
        uint64_t v12 = "%{public}s called with null remoteEndpoints, no backtrace";
        goto LABEL_17;
      }
      BOOL v10 = __nwlog_obj();
      os_log_type_t v11 = v18;
      if (os_log_type_enabled(v10, v18))
      {
        *(_DWORD *)buf = 136446210;
        uint64_t v20 = "-[NWCandidatePathMonitor updateRemoteEndpoints:]";
        uint64_t v12 = "%{public}s called with null remoteEndpoints, backtrace limit exceeded";
        goto LABEL_17;
      }
    }
LABEL_18:
  }
LABEL_19:
  if (v9) {
    free(v9);
  }
LABEL_3:
}

uint64_t __48__NWCandidatePathMonitor_updateRemoteEndpoints___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setRemoteEndpoints:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);

  return [v2 resetCandidatePathEvaluators];
}

- (NSArray)candidatePaths
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __40__NWCandidatePathMonitor_candidatePaths__block_invoke;
  v10[3] = &unk_1E524B9A0;
  v10[4] = self;
  id v4 = v3;
  id v11 = v4;
  p_locuint64_t k = &self->lock;
  id v6 = self;
  os_unfair_lock_lock(p_lock);
  __40__NWCandidatePathMonitor_candidatePaths__block_invoke((uint64_t)v10);
  os_unfair_lock_unlock(p_lock);

  id v7 = v11;
  v8 = (NSArray *)v4;

  return v8;
}

void __40__NWCandidatePathMonitor_candidatePaths__block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  obuint64_t j = [*(id *)(a1 + 32) interfacesLocked];
  uint64_t v19 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v19)
  {
    uint64_t v18 = *(void *)v26;
    do
    {
      uint64_t v2 = 0;
      do
      {
        if (*(void *)v26 != v18)
        {
          uint64_t v3 = v2;
          objc_enumerationMutation(obj);
          uint64_t v2 = v3;
        }
        uint64_t v20 = v2;
        uint64_t v4 = *(void *)(*((void *)&v25 + 1) + 8 * v2);
        id v5 = [*(id *)(a1 + 32) candidatePathEvaluators];
        id v6 = [v5 objectForKeyedSubscript:v4];

        if (v6)
        {
          long long v23 = 0u;
          long long v24 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          id v7 = [v6 allKeys];
          uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
          if (v8)
          {
            uint64_t v9 = *(void *)v22;
            do
            {
              for (uint64_t i = 0; i != v8; ++i)
              {
                if (*(void *)v22 != v9) {
                  objc_enumerationMutation(v7);
                }
                id v11 = [v6 objectForKeyedSubscript:*(void *)(*((void *)&v21 + 1) + 8 * i)];
                uint64_t v12 = v11;
                if (v11)
                {
                  uint64_t v13 = v11;
                  os_unfair_lock_lock(v12 + 24);
                  BOOL v14 = v13[6];
                  os_unfair_lock_unlock(v12 + 24);
                }
                else
                {
                  BOOL v14 = 0;
                }
                if (nw_path_get_status(v14) != nw_path_status_unsatisfied)
                {
                  v15 = *(void **)(a1 + 40);
                  id v16 = [[NWPath alloc] initWithPath:v14];
                  [v15 addObject:v16];
                }
              }
              uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
            }
            while (v8);
          }
        }
        uint64_t v2 = v20 + 1;
      }
      while (v20 + 1 != v19);
      uint64_t v19 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v19);
  }
}

- (NSArray)interfaces
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  BOOL v14 = __Block_byref_object_copy__27026;
  v15 = __Block_byref_object_dispose__27027;
  id v16 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  id v7 = __36__NWCandidatePathMonitor_interfaces__block_invoke;
  uint64_t v8 = &unk_1E524B978;
  uint64_t v9 = self;
  BOOL v10 = &v11;
  uint64_t v2 = self;
  uint64_t v3 = v6;
  os_unfair_lock_lock(&v2->lock);
  v7((uint64_t)v3);
  os_unfair_lock_unlock(&v2->lock);

  id v4 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (NSArray *)v4;
}

void __36__NWCandidatePathMonitor_interfaces__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) interfacesLocked];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)interfacesLocked
{
  os_unfair_lock_assert_owner(&self->lock);
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = [(NWCandidatePathMonitor *)self primaryEvaluator];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
    os_unfair_lock_lock(v5 + 24);
    id v7 = v6[6];
    os_unfair_lock_unlock(v5 + 24);
  }
  else
  {
    id v7 = 0;
  }

  enumerate_block[0] = MEMORY[0x1E4F143A8];
  enumerate_block[1] = 3221225472;
  enumerate_block[2] = __42__NWCandidatePathMonitor_interfacesLocked__block_invoke;
  enumerate_block[3] = &unk_1E523E1E8;
  id v8 = v3;
  id v11 = v8;
  nw_path_enumerate_interfaces(v7, enumerate_block);

  return v8;
}

uint64_t __42__NWCandidatePathMonitor_interfacesLocked__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [[NWInterface alloc] initWithInterface:v3];

  [v2 addObject:v4];
  return 1;
}

- (void)cancelWithHandler:(id)a3
{
  blocuint64_t k = a3;
  [(NWCandidatePathMonitor *)self cancelCandidatePathEvaluators];
  id v4 = [(NWCandidatePathMonitor *)self primaryEvaluator];

  if (v4)
  {
    if (block)
    {
      id v5 = [(NWCandidatePathMonitor *)self primaryEvaluator];
      nw_path_evaluator_set_cancel_handler(v5, block);
    }
    id v6 = [(NWCandidatePathMonitor *)self primaryEvaluator];
    nw_path_evaluator_cancel(v6);

    [(NWCandidatePathMonitor *)self setPrimaryEvaluator:0];
    goto LABEL_8;
  }
  id v7 = [(NWCandidatePathMonitor *)self queue];

  id v8 = block;
  if (block && v7)
  {
    uint64_t v9 = [(NWCandidatePathMonitor *)self queue];
    dispatch_async(v9, block);

LABEL_8:
    id v8 = block;
  }
}

void __55__NWCandidatePathMonitor_startWithQueue_updateHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    void v6[2] = __55__NWCandidatePathMonitor_startWithQueue_updateHandler___block_invoke_2;
    v6[3] = &unk_1E524BAA8;
    id v3 = (os_unfair_lock_s *)WeakRetained;
    id v7 = v3;
    os_unfair_lock_lock(v3 + 2);
    __55__NWCandidatePathMonitor_startWithQueue_updateHandler___block_invoke_2((uint64_t)v6);
    os_unfair_lock_unlock(v3 + 2);
    id v4 = [(os_unfair_lock_s *)v3 updateHandler];

    if (v4)
    {
      id v5 = [(os_unfair_lock_s *)v3 updateHandler];
      v5[2](v5, 0);
    }
  }
}

uint64_t __55__NWCandidatePathMonitor_startWithQueue_updateHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) resetCandidatePathEvaluators];
}

uint64_t __54__NWCandidatePathMonitor_resetCandidatePathEvaluators__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [[NWInterface alloc] initWithInterface:v3];

  [v2 addObject:v4];
  return 1;
}

void __54__NWCandidatePathMonitor_resetCandidatePathEvaluators__block_invoke_8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    uint64_t v2 = [WeakRetained updateHandler];

    id WeakRetained = v4;
    if (v2)
    {
      id v3 = [v4 updateHandler];
      v3[2](v3, 0);

      id WeakRetained = v4;
    }
  }
}

void __54__NWCandidatePathMonitor_resetCandidatePathEvaluators__block_invoke_10(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    uint64_t v2 = [WeakRetained updateHandler];

    id WeakRetained = v4;
    if (v2)
    {
      id v3 = [v4 updateHandler];
      v3[2](v3, 0);

      id WeakRetained = v4;
    }
  }
}

- (NWParameters)parameters
{
  id v3 = [NWParameters alloc];
  id v4 = [(NWCandidatePathMonitor *)self cParameters];
  id v5 = [(NWParameters *)v3 initWithParameters:v4];

  return v5;
}

- (id)cParameters
{
  uint64_t v2 = [(NWCandidatePathMonitor *)self primaryEvaluator];
  id v3 = v2;
  if (v2)
  {
    id v4 = v2;
    os_unfair_lock_lock(v3 + 24);
    id v5 = v4[6];
    os_unfair_lock_unlock(v3 + 24);
  }
  else
  {
    id v5 = 0;
  }

  id v6 = nw_path_copy_parameters(v5);

  return v6;
}

- (void)dealloc
{
  [(NWCandidatePathMonitor *)self cancelCandidatePathEvaluators];
  id v3 = [(NWCandidatePathMonitor *)self primaryEvaluator];

  if (v3)
  {
    id v4 = [(NWCandidatePathMonitor *)self primaryEvaluator];
    nw_path_evaluator_cancel(v4);

    [(NWCandidatePathMonitor *)self setPrimaryEvaluator:0];
  }
  v5.receiver = self;
  v5.super_class = (Class)NWCandidatePathMonitor;
  [(NWCandidatePathMonitor *)&v5 dealloc];
}

- (void)cancelCandidatePathEvaluators
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__NWCandidatePathMonitor_cancelCandidatePathEvaluators__block_invoke;
  v4[3] = &unk_1E524BAA8;
  v4[4] = self;
  p_locuint64_t k = &self->lock;
  id v3 = self;
  os_unfair_lock_lock(p_lock);
  __55__NWCandidatePathMonitor_cancelCandidatePathEvaluators__block_invoke((uint64_t)v4);
  os_unfair_lock_unlock(p_lock);
}

- (NWCandidatePathMonitor)init
{
  return [(NWCandidatePathMonitor *)self initWithParameters:0];
}

- (NWCandidatePathMonitor)initWithParameters:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)NWCandidatePathMonitor;
  objc_super v5 = [(NWCandidatePathMonitor *)&v21 init];
  if (v5)
  {
    if (v4) {
      id v6 = [v4 copyCParameters];
    }
    else {
      id v6 = nw_parameters_create();
    }
    id v7 = v6;
    nw_parameters_set_multipath_service(v6, nw_multipath_service_handover);
    evaluator_for_endpoint = nw_path_create_evaluator_for_endpoint(0, v7);
    [(NWCandidatePathMonitor *)v5 setPrimaryEvaluator:evaluator_for_endpoint];

    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(NWCandidatePathMonitor *)v5 setCandidatePathEvaluators:v9];

    v5->lock._os_unfair_lock_opaque = 0;
    BOOL v10 = v5;

    goto LABEL_6;
  }
  uint64_t v12 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  long long v23 = "-[NWCandidatePathMonitor initWithParameters:]";
  uint64_t v13 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v19 = 0;
  if (__nwlog_fault(v13, &type, &v19))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      BOOL v14 = __nwlog_obj();
      os_log_type_t v15 = type;
      if (os_log_type_enabled(v14, type))
      {
        *(_DWORD *)buf = 136446210;
        long long v23 = "-[NWCandidatePathMonitor initWithParameters:]";
        id v16 = "%{public}s [super init] failed";
LABEL_20:
        _os_log_impl(&dword_1830D4000, v14, v15, v16, buf, 0xCu);
      }
    }
    else
    {
      if (v19)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        BOOL v14 = __nwlog_obj();
        os_log_type_t v15 = type;
        BOOL v18 = os_log_type_enabled(v14, type);
        if (backtrace_string)
        {
          if (v18)
          {
            *(_DWORD *)buf = 136446466;
            long long v23 = "-[NWCandidatePathMonitor initWithParameters:]";
            __int16 v24 = 2082;
            long long v25 = backtrace_string;
            _os_log_impl(&dword_1830D4000, v14, v15, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_22;
        }
        if (!v18) {
          goto LABEL_21;
        }
        *(_DWORD *)buf = 136446210;
        long long v23 = "-[NWCandidatePathMonitor initWithParameters:]";
        id v16 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_20;
      }
      BOOL v14 = __nwlog_obj();
      os_log_type_t v15 = type;
      if (os_log_type_enabled(v14, type))
      {
        *(_DWORD *)buf = 136446210;
        long long v23 = "-[NWCandidatePathMonitor initWithParameters:]";
        id v16 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_20;
      }
    }
LABEL_21:
  }
LABEL_22:
  if (v13) {
    free(v13);
  }
LABEL_6:

  return v5;
}

@end