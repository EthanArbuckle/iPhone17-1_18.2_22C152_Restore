@interface BMBacklightEvent
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMBacklightEvent)initWithAbsoluteTimestamp:(double)a3 backlightLevel:(unint64_t)a4;
- (BMBacklightEvent)initWithProto:(id)a3;
- (BMBacklightEvent)initWithProtoData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (double)absoluteTimestamp;
- (id)encodeAsProto;
- (id)proto;
- (unint64_t)backlightLevel;
- (unsigned)dataVersion;
@end

@implementation BMBacklightEvent

- (BMBacklightEvent)initWithAbsoluteTimestamp:(double)a3 backlightLevel:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)BMBacklightEvent;
  result = [(BMEventBase *)&v7 init];
  if (result)
  {
    result->_absoluteTimestamp = a3;
    result->_backlightLevel = a4;
  }
  return result;
}

- (NSString)description
{
  v2 = objc_msgSend([NSString alloc], "initWithFormat:", @"Backlight event with timestamp: %f", *(void *)&self->_absoluteTimestamp);

  return (NSString *)v2;
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
  v2 = [(BMBacklightEvent *)self proto];
  v3 = [v2 data];

  return v3;
}

- (BMBacklightEvent)initWithProto:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_7:
    v9 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = __biome_log_for_category();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[BMBacklightEvent initWithProto:]((uint64_t)self, v10);
    }

    goto LABEL_7;
  }
  id v5 = v4;
  [v5 absoluteTimestamp];
  double v7 = v6;
  uint64_t v8 = [v5 backlightLevel];

  self = [(BMBacklightEvent *)self initWithAbsoluteTimestamp:v8 backlightLevel:v7];
  v9 = self;
LABEL_8:

  return v9;
}

- (BMBacklightEvent)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[BMPBBacklightEvent alloc] initWithData:v4];

    self = [(BMBacklightEvent *)self initWithProto:v5];
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
  [v3 setBacklightLevel:self->_backlightLevel];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    double absoluteTimestamp = self->_absoluteTimestamp;
    [v5 absoluteTimestamp];
    if (absoluteTimestamp == v7)
    {
      unint64_t backlightLevel = self->_backlightLevel;
      BOOL v9 = backlightLevel == [v5 backlightLevel];
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (unint64_t)backlightLevel
{
  return self->_backlightLevel;
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  double v6 = v4;
  _os_log_fault_impl(&dword_18E67D000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-BMPBBacklightEvent proto", (uint8_t *)&v5, 0xCu);
}

@end