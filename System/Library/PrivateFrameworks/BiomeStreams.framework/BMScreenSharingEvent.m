@interface BMScreenSharingEvent
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMScreenSharingEvent)initWithIsStart:(BOOL)a3;
- (BMScreenSharingEvent)initWithIsStart:(BOOL)a3 type:(unint64_t)a4;
- (BMScreenSharingEvent)initWithProto:(id)a3;
- (BMScreenSharingEvent)initWithProtoData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isStart;
- (NSString)description;
- (id)encodeAsProto;
- (id)proto;
- (unint64_t)type;
- (unsigned)dataVersion;
- (void)proto;
@end

@implementation BMScreenSharingEvent

- (BMScreenSharingEvent)initWithIsStart:(BOOL)a3
{
  return [(BMScreenSharingEvent *)self initWithIsStart:a3 type:0];
}

- (BMScreenSharingEvent)initWithIsStart:(BOOL)a3 type:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)BMScreenSharingEvent;
  result = [(BMEventBase *)&v7 init];
  if (result)
  {
    result->_isStart = a3;
    result->_type = a4;
  }
  return result;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  v4 = [NSNumber numberWithBool:self->_isStart];
  v5 = [NSNumber numberWithUnsignedInteger:self->_type];
  v6 = (void *)[v3 initWithFormat:@"Screen Sharing event isStart: %@ type: %@", v4, v5];

  return (NSString *)v6;
}

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4 == 2) {
    v4 = (objc_class *)BMScreenSharingEvent_v2;
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
  v2 = [(BMScreenSharingEvent *)self proto];
  id v3 = [v2 data];

  return v3;
}

- (BMScreenSharingEvent)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t v6 = [v5 isStart];
      unsigned int v7 = [v5 type];
      uint64_t v8 = v7;
      if (v7)
      {
        if (v7 == 1)
        {
          uint64_t v8 = 1;
        }
        else
        {
          v10 = __biome_log_for_category();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
            -[BMScreenSharingEvent initWithProto:](v8);
          }

          uint64_t v8 = 0;
        }
      }
      self = [(BMScreenSharingEvent *)self initWithIsStart:v6 type:v8];
      v9 = self;
    }
    else
    {
      id v5 = __biome_log_for_category();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[BMIntentEvent_v12 initWithProto:]();
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

- (BMScreenSharingEvent)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[BMPBScreenSharingEvent alloc] initWithData:v4];

    self = [(BMScreenSharingEvent *)self initWithProto:v5];
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
  unint64_t type = self->_type;
  if (!type)
  {
    uint64_t v5 = 0;
    goto LABEL_5;
  }
  if (type == 1)
  {
    uint64_t v5 = 1;
LABEL_5:
    [v3 setType:v5];
    id v6 = v3;
    goto LABEL_9;
  }
  unsigned int v7 = __biome_log_for_category();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[BMScreenSharingEvent proto](type);
  }

  id v6 = 0;
LABEL_9:

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int isStart = self->_isStart;
    if (isStart == [v5 isStart])
    {
      unint64_t type = self->_type;
      BOOL v8 = type == [v5 type];
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

- (unint64_t)type
{
  return self->_type;
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1)
{
  v1 = [NSNumber numberWithInt:a1];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_8(&dword_18E67D000, v2, v3, "BMScreenSharingEvent: unable to convert BMPBScreenSharingEventType enum value: %@", v4, v5, v6, v7, v8);
}

- (void)proto
{
  v1 = [NSNumber numberWithUnsignedInteger:a1];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_8(&dword_18E67D000, v2, v3, "BMScreenSharingEvent: unable to convert BMScreenSharingEventType enum value: %@", v4, v5, v6, v7, v8);
}

@end