@interface UARPDynamicAssetTmapDatabase
+ (BOOL)supportsSecureCoding;
- (BOOL)addTmapMapping:(id)a3;
- (BOOL)cleanUpTmapDatabaseFiles;
- (BOOL)createTmapDatabaseFile;
- (BOOL)decomposeUARP;
- (BOOL)flushToDisk;
- (BOOL)tmapDatabaseFileExists;
- (UARPDynamicAssetTmapDatabase)init;
- (UARPDynamicAssetTmapDatabase)initWithCoder:(id)a3;
- (id)expandMticData:(id)a3 withEventID:(unsigned int)a4 appleModelNumber:(id)a5;
- (id)findTmapDatabaseFileUrl;
- (id)findTmapforAppleModel:(id)a3;
- (id)initTmapDatabase:(id)a3;
- (void)cleanUpTmapDatabaseFiles;
- (void)createTmapDatabaseFile;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UARPDynamicAssetTmapDatabase

- (UARPDynamicAssetTmapDatabase)init
{
  return 0;
}

- (id)initTmapDatabase:(id)a3
{
  unint64_t v5 = (unint64_t)a3;
  v26.receiver = self;
  v26.super_class = (Class)UARPDynamicAssetTmapDatabase;
  v6 = [(UARPDynamicAssetTmapDatabase *)&v26 init];
  os_log_t v7 = os_log_create("com.apple.accessoryupdater.uarp", "tmap");
  log = v6->_log;
  v6->_log = (OS_os_log *)v7;

  if ([(UARPDynamicAssetTmapDatabase *)v6 tmapDatabaseFileExists])
  {
    uint64_t v9 = [(UARPDynamicAssetTmapDatabase *)v6 findTmapDatabaseFileUrl];
    if (!v9)
    {
      v17 = v6->_log;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[UARPDynamicAssetTmapDatabase initTmapDatabase:](v17, v18, v19, v20, v21, v22, v23, v24);
      }
      goto LABEL_12;
    }
    v10 = (void *)v9;
    v11 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v9];
    uint64_t v12 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v11 error:0];

    v6 = (UARPDynamicAssetTmapDatabase *)v12;
  }
  tmapDatabase = v6->_tmapDatabase;
  if (!(v5 | (unint64_t)tmapDatabase))
  {
LABEL_12:
    v16 = 0;
    goto LABEL_13;
  }
  if (!tmapDatabase)
  {
    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v15 = v6->_tmapDatabase;
    v6->_tmapDatabase = v14;
  }
  if (v5) {
    objc_storeStrong((id *)&v6->_url, a3);
  }
  v6 = v6;
  v16 = v6;
LABEL_13:

  return v16;
}

- (UARPDynamicAssetTmapDatabase)initWithCoder:(id)a3
{
  v16[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)UARPDynamicAssetTmapDatabase;
  unint64_t v5 = [(UARPDynamicAssetTmapDatabase *)&v15 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    v16[0] = objc_opt_class();
    v16[1] = objc_opt_class();
    os_log_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
    v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"tmap"];

    uint64_t v10 = [v9 mutableCopy];
    tmapDatabase = v5->_tmapDatabase;
    v5->_tmapDatabase = (NSMutableArray *)v10;

    os_log_t v12 = os_log_create("com.apple.accessoryupdater.uarp", "tmap");
    log = v5->_log;
    v5->_log = (OS_os_log *)v12;
  }
  return v5;
}

- (BOOL)flushToDisk
{
  v3 = [(UARPDynamicAssetTmapDatabase *)self findTmapDatabaseFileUrl];
  if (v3)
  {
    id v4 = [MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
    char v5 = [v4 writeToURL:v3 atomically:1];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
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
  char v5 = +[UARPDynamicAssetTmapMapping tag];
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
        v11 = [v10 payloadTag];
        int v12 = [v11 tag];
        int v13 = [v5 tag];

        if (v12 == v13)
        {
          [v10 rangePayload];
          uint64_t v15 = -[UARPSuperBinaryAsset payloadData:range:error:](self->_asset, "payloadData:range:error:", v10, 0, v14, 0);
          if (!v15) {
            goto LABEL_18;
          }
          v16 = (void *)v15;
          v17 = (void *)MEMORY[0x263EFFA08];
          uint64_t v18 = objc_opt_class();
          uint64_t v19 = objc_opt_class();
          uint64_t v20 = objc_opt_class();
          uint64_t v21 = objc_msgSend(v17, "setWithObjects:", v18, v19, v20, objc_opt_class(), 0);
          uint64_t v22 = [MEMORY[0x263F08928] unarchivedObjectOfClasses:v21 fromData:v16 error:0];
          if (!v22)
          {

LABEL_18:
            BOOL v25 = 0;
            goto LABEL_19;
          }
          uint64_t v23 = (void *)v22;
          BOOL v24 = [(UARPDynamicAssetTmapDatabase *)self addTmapMapping:v22];

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

  if (self->_tmapDatabase) {
    [(UARPDynamicAssetTmapDatabase *)self flushToDisk];
  }
  BOOL v25 = 1;
LABEL_19:

  return v25;
}

- (BOOL)addTmapMapping:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    LOWORD(v33) = 0;
    _os_log_impl(&dword_21E079000, log, OS_LOG_TYPE_INFO, "Adding TMAP Mapping", (uint8_t *)&v33, 2u);
  }
  uint64_t v6 = [v4 objectForKeyedSubscript:@"AppleModelNumber"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [v4 objectForKeyedSubscript:@"Endian"];
    if (!v7) {
      uint64_t v7 = @"BigEndian";
    }
    uint64_t v8 = [(UARPDynamicAssetTmapDatabase *)self findTmapforAppleModel:v6];
    if (v8)
    {
      if ((MGGetBoolAnswer() & 1) == 0)
      {
        uint64_t v23 = [v4 objectForKeyedSubscript:@"Events"];
        char v24 = [v8 appendTmapEvents:v23 endian:v7];

        if ((v24 & 1) == 0)
        {
          BOOL v25 = self->_log;
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
            -[UARPDynamicAssetTmapDatabase addTmapMapping:](v25, v26, v27, v28, v29, v30, v31, v32);
          }
          BOOL v13 = 0;
          goto LABEL_15;
        }
LABEL_14:
        BOOL v13 = 1;
LABEL_15:

        goto LABEL_19;
      }
      [(NSMutableArray *)self->_tmapDatabase removeObject:v8];
    }
    uint64_t v9 = [UARPDynamicAssetTmapMapping alloc];
    uint64_t v10 = [v4 objectForKeyedSubscript:@"Events"];
    v11 = [(UARPDynamicAssetTmapMapping *)v9 initWithEvents:v10 appleModelNumber:v6 endian:v7];

    if (v11)
    {
      int v12 = self->_log;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v33 = 138412290;
        v34 = v6;
        _os_log_impl(&dword_21E079000, v12, OS_LOG_TYPE_INFO, "Adding TMAP for Apple Model Number: %@", (uint8_t *)&v33, 0xCu);
      }
      [(NSMutableArray *)self->_tmapDatabase addObject:v11];
    }

    goto LABEL_14;
  }
  uint64_t v14 = self->_log;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    -[UARPDynamicAssetTmapDatabase addTmapMapping:](v14, v15, v16, v17, v18, v19, v20, v21);
  }
  BOOL v13 = 0;
LABEL_19:

  return v13;
}

- (id)findTmapforAppleModel:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  char v5 = self->_tmapDatabase;
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

- (id)expandMticData:(id)a3 withEventID:(unsigned int)a4 appleModelNumber:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  uint64_t v9 = [(UARPDynamicAssetTmapDatabase *)self findTmapforAppleModel:a5];
  uint64_t v10 = v9;
  if (v9)
  {
    long long v11 = [v9 expandMticData:v8 withEventID:v6];
  }
  else
  {
    BOOL v12 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v12) {
      -[UARPDynamicAssetTmapDatabase expandMticData:withEventID:appleModelNumber:](v12, v13, v14, v15, v16, v17, v18, v19);
    }
    long long v11 = 0;
  }

  return v11;
}

- (id)findTmapDatabaseFileUrl
{
  if ([(UARPDynamicAssetTmapDatabase *)self tmapDatabaseFileExists]
    || [(UARPDynamicAssetTmapDatabase *)self createTmapDatabaseFile])
  {
    v3 = NSURL;
    id v4 = UARPStringTmapDatabaseFilePath();
    char v5 = [v3 fileURLWithPath:v4];
  }
  else
  {
    char v5 = 0;
  }
  return v5;
}

- (BOOL)createTmapDatabaseFile
{
  v3 = NSURL;
  id v4 = UARPStringTmapDatabaseFilePath();
  char v5 = [v3 fileURLWithPath:v4];

  if ([(UARPDynamicAssetTmapDatabase *)self tmapDatabaseFileExists])
  {
    char v6 = 1;
  }
  else
  {
    uint64_t v7 = UARPStringTmapDirectoryPath();
    UARPUtilsCreateTemporaryFolder(v7);

    id v8 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v9 = UARPStringTmapDatabaseFilePath();
    char v6 = [v8 createFileAtPath:v9 contents:0 attributes:0];

    if ((v6 & 1) == 0)
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
        -[UARPDynamicAssetTmapDatabase createTmapDatabaseFile](log);
      }
    }
  }
  return v6;
}

- (BOOL)tmapDatabaseFileExists
{
  v2 = [MEMORY[0x263F08850] defaultManager];
  v3 = UARPStringTmapDatabaseFilePath();
  char v4 = [v2 fileExistsAtPath:v3];

  return v4;
}

- (BOOL)cleanUpTmapDatabaseFiles
{
  v3 = [MEMORY[0x263F08850] defaultManager];
  char v4 = UARPStringTmapDirectoryPath();
  id v9 = 0;
  char v5 = [v3 removeItemAtPath:v4 error:&v9];
  id v6 = v9;

  if ((v5 & 1) == 0)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      [(UARPDynamicAssetTmapDatabase *)log cleanUpTmapDatabaseFiles];
    }
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_tmapDatabase, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (void)initTmapDatabase:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)addTmapMapping:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)addTmapMapping:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)expandMticData:(uint64_t)a3 withEventID:(uint64_t)a4 appleModelNumber:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)createTmapDatabaseFile
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1 = a1;
  v2 = UARPStringTmapDatabaseFilePath();
  v3[0] = 136315394;
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_21E079000, v1, OS_LOG_TYPE_ERROR, "%s: Unable to create file at %@", (uint8_t *)v3, 0x16u);
}

- (void)cleanUpTmapDatabaseFiles
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v3 = a1;
  uint64_t v4 = UARPStringTmapDirectoryPath();
  v6[0] = 136315650;
  OUTLINED_FUNCTION_1();
  __int16 v7 = v5;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_21E079000, v3, OS_LOG_TYPE_ERROR, "%s: Unable to remove files at %@ (%@)", (uint8_t *)v6, 0x20u);
}

@end