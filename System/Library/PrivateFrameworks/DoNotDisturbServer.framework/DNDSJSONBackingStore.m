@interface DNDSJSONBackingStore
+ (unint64_t)dataWritingOptionsForSecurityClass:(unint64_t)a3;
- (DNDSBackingStoreDelegate)delegate;
- (DNDSJSONBackingStore)initWithRecordClass:(Class)a3 fileURL:(id)a4 secureFileURL:(id)a5 versionNumber:(unint64_t)a6 securityClass:(unint64_t)a7;
- (DNDSJSONBackingStore)initWithRecordClass:(Class)a3 fileURL:(id)a4 versionNumber:(unint64_t)a5;
- (NSString)sysdiagnoseDataIdentifier;
- (id)readRecordDictionaryfromURL:(id)a3 withError:(id *)a4;
- (id)readRecordWithError:(id *)a3;
- (id)sysdiagnoseDataForDate:(id)a3 redacted:(BOOL)a4;
- (unint64_t)writeRecord:(id)a3 error:(id *)a4;
- (unint64_t)writeRecord:(id)a3 writePartition:(BOOL)a4 error:(id *)a5;
- (unint64_t)writeRecordDictionary:(id)a3 withSecurityClass:(unint64_t)a4 toURL:(id)a5 error:(id *)a6;
- (void)dealloc;
- (void)setDelegate:(id)a3;
@end

@implementation DNDSJSONBackingStore

- (DNDSJSONBackingStore)initWithRecordClass:(Class)a3 fileURL:(id)a4 versionNumber:(unint64_t)a5
{
  return [(DNDSJSONBackingStore *)self initWithRecordClass:a3 fileURL:a4 secureFileURL:0 versionNumber:a5 securityClass:3];
}

- (DNDSJSONBackingStore)initWithRecordClass:(Class)a3 fileURL:(id)a4 secureFileURL:(id)a5 versionNumber:(unint64_t)a6 securityClass:(unint64_t)a7
{
  id v12 = a4;
  id v13 = a5;
  v21.receiver = self;
  v21.super_class = (Class)DNDSJSONBackingStore;
  v14 = [(DNDSJSONBackingStore *)&v21 init];
  v15 = v14;
  if (v14)
  {
    v14->_recordClass = a3;
    uint64_t v16 = [v12 copy];
    fileURL = v15->_fileURL;
    v15->_fileURL = (NSURL *)v16;

    uint64_t v18 = [v13 copy];
    secureFileURL = v15->_secureFileURL;
    v15->_secureFileURL = (NSURL *)v18;

    v15->_versionNumber = a6;
    v15->_securityClass = a7;
    DNDSRegisterSysdiagnoseDataProvider(v15);
  }

  return v15;
}

- (void)dealloc
{
  DNDSUnregisterSysdiagnoseDataProvider(self);
  v3.receiver = self;
  v3.super_class = (Class)DNDSJSONBackingStore;
  [(DNDSJSONBackingStore *)&v3 dealloc];
}

- (id)readRecordWithError:(id *)a3
{
  v5 = objc_alloc_init(DNDSApplicationIdentifierMapper);
  v6 = objc_alloc_init(DNDSContactProvider);
  v7 = [(DNDSJSONBackingStore *)self readRecordDictionaryfromURL:self->_fileURL withError:a3];
  if (self->_secureFileURL
    && [(objc_class *)self->_recordClass conformsToProtocol:&unk_1F2A66080])
  {
    v8 = [[DNDSBackingStoreDictionaryContext alloc] initWithDestination:1 partitionType:3 redactSensitiveData:0 contactProvider:v6 applicationIdentifierMapper:v5];
    v9 = [(DNDSJSONBackingStore *)self readRecordDictionaryfromURL:self->_secureFileURL withError:a3];
    v10 = (void *)[(objc_class *)self->_recordClass newWithDictionaryRepresentation:v7 partitionedDictionaryRepresentation:v9 context:v8];
  }
  else
  {
    v8 = [[DNDSBackingStoreDictionaryContext alloc] initWithDestination:1 partitionType:1 redactSensitiveData:0 contactProvider:v6 applicationIdentifierMapper:v5];
    v10 = (void *)[(objc_class *)self->_recordClass newWithDictionaryRepresentation:v7 context:v8];
  }

  return v10;
}

- (unint64_t)writeRecord:(id)a3 error:(id *)a4
{
  return [(DNDSJSONBackingStore *)self writeRecord:a3 writePartition:1 error:a4];
}

- (unint64_t)writeRecord:(id)a3 writePartition:(BOOL)a4 error:(id *)a5
{
  BOOL v5 = a4;
  id v7 = a3;
  self->_deviceOutOfSpace = 0;
  objc_super v21 = (void *)MEMORY[0x1D9430630]();
  v8 = objc_alloc_init(DNDSApplicationIdentifierMapper);
  v9 = objc_alloc_init(DNDSContactProvider);
  v10 = [[DNDSBackingStoreDictionaryContext alloc] initWithDestination:1 partitionType:1 redactSensitiveData:0 contactProvider:v9 applicationIdentifierMapper:v8];
  v11 = [v7 dictionaryRepresentationWithContext:v10];
  fileURL = self->_fileURL;
  id v24 = 0;
  unint64_t v13 = [(DNDSJSONBackingStore *)self writeRecordDictionary:v11 withSecurityClass:3 toURL:fileURL error:&v24];
  id v14 = v24;
  if (v5 && v13 == 2)
  {
    if (self->_secureFileURL)
    {
      v15 = [[DNDSBackingStoreDictionaryContext alloc] initWithDestination:1 partitionType:2 redactSensitiveData:0 contactProvider:v9 applicationIdentifierMapper:v8];

      uint64_t v16 = [v7 dictionaryRepresentationWithContext:v15];
      unint64_t securityClass = self->_securityClass;
      secureFileURL = self->_secureFileURL;
      id v23 = v14;
      unint64_t v13 = [(DNDSJSONBackingStore *)self writeRecordDictionary:v16 withSecurityClass:securityClass toURL:secureFileURL error:&v23];
      id v19 = v23;

      v10 = v15;
      id v14 = v19;
    }
    else
    {
      unint64_t v13 = 2;
    }
  }

  if (a5) {
    *a5 = v14;
  }

  return v13;
}

- (id)readRecordDictionaryfromURL:(id)a3 withError:(id *)a4
{
  v43[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  v8 = [v6 path];
  int v9 = [v7 fileExistsAtPath:v8];

  if (v9)
  {
    v10 = (void *)MEMORY[0x1D9430630]();
    id v41 = 0;
    v11 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v6 options:0 error:&v41];
    uint64_t v12 = (uint64_t)v41;
    if (!v11)
    {
      unint64_t v14 = 0;
      id v18 = 0;
      goto LABEL_28;
    }
    id v40 = 0;
    unint64_t v13 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v11 options:0 error:&v40];
    unint64_t v14 = (unint64_t)v40;
    if (!v13)
    {
      id v18 = 0;
LABEL_27:

LABEL_28:
      if (!a4) {
        goto LABEL_34;
      }
      goto LABEL_29;
    }
    v39 = v10;
    uint64_t v15 = objc_opt_class();
    id v16 = v13;
    v38 = v13;
    if (v15)
    {
      if (objc_opt_isKindOfClass()) {
        v17 = v16;
      }
      else {
        v17 = 0;
      }
    }
    else
    {
      v17 = 0;
    }
    id v19 = v17;

    v36 = objc_msgSend(v19, "bs_safeObjectForKey:ofType:", @"header", objc_opt_class());
    v35 = objc_msgSend(v36, "bs_safeObjectForKey:ofType:", @"version", objc_opt_class());
    unint64_t v20 = [v35 integerValue];
    v37 = v19;
    if (v20 <= self->_versionNumber)
    {
      v34 = objc_msgSend(v19, "bs_safeObjectForKey:ofType:", @"data", objc_opt_class());
      v26 = [v34 firstObject];
      uint64_t v27 = objc_opt_class();
      id v28 = v26;
      if (v27)
      {
        if (objc_opt_isKindOfClass()) {
          v29 = v28;
        }
        else {
          v29 = 0;
        }
      }
      else
      {
        v29 = 0;
      }
      id v18 = v29;

      if (v20 >= self->_versionNumber)
      {
        unint64_t v13 = v38;
        id v24 = v34;
        goto LABEL_26;
      }
      v25 = [(DNDSJSONBackingStore *)self delegate];
      uint64_t v30 = [v25 backingStore:self migrateDictionaryRepresentation:v18 fromVersionNumber:v20 toVersionNumber:self->_versionNumber];

      id v18 = (id)v30;
      id v24 = v34;
    }
    else
    {
      objc_super v21 = DNDSLogGeneral;
      if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_ERROR)) {
        -[DNDSJSONBackingStore readRecordDictionaryfromURL:withError:]((uint64_t *)&self->_versionNumber, v20, v21);
      }
      v22 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v23 = *MEMORY[0x1E4F5F528];
      uint64_t v42 = *MEMORY[0x1E4F28568];
      v43[0] = @"Unexpected version number";
      id v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:&v42 count:1];
      [v22 errorWithDomain:v23 code:1006 userInfo:v24];
      id v18 = 0;
      uint64_t v12 = v25 = (void *)v12;
    }

    unint64_t v13 = v38;
LABEL_26:

    v10 = v39;
    goto LABEL_27;
  }
  unint64_t v14 = 0;
  uint64_t v12 = 0;
  id v18 = 0;
  if (!a4) {
    goto LABEL_34;
  }
LABEL_29:
  if (v12 | v14)
  {
    if (v12) {
      v31 = (void *)v12;
    }
    else {
      v31 = (void *)v14;
    }
    *a4 = v31;
  }
LABEL_34:
  id v32 = v18;

  return v32;
}

- (unint64_t)writeRecordDictionary:(id)a3 withSecurityClass:(unint64_t)a4 toURL:(id)a5 error:(id *)a6
{
  v44[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  self->_deviceOutOfSpace = 0;
  context = (void *)MEMORY[0x1D9430630]();
  v44[0] = v9;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:1];
  v42[0] = @"header";
  v40[0] = @"version";
  uint64_t v12 = [NSNumber numberWithUnsignedInteger:self->_versionNumber];
  v40[1] = @"timestamp";
  v41[0] = v12;
  unint64_t v13 = NSNumber;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  unint64_t v14 = objc_msgSend(v13, "numberWithDouble:");
  v41[1] = v14;
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:2];
  v42[1] = @"data";
  v43[0] = v15;
  v43[1] = v11;
  id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:2];

  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v16])
  {
    v34 = a6;
    id v39 = 0;
    v17 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v16 options:0 error:&v39];
    id v18 = v39;
    if (!v17)
    {
      uint64_t v27 = 0;
      id v24 = 0;
      unint64_t v28 = 0;
LABEL_17:

      a6 = v34;
      goto LABEL_18;
    }
    id v19 = [MEMORY[0x1E4F28CB8] defaultManager];
    unint64_t v20 = [v10 path];
    char v21 = [v19 fileExistsAtPath:v20];

    v33 = v19;
    if ((v21 & 1) == 0)
    {
      v22 = [v10 URLByDeletingLastPathComponent];
      uint64_t v23 = [v22 path];

      if (![v19 fileExistsAtPath:v23 isDirectory:0])
      {
        id v38 = 0;
        int v29 = [v19 createDirectoryAtPath:v23 withIntermediateDirectories:1 attributes:0 error:&v38];
        id v24 = v38;

        if (!v29)
        {
          uint64_t v27 = 0;
          goto LABEL_15;
        }
LABEL_7:
        id v37 = 0;
        char v25 = objc_msgSend(v17, "writeToURL:options:error:", v10, objc_msgSend((id)objc_opt_class(), "dataWritingOptionsForSecurityClass:", a4), &v37);
        id v26 = v37;
        uint64_t v27 = v26;
        if (v25)
        {
          unint64_t v28 = 2;
LABEL_16:

          goto LABEL_17;
        }
        if (objc_msgSend(v26, "dnds_isOutOfSpaceError"))
        {
          unint64_t v28 = 1;
          self->_deviceOutOfSpace = 1;
          goto LABEL_16;
        }
LABEL_15:
        unint64_t v28 = 0;
        goto LABEL_16;
      }
    }
    id v24 = 0;
    goto LABEL_7;
  }
  uint64_t v27 = 0;
  id v24 = 0;
  id v18 = 0;
  unint64_t v28 = 0;
LABEL_18:

  if (a6 && (v27 || v24 || v18))
  {
    if (v24) {
      id v30 = v24;
    }
    else {
      id v30 = v18;
    }
    if (v27) {
      v31 = v27;
    }
    else {
      v31 = v30;
    }
    *a6 = v31;
  }

  return v28;
}

+ (unint64_t)dataWritingOptionsForSecurityClass:(unint64_t)a3
{
  if (a3 > 3) {
    return 1;
  }
  else {
    return qword_1D3121F10[a3];
  }
}

- (NSString)sysdiagnoseDataIdentifier
{
  return (NSString *)@"com.apple.donotdisturb.server.JSONBackingStore";
}

- (id)sysdiagnoseDataForDate:(id)a3 redacted:(BOOL)a4
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v7 = @"deviceOutOfSpace";
  v4 = objc_msgSend(NSNumber, "numberWithBool:", self->_deviceOutOfSpace, a4);
  v8[0] = v4;
  BOOL v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return v5;
}

- (DNDSBackingStoreDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DNDSBackingStoreDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_secureFileURL, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

- (void)readRecordDictionaryfromURL:(os_log_t)log withError:.cold.1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 134349312;
  uint64_t v5 = a2;
  __int16 v6 = 2050;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_1D3052000, log, OS_LOG_TYPE_ERROR, "Unexpected version number %{public}llu (maximum version number %{public}llu)", (uint8_t *)&v4, 0x16u);
}

@end