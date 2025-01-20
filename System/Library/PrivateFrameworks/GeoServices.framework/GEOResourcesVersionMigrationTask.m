@interface GEOResourcesVersionMigrationTask
@end

@implementation GEOResourcesVersionMigrationTask

void __173___GEOResourcesVersionMigrationTask_initForWithMigrator_manifestConfiguration_newTileGroup_inResourceManifest_dataSet_oldTileGroup_activeScales_activeScenarios_activeNames___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained cancel];
}

void __78___GEOResourcesVersionMigrationTask_startWithCompletionHandler_callbackQueue___block_invoke(uint64_t a1)
{
  uint64_t v135 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 48) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 96);
  *(void *)(v3 + 96) = v2;

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 104), *(id *)(a1 + 40));
  v107 = (id *)a1;
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = *(void **)(v5 + 72);
  unint64_t v7 = 0x1E4F1C000uLL;
  if (v6)
  {
    v8 = *(void **)(v5 + 80);
    if (v8)
    {
      v9 = *(void **)(v5 + 48);
      id v10 = *(id *)(v5 + 40);
      id v11 = v9;
      id v12 = v6;
      id v13 = v8;
      v14 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v10, "resourceIndexsCount"));
      if ([v10 resourceIndexsCount])
      {
        unint64_t v15 = 0;
        do
        {
          unsigned int v16 = [v10 resourceIndexAtIndex:v15];
          if ([v11 resourcesCount] > (unint64_t)v16)
          {
            v17 = [v11 resourceAtIndex:v16];
            if (![v17 regionsCount]
              && objc_msgSend(v17, "_geo_isRelevantForScales:scenarios:", v12, v13))
            {
              [v14 addObject:v17];
            }
          }
          ++v15;
        }
        while (v15 < [v10 resourceIndexsCount]);
      }
      id v18 = v10;
      id v19 = v11;
      id v20 = v12;
      id v21 = v13;
      id v22 = v14;
      if ([v18 attributionIndexsCount])
      {
        unint64_t v23 = 0;
        id v108 = v18;
        id v104 = v19;
        do
        {
          unsigned int v24 = [v18 attributionIndexAtIndex:v23];
          if ([v19 attributionsCount] > (unint64_t)v24)
          {
            v25 = [v19 attributionAtIndex:v24];
            if (![v25 regionsCount])
            {
              long long v127 = 0u;
              long long v128 = 0u;
              long long v125 = 0u;
              long long v126 = 0u;
              v26 = [v25 resources];
              uint64_t v27 = [v26 countByEnumeratingWithState:&v125 objects:buf count:16];
              if (v27)
              {
                uint64_t v28 = v27;
                uint64_t v29 = *(void *)v126;
                do
                {
                  for (uint64_t i = 0; i != v28; ++i)
                  {
                    if (*(void *)v126 != v29) {
                      objc_enumerationMutation(v26);
                    }
                    v31 = *(void **)(*((void *)&v125 + 1) + 8 * i);
                    if (objc_msgSend(v31, "_geo_isRelevantForScales:scenarios:", v20, v21)) {
                      [v22 addObject:v31];
                    }
                  }
                  uint64_t v28 = [v26 countByEnumeratingWithState:&v125 objects:buf count:16];
                }
                while (v28);
              }

              id v18 = v108;
              id v19 = v104;
            }
          }
          ++v23;
        }
        while (v23 < [v18 attributionIndexsCount]);
      }

      id v32 = v18;
      id v33 = v19;
      id v109 = v20;
      id v34 = v21;
      v35 = v32;
      id v105 = v34;
      id v36 = v22;
      if (![v32 tileSetsCount]) {
        goto LABEL_69;
      }
      uint64_t v37 = 0;
      v102 = v36;
      while (1)
      {
        unint64_t v38 = [v35 tileSetAtIndex:v37];
        if ((unint64_t)[v33 tileSetsCount] <= HIDWORD(v38)) {
          goto LABEL_56;
        }
        v39 = [v33 tileSetAtIndex:HIDWORD(v38)];
        long long v125 = 0u;
        long long v126 = 0u;
        long long v127 = 0u;
        long long v128 = 0u;
        v40 = [v39 validVersions];
        uint64_t v41 = [v40 countByEnumeratingWithState:&v125 objects:buf count:16];
        if (!v41) {
          goto LABEL_55;
        }
        uint64_t v42 = v41;
        uint64_t v43 = *(void *)v126;
LABEL_32:
        uint64_t v44 = 0;
        while (1)
        {
          if (*(void *)v126 != v43) {
            objc_enumerationMutation(v40);
          }
          v45 = *(_DWORD **)(*((void *)&v125 + 1) + 8 * v44);
          if (!v45)
          {
            if (!v38)
            {
              id v53 = 0;
LABEL_54:
              v35 = v32;
              id v36 = v102;
              goto LABEL_55;
            }
            goto LABEL_37;
          }
          if (v45[21] == v38) {
            break;
          }
LABEL_37:
          if (v42 == ++v44)
          {
            uint64_t v46 = [v40 countByEnumeratingWithState:&v125 objects:buf count:16];
            uint64_t v42 = v46;
            if (!v46) {
              goto LABEL_54;
            }
            goto LABEL_32;
          }
        }
        v47 = v45;

        -[GEOTileSetVersion _readGenericTiles]((uint64_t)v47);
        if (!*((void *)v47 + 7))
        {
          v40 = v47;
          goto LABEL_54;
        }
        unint64_t v48 = 0;
        v35 = v32;
        id v36 = v102;
        do
        {
          unsigned int v49 = -[GEOTileSetVersion genericTileAtIndex:]((uint64_t)v47, v48);
          if ((v50 & 0x100000000) != 0)
          {
            unsigned int v51 = v49;
            if ([v33 resourcesCount] > (unint64_t)v49)
            {
              v52 = [v33 resourceAtIndex:v51];
              if (objc_msgSend(v52, "_geo_isRelevantForScales:scenarios:", v109, v105)
                && ([v102 containsObject:v52] & 1) == 0)
              {
                [v102 addObject:v52];
              }
            }
          }
          ++v48;
          -[GEOTileSetVersion _readGenericTiles]((uint64_t)v47);
        }
        while (v48 < *((void *)v47 + 7));
        v40 = v47;
LABEL_55:

LABEL_56:
        if (++v37 >= (unint64_t)[v35 tileSetsCount])
        {
LABEL_69:

          unint64_t v7 = 0x1E4F1C000uLL;
          goto LABEL_70;
        }
      }
    }
  }
  v54 = *(void **)(v5 + 88);
  if (!v54)
  {
    v97 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-13 reason:@"Nothing to do"];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __78___GEOResourcesVersionMigrationTask_startWithCompletionHandler_callbackQueue___block_invoke_2;
    block[3] = &unk_1E53D7C50;
    v98 = v107[5];
    id v99 = v107[6];
    id v123 = v97;
    id v124 = v99;
    id v67 = v97;
    dispatch_async(v98, block);

    v66 = v124;
    goto LABEL_101;
  }
  v55 = *(void **)(v5 + 48);
  id v56 = *(id *)(v5 + 40);
  id v57 = v55;
  id v58 = v54;
  v59 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v56, "resourceIndexsCount"));
  if ([v56 resourceIndexsCount])
  {
    unint64_t v60 = 0;
    do
    {
      unsigned int v61 = [v56 resourceIndexAtIndex:v60];
      if ([v57 resourcesCount] > (unint64_t)v61)
      {
        v62 = [v57 resourceAtIndex:v61];
        if (![v62 regionsCount])
        {
          if (objc_msgSend(v62, "_geo_isExplicit"))
          {
            [v62 filename];
            v64 = unint64_t v63 = v7;
            int v65 = [v58 containsObject:v64];

            unint64_t v7 = v63;
            if (v65) {
              [v59 addObject:v62];
            }
          }
        }
      }
      ++v60;
    }
    while (v60 < [v56 resourceIndexsCount]);
  }

  id v36 = v59;
LABEL_70:
  v66 = [*(id *)(v7 + 2632) array];
  v110 = [*(id *)(v7 + 2632) array];
  long long v118 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  id v67 = v36;
  uint64_t v68 = [v67 countByEnumeratingWithState:&v118 objects:v130 count:16];
  if (!v68) {
    goto LABEL_99;
  }
  uint64_t v70 = v68;
  uint64_t v71 = *(void *)v119;
  *(void *)&long long v69 = 138478083;
  long long v100 = v69;
  id v103 = v67;
  v106 = v66;
  uint64_t v101 = *(void *)v119;
  do
  {
    for (uint64_t j = 0; j != v70; ++j)
    {
      if (*(void *)v119 != v71) {
        objc_enumerationMutation(v67);
      }
      v73 = *(void **)(*((void *)&v118 + 1) + 8 * j);
      unsigned int v74 = objc_msgSend(v73, "connectionType", v100);
      v75 = v66;
      if (v74 >= 2)
      {
        if (v74 == 3) {
          goto LABEL_92;
        }
        if (v74 != 2) {
          continue;
        }
        long long v116 = 0u;
        long long v117 = 0u;
        long long v114 = 0u;
        long long v115 = 0u;
        v76 = [*((id *)v107[4] + 8) staleResources];
        uint64_t v77 = [v76 countByEnumeratingWithState:&v114 objects:v129 count:16];
        if (v77)
        {
          uint64_t v78 = v77;
          uint64_t v79 = *(void *)v115;
          while (2)
          {
            for (uint64_t k = 0; k != v78; ++k)
            {
              if (*(void *)v115 != v79) {
                objc_enumerationMutation(v76);
              }
              v81 = *(void **)(*((void *)&v114 + 1) + 8 * k);
              v82 = [v81 desiredResource];
              int v83 = [v82 isEqual:v73];

              if (v83)
              {
                double Current = CFAbsoluteTimeGetCurrent();
                [v81 originalTimestamp];
                double v86 = Current - v85;
                double v87 = CFAbsoluteTimeGetCurrent();
                [v81 originalTimestamp];
                double v89 = v87 - v88;
                double v90 = v86 >= 0.0 ? v89 : -v89;
                if (v90 > (double)[v73 preferWiFiAllowedStaleThreshold])
                {
                  v94 = GEOGetResourceManifestLog();
                  if (os_log_type_enabled(v94, OS_LOG_TYPE_INFO))
                  {
                    v95 = [v73 filename];
                    *(_DWORD *)buf = v100;
                    v132 = v95;
                    __int16 v133 = 2048;
                    double v134 = v90;
                    _os_log_impl(&dword_188D96000, v94, OS_LOG_TYPE_INFO, "Resource '%{private}@' has been stale for %f seconds, which is too long. Will force this resource to load over any type of connection.", buf, 0x16u);
                  }
                  id v67 = v103;
                  v66 = v106;
                  v75 = v106;
                  uint64_t v71 = v101;
                  goto LABEL_96;
                }
              }
            }
            uint64_t v78 = [v76 countByEnumeratingWithState:&v114 objects:v129 count:16];
            if (v78) {
              continue;
            }
            break;
          }
        }

        char BOOL = GEOConfigGetBOOL(GeoServicesConfig_PreferWiFiResourcesCanFallBackToNothing, (uint64_t)off_1E9114038);
        v75 = v110;
        id v67 = v103;
        v66 = v106;
        uint64_t v71 = v101;
        if ((BOOL & 1) == 0)
        {
          v92 = [v107[4] _staleResourceForResource:v73];
          int v93 = [v92 hasFallbackResource];

          v75 = v106;
          if (v93) {
LABEL_92:
          }
            v75 = v110;
        }
      }
LABEL_96:
      [v75 addObject:v73];
    }
    uint64_t v70 = [v67 countByEnumeratingWithState:&v118 objects:v130 count:16];
  }
  while (v70);
LABEL_99:

  objc_msgSend(*((id *)v107[4] + 18), "setTotalUnitCount:", objc_msgSend(v67, "count"));
  id v96 = v107[4];
  v111[0] = MEMORY[0x1E4F143A8];
  v111[1] = 3221225472;
  v111[2] = __78___GEOResourcesVersionMigrationTask_startWithCompletionHandler_callbackQueue___block_invoke_83;
  v111[3] = &unk_1E53E1528;
  v111[4] = v96;
  id v112 = v107[5];
  id v113 = v107[6];
  [v96 _loadImmediateResources:v66 conditionalWifiResources:v110 completionHandler:v111];

LABEL_101:
}

uint64_t __78___GEOResourcesVersionMigrationTask_startWithCompletionHandler_callbackQueue___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __78___GEOResourcesVersionMigrationTask_startWithCompletionHandler_callbackQueue___block_invoke_83(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v11 + 24))
  {
    objc_storeStrong((id *)(v11 + 128), a2);
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 136), a3);
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    id v20 = __78___GEOResourcesVersionMigrationTask_startWithCompletionHandler_callbackQueue___block_invoke_2_84;
    id v21 = &unk_1E53D7C50;
    id v12 = *(NSObject **)(a1 + 40);
    id v23 = *(id *)(a1 + 48);
    id v22 = v10;
    dispatch_async(v12, &v18);
    uint64_t v13 = *(void *)(a1 + 32);
    v14 = *(void **)(v13 + 96);
    *(void *)(v13 + 96) = 0;

    uint64_t v15 = *(void *)(a1 + 32);
    unsigned int v16 = *(void **)(v15 + 104);
    *(void *)(v15 + 104) = 0;

    *(unsigned char *)(*(void *)(a1 + 32) + 24) = 0;
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    objc_msgSend(WeakRetained, "_removeRunningTask:", *(void *)(a1 + 32), v18, v19, v20, v21);
  }
}

uint64_t __78___GEOResourcesVersionMigrationTask_startWithCompletionHandler_callbackQueue___block_invoke_2_84(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __43___GEOResourcesVersionMigrationTask_cancel__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 24);
  *(unsigned char *)(v2 + 24) = 0;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 168);
  *(void *)(v4 + 168) = 0;

  [*(id *)(*(void *)(a1 + 32) + 112) cancel];
  [*(id *)(*(void *)(a1 + 32) + 120) cancel];
  [*(id *)(*(void *)(a1 + 32) + 144) cancel];
  if (v3)
  {
    v6 = (void *)MEMORY[0x18C120660](*(void *)(*(void *)(a1 + 32) + 96));
    uint64_t v7 = *(void *)(a1 + 32);
    id v9 = *(void **)(v7 + 96);
    id v8 = *(void **)(v7 + 104);
    *(void *)(v7 + 96) = 0;
    id v10 = v8;

    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = *(void **)(v11 + 104);
    *(void *)(v11 + 104) = 0;

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43___GEOResourcesVersionMigrationTask_cancel__block_invoke_2;
    block[3] = &unk_1E53DA028;
    id v16 = v6;
    id v13 = v6;
    dispatch_async(v10, block);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained _removeRunningTask:*(void *)(a1 + 32)];
}

void __43___GEOResourcesVersionMigrationTask_cancel__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-2];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __55___GEOResourcesVersionMigrationTask_populateTileGroup___block_invoke(uint64_t a1)
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(a1 + 32) + 128) count])
  {
    id v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 128) mutableCopy];
    [*(id *)(a1 + 40) setActiveResources:v2];
  }
  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  uint64_t v58 = a1;
  id v3 = *(id *)(*(void *)(a1 + 32) + 136);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v85 objects:v97 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v86;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v86 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v85 + 1) + 8 * i);
        id v9 = GEOGetResourceManifestLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          id v10 = [v8 filename];
          *(_DWORD *)buf = 138477827;
          id v96 = v10;
          _os_log_impl(&dword_188D96000, v9, OS_LOG_TYPE_INFO, "Looking for fallback information for stale resource '%{private}@'", buf, 0xCu);
        }
        uint64_t v11 = [*(id *)(a1 + 32) _staleResourceForResource:v8];
        [*(id *)(a1 + 40) addStaleResource:v11];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v85 objects:v97 count:16];
    }
    while (v5);
  }

  id v12 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v13 = [MEMORY[0x1E4F1CAD0] setWithObject:&unk_1ED73DC90];
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  v14 = [*(id *)(*(void *)(a1 + 32) + 48) resources];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v81 objects:v94 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v82;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v82 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void **)(*((void *)&v81 + 1) + 8 * v18);
        if (![v19 regionsCount]
          && [v19 filtersCount]
          && objc_msgSend(v19, "_geo_isRelevantForScales:scenarios:", 0, v13))
        {
          [*(id *)(v58 + 40) addExplicitResource:v19];
        }
        ++v18;
      }
      while (v16 != v18);
      uint64_t v20 = [v14 countByEnumeratingWithState:&v81 objects:v94 count:16];
      uint64_t v16 = v20;
    }
    while (v20);
  }
  id v56 = (void *)v13;

  v79[0] = MEMORY[0x1E4F143A8];
  v79[1] = 3221225472;
  v79[2] = __55___GEOResourcesVersionMigrationTask_populateTileGroup___block_invoke_89;
  v79[3] = &unk_1E53E1550;
  id v55 = v12;
  id v80 = v55;
  id v21 = (void (**)(void, void))MEMORY[0x18C120660](v79);
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  id v22 = [*(id *)(v58 + 40) activeResources];
  uint64_t v23 = [v22 countByEnumeratingWithState:&v75 objects:v93 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v76;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v76 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = [*(id *)(*((void *)&v75 + 1) + 8 * j) filename];
        ((void (**)(void, void *))v21)[2](v21, v27);
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v75 objects:v93 count:16];
    }
    while (v24);
  }

  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  uint64_t v28 = [*(id *)(v58 + 40) explicitResources];
  uint64_t v29 = [v28 countByEnumeratingWithState:&v71 objects:v92 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v72;
    do
    {
      for (uint64_t k = 0; k != v30; ++k)
      {
        if (*(void *)v72 != v31) {
          objc_enumerationMutation(v28);
        }
        id v33 = [*(id *)(*((void *)&v71 + 1) + 8 * k) filename];
        ((void (**)(void, void *))v21)[2](v21, v33);
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v71 objects:v92 count:16];
    }
    while (v30);
  }

  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v34 = [*(id *)(v58 + 40) staleResources];
  uint64_t v35 = [v34 countByEnumeratingWithState:&v67 objects:v91 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v68;
    do
    {
      for (uint64_t m = 0; m != v36; ++m)
      {
        if (*(void *)v68 != v37) {
          objc_enumerationMutation(v34);
        }
        v39 = *(void **)(*((void *)&v67 + 1) + 8 * m);
        v40 = [v39 fallbackResource];
        int v41 = [v40 hasFilename];

        if (v41)
        {
          uint64_t v42 = [v39 fallbackResource];
          uint64_t v43 = [v42 filename];
          ((void (**)(void, void *))v21)[2](v21, v43);
        }
      }
      uint64_t v36 = [v34 countByEnumeratingWithState:&v67 objects:v91 count:16];
    }
    while (v36);
  }

  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  obuint64_t j = [*(id *)(*(void *)(v58 + 32) + 48) attributions];
  uint64_t v44 = [obj countByEnumeratingWithState:&v63 objects:v90 count:16];
  if (v44)
  {
    uint64_t v45 = v44;
    uint64_t v46 = *(void *)v64;
    do
    {
      for (uint64_t n = 0; n != v45; ++n)
      {
        if (*(void *)v64 != v46) {
          objc_enumerationMutation(obj);
        }
        unint64_t v48 = *(void **)(*((void *)&v63 + 1) + 8 * n);
        if (![v48 regionsCount])
        {
          long long v61 = 0u;
          long long v62 = 0u;
          long long v59 = 0u;
          long long v60 = 0u;
          unsigned int v49 = [v48 resources];
          uint64_t v50 = [v49 countByEnumeratingWithState:&v59 objects:v89 count:16];
          if (v50)
          {
            uint64_t v51 = v50;
            uint64_t v52 = *(void *)v60;
            do
            {
              for (iuint64_t i = 0; ii != v51; ++ii)
              {
                if (*(void *)v60 != v52) {
                  objc_enumerationMutation(v49);
                }
                v54 = [*(id *)(*((void *)&v59 + 1) + 8 * ii) filename];
                ((void (**)(void, void *))v21)[2](v21, v54);
              }
              uint64_t v51 = [v49 countByEnumeratingWithState:&v59 objects:v89 count:16];
            }
            while (v51);
          }
        }
      }
      uint64_t v45 = [obj countByEnumeratingWithState:&v63 objects:v90 count:16];
    }
    while (v45);
  }

  [*(id *)(v58 + 40) setResourceCanonicalNameToFileName:v55];
}

void __55___GEOResourcesVersionMigrationTask_populateTileGroup___block_invoke_89(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 length])
  {
    id v3 = GEOCanonicalResourceNameForVersionedName(v4);
    if ([v3 length]) {
      [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:v3];
    }
  }
}

void __104___GEOResourcesVersionMigrationTask__loadImmediateResources_conditionalWifiResources_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
    uint64_t v7 = +[GEOMapsAuthServiceHelper sharedAuthHelper];
    [v7 checkNetworkError:v6 sendingGeoDErrorIfApplicable:-1001];

    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(void **)(v8 + 168);
    *(void *)(v8 + 168) = 0;
  }
  else
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 144), "becomeCurrentWithPendingUnitCount:", objc_msgSend(*(id *)(a1 + 40), "count"));
    id v10 = objc_alloc(*(Class *)(a1 + 96));
    uint64_t v25 = *(void *)(a1 + 48);
    id v26 = v10;
    uint64_t v11 = +[GEOApplicationAuditToken currentProcessAuditToken];
    uint64_t v12 = *(void *)(a1 + 64);
    uint64_t v24 = *(void *)(a1 + 56);
    uint64_t v13 = *(void *)(a1 + 40);
    uint64_t v14 = *(void *)(a1 + 104);
    uint64_t v16 = *(void *)(a1 + 72);
    uint64_t v15 = *(void *)(a1 + 80);
    uint64_t v17 = GEOGetResourceManifestLog();
    LOBYTE(v23) = 0;
    uint64_t v18 = [v26 initWithTargetDirectory:v25 auditToken:v11 baseURL:v24 alternateURLs:v12 proxyURL:v16 resources:v13 forceUpdateCheck:v23 maximumConcurrentLoads:v14 additionalDirectoryToConsider:v15 log:v17 signpostID:0];
    uint64_t v19 = *(void *)(a1 + 32);
    uint64_t v20 = *(void **)(v19 + 120);
    *(void *)(v19 + 120) = v18;

    [*(id *)(*(void *)(a1 + 32) + 120) setRequiresWiFi:1];
    [*(id *)(*(void *)(a1 + 32) + 144) resignCurrent];
    uint64_t v21 = *(void *)(a1 + 32);
    id v22 = *(void **)(v21 + 120);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __104___GEOResourcesVersionMigrationTask__loadImmediateResources_conditionalWifiResources_completionHandler___block_invoke_2;
    v27[3] = &unk_1E53E1578;
    v27[4] = v21;
    id v28 = v5;
    id v29 = *(id *)(a1 + 40);
    id v30 = *(id *)(a1 + 88);
    [v22 startWithCompletionHandler:v27 callbackQueue:*(void *)(*(void *)(a1 + 32) + 16)];
  }
}

void __104___GEOResourcesVersionMigrationTask__loadImmediateResources_conditionalWifiResources_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a2;
  id v9 = [v3 arrayWithArray:v4];
  [v9 addObjectsFromArray:v5];
  id v6 = (void *)[*(id *)(a1 + 48) mutableCopy];
  [v6 removeObjectsInArray:v5];

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void **)(v7 + 168);
  *(void *)(v7 + 168) = 0;
}

@end