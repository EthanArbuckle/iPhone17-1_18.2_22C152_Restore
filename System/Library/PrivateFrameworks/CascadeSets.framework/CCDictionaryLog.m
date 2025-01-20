@interface CCDictionaryLog
- (BOOL)_loadLogOrCreate:(BOOL)a3 readOnly:(BOOL)a4 error:(id *)a5;
- (BOOL)clear:(id *)a3;
- (BOOL)clearObjectForKey:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDictionaryLog:(id)a3;
- (BOOL)isReadOnly;
- (BOOL)writeUpdatedObject:(id)a3 forKey:(id)a4 error:(id *)a5;
- (BOOL)writeUpdatedObjects:(id)a3 forKeys:(id)a4 error:(id *)a5;
- (CCDictionaryLog)init;
- (CCDictionaryLog)initWithFilename:(id)a3 directory:(id)a4 readOnly:(BOOL)a5 error:(id *)a6;
- (CCDictionaryLog)initWithFilename:(id)a3 protectionClass:(int)a4 directory:(id)a5 readOnly:(BOOL)a6 create:(BOOL)a7 error:(id *)a8;
- (id)allKeys;
- (id)description;
- (id)mutableDictionaryForKey:(id)a3 error:(id *)a4;
- (id)objectForKey:(id)a3;
- (unint64_t)count;
- (unint64_t)hash;
@end

@implementation CCDictionaryLog

- (CCDictionaryLog)initWithFilename:(id)a3 directory:(id)a4 readOnly:(BOOL)a5 error:(id *)a6
{
  return [(CCDictionaryLog *)self initWithFilename:a3 protectionClass:0xFFFFFFFFLL directory:a4 readOnly:a5 create:1 error:a6];
}

- (CCDictionaryLog)initWithFilename:(id)a3 protectionClass:(int)a4 directory:(id)a5 readOnly:(BOOL)a6 create:(BOOL)a7 error:(id *)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  v27[1] = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a5;
  v25.receiver = self;
  v25.super_class = (Class)CCDictionaryLog;
  v16 = [(CCDictionaryLog *)&v25 init];
  if (!v16) {
    goto LABEL_5;
  }
  if (!v14 || !v15)
  {
    v20 = (void *)MEMORY[0x263F087E8];
    uint64_t v26 = *MEMORY[0x263F08320];
    v21 = [NSString stringWithFormat:@"Invalid {filename: %@, directory: %@}", v14, v15];
    v27[0] = v21;
    v22 = [NSDictionary dictionaryWithObjects:v27 forKeys:&v26 count:1];
    v23 = [v20 errorWithDomain:@"com.apple.CascadeSets.DictionaryLog" code:2 userInfo:v22];
    CCSetError(a8, v23);

    goto LABEL_7;
  }
  uint64_t v17 = [NSURL fileURLWithPath:v14 relativeToURL:v15];
  logFileURL = v16->_logFileURL;
  v16->_logFileURL = (NSURL *)v17;

  v16->_protectionClass = a4;
  if (![(CCDictionaryLog *)v16 _loadLogOrCreate:v9 readOnly:v10 error:a8])
  {
LABEL_7:
    v19 = 0;
    goto LABEL_8;
  }
LABEL_5:
  v19 = v16;
LABEL_8:

  return v19;
}

- (CCDictionaryLog)init
{
  id v2 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"init unsupported" userInfo:MEMORY[0x263EFFA78]];
  objc_exception_throw(v2);
}

- (BOOL)_loadLogOrCreate:(BOOL)a3 readOnly:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  v49[1] = *MEMORY[0x263EF8340];
  BOOL v9 = [(NSURL *)self->_logFileURL path];
  logFileURL = self->_logFileURL;
  id v41 = 0;
  CCReadPropertyList((uint64_t)logFileURL, !v6, (uint64_t)&v41);
  v11 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  id v12 = v41;
  log = self->_log;
  self->_log = v11;

  if (self->_log)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (v6) {
        goto LABEL_24;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_24;
      }
      v40 = a5;
      v39 = (void *)MEMORY[0x263F087E8];
      uint64_t v48 = *MEMORY[0x263F08320];
      id v14 = NSString;
      id v15 = (objc_class *)objc_opt_class();
      v16 = NSStringFromClass(v15);
      uint64_t v17 = (objc_class *)objc_opt_class();
      v18 = NSStringFromClass(v17);
      v19 = [v14 stringWithFormat:@"Expected mutable plist class (%@) but received class (%@) for object: %@ at path: %@", v16, v18, self->_log, v9];
      v49[0] = v19;
      uint64_t v20 = [NSDictionary dictionaryWithObjects:v49 forKeys:&v48 count:1];
      uint64_t v21 = [v39 errorWithDomain:@"com.apple.CascadeSets.DictionaryLog" code:5 userInfo:v20];

      id v12 = (id)v20;
    }
    else
    {
      v40 = a5;
      v29 = (void *)MEMORY[0x263F087E8];
      uint64_t v46 = *MEMORY[0x263F08320];
      v30 = NSString;
      v31 = (objc_class *)objc_opt_class();
      v16 = NSStringFromClass(v31);
      v18 = [v30 stringWithFormat:@"Unexpected plist class (%@) of object: %@ at path: %@", v16, self->_log, v9];
      v47 = v18;
      v19 = [NSDictionary dictionaryWithObjects:&v47 forKeys:&v46 count:1];
      uint64_t v21 = [v29 errorWithDomain:@"com.apple.CascadeSets.DictionaryLog" code:5 userInfo:v19];
    }

    uint64_t v26 = __biome_log_for_category();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[CCDictionaryLog _loadLogOrCreate:readOnly:error:].cold.4();
    }
    id v12 = (id)v21;
    a5 = v40;
  }
  else
  {
    uint64_t v22 = [v12 code];
    v23 = __biome_log_for_category();
    v24 = v23;
    if (v22 == 260)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
        -[CCDictionaryLog _loadLogOrCreate:readOnly:error:]();
      }

      objc_super v25 = (void *)MEMORY[0x263F087E8];
      uint64_t v44 = *MEMORY[0x263F08608];
      id v45 = v12;
      uint64_t v26 = [NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];
      v27 = v25;
      uint64_t v28 = 6;
    }
    else
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[CCDictionaryLog _loadLogOrCreate:readOnly:error:]();
      }

      if (v12)
      {
        uint64_t v42 = *MEMORY[0x263F08608];
        id v43 = v12;
        uint64_t v26 = [NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];
      }
      else
      {
        uint64_t v26 = 0;
      }
      v27 = (void *)MEMORY[0x263F087E8];
      uint64_t v28 = 7;
    }
    uint64_t v32 = [v27 errorWithDomain:@"com.apple.CascadeSets.DictionaryLog" code:v28 userInfo:v26];

    id v12 = (id)v32;
  }

  if (!a3)
  {
    CCSetError(a5, v12);
    char v34 = 0;
    goto LABEL_29;
  }
  if (v6)
  {
    v33 = self->_log;
    self->_log = (NSDictionary *)MEMORY[0x263EFFA78];

LABEL_24:
    char v34 = 1;
    goto LABEL_29;
  }
  v35 = __biome_log_for_category();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
    -[CCDictionaryLog _loadLogOrCreate:readOnly:error:]();
  }

  v36 = (NSDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  v37 = self->_log;
  self->_log = v36;

  char v34 = CCWritePropertyList((uint64_t)self->_log, self->_logFileURL, self->_protectionClass, (uint64_t)a5);
LABEL_29:

  return v34;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CCDictionaryLog;
  v3 = [(CCDictionaryLog *)&v7 description];
  v4 = [(NSURL *)self->_logFileURL path];
  v5 = [v3 stringByAppendingFormat:@" logFile: %@", v4];

  return v5;
}

- (BOOL)isReadOnly
{
  return (objc_opt_isKindOfClass() & 1) == 0;
}

- (unint64_t)count
{
  return [(NSDictionary *)self->_log count];
}

- (id)allKeys
{
  return [(NSDictionary *)self->_log allKeys];
}

- (id)objectForKey:(id)a3
{
  v3 = [(NSDictionary *)self->_log objectForKey:a3];
  v4 = (void *)[v3 copy];

  return v4;
}

- (id)mutableDictionaryForKey:(id)a3 error:(id *)a4
{
  v20[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  objc_super v7 = [(CCDictionaryLog *)self objectForKey:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
LABEL_10:
    uint64_t v17 = v8;
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = (id)[v7 mutableCopy];
    goto LABEL_10;
  }
  if (!v7)
  {
    id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    goto LABEL_10;
  }
  BOOL v9 = (void *)MEMORY[0x263F087E8];
  uint64_t v19 = *MEMORY[0x263F08320];
  BOOL v10 = NSString;
  v11 = (objc_class *)objc_opt_class();
  id v12 = NSStringFromClass(v11);
  v13 = [v10 stringWithFormat:@"Unexpected object: %@ for key: %@ expected: %@", v7, v6, v12, v19];
  v20[0] = v13;
  id v14 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
  id v15 = [v9 errorWithDomain:@"com.apple.CascadeSets.DictionaryLog" code:4 userInfo:v14];

  CCSetError(a4, v15);
  v16 = __biome_log_for_category();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    -[CCDictionaryLog _loadLogOrCreate:readOnly:error:].cold.4();
  }

  uint64_t v17 = 0;
LABEL_11:

  return v17;
}

- (BOOL)writeUpdatedObject:(id)a3 forKey:(id)a4 error:(id *)a5
{
  v23[1] = *MEMORY[0x263EF8340];
  if (a3 && a4)
  {
    id v21 = a3;
    id v8 = (void *)MEMORY[0x263EFF8C0];
    id v9 = a4;
    id v10 = a3;
    v11 = [v8 arrayWithObjects:&v21 count:1];
    id v20 = v9;
    id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v20 count:1];

    BOOL v13 = [(CCDictionaryLog *)self writeUpdatedObjects:v11 forKeys:v12 error:a5];
  }
  else
  {
    id v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v22 = *MEMORY[0x263F08320];
    id v15 = NSString;
    id v16 = a4;
    id v17 = a3;
    v11 = [v15 stringWithFormat:@"Invalid {object: %@ key: %@}", v17, v16];
    v23[0] = v11;
    id v12 = [NSDictionary dictionaryWithObjects:v23 forKeys:&v22 count:1];
    v18 = [v14 errorWithDomain:@"com.apple.CascadeSets.DictionaryLog" code:1 userInfo:v12];

    CCSetError(a5, v18);
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)writeUpdatedObjects:(id)a3 forKeys:(id)a4 error:(id *)a5
{
  v58[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if ([(CCDictionaryLog *)self isReadOnly])
  {
    id v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v57 = *MEMORY[0x263F08320];
    v11 = [NSString stringWithFormat:@"instance: %@ is read only.", self];
    v58[0] = v11;
    id v12 = [NSDictionary dictionaryWithObjects:v58 forKeys:&v57 count:1];
    BOOL v13 = v10;
    uint64_t v14 = 3;
LABEL_17:
    v23 = [v13 errorWithDomain:@"com.apple.CascadeSets.DictionaryLog" code:v14 userInfo:v12];
    CCSetError(a5, v23);
    char v24 = 0;
    goto LABEL_18;
  }
  uint64_t v15 = [v8 count];
  if (v15 != [v9 count])
  {
    uint64_t v22 = (void *)MEMORY[0x263F087E8];
    uint64_t v55 = *MEMORY[0x263F08320];
    v11 = [NSString stringWithFormat:@"Unexpected number of objects: %@ for keys: %@", v8, v9];
    v56 = v11;
    id v12 = [NSDictionary dictionaryWithObjects:&v56 forKeys:&v55 count:1];
    BOOL v13 = v22;
    uint64_t v14 = 1;
    goto LABEL_17;
  }
  uint64_t v42 = a5;
  v11 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v9, "count"));
  uint64_t v16 = [v8 count];
  if ([v8 count])
  {
    for (unint64_t i = 0; i < [v8 count]; ++i)
    {
      v18 = [v8 objectAtIndex:i];
      uint64_t v19 = [v9 objectAtIndex:i];
      id v20 = [v11 objectForKey:v19];
      if (v20
        || ([(NSDictionary *)self->_log objectForKey:v19],
            (id v20 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        if ([v20 isEqual:v18])
        {
          id v21 = __biome_log_for_category();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            id v49 = v18;
            __int16 v50 = 2112;
            id v51 = v19;
            _os_log_debug_impl(&dword_249B92000, v21, OS_LOG_TYPE_DEBUG, "object: %@ is already recorded for key: %@", buf, 0x16u);
          }

          --v16;
          goto LABEL_14;
        }
        [v11 setObject:v20 forKey:v19];
      }
      [(NSDictionary *)self->_log setObject:v18 forKey:v19];
LABEL_14:
    }
  }
  if (!v16)
  {
    char v24 = 1;
    goto LABEL_19;
  }
  logFileURL = self->_logFileURL;
  log = self->_log;
  int protectionClass = self->_protectionClass;
  id v47 = 0;
  char v24 = CCWritePropertyList((uint64_t)log, logFileURL, protectionClass, (uint64_t)&v47);
  id v29 = v47;
  id v12 = v29;
  if (v24)
  {
    v23 = __biome_log_for_category();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      id v49 = v8;
      __int16 v50 = 2112;
      id v51 = v9;
      __int16 v52 = 2112;
      v53 = v11;
      _os_log_debug_impl(&dword_249B92000, v23, OS_LOG_TYPE_DEBUG, "Updated object(s): %@ for key(s): %@ replacing prior object(s): %@", buf, 0x20u);
    }
  }
  else
  {
    v40 = v29;
    char v41 = v24;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v30 = v9;
    uint64_t v31 = [v30 countByEnumeratingWithState:&v43 objects:v54 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v44;
      do
      {
        for (uint64_t j = 0; j != v32; ++j)
        {
          if (*(void *)v44 != v33) {
            objc_enumerationMutation(v30);
          }
          uint64_t v35 = *(void *)(*((void *)&v43 + 1) + 8 * j);
          v36 = [v11 objectForKey:v35];
          v37 = self->_log;
          if (v36) {
            [(NSDictionary *)v37 setObject:v36 forKey:v35];
          }
          else {
            [(NSDictionary *)v37 removeObjectForKey:v35];
          }
        }
        uint64_t v32 = [v30 countByEnumeratingWithState:&v43 objects:v54 count:16];
      }
      while (v32);
    }

    v23 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v38 = [NSString stringWithFormat:@"Failed to write updated object(s): %@ for key(s): %@ reverting to prior object(s): %@", v8, v30, v11];
    [v23 setObject:v38 forKey:*MEMORY[0x263F08320]];

    if (v40) {
      [v23 setObject:v40 forKey:*MEMORY[0x263F08608]];
    }
    id v12 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.CascadeSets.DictionaryLog" code:8 userInfo:v23];

    CCSetError(v42, v12);
    v39 = __biome_log_for_category();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      -[CCDictionaryLog _loadLogOrCreate:readOnly:error:].cold.4();
    }

    char v24 = v41;
  }
LABEL_18:

LABEL_19:
  return v24;
}

- (BOOL)clearObjectForKey:(id)a3 error:(id *)a4
{
  v27[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ([(CCDictionaryLog *)self isReadOnly])
  {
    objc_super v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v26 = *MEMORY[0x263F08320];
    id v8 = [NSString stringWithFormat:@"instance: %@ is read only.", self];
    v27[0] = v8;
    id v9 = [NSDictionary dictionaryWithObjects:v27 forKeys:&v26 count:1];
    id v10 = v7;
    uint64_t v11 = 3;
LABEL_10:
    uint64_t v19 = [v10 errorWithDomain:@"com.apple.CascadeSets.DictionaryLog" code:v11 userInfo:v9];
    CCSetError(a4, v19);

    char v15 = 0;
    goto LABEL_20;
  }
  if (!v6)
  {
    v18 = (void *)MEMORY[0x263F087E8];
    uint64_t v24 = *MEMORY[0x263F08320];
    id v8 = [NSString stringWithFormat:@"Invalid key: %@", 0];
    objc_super v25 = v8;
    id v9 = [NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    id v10 = v18;
    uint64_t v11 = 1;
    goto LABEL_10;
  }
  id v8 = [(NSDictionary *)self->_log objectForKey:v6];
  if (v8)
  {
    [(NSDictionary *)self->_log removeObjectForKey:v6];
    logFileURL = self->_logFileURL;
    log = self->_log;
    int protectionClass = self->_protectionClass;
    id v23 = 0;
    char v15 = CCWritePropertyList((uint64_t)log, logFileURL, protectionClass, (uint64_t)&v23);
    uint64_t v16 = v23;
    if (v15)
    {
      id v17 = __biome_log_for_category();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        -[CCDictionaryLog clearObjectForKey:error:]();
      }
      id v9 = v16;
    }
    else
    {
      [(NSDictionary *)self->_log setObject:v8 forKey:v6];
      id v17 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      id v20 = [NSString stringWithFormat:@"Failed to write removal for key: %@ reverting to prior object: %@", v6, v8];
      [v17 setObject:v20 forKey:*MEMORY[0x263F08320]];

      if (v16) {
        [v17 setObject:v16 forKey:*MEMORY[0x263F08608]];
      }
      id v9 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.CascadeSets.DictionaryLog" code:8 userInfo:v17];

      CCSetError(a4, v9);
      id v21 = __biome_log_for_category();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[CCDictionaryLog _loadLogOrCreate:readOnly:error:].cold.4();
      }
    }
  }
  else
  {
    id v9 = __biome_log_for_category();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[CCDictionaryLog clearObjectForKey:error:]();
    }
    char v15 = 1;
  }
LABEL_20:

  return v15;
}

- (BOOL)clear:(id *)a3
{
  v19[1] = *MEMORY[0x263EF8340];
  if (![(CCDictionaryLog *)self isReadOnly])
  {
    objc_super v7 = [MEMORY[0x263F08850] defaultManager];
    id v8 = [(NSURL *)self->_logFileURL path];
    if (v8 && [v7 fileExistsAtPath:v8])
    {
      logFileURL = self->_logFileURL;
      id v17 = 0;
      char v11 = [v7 removeItemAtURL:logFileURL error:&v17];
      id v12 = v17;
      if ((v11 & 1) == 0)
      {
        id v13 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        uint64_t v14 = [NSString stringWithFormat:@"Failed to remove log file at path: %@", v8];
        [v13 setObject:v14 forKey:*MEMORY[0x263F08320]];

        if (v12) {
          [v13 setObject:v12 forKey:*MEMORY[0x263F08608]];
        }
        id v6 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.CascadeSets.DictionaryLog" code:8 userInfo:v13];

        CCSetError(a3, v6);
        char v15 = __biome_log_for_category();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          -[CCDictionaryLog _loadLogOrCreate:readOnly:error:].cold.4();
        }

        goto LABEL_3;
      }
    }
    else
    {
      id v12 = 0;
    }
    [(NSDictionary *)self->_log removeAllObjects];
    BOOL v9 = 1;
    id v6 = v12;
    goto LABEL_14;
  }
  v5 = (void *)MEMORY[0x263F087E8];
  uint64_t v18 = *MEMORY[0x263F08320];
  id v6 = [NSString stringWithFormat:@"instance: %@ is read only.", self];
  v19[0] = v6;
  objc_super v7 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
  id v8 = [v5 errorWithDomain:@"com.apple.CascadeSets.DictionaryLog" code:3 userInfo:v7];
  CCSetError(a3, v8);
LABEL_3:
  BOOL v9 = 0;
LABEL_14:

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && [(CCDictionaryLog *)self isEqualToDictionaryLog:v4];

  return v5;
}

- (BOOL)isEqualToDictionaryLog:(id)a3
{
  id v4 = a3;
  if ([(NSURL *)self->_logFileURL isEqual:v4[1]]
    && self->_protectionClass == *((_DWORD *)v4 + 6))
  {
    char v5 = [(NSDictionary *)self->_log isEqual:v4[2]];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSURL *)self->_logFileURL hash];
  id v4 = [NSNumber numberWithInt:self->_protectionClass];
  uint64_t v5 = [v4 hash];
  unint64_t v6 = v5 ^ v3 ^ [(NSDictionary *)self->_log hash];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);

  objc_storeStrong((id *)&self->_logFileURL, 0);
}

- (void)_loadLogOrCreate:readOnly:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_249B92000, v0, v1, "Initializing empty log file at path: %@", v2, v3, v4, v5, v6);
}

- (void)_loadLogOrCreate:readOnly:error:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_249B92000, v0, v1, "No prior log found at path: %@", v2, v3, v4, v5, v6);
}

- (void)_loadLogOrCreate:readOnly:error:.cold.3()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_249B92000, v0, OS_LOG_TYPE_ERROR, "Failed to read prior log file at path: %@ error: %@", v1, 0x16u);
}

- (void)_loadLogOrCreate:readOnly:error:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_249B92000, v0, v1, "%@", v2, v3, v4, v5, v6);
}

- (void)clearObjectForKey:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_249B92000, v0, v1, "No object exists for key: %@", v2, v3, v4, v5, v6);
}

- (void)clearObjectForKey:error:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_249B92000, v0, OS_LOG_TYPE_DEBUG, "Removed object: %@ for key: %@", v1, 0x16u);
}

@end