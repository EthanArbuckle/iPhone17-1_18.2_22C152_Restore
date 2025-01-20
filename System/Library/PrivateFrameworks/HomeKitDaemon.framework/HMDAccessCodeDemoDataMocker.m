@interface HMDAccessCodeDemoDataMocker
+ (id)logCategory;
- (HMDAccessCodeDemoDataMocker)init;
- (NSMutableDictionary)accessCodes;
- (id)_controlResponseForReadRequest:(id)a3;
- (id)_controlResponseForWriteRequest:(id)a3;
- (id)_handleAddRequest:(id)a3;
- (id)_handleListRequest;
- (id)_handleReadRequest:(id)a3;
- (id)_handleRemoveRequest:(id)a3;
- (id)_handleUpdateRequest:(id)a3;
- (id)handleReadRequests:(id)a3;
- (id)handleWriteRequests:(id)a3;
@end

@implementation HMDAccessCodeDemoDataMocker

- (void).cxx_destruct
{
}

- (NSMutableDictionary)accessCodes
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (id)_handleRemoveRequest:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v23 = [MEMORY[0x263EFF980] array];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v21 = v4;
  id obj = [v4 accessCodeControlRequest];
  uint64_t v5 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = [*(id *)(*((void *)&v24 + 1) + 8 * i) identifier];
        v10 = [v9 value];

        v11 = [(HMDAccessCodeDemoDataMocker *)self accessCodes];
        v12 = [v11 objectForKeyedSubscript:v10];

        v13 = [(HMDAccessCodeDemoDataMocker *)self accessCodes];
        [v13 removeObjectForKey:v10];

        v14 = (void *)[objc_alloc(MEMORY[0x263F35AF0]) initWithValue:v10];
        v15 = (void *)[objc_alloc(MEMORY[0x263F35848]) initWithValue:0];
        v16 = (void *)[objc_alloc(MEMORY[0x263F35858]) initWithValue:0];
        v17 = (void *)[objc_alloc(MEMORY[0x263F35840]) initWithIdentifier:v14 accessCode:v12 flags:v15 statusCode:v16];
        [v23 addObject:v17];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v6);
  }

  v18 = (void *)[objc_alloc(MEMORY[0x263F35850]) initWithValue:5];
  v19 = (void *)[objc_alloc(MEMORY[0x263F35830]) initWithOperationType:v18 accessCodeControlRequest:0 accessCodeControlResponse:v23];

  return v19;
}

- (id)_handleUpdateRequest:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v23 = [MEMORY[0x263EFF980] array];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v21 = v4;
  id obj = [v4 accessCodeControlRequest];
  uint64_t v5 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v10 = [v9 identifier];
        v11 = [v10 value];

        v12 = [v9 accessCode];
        v13 = [(HMDAccessCodeDemoDataMocker *)self accessCodes];
        [v13 setObject:v12 forKeyedSubscript:v11];

        v14 = (void *)[objc_alloc(MEMORY[0x263F35AF0]) initWithValue:v11];
        v15 = (void *)[objc_alloc(MEMORY[0x263F35848]) initWithValue:0];
        v16 = (void *)[objc_alloc(MEMORY[0x263F35858]) initWithValue:0];
        v17 = (void *)[objc_alloc(MEMORY[0x263F35840]) initWithIdentifier:v14 accessCode:v12 flags:v15 statusCode:v16];
        [v23 addObject:v17];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v6);
  }

  v18 = (void *)[objc_alloc(MEMORY[0x263F35850]) initWithValue:4];
  v19 = (void *)[objc_alloc(MEMORY[0x263F35830]) initWithOperationType:v18 accessCodeControlRequest:0 accessCodeControlResponse:v23];

  return v19;
}

- (id)_handleAddRequest:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v25 = [MEMORY[0x263EFF980] array];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v23 = v4;
  id obj = [v4 accessCodeControlRequest];
  uint64_t v5 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = [*(id *)(*((void *)&v26 + 1) + 8 * i) accessCode];
        v10 = NSNumber;
        v11 = [(HMDAccessCodeDemoDataMocker *)self accessCodes];
        v12 = [v11 allKeys];
        v13 = [v12 valueForKeyPath:@"@max.self"];
        v14 = objc_msgSend(v10, "numberWithInteger:", objc_msgSend(v13, "integerValue") + 1);

        v15 = [(HMDAccessCodeDemoDataMocker *)self accessCodes];
        [v15 setObject:v9 forKeyedSubscript:v14];

        v16 = (void *)[objc_alloc(MEMORY[0x263F35AF0]) initWithValue:v14];
        v17 = (void *)[objc_alloc(MEMORY[0x263F35848]) initWithValue:0];
        v18 = (void *)[objc_alloc(MEMORY[0x263F35858]) initWithValue:0];
        v19 = (void *)[objc_alloc(MEMORY[0x263F35840]) initWithIdentifier:v16 accessCode:v9 flags:v17 statusCode:v18];
        [v25 addObject:v19];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v6);
  }

  v20 = (void *)[objc_alloc(MEMORY[0x263F35850]) initWithValue:3];
  v21 = (void *)[objc_alloc(MEMORY[0x263F35830]) initWithOperationType:v20 accessCodeControlRequest:0 accessCodeControlResponse:v25];

  return v21;
}

- (id)_handleReadRequest:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v22 = [MEMORY[0x263EFF980] array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v20 = v4;
  id obj = [v4 accessCodeControlRequest];
  uint64_t v5 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = [*(id *)(*((void *)&v23 + 1) + 8 * i) identifier];
        v10 = [v9 value];

        v11 = [(HMDAccessCodeDemoDataMocker *)self accessCodes];
        v12 = [v11 objectForKeyedSubscript:v10];

        v13 = (void *)[objc_alloc(MEMORY[0x263F35AF0]) initWithValue:v10];
        v14 = (void *)[objc_alloc(MEMORY[0x263F35848]) initWithValue:0];
        v15 = (void *)[objc_alloc(MEMORY[0x263F35858]) initWithValue:0];
        v16 = (void *)[objc_alloc(MEMORY[0x263F35840]) initWithIdentifier:v13 accessCode:v12 flags:v14 statusCode:v15];
        [v22 addObject:v16];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v6);
  }

  v17 = (void *)[objc_alloc(MEMORY[0x263F35850]) initWithValue:2];
  v18 = (void *)[objc_alloc(MEMORY[0x263F35830]) initWithOperationType:v17 accessCodeControlRequest:0 accessCodeControlResponse:v22];

  return v18;
}

- (id)_handleListRequest
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v21 = [MEMORY[0x263EFF980] array];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v3 = [(HMDAccessCodeDemoDataMocker *)self accessCodes];
  id v4 = [v3 allKeys];

  id obj = v4;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        v10 = (void *)[objc_alloc(MEMORY[0x263F35AF0]) initWithValue:v9];
        v11 = (void *)[objc_alloc(MEMORY[0x263F35848]) initWithValue:0];
        v12 = (void *)[objc_alloc(MEMORY[0x263F35858]) initWithValue:0];
        id v13 = objc_alloc(MEMORY[0x263F35840]);
        v14 = [(HMDAccessCodeDemoDataMocker *)self accessCodes];
        v15 = [v14 objectForKeyedSubscript:v9];
        v16 = (void *)[v13 initWithIdentifier:v10 accessCode:v15 flags:v11 statusCode:v12];

        [v21 addObject:v16];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v6);
  }

  v17 = (void *)[objc_alloc(MEMORY[0x263F35850]) initWithValue:1];
  v18 = (void *)[objc_alloc(MEMORY[0x263F35830]) initWithOperationType:v17 accessCodeControlRequest:0 accessCodeControlResponse:v21];

  return v18;
}

- (id)_controlResponseForWriteRequest:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x263F35830];
  uint64_t v6 = [v4 value];
  id v17 = 0;
  uint64_t v7 = [v5 parsedFromData:v6 error:&v17];
  id v8 = v17;

  if (v7)
  {
    uint64_t v9 = [v7 operationType];
    uint64_t v10 = [v9 value];

    switch(v10)
    {
      case 1:
        v11 = [(HMDAccessCodeDemoDataMocker *)self _handleListRequest];
        goto LABEL_11;
      case 2:
        v11 = [(HMDAccessCodeDemoDataMocker *)self _handleReadRequest:v7];
        goto LABEL_11;
      case 3:
        v11 = [(HMDAccessCodeDemoDataMocker *)self _handleAddRequest:v7];
        goto LABEL_11;
      case 4:
        v11 = [(HMDAccessCodeDemoDataMocker *)self _handleUpdateRequest:v7];
        goto LABEL_11;
      case 5:
        v11 = [(HMDAccessCodeDemoDataMocker *)self _handleRemoveRequest:v7];
LABEL_11:
        self = v11;
        break;
      default:
        break;
    }
  }
  else
  {
    v12 = (void *)MEMORY[0x230FBD990]();
    id v13 = self;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v19 = v15;
      __int16 v20 = 2112;
      uint64_t v21 = 0;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse HAPAccessCodeControl from NSData: %@", buf, 0x16u);
    }
    self = 0;
  }

  return self;
}

- (id)_controlResponseForReadRequest:(id)a3
{
  v3 = (void *)[objc_alloc(MEMORY[0x263F35820]) initWithValue:1];
  id v4 = (void *)[objc_alloc(MEMORY[0x263F35AF0]) initWithValue:&unk_26E473540];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263F35AF0]) initWithValue:&unk_26E473558];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263F35AF0]) initWithValue:&unk_26E473570];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F35828]) initWithCharacterSet:v3 minimumValueLength:v4 maximumValueLength:v5 maximumAccessCodes:v6];

  return v7;
}

- (id)handleReadRequests:(id)a3
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v31 = [MEMORY[0x263EFF9A0] dictionary];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v4 = v3;
  uint64_t v30 = [v4 countByEnumeratingWithState:&v38 objects:v52 count:16];
  if (v30)
  {
    id obj = v4;
    uint64_t v29 = *(void *)v39;
    while (2)
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v39 != v29) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        uint64_t v7 = -[HMDAccessCodeDemoDataMocker _controlResponseForReadRequest:](self, "_controlResponseForReadRequest:", v6, obj);
        id v37 = 0;
        id v8 = [v7 serializeWithError:&v37];
        id v9 = v37;
        if (!v8)
        {
          long long v23 = (void *)MEMORY[0x230FBD990]();
          long long v24 = self;
          long long v25 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            long long v26 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v49 = v26;
            __int16 v50 = 2112;
            v51 = v7;
            _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize access code control response: %@", buf, 0x16u);
          }

          id v4 = obj;
          id v22 = 0;
          uint64_t v21 = v31;
          goto LABEL_13;
        }
        uint64_t v10 = [v6 characteristic];
        v36 = [v10 service];

        v35 = [v36 instanceID];
        v11 = [v36 accessory];
        v12 = [v11 uuid];

        id v13 = [v6 characteristic];
        v14 = [v13 instanceID];

        v15 = [v35 stringValue];
        v46 = v15;
        v16 = [v14 stringValue];
        v43 = v8;
        v44 = v16;
        v42 = @"kCharacteristicValue";
        id v17 = [NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];
        v45 = v17;
        [NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];
        v18 = v34 = v9;
        v47 = v18;
        [NSDictionary dictionaryWithObjects:&v47 forKeys:&v46 count:1];
        v19 = v33 = v7;
        __int16 v20 = [v12 UUIDString];
        [v31 setObject:v19 forKeyedSubscript:v20];
      }
      id v4 = obj;
      uint64_t v30 = [obj countByEnumeratingWithState:&v38 objects:v52 count:16];
      if (v30) {
        continue;
      }
      break;
    }
  }

  uint64_t v21 = v31;
  id v22 = v31;
LABEL_13:

  return v22;
}

- (id)handleWriteRequests:(id)a3
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF9A0] dictionary];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v5 = v3;
  uint64_t v31 = [v5 countByEnumeratingWithState:&v39 objects:v53 count:16];
  if (v31)
  {
    id obj = v5;
    uint64_t v30 = *(void *)v40;
    v32 = v4;
    while (2)
    {
      for (uint64_t i = 0; i != v31; ++i)
      {
        if (*(void *)v40 != v30) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        id v8 = -[HMDAccessCodeDemoDataMocker _controlResponseForWriteRequest:](self, "_controlResponseForWriteRequest:", v7, obj);
        if (!v8) {
          goto LABEL_14;
        }
        id v9 = v8;
        id v38 = 0;
        uint64_t v10 = [v8 serializeWithError:&v38];
        id v11 = v38;
        if (!v10)
        {
          long long v24 = (void *)MEMORY[0x230FBD990]();
          long long v25 = self;
          long long v26 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            uint64_t v27 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            __int16 v50 = v27;
            __int16 v51 = 2112;
            v52 = v9;
            _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize access code control response: %@", buf, 0x16u);
          }

LABEL_14:
          id v5 = obj;

          id v23 = 0;
          id v4 = v32;
          goto LABEL_15;
        }
        v12 = [v7 characteristic];
        id v37 = [v12 service];

        v36 = [v37 instanceID];
        id v13 = [v37 accessory];
        v14 = [v13 uuid];

        v15 = [v7 characteristic];
        v16 = [v15 instanceID];

        id v17 = [v36 stringValue];
        v47 = v17;
        v18 = [v16 stringValue];
        v44 = v10;
        v45 = v18;
        v43 = @"kCharacteristicValue";
        v19 = [NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
        v46 = v19;
        [NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
        __int16 v20 = v35 = v11;
        v48 = v20;
        uint64_t v21 = [NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];
        [v14 UUIDString];
        id v22 = v34 = v9;
        [v32 setObject:v21 forKeyedSubscript:v22];
      }
      id v5 = obj;
      id v4 = v32;
      uint64_t v31 = [obj countByEnumeratingWithState:&v39 objects:v53 count:16];
      if (v31) {
        continue;
      }
      break;
    }
  }

  id v23 = v4;
LABEL_15:

  return v23;
}

- (HMDAccessCodeDemoDataMocker)init
{
  v10[3] = *MEMORY[0x263EF8340];
  v8.receiver = self;
  v8.super_class = (Class)HMDAccessCodeDemoDataMocker;
  v2 = [(HMDAccessCodeDemoDataMocker *)&v8 init];
  if (v2)
  {
    id v3 = (void *)MEMORY[0x263EFF9A0];
    v9[0] = &unk_26E4734F8;
    v9[1] = &unk_26E473510;
    v10[0] = @"1234";
    v10[1] = @"56789";
    v9[2] = &unk_26E473528;
    v10[2] = @"2468";
    id v4 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:3];
    uint64_t v5 = [v3 dictionaryWithDictionary:v4];
    accessCodes = v2->_accessCodes;
    v2->_accessCodes = (NSMutableDictionary *)v5;
  }
  return v2;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3_226540 != -1) {
    dispatch_once(&logCategory__hmf_once_t3_226540, &__block_literal_global_226541);
  }
  v2 = (void *)logCategory__hmf_once_v4_226542;
  return v2;
}

void __42__HMDAccessCodeDemoDataMocker_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v4_226542;
  logCategory__hmf_once_v4_226542 = v0;
}

@end