@interface UARPDynamicAssetAnalyticsEvent
+ (id)tag;
- (BOOL)decomposeUARP;
- (UARPDynamicAssetAnalyticsEvent)init;
- (UARPDynamicAssetAnalyticsEvent)initWithURL:(id)a3;
- (id)description;
- (void)decomposeUARP;
- (void)send;
@end

@implementation UARPDynamicAssetAnalyticsEvent

- (UARPDynamicAssetAnalyticsEvent)init
{
  return 0;
}

- (UARPDynamicAssetAnalyticsEvent)initWithURL:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UARPDynamicAssetAnalyticsEvent;
  v5 = [(UARPDynamicAssetAnalyticsEvent *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    url = v5->_url;
    v5->_url = (NSURL *)v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    events = v5->_events;
    v5->_events = v8;
  }
  return v5;
}

- (id)description
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  [v3 appendFormat:@"Analytics Events %@\n", self->_events];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = self->_events;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 appendFormat:@"Analytics Event %@\n", *(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BOOL)decomposeUARP
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = [[UARPSuperBinaryAsset alloc] initWithURL:self->_url];
  asset = self->_asset;
  self->_asset = v3;

  if (![(UARPSuperBinaryAsset *)self->_asset expandHeadersAndTLVs:0]) {
    return 0;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v5 = [(UARPSuperBinaryAsset *)self->_asset payloads];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (!v6) {
    goto LABEL_19;
  }
  uint64_t v8 = v6;
  uint64_t v9 = *(void *)v25;
  long long v10 = &_os_log_internal;
  *(void *)&long long v7 = 138412290;
  long long v23 = v7;
  while (2)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v25 != v9) {
        objc_enumerationMutation(v5);
      }
      long long v12 = *(NSMutableArray **)(*((void *)&v24 + 1) + 8 * i);
      long long v13 = [(NSMutableArray *)v12 tlvs];
      v14 = +[UARPSuperBinaryAssetTLV findTLVWithType:1483412481 tlvs:v13];

      if (v14)
      {
        uint64_t v15 = [v14 valueAsNumber];
        v16 = v15;
        if (!v15)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            -[UARPDynamicAssetAnalyticsEvent decomposeUARP]();
          }
          goto LABEL_26;
        }
        if ([v15 unsignedIntegerValue])
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            -[UARPDynamicAssetAnalyticsEvent decomposeUARP]();
          }
          goto LABEL_26;
        }
      }
      else if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = v23;
        v29 = v12;
        _os_log_impl(&dword_21E079000, v10, OS_LOG_TYPE_INFO, "Process TICS assuming JSON : %@", buf, 0xCu);
      }
      [(NSMutableArray *)v12 rangePayload];
      v16 = -[UARPSuperBinaryAsset payloadData:range:error:](self->_asset, "payloadData:range:error:", v12, 0, v17, 0);
      v18 = [MEMORY[0x263F08900] JSONObjectWithData:v16 options:0 error:0];
      if (!v18 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {

LABEL_26:
        return 0;
      }
      v19 = v18;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = v23;
        v29 = v19;
        _os_log_impl(&dword_21E079000, v10, OS_LOG_TYPE_INFO, "Analytics object : %@", buf, 0xCu);
      }
      [(NSMutableArray *)self->_events addObject:v19];
    }
    uint64_t v8 = [v5 countByEnumeratingWithState:&v24 objects:v30 count:16];
    if (v8) {
      continue;
    }
    break;
  }
LABEL_19:

  BOOL v20 = 1;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    events = self->_events;
    *(_DWORD *)buf = 138412290;
    v29 = events;
    _os_log_impl(&dword_21E079000, &_os_log_internal, OS_LOG_TYPE_INFO, "All Analytics objects for this asset: %@", buf, 0xCu);
  }
  return v20;
}

- (void)send
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obj = self->_events;
  uint64_t v15 = [(NSMutableArray *)obj countByEnumeratingWithState:&v22 objects:v31 count:16];
  if (v15)
  {
    uint64_t v14 = *(void *)v23;
    v2 = &_os_log_internal;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = v3;
        id v4 = *(void **)(*((void *)&v22 + 1) + 8 * v3);
        uint64_t v5 = [v4 allKeys];
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v30 count:16];
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
              uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * i);
              long long v11 = [v4 objectForKeyedSubscript:v10];
              if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                uint64_t v27 = v10;
                __int16 v28 = 2112;
                v29 = v11;
                _os_log_impl(&dword_21E079000, v2, OS_LOG_TYPE_INFO, "Posting Analytics %@ : %@", buf, 0x16u);
              }
              uint64_t v17 = v11;
              id v12 = v11;
              AnalyticsSendEventLazy();
            }
            uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v30 count:16];
          }
          while (v7);
        }

        uint64_t v3 = v16 + 1;
      }
      while (v16 + 1 != v15);
      uint64_t v15 = [(NSMutableArray *)obj countByEnumeratingWithState:&v22 objects:v31 count:16];
    }
    while (v15);
  }
}

id __38__UARPDynamicAssetAnalyticsEvent_send__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (id)tag
{
  v2 = (char *)uarpAssetTagStructAnalytics();
  uint64_t v3 = [[UARPAssetTag alloc] initWithChar1:*v2 char2:v2[1] char3:v2[2] char4:v2[3]];
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (void)decomposeUARP
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_21E079000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Process TICS payload type tlv is not JSON", v0, 2u);
}

@end