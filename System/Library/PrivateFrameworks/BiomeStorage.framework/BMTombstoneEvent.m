@interface BMTombstoneEvent
+ (BOOL)supportsSecureCoding;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (unsigned)latestDataVersion;
- (BMTombstoneEvent)initWithCoder:(id)a3;
- (BMTombstoneEvent)initWithProto:(id)a3;
- (BMTombstoneEvent)initWithProtoData:(id)a3;
- (BMTombstoneEvent)initWithSegmentName:(id)a3 offset:(unint64_t)a4 length:(unint64_t)a5 eventTimestamp:(double)a6 reason:(unint64_t)a7 policyID:(id)a8;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)policyID;
- (NSString)processName;
- (NSString)segmentName;
- (double)eventTimestamp;
- (id)_initWithSegmentName:(id)a3 offset:(unint64_t)a4 length:(unint64_t)a5 eventTimestamp:(double)a6 reason:(unint64_t)a7 policyID:(id)a8 processName:(id)a9;
- (id)encodeAsProto;
- (id)jsonDictionary;
- (id)proto;
- (unint64_t)deletionReason;
- (unint64_t)hash;
- (unint64_t)length;
- (unint64_t)offset;
- (unsigned)dataVersion;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BMTombstoneEvent

- (BMTombstoneEvent)initWithSegmentName:(id)a3 offset:(unint64_t)a4 length:(unint64_t)a5 eventTimestamp:(double)a6 reason:(unint64_t)a7 policyID:(id)a8
{
  v14 = (void *)MEMORY[0x1E4F28F80];
  id v15 = a8;
  id v16 = a3;
  v17 = [v14 processInfo];
  v18 = [v17 processName];

  v19 = [(BMTombstoneEvent *)self _initWithSegmentName:v16 offset:a4 length:a5 eventTimestamp:a7 reason:v15 policyID:v18 processName:a6];
  return v19;
}

- (id)_initWithSegmentName:(id)a3 offset:(unint64_t)a4 length:(unint64_t)a5 eventTimestamp:(double)a6 reason:(unint64_t)a7 policyID:(id)a8 processName:(id)a9
{
  id v16 = a3;
  id v17 = a8;
  id v18 = a9;
  v27.receiver = self;
  v27.super_class = (Class)BMTombstoneEvent;
  v19 = [(BMTombstoneEvent *)&v27 init];
  if (v19)
  {
    v19->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    uint64_t v20 = [v16 copy];
    segmentName = v19->_segmentName;
    v19->_segmentName = (NSString *)v20;

    v19->_offset = a4;
    v19->_length = a5;
    v19->_eventTimestamp = a6;
    v19->_deletionReason = a7;
    uint64_t v22 = [v17 copy];
    policyID = v19->_policyID;
    v19->_policyID = (NSString *)v22;

    uint64_t v24 = [v18 copy];
    processName = v19->_processName;
    v19->_processName = (NSString *)v24;
  }
  return v19;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@: segmentName=%@, offset=%lu, timestamp=%.6f, deletionReason=%lu policyID=%@ process=%@>", objc_opt_class(), self->_segmentName, self->_offset, *(void *)&self->_eventTimestamp, self->_deletionReason, self->_policyID, self->_processName];
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_segmentName hash];
  v4 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLong:self->_offset];
  uint64_t v5 = [v4 hash] ^ v3;
  v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLong:self->_length];
  uint64_t v7 = [v6 hash];
  v8 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_eventTimestamp];
  uint64_t v9 = v5 ^ v7 ^ [v8 hash];
  v10 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:self->_deletionReason];
  uint64_t v11 = [v10 hash];
  NSUInteger v12 = v11 ^ [(NSString *)self->_policyID hash];
  NSUInteger v13 = v9 ^ v12 ^ [(NSString *)self->_processName hash];

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = (double *)v4;
    segmentName = self->_segmentName;
    if ((!((unint64_t)segmentName | *((void *)v5 + 2))
       || -[NSString isEqual:](segmentName, "isEqual:"))
      && self->_offset == *((void *)v5 + 3)
      && self->_length == *((void *)v5 + 4)
      && self->_eventTimestamp == v5[7]
      && self->_deletionReason == *((void *)v5 + 5)
      && ((policyID = self->_policyID, !((unint64_t)policyID | *((void *)v5 + 6)))
       || -[NSString isEqual:](policyID, "isEqual:")))
    {
      processName = self->_processName;
      if ((unint64_t)processName | *((void *)v5 + 8)) {
        char v9 = -[NSString isEqual:](processName, "isEqual:");
      }
      else {
        char v9 = 1;
      }
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

+ (unsigned)latestDataVersion
{
  return 2;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v6 = a3;
  if (a4 == 2)
  {
    uint64_t v7 = [objc_alloc((Class)a1) initWithProtoData:v6];
    v8 = (void *)v7;
    if (v7) {
      *(_DWORD *)(v7 + 8) = 2;
    }
  }
  else
  {
    char v9 = __biome_log_for_category();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[BMTombstoneEvent eventWithData:dataVersion:](a4, v9);
    }

    v8 = 0;
  }

  return v8;
}

- (id)jsonDictionary
{
  v19[7] = *MEMORY[0x1E4F143B8];
  v18[0] = @"segmentName";
  segmentName = self->_segmentName;
  uint64_t v4 = (uint64_t)segmentName;
  if (!segmentName)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v19[0] = v4;
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLong:", self->_offset, v4, v18[0], @"offset");
  v19[1] = v5;
  v18[2] = @"length";
  uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLong:self->_length];
  uint64_t v7 = (void *)v6;
  unint64_t deletionReason = self->_deletionReason;
  policyID = self->_policyID;
  if (deletionReason != 2) {
    unint64_t deletionReason = deletionReason == 1;
  }
  v10 = off_1E5E78758[deletionReason];
  v19[2] = v6;
  v19[3] = v10;
  v18[3] = @"deletionReason";
  v18[4] = @"policyID";
  uint64_t v11 = policyID;
  if (!policyID)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v19[4] = v11;
  v18[5] = @"eventTimestamp";
  NSUInteger v12 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_eventTimestamp];
  v19[5] = v12;
  v18[6] = @"processName";
  processName = self->_processName;
  v14 = processName;
  if (!processName)
  {
    v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v19[6] = v14;
  id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:7];
  if (!processName) {

  }
  if (!policyID) {
  if (!segmentName)
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)encodeAsProto
{
  v2 = [(BMTombstoneEvent *)self proto];
  NSUInteger v3 = [v2 data];

  return v3;
}

- (BMTombstoneEvent)initWithProto:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = -[BMPBTombstoneEvent segmentName]((uint64_t)v5);
    uint64_t v7 = -[BMPBTombstoneEvent offset]((uint64_t)v5);
    uint64_t v8 = -[BMPBTombstoneEvent length]((uint64_t)v5);
    double v9 = -[BMPBTombstoneEvent eventTimestamp]((uint64_t)v5);
    int v10 = -[BMPBTombstoneEvent reason]((uint64_t)v5);
    if (v10 == 2) {
      uint64_t v11 = 2;
    }
    else {
      uint64_t v11 = v10 == 1;
    }
    NSUInteger v12 = -[BMPBTombstoneEvent policyID]((uint64_t)v5);
    NSUInteger v13 = -[BMPBTombstoneEvent processName]((uint64_t)v5);

    self = (BMTombstoneEvent *)[(BMTombstoneEvent *)self _initWithSegmentName:v6 offset:v7 length:v8 eventTimestamp:v11 reason:v12 policyID:v13 processName:v9];
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BMTombstoneEvent)initWithProtoData:(id)a3
{
  id v4 = a3;
  id v5 = [[BMPBTombstoneEvent alloc] initWithData:v4];

  if (v5)
  {
    self = [(BMTombstoneEvent *)self initWithProto:v5];
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
  NSUInteger v3 = objc_opt_new();
  -[BMPBTombstoneEvent setSegmentName:]((uint64_t)v3, self->_segmentName);
  -[BMPBTombstoneEvent setOffset:]((uint64_t)v3, self->_offset);
  -[BMPBTombstoneEvent setLength:]((uint64_t)v3, self->_length);
  -[BMPBTombstoneEvent setEventTimestamp:]((uint64_t)v3, self->_eventTimestamp);
  unint64_t deletionReason = self->_deletionReason;
  if (deletionReason == 2) {
    int v5 = 2;
  }
  else {
    int v5 = deletionReason == 1;
  }
  -[BMPBTombstoneEvent setReason:]((uint64_t)v3, v5);
  -[BMPBTombstoneEvent setPolicyID:]((uint64_t)v3, self->_policyID);
  -[BMPBTombstoneEvent setProcessName:]((uint64_t)v3, self->_processName);
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(BMTombstoneEvent *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"data"];
  objc_msgSend(v4, "encodeInt64:forKey:", objc_msgSend((id)objc_opt_class(), "latestDataVersion"), @"dver");
}

- (BMTombstoneEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
  if (!v5 || (unint64_t v6 = [v4 decodeInt64ForKey:@"dver"], HIDWORD(v6)))
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = [(id)objc_opt_class() eventWithData:v5 dataVersion:v6];
  }

  return v7;
}

- (NSString)segmentName
{
  return self->_segmentName;
}

- (unint64_t)offset
{
  return self->_offset;
}

- (unint64_t)length
{
  return self->_length;
}

- (unint64_t)deletionReason
{
  return self->_deletionReason;
}

- (NSString)policyID
{
  return self->_policyID;
}

- (double)eventTimestamp
{
  return self->_eventTimestamp;
}

- (NSString)processName
{
  return self->_processName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_policyID, 0);
  objc_storeStrong((id *)&self->_segmentName, 0);
}

+ (void)eventWithData:(int)a1 dataVersion:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1AD076000, a2, OS_LOG_TYPE_ERROR, "Unable to decode BMTombstoneEvent with dataVersion %u", (uint8_t *)v2, 8u);
}

@end