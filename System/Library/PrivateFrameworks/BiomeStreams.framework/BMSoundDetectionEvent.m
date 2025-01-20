@interface BMSoundDetectionEvent
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMSoundDetectionEvent)initWithAbsoluteTimestamp:(double)a3 type:(id)a4 customName:(id)a5;
- (BMSoundDetectionEvent)initWithProto:(id)a3;
- (BMSoundDetectionEvent)initWithProtoData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)type;
- (double)absoluteTimestamp;
- (id)encodeAsProto;
- (id)proto;
- (unint64_t)hash;
- (unsigned)dataVersion;
@end

@implementation BMSoundDetectionEvent

- (BMSoundDetectionEvent)initWithAbsoluteTimestamp:(double)a3 type:(id)a4 customName:(id)a5
{
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)BMSoundDetectionEvent;
  v8 = [(BMEventBase *)&v13 init];
  v9 = v8;
  if (v8)
  {
    v8->_absoluteTimestamp = a3;
    uint64_t v10 = [v7 copy];
    type = v9->_type;
    v9->_type = (NSString *)v10;
  }
  return v9;
}

- (BMSoundDetectionEvent)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [[BMPBSoundDetectionEvent alloc] initWithData:v4];

    self = [(BMSoundDetectionEvent *)self initWithProto:v5];
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
  v2 = [(BMSoundDetectionEvent *)self proto];
  v3 = [v2 data];

  return v3;
}

- (BMSoundDetectionEvent)initWithProto:(id)a3
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
    uint64_t v10 = __biome_log_for_category();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[BMSoundDetectionEvent initWithProto:]((uint64_t)self, v10);
    }

    goto LABEL_7;
  }
  id v5 = v4;
  [v5 absoluteTimestamp];
  double v7 = v6;
  v8 = [v5 soundDetectionType];

  self = [(BMSoundDetectionEvent *)self initWithAbsoluteTimestamp:v8 type:0 customName:v7];
  v9 = self;
LABEL_8:

  return v9;
}

- (id)proto
{
  v3 = objc_alloc_init(BMPBSoundDetectionEvent);
  [(BMSoundDetectionEvent *)self absoluteTimestamp];
  -[BMPBSoundDetectionEvent setAbsoluteTimestamp:](v3, "setAbsoluteTimestamp:");
  id v4 = [(BMSoundDetectionEvent *)self type];
  [(BMPBSoundDetectionEvent *)v3 setSoundDetectionType:v4];

  return v3;
}

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5 = a3;
  double v6 = (void *)[objc_alloc((Class)a1) initWithProtoData:v5];

  return v6;
}

- (unint64_t)hash
{
  [(BMSoundDetectionEvent *)self absoluteTimestamp];
  unint64_t v4 = (unint64_t)(v3 * 1000.0);
  id v5 = [(BMSoundDetectionEvent *)self type];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    double absoluteTimestamp = self->_absoluteTimestamp;
    [v6 absoluteTimestamp];
    if (absoluteTimestamp == v8)
    {
      type = self->_type;
      uint64_t v10 = type;
      if (!type)
      {
        double v3 = [v6 type];
        if (!v3)
        {
          char v12 = 1;
LABEL_11:

          goto LABEL_12;
        }
        uint64_t v10 = self->_type;
      }
      v11 = [v6 type];
      char v12 = [(NSString *)v10 isEqual:v11];

      if (!type) {
        goto LABEL_11;
      }
    }
    else
    {
      char v12 = 0;
    }
LABEL_12:

    goto LABEL_13;
  }
  char v12 = 0;
LABEL_13:

  return v12;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  id v5 = (void *)MEMORY[0x1E4F1C9C8];
  [(BMSoundDetectionEvent *)self absoluteTimestamp];
  id v6 = objc_msgSend(v5, "dateWithTimeIntervalSinceReferenceDate:");
  double v7 = [(BMSoundDetectionEvent *)self type];
  double v8 = (void *)[v3 initWithFormat:@"<%@ %p> time: %@, type: %@", v4, self, v6, v7];

  return (NSString *)v8;
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (NSString)type
{
  return self->_type;
}

- (void).cxx_destruct
{
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  id v6 = v4;
  _os_log_fault_impl(&dword_18E67D000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-BMPBSoundDetectionEvent proto", (uint8_t *)&v5, 0xCu);
}

@end