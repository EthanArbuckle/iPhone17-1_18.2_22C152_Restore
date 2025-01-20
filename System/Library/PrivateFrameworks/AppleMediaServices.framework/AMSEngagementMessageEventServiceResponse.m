@interface AMSEngagementMessageEventServiceResponse
- (AMSEngagementMessageEventServiceResponse)initWithJSObject:(id)a3;
- (AMSEngagementMessageRequest)fullScreenMessageRequest;
- (AMSEngagementRequest)engagementRequest;
- (NSDictionary)dictionaryRepresentation;
- (NSDictionary)placements;
- (NSDictionary)placementsMap;
- (NSString)serviceType;
- (id)_placementRequestsWithDictionary:(id)a3;
- (id)_placementsMapWithPayload:(id)a3;
- (void)_preprocessMessageRequest:(id)a3 placement:(id)a4;
- (void)setDictionaryRepresentation:(id)a3;
- (void)setEngagementRequest:(id)a3;
- (void)setFullScreenMessageRequest:(id)a3;
- (void)setPlacementsMap:(id)a3;
- (void)setServiceType:(id)a3;
@end

@implementation AMSEngagementMessageEventServiceResponse

- (AMSEngagementMessageEventServiceResponse)initWithJSObject:(id)a3
{
  id v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)AMSEngagementMessageEventServiceResponse;
  v6 = [(AMSEngagementMessageEventServiceResponse *)&v24 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dictionaryRepresentation, a3);
    v8 = [v5 objectForKeyedSubscript:@"serviceType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }

    v10 = [v5 objectForKeyedSubscript:@"dialogRequest"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v11 = v10;
    }
    else {
      id v11 = 0;
    }

    v12 = [v5 objectForKeyedSubscript:@"engagementRequest"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v13 = v12;
    }
    else {
      id v13 = 0;
    }

    v14 = [v5 objectForKeyedSubscript:@"placements"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v15 = v14;
    }
    else {
      id v15 = 0;
    }

    if (!v9) {
      goto LABEL_22;
    }
    objc_storeStrong((id *)&v7->_serviceType, v9);
    if (v11)
    {
      v16 = [[AMSEngagementMessageRequest alloc] initWithJSObject:v11];
      fullScreenMessageRequest = v7->_fullScreenMessageRequest;
      v7->_fullScreenMessageRequest = v16;
    }
    v18 = [[AMSEngagementRequest alloc] initWithJSONDictionary:v13];
    engagementRequest = v7->_engagementRequest;
    v7->_engagementRequest = v18;

    uint64_t v20 = [(AMSEngagementMessageEventServiceResponse *)v7 _placementsMapWithPayload:v15];
    placementsMap = v7->_placementsMap;
    v7->_placementsMap = (NSDictionary *)v20;

    if (!v7->_placementsMap && !v7->_engagementRequest && !v7->_fullScreenMessageRequest)
    {
LABEL_22:

      v22 = 0;
      goto LABEL_23;
    }
  }
  v22 = v7;
LABEL_23:

  return v22;
}

- (id)_placementsMapWithPayload:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v22 = v4;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v27;
      v23 = v25;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v27 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          v12 = objc_msgSend(v6, "objectForKeyedSubscript:", v11, v22, v23);
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          v14 = [v6 objectForKeyedSubscript:v11];
          id v15 = v14;
          if (isKindOfClass)
          {
            v24[0] = MEMORY[0x1E4F143A8];
            v24[1] = 3221225472;
            v25[0] = __70__AMSEngagementMessageEventServiceResponse__placementsMapWithPayload___block_invoke;
            v25[1] = &unk_1E55A2738;
            v25[2] = self;
            v25[3] = v11;
            v16 = objc_msgSend(v14, "ams_mapWithTransformIgnoresNil:", v24);
            [v5 setObject:v16 forKeyedSubscript:v11];

            id v17 = v15;
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              id v17 = v15;
            }
            else {
              id v17 = 0;
            }

            v18 = [[AMSEngagementMessageRequest alloc] initWithJSObject:v17];
            if (v18)
            {
              [(AMSEngagementMessageEventServiceResponse *)self _preprocessMessageRequest:v18 placement:v11];
              v30 = v18;
              v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
              [v5 setObject:v19 forKeyedSubscript:v11];
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v8);
    }

    if ([v5 count]) {
      uint64_t v20 = (void *)[v5 copy];
    }
    else {
      uint64_t v20 = 0;
    }

    id v4 = v22;
  }
  else
  {
    uint64_t v20 = 0;
  }

  return v20;
}

AMSEngagementMessageRequest *__70__AMSEngagementMessageEventServiceResponse__placementsMapWithPayload___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[AMSEngagementMessageRequest alloc] initWithJSObject:v3];

  [*(id *)(a1 + 32) _preprocessMessageRequest:v4 placement:*(void *)(a1 + 40)];
  return v4;
}

- (id)_placementRequestsWithDictionary:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          uint64_t v11 = objc_msgSend(v5, "objectForKeyedSubscript:", v10, (void)v15);
          v12 = [v11 makeDialogRequest];
          if (v12 && [v11 presentationAction]) {
            [v4 setObject:v12 forKeyedSubscript:v10];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v7);
    }

    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v4];
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (void)_preprocessMessageRequest:(id)a3 placement:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(NSString *)self->_serviceType isEqualToString:@"appStore"]
    && [v6 style] == 6
    && [v7 isEqualToString:@"appLevelAlert"])
  {
    uint64_t v8 = +[AMSLogConfig sharedEngagementConfig];
    if (!v8)
    {
      uint64_t v8 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = AMSLogKey();
      serviceType = self->_serviceType;
      int v13 = 138544130;
      uint64_t v14 = v10;
      __int16 v15 = 2114;
      long long v16 = v11;
      __int16 v17 = 2114;
      id v18 = v7;
      __int16 v19 = 2114;
      uint64_t v20 = serviceType;
      _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Replacing Dashboard message style with Alert message style for placement %{public}@ serviceType %{public}@, ", (uint8_t *)&v13, 0x2Au);
    }
    [v6 setStyle:1];
  }
}

- (NSDictionary)placements
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = [(AMSEngagementMessageEventServiceResponse *)self placementsMap];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v6 = [(AMSEngagementMessageEventServiceResponse *)self placementsMap];
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
          uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          v12 = [(AMSEngagementMessageEventServiceResponse *)self placementsMap];
          int v13 = [v12 objectForKeyedSubscript:v11];
          uint64_t v14 = [v13 firstObject];
          [v5 setObject:v14 forKeyedSubscript:v11];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v8);
    }

    if ([v5 count])
    {
      __int16 v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v5];
    }
    else
    {
      __int16 v15 = 0;
    }
  }
  else
  {
    __int16 v15 = 0;
  }
  return (NSDictionary *)v15;
}

- (NSDictionary)dictionaryRepresentation
{
  return self->_dictionaryRepresentation;
}

- (void)setDictionaryRepresentation:(id)a3
{
}

- (AMSEngagementRequest)engagementRequest
{
  return self->_engagementRequest;
}

- (void)setEngagementRequest:(id)a3
{
}

- (AMSEngagementMessageRequest)fullScreenMessageRequest
{
  return self->_fullScreenMessageRequest;
}

- (void)setFullScreenMessageRequest:(id)a3
{
}

- (NSDictionary)placementsMap
{
  return self->_placementsMap;
}

- (void)setPlacementsMap:(id)a3
{
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_placementsMap, 0);
  objc_storeStrong((id *)&self->_fullScreenMessageRequest, 0);
  objc_storeStrong((id *)&self->_engagementRequest, 0);
  objc_storeStrong((id *)&self->_dictionaryRepresentation, 0);
}

@end