@interface UARPDynamicAssetMappedAnalyticsEvent
+ (id)tag;
- (BOOL)decomposeUARP;
- (BOOL)expandMTICPayloads;
- (BOOL)findMatchingTMAP;
- (BOOL)getAppleModelNumber:(id)a3 inPayload:(id)a4;
- (BOOL)getEventID:(unsigned int *)a3 inPayload:(id)a4;
- (BOOL)prepareAndSend;
- (UARPDynamicAssetMappedAnalyticsEvent)init;
- (UARPDynamicAssetMappedAnalyticsEvent)initWithURL:(id)a3;
- (id)description;
- (void)expandMTICPayloads;
- (void)findMatchingTMAP;
- (void)prepareAndSend;
- (void)send;
@end

@implementation UARPDynamicAssetMappedAnalyticsEvent

- (UARPDynamicAssetMappedAnalyticsEvent)init
{
  return 0;
}

- (UARPDynamicAssetMappedAnalyticsEvent)initWithURL:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)UARPDynamicAssetMappedAnalyticsEvent;
  v6 = [(UARPDynamicAssetMappedAnalyticsEvent *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_url, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    coreAnalyticsEvents = v7->_coreAnalyticsEvents;
    v7->_coreAnalyticsEvents = v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    payloads = v7->_payloads;
    v7->_payloads = v10;

    os_log_t v12 = os_log_create("com.apple.accessoryupdater.uarp", "tmap");
    log = v7->_log;
    v7->_log = (OS_os_log *)v12;
  }
  return v7;
}

- (id)description
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  if (self->_tmapDatabase)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v4 = self->_coreAnalyticsEvents;
    uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v19 != v7) {
            objc_enumerationMutation(v4);
          }
          [v3 appendFormat:@"Mapped Analytics Event %@\n", *(void *)(*((void *)&v18 + 1) + 8 * i)];
        }
        uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v6);
    }
  }
  else
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v4 = self->_payloads;
    uint64_t v9 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v14 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        for (uint64_t j = 0; j != v10; ++j)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v4);
          }
          [v3 appendFormat:@"Mapped Analytics Payload %@\n", *(void *)(*((void *)&v14 + 1) + 8 * j)];
        }
        uint64_t v10 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v14 objects:v22 count:16];
      }
      while (v10);
    }
  }

  return v3;
}

- (void)send
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = self->_coreAnalyticsEvents;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = [*(id *)(*((void *)&v8 + 1) + 8 * i) objectForKeyedSubscript:@"EventName"];
        AnalyticsSendEventLazy();
      }
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

id __44__UARPDynamicAssetMappedAnalyticsEvent_send__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (BOOL)decomposeUARP
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v3 = [[UARPSuperBinaryAsset alloc] initWithURL:self->_url];
  asset = self->_asset;
  self->_asset = v3;

  if (![(UARPSuperBinaryAsset *)self->_asset expandHeadersAndTLVs:0]) {
    return 0;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  obuint64_t j = [(UARPSuperBinaryAsset *)self->_asset payloads];
  uint64_t v5 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(obj);
        }
        long long v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        long long v10 = [MEMORY[0x263EFF9A0] dictionary];
        unsigned int v20 = 0;
        if (![(UARPDynamicAssetMappedAnalyticsEvent *)self getEventID:&v20 inPayload:v9]) {
          goto LABEL_19;
        }
        long long v11 = [NSNumber numberWithUnsignedInt:v20];
        [v10 setObject:v11 forKeyedSubscript:@"EventID"];

        id v12 = objc_alloc_init(MEMORY[0x263F089D8]);
        if (![(UARPDynamicAssetMappedAnalyticsEvent *)self getAppleModelNumber:v12 inPayload:v9])goto LABEL_18; {
        uint64_t v13 = (void *)[v12 copy];
        }
        [v10 setObject:v13 forKeyedSubscript:@"AppleModelNumber"];

        [v9 rangePayload];
        long long v15 = -[UARPSuperBinaryAsset payloadData:range:error:](self->_asset, "payloadData:range:error:", v9, 0, v14, 0);
        if (!v15)
        {
          log = self->_log;
          if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v26 = v9;
            _os_log_error_impl(&dword_21E079000, log, OS_LOG_TYPE_ERROR, "MTIC has no Payload Data: %@", buf, 0xCu);
          }

LABEL_18:
LABEL_19:

          BOOL v16 = 0;
          goto LABEL_20;
        }
        [v10 setObject:v15 forKeyedSubscript:@"Events"];
        [(NSMutableArray *)self->_payloads addObject:v10];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
      BOOL v16 = 1;
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v16 = 1;
  }
LABEL_20:

  return v16;
}

- (BOOL)findMatchingTMAP
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v3 = [[UARPDynamicAssetTmapDatabase alloc] initTmapDatabase:0];
  tmapDatabase = self->_tmapDatabase;
  self->_tmapDatabase = v3;

  if (self->_tmapDatabase)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v5 = self->_payloads;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          long long v10 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "objectForKeyedSubscript:", @"AppleModelNumber", (void)v16);
          long long v11 = (void *)[v10 copy];

          id v12 = [(UARPDynamicAssetTmapDatabase *)self->_tmapDatabase findTmapforAppleModel:v11];
          if (!v12)
          {
            log = self->_log;
            if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
              [(UARPDynamicAssetMappedAnalyticsEvent *)(uint64_t)v11 findMatchingTMAP];
            }

            BOOL v13 = 0;
            goto LABEL_14;
          }
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    BOOL v13 = 1;
LABEL_14:
  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      -[UARPDynamicAssetMappedAnalyticsEvent findMatchingTMAP]();
    }
    return 0;
  }
  return v13;
}

- (BOOL)expandMTICPayloads
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (![(UARPDynamicAssetMappedAnalyticsEvent *)self findMatchingTMAP]) {
    return 0;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  obuint64_t j = self->_payloads;
  uint64_t v3 = [(NSMutableArray *)obj countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v20 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v22 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v7 = [v6 objectForKeyedSubscript:@"Events"];
        uint64_t v8 = (void *)[v7 copy];

        long long v9 = [v6 objectForKeyedSubscript:@"AppleModelNumber"];
        long long v10 = (void *)[v9 copy];

        long long v11 = [v6 objectForKeyedSubscript:@"EventID"];
        uint64_t v12 = [v11 unsignedIntValue];

        uint64_t v13 = [(UARPDynamicAssetTmapDatabase *)self->_tmapDatabase expandMticData:v8 withEventID:v12 appleModelNumber:v10];
        if (!v13)
        {
          if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
            -[UARPDynamicAssetMappedAnalyticsEvent expandMTICPayloads]();
          }

          return 0;
        }
        uint64_t v14 = (void *)v13;
        [(NSMutableArray *)self->_coreAnalyticsEvents addObject:v13];
      }
      uint64_t v4 = [(NSMutableArray *)obj countByEnumeratingWithState:&v21 objects:v27 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

  log = self->_log;
  BOOL v16 = 1;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    coreAnalyticsEvents = self->_coreAnalyticsEvents;
    *(_DWORD *)buf = 138412290;
    v26 = coreAnalyticsEvents;
    _os_log_impl(&dword_21E079000, log, OS_LOG_TYPE_INFO, "All MTIC data for this asset: %@", buf, 0xCu);
  }
  return v16;
}

- (BOOL)prepareAndSend
{
  if (![(UARPDynamicAssetMappedAnalyticsEvent *)self decomposeUARP])
  {
    BOOL v3 = os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR);
    if (!v3) {
      return v3;
    }
    -[UARPDynamicAssetMappedAnalyticsEvent prepareAndSend]();
    goto LABEL_9;
  }
  if (![(UARPDynamicAssetMappedAnalyticsEvent *)self expandMTICPayloads])
  {
    BOOL v3 = os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR);
    if (!v3) {
      return v3;
    }
    -[UARPDynamicAssetMappedAnalyticsEvent prepareAndSend]();
LABEL_9:
    LOBYTE(v3) = 0;
    return v3;
  }
  [(UARPDynamicAssetMappedAnalyticsEvent *)self send];
  LOBYTE(v3) = 1;
  return v3;
}

- (BOOL)getEventID:(unsigned int *)a3 inPayload:(id)a4
{
  uint64_t v6 = [a4 tlvs];
  uint64_t v7 = +[UARPSuperBinaryAssetTLV findTLVWithType:538280449 tlvs:v6];

  if (v7)
  {
    uint64_t v8 = [v7 valueAsNumber];
    long long v9 = v8;
    BOOL v10 = v8 != 0;
    if (v8)
    {
      *a3 = [v8 unsignedIntValue];
    }
    else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
    {
      -[UARPDynamicAssetMappedAnalyticsEvent getEventID:inPayload:]();
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      -[UARPDynamicAssetMappedAnalyticsEvent getEventID:inPayload:]();
    }
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)getAppleModelNumber:(id)a3 inPayload:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [a4 tlvs];
  uint64_t v7 = +[UARPSuperBinaryAssetTLV findTLVWithType:538280448 tlvs:v6];

  if (v7)
  {
    uint64_t v8 = [v7 valueAsString];
    BOOL v9 = v8 != 0;
    if (v8)
    {
      [v5 setString:v8];
    }
    else
    {
      BOOL v18 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v18) {
        -[UARPDynamicAssetMappedAnalyticsEvent getAppleModelNumber:inPayload:](v18, v19, v20, v21, v22, v23, v24, v25);
      }
    }
  }
  else
  {
    BOOL v10 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v10) {
      -[UARPDynamicAssetMappedAnalyticsEvent getAppleModelNumber:inPayload:](v10, v11, v12, v13, v14, v15, v16, v17);
    }
    BOOL v9 = 0;
  }

  return v9;
}

+ (id)tag
{
  v2 = (char *)uarpAssetTagStructMappedAnalytics();
  BOOL v3 = [[UARPAssetTag alloc] initWithChar1:*v2 char2:v2[1] char3:v2[2] char4:v2[3]];
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_tmapDatabase, 0);
  objc_storeStrong((id *)&self->_payloads, 0);
  objc_storeStrong((id *)&self->_coreAnalyticsEvents, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (void)findMatchingTMAP
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21E079000, a2, OS_LOG_TYPE_ERROR, "Unable to find Matching TMAP for Apple Model Number: %@", (uint8_t *)&v2, 0xCu);
}

- (void)expandMTICPayloads
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4(&dword_21E079000, v0, v1, "Unable to expand Data", v2, v3, v4, v5, v6);
}

- (void)prepareAndSend
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4(&dword_21E079000, v0, v1, "Failed to decompose MTIC", v2, v3, v4, v5, v6);
}

- (void)getEventID:inPayload:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4(&dword_21E079000, v0, v1, "Process MTIC Event ID tlv is not on payload", v2, v3, v4, v5, v6);
}

- (void)getEventID:inPayload:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4(&dword_21E079000, v0, v1, "Process MTIC Event ID tlv is not of type number", v2, v3, v4, v5, v6);
}

- (void)getAppleModelNumber:(uint64_t)a3 inPayload:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)getAppleModelNumber:(uint64_t)a3 inPayload:(uint64_t)a4 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end