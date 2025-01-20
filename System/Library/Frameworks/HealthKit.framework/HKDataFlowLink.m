@interface HKDataFlowLink
- (HKDataFlowLink)initWithProcessor:(id)a3 sourceProtocol:(id)a4 destinationProtocol:(id)a5 loggingCategory:(id)a6;
- (HKDataFlowLinkProcessor)processor;
- (Protocol)destinationProtocol;
- (Protocol)sourceProtocol;
- (id)allDestinationProcessors;
- (id)allSourceProcessors;
- (id)description;
- (id)destinationProcessorsConformingToProtocol:(id)a3;
- (void)addDestination:(id)a3;
- (void)addSource:(id)a3;
- (void)destination:(id)a3 didAddDownstreamDestination:(id)a4;
- (void)removeDestination:(id)a3;
- (void)removeSource:(id)a3;
- (void)sendToDestinationProcessors:(id)a3;
- (void)source:(id)a3 didAddUpstreamSource:(id)a4;
@end

@implementation HKDataFlowLink

- (HKDataFlowLink)initWithProcessor:(id)a3 sourceProtocol:(id)a4 destinationProtocol:(id)a5 loggingCategory:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)HKDataFlowLink;
  v14 = [(HKDataFlowLink *)&v21 init];
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_processor, v10);
    objc_storeStrong((id *)&v15->_sourceProtocol, a4);
    uint64_t v16 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    sources = v15->_sources;
    v15->_sources = (NSHashTable *)v16;

    objc_storeStrong((id *)&v15->_destinationProtocol, a5);
    uint64_t v18 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    destinations = v15->_destinations;
    v15->_destinations = (NSHashTable *)v18;

    objc_storeStrong((id *)&v15->_category, a6);
    v15->_lock._os_unfair_lock_opaque = 0;
  }

  return v15;
}

- (void)addSource:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 processor];
  char v6 = [v5 conformsToProtocol:self->_sourceProtocol];

  if (v6)
  {
    os_unfair_lock_lock(&self->_lock);
    _HKInitializeLogging();
    category = self->_category;
    if (os_log_type_enabled(category, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v26 = self;
      __int16 v27 = 2114;
      id v28 = v4;
      _os_log_impl(&dword_19C023000, category, OS_LOG_TYPE_INFO, "%{public}@: Added source %{public}@", buf, 0x16u);
    }
    [(NSHashTable *)self->_sources addObject:v4];
    v8 = [(NSHashTable *)self->_destinations allObjects];
    os_unfair_lock_unlock(&self->_lock);
    [v4 addDestination:self];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_processor);
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v11 = objc_loadWeakRetained((id *)&self->_processor);
      [v11 dataFlowLink:self didAddSource:v4 direct:1];
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v12 = v8;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v21 != v15) {
            objc_enumerationMutation(v12);
          }
          objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "source:didAddUpstreamSource:", self, v4, (void)v20);
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v14);
    }
  }
  else
  {
    _HKInitializeLogging();
    v17 = self->_category;
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      goto LABEL_16;
    }
    sourceProtocol = self->_sourceProtocol;
    id v12 = v17;
    v19 = NSStringFromProtocol(sourceProtocol);
    *(_DWORD *)buf = 138543874;
    v26 = self;
    __int16 v27 = 2114;
    id v28 = v4;
    __int16 v29 = 2114;
    v30 = v19;
    _os_log_fault_impl(&dword_19C023000, v12, OS_LOG_TYPE_FAULT, "%{public}@: Cannot add source %{public}@ because it does not conform to expected protocol %{public}@", buf, 0x20u);
  }
LABEL_16:
}

- (void)removeSource:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 removeDestination:self];
  os_unfair_lock_lock(&self->_lock);
  _HKInitializeLogging();
  category = self->_category;
  if (os_log_type_enabled(category, OS_LOG_TYPE_INFO))
  {
    int v6 = 138543618;
    v7 = self;
    __int16 v8 = 2114;
    id v9 = v4;
    _os_log_impl(&dword_19C023000, category, OS_LOG_TYPE_INFO, "%{public}@: Removed source %{public}@", (uint8_t *)&v6, 0x16u);
  }
  [(NSHashTable *)self->_sources removeObject:v4];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)source:(id)a3 didAddUpstreamSource:(id)a4
{
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_processor);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_processor);
    [v7 dataFlowLink:self didAddSource:v8 direct:0];
  }
}

- (id)allSourceProcessors
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(NSHashTable *)self->_sources allObjects];
  os_unfair_lock_unlock(p_lock);
  v5 = objc_msgSend(v4, "hk_map:", &__block_literal_global_83);

  return v5;
}

uint64_t __37__HKDataFlowLink_allSourceProcessors__block_invoke(uint64_t a1, void *a2)
{
  return [a2 processor];
}

- (id)allDestinationProcessors
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(NSHashTable *)self->_destinations allObjects];
  os_unfair_lock_unlock(p_lock);
  v5 = objc_msgSend(v4, "hk_map:", &__block_literal_global_8);

  return v5;
}

uint64_t __42__HKDataFlowLink_allDestinationProcessors__block_invoke(uint64_t a1, void *a2)
{
  return [a2 processor];
}

- (id)destinationProcessorsConformingToProtocol:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v5 = [(NSHashTable *)self->_destinations allObjects];
  os_unfair_lock_unlock(&self->_lock);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __60__HKDataFlowLink_destinationProcessorsConformingToProtocol___block_invoke;
  v20[3] = &unk_1E58C52E8;
  id v7 = v4;
  id v21 = v7;
  id v8 = objc_msgSend(v5, "hk_map:", v20);
  [v6 addObjectsFromArray:v8];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "destinationProcessorsConformingToProtocol:", v7, (void)v16);
        [v6 addObjectsFromArray:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v11);
  }

  return v6;
}

id __60__HKDataFlowLink_destinationProcessorsConformingToProtocol___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 processor];
  if ([v4 conformsToProtocol:*(void *)(a1 + 32)])
  {
    v5 = [v3 processor];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)sendToDestinationProcessors:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *))a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = [(NSHashTable *)self->_destinations allObjects];
  os_unfair_lock_unlock(p_lock);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v11), "processor", (void)v13);
        if (v12) {
          v4[2](v4, v12);
        }

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)addDestination:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 processor];
  char v6 = [v5 conformsToProtocol:self->_destinationProtocol];

  if (v6)
  {
    os_unfair_lock_lock(&self->_lock);
    _HKInitializeLogging();
    category = self->_category;
    if (os_log_type_enabled(category, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v24 = self;
      __int16 v25 = 2114;
      id v26 = v4;
      _os_log_impl(&dword_19C023000, category, OS_LOG_TYPE_INFO, "%{public}@: Added destination %{public}@", buf, 0x16u);
    }
    [(NSHashTable *)self->_destinations addObject:v4];
    uint64_t v8 = [(NSHashTable *)self->_sources allObjects];
    os_unfair_lock_unlock(&self->_lock);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_processor);
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v11 = objc_loadWeakRetained((id *)&self->_processor);
      [v11 dataFlowLink:self didAddDestination:v4 direct:1];
    }
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v12 = v8;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(v12);
          }
          objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "destination:didAddDownstreamDestination:", self, v4, (void)v18);
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v14);
    }
  }
  else
  {
    long long v17 = self->_category;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      -[HKDataFlowLink addDestination:](v17);
    }
  }
}

- (void)removeDestination:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  _HKInitializeLogging();
  category = self->_category;
  if (os_log_type_enabled(category, OS_LOG_TYPE_INFO))
  {
    int v6 = 138543618;
    id v7 = self;
    __int16 v8 = 2114;
    id v9 = v4;
    _os_log_impl(&dword_19C023000, category, OS_LOG_TYPE_INFO, "%{public}@: Removed destination %{public}@", (uint8_t *)&v6, 0x16u);
  }
  [(NSHashTable *)self->_destinations removeObject:v4];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)destination:(id)a3 didAddDownstreamDestination:(id)a4
{
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_processor);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_processor);
    [v7 dataFlowLink:self didAddDestination:v8 direct:0];
  }
}

- (id)description
{
  id v3 = NSString;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_processor);
  v5 = [v3 stringWithFormat:@"<HKDataFlowLink:%p [%@]>", self, WeakRetained];

  return v5;
}

- (HKDataFlowLinkProcessor)processor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_processor);

  return (HKDataFlowLinkProcessor *)WeakRetained;
}

- (Protocol)sourceProtocol
{
  return self->_sourceProtocol;
}

- (Protocol)destinationProtocol
{
  return self->_destinationProtocol;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationProtocol, 0);
  objc_storeStrong((id *)&self->_sourceProtocol, 0);
  objc_destroyWeak((id *)&self->_processor);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_destinations, 0);

  objc_storeStrong((id *)&self->_sources, 0);
}

- (void)addDestination:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_19C023000, log, OS_LOG_TYPE_FAULT, "[destination.processor conformsToProtocol:_destinationProtocol]", v1, 2u);
}

@end