@interface CAXContextualActionParameter
+ (BOOL)supportsSecureCoding;
- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (CAXContextualActionParameter)initWithCoder:(id)a3;
- (CAXContextualActionParameter)initWithParameterType:(id)a3 parameterMetadata:(id)a4;
- (CAXContextualActionParameter)initWithProto:(id)a3;
- (CAXContextualActionParameter)initWithProtoData:(id)a3;
- (NSDictionary)parameterMetadata;
- (NSString)parameterType;
- (id)encodeAsProto;
- (id)json;
- (id)jsonRawData;
- (id)proto;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CAXContextualActionParameter

- (CAXContextualActionParameter)initWithParameterType:(id)a3 parameterMetadata:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CAXContextualActionParameter;
  v9 = [(CAXContextualActionParameter *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_parameterType, a3);
    objc_storeStrong((id *)&v10->_parameterMetadata, a4);
  }

  return v10;
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
  id v5 = [(CAXContextualActionParameter *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"CAXProtobufData"];
}

- (CAXContextualActionParameter)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CAXProtobufData"];

  v6 = [(CAXContextualActionParameter *)self initWithProtoData:v5];
  return v6;
}

- (id)encodeAsProto
{
  v2 = [(CAXContextualActionParameter *)self proto];
  v3 = [v2 data];

  return v3;
}

- (CAXContextualActionParameter)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[CAXPBContextualActionParameter alloc] initWithData:v4];

    self = [(CAXContextualActionParameter *)self initWithProto:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (CAXContextualActionParameter)initWithProto:(id)a3
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
  if ([v5 hasParameterMetadata])
  {
    v6 = (void *)MEMORY[0x22A635790]();
    id v7 = (void *)MEMORY[0x263F08928];
    uint64_t v8 = objc_opt_class();
    v9 = [v5 parameterMetadata];
    v10 = [v7 unarchivedObjectOfClass:v8 fromData:v9 error:0];
  }
  else
  {
    v10 = 0;
  }
  id v13 = [v5 parameterType];
  self = [(CAXContextualActionParameter *)self initWithParameterType:v13 parameterMetadata:v10];

  id v12 = self;
LABEL_11:

  return v12;
}

- (id)proto
{
  v3 = objc_opt_new();
  uint64_t v4 = [v3 setParameterType:self->_parameterType];
  if (self->_parameterMetadata)
  {
    id v5 = (void *)MEMORY[0x22A635790](v4);
    v6 = [MEMORY[0x263F08910] archivedDataWithRootObject:self->_parameterMetadata requiringSecureCoding:0 error:0];
  }
  else
  {
    v6 = 0;
  }
  [v3 setParameterMetadata:v6];

  return v3;
}

- (id)jsonRawData
{
  v16[2] = *MEMORY[0x263EF8340];
  parameterMetadata = self->_parameterMetadata;
  if (parameterMetadata)
  {
    id v14 = 0;
    uint64_t v4 = [MEMORY[0x263F08900] dataWithJSONObject:parameterMetadata options:1 error:&v14];
    id v5 = v14;
    v6 = (__CFString *)[[NSString alloc] initWithData:v4 encoding:4];
  }
  else
  {
    uint64_t v4 = 0;
    v6 = 0;
    id v5 = 0;
  }
  v15[0] = @"parameterType";
  uint64_t v7 = [(CAXContextualActionParameter *)self parameterType];
  uint64_t v8 = (void *)v7;
  if (v7) {
    v9 = (__CFString *)v7;
  }
  else {
    v9 = @"nil";
  }
  v15[1] = @"parameterMetadata";
  v16[0] = v9;
  v10 = [(CAXContextualActionParameter *)self parameterMetadata];
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
  v3 = [(CAXContextualActionParameter *)self jsonRawData];
  uint64_t v4 = [v2 dataWithJSONObject:v3 options:1 error:0];

  return v4;
}

- (NSString)parameterType
{
  return self->_parameterType;
}

- (NSDictionary)parameterMetadata
{
  return self->_parameterMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameterMetadata, 0);
  objc_storeStrong((id *)&self->_parameterType, 0);
}

@end