@interface AALoginResponseDataclasses
- (AALoginResponseDataclasses)initWithiCloudServiceData:(id)a3;
- (NSArray)provisionedDataclasses;
- (NSDictionary)dataclassProperties;
@end

@implementation AALoginResponseDataclasses

- (AALoginResponseDataclasses)initWithiCloudServiceData:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)AALoginResponseDataclasses;
  v5 = [(AALoginResponseDataclasses *)&v22 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKey:@"availableFeatures"];
    provisionedDataclasses = v5->_provisionedDataclasses;
    v5->_provisionedDataclasses = (NSArray *)v6;

    v8 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v9 = objc_msgSend(v4, "allKeys", 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if ([v14 hasPrefix:@"com.apple.Dataclass"])
          {
            v15 = [v4 objectForKey:v14];
            if (v15) {
              [(NSDictionary *)v8 setObject:v15 forKey:v14];
            }
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v11);
    }

    dataclassProperties = v5->_dataclassProperties;
    v5->_dataclassProperties = v8;
  }
  return v5;
}

- (NSArray)provisionedDataclasses
{
  return self->_provisionedDataclasses;
}

- (NSDictionary)dataclassProperties
{
  return self->_dataclassProperties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataclassProperties, 0);

  objc_storeStrong((id *)&self->_provisionedDataclasses, 0);
}

@end