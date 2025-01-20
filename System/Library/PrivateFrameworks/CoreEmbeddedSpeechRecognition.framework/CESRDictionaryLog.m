@interface CESRDictionaryLog
- (BOOL)_loadLogOrCreate:(BOOL)a3 readOnly:(BOOL)a4 error:(id *)a5;
- (BOOL)clear:(id *)a3;
- (BOOL)clearObjectForKey:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDictionaryLog:(id)a3;
- (BOOL)isReadOnly;
- (BOOL)writeUpdatedObject:(id)a3 forKey:(id)a4 error:(id *)a5;
- (BOOL)writeUpdatedObjects:(id)a3 forKeys:(id)a4 error:(id *)a5;
- (CESRDictionaryLog)init;
- (CESRDictionaryLog)initWithFilename:(id)a3 directory:(id)a4 readOnly:(BOOL)a5 error:(id *)a6;
- (CESRDictionaryLog)initWithFilename:(id)a3 protectionClass:(int)a4 directory:(id)a5 readOnly:(BOOL)a6 create:(BOOL)a7 error:(id *)a8;
- (id)allKeys;
- (id)description;
- (id)mutableDictionaryForKey:(id)a3 error:(id *)a4;
- (id)objectForKey:(id)a3;
- (unint64_t)count;
- (unint64_t)hash;
@end

@implementation CESRDictionaryLog

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);

  objc_storeStrong((id *)&self->_logFileURL, 0);
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSURL *)self->_logFileURL hash];
  v4 = [NSNumber numberWithInt:self->_protectionClass];
  uint64_t v5 = [v4 hash];
  unint64_t v6 = v5 ^ v3 ^ [(NSDictionary *)self->_log hash];

  return v6;
}

- (BOOL)isEqualToDictionaryLog:(id)a3
{
  v4 = a3;
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

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && [(CESRDictionaryLog *)self isEqualToDictionaryLog:v4];

  return v5;
}

- (BOOL)clear:(id *)a3
{
  v24[1] = *MEMORY[0x1E4F143B8];
  if ([(CESRDictionaryLog *)self isReadOnly])
  {
    BOOL v5 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = *MEMORY[0x1E4F28568];
    unint64_t v6 = [NSString stringWithFormat:@"instance: %@ is read only.", self];
    v24[0] = v6;
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    v8 = [v5 errorWithDomain:@"com.apple.siri.speech-dictionary-log" code:3 userInfo:v7];
    id v9 = v8;
    BOOL v10 = 0;
    if (a3 && v8)
    {
      id v9 = v8;
      BOOL v10 = 0;
      *a3 = v9;
    }
    goto LABEL_18;
  }
  v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v9 = [(NSURL *)self->_logFileURL path];
  if (!v9 || ![v7 fileExistsAtPath:v9])
  {
    id v13 = 0;
    goto LABEL_17;
  }
  logFileURL = self->_logFileURL;
  id v18 = 0;
  char v12 = [v7 removeItemAtURL:logFileURL error:&v18];
  id v13 = v18;
  if (v12)
  {
LABEL_17:
    [(NSDictionary *)self->_log removeAllObjects];
    BOOL v10 = 1;
    unint64_t v6 = v13;
    goto LABEL_18;
  }
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v15 = [NSString stringWithFormat:@"Failed to remove log file at path: %@", v9];
  [v14 setObject:v15 forKey:*MEMORY[0x1E4F28568]];

  if (v13) {
    [v14 setObject:v13 forKey:*MEMORY[0x1E4F28A50]];
  }
  unint64_t v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.siri.speech-dictionary-log" code:8 userInfo:v14];

  if (a3 && v6) {
    *a3 = v6;
  }
  v16 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v20 = "-[CESRDictionaryLog clear:]";
    __int16 v21 = 2112;
    v22 = v6;
    _os_log_error_impl(&dword_1B8CCB000, v16, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
  }

  BOOL v10 = 0;
LABEL_18:

  return v10;
}

- (BOOL)clearObjectForKey:(id)a3 error:(id *)a4
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(CESRDictionaryLog *)self isReadOnly])
  {
    v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v33 = *MEMORY[0x1E4F28568];
    v8 = [NSString stringWithFormat:@"instance: %@ is read only.", self];
    v34[0] = v8;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];
    BOOL v10 = v7;
    uint64_t v11 = 3;
    goto LABEL_10;
  }
  if (!v6)
  {
    v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v31 = *MEMORY[0x1E4F28568];
    v8 = [NSString stringWithFormat:@"Invalid key: %@", 0];
    v32 = v8;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    BOOL v10 = v17;
    uint64_t v11 = 1;
LABEL_10:
    id v18 = [v10 errorWithDomain:@"com.apple.siri.speech-dictionary-log" code:v11 userInfo:v9];
    v19 = v18;
    if (a4 && v18) {
      *a4 = v18;
    }

    char v13 = 0;
    goto LABEL_26;
  }
  uint64_t v12 = [(NSDictionary *)self->_log objectForKey:v6];
  if (v12)
  {
    v8 = (void *)v12;
    [(NSDictionary *)self->_log removeObjectForKey:v6];
    char v13 = SFWritePropertyList();
    id v14 = 0;
    if (v13)
    {
      v15 = *MEMORY[0x1E4F4E380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        v26 = "-[CESRDictionaryLog clearObjectForKey:error:]";
        __int16 v27 = 2112;
        id v28 = v8;
        __int16 v29 = 2112;
        id v30 = v6;
        _os_log_debug_impl(&dword_1B8CCB000, v15, OS_LOG_TYPE_DEBUG, "%s Removed object: %@ for key: %@", buf, 0x20u);
      }
      v16 = v14;
    }
    else
    {
      [(NSDictionary *)self->_log setObject:v8 forKey:v6];
      id v21 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v22 = [NSString stringWithFormat:@"Failed to write removal for key: %@ reverting to prior object: %@", v6, v8];
      [v21 setObject:v22 forKey:*MEMORY[0x1E4F28568]];

      if (v14) {
        [v21 setObject:v14 forKey:*MEMORY[0x1E4F28A50]];
      }
      v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.siri.speech-dictionary-log" code:8 userInfo:v21];

      if (a4 && v16) {
        *a4 = v16;
      }
      uint64_t v23 = *MEMORY[0x1E4F4E380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v26 = "-[CESRDictionaryLog clearObjectForKey:error:]";
        __int16 v27 = 2112;
        id v28 = v16;
        _os_log_error_impl(&dword_1B8CCB000, v23, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
      }
    }
  }
  else
  {
    v20 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "-[CESRDictionaryLog clearObjectForKey:error:]";
      __int16 v27 = 2112;
      id v28 = v6;
      _os_log_debug_impl(&dword_1B8CCB000, v20, OS_LOG_TYPE_DEBUG, "%s No object exists for key: %@", buf, 0x16u);
    }
    v8 = 0;
    char v13 = 1;
  }
LABEL_26:

  return v13;
}

- (BOOL)writeUpdatedObjects:(id)a3 forKeys:(id)a4 error:(id *)a5
{
  v61[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([(CESRDictionaryLog *)self isReadOnly])
  {
    BOOL v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v60 = *MEMORY[0x1E4F28568];
    uint64_t v11 = [NSString stringWithFormat:@"instance: %@ is read only.", self];
    v61[0] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:&v60 count:1];
    char v13 = v10;
    uint64_t v14 = 3;
    goto LABEL_17;
  }
  uint64_t v15 = [v8 count];
  if (v15 != [v9 count])
  {
    v22 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v58 = *MEMORY[0x1E4F28568];
    uint64_t v11 = [NSString stringWithFormat:@"Unexpected number of objects: %@ for keys: %@", v8, v9];
    v59 = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1];
    char v13 = v22;
    uint64_t v14 = 1;
LABEL_17:
    uint64_t v23 = [v13 errorWithDomain:@"com.apple.siri.speech-dictionary-log" code:v14 userInfo:v12];
    v24 = v23;
    if (a5 && v23) {
      *a5 = v23;
    }

    goto LABEL_21;
  }
  v43 = a5;
  uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v9, "count"));
  uint64_t v16 = [v8 count];
  if ([v8 count])
  {
    for (unint64_t i = 0; i < [v8 count]; ++i)
    {
      id v18 = [v8 objectAtIndex:i];
      v19 = [v9 objectAtIndex:i];
      v20 = [v11 objectForKey:v19];
      if (v20
        || ([(NSDictionary *)self->_log objectForKey:v19],
            (v20 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        if ([v20 isEqual:v18])
        {
          id v21 = *MEMORY[0x1E4F4E380];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315650;
            v50 = "-[CESRDictionaryLog writeUpdatedObjects:forKeys:error:]";
            __int16 v51 = 2112;
            id v52 = v18;
            __int16 v53 = 2112;
            id v54 = v19;
            _os_log_debug_impl(&dword_1B8CCB000, v21, OS_LOG_TYPE_DEBUG, "%s object: %@ is already recorded for key: %@", buf, 0x20u);
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
    BOOL v25 = 1;
    goto LABEL_23;
  }
  uint64_t v48 = 0;
  char v27 = SFWritePropertyList();
  id v28 = 0;
  id v29 = v28;
  if (v27)
  {
    id v30 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      v50 = "-[CESRDictionaryLog writeUpdatedObjects:forKeys:error:]";
      __int16 v51 = 2112;
      id v52 = v8;
      __int16 v53 = 2112;
      id v54 = v9;
      __int16 v55 = 2112;
      v56 = v11;
      _os_log_debug_impl(&dword_1B8CCB000, v30, OS_LOG_TYPE_DEBUG, "%s Updated object(s): %@ for key(s): %@ replacing prior object(s): %@", buf, 0x2Au);
    }
    BOOL v25 = 1;
    uint64_t v12 = v29;
    goto LABEL_22;
  }
  v42 = v28;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v31 = v9;
  uint64_t v32 = [v31 countByEnumeratingWithState:&v44 objects:v57 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v45;
    do
    {
      for (uint64_t j = 0; j != v33; ++j)
      {
        if (*(void *)v45 != v34) {
          objc_enumerationMutation(v31);
        }
        uint64_t v36 = *(void *)(*((void *)&v44 + 1) + 8 * j);
        v37 = [v11 objectForKey:v36];
        log = self->_log;
        if (v37) {
          [(NSDictionary *)log setObject:v37 forKey:v36];
        }
        else {
          [(NSDictionary *)log removeObjectForKey:v36];
        }
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v44 objects:v57 count:16];
    }
    while (v33);
  }

  id v39 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v40 = [NSString stringWithFormat:@"Failed to write updated object(s): %@ for key(s): %@ reverting to prior object(s): %@", v8, v31, v11];
  [v39 setObject:v40 forKey:*MEMORY[0x1E4F28568]];

  if (v42) {
    [v39 setObject:v42 forKey:*MEMORY[0x1E4F28A50]];
  }
  uint64_t v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.siri.speech-dictionary-log" code:8 userInfo:v39];

  if (v43 && v12) {
    id *v43 = v12;
  }
  v41 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v50 = "-[CESRDictionaryLog writeUpdatedObjects:forKeys:error:]";
    __int16 v51 = 2112;
    id v52 = v12;
    _os_log_error_impl(&dword_1B8CCB000, v41, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
  }

LABEL_21:
  BOOL v25 = 0;
LABEL_22:

LABEL_23:
  return v25;
}

- (BOOL)writeUpdatedObject:(id)a3 forKey:(id)a4 error:(id *)a5
{
  v23[1] = *MEMORY[0x1E4F143B8];
  if (a3 && a4)
  {
    id v21 = a3;
    id v8 = (void *)MEMORY[0x1E4F1C978];
    id v9 = a4;
    id v10 = a3;
    uint64_t v11 = [v8 arrayWithObjects:&v21 count:1];
    id v20 = v9;
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];

    BOOL v13 = [(CESRDictionaryLog *)self writeUpdatedObjects:v11 forKeys:v12 error:a5];
  }
  else
  {
    uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v22 = *MEMORY[0x1E4F28568];
    uint64_t v15 = NSString;
    id v16 = a4;
    id v17 = a3;
    uint64_t v11 = [v15 stringWithFormat:@"Invalid {object: %@ key: %@}", v17, v16];
    v23[0] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    id v18 = [v14 errorWithDomain:@"com.apple.siri.speech-dictionary-log" code:1 userInfo:v12];

    if (a5 && v18) {
      *a5 = v18;
    }

    BOOL v13 = 0;
  }

  return v13;
}

- (id)mutableDictionaryForKey:(id)a3 error:(id *)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(CESRDictionaryLog *)self objectForKey:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
LABEL_13:
    id v17 = v8;
    goto LABEL_14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = (id)[v7 mutableCopy];
    goto LABEL_13;
  }
  if (!v7)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    goto LABEL_13;
  }
  id v9 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v23 = *MEMORY[0x1E4F28568];
  id v10 = NSString;
  uint64_t v11 = (objc_class *)objc_opt_class();
  uint64_t v12 = NSStringFromClass(v11);
  BOOL v13 = [v10 stringWithFormat:@"Unexpected object: %@ for key: %@ expected: %@", v7, v6, v12];
  v24[0] = v13;
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
  uint64_t v15 = [v9 errorWithDomain:@"com.apple.siri.speech-dictionary-log" code:4 userInfo:v14];

  if (a4 && v15) {
    *a4 = v15;
  }
  id v16 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    id v20 = "-[CESRDictionaryLog mutableDictionaryForKey:error:]";
    __int16 v21 = 2112;
    uint64_t v22 = v15;
    _os_log_error_impl(&dword_1B8CCB000, v16, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
  }

  id v17 = 0;
LABEL_14:

  return v17;
}

- (id)objectForKey:(id)a3
{
  uint64_t v3 = [(NSDictionary *)self->_log objectForKey:a3];
  id v4 = (void *)[v3 copy];

  return v4;
}

- (id)allKeys
{
  return [(NSDictionary *)self->_log allKeys];
}

- (unint64_t)count
{
  return [(NSDictionary *)self->_log count];
}

- (BOOL)isReadOnly
{
  return (objc_opt_isKindOfClass() & 1) == 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CESRDictionaryLog;
  uint64_t v3 = [(CESRDictionaryLog *)&v7 description];
  id v4 = [(NSURL *)self->_logFileURL path];
  BOOL v5 = [v3 stringByAppendingFormat:@" logFile: %@", v4];

  return v5;
}

- (BOOL)_loadLogOrCreate:(BOOL)a3 readOnly:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  v53[1] = *MEMORY[0x1E4F143B8];
  id v9 = [(NSURL *)self->_logFileURL path];
  SFReadPropertyList();
  id v10 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  id v11 = 0;
  log = self->_log;
  self->_log = v10;

  if (!self->_log)
  {
    uint64_t v21 = [v11 code];
    uint64_t v22 = *MEMORY[0x1E4F4E380];
    if (v21 == 260)
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v43 = "-[CESRDictionaryLog _loadLogOrCreate:readOnly:error:]";
        __int16 v44 = 2112;
        uint64_t v45 = (uint64_t)v9;
        _os_log_debug_impl(&dword_1B8CCB000, v22, OS_LOG_TYPE_DEBUG, "%s No prior log found at path: %@", buf, 0x16u);
      }
      uint64_t v23 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v48 = *MEMORY[0x1E4F28A50];
      id v49 = v11;
      v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
      BOOL v25 = v23;
      uint64_t v26 = 6;
LABEL_26:
      uint64_t v36 = [v25 errorWithDomain:@"com.apple.siri.speech-dictionary-log" code:v26 userInfo:v24];

      id v11 = (id)v36;
      if (a3) {
        goto LABEL_14;
      }
LABEL_27:
      char v32 = 0;
      if (a5 && v11)
      {
        id v11 = v11;
        char v32 = 0;
        *a5 = v11;
      }
      goto LABEL_30;
    }
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v43 = "-[CESRDictionaryLog _loadLogOrCreate:readOnly:error:]";
      __int16 v44 = 2112;
      uint64_t v45 = (uint64_t)v9;
      __int16 v46 = 2112;
      id v47 = v11;
      _os_log_error_impl(&dword_1B8CCB000, v22, OS_LOG_TYPE_ERROR, "%s Failed to read prior log file at path: %@ error: %@", buf, 0x20u);
      if (v11) {
        goto LABEL_22;
      }
    }
    else if (v11)
    {
LABEL_22:
      uint64_t v40 = *MEMORY[0x1E4F28A50];
      id v41 = v11;
      v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
LABEL_25:
      BOOL v25 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v26 = 7;
      goto LABEL_26;
    }
    v24 = 0;
    goto LABEL_25;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v6) {
      goto LABEL_16;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_16;
    }
    id v39 = a5;
    v38 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v52 = *MEMORY[0x1E4F28568];
    BOOL v13 = NSString;
    uint64_t v14 = (objc_class *)objc_opt_class();
    uint64_t v15 = NSStringFromClass(v14);
    id v16 = (objc_class *)objc_opt_class();
    id v17 = NSStringFromClass(v16);
    id v18 = [v13 stringWithFormat:@"Expected mutable plist class (%@) but received class (%@) for object: %@ at path: %@", v15, v17, self->_log, v9];
    v53[0] = v18;
    uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:&v52 count:1];
    uint64_t v20 = [v38 errorWithDomain:@"com.apple.siri.speech-dictionary-log" code:5 userInfo:v19];

    id v11 = (id)v19;
  }
  else
  {
    id v39 = a5;
    char v27 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v50 = *MEMORY[0x1E4F28568];
    id v28 = NSString;
    id v29 = (objc_class *)objc_opt_class();
    uint64_t v15 = NSStringFromClass(v29);
    id v17 = [v28 stringWithFormat:@"Unexpected plist class (%@) of object: %@ at path: %@", v15, self->_log, v9];
    __int16 v51 = v17;
    id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
    uint64_t v20 = [v27 errorWithDomain:@"com.apple.siri.speech-dictionary-log" code:5 userInfo:v18];
  }

  id v30 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v43 = "-[CESRDictionaryLog _loadLogOrCreate:readOnly:error:]";
    __int16 v44 = 2112;
    uint64_t v45 = v20;
    _os_log_error_impl(&dword_1B8CCB000, v30, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
  }
  id v11 = (id)v20;
  a5 = v39;
  if (!a3) {
    goto LABEL_27;
  }
LABEL_14:
  if (v6)
  {
    id v31 = self->_log;
    self->_log = (NSDictionary *)MEMORY[0x1E4F1CC08];

LABEL_16:
    char v32 = 1;
    goto LABEL_30;
  }
  uint64_t v33 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v43 = "-[CESRDictionaryLog _loadLogOrCreate:readOnly:error:]";
    __int16 v44 = 2112;
    uint64_t v45 = (uint64_t)v9;
    _os_log_impl(&dword_1B8CCB000, v33, OS_LOG_TYPE_INFO, "%s Initializing empty log file at path: %@", buf, 0x16u);
  }
  uint64_t v34 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v35 = self->_log;
  self->_log = v34;

  char v32 = SFWritePropertyList();
LABEL_30:

  return v32;
}

- (CESRDictionaryLog)initWithFilename:(id)a3 protectionClass:(int)a4 directory:(id)a5 readOnly:(BOOL)a6 create:(BOOL)a7 error:(id *)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  v28[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a5;
  v26.receiver = self;
  v26.super_class = (Class)CESRDictionaryLog;
  id v16 = [(CESRDictionaryLog *)&v26 init];
  if (!v16) {
    goto LABEL_5;
  }
  if (!v14 || !v15)
  {
    uint64_t v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v27 = *MEMORY[0x1E4F28568];
    uint64_t v21 = [NSString stringWithFormat:@"Invalid {filename: %@, directory: %@}", v14, v15];
    v28[0] = v21;
    uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
    uint64_t v23 = [v20 errorWithDomain:@"com.apple.siri.speech-dictionary-log" code:2 userInfo:v22];
    v24 = v23;
    if (a8 && v23) {
      *a8 = v23;
    }

    goto LABEL_10;
  }
  uint64_t v17 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v14 relativeToURL:v15];
  logFileURL = v16->_logFileURL;
  v16->_logFileURL = (NSURL *)v17;

  v16->_protectionClass = a4;
  if (![(CESRDictionaryLog *)v16 _loadLogOrCreate:v9 readOnly:v10 error:a8])
  {
LABEL_10:
    uint64_t v19 = 0;
    goto LABEL_11;
  }
LABEL_5:
  uint64_t v19 = v16;
LABEL_11:

  return v19;
}

- (CESRDictionaryLog)initWithFilename:(id)a3 directory:(id)a4 readOnly:(BOOL)a5 error:(id *)a6
{
  return [(CESRDictionaryLog *)self initWithFilename:a3 protectionClass:0xFFFFFFFFLL directory:a4 readOnly:a5 create:1 error:a6];
}

- (CESRDictionaryLog)init
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"init unsupported" userInfo:MEMORY[0x1E4F1CC08]];
  objc_exception_throw(v2);
}

@end