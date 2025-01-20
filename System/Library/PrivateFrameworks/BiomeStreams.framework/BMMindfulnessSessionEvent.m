@interface BMMindfulnessSessionEvent
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMMindfulnessSessionEvent)initWithProto:(id)a3;
- (BMMindfulnessSessionEvent)initWithProtoData:(id)a3;
- (BMMindfulnessSessionEvent)initWithSessionType:(unint64_t)a3 stateType:(unint64_t)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)encodeAsProto;
- (id)proto;
- (unint64_t)hash;
- (unint64_t)sessionType;
- (unint64_t)stateType;
- (unsigned)dataVersion;
- (void)proto;
- (void)setSessionType:(unint64_t)a3;
- (void)setStateType:(unint64_t)a3;
@end

@implementation BMMindfulnessSessionEvent

- (BMMindfulnessSessionEvent)initWithSessionType:(unint64_t)a3 stateType:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)BMMindfulnessSessionEvent;
  result = [(BMEventBase *)&v7 init];
  if (result)
  {
    result->_sessionType = a3;
    result->_stateType = a4;
  }
  return result;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  v4 = [NSNumber numberWithUnsignedInteger:self->_sessionType];
  v5 = [NSNumber numberWithUnsignedInteger:self->_stateType];
  v6 = (void *)[v3 initWithFormat:@"MindfulnessSessionEvent event with sessionType: %@, stateType: %@", v4, v5];

  return (NSString *)v6;
}

- (unsigned)dataVersion
{
  return 0;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4 == 1) {
    v4 = (objc_class *)BMMindfulnessSessionEvent_v1;
  }
  else {
    v4 = (objc_class *)a1;
  }
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithProtoData:v5];

  return v6;
}

- (id)encodeAsProto
{
  v2 = [(BMMindfulnessSessionEvent *)self proto];
  id v3 = [v2 data];

  return v3;
}

- (BMMindfulnessSessionEvent)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t v6 = [v5 sessionType];
      uint64_t v7 = v6;
      if (v6 >= 3)
      {
        v10 = __biome_log_for_category();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          -[BMMindfulnessSessionEvent initWithProto:](v7);
        }

        uint64_t v8 = 3;
      }
      else
      {
        uint64_t v8 = v6;
      }
      self = [(BMMindfulnessSessionEvent *)self initWithSessionType:v8 stateType:typeWithBMPBMindfulnessSessionStateType([v5 stateType])];
      v9 = self;
    }
    else
    {
      id v5 = __biome_log_for_category();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[BMMindfulnessSessionEvent initWithProto:]();
      }
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BMMindfulnessSessionEvent)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[BMPBMindfulnessSessionEvent alloc] initWithData:v4];

    self = [(BMMindfulnessSessionEvent *)self initWithProto:v5];
    uint64_t v6 = self;
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)proto
{
  id v3 = objc_opt_new();
  unint64_t v4 = [(BMMindfulnessSessionEvent *)self sessionType];
  uint64_t v5 = v4;
  if (!v4 || v4 == 2 || v4 == 1)
  {
    int v6 = 1;
  }
  else
  {
    uint64_t v7 = __biome_log_for_category();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[BMMindfulnessSessionEvent proto](v5);
    }

    int v6 = 0;
    uint64_t v5 = 0xFFFFFFFFLL;
  }
  unint64_t v8 = [(BMMindfulnessSessionEvent *)self stateType];
  if (v8 >= 5)
  {
    v10 = __biome_log_for_category();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[BMMindfulnessSessionEvent proto](v8);
    }
  }
  else if (v6)
  {
    [v3 setSessionType:v5];
    [v3 setStateType:v8];
    id v9 = v3;
    goto LABEL_15;
  }
  id v9 = 0;
LABEL_15:

  return v9;
}

- (unint64_t)hash
{
  id v3 = [NSNumber numberWithUnsignedInteger:self->_sessionType];
  uint64_t v4 = [v3 hash];
  uint64_t v5 = [NSNumber numberWithUnsignedInteger:self->_stateType];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unint64_t sessionType = self->_sessionType;
    if (sessionType == [v5 sessionType])
    {
      unint64_t stateType = self->_stateType;
      BOOL v8 = stateType == [v5 stateType];
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (unint64_t)sessionType
{
  return self->_sessionType;
}

- (void)setSessionType:(unint64_t)a3
{
  self->_unint64_t sessionType = a3;
}

- (unint64_t)stateType
{
  return self->_stateType;
}

- (void)setStateType:(unint64_t)a3
{
  self->_unint64_t stateType = a3;
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1)
{
  v1 = [NSNumber numberWithInt:a1];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_8(&dword_18E67D000, v2, v3, "BMMindfulnessSessionEvent: unable to convert BMPBMindfulnessSessionType enum value: %@", v4, v5, v6, v7, v8);
}

- (void)initWithProto:.cold.2()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_18E67D000, v2, v3, "%@: tried to initialize with a non-BMPBMindfulnessSessionEventDataVersion proto", v4, v5, v6, v7, v8);
}

- (void)proto
{
  v1 = [NSNumber numberWithUnsignedInteger:a1];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_8(&dword_18E67D000, v2, v3, "BMMindfulnessSessionEvent: unable to convert BMMindfulnessSessionType enum value: %@", v4, v5, v6, v7, v8);
}

@end