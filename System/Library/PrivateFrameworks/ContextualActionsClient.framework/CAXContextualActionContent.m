@interface CAXContextualActionContent
+ (BOOL)supportsSecureCoding;
- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (CAXContextualActionContent)initWithCoder:(id)a3;
- (CAXContextualActionContent)initWithContentType:(id)a3 contentMetadata:(id)a4;
- (CAXContextualActionContent)initWithProto:(id)a3;
- (CAXContextualActionContent)initWithProtoData:(id)a3;
- (NSDictionary)contentMetadata;
- (NSString)contentType;
- (id)encodeAsProto;
- (id)json;
- (id)jsonRawData;
- (id)proto;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CAXContextualActionContent

- (CAXContextualActionContent)initWithContentType:(id)a3 contentMetadata:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CAXContextualActionContent;
  v8 = [(CAXContextualActionContent *)&v12 init];
  if (v8)
  {
    if (v6)
    {
      v9 = (NSString *)v6;
    }
    else
    {
      v9 = +[CAXContextualActionsPredictor ioNoneType];
    }
    contentType = v8->_contentType;
    v8->_contentType = v9;

    objc_storeStrong((id *)&v8->_contentMetadata, a4);
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  v22[1] = *MEMORY[0x263EF8340];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!a3)
  {
    v15 = [v12 error];

    if (v15)
    {
      BOOL v14 = 1;
      goto LABEL_7;
    }
    if (([v12 containsValueForKey:v11] & 1) == 0)
    {
      id v16 = objc_alloc(MEMORY[0x263F087E8]);
      uint64_t v21 = *MEMORY[0x263F08320];
      v17 = (void *)[[NSString alloc] initWithFormat:@"Failed to decode key %@", v11, v21];
      v22[0] = v17;
      BOOL v14 = 1;
      v18 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];
      v19 = (void *)[v16 initWithDomain:v13 code:a7 userInfo:v18];

      [v12 failWithError:v19];
      goto LABEL_7;
    }
  }
  BOOL v14 = 0;
LABEL_7:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(CAXContextualActionContent *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"CAXProtobufData"];
}

- (CAXContextualActionContent)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CAXProtobufData"];

  id v6 = [(CAXContextualActionContent *)self initWithProtoData:v5];
  return v6;
}

- (id)encodeAsProto
{
  v2 = [(CAXContextualActionContent *)self proto];
  v3 = [v2 data];

  return v3;
}

- (CAXContextualActionContent)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[CAXPBContextualActionContent alloc] initWithData:v4];

    self = [(CAXContextualActionContent *)self initWithProto:v5];
    id v6 = self;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (CAXContextualActionContent)initWithProto:(id)a3
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
    id v11 = __atxlog_handle_contextual_actions();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[CAXContextualActionContent initWithProto:]();
    }

    goto LABEL_8;
  }
  id v5 = v4;
  if ([v5 hasContentMetadata])
  {
    id v6 = (void *)MEMORY[0x22A635790]();
    id v7 = (void *)MEMORY[0x263F08928];
    uint64_t v8 = objc_opt_class();
    v9 = [v5 contentMetadata];
    v10 = [v7 unarchivedObjectOfClass:v8 fromData:v9 error:0];
  }
  else
  {
    v10 = 0;
  }
  id v13 = [v5 contentType];
  self = [(CAXContextualActionContent *)self initWithContentType:v13 contentMetadata:v10];

  id v12 = self;
LABEL_11:

  return v12;
}

- (id)proto
{
  v3 = objc_opt_new();
  uint64_t v4 = [v3 setContentType:self->_contentType];
  if (self->_contentMetadata)
  {
    id v5 = (void *)MEMORY[0x22A635790](v4);
    id v6 = [MEMORY[0x263F08910] archivedDataWithRootObject:self->_contentMetadata requiringSecureCoding:0 error:0];
  }
  else
  {
    id v6 = 0;
  }
  [v3 setContentMetadata:v6];

  return v3;
}

- (id)jsonRawData
{
  v16[2] = *MEMORY[0x263EF8340];
  contentMetadata = self->_contentMetadata;
  if (contentMetadata)
  {
    id v14 = 0;
    uint64_t v4 = [MEMORY[0x263F08900] dataWithJSONObject:contentMetadata options:1 error:&v14];
    id v5 = v14;
    id v6 = (__CFString *)[[NSString alloc] initWithData:v4 encoding:4];
  }
  else
  {
    uint64_t v4 = 0;
    id v6 = 0;
    id v5 = 0;
  }
  v15[0] = @"contentType";
  uint64_t v7 = [(CAXContextualActionContent *)self contentType];
  uint64_t v8 = (void *)v7;
  if (v7) {
    v9 = (__CFString *)v7;
  }
  else {
    v9 = @"nil";
  }
  v15[1] = @"contentMetadata";
  v16[0] = v9;
  v10 = [(CAXContextualActionContent *)self contentMetadata];
  if (v10) {
    id v11 = v6;
  }
  else {
    id v11 = @"nil";
  }
  v16[1] = v11;
  id v12 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];

  return v12;
}

- (id)json
{
  v2 = (void *)MEMORY[0x263F08900];
  v3 = [(CAXContextualActionContent *)self jsonRawData];
  uint64_t v4 = [v2 dataWithJSONObject:v3 options:1 error:0];

  return v4;
}

- (NSString)contentType
{
  return self->_contentType;
}

- (NSDictionary)contentMetadata
{
  return self->_contentMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentMetadata, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
}

- (void)initWithProto:.cold.1()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_0(&dword_2257D2000, v2, v3, "Unable to construct class %@ from ProtoBuf object", v4, v5, v6, v7, 2u);
}

@end