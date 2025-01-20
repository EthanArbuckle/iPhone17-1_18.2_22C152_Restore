@interface BMMicroLocationTruthTagEvent
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMMicroLocationTruthTagEvent)initWithAbsoluteTimestamp:(double)a3 clientBundleIdentifier:(id)a4 truthTagIdentifier:(id)a5 recordingRequestIdentifier:(id)a6;
- (BMMicroLocationTruthTagEvent)initWithProto:(id)a3;
- (BMMicroLocationTruthTagEvent)initWithProtoData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)clientBundleIdentifier;
- (NSUUID)recordingRequestIdentifier;
- (NSUUID)truthTagIdentifier;
- (double)absoluteTimestamp;
- (id)encodeAsProto;
- (id)proto;
- (unint64_t)hash;
- (unsigned)dataVersion;
@end

@implementation BMMicroLocationTruthTagEvent

- (BMMicroLocationTruthTagEvent)initWithAbsoluteTimestamp:(double)a3 clientBundleIdentifier:(id)a4 truthTagIdentifier:(id)a5 recordingRequestIdentifier:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)BMMicroLocationTruthTagEvent;
  v13 = [(BMMicroLocationTruthTagEvent *)&v22 init];
  v14 = v13;
  if (v13)
  {
    v13->_absoluteTimestamp = a3;
    uint64_t v15 = [v10 copy];
    clientBundleIdentifier = v14->_clientBundleIdentifier;
    v14->_clientBundleIdentifier = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    truthTagIdentifier = v14->_truthTagIdentifier;
    v14->_truthTagIdentifier = (NSUUID *)v17;

    uint64_t v19 = [v12 copy];
    recordingRequestIdentifier = v14->_recordingRequestIdentifier;
    v14->_recordingRequestIdentifier = (NSUUID *)v19;
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
      +[BMMicroLocationTruthTagEvent eventWithData:dataVersion:](a4, v8);
    }

    v7 = 0;
  }

  return v7;
}

- (id)encodeAsProto
{
  v2 = [(BMMicroLocationTruthTagEvent *)self proto];
  v3 = [v2 data];

  return v3;
}

- (BMMicroLocationTruthTagEvent)initWithProto:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_7:
    uint64_t v15 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v16 = __biome_log_for_category();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      -[BMMicroLocationTruthTagEvent initWithProto:]((uint64_t)self, v16);
    }

    goto LABEL_7;
  }
  id v5 = v4;
  [v5 absoluteTimestamp];
  double v7 = v6;
  v8 = [v5 clientBundleId];
  id v9 = objc_alloc(MEMORY[0x1E4F29128]);
  id v10 = [v5 truthTagIdentifier];
  id v11 = (void *)[v9 initWithUUIDString:v10];
  id v12 = objc_alloc(MEMORY[0x1E4F29128]);
  v13 = [v5 recordingRequestIdentifier];

  v14 = (void *)[v12 initWithUUIDString:v13];
  self = [(BMMicroLocationTruthTagEvent *)self initWithAbsoluteTimestamp:v8 clientBundleIdentifier:v11 truthTagIdentifier:v14 recordingRequestIdentifier:v7];

  uint64_t v15 = self;
LABEL_8:

  return v15;
}

- (BMMicroLocationTruthTagEvent)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[BMPBMicroLocationTruthTagEvent alloc] initWithData:v4];

    self = [(BMMicroLocationTruthTagEvent *)self initWithProto:v5];
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
  [v3 setClientBundleId:self->_clientBundleIdentifier];
  id v4 = [(NSUUID *)self->_truthTagIdentifier UUIDString];
  [v3 setTruthTagIdentifier:v4];

  id v5 = [(NSUUID *)self->_recordingRequestIdentifier UUIDString];
  [v3 setRecordingRequestIdentifier:v5];

  return v3;
}

- (unint64_t)hash
{
  v3 = [NSNumber numberWithDouble:self->_absoluteTimestamp];
  uint64_t v4 = [v3 hash];
  NSUInteger v5 = [(NSString *)self->_clientBundleIdentifier hash];
  uint64_t v6 = v5 ^ [(NSUUID *)self->_truthTagIdentifier hash];
  unint64_t v7 = v6 ^ [(NSUUID *)self->_recordingRequestIdentifier hash] ^ v4;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v14 = 0;
    goto LABEL_28;
  }
  id v7 = v6;
  double absoluteTimestamp = self->_absoluteTimestamp;
  [v7 absoluteTimestamp];
  double v10 = v9;
  clientBundleIdentifier = self->_clientBundleIdentifier;
  id v12 = clientBundleIdentifier;
  if (clientBundleIdentifier)
  {
LABEL_5:
    uint64_t v4 = [v7 clientBundleIdentifier];
    char v13 = [(NSString *)v12 isEqualToString:v4];

    if (clientBundleIdentifier) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  v3 = [v7 clientBundleIdentifier];
  if (v3)
  {
    id v12 = self->_clientBundleIdentifier;
    goto LABEL_5;
  }
  char v13 = 1;
LABEL_9:

LABEL_10:
  truthTagIdentifier = self->_truthTagIdentifier;
  v16 = truthTagIdentifier;
  if (truthTagIdentifier) {
    goto LABEL_13;
  }
  uint64_t v4 = [v7 truthTagIdentifier];
  if (v4)
  {
    v16 = self->_truthTagIdentifier;
LABEL_13:
    uint64_t v17 = [v7 truthTagIdentifier];
    char v18 = [(NSUUID *)v16 isEqual:v17];

    if (truthTagIdentifier) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  char v18 = 1;
LABEL_16:

LABEL_17:
  double v19 = vabdd_f64(absoluteTimestamp, v10);
  recordingRequestIdentifier = self->_recordingRequestIdentifier;
  v21 = recordingRequestIdentifier;
  if (!recordingRequestIdentifier)
  {
    uint64_t v4 = [v7 recordingRequestIdentifier];
    if (!v4)
    {
      char v23 = 1;
LABEL_23:

      goto LABEL_24;
    }
    v21 = self->_recordingRequestIdentifier;
  }
  objc_super v22 = [v7 recordingRequestIdentifier];
  char v23 = [(NSUUID *)v21 isEqual:v22];

  if (!recordingRequestIdentifier) {
    goto LABEL_23;
  }
LABEL_24:
  if (v19 < 2.22044605e-16) {
    char v24 = v13;
  }
  else {
    char v24 = 0;
  }
  char v14 = v24 & v18 & v23;

LABEL_28:
  return v14;
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (NSString)clientBundleIdentifier
{
  return self->_clientBundleIdentifier;
}

- (NSUUID)truthTagIdentifier
{
  return self->_truthTagIdentifier;
}

- (NSUUID)recordingRequestIdentifier
{
  return self->_recordingRequestIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordingRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_truthTagIdentifier, 0);

  objc_storeStrong((id *)&self->_clientBundleIdentifier, 0);
}

+ (void)eventWithData:(int)a1 dataVersion:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109376;
  v2[1] = a1;
  __int16 v3 = 1024;
  int v4 = 1;
  _os_log_error_impl(&dword_18E67D000, a2, OS_LOG_TYPE_ERROR, "BMMicroLocationTruthTagEvent: Mismatched data version (%u != %u) cannot deserialize", (uint8_t *)v2, 0xEu);
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  __int16 v3 = (objc_class *)objc_opt_class();
  int v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  id v6 = v4;
  _os_log_fault_impl(&dword_18E67D000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-BMPBMicroLocationTruthTagEvent proto", (uint8_t *)&v5, 0xCu);
}

@end