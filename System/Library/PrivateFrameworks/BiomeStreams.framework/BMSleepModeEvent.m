@interface BMSleepModeEvent
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMSleepModeEvent)initWithProto:(id)a3;
- (BMSleepModeEvent)initWithProtoData:(id)a3;
- (BMSleepModeEvent)initWithSleepModeState:(unint64_t)a3;
- (BMSleepModeEvent)initWithSleepModeState:(unint64_t)a3 sleepModeChangeReason:(unint64_t)a4 expectedEndDate:(id)a5;
- (BOOL)isEqual:(id)a3;
- (NSDate)expectedEndDate;
- (NSString)description;
- (id)encodeAsProto;
- (id)proto;
- (unint64_t)sleepModeChangeReason;
- (unint64_t)sleepModeState;
- (unsigned)dataVersion;
- (void)proto;
@end

@implementation BMSleepModeEvent

- (BMSleepModeEvent)initWithSleepModeState:(unint64_t)a3
{
  return [(BMSleepModeEvent *)self initWithSleepModeState:a3 sleepModeChangeReason:0 expectedEndDate:0];
}

- (BMSleepModeEvent)initWithSleepModeState:(unint64_t)a3 sleepModeChangeReason:(unint64_t)a4 expectedEndDate:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)BMSleepModeEvent;
  v10 = [(BMEventBase *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_sleepModeState = a3;
    v10->_sleepModeChangeReason = a4;
    objc_storeStrong((id *)&v10->_expectedEndDate, a5);
  }

  return v11;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  v4 = [NSNumber numberWithUnsignedInteger:self->_sleepModeState];
  v5 = [NSNumber numberWithUnsignedInteger:self->_sleepModeChangeReason];
  v6 = (void *)[v3 initWithFormat:@"Sleep event with state: %@ stateChangeReason: %@ expectedEndDate: %@", v4, v5, self->_expectedEndDate];

  return (NSString *)v6;
}

- (unsigned)dataVersion
{
  return 2;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4 == 3) {
    v4 = (objc_class *)BMSleepModeEvent_v3;
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
  v2 = [(BMSleepModeEvent *)self proto];
  id v3 = [v2 data];

  return v3;
}

- (BMSleepModeEvent)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t v6 = [v5 sleepModeState];
      uint64_t v7 = v6;
      if (v6 >= 3)
      {
        v10 = __biome_log_for_category();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          -[BMSleepModeEvent initWithProto:](v7);
        }

        uint64_t v8 = 3;
      }
      else
      {
        uint64_t v8 = v6;
      }
      uint64_t v11 = BMSleepModeChangeReasonFromReason([v5 sleepModeChangeReason]);
      if ([v5 hasExpectedEndDate])
      {
        v12 = (void *)MEMORY[0x1E4F1C9C8];
        [v5 expectedEndDate];
        objc_super v13 = objc_msgSend(v12, "dateWithTimeIntervalSinceReferenceDate:");
        self = [(BMSleepModeEvent *)self initWithSleepModeState:v8 sleepModeChangeReason:v11 expectedEndDate:v13];
      }
      else
      {
        self = [(BMSleepModeEvent *)self initWithSleepModeState:v8 sleepModeChangeReason:v11 expectedEndDate:0];
      }
      id v9 = self;
    }
    else
    {
      id v5 = __biome_log_for_category();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[BMSleepModeEvent initWithProto:]();
      }
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (BMSleepModeEvent)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[BMPBSleepModeEvent alloc] initWithData:v4];

    self = [(BMSleepModeEvent *)self initWithProto:v5];
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
  unint64_t sleepModeState = self->_sleepModeState;
  switch(sleepModeState)
  {
    case 0uLL:
      uint64_t v6 = 0;
LABEL_7:
      int v5 = 1;
      break;
    case 2uLL:
      uint64_t v6 = 2;
      goto LABEL_7;
    case 1uLL:
      int v5 = 1;
      uint64_t v6 = 1;
      break;
    default:
      uint64_t v7 = __biome_log_for_category();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[BMSleepModeEvent proto](sleepModeState);
      }

      int v5 = 0;
      uint64_t v6 = 0xFFFFFFFFLL;
      break;
  }
  unint64_t sleepModeChangeReason = self->_sleepModeChangeReason;
  if (sleepModeChangeReason >= 0xA)
  {
    v12 = __biome_log_for_category();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[BMSleepModeEvent proto](sleepModeChangeReason);
    }

    goto LABEL_19;
  }
  if (!v5)
  {
LABEL_19:
    id v11 = 0;
    goto LABEL_20;
  }
  uint64_t v9 = dword_18EB37030[sleepModeChangeReason];
  [v3 setSleepModeState:v6];
  [v3 setSleepModeChangeReason:v9];
  expectedEndDate = self->_expectedEndDate;
  if (expectedEndDate)
  {
    [(NSDate *)expectedEndDate timeIntervalSinceReferenceDate];
    objc_msgSend(v3, "setExpectedEndDate:");
  }
  id v11 = v3;
LABEL_20:

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unint64_t sleepModeState = self->_sleepModeState;
    if (sleepModeState == [v5 sleepModeState]
      && (unint64_t sleepModeChangeReason = (void *)self->_sleepModeChangeReason,
          sleepModeChangeReason == (void *)[v5 sleepModeChangeReason]))
    {
      expectedEndDate = self->_expectedEndDate;
      uint64_t v9 = expectedEndDate;
      if (!expectedEndDate)
      {
        unint64_t sleepModeChangeReason = [v5 expectedEndDate];
        if (!sleepModeChangeReason)
        {
          char v11 = 1;
LABEL_14:

          goto LABEL_11;
        }
        uint64_t v9 = self->_expectedEndDate;
      }
      v10 = [v5 expectedEndDate];
      char v11 = [(NSDate *)v9 isEqualToDate:v10];

      if (!expectedEndDate) {
        goto LABEL_14;
      }
    }
    else
    {
      char v11 = 0;
    }
LABEL_11:

    goto LABEL_12;
  }
  char v11 = 0;
LABEL_12:

  return v11;
}

- (unint64_t)sleepModeState
{
  return self->_sleepModeState;
}

- (unint64_t)sleepModeChangeReason
{
  return self->_sleepModeChangeReason;
}

- (NSDate)expectedEndDate
{
  return self->_expectedEndDate;
}

- (void).cxx_destruct
{
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1)
{
  v1 = [NSNumber numberWithInt:a1];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_8(&dword_18E67D000, v2, v3, "BMSleepModeEvent: unable to convert BMPBSleepModeState enum value: %@", v4, v5, v6, v7, v8);
}

- (void)initWithProto:.cold.2()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_18E67D000, v2, v3, "%@: tried to initialize with a non-BMPBSleepModeEvent proto", v4, v5, v6, v7, v8);
}

- (void)proto
{
  v1 = [NSNumber numberWithUnsignedInteger:a1];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_8(&dword_18E67D000, v2, v3, "BMSleepModeEvent: unable to convert BMSleepModeState enum value: %@", v4, v5, v6, v7, v8);
}

@end