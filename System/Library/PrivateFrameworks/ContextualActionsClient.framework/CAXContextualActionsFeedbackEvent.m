@interface CAXContextualActionsFeedbackEvent
+ (BOOL)supportsSecureCoding;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (CAXContextualAction)selectedAction;
- (CAXContextualActionsFeedbackEvent)initWithCoder:(id)a3;
- (CAXContextualActionsFeedbackEvent)initWithProto:(id)a3;
- (CAXContextualActionsFeedbackEvent)initWithProtoData:(id)a3;
- (CAXContextualActionsFeedbackEvent)initWithSelectedAction:(id)a3 suggestion:(id)a4 deviceContext:(id)a5 sessionIdentifier:(id)a6;
- (CAXPredictionContext)deviceContext;
- (CAXSuggestion)suggestion;
- (NSString)sessionIdentifier;
- (id)encodeAsProto;
- (id)json;
- (id)jsonRawData;
- (id)proto;
- (unsigned)dataVersion;
- (void)encodeWithCoder:(id)a3;
- (void)setDeviceContext:(id)a3;
- (void)setSelectedAction:(id)a3;
- (void)setSessionIdentifier:(id)a3;
- (void)setSuggestion:(id)a3;
@end

@implementation CAXContextualActionsFeedbackEvent

- (CAXContextualActionsFeedbackEvent)initWithSelectedAction:(id)a3 suggestion:(id)a4 deviceContext:(id)a5 sessionIdentifier:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CAXContextualActionsFeedbackEvent;
  v15 = [(CAXContextualActionsFeedbackEvent *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_selectedAction, a3);
    objc_storeStrong((id *)&v16->_suggestion, a4);
    objc_storeStrong((id *)&v16->_deviceContext, a5);
    objc_storeStrong((id *)&v16->_sessionIdentifier, a6);
  }

  return v16;
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
      objc_super v18 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];
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
  id v5 = [(CAXContextualActionsFeedbackEvent *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"CAXProtobufData"];
}

- (CAXContextualActionsFeedbackEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CAXProtobufData"];

  v6 = [(CAXContextualActionsFeedbackEvent *)self initWithProtoData:v5];
  return v6;
}

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5 = a3;
  v6 = (void *)[objc_alloc((Class)a1) initWithProtoData:v5];

  return v6;
}

- (id)jsonRawData
{
  v18[4] = *MEMORY[0x263EF8340];
  v17[0] = @"selectedAction";
  id v4 = [(CAXContextualActionsFeedbackEvent *)self selectedAction];
  if (v4)
  {
    id v16 = [(CAXContextualActionsFeedbackEvent *)self selectedAction];
    id v5 = [v16 jsonRawData];
  }
  else
  {
    id v5 = @"nil";
  }
  v18[0] = v5;
  v17[1] = @"suggestion";
  v6 = [(CAXContextualActionsFeedbackEvent *)self suggestion];
  if (v6)
  {
    v15 = [(CAXContextualActionsFeedbackEvent *)self suggestion];
    v7 = [v15 jsonRawData];
  }
  else
  {
    v7 = @"nil";
  }
  v18[1] = v7;
  v17[2] = @"deviceContext";
  v8 = [(CAXContextualActionsFeedbackEvent *)self deviceContext];
  if (v8)
  {
    v2 = [(CAXContextualActionsFeedbackEvent *)self deviceContext];
    v9 = [v2 jsonRawData];
  }
  else
  {
    v9 = @"nil";
  }
  v18[2] = v9;
  v17[3] = @"sessionIdentifier";
  uint64_t v10 = [(CAXContextualActionsFeedbackEvent *)self sessionIdentifier];
  id v11 = (void *)v10;
  if (v10) {
    id v12 = (__CFString *)v10;
  }
  else {
    id v12 = @"nil";
  }
  v18[3] = v12;
  id v13 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:4];

  if (v8)
  {
  }
  if (v6)
  {
  }
  if (v4)
  {
  }
  return v13;
}

- (id)json
{
  v2 = (void *)MEMORY[0x263F08900];
  v3 = [(CAXContextualActionsFeedbackEvent *)self jsonRawData];
  id v4 = [v2 dataWithJSONObject:v3 options:1 error:0];

  return v4;
}

- (id)encodeAsProto
{
  v2 = [(CAXContextualActionsFeedbackEvent *)self proto];
  v3 = [v2 data];

  return v3;
}

- (CAXContextualActionsFeedbackEvent)initWithProto:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_7:
    id v16 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v17 = __atxlog_handle_contextual_actions();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      -[CAXContextualActionsFeedbackEvent initWithProto:]((uint64_t)self, v17);
    }

    goto LABEL_7;
  }
  id v5 = v4;
  v6 = [CAXContextualAction alloc];
  v7 = [v5 selectedAction];
  v8 = [(CAXContextualAction *)v6 initWithProto:v7];

  v9 = [CAXSuggestion alloc];
  uint64_t v10 = [v5 suggestion];
  id v11 = [(CAXSuggestion *)v9 initWithProto:v10];

  id v12 = [CAXPredictionContext alloc];
  id v13 = [v5 deviceContext];
  BOOL v14 = [(CAXPredictionContext *)v12 initWithProto:v13];

  v15 = [v5 sessionIdentifier];

  self = [(CAXContextualActionsFeedbackEvent *)self initWithSelectedAction:v8 suggestion:v11 deviceContext:v14 sessionIdentifier:v15];
  id v16 = self;
LABEL_8:

  return v16;
}

- (CAXContextualActionsFeedbackEvent)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[CAXPBContextualActionsFeedbackEvent alloc] initWithData:v4];

    self = [(CAXContextualActionsFeedbackEvent *)self initWithProto:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)proto
{
  v3 = objc_opt_new();
  [v3 setSessionIdentifier:self->_sessionIdentifier];
  id v4 = [(CAXContextualAction *)self->_selectedAction proto];
  [v3 setSelectedAction:v4];

  id v5 = [(CAXPredictionContext *)self->_deviceContext proto];
  [v3 setDeviceContext:v5];

  v6 = [(CAXSuggestion *)self->_suggestion proto];
  [v3 setSuggestion:v6];

  return v3;
}

- (CAXContextualAction)selectedAction
{
  return self->_selectedAction;
}

- (void)setSelectedAction:(id)a3
{
}

- (CAXSuggestion)suggestion
{
  return self->_suggestion;
}

- (void)setSuggestion:(id)a3
{
}

- (CAXPredictionContext)deviceContext
{
  return self->_deviceContext;
}

- (void)setDeviceContext:(id)a3
{
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceContext, 0);
  objc_storeStrong((id *)&self->_suggestion, 0);
  objc_storeStrong((id *)&self->_selectedAction, 0);
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  v6 = v4;
  _os_log_fault_impl(&dword_2257D2000, a2, OS_LOG_TYPE_FAULT, "Unable to construct class %@ from ProtoBuf object", (uint8_t *)&v5, 0xCu);
}

@end