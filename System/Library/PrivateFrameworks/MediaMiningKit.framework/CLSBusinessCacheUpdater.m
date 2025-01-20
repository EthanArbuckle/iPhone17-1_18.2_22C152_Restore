@interface CLSBusinessCacheUpdater
- (CLSBusinessCacheUpdater)initWithBusinessCategoryCache:(id)a3;
- (id)_resolvedBusinessMUIDs:(id)a3 progressBlock:(id)a4 error:(id *)a5;
- (id)enrichedBusinessItemsByMuidsForBusinessItems:(id)a3 progressBlock:(id)a4;
- (id)enrichedBusinessItemsByMuidsForMuids:(id)a3 progressBlock:(id)a4;
@end

@implementation CLSBusinessCacheUpdater

- (void).cxx_destruct
{
}

- (id)_resolvedBusinessMUIDs:(id)a3 progressBlock:(id)a4 error:(id *)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = MEMORY[0x1D2602540]();
  v11 = (void *)v10;
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x2020000000;
  char v42 = 0;
  v23 = v8;
  if (v10
    && (LOBYTE(v33) = 0,
        (*(void (**)(uint64_t, uint64_t *, double))(v10 + 16))(v10, &v33, 0.0),
        char v12 = *((unsigned char *)v40 + 24) | v33,
        (*((unsigned char *)v40 + 24) = v12) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      uint64_t buf = 0xE904000100;
      _os_log_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d", (uint8_t *)&buf, 8u);
    }
    id v13 = (id)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    dispatch_block_t v14 = dispatch_block_create((dispatch_block_flags_t)0, &__block_literal_global_3960);
    uint64_t buf = 0;
    p_uint64_t buf = &buf;
    uint64_t v46 = 0x3032000000;
    v47 = __Block_byref_object_copy__3961;
    v48 = __Block_byref_object_dispose__3962;
    id v49 = 0;
    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__3961;
    v37 = __Block_byref_object_dispose__3962;
    id v38 = 0;
    v15 = -[CLSBusinessGeoServiceQuery initWithMUIDs:]([CLSBusinessGeoServiceQuery alloc], "initWithMUIDs:", v8, v8);
    v16 = [[CLSGeoMapQueryHelper alloc] initWithQueryObject:v15];
    v17 = self->_businessCategoryCache;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __70__CLSBusinessCacheUpdater__resolvedBusinessMUIDs_progressBlock_error___block_invoke_17;
    v30[3] = &unk_1E690FB40;
    id v18 = v11;
    id v31 = v18;
    v32 = &v39;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __70__CLSBusinessCacheUpdater__resolvedBusinessMUIDs_progressBlock_error___block_invoke_2;
    v25[3] = &unk_1E690FB68;
    v28 = &buf;
    v29 = &v33;
    v19 = v17;
    v26 = v19;
    id v20 = v14;
    id v27 = v20;
    [(CLSGeoMapQueryHelper *)v16 launchQueryWithCancellerBlock:v30 completionBlock:v25];
    dispatch_block_wait(v20, 0xFFFFFFFFFFFFFFFFLL);
    if (a5) {
      *a5 = (id) p_buf[5];
    }
    if (v11
      && (char v24 = 0,
          (*((void (**)(id, char *, double))v18 + 2))(v18, &v24, 1.0),
          char v21 = *((unsigned char *)v40 + 24) | v24,
          (*((unsigned char *)v40 + 24) = v21) != 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        v43[0] = 67109120;
        v43[1] = 268;
        _os_log_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d", (uint8_t *)v43, 8u);
      }
      id v13 = (id)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      id v13 = (id)v34[5];
    }

    _Block_object_dispose(&v33, 8);
    _Block_object_dispose(&buf, 8);
  }
  _Block_object_dispose(&v39, 8);

  return v13;
}

uint64_t __70__CLSBusinessCacheUpdater__resolvedBusinessMUIDs_progressBlock_error___block_invoke_17(uint64_t a1, unsigned char *a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    char v5 = 0;
    uint64_t result = (*(uint64_t (**)(uint64_t, char *, double))(result + 16))(result, &v5, 0.5);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= v5;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
      *a2 = 1;
    }
  }
  return result;
}

void __70__CLSBusinessCacheUpdater__resolvedBusinessMUIDs_progressBlock_error___block_invoke_2(uint64_t a1, int a2, void *a3, void *a4)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  if (a2)
  {
    uint64_t v10 = [v9 resultingMapItems];
    v11 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v10, "count"));
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v12 = v10;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v24;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v23 + 1) + 8 * v16);
          id v18 = [CLSBusinessItem alloc];
          id v19 = -[CLSBusinessItem initFromMapItem:isoCountryCode:categoryOnly:](v18, "initFromMapItem:isoCountryCode:categoryOnly:", v17, 0, 0, (void)v23);
          if (v19) {
            [v11 addObject:v19];
          }

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v14);
    }

    uint64_t v20 = [*(id *)(a1 + 32) updateBusinessItems:v11];
    uint64_t v21 = *(void *)(*(void *)(a1 + 56) + 8);
    v22 = *(void **)(v21 + 40);
    *(void *)(v21 + 40) = v20;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)enrichedBusinessItemsByMuidsForMuids:(id)a3 progressBlock:(id)a4
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v39 = a4;
  uint64_t v7 = MEMORY[0x1D2602540]();
  id v8 = (void (**)(void, void, double))v7;
  uint64_t v67 = 0;
  v68 = &v67;
  uint64_t v69 = 0x2020000000;
  char v70 = 0;
  if (!v7
    || (LOBYTE(v59) = 0,
        (*(void (**)(uint64_t, uint64_t *, double))(v7 + 16))(v7, &v59, 0.0),
        char v9 = *((unsigned char *)v68 + 24) | v59,
        (*((unsigned char *)v68 + 24) = v9) == 0))
  {
    uint64_t v38 = [v6 count];
    v11 = [(CLSBusinessCategoryCache *)self->_businessCategoryCache businessItemsForMuids:v6];
    id v12 = (void *)[v6 mutableCopy];
    v36 = self;
    uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v38];
    v40 = v8;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id v14 = v11;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v63 objects:v79 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v64;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v64 != v16) {
            objc_enumerationMutation(v14);
          }
          id v18 = *(void **)(*((void *)&v63 + 1) + 8 * i);
          id v19 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", objc_msgSend(v18, "muid"));
          if ([v18 isEnriched])
          {
            [v13 setObject:v18 forKeyedSubscript:v19];
            [v12 removeObject:v19];
          }
        }
        uint64_t v15 = [v14 countByEnumeratingWithState:&v63 objects:v79 count:16];
      }
      while (v15);
    }

    uint64_t v20 = v8;
    if (v8)
    {
      LOBYTE(v59) = 0;
      ((void (**)(void, uint64_t *, double))v8)[2](v8, &v59, 0.2);
      char v21 = *((unsigned char *)v68 + 24) | v59;
      *((unsigned char *)v68 + 24) = v21;
      if (v21)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)uint64_t buf = 67109120;
          *(_DWORD *)&buf[4] = 163;
          _os_log_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d", buf, 8u);
        }
        id v10 = (id)MEMORY[0x1E4F1CC08];
        goto LABEL_47;
      }
    }
    uint64_t v35 = [v13 count];
    uint64_t v59 = 0;
    v60 = &v59;
    uint64_t v61 = 0x2020000000;
    uint64_t v62 = 0;
    if (![v12 count]) {
      goto LABEL_40;
    }
    unint64_t v22 = [v12 count];
    long long v23 = [MEMORY[0x1E4F1CA80] setWithCapacity:30];
    *(void *)uint64_t buf = 0;
    v72 = buf;
    uint64_t v73 = 0x2020000000;
    LOBYTE(v74) = 0;
    uint64_t v55 = 0;
    v56 = &v55;
    uint64_t v57 = 0x2020000000;
    char v58 = 0;
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __78__CLSBusinessCacheUpdater_enrichedBusinessItemsByMuidsForMuids_progressBlock___block_invoke;
    v45[3] = &unk_1E690FB18;
    id v49 = &v67;
    uint64_t v50 = buf;
    uint64_t v53 = 0x3FC999999999999ALL;
    v51 = &v59;
    v48 = v8;
    v45[4] = v36;
    id v24 = v23;
    double v54 = 1.0 / (double)v22 * 0.8;
    id v46 = v24;
    v52 = &v55;
    id v47 = v13;
    long long v25 = (void (**)(void))MEMORY[0x1D2602540](v45);
    id v37 = v6;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v26 = v12;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v41 objects:v78 count:16];
    if (v27)
    {
      uint64_t v28 = *(void *)v42;
LABEL_23:
      uint64_t v29 = 0;
      while (1)
      {
        if (*(void *)v42 != v28) {
          objc_enumerationMutation(v26);
        }
        [v24 addObject:*(void *)(*((void *)&v41 + 1) + 8 * v29)];
        if ((unint64_t)[v24 count] >= 0x1F) {
          v25[2](v25);
        }
        if (*((unsigned char *)v56 + 24)) {
          break;
        }
        if (*((unsigned char *)v68 + 24))
        {
          id v6 = v37;
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v76 = 67109120;
            int v77 = 212;
            _os_log_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d", v76, 8u);
          }

          char v30 = 0;
          goto LABEL_39;
        }
        if (v27 == ++v29)
        {
          uint64_t v27 = [v26 countByEnumeratingWithState:&v41 objects:v78 count:16];
          if (v27) {
            goto LABEL_23;
          }
          break;
        }
      }
    }

    id v6 = v37;
    if ([v24 count] && !*((unsigned char *)v56 + 24)) {
      v25[2](v25);
    }
    char v30 = 1;
LABEL_39:

    _Block_object_dispose(&v55, 8);
    _Block_object_dispose(buf, 8);

    uint64_t v20 = v40;
    if (v30)
    {
LABEL_40:
      uint64_t v31 = [v13 count];
      uint64_t v32 = v60[3];
      *(void *)uint64_t buf = v38;
      v72 = (uint8_t *)(v31 - v35);
      uint64_t v73 = v35;
      uint64_t v74 = v32;
      uint64_t v75 = 30;
      CLSPrintQueryPerformerProtocolStatisticsDescription(@"CLSBusinessGeoQuery.enrichByMUID", buf);
      if (!v20
        || (LOBYTE(v55) = 0,
            ((void (**)(void, uint64_t *, double))v20)[2](v20, &v55, 1.0),
            char v33 = *((unsigned char *)v68 + 24) | v55,
            (*((unsigned char *)v68 + 24) = v33) == 0))
      {
        id v10 = v13;
        goto LABEL_46;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)uint64_t buf = 67109120;
        *(_DWORD *)&buf[4] = 226;
        _os_log_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d", buf, 8u);
      }
    }
    id v10 = (id)MEMORY[0x1E4F1CC08];
LABEL_46:
    _Block_object_dispose(&v59, 8);
LABEL_47:

    id v8 = v40;
    goto LABEL_48;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t buf = 67109120;
    *(_DWORD *)&buf[4] = 144;
    _os_log_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d", buf, 8u);
  }
  id v10 = (id)MEMORY[0x1E4F1CC08];
LABEL_48:
  _Block_object_dispose(&v67, 8);

  return v10;
}

void __78__CLSBusinessCacheUpdater_enrichedBusinessItemsByMuidsForMuids_progressBlock___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 56);
  if (v2
    && (buf[0] = 0,
        (*(void (**)(uint64_t, uint8_t *, double))(v2 + 16))(v2, buf, *(double *)(a1 + 96)),
        (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) |= buf[0]) != 0))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
  }
  else
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
    v3 = *(void **)(a1 + 32);
    v4 = [*(id *)(a1 + 40) allObjects];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __78__CLSBusinessCacheUpdater_enrichedBusinessItemsByMuidsForMuids_progressBlock___block_invoke_2;
    v23[3] = &unk_1E690FAC8;
    id v5 = *(id *)(a1 + 56);
    long long v26 = *(_OWORD *)(a1 + 96);
    uint64_t v6 = *(void *)(a1 + 64);
    id v24 = v5;
    uint64_t v25 = v6;
    id v22 = 0;
    uint64_t v7 = [v3 _resolvedBusinessMUIDs:v4 progressBlock:v23 error:&v22];
    id v8 = v22;

    if (v8)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 1;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)uint64_t buf = 138412290;
        id v29 = v8;
        _os_log_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Received a GeoService error, stopping Business Item resolution: (%@)", buf, 0xCu);
      }
    }
    else
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      uint64_t v17 = v7;
      id v9 = v7;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v27 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v19;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v19 != v12) {
              objc_enumerationMutation(v9);
            }
            id v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
            uint64_t v15 = *(void **)(a1 + 48);
            uint64_t v16 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", objc_msgSend(v14, "muid"));
            [v15 setObject:v14 forKeyedSubscript:v16];
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v27 count:16];
        }
        while (v11);
      }

      [*(id *)(a1 + 40) removeAllObjects];
      uint64_t v7 = v17;
    }
  }
}

uint64_t __78__CLSBusinessCacheUpdater_enrichedBusinessItemsByMuidsForMuids_progressBlock___block_invoke_2(uint64_t a1, unsigned char *a2, double a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    char v6 = 0;
    uint64_t result = (*(uint64_t (**)(uint64_t, char *, double))(result + 16))(result, &v6, *(double *)(a1 + 48) + *(double *)(a1 + 56) * a3);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= v6;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
      *a2 = 1;
    }
  }
  return result;
}

- (id)enrichedBusinessItemsByMuidsForBusinessItems:(id)a3 progressBlock:(id)a4
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v46 = a3;
  id v5 = a4;
  uint64_t v6 = MEMORY[0x1D2602540]();
  uint64_t v7 = (void (**)(void, void, double))v6;
  uint64_t v78 = 0;
  v79 = &v78;
  uint64_t v80 = 0x2020000000;
  char v81 = 0;
  long long v44 = v5;
  if (v6
    && (LOBYTE(v70) = 0,
        (*(void (**)(uint64_t, uint64_t *, double))(v6 + 16))(v6, &v70, 0.0),
        char v8 = *((unsigned char *)v79 + 24) | v70,
        (*((unsigned char *)v79 + 24) = v8) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(void *)&long long buf = 0x2904000100;
      _os_log_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d", (uint8_t *)&buf, 8u);
    }
    id v9 = (id)MEMORY[0x1E4F1CC08];
  }
  else
  {
    uint64_t v10 = MEMORY[0x1E4F14500];
    id v11 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = [v46 count];
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v12;
      _os_log_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[CLSBusinessCacheUpdater] Starting to enrich:%lu business items by MUID", (uint8_t *)&buf, 0xCu);
    }
    v45 = v7;

    uint64_t v13 = [v46 count];
    uint64_t v50 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v13];
    uint64_t v43 = v13;
    id v47 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v13];
    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    id v14 = v46;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v74 objects:v87 count:16];
    if (v15)
    {
      uint64_t v16 = MEMORY[0x1E4F14500];
      uint64_t v17 = *(void *)v75;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v75 != v17) {
            objc_enumerationMutation(v14);
          }
          long long v19 = *(void **)(*((void *)&v74 + 1) + 8 * i);
          uint64_t v20 = [v19 muid];
          if ([v19 isEnriched])
          {
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              LOWORD(buf) = 0;
              _os_log_debug_impl(&dword_1D2150000, v16, OS_LOG_TYPE_DEBUG, "[CLSBusinessCacheUpdater] Finished enriching business item", (uint8_t *)&buf, 2u);
            }
            long long v21 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v20];
            [v50 setObject:v19 forKeyedSubscript:v21];
          }
          else
          {
            long long v21 = [(CLSBusinessCategoryCache *)self->_businessCategoryCache businessItemsForMuid:v20];
            int v22 = [v21 isEnriched];
            BOOL v23 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);
            if (v22)
            {
              if (v23)
              {
                LOWORD(buf) = 0;
                _os_log_debug_impl(&dword_1D2150000, v16, OS_LOG_TYPE_DEBUG, "[CLSBusinessCacheUpdater] Finished enriching business item from cache", (uint8_t *)&buf, 2u);
              }
              id v24 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v20];
              [v50 setObject:v21 forKeyedSubscript:v24];
            }
            else
            {
              if (v23)
              {
                LOWORD(buf) = 0;
                _os_log_debug_impl(&dword_1D2150000, v16, OS_LOG_TYPE_DEBUG, "[CLSBusinessCacheUpdater] Business item is not enriched. Adding to resolve queue", (uint8_t *)&buf, 2u);
              }
              [v47 addObject:v19];
            }
          }
        }
        uint64_t v15 = [v14 countByEnumeratingWithState:&v74 objects:v87 count:16];
      }
      while (v15);
    }

    uint64_t v25 = v45;
    if (v45
      && (LOBYTE(v70) = 0,
          ((void (**)(void, uint64_t *, double))v45)[2](v45, &v70, 0.1),
          char v26 = *((unsigned char *)v79 + 24) | v70,
          (*((unsigned char *)v79 + 24) = v26) != 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(void *)&long long buf = 0x4904000100;
        _os_log_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d", (uint8_t *)&buf, 8u);
      }
      id v9 = (id)MEMORY[0x1E4F1CC08];
    }
    else
    {
      uint64_t v27 = [v50 count];
      uint64_t v70 = 0;
      v71 = &v70;
      uint64_t v72 = 0x2020000000;
      uint64_t v73 = 0;
      if ([v47 count])
      {
        unint64_t v28 = [v47 count];
        *(void *)&long long buf = 0;
        *((void *)&buf + 1) = &buf;
        uint64_t v83 = 0x2020000000;
        LOBYTE(v84) = 0;
        uint64_t v66 = 0;
        uint64_t v67 = &v66;
        uint64_t v68 = 0x2020000000;
        char v69 = 0;
        id v29 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:30];
        double v30 = 1.0 / (double)v28 * 0.8;
        uint64_t v31 = self->_businessCategoryCache;
        v55[0] = MEMORY[0x1E4F143A8];
        v55[1] = 3221225472;
        v55[2] = __86__CLSBusinessCacheUpdater_enrichedBusinessItemsByMuidsForBusinessItems_progressBlock___block_invoke;
        v55[3] = &unk_1E690FAF0;
        v60 = &v78;
        p_long long buf = &buf;
        uint64_t v64 = 0x3FB999999999999ALL;
        uint64_t v62 = &v70;
        uint64_t v59 = v45;
        v55[4] = self;
        id v32 = v29;
        double v65 = v30;
        id v56 = v32;
        long long v63 = &v66;
        id v49 = v31;
        uint64_t v57 = v49;
        id v58 = v50;
        char v33 = (void (**)(void))MEMORY[0x1D2602540](v55);
        long long v53 = 0u;
        long long v54 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        id v34 = v47;
        uint64_t v35 = [v34 countByEnumeratingWithState:&v51 objects:v86 count:16];
        if (v35)
        {
          uint64_t v36 = *(void *)v52;
LABEL_34:
          uint64_t v37 = 0;
          while (1)
          {
            if (*(void *)v52 != v36) {
              objc_enumerationMutation(v34);
            }
            uint64_t v38 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(*((void *)&v51 + 1) + 8 * v37), "muid"));
            [v32 addObject:v38];

            if ((unint64_t)[v32 count] >= 0x1E) {
              v33[2](v33);
            }
            if (*((unsigned char *)v67 + 24)) {
              break;
            }
            if (v35 == ++v37)
            {
              uint64_t v35 = [v34 countByEnumeratingWithState:&v51 objects:v86 count:16];
              if (v35) {
                goto LABEL_34;
              }
              break;
            }
          }
        }

        if ([v32 count] && !*((unsigned char *)v67 + 24)) {
          v33[2](v33);
        }

        _Block_object_dispose(&v66, 8);
        _Block_object_dispose(&buf, 8);
        uint64_t v25 = v45;
      }
      uint64_t v39 = [v50 count];
      uint64_t v40 = v71[3];
      *(void *)&long long buf = v43;
      *((void *)&buf + 1) = v39 - v27;
      uint64_t v83 = v27;
      uint64_t v84 = v40;
      uint64_t v85 = 30;
      CLSPrintQueryPerformerProtocolStatisticsDescription(@"CLSBusinessGeoQuery.enrichBusiness", &buf);
      if (v25
        && (LOBYTE(v66) = 0,
            ((void (**)(void, uint64_t *, double))v25)[2](v25, &v66, 1.0),
            char v41 = *((unsigned char *)v79 + 24) | v66,
            (*((unsigned char *)v79 + 24) = v41) != 0))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(void *)&long long buf = 0x8904000100;
          _os_log_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d", (uint8_t *)&buf, 8u);
        }
        id v9 = (id)MEMORY[0x1E4F1CC08];
      }
      else
      {
        id v9 = v50;
      }
      _Block_object_dispose(&v70, 8);
    }

    uint64_t v7 = v45;
  }
  _Block_object_dispose(&v78, 8);

  return v9;
}

void __86__CLSBusinessCacheUpdater_enrichedBusinessItemsByMuidsForBusinessItems_progressBlock___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 64);
  if (v2
    && (buf[0] = 0,
        (*(void (**)(uint64_t, uint8_t *, double))(v2 + 16))(v2, buf, *(double *)(a1 + 104)),
        (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) |= buf[0]) != 0))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
  }
  else
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
    v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __86__CLSBusinessCacheUpdater_enrichedBusinessItemsByMuidsForBusinessItems_progressBlock___block_invoke_2;
    v24[3] = &unk_1E690FAC8;
    id v5 = *(id *)(a1 + 64);
    long long v27 = *(_OWORD *)(a1 + 104);
    uint64_t v6 = *(void *)(a1 + 72);
    id v25 = v5;
    uint64_t v26 = v6;
    id v23 = 0;
    uint64_t v7 = [v3 _resolvedBusinessMUIDs:v4 progressBlock:v24 error:&v23];
    id v8 = v23;
    if (v8)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = 1;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        id v30 = v8;
        _os_log_error_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Received a GeoService error, stopping Business Item resolution: (%@)", buf, 0xCu);
      }
    }
    else
    {
      id v9 = (id)[*(id *)(a1 + 48) updateBusinessItems:v7];
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v18 = v7;
      id v10 = v7;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v28 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v20 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
            uint64_t v16 = *(void **)(a1 + 56);
            uint64_t v17 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", objc_msgSend(v15, "muid"));
            [v16 setObject:v15 forKeyedSubscript:v17];
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v28 count:16];
        }
        while (v12);
      }

      [*(id *)(a1 + 40) removeAllObjects];
      uint64_t v7 = v18;
    }
  }
}

uint64_t __86__CLSBusinessCacheUpdater_enrichedBusinessItemsByMuidsForBusinessItems_progressBlock___block_invoke_2(uint64_t a1, unsigned char *a2, double a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    char v6 = 0;
    uint64_t result = (*(uint64_t (**)(uint64_t, char *, double))(result + 16))(result, &v6, *(double *)(a1 + 48) + *(double *)(a1 + 56) * a3);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= v6;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
      *a2 = 1;
    }
  }
  return result;
}

- (CLSBusinessCacheUpdater)initWithBusinessCategoryCache:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CLSBusinessCacheUpdater;
  char v6 = [(CLSBusinessCacheUpdater *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_businessCategoryCache, a3);
  }

  return v7;
}

@end