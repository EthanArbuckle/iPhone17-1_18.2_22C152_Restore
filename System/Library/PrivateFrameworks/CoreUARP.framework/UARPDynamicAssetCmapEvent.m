@interface UARPDynamicAssetCmapEvent
+ (BOOL)supportsSecureCoding;
+ (id)encodedClasses;
- (BOOL)decodeCrash:(id)a3 inDictionary:(id)a4;
- (BOOL)isSection:(id)a3;
- (UARPDynamicAssetCmapEvent)init;
- (UARPDynamicAssetCmapEvent)initWithCoder:(id)a3;
- (UARPDynamicAssetCmapEvent)initWithSectionName:(id)a3 decoderId:(unsigned int)a4 inputDictionary:(id)a5;
- (unsigned)decoderId;
- (unsigned)uuid;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UARPDynamicAssetCmapEvent

- (UARPDynamicAssetCmapEvent)init
{
  return 0;
}

- (UARPDynamicAssetCmapEvent)initWithSectionName:(id)a3 decoderId:(unsigned int)a4 inputDictionary:(id)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  v30.receiver = self;
  v30.super_class = (Class)UARPDynamicAssetCmapEvent;
  v10 = [(UARPDynamicAssetCmapEvent *)&v30 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    sectionName = v10->_sectionName;
    v10->_sectionName = (NSString *)v11;

    os_log_t v13 = os_log_create("com.apple.accessoryupdater.uarp", "crsh");
    log = v10->_log;
    v10->_log = (OS_os_log *)v13;

    v10->_decoderId = a4;
    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    input = v10->_input;
    v10->_input = v15;

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v17 = objc_msgSend(v9, "allKeys", 0);
    uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v27 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          v23 = v10->_input;
          v24 = [v9 objectForKeyedSubscript:v22];
          [(NSMutableDictionary *)v23 setValue:v24 forKey:v22];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v19);
    }
  }
  return v10;
}

- (UARPDynamicAssetCmapEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)UARPDynamicAssetCmapEvent;
  v5 = [(UARPDynamicAssetCmapEvent *)&v18 init];
  if (v5)
  {
    v5->_decoderId = [v4 decodeIntForKey:@"decoderId"];
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    input = v5->_input;
    v5->_input = v6;

    id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"input"];
    id v9 = +[UARPDynamicAssetCmapEvent encodedClasses];
    uint64_t v10 = [MEMORY[0x263F08928] unarchivedObjectOfClasses:v9 fromData:v8 error:0];
    uint64_t v11 = v5->_input;
    v5->_input = (NSMutableDictionary *)v10;

    if (!v5->_input && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[UARPDynamicAssetCmapEvent initWithCoder:]();
    }
    os_log_t v12 = os_log_create("com.apple.accessoryupdater.uarp", "crsh");
    log = v5->_log;
    v5->_log = (OS_os_log *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SectionName"];
    sectionName = v5->_sectionName;
    v5->_sectionName = (NSString *)v14;

    v16 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t decoderId = self->_decoderId;
  id v5 = a3;
  [v5 encodeInt:decoderId forKey:@"decoderId"];
  id v6 = [MEMORY[0x263F08910] archivedDataWithRootObject:self->_input requiringSecureCoding:1 error:0];
  [v5 encodeObject:v6 forKey:@"input"];
  [v5 encodeObject:self->_sectionName forKey:@"SectionName"];
}

- (BOOL)isSection:(id)a3
{
  return [(NSString *)self->_sectionName isEqualToString:a3];
}

- (BOOL)decodeCrash:(id)a3 inDictionary:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[UARPDynamicAssetCrashLogDecoder alloc] initWithDecoderId:self->_decoderId sectionName:self->_sectionName inputDictionary:self->_input];
  BOOL v9 = [(UARPDynamicAssetCrashLogDecoder *)v8 decodeCrashLog:v7 inDictionary:v6];

  return v9;
}

+ (id)encodedClasses
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  v3 = [MEMORY[0x263EFFA08] setWithArray:v2];

  return v3;
}

- (unsigned)uuid
{
  return self->_uuid;
}

- (unsigned)decoderId
{
  return self->_decoderId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_input, 0);
  objc_storeStrong((id *)&self->_sectionName, 0);
}

- (void)initWithCoder:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_21E079000, &_os_log_internal, OS_LOG_TYPE_ERROR, "CMAP input is NULL", v0, 2u);
}

@end