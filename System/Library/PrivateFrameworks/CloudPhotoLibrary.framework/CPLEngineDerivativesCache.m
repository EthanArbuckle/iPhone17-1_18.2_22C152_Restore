@interface CPLEngineDerivativesCache
- (BOOL)_checkGeneratedResources:(id)a3 error:(id *)a4;
- (BOOL)_checkResource:(id)a3 name:(id)a4 error:(id *)a5;
- (BOOL)_isUnsupportedFormatError:(id)a3;
- (CPLEngineDerivativesCache)initWithCacheURL:(id)a3;
- (Class)derivativeGeneratorClass;
- (NSURL)cacheURL;
- (id)_cacheKeyForReferenceResource:(id)a3 adjustments:(id)a4 includePosterFrame:(BOOL)a5;
- (id)_finalFolderURLForGeneratedResourcesWithReferenceResource:(id)a3 adjustment:(id)a4 includePosterFrame:(BOOL)a5;
- (id)_folderNameForReferenceResource:(id)a3 adjustment:(id)a4 includePosterFrame:(BOOL)a5;
- (id)_tempFolderURLForGeneratedResourcesWithReferenceResource:(id)a3 adjustment:(id)a4 includePosterFrame:(BOOL)a5;
- (id)cachedResourcesForReferenceResource:(id)a3 adjustment:(id)a4 includePosterFrame:(BOOL)a5;
- (id)tempFolderURLForGeneratedResourcesWithReferenceResource:(id)a3 adjustment:(id)a4 includePosterFrame:(BOOL)a5;
- (void)_createCacheFolderIfNecessary;
- (void)_updateChange:(id *)a3 fromOldChange:(id)a4 withResources:(id)a5 excludeImages:(BOOL)a6;
- (void)discardCache;
- (void)generateDerivativesForChange:(id)a3 derivativesFilter:(id)a4 fingerprintScheme:(id)a5 completionHandler:(id)a6;
- (void)noteGeneratedResouces:(id)a3 haveBeenGeneratedForReferenceResource:(id)a4 adjustment:(id)a5 includePosterFrame:(BOOL)a6;
- (void)setDerivativeGeneratorClass:(Class)a3;
@end

@implementation CPLEngineDerivativesCache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_derivativeGeneratorClass, 0);
  objc_storeStrong((id *)&self->_cacheURL, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_cacheMappingURL, 0);
}

- (void)setDerivativeGeneratorClass:(Class)a3
{
}

- (Class)derivativeGeneratorClass
{
  return self->_derivativeGeneratorClass;
}

- (NSURL)cacheURL
{
  return self->_cacheURL;
}

- (void)generateDerivativesForChange:(id)a3 derivativesFilter:(id)a4 fingerprintScheme:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  queue = self->_queue;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __112__CPLEngineDerivativesCache_generateDerivativesForChange_derivativesFilter_fingerprintScheme_completionHandler___block_invoke;
  v22[3] = &unk_1E60A8088;
  id v23 = v10;
  v24 = self;
  id v26 = v11;
  id v27 = v13;
  id v25 = v12;
  v15 = v22;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_9130;
  block[3] = &unk_1E60A6978;
  id v29 = v15;
  v16 = queue;
  id v17 = v11;
  id v18 = v12;
  id v19 = v13;
  id v20 = v10;
  dispatch_block_t v21 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v16, v21);
}

void __112__CPLEngineDerivativesCache_generateDerivativesForChange_derivativesFilter_fingerprintScheme_completionHandler___block_invoke(id *a1)
{
  uint64_t v137 = *MEMORY[0x1E4F143B8];
  int v2 = [a1[4] isMasterChange];
  id v3 = a1[4];
  if (!v2)
  {
    if (![v3 isAssetChange])
    {
      id v4 = 0;
      uint64_t v11 = 0;
      v16 = 0;
      id v14 = 0;
      goto LABEL_76;
    }
    id v13 = [a1[4] resourceForType:16];
    id v14 = [a1[4] adjustments];
    if (v13)
    {
      unint64_t v12 = v13;
      uint64_t v11 = [a1[4] resourceForType:2];
      BOOL v15 = 0;
      unsigned int v81 = 1;
      uint64_t v79 = 2;
      id v4 = (id)v12;
      if (!v11)
      {
LABEL_36:
        v31 = [(id)v12 identity];
        v32 = [v31 fileURL];
        BOOL v30 = v32 != 0;

        v16 = (void *)v12;
LABEL_37:
        *(void *)&long long v132 = 0;
        *((void *)&v132 + 1) = &v132;
        uint64_t v133 = 0x3032000000;
        v134 = __Block_byref_object_copy__9133;
        v135 = __Block_byref_object_dispose__9134;
        id v136 = 0;
        v122[0] = MEMORY[0x1E4F143A8];
        v122[1] = 3221225472;
        v122[2] = __112__CPLEngineDerivativesCache_generateDerivativesForChange_derivativesFilter_fingerprintScheme_completionHandler___block_invoke_43;
        v122[3] = &unk_1E60A7F98;
        v122[4] = a1[5];
        id v14 = v14;
        id v123 = v14;
        id v124 = a1[4];
        v125 = &v132;
        v80 = (uint64_t (**)(void, void, void))MEMORY[0x1BA994060](v122);
        if (v15)
        {
          int v33 = v80[2](v80, v11, 1) ^ 1;
          if (!v30)
          {
LABEL_39:
            int v34 = 0;
            goto LABEL_42;
          }
        }
        else
        {
          int v33 = 0;
          if (!v30) {
            goto LABEL_39;
          }
        }
        int v34 = ((uint64_t (**)(void, void *, void))v80)[2](v80, v16, v81) ^ 1;
LABEL_42:
        if (((v33 | v34) & 1) == 0)
        {
          v45 = *(void **)(*((void *)&v132 + 1) + 40);
          if (v45)
          {
            v46 = [v45 allResources];
            v47 = (void *)[a1[4] copy];
            [v47 setResources:v46];
            (*((void (**)(void))a1[8] + 2))();
          }
          else
          {
            (*((void (**)(void))a1[8] + 2))();
          }
LABEL_71:

          _Block_object_dispose(&v132, 8);
          goto LABEL_81;
        }
        id v35 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        v119[0] = MEMORY[0x1E4F143A8];
        v119[1] = 3221225472;
        v119[2] = __112__CPLEngineDerivativesCache_generateDerivativesForChange_derivativesFilter_fingerprintScheme_completionHandler___block_invoke_45;
        v119[3] = &unk_1E60A7FC0;
        v119[4] = a1[5];
        id v76 = v14;
        id v120 = v76;
        id v36 = v35;
        id v121 = v36;
        v74 = (void *)MEMORY[0x1BA994060](v119);
        v37 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
        v114[0] = MEMORY[0x1E4F143A8];
        v114[1] = 3221225472;
        v114[2] = __112__CPLEngineDerivativesCache_generateDerivativesForChange_derivativesFilter_fingerprintScheme_completionHandler___block_invoke_2;
        v114[3] = &unk_1E60A7FE8;
        id v115 = a1[4];
        id v118 = a1[8];
        id v38 = v37;
        id v116 = v38;
        id v78 = v36;
        id v117 = v78;
        v39 = (void *)MEMORY[0x1BA994060](v114);
        uint64_t v108 = 0;
        v109 = &v108;
        uint64_t v110 = 0x3032000000;
        v111 = __Block_byref_object_copy__9133;
        v112 = __Block_byref_object_dispose__9134;
        id v113 = 0;
        if (v34)
        {
          if (v33)
          {
            if (!_CPLSilentLogging)
            {
              v40 = __CPLDerivativesOSLogDomain();
              if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
              {
                id v41 = a1[4];
                *(_DWORD *)buf = 138412802;
                v127 = v41;
                __int16 v128 = 2112;
                uint64_t v129 = v11;
                __int16 v130 = 2112;
                v131 = v16;
                v42 = "%@ has to generate image derivatives from %@ and video derivatives from %@";
                v43 = v40;
                uint32_t v44 = 32;
LABEL_58:
                _os_log_impl(&dword_1B4CAC000, v43, OS_LOG_TYPE_DEBUG, v42, buf, v44);
              }
LABEL_59:
            }
LABEL_60:
            v95[0] = MEMORY[0x1E4F143A8];
            v95[1] = 3221225472;
            v95[2] = __112__CPLEngineDerivativesCache_generateDerivativesForChange_derivativesFilter_fingerprintScheme_completionHandler___block_invoke_48;
            v95[3] = &unk_1E60A8038;
            char v107 = v33;
            v95[4] = a1[5];
            id v96 = (id)v11;
            v104 = &v108;
            id v73 = v74;
            id v102 = v73;
            id v50 = v76;
            id v97 = v50;
            id v98 = a1[6];
            id v99 = a1[7];
            uint64_t v106 = v79;
            id v77 = v39;
            id v103 = v77;
            id v75 = v38;
            id v100 = v75;
            v105 = &v132;
            id v101 = a1[4];
            uint64_t v51 = MEMORY[0x1BA994060](v95);
            v52 = (void *)v51;
            if (v34)
            {
              id v53 = a1[5];
              v54 = (id *)(v109 + 5);
              id obj = (id)v109[5];
              int v55 = [v53 _checkResource:v16 name:@"baseVideoResource" error:&obj];
              objc_storeStrong(v54, obj);
              if (v55)
              {
                if (!_CPLSilentLogging)
                {
                  v56 = __CPLDerivativesOSLogDomain();
                  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    v127 = v16;
                    _os_log_impl(&dword_1B4CAC000, v56, OS_LOG_TYPE_DEBUG, "Generating video derivatives for %@", buf, 0xCu);
                  }
                }
                v57 = [[CPLDerivativesGenerationStatistics alloc] initWithSourceResource:v16];
                v58 = (*((void (**)(id, void *, void))v73 + 2))(v73, v16, v81);
                v72 = (void *)[a1[5] derivativeGeneratorClass];
                id v70 = a1[7];
                id v71 = a1[6];
                v82[0] = MEMORY[0x1E4F143A8];
                v82[1] = 3221225472;
                v82[2] = __112__CPLEngineDerivativesCache_generateDerivativesForChange_derivativesFilter_fingerprintScheme_completionHandler___block_invoke_59;
                v82[3] = &unk_1E60A8060;
                id v59 = v16;
                id v60 = a1[5];
                id v83 = v59;
                id v84 = v60;
                id v89 = v77;
                v69 = v57;
                v85 = v69;
                id v86 = v75;
                v91 = &v108;
                id v61 = v50;
                char v93 = v81;
                id v87 = v61;
                v92 = &v132;
                id v88 = a1[4];
                id v90 = v52;
                LOBYTE(v68) = v81;
                [v72 generateDerivativeResourcesFromInputResource:v59 withAdjustments:v61 destinationDirectory:v58 fingerprintScheme:v71 derivativesFilter:v70 recordChangeType:v79 includePosterFrameForVideo:v68 completionHandler:v82];
              }
              else
              {
                (*((void (**)(id, void, uint64_t))v77 + 2))(v77, 0, v109[5]);
              }
            }
            else
            {
              (*(void (**)(uint64_t))(v51 + 16))(v51);
            }

            _Block_object_dispose(&v108, 8);
            goto LABEL_71;
          }
          if (_CPLSilentLogging) {
            goto LABEL_60;
          }
          v40 = __CPLDerivativesOSLogDomain();
          if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_59;
          }
          id v49 = a1[4];
          *(_DWORD *)buf = 138412546;
          v127 = v49;
          __int16 v128 = 2112;
          uint64_t v129 = (uint64_t)v16;
          v42 = "%@ has to generate video derivatives from %@";
        }
        else
        {
          if (_CPLSilentLogging) {
            goto LABEL_60;
          }
          v40 = __CPLDerivativesOSLogDomain();
          if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_59;
          }
          id v48 = a1[4];
          *(_DWORD *)buf = 138412546;
          v127 = v48;
          __int16 v128 = 2112;
          uint64_t v129 = v11;
          v42 = "%@ has to generate image derivatives from %@";
        }
        v43 = v40;
        uint32_t v44 = 22;
        goto LABEL_58;
      }
      v16 = (void *)v12;
      unsigned int v17 = 0;
LABEL_31:
      v28 = [(id)v11 identity];
      id v29 = [v28 fileURL];
      BOOL v15 = v29 != 0;

      if ((v81 & 1) == 0)
      {
        BOOL v30 = 0;
        unsigned int v81 = v17;
        goto LABEL_37;
      }
      unsigned int v81 = v17;
      unint64_t v12 = (unint64_t)v16;
      goto LABEL_36;
    }
    id v26 = [a1[4] resourceForType:2];
    if (v26)
    {
      id v4 = v26;
      v16 = [a1[4] resourceForType:19];
      unsigned int v17 = 0;
      LOBYTE(v81) = v16 != 0;
      uint64_t v79 = 2;
      uint64_t v11 = (uint64_t)v4;
      goto LABEL_31;
    }
    if (!v14 || [v14 adjustmentSourceType])
    {
      id v4 = 0;
LABEL_75:
      uint64_t v11 = 0;
      v16 = 0;
      goto LABEL_76;
    }
    v64 = [a1[4] resourceForType:1000];
    id v4 = v64;
    if (!v64) {
      goto LABEL_75;
    }
    v65 = [v64 identity];
    v66 = [v65 fileUTI];

    if (v66)
    {
      unsigned int v81 = objc_msgSend((id)objc_msgSend(a1[5], "derivativeGeneratorClass"), "isMovieUTI:", v66);
      if (v81)
      {
        uint64_t v11 = 0;
        unint64_t v12 = (unint64_t)v4;
      }
      else
      {
        unint64_t v12 = 0;
        if (!objc_msgSend((id)objc_msgSend(a1[5], "derivativeGeneratorClass"), "canGenerateImageDerivativesFromUTI:", v66))
        {
          unsigned int v81 = 0;
          uint64_t v11 = 0;
          goto LABEL_91;
        }
        uint64_t v11 = (uint64_t)v4;
      }
      id v67 = v4;
    }
    else
    {
      unsigned int v81 = 0;
      unint64_t v12 = 0;
      uint64_t v11 = 0;
    }
LABEL_91:

    uint64_t v27 = 2;
LABEL_28:
    uint64_t v79 = v27;
    if (v11 | v12)
    {
      if (!v11)
      {
        BOOL v15 = 0;
        v16 = 0;
        BOOL v30 = 0;
        if (!v12) {
          goto LABEL_37;
        }
        goto LABEL_36;
      }
      v16 = (void *)v12;
      unsigned int v17 = v81;
      LOBYTE(v81) = v12 != 0;
      goto LABEL_31;
    }
    goto LABEL_75;
  }
  id v4 = [v3 resourceForType:1];
  v5 = [v4 identity];
  v6 = [v5 fileUTI];

  if (v6)
  {
    unsigned int v81 = objc_msgSend((id)objc_msgSend(a1[5], "derivativeGeneratorClass"), "isMovieUTI:", v6);
    if (v81)
    {
      v7 = [a1[4] resourceForType:16];
      id v8 = v7;
      if (v7
        && ([v7 identity],
            v9 = objc_claimAutoreleasedReturnValue(),
            [v9 fileURL],
            id v10 = objc_claimAutoreleasedReturnValue(),
            v10,
            v9,
            v10))
      {
        id v8 = v8;
        uint64_t v11 = 0;
        unint64_t v12 = (unint64_t)v8;
      }
      else
      {
        unint64_t v12 = (unint64_t)v4;
        uint64_t v11 = 0;
      }
LABEL_25:

      goto LABEL_26;
    }
    if (objc_msgSend((id)objc_msgSend(a1[5], "derivativeGeneratorClass"), "canGenerateImageDerivativesFromUTI:", v6))
    {
      id v18 = [a1[4] resourceForType:2];
      id v8 = v18;
      if (!v18
        || ([v18 identity],
            id v19 = objc_claimAutoreleasedReturnValue(),
            [v19 fileURL],
            id v20 = objc_claimAutoreleasedReturnValue(),
            v20,
            v19,
            dispatch_block_t v21 = v8,
            !v20))
      {
        dispatch_block_t v21 = v4;
      }
      uint64_t v11 = v21;
      v22 = [a1[4] resourceForType:18];
      id v23 = v22;
      if (v22
        && ([v22 identity],
            v24 = objc_claimAutoreleasedReturnValue(),
            [v24 fileURL],
            id v25 = objc_claimAutoreleasedReturnValue(),
            v25,
            v24,
            v25))
      {
        unint64_t v12 = v23;
      }
      else
      {
        unint64_t v12 = 0;
      }

      goto LABEL_25;
    }
  }
  unsigned int v81 = 0;
  unint64_t v12 = 0;
  uint64_t v11 = 0;
LABEL_26:

  id v14 = 0;
  if (v4)
  {
    uint64_t v27 = 1;
    goto LABEL_28;
  }
  id v4 = 0;
  v16 = (void *)v12;
LABEL_76:
  if (!_CPLSilentLogging)
  {
    v62 = __CPLDerivativesOSLogDomain();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
    {
      v63 = [a1[4] cplFullDescription];
      LODWORD(v132) = 138412290;
      *(void *)((char *)&v132 + 4) = v63;
      _os_log_impl(&dword_1B4CAC000, v62, OS_LOG_TYPE_DEBUG, "%@ has no resource to generate", (uint8_t *)&v132, 0xCu);
    }
  }
  (*((void (**)(void))a1[8] + 2))();
LABEL_81:
}

BOOL __112__CPLEngineDerivativesCache_generateDerivativesForChange_derivativesFilter_fingerprintScheme_completionHandler___block_invoke_43(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v5 = [*(id *)(a1 + 32) cachedResourcesForReferenceResource:a2 adjustment:*(void *)(a1 + 40) includePosterFrame:a3];
  if (v5)
  {
    if (!_CPLSilentLogging)
    {
      v6 = __CPLDerivativesOSLogDomain();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v7 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 138412546;
        uint64_t v14 = v7;
        __int16 v15 = 2112;
        v16 = v5;
        _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_DEBUG, "Found cached resources for %@: %@", buf, 0x16u);
      }
    }
    if ([v5 count])
    {
      id v8 = *(void **)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 48);
      uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
      id obj = *(id *)(v10 + 40);
      [v8 _updateChange:&obj fromOldChange:v9 withResources:v5 excludeImages:v3 ^ 1u];
      objc_storeStrong((id *)(v10 + 40), obj);
    }
  }

  return v5 != 0;
}

id __112__CPLEngineDerivativesCache_generateDerivativesForChange_derivativesFilter_fingerprintScheme_completionHandler___block_invoke_45(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = [*(id *)(a1 + 32) tempFolderURLForGeneratedResourcesWithReferenceResource:a2 adjustment:*(void *)(a1 + 40) includePosterFrame:a3];
  [*(id *)(a1 + 48) addObject:v4];
  return v4;
}

void __112__CPLEngineDerivativesCache_generateDerivativesForChange_derivativesFilter_fingerprintScheme_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v5)
  {
    if (v6)
    {
      if (!_CPLSilentLogging)
      {
        uint64_t v10 = __CPLDerivativesOSLogDomain();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          uint64_t v11 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138412546;
          uint64_t v26 = v11;
          __int16 v27 = 2112;
          v28 = v7;
          _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_ERROR, "Failed to generate derivatives for %@: %@", buf, 0x16u);
        }
      }
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      unint64_t v12 = *(id *)(a1 + 48);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v21 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void *)(*((void *)&v20 + 1) + 8 * i);
            id v18 = objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager", (void)v20);
            [v18 removeItemAtURL:v17 error:0];
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v14);
      }
    }
    else
    {
      if (_CPLSilentLogging)
      {
LABEL_20:
        (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
        goto LABEL_21;
      }
      unint64_t v12 = __CPLDerivativesOSLogDomain();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v19 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        uint64_t v26 = v19;
        _os_log_impl(&dword_1B4CAC000, v12, OS_LOG_TYPE_DEBUG, "No derivatives are generated for %@", buf, 0xCu);
      }
    }

    goto LABEL_20;
  }
  id v8 = [v5 allResources];
  uint64_t v9 = (void *)[*(id *)(a1 + 32) copy];
  [v9 setResources:v8];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();

LABEL_21:
}

void __112__CPLEngineDerivativesCache_generateDerivativesForChange_derivativesFilter_fingerprintScheme_completionHandler___block_invoke_48(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 128))
  {
    int v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(*(void *)(a1 + 104) + 8);
    id v30 = *(id *)(v4 + 40);
    int v5 = [v2 _checkResource:v3 name:@"baseImageResource" error:&v30];
    objc_storeStrong((id *)(v4 + 40), v30);
    if (v5)
    {
      id v6 = (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
      uint64_t v7 = [[CPLDerivativesGenerationStatistics alloc] initWithSourceResource:*(void *)(a1 + 40)];
      id v8 = (void *)[*(id *)(a1 + 32) derivativeGeneratorClass];
      uint64_t v9 = *(void **)(a1 + 40);
      uint64_t v10 = *(void *)(a1 + 48);
      uint64_t v11 = *(void *)(a1 + 56);
      uint64_t v12 = *(void *)(a1 + 64);
      uint64_t v13 = *(void *)(a1 + 120);
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __112__CPLEngineDerivativesCache_generateDerivativesForChange_derivativesFilter_fingerprintScheme_completionHandler___block_invoke_2_53;
      v21[3] = &unk_1E60A8010;
      v21[4] = *(void *)(a1 + 32);
      id v22 = v9;
      id v27 = *(id *)(a1 + 96);
      long long v23 = v7;
      id v14 = *(id *)(a1 + 72);
      uint64_t v15 = *(void *)(a1 + 104);
      id v24 = v14;
      uint64_t v28 = v15;
      id v16 = *(id *)(a1 + 48);
      uint64_t v17 = *(void *)(a1 + 112);
      id v25 = v16;
      uint64_t v29 = v17;
      id v26 = *(id *)(a1 + 80);
      id v18 = v7;
      LOBYTE(v20) = 0;
      [v8 generateDerivativeResourcesFromInputResource:v22 withAdjustments:v10 destinationDirectory:v6 fingerprintScheme:v11 derivativesFilter:v12 recordChangeType:v13 includePosterFrameForVideo:v20 completionHandler:v21];
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 96) + 16))();
    }
  }
  else
  {
    uint64_t v19 = *(void (**)(void))(*(void *)(a1 + 96) + 16);
    v19();
  }
}

void __112__CPLEngineDerivativesCache_generateDerivativesForChange_derivativesFilter_fingerprintScheme_completionHandler___block_invoke_59(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v7 = __CPLDerivativesOSLogDomain();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        uint64_t v8 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        uint64_t v20 = v8;
        __int16 v21 = 2112;
        id v22 = v6;
        _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_ERROR, "Error trying to generate derivatives from %@: %@", buf, 0x16u);
      }
    }
    if (([*(id *)(a1 + 40) _isUnsupportedFormatError:v6] & 1) == 0)
    {
      if (!_CPLSilentLogging)
      {
        uint64_t v9 = __CPLDerivativesOSLogDomain();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          uint64_t v10 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138412290;
          uint64_t v20 = v10;
          _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_ERROR, "Error trying to generate unsupported video derivatives from %@", buf, 0xCu);
        }
      }
      uint64_t v11 = *(void (**)(void))(*(void *)(a1 + 80) + 16);
      goto LABEL_17;
    }
  }
  else if ([v5 count])
  {
    [*(id *)(a1 + 48) didEndGeneratingDerivatives];
    [*(id *)(a1 + 56) addObject:*(void *)(a1 + 48)];
    uint64_t v12 = *(void **)(a1 + 40);
    uint64_t v13 = *(void *)(*(void *)(a1 + 96) + 8);
    id obj = *(id *)(v13 + 40);
    int v14 = [v12 _checkGeneratedResources:v5 error:&obj];
    objc_storeStrong((id *)(v13 + 40), obj);
    if (!v14)
    {
      uint64_t v11 = *(void (**)(void))(*(void *)(a1 + 80) + 16);
LABEL_17:
      v11();
      goto LABEL_18;
    }
    [*(id *)(a1 + 40) noteGeneratedResouces:v5 haveBeenGeneratedForReferenceResource:*(void *)(a1 + 32) adjustment:*(void *)(a1 + 64) includePosterFrame:*(unsigned __int8 *)(a1 + 112)];
    uint64_t v15 = *(void *)(*(void *)(a1 + 104) + 8);
    id v16 = *(void **)(a1 + 40);
    id v17 = *(id *)(v15 + 40);
    [v16 _updateChange:&v17 fromOldChange:*(void *)(a1 + 72) withResources:v5 excludeImages:*(unsigned char *)(a1 + 112) == 0];
    objc_storeStrong((id *)(v15 + 40), v17);
  }
  (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
LABEL_18:
}

void __112__CPLEngineDerivativesCache_generateDerivativesForChange_derivativesFilter_fingerprintScheme_completionHandler___block_invoke_2_53(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    if ([v5 count])
    {
      [*(id *)(a1 + 48) didEndGeneratingDerivatives];
      [*(id *)(a1 + 56) addObject:*(void *)(a1 + 48)];
      uint64_t v10 = *(void **)(a1 + 32);
      uint64_t v11 = *(void *)(*(void *)(a1 + 88) + 8);
      id obj = *(id *)(v11 + 40);
      int v12 = [v10 _checkGeneratedResources:v5 error:&obj];
      objc_storeStrong((id *)(v11 + 40), obj);
      if (!v12)
      {
        uint64_t v9 = *(void (**)(void))(*(void *)(a1 + 80) + 16);
        goto LABEL_12;
      }
      [*(id *)(a1 + 32) noteGeneratedResouces:v5 haveBeenGeneratedForReferenceResource:*(void *)(a1 + 40) adjustment:*(void *)(a1 + 64) includePosterFrame:1];
      uint64_t v13 = *(void **)(a1 + 32);
      uint64_t v14 = *(void *)(*(void *)(a1 + 96) + 8);
      id v15 = *(id *)(v14 + 40);
      [v13 _updateChange:&v15 fromOldChange:*(void *)(a1 + 72) withResources:v5 excludeImages:0];
      objc_storeStrong((id *)(v14 + 40), v15);
    }
    goto LABEL_11;
  }
  if ([*(id *)(a1 + 32) _isUnsupportedFormatError:v6])
  {
LABEL_11:
    uint64_t v9 = *(void (**)(void))(*(void *)(a1 + 80) + 16);
    goto LABEL_12;
  }
  if (!_CPLSilentLogging)
  {
    uint64_t v7 = __CPLDerivativesOSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v18 = v8;
      __int16 v19 = 2112;
      id v20 = v6;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_ERROR, "Error trying to generate derivatives from %@: %@", buf, 0x16u);
    }
  }
  uint64_t v9 = *(void (**)(void))(*(void *)(a1 + 80) + 16);
LABEL_12:
  v9();
}

- (BOOL)_checkGeneratedResources:(id)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = a3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        int v12 = +[CPLResource shortDescriptionForResourceType:](CPLResource, "shortDescriptionForResourceType:", objc_msgSend(v11, "resourceType", (void)v15));
        LODWORD(v11) = [(CPLEngineDerivativesCache *)self _checkResource:v11 name:v12 error:a4];

        if (!v11)
        {
          BOOL v13 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 1;
LABEL_11:

  return v13;
}

- (BOOL)_checkResource:(id)a3 name:(id)a4 error:(id *)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 identity];
  uint64_t v10 = [v9 fileURL];
  uint64_t v11 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v12 = [v10 path];
  char v13 = [v11 fileExistsAtPath:v12];

  if ((v13 & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v14 = __CPLDerivativesOSLogDomain();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        long long v15 = [v10 path];
        *(_DWORD *)buf = 138412802;
        id v24 = v15;
        __int16 v25 = 2112;
        id v26 = v8;
        __int16 v27 = 2112;
        id v28 = v7;
        _os_log_impl(&dword_1B4CAC000, v14, OS_LOG_TYPE_ERROR, "Unable to find resoure at its expected place '%@' for %@ (%@)", buf, 0x20u);
      }
    }
    if (a5)
    {
      id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v17 = *MEMORY[0x1E4F281F8];
      long long v18 = objc_msgSend(v10, "path", *MEMORY[0x1E4F28328]);
      id v22 = v18;
      __int16 v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      *a5 = (id)[v16 initWithDomain:v17 code:4 userInfo:v19];
    }
  }

  return v13;
}

- (void)_updateChange:(id *)a3 fromOldChange:(id)a4 withResources:(id)a5 excludeImages:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  if (!*a3)
  {
    uint64_t v11 = [_CPLResourcesMutableArray alloc];
    int v12 = [v9 resources];
    *a3 = [(_CPLResourcesMutableArray *)v11 initWithResources:v12];
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v13 = v10;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        long long v18 = *(void **)(*((void *)&v20 + 1) + 8 * v17);
        if (!v6
          || (unint64_t)(objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v17), "resourceType", (void)v20) - 6) <= 0xFFFFFFFFFFFFFFFCLL)
        {
          __int16 v19 = objc_msgSend(v18, "identity", (void)v20);
          [v19 setAvailable:1];

          [*a3 addResource:v18];
        }
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v15);
  }
}

- (BOOL)_isUnsupportedFormatError:(id)a3
{
  id v4 = a3;
  LOBYTE(self) = [(objc_class *)[(CPLEngineDerivativesCache *)self derivativeGeneratorClass] isUnsupportedOriginalFormatError:v4];

  return (char)self;
}

- (id)cachedResourcesForReferenceResource:(id)a3 adjustment:(id)a4 includePosterFrame:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  int v33 = [(CPLEngineDerivativesCache *)self _finalFolderURLForGeneratedResourcesWithReferenceResource:v8 adjustment:a4 includePosterFrame:v5];
  id v9 = [v33 URLByAppendingPathComponent:@"entries.plist" isDirectory:0];
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithContentsOfURL:v9];
  if (v10)
  {
    uint64_t v11 = [v8 itemScopedIdentifier];
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id obj = v10;
    uint64_t v13 = [obj countByEnumeratingWithState:&v34 objects:v42 count:16];
    uint64_t v14 = (unsigned char *)&unk_1E9D43000;
    if (v13)
    {
      uint64_t v15 = v13;
      uint64_t v29 = v10;
      id v30 = v9;
      id v31 = v8;
      uint64_t v16 = *(void *)v35;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v35 != v16) {
            objc_enumerationMutation(obj);
          }
          long long v18 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          __int16 v19 = +[CPLArchiver unarchivedObjectWithPropertyList:v18 ofClass:objc_opt_class()];
          if (!v19)
          {

            uint64_t v14 = &unk_1E9D43000;
            id v8 = v31;
            if (_CPLSilentLogging)
            {
              id v12 = 0;
              id v10 = v29;
              id v9 = v30;
            }
            else
            {
              id v26 = __CPLDerivativesOSLogDomain();
              id v10 = v29;
              id v9 = v30;
              if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v39 = v11;
                __int16 v40 = 2112;
                id v41 = v18;
                _os_log_impl(&dword_1B4CAC000, v26, OS_LOG_TYPE_ERROR, "Found incorrect cached resource for %@ for %@", buf, 0x16u);
              }

              id v12 = 0;
            }
            goto LABEL_15;
          }
          long long v20 = v19;
          [v19 setItemScopedIdentifier:v11];
          long long v21 = [v20 identity];
          long long v22 = [v21 fileURL];

          long long v23 = [v22 lastPathComponent];
          id v24 = [v33 URLByAppendingPathComponent:v23 isDirectory:0];

          uint64_t v25 = [v20 identity];
          [v25 setFileURL:v24];

          [v12 addObject:v20];
        }
        uint64_t v15 = [obj countByEnumeratingWithState:&v34 objects:v42 count:16];
        if (v15) {
          continue;
        }
        break;
      }
      id v9 = v30;
      id v8 = v31;
      id v10 = v29;
      uint64_t v14 = (unsigned char *)&unk_1E9D43000;
    }
LABEL_15:

    if (!v14[2752])
    {
      __int16 v27 = __CPLDerivativesOSLogDomain();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v39 = v11;
        __int16 v40 = 2112;
        id v41 = v12;
        _os_log_impl(&dword_1B4CAC000, v27, OS_LOG_TYPE_DEBUG, "Found cached resource for %@: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (void)noteGeneratedResouces:(id)a3 haveBeenGeneratedForReferenceResource:(id)a4 adjustment:(id)a5 includePosterFrame:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [(CPLEngineDerivativesCache *)self _finalFolderURLForGeneratedResourcesWithReferenceResource:v11 adjustment:v12 includePosterFrame:v6];
  uint64_t v14 = [(CPLEngineDerivativesCache *)self _tempFolderURLForGeneratedResourcesWithReferenceResource:v11 adjustment:v12 includePosterFrame:v6];
  uint64_t v15 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v15 removeItemAtURL:v13 error:0];

  uint64_t v16 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v44 = 0;
  uint64_t v17 = (void *)v13;
  int v18 = [v16 moveItemAtURL:v14 toURL:v13 error:&v44];
  id v19 = v44;

  if (v18)
  {
    id v34 = v19;
    long long v35 = v14;
    id v36 = v12;
    id v37 = v11;
    long long v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v38 = v10;
    id obj = v10;
    uint64_t v21 = [obj countByEnumeratingWithState:&v40 objects:v47 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v41 != v23) {
            objc_enumerationMutation(obj);
          }
          uint64_t v25 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          id v26 = objc_msgSend(v25, "identity", v34, v35, v36, v37);
          __int16 v27 = [v26 fileURL];

          id v28 = [v27 lastPathComponent];
          uint64_t v29 = [v17 URLByAppendingPathComponent:v28 isDirectory:0];

          id v30 = [v25 identity];
          [v30 setFileURL:v29];

          id v31 = (void *)[v25 copy];
          [v31 setItemScopedIdentifier:0];
          v32 = +[CPLArchiver archivedPropertyListWithRootObject:v31];
          [v20 addObject:v32];
        }
        uint64_t v22 = [obj countByEnumeratingWithState:&v40 objects:v47 count:16];
      }
      while (v22);
    }

    int v33 = [v17 URLByAppendingPathComponent:@"entries.plist" isDirectory:0];
    [v20 writeToURL:v33 atomically:1];

    id v11 = v37;
    id v10 = v38;
    uint64_t v14 = v35;
    id v12 = v36;
    id v19 = v34;
LABEL_13:

    goto LABEL_14;
  }
  if (!_CPLSilentLogging)
  {
    long long v20 = __CPLDerivativesOSLogDomain();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v46 = v19;
      _os_log_impl(&dword_1B4CAC000, v20, OS_LOG_TYPE_ERROR, "Unable to cache generated derivatives: %@", buf, 0xCu);
    }
    goto LABEL_13;
  }
LABEL_14:
}

- (id)tempFolderURLForGeneratedResourcesWithReferenceResource:(id)a3 adjustment:(id)a4 includePosterFrame:(BOOL)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v6 = [(CPLEngineDerivativesCache *)self _tempFolderURLForGeneratedResourcesWithReferenceResource:a3 adjustment:a4 includePosterFrame:a5];
  id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v7 removeItemAtURL:v6 error:0];

  [(CPLEngineDerivativesCache *)self _createCacheFolderIfNecessary];
  id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v14 = 0;
  char v9 = [v8 createDirectoryAtURL:v6 withIntermediateDirectories:0 attributes:0 error:&v14];
  id v10 = v14;

  if ((v9 & 1) == 0 && !_CPLSilentLogging)
  {
    id v11 = __CPLDerivativesOSLogDomain();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = [v6 path];
      *(_DWORD *)buf = 138412546;
      uint64_t v16 = v12;
      __int16 v17 = 2112;
      id v18 = v10;
      _os_log_impl(&dword_1B4CAC000, v11, OS_LOG_TYPE_ERROR, "Can't create derivatives folder at %@: %@", buf, 0x16u);
    }
  }

  return v6;
}

- (id)_finalFolderURLForGeneratedResourcesWithReferenceResource:(id)a3 adjustment:(id)a4 includePosterFrame:(BOOL)a5
{
  BOOL v6 = [(CPLEngineDerivativesCache *)self _folderNameForReferenceResource:a3 adjustment:a4 includePosterFrame:a5];
  id v7 = [(NSURL *)self->_cacheURL URLByAppendingPathComponent:v6 isDirectory:1];

  return v7;
}

- (id)_tempFolderURLForGeneratedResourcesWithReferenceResource:(id)a3 adjustment:(id)a4 includePosterFrame:(BOOL)a5
{
  BOOL v6 = [(CPLEngineDerivativesCache *)self _folderNameForReferenceResource:a3 adjustment:a4 includePosterFrame:a5];
  id v7 = [v6 stringByAppendingString:@"~~tmp"];

  id v8 = [(NSURL *)self->_cacheURL URLByAppendingPathComponent:v7 isDirectory:1];

  return v8;
}

- (void)_createCacheFolderIfNecessary
{
  if (self->_tryCreatingCacheFolder)
  {
    uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v3 createDirectoryAtURL:self->_cacheURL withIntermediateDirectories:0 attributes:0 error:0];

    self->_tryCreatingCacheFolder = 0;
  }
}

- (id)_folderNameForReferenceResource:(id)a3 adjustment:(id)a4 includePosterFrame:(BOOL)a5
{
  BOOL v5 = [(CPLEngineDerivativesCache *)self _cacheKeyForReferenceResource:a3 adjustments:a4 includePosterFrame:a5];
  BOOL v6 = [v5 stringByReplacingOccurrencesOfString:@"/" withString:@":"];

  return v6;
}

- (id)_cacheKeyForReferenceResource:(id)a3 adjustments:(id)a4 includePosterFrame:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  char v9 = [v8 itemScopedIdentifier];
  id v10 = [NSString alloc];
  id v11 = [v9 scopeIdentifier];
  id v12 = [v9 identifier];
  uint64_t v13 = [v8 identity];

  uint64_t v14 = [v13 fingerPrint];
  uint64_t v15 = (void *)v14;
  if (v7)
  {
    uint64_t v16 = [v7 otherAdjustmentsFingerprint];
    __int16 v17 = (void *)v16;
    if (v16)
    {
      id v18 = "no-poster";
      if (v5) {
        id v18 = "";
      }
      uint64_t v19 = (void *)[v10 initWithFormat:@"%@-%@-%@-%@%s", v11, v12, v15, v16, v18];
    }
    else
    {
      uint64_t v21 = [v7 similarToOriginalAdjustmentsFingerprint];
      uint64_t v22 = (void *)v21;
      uint64_t v23 = "no-poster";
      if (v5) {
        uint64_t v23 = "";
      }
      uint64_t v19 = (void *)[v10 initWithFormat:@"%@-%@-%@-%@%s", v11, v12, v15, v21, v23];
    }
  }
  else
  {
    long long v20 = "no-poster";
    if (v5) {
      long long v20 = "";
    }
    uint64_t v19 = (void *)[v10 initWithFormat:@"%@-%@-%@%s", v11, v12, v14, v20];
  }

  return v19;
}

- (void)discardCache
{
  uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v3 removeItemAtURL:self->_cacheURL error:0];

  self->_tryCreatingCacheFolder = 1;
}

- (CPLEngineDerivativesCache)initWithCacheURL:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CPLEngineDerivativesCache;
  BOOL v5 = [(CPLEngineDerivativesCache *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    cacheURL = v5->_cacheURL;
    v5->_cacheURL = (NSURL *)v6;

    uint64_t v8 = [(NSURL *)v5->_cacheURL URLByAppendingPathComponent:@"entries.plist" isDirectory:0];
    cacheMappingURL = v5->_cacheMappingURL;
    v5->_cacheMappingURL = (NSURL *)v8;

    v5->_tryCreatingCacheFolder = 1;
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.cpl.derivativescache", 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v10;
  }
  return v5;
}

@end