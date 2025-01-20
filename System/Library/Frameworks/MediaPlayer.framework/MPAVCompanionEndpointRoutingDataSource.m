@interface MPAVCompanionEndpointRoutingDataSource
- (id)discoverySessionConfiguration;
- (id)getRoutesForCategory:(id)a3;
@end

@implementation MPAVCompanionEndpointRoutingDataSource

- (id)getRoutesForCategory:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v18.receiver = self;
  v18.super_class = (Class)MPAVCompanionEndpointRoutingDataSource;
  [(MPAVEndpointRoutingDataSource *)&v18 getRoutesForCategory:v4];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v11, "isPhoneRoute", (void)v14))
        {
          [v5 addObject:v11];
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  v12 = (void *)[v5 copy];

  return v12;
}

- (id)discoverySessionConfiguration
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F76FE0]) initWithEndpointFeatures:16];
  objc_msgSend(v3, "setTargetAudioSessionID:", -[MPAVEndpointRoutingDataSource targetSessionID](self, "targetSessionID"));

  return v3;
}

@end