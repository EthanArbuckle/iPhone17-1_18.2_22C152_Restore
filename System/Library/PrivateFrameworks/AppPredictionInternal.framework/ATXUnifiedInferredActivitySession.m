@interface ATXUnifiedInferredActivitySession
+ (BOOL)supportsSecureCoding;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (ATXUnifiedInferredActivitySession)initWithCoder:(id)a3;
- (ATXUnifiedInferredActivitySession)initWithProto:(id)a3;
- (ATXUnifiedInferredActivitySession)initWithProtoData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXUnifiedInferredActivitySession:(id)a3;
- (NSString)source;
- (double)confidence;
- (double)endTime;
- (double)startTime;
- (id)encodeAsProto;
- (id)initFromJSON:(id)a3;
- (id)initFromStartTime:(double)a3 endTime:(double)a4 source:(id)a5 activityType:(unint64_t)a6 confidence:(double)a7;
- (id)json;
- (id)jsonRepresentation;
- (id)prettyRepresentation;
- (id)proto;
- (unint64_t)inferredActivityType;
- (unsigned)dataVersion;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXUnifiedInferredActivitySession

- (id)initFromStartTime:(double)a3 endTime:(double)a4 source:(id)a5 activityType:(unint64_t)a6 confidence:(double)a7
{
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ATXUnifiedInferredActivitySession;
  v14 = [(ATXUnifiedInferredActivitySession *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_source, a5);
    v15->_startTime = a3;
    v15->_endTime = a4;
    v15->_inferredActivityType = a6;
    v15->_confidence = a7;
  }

  return v15;
}

- (id)prettyRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v4 = (void *)MEMORY[0x1E4F28C10];
  v5 = [MEMORY[0x1E4F1CA20] currentLocale];
  v6 = [v4 dateFormatFromTemplate:@"EMMMd HH:mm ss ZZZZ" options:0 locale:v5];

  [v3 setDateFormat:v6];
  v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:self->_startTime];
  v8 = [v3 stringFromDate:v7];

  v9 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:self->_endTime];
  v10 = [v3 stringFromDate:v9];

  v11 = NSString;
  source = self->_source;
  [(ATXUnifiedInferredActivitySession *)self inferredActivityType];
  id v13 = ATXActivityTypeToString();
  [(ATXUnifiedInferredActivitySession *)self confidence];
  v15 = [v11 stringWithFormat:@"%@: (%@, %@), %@.  Confidence %.2f", source, v8, v10, v13, v14];

  return v15;
}

- (id)json
{
  v2 = (void *)MEMORY[0x1E4F28D90];
  id v3 = [(ATXUnifiedInferredActivitySession *)self jsonRepresentation];
  v4 = [v2 dataWithJSONObject:v3 options:2 error:0];

  return v4;
}

- (unsigned)dataVersion
{
  return 3;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v6 = a3;
  if (a4 == 3)
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
  id v5 = [(ATXUnifiedInferredActivitySession *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"protobufData"];
}

- (ATXUnifiedInferredActivitySession)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protobufData"];

  if (v5)
  {
    self = [(ATXUnifiedInferredActivitySession *)self initWithProtoData:v5];
    id v6 = self;
  }
  else
  {
    id v7 = __atxlog_handle_modes();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[ATXUnifiedInferredActivitySession initWithCoder:]();
    }

    id v6 = 0;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXUnifiedInferredActivitySession *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXUnifiedInferredActivitySession *)self isEqualToATXUnifiedInferredActivitySession:v5];

  return v6;
}

- (BOOL)isEqualToATXUnifiedInferredActivitySession:(id)a3
{
  id v4 = a3;
  [(ATXUnifiedInferredActivitySession *)self startTime];
  double v6 = v5;
  [v4 startTime];
  double v8 = v6 - v7;
  if (v8 >= 0.0) {
    double v9 = v8;
  }
  else {
    double v9 = -v8;
  }
  [(ATXUnifiedInferredActivitySession *)self endTime];
  double v11 = v10;
  [v4 endTime];
  double v13 = v12;
  unint64_t v14 = [(ATXUnifiedInferredActivitySession *)self inferredActivityType];
  uint64_t v15 = [v4 inferredActivityType];
  v16 = [(ATXUnifiedInferredActivitySession *)self source];
  objc_super v17 = [v4 source];
  char v18 = [v16 isEqualToString:v17];

  unint64_t v19 = [(ATXUnifiedInferredActivitySession *)self inferredActivityType];
  uint64_t v20 = [v4 inferredActivityType];
  [(ATXUnifiedInferredActivitySession *)self confidence];
  double v22 = v21;
  [v4 confidence];
  double v24 = v23;

  if (v9 >= 0.1) {
    return 0;
  }
  double v25 = v22 - v24;
  if (v22 - v24 < 0.0) {
    double v25 = -(v22 - v24);
  }
  double v26 = v11 - v13;
  if (v11 - v13 < 0.0) {
    double v26 = -(v11 - v13);
  }
  if (v26 < 0.1 && v14 == v15) {
    BOOL v28 = v18;
  }
  else {
    BOOL v28 = 0;
  }
  if (v19 != v20) {
    BOOL v28 = 0;
  }
  return v25 < 0.01 && v28;
}

- (id)encodeAsProto
{
  v2 = [(ATXUnifiedInferredActivitySession *)self proto];
  id v3 = [v2 data];

  return v3;
}

- (ATXUnifiedInferredActivitySession)initWithProto:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_7:
    unint64_t v14 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v15 = __atxlog_handle_modes();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      -[ATXUnifiedInferredActivitySession initWithProto:]();
    }

    goto LABEL_7;
  }
  id v5 = v4;
  [v5 startTime];
  double v7 = v6;
  [v5 endTime];
  double v9 = v8;
  double v10 = [v5 source];
  uint64_t v11 = [v5 inferredActivity];
  [v5 confidence];
  double v13 = v12;

  self = (ATXUnifiedInferredActivitySession *)[(ATXUnifiedInferredActivitySession *)self initFromStartTime:v10 endTime:v11 source:v7 activityType:v9 confidence:v13];
  unint64_t v14 = self;
LABEL_8:

  return v14;
}

- (ATXUnifiedInferredActivitySession)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[ATXPBUnifiedInferredActivitySession alloc] initWithData:v4];

    self = [(ATXUnifiedInferredActivitySession *)self initWithProto:v5];
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
  [(ATXUnifiedInferredActivitySession *)self confidence];
  objc_msgSend(v3, "setConfidence:");
  objc_msgSend(v3, "setInferredActivity:", -[ATXUnifiedInferredActivitySession inferredActivityType](self, "inferredActivityType"));
  [(ATXUnifiedInferredActivitySession *)self startTime];
  objc_msgSend(v3, "setStartTime:");
  [(ATXUnifiedInferredActivitySession *)self endTime];
  objc_msgSend(v3, "setEndTime:");
  id v4 = [(ATXUnifiedInferredActivitySession *)self source];
  [v3 setSource:v4];

  return v3;
}

- (id)initFromJSON:(id)a3
{
  id v4 = a3;
  id v5 = [[ATXPBUnifiedInferredActivitySession alloc] initFromJSON:v4];

  double v6 = [(ATXUnifiedInferredActivitySession *)self initWithProto:v5];
  return v6;
}

- (id)jsonRepresentation
{
  v2 = [(ATXUnifiedInferredActivitySession *)self proto];
  id v3 = [v2 jsonRepresentation];

  return v3;
}

- (double)startTime
{
  return self->_startTime;
}

- (double)endTime
{
  return self->_endTime;
}

- (NSString)source
{
  return self->_source;
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
}

- (void)initWithCoder:.cold.1()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0(&dword_1D0FA3000, v2, v3, "Unable to construct class %@ from coder", v4, v5, v6, v7, 2u);
}

- (void)initWithProto:.cold.1()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0(&dword_1D0FA3000, v2, v3, "Unable to construct class %@ from ProtoBuf object", v4, v5, v6, v7, 2u);
}

@end