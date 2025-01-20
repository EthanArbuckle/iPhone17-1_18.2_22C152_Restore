@interface AXAuditObjectTransportInfoPropertyBased
- (AXAuditObjectTransportInfoPropertyBased)init;
- (AXAuditObjectTransportInfoPropertyBased)initWithClass:(Class)a3 transportKey:(id)a4;
- (Class)entryClass;
- (NSArray)propertyEntries;
- (NSMutableArray)_propertyEntries;
- (void)_initializeBlocks;
- (void)addPropertyEntry:(id)a3;
- (void)setEntryClass:(Class)a3;
- (void)set_propertyEntries:(id)a3;
@end

@implementation AXAuditObjectTransportInfoPropertyBased

- (AXAuditObjectTransportInfoPropertyBased)initWithClass:(Class)a3 transportKey:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)AXAuditObjectTransportInfoPropertyBased;
  v5 = [(AXAuditObjectTransportInfo *)&v8 initWithTransportKey:a4];
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_entryClass, a3);
    [(AXAuditObjectTransportInfoPropertyBased *)v6 _initializeBlocks];
  }
  return v6;
}

- (NSArray)propertyEntries
{
  v2 = [(AXAuditObjectTransportInfoPropertyBased *)self _propertyEntries];
  v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (AXAuditObjectTransportInfoPropertyBased)init
{
  v6.receiver = self;
  v6.super_class = (Class)AXAuditObjectTransportInfoPropertyBased;
  v2 = [(AXAuditObjectTransportInfoPropertyBased *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    propertyEntries = v2->__propertyEntries;
    v2->__propertyEntries = (NSMutableArray *)v3;
  }
  return v2;
}

- (void)_initializeBlocks
{
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __60__AXAuditObjectTransportInfoPropertyBased__initializeBlocks__block_invoke;
  v7[3] = &unk_26520CEE0;
  v7[4] = self;
  [(AXAuditObjectTransportInfo *)self setCanEncodeObjectBlock:v7];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __60__AXAuditObjectTransportInfoPropertyBased__initializeBlocks__block_invoke_2;
  v5[3] = &unk_26520CF08;
  objc_copyWeak(&v6, &location);
  [(AXAuditObjectTransportInfo *)self setCreateLocalObjectBlock:v5];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __60__AXAuditObjectTransportInfoPropertyBased__initializeBlocks__block_invoke_3;
  v3[3] = &unk_26520CF30;
  objc_copyWeak(&v4, &location);
  [(AXAuditObjectTransportInfo *)self setCreateTransportObjectBlock:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

uint64_t __60__AXAuditObjectTransportInfoPropertyBased__initializeBlocks__block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v2 = *(void **)(a1 + 32);
    id v3 = a2;
    [v2 entryClass];
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

objc_class *__60__AXAuditObjectTransportInfoPropertyBased__initializeBlocks__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = (objc_class *)[WeakRetained entryClass];

  if (v6)
  {
    id v6 = (objc_class *)objc_alloc_init(v6);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v7 = objc_loadWeakRetained(v4);
    objc_super v8 = objc_msgSend(v7, "propertyEntries", 0);

    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          v14 = [v13 transportKey];
          v15 = [v3 objectForKeyedSubscript:v14];
          v16 = [v13 populateLocalObjectWithTransportValue];
          ((void (**)(void, objc_class *, void *))v16)[2](v16, v6, v15);
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }
  }

  return v6;
}

id __60__AXAuditObjectTransportInfoPropertyBased__initializeBlocks__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = objc_msgSend(WeakRetained, "propertyEntries", 0);

  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v12 = [v11 localValueToTransportValue];
        v13 = ((void (**)(void, id))v12)[2](v12, v3);

        if (v13)
        {
          v14 = [v11 transportKey];
          [v4 setObject:v13 forKeyedSubscript:v14];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  return v4;
}

- (void)addPropertyEntry:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(AXAuditObjectTransportInfoPropertyBased *)self _propertyEntries];
    [v5 addObject:v4];
  }
}

- (Class)entryClass
{
  return self->_entryClass;
}

- (void)setEntryClass:(Class)a3
{
}

- (NSMutableArray)_propertyEntries
{
  return self->__propertyEntries;
}

- (void)set_propertyEntries:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__propertyEntries, 0);

  objc_storeStrong((id *)&self->_entryClass, 0);
}

@end