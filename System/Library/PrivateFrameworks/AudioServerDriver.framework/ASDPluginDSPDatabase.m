@interface ASDPluginDSPDatabase
- (ASDPluginDSPDatabase)initWithDictionary:(id)a3 resourcePath:(id)a4;
- (NSDictionary)deviceDatabases;
@end

@implementation ASDPluginDSPDatabase

- (ASDPluginDSPDatabase)initWithDictionary:(id)a3 resourcePath:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v34.receiver = self;
  v34.super_class = (Class)ASDPluginDSPDatabase;
  v8 = [(ASDPluginDSPDatabase *)&v34 init];
  if (v8)
  {
    v9 = [MEMORY[0x263EFF9A0] dictionary];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v31;
      v28 = v8;
      id v29 = v6;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v31 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v30 + 1) + 8 * i);
          v16 = objc_msgSend(v10, "objectForKeyedSubscript:", v15, v28);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0
            || (v17 = [[ASDAudioDeviceDSPDatabase alloc] initWithDictionary:v16 resourcePath:v7 deviceUID:v15]) == 0)
          {

            BOOL v19 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
            if (v19) {
              -[ASDPluginDSPDatabase initWithDictionary:resourcePath:](v19, v20, v21, v22, v23, v24, v25, v26);
            }

            v8 = 0;
            id v6 = v29;
            goto LABEL_15;
          }
          v18 = v17;
          [v9 setObject:v17 forKey:v15];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v30 objects:v35 count:16];
        v8 = v28;
        id v6 = v29;
        if (v12) {
          continue;
        }
        break;
      }
    }

    objc_storeStrong((id *)&v8->_deviceDatabases, v9);
LABEL_15:
  }
  return v8;
}

- (NSDictionary)deviceDatabases
{
  return self->_deviceDatabases;
}

- (void).cxx_destruct
{
}

- (void)initWithDictionary:(uint64_t)a3 resourcePath:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end