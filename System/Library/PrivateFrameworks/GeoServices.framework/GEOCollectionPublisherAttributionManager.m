@interface GEOCollectionPublisherAttributionManager
+ (id)sharedInstance;
- (GEOCollectionPublisherAttributionManager)init;
- (id)bestAttributionForPublisher:(id)a3;
- (id)bestAttributionForPublisher:(id)a3 preferredLanguages:(id)a4;
@end

@implementation GEOCollectionPublisherAttributionManager

- (id)bestAttributionForPublisher:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CA20];
  id v5 = a3;
  v6 = [v4 preferredLanguages];
  v7 = [(GEOCollectionPublisherAttributionManager *)self bestAttributionForPublisher:v5 preferredLanguages:v6];

  return v7;
}

- (id)bestAttributionForPublisher:(id)a3 preferredLanguages:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    long long v38 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v35 = 0u;
    v8 = [(NSCache *)self->_manifestsCache allObjects];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v35 objects:v43 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v36;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v36 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [*(id *)(*((void *)&v35 + 1) + 8 * i) publisherAttributionSources];
          v14 = [v13 objectForKeyedSubscript:v6];

          if (v14)
          {
            v28 = [[_GEOCollectionPublisherAttribution alloc] initWithPublisherAttributionSource:v14 preferredLanguages:v7];

            goto LABEL_26;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v35 objects:v43 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    geo_isolate_sync();
    index = self->_index;
    if (index)
    {
      v16 = [(GEOPublisherAttributionManifestIndex *)index publisherToFileIndex];
      v17 = [v16 objectForKeyedSubscript:v6];

      if (v17)
      {
        unsigned int v18 = [(GEOPublisherAttributionManifestIndex *)self->_index publisherToFileIndexForKey:v6];
        if ([(GEOPublisherAttributionManifestIndex *)self->_index publisherAttributionFilesCount] > v18)
        {
          uint64_t v19 = v18;
          v20 = [(GEOPublisherAttributionManifestIndex *)self->_index publisherAttributionFiles];
          v8 = [v20 objectAtIndexedSubscript:v19];

          v21 = +[GEOResourceManager sharedManager];
          v22 = [v21 pathForResourceWithName:v8 fallbackBundle:0];

          if ([v22 length])
          {
            v23 = (objc_class *)objc_opt_class();
            v24 = loadResource(v22, v23);
            if (v24)
            {
              v25 = v24;
              geo_isolate_sync();
              v26 = [v25 publisherAttributionSources];
              v27 = [v26 objectForKeyedSubscript:v6];

              if (v27)
              {
                v28 = [[_GEOCollectionPublisherAttribution alloc] initWithPublisherAttributionSource:v27 preferredLanguages:v7];
              }
              else
              {
                v34 = GEOGetPublisherAttributionLog();
                if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  v40 = v6;
                  __int16 v41 = 2112;
                  v42 = v22;
                  _os_log_impl(&dword_188D96000, v34, OS_LOG_TYPE_ERROR, "Publisher \"%@\" does not exist in manifest \"%@\"", buf, 0x16u);
                }

                v28 = 0;
              }

              goto LABEL_40;
            }
            v33 = GEOGetPublisherAttributionLog();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v40 = v22;
              _os_log_impl(&dword_188D96000, v33, OS_LOG_TYPE_ERROR, "Could not parse \"%@\"", buf, 0xCu);
            }

            v25 = 0;
          }
          else
          {
            v25 = GEOGetPublisherAttributionLog();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v40 = v8;
              _os_log_impl(&dword_188D96000, v25, OS_LOG_TYPE_ERROR, "Could not locate resource \"%@\"", buf, 0xCu);
            }
          }
          v28 = 0;
LABEL_40:

          goto LABEL_26;
        }
        v8 = GEOGetPublisherAttributionLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v40) = v18;
          v29 = "File index %u is invalid";
          v30 = v8;
          uint32_t v31 = 8;
          goto LABEL_24;
        }
LABEL_25:
        v28 = 0;
LABEL_26:

        goto LABEL_27;
      }
      v8 = GEOGetPublisherAttributionLog();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_25;
      }
      *(_DWORD *)buf = 138412290;
      v40 = v6;
      v29 = "Publisher id \"%@\" not found in the index";
      v30 = v8;
      uint32_t v31 = 12;
    }
    else
    {
      v8 = GEOGetPublisherAttributionLog();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_25;
      }
      *(_WORD *)buf = 0;
      v29 = "Unable to parse index";
      v30 = v8;
      uint32_t v31 = 2;
    }
LABEL_24:
    _os_log_impl(&dword_188D96000, v30, OS_LOG_TYPE_ERROR, v29, buf, v31);
    goto LABEL_25;
  }
  v28 = 0;
LABEL_27:

  return v28;
}

+ (id)sharedInstance
{
  if (qword_1EB2A0658 != -1) {
    dispatch_once(&qword_1EB2A0658, &__block_literal_global_186);
  }
  v2 = (void *)_MergedGlobals_324;

  return v2;
}

uint64_t __91__GEOCollectionPublisherAttributionManager_bestAttributionForPublisher_preferredLanguages___block_invoke_111(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) setObject:*(void *)(a1 + 40) forKey:*(void *)(*(void *)(a1 + 32) + 24)];
}

void __91__GEOCollectionPublisherAttributionManager_bestAttributionForPublisher_preferredLanguages___block_invoke(uint64_t a1)
{
  if (!*(void *)(*(void *)(a1 + 32) + 24))
  {
    v2 = +[GEOResourceManager sharedManager];
    v3 = [v2 pathForResourceWithName:@"publisher_attribution_manifest_index.pb" fallbackBundle:0];

    if ([v3 length])
    {
      v4 = (objc_class *)objc_opt_class();
      uint64_t v5 = loadResource(v3, v4);
      uint64_t v6 = *(void *)(a1 + 32);
      id v7 = *(void **)(v6 + 24);
      *(void *)(v6 + 24) = v5;
    }
    else
    {
      v8 = GEOGetPublisherAttributionLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v9 = 0;
        _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_ERROR, "Unable to locate index", v9, 2u);
      }
    }
  }
}

void __58__GEOCollectionPublisherAttributionManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(GEOCollectionPublisherAttributionManager);
  v1 = (void *)_MergedGlobals_324;
  _MergedGlobals_324 = (uint64_t)v0;
}

- (GEOCollectionPublisherAttributionManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)GEOCollectionPublisherAttributionManager;
  v2 = [(GEOCollectionPublisherAttributionManager *)&v8 init];
  if (v2)
  {
    uint64_t v3 = geo_isolater_create();
    isolator = v2->_isolator;
    v2->_isolator = (geo_isolater *)v3;

    uint64_t v5 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    manifestsCache = v2->_manifestsCache;
    v2->_manifestsCache = v5;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_index, 0);
  objc_storeStrong((id *)&self->_isolator, 0);

  objc_storeStrong((id *)&self->_manifestsCache, 0);
}

@end