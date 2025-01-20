@interface BMDoNotDisturbWhileDrivingEvent
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMDoNotDisturbWhileDrivingEvent)initWithProto:(id)a3;
- (BMDoNotDisturbWhileDrivingEvent)initWithProtoData:(id)a3;
- (BMDoNotDisturbWhileDrivingEvent)initWithReason:(unint64_t)a3 isStart:(BOOL)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isStart;
- (NSString)description;
- (id)encodeAsProto;
- (id)json;
- (id)jsonDict;
- (id)proto;
- (unint64_t)reason;
- (unsigned)dataVersion;
- (void)proto;
@end

@implementation BMDoNotDisturbWhileDrivingEvent

- (BMDoNotDisturbWhileDrivingEvent)initWithReason:(unint64_t)a3 isStart:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)BMDoNotDisturbWhileDrivingEvent;
  result = [(BMEventBase *)&v7 init];
  if (result)
  {
    result->_reason = a3;
    result->_isStart = a4;
  }
  return result;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  if (self->_isStart) {
    v4 = @"YES";
  }
  else {
    v4 = @"NO";
  }
  v5 = (void *)[v3 initWithFormat:@"DNDwD event with reason: %ld is start: %@", self->_reason, v4];

  return (NSString *)v5;
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

- (id)jsonDict
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"reason";
  id v3 = [NSNumber numberWithUnsignedInteger:self->_reason];
  v7[1] = @"isStart";
  v8[0] = v3;
  v4 = [NSNumber numberWithBool:self->_isStart];
  v8[1] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

- (id)json
{
  v2 = (void *)MEMORY[0x1E4F28D90];
  id v3 = [(BMDoNotDisturbWhileDrivingEvent *)self jsonDict];
  uint64_t v8 = 0;
  v4 = [v2 dataWithJSONObject:v3 options:1 error:&v8];
  uint64_t v5 = v8;

  if (v5)
  {
    v6 = __biome_log_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[BMDeviceMetadataEvent json](v6);
    }
  }

  return v4;
}

- (id)encodeAsProto
{
  v2 = [(BMDoNotDisturbWhileDrivingEvent *)self proto];
  id v3 = [v2 data];

  return v3;
}

- (BMDoNotDisturbWhileDrivingEvent)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      uint64_t v6 = [v5 reason];
      uint64_t v7 = v6;
      if (v6 >= 7)
      {
        v10 = __biome_log_for_category();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          -[BMDoNotDisturbWhileDrivingEvent initWithProto:](v7);
        }

        uint64_t v8 = 0;
      }
      else
      {
        uint64_t v8 = v6;
      }
      self = [(BMDoNotDisturbWhileDrivingEvent *)self initWithReason:v8 isStart:[v5 isStart]];
      v9 = self;
    }
    else
    {
      uint64_t v5 = __biome_log_for_category();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[BMDoNotDisturbWhileDrivingEvent initWithProto:]((uint64_t)self, v5);
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

- (BMDoNotDisturbWhileDrivingEvent)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    uint64_t v5 = [[BMPBDoNotDisturbWhileDrivingEvent alloc] initWithData:v4];

    self = [(BMDoNotDisturbWhileDrivingEvent *)self initWithProto:v5];
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
  [v3 setIsStart:self->_isStart];
  unint64_t reason = self->_reason;
  if (reason >= 7)
  {
    uint64_t v6 = __biome_log_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[BMDoNotDisturbWhileDrivingEvent proto](reason);
    }

    id v5 = 0;
  }
  else
  {
    [v3 setReason:reason];
    id v5 = v3;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unint64_t reason = self->_reason;
    if (reason == [v5 reason])
    {
      int isStart = self->_isStart;
      BOOL v8 = isStart == [v5 isStart];
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

- (BOOL)isStart
{
  return self->_isStart;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1)
{
  v1 = [NSNumber numberWithInt:a1];
  OUTLINED_FUNCTION_0_8(&dword_18E67D000, v2, v3, "BMDoNotDisturbWhileDrivingEvent: unable to convert BMPBDoNotDisturbWhileDrivingReason enum value: %@", v4, v5, v6, v7, 2u);
}

- (void)initWithProto:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  uint64_t v6 = v4;
  _os_log_fault_impl(&dword_18E67D000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-BMPBDoNotDisturbWhileDrivingEvent proto", (uint8_t *)&v5, 0xCu);
}

- (void)proto
{
  v1 = [NSNumber numberWithUnsignedInteger:a1];
  OUTLINED_FUNCTION_0_8(&dword_18E67D000, v2, v3, "BMDoNotDisturbWhileDrivingEvent: unable to convert BMDoNotDisturbWhileDrivingReason enum value: %@", v4, v5, v6, v7, 2u);
}

@end