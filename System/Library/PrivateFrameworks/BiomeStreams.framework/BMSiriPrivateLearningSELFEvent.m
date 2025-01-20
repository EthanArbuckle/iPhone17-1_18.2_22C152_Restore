@interface BMSiriPrivateLearningSELFEvent
+ (BOOL)supportsSecureCoding;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMSiriPrivateLearningSELFEvent)initWithCoder:(id)a3;
- (BMSiriPrivateLearningSELFEvent)initWithProto:(id)a3;
- (BMSiriPrivateLearningSELFEvent)initWithProtoData:(id)a3;
- (BMSiriPrivateLearningSELFEvent)initWithUniqueId:(id)a3 absoluteTimestamp:(double)a4 eventData:(id)a5;
- (BOOL)isCompleteWithContext:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (NSData)eventData;
- (NSString)uniqueId;
- (double)absoluteTimestamp;
- (id)encodeAsProto;
- (id)json;
- (id)jsonDict;
- (id)proto;
- (unint64_t)hash;
- (unsigned)dataVersion;
- (void)encodeWithCoder:(id)a3;
- (void)json;
@end

@implementation BMSiriPrivateLearningSELFEvent

- (BMSiriPrivateLearningSELFEvent)initWithUniqueId:(id)a3 absoluteTimestamp:(double)a4 eventData:(id)a5
{
  id v10 = a3;
  id v11 = a5;
  v12 = v11;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"BMSiriPrivateLearningSELFEvent.m", 25, @"Invalid parameter not satisfying: %@", @"uniqueId" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"BMSiriPrivateLearningSELFEvent.m", 26, @"Invalid parameter not satisfying: %@", @"eventData" object file lineNumber description];

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)BMSiriPrivateLearningSELFEvent;
  v13 = [(BMSiriPrivateLearningSELFEvent *)&v18 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_uniqueId, a3);
    v14->_absoluteTimestamp = a4;
    objc_storeStrong((id *)&v14->_eventData, a5);
  }

  return v14;
}

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v6 = a3;
  if (a4 == 1)
  {
    v7 = (void *)[objc_alloc((Class)a1) initWithProtoData:v6];
  }
  else
  {
    v8 = __biome_log_for_category();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[BMSiriPrivateLearningSELFEvent eventWithData:dataVersion:](a4, v8);
    }

    v7 = 0;
  }

  return v7;
}

- (id)jsonDict
{
  v8[3] = *MEMORY[0x1E4F143B8];
  v8[0] = self->_uniqueId;
  v7[0] = @"uniqueId";
  v7[1] = @"absoluteTimestamp";
  v3 = [NSNumber numberWithDouble:self->_absoluteTimestamp];
  v8[1] = v3;
  v7[2] = @"eventData";
  v4 = [(NSData *)self->_eventData base64EncodedStringWithOptions:16];
  v8[2] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];

  return v5;
}

- (id)json
{
  v2 = (void *)MEMORY[0x1E4F28D90];
  v3 = [(BMSiriPrivateLearningSELFEvent *)self jsonDict];
  id v8 = 0;
  v4 = [v2 dataWithJSONObject:v3 options:1 error:&v8];
  id v5 = v8;

  if (!v4)
  {
    id v6 = __biome_log_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(BMSiriPrivateLearningSELFEvent *)(uint64_t)v5 json];
    }
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(BMSiriPrivateLearningSELFEvent *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"dat"];
}

- (BMSiriPrivateLearningSELFEvent)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F93B90];
  id v5 = a3;
  id v6 = [v4 robustDecodeObjectOfClass:objc_opt_class() forKey:@"dat" withCoder:v5 expectNonNull:1 errorDomain:@"BMStreamErrorDomain" errorCode:2 logHandle:0];

  if (v6)
  {
    self = [(BMSiriPrivateLearningSELFEvent *)self initWithProtoData:v6];
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)encodeAsProto
{
  v2 = [(BMSiriPrivateLearningSELFEvent *)self proto];
  v3 = [v2 data];

  return v3;
}

- (BMSiriPrivateLearningSELFEvent)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      if ([v5 hasUniqueId]
        && [v5 hasAbsoluteTimestamp]
        && ([v5 hasEventData] & 1) != 0)
      {
        id v6 = [v5 uniqueId];
        [v5 absoluteTimestamp];
        double v8 = v7;
        v9 = [v5 eventData];
        self = [(BMSiriPrivateLearningSELFEvent *)self initWithUniqueId:v6 absoluteTimestamp:v9 eventData:v8];

        id v10 = self;
LABEL_14:

        goto LABEL_15;
      }
      id v11 = __biome_log_for_category();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        -[BMSiriPrivateLearningSELFEvent initWithProto:](v11);
      }
    }
    else
    {
      id v5 = __biome_log_for_category();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[BMSiriPrivateLearningSELFEvent initWithProto:](v5);
      }
    }
    id v10 = 0;
    goto LABEL_14;
  }
  id v10 = 0;
LABEL_15:

  return v10;
}

- (BMSiriPrivateLearningSELFEvent)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[BMPBSiriPrivateLearningSELFEvent alloc] initWithData:v4];

    self = [(BMSiriPrivateLearningSELFEvent *)self initWithProto:v5];
    id v6 = self;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)proto
{
  v3 = objc_opt_new();
  id v4 = [(BMSiriPrivateLearningSELFEvent *)self uniqueId];
  [v3 setUniqueId:v4];

  [(BMSiriPrivateLearningSELFEvent *)self absoluteTimestamp];
  objc_msgSend(v3, "setAbsoluteTimestamp:");
  id v5 = [(BMSiriPrivateLearningSELFEvent *)self eventData];
  [v3 setEventData:v5];

  return v3;
}

- (unint64_t)hash
{
  v3 = [NSNumber numberWithDouble:self->_absoluteTimestamp];
  uint64_t v4 = [v3 hash];
  NSUInteger v5 = [(NSString *)self->_uniqueId hash] ^ v4;

  return v5;
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
    if (absoluteTimestamp != v8)
    {
      char v13 = 0;
LABEL_20:

      goto LABEL_21;
    }
    uniqueId = self->_uniqueId;
    id v10 = uniqueId;
    if (!uniqueId)
    {
      uint64_t v11 = [v6 uniqueId];
      if (!v11)
      {
        objc_super v18 = 0;
        int v12 = 0;
        goto LABEL_12;
      }
      objc_super v18 = (void *)v11;
      id v10 = self->_uniqueId;
    }
    v3 = [v6 uniqueId];
    if (([v10 isEqualToString:v3] & 1) == 0)
    {

      char v13 = 0;
      goto LABEL_18;
    }
    int v12 = 1;
LABEL_12:
    eventData = self->_eventData;
    v15 = eventData;
    if (!eventData)
    {
      id v10 = [v6 eventData];
      if (!v10)
      {
        char v13 = 1;
        goto LABEL_23;
      }
      v15 = self->_eventData;
    }
    v16 = [v6 eventData];
    char v13 = [(NSData *)v15 isEqualToData:v16];

    if (eventData)
    {
      if (!v12) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
LABEL_23:

    if ((v12 & 1) == 0)
    {
LABEL_18:
      if (!uniqueId) {

      }
      goto LABEL_20;
    }
LABEL_17:

    goto LABEL_18;
  }
  char v13 = 0;
LABEL_21:

  return v13;
}

- (BOOL)isCompleteWithContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (self->_uniqueId && self->_eventData)
  {
    BOOL v7 = 1;
  }
  else if (a4)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"BMStreamErrorDomain" code:3 userInfo:0];
    BOOL v7 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (NSString)uniqueId
{
  return self->_uniqueId;
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (NSData)eventData
{
  return self->_eventData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventData, 0);

  objc_storeStrong((id *)&self->_uniqueId, 0);
}

+ (void)eventWithData:(int)a1 dataVersion:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109376;
  v2[1] = a1;
  __int16 v3 = 1024;
  int v4 = 1;
  _os_log_error_impl(&dword_18E67D000, a2, OS_LOG_TYPE_ERROR, "BMSiriPrivateLearningSELFEvent: Mismatched data versions (%u != %u) cannot deserialize", (uint8_t *)v2, 0xEu);
}

- (void)json
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18E67D000, a2, OS_LOG_TYPE_ERROR, "BMSiriPrivateLearningSELFEvent: Unable to create json from object: %@", (uint8_t *)&v2, 0xCu);
}

- (void)initWithProto:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_18E67D000, log, OS_LOG_TYPE_FAULT, "BMPSiriPrivateLearningSELFEvent: tried to initialize with a proto missing required data.", v1, 2u);
}

- (void)initWithProto:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_18E67D000, log, OS_LOG_TYPE_FAULT, "BMSiriPrivateLearningSELFEvent: tried to initialize with a non-BMPSiriPrivateLearningSELFEvent proto", v1, 2u);
}

@end