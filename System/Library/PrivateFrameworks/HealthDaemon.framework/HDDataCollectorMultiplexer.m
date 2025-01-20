@interface HDDataCollectorMultiplexer
- (id)aggregatorForType:(id)a3;
- (id)diagnosticDescription;
- (id)identifierForAggregator:(id)a3;
- (id)initForCollector:(id)a3 identifier:(id)a4 profile:(id)a5 types:(id)a6;
- (id)lastDatumForType:(id)a3;
- (id)mergedConfiguration;
- (void)registerForCollectionWithState:(id)a3;
- (void)setConfiguration:(id)a3 forAggregator:(id)a4;
- (void)setLastSensorDatum:(id)a3 forAggregator:(id)a4;
- (void)unregisterForCollection;
@end

@implementation HDDataCollectorMultiplexer

- (id)initForCollector:(id)a3 identifier:(id)a4 profile:(id)a5 types:(id)a6
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v45 = a4;
  id v11 = a5;
  id v12 = a6;
  v50.receiver = self;
  v50.super_class = (Class)HDDataCollectorMultiplexer;
  v13 = [(HDDataCollectorMultiplexer *)&v50 init];
  v14 = v13;
  if (v13)
  {
    id v42 = v11;
    objc_storeWeak((id *)&v13->_profile, v11);
    id v43 = v10;
    objc_storeWeak((id *)&v14->_collector, v10);
    uint64_t v15 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    recordsByAggregator = v14->_recordsByAggregator;
    v14->_recordsByAggregator = (NSMapTable *)v15;

    id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v41 = v12;
    id obj = v12;
    uint64_t v18 = [obj countByEnumeratingWithState:&v46 objects:v52 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v47 != v20) {
            objc_enumerationMutation(obj);
          }
          v22 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          v23 = NSString;
          v24 = [v22 identifier];
          v25 = [v23 stringWithFormat:@"%@.%@", v45, v24];

          id WeakRetained = objc_loadWeakRetained((id *)&v14->_profile);
          v27 = [WeakRetained dataCollectionManager];
          v28 = [v27 aggregatorForType:v22];

          [v17 setObject:v28 forKeyedSubscript:v22];
          v29 = [HDDataCollectorAggregatorRecord alloc];
          id v30 = v28;
          id v31 = v25;
          if (v29)
          {
            v51.receiver = v29;
            v51.super_class = (Class)HDDataCollectorAggregatorRecord;
            v32 = [(HDDataCollectorMultiplexer *)&v51 init];
            v29 = (HDDataCollectorAggregatorRecord *)v32;
            if (v32)
            {
              objc_storeStrong((id *)&v32->_collector, v28);
              uint64_t v33 = [v31 copy];
              identifier = v29->_identifier;
              v29->_identifier = (NSString *)v33;

              uint64_t v35 = +[HDDataCollectorConfiguration disabledConfiguration];
              configuration = v29->_configuration;
              v29->_configuration = (HDDataCollectorConfiguration *)v35;

              lastSensorDatum = v29->_lastSensorDatum;
              v29->_lastSensorDatum = 0;

              v29->_hasSetLastSensorDatum = 0;
            }
          }

          [(NSMapTable *)v14->_recordsByAggregator setObject:v29 forKey:v30];
        }
        uint64_t v19 = [obj countByEnumeratingWithState:&v46 objects:v52 count:16];
      }
      while (v19);
    }

    uint64_t v38 = [v17 copy];
    aggregatorsByType = v14->_aggregatorsByType;
    v14->_aggregatorsByType = (NSDictionary *)v38;

    id v11 = v42;
    id v10 = v43;
    id v12 = v41;
  }

  return v14;
}

- (void)registerForCollectionWithState:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collector);
  v6 = WeakRetained;
  if (WeakRetained)
  {
    aggregatorsByType = self->_aggregatorsByType;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __61__HDDataCollectorMultiplexer_registerForCollectionWithState___block_invoke;
    v8[3] = &unk_1E63034E0;
    id v9 = WeakRetained;
    id v10 = v4;
    [(NSDictionary *)aggregatorsByType enumerateKeysAndObjectsUsingBlock:v8];
  }
}

uint64_t __61__HDDataCollectorMultiplexer_registerForCollectionWithState___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 registerDataCollector:*(void *)(a1 + 32) state:*(void *)(a1 + 40)];
}

- (void)unregisterForCollection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collector);
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    aggregatorsByType = self->_aggregatorsByType;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __53__HDDataCollectorMultiplexer_unregisterForCollection__block_invoke;
    v6[3] = &unk_1E6303508;
    id v7 = WeakRetained;
    [(NSDictionary *)aggregatorsByType enumerateKeysAndObjectsUsingBlock:v6];
  }
}

uint64_t __53__HDDataCollectorMultiplexer_unregisterForCollection__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 unregisterDataCollector:*(void *)(a1 + 32)];
}

- (id)aggregatorForType:(id)a3
{
  return [(NSDictionary *)self->_aggregatorsByType objectForKeyedSubscript:a3];
}

- (id)identifierForAggregator:(id)a3
{
  v3 = [(NSMapTable *)self->_recordsByAggregator objectForKey:a3];
  id v4 = v3;
  if (v3) {
    v3 = (void *)v3[3];
  }
  v5 = v3;

  return v5;
}

- (id)lastDatumForType:(id)a3
{
  id v4 = [(NSDictionary *)self->_aggregatorsByType objectForKeyedSubscript:a3];
  if (v4)
  {
    uint64_t v5 = [(NSMapTable *)self->_recordsByAggregator objectForKey:v4];
    v6 = (void *)v5;
    if (v5) {
      id v7 = *(void **)(v5 + 40);
    }
    else {
      id v7 = 0;
    }
    id v8 = v7;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)setLastSensorDatum:(id)a3 forAggregator:(id)a4
{
  recordsByAggregator = self->_recordsByAggregator;
  id v7 = a3;
  id v9 = [(NSMapTable *)recordsByAggregator objectForKey:a4];
  id v8 = v7;
  if (v9)
  {
    objc_storeStrong(v9 + 5, a3);
    *((unsigned char *)v9 + 8) = 1;
  }
}

- (id)mergedConfiguration
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v3 = +[HDDataCollectorConfiguration disabledConfiguration];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = [(NSMapTable *)self->_recordsByAggregator objectEnumerator];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v19;
    id v9 = (os_log_t *)MEMORY[0x1E4F29F10];
    *(void *)&long long v6 = 138543618;
    long long v17 = v6;
    while (2)
    {
      uint64_t v10 = 0;
      id v11 = v3;
      do
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * v10);
        if (!v12 || !*(unsigned char *)(v12 + 8))
        {
          _HKInitializeLogging();
          uint64_t v15 = *v9;
          if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v17;
            v23 = self;
            __int16 v24 = 2114;
            uint64_t v25 = v12;
            _os_log_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: last sensor dataum has not been set for %{public}@", buf, 0x16u);
          }
          v14 = +[HDDataCollectorConfiguration disabledConfiguration];

          goto LABEL_16;
        }
        _HKInitializeLogging();
        v13 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v17;
          v23 = self;
          __int16 v24 = 2114;
          uint64_t v25 = v12;
          _os_log_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_INFO, "%{public}@: merging configuration for record %{public}@", buf, 0x16u);
        }
        v3 = objc_msgSend(v11, "mergedConfiguration:", *(void *)(v12 + 32), v17);

        ++v10;
        id v11 = v3;
      }
      while (v7 != v10);
      uint64_t v7 = [v4 countByEnumeratingWithState:&v18 objects:v26 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  id v11 = v3;
  v14 = v11;
LABEL_16:

  return v14;
}

- (void)setConfiguration:(id)a3 forAggregator:(id)a4
{
  recordsByAggregator = self->_recordsByAggregator;
  id v7 = a3;
  uint64_t v8 = [(NSMapTable *)recordsByAggregator objectForKey:a4];
  if (v8) {
    objc_storeStrong(v8 + 4, a3);
  }
}

- (id)diagnosticDescription
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendString:@"Diagnostic Description:\n"];
  [v3 appendFormat:@"\taggregatorsByType: %@\n", self->_aggregatorsByType];
  [v3 appendFormat:@"\trecordsByAggregator: %@\n", self->_recordsByAggregator];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordsByAggregator, 0);
  objc_storeStrong((id *)&self->_aggregatorsByType, 0);
  objc_destroyWeak((id *)&self->_collector);

  objc_destroyWeak((id *)&self->_profile);
}

@end