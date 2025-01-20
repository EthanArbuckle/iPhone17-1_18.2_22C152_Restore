@interface UARPDynamicAssetLogsEvent
+ (id)tag;
- (BOOL)decomposeUARP;
- (BOOL)expandToDirectory:(id)a3 forRemoteEndpoint:(id)a4;
- (UARPDynamicAssetLogsEvent)init;
- (UARPDynamicAssetLogsEvent)initWithURL:(id)a3;
- (id)createLogsFilepath:(id)a3 forRemoteEndpoint:(id)a4;
- (void)decomposeUARP;
@end

@implementation UARPDynamicAssetLogsEvent

- (UARPDynamicAssetLogsEvent)init
{
  return 0;
}

- (UARPDynamicAssetLogsEvent)initWithURL:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UARPDynamicAssetLogsEvent;
  v6 = [(UARPDynamicAssetLogsEvent *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_url, a3);
    os_log_t v8 = os_log_create("com.apple.accessoryupdater.uarp", "logs");
    log = v7->_log;
    v7->_log = (OS_os_log *)v8;
  }
  return v7;
}

- (BOOL)decomposeUARP
{
  v3 = [[UARPSuperBinaryAsset alloc] initWithURL:self->_url];
  asset = self->_asset;
  self->_asset = v3;

  BOOL v5 = [(UARPSuperBinaryAsset *)self->_asset expandHeadersAndTLVs:0];
  if (!v5)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      -[UARPDynamicAssetLogsEvent decomposeUARP](log);
    }
  }
  return v5;
}

- (BOOL)expandToDirectory:(id)a3 forRemoteEndpoint:(id)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v31 = a4;
  if (![(UARPDynamicAssetLogsEvent *)self decomposeUARP])
  {
    BOOL v25 = 0;
    goto LABEL_23;
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = [(UARPSuperBinaryAsset *)self->_asset payloads];
  uint64_t v7 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (!v7)
  {
    BOOL v25 = 1;
    goto LABEL_22;
  }
  uint64_t v9 = v7;
  uint64_t v30 = *(void *)v33;
  *(void *)&long long v8 = 136315394;
  long long v28 = v8;
  while (2)
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v33 != v30) {
        objc_enumerationMutation(obj);
      }
      objc_super v11 = *(void **)(*((void *)&v32 + 1) + 8 * i);
      v12 = -[UARPDynamicAssetLogsEvent createLogsFilepath:forRemoteEndpoint:](self, "createLogsFilepath:forRemoteEndpoint:", v11, v31, v28);
      v13 = (void *)[objc_alloc(NSURL) initWithString:v12];
      v14 = [MEMORY[0x263F08850] defaultManager];
      v15 = [v13 path];
      char v16 = [v14 createFileAtPath:v15 contents:0 attributes:0];

      if ((v16 & 1) == 0)
      {
        log = self->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
          -[UARPDynamicAssetLogsEvent expandToDirectory:forRemoteEndpoint:](log, v13);
        }
        goto LABEL_21;
      }
      [v11 rangePayload];
      v18 = -[UARPSuperBinaryAsset payloadData:range:error:](self->_asset, "payloadData:range:error:", v11, 0, v17, 0);
      if (!UARPWriteFile(v18, v13))
      {

LABEL_21:
        BOOL v25 = 0;
        goto LABEL_22;
      }
      v19 = self->_log;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v20 = v19;
        v21 = [v13 path];
        *(_DWORD *)buf = v28;
        v37 = "-[UARPDynamicAssetLogsEvent expandToDirectory:forRemoteEndpoint:]";
        __int16 v38 = 2112;
        v39 = v21;
        _os_log_impl(&dword_21E079000, v20, OS_LOG_TYPE_INFO, "%s: Successfully Expanded LOGS to File: %@", buf, 0x16u);
      }
      if (v6)
      {
        v22 = UARPStringLogsDirectoryFilePath();
        v23 = [v6 path];
        v24 = [v12 lastPathComponent];
        UARPCopyFile((uint64_t)v22, v23, v24);
      }
    }
    uint64_t v9 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
    BOOL v25 = 1;
    if (v9) {
      continue;
    }
    break;
  }
LABEL_22:

LABEL_23:
  return v25;
}

+ (id)tag
{
  v2 = (char *)uarpAssetTagStructAnalytics();
  v3 = [[UARPAssetTag alloc] initWithChar1:*v2 char2:v2[1] char3:v2[2] char4:v2[3]];
  return v3;
}

- (id)createLogsFilepath:(id)a3 forRemoteEndpoint:(id)a4
{
  id v5 = a4;
  id v6 = [a3 tlvs];
  uint64_t v7 = +[UARPSuperBinaryAssetTLV findTLVWithType:3436347665 tlvs:v6];

  if (v7)
  {
    long long v8 = [v7 valueAsString];
    uint64_t v9 = [v8 stringByDeletingPathExtension];
    v10 = [NSString stringWithFormat:@"-%@", v9];
  }
  else
  {
    v10 = &stru_26CEE54E0;
  }
  objc_super v11 = [(__CFString *)v10 stringByAppendingPathExtension:@"txt"];
  v12 = [v5 appleModelNumber];
  v13 = [v5 serialNumber];

  v14 = UARPStringLogsDirectoryFilePath();
  v15 = UARPUniqueFilename(v12, v13, v14, @"LOGS", v11);

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (void)decomposeUARP
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21E079000, log, OS_LOG_TYPE_ERROR, "Unable to expand LOGS SuperBinary Asset", v1, 2u);
}

- (void)expandToDirectory:(void *)a1 forRemoteEndpoint:(void *)a2 .cold.1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = a1;
  v4 = [a2 path];
  int v5 = 138412290;
  id v6 = v4;
  _os_log_error_impl(&dword_21E079000, v3, OS_LOG_TYPE_ERROR, "Failed to create filepath for radar LOGS at %@", (uint8_t *)&v5, 0xCu);
}

@end