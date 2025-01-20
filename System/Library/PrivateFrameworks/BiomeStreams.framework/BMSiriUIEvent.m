@interface BMSiriUIEvent
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMSiriUIEvent)initWithProto:(id)a3;
- (BMSiriUIEvent)initWithProtoData:(id)a3;
- (BMSiriUIEvent)initWithSessionID:(id)a3 UUID:(id)a4 viewMode:(id)a5 dismissalReason:(id)a6 starting:(BOOL)a7 absoluteTimeStamp:(double)a8;
- (BOOL)isEqual:(id)a3;
- (BOOL)isStarting;
- (NSString)UUID;
- (NSString)description;
- (NSString)dismissalReason;
- (NSString)sessionID;
- (NSString)viewMode;
- (double)absoluteTimestamp;
- (id)encodeAsProto;
- (id)proto;
- (unint64_t)hash;
- (unsigned)dataVersion;
- (void)setStarting:(BOOL)a3;
@end

@implementation BMSiriUIEvent

- (BMSiriUIEvent)initWithSessionID:(id)a3 UUID:(id)a4 viewMode:(id)a5 dismissalReason:(id)a6 starting:(BOOL)a7 absoluteTimeStamp:(double)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v28.receiver = self;
  v28.super_class = (Class)BMSiriUIEvent;
  v18 = [(BMEventBase *)&v28 init];
  if (v18)
  {
    uint64_t v19 = [v14 copy];
    sessionID = v18->_sessionID;
    v18->_sessionID = (NSString *)v19;

    uint64_t v21 = [v15 copy];
    UUID = v18->_UUID;
    v18->_UUID = (NSString *)v21;

    uint64_t v23 = [v16 copy];
    viewMode = v18->_viewMode;
    v18->_viewMode = (NSString *)v23;

    uint64_t v25 = [v17 copy];
    dismissalReason = v18->_dismissalReason;
    v18->_dismissalReason = (NSString *)v25;

    v18->_starting = a7;
    v18->_absoluteTimestamp = a8;
  }

  return v18;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  v5 = [(BMSiriUIEvent *)self sessionID];
  v6 = [(BMSiriUIEvent *)self UUID];
  v7 = [(BMSiriUIEvent *)self viewMode];
  v8 = [(BMSiriUIEvent *)self dismissalReason];
  v9 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriUIEvent isStarting](self, "isStarting"));
  v10 = NSNumber;
  [(BMSiriUIEvent *)self absoluteTimestamp];
  v11 = objc_msgSend(v10, "numberWithDouble:");
  v12 = (void *)[v3 initWithFormat:@"<%@ %p> sessionID: %@, UUID: %@, viewMode: %@, dismissalReason: %@, starting: %@, absoluteTimestamp: %@", v4, self, v5, v6, v7, v8, v9, v11];

  return (NSString *)v12;
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
  v2 = [(BMSiriUIEvent *)self proto];
  id v3 = [v2 data];

  return v3;
}

- (BMSiriUIEvent)initWithProto:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_7:
    v13 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v14 = __biome_log_for_category();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[BMSiriUIEvent initWithProto:]((uint64_t)self, v14);
    }

    goto LABEL_7;
  }
  id v5 = v4;
  v6 = [v5 sessionID];
  v7 = [v5 uuid];
  v8 = [v5 viewMode];
  v9 = [v5 dismissalReason];
  uint64_t v10 = [v5 starting];
  [v5 absoluteTimestamp];
  double v12 = v11;

  self = [(BMSiriUIEvent *)self initWithSessionID:v6 UUID:v7 viewMode:v8 dismissalReason:v9 starting:v10 absoluteTimeStamp:v12];
  v13 = self;
LABEL_8:

  return v13;
}

- (BMSiriUIEvent)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[BMPBSiriUIEvent alloc] initWithData:v4];

    self = [(BMSiriUIEvent *)self initWithProto:v5];
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
  id v4 = [(BMSiriUIEvent *)self sessionID];
  [v3 setSessionID:v4];

  id v5 = [(BMSiriUIEvent *)self UUID];
  [v3 setUuid:v5];

  v6 = [(BMSiriUIEvent *)self viewMode];
  [v3 setViewMode:v6];

  v7 = [(BMSiriUIEvent *)self dismissalReason];
  [v3 setDismissalReason:v7];

  objc_msgSend(v3, "setStarting:", -[BMSiriUIEvent isStarting](self, "isStarting"));
  [(BMSiriUIEvent *)self absoluteTimestamp];
  objc_msgSend(v3, "setAbsoluteTimestamp:");

  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_sessionID hash];
  NSUInteger v4 = [(NSString *)self->_UUID hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_viewMode hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_dismissalReason hash];
  v7 = [NSNumber numberWithBool:self->_starting];
  uint64_t v8 = [v7 hash];
  v9 = [NSNumber numberWithDouble:self->_absoluteTimestamp];
  unint64_t v10 = v6 ^ v8 ^ [v9 hash];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v11 = 0;
    goto LABEL_31;
  }
  id v8 = v7;
  v9 = [(BMSiriUIEvent *)self sessionID];
  if (!v9)
  {
    NSUInteger v3 = [v8 sessionID];
    if (!v3)
    {
      int v10 = 1;
LABEL_8:

      goto LABEL_9;
    }
  }
  NSUInteger v4 = [(BMSiriUIEvent *)self sessionID];
  NSUInteger v5 = [v8 sessionID];
  int v10 = [v4 isEqual:v5];

  if (!v9) {
    goto LABEL_8;
  }
LABEL_9:

  double v12 = [(BMSiriUIEvent *)self UUID];
  if (!v12)
  {
    NSUInteger v4 = [v8 UUID];
    if (!v4)
    {
      int v14 = 1;
LABEL_14:

      goto LABEL_15;
    }
  }
  NSUInteger v5 = [(BMSiriUIEvent *)self UUID];
  v13 = [v8 UUID];
  int v14 = [v5 isEqual:v13];

  if (!v12) {
    goto LABEL_14;
  }
LABEL_15:

  id v15 = [(BMSiriUIEvent *)self viewMode];
  if (!v15)
  {
    NSUInteger v5 = [v8 viewMode];
    if (!v5)
    {
      int v18 = 1;
LABEL_20:

      goto LABEL_21;
    }
  }
  id v16 = [(BMSiriUIEvent *)self viewMode];
  id v17 = [v8 viewMode];
  int v18 = [v16 isEqual:v17];

  if (!v15) {
    goto LABEL_20;
  }
LABEL_21:

  uint64_t v19 = [(BMSiriUIEvent *)self dismissalReason];
  if (v19 || ([v8 dismissalReason], (v32 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v20 = [(BMSiriUIEvent *)self dismissalReason];
    [v8 dismissalReason];
    int v21 = v18;
    int v22 = v14;
    v24 = int v23 = v10;
    int v25 = [v20 isEqual:v24];

    int v10 = v23;
    int v14 = v22;
    int v18 = v21;

    if (v19) {
      goto LABEL_27;
    }
  }
  else
  {
    v32 = 0;
    int v25 = 1;
  }

LABEL_27:
  BOOL v26 = [(BMSiriUIEvent *)self isStarting];
  char v27 = [v8 isStarting];
  [(BMSiriUIEvent *)self absoluteTimestamp];
  double v29 = v28;
  [v8 absoluteTimestamp];
  BOOL v11 = 0;
  if ((v10 & v14 & v18) == 1 && v25) {
    BOOL v11 = (v29 == v30) & ~(v26 ^ v27);
  }

LABEL_31:
  return v11;
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (NSString)UUID
{
  return self->_UUID;
}

- (NSString)viewMode
{
  return self->_viewMode;
}

- (NSString)dismissalReason
{
  return self->_dismissalReason;
}

- (BOOL)isStarting
{
  return self->_starting;
}

- (void)setStarting:(BOOL)a3
{
  self->_starting = a3;
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissalReason, 0);
  objc_storeStrong((id *)&self->_viewMode, 0);
  objc_storeStrong((id *)&self->_UUID, 0);

  objc_storeStrong((id *)&self->_sessionID, 0);
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = (objc_class *)objc_opt_class();
  NSUInteger v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  NSUInteger v6 = v4;
  _os_log_fault_impl(&dword_18E67D000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-BMPBSiriUIEvent proto", (uint8_t *)&v5, 0xCu);
}

@end