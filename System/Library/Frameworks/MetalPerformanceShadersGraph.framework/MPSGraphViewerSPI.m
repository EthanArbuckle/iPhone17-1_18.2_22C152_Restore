@interface MPSGraphViewerSPI
- (MPSGraphViewerSPI)initWithJSONDictionary:(id)a3;
- (MPSGraphViewerSPI)initWithName:(id)a3 nodes:(id)a4;
- (NSArray)nodes;
- (NSString)name;
- (id)jsonDictionary;
@end

@implementation MPSGraphViewerSPI

- (MPSGraphViewerSPI)initWithName:(id)a3 nodes:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MPSGraphViewerSPI;
  v9 = [(MPSGraphViewerSPI *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeStrong((id *)&v10->_nodes, a4);
  }

  return v10;
}

- (MPSGraphViewerSPI)initWithJSONDictionary:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MPSGraphViewerSPI;
  v5 = [(MPSGraphViewerSPI *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [v4 objectForKey:@"nodes"];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v20;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * v12);
          v14 = [MPSGraphViewerNodeSPI alloc];
          v15 = -[MPSGraphViewerNodeSPI initWithJSONDictionary:](v14, "initWithJSONDictionary:", v13, (void)v19);
          [v8 addObject:v15];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v10);
    }

    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithArray:v8];
    nodes = v5->_nodes;
    v5->_nodes = (NSArray *)v16;
  }
  return v5;
}

- (id)jsonDictionary
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(MPSGraphViewerSPI *)self nodes];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = [*(id *)(*((void *)&v12 + 1) + 8 * i) jsonDictionary];
        [v3 addObject:v8];
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v18 count:16];
    }
    while (v5);
  }

  v16[0] = @"name";
  id v9 = [(MPSGraphViewerSPI *)self name];
  v16[1] = @"nodes";
  v17[0] = v9;
  v17[1] = v3;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];

  return v10;
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)nodes
{
  return self->_nodes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nodes, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end