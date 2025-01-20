@interface BMStoreBookmark
+ (BOOL)supportsSecureCoding;
- (BMStoreBookmark)initWithCoder:(id)a3;
- (BMStoreBookmark)initWithProto:(id)a3;
- (BMStoreBookmark)initWithProtoData:(id)a3;
- (BMStoreBookmark)initWithStream:(id)a3 segment:(id)a4 iterationStartTime:(double)a5 offset:(unint64_t)a6;
- (BOOL)checkAndReportDecodingFailureIfNeededFordouble:(double)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (BOOL)isEqual:(id)a3;
- (NSString)segmentName;
- (NSString)streamId;
- (double)iterationStartTime;
- (id)_descriptionDict;
- (id)description;
- (id)encodeAsProto;
- (id)proto;
- (unint64_t)hash;
- (unint64_t)offset;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BMStoreBookmark

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segmentName, 0);
  objc_storeStrong((id *)&self->_streamId, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(BMStoreBookmark *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"data"];
}

- (id)encodeAsProto
{
  v2 = [(BMStoreBookmark *)self proto];
  v3 = [v2 data];

  return v3;
}

- (id)proto
{
  v3 = objc_opt_new();
  [v3 setStreamId:self->_streamId];
  [v3 setSegmentName:self->_segmentName];
  [v3 setIterationStartTime:self->_iterationStartTime];
  [v3 setOffset:LODWORD(self->_offset)];
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (BMStoreBookmark *)a3;
  if (self == v4)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      v6 = [(BMStoreBookmark *)v5 streamId];
      v7 = [(BMStoreBookmark *)self streamId];
      if ([v6 isEqual:v7])
      {
        v8 = [(BMStoreBookmark *)v5 segmentName];
        v9 = [(BMStoreBookmark *)self segmentName];
        if ([v8 isEqual:v9])
        {
          uint64_t v10 = [(BMStoreBookmark *)v5 offset];
          BOOL v11 = v10 == [(BMStoreBookmark *)self offset];
        }
        else
        {
          BOOL v11 = 0;
        }
      }
      else
      {
        BOOL v11 = 0;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (BMStoreBookmark)initWithStream:(id)a3 segment:(id)a4 iterationStartTime:(double)a5 offset:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  v24.receiver = self;
  v24.super_class = (Class)BMStoreBookmark;
  v13 = [(BMStoreBookmark *)&v24 init];
  if (!v13) {
    goto LABEL_12;
  }
  if (!v11)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, v13, @"BMStoreBookmark.m", 23, @"Invalid parameter not satisfying: %@", @"streamId != nil" object file lineNumber description];
  }
  if (![v11 length])
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, v13, @"BMStoreBookmark.m", 24, @"Invalid parameter not satisfying: %@", @"[streamId length] != 0" object file lineNumber description];

    if (v12) {
      goto LABEL_6;
    }
LABEL_14:
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, v13, @"BMStoreBookmark.m", 25, @"Invalid parameter not satisfying: %@", @"segmentName != nil" object file lineNumber description];

    goto LABEL_6;
  }
  if (!v12) {
    goto LABEL_14;
  }
LABEL_6:
  if (![v12 length])
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, v13, @"BMStoreBookmark.m", 26, @"Invalid parameter not satisfying: %@", @"[segmentName length] != 0" object file lineNumber description];
  }
  uint64_t v14 = BMBiomeLibraryStreamIdentifierForPremigratedStreamIdentifier();
  v15 = (void *)v14;
  if (v14) {
    v16 = (void *)v14;
  }
  else {
    v16 = v11;
  }
  objc_storeStrong((id *)&v13->_streamId, v16);

  uint64_t v17 = [v12 copy];
  segmentName = v13->_segmentName;
  v13->_segmentName = (NSString *)v17;

  v13->_iterationStartTime = a5;
  v13->_offset = a6;
LABEL_12:

  return v13;
}

- (unint64_t)offset
{
  return self->_offset;
}

- (NSString)segmentName
{
  return self->_segmentName;
}

- (NSString)streamId
{
  return self->_streamId;
}

- (BMStoreBookmark)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
  if (v7)
  {
    self = [(BMStoreBookmark *)self initWithProtoData:v7];
    v8 = self;
  }
  else
  {
    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"streamId"];
    if ([(BMStoreBookmark *)self checkAndReportDecodingFailureIfNeededForid:v9 key:@"streamId" coder:v4 errorDomain:v6 errorCode:-1])
    {
      v8 = 0;
    }
    else
    {
      uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"segmentName"];
      if (-[BMStoreBookmark checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:", v10, @"segmentName", v4, v6, -1)|| ([v4 decodeDoubleForKey:@"iterationStartTime"], double v12 = v11, -[BMStoreBookmark checkAndReportDecodingFailureIfNeededFordouble:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededFordouble:key:coder:errorDomain:errorCode:", @"iterationStartTime", v4, v6, -1)))
      {
        v8 = 0;
      }
      else
      {
        v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"offset"];
        if ([(BMStoreBookmark *)self checkAndReportDecodingFailureIfNeededForid:v13 key:@"offset" coder:v4 errorDomain:v6 errorCode:-1])
        {
          v8 = 0;
        }
        else
        {
          self = -[BMStoreBookmark initWithStream:segment:iterationStartTime:offset:](self, "initWithStream:segment:iterationStartTime:offset:", v9, v10, [v13 unsignedIntValue], v12);
          v8 = self;
        }
      }
    }
  }
  return v8;
}

- (BMStoreBookmark)initWithProtoData:(id)a3
{
  id v4 = a3;
  id v5 = [[BMPBStoreBookmark alloc] initWithData:v4];

  if (v5)
  {
    self = [(BMStoreBookmark *)self initWithProto:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BMStoreBookmark)initWithProto:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [v5 streamId];
    v7 = [v5 segmentName];
    [v5 iterationStartTime];
    double v9 = v8;
    unsigned int v10 = [v5 offset];

    self = [(BMStoreBookmark *)self initWithStream:v6 segment:v7 iterationStartTime:v10 offset:v9];
    double v11 = self;
  }
  else
  {
    double v11 = 0;
  }

  return v11;
}

- (double)iterationStartTime
{
  return self->_iterationStartTime;
}

- (id)_descriptionDict
{
  v10[4] = *MEMORY[0x1E4F143B8];
  unint64_t offset = self->_offset;
  if (offset == 0xFFFFFFFF)
  {
    id v4 = @"Start of segment";
  }
  else if (offset == 4294967294)
  {
    id v4 = @"End of frames";
  }
  else
  {
    id v4 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"%zu", self->_offset);
  }
  v9[0] = @"streamId";
  v9[1] = @"segmentName";
  segmentName = self->_segmentName;
  v10[0] = self->_streamId;
  v10[1] = segmentName;
  v9[2] = @"iterationStartTime";
  v6 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_iterationStartTime];
  v9[3] = @"offset";
  v10[2] = v6;
  v10[3] = v4;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:4];

  return v7;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [(BMStoreBookmark *)self _descriptionDict];
  v7 = [v6 description];
  double v8 = [v3 stringWithFormat:@"%@ - %@", v5, v7];

  return v8;
}

- (unint64_t)hash
{
  v3 = [(BMStoreBookmark *)self streamId];
  uint64_t v4 = [v3 hash];
  id v5 = [(BMStoreBookmark *)self segmentName];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLong:", -[BMStoreBookmark offset](self, "offset"));
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!a3)
  {
    v15 = [v12 error];

    if (v15)
    {
      BOOL v14 = 1;
      goto LABEL_7;
    }
    if (([v12 containsValueForKey:v11] & 1) == 0)
    {
      v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v17 = [NSString stringWithFormat:@"Failed to decode key %@", v11, *MEMORY[0x1E4F28568]];
      v22[0] = v17;
      BOOL v14 = 1;
      v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      v19 = [v16 errorWithDomain:v13 code:a7 userInfo:v18];

      [v12 failWithError:v19];
      goto LABEL_7;
    }
  }
  BOOL v14 = 0;
LABEL_7:

  return v14;
}

- (BOOL)checkAndReportDecodingFailureIfNeededFordouble:(double)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (a3 == 0.0)
  {
    v15 = [v12 error];

    if (v15)
    {
      BOOL v14 = 1;
      goto LABEL_7;
    }
    if (([v12 containsValueForKey:v11] & 1) == 0)
    {
      v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v17 = [NSString stringWithFormat:@"Failed to decode key %@", v11, *MEMORY[0x1E4F28568]];
      v22[0] = v17;
      BOOL v14 = 1;
      v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      v19 = [v16 errorWithDomain:v13 code:a7 userInfo:v18];

      [v12 failWithError:v19];
      goto LABEL_7;
    }
  }
  BOOL v14 = 0;
LABEL_7:

  return v14;
}

@end