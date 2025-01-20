@interface ATXVIPsDataSource
- (ATXVIPsDataSource)initWithDevice:(id)a3;
- (void)vipsWithCallback:(id)a3;
@end

@implementation ATXVIPsDataSource

- (ATXVIPsDataSource)initWithDevice:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXVIPsDataSource;
  v6 = [(ATXVIPsDataSource *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_device, a3);
  }

  return v7;
}

- (void)vipsWithCallback:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (ATXHeuristicCanLearnFromApp(&unk_1F27273E0))
  {
    id v20 = v3;
    v4 = objc_opt_new();
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v5 = objc_opt_new();
    v6 = [v5 allVIPs];

    id obj = v6;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v23;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v23 != v9) {
            objc_enumerationMutation(obj);
          }
          v11 = *(void **)(*((void *)&v22 + 1) + 8 * v10);
          v12 = objc_opt_new();
          v13 = [v11 identifier];
          [v12 setObject:v13 forKeyedSubscript:@"identifier"];

          v14 = [v11 name];
          [v12 setObject:v14 forKeyedSubscript:@"name"];

          v15 = [v11 displayName];
          [v12 setObject:v15 forKeyedSubscript:@"displayName"];

          v16 = [v11 emailAddresses];
          v17 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"self" ascending:1];
          v26 = v17;
          v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
          v19 = [v16 sortedArrayUsingDescriptors:v18];
          [v12 setObject:v19 forKeyedSubscript:@"emailAddresses"];

          [v4 addObject:v12];
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v8);
    }

    id v3 = v20;
    (*((void (**)(id, void *, void))v20 + 2))(v20, v4, 0);
  }
  else
  {
    (*((void (**)(id, void, void))v3 + 2))(v3, MEMORY[0x1E4F1CBF0], 0);
  }
}

- (void).cxx_destruct
{
}

@end