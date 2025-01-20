@interface CMIOExtensionStreamCustomClockConfiguration
+ (BOOL)supportsSecureCoding;
+ (CMIOExtensionStreamCustomClockConfiguration)customClockConfigurationWithClockName:(NSString *)clockName sourceIdentifier:(NSUUID *)sourceIdentifier getTimeCallMinimumInterval:(CMTime *)getTimeCallMinimumInterval numberOfEventsForRateSmoothing:(uint32_t)numberOfEventsForRateSmoothing numberOfAveragesForRateSmoothing:(uint32_t)numberOfAveragesForRateSmoothing;
- (BOOL)isEqual:(id)a3;
- (CMIOExtensionStreamCustomClockConfiguration)initWithClockName:(NSString *)clockName sourceIdentifier:(NSUUID *)sourceIdentifier getTimeCallMinimumInterval:(CMTime *)getTimeCallMinimumInterval numberOfEventsForRateSmoothing:(uint32_t)numberOfEventsForRateSmoothing numberOfAveragesForRateSmoothing:(uint32_t)numberOfAveragesForRateSmoothing;
- (CMIOExtensionStreamCustomClockConfiguration)initWithCoder:(id)a3;
- (CMIOExtensionStreamCustomClockConfiguration)initWithXPCDictionary:(id)a3;
- (CMTime)getTimeCallMinimumInterval;
- (NSString)clockName;
- (NSUUID)sourceIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyXPCDictionary;
- (uint32_t)numberOfAveragesForRateSmoothing;
- (uint32_t)numberOfEventsForRateSmoothing;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CMIOExtensionStreamCustomClockConfiguration

+ (CMIOExtensionStreamCustomClockConfiguration)customClockConfigurationWithClockName:(NSString *)clockName sourceIdentifier:(NSUUID *)sourceIdentifier getTimeCallMinimumInterval:(CMTime *)getTimeCallMinimumInterval numberOfEventsForRateSmoothing:(uint32_t)numberOfEventsForRateSmoothing numberOfAveragesForRateSmoothing:(uint32_t)numberOfAveragesForRateSmoothing
{
  uint64_t v7 = *(void *)&numberOfAveragesForRateSmoothing;
  uint64_t v8 = *(void *)&numberOfEventsForRateSmoothing;
  id v12 = objc_alloc((Class)objc_opt_class());
  CMTime v14 = *getTimeCallMinimumInterval;
  return (CMIOExtensionStreamCustomClockConfiguration *)(id)[v12 initWithClockName:clockName sourceIdentifier:sourceIdentifier getTimeCallMinimumInterval:&v14 numberOfEventsForRateSmoothing:v8 numberOfAveragesForRateSmoothing:v7];
}

- (CMIOExtensionStreamCustomClockConfiguration)initWithClockName:(NSString *)clockName sourceIdentifier:(NSUUID *)sourceIdentifier getTimeCallMinimumInterval:(CMTime *)getTimeCallMinimumInterval numberOfEventsForRateSmoothing:(uint32_t)numberOfEventsForRateSmoothing numberOfAveragesForRateSmoothing:(uint32_t)numberOfAveragesForRateSmoothing
{
  v18.receiver = self;
  v18.super_class = (Class)CMIOExtensionStreamCustomClockConfiguration;
  id v12 = [(CMIOExtensionStreamCustomClockConfiguration *)&v18 init];
  if (v12)
  {
    if (clockName)
    {
      *((void *)v12 + 1) = [(NSString *)clockName copy];
      if (sourceIdentifier)
      {
        *((void *)v12 + 2) = [(NSUUID *)sourceIdentifier copy];
        CMTimeEpoch epoch = getTimeCallMinimumInterval->epoch;
        *(_OWORD *)(v12 + 24) = *(_OWORD *)&getTimeCallMinimumInterval->value;
        *((void *)v12 + 5) = epoch;
        if (numberOfEventsForRateSmoothing)
        {
          *((_DWORD *)v12 + 12) = numberOfEventsForRateSmoothing;
          *((_DWORD *)v12 + 13) = numberOfAveragesForRateSmoothing;
          return (CMIOExtensionStreamCustomClockConfiguration *)v12;
        }
        CMTime v14 = (void *)MEMORY[0x263EFF940];
        uint64_t v15 = *MEMORY[0x263EFF4A0];
        v16 = @"Invalid number of events for rate smoothing";
      }
      else
      {
        CMTime v14 = (void *)MEMORY[0x263EFF940];
        uint64_t v15 = *MEMORY[0x263EFF4A0];
        v16 = @"Invalid source identifier";
      }
    }
    else
    {
      CMTime v14 = (void *)MEMORY[0x263EFF940];
      uint64_t v15 = *MEMORY[0x263EFF4A0];
      v16 = @"Invalid clock name";
    }
    [v14 raise:v15 format:v16];

    return 0;
  }
  return (CMIOExtensionStreamCustomClockConfiguration *)v12;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CMIOExtensionStreamCustomClockConfiguration;
  [(CMIOExtensionStreamCustomClockConfiguration *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    uint64_t v13 = v3;
    uint64_t v14 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_12;
    }
    int v7 = -[NSString isEqualToString:](self->_clockName, "isEqualToString:", [a3 clockName]);
    if (v7)
    {
      int v7 = -[NSUUID isEqual:](self->_sourceIdentifier, "isEqual:", [a3 sourceIdentifier]);
      if (v7)
      {
        if (a3) {
          [a3 getTimeCallMinimumInterval];
        }
        else {
          memset(&time2, 0, sizeof(time2));
        }
        $95D729B680665BEAEFA1D6FCA8238556 getTimeCallMinimumInterval = self->_getTimeCallMinimumInterval;
        if (!CMTimeCompare((CMTime *)&getTimeCallMinimumInterval, &time2))
        {
          unsigned int numberOfEventsForRateSmoothing = self->_numberOfEventsForRateSmoothing;
          if (numberOfEventsForRateSmoothing == [a3 numberOfEventsForRateSmoothing])
          {
            unsigned int numberOfAveragesForRateSmoothing = self->_numberOfAveragesForRateSmoothing;
            LOBYTE(v7) = numberOfAveragesForRateSmoothing == [a3 numberOfAveragesForRateSmoothing];
            return v7;
          }
        }
LABEL_12:
        LOBYTE(v7) = 0;
      }
    }
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"%@ can only be encoded as part of an xpc message", self format];
  }
  id v5 = [(CMIOExtensionStreamCustomClockConfiguration *)self copyXPCDictionary];
  if (v5)
  {
    v6 = v5;
    [a3 encodeXPCObject:v5 forKey:@"streamCustomClockConfiguration"];
    xpc_release(v6);
  }
  else
  {
    int v7 = CMIOLog();
    if (v7 && os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[CMIOExtensionStreamCustomClockConfiguration encodeWithCoder:]();
    }
  }
}

- (CMIOExtensionStreamCustomClockConfiguration)initWithCoder:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"%@ can only be encoded as part of an xpc message", self format];
  }
  uint64_t v5 = [a3 decodeXPCObjectOfType:MEMORY[0x263EF8708] forKey:@"streamCustomClockConfiguration"];
  if (!v5) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"%@ nil xpc object", self format];
  }

  return [(CMIOExtensionStreamCustomClockConfiguration *)self initWithXPCDictionary:v5];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = +[CMIOExtensionStreamCustomClockConfiguration allocWithZone:a3];
  clockName = self->_clockName;
  sourceIdentifier = self->_sourceIdentifier;
  uint64_t numberOfEventsForRateSmoothing = self->_numberOfEventsForRateSmoothing;
  uint64_t numberOfAveragesForRateSmoothing = self->_numberOfAveragesForRateSmoothing;
  $95D729B680665BEAEFA1D6FCA8238556 getTimeCallMinimumInterval = self->_getTimeCallMinimumInterval;
  return [(CMIOExtensionStreamCustomClockConfiguration *)v4 initWithClockName:clockName sourceIdentifier:sourceIdentifier getTimeCallMinimumInterval:&getTimeCallMinimumInterval numberOfEventsForRateSmoothing:numberOfEventsForRateSmoothing numberOfAveragesForRateSmoothing:numberOfAveragesForRateSmoothing];
}

- (id)copyXPCDictionary
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "clockName", [(NSString *)self->_clockName UTF8String]);
  xpc_dictionary_set_string(v3, "sourceIdentifier", (const char *)objc_msgSend((id)objc_msgSend(NSString, "stringWithString:", -[NSUUID UUIDString](self->_sourceIdentifier, "UUIDString")), "UTF8String"));
  xpc_dictionary_set_data(v3, "getTimeCallMinimumInterval", &self->_getTimeCallMinimumInterval, 0x18uLL);
  xpc_dictionary_set_uint64(v3, "numberOfEventsForRateSmoothing", self->_numberOfEventsForRateSmoothing);
  xpc_dictionary_set_uint64(v3, "numberOfAveragesForRateSmoothing", self->_numberOfAveragesForRateSmoothing);
  return v3;
}

- (CMIOExtensionStreamCustomClockConfiguration)initWithXPCDictionary:(id)a3
{
  if (a3)
  {
    long long v18 = *MEMORY[0x263F01090];
    uint64_t v19 = *(void *)(MEMORY[0x263F01090] + 16);
    string = xpc_dictionary_get_string(a3, "clockName");
    if (string) {
      v6 = (__CFString *)[NSString stringWithCString:string encoding:4];
    }
    else {
      v6 = @"unknown";
    }
    uint64_t v8 = xpc_dictionary_get_string(a3, "sourceIdentifier");
    if (v8)
    {
      uint64_t v9 = [NSString stringWithCString:v8 encoding:4];
      id v10 = (id)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v9];
    }
    else
    {
      id v10 = (id)[MEMORY[0x263F08C38] UUID];
    }
    id v11 = v10;
    size_t length = 24;
    data = xpc_dictionary_get_data(a3, "getTimeCallMinimumInterval", &length);
    if (data)
    {
      long long v18 = *(_OWORD *)data;
      uint64_t v19 = data[2];
    }
    uint64_t uint64 = xpc_dictionary_get_uint64(a3, "numberOfEventsForRateSmoothing");
    uint64_t v14 = xpc_dictionary_get_uint64(a3, "numberOfAveragesForRateSmoothing");
    long long v15 = v18;
    uint64_t v16 = v19;
    return [(CMIOExtensionStreamCustomClockConfiguration *)self initWithClockName:v6 sourceIdentifier:v11 getTimeCallMinimumInterval:&v15 numberOfEventsForRateSmoothing:uint64 numberOfAveragesForRateSmoothing:v14];
  }
  else
  {

    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"nil xpc dictionary"];
    return 0;
  }
}

- (NSString)clockName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSUUID)sourceIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (CMTime)getTimeCallMinimumInterval
{
  objc_copyStruct(retstr, &self->_getTimeCallMinimumInterval, 24, 1, 0);
  return result;
}

- (uint32_t)numberOfEventsForRateSmoothing
{
  return self->_numberOfEventsForRateSmoothing;
}

- (uint32_t)numberOfAveragesForRateSmoothing
{
  return self->_numberOfAveragesForRateSmoothing;
}

- (void)encodeWithCoder:.cold.1()
{
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2432B6000, v0, v1, "%s:%d:%s copyXPCDictionary failed", v2, v3, v4, v5, v6);
}

@end