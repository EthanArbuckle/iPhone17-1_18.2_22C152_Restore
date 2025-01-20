@interface ATXUnifiedInferredActivityTransition
+ (BOOL)supportsSecureCoding;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (ATXUnifiedInferredActivityTransition)initWithCoder:(id)a3;
- (ATXUnifiedInferredActivityTransition)initWithCoder_v1:(id)a3;
- (ATXUnifiedInferredActivityTransition)initWithCoder_v2:(id)a3;
- (ATXUnifiedInferredActivityTransition)initWithProto:(id)a3;
- (ATXUnifiedInferredActivityTransition)initWithProtoData:(id)a3;
- (BOOL)isEntryEvent;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXUnifiedInferredActivityTransition:(id)a3;
- (NSString)mode;
- (NSString)source;
- (double)confidence;
- (double)transitionTime;
- (id)encodeAsProto;
- (id)eventTime;
- (id)initFromJSON:(id)a3;
- (id)initFromTransitionTime:(double)a3 isEntryEvent:(BOOL)a4 source:(id)a5 activityType:(unint64_t)a6 confidence:(double)a7;
- (id)initFromTransitionTime:(double)a3 isEntryEvent:(BOOL)a4 source:(id)a5 mode:(id)a6;
- (id)json;
- (id)jsonRepresentation;
- (id)prettyRepresentation;
- (id)proto;
- (unint64_t)activityTypeAfterTransition;
- (unint64_t)inferredActivityType;
- (unsigned)dataVersion;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXUnifiedInferredActivityTransition

- (id)initFromTransitionTime:(double)a3 isEntryEvent:(BOOL)a4 source:(id)a5 mode:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)ATXUnifiedInferredActivityTransition;
  v13 = [(ATXUnifiedInferredActivityTransition *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_mode, a6);
    objc_storeStrong((id *)&v14->_source, a5);
    v14->_transitionTime = a3;
    v14->_isEntryEvent = a4;
    v14->_confidence = 1.0;
    ATXStringToMode();
    v14->_inferredActivityType = ATXActivityTypeFromMode();
  }

  return v14;
}

- (id)initFromTransitionTime:(double)a3 isEntryEvent:(BOOL)a4 source:(id)a5 activityType:(unint64_t)a6 confidence:(double)a7
{
  id v13 = a5;
  v19.receiver = self;
  v19.super_class = (Class)ATXUnifiedInferredActivityTransition;
  v14 = [(ATXUnifiedInferredActivityTransition *)&v19 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_source, a5);
    v15->_transitionTime = a3;
    v15->_isEntryEvent = a4;
    v15->_inferredActivityType = a6;
    v15->_confidence = a7;
    ATXModeFromActivityType();
    uint64_t v16 = ATXModeToString();
    mode = v15->_mode;
    v15->_mode = (NSString *)v16;
  }
  return v15;
}

- (unint64_t)activityTypeAfterTransition
{
  if (![(ATXUnifiedInferredActivityTransition *)self isEntryEvent]) {
    return 14;
  }
  return [(ATXUnifiedInferredActivityTransition *)self inferredActivityType];
}

- (id)json
{
  v2 = (void *)MEMORY[0x1E4F28D90];
  v3 = [(ATXUnifiedInferredActivityTransition *)self jsonRepresentation];
  v4 = [v2 dataWithJSONObject:v3 options:2 error:0];

  return v4;
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
    id v7 = (id)[objc_alloc((Class)a1) initWithProtoData:v6];
  }
  else
  {
    v8 = (void *)MEMORY[0x1D25F6CC0]();
    id v12 = 0;
    v9 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:a1 fromData:v6 error:&v12];
    id v10 = v12;
    id v7 = 0;
    if (!v10) {
      id v7 = v9;
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
  id v4 = a3;
  id v5 = [(ATXUnifiedInferredActivityTransition *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"protobufData"];
}

- (ATXUnifiedInferredActivityTransition)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ATXUnifiedInferredActivityTransition *)self initWithCoder_v2:v4];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v8 = (ATXUnifiedInferredActivityTransition *)(id)objc_msgSend(0, "initWithCoder_v1:", v4);
    id v7 = v8;
    if (v8)
    {
      v9 = v8;
    }
    else
    {
      id v10 = __atxlog_handle_modes();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        -[ATXUnifiedInferredActivityTransition initWithCoder:]();
      }
    }
  }

  return v7;
}

- (ATXUnifiedInferredActivityTransition)initWithCoder_v2:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protobufData"];

  if (v5)
  {
    self = [(ATXUnifiedInferredActivityTransition *)self initWithProtoData:v5];
    id v6 = self;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (ATXUnifiedInferredActivityTransition)initWithCoder_v1:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v6 = objc_opt_class();
  id v7 = __atxlog_handle_modes();
  v8 = [v5 robustDecodeObjectOfClass:v6 forKey:@"inferredMode" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.decode.InferredModeSession" errorCode:-1 logHandle:v7];

  v9 = [v4 error];

  if (!v9 && v8)
  {
    id v10 = (void *)MEMORY[0x1E4F93B90];
    uint64_t v11 = objc_opt_class();
    id v12 = __atxlog_handle_modes();
    id v13 = [v10 robustDecodeObjectOfClass:v11 forKey:@"source" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.decode.InferredModeSession" errorCode:-1 logHandle:v12];

    v14 = [v4 error];

    if (v14 || !v13)
    {
      v18 = __atxlog_handle_modes();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO)) {
        goto LABEL_11;
      }
    }
    else
    {
      [v4 decodeDoubleForKey:@"transitionTime"];
      double v16 = v15;
      v17 = [v4 error];

      if (!v17)
      {
        uint64_t v24 = [v4 decodeBoolForKey:@"isEntryEvent"];
        v25 = [v4 error];

        if (!v25)
        {
          self = (ATXUnifiedInferredActivityTransition *)[(ATXUnifiedInferredActivityTransition *)self initFromTransitionTime:v24 isEntryEvent:v13 source:v8 mode:v16];
          v22 = self;
          goto LABEL_14;
        }
        v18 = __atxlog_handle_modes();
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO)) {
          goto LABEL_12;
        }
        goto LABEL_11;
      }
      v18 = __atxlog_handle_modes();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
LABEL_11:
        v20 = (objc_class *)objc_opt_class();
        v21 = NSStringFromClass(v20);
        *(_DWORD *)buf = 138412290;
        v27 = v21;
        _os_log_impl(&dword_1D0FA3000, v18, OS_LOG_TYPE_INFO, "Unable to construct class %@ from coder using v1 decoding", buf, 0xCu);
      }
    }
LABEL_12:

    goto LABEL_13;
  }
  id v13 = __atxlog_handle_modes();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    objc_super v19 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v19);
    *(_DWORD *)buf = 138412290;
    v27 = v18;
    _os_log_impl(&dword_1D0FA3000, v13, OS_LOG_TYPE_INFO, "Unable to construct class %@ from coder using v1 decoding", buf, 0xCu);
    goto LABEL_12;
  }
LABEL_13:
  v22 = 0;
LABEL_14:

  return v22;
}

- (id)prettyRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  id v4 = (void *)MEMORY[0x1E4F28C10];
  id v5 = [MEMORY[0x1E4F1CA20] currentLocale];
  uint64_t v6 = [v4 dateFormatFromTemplate:@"EMMMd HH:mm ss ZZZZ" options:0 locale:v5];

  [v3 setDateFormat:v6];
  id v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:self->_transitionTime];
  v8 = [v3 stringFromDate:v7];

  v9 = @"Enters";
  if (!self->_isEntryEvent) {
    v9 = @"Exits";
  }
  id v10 = NSString;
  source = self->_source;
  id v12 = v9;
  [(ATXUnifiedInferredActivityTransition *)self inferredActivityType];
  id v13 = ATXActivityTypeToString();
  [(ATXUnifiedInferredActivityTransition *)self confidence];
  double v15 = [v10 stringWithFormat:@"%@: %@ %@ %@.  Confidence %.2f", v8, source, v12, v13, v14];

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXUnifiedInferredActivityTransition *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXUnifiedInferredActivityTransition *)self isEqualToATXUnifiedInferredActivityTransition:v5];

  return v6;
}

- (BOOL)isEqualToATXUnifiedInferredActivityTransition:(id)a3
{
  id v4 = a3;
  [(ATXUnifiedInferredActivityTransition *)self transitionTime];
  double v6 = v5;
  [v4 transitionTime];
  double v8 = v6 - v7;
  if (v8 >= 0.0) {
    double v9 = v8;
  }
  else {
    double v9 = -v8;
  }
  BOOL v10 = [(ATXUnifiedInferredActivityTransition *)self isEntryEvent];
  int v11 = [v4 isEntryEvent];
  id v12 = [(ATXUnifiedInferredActivityTransition *)self mode];
  id v13 = [v4 mode];
  int v14 = [v12 isEqualToString:v13];

  unint64_t v15 = [(ATXUnifiedInferredActivityTransition *)self inferredActivityType];
  uint64_t v16 = [v4 inferredActivityType];
  [(ATXUnifiedInferredActivityTransition *)self confidence];
  double v18 = v17;
  [v4 confidence];
  double v20 = v19;
  v21 = [(ATXUnifiedInferredActivityTransition *)self source];
  v22 = [v4 source];

  int v23 = [v21 isEqualToString:v22];
  BOOL result = 0;
  if (v9 < 0.1 && ((v10 ^ v11) & 1) == 0 && v14 && v23)
  {
    double v25 = v18 - v20;
    if (v18 - v20 < 0.0) {
      double v25 = -(v18 - v20);
    }
    return v25 < 0.01 && v15 == v16;
  }
  return result;
}

- (id)eventTime
{
  return (id)[MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:self->_transitionTime];
}

- (id)encodeAsProto
{
  v2 = [(ATXUnifiedInferredActivityTransition *)self proto];
  id v3 = [v2 data];

  return v3;
}

- (ATXUnifiedInferredActivityTransition)initWithProto:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_7:
    id v13 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v14 = __atxlog_handle_modes();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[ATXUnifiedInferredActivitySession initWithProto:]();
    }

    goto LABEL_7;
  }
  id v5 = v4;
  [v5 transitionTime];
  double v7 = v6;
  uint64_t v8 = [v5 isActivityStart];
  double v9 = [v5 source];
  uint64_t v10 = [v5 inferredActivity];
  [v5 confidence];
  double v12 = v11;

  self = (ATXUnifiedInferredActivityTransition *)[(ATXUnifiedInferredActivityTransition *)self initFromTransitionTime:v8 isEntryEvent:v9 source:v10 activityType:v7 confidence:v12];
  id v13 = self;
LABEL_8:

  return v13;
}

- (ATXUnifiedInferredActivityTransition)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[ATXPBUnifiedInferredActivityTransition alloc] initWithData:v4];

    self = [(ATXUnifiedInferredActivityTransition *)self initWithProto:v5];
    double v6 = self;
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (id)proto
{
  id v3 = objc_opt_new();
  [(ATXUnifiedInferredActivityTransition *)self confidence];
  objc_msgSend(v3, "setConfidence:");
  objc_msgSend(v3, "setInferredActivity:", -[ATXUnifiedInferredActivityTransition inferredActivityType](self, "inferredActivityType"));
  [(ATXUnifiedInferredActivityTransition *)self transitionTime];
  objc_msgSend(v3, "setTransitionTime:");
  objc_msgSend(v3, "setIsActivityStart:", -[ATXUnifiedInferredActivityTransition isEntryEvent](self, "isEntryEvent"));
  id v4 = [(ATXUnifiedInferredActivityTransition *)self source];
  [v3 setSource:v4];

  return v3;
}

- (id)initFromJSON:(id)a3
{
  id v4 = a3;
  id v5 = [[ATXPBUnifiedInferredActivityTransition alloc] initFromJSON:v4];

  double v6 = [(ATXUnifiedInferredActivityTransition *)self initWithProto:v5];
  return v6;
}

- (id)jsonRepresentation
{
  v2 = [(ATXUnifiedInferredActivityTransition *)self proto];
  id v3 = [v2 jsonRepresentation];

  return v3;
}

- (double)transitionTime
{
  return self->_transitionTime;
}

- (BOOL)isEntryEvent
{
  return self->_isEntryEvent;
}

- (NSString)source
{
  return self->_source;
}

- (NSString)mode
{
  return self->_mode;
}

- (unint64_t)inferredActivityType
{
  return self->_inferredActivityType;
}

- (double)confidence
{
  return self->_confidence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mode, 0);
  objc_storeStrong((id *)&self->_source, 0);
}

- (void)initWithCoder:.cold.1()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0(&dword_1D0FA3000, v2, v3, "Unable to construct class %@ from coder", v4, v5, v6, v7, 2u);
}

@end