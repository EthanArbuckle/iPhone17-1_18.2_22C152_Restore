@interface BMMicroLocationNumDevicesPerTechnology
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMMicroLocationNumDevicesPerTechnology)initWithProto:(id)a3;
- (BMMicroLocationNumDevicesPerTechnology)initWithProtoData:(id)a3;
- (BMMicroLocationNumDevicesPerTechnology)initWithTechnology:(id)a3 numDevices:(unsigned int)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)technology;
- (id)encodeAsProto;
- (id)proto;
- (unint64_t)hash;
- (unsigned)dataVersion;
- (unsigned)numDevices;
@end

@implementation BMMicroLocationNumDevicesPerTechnology

- (BMMicroLocationNumDevicesPerTechnology)initWithTechnology:(id)a3 numDevices:(unsigned int)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BMMicroLocationNumDevicesPerTechnology;
  v7 = [(BMMicroLocationNumDevicesPerTechnology *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    technology = v7->_technology;
    v7->_technology = (NSString *)v8;

    v7->_numDevices = a4;
  }

  return v7;
}

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v6 = a3;
  if (a4 == 1)
  {
    v7 = (void *)[objc_alloc((Class)a1) initWithProtoData:v6];
  }
  else
  {
    uint64_t v8 = __biome_log_for_category();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[BMMicroLocationNumDevicesPerTechnology eventWithData:dataVersion:]();
    }

    v7 = 0;
  }

  return v7;
}

- (id)encodeAsProto
{
  v2 = [(BMMicroLocationNumDevicesPerTechnology *)self proto];
  v3 = [v2 data];

  return v3;
}

- (BMMicroLocationNumDevicesPerTechnology)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      if ([v5 hasTechnologyString]
        && ([v5 hasNumber] & 1) != 0)
      {
        id v6 = [v5 technologyString];
        self = [(BMMicroLocationNumDevicesPerTechnology *)self initWithTechnology:v6 numDevices:[v5 number]];

        v7 = self;
LABEL_13:

        goto LABEL_14;
      }
      uint64_t v8 = __biome_log_for_category();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        -[BMMicroLocationNumDevicesPerTechnology initWithProto:]();
      }
    }
    else
    {
      v5 = __biome_log_for_category();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[BMMicroLocationNumDevicesPerTechnology initWithProto:]();
      }
    }
    v7 = 0;
    goto LABEL_13;
  }
  v7 = 0;
LABEL_14:

  return v7;
}

- (BMMicroLocationNumDevicesPerTechnology)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [[BMPBNumDevicesPerTechnology alloc] initWithData:v4];

    self = [(BMMicroLocationNumDevicesPerTechnology *)self initWithProto:v5];
    id v6 = self;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)proto
{
  v3 = objc_opt_new();
  [v3 setTechnologyString:self->_technology];
  [v3 setNumber:self->_numDevices];

  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_technology hash];
  id v4 = [NSNumber numberWithUnsignedInt:self->_numDevices];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    v7 = v6;
    technology = self->_technology;
    v9 = technology;
    if (!technology)
    {
      NSUInteger v3 = [v6 technology];
      if (!v3)
      {
        unsigned int numDevices = self->_numDevices;
        BOOL v12 = numDevices == [v7 numDevices];
LABEL_12:

LABEL_13:
        goto LABEL_14;
      }
      v9 = self->_technology;
    }
    v10 = [v7 technology];
    if ([(NSString *)v9 isEqualToString:v10])
    {
      unsigned int v11 = self->_numDevices;
      BOOL v12 = v11 == [v7 numDevices];
    }
    else
    {
      BOOL v12 = 0;
    }

    if (technology) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  BOOL v12 = 0;
LABEL_14:

  return v12;
}

- (NSString)technology
{
  return self->_technology;
}

- (unsigned)numDevices
{
  return self->_numDevices;
}

- (void).cxx_destruct
{
}

+ (void)eventWithData:dataVersion:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_2();
  _os_log_error_impl(&dword_18E67D000, v0, OS_LOG_TYPE_ERROR, "BMMicroLocationNumDevicesPerTechnology: Mismatched data versions (%u != %u) cannot deserialize", v1, 0xEu);
}

- (void)initWithProto:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_18E67D000, v0, v1, "BMMicroLocationNumDevicesPerTechnology: tried to initialize with a proto missing required data.", v2, v3, v4, v5, v6);
}

- (void)initWithProto:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_18E67D000, v0, v1, "BMMicroLocationNumDevicesPerTechnology: tried to initialize with a non-BMUserActivityMetadataTopic proto", v2, v3, v4, v5, v6);
}

@end