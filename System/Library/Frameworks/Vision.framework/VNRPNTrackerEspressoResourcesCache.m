@interface VNRPNTrackerEspressoResourcesCache
+ (id)cacheKeyFromOptions:(id)a3 error:(id *)a4;
+ (id)cacheOptionsKeys;
- (BOOL)addRPNTrackerResourcesConfiguredForOptions:(id)a3 resources:(id)a4 error:(id *)a5;
- (VNRPNTrackerEspressoResourcesCache)init;
- (id)createRPNTrackerResourcesConfiguredWithOptions:(id)a3 error:(id *)a4;
- (id)locateRPNTrackerResourcesConfiguredForOptions:(id)a3 error:(id *)a4;
- (void)releaseCachedResources;
@end

@implementation VNRPNTrackerEspressoResourcesCache

- (VNRPNTrackerEspressoResourcesCache)init
{
  v9.receiver = self;
  v9.super_class = (Class)VNRPNTrackerEspressoResourcesCache;
  v2 = [(VNRPNTrackerEspressoResourcesCache *)&v9 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:6];
    rpnEspressoResourcesKeyToEspressoResourcesCache = v2->_rpnEspressoResourcesKeyToEspressoResourcesCache;
    v2->_rpnEspressoResourcesKeyToEspressoResourcesCache = (NSMutableDictionary *)v3;

    v5 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    rpnEspressoResourcesKeyToEspressoResourcesCacheLock = v2->_rpnEspressoResourcesKeyToEspressoResourcesCacheLock;
    v2->_rpnEspressoResourcesKeyToEspressoResourcesCacheLock = v5;

    v7 = v2;
  }

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rpnEspressoResourcesKeyToEspressoResourcesCacheLock, 0);

  objc_storeStrong((id *)&self->_rpnEspressoResourcesKeyToEspressoResourcesCache, 0);
}

- (void)releaseCachedResources
{
  [(NSLock *)self->_rpnEspressoResourcesKeyToEspressoResourcesCacheLock lock];
  [(NSMutableDictionary *)self->_rpnEspressoResourcesKeyToEspressoResourcesCache removeAllObjects];
  uint64_t v3 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:6];
  rpnEspressoResourcesKeyToEspressoResourcesCache = self->_rpnEspressoResourcesKeyToEspressoResourcesCache;
  self->_rpnEspressoResourcesKeyToEspressoResourcesCache = v3;

  [(NSLock *)self->_rpnEspressoResourcesKeyToEspressoResourcesCacheLock unlock];
}

- (id)createRPNTrackerResourcesConfiguredWithOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  [(NSLock *)self->_rpnEspressoResourcesKeyToEspressoResourcesCacheLock lock];
  v7 = [(id)objc_opt_class() cacheKeyFromOptions:v6 error:a4];
  if (v7)
  {
    v8 = [(NSMutableDictionary *)self->_rpnEspressoResourcesKeyToEspressoResourcesCache objectForKeyedSubscript:v7];
    if (v8)
    {
      id v9 = v8;
    }
    else
    {
      uint64_t v10 = objc_opt_class();
      v11 = +[VNValidationUtilities requiredObjectOfClass:v10 forKey:@"VNObjectTrackerRevision2Type_RPNTrackerInitModelName" inOptions:v6 error:a4];
      if (v11)
      {
        v12 = +[VNValidationUtilities requiredObjectOfClass:v10 forKey:@"VNObjectTrackerRevision2Type_RPNTrackerTrackModelName" inOptions:v6 error:a4];
        if (!v12) {
          goto LABEL_22;
        }
        id v13 = v6;
        id v26 = v11;
        id v14 = v12;
        v27 = v13;
        uint64_t v15 = self;
        v16 = +[VNValidationUtilities requiredObjectConformingToProtocol:&unk_1EF7D2C18 forKey:@"VNTrackingOption_ComputeDevice" inOptions:v13 error:a4];
        if (v16)
        {
          v24 = (objc_class *)v15;
          v17 = +[VNValidationUtilities requiredObjectOfClass:objc_opt_class() forKey:@"VNDetectorOption_PreferBackgroundProcessing" inOptions:v27 error:a4];
          if (v17)
          {
            id v25 = v14;
            aBlock[0] = MEMORY[0x1E4F143A8];
            aBlock[1] = 3221225472;
            aBlock[2] = __110__VNRPNTrackerEspressoResources_resourcesForOptions_PRNInitEspressoModelName_RPNTrackEspressoModelName_error___block_invoke;
            aBlock[3] = &unk_1E5B1F6D8;
            id v29 = v27;
            id v30 = v16;
            id v31 = v17;
            v18 = (void (**)(void *, id, id *))_Block_copy(aBlock);
            v19 = v18[2](v18, v26, a4);
            if (v19)
            {
              id v23 = v19;
              v20 = v18[2](v18, v25, a4);
              v21 = v20
                  ? (void *)[[v24 alloc] _initWithRPNInitEspressoResources:v23 RPNTrackEspressoResources:v20]: 0;

              v19 = v23;
            }
            else
            {
              v21 = 0;
            }

            id v14 = v25;
          }
          else
          {
            v21 = 0;
          }
        }
        else
        {
          v21 = 0;
        }

        if (v21)
        {
          [(NSMutableDictionary *)self->_rpnEspressoResourcesKeyToEspressoResourcesCache setValue:v21 forKey:v7];
          id v9 = v21;
        }
        else
        {
LABEL_22:
          id v9 = 0;
        }
      }
      else
      {
        id v9 = 0;
      }
    }
  }
  else
  {
    id v9 = 0;
  }

  [(NSLock *)self->_rpnEspressoResourcesKeyToEspressoResourcesCacheLock unlock];

  return v9;
}

- (id)locateRPNTrackerResourcesConfiguredForOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  [(NSLock *)self->_rpnEspressoResourcesKeyToEspressoResourcesCacheLock lock];
  v7 = [(id)objc_opt_class() cacheKeyFromOptions:v6 error:a4];
  if (v7)
  {
    v8 = [(NSMutableDictionary *)self->_rpnEspressoResourcesKeyToEspressoResourcesCache objectForKeyedSubscript:v7];
    id v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else if (a4)
    {
      v11 = (void *)[[NSString alloc] initWithFormat:@"Could not locate RPN Tracker resources for '%@'", v7];
      *a4 = +[VNError errorForDataUnavailableWithLocalizedDescription:v11];
    }
  }
  else
  {
    id v9 = 0;
  }

  [(NSLock *)self->_rpnEspressoResourcesKeyToEspressoResourcesCacheLock unlock];

  return v9;
}

- (BOOL)addRPNTrackerResourcesConfiguredForOptions:(id)a3 resources:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  [(NSLock *)self->_rpnEspressoResourcesKeyToEspressoResourcesCacheLock lock];
  if (v9)
  {
    id v10 = [(id)objc_opt_class() cacheKeyFromOptions:v8 error:a5];
    BOOL v11 = v10 != 0;
    if (v10) {
      [(NSMutableDictionary *)self->_rpnEspressoResourcesKeyToEspressoResourcesCache setObject:v9 forKeyedSubscript:v10];
    }
  }
  else if (a5)
  {
    +[VNError errorForInvalidArgument:0 named:@"Tracker resources"];
    BOOL v11 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v11 = 0;
  }
  [(NSLock *)self->_rpnEspressoResourcesKeyToEspressoResourcesCacheLock unlock];

  return v11;
}

+ (id)cacheKeyFromOptions:(id)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v17 = [(id)objc_opt_class() cacheOptionsKeys];
  id v6 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v17;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v12 = [v5 objectForKeyedSubscript:v11];
        id v13 = (void *)v12;
        if (!v12)
        {
          if (a4) {
            id v15 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Option value for option key %@ is a mandatory parameter"];
          }

          id v14 = 0;
          goto LABEL_13;
        }
        [v6 appendFormat:@":%@=%@", v11, v12];
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  id v14 = (void *)[v6 copy];
LABEL_13:

  return v14;
}

+ (id)cacheOptionsKeys
{
  if (+[VNRPNTrackerEspressoResourcesCache cacheOptionsKeys]::onceToken != -1) {
    dispatch_once(&+[VNRPNTrackerEspressoResourcesCache cacheOptionsKeys]::onceToken, &__block_literal_global_33152);
  }
  v2 = (void *)+[VNRPNTrackerEspressoResourcesCache cacheOptionsKeys]::cacheOptionsKeys;

  return v2;
}

void __54__VNRPNTrackerEspressoResourcesCache_cacheOptionsKeys__block_invoke()
{
  v2[2] = *MEMORY[0x1E4F143B8];
  v2[0] = @"VNDetectorOption_PreferBackgroundProcessing";
  v2[1] = @"VNTrackingOption_ComputeDevice";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:2];
  v1 = (void *)+[VNRPNTrackerEspressoResourcesCache cacheOptionsKeys]::cacheOptionsKeys;
  +[VNRPNTrackerEspressoResourcesCache cacheOptionsKeys]::cacheOptionsKeys = v0;
}

@end