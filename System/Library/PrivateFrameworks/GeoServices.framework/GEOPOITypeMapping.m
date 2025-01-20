@interface GEOPOITypeMapping
+ (id)sharedMapping;
- (BOOL)isAlwaysVisiblePOIType:(int)a3;
- (BOOL)parseCategoryMappingJSON:(id)a3 categoryToPOIType:(id *)a4 POITypeToCategory:(id *)a5;
- (GEOPOITypeMapping)init;
- (GEOPOITypeMapping)initWithResourceManifestManager:(id)a3 resourceManager:(id)a4;
- (id)alwaysVisibleTypes;
- (id)categoryForPOIType:(int)a3;
- (id)categoryToTypeMapping;
- (id)parseVisiblePOITypesJSON:(id)a3;
- (id)typeToCategoryMapping;
- (id)typesForPOICategories:(id)a3;
- (void)_tearDown;
- (void)clearCachedValues;
- (void)dealloc;
- (void)loadPOICategoriesJSON;
- (void)parsePOICategoriesJSON:(id)a3;
@end

@implementation GEOPOITypeMapping

- (id)categoryForPOIType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v4 = [(GEOPOITypeMapping *)self typeToCategoryMapping];
  v5 = [NSNumber numberWithInt:v3];
  v6 = [v4 objectForKey:v5];

  return v6;
}

- (id)typeToCategoryMapping
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__98;
  v12 = __Block_byref_object_dispose__98;
  id v13 = 0;
  uint64_t v6 = MEMORY[0x1E4F143A8];
  geo_isolate_sync();
  v2 = (void *)v9[5];
  if (v2)
  {
    id v3 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionary", v6, 3221225472, __42__GEOPOITypeMapping_typeToCategoryMapping__block_invoke, &unk_1E53D7C00, self, &v8);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
  _Block_object_dispose(&v8, 8);

  return v4;
}

+ (id)sharedMapping
{
  if (qword_1EB2A0790 != -1) {
    dispatch_once(&qword_1EB2A0790, &__block_literal_global_203);
  }
  v2 = (void *)_MergedGlobals_336;

  return v2;
}

void __82__GEOPOITypeMapping_parseCategoryMappingJSON_categoryToPOIType_POITypeToCategory___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v16 = GEOGetGEOPOICategoryLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = (id)objc_opt_class();
      id v17 = v26;
      _os_log_impl(&dword_188D96000, v16, OS_LOG_TYPE_ERROR, "Unexpected POI category mapping key type. Found %@", buf, 0xCu);
    }
    if (GEOPOITypeMappingLogJSONFault_onceToken == -1) {
      goto LABEL_18;
    }
    goto LABEL_25;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v27 = v8;
      v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
      [*(id *)(a1 + 40) setObject:v18 forKeyedSubscript:v7];

      [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v8];
      goto LABEL_19;
    }
    v19 = GEOGetGEOPOICategoryLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = (id)objc_opt_class();
      id v20 = v26;
      _os_log_impl(&dword_188D96000, v19, OS_LOG_TYPE_ERROR, "Unexpected POI category mapping value type. Found %@", buf, 0xCu);
    }
    if (GEOPOITypeMappingLogJSONFault_onceToken == -1) {
      goto LABEL_18;
    }
LABEL_25:
    dispatch_once(&GEOPOITypeMappingLogJSONFault_onceToken, &__block_literal_global_119_0);
LABEL_18:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    *a4 = 1;
    goto LABEL_19;
  }
  v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v28 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_msgSend(v9, "addObject:", v15, (void)v21);
          [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v15];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v28 count:16];
    }
    while (v12);
  }

  if ([v9 count]) {
    [*(id *)(a1 + 40) setObject:v9 forKeyedSubscript:v7];
  }

LABEL_19:
}

void __42__GEOPOITypeMapping_typeToCategoryMapping__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = (void *)v2[3];
  if (!v3)
  {
    [v2 loadPOICategoriesJSON];
    id v3 = *(void **)(*(void *)(a1 + 32) + 24);
  }
  v4 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  objc_storeStrong(v4, v3);
}

- (void)loadPOICategoriesJSON
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  resourceManager = self->_resourceManager;
  v4 = objc_msgSend(MEMORY[0x1E4F28B50], "__geoBundle");
  v5 = [(GEOResourceManager *)resourceManager dataForResourceWithName:@"POITypeMapping.json" fallbackBundle:v4];

  if (v5)
  {
    id v11 = 0;
    uint64_t v6 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v5 options:0 error:&v11];
    id v7 = v11;
    if (v7)
    {
      id v8 = GEOGetGEOPOICategoryLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v13 = v7;
        _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_ERROR, "Error parsing POI Categories JSON %@", buf, 0xCu);
      }

      if (GEOPOITypeMappingLogJSONFault_onceToken == -1) {
        goto LABEL_16;
      }
    }
    else
    {
      if (v6)
      {
        [(GEOPOITypeMapping *)self parsePOICategoriesJSON:v6];
LABEL_16:

        goto LABEL_17;
      }
      id v10 = GEOGetGEOPOICategoryLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_188D96000, v10, OS_LOG_TYPE_ERROR, "Empty result returned when parsing POI Categories", buf, 2u);
      }

      if (GEOPOITypeMappingLogJSONFault_onceToken == -1) {
        goto LABEL_16;
      }
    }
    dispatch_once(&GEOPOITypeMappingLogJSONFault_onceToken, &__block_literal_global_119_0);
    goto LABEL_16;
  }
  v9 = GEOGetGEOPOICategoryLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_188D96000, v9, OS_LOG_TYPE_ERROR, "Failed to read POI categories json", buf, 2u);
  }

  if (GEOPOITypeMappingLogJSONFault_onceToken != -1) {
    dispatch_once(&GEOPOITypeMappingLogJSONFault_onceToken, &__block_literal_global_119_0);
  }
LABEL_17:
}

- (void)parsePOICategoriesJSON:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 objectForKey:@"always_visible_poi_types"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = [(GEOPOITypeMapping *)self parseVisiblePOITypesJSON:v5];
      id v7 = [v4 objectForKey:@"poi_category_mapping"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v19 = 0;
        id v20 = 0;
        [(GEOPOITypeMapping *)self parseCategoryMappingJSON:v7 categoryToPOIType:&v20 POITypeToCategory:&v19];
        id v8 = v20;
        id v9 = v20;
        id v10 = v19;
        id v11 = v19;
        uint64_t v12 = v11;
        if (v6 && v9 && v11)
        {
          objc_storeStrong((id *)&self->_alwaysVisibleTypes, v6);
          objc_storeStrong((id *)&self->_categoryToTypeMapping, v8);
          objc_storeStrong((id *)&self->_typeToCategoryMapping, v10);
        }
      }
      else
      {
        id v17 = GEOGetGEOPOICategoryLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v22 = (id)objc_opt_class();
          id v18 = v22;
          _os_log_impl(&dword_188D96000, v17, OS_LOG_TYPE_ERROR, "Unexpected type for POI category mapping %@", buf, 0xCu);
        }
        if (GEOPOITypeMappingLogJSONFault_onceToken != -1) {
          dispatch_once(&GEOPOITypeMappingLogJSONFault_onceToken, &__block_literal_global_119_0);
        }
        uint64_t v12 = 0;
        id v9 = 0;
      }
    }
    else
    {
      uint64_t v15 = GEOGetGEOPOICategoryLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v22 = (id)objc_opt_class();
        id v16 = v22;
        _os_log_impl(&dword_188D96000, v15, OS_LOG_TYPE_ERROR, "Unexpected type for visible POIs value %@", buf, 0xCu);
      }
      if (GEOPOITypeMappingLogJSONFault_onceToken != -1) {
        dispatch_once(&GEOPOITypeMappingLogJSONFault_onceToken, &__block_literal_global_119_0);
      }
    }
  }
  else
  {
    id v13 = GEOGetGEOPOICategoryLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = (id)objc_opt_class();
      id v14 = v22;
      _os_log_impl(&dword_188D96000, v13, OS_LOG_TYPE_ERROR, "Unexpected type for POI category JSON %@", buf, 0xCu);
    }
    if (GEOPOITypeMappingLogJSONFault_onceToken != -1) {
      dispatch_once(&GEOPOITypeMappingLogJSONFault_onceToken, &__block_literal_global_119_0);
    }
  }
}

- (id)parseVisiblePOITypesJSON:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * v9);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v4 addObject:v10];
        }
        else
        {
          id v11 = GEOGetGEOPOICategoryLog();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            uint64_t v12 = objc_opt_class();
            *(_DWORD *)buf = 138412290;
            long long v21 = v12;
            id v13 = v12;
            _os_log_impl(&dword_188D96000, v11, OS_LOG_TYPE_ERROR, "Unexpected type for visible POI types entry. Expected NSNumber, found %@", buf, 0xCu);
          }
          if (GEOPOITypeMappingLogJSONFault_onceToken != -1) {
            dispatch_once(&GEOPOITypeMappingLogJSONFault_onceToken, &__block_literal_global_119_0);
          }
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v7);
  }

  id v14 = (void *)[v4 copy];

  return v14;
}

- (BOOL)parseCategoryMappingJSON:(id)a3 categoryToPOIType:(id *)a4 POITypeToCategory:(id *)a5
{
  id v7 = a3;
  uint64_t v18 = 0;
  long long v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 1;
  uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v7, "count"));
  uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v7, "count"));
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __82__GEOPOITypeMapping_parseCategoryMappingJSON_categoryToPOIType_POITypeToCategory___block_invoke;
  v14[3] = &unk_1E53F5E08;
  id v10 = v9;
  id v15 = v10;
  id v11 = v8;
  id v16 = v11;
  long long v17 = &v18;
  [v7 enumerateKeysAndObjectsUsingBlock:v14];
  if (*((unsigned char *)v19 + 24))
  {
    BOOL v12 = 1;
    if (a4 && a5)
    {
      *a4 = (id)[v11 copy];
      *a5 = (id)[v10 copy];
      BOOL v12 = *((unsigned char *)v19 + 24) != 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  _Block_object_dispose(&v18, 8);
  return v12;
}

void __34__GEOPOITypeMapping_sharedMapping__block_invoke()
{
  v0 = [GEOPOITypeMapping alloc];
  id v4 = +[GEOResourceManifestManager modernManager];
  v1 = +[GEOResourceManager sharedManager];
  uint64_t v2 = [(GEOPOITypeMapping *)v0 initWithResourceManifestManager:v4 resourceManager:v1];
  id v3 = (void *)_MergedGlobals_336;
  _MergedGlobals_336 = v2;
}

- (GEOPOITypeMapping)initWithResourceManifestManager:(id)a3 resourceManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)GEOPOITypeMapping;
  uint64_t v9 = [(GEOPOITypeMapping *)&v14 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_manifestManager, a3);
    objc_storeStrong((id *)&v10->_resourceManager, a4);
    uint64_t v11 = geo_isolater_create();
    accessLock = v10->_accessLock;
    v10->_accessLock = (geo_isolater *)v11;

    [(GEOResourceManifestManager *)v10->_manifestManager addTileGroupObserver:v10 queue:MEMORY[0x1E4F14428]];
  }

  return v10;
}

- (GEOPOITypeMapping)init
{
  result = (GEOPOITypeMapping *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (void)dealloc
{
  [(GEOPOITypeMapping *)self _tearDown];
  v3.receiver = self;
  v3.super_class = (Class)GEOPOITypeMapping;
  [(GEOPOITypeMapping *)&v3 dealloc];
}

- (void)_tearDown
{
  [(GEOResourceManifestManager *)self->_manifestManager removeTileGroupObserver:self];
  manifestManager = self->_manifestManager;
  self->_manifestManager = 0;
}

- (BOOL)isAlwaysVisiblePOIType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(GEOPOITypeMapping *)self alwaysVisibleTypes];
  id v5 = [NSNumber numberWithInt:v3];
  char v6 = [v4 containsObject:v5];

  return v6;
}

- (id)typesForPOICategories:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(GEOPOITypeMapping *)self categoryToTypeMapping];
  char v6 = [MEMORY[0x1E4F1CA48] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        BOOL v12 = objc_msgSend(v5, "objectForKey:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        if (v12) {
          [v6 addObjectsFromArray:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  return v6;
}

- (id)alwaysVisibleTypes
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__98;
  BOOL v12 = __Block_byref_object_dispose__98;
  id v13 = 0;
  uint64_t v6 = MEMORY[0x1E4F143A8];
  geo_isolate_sync();
  uint64_t v2 = (void *)v9[5];
  if (v2)
  {
    id v3 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F1CAD0], "set", v6, 3221225472, __39__GEOPOITypeMapping_alwaysVisibleTypes__block_invoke, &unk_1E53D7C00, self, &v8);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v4 = v3;
  _Block_object_dispose(&v8, 8);

  return v4;
}

void __39__GEOPOITypeMapping_alwaysVisibleTypes__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = (void *)v2[1];
  if (!v3)
  {
    [v2 loadPOICategoriesJSON];
    id v3 = *(void **)(*(void *)(a1 + 32) + 8);
  }
  id v4 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  objc_storeStrong(v4, v3);
}

- (id)categoryToTypeMapping
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__98;
  BOOL v12 = __Block_byref_object_dispose__98;
  id v13 = 0;
  uint64_t v6 = MEMORY[0x1E4F143A8];
  geo_isolate_sync();
  uint64_t v2 = (void *)v9[5];
  if (v2)
  {
    id v3 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionary", v6, 3221225472, __42__GEOPOITypeMapping_categoryToTypeMapping__block_invoke, &unk_1E53D7C00, self, &v8);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v4 = v3;
  _Block_object_dispose(&v8, 8);

  return v4;
}

void __42__GEOPOITypeMapping_categoryToTypeMapping__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = (void *)v2[2];
  if (!v3)
  {
    [v2 loadPOICategoriesJSON];
    id v3 = *(void **)(*(void *)(a1 + 32) + 16);
  }
  id v4 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  objc_storeStrong(v4, v3);
}

- (void)clearCachedValues
{
}

void __38__GEOPOITypeMapping_clearCachedValues__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 8);
  *(void *)(v2 + 8) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = 0;

  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceManager, 0);
  objc_storeStrong((id *)&self->_manifestManager, 0);
  objc_storeStrong((id *)&self->_accessLock, 0);
  objc_storeStrong((id *)&self->_typeToCategoryMapping, 0);
  objc_storeStrong((id *)&self->_categoryToTypeMapping, 0);

  objc_storeStrong((id *)&self->_alwaysVisibleTypes, 0);
}

@end