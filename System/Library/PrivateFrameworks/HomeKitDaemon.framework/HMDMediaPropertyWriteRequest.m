@interface HMDMediaPropertyWriteRequest
+ (id)deserializeWriteRequests:(id)a3 mediaProfile:(id)a4;
+ (id)requestWithProperty:(id)a3 mediaProfile:(id)a4;
+ (id)serializeWriteRequests:(id)a3;
+ (id)writeRequestWithProperty:(id)a3 value:(id)a4 mediaProfile:(id)a5;
+ (id)writeRequestWithProperty:(id)a3 value:(id)a4 mediaProfile:(id)a5 identifier:(id)a6;
- (HMDMediaPropertyWriteRequest)initWithProperty:(id)a3 value:(id)a4 mediaProfile:(id)a5 identifier:(id)a6;
- (NSUUID)identifier;
- (id)description;
- (id)value;
@end

@implementation HMDMediaPropertyWriteRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_value, 0);
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (id)value
{
  return self->_value;
}

- (id)description
{
  v3 = NSString;
  v4 = [(HMDMediaPropertyRequest *)self mediaProfile];
  v5 = [(HMDMediaPropertyRequest *)self property];
  v6 = [(HMDMediaPropertyWriteRequest *)self value];
  v7 = [v3 stringWithFormat:@"<MPWR: %@/%@ (val: %@)>", v4, v5, v6];

  return v7;
}

- (HMDMediaPropertyWriteRequest)initWithProperty:(id)a3 value:(id)a4 mediaProfile:(id)a5 identifier:(id)a6
{
  id v11 = a4;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)HMDMediaPropertyWriteRequest;
  v13 = [(HMDMediaPropertyRequest *)&v16 initWithProperty:a3 mediaProfile:a5];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong(&v13->_value, a4);
    objc_storeStrong((id *)&v14->_identifier, a6);
  }

  return v14;
}

+ (id)deserializeWriteRequests:(id)a3 mediaProfile:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v8 = objc_msgSend(v5, "allKeys", 0);
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
        uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        v14 = [v5 objectForKeyedSubscript:v13];
        v15 = +[HMDMediaPropertyWriteRequest writeRequestWithProperty:v13 value:v14 mediaProfile:v6];
        if (v15) {
          [v7 addObject:v15];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  objc_super v16 = (void *)[v7 copy];
  return v16;
}

+ (id)serializeWriteRequests:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "mediaProfile", (void)v19);
        id v12 = [v11 uniqueIdentifier];
        uint64_t v13 = [v12 UUIDString];

        v14 = [v4 objectForKeyedSubscript:v13];
        if (!v14)
        {
          v14 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:1];
          [v4 setObject:v14 forKeyedSubscript:v13];
        }
        v15 = [v10 value];
        objc_super v16 = [v10 property];
        [v14 setObject:v15 forKeyedSubscript:v16];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }

  v17 = (void *)[v4 copy];
  return v17;
}

+ (id)writeRequestWithProperty:(id)a3 value:(id)a4 mediaProfile:(id)a5 identifier:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = (void *)[objc_alloc((Class)a1) initWithProperty:v13 value:v12 mediaProfile:v11 identifier:v10];

  return v14;
}

+ (id)writeRequestWithProperty:(id)a3 value:(id)a4 mediaProfile:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)[objc_alloc((Class)a1) initWithProperty:v10 value:v9 mediaProfile:v8 identifier:0];

  return v11;
}

+ (id)requestWithProperty:(id)a3 mediaProfile:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = HMFGetLogIdentifier();
    int v11 = 138543362;
    id v12 = v9;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Write request cannot be initialized using this interface - use -[writeRequestWithProperty:value:medaPofile:]", (uint8_t *)&v11, 0xCu);
  }

  return 0;
}

@end