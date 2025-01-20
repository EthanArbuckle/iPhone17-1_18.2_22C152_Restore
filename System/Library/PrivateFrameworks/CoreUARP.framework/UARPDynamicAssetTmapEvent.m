@interface UARPDynamicAssetTmapEvent
+ (BOOL)supportsSecureCoding;
- (NSString)eventName;
- (UARPDynamicAssetTmapEvent)init;
- (UARPDynamicAssetTmapEvent)initWithCoder:(id)a3;
- (UARPDynamicAssetTmapEvent)initWithEventFields:(id)a3 eventID:(unsigned int)a4 endian:(id)a5;
- (id)expandMticData:(id)a3;
- (unsigned)eventID;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UARPDynamicAssetTmapEvent

- (UARPDynamicAssetTmapEvent)init
{
  return 0;
}

- (UARPDynamicAssetTmapEvent)initWithEventFields:(id)a3 eventID:(unsigned int)a4 endian:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  v32.receiver = self;
  v32.super_class = (Class)UARPDynamicAssetTmapEvent;
  v10 = [(UARPDynamicAssetTmapEvent *)&v32 init];
  if (!v10)
  {
LABEL_13:
    v25 = 0;
    goto LABEL_14;
  }
  os_log_t v11 = os_log_create("com.apple.accessoryupdater.uarp", "tmap");
  log = v10->_log;
  v10->_log = (OS_os_log *)v11;

  v10->_eventID = a4;
  v13 = [v8 objectForKeyedSubscript:@"EventName"];
  uint64_t v14 = [v13 copy];
  eventName = v10->_eventName;
  v10->_eventName = (NSString *)v14;

  if (!v10->_eventName)
  {
    v26 = v10->_log;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[UARPDynamicAssetTmapEvent initWithEventFields:eventID:endian:](v26);
    }
    goto LABEL_13;
  }
  id v16 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v17 = objc_msgSend(v8, "objectForKeyedSubscript:", @"EventFields", 0);
  uint64_t v18 = [v17 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v29 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = [[TmapFieldTLV alloc] initWithDictionary:*(void *)(*((void *)&v28 + 1) + 8 * i) endian:v9];
        [v16 addObject:v22];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v19);
  }

  uint64_t v23 = [MEMORY[0x263EFF8C0] arrayWithArray:v16];
  eventFields = v10->_eventFields;
  v10->_eventFields = (NSArray *)v23;

  v25 = v10;
LABEL_14:

  return v25;
}

- (UARPDynamicAssetTmapEvent)initWithCoder:(id)a3
{
  v18[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)UARPDynamicAssetTmapEvent;
  v5 = [(UARPDynamicAssetTmapEvent *)&v17 init];
  if (v5)
  {
    v5->_eventID = [v4 decodeIntForKey:@"EventID"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EventName"];
    eventName = v5->_eventName;
    v5->_eventName = (NSString *)v6;

    id v8 = (void *)MEMORY[0x263EFFA08];
    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];
    v10 = [v8 setWithArray:v9];
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"EventFields"];
    eventFields = v5->_eventFields;
    v5->_eventFields = (NSArray *)v11;

    os_log_t v13 = os_log_create("com.apple.accessoryupdater.uarp", "tmap");
    log = v5->_log;
    v5->_log = (OS_os_log *)v13;

    v15 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t eventID = self->_eventID;
  id v5 = a3;
  [v5 encodeInteger:eventID forKey:@"EventID"];
  [v5 encodeObject:self->_eventName forKey:@"EventName"];
  [v5 encodeObject:self->_eventFields forKey:@"EventFields"];
}

- (id)expandMticData:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_opt_new();
  uint64_t v6 = (void *)[(NSString *)self->_eventName copy];
  [v5 setObject:v6 forKeyedSubscript:@"EventName"];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v7 = self->_eventFields;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v7);
        }
        os_log_t v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (![v13 expandFieldData:v4 withOffset:v10 inCoreAnalytics:v5]
          || (uint64_t v17 = 0, ![v13 getNextOffset:&v17 fromStart:v10]))
        {

          goto LABEL_17;
        }
        uint64_t v10 = v17;
      }
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  if (v10 == [v4 length])
  {
    uint64_t v14 = (void *)[v5 copy];
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      [(UARPDynamicAssetTmapEvent *)log expandMticData:v10];
    }
LABEL_17:
    uint64_t v14 = 0;
  }

  return v14;
}

- (unsigned)eventID
{
  return self->_eventID;
}

- (NSString)eventName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventName, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_eventFields, 0);
}

- (void)initWithEventFields:(os_log_t)log eventID:endian:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "-[UARPDynamicAssetTmapEvent initWithEventFields:eventID:endian:]";
  _os_log_error_impl(&dword_21E079000, log, OS_LOG_TYPE_ERROR, "%s: Event Name doesn't exist in Tmap Event", (uint8_t *)&v1, 0xCu);
}

- (void)expandMticData:(uint64_t)a3 .cold.1(void *a1, void *a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a1;
  int v6 = 134218240;
  uint64_t v7 = [a2 length];
  __int16 v8 = 2048;
  uint64_t v9 = a3;
  _os_log_error_impl(&dword_21E079000, v5, OS_LOG_TYPE_ERROR, "Lengths of MTIC Data(%lu) and TMAP Data(%lu) do not match.", (uint8_t *)&v6, 0x16u);
}

@end