@interface IMSenderCapabilityPipelineComponent
- (IMSenderCapabilityPipelineComponent)initWithRegistrationProperties:(id)a3 pushToken:(id)a4;
- (NSData)pushToken;
- (NSSet)registrationProperties;
- (id)runIndividuallyWithInput:(id)a3;
- (void)setPushToken:(id)a3;
- (void)setRegistrationProperties:(id)a3;
@end

@implementation IMSenderCapabilityPipelineComponent

- (IMSenderCapabilityPipelineComponent)initWithRegistrationProperties:(id)a3 pushToken:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IMSenderCapabilityPipelineComponent;
  v9 = [(IMSenderCapabilityPipelineComponent *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_registrationProperties, a3);
    objc_storeStrong((id *)&v10->_pushToken, a4);
  }

  return v10;
}

- (id)runIndividuallyWithInput:(id)a3
{
  v58[1] = *MEMORY[0x1E4F143B8];
  id v34 = a3;
  v3 = [v34 fromIdentifier];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v6 = (void *)MEMORY[0x1E4F6E7B8];
    id v7 = [v34 fromIdentifier];
    v58[0] = v7;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:1];
    v29 = [v6 _currentCachedRemoteDevicesForDestinations:v8 service:@"com.apple.madrid" listenerID:@"IMSenderCapabilityPipelineComponent"];

    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    obuint64_t j = [v29 allValues];
    uint64_t v31 = [obj countByEnumeratingWithState:&v47 objects:v57 count:16];
    if (v31)
    {
      char v9 = 0;
      uint64_t v30 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v31; ++i)
        {
          if (*(void *)v48 != v30) {
            objc_enumerationMutation(obj);
          }
          v10 = *(void **)(*((void *)&v47 + 1) + 8 * i);
          long long v43 = 0u;
          long long v44 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          id v35 = v10;
          uint64_t v37 = [v35 countByEnumeratingWithState:&v43 objects:v56 count:16];
          if (v37)
          {
            uint64_t v36 = *(void *)v44;
            do
            {
              for (uint64_t j = 0; j != v37; ++j)
              {
                if (*(void *)v44 != v36) {
                  objc_enumerationMutation(v35);
                }
                objc_super v12 = *(void **)(*((void *)&v43 + 1) + 8 * j);
                v13 = objc_msgSend(v12, "pushToken", v29);
                v14 = [(IMSenderCapabilityPipelineComponent *)self pushToken];
                int v15 = [v13 isEqualToData:v14];

                if (v15)
                {
                  long long v41 = 0u;
                  long long v42 = 0u;
                  long long v39 = 0u;
                  long long v40 = 0u;
                  v16 = [(IMSenderCapabilityPipelineComponent *)self registrationProperties];
                  uint64_t v17 = [v16 countByEnumeratingWithState:&v39 objects:v55 count:16];
                  if (v17)
                  {
                    uint64_t v18 = *(void *)v40;
                    do
                    {
                      for (uint64_t k = 0; k != v17; ++k)
                      {
                        if (*(void *)v40 != v18) {
                          objc_enumerationMutation(v16);
                        }
                        uint64_t v20 = *(void *)(*((void *)&v39 + 1) + 8 * k);
                        v21 = [v12 capabilities];
                        uint64_t v22 = [v21 valueForCapability:v20];

                        if (v22) {
                          [v5 addObject:v20];
                        }
                      }
                      uint64_t v17 = [v16 countByEnumeratingWithState:&v39 objects:v55 count:16];
                    }
                    while (v17);
                  }

                  char v9 = 1;
                }
              }
              uint64_t v37 = [v35 countByEnumeratingWithState:&v43 objects:v56 count:16];
            }
            while (v37);
          }
        }
        uint64_t v31 = [obj countByEnumeratingWithState:&v47 objects:v57 count:16];
      }
      while (v31);
    }
    else
    {
      char v9 = 0;
    }

    [v34 setSenderRegistrationProperties:v5];
    if (IMOSLoggingEnabled())
    {
      v26 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        v27 = @"NO";
        if (v9) {
          v27 = @"YES";
        }
        *(_DWORD *)buf = 138412546;
        id v52 = v5;
        __int16 v53 = 2112;
        v54 = v27;
        _os_log_impl(&dword_1D967A000, v26, OS_LOG_TYPE_INFO, "<IMSenderCapabilityPipelineComponent> Final capabilities: %@ foundEndpoint: %@", buf, 0x16u);
      }
    }
    v25 = (void *)[objc_alloc(MEMORY[0x1E4F6BE98]) initWithValue:v34];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v23 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v23, OS_LOG_TYPE_INFO, "<IMSenderCapabilityPipelineComponent> No from identifier, returning empty capabilities", buf, 2u);
      }
    }
    v24 = [MEMORY[0x1E4F1CAD0] set];
    [v34 setSenderRegistrationProperties:v24];

    v25 = (void *)[objc_alloc(MEMORY[0x1E4F6BE98]) initWithValue:v34];
  }

  return v25;
}

- (NSSet)registrationProperties
{
  return self->_registrationProperties;
}

- (void)setRegistrationProperties:(id)a3
{
}

- (NSData)pushToken
{
  return self->_pushToken;
}

- (void)setPushToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pushToken, 0);

  objc_storeStrong((id *)&self->_registrationProperties, 0);
}

@end