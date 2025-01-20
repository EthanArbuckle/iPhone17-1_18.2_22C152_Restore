@interface BMSiriInferredHelpfulnessEvent
+ (BOOL)supportsSecureCoding;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMSiriInferredHelpfulnessEvent)initWithAbsoluteTimestamp:(double)a3;
- (BMSiriInferredHelpfulnessEvent)initWithAbsoluteTimestamp:(double)a3 inferredHelpfulnessScore:(double)a4 restatementScore:(double)a5 turnID:(id)a6 modelID:(id)a7;
- (BMSiriInferredHelpfulnessEvent)initWithCoder:(id)a3;
- (BMSiriInferredHelpfulnessEvent)initWithProto:(id)a3;
- (BMSiriInferredHelpfulnessEvent)initWithProtoData:(id)a3;
- (BOOL)isCompleteWithContext:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSiriInferredHelpfulnessEvent:(id)a3;
- (NSString)modelID;
- (NSString)turnID;
- (double)absoluteTimestamp;
- (double)inferredHelpfulnessScore;
- (double)restatementScore;
- (id)encodeAsProto;
- (id)json;
- (id)jsonDict;
- (id)proto;
- (unint64_t)hash;
- (unsigned)dataVersion;
- (void)encodeWithCoder:(id)a3;
- (void)json;
@end

@implementation BMSiriInferredHelpfulnessEvent

- (BMSiriInferredHelpfulnessEvent)initWithAbsoluteTimestamp:(double)a3
{
  return [(BMSiriInferredHelpfulnessEvent *)self initWithAbsoluteTimestamp:0 inferredHelpfulnessScore:0 restatementScore:a3 turnID:-1.0 modelID:-1.0];
}

- (BMSiriInferredHelpfulnessEvent)initWithAbsoluteTimestamp:(double)a3 inferredHelpfulnessScore:(double)a4 restatementScore:(double)a5 turnID:(id)a6 modelID:(id)a7
{
  id v12 = a6;
  id v13 = a7;
  v21.receiver = self;
  v21.super_class = (Class)BMSiriInferredHelpfulnessEvent;
  v14 = [(BMSiriInferredHelpfulnessEvent *)&v21 init];
  v15 = v14;
  if (v14)
  {
    v14->_absoluteTimestamp = a3;
    v14->_inferredHelpfulnessScore = a4;
    v14->_restatementScore = a5;
    uint64_t v16 = [v12 copy];
    turnID = v15->_turnID;
    v15->_turnID = (NSString *)v16;

    uint64_t v18 = [v13 copy];
    modelID = v15->_modelID;
    v15->_modelID = (NSString *)v18;
  }
  return v15;
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
    v8 = __biome_log_for_category();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[BMSiriInferredHelpfulnessEvent eventWithData:dataVersion:](a4, v8);
    }

    v7 = 0;
  }

  return v7;
}

- (id)jsonDict
{
  v13[5] = *MEMORY[0x1E4F143B8];
  v12[0] = @"absoluteTimeStamp";
  v3 = [NSNumber numberWithDouble:self->_absoluteTimestamp];
  v13[0] = v3;
  v12[1] = @"inferredHelpfulnessScore";
  v4 = [NSNumber numberWithDouble:self->_inferredHelpfulnessScore];
  v13[1] = v4;
  v12[2] = @"restatementScore";
  v5 = [NSNumber numberWithDouble:self->_restatementScore];
  v13[2] = v5;
  v12[3] = @"turnID";
  turnID = self->_turnID;
  v7 = turnID;
  if (!turnID)
  {
    v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v13[3] = v7;
  v12[4] = @"modelID";
  modelID = self->_modelID;
  v9 = modelID;
  if (!modelID)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v13[4] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:5];
  if (modelID)
  {
    if (turnID) {
      goto LABEL_7;
    }
  }
  else
  {

    if (turnID) {
      goto LABEL_7;
    }
  }

LABEL_7:

  return v10;
}

- (id)json
{
  v2 = (void *)MEMORY[0x1E4F28D90];
  v3 = [(BMSiriInferredHelpfulnessEvent *)self jsonDict];
  id v8 = 0;
  v4 = [v2 dataWithJSONObject:v3 options:1 error:&v8];
  id v5 = v8;

  if (v5)
  {
    id v6 = __biome_log_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(BMSiriInferredHelpfulnessEvent *)(uint64_t)v5 json];
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
  id v5 = [(BMSiriInferredHelpfulnessEvent *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"data"];
}

- (BMSiriInferredHelpfulnessEvent)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F93B90];
  id v5 = a3;
  id v6 = [v4 robustDecodeObjectOfClass:objc_opt_class() forKey:@"data" withCoder:v5 expectNonNull:1 errorDomain:@"BMStreamErrorDomain" errorCode:2 logHandle:0];

  if (v6)
  {
    self = [(BMSiriInferredHelpfulnessEvent *)self initWithProtoData:v6];
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)encodeAsProto
{
  v2 = [(BMSiriInferredHelpfulnessEvent *)self proto];
  v3 = [v2 data];

  return v3;
}

- (BMSiriInferredHelpfulnessEvent)initWithProto:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_7:
    v14 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v15 = __biome_log_for_category();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      -[BMSiriInferredHelpfulnessEvent initWithProto:]((uint64_t)self, v15);
    }

    goto LABEL_7;
  }
  id v5 = v4;
  [v5 absoluteTimestamp];
  double v7 = v6;
  [v5 inferredHelpfulnessScore];
  double v9 = v8;
  [v5 restatementScore];
  double v11 = v10;
  id v12 = [v5 turnID];
  id v13 = [v5 modelID];

  self = [(BMSiriInferredHelpfulnessEvent *)self initWithAbsoluteTimestamp:v12 inferredHelpfulnessScore:v13 restatementScore:v7 turnID:v9 modelID:v11];
  v14 = self;
LABEL_8:

  return v14;
}

- (BMSiriInferredHelpfulnessEvent)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[BMPBSiriInferredHelpfulnessEvent alloc] initWithData:v4];

    self = [(BMSiriInferredHelpfulnessEvent *)self initWithProto:v5];
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
  v3 = objc_opt_new();
  [v3 setAbsoluteTimestamp:self->_absoluteTimestamp];
  [v3 setInferredHelpfulnessScore:self->_inferredHelpfulnessScore];
  [v3 setRestatementScore:self->_restatementScore];
  [v3 setTurnID:self->_turnID];
  [v3 setModelID:self->_modelID];

  return v3;
}

- (unint64_t)hash
{
  v3 = [NSNumber numberWithDouble:self->_absoluteTimestamp];
  uint64_t v4 = [v3 hash];
  NSUInteger v5 = [(NSString *)self->_turnID hash];
  NSUInteger v6 = v5 ^ [(NSString *)self->_modelID hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (BMSiriInferredHelpfulnessEvent *)a3;
  NSUInteger v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(BMSiriInferredHelpfulnessEvent *)self isEqualToSiriInferredHelpfulnessEvent:v5];

  return v6;
}

- (BOOL)isEqualToSiriInferredHelpfulnessEvent:(id)a3
{
  id v6 = a3;
  double absoluteTimestamp = self->_absoluteTimestamp;
  [v6 absoluteTimestamp];
  if (absoluteTimestamp != v8
    || (double inferredHelpfulnessScore = self->_inferredHelpfulnessScore,
        [v6 inferredHelpfulnessScore],
        inferredHelpfulnessScore != v10)
    || (double restatementScore = self->_restatementScore, [v6 restatementScore], restatementScore != v12))
  {
    char v16 = 0;
    goto LABEL_10;
  }
  turnID = self->_turnID;
  v14 = turnID;
  if (!turnID)
  {
    v3 = [v6 turnID];
    if (!v3)
    {
      int v15 = 0;
      goto LABEL_13;
    }
    v14 = self->_turnID;
  }
  uint64_t v4 = [v6 turnID];
  if (![v14 isEqualToString:v4])
  {
    char v16 = 0;
LABEL_18:

    goto LABEL_19;
  }
  int v15 = 1;
LABEL_13:
  modelID = self->_modelID;
  v19 = modelID;
  if (!modelID)
  {
    v14 = [v6 modelID];
    if (!v14)
    {
      char v16 = 1;
      goto LABEL_22;
    }
    v19 = self->_modelID;
  }
  v20 = [v6 modelID];
  char v16 = [(NSString *)v19 isEqualToString:v20];

  if (modelID)
  {
    if (!v15) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_22:

  if (v15) {
    goto LABEL_18;
  }
LABEL_19:
  if (!turnID) {

  }
LABEL_10:
  return v16;
}

- (BOOL)isCompleteWithContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (self->_inferredHelpfulnessScore == -1.0 || !self->_turnID)
  {
    if (a4)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:@"BMStreamErrorDomain" code:3 userInfo:0];
      BOOL v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (double)inferredHelpfulnessScore
{
  return self->_inferredHelpfulnessScore;
}

- (double)restatementScore
{
  return self->_restatementScore;
}

- (NSString)turnID
{
  return self->_turnID;
}

- (NSString)modelID
{
  return self->_modelID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelID, 0);

  objc_storeStrong((id *)&self->_turnID, 0);
}

+ (void)eventWithData:(int)a1 dataVersion:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109376;
  v2[1] = a1;
  __int16 v3 = 1024;
  int v4 = 1;
  _os_log_error_impl(&dword_18E67D000, a2, OS_LOG_TYPE_ERROR, "BMSiriInferredHelpfulnessEvent: Mismatched data versions (%u != %u) cannot deserialize", (uint8_t *)v2, 0xEu);
}

- (void)json
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18E67D000, a2, OS_LOG_TYPE_ERROR, "BMSiriInferredHelpfulnessEvent: Unable to create json from object: %@", (uint8_t *)&v2, 0xCu);
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  id v6 = v4;
  _os_log_fault_impl(&dword_18E67D000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-BMPBSiriInferredHelpfulnessEvent proto", (uint8_t *)&v5, 0xCu);
}

@end