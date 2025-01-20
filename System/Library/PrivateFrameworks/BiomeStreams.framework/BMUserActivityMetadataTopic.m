@interface BMUserActivityMetadataTopic
+ (BOOL)supportsSecureCoding;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMUserActivityMetadataTopic)initWithCoder:(id)a3;
- (BMUserActivityMetadataTopic)initWithProto:(id)a3;
- (BMUserActivityMetadataTopic)initWithProtoData:(id)a3;
- (BMUserActivityMetadataTopic)initWithTopicIdentifier:(id)a3 title:(id)a4;
- (BOOL)isCompleteWithContext:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)title;
- (NSString)topicIdentifier;
- (id)encodeAsProto;
- (id)json;
- (id)jsonDict;
- (id)proto;
- (unint64_t)hash;
- (unsigned)dataVersion;
- (void)encodeWithCoder:(id)a3;
- (void)json;
@end

@implementation BMUserActivityMetadataTopic

- (BMUserActivityMetadataTopic)initWithTopicIdentifier:(id)a3 title:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BMUserActivityMetadataTopic;
  v8 = [(BMUserActivityMetadataTopic *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    topicIdentifier = v8->_topicIdentifier;
    v8->_topicIdentifier = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    title = v8->_title;
    v8->_title = (NSString *)v11;
  }
  return v8;
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
    id v7 = (void *)[objc_alloc((Class)a1) initWithProtoData:v6];
  }
  else
  {
    v8 = __biome_log_for_category();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[BMUserActivityMetadataTopic eventWithData:dataVersion:]();
    }

    id v7 = 0;
  }

  return v7;
}

- (id)jsonDict
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v5[0] = @"topicIdentifier";
  v5[1] = @"title";
  title = self->_title;
  v6[0] = self->_topicIdentifier;
  v6[1] = title;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];

  return v3;
}

- (id)json
{
  v2 = (void *)MEMORY[0x1E4F28D90];
  v3 = [(BMUserActivityMetadataTopic *)self jsonDict];
  id v8 = 0;
  v4 = [v2 dataWithJSONObject:v3 options:1 error:&v8];
  id v5 = v8;

  if (!v4)
  {
    id v6 = __biome_log_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(BMUserActivityMetadataTopic *)(uint64_t)v5 json];
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
  id v5 = [(BMUserActivityMetadataTopic *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"data"];
}

- (BMUserActivityMetadataTopic)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F93B90];
  id v5 = a3;
  id v6 = [v4 robustDecodeObjectOfClass:objc_opt_class() forKey:@"data" withCoder:v5 expectNonNull:1 errorDomain:@"BMStreamErrorDomain" errorCode:2 logHandle:0];

  if (v6)
  {
    self = [(BMUserActivityMetadataTopic *)self initWithProtoData:v6];
    id v7 = self;
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)encodeAsProto
{
  v2 = [(BMUserActivityMetadataTopic *)self proto];
  v3 = [v2 data];

  return v3;
}

- (BMUserActivityMetadataTopic)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      if ([v5 hasTopicIdentifier]
        && ([v5 hasTitle] & 1) != 0)
      {
        id v6 = [v5 topicIdentifier];
        id v7 = [v5 title];
        self = [(BMUserActivityMetadataTopic *)self initWithTopicIdentifier:v6 title:v7];

        id v8 = self;
LABEL_13:

        goto LABEL_14;
      }
      uint64_t v9 = __biome_log_for_category();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        -[BMUserActivityMetadataTopic initWithProto:]();
      }
    }
    else
    {
      id v5 = __biome_log_for_category();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[BMUserActivityMetadataTopic initWithProto:]();
      }
    }
    id v8 = 0;
    goto LABEL_13;
  }
  id v8 = 0;
LABEL_14:

  return v8;
}

- (BMUserActivityMetadataTopic)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[BMPBUserActivityMetadataTopic alloc] initWithData:v4];

    self = [(BMUserActivityMetadataTopic *)self initWithProto:v5];
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
  id v4 = [(BMUserActivityMetadataTopic *)self topicIdentifier];
  id v5 = (void *)[v4 copy];
  [v3 setTopicIdentifier:v5];

  id v6 = [(BMUserActivityMetadataTopic *)self title];
  id v7 = (void *)[v6 copy];
  [v3 setTitle:v7];

  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_topicIdentifier hash];
  return [(NSString *)self->_title hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v12 = 0;
    goto LABEL_17;
  }
  id v7 = v6;
  id v8 = v7;
  topicIdentifier = self->_topicIdentifier;
  if (topicIdentifier
    || ([v7 topicIdentifier], (NSUInteger v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    title = self->_title;
    id v4 = [v8 title];
    if (![(NSString *)title isEqualToString:v4])
    {
      BOOL v12 = 0;
LABEL_13:

      goto LABEL_14;
    }
    int v11 = 1;
  }
  else
  {
    int v11 = 0;
  }
  v13 = self->_topicIdentifier;
  objc_super v14 = [v8 topicIdentifier];
  if ([(NSString *)v13 isEqualToString:v14])
  {
    v15 = self->_title;
    v16 = [v8 title];
    BOOL v12 = [(NSString *)v15 isEqualToString:v16];
  }
  else
  {
    BOOL v12 = 0;
  }

  if (v11) {
    goto LABEL_13;
  }
LABEL_14:
  if (!topicIdentifier) {

  }
LABEL_17:
  return v12;
}

- (BOOL)isCompleteWithContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (self->_topicIdentifier && self->_title)
  {
    BOOL v7 = 1;
  }
  else if (a4)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"BMStreamErrorDomain" code:3 userInfo:0];
    BOOL v7 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (NSString)topicIdentifier
{
  return self->_topicIdentifier;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_topicIdentifier, 0);
}

+ (void)eventWithData:dataVersion:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_2();
  _os_log_error_impl(&dword_18E67D000, v0, OS_LOG_TYPE_ERROR, "BMUserActivityMetadataEvent: Mismatched data versions (%u != %u) cannot deserialize", v1, 0xEu);
}

- (void)json
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18E67D000, a2, OS_LOG_TYPE_ERROR, "BMUserActivityMetadataTopic: Unable to create json from object: %@", (uint8_t *)&v2, 0xCu);
}

- (void)initWithProto:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_18E67D000, v0, v1, "BMUserActivityMetadataTopic: tried to initialize with a proto missing required data.", v2, v3, v4, v5, v6);
}

- (void)initWithProto:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_18E67D000, v0, v1, "BMUserActivityMetadataTopic: tried to initialize with a non-BMUserActivityMetadataTopic proto", v2, v3, v4, v5, v6);
}

@end