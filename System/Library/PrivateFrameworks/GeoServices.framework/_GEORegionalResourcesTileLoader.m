@interface _GEORegionalResourcesTileLoader
- (_GEORegionalResourcesTileLoader)init;
- (uint64_t)tileKeyPtr;
- (void)cancel;
- (void)dealloc;
- (void)loadResourcesForTileKey:(uint64_t)a3 manifestConfiguration:(void *)a4 auditToken:(void *)a5 signpostID:(uint64_t)a6 finished:(void *)a7 error:(void *)a8;
@end

@implementation _GEORegionalResourcesTileLoader

- (void)loadResourcesForTileKey:(uint64_t)a3 manifestConfiguration:(void *)a4 auditToken:(void *)a5 signpostID:(uint64_t)a6 finished:(void *)a7 error:(void *)a8
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v15 = a4;
  id v74 = a5;
  id v16 = a7;
  id v17 = a8;
  objc_storeStrong((id *)(a1 + 16), a4);
  v18 = +[GEOResourceManifestManager modernManagerForConfiguration:*(void *)(a1 + 16)];
  v19 = [v18 activeTileGroup];

  v20 = objc_alloc_init(GEORegionalResourceTileData);
  v21 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v20;

  uint64_t v75 = a1;
  *(_OWORD *)(a1 + 36) = *(_OWORD *)a3;
  v22 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v23 = (*(void *)(a3 + 1) >> 40) & 0x3FLL;
  if (v23 == 1)
  {
    unint64_t v33 = *(void *)(a3 + 1);
    if (v33 < [v19 attributionsCount])
    {
      uint64_t v34 = [v19 attributionAtIndex:v33];
      if (v34)
      {
        v35 = (void *)v34;
        [*(id *)(a1 + 8) addAttribution:v34];
        id v68 = v17;
        id v69 = v16;
        if ((*(void *)(a3 + 1) >> 54))
        {
          v36 = v35;
          v37 = (void *)MEMORY[0x1E4F1CAD0];
          v38 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
          v39 = v37;
          v35 = v36;
          v32 = [v39 setWithObject:v38];
        }
        else
        {
          v32 = GEOAllPossibleFilterScales();
        }
        uint64_t v67 = a3;
        v41 = GEORegionalResourceTileKeyActiveScenarios(a3);
        long long v79 = 0u;
        long long v80 = 0u;
        long long v81 = 0u;
        long long v82 = 0u;
        v66 = v35;
        v42 = [v35 resources];
        uint64_t v51 = [v42 countByEnumeratingWithState:&v79 objects:v87 count:16];
        if (v51)
        {
          uint64_t v52 = v51;
          id v73 = v15;
          v65 = v19;
          uint64_t v53 = *(void *)v80;
          do
          {
            for (uint64_t i = 0; i != v52; ++i)
            {
              if (*(void *)v80 != v53) {
                objc_enumerationMutation(v42);
              }
              v55 = *(void **)(*((void *)&v79 + 1) + 8 * i);
              if (objc_msgSend(v55, "_geo_isRelevantForScales:scenarios:", v32, v41))
              {
                [v22 addObject:v55];
                if ([v55 resourceType] == 3)
                {
                  v56 = *(void **)(v75 + 8);
                  v57 = [v55 filename];
                  [v56 addIcon:v57];
                }
              }
            }
            uint64_t v52 = [v42 countByEnumeratingWithState:&v79 objects:v87 count:16];
          }
          while (v52);
          v19 = v65;
          id v15 = v73;
        }
        goto LABEL_41;
      }
    }
    v25 = v74;
  }
  else
  {
    if (v23)
    {
LABEL_42:
      uint64_t v71 = a6;
      v58 = +[GEOResourceRequester sharedRequester];
      uint64_t v59 = (*(void *)(a3 + 1) >> 62) & 1;
      v60 = v19;
      uint64_t v61 = *(void *)(v75 + 16);
      global_queue = (void *)geo_get_global_queue();
      v76[0] = MEMORY[0x1E4F143A8];
      v76[1] = 3221225472;
      v76[2] = __118___GEORegionalResourcesTileLoader_loadResourcesForTileKey_manifestConfiguration_auditToken_signpostID_finished_error___block_invoke;
      v76[3] = &unk_1E53EC908;
      id v77 = v17;
      id v78 = v16;
      v76[4] = v75;
      uint64_t v63 = v61;
      v19 = v60;
      v25 = v74;
      [v58 fetchResources:v22 force:v59 unpack:0 manifestConfiguration:v63 auditToken:v74 signpostID:v71 queue:global_queue handler:v76];

      goto LABEL_43;
    }
    unint64_t v24 = *(void *)(a3 + 1);
    v25 = v74;
    if (v24 < [v19 regionalResourcesCount])
    {
      uint64_t v26 = [v19 regionalResourceAtIndex:v24];
      if (v26)
      {
        v27 = (void *)v26;
        v64 = v19;
        id v68 = v17;
        id v69 = v16;
        if ((*(void *)(a3 + 1) >> 54))
        {
          v28 = (void *)v26;
          v29 = (void *)MEMORY[0x1E4F1CAD0];
          v30 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
          v31 = v29;
          v27 = v28;
          v32 = [v31 setWithObject:v30];
        }
        else
        {
          v32 = GEOAllPossibleFilterScales();
        }
        uint64_t v67 = a3;
        v41 = GEORegionalResourceTileKeyActiveScenarios(a3);
        long long v83 = 0u;
        long long v84 = 0u;
        long long v85 = 0u;
        long long v86 = 0u;
        v66 = v27;
        v42 = [v27 resources];
        uint64_t v43 = [v42 countByEnumeratingWithState:&v83 objects:v88 count:16];
        if (v43)
        {
          uint64_t v44 = v43;
          uint64_t v70 = a6;
          id v72 = v15;
          uint64_t v45 = *(void *)v84;
          do
          {
            for (uint64_t j = 0; j != v44; ++j)
            {
              if (*(void *)v84 != v45) {
                objc_enumerationMutation(v42);
              }
              v47 = *(void **)(*((void *)&v83 + 1) + 8 * j);
              if (objc_msgSend(v47, "_geo_isRelevantForScales:scenarios:", v32, v41))
              {
                [v22 addObject:v47];
                int v48 = [v47 resourceType];
                v49 = *(void **)(v75 + 8);
                v50 = [v47 filename];
                if (v48 == 3) {
                  [v49 addIcon:v50];
                }
                else {
                  [v49 addFilename:v50];
                }
              }
            }
            uint64_t v44 = [v42 countByEnumeratingWithState:&v83 objects:v88 count:16];
          }
          while (v44);
          a6 = v70;
          id v15 = v72;
        }
        v19 = v64;
LABEL_41:

        id v17 = v68;
        id v16 = v69;
        a3 = v67;
        goto LABEL_42;
      }
    }
  }
  if (v17)
  {
    v40 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-10];
    (*((void (**)(id, void *))v17 + 2))(v17, v40);
  }
LABEL_43:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceLoader, 0);
  objc_storeStrong((id *)&self->_manifestConfiguration, 0);

  objc_storeStrong((id *)&self->_tile, 0);
}

- (_GEORegionalResourcesTileLoader)init
{
  v6.receiver = self;
  v6.super_class = (Class)_GEORegionalResourcesTileLoader;
  v2 = [(_GEORegionalResourcesTileLoader *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void)dealloc
{
  [(_GEORegionalResourcesTileLoader *)self cancel];
  v3.receiver = self;
  v3.super_class = (Class)_GEORegionalResourcesTileLoader;
  [(_GEORegionalResourcesTileLoader *)&v3 dealloc];
}

- (void)cancel
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  resourceLoader = self->_resourceLoader;
  self->_resourceLoader = 0;
  v5 = resourceLoader;

  os_unfair_lock_unlock(p_lock);
  [(GEOResourceLoader *)v5 cancel];
}

- (uint64_t)tileKeyPtr
{
  return a1 + 36;
}

@end