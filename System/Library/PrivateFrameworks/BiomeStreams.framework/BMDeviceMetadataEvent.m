@interface BMDeviceMetadataEvent
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMDeviceMetadataEvent)initWithName:(id)a3 build:(id)a4 platform:(int64_t)a5;
- (BMDeviceMetadataEvent)initWithName:(id)a3 build:(id)a4 supplementalBuild:(id)a5 platform:(int64_t)a6;
- (BMDeviceMetadataEvent)initWithName:(id)a3 build:(id)a4 supplementalBuild:(id)a5 platform:(int64_t)a6 rapidSecurityResponsePreReboot:(BOOL)a7;
- (BMDeviceMetadataEvent)initWithProto:(id)a3;
- (BMDeviceMetadataEvent)initWithProtoData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)rapidSecurityResponsePreReboot;
- (NSString)build;
- (NSString)name;
- (NSString)supplementalBuild;
- (id)encodeAsProto;
- (id)json;
- (id)jsonDict;
- (id)proto;
- (int64_t)platform;
- (unint64_t)hash;
- (unsigned)dataVersion;
- (void)json;
@end

@implementation BMDeviceMetadataEvent

- (BMDeviceMetadataEvent)initWithName:(id)a3 build:(id)a4 platform:(int64_t)a5
{
  return [(BMDeviceMetadataEvent *)self initWithName:a3 build:a4 supplementalBuild:@"?" platform:a5];
}

- (BMDeviceMetadataEvent)initWithName:(id)a3 build:(id)a4 supplementalBuild:(id)a5 platform:(int64_t)a6
{
  return [(BMDeviceMetadataEvent *)self initWithName:a3 build:a4 supplementalBuild:a5 platform:a6 rapidSecurityResponsePreReboot:0];
}

- (BMDeviceMetadataEvent)initWithName:(id)a3 build:(id)a4 supplementalBuild:(id)a5 platform:(int64_t)a6 rapidSecurityResponsePreReboot:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v23.receiver = self;
  v23.super_class = (Class)BMDeviceMetadataEvent;
  v15 = [(BMEventBase *)&v23 init];
  if (v15)
  {
    uint64_t v16 = [v12 copy];
    name = v15->_name;
    v15->_name = (NSString *)v16;

    uint64_t v18 = [v13 copy];
    build = v15->_build;
    v15->_build = (NSString *)v18;

    uint64_t v20 = [v14 copy];
    supplementalBuild = v15->_supplementalBuild;
    v15->_supplementalBuild = (NSString *)v20;

    v15->_platform = a6;
    v15->_rapidSecurityResponsePreReboot = a7;
  }

  return v15;
}

- (unsigned)dataVersion
{
  return 0;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v6 = a3;
  if (!a4) {
    goto LABEL_4;
  }
  if (a4 == 1)
  {
    a1 = BMDeviceMetadataEvent_v1;
LABEL_4:
    v7 = (void *)[objc_alloc((Class)a1) initWithProtoData:v6];
    goto LABEL_6;
  }
  v7 = 0;
LABEL_6:

  return v7;
}

- (id)jsonDict
{
  v11[5] = *MEMORY[0x1E4F143B8];
  name = (__CFString *)self->_name;
  if (!name) {
    name = &stru_1EDD7E578;
  }
  v10[0] = @"name";
  v10[1] = @"build";
  build = self->_build;
  v11[0] = name;
  v11[1] = build;
  supplementalBuild = (__CFString *)self->_supplementalBuild;
  if (!supplementalBuild) {
    supplementalBuild = &stru_1EDD7E578;
  }
  v11[2] = supplementalBuild;
  v10[2] = @"supplementalBuild";
  v10[3] = @"platform";
  id v6 = [NSNumber numberWithInteger:self->_platform];
  v11[3] = v6;
  v10[4] = @"rapidSecurityResponsePreReboot";
  v7 = [NSNumber numberWithBool:self->_rapidSecurityResponsePreReboot];
  v11[4] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:5];

  return v8;
}

- (id)json
{
  v2 = (void *)MEMORY[0x1E4F28D90];
  v3 = [(BMDeviceMetadataEvent *)self jsonDict];
  uint64_t v8 = 0;
  v4 = [v2 dataWithJSONObject:v3 options:1 error:&v8];
  uint64_t v5 = v8;

  if (v5)
  {
    id v6 = __biome_log_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[BMDeviceMetadataEvent json](v6);
    }
  }

  return v4;
}

- (id)encodeAsProto
{
  v2 = [(BMDeviceMetadataEvent *)self proto];
  v3 = [v2 data];

  return v3;
}

- (BMDeviceMetadataEvent)initWithProto:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_8:
    id v12 = 0;
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = __biome_log_for_category();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[BMDeviceMetadataEvent initWithProto:]();
    }

    goto LABEL_8;
  }
  id v5 = v4;
  id v6 = [v5 name];
  v7 = [v5 build];
  uint64_t v8 = [v5 supplementalBuild];
  unsigned int v9 = [v5 platform];
  if (v9 > 8) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = qword_18EB36910[v9];
  }
  uint64_t v13 = [v5 rapidSecurityResponsePreReboot];

  self = [(BMDeviceMetadataEvent *)self initWithName:v6 build:v7 supplementalBuild:v8 platform:v10 rapidSecurityResponsePreReboot:v13];
  id v12 = self;
LABEL_11:

  return v12;
}

- (BMDeviceMetadataEvent)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[BMPBDeviceMetadataEvent alloc] initWithData:v4];

    self = [(BMDeviceMetadataEvent *)self initWithProto:v5];
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
  id v4 = [(BMDeviceMetadataEvent *)self name];
  [v3 setName:v4];

  id v5 = [(BMDeviceMetadataEvent *)self build];
  [v3 setBuild:v5];

  id v6 = [(BMDeviceMetadataEvent *)self supplementalBuild];
  [v3 setSupplementalBuild:v6];

  unint64_t v7 = [(BMDeviceMetadataEvent *)self platform];
  if (v7 > 8) {
    uint64_t v8 = 7;
  }
  else {
    uint64_t v8 = dword_18EB36958[v7];
  }
  [v3 setPlatform:v8];
  objc_msgSend(v3, "setRapidSecurityResponsePreReboot:", -[BMDeviceMetadataEvent rapidSecurityResponsePreReboot](self, "rapidSecurityResponsePreReboot"));

  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_build hash];
  NSUInteger v4 = [(NSString *)self->_supplementalBuild hash] ^ v3;
  id v5 = [NSNumber numberWithInteger:self->_platform];
  uint64_t v6 = v4 ^ [v5 hash];
  unint64_t v7 = [NSNumber numberWithBool:self->_rapidSecurityResponsePreReboot];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    build = self->_build;
    unint64_t v7 = [v5 build];
    if ([(NSString *)build isEqualToString:v7])
    {
      supplementalBuild = self->_supplementalBuild;
      unsigned int v9 = [v5 supplementalBuild];
      if ([(NSString *)supplementalBuild isEqualToString:v9]
        && (int64_t platform = self->_platform, platform == [v5 platform]))
      {
        BOOL v11 = [(BMDeviceMetadataEvent *)self rapidSecurityResponsePreReboot];
        int v12 = v11 ^ [v5 rapidSecurityResponsePreReboot] ^ 1;
      }
      else
      {
        LOBYTE(v12) = 0;
      }
    }
    else
    {
      LOBYTE(v12) = 0;
    }
  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)build
{
  return self->_build;
}

- (NSString)supplementalBuild
{
  return self->_supplementalBuild;
}

- (int64_t)platform
{
  return self->_platform;
}

- (BOOL)rapidSecurityResponsePreReboot
{
  return self->_rapidSecurityResponsePreReboot;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supplementalBuild, 0);
  objc_storeStrong((id *)&self->_build, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (void)json
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18E67D000, log, OS_LOG_TYPE_ERROR, "Unable to create JSON from object", v1, 2u);
}

- (void)initWithProto:.cold.1()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0(&dword_18E67D000, v2, v3, "%@: tried to initialize with a non-BMPBDeviceMetadataEvent proto", v4, v5, v6, v7, 2u);
}

@end