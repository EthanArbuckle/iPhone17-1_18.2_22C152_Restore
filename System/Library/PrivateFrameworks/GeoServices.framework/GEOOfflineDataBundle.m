@interface GEOOfflineDataBundle
+ (id)installedBundles;
- (GEOTileData)dataForKey:(uint64_t)a1;
- (id)availableKeysForLayer:(uint64_t)a1;
@end

@implementation GEOOfflineDataBundle

GEOOfflineDataBundle *__40__GEOOfflineDataBundle_installedBundles__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = [v2 pathExtension];
  int v4 = [v3 isEqualToString:@"offlinemap"];

  if (v4)
  {
    v5 = [GEOOfflineDataBundle alloc];
    id v6 = v2;
    if (v5)
    {
      v47.receiver = v5;
      v47.super_class = (Class)GEOOfflineDataBundle;
      v7 = objc_msgSendSuper2(&v47, sel_init);
      if (v7)
      {
        v8 = v7;
        v9 = [v6 pathExtension];
        char v10 = [v9 isEqualToString:@"offlinemap"];

        if (v10)
        {
          id v38 = v2;
          uint64_t v11 = [v6 copy];
          v12 = (void *)v8[1];
          v8[1] = v11;

          v13 = [MEMORY[0x1E4F28CB8] defaultManager];
          v37 = v8;
          v14 = [v13 enumeratorAtURL:v8[1] includingPropertiesForKeys:0 options:1 errorHandler:0];

          long long v45 = 0u;
          long long v46 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          id obj = v14;
          uint64_t v15 = [obj countByEnumeratingWithState:&v43 objects:v50 count:16];
          if (!v15)
          {
            v39 = 0;
            goto LABEL_74;
          }
          uint64_t v16 = v15;
          v39 = 0;
          uint64_t v17 = *(void *)v44;
          while (1)
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v44 != v17) {
                objc_enumerationMutation(obj);
              }
              v19 = *(void **)(*((void *)&v43 + 1) + 8 * i);
              id v20 = [v19 lastPathComponent];
              if (([v20 isEqualToString:@"LAYER_UNKNOWN"] & 1) == 0)
              {
                if ([v20 isEqualToString:@"LAYER_FARPOINT_METADATA"])
                {
                  uint64_t v22 = 1;
                  goto LABEL_52;
                }
                if ([v20 isEqualToString:@"LAYER_ROUTING"])
                {
                  uint64_t v22 = 2;
                  goto LABEL_52;
                }
                if ([v20 isEqualToString:@"LAYER_POI_SEARCH_AND_PLACES"])
                {
                  uint64_t v22 = 3;
                  goto LABEL_52;
                }
                if ([v20 isEqualToString:@"LAYER_VECTOR_PARSEC_INDEX"])
                {
                  uint64_t v22 = 4;
                  goto LABEL_52;
                }
                if ([v20 isEqualToString:@"LAYER_REVGEO"])
                {
                  uint64_t v22 = 5;
                  goto LABEL_52;
                }
                if ([v20 isEqualToString:@"LAYER_VECTOR_PARSEC_DATA"])
                {
                  uint64_t v22 = 6;
                  goto LABEL_52;
                }
                if ([v20 isEqualToString:@"LAYER_GEO_SEARCH"])
                {
                  uint64_t v22 = 7;
                  goto LABEL_52;
                }
                if ([v20 isEqualToString:@"LAYER_SEARCH_STATIC_CONTENT"])
                {
                  uint64_t v22 = 8;
                  goto LABEL_52;
                }
                if ([v20 isEqualToString:@"LAYER_VECTOR_TILE"])
                {
                  uint64_t v22 = 9;
                  goto LABEL_52;
                }
                if ([v20 isEqualToString:@"LAYER_BROWSE_AND_CATEGORY_SEARCH"])
                {
                  uint64_t v22 = 10;
                  goto LABEL_52;
                }
                if ([v20 isEqualToString:@"LAYER_VECTOR_ASSET"])
                {
                  uint64_t v22 = 11;
                  goto LABEL_52;
                }
                if ([v20 isEqualToString:@"LAYER_SEARCH_ML_MODELS"])
                {
                  uint64_t v22 = 12;
                  goto LABEL_52;
                }
                if ([v20 isEqualToString:@"LAYER_ROUTING_V2"])
                {
                  uint64_t v22 = 13;
                  goto LABEL_52;
                }
                if ([v20 isEqualToString:@"LAYER_ROUTING_V2_TRANSIT"])
                {
                  uint64_t v22 = 14;
                  goto LABEL_52;
                }
                if ([v20 isEqualToString:@"LAYER_ROUTING_V2_TRAFFIC_INCIDENTS"])
                {
                  uint64_t v22 = 15;
                  goto LABEL_52;
                }
                if ([v20 isEqualToString:@"LAYER_GEO_SEARCH_V2"])
                {
                  uint64_t v22 = 16;
                  goto LABEL_52;
                }
                if ([v20 isEqualToString:@"LAYER_ROUTING_V3"])
                {
                  uint64_t v22 = 17;
                  goto LABEL_52;
                }
                if ([v20 isEqualToString:@"LAYER_ROUTING_V3_METADATA"])
                {
                  uint64_t v22 = 18;
                  goto LABEL_52;
                }
                if ([v20 isEqualToString:@"LAYER_ROUTING_V3_TRANSIT"])
                {
                  uint64_t v22 = 19;
                  goto LABEL_52;
                }
                if ([v20 isEqualToString:@"LAYER_ROUTING_V3_TRAFFIC_INCIDENTS"])
                {
                  uint64_t v22 = 20;
LABEL_52:

                  v21 = [v19 URLByAppendingPathComponent:@"keys.json"];
                  v23 = [MEMORY[0x1E4F28CB8] defaultManager];
                  v24 = [v21 path];
                  int v25 = [v23 fileExistsAtPath:v24];

                  if (!v25) {
                    goto LABEL_70;
                  }
                  id v42 = 0;
                  v26 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v21 options:0 error:&v42];
                  id v27 = v42;
                  if (v26)
                  {
                    id v41 = v27;
                    v28 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v26 options:0 error:&v41];
                    id v20 = v41;

                    if (v28)
                    {
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        v29 = v39;
                        if (!v39)
                        {
                          v29 = [MEMORY[0x1E4F1CA60] dictionary];
                        }
                        v30 = [NSNumber numberWithInt:v22];
                        v39 = v29;
                        [v29 setObject:v28 forKeyedSubscript:v30];
LABEL_67:

LABEL_68:
                        goto LABEL_69;
                      }
                      v30 = GEOGetOfflineDataAccessLog();
                      if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
                        goto LABEL_67;
                      }
                      *(_WORD *)buf = 0;
                      v31 = v30;
                      v32 = "keys.json contains non-dictionary root";
                      uint32_t v33 = 2;
                    }
                    else
                    {
                      v30 = GEOGetOfflineDataAccessLog();
                      if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
                        goto LABEL_67;
                      }
                      *(_DWORD *)buf = 138543362;
                      id v49 = v20;
                      v31 = v30;
                      v32 = "Failed to decode keys.json for data bundle: %{public}@";
                      uint32_t v33 = 12;
                    }
                    _os_log_impl(&dword_188D96000, v31, OS_LOG_TYPE_ERROR, v32, buf, v33);
                    goto LABEL_67;
                  }
                  v28 = GEOGetOfflineDataAccessLog();
                  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138543362;
                    id v49 = v27;
                    _os_log_impl(&dword_188D96000, v28, OS_LOG_TYPE_ERROR, "Failed to load keys.json for data bundle: %{public}@", buf, 0xCu);
                  }
                  id v20 = v27;
                  goto LABEL_68;
                }
              }
              v21 = v20;
LABEL_69:

LABEL_70:
            }
            uint64_t v16 = [obj countByEnumeratingWithState:&v43 objects:v50 count:16];
            if (!v16)
            {
LABEL_74:

              v8 = v37;
              v34 = (void *)v37[2];
              v37[2] = v39;
              id v35 = v39;

              v5 = v37;
              id v2 = v38;
              goto LABEL_75;
            }
          }
        }
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v50 = 0;
          _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: [url.pathExtension isEqualToString:OfflineDataBundleExtension]", v50, 2u);
        }
        v5 = 0;
LABEL_75:
      }
      else
      {
        v5 = 0;
      }
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)installedBundles
{
  self;
  v0 = +[GEOFilePaths urlFor:37];
  v1 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v2 = [v1 contentsOfDirectoryAtURL:v0 includingPropertiesForKeys:0 options:0 error:0];

  v3 = objc_msgSend(v2, "_geo_compactMap:", &__block_literal_global_20);

  return v3;
}

- (id)availableKeysForLayer:(uint64_t)a1
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v2 = a2;
    int v4 = *(void **)(a1 + 8);
    if (a2 >= 0x15)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a2);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E53DA860[(int)a2];
    }
    id v6 = [v4 URLByAppendingPathComponent:v5];

    v7 = *(void **)(a1 + 16);
    v8 = [NSNumber numberWithUnsignedInt:v2];
    v9 = [v7 objectForKeyedSubscript:v8];

    v40 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
    if (v9)
    {
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v10 = [v9 allKeys];
      uint64_t v11 = [v10 countByEnumeratingWithState:&v47 objects:v52 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        int v36 = v2;
        id obj = v10;
        uint64_t v39 = *(void *)v48;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v48 != v39) {
              objc_enumerationMutation(obj);
            }
            uint64_t v14 = *(void *)(*((void *)&v47 + 1) + 8 * i);
            uint64_t v15 = v9;
            uint64_t v16 = [v9 objectForKeyedSubscript:v14];
            uint64_t v17 = v6;
            v18 = [v6 URLByAppendingPathComponent:v16];
            v19 = [MEMORY[0x1E4F28CB8] defaultManager];
            id v20 = [v18 path];
            int v21 = [v19 fileExistsAtPath:v20];

            if (v21) {
              [v40 addObject:v14];
            }

            id v6 = v17;
            v9 = v15;
          }
          id v10 = obj;
          uint64_t v12 = [obj countByEnumeratingWithState:&v47 objects:v52 count:16];
        }
        while (v12);
        LODWORD(v2) = v36;
      }
    }
    else
    {
      int v37 = v2;
      uint64_t v22 = [MEMORY[0x1E4F28CB8] defaultManager];
      v23 = v6;
      v24 = [v22 contentsOfDirectoryAtURL:v6 includingPropertiesForKeys:0 options:1 error:0];

      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v10 = v24;
      uint64_t v25 = [v10 countByEnumeratingWithState:&v43 objects:v51 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v44;
        do
        {
          for (uint64_t j = 0; j != v26; ++j)
          {
            if (*(void *)v44 != v27) {
              objc_enumerationMutation(v10);
            }
            v29 = *(void **)(*((void *)&v43 + 1) + 8 * j);
            v30 = [MEMORY[0x1E4F28CB8] defaultManager];
            v31 = [v29 path];
            int v32 = [v30 fileExistsAtPath:v31];

            if (v32)
            {
              uint32_t v33 = [v29 lastPathComponent];
              [v40 addObject:v33];
            }
          }
          uint64_t v26 = [v10 countByEnumeratingWithState:&v43 objects:v51 count:16];
        }
        while (v26);
      }

      LODWORD(v2) = v37;
      id v6 = v23;
      v9 = 0;
    }

    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __46__GEOOfflineDataBundle_availableKeysForLayer___block_invoke;
    v41[3] = &__block_descriptor_36_e18__16__0__NSString_8l;
    int v42 = v2;
    v34 = objc_msgSend(v40, "_geo_compactMap:", v41);
  }
  else
  {
    v34 = 0;
  }

  return v34;
}

GEOOfflineDataKey *__46__GEOOfflineDataBundle_availableKeysForLayer___block_invoke(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x1E4F1C9B8];
  id v4 = a2;
  v5 = (void *)[[v3 alloc] initWithBase64EncodedString:v4 options:0];

  if (v5) {
    id v6 = [[GEOOfflineDataKey alloc] initWithLayer:*(unsigned int *)(a1 + 32) serviceKey:v5];
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (GEOTileData)dataForKey:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    id v4 = [v3 serviceKey];
    v5 = [v4 base64EncodedStringWithOptions:0];

    id v6 = *(void **)(a1 + 16);
    v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v3, "layer"));
    v8 = [v6 objectForKeyedSubscript:v7];

    if (v8)
    {
      v9 = [v8 objectForKeyedSubscript:v5];
    }
    else
    {
      id v10 = [v5 stringByReplacingOccurrencesOfString:@"+" withString:@"-"];
      v9 = [v10 stringByReplacingOccurrencesOfString:@"/" withString:@"_"];
    }
    if ([v9 length])
    {
      uint64_t v11 = NSString;
      uint64_t v12 = [v3 layer];
      if (v12 >= 0x15)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v12);
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = off_1E53DA860[(int)v12];
      }
      uint64_t v14 = [v11 stringWithFormat:@"%@/%@", v13, v9];

      uint64_t v15 = [*(id *)(a1 + 8) URLByAppendingPathComponent:v14];
    }
    else
    {
      uint64_t v15 = 0;
    }

    if (v15
      && ([MEMORY[0x1E4F28CB8] defaultManager],
          uint64_t v16 = objc_claimAutoreleasedReturnValue(),
          [v15 path],
          uint64_t v17 = objc_claimAutoreleasedReturnValue(),
          int v18 = [v16 fileExistsAtPath:v17],
          v17,
          v16,
          v18))
    {
      v19 = [[GEOTileData alloc] initWithFileURL:v15];
    }
    else
    {
      v19 = 0;
    }
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keysToFilenames, 0);

  objc_storeStrong((id *)&self->_baseURL, 0);
}

@end