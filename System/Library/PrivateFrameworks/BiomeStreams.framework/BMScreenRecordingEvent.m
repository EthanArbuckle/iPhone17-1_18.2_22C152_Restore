@interface BMScreenRecordingEvent
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMScreenRecordingEvent)initWithIsStart:(BOOL)a3;
- (BMScreenRecordingEvent)initWithProto:(id)a3;
- (BMScreenRecordingEvent)initWithProtoData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isStart;
- (NSString)description;
- (id)encodeAsProto;
- (id)json;
- (id)jsonDict;
- (id)proto;
- (unsigned)dataVersion;
@end

@implementation BMScreenRecordingEvent

- (BMScreenRecordingEvent)initWithIsStart:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BMScreenRecordingEvent;
  result = [(BMEventBase *)&v5 init];
  if (result) {
    result->_isStart = a3;
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
  objc_super v5 = (void *)[v3 initWithFormat:@"Screen Recording event is start: %@", v4];

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
  v6[1] = *MEMORY[0x1E4F143B8];
  id v5 = @"isStart";
  v2 = [NSNumber numberWithBool:self->_isStart];
  v6[0] = v2;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

- (id)json
{
  v2 = (void *)MEMORY[0x1E4F28D90];
  id v3 = [(BMScreenRecordingEvent *)self jsonDict];
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
  v2 = [(BMScreenRecordingEvent *)self proto];
  id v3 = [v2 data];

  return v3;
}

- (BMScreenRecordingEvent)initWithProto:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_7:
    uint64_t v5 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = __biome_log_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[BMScreenRecordingEvent initWithProto:]((uint64_t)self, v6);
    }

    goto LABEL_7;
  }
  self = -[BMScreenRecordingEvent initWithIsStart:](self, "initWithIsStart:", [v4 isStart]);
  uint64_t v5 = self;
LABEL_8:

  return v5;
}

- (BMScreenRecordingEvent)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    uint64_t v5 = [[BMPBScreenRecordingEvent alloc] initWithData:v4];

    self = [(BMScreenRecordingEvent *)self initWithProto:v5];
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
  [v3 setIsStart:self->_isStart];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int isStart = self->_isStart;
    BOOL v6 = isStart == [v4 isStart];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isStart
{
  return self->_isStart;
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  BOOL v6 = v4;
  _os_log_fault_impl(&dword_18E67D000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-BMPBScreenRecordingEvent proto", (uint8_t *)&v5, 0xCu);
}

@end