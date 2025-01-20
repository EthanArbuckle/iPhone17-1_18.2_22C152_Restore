@interface UARPDynamicAssetCmapDatabase
+ (BOOL)supportsSecureCoding;
- (BOOL)addCmapMapping:(id)a3;
- (BOOL)cleanUpCmapDatabaseFiles;
- (BOOL)cmapDatabaseFileExists;
- (BOOL)createCmapDatabaseFile;
- (BOOL)decomposeUARP;
- (BOOL)flushToDisk;
- (UARPDynamicAssetCmapDatabase)init;
- (UARPDynamicAssetCmapDatabase)initWithCoder:(id)a3;
- (id)expandCrshData:(id)a3 withAppleModelNumber:(id)a4;
- (id)findCmapDatabaseFileUrl;
- (id)findCmapforAppleModel:(id)a3;
- (id)initCmapDatabase:(id)a3;
- (void)cleanUpCmapDatabaseFiles;
- (void)createCmapDatabaseFile;
- (void)encodeWithCoder:(id)a3;
- (void)flushToDisk;
@end

@implementation UARPDynamicAssetCmapDatabase

- (UARPDynamicAssetCmapDatabase)init
{
  return 0;
}

- (id)initCmapDatabase:(id)a3
{
  id v5 = a3;
  v34.receiver = self;
  v34.super_class = (Class)UARPDynamicAssetCmapDatabase;
  v6 = [(UARPDynamicAssetCmapDatabase *)&v34 init];
  os_log_t v7 = os_log_create("com.apple.accessoryupdater.uarp", "crsh");
  log = v6->_log;
  v6->_log = (OS_os_log *)v7;

  if (![(UARPDynamicAssetCmapDatabase *)v6 cmapDatabaseFileExists])
  {
LABEL_7:
    if (!v6->_cmapDatabase)
    {
      v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      cmapDatabase = v6->_cmapDatabase;
      v6->_cmapDatabase = v21;
    }
    if (v5) {
      objc_storeStrong((id *)&v6->_url, a3);
    }
    v6 = v6;
    v23 = v6;
    goto LABEL_12;
  }
  uint64_t v9 = [(UARPDynamicAssetCmapDatabase *)v6 findCmapDatabaseFileUrl];
  if (v9)
  {
    v10 = (void *)v9;
    v11 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v9];
    id v33 = 0;
    uint64_t v12 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v11 error:&v33];
    id v13 = v33;

    if (!v12 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[UARPDynamicAssetCmapDatabase initCmapDatabase:]((uint64_t)v13, v14, v15, v16, v17, v18, v19, v20);
    }

    v6 = (UARPDynamicAssetCmapDatabase *)v12;
    goto LABEL_7;
  }
  v25 = v6->_log;
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
    -[UARPDynamicAssetCmapDatabase initCmapDatabase:](v25, v26, v27, v28, v29, v30, v31, v32);
  }
  v23 = 0;
LABEL_12:

  return v23;
}

- (UARPDynamicAssetCmapDatabase)initWithCoder:(id)a3
{
  v16[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)UARPDynamicAssetCmapDatabase;
  id v5 = [(UARPDynamicAssetCmapDatabase *)&v15 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    v16[0] = objc_opt_class();
    v16[1] = objc_opt_class();
    os_log_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
    v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"cmap"];

    uint64_t v10 = [v9 mutableCopy];
    cmapDatabase = v5->_cmapDatabase;
    v5->_cmapDatabase = (NSMutableArray *)v10;

    os_log_t v12 = os_log_create("com.apple.accessoryupdater.uarp", "crsh");
    log = v5->_log;
    v5->_log = (OS_os_log *)v12;
  }
  return v5;
}

- (BOOL)flushToDisk
{
  v3 = [(UARPDynamicAssetCmapDatabase *)self findCmapDatabaseFileUrl];
  if (v3)
  {
    id v15 = 0;
    id v4 = [MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:1 error:&v15];
    id v5 = v15;
    if (!v4)
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
        [(UARPDynamicAssetCmapDatabase *)(uint64_t)v5 flushToDisk];
      }
    }
    char v13 = [v4 writeToURL:v3 atomically:1];
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)decomposeUARP
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  v3 = [[UARPSuperBinaryAsset alloc] initWithURL:self->_url];
  asset = self->_asset;
  self->_asset = v3;

  if (![(UARPSuperBinaryAsset *)self->_asset expandHeadersAndTLVs:0]) {
    return 0;
  }
  id v5 = +[UARPDynamicAssetCmapMapping tag];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = [(UARPSuperBinaryAsset *)self->_asset payloads];
  uint64_t v6 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v11 = [v10 payloadTag];
        int v12 = [v11 tag];
        int v13 = [v5 tag];

        if (v12 == v13)
        {
          [v10 rangePayload];
          uint64_t v15 = -[UARPSuperBinaryAsset payloadData:range:error:](self->_asset, "payloadData:range:error:", v10, 0, v14, 0);
          if (!v15) {
            goto LABEL_18;
          }
          uint64_t v16 = (void *)v15;
          uint64_t v17 = (void *)MEMORY[0x263EFFA08];
          uint64_t v18 = objc_opt_class();
          uint64_t v19 = objc_opt_class();
          uint64_t v20 = objc_opt_class();
          v21 = objc_msgSend(v17, "setWithObjects:", v18, v19, v20, objc_opt_class(), 0);
          uint64_t v22 = [MEMORY[0x263F08928] unarchivedObjectOfClasses:v21 fromData:v16 error:0];
          if (!v22)
          {

LABEL_18:
            BOOL v25 = 0;
            goto LABEL_19;
          }
          v23 = (void *)v22;
          BOOL v24 = [(UARPDynamicAssetCmapDatabase *)self addCmapMapping:v22];

          if (!v24) {
            goto LABEL_18;
          }
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  if (self->_cmapDatabase) {
    [(UARPDynamicAssetCmapDatabase *)self flushToDisk];
  }
  BOOL v25 = 1;
LABEL_19:

  return v25;
}

- (BOOL)addCmapMapping:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"AppleModelNumber"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [(UARPDynamicAssetCmapDatabase *)self findCmapforAppleModel:v5];
    if (v6)
    {
      if ((MGGetBoolAnswer() & 1) == 0)
      {
        uint64_t v20 = [v4 objectForKeyedSubscript:@"sections"];
        char v21 = [v6 appendCmapEvents:v20];

        if ((v21 & 1) == 0)
        {
          log = self->_log;
          if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
            -[UARPDynamicAssetCmapDatabase addCmapMapping:](log, v23, v24, v25, v26, v27, v28, v29);
          }
          BOOL v10 = 0;
          goto LABEL_9;
        }
LABEL_8:
        BOOL v10 = 1;
LABEL_9:

        goto LABEL_13;
      }
      [(NSMutableArray *)self->_cmapDatabase removeObject:v6];
    }
    uint64_t v7 = [UARPDynamicAssetCmapMapping alloc];
    uint64_t v8 = [v4 objectForKeyedSubscript:@"sections"];
    uint64_t v9 = [(UARPDynamicAssetCmapMapping *)v7 initWithEvents:v8 appleModelNumber:v5];

    if (v9) {
      [(NSMutableArray *)self->_cmapDatabase addObject:v9];
    }

    goto LABEL_8;
  }
  uint64_t v11 = self->_log;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[UARPDynamicAssetCmapDatabase addCmapMapping:](v11, v12, v13, v14, v15, v16, v17, v18);
  }
  BOOL v10 = 0;
LABEL_13:

  return v10;
}

- (id)findCmapforAppleModel:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = self->_cmapDatabase;
  id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "isEqualAppleModel:", v4, (void)v11))
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)expandCrshData:(id)a3 withAppleModelNumber:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(UARPDynamicAssetCmapDatabase *)self findCmapforAppleModel:v7];
  uint64_t v9 = v8;
  if (v8)
  {
    BOOL v10 = [v8 expandCrshDictionary:v6];
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      -[UARPDynamicAssetCmapDatabase expandCrshData:withAppleModelNumber:]((uint64_t)v7, log, v12, v13, v14, v15, v16, v17);
    }
    BOOL v10 = 0;
  }

  return v10;
}

- (id)findCmapDatabaseFileUrl
{
  if ([(UARPDynamicAssetCmapDatabase *)self cmapDatabaseFileExists]
    || [(UARPDynamicAssetCmapDatabase *)self createCmapDatabaseFile])
  {
    v3 = NSURL;
    id v4 = UARPStringCmapDatabaseFilePath();
    id v5 = [v3 fileURLWithPath:v4];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (BOOL)createCmapDatabaseFile
{
  v3 = NSURL;
  id v4 = UARPStringCmapDatabaseFilePath();
  id v5 = [v3 fileURLWithPath:v4];

  if ([(UARPDynamicAssetCmapDatabase *)self cmapDatabaseFileExists])
  {
    char v6 = 1;
  }
  else
  {
    id v7 = UARPStringCmapDirectoryPath();
    UARPUtilsCreateTemporaryFolder(v7);

    uint64_t v8 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v9 = UARPStringCmapDatabaseFilePath();
    char v6 = [v8 createFileAtPath:v9 contents:0 attributes:0];

    if ((v6 & 1) == 0)
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
        -[UARPDynamicAssetCmapDatabase createCmapDatabaseFile](log);
      }
    }
  }
  return v6;
}

- (BOOL)cmapDatabaseFileExists
{
  v2 = [MEMORY[0x263F08850] defaultManager];
  v3 = UARPStringCmapDatabaseFilePath();
  char v4 = [v2 fileExistsAtPath:v3];

  return v4;
}

- (BOOL)cleanUpCmapDatabaseFiles
{
  v3 = [MEMORY[0x263F08850] defaultManager];
  char v4 = UARPStringCmapDirectoryPath();
  id v9 = 0;
  char v5 = [v3 removeItemAtPath:v4 error:&v9];
  id v6 = v9;

  if ((v5 & 1) == 0)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      [(UARPDynamicAssetCmapDatabase *)log cleanUpCmapDatabaseFiles];
    }
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_cmapDatabase, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (void)initCmapDatabase:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initCmapDatabase:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)flushToDisk
{
}

- (void)addCmapMapping:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)addCmapMapping:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)expandCrshData:(uint64_t)a3 withAppleModelNumber:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)createCmapDatabaseFile
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1 = a1;
  v2 = UARPStringCmapDatabaseFilePath();
  v3[0] = 136315394;
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_21E079000, v1, OS_LOG_TYPE_ERROR, "%s: Unable to create file at %@", (uint8_t *)v3, 0x16u);
}

- (void)cleanUpCmapDatabaseFiles
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v3 = a1;
  uint64_t v4 = UARPStringCmapDirectoryPath();
  v6[0] = 136315650;
  OUTLINED_FUNCTION_1();
  __int16 v7 = v5;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_21E079000, v3, OS_LOG_TYPE_ERROR, "%s: Unable to remove files at %@ (%@)", (uint8_t *)v6, 0x20u);
}

@end