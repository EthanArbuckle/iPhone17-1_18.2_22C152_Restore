@interface ASDDSPConfiguration
- (ASDDSPConfiguration)initWithArray:(id)a3 resourcePath:(id)a4;
- (NSArray)dspItems;
- (void)setDspItems:(id)a3;
@end

@implementation ASDDSPConfiguration

- (ASDDSPConfiguration)initWithArray:(id)a3 resourcePath:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v32.receiver = self;
  v32.super_class = (Class)ASDDSPConfiguration;
  v8 = [(ASDDSPConfiguration *)&v32 init];
  if (v8)
  {
    v9 = [MEMORY[0x263EFF980] array];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v27 = v6;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v29;
      while (2)
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v29 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v28 + 1) + 8 * v14);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v16 = [[ASDDSPItemInfo alloc] initWithDictionary:v15 resourcePath:v7];
            if (!v16)
            {

              BOOL v18 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
              if (v18) {
                -[ASDDSPConfiguration initWithArray:resourcePath:](v18, v19, v20, v21, v22, v23, v24, v25);
              }

              v8 = 0;
              goto LABEL_16;
            }
            v17 = v16;
            [v9 addObject:v16];
          }
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v28 objects:v33 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    objc_storeStrong((id *)&v8->_dspItems, v9);
LABEL_16:
    id v6 = v27;
  }
  return v8;
}

- (NSArray)dspItems
{
  return self->_dspItems;
}

- (void)setDspItems:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)initWithArray:(uint64_t)a3 resourcePath:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end