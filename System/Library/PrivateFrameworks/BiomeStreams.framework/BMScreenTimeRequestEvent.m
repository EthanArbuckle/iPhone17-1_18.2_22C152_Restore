@interface BMScreenTimeRequestEvent
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMScreenTimeRequestEvent)initWithProto:(id)a3;
- (BMScreenTimeRequestEvent)initWithProtoData:(id)a3;
- (BMScreenTimeRequestEvent)initWithRequestID:(id)a3 kind:(int)a4 status:(int)a5 eventTime:(double)a6 approvalTime:(int)a7 requesterDSID:(id)a8 responderDSID:(id)a9 websitePath:(id)a10 bundleID:(id)a11;
- (BMScreenTimeRequestEvent)initWithRequestID:(id)a3 kind:(int)a4 status:(int)a5 eventTime:(double)a6 approvalTime:(int)a7 requesterDSID:(id)a8 responderDSID:(id)a9 websitePath:(id)a10 bundleID:(id)a11 isActionUserDevice:(BOOL)a12;
- (BOOL)isActionUserDevice;
- (BOOL)isEqual:(id)a3;
- (BOOL)validNonOptionalProperty:(id)a3 propertyName:(id)a4;
- (NSString)bundleID;
- (NSString)requestID;
- (NSString)requesterDSID;
- (NSString)responderDSID;
- (NSString)websitePath;
- (double)eventTime;
- (id)encodeAsProto;
- (id)json;
- (id)jsonDict;
- (id)proto;
- (int)approvalTime;
- (int)kind;
- (int)status;
- (unint64_t)hash;
- (unsigned)dataVersion;
- (void)json;
- (void)setApprovalTime:(int)a3;
- (void)setBundleID:(id)a3;
- (void)setEventTime:(double)a3;
- (void)setIsActionUserDevice:(BOOL)a3;
- (void)setKind:(int)a3;
- (void)setRequestID:(id)a3;
- (void)setRequesterDSID:(id)a3;
- (void)setResponderDSID:(id)a3;
- (void)setStatus:(int)a3;
- (void)setWebsitePath:(id)a3;
@end

@implementation BMScreenTimeRequestEvent

- (BOOL)validNonOptionalProperty:(id)a3 propertyName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v5)
  {
    v11 = __biome_log_for_category();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[BMAskToBuyEvent validNonOptionalProperty:propertyName:]((uint64_t)v6, v11);
    }
    goto LABEL_8;
  }
  v7 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  v8 = [v5 stringByTrimmingCharactersInSet:v7];
  uint64_t v9 = [v8 length];

  if (!v9)
  {
    v11 = __biome_log_for_category();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[BMAskToBuyEvent validNonOptionalProperty:propertyName:]((uint64_t)v6, v11);
    }
LABEL_8:

    BOOL v10 = 0;
    goto LABEL_9;
  }
  BOOL v10 = 1;
LABEL_9:

  return v10;
}

- (BMScreenTimeRequestEvent)initWithRequestID:(id)a3 kind:(int)a4 status:(int)a5 eventTime:(double)a6 approvalTime:(int)a7 requesterDSID:(id)a8 responderDSID:(id)a9 websitePath:(id)a10 bundleID:(id)a11
{
  LOBYTE(v12) = 0;
  return [(BMScreenTimeRequestEvent *)self initWithRequestID:a3 kind:*(void *)&a4 status:*(void *)&a5 eventTime:*(void *)&a7 approvalTime:a8 requesterDSID:a9 responderDSID:a6 websitePath:a10 bundleID:a11 isActionUserDevice:v12];
}

- (BMScreenTimeRequestEvent)initWithRequestID:(id)a3 kind:(int)a4 status:(int)a5 eventTime:(double)a6 approvalTime:(int)a7 requesterDSID:(id)a8 responderDSID:(id)a9 websitePath:(id)a10 bundleID:(id)a11 isActionUserDevice:(BOOL)a12
{
  id v46 = a3;
  id v45 = a8;
  id v19 = a9;
  id v44 = a10;
  id v20 = a11;
  v47.receiver = self;
  v47.super_class = (Class)BMScreenTimeRequestEvent;
  v21 = [(BMEventBase *)&v47 init];
  v22 = v21;
  if (!v21) {
    goto LABEL_20;
  }
  if ((a5 - 2) >= 2)
  {
    if (!a5)
    {
      v23 = __biome_log_for_category();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[BMScreenTimeRequestEvent initWithRequestID:kind:status:eventTime:approvalTime:requesterDSID:responderDSID:websitePath:bundleID:isActionUserDevice:](v23, v24, v25, v26, v27, v28, v29, v30);
      }
      goto LABEL_8;
    }
  }
  else if (![(BMScreenTimeRequestEvent *)v21 validNonOptionalProperty:v19 propertyName:@"responderDSID"])
  {
    goto LABEL_21;
  }
  if (![(BMScreenTimeRequestEvent *)v22 validNonOptionalProperty:v46 propertyName:@"requestID"]|| ![(BMScreenTimeRequestEvent *)v22 validNonOptionalProperty:v45 propertyName:@"requesterDSID"])
  {
    goto LABEL_21;
  }
  switch(a4)
  {
    case 0:
      v23 = __biome_log_for_category();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[BMScreenTimeRequestEvent initWithRequestID:kind:status:eventTime:approvalTime:requesterDSID:responderDSID:websitePath:bundleID:isActionUserDevice:](v23, v34, v35, v36, v37, v38, v39, v40);
      }
LABEL_8:

      goto LABEL_21;
    case 1:
      v31 = @"websitePath";
      v32 = v22;
      id v33 = v44;
LABEL_18:
      if ([(BMScreenTimeRequestEvent *)v32 validNonOptionalProperty:v33 propertyName:v31])
      {
        break;
      }
LABEL_21:
      v41 = 0;
      goto LABEL_22;
    case 2:
      v31 = @"bundleID";
      v32 = v22;
      id v33 = v20;
      goto LABEL_18;
  }
  objc_storeStrong((id *)&v22->_requestID, a3);
  v22->_kind = a4;
  v22->_status = a5;
  v22->_eventTime = a6;
  v22->_approvalTime = a7;
  objc_storeStrong((id *)&v22->_requesterDSID, a8);
  objc_storeStrong((id *)&v22->_responderDSID, a9);
  objc_storeStrong((id *)&v22->_websitePath, a10);
  objc_storeStrong((id *)&v22->_bundleID, a11);
  v22->_isActionUserDevice = a12;
LABEL_20:
  v41 = v22;
LABEL_22:

  return v41;
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
      +[BMScreenTimeRequestEvent eventWithData:dataVersion:](a4, v8);
    }

    v7 = 0;
  }

  return v7;
}

- (unsigned)dataVersion
{
  return 1;
}

- (id)encodeAsProto
{
  v2 = [(BMScreenTimeRequestEvent *)self proto];
  v3 = [v2 data];

  return v3;
}

- (BMScreenTimeRequestEvent)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[BMPBScreenTimeRequestEvent alloc] initWithData:v4];

    self = [(BMScreenTimeRequestEvent *)self initWithProto:v5];
    id v6 = self;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BMScreenTimeRequestEvent)initWithProto:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_16:
    id v19 = 0;
    goto LABEL_17;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v20 = __biome_log_for_category();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      -[BMScreenTimeRequestEvent initWithProto:]((uint64_t)self, v20);
    }

    goto LABEL_16;
  }
  id v5 = v4;
  unsigned int v6 = [v5 status];
  if (v6 - 1 >= 3) {
    unsigned int v7 = 0;
  }
  else {
    unsigned int v7 = v6;
  }
  unsigned int v23 = v7;
  int v8 = [v5 kind];
  if (v8 == 1) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = 2 * (v8 == 2);
  }
  unsigned int v10 = [v5 approvalTime];
  if (v10 - 1 >= 3) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = v10;
  }
  uint64_t v12 = [v5 requestID];
  [v5 eventTime];
  double v14 = v13;
  v15 = [v5 requesterDSID];
  v16 = [v5 responderDSID];
  v17 = [v5 websitePath];
  v18 = [v5 bundleID];
  LOBYTE(v22) = [v5 isActionUserDevice];
  self = [(BMScreenTimeRequestEvent *)self initWithRequestID:v12 kind:v9 status:v23 eventTime:v11 approvalTime:v15 requesterDSID:v16 responderDSID:v14 websitePath:v17 bundleID:v18 isActionUserDevice:v22];

  id v19 = self;
LABEL_17:

  return v19;
}

- (id)proto
{
  unsigned int status = self->_status;
  if (status - 1 >= 3) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = status;
  }
  int kind = self->_kind;
  unsigned int approvalTime = self->_approvalTime;
  if (approvalTime - 1 >= 3) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = approvalTime;
  }
  if (kind == 1) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = 2 * (kind == 2);
  }
  uint64_t v9 = objc_opt_new();
  [v9 setRequestID:self->_requestID];
  [v9 setKind:v8];
  [v9 setStatus:v4];
  [v9 setEventTime:self->_eventTime];
  [v9 setApprovalTime:v7];
  [v9 setRequesterDSID:self->_requesterDSID];
  [v9 setResponderDSID:self->_responderDSID];
  [v9 setWebsitePath:self->_websitePath];
  [v9 setBundleID:self->_bundleID];
  [v9 setIsActionUserDevice:self->_isActionUserDevice];

  return v9;
}

- (id)jsonDict
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [v3 setObject:self->_requestID forKeyedSubscript:@"requestID"];
  uint64_t v4 = [NSNumber numberWithInt:self->_status];
  [v3 setObject:v4 forKeyedSubscript:@"status"];

  id v5 = [NSNumber numberWithInt:self->_kind];
  [v3 setObject:v5 forKeyedSubscript:@"kind"];

  unsigned int v6 = [NSNumber numberWithDouble:self->_eventTime];
  [v3 setObject:v6 forKeyedSubscript:@"eventTime"];

  uint64_t v7 = [NSNumber numberWithInt:self->_approvalTime];
  [v3 setObject:v7 forKeyedSubscript:@"approvalTime"];

  [v3 setObject:self->_requesterDSID forKeyedSubscript:@"requesterDSID"];
  [v3 setObject:self->_responderDSID forKeyedSubscript:@"responderDSID"];
  [v3 setObject:self->_websitePath forKeyedSubscript:@"websitePath"];
  [v3 setObject:self->_bundleID forKeyedSubscript:@"bundleID"];
  uint64_t v8 = [NSNumber numberWithBool:self->_isActionUserDevice];
  [v3 setObject:v8 forKeyedSubscript:@"isActionUserDevice"];

  return v3;
}

- (id)json
{
  v2 = (void *)MEMORY[0x1E4F28D90];
  v3 = [(BMScreenTimeRequestEvent *)self jsonDict];
  uint64_t v15 = 0;
  uint64_t v4 = [v2 dataWithJSONObject:v3 options:1 error:&v15];
  uint64_t v5 = v15;

  if (v5)
  {
    unsigned int v6 = __biome_log_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(BMScreenTimeRequestEvent *)v6 json];
    }
  }

  return v4;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_requestID hash];
  return [(NSString *)self->_requesterDSID hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unsigned int v6 = NSNumber;
    [(BMScreenTimeRequestEvent *)self eventTime];
    uint64_t v7 = objc_msgSend(v6, "numberWithDouble:");
    uint64_t v8 = [v7 longValue];

    uint64_t v9 = NSNumber;
    [v5 eventTime];
    uint64_t v10 = objc_msgSend(v9, "numberWithDouble:");
    uint64_t v11 = [v10 longValue];

    uint64_t v12 = [(BMScreenTimeRequestEvent *)self requestID];
    uint64_t v13 = [v5 requestID];
    int v14 = [v12 isEqualToString:v13];

    LODWORD(v12) = [(BMScreenTimeRequestEvent *)self status];
    if (v12 == [v5 status]) {
      int v15 = v14;
    }
    else {
      int v15 = 0;
    }
    int v16 = [(BMScreenTimeRequestEvent *)self kind];
    if (v16 == [v5 kind]) {
      int v17 = v15;
    }
    else {
      int v17 = 0;
    }
    if (v8 == v11) {
      int v18 = v17;
    }
    else {
      int v18 = 0;
    }
    int v19 = [(BMScreenTimeRequestEvent *)self approvalTime];
    if (v19 == [v5 approvalTime]) {
      int v20 = v18;
    }
    else {
      int v20 = 0;
    }
    v21 = [(BMScreenTimeRequestEvent *)self requesterDSID];
    uint64_t v22 = [v5 requesterDSID];
    int v23 = v20 & [v21 isEqualToString:v22];

    uint64_t v24 = [(BMScreenTimeRequestEvent *)self responderDSID];
    if (v24)
    {
    }
    else
    {
      uint64_t v26 = [v5 responderDSID];

      if (!v26) {
        goto LABEL_19;
      }
    }
    uint64_t v27 = [(BMScreenTimeRequestEvent *)self responderDSID];
    uint64_t v28 = [v5 responderDSID];
    v23 &= [v27 isEqualToString:v28];

LABEL_19:
    uint64_t v29 = [(BMScreenTimeRequestEvent *)self websitePath];
    if (v29)
    {
    }
    else
    {
      uint64_t v30 = [v5 websitePath];

      if (!v30) {
        goto LABEL_23;
      }
    }
    v31 = [(BMScreenTimeRequestEvent *)self websitePath];
    v32 = [v5 websitePath];
    v23 &= [v31 isEqualToString:v32];

LABEL_23:
    id v33 = [(BMScreenTimeRequestEvent *)self bundleID];
    if (v33)
    {
    }
    else
    {
      uint64_t v34 = [v5 bundleID];

      if (!v34)
      {
LABEL_27:
        BOOL v37 = [(BMScreenTimeRequestEvent *)self isActionUserDevice];
        int v25 = v23 & (v37 ^ [v5 isActionUserDevice] ^ 1);

        goto LABEL_28;
      }
    }
    uint64_t v35 = [(BMScreenTimeRequestEvent *)self bundleID];
    uint64_t v36 = [v5 bundleID];
    v23 &= [v35 isEqualToString:v36];

    goto LABEL_27;
  }
  LOBYTE(v25) = 0;
LABEL_28:

  return v25;
}

- (NSString)requestID
{
  return self->_requestID;
}

- (void)setRequestID:(id)a3
{
}

- (int)kind
{
  return self->_kind;
}

- (void)setKind:(int)a3
{
  self->_int kind = a3;
}

- (int)status
{
  return self->_status;
}

- (void)setStatus:(int)a3
{
  self->_unsigned int status = a3;
}

- (double)eventTime
{
  return self->_eventTime;
}

- (void)setEventTime:(double)a3
{
  self->_eventTime = a3;
}

- (int)approvalTime
{
  return self->_approvalTime;
}

- (void)setApprovalTime:(int)a3
{
  self->_unsigned int approvalTime = a3;
}

- (NSString)requesterDSID
{
  return self->_requesterDSID;
}

- (void)setRequesterDSID:(id)a3
{
}

- (NSString)responderDSID
{
  return self->_responderDSID;
}

- (void)setResponderDSID:(id)a3
{
}

- (NSString)websitePath
{
  return self->_websitePath;
}

- (void)setWebsitePath:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (BOOL)isActionUserDevice
{
  return self->_isActionUserDevice;
}

- (void)setIsActionUserDevice:(BOOL)a3
{
  self->_isActionUserDevice = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_websitePath, 0);
  objc_storeStrong((id *)&self->_responderDSID, 0);
  objc_storeStrong((id *)&self->_requesterDSID, 0);

  objc_storeStrong((id *)&self->_requestID, 0);
}

- (void)initWithRequestID:(uint64_t)a3 kind:(uint64_t)a4 status:(uint64_t)a5 eventTime:(uint64_t)a6 approvalTime:(uint64_t)a7 requesterDSID:(uint64_t)a8 responderDSID:websitePath:bundleID:isActionUserDevice:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithRequestID:(uint64_t)a3 kind:(uint64_t)a4 status:(uint64_t)a5 eventTime:(uint64_t)a6 approvalTime:(uint64_t)a7 requesterDSID:(uint64_t)a8 responderDSID:websitePath:bundleID:isActionUserDevice:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)eventWithData:(int)a1 dataVersion:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109376;
  v2[1] = a1;
  __int16 v3 = 1024;
  int v4 = 1;
  _os_log_error_impl(&dword_18E67D000, a2, OS_LOG_TYPE_ERROR, "BMScreenTimeRequestEvent: Mismatched data versions (%u != %u) cannot deserialize", (uint8_t *)v2, 0xEu);
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  __int16 v3 = (objc_class *)objc_opt_class();
  int v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  unsigned int v6 = v4;
  _os_log_fault_impl(&dword_18E67D000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-BMPBScreenTimeRequestEvent proto", (uint8_t *)&v5, 0xCu);
}

- (void)json
{
}

@end