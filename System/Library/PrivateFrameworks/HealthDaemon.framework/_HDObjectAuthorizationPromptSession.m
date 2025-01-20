@interface _HDObjectAuthorizationPromptSession
- (void)endPromptTransactionWithSuccess:(void *)a3 error:;
@end

@implementation _HDObjectAuthorizationPromptSession

- (void)endPromptTransactionWithSuccess:(void *)a3 error:
{
  uint64_t v117 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a1)
  {
    v6 = *(const void **)(a1 + 40);
    if (v6)
    {
      v7 = _Block_copy(v6);
      v8 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = 0;

      v61 = v7;
      if (a2)
      {
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
        v10 = [WeakRetained sourceManager];
        uint64_t v11 = *(void *)(a1 + 48);
        v85[0] = 0;
        v12 = [v10 localSourceForBundleIdentifier:v11 error:v85];
        id v13 = v85[0];

        BOOL v75 = v12 != 0;
        if (!v12)
        {
          _HKInitializeLogging();
          v14 = *MEMORY[0x1E4F29EF8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            id v116 = v13;
            _os_log_error_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_ERROR, "Failed to look up source entity: %{public}@", buf, 0xCu);
          }
          id v15 = v13;

          id v5 = v15;
        }
      }
      else
      {
        v12 = 0;
        BOOL v75 = 0;
      }
      long long v83 = 0u;
      long long v84 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      uint64_t v62 = a1;
      obuint64_t j = *(id *)(a1 + 16);
      v66 = v12;
      uint64_t v73 = [obj countByEnumeratingWithState:&v81 objects:v113 count:16];
      if (v73)
      {
        uint64_t v16 = *(void *)v82;
        v17 = (id *)(a1 + 8);
        uint64_t v64 = *(void *)v82;
        id v65 = v5;
        v63 = (id *)(a1 + 8);
        do
        {
          uint64_t v18 = 0;
          do
          {
            if (*(void *)v82 != v16) {
              objc_enumerationMutation(obj);
            }
            uint64_t v19 = *(void *)(*((void *)&v81 + 1) + 8 * v18);
            if (v19) {
              v20 = *(void **)(v19 + 56);
            }
            else {
              v20 = 0;
            }
            id v21 = v20;
            id v22 = objc_loadWeakRetained(v17);
            id v23 = v12;
            id v24 = v21;
            id v25 = v22;
            id v26 = v5;
            if (v19)
            {
              v27 = *(const void **)(v19 + 16);
              if (v27)
              {
                id v74 = v23;
                v28 = _Block_copy(v27);
                v29 = *(void **)(v19 + 16);
                *(void *)(v19 + 16) = 0;

                if (v75)
                {
                  id v70 = v25;
                  v71 = v28;
                  id v72 = v24;
                  id v30 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
                  long long v103 = 0u;
                  long long v104 = 0u;
                  long long v101 = 0u;
                  long long v102 = 0u;
                  id v31 = *(id *)(v19 + 32);
                  uint64_t v32 = [v31 countByEnumeratingWithState:&v101 objects:buf count:16];
                  if (v32)
                  {
                    uint64_t v33 = v32;
                    uint64_t v34 = *(void *)v102;
                    do
                    {
                      for (uint64_t i = 0; i != v33; ++i)
                      {
                        if (*(void *)v102 != v34) {
                          objc_enumerationMutation(v31);
                        }
                        v36 = *(void **)(*((void *)&v101 + 1) + 8 * i);
                        v37 = objc_msgSend(v36, "UUID", v61);
                        [v30 setObject:v36 forKeyedSubscript:v37];
                      }
                      uint64_t v33 = [v31 countByEnumeratingWithState:&v101 objects:buf count:16];
                    }
                    while (v33);
                  }

                  uint64_t v38 = *(void *)(v19 + 32);
                  id v100 = v26;
                  id v25 = v70;
                  v39 = +[HDObjectAuthorizationEntity authorizationRecordsForSamples:v38 sourceEntity:v74 sessionIdentifier:v72 profile:v70 error:&v100];
                  id v40 = v100;

                  if (v39)
                  {
                    v68 = v40;
                    id v41 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                    long long v89 = 0u;
                    long long v90 = 0u;
                    long long v91 = 0u;
                    long long v92 = 0u;
                    v67 = v39;
                    id v42 = v39;
                    uint64_t v43 = [v42 countByEnumeratingWithState:&v89 objects:v114 count:16];
                    if (v43)
                    {
                      uint64_t v44 = v43;
                      uint64_t v45 = *(void *)v90;
                      do
                      {
                        for (uint64_t j = 0; j != v44; ++j)
                        {
                          if (*(void *)v90 != v45) {
                            objc_enumerationMutation(v42);
                          }
                          v47 = *(void **)(*((void *)&v89 + 1) + 8 * j);
                          if (objc_msgSend(v47, "status", v61) == 2)
                          {
                            v48 = [v47 objectUUID];
                            v49 = [v30 objectForKeyedSubscript:v48];
                            [v41 addObject:v49];
                          }
                        }
                        uint64_t v44 = [v42 countByEnumeratingWithState:&v89 objects:v114 count:16];
                      }
                      while (v44);
                    }

                    v85[1] = (id)MEMORY[0x1E4F143A8];
                    v85[2] = (id)3221225472;
                    v85[3] = __106___HDObjectAuthorizationRequest_invokeCompletionWithSuccess_sourceEntity_sessionIdentifier_profile_error___block_invoke_3;
                    v85[4] = &unk_1E63016C0;
                    id v88 = v71;
                    v85[5] = (id)v19;
                    id v86 = v41;
                    id v50 = v68;
                    id v87 = v68;
                    id v51 = v41;
                    HKDispatchAsyncOnGlobalConcurrentQueue();

                    id v25 = v70;
                    v39 = v67;
                  }
                  else
                  {
                    uint64_t v93 = MEMORY[0x1E4F143A8];
                    uint64_t v94 = 3221225472;
                    v95 = __106___HDObjectAuthorizationRequest_invokeCompletionWithSuccess_sourceEntity_sessionIdentifier_profile_error___block_invoke_2;
                    v96 = &unk_1E62F61D0;
                    id v99 = v71;
                    uint64_t v97 = v19;
                    id v98 = v40;
                    HKDispatchAsyncOnGlobalConcurrentQueue();

                    id v51 = v99;
                    id v50 = v40;
                  }

                  id v5 = v65;
                  v12 = v66;
                  v17 = v63;
                  uint64_t v16 = v64;
                  v52 = v71;
                  id v24 = v72;
                }
                else
                {
                  uint64_t v105 = MEMORY[0x1E4F143A8];
                  uint64_t v106 = 3221225472;
                  v107 = __106___HDObjectAuthorizationRequest_invokeCompletionWithSuccess_sourceEntity_sessionIdentifier_profile_error___block_invoke;
                  v108 = &unk_1E62F61D0;
                  id v111 = v28;
                  uint64_t v109 = v19;
                  id v50 = v26;
                  id v110 = v50;
                  HKDispatchAsyncOnGlobalConcurrentQueue();

                  v52 = v28;
                  id v30 = v111;
                }

                id v26 = v50;
                id v23 = v74;
              }
            }

            ++v18;
          }
          while (v18 != v73);
          uint64_t v53 = [obj countByEnumeratingWithState:&v81 objects:v113 count:16];
          uint64_t v73 = v53;
        }
        while (v53);
      }

      long long v79 = 0u;
      long long v80 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      id v54 = *(id *)(v62 + 24);
      uint64_t v55 = [v54 countByEnumeratingWithState:&v77 objects:v112 count:16];
      if (v55)
      {
        uint64_t v56 = v55;
        uint64_t v57 = *(void *)v78;
        v58 = v61;
        do
        {
          for (uint64_t k = 0; k != v56; ++k)
          {
            if (*(void *)v78 != v57) {
              objc_enumerationMutation(v54);
            }
            id v76 = v5;
            HKDispatchAsyncOnGlobalConcurrentQueue();
          }
          uint64_t v56 = [v54 countByEnumeratingWithState:&v77 objects:v112 count:16];
        }
        while (v56);
        v12 = v66;
      }
      else
      {
        v58 = v61;
      }

      id v5 = v5;
      id v60 = v58;
      HKDispatchAsyncOnGlobalConcurrentQueue();
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong(&self->_sessionCompletion, 0);
  objc_storeStrong((id *)&self->_completions, 0);
  objc_storeStrong((id *)&self->_requests, 0);

  objc_destroyWeak((id *)&self->_profile);
}

@end