@interface BMWorkoutEvent
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMWorkoutEvent)initWithProto:(id)a3;
- (BMWorkoutEvent)initWithProtoData:(id)a3;
- (BMWorkoutEvent)initWithStarting:(BOOL)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isStarting;
- (NSString)description;
- (id)encodeAsProto;
- (id)proto;
- (unsigned)dataVersion;
- (void)setStarting:(BOOL)a3;
@end

@implementation BMWorkoutEvent

- (BMWorkoutEvent)initWithStarting:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BMWorkoutEvent;
  result = [(BMEventBase *)&v5 init];
  if (result) {
    result->_starting = a3;
  }
  return result;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  v4 = [NSNumber numberWithBool:self->_starting];
  objc_super v5 = (void *)[v3 initWithFormat:@"Workout event with isWorkoutStart: %@", v4];

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
  v2 = [(BMWorkoutEvent *)self proto];
  id v3 = [v2 data];

  return v3;
}

- (BMWorkoutEvent)initWithProto:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_7:
    id v5 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = __biome_log_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[BMWorkoutEvent initWithProto:]((uint64_t)self, v6);
    }

    goto LABEL_7;
  }
  self = -[BMWorkoutEvent initWithStarting:](self, "initWithStarting:", [v4 starting]);
  id v5 = self;
LABEL_8:

  return v5;
}

- (BMWorkoutEvent)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[BMPBWorkoutEvent alloc] initWithData:v4];

    self = [(BMWorkoutEvent *)self initWithProto:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)proto
{
  id v3 = objc_opt_new();
  objc_msgSend(v3, "setStarting:", -[BMWorkoutEvent isStarting](self, "isStarting"));

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    BOOL v6 = [(BMWorkoutEvent *)self isStarting];
    char v7 = [v5 isStarting];

    char v8 = v6 ^ v7 ^ 1;
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)isStarting
{
  return self->_starting;
}

- (void)setStarting:(BOOL)a3
{
  self->_starting = a3;
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  BOOL v6 = v4;
  _os_log_fault_impl(&dword_18E67D000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-BMPBWorkoutEvent proto", (uint8_t *)&v5, 0xCu);
}

@end