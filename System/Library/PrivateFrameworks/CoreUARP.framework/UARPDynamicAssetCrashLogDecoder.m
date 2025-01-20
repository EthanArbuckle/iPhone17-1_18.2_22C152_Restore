@interface UARPDynamicAssetCrashLogDecoder
- (BOOL)copySectionName:(id)a3 inDictionary:(id)a4;
- (BOOL)createDictionary:(id)a3 inDictionary:(id)a4;
- (BOOL)decodeCrashLog:(id)a3 inDictionary:(id)a4;
- (UARPDynamicAssetCrashLogDecoder)init;
- (UARPDynamicAssetCrashLogDecoder)initWithDecoderId:(unsigned int)a3 sectionName:(id)a4 inputDictionary:(id)a5;
@end

@implementation UARPDynamicAssetCrashLogDecoder

- (UARPDynamicAssetCrashLogDecoder)init
{
  return 0;
}

- (UARPDynamicAssetCrashLogDecoder)initWithDecoderId:(unsigned int)a3 sectionName:(id)a4 inputDictionary:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)UARPDynamicAssetCrashLogDecoder;
  v11 = [(UARPDynamicAssetCrashLogDecoder *)&v15 init];
  if (v11)
  {
    os_log_t v12 = os_log_create("com.apple.accessoryupdater.uarp", "crsh");
    log = v11->_log;
    v11->_log = (OS_os_log *)v12;

    v11->_decoderId = a3;
    objc_storeStrong((id *)&v11->_sectionName, a4);
    objc_storeStrong((id *)&v11->_cmapDictionary, a5);
  }

  return v11;
}

- (BOOL)decodeCrashLog:(id)a3 inDictionary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_unsigned int decoderId = (int *)&self->_decoderId;
  unsigned int decoderId = self->_decoderId;
  if (decoderId == 2)
  {
    BOOL v10 = [(UARPDynamicAssetCrashLogDecoder *)self createDictionary:v6 inDictionary:v7];
    goto LABEL_5;
  }
  if (decoderId == 1)
  {
    BOOL v10 = [(UARPDynamicAssetCrashLogDecoder *)self copySectionName:v6 inDictionary:v7];
LABEL_5:
    BOOL v11 = v10;
    goto LABEL_9;
  }
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
    -[UARPDynamicAssetCrashLogDecoder decodeCrashLog:inDictionary:](p_decoderId, log);
  }
  BOOL v11 = 0;
LABEL_9:

  return v11;
}

- (BOOL)copySectionName:(id)a3 inDictionary:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(NSDictionary *)self->_cmapDictionary objectForKey:@"CrashLogKey"];
  if (v8)
  {
    [v6 allKeys];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          if (objc_msgSend(v8, "isEqualToString:", *(void *)(*((void *)&v18 + 1) + 8 * i), (void)v18))
          {
            v16 = [v6 objectForKey:v8];
            [v7 setObject:v16 forKey:v8];

            BOOL v15 = 1;
            goto LABEL_14;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      -[UARPDynamicAssetCrashLogDecoder copySectionName:inDictionary:]((uint64_t)v8, log);
    }
    BOOL v15 = 0;
LABEL_14:
  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      -[UARPDynamicAssetCrashLogDecoder copySectionName:inDictionary:]();
    }
    BOOL v15 = 0;
  }

  return v15;
}

- (BOOL)createDictionary:(id)a3 inDictionary:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v33 = a3;
  id v6 = a4;
  id v7 = [(NSDictionary *)self->_cmapDictionary objectForKey:@"CrashLogKey"];
  if (v7)
  {
    v8 = [(NSDictionary *)self->_cmapDictionary objectForKey:@"DecodedCrashLogChildKey"];
    uint64_t v9 = [(NSDictionary *)self->_cmapDictionary objectForKey:@"DecodedCrashLogKey"];
    uint64_t v10 = (void *)v9;
    if (v8)
    {
      if (v9)
      {
        uint64_t v11 = [v8 count];
        if (v11 == [v7 count])
        {
          v27 = self;
          v28 = v10;
          v29 = v6;
          v31 = [v33 allKeys];
          id v12 = objc_alloc_init(MEMORY[0x263EFF9A0]);
          if ([v7 count])
          {
            unint64_t v13 = 0;
            int v14 = 0;
            v30 = v7;
            while (1)
            {
              BOOL v15 = [v7 objectAtIndexedSubscript:v13];
              long long v34 = 0u;
              long long v35 = 0u;
              long long v36 = 0u;
              long long v37 = 0u;
              id v16 = v31;
              uint64_t v17 = [v16 countByEnumeratingWithState:&v34 objects:v38 count:16];
              if (!v17) {
                break;
              }
              uint64_t v18 = v17;
              int v32 = v14;
              char v19 = 0;
              uint64_t v20 = *(void *)v35;
              do
              {
                for (uint64_t i = 0; i != v18; ++i)
                {
                  if (*(void *)v35 != v20) {
                    objc_enumerationMutation(v16);
                  }
                  if ([*(id *)(*((void *)&v34 + 1) + 8 * i) isEqualToString:v15])
                  {
                    v22 = [v8 objectAtIndexedSubscript:v13];
                    uint64_t v23 = [v33 objectForKey:v15];
                    [v12 setObject:v23 forKey:v22];

                    char v19 = 1;
                  }
                }
                uint64_t v18 = [v16 countByEnumeratingWithState:&v34 objects:v38 count:16];
              }
              while (v18);

              id v7 = v30;
              if ((v19 & 1) == 0) {
                goto LABEL_32;
              }

              unint64_t v13 = (v32 + 1);
              int v14 = v32 + 1;
              if ([v30 count] <= v13) {
                goto LABEL_18;
              }
            }

LABEL_32:
            log = v27->_log;
            if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
              -[UARPDynamicAssetCrashLogDecoder createDictionary:inDictionary:].cold.4((uint64_t)v15, log);
            }

            BOOL v24 = 0;
            uint64_t v10 = v28;
            id v6 = v29;
          }
          else
          {
LABEL_18:
            uint64_t v10 = v28;
            id v6 = v29;
            [v29 setObject:v12 forKey:v28];
            BOOL v24 = 1;
          }

          goto LABEL_29;
        }
        if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
          -[UARPDynamicAssetCrashLogDecoder createDictionary:inDictionary:].cold.5();
        }
      }
      else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      {
        -[UARPDynamicAssetCrashLogDecoder createDictionary:inDictionary:]();
      }
    }
    else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
    {
      -[UARPDynamicAssetCrashLogDecoder createDictionary:inDictionary:]();
    }
    BOOL v24 = 0;
LABEL_29:

    goto LABEL_30;
  }
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
    -[UARPDynamicAssetCrashLogDecoder copySectionName:inDictionary:]();
  }
  BOOL v24 = 0;
LABEL_30:

  return v24;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionName, 0);
  objc_storeStrong((id *)&self->_cmapDictionary, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)decodeCrashLog:(int *)a1 inDictionary:(NSObject *)a2 .cold.1(int *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_21E079000, a2, OS_LOG_TYPE_ERROR, "UUID (%u) is not defined. Cannot Decode crashLog Dictionary", (uint8_t *)v3, 8u);
}

- (void)copySectionName:inDictionary:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4(&dword_21E079000, v0, v1, "Unable to find 'crashLogKey' in CMAP input dictionary.", v2, v3, v4, v5, v6);
}

- (void)copySectionName:(uint64_t)a1 inDictionary:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21E079000, a2, OS_LOG_TYPE_ERROR, "Unable to find value for key:%@ in crash log dictionary.", (uint8_t *)&v2, 0xCu);
}

- (void)createDictionary:inDictionary:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4(&dword_21E079000, v0, v1, "Unable to find 'decodedChildKey' in CMAP input dictionary.", v2, v3, v4, v5, v6);
}

- (void)createDictionary:inDictionary:.cold.3()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4(&dword_21E079000, v0, v1, "Unable to find 'decodedParentKey' in CMAP input dictionary.", v2, v3, v4, v5, v6);
}

- (void)createDictionary:(uint64_t)a1 inDictionary:(NSObject *)a2 .cold.4(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21E079000, a2, OS_LOG_TYPE_ERROR, "Crash Log is missing a CMAP specified Key: %@", (uint8_t *)&v2, 0xCu);
}

- (void)createDictionary:inDictionary:.cold.5()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4(&dword_21E079000, v0, v1, "Every key in CMAP must have a Decoded Key for Crash Tracer", v2, v3, v4, v5, v6);
}

@end