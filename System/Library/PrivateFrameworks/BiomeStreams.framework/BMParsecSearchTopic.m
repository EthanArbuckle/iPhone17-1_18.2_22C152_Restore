@interface BMParsecSearchTopic
+ (BOOL)supportsSecureCoding;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMParsecSearchTopic)initWithCoder:(id)a3;
- (BMParsecSearchTopic)initWithIdentifier:(id)a3 score:(float)a4;
- (BMParsecSearchTopic)initWithProto:(id)a3;
- (BMParsecSearchTopic)initWithProtoData:(id)a3;
- (BOOL)isCompleteWithContext:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)identifier;
- (float)score;
- (id)encodeAsProto;
- (id)json;
- (id)jsonDict;
- (id)proto;
- (unint64_t)hash;
- (unsigned)dataVersion;
- (void)encodeWithCoder:(id)a3;
- (void)json;
@end

@implementation BMParsecSearchTopic

- (BMParsecSearchTopic)initWithIdentifier:(id)a3 score:(float)a4
{
  id v8 = a3;
  if (!v8)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"BMParsecSearchEngagementEvent.m", 26, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)BMParsecSearchTopic;
  v9 = [(BMParsecSearchTopic *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    v10->_score = a4;
  }

  return v10;
}

- (unsigned)dataVersion
{
  return 2;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v6 = a3;
  if (a4 == 2)
  {
    v7 = (void *)[objc_alloc((Class)a1) initWithProtoData:v6];
  }
  else
  {
    id v8 = __biome_log_for_category();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[BMParsecSearchTopic eventWithData:dataVersion:]();
    }

    v7 = 0;
  }

  return v7;
}

- (id)jsonDict
{
  v8[2] = *MEMORY[0x1E4F143B8];
  identifier = self->_identifier;
  v7[1] = @"score";
  v8[0] = identifier;
  v7[0] = @"identifier";
  *(float *)&double v2 = self->_score;
  v4 = [NSNumber numberWithFloat:v2];
  v8[1] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

- (id)json
{
  double v2 = (void *)MEMORY[0x1E4F28D90];
  v3 = [(BMParsecSearchTopic *)self jsonDict];
  id v14 = 0;
  v4 = [v2 dataWithJSONObject:v3 options:1 error:&v14];
  id v5 = v14;

  if (!v4)
  {
    id v6 = __biome_log_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(BMParsecSearchTopic *)(uint64_t)v5 json];
    }
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(BMParsecSearchTopic *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"dat"];
}

- (BMParsecSearchTopic)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F93B90];
  id v5 = a3;
  id v6 = [v4 robustDecodeObjectOfClass:objc_opt_class() forKey:@"dat" withCoder:v5 expectNonNull:1 errorDomain:@"BMStreamErrorDomain" errorCode:2 logHandle:0];

  if (v6)
  {
    self = [(BMParsecSearchTopic *)self initWithProtoData:v6];
    uint64_t v7 = self;
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)encodeAsProto
{
  double v2 = [(BMParsecSearchTopic *)self proto];
  v3 = [v2 data];

  return v3;
}

- (BMParsecSearchTopic)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      if ([v5 hasIdentifier]
        && ([v5 hasScore] & 1) != 0)
      {
        id v6 = [v5 identifier];
        [v5 score];
        self = -[BMParsecSearchTopic initWithIdentifier:score:](self, "initWithIdentifier:score:", v6);

        uint64_t v7 = self;
LABEL_13:

        goto LABEL_14;
      }
      uint64_t v8 = __biome_log_for_category();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        -[BMParsecSearchTopic initWithProto:]();
      }
    }
    else
    {
      id v5 = __biome_log_for_category();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[BMParsecSearchTopic initWithProto:]();
      }
    }
    uint64_t v7 = 0;
    goto LABEL_13;
  }
  uint64_t v7 = 0;
LABEL_14:

  return v7;
}

- (BMParsecSearchTopic)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[BMPBParsecSearchTopic alloc] initWithData:v4];

    self = [(BMParsecSearchTopic *)self initWithProto:v5];
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
  id v4 = [(BMParsecSearchTopic *)self identifier];
  [v3 setIdentifier:v4];

  [(BMParsecSearchTopic *)self score];
  objc_msgSend(v3, "setScore:");

  return v3;
}

- (unint64_t)hash
{
  return [(NSString *)self->_identifier hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    identifier = self->_identifier;
    uint64_t v7 = [v5 identifier];
    if ([(NSString *)identifier isEqualToString:v7])
    {
      float score = self->_score;
      [v5 score];
      BOOL v10 = score == v9;
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)isCompleteWithContext:(id)a3 error:(id *)a4
{
  identifier = self->_identifier;
  if (a4 && !identifier)
  {
    *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"BMStreamErrorDomain" code:3 userInfo:0];
  }
  return identifier != 0;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (float)score
{
  return self->_score;
}

- (void).cxx_destruct
{
}

+ (void)eventWithData:dataVersion:.cold.1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_4_0(&dword_18E67D000, v0, v1, "BMParsecSearchEngagementEvent: Mismatched data versions (%u != %u) cannot deserialize", v2, v3, v4, v5, v6);
}

- (void)json
{
}

- (void)initWithProto:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_18E67D000, v0, v1, "BMParsecSearchTopic: tried to initialize with a proto missing required data.", v2, v3, v4, v5, v6);
}

- (void)initWithProto:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_18E67D000, v0, v1, "BMParsecSearchTopic: tried to initialize with a non-BMParsecSearchTopic proto", v2, v3, v4, v5, v6);
}

@end