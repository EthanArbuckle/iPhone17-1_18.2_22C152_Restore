@interface _CPLResourcesMutableArray
- (_CPLResourcesMutableArray)initWithResources:(id)a3;
- (id)allResources;
- (id)reallyUpdatedResources;
- (void)addResource:(id)a3;
@end

@implementation _CPLResourcesMutableArray

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedResourcesPerType, 0);
  objc_storeStrong((id *)&self->_resourcesPerType, 0);
}

- (id)reallyUpdatedResources
{
  return (id)[(NSMutableDictionary *)self->_updatedResourcesPerType allValues];
}

- (id)allResources
{
  return (id)[(NSMutableDictionary *)self->_resourcesPerType allValues];
}

- (void)addResource:(id)a3
{
  resourcesPerType = self->_resourcesPerType;
  v5 = NSNumber;
  id v6 = a3;
  v7 = objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "resourceType"));
  [(NSMutableDictionary *)resourcesPerType setObject:v6 forKey:v7];

  updatedResourcesPerType = self->_updatedResourcesPerType;
  objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "resourceType"));
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [(NSMutableDictionary *)updatedResourcesPerType setObject:v6 forKey:v9];
}

- (_CPLResourcesMutableArray)initWithResources:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)_CPLResourcesMutableArray;
  v5 = [(_CPLResourcesMutableArray *)&v23 init];
  if (v5)
  {
    id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    resourcesPerType = v5->_resourcesPerType;
    v5->_resourcesPerType = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    updatedResourcesPerType = v5->_updatedResourcesPerType;
    v5->_updatedResourcesPerType = v8;

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v10 = v4;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          v16 = v5->_resourcesPerType;
          v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v15, "resourceType", (void)v19));
          [(NSMutableDictionary *)v16 setObject:v15 forKey:v17];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v12);
    }
  }
  return v5;
}

@end