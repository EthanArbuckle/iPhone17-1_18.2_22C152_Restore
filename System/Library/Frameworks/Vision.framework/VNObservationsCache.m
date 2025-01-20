@interface VNObservationsCache
- (VNObservationsCache)init;
- (id)observationsAcceptedByRequest:(id)a3 testedKeyHandler:(id)a4;
- (id)observationsForKey:(id)a3;
- (void)setObservations:(id)a3 forKey:(id)a4;
@end

@implementation VNObservationsCache

- (void).cxx_destruct
{
}

- (id)observationsAcceptedByRequest:(id)a3 testedKeyHandler:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, void *, uint64_t))a4;
  uint64_t v8 = [v6 frameworkClass];
  p_observationsCacheLock = &self->_observationsCacheLock;
  os_unfair_lock_lock(&self->_observationsCacheLock);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v10 = [(NSMapTable *)self->_observationsCache keyEnumerator];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    v18 = self;
    v19 = &self->_observationsCacheLock;
    uint64_t v12 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v10);
        }
        v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v14, "requestClass", v18) == v8)
        {
          uint64_t v15 = [v6 willAcceptCachedResultsFromRequestWithConfiguration:v14];
          if (v7) {
            v7[2](v7, v14, v15);
          }
          if (v15)
          {
            v16 = [(NSMapTable *)v18->_observationsCache objectForKey:v14];
            goto LABEL_14;
          }
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v11) {
        continue;
      }
      break;
    }
    v16 = 0;
LABEL_14:
    p_observationsCacheLock = v19;
  }
  else
  {
    v16 = 0;
  }

  os_unfair_lock_unlock(p_observationsCacheLock);

  return v16;
}

- (void)setObservations:(id)a3 forKey:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  p_observationsCacheLock = &self->_observationsCacheLock;
  os_unfair_lock_lock(&self->_observationsCacheLock);
  observationsCache = self->_observationsCache;
  if (v10)
  {
    v9 = (void *)[v10 copy];
    [(NSMapTable *)observationsCache setObject:v9 forKey:v6];
  }
  else
  {
    [(NSMapTable *)observationsCache removeObjectForKey:v6];
  }
  os_unfair_lock_unlock(p_observationsCacheLock);
}

- (id)observationsForKey:(id)a3
{
  id v4 = a3;
  p_observationsCacheLock = &self->_observationsCacheLock;
  os_unfair_lock_lock(&self->_observationsCacheLock);
  id v6 = [(NSMapTable *)self->_observationsCache objectForKey:v4];
  os_unfair_lock_unlock(p_observationsCacheLock);

  return v6;
}

- (VNObservationsCache)init
{
  v8.receiver = self;
  v8.super_class = (Class)VNObservationsCache;
  v2 = [(VNObservationsCache *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_observationsCacheLock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    observationsCache = v3->_observationsCache;
    v3->_observationsCache = (NSMapTable *)v4;

    id v6 = v3;
  }

  return v3;
}

@end