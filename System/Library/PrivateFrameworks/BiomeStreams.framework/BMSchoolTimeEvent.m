@interface BMSchoolTimeEvent
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMSchoolTimeEvent)initWithProto:(id)a3;
- (BMSchoolTimeEvent)initWithProtoData:(id)a3;
- (BMSchoolTimeEvent)initWithStarting:(BOOL)a3;
- (BMSchoolTimeEvent)initWithStarting:(BOOL)a3 reason:(unint64_t)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isStarting;
- (NSString)description;
- (id)encodeAsProto;
- (id)proto;
- (unint64_t)hash;
- (unint64_t)reason;
- (unsigned)dataVersion;
- (void)proto;
- (void)setReason:(unint64_t)a3;
- (void)setStarting:(BOOL)a3;
@end

@implementation BMSchoolTimeEvent

- (BMSchoolTimeEvent)initWithStarting:(BOOL)a3
{
  return [(BMSchoolTimeEvent *)self initWithStarting:a3 reason:0];
}

- (BMSchoolTimeEvent)initWithStarting:(BOOL)a3 reason:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)BMSchoolTimeEvent;
  result = [(BMEventBase *)&v7 init];
  if (result)
  {
    result->_starting = a3;
    result->_reason = a4;
  }
  return result;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  v4 = [NSNumber numberWithBool:self->_starting];
  v5 = (void *)[v3 initWithFormat:@"SchoolTimeEvent event with starting: %@", v4];

  return (NSString *)v5;
}

- (unsigned)dataVersion
{
  return 0;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5 = a3;
  v6 = (void *)[objc_alloc((Class)a1) initWithProtoData:v5];

  return v6;
}

- (id)encodeAsProto
{
  v2 = [(BMSchoolTimeEvent *)self proto];
  id v3 = [v2 data];

  return v3;
}

- (BMSchoolTimeEvent)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t v6 = [v5 starting];
      uint64_t v7 = [v5 reason];
      uint64_t v8 = v7;
      if (v7 >= 3)
      {
        v11 = __biome_log_for_category();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          -[BMSchoolTimeEvent initWithProto:](v8);
        }

        uint64_t v9 = 0;
      }
      else
      {
        uint64_t v9 = v7;
      }
      self = [(BMSchoolTimeEvent *)self initWithStarting:v6 reason:v9];
      v10 = self;
    }
    else
    {
      id v5 = __biome_log_for_category();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[BMSchoolTimeEvent initWithProto:]((uint64_t)self, v5);
      }
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BMSchoolTimeEvent)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[BMPBSchoolTimeEvent alloc] initWithData:v4];

    self = [(BMSchoolTimeEvent *)self initWithProto:v5];
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
  objc_msgSend(v3, "setStarting:", -[BMSchoolTimeEvent isStarting](self, "isStarting"));
  unint64_t v4 = [(BMSchoolTimeEvent *)self reason];
  if (v4 >= 3)
  {
    uint64_t v6 = __biome_log_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[BMSchoolTimeEvent proto](v4);
    }

    id v5 = 0;
  }
  else
  {
    [v3 setReason:v4];
    id v5 = v3;
  }

  return v5;
}

- (unint64_t)hash
{
  id v3 = [NSNumber numberWithUnsignedInteger:self->_reason];
  uint64_t v4 = [v3 hash];
  id v5 = [NSNumber numberWithBool:self->_starting];
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
    int starting = self->_starting;
    if (starting == [v5 isStarting])
    {
      unint64_t reason = self->_reason;
      BOOL v8 = reason == [v5 reason];
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

- (BOOL)isStarting
{
  return self->_starting;
}

- (void)setStarting:(BOOL)a3
{
  self->_int starting = a3;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (void)setReason:(unint64_t)a3
{
  self->_unint64_t reason = a3;
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1)
{
  v1 = [NSNumber numberWithInt:a1];
  OUTLINED_FUNCTION_0_8(&dword_18E67D000, v2, v3, "BMSchoolTimeEvent: unable to convert BMPBSchoolTimeReason enum value: %@", v4, v5, v6, v7, 2u);
}

- (void)initWithProto:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  uint64_t v6 = v4;
  _os_log_fault_impl(&dword_18E67D000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-BMPBSchoolTimeDataVersion proto", (uint8_t *)&v5, 0xCu);
}

- (void)proto
{
  v1 = [NSNumber numberWithUnsignedInteger:a1];
  OUTLINED_FUNCTION_0_8(&dword_18E67D000, v2, v3, "BMSchoolTimeEvent: unable to convert BMSchoolTimeReason enum value: %@", v4, v5, v6, v7, 2u);
}

@end