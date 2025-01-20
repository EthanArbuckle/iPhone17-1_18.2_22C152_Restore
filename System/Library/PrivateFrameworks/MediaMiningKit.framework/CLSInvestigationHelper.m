@interface CLSInvestigationHelper
- (CLSAOICache)aoiCache;
- (CLSInvestigationHelper)initWithServiceManager:(id)a3 locationCache:(id)a4 aoiCache:(id)a5 poiCache:(id)a6 roiCache:(id)a7 natureCache:(id)a8;
- (CLSLocationCache)locationCache;
- (CLSNatureCache)natureCache;
- (CLSPOICache)poiCache;
- (CLSROICache)roiCache;
- (CLSServiceManager)serviceManager;
- (id)parentNodesOfTaxonomyNode:(id)a3;
- (id)taxonomyNodeForSceneIdentifier:(unint64_t)a3 sceneModel:(id)a4;
- (unint64_t)_maxLevelWithTaxonomyNode:(id)a3;
- (void)enumerateTaxonomyNodesLevelsAndWeightsStartingWithNode:(id)a3 usingBlock:(id)a4;
@end

@implementation CLSInvestigationHelper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_natureCache, 0);
  objc_storeStrong((id *)&self->_roiCache, 0);
  objc_storeStrong((id *)&self->_poiCache, 0);
  objc_storeStrong((id *)&self->_aoiCache, 0);
  objc_storeStrong((id *)&self->_locationCache, 0);
  objc_storeStrong((id *)&self->_serviceManager, 0);
  objc_storeStrong((id *)&self->_maxTaxonomyNodeLevelBySceneIdentifierBySceneModelIdentifier, 0);
  objc_storeStrong((id *)&self->_taxonomyNodesLevelsAndWeightsBySceneIdentifierBySceneModelIdentifier, 0);
  objc_storeStrong((id *)&self->_taxonomyNodeBySceneIdentifierBySceneModelIdentifier, 0);
  objc_storeStrong((id *)&self->_parentTaxonomyNodesBySceneIdentifierBySceneModelIdentifier, 0);
}

- (CLSNatureCache)natureCache
{
  return (CLSNatureCache *)objc_getProperty(self, a2, 104, 1);
}

- (CLSROICache)roiCache
{
  return (CLSROICache *)objc_getProperty(self, a2, 96, 1);
}

- (CLSPOICache)poiCache
{
  return (CLSPOICache *)objc_getProperty(self, a2, 88, 1);
}

- (CLSAOICache)aoiCache
{
  return (CLSAOICache *)objc_getProperty(self, a2, 80, 1);
}

- (CLSLocationCache)locationCache
{
  return (CLSLocationCache *)objc_getProperty(self, a2, 72, 1);
}

- (CLSServiceManager)serviceManager
{
  return (CLSServiceManager *)objc_getProperty(self, a2, 64, 1);
}

- (unint64_t)_maxLevelWithTaxonomyNode:(id)a3
{
  id v4 = a3;
  v5 = [v4 taxonomy];
  v6 = [v5 digest];

  if (v6)
  {
    v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", objc_msgSend(v4, "extendedSceneClassId"));
    id v8 = [(NSMutableDictionary *)self->_maxTaxonomyNodeLevelBySceneIdentifierBySceneModelIdentifier objectForKeyedSubscript:v6];
    if (!v8)
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [(NSMutableDictionary *)self->_maxTaxonomyNodeLevelBySceneIdentifierBySceneModelIdentifier setObject:v8 forKeyedSubscript:v6];
    }
    v9 = [v8 objectForKeyedSubscript:v7];
    v10 = v9;
    if (v9)
    {
      unint64_t v11 = [v9 unsignedIntegerValue];
    }
    else
    {
      unint64_t v11 = _maxTaxonomyNodeLevel(v4);
      v12 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v11];
      [v8 setObject:v12 forKeyedSubscript:v7];
    }
  }
  else
  {
    unint64_t v11 = 0;
  }

  return v11;
}

- (void)enumerateTaxonomyNodesLevelsAndWeightsStartingWithNode:(id)a3 usingBlock:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, void))a4;
  id v8 = [v6 taxonomy];
  v9 = [v8 digest];

  if (v9)
  {
    v10 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", objc_msgSend(v6, "extendedSceneClassId"));
    os_unfair_lock_lock(&self->_taxonomyNodesLevelsAndWeightsLock);
    id v11 = [(NSMutableDictionary *)self->_taxonomyNodesLevelsAndWeightsBySceneIdentifierBySceneModelIdentifier objectForKeyedSubscript:v9];
    if (!v11)
    {
      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [(NSMutableDictionary *)self->_taxonomyNodesLevelsAndWeightsBySceneIdentifierBySceneModelIdentifier setObject:v11 forKeyedSubscript:v9];
    }
    v12 = [v11 objectForKeyedSubscript:v10];
    if (v12)
    {
      os_unfair_lock_unlock(&self->_taxonomyNodesLevelsAndWeightsLock);
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      obuint64_t j = v12;
      uint64_t v13 = [obj countByEnumeratingWithState:&v37 objects:v45 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v38;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v38 != v15) {
              objc_enumerationMutation(obj);
            }
            v7[2](v7, *(void *)(*((void *)&v37 + 1) + 8 * i));
          }
          uint64_t v14 = [obj countByEnumeratingWithState:&v37 objects:v45 count:16];
        }
        while (v14);
      }
    }
    else
    {
      v33 = v9;
      id v31 = v11;
      v32 = v10;
      obuint64_t j = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_msgSend(v11, "setObject:forKeyedSubscript:");
      unint64_t v17 = [(CLSInvestigationHelper *)self _maxLevelWithTaxonomyNode:v6];
      id v34 = v6;
      v18 = [MEMORY[0x1E4F1CA80] setWithObject:v6];
      unint64_t v35 = v17 + 1;
      double v19 = (double)v17;
      while (1)
      {
        if ([v18 count] == 1)
        {
          v20 = [v18 anyObject];
          char v21 = [v20 isRoot];

          if (v21) {
            break;
          }
        }
        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        id v22 = v18;
        uint64_t v23 = [v22 countByEnumeratingWithState:&v41 objects:v46 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          v18 = 0;
          uint64_t v25 = *(void *)v42;
          do
          {
            for (uint64_t j = 0; j != v24; ++j)
            {
              if (*(void *)v42 != v25) {
                objc_enumerationMutation(v22);
              }
              v27 = *(void **)(*((void *)&v41 + 1) + 8 * j);
              if (([v27 isRoot] & 1) == 0)
              {
                v28 = [[CLSInvestigationHelperSceneNodeLevelAndWeight alloc] initWithTaxonomyNode:v27 level:v17 andWeight:(double)(v35 - v17) / v19];
                ((void (**)(id, CLSInvestigationHelperSceneNodeLevelAndWeight *))v7)[2](v7, v28);
                [obj addObject:v28];
                v29 = [(CLSInvestigationHelper *)self parentNodesOfTaxonomyNode:v27];
                v30 = v29;
                if (v18) {
                  [v18 unionSet:v29];
                }
                else {
                  v18 = (void *)[v29 mutableCopy];
                }
              }
            }
            uint64_t v24 = [v22 countByEnumeratingWithState:&v41 objects:v46 count:16];
          }
          while (v24);
        }
        else
        {
          v18 = 0;
        }

        --v17;
      }
      os_unfair_lock_unlock(&self->_taxonomyNodesLevelsAndWeightsLock);

      v9 = v33;
      id v6 = v34;
      id v11 = v31;
      v10 = v32;
      v12 = 0;
    }
  }
}

- (id)parentNodesOfTaxonomyNode:(id)a3
{
  id v4 = a3;
  v5 = [v4 taxonomy];
  id v6 = [v5 digest];

  if (v6)
  {
    v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", objc_msgSend(v4, "extendedSceneClassId"));
    p_parentTaxonomyNodesLock = &self->_parentTaxonomyNodesLock;
    os_unfair_lock_lock(&self->_parentTaxonomyNodesLock);
    id v9 = [(NSMutableDictionary *)self->_parentTaxonomyNodesBySceneIdentifierBySceneModelIdentifier objectForKeyedSubscript:v6];
    if (!v9)
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [(NSMutableDictionary *)self->_parentTaxonomyNodesBySceneIdentifierBySceneModelIdentifier setObject:v9 forKeyedSubscript:v6];
    }
    v10 = [v9 objectForKeyedSubscript:v7];
    if (!v10)
    {
      v10 = [v4 parents];
      [v9 setObject:v10 forKeyedSubscript:v7];
    }
    os_unfair_lock_unlock(p_parentTaxonomyNodesLock);
  }
  else
  {
    v10 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v10;
}

- (id)taxonomyNodeForSceneIdentifier:(unint64_t)a3 sceneModel:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if ([v6 isResponsibleForSignalIdentifier:a3])
  {
    v7 = [v6 identifier];
    if (v7)
    {
      id v8 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:a3];
      p_taxonomyNodesLock = &self->_taxonomyNodesLock;
      os_unfair_lock_lock(&self->_taxonomyNodesLock);
      id v10 = [(NSMutableDictionary *)self->_taxonomyNodeBySceneIdentifierBySceneModelIdentifier objectForKeyedSubscript:v7];
      if (!v10)
      {
        id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        [(NSMutableDictionary *)self->_taxonomyNodeBySceneIdentifierBySceneModelIdentifier setObject:v10 forKeyedSubscript:v7];
      }
      id v11 = [v10 objectForKeyedSubscript:v8];
      if (!v11)
      {
        id v11 = [v6 taxonomyNodeForSceneIdentifier:a3];
        if (!v11)
        {
          id v11 = [MEMORY[0x1E4F1CA98] null];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            v14[0] = 67109120;
            v14[1] = a3;
            _os_log_error_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "No taxonomy node found for sceneIdentifier %d", (uint8_t *)v14, 8u);
          }
        }
        [v10 setObject:v11 forKeyedSubscript:v8];
      }
      v12 = [MEMORY[0x1E4F1CA98] null];

      if (v11 == v12)
      {

        id v11 = 0;
      }
      os_unfair_lock_unlock(p_taxonomyNodesLock);
    }
    else
    {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (CLSInvestigationHelper)initWithServiceManager:(id)a3 locationCache:(id)a4 aoiCache:(id)a5 poiCache:(id)a6 roiCache:(id)a7 natureCache:(id)a8
{
  id v31 = a3;
  id v30 = a4;
  id v29 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v32.receiver = self;
  v32.super_class = (Class)CLSInvestigationHelper;
  v18 = [(CLSInvestigationHelper *)&v32 init];
  double v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_serviceManager, a3);
    objc_storeStrong((id *)&v19->_locationCache, a4);
    objc_storeStrong((id *)&v19->_aoiCache, a5);
    objc_storeStrong((id *)&v19->_poiCache, a6);
    objc_storeStrong((id *)&v19->_roiCache, a7);
    objc_storeStrong((id *)&v19->_natureCache, a8);
    v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    parentTaxonomyNodesBySceneIdentifierBySceneModelIdentifier = v19->_parentTaxonomyNodesBySceneIdentifierBySceneModelIdentifier;
    v19->_parentTaxonomyNodesBySceneIdentifierBySceneModelIdentifier = v20;

    v19->_parentTaxonomyNodesLock._os_unfair_lock_opaque = 0;
    id v22 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    taxonomyNodeBySceneIdentifierBySceneModelIdentifier = v19->_taxonomyNodeBySceneIdentifierBySceneModelIdentifier;
    v19->_taxonomyNodeBySceneIdentifierBySceneModelIdentifier = v22;

    v19->_taxonomyNodesLock._os_unfair_lock_opaque = 0;
    uint64_t v24 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    taxonomyNodesLevelsAndWeightsBySceneIdentifierBySceneModelIdentifier = v19->_taxonomyNodesLevelsAndWeightsBySceneIdentifierBySceneModelIdentifier;
    v19->_taxonomyNodesLevelsAndWeightsBySceneIdentifierBySceneModelIdentifier = v24;

    v19->_taxonomyNodesLevelsAndWeightsLock._os_unfair_lock_opaque = 0;
    v26 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    maxTaxonomyNodeLevelBySceneIdentifierBySceneModelIdentifier = v19->_maxTaxonomyNodeLevelBySceneIdentifierBySceneModelIdentifier;
    v19->_maxTaxonomyNodeLevelBySceneIdentifierBySceneModelIdentifier = v26;
  }
  return v19;
}

@end