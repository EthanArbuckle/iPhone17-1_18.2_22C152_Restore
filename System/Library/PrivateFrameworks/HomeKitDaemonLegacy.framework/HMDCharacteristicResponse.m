@interface HMDCharacteristicResponse
+ (HMDCharacteristicResponse)responseWithRequest:(id)a3 characteristicUpdateDictionary:(id)a4;
+ (HMDCharacteristicResponse)responseWithRequest:(id)a3 error:(id)a4;
+ (id)responsesWithRequests:(id)a3 characteristicUpdateDictionary:(id)a4;
+ (id)responsesWithRequests:(id)a3 error:(id)a4;
- (HMDCharacteristicRequest)request;
- (HMDCharacteristicResponse)initWithRequest:(id)a3 error:(id)a4;
- (NSData)notificationContext;
- (NSDate)valueUpdatedTime;
- (NSError)error;
- (NSNumber)stateNumber;
- (id)attributeDescriptions;
- (id)characteristicUpdateDictionary;
- (id)value;
- (void)setValue:(id)a3;
- (void)setValue:(id)a3 updatedTime:(id)a4 stateNumber:(id)a5 notificationContext:(id)a6;
@end

@implementation HMDCharacteristicResponse

- (void)setValue:(id)a3 updatedTime:(id)a4 stateNumber:(id)a5 notificationContext:(id)a6
{
  id v17 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [(HMDCharacteristicResponse *)self error];

  if (!v14)
  {
    objc_storeStrong(&self->_value, a3);
    if (v11)
    {
      v15 = (NSDate *)v11;
    }
    else
    {
      v15 = [MEMORY[0x1E4F1C9C8] date];
    }
    valueUpdatedTime = self->_valueUpdatedTime;
    self->_valueUpdatedTime = v15;

    if (v12) {
      objc_storeStrong((id *)&self->_stateNumber, a5);
    }
    objc_storeStrong((id *)&self->_notificationContext, a6);
  }
}

+ (HMDCharacteristicResponse)responseWithRequest:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithRequest:v7 error:v6];

  return (HMDCharacteristicResponse *)v8;
}

- (HMDCharacteristicResponse)initWithRequest:(id)a3 error:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HMDCharacteristicResponse;
  v9 = [(HMDCharacteristicResponse *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_request, a3);
    objc_storeStrong((id *)&v10->_error, a4);
    id v11 = [v7 characteristic];
    uint64_t v12 = [v11 value];
    id value = v10->_value;
    v10->_id value = (id)v12;
  }
  return v10;
}

- (HMDCharacteristicRequest)request
{
  return self->_request;
}

- (id)value
{
  return self->_value;
}

- (NSDate)valueUpdatedTime
{
  return self->_valueUpdatedTime;
}

- (NSNumber)stateNumber
{
  return self->_stateNumber;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationContext, 0);
  objc_storeStrong((id *)&self->_valueUpdatedTime, 0);
  objc_storeStrong((id *)&self->_stateNumber, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

- (NSData)notificationContext
{
  return self->_notificationContext;
}

- (void)setValue:(id)a3
{
}

- (id)attributeDescriptions
{
  v48[8] = *MEMORY[0x1E4F143B8];
  v3 = [(HMDCharacteristicResponse *)self request];
  v4 = [v3 characteristic];

  v5 = [v4 accessory];
  id v6 = [v4 service];
  id v7 = objc_alloc(MEMORY[0x1E4F653F8]);
  id v8 = NSString;
  v47 = v5;
  v46 = [v5 name];
  v45 = [v5 uniqueIdentifier];
  v44 = [v8 stringWithFormat:@"(%@/%@)", v46, v45];
  v43 = (void *)[v7 initWithName:@"Accessory" value:v44];
  v48[0] = v43;
  id v9 = objc_alloc(MEMORY[0x1E4F653F8]);
  v10 = NSString;
  v42 = v6;
  v41 = [v6 type];
  v40 = shortHAPTypeDescription(v41);
  v38 = [v6 instanceID];
  v37 = [v10 stringWithFormat:@"(%@/%@)", v40, v38];
  v36 = (void *)[v9 initWithName:@"Service" value:v37];
  v48[1] = v36;
  id v11 = objc_alloc(MEMORY[0x1E4F653F8]);
  uint64_t v12 = NSString;
  v39 = v4;
  v35 = [v4 type];
  v34 = shortHAPTypeDescription(v35);
  v33 = [v4 instanceID];
  v32 = [v12 stringWithFormat:@"(%@/%@)", v34, v33];
  v31 = (void *)[v11 initWithName:@"Characteristic" value:v32];
  v48[2] = v31;
  id v13 = objc_alloc(MEMORY[0x1E4F653F8]);
  v30 = [(HMDCharacteristicResponse *)self request];
  v29 = [v30 previousValue];
  v14 = (void *)[v13 initWithName:@"Previous Value" value:v29];
  v48[3] = v14;
  id v15 = objc_alloc(MEMORY[0x1E4F653F8]);
  v16 = [(HMDCharacteristicResponse *)self value];
  id v17 = (void *)[v15 initWithName:@"Value" value:v16];
  v48[4] = v17;
  id v18 = objc_alloc(MEMORY[0x1E4F653F8]);
  v19 = [(HMDCharacteristicResponse *)self value];
  v20 = (void *)[v18 initWithName:@"Type" value:objc_opt_class()];
  v48[5] = v20;
  id v21 = objc_alloc(MEMORY[0x1E4F653F8]);
  v22 = [(HMDCharacteristicResponse *)self notificationContext];
  v23 = (void *)[v21 initWithName:@"Notification Context" value:v22];
  v48[6] = v23;
  id v24 = objc_alloc(MEMORY[0x1E4F653F8]);
  v25 = [(HMDCharacteristicResponse *)self error];
  v26 = (void *)[v24 initWithName:@"Error" value:v25];
  v48[7] = v26;
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:8];

  return v27;
}

- (id)characteristicUpdateDictionary
{
  v29[3] = *MEMORY[0x1E4F143B8];
  v3 = [(HMDCharacteristicResponse *)self request];
  v4 = [v3 characteristic];

  v5 = [v4 service];
  id v6 = [v5 accessory];
  id v7 = v6;
  id v8 = (void *)MEMORY[0x1E4F1CC08];
  if (v5 && v6)
  {
    v28[0] = @"kAccessoryUUID";
    id v9 = [v6 uuid];
    v10 = [v9 UUIDString];
    v29[0] = v10;
    v28[1] = @"kServiceInstanceID";
    id v11 = [v5 instanceID];
    v29[1] = v11;
    v28[2] = @"kCharacteristicInstanceID";
    uint64_t v12 = [v4 instanceID];
    v29[2] = v12;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:3];
    v14 = (void *)[v13 mutableCopy];

    id v15 = [(HMDCharacteristicResponse *)self error];

    if (v15)
    {
      v16 = (void *)MEMORY[0x1E4F28DB0];
      id v17 = [(HMDCharacteristicResponse *)self error];
      id v18 = [v16 archivedDataWithRootObject:v17 requiringSecureCoding:1 error:0];

      v19 = @"kCharacteristicErrorDataKey";
    }
    else
    {
      v20 = [(HMDCharacteristicResponse *)self value];
      [v14 setObject:v20 forKeyedSubscript:@"kCharacteristicValue"];

      id v21 = [(HMDCharacteristicResponse *)self valueUpdatedTime];
      if (v21)
      {
        [v14 setObject:v21 forKeyedSubscript:@"kCharacteristicValueUpdateTime"];
      }
      else
      {
        v22 = [v4 lastKnownValueUpdateTime];
        [v14 setObject:v22 forKeyedSubscript:@"kCharacteristicValueUpdateTime"];
      }
      v23 = [(HMDCharacteristicResponse *)self stateNumber];
      if (v23)
      {
        [v14 setObject:v23 forKeyedSubscript:@"kCharacteristicValueUpdateStateNumberKey"];
      }
      else
      {
        id v24 = [v4 stateNumber];
        [v14 setObject:v24 forKeyedSubscript:@"kCharacteristicValueUpdateStateNumberKey"];
      }
      uint64_t v25 = [(HMDCharacteristicResponse *)self notificationContext];
      if (!v25)
      {
        v27 = [v4 notificationContext];
        [v14 setObject:v27 forKeyedSubscript:@"kCharacteristicNotificationContextKey"];

        id v18 = 0;
        goto LABEL_14;
      }
      id v18 = (void *)v25;
      v19 = @"kCharacteristicNotificationContextKey";
    }
    [v14 setObject:v18 forKeyedSubscript:v19];
LABEL_14:

    id v8 = (void *)[v14 copy];
  }

  return v8;
}

+ (id)responsesWithRequests:(id)a3 characteristicUpdateDictionary:(id)a4
{
  v91[1] = *MEMORY[0x1E4F143B8];
  id v53 = a3;
  id v6 = a4;
  objc_msgSend(v6, "hmf_dictionaryForKey:", @"kModifiedCharacteristicsForAccessoryKey");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(v6, "hmf_dictionaryForKey:", @"kCharacteristicNotificationsKey");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      if ([v53 count] == 1)
      {
        objc_msgSend(v6, "hmf_stringForKey:", @"kAccessoryUUID");
        id v7 = (id)objc_claimAutoreleasedReturnValue();
        id v8 = objc_msgSend(v6, "hmf_numberForKey:", @"kCharacteristicInstanceID");
        id v9 = HAPInstanceIDFromValue();

        if (v7 && v9)
        {
          v66 = v9;
          v10 = [v53 firstObject];
          id v11 = [v10 characteristic];
          uint64_t v12 = [v11 accessory];
          id v13 = [v12 uuid];
          v14 = [v13 UUIDString];
          if ([v14 isEqualToString:v7])
          {
            id v15 = [v10 characteristic];
            [v15 instanceID];
            id v17 = v16 = a1;
            char v64 = [v17 isEqualToNumber:v66];

            a1 = v16;
            if (v64)
            {
              id v18 = +[HMDCharacteristicResponse responseWithRequest:v10 characteristicUpdateDictionary:v6];
              v91[0] = v18;
              v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v91 count:1];

              v20 = v66;
              goto LABEL_51;
            }
          }
          else
          {
          }
          id v9 = v66;
        }
      }
      id v7 = v6;
    }
  }
  id v49 = v6;
  v20 = [MEMORY[0x1E4F1CA48] array];
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  id obj = [v7 allKeys];
  uint64_t v54 = [obj countByEnumeratingWithState:&v78 objects:v90 count:16];
  if (v54)
  {
    uint64_t v51 = *(void *)v79;
    id v52 = v7;
    id v61 = a1;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v79 != v51) {
          objc_enumerationMutation(obj);
        }
        uint64_t v55 = v21;
        uint64_t v22 = *(void *)(*((void *)&v78 + 1) + 8 * v21);
        v23 = [v7 objectForKeyedSubscript:v22];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v24 = v23;
        }
        else {
          id v24 = 0;
        }
        id v25 = v24;

        v26 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
        v76[0] = MEMORY[0x1E4F143A8];
        v76[1] = 3221225472;
        v76[2] = __82__HMDCharacteristicResponse_responsesWithRequests_characteristicUpdateDictionary___block_invoke;
        v76[3] = &unk_1E6A195C0;
        v76[4] = v22;
        id v27 = v26;
        id v77 = v27;
        objc_msgSend(v53, "na_each:", v76);
        long long v74 = 0u;
        long long v75 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        v58 = v25;
        id v56 = [v25 allKeys];
        uint64_t v59 = [v56 countByEnumeratingWithState:&v72 objects:v89 count:16];
        if (v59)
        {
          uint64_t v57 = *(void *)v73;
          id v62 = v27;
          do
          {
            uint64_t v28 = 0;
            do
            {
              if (*(void *)v73 != v57) {
                objc_enumerationMutation(v56);
              }
              uint64_t v60 = v28;
              v29 = [v58 objectForKeyedSubscript:*(void *)(*((void *)&v72 + 1) + 8 * v28)];
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                v30 = v29;
              }
              else {
                v30 = 0;
              }
              id v31 = v30;

              long long v70 = 0u;
              long long v71 = 0u;
              long long v68 = 0u;
              long long v69 = 0u;
              v65 = v31;
              id v63 = [v31 allKeys];
              uint64_t v32 = [v63 countByEnumeratingWithState:&v68 objects:v88 count:16];
              if (v32)
              {
                uint64_t v33 = v32;
                uint64_t v67 = *(void *)v69;
                do
                {
                  for (uint64_t i = 0; i != v33; ++i)
                  {
                    if (*(void *)v69 != v67) {
                      objc_enumerationMutation(v63);
                    }
                    uint64_t v35 = *(void *)(*((void *)&v68 + 1) + 8 * i);
                    v36 = HAPInstanceIDFromValue();
                    v37 = [v27 objectForKey:v36];

                    if (v37)
                    {
                      v38 = [v65 objectForKeyedSubscript:v35];
                      objc_opt_class();
                      if (objc_opt_isKindOfClass()) {
                        v39 = v38;
                      }
                      else {
                        v39 = 0;
                      }
                      id v40 = v39;

                      if (v40)
                      {
                        v41 = +[HMDCharacteristicResponse responseWithRequest:v37 characteristicUpdateDictionary:v40];
                        [v20 addObject:v41];
                      }
                      else
                      {
                        v42 = v20;
                        v43 = (void *)MEMORY[0x1D9452090]();
                        id v44 = a1;
                        v45 = HMFGetOSLogHandle();
                        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
                        {
                          v46 = HMFGetLogIdentifier();
                          v47 = [v65 objectForKeyedSubscript:v35];
                          *(_DWORD *)buf = 138543874;
                          v83 = v46;
                          __int16 v84 = 2112;
                          v85 = v37;
                          __int16 v86 = 2112;
                          v87 = v47;
                          _os_log_impl(&dword_1D49D5000, v45, OS_LOG_TYPE_ERROR, "%{public}@Invalid characteristic update for request: %@. Update Dict: %@", buf, 0x20u);

                          a1 = v61;
                        }

                        v20 = v42;
                        id v27 = v62;
                      }
                    }
                  }
                  uint64_t v33 = [v63 countByEnumeratingWithState:&v68 objects:v88 count:16];
                }
                while (v33);
              }

              uint64_t v28 = v60 + 1;
            }
            while (v60 + 1 != v59);
            uint64_t v59 = [v56 countByEnumeratingWithState:&v72 objects:v89 count:16];
          }
          while (v59);
        }

        uint64_t v21 = v55 + 1;
        id v7 = v52;
      }
      while (v55 + 1 != v54);
      uint64_t v54 = [obj countByEnumeratingWithState:&v78 objects:v90 count:16];
    }
    while (v54);
  }

  v19 = (void *)[v20 copy];
  id v6 = v49;
LABEL_51:

  return v19;
}

void __82__HMDCharacteristicResponse_responsesWithRequests_characteristicUpdateDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  v3 = [v11 characteristic];
  v4 = [v3 accessory];
  v5 = [v4 uuid];
  id v6 = [v5 UUIDString];
  int v7 = [v6 isEqualToString:*(void *)(a1 + 32)];

  if (v7)
  {
    id v8 = *(void **)(a1 + 40);
    id v9 = [v11 characteristic];
    v10 = [v9 instanceID];
    [v8 setObject:v11 forKey:v10];
  }
}

+ (HMDCharacteristicResponse)responseWithRequest:(id)a3 characteristicUpdateDictionary:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  int v7 = [v5 errorFromDataForKey:@"kCharacteristicErrorDataKey"];
  id v8 = [(id)objc_opt_class() responseWithRequest:v6 error:v7];

  if (!v7)
  {
    id v9 = [v5 objectForKeyedSubscript:@"kCharacteristicValue"];
    v10 = objc_msgSend(v5, "hmf_numberForKey:", @"kCharacteristicValueUpdateStateNumberKey");
    id v11 = objc_msgSend(v5, "hmf_dateForKey:", @"kCharacteristicValueUpdateTime");
    uint64_t v12 = objc_msgSend(v5, "hmf_dataForKey:", @"kCharacteristicNotificationContextKey");
    [v8 setValue:v9 updatedTime:v11 stateNumber:v10 notificationContext:v12];
  }
  return (HMDCharacteristicResponse *)v8;
}

+ (id)responsesWithRequests:(id)a3 error:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  int v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = +[HMDCharacteristicResponse responseWithRequest:error:](HMDCharacteristicResponse, "responseWithRequest:error:", *(void *)(*((void *)&v15 + 1) + 8 * i), v6, (void)v15);
        [v7 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v7;
}

@end