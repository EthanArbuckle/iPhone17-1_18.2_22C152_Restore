@interface GEOLocalizationRegionsInfo
- (GEOLocalizationRegionsInfo)init;
- (uint64_t)needsLocalizationForKey:(uint64_t)a3 language:(void *)a4;
- (void)reset;
@end

@implementation GEOLocalizationRegionsInfo

- (GEOLocalizationRegionsInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLocalizationRegionsInfo;
  v2 = [(GEOLocalizationRegionsInfo *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_regionsLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void)reset
{
  p_regionsLock = &self->_regionsLock;
  os_unfair_lock_lock_with_options();
  regions = self->_regions;
  self->_regions = 0;

  os_unfair_lock_unlock(p_regionsLock);
}

- (uint64_t)needsLocalizationForKey:(uint64_t)a3 language:(void *)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = (os_unfair_lock_s *)(a1 + 16);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
  v8 = *(void **)(a1 + 8);
  if (!v8)
  {
    v9 = +[GEOResourceManager sharedManager];
    v10 = objc_msgSend(MEMORY[0x1E4F28B50], "__geoBundle");
    v11 = [v9 pathForResourceWithName:@"localizationRegions.plist" fallbackBundle:v10];

    if ([v11 length])
    {
      id v12 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      v13 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v11];
      uint64_t v14 = [v12 initWithContentsOfURL:v13 error:0];
      v15 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = v14;
    }
    if (!*(void *)(a1 + 8))
    {
      id v16 = objc_alloc_init(MEMORY[0x1E4F1C9E8]);
      v17 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = v16;
    }
    v8 = *(void **)(a1 + 8);
  }
  id v18 = v8;
  os_unfair_lock_unlock(v7);
  v19 = [v18 objectForKey:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v20 = v19;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      v34 = v19;
      id v35 = v18;
      uint64_t v23 = *(void *)v38;
      while (2)
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v38 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v26 = v25;
            v27 = [v26 objectForKey:@"minX"];
            v36[3] = [v27 unsignedIntValue];

            v28 = [v26 objectForKey:@"maxX"];
            v36[0] = [v28 unsignedIntValue];

            v29 = [v26 objectForKey:@"minY"];
            v36[4] = [v29 unsignedIntValue];

            v30 = [v26 objectForKey:@"maxY"];
            v36[1] = [v30 unsignedIntValue];

            v31 = [v26 objectForKey:@"z"];

            v36[5] = [v31 unsignedIntValue];
            v36[2] = -1;
            if (GEOTileSetRegionContainsTileKey(v36, a3))
            {
              uint64_t v32 = 0;
              goto LABEL_20;
            }
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v37 objects:v41 count:16];
        if (v22) {
          continue;
        }
        break;
      }
      uint64_t v32 = 1;
LABEL_20:
      id v18 = v35;
      v19 = v34;
    }
    else
    {
      uint64_t v32 = 1;
    }
  }
  else
  {
    uint64_t v32 = 1;
  }

  return v32;
}

- (void).cxx_destruct
{
}

@end