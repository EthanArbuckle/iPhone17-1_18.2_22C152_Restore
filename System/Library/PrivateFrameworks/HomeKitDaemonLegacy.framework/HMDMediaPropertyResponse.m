@interface HMDMediaPropertyResponse
+ (id)groupedProfileResponses:(id)a3;
+ (id)propertyResponsesFromRequests:(id)a3 error:(id)a4;
+ (id)responseWithRequest:(id)a3 error:(id)a4;
+ (id)responseWithRequest:(id)a3 value:(id)a4 updatedTime:(id)a5;
+ (id)responsesFromSerializedResponse:(id)a3 requests:(id)a4 home:(id)a5;
+ (id)serializeResponses:(id)a3;
- (HMDMediaPropertyRequest)request;
- (HMDMediaPropertyResponse)initWithRequest:(id)a3 error:(id)a4;
- (HMDMediaPropertyResponse)initWithRequest:(id)a3 value:(id)a4 updatedTime:(id)a5;
- (NSDate)valueUpdatedTime;
- (NSError)error;
- (id)description;
- (id)value;
- (void)setValue:(id)a3;
@end

@implementation HMDMediaPropertyResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueUpdatedTime, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

- (NSDate)valueUpdatedTime
{
  return self->_valueUpdatedTime;
}

- (NSError)error
{
  return self->_error;
}

- (void)setValue:(id)a3
{
}

- (id)value
{
  return self->_value;
}

- (HMDMediaPropertyRequest)request
{
  return self->_request;
}

- (id)description
{
  v3 = NSString;
  v4 = [(HMDMediaPropertyResponse *)self request];
  v5 = [(HMDMediaPropertyResponse *)self value];
  v6 = [(HMDMediaPropertyResponse *)self error];
  v7 = [v3 stringWithFormat:@"<MPRes: %@ (val: %@, err: %@)>", v4, v5, v6];

  return v7;
}

- (HMDMediaPropertyResponse)initWithRequest:(id)a3 value:(id)a4 updatedTime:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HMDMediaPropertyResponse;
  v10 = [(HMDMediaPropertyResponse *)&v16 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_request, a3);
    objc_storeStrong(&v11->_value, a4);
    valueUpdatedTime = v11->_valueUpdatedTime;
    if (valueUpdatedTime)
    {
      v13 = valueUpdatedTime;
    }
    else
    {
      v13 = [MEMORY[0x1E4F1C9C8] date];
    }
    v14 = v11->_valueUpdatedTime;
    v11->_valueUpdatedTime = v13;
  }
  return v11;
}

- (HMDMediaPropertyResponse)initWithRequest:(id)a3 error:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDMediaPropertyResponse;
  id v9 = [(HMDMediaPropertyResponse *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_request, a3);
    objc_storeStrong((id *)&v10->_error, a4);
  }

  return v10;
}

+ (id)responseWithRequest:(id)a3 value:(id)a4 updatedTime:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[objc_alloc((Class)a1) initWithRequest:v10 value:v9 updatedTime:v8];

  return v11;
}

+ (id)responseWithRequest:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithRequest:v7 error:v6];

  return v8;
}

+ (id)responsesFromSerializedResponse:(id)a3 requests:(id)a4 home:(id)a5
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v44 = a4;
  id v38 = a5;
  v43 = [MEMORY[0x1E4F1CA48] array];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  v36 = v7;
  id obj = [v7 allKeys];
  uint64_t v39 = [obj countByEnumeratingWithState:&v58 objects:v68 count:16];
  if (v39)
  {
    uint64_t v37 = *(void *)v59;
    *(void *)&long long v8 = 138543618;
    long long v34 = v8;
    do
    {
      for (uint64_t i = 0; i != v39; ++i)
      {
        if (*(void *)v59 != v37) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v58 + 1) + 8 * i);
        v49 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v10];
        v42 = objc_msgSend(v38, "mediaProfileWithUUID:");
        if (v42)
        {
          uint64_t v40 = i;
          v11 = [v36 objectForKeyedSubscript:v10];
          long long v54 = 0u;
          long long v55 = 0u;
          long long v56 = 0u;
          long long v57 = 0u;
          id v41 = [v11 allKeys];
          uint64_t v47 = [v41 countByEnumeratingWithState:&v54 objects:v63 count:16];
          if (v47)
          {
            uint64_t v45 = *(void *)v55;
            v46 = v11;
            do
            {
              uint64_t v12 = 0;
              do
              {
                if (*(void *)v55 != v45) {
                  objc_enumerationMutation(v41);
                }
                uint64_t v48 = v12;
                v13 = *(void **)(*((void *)&v54 + 1) + 8 * v12);
                long long v50 = 0u;
                long long v51 = 0u;
                long long v52 = 0u;
                long long v53 = 0u;
                id v14 = v44;
                uint64_t v15 = [v14 countByEnumeratingWithState:&v50 objects:v62 count:16];
                if (v15)
                {
                  uint64_t v16 = v15;
                  uint64_t v17 = *(void *)v51;
LABEL_14:
                  uint64_t v18 = 0;
                  while (1)
                  {
                    if (*(void *)v51 != v17) {
                      objc_enumerationMutation(v14);
                    }
                    v19 = *(void **)(*((void *)&v50 + 1) + 8 * v18);
                    v20 = objc_msgSend(v19, "mediaProfile", v34);
                    v21 = [v20 uniqueIdentifier];
                    if ([v21 isEqual:v49])
                    {
                      v22 = [v19 property];
                      char v23 = [v13 isEqual:v22];

                      if (v23)
                      {
                        id v24 = v19;

                        if (v24) {
                          goto LABEL_26;
                        }
                        goto LABEL_25;
                      }
                    }
                    else
                    {
                    }
                    if (v16 == ++v18)
                    {
                      uint64_t v16 = [v14 countByEnumeratingWithState:&v50 objects:v62 count:16];
                      if (v16) {
                        goto LABEL_14;
                      }
                      break;
                    }
                  }
                }

LABEL_25:
                +[HMDMediaPropertyRequest requestWithProperty:mediaProfile:](HMDMediaPropertyRequest, "requestWithProperty:mediaProfile:", v13, v42, v34);
                id v24 = (id)objc_claimAutoreleasedReturnValue();
LABEL_26:
                v11 = v46;
                v25 = [v46 errorFromDataForKey:v13];
                if (v25)
                {
                  v26 = +[HMDMediaPropertyResponse responseWithRequest:v24 error:v25];
                }
                else
                {
                  v27 = [v46 objectForKeyedSubscript:v13];
                  v28 = [MEMORY[0x1E4F1C9C8] date];
                  v26 = +[HMDMediaPropertyResponse responseWithRequest:v24 value:v27 updatedTime:v28];
                }
                [v43 addObject:v26];

                uint64_t v12 = v48 + 1;
              }
              while (v48 + 1 != v47);
              uint64_t v47 = [v41 countByEnumeratingWithState:&v54 objects:v63 count:16];
            }
            while (v47);
          }

          uint64_t i = v40;
        }
        else
        {
          v29 = (void *)MEMORY[0x1D9452090]();
          v30 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            v31 = HMFGetLogIdentifier();
            *(_DWORD *)buf = v34;
            v65 = v31;
            __int16 v66 = 2112;
            uint64_t v67 = v10;
            _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_INFO, "%{public}@deserializeMediaResponse: Cannot find mediaProfile with identifier %@", buf, 0x16u);
          }
        }
      }
      uint64_t v39 = [obj countByEnumeratingWithState:&v58 objects:v68 count:16];
    }
    while (v39);
  }

  v32 = +[HMDMediaPropertyResponse groupedProfileResponses:v43];

  return v32;
}

+ (id)serializeResponses:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v33 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v36 = v3;
  +[HMDMediaPropertyResponse groupedProfileResponses:v3];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v37 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v37)
  {
    uint64_t v35 = *(void *)v44;
    uint64_t v32 = *MEMORY[0x1E4F2D990];
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v44 != v35) {
          objc_enumerationMutation(obj);
        }
        uint64_t v38 = v4;
        v5 = *(void **)(*((void *)&v43 + 1) + 8 * v4);
        id v6 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v36, "count"));
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        id v7 = v5;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v39 objects:v47 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = 0;
          uint64_t v11 = *(void *)v40;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v40 != v11) {
                objc_enumerationMutation(v7);
              }
              v13 = *(void **)(*((void *)&v39 + 1) + 8 * i);
              id v14 = [v13 request];
              uint64_t v15 = v14;
              if (!v10)
              {
                uint64_t v10 = [v14 mediaProfile];
              }
              uint64_t v16 = [v13 error];

              if (v16)
              {
                uint64_t v17 = (void *)MEMORY[0x1E4F28DB0];
                uint64_t v18 = [v13 error];
                v19 = [v17 archivedDataWithRootObject:v18 requiringSecureCoding:1 error:0];
              }
              else
              {
                v19 = [v13 value];
              }
              v20 = [v15 property];
              [v6 setObject:v19 forKeyedSubscript:v20];
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v39 objects:v47 count:16];
          }
          while (v9);
        }
        else
        {
          uint64_t v10 = 0;
        }

        if ([v6 count]) {
          BOOL v21 = v10 == 0;
        }
        else {
          BOOL v21 = 1;
        }
        if (!v21)
        {
          v22 = [v10 uniqueIdentifier];
          char v23 = [v22 UUIDString];

          if (v23)
          {
            id v24 = [v10 mediaSession];
            uint64_t v25 = [v24 sessionIdentifier];
            v26 = (void *)v25;
            if (v25) {
              v27 = (void *)v25;
            }
            else {
              v27 = v23;
            }
            id v28 = v27;

            [v6 setObject:v28 forKeyedSubscript:v32];
            v29 = (void *)[v6 copy];
            [v33 setObject:v29 forKeyedSubscript:v23];
          }
        }

        uint64_t v4 = v38 + 1;
      }
      while (v38 + 1 != v37);
      uint64_t v37 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
    }
    while (v37);
  }
  v30 = (void *)[v33 copy];

  return v30;
}

+ (id)groupedProfileResponses:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v19 = [MEMORY[0x1E4F1CA48] array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = 0;
    id v7 = 0;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "request", v19);
        uint64_t v12 = [v11 mediaProfile];
        v13 = [v12 uniqueIdentifier];
        char v14 = [v13 isEqual:v7];

        if ((v14 & 1) == 0)
        {
          uint64_t v15 = [MEMORY[0x1E4F1CA48] array];

          [v19 addObject:v15];
          uint64_t v16 = [v12 uniqueIdentifier];

          id v6 = (void *)v15;
          id v7 = (void *)v16;
        }
        [v6 addObject:v10];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v5);
  }
  else
  {
    id v6 = 0;
    id v7 = 0;
  }

  uint64_t v17 = (void *)[v19 copy];
  return v17;
}

+ (id)propertyResponsesFromRequests:(id)a3 error:(id)a4
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
        v13 = +[HMDMediaPropertyResponse responseWithRequest:error:](HMDMediaPropertyResponse, "responseWithRequest:error:", *(void *)(*((void *)&v16 + 1) + 8 * i), v6, (void)v16);
        [v7 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  char v14 = (void *)[v7 copy];
  return v14;
}

@end