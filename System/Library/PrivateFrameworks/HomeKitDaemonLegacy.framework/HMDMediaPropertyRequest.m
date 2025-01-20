@interface HMDMediaPropertyRequest
+ (id)deserializeReadRequests:(id)a3 mediaProfile:(id)a4;
+ (id)requestWithProperty:(id)a3 mediaProfile:(id)a4;
+ (id)serializeReadRequests:(id)a3;
- (HMDMediaProfile)mediaProfile;
- (HMDMediaPropertyRequest)initWithProperty:(id)a3 mediaProfile:(id)a4;
- (NSString)property;
- (id)description;
- (id)previousValue;
@end

@implementation HMDMediaPropertyRequest

- (void).cxx_destruct
{
  objc_storeStrong(&self->_previousValue, 0);
  objc_storeStrong((id *)&self->_mediaProfile, 0);
  objc_storeStrong((id *)&self->_property, 0);
}

- (id)previousValue
{
  return self->_previousValue;
}

- (HMDMediaProfile)mediaProfile
{
  return self->_mediaProfile;
}

- (NSString)property
{
  return self->_property;
}

- (id)description
{
  v3 = NSString;
  v4 = [(HMDMediaPropertyRequest *)self mediaProfile];
  v5 = [v4 uniqueIdentifier];
  v6 = [(HMDMediaPropertyRequest *)self property];
  v7 = [(HMDMediaPropertyRequest *)self previousValue];
  v8 = [v3 stringWithFormat:@"<MPReq: %@/%@ (prevVal: %@)>", v5, v6, v7];

  return v8;
}

- (HMDMediaPropertyRequest)initWithProperty:(id)a3 mediaProfile:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDMediaPropertyRequest;
  v9 = [(HMDMediaPropertyRequest *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_property, a3);
    objc_storeStrong((id *)&v10->_mediaProfile, a4);
  }

  return v10;
}

+ (id)deserializeReadRequests:(id)a3 mediaProfile:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = +[HMDMediaPropertyRequest requestWithProperty:mediaProfile:](HMDMediaPropertyRequest, "requestWithProperty:mediaProfile:", *(void *)(*((void *)&v16 + 1) + 8 * i), v6, (void)v16);
        if (v13) {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  v14 = (void *)[v7 copy];
  return v14;
}

+ (id)serializeReadRequests:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "mediaProfile", (void)v18);
        objc_super v12 = [v11 uniqueIdentifier];
        v13 = [v12 UUIDString];

        v14 = [v4 objectForKeyedSubscript:v13];
        if (!v14)
        {
          v14 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
          [v4 setObject:v14 forKeyedSubscript:v13];
        }
        v15 = [v10 property];
        [v14 addObject:v15];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  long long v16 = (void *)[v4 copy];
  return v16;
}

+ (id)requestWithProperty:(id)a3 mediaProfile:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)[objc_alloc((Class)a1) initWithProperty:v7 mediaProfile:v6];

  return v8;
}

@end