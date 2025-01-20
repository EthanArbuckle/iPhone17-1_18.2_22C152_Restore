@interface UARPDynamicAssetCmapMapping
+ (BOOL)supportsSecureCoding;
+ (id)tag;
- (BOOL)appendCmapEvents:(id)a3;
- (BOOL)isEqualAppleModel:(id)a3;
- (UARPDynamicAssetCmapMapping)init;
- (UARPDynamicAssetCmapMapping)initWithCoder:(id)a3;
- (UARPDynamicAssetCmapMapping)initWithEvents:(id)a3 appleModelNumber:(id)a4;
- (id)expandCrshDictionary:(id)a3;
- (id)findCmapEvent:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UARPDynamicAssetCmapMapping

- (UARPDynamicAssetCmapMapping)init
{
  return 0;
}

- (UARPDynamicAssetCmapMapping)initWithEvents:(id)a3 appleModelNumber:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = (OS_os_log *)os_log_create("com.apple.accessoryupdater.uarp", "crsh");
  log = self->_log;
  self->_log = v8;

  objc_storeStrong((id *)&self->_appleModelNumber, a4);
  id v29 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v6;
  uint64_t v10 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v31;
    id v26 = v7;
    v27 = self;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v31 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        v15 = objc_msgSend(v14, "objectForKeyedSubscript:", @"decoderId", v26);
        if (!v15) {
          goto LABEL_23;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (os_log_type_enabled((os_log_t)v27->_log, OS_LOG_TYPE_ERROR)) {
            -[UARPDynamicAssetCmapMapping initWithEvents:appleModelNumber:]();
          }
          goto LABEL_23;
        }
        uint64_t v16 = [v15 unsignedIntValue];
        v17 = [v14 objectForKeyedSubscript:@"SectionName"];
        if (!v17) {
          goto LABEL_22;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (os_log_type_enabled((os_log_t)v27->_log, OS_LOG_TYPE_ERROR)) {
            -[UARPDynamicAssetCmapMapping initWithEvents:appleModelNumber:]();
          }
          goto LABEL_22;
        }
        v18 = [v14 objectForKeyedSubscript:@"InputDictionary"];
        if (!v18) {
          goto LABEL_21;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (os_log_type_enabled((os_log_t)v27->_log, OS_LOG_TYPE_ERROR)) {
            -[UARPDynamicAssetCmapMapping initWithEvents:appleModelNumber:]();
          }
LABEL_21:

LABEL_22:
LABEL_23:

          v20 = obj;
          v24 = 0;
          id v7 = v26;
          self = v27;
          v21 = v29;
          goto LABEL_24;
        }
        v19 = [[UARPDynamicAssetCmapEvent alloc] initWithSectionName:v17 decoderId:v16 inputDictionary:v18];
        [v29 addObject:v19];
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      id v7 = v26;
      self = v27;
      if (v11) {
        continue;
      }
      break;
    }
  }
  v20 = obj;

  v21 = v29;
  v22 = (NSArray *)[v29 copy];
  cmapEvents = self->_cmapEvents;
  self->_cmapEvents = v22;

  v24 = self;
LABEL_24:

  return v24;
}

- (UARPDynamicAssetCmapMapping)initWithCoder:(id)a3
{
  v22[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)UARPDynamicAssetCmapMapping;
  v5 = [(UARPDynamicAssetCmapMapping *)&v19 init];
  if (v5)
  {
    os_log_t v6 = os_log_create("com.apple.accessoryupdater.uarp", "crsh");
    log = v5->_log;
    v5->_log = (OS_os_log *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AppleModelNumber"];
    appleModelNumber = v5->_appleModelNumber;
    v5->_appleModelNumber = (NSString *)v8;

    uint64_t v10 = (void *)MEMORY[0x263EFFA08];
    v22[0] = objc_opt_class();
    v22[1] = objc_opt_class();
    uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
    uint64_t v12 = [v10 setWithArray:v11];
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"CmapEvents"];
    cmapEvents = v5->_cmapEvents;
    v5->_cmapEvents = (NSArray *)v13;

    v15 = v5->_log;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = v5->_appleModelNumber;
      *(_DWORD *)buf = 138412290;
      v21 = v16;
      _os_log_impl(&dword_21E079000, v15, OS_LOG_TYPE_INFO, "amn: %@", buf, 0xCu);
    }
    v17 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  appleModelNumber = self->_appleModelNumber;
  id v5 = a3;
  [v5 encodeObject:appleModelNumber forKey:@"AppleModelNumber"];
  [v5 encodeObject:self->_cmapEvents forKey:@"CmapEvents"];
}

- (BOOL)isEqualAppleModel:(id)a3
{
  return [(NSString *)self->_appleModelNumber isEqualToString:a3];
}

- (id)findCmapEvent:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = self->_cmapEvents;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v10, "isSection:", v4, (void)v14))
        {
          id v12 = v10;

          goto LABEL_13;
        }
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
    -[UARPDynamicAssetCmapMapping findCmapEvent:](log);
  }
  id v12 = 0;
LABEL_13:

  return v12;
}

- (BOOL)appendCmapEvents:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)[(NSArray *)self->_cmapEvents mutableCopy];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v6 = (NSArray *)v4;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v30;
    uint64_t v10 = @"SectionName";
    v28 = v5;
    id v26 = @"decoderId";
    while (2)
    {
      uint64_t v11 = 0;
      uint64_t v27 = v8;
      do
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v29 + 1) + 8 * v11);
        uint64_t v13 = objc_msgSend(v12, "objectForKeyedSubscript:", v10, v26);
        if (!v13) {
          goto LABEL_25;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
            -[UARPDynamicAssetCmapMapping initWithEvents:appleModelNumber:]();
          }
          goto LABEL_25;
        }
        long long v14 = [(UARPDynamicAssetCmapMapping *)self findCmapEvent:v13];
        if (!v14)
        {
          long long v15 = [v12 objectForKeyedSubscript:@"InputDictionary"];
          if (!v15) {
            goto LABEL_24;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
              -[UARPDynamicAssetCmapMapping initWithEvents:appleModelNumber:]();
            }
            goto LABEL_24;
          }
          long long v16 = [v12 objectForKeyedSubscript:v26];
          if (!v16) {
            goto LABEL_23;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
              -[UARPDynamicAssetCmapMapping appendCmapEvents:]();
            }
LABEL_23:

LABEL_24:
LABEL_25:

            BOOL v24 = 0;
            cmapEvents = v6;
            id v5 = v28;
            goto LABEL_26;
          }
          long long v17 = self;
          v18 = v10;
          uint64_t v19 = v9;
          v20 = v6;
          v21 = -[UARPDynamicAssetCmapEvent initWithSectionName:decoderId:inputDictionary:]([UARPDynamicAssetCmapEvent alloc], "initWithSectionName:decoderId:inputDictionary:", v13, [v16 unsignedIntValue], v15);
          [v28 addObject:v21];

          uint64_t v6 = v20;
          uint64_t v9 = v19;
          uint64_t v10 = v18;
          self = v17;
          uint64_t v8 = v27;
        }
        ++v11;
      }
      while (v8 != v11);
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v29 objects:v33 count:16];
      id v5 = v28;
      if (v8) {
        continue;
      }
      break;
    }
  }

  v22 = (NSArray *)[v5 copy];
  cmapEvents = self->_cmapEvents;
  self->_cmapEvents = v22;
  BOOL v24 = 1;
LABEL_26:

  return v24;
}

- (id)expandCrshDictionary:(id)a3
{
  v42[9] = *MEMORY[0x263EF8340];
  id v28 = a3;
  id v4 = objc_opt_new();
  v41[0] = @"mailboxes";
  long long v30 = objc_opt_new();
  v42[0] = v30;
  v41[1] = @"panic";
  long long v29 = [MEMORY[0x263EFF9D0] null];
  v42[1] = v29;
  v41[2] = @"crashlog-version";
  id v26 = [MEMORY[0x263EFF9D0] null];
  v42[2] = v26;
  v41[3] = @"exception";
  id v5 = [MEMORY[0x263EFF9D0] null];
  v42[3] = v5;
  v41[4] = @"uuid";
  uint64_t v6 = [MEMORY[0x263EFF9D0] null];
  v42[4] = v6;
  v41[5] = @"call-stack";
  uint64_t v7 = [MEMORY[0x263EFF9D0] null];
  v42[5] = v7;
  v41[6] = @"tasks";
  uint64_t v8 = [MEMORY[0x263EFF9D0] null];
  v42[6] = v8;
  v41[7] = @"registers";
  uint64_t v9 = [MEMORY[0x263EFF9D0] null];
  v42[7] = v9;
  v41[8] = @"scenario";
  uint64_t v10 = [MEMORY[0x263EFF9D0] null];
  v42[8] = v10;
  uint64_t v11 = [NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:9];
  id v31 = v4;
  [v4 setDictionary:v11];

  id v12 = [v28 objectForKeyedSubscript:@"panic"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 setObject:v12 forKey:@"panic"];
  }
  uint64_t v13 = [v28 objectForKeyedSubscript:@"crashlog-version"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 setObject:v13 forKey:@"crashlog-version"];
  }
  uint64_t v14 = [v28 objectForKeyedSubscript:@"exception"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 setObject:v14 forKey:@"exception"];
  }
  uint64_t v27 = (void *)v14;
  long long v15 = [v28 objectForKeyedSubscript:@"sections"];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v33;
    uint64_t v19 = &_os_log_internal;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v33 != v18) {
          objc_enumerationMutation(v15);
        }
        v21 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        v22 = [v21 objectForKeyedSubscript:@"section-name"];
        v23 = [(UARPDynamicAssetCmapMapping *)self findCmapEvent:v22];
        BOOL v24 = v23;
        if (v23)
        {
          if (([v23 decodeCrash:v21 inDictionary:v31] & 1) == 0
            && os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            [(UARPDynamicAssetCmapMapping *)v36 expandCrshDictionary:&v37];
          }
        }
        else if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          [(UARPDynamicAssetCmapMapping *)buf expandCrshDictionary:&v39];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v17);
  }

  return v31;
}

+ (id)tag
{
  v2 = [[UARPAssetTag alloc] initWithString:@"CMAP"];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cmapEvents, 0);
  objc_storeStrong((id *)&self->_appleModelNumber, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)initWithEvents:appleModelNumber:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_21E079000, v0, v1, "CMAP Input Dictionary must be Dictionary: %@", v2, v3, v4, v5, v6);
}

- (void)initWithEvents:appleModelNumber:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_21E079000, v0, v1, "CMAP Section Name must be String: %@", v2, v3, v4, v5, v6);
}

- (void)initWithEvents:appleModelNumber:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_21E079000, v0, v1, "CMAP decoder Id must be Number: %@", v2, v3, v4, v5, v6);
}

- (void)findCmapEvent:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_21E079000, log, OS_LOG_TYPE_ERROR, "Unable to find matching CMAP Event.", v1, 2u);
}

- (void)appendCmapEvents:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_21E079000, v0, v1, "CMAP decoderId must be Number: %@", v2, v3, v4, v5, v6);
}

- (void)expandCrshDictionary:(void *)a3 .cold.1(uint8_t *buf, uint64_t a2, void *a3)
{
  *(_DWORD *)buf = 138412290;
  *a3 = a2;
  _os_log_error_impl(&dword_21E079000, &_os_log_internal, OS_LOG_TYPE_ERROR, "No Cmap Event for SectionName:%@", buf, 0xCu);
}

- (void)expandCrshDictionary:(void *)a3 .cold.2(uint8_t *buf, uint64_t a2, void *a3)
{
  *(_DWORD *)buf = 138412290;
  *a3 = a2;
  _os_log_error_impl(&dword_21E079000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Unable to add section:%@", buf, 0xCu);
}

@end