@interface ENDownloadManagerState
+ (BOOL)supportsSecureCoding;
- (ENDownloadManagerState)init;
- (ENDownloadManagerState)initWithCoder:(id)a3;
- (NSArray)endpointStates;
- (NSArray)endpoints;
- (id)stateForServerBaseURL:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setEndpoints:(id)a3;
@end

@implementation ENDownloadManagerState

- (ENDownloadManagerState)init
{
  v6.receiver = self;
  v6.super_class = (Class)ENDownloadManagerState;
  v2 = [(ENDownloadManagerState *)&v6 init];
  if (v2)
  {
    v3 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1C9E0]);
    statesByURL = v2->_statesByURL;
    v2->_statesByURL = v3;
  }
  return v2;
}

- (void)setEndpoints:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA68]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "serverBaseURL", (void)v17);
        v13 = [(NSDictionary *)self->_statesByURL objectForKeyedSubscript:v12];
        if (v13)
        {
          v14 = v13;
          [(ENDownloadEndpointState *)v13 setEndpoint:v11];
        }
        else
        {
          v14 = [[ENDownloadEndpointState alloc] initWithEndpoint:v11];
        }
        [v5 setObject:v14 forKeyedSubscript:v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  v15 = (NSDictionary *)[objc_alloc(MEMORY[0x1E4F1C9E0]) initWithDictionary:v5];
  statesByURL = self->_statesByURL;
  self->_statesByURL = v15;
}

- (NSArray)endpoints
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA40]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(ENDownloadManagerState *)self endpointStates];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) endpoint];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  v10 = (void *)[v3 copy];

  return (NSArray *)v10;
}

- (NSArray)endpointStates
{
  return [(NSDictionary *)self->_statesByURL allValues];
}

- (id)stateForServerBaseURL:(id)a3
{
  return [(NSDictionary *)self->_statesByURL objectForKeyedSubscript:a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ENDownloadManagerState *)self endpointStates];
  [v4 encodeInteger:1 forKey:@"vers"];
  [v4 encodeObject:v5 forKey:@"endpoints"];
}

- (ENDownloadManagerState)initWithCoder:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 decodeIntegerForKey:@"vers"] == 1)
  {
    id v5 = (void *)MEMORY[0x1E4F1CAD8];
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
    uint64_t v8 = [v4 decodeObjectOfClasses:v7 forKey:@"endpoints"];
    if (v8)
    {
      uint64_t v9 = [(ENDownloadManagerState *)self init];
      v10 = v9;
      if (v9)
      {
        v24 = v9;
        v25 = v7;
        id v11 = objc_alloc_init(MEMORY[0x1E4F1CA68]);
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        id v12 = v8;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v27;
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v27 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v17 = *(void **)(*((void *)&v26 + 1) + 8 * i);
              long long v18 = [v17 endpoint];
              long long v19 = [v18 serverBaseURL];
              [v11 setObject:v17 forKeyedSubscript:v19];
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
          }
          while (v14);
        }

        uint64_t v20 = [objc_alloc(MEMORY[0x1E4F1C9E0]) initWithDictionary:v11];
        v10 = v24;
        statesByURL = v24->_statesByURL;
        v24->_statesByURL = (NSDictionary *)v20;

        uint64_t v7 = v25;
      }
      self = v10;
      uint64_t v22 = self;
    }
    else
    {
      uint64_t v22 = 0;
    }
  }
  else
  {
    uint64_t v22 = 0;
  }

  return v22;
}

- (void).cxx_destruct
{
}

@end