@interface _CSVisualizationArchiver
+ (void)beginProvidingVisualizationArchivesWithMachServiceName:(id)a3 queue:(id)a4 creatingVisualizersWithBlock:(id)a5;
+ (void)processCommandFromConnection:(void *)a3 fileHandle:(__sFILE *)a4 providerBlock:(id)a5;
+ (void)provideVisualizerToConnection:(void *)a3 fileHandle:(__sFILE *)a4 providerBlock:(id)a5;
- (BOOL)fwrite:(const void *)a3 size:(unint64_t)a4 numberOfItems:(unint64_t)a5 error:(id *)a6;
- (BOOL)writeDictionary:(id)a3 error:(id *)a4;
- (BOOL)writeMetadata:(id)a3 forStore:(__CSStore *)a4 error:(id *)a5;
- (NSPredicate)unitDescriptionPredicate;
- (_CSVisualizationArchiver)initWithVisualizer:(id)a3 fileHandle:(__sFILE *)a4 closeWhenDone:(BOOL)a5 allowCompression:(BOOL)a6 error:(id *)a7;
- (_CSVisualizationArchiver)initWithVisualizer:(id)a3 fileHandle:(__sFILE *)a4 closeWhenDone:(BOOL)a5 error:(id *)a6;
- (_CSVisualizer)visualizer;
- (void)dealloc;
- (void)finishWriting;
- (void)getWriteUnitState:(_CSWriteUnitState *)a3 forTable:(unsigned int)a4;
- (void)setUnitDescriptionPredicate:(id)a3;
- (void)writeAllUnitsInTable:(unsigned int)a3 block:(id)a4;
- (void)writeAllUnitsWithBlock:(id)a3;
- (void)writeUnit:(unsigned int)a3 inTable:(unsigned int)a4;
- (void)writeUnit:(unsigned int)a3 inTable:(unsigned int)a4 state:(const _CSWriteUnitState *)a5;
@end

@implementation _CSVisualizationArchiver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitDescriptionPredicate, 0);

  objc_storeStrong((id *)&self->_visualizer, 0);
}

- (NSPredicate)unitDescriptionPredicate
{
  return self->_unitDescriptionPredicate;
}

- (_CSVisualizer)visualizer
{
  return (_CSVisualizer *)objc_getProperty(self, a2, 40, 1);
}

- (void)setUnitDescriptionPredicate:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_unitDescriptionPredicate, a3);
  if (v5)
  {
    v9 = @"predicate";
    v6 = [v5 predicateFormat];
    v10[0] = v6;
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    v8 = [(_CSVisualizationArchiver *)self visualizer];
    -[_CSVisualizationArchiver writeMetadata:forStore:error:](self, "writeMetadata:forStore:error:", v7, [v8 store], 0);
  }
}

- (void)finishWriting
{
  fileHandle = self->_fileHandle;
  if (fileHandle)
  {
    fflush(fileHandle);
    if (self->_closeWhenDone) {
      fclose(self->_fileHandle);
    }
    self->_fileHandle = 0;
  }
}

- (void)writeAllUnitsWithBlock:(id)a3
{
  id v5 = a3;
  v6 = [(_CSVisualizationArchiver *)self visualizer];
  uint64_t v7 = [v6 store];

  if (!v7)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"CSVisualizationArchiver.mm" lineNumber:489 description:@"Missing CSStore"];
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __51___CSVisualizationArchiver_writeAllUnitsWithBlock___block_invoke;
  v10[3] = &unk_1E5D2A2E0;
  v10[4] = self;
  id v8 = v5;
  id v11 = v8;
  _CSStoreEnumerateTables(v7, v10);
}

- (void)writeAllUnitsInTable:(unsigned int)a3 block:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  v28 = self;
  unsigned int v27 = a3;
  id v26 = a4;
  uint64_t v7 = [(_CSVisualizationArchiver *)self visualizer];
  uint64_t v8 = [v7 store];

  if (v8)
  {
    uint64_t v9 = 4294929780;
  }
  else
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"CSVisualizationArchiver.mm" lineNumber:444 description:@"Missing CSStore"];

    uint64_t v9 = 0;
  }
  [(_CSVisualizationArchiver *)self writeUnit:v4 inTable:v9];
  v23 = 0;
  v24 = 0;
  uint64_t v25 = 0;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3321888768;
  v22[2] = __55___CSVisualizationArchiver_writeAllUnitsInTable_block___block_invoke;
  v22[3] = &__block_descriptor_40_ea8_32c68_ZTSKZ55___CSVisualizationArchiver_writeAllUnitsInTable_block__E3__0_e19_v32__0I8r_v12I20_24l;
  v22[4] = &v23;
  _CSStoreEnumerateUnits(v8, v4, v22);
  long long v20 = 0u;
  long long v21 = 0u;
  [(_CSVisualizationArchiver *)self getWriteUnitState:&v20 forTable:v4];
  id v10 = [NSString alloc];
  id v11 = (__CFString *)_CSStoreCopyTableName(v8, v4);
  v12 = (void *)[v10 initWithFormat:@"_CSVisualizationArchiver queue for table %@", v11];

  id v13 = v12;
  v14 = (const char *)[v13 UTF8String];
  v15 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E4F14430], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v16 = dispatch_queue_create(v14, v15);

  char v19 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3321888768;
  block[2] = __55___CSVisualizationArchiver_writeAllUnitsInTable_block___block_invoke_83;
  block[3] = &__block_descriptor_80_ea8_32c68_ZTSKZ55___CSVisualizationArchiver_writeAllUnitsInTable_block__E3__1_e8_v16__0Q8l;
  block[4] = &v19;
  block[5] = &v23;
  block[6] = &v28;
  block[7] = &v27;
  block[8] = &v20;
  block[9] = &v26;
  dispatch_apply((v24 - v23) >> 2, v16, block);

  if (v23)
  {
    v24 = v23;
    operator delete(v23);
  }
}

- (void)writeUnit:(unsigned int)a3 inTable:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  long long v7 = 0u;
  long long v8 = 0u;
  -[_CSVisualizationArchiver getWriteUnitState:forTable:](self, "getWriteUnitState:forTable:", &v7);
  [(_CSVisualizationArchiver *)self writeUnit:v5 inTable:v4 state:&v7];
}

- (void)writeUnit:(unsigned int)a3 inTable:(unsigned int)a4 state:(const _CSWriteUnitState *)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v7 = *(void *)&a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = (void *)MEMORY[0x1AD0DB160](self, a2);
  id v10 = (*((void (**)(void))a5->var2 + 2))();
  if (!v10 || (id var3 = a5->var3) == 0 || [var3 evaluateWithObject:v10])
  {
    v12 = [MEMORY[0x1E4F1CA60] dictionary];
    id v13 = [NSNumber numberWithUnsignedInt:v7];
    [v12 setObject:v13 forKeyedSubscript:@"u"];

    v14 = [NSNumber numberWithUnsignedInt:v6];
    [v12 setObject:v14 forKeyedSubscript:@"t"];

    v15 = (*((void (**)(void))a5->var1 + 2))();
    if (v15) {
      [v12 setObject:v15 forKeyedSubscript:@"s"];
    }

    if (v10) {
      [v12 setObject:v10 forKeyedSubscript:@"d"];
    }
    id v20 = 0;
    BOOL v16 = [(_CSVisualizationArchiver *)self writeDictionary:v12 error:&v20];
    v17 = (CSStore2 *)v20;
    v18 = v17;
    if (!v16)
    {
      char v19 = CSStore2::GetLog(v17);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218498;
        uint64_t v22 = v7;
        __int16 v23 = 2048;
        uint64_t v24 = v6;
        __int16 v25 = 2114;
        id v26 = v18;
        _os_log_error_impl(&dword_1A7DB2000, v19, OS_LOG_TYPE_ERROR, "Failed to convert description of unit %llu in table %llu to data: %{public}@", buf, 0x20u);
      }
    }
  }
}

- (void)getWriteUnitState:(_CSWriteUnitState *)a3 forTable:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v7 = [(_CSVisualizationArchiver *)self visualizer];
  objc_storeStrong(&a3->var0, v7);
  long long v8 = [(_CSVisualizationArchiver *)self unitDescriptionPredicate];
  id var3 = a3->var3;
  a3->id var3 = v8;

  id v10 = [v7 functionsForTable:v4];
  id v11 = [v10 getSummary];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __55___CSVisualizationArchiver_getWriteUnitState_forTable___block_invoke;
  v21[3] = &unk_1E5D2ABA8;
  id v12 = v11;
  id v22 = v12;
  id v13 = (void *)MEMORY[0x1AD0DB340](v21);
  id var1 = a3->var1;
  a3->id var1 = v13;

  v15 = [v10 getDescription];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __55___CSVisualizationArchiver_getWriteUnitState_forTable___block_invoke_2;
  v19[3] = &unk_1E5D2ABD0;
  id v20 = v15;
  id v16 = v15;
  v17 = (void *)MEMORY[0x1AD0DB340](v19);
  id var2 = a3->var2;
  a3->id var2 = v17;
}

- (BOOL)fwrite:(const void *)a3 size:(unint64_t)a4 numberOfItems:(unint64_t)a5 error:(id *)a6
{
  uint64_t v7 = (__CFString *)a5;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  size_t v9 = fwrite(a3, a4, a5, self->_fileHandle);
  fileHandle = self->_fileHandle;
  if ((__CFString *)v9 == v7 && !ferror(self->_fileHandle)) {
    return 1;
  }
  id v11 = (void *)MEMORY[0x1E4F28798];
  if ((int (__cdecl *)(gzFile))fileHandle->_close == CSStore2::closeGzipFile)
  {
    int errnum = 0;
    id v16 = gzerror((gzFile)fileHandle->_cookie, &errnum);
    uint64_t v17 = errnum;
    if (errnum == -1)
    {
      id v22 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v23 = *__error();
      uint64_t v27 = *MEMORY[0x1E4F28228];
      v28 = @"Line";
      v29 = @"errno";
      v30 = &unk_1EFE43380;
      uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v27 count:2];
      v15 = [v22 errorWithDomain:*v11 code:v23 userInfo:v7];
    }
    else
    {
      if (errnum < 2)
      {
        v15 = 0;
        goto LABEL_16;
      }
      v18 = v16;
      char v19 = (void *)MEMORY[0x1E4F28C58];
      if (v16)
      {
        uint64_t v27 = *MEMORY[0x1E4F28568];
        uint64_t v7 = [NSString stringWithUTF8String:v16];
        v29 = v7;
        id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v27 count:1];
      }
      else
      {
        id v20 = 0;
      }
      v15 = [v19 errorWithDomain:@"Z" code:v17 userInfo:v20];
      if (!v18) {
        goto LABEL_16;
      }
    }
    goto LABEL_16;
  }
  id v12 = (void *)MEMORY[0x1E4F28C58];
  int v13 = *__error();
  uint64_t v27 = *MEMORY[0x1E4F28228];
  v28 = @"Line";
  v29 = @"errno";
  v30 = &unk_1EFE43398;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v27 count:2];
  v15 = [v12 errorWithDomain:*v11 code:v13 userInfo:v14];

LABEL_16:
  if (a6) {
    *a6 = v15;
  }
  if ([v15 code] == 32)
  {
    uint64_t v24 = [v15 domain];
    int v25 = [v24 isEqual:*v11];

    if (v25) {
      atomic_store(1u, (unsigned __int8 *)&self->_hadEPIPE);
    }
  }

  return 0;
}

- (BOOL)writeDictionary:(id)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void *)[v6 copy];

  long long v8 = (void *)MEMORY[0x1AD0DB160]();
  size_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  id v10 = v9;
  if (self->_outputAsXML) {
    [v9 setOutputFormat:100];
  }
  [v10 encodeObject:v7 forKey:*MEMORY[0x1E4F284E8]];
  [v10 finishEncoding];
  id v11 = [v10 encodedData];

  if (!v11)
  {
    id v16 = 0;
    BOOL v19 = 0;
    if (!a4) {
      goto LABEL_17;
    }
    goto LABEL_15;
  }
  id v12 = (CSStore2 *)[v11 length];
  uint64_t v23 = v12;
  int v13 = CSStore2::GetLog(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    uint64_t v25 = 8;
    __int16 v26 = 2048;
    uint64_t v27 = v12;
    _os_log_debug_impl(&dword_1A7DB2000, v13, OS_LOG_TYPE_DEBUG, "Writing %llu+%llu bytes to gzip stream", buf, 0x16u);
  }

  p_dictWriteLock = &self->_dictWriteLock;
  os_unfair_lock_lock(&self->_dictWriteLock);
  id v22 = 0;
  BOOL v15 = [(_CSVisualizationArchiver *)self fwrite:&v23 size:8 numberOfItems:1 error:&v22];
  id v16 = v22;
  if (v15)
  {
    id v17 = v11;
    id v21 = v16;
    LODWORD(v17) = -[_CSVisualizationArchiver fwrite:size:numberOfItems:error:](self, "fwrite:size:numberOfItems:error:", [v17 bytes], objc_msgSend(v17, "length"), 1, &v21);
    id v18 = v21;

    if (v17)
    {
      fflush(self->_fileHandle);
      BOOL v19 = 1;
    }
    else
    {
      BOOL v19 = 0;
    }
    id v16 = v18;
  }
  else
  {
    BOOL v19 = 0;
  }
  os_unfair_lock_unlock(p_dictWriteLock);
  if (a4)
  {
LABEL_15:
    if (!v19) {
      *a4 = v16;
    }
  }
LABEL_17:

  return v19;
}

- (BOOL)writeMetadata:(id)a3 forStore:(__CSStore *)a4 error:(id *)a5
{
  id v8 = a3;
  size_t v9 = (void *)MEMORY[0x1AD0DB160]();
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v10 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"metadata"];
  if (v8)
  {
    [v10 addEntriesFromDictionary:v8];
  }
  else
  {
    BundleWithIdentifier = CFBundleGetBundleWithIdentifier(@"com.apple.CSStore");
    if (BundleWithIdentifier) {
      objc_msgSend(v10, "setObject:forKeyedSubscript:", CFBundleGetValueForInfoDictionaryKey(BundleWithIdentifier, (CFStringRef)*MEMORY[0x1E4F1D020]), @"framework-version");
    }
    id v12 = (void *)_CFCopySystemVersionDictionary();
    int v13 = v12;
    if (v12)
    {
      v14 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F1CD18]];
      [v10 setObject:v14 forKeyedSubscript:@"os"];

      BOOL v15 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F1CD30]];
      [v10 setObject:v15 forKeyedSubscript:@"os-version"];

      id v16 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F1CD10]];
      [v10 setObject:v16 forKeyedSubscript:@"os-build"];
    }
    if (a4) {
      unsigned int v17 = -37516;
    }
    else {
      unsigned int v17 = 0;
    }
    id v18 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", CSStoreGetUnitCount((uint64_t)a4, v17));
    [v10 setObject:v18 forKeyedSubscript:@"tableCount"];

    BOOL v19 = [(_CSVisualizationArchiver *)self visualizer];
    id v20 = [v19 breakDownUsage];

    if (v20) {
      [v10 setObject:v20 forKeyedSubscript:@"breakdown"];
    }
  }
  id v25 = 0;
  BOOL v21 = [(_CSVisualizationArchiver *)self writeDictionary:v10 error:&v25];
  id v22 = v25;

  if (a5) {
    char v23 = v21;
  }
  else {
    char v23 = 1;
  }
  if ((v23 & 1) == 0) {
    *a5 = v22;
  }

  return v21;
}

- (void)dealloc
{
  fileHandle = self->_fileHandle;
  if (fileHandle && self->_closeWhenDone) {
    fclose(fileHandle);
  }
  v4.receiver = self;
  v4.super_class = (Class)_CSVisualizationArchiver;
  [(_CSVisualizationArchiver *)&v4 dealloc];
}

- (_CSVisualizationArchiver)initWithVisualizer:(id)a3 fileHandle:(__sFILE *)a4 closeWhenDone:(BOOL)a5 error:(id *)a6
{
  return [(_CSVisualizationArchiver *)self initWithVisualizer:a3 fileHandle:a4 closeWhenDone:a5 allowCompression:1 error:a6];
}

- (_CSVisualizationArchiver)initWithVisualizer:(id)a3 fileHandle:(__sFILE *)a4 closeWhenDone:(BOOL)a5 allowCompression:(BOOL)a6 error:(id *)a7
{
  BOOL v9 = a5;
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  v74.receiver = self;
  v74.super_class = (Class)_CSVisualizationArchiver;
  BOOL v15 = [(_CSVisualizationArchiver *)&v74 init];
  if (!v14)
  {
    v68 = [MEMORY[0x1E4F28B00] currentHandler];
    [v68 handleFailureInMethod:a2, v15, @"CSVisualizationArchiver.mm", 151, @"Invalid parameter not satisfying: %@", @"visualizer != nil" object file lineNumber description];
  }
  if (!a4)
  {
    v69 = [MEMORY[0x1E4F28B00] currentHandler];
    [v69 handleFailureInMethod:a2, v15, @"CSVisualizationArchiver.mm", 152, @"Invalid parameter not satisfying: %@", @"fileHandle != NULL" object file lineNumber description];
  }
  if (!v15)
  {
    BOOL v19 = (void *)MEMORY[0x1E4F28C58];
    v75[0] = *MEMORY[0x1E4F28228];
    v75[1] = @"Line";
    v76[0] = @"ENOMEM";
    v76[1] = &unk_1EFE43368;
    id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v76 forKeys:v75 count:2];
    id v21 = [v19 errorWithDomain:*MEMORY[0x1E4F28798] code:12 userInfo:v20];

    goto LABEL_11;
  }
  objc_storeStrong((id *)&v15->_visualizer, a3);
  *(void *)__str = 0;
  uint64_t v84 = 0;
  id v16 = getenv("CS_VISUALIZATION_COMPRESSION_LEVEL");
  if (v16)
  {
    unint64_t v17 = strtoul(v16, 0, 0);
    uint64_t v18 = 9;
    if (v17 < 9) {
      uint64_t v18 = v17;
    }
  }
  else
  {
    uint64_t v18 = 6;
  }
  snprintf(__str, 0x10uLL, "%cb%lu", 119, v18);
  id v22 = (CSStore2 *)fileno(a4);
  if ((v22 & 0x80000000) != 0)
  {
    v30 = CSStore2::GetLog(v22);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = a4;
      _os_log_impl(&dword_1A7DB2000, v30, OS_LOG_TYPE_INFO, "File handle %p passed to _CSVisualization[Un]Archiver is not backed by a file descriptor. Will not compress/decompress.", buf, 0xCu);
    }

    uint64_t v27 = 0;
    if (a4) {
      goto LABEL_48;
    }
LABEL_23:
    id v31 = v27;
    a4 = 0;
    uint64_t v27 = v31;
    goto LABEL_49;
  }
  int v23 = (int)v22;
  if (a6)
  {
    int v23 = dup((int)v22);
    if (v23 < 0)
    {
      uint64_t v24 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v25 = *__error();
      *(void *)&long long v80 = *MEMORY[0x1E4F28228];
      *((void *)&v80 + 1) = @"Line";
      v81 = @"errno";
      v82 = (__CFString *)&unk_1EFE433B0;
      __int16 v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v81 forKeys:&v80 count:2];
      uint64_t v27 = [v24 errorWithDomain:*MEMORY[0x1E4F28798] code:v25 userInfo:v26];

      v29 = CSStore2::GetLog(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        int v62 = *__error();
        v63 = __error();
        v64 = strerror(*v63);
        *(_DWORD *)buf = 136446722;
        *(void *)&uint8_t buf[4] = "writing";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v62;
        __int16 v78 = 2080;
        v79 = v64;
        _os_log_error_impl(&dword_1A7DB2000, v29, OS_LOG_TYPE_ERROR, "Error duplicating file descriptor for %{public}s: %i (%s)", buf, 0x1Cu);
      }

      goto LABEL_39;
    }
  }
  else
  {
    v32 = CSStore2::GetLog(v22);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = a4;
      _os_log_impl(&dword_1A7DB2000, v32, OS_LOG_TYPE_INFO, "Disabling compression for file handle %p passed to _CSVisualization[Un]Archiver. Will not compress/decompress.", buf, 0xCu);
    }

    if (a4)
    {
      id v31 = 0;
      uint64_t v27 = 0;
      goto LABEL_49;
    }
  }
  *__error() = 0;
  gzFile v33 = gzdopen(v23, __str);
  v34 = v33;
  if (!v33)
  {
    int v36 = *__error();
    v70 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v37 = *MEMORY[0x1E4F28798];
    if (v36)
    {
      *(void *)&long long v80 = *MEMORY[0x1E4F28228];
      *((void *)&v80 + 1) = @"Line";
      v81 = @"errnum";
      v82 = (__CFString *)&unk_1EFE433E0;
      v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v81 forKeys:&v80 count:2];
      uint64_t v27 = [v70 errorWithDomain:v37 code:v36 userInfo:v38];

      v40 = CSStore2::GetLog(v39);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        v41 = strerror(v36);
        *(_DWORD *)buf = 136446722;
        *(void *)&uint8_t buf[4] = "writing";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v36;
        __int16 v78 = 2080;
        v79 = v41;
        v42 = "Error opening file handle for %{public}s with gzdopen(): %i (%s)";
        v43 = buf;
        v44 = v40;
        uint32_t v45 = 28;
LABEL_67:
        _os_log_error_impl(&dword_1A7DB2000, v44, OS_LOG_TYPE_ERROR, v42, v43, v45);
      }
    }
    else
    {
      v81 = (__CFString *)*MEMORY[0x1E4F28228];
      v82 = @"Line";
      *(void *)buf = @"ENOMEM";
      *(void *)&buf[8] = &unk_1EFE433F8;
      v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v81 count:2];
      uint64_t v27 = [v70 errorWithDomain:v37 code:12 userInfo:v50];

      v40 = CSStore2::GetLog(v51);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        LODWORD(v80) = 136446210;
        *(void *)((char *)&v80 + 4) = "writing";
        v42 = "Unknown error opening file handle for %{public}s with gzdopen()";
        v43 = (uint8_t *)&v80;
        v44 = v40;
        uint32_t v45 = 12;
        goto LABEL_67;
      }
    }

    close(v23);
    goto LABEL_39;
  }
  v35 = funopen(v33, (int (__cdecl *)(void *, char *, int))CSStore2::readFromGzipFile, (int (__cdecl *)(void *, const char *, int))CSStore2::writeToGzipFile, 0, (int (__cdecl *)(void *))CSStore2::closeGzipFile);
  if (v35)
  {
    uint64_t v27 = 0;
    goto LABEL_40;
  }
  v46 = (void *)MEMORY[0x1E4F28C58];
  *(void *)&long long v80 = *MEMORY[0x1E4F28228];
  *((void *)&v80 + 1) = @"Line";
  v81 = @"ENOMEM";
  v82 = (__CFString *)&unk_1EFE433C8;
  v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v81 forKeys:&v80 count:2];
  uint64_t v27 = [v46 errorWithDomain:*MEMORY[0x1E4F28798] code:12 userInfo:v47];

  v49 = CSStore2::GetLog(v48);
  if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
  {
    int v65 = *__error();
    v66 = __error();
    v67 = strerror(*v66);
    *(_DWORD *)buf = 136446722;
    *(void *)&uint8_t buf[4] = "writing";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v65;
    __int16 v78 = 2080;
    v79 = v67;
    _os_log_error_impl(&dword_1A7DB2000, v49, OS_LOG_TYPE_ERROR, "Error funopening file handle for %{public}s: %i (%s)", buf, 0x1Cu);
  }

  gzclose(v34);
LABEL_39:
  v35 = 0;
LABEL_40:
  char v52 = v35 != a4 || v9;
  if (v35 == a4 || !v9)
  {
    LOBYTE(v9) = v52;
  }
  else
  {
    fclose(a4);
    LOBYTE(v9) = 1;
  }
  a4 = v35;
  if (!v35) {
    goto LABEL_23;
  }
LABEL_48:
  id v31 = 0;
LABEL_49:

  id v21 = v31;
  v15->_fileHandle = a4;
  v15->_closeWhenDone = v9;
  if (a4)
  {
    v53 = getenv("CS_VISUALIZATION_OUTPUT_XML");
    if (v53) {
      BOOL v54 = strtol(v53, 0, 0) != 0;
    }
    else {
      BOOL v54 = 0;
    }
    v15->_outputAsXML = v54;
    v15->_dictWriteLock._os_unfair_lock_opaque = 0;
    id v73 = v21;
    BOOL v55 = [(_CSVisualizationArchiver *)v15 fwrite:"csviz0jg" size:8 numberOfItems:1 error:&v73];
    id v56 = v73;

    if (!v55)
    {

      goto LABEL_61;
    }
    uint64_t v57 = [(_CSVisualizer *)v15->_visualizer store];
    uint64_t v58 = 4294929780;
    if (!v57) {
      uint64_t v58 = 0;
    }
    *(void *)buf = v58;
    id v72 = v56;
    BOOL v59 = [(_CSVisualizationArchiver *)v15 fwrite:buf size:8 numberOfItems:1 error:&v72];
    id v21 = v72;

    if (v59)
    {
      fflush(v15->_fileHandle);
      id v71 = v21;
      BOOL v60 = -[_CSVisualizationArchiver writeMetadata:forStore:error:](v15, "writeMetadata:forStore:error:", 0, [v14 store], &v71);
      id v56 = v71;

      if (v60)
      {
        id v21 = v56;
        goto LABEL_63;
      }

LABEL_61:
      id v21 = v56;
      if (!a7) {
        goto LABEL_62;
      }
      goto LABEL_12;
    }
  }
  else
  {
  }
LABEL_11:
  if (!a7)
  {
LABEL_62:
    BOOL v15 = 0;
    goto LABEL_63;
  }
LABEL_12:
  id v21 = v21;
  BOOL v15 = 0;
  *a7 = v21;
LABEL_63:

  return v15;
}

+ (void)beginProvidingVisualizationArchivesWithMachServiceName:(id)a3 queue:(id)a4 creatingVisualizersWithBlock:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v11;
  if (v9)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    unint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, a1, @"CSVisualizationArchiver.mm", 1091, @"Invalid parameter not satisfying: %@", @"serviceName != nil" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, a1, @"CSVisualizationArchiver.mm", 1092, @"Invalid parameter not satisfying: %@", @"block != nil" object file lineNumber description];

LABEL_3:
  if (lockdownLibrary(void)::sOnce != -1) {
    dispatch_once(&lockdownLibrary(void)::sOnce, &__block_literal_global);
  }
  if (lockdownLibrary(void)::sLib)
  {
    int v13 = (CSStore2 *)dlsym((void *)lockdownLibrary(void)::sLib, "soft_lockdown_checkin_xpc");
    if (v13)
    {
      id v14 = CSStore2::GetLog(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        id v24 = v9;
        _os_log_debug_impl(&dword_1A7DB2000, v14, OS_LOG_TYPE_DEBUG, "Beginning remote visualization service '%{public}@'", buf, 0xCu);
      }

      id v15 = v9;
      uint64_t v16 = [v15 UTF8String];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __141___CSVisualizationArchiver_CSRemoteVisualization__beginProvidingVisualizationArchivesWithMachServiceName_queue_creatingVisualizersWithBlock___block_invoke;
      v19[3] = &unk_1E5D2A330;
      id v20 = v15;
      id v22 = a1;
      id v21 = v12;
      softLinklockdown_checkin_xpc(v16, 0, v10, v19);
    }
  }
}

+ (void)provideVisualizerToConnection:(void *)a3 fileHandle:(__sFILE *)a4 providerBlock:(id)a5
{
  id v7 = a5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __106___CSVisualizationArchiver_CSRemoteVisualization__provideVisualizerToConnection_fileHandle_providerBlock___block_invoke;
  block[3] = &unk_1E5D2A308;
  id v11 = v7;
  id v12 = a3;
  int v13 = a4;
  id v8 = v7;
  id v9 = (void (**)(void))dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, block);
  v9[2]();
}

+ (void)processCommandFromConnection:(void *)a3 fileHandle:(__sFILE *)a4 providerBlock:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  uint64_t __ptr = -1;
  if (fread(&__ptr, 8uLL, 1uLL, a4) == 1)
  {
    uint64_t v9 = __ptr;
    id v10 = (CSStore2 *)MEMORY[0x1AD0DB160]();
    id v11 = CSStore2::GetLog(v10);
    id v12 = v11;
    if (v9)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v15 = v9;
        _os_log_error_impl(&dword_1A7DB2000, v12, OS_LOG_TYPE_ERROR, "Unrecognized reserved value %llu received from the Mac, ignoring and closing.", buf, 0xCu);
      }
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A7DB2000, v12, OS_LOG_TYPE_DEFAULT, "Mac commanded we send a store archive", buf, 2u);
      }

      [a1 provideVisualizerToConnection:a3 fileHandle:a4 providerBlock:v8];
    }
  }
}

@end