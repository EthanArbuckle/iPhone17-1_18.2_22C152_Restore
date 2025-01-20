@interface ISStore
- (BOOL)removeUnitForUUID:(id)a3;
- (BOOL)writeStoreUnit:(id)a3;
- (ISStore)initWithURL:(id)a3;
- (NSMutableDictionary)registry;
- (NSString)domain;
- (NSURL)storeURL;
- (NSXPCConnection)connection;
- (id)addUnitWithData:(id)a3;
- (id)unitForUUID:(id)a3;
- (os_unfair_lock_s)registryLock;
- (void)setRegistryLock:(os_unfair_lock_s)a3;
@end

@implementation ISStore

- (id)unitForUUID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_registryLock);
    v5 = [(NSMutableDictionary *)self->_registry objectForKey:v4];
    os_unfair_lock_unlock(&self->_registryLock);
    if (!v5)
    {
      v6 = [(ISStore *)self storeURL];
      v5 = +[ISStoreUnit storeUnitWithStoreURL:v6 UUID:v4];

      if (v5)
      {
        os_unfair_lock_lock(&self->_registryLock);
        [(NSMutableDictionary *)self->_registry setObject:v5 forKey:v4];
        os_unfair_lock_unlock(&self->_registryLock);
      }
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSURL)storeURL
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (ISStore)initWithURL:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ISStore;
  v6 = [(ISStore *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_storeURL, a3);
  }

  return v7;
}

- (BOOL)writeStoreUnit:(id)a3
{
  v43[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 data];
  v6 = [v4 UUID];

  if ([v5 length])
  {
    v7 = [(NSURL *)self->_storeURL path];
    v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v9 = *MEMORY[0x1E4F28330];
    uint64_t v42 = *MEMORY[0x1E4F28330];
    v43[0] = &unk_1F064AC18;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:&v42 count:1];
    id v33 = 0;
    char v11 = [v8 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:v10 error:&v33];
    id v12 = v33;

    if ((v11 & 1) == 0)
    {
      v16 = _ISDefaultLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        -[ISStore writeStoreUnit:].cold.4();
      }
      BOOL v26 = 0;
      goto LABEL_23;
    }
    v13 = NSString;
    v14 = [v6 UUIDString];
    v15 = [v13 stringWithFormat:@"%@.%s", v14, "isdata"];
    v16 = [v7 stringByAppendingPathComponent:v15];

    v17 = [v16 stringByAppendingPathExtension:@"tmp"];
    id v32 = v12;
    char v18 = [v5 writeToFile:v17 options:0x10000000 error:&v32];
    id v19 = v32;

    if (v18)
    {
      v20 = [MEMORY[0x1E4F28CB8] defaultManager];
      uint64_t v40 = v9;
      v41 = &unk_1F064AC30;
      v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
      id v31 = v19;
      char v22 = [v20 setAttributes:v21 ofItemAtPath:v17 error:&v31];
      id v23 = v31;

      if (v22)
      {
        v24 = [MEMORY[0x1E4F28CB8] defaultManager];
        id v30 = v23;
        char v25 = [v24 moveItemAtPath:v17 toPath:v16 error:&v30];
        id v19 = v30;

        if (v25)
        {
          BOOL v26 = 1;
LABEL_22:

          id v12 = v19;
LABEL_23:

          goto LABEL_24;
        }
        v28 = _ISDefaultLog();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412802;
          v35 = v17;
          __int16 v36 = 2112;
          v37 = v16;
          __int16 v38 = 2112;
          id v39 = v19;
          _os_log_fault_impl(&dword_1AE771000, v28, OS_LOG_TYPE_FAULT, "Failed to move temp file %@ to %@ with error: %@", buf, 0x20u);
        }

        v27 = [MEMORY[0x1E4F28CB8] defaultManager];
        [v27 removeItemAtPath:v17 error:0];
      }
      else
      {
        v27 = _ISDefaultLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
          -[ISStore writeStoreUnit:]();
        }
        id v19 = v23;
      }
    }
    else
    {
      v27 = _ISDefaultLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
        -[ISStore writeStoreUnit:]();
      }
    }

    BOOL v26 = 0;
    goto LABEL_22;
  }
  v7 = _ISDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
    -[ISStore writeStoreUnit:](v7);
  }
  BOOL v26 = 0;
LABEL_24:

  return v26;
}

- (id)addUnitWithData:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = +[ISStoreUnit storeUnitWithData:a3];
  if ([v4 isValid])
  {
    id v5 = [v4 UUID];
    v6 = [(ISStore *)self unitForUUID:v5];

    if ([v6 isValid])
    {
      id v7 = v6;
    }
    else
    {
      v8 = _ISDefaultLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        uint64_t v9 = [v4 UUID];
        v10 = [v9 UUIDString];
        int v13 = 138412290;
        v14 = v10;
        _os_log_impl(&dword_1AE771000, v8, OS_LOG_TYPE_INFO, "ADDING_NEW_STORE_ENTRY with UUID: %@", (uint8_t *)&v13, 0xCu);
      }
      id v7 = v4;

      if ([(ISStore *)self writeStoreUnit:v7])
      {
        char v11 = [(ISStore *)self storeURL];
        [v7 remapWithStoreURL:v11];
      }
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (BOOL)removeUnitForUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(NSURL *)self->_storeURL path];
  v6 = NSString;
  id v7 = [v4 UUIDString];
  v8 = [v6 stringWithFormat:@"%@.%s", v7, "isdata"];
  uint64_t v9 = [v5 stringByAppendingPathComponent:v8];

  v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v15 = 0;
  char v11 = [v10 removeItemAtPath:v9 error:&v15];
  id v12 = v15;

  if ((v11 & 1) == 0 && [v12 code] != 4)
  {
    int v13 = _ISDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      [(ISStore *)v4 removeUnitForUUID:v13];
    }
  }
  return v11;
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (NSMutableDictionary)registry
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (os_unfair_lock_s)registryLock
{
  return self->_registryLock;
}

- (void)setRegistryLock:(os_unfair_lock_s)a3
{
  self->_registryLock = a3;
}

- (NSString)domain
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_registry, 0);
  objc_storeStrong((id *)&self->_storeURL, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)writeStoreUnit:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1AE771000, log, OS_LOG_TYPE_FAULT, "Error: unable to write store unit. No data to write", v1, 2u);
}

- (void)writeStoreUnit:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_4(&dword_1AE771000, v0, v1, "Error setting permissions on file at path: %@. Error: %@");
}

- (void)writeStoreUnit:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_4(&dword_1AE771000, v0, v1, "Error writing to data to file at path: %@. Error: %@");
}

- (void)writeStoreUnit:.cold.4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_4(&dword_1AE771000, v0, v1, "Error creating cache folder at path: %@. Error: %@");
}

- (void)removeUnitForUUID:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = [a1 UUIDString];
  int v6 = 138412546;
  id v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_1AE771000, a3, OS_LOG_TYPE_ERROR, "Failed to remove store entry for UUID: %@ with error: %@", (uint8_t *)&v6, 0x16u);
}

@end