@interface MPSGraphViewerNodeRegionSPI
- (MPSGraphViewerNodeRegionSPI)initWithJSONDictionary:(id)a3;
- (MPSGraphViewerNodeRegionSPI)initWithName:(id)a3 returnType:(id)a4 nodes:(id)a5;
- (NSArray)nodes;
- (NSString)name;
- (NSString)returnType;
- (id)jsonDictionary;
@end

@implementation MPSGraphViewerNodeRegionSPI

- (MPSGraphViewerNodeRegionSPI)initWithName:(id)a3 returnType:(id)a4 nodes:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MPSGraphViewerNodeRegionSPI;
  v12 = [(MPSGraphViewerNodeRegionSPI *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_name, a3);
    objc_storeStrong((id *)&v13->_returnType, a4);
    objc_storeStrong((id *)&v13->_nodes, a5);
  }

  return v13;
}

- (MPSGraphViewerNodeRegionSPI)initWithJSONDictionary:(id)a3
{
  NSString *returnType;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  MPSGraphViewerNodeSPI *v16;
  MPSGraphViewerNodeSPI *v17;
  uint64_t v18;
  NSArray *nodes;
  long long v21;
  long long v22;
  long long v23;
  long long v24;
  objc_super v25;
  unsigned char v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)MPSGraphViewerNodeRegionSPI;
  v5 = [(MPSGraphViewerNodeRegionSPI *)&v25 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [v4 objectForKey:@"returnType"];
    returnType = v5->_returnType;
    v5->_returnType = (NSString *)v8;

    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [v4 objectForKey:@"nodes"];
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    v12 = [v11 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v12)
    {
      v13 = *(void *)v22;
      do
      {
        v14 = 0;
        do
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v11);
          }
          objc_super v15 = *(void *)(*((void *)&v21 + 1) + 8 * v14);
          v16 = [MPSGraphViewerNodeSPI alloc];
          v17 = -[MPSGraphViewerNodeSPI initWithJSONDictionary:](v16, "initWithJSONDictionary:", v15, (void)v21);
          [v10 addObject:v17];

          ++v14;
        }
        while (v12 != v14);
        v12 = [v11 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v12);
    }

    v18 = [MEMORY[0x1E4F1C978] arrayWithArray:v10];
    nodes = v5->_nodes;
    v5->_nodes = (NSArray *)v18;
  }
  return v5;
}

- (id)jsonDictionary
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = [(MPSGraphViewerNodeRegionSPI *)self nodes];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = [*(id *)(*((void *)&v15 + 1) + 8 * i) jsonDictionary];
        [v3 addObject:v8];
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }

  id v9 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v10 = [(MPSGraphViewerNodeRegionSPI *)self name];
  [v9 setObject:v10 forKey:@"name"];

  id v11 = [(MPSGraphViewerNodeRegionSPI *)self returnType];
  LOBYTE(v10) = v11 == 0;

  if ((v10 & 1) == 0)
  {
    v12 = [(MPSGraphViewerNodeRegionSPI *)self returnType];
    [v9 setObject:v12 forKey:@"returnType"];
  }
  [v9 setObject:v3 forKey:@"nodes"];
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v9];

  return v13;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)returnType
{
  return self->_returnType;
}

- (NSArray)nodes
{
  return self->_nodes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nodes, 0);
  objc_storeStrong((id *)&self->_returnType, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end