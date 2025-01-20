@interface ATXPredictionAmbientLightContext
- (ATXPredictionAmbientLightContext)initWithAmbientLightType:(int)a3;
- (ATXPredictionAmbientLightContext)initWithProto:(id)a3;
- (ATXPredictionAmbientLightContext)initWithProtoData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXPredictionAmbientLightContext:(id)a3;
- (id)description;
- (id)encodeAsProto;
- (id)jsonDict;
- (id)proto;
- (int)ambientLightType;
@end

@implementation ATXPredictionAmbientLightContext

- (ATXPredictionAmbientLightContext)initWithAmbientLightType:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ATXPredictionAmbientLightContext;
  result = [(ATXPredictionAmbientLightContext *)&v5 init];
  if (result) {
    result->_ambientLightType = a3;
  }
  return result;
}

- (id)description
{
  v2 = [(ATXPredictionAmbientLightContext *)self jsonDict];
  v3 = [v2 description];

  return v3;
}

- (id)jsonDict
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v6 = @"ambientLightType";
  uint64_t ambientLightType = self->_ambientLightType;
  if (ambientLightType >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", ambientLightType, v6);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E68AE248[ambientLightType];
  }
  v7[0] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];

  return v4;
}

- (ATXPredictionAmbientLightContext)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    objc_super v5 = [[ATXPBPredictionAmbientLightContext alloc] initWithData:v4];

    self = [(ATXPredictionAmbientLightContext *)self initWithProto:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)encodeAsProto
{
  v2 = [(ATXPredictionAmbientLightContext *)self proto];
  v3 = [v2 data];

  return v3;
}

- (ATXPredictionAmbientLightContext)initWithProto:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_7:
    objc_super v5 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = __atxlog_handle_default();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[ATXPredictionAmbientLightContext initWithProto:]((uint64_t)self, v6);
    }

    goto LABEL_7;
  }
  self = -[ATXPredictionAmbientLightContext initWithAmbientLightType:](self, "initWithAmbientLightType:", [v4 ambientLightType]);
  objc_super v5 = self;
LABEL_8:

  return v5;
}

- (id)proto
{
  v3 = objc_opt_new();
  [v3 setAmbientLightType:self->_ambientLightType];
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXPredictionAmbientLightContext *)a3;
  objc_super v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXPredictionAmbientLightContext *)self isEqualToATXPredictionAmbientLightContext:v5];

  return v6;
}

- (BOOL)isEqualToATXPredictionAmbientLightContext:(id)a3
{
  return self->_ambientLightType == *((_DWORD *)a3 + 2);
}

- (int)ambientLightType
{
  return self->_ambientLightType;
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  BOOL v6 = v4;
  _os_log_fault_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-ATXPBPredictionAmbientLightContext proto", (uint8_t *)&v5, 0xCu);
}

@end