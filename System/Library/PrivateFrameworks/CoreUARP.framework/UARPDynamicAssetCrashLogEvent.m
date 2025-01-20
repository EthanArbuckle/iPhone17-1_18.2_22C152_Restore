@interface UARPDynamicAssetCrashLogEvent
+ (id)tag;
- (BOOL)decomposeUARP;
- (BOOL)expandCRSHPayloads;
- (BOOL)expandToDirectory:(id)a3 forRemoteEndpoint:(id)a4;
- (BOOL)findMatchingCMAP;
- (BOOL)getCoreName:(id)a3 inPayload:(id)a4;
- (BOOL)processCrashAdditionalInfo;
- (BOOL)processCrashInstance;
- (NSString)appleModelNumber;
- (UARPDynamicAssetCrashLogEvent)init;
- (UARPDynamicAssetCrashLogEvent)initWithURL:(id)a3;
- (id)description;
- (uint64_t)decomposeUARP;
- (void)decomposeUARP;
- (void)expandCRSHPayloads;
- (void)findMatchingCMAP;
- (void)processCrashAdditionalInfo;
- (void)processCrashInstance;
- (void)sendSpeedTracer;
- (void)setAppleModelNumber:(id)a3;
@end

@implementation UARPDynamicAssetCrashLogEvent

- (UARPDynamicAssetCrashLogEvent)init
{
  return 0;
}

- (UARPDynamicAssetCrashLogEvent)initWithURL:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UARPDynamicAssetCrashLogEvent;
  v6 = [(UARPDynamicAssetCrashLogEvent *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_url, a3);
    os_log_t v8 = os_log_create("com.apple.accessoryupdater.uarp", "crsh");
    log = v7->_log;
    v7->_log = (OS_os_log *)v8;
  }
  return v7;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  v4 = v3;
  uint64_t v5 = 72;
  if (!self->_cmapDatabase) {
    uint64_t v5 = 32;
  }
  [v3 appendFormat:@"Crash Analytics Event %@\n", *(Class *)((char *)&self->super.isa + v5)];
  return v4;
}

- (void)sendSpeedTracer
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_21E079000, v0, v1, "Could not submit processed crash log to analytics, error %@", v2, v3, v4, v5, v6);
}

uint64_t __48__UARPDynamicAssetCrashLogEvent_sendSpeedTracer__block_invoke(uint64_t a1, void *a2)
{
  return [a2 writeData:*(void *)(*(void *)(a1 + 32) + 64)];
}

- (BOOL)expandToDirectory:(id)a3 forRemoteEndpoint:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  os_log_t v8 = [v7 appleModelNumber];
  v9 = [v7 serialNumber];

  v10 = UARPStringCrashAnalyticsDirectoryFilePath();
  objc_super v11 = UARPUniqueFilename(v8, v9, v10, @"CRSH", @".json");

  v12 = (void *)[objc_alloc(NSURL) initWithString:v11];
  int v13 = UARPWriteFile(self->_processedCrashInstanceData, v12);
  if (v13)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      v15 = log;
      v16 = [v12 path];
      int v20 = 136315394;
      v21 = "-[UARPDynamicAssetCrashLogEvent expandToDirectory:forRemoteEndpoint:]";
      __int16 v22 = 2112;
      v23 = v16;
      _os_log_impl(&dword_21E079000, v15, OS_LOG_TYPE_INFO, "%s: Successfully Expanded CRSH to File: %@", (uint8_t *)&v20, 0x16u);
    }
    if (v6)
    {
      v17 = UARPStringCrashAnalyticsDirectoryFilePath();
      v18 = [v6 path];
      UARPCopyFile((uint64_t)v17, v18, v11);
    }
  }

  return v13;
}

- (BOOL)decomposeUARP
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  uint64_t v3 = [[UARPSuperBinaryAsset alloc] initWithURL:self->_url];
  asset = self->_asset;
  self->_asset = v3;

  if (![(UARPSuperBinaryAsset *)self->_asset expandHeadersAndTLVs:0]
    || ![(UARPDynamicAssetCrashLogEvent *)self processCrashAdditionalInfo])
  {
    return 0;
  }
  uint64_t v5 = (NSMutableArray *)objc_opt_new();
  preProcessedCrashLogs = self->_preProcessedCrashLogs;
  self->_preProcessedCrashLogs = v5;

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = [(UARPSuperBinaryAsset *)self->_asset payloads];
  uint64_t v7 = [obj countByEnumeratingWithState:&v31 objects:v41 count:16];
  if (v7)
  {
    uint64_t v28 = *(void *)v32;
    v26 = v36;
    v25 = v30;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v32 != v28) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        v10 = +[UARPDynamicAssetCrashLogEvent tag];
        objc_super v11 = [v9 payloadTag];
        int v12 = [v11 isEqual:v10];

        if (v12)
        {
          int v13 = [MEMORY[0x263EFF9A0] dictionary];
          id v14 = objc_alloc_init(MEMORY[0x263F089D8]);
          if ([(UARPDynamicAssetCrashLogEvent *)self getCoreName:v14 inPayload:v9])
          {
            v15 = (void *)[v14 copy];
            [v13 setObject:v15 forKeyedSubscript:@"core"];

            [v9 rangePayload];
            v17 = -[UARPSuperBinaryAsset payloadData:range:error:](self->_asset, "payloadData:range:error:", v9, 0, v16, 0);
            if (!v17)
            {
              if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
                -[UARPDynamicAssetCrashLogEvent decomposeUARP]();
              }

              BOOL v23 = 0;
              goto LABEL_27;
            }
            uint64_t v37 = 0;
            v38 = &v37;
            uint64_t v39 = 0x2020000000;
            v18 = (void (*)(void *))getRTBuddyCrashlogDecodeSymbolLoc_ptr;
            v40 = getRTBuddyCrashlogDecodeSymbolLoc_ptr;
            if (!getRTBuddyCrashlogDecodeSymbolLoc_ptr)
            {
              v35[0] = MEMORY[0x263EF8330];
              v35[1] = 3221225472;
              v36[0] = __getRTBuddyCrashlogDecodeSymbolLoc_block_invoke;
              v36[1] = &unk_2644926F0;
              v36[2] = &v37;
              __getRTBuddyCrashlogDecodeSymbolLoc_block_invoke((uint64_t)v35);
              v18 = (void (*)(void *))v38[3];
            }
            _Block_object_dispose(&v37, 8);
            if (!v18)
            {
              -[UARPDynamicAssetCrashLogEvent decomposeUARP]();
              __break(1u);
            }
            v19 = v18(v17);
            if (v19)
            {
              [v13 setObject:v19 forKeyedSubscript:@"crashlog"];
              int v20 = self->_preProcessedCrashLogs;
              v21 = (void *)[v13 copy];
              [(NSMutableArray *)v20 addObject:v21];
            }
            else
            {
              log = self->_log;
              if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
                [(UARPDynamicAssetCrashLogEvent *)&buf decomposeUARP];
              }
            }
          }
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v31 objects:v41 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v23 = 1;
LABEL_27:

  return v23;
}

- (BOOL)processCrashInstance
{
  v47[2] = *MEMORY[0x263EF8340];
  if (![(UARPDynamicAssetCrashLogEvent *)self findMatchingCMAP]) {
    return 0;
  }
  uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  processedCrashInstance = self->_processedCrashInstance;
  self->_processedCrashInstance = v3;

  v46[0] = @"role";
  v46[1] = @"side";
  v47[0] = @"case";
  uint64_t v5 = [MEMORY[0x263EFF9D0] null];
  v47[1] = v5;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:2];

  BOOL testMode = self->_testMode;
  v38 = self->_processedCrashInstance;
  v44[0] = @"bug_type";
  v44[1] = @"UI_country_code";
  v45[0] = @"305";
  v45[1] = @"US";
  v44[2] = @"log_version";
  v44[3] = @"accessory_type";
  v45[2] = @"1.0";
  v45[3] = @"audio";
  v35 = (void *)v6;
  v45[4] = v6;
  v44[4] = @"application-info";
  v44[5] = @"accessory_pid";
  v40 = [NSNumber numberWithUnsignedInt:self->_productId];
  v45[5] = v40;
  v44[6] = @"analytics_test_mode";
  uint64_t v39 = [NSNumber numberWithBool:testMode];
  v45[6] = v39;
  v44[7] = @"crashlogs";
  uint64_t v37 = objc_opt_new();
  v45[7] = v37;
  v44[8] = @"accessory_crashreporter_key";
  v36 = [MEMORY[0x263EFF9D0] null];
  v45[8] = v36;
  v44[9] = @"accessory_os_version";
  os_log_t v8 = [MEMORY[0x263EFF9D0] null];
  v45[9] = v8;
  v44[10] = @"accessory_os_train";
  v9 = [MEMORY[0x263EFF9D0] null];
  v45[10] = v9;
  v44[11] = @"accessory_machine_config";
  v10 = (void *)[(NSString *)self->_appleModelNumber copy];
  v45[11] = v10;
  v44[12] = @"accessory_release_type";
  objc_super v11 = [MEMORY[0x263EFF9D0] null];
  v45[12] = v11;
  v44[13] = @"usage_since_last_crash";
  int v12 = [MEMORY[0x263EFF9D0] null];
  v45[13] = v12;
  v44[14] = @"usage_since_last_crash_user_facing";
  int v13 = [MEMORY[0x263EFF9D0] null];
  v45[14] = v13;
  v44[15] = @"usage_since_last_crash_in_ear";
  id v14 = [MEMORY[0x263EFF9D0] null];
  v45[15] = v14;
  v44[16] = @"accessory_fusing";
  v15 = [MEMORY[0x263EFF9D0] null];
  v45[16] = v15;
  uint64_t v16 = [NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:17];
  [(NSMutableDictionary *)v38 setDictionary:v16];

  if ([(UARPDynamicAssetCrashLogEvent *)self expandCRSHPayloads])
  {
    [(NSMutableDictionary *)self->_processedCrashInstance setObject:self->_processedCrashLogs forKeyedSubscript:@"crashlogs"];
    v17 = self->_processedCrashInstance;
    id v41 = 0;
    v18 = [MEMORY[0x263F08900] dataWithJSONObject:v17 options:1 error:&v41];
    id v19 = v41;
    processedCrashInstanceData = self->_processedCrashInstanceData;
    self->_processedCrashInstanceData = v18;

    if (self->_processedCrashInstanceData) {
      BOOL v21 = v19 == 0;
    }
    else {
      BOOL v21 = 0;
    }
    BOOL v22 = v21;
    log = self->_log;
    if (v21)
    {
      if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
      {
        uint64_t v24 = self->_processedCrashInstance;
        *(_DWORD *)uint8_t buf = 138412290;
        v43 = v24;
        _os_log_impl(&dword_21E079000, log, OS_LOG_TYPE_INFO, "Successfully expanded CRSH Dynamic Asset: %@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      -[UARPDynamicAssetCrashLogEvent processCrashInstance]();
    }
  }
  else
  {
    v25 = self->_log;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      [(UARPDynamicAssetCrashLogEvent *)v25 processCrashInstance];
    }
    BOOL v22 = 0;
  }

  return v22;
}

- (BOOL)expandCRSHPayloads
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v3 = [[UARPDynamicAssetCmapDatabase alloc] initCmapDatabase:0];
  cmapDatabase = self->_cmapDatabase;
  self->_cmapDatabase = v3;

  if (self->_cmapDatabase)
  {
    uint64_t v5 = (NSMutableArray *)objc_opt_new();
    processedCrashLogs = self->_processedCrashLogs;
    self->_processedCrashLogs = v5;

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id obj = self->_preProcessedCrashLogs;
    uint64_t v7 = [(NSMutableArray *)obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v27 = *(void *)v29;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v29 != v27) {
            objc_enumerationMutation(obj);
          }
          v10 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          objc_super v11 = [v10 objectForKeyedSubscript:@"core"];
          int v12 = objc_opt_new();
          int v13 = self->_cmapDatabase;
          id v14 = [v10 objectForKeyedSubscript:@"crashlog"];
          v15 = [(UARPDynamicAssetCmapDatabase *)v13 expandCrshData:v14 withAppleModelNumber:self->_appleModelNumber];

          if (!v15)
          {
            if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
              -[UARPDynamicAssetCrashLogEvent expandCRSHPayloads]();
            }

            BOOL v16 = 0;
            goto LABEL_14;
          }
          [v12 setObject:v15 forKeyedSubscript:@"crashlog"];
          [v12 setObject:v11 forKeyedSubscript:@"core"];
          [(NSMutableArray *)self->_processedCrashLogs addObject:v12];
        }
        uint64_t v8 = [(NSMutableArray *)obj countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    BOOL v16 = 1;
LABEL_14:
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      [(UARPDynamicAssetCrashLogEvent *)log expandCRSHPayloads];
    }
    return 0;
  }
  return v16;
}

- (BOOL)getCoreName:(id)a3 inPayload:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [a4 tlvs];
  uint64_t v7 = +[UARPSuperBinaryAssetTLV findTLVWithType:4042160640 tlvs:v6];

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
        -[UARPDynamicAssetCrashLogEvent getCoreName:inPayload:](v18, v19, v20, v21, v22, v23, v24, v25);
      }
    }
  }
  else
  {
    BOOL v10 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v10) {
      -[UARPDynamicAssetCrashLogEvent getCoreName:inPayload:](v10, v11, v12, v13, v14, v15, v16, v17);
    }
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)processCrashAdditionalInfo
{
  uint64_t v3 = [(UARPSuperBinaryAsset *)self->_asset tlvs];
  uint64_t v4 = +[UARPSuperBinaryAssetTLV findTLVWithType:4042160641 tlvs:v3];

  if (v4)
  {
    id v5 = [v4 valueAsString];
    uint64_t v6 = v5;
    if (v5)
    {
      uint64_t v7 = (NSString *)[v5 copy];
      appleModelNumber = self->_appleModelNumber;
      self->_appleModelNumber = v7;

      BOOL v9 = +[UARPSupportedAccessory findByAppleModelNumber:self->_appleModelNumber];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        BOOL v10 = [v9 hardwareID];
        self->_productId = [v10 productID];
      }
      else
      {
        self->_productId = 0;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          [(UARPDynamicAssetCrashLogEvent *)(uint64_t)&self->_appleModelNumber processCrashAdditionalInfo];
        }
      }
      v35 = [(UARPSuperBinaryAsset *)self->_asset tlvs];
      v36 = +[UARPSuperBinaryAssetTLV findTLVWithType:4042160643 tlvs:v35];

      if (v36)
      {
        uint64_t v37 = [v36 valueAsNumber];
        v38 = v37;
        BOOL v19 = v37 != 0;
        if (v37)
        {
          if ([v37 unsignedIntValue]) {
            self->_BOOL testMode = 1;
          }
          else {
            self->_BOOL testMode = 0;
          }
        }
        else
        {
          BOOL v47 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
          if (v47) {
            [(UARPDynamicAssetCrashLogEvent *)v47 processCrashAdditionalInfo];
          }
        }
      }
      else
      {
        BOOL v39 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v39) {
          [(UARPDynamicAssetCrashLogEvent *)v39 processCrashAdditionalInfo];
        }
        BOOL v19 = 0;
      }
    }
    else
    {
      BOOL v20 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v20) {
        [(UARPDynamicAssetCrashLogEvent *)v20 processCrashAdditionalInfo];
      }
      BOOL v19 = 0;
    }
  }
  else
  {
    BOOL v11 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v11) {
      [(UARPDynamicAssetCrashLogEvent *)v11 processCrashAdditionalInfo];
    }
    BOOL v19 = 0;
  }

  return v19;
}

- (BOOL)findMatchingCMAP
{
  uint64_t v3 = [[UARPDynamicAssetCmapDatabase alloc] initCmapDatabase:0];
  cmapDatabase = self->_cmapDatabase;
  self->_cmapDatabase = v3;

  id v5 = self->_cmapDatabase;
  if (v5)
  {
    p_appleModelNumber = &self->_appleModelNumber;
    uint64_t v7 = [(UARPDynamicAssetCmapDatabase *)v5 findCmapforAppleModel:self->_appleModelNumber];
    BOOL v8 = v7 != 0;
    if (!v7)
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
        [(UARPDynamicAssetCrashLogEvent *)(uint64_t)p_appleModelNumber findMatchingCMAP];
      }
    }
  }
  else
  {
    uint64_t v16 = self->_log;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      [(UARPDynamicAssetCrashLogEvent *)v16 expandCRSHPayloads];
    }
    return 0;
  }
  return v8;
}

+ (id)tag
{
  uint64_t v2 = (char *)uarpAssetTagStructCrashAnalytics();
  uint64_t v3 = [[UARPAssetTag alloc] initWithChar1:*v2 char2:v2[1] char3:v2[2] char4:v2[3]];
  return v3;
}

- (NSString)appleModelNumber
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAppleModelNumber:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cmapDatabase, 0);
  objc_storeStrong((id *)&self->_processedCrashInstance, 0);
  objc_storeStrong((id *)&self->_processedCrashInstanceData, 0);
  objc_storeStrong((id *)&self->_appleModelNumber, 0);
  objc_storeStrong((id *)&self->_processedCrashLogs, 0);
  objc_storeStrong((id *)&self->_preProcessedCrashLogs, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (void)decomposeUARP
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_21E079000, log, OS_LOG_TYPE_ERROR, "RTKitBuddy unable to decode Crash Log", buf, 2u);
}

- (uint64_t)decomposeUARP
{
  dlerror();
  v0 = (uint8_t *)abort_report_np();
  return [(UARPDynamicAssetCrashLogEvent *)v0 decomposeUARP];
}

- (void)processCrashInstance
{
}

- (void)expandCRSHPayloads
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_21E079000, v0, v1, "Unable to expand CRSH Data for: %@", v2, v3, v4, v5, v6);
}

- (void)getCoreName:(uint64_t)a3 inPayload:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)getCoreName:(uint64_t)a3 inPayload:(uint64_t)a4 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)processCrashAdditionalInfo
{
}

- (void)findMatchingCMAP
{
}

@end