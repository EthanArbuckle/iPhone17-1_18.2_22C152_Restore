@interface CTStewieIMessageLiteMessageIncoming
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToOther:(id)a3;
- (CTStewieIMessageLiteMessageIncoming)initWithCoder:(id)a3;
- (CTStewieIMessageLiteMessageIncoming)initWithTimestamp:(id)a3 pendingTotalCount:(int64_t)a4 pendingCount:(int64_t)a5 myShortHandle:(id)a6 otherShortHandle:(id)a7 partNumber:(int64_t)a8 totalParts:(int64_t)a9 payload:(id)a10 error:(id *)a11;
- (NSData)payload;
- (NSNumber)myShortHandle;
- (NSNumber)otherShortHandle;
- (NSNumber)timestamp;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)partNumber;
- (int64_t)pendingCount;
- (int64_t)pendingTotalCount;
- (int64_t)totalParts;
- (void)encodeWithCoder:(id)a3;
- (void)setMyShortHandle:(id)a3;
- (void)setOtherShortHandle:(id)a3;
- (void)setPartNumber:(int64_t)a3;
- (void)setPayload:(id)a3;
- (void)setPendingCount:(int64_t)a3;
- (void)setPendingTotalCount:(int64_t)a3;
- (void)setTimestamp:(id)a3;
- (void)setTotalParts:(int64_t)a3;
@end

@implementation CTStewieIMessageLiteMessageIncoming

- (CTStewieIMessageLiteMessageIncoming)initWithTimestamp:(id)a3 pendingTotalCount:(int64_t)a4 pendingCount:(int64_t)a5 myShortHandle:(id)a6 otherShortHandle:(id)a7 partNumber:(int64_t)a8 totalParts:(int64_t)a9 payload:(id)a10 error:(id *)a11
{
  v48[1] = *MEMORY[0x1E4F143B8];
  id v34 = a3;
  v17 = (_anonymous_namespace_ *)a6;
  v37 = (_anonymous_namespace_ *)a7;
  id v36 = a10;
  {
    if (a11)
    {
      v23 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v47 = *MEMORY[0x1E4F28568];
      v48[0] = @"Invalid myShortHandle";
      v24 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v48, &v47, 1, v34);
      [v23 errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v24];
      v21 = self;
      *a11 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_18;
    }
LABEL_19:
    v22 = 0;
    v21 = self;
    goto LABEL_20;
  }
  {
    if (a11)
    {
      v25 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v45 = *MEMORY[0x1E4F28568];
      v46 = @"Invalid otherShortHandle";
      v26 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1, v34);
      [v25 errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v26];
      v21 = self;
      *a11 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_18;
    }
    goto LABEL_19;
  }
  if ((unint64_t)(a8 - 1) >= 4)
  {
    if (a11)
    {
      v27 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v43 = *MEMORY[0x1E4F28568];
      v44 = @"Invalid partNumber";
      v28 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1, v34);
      [v27 errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v28];
      v21 = self;
      *a11 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_18;
    }
    goto LABEL_19;
  }
  if ((unint64_t)(a9 - 1) >= 4)
  {
    if (a11)
    {
      v29 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v41 = *MEMORY[0x1E4F28568];
      v42 = @"Invalid totalParts";
      v30 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1, v34);
      [v29 errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v30];
      v21 = self;
      *a11 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_18;
    }
    goto LABEL_19;
  }
  if (!v36)
  {
    if (a11)
    {
      v31 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v39 = *MEMORY[0x1E4F28568];
      v40 = @"Payload is missing";
      v32 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1, v34);
      [v31 errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v32];
      v21 = self;
      *a11 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_18;
    }
    goto LABEL_19;
  }
  v38.receiver = self;
  v38.super_class = (Class)CTStewieIMessageLiteMessageIncoming;
  v20 = [(CTStewieIMessageLiteMessageIncoming *)&v38 init];
  v21 = v20;
  if (!v20)
  {
LABEL_18:
    v22 = 0;
    goto LABEL_20;
  }
  objc_storeStrong((id *)&v20->_timestamp, a3);
  v21->_pendingTotalCount = a4;
  v21->_pendingCount = a5;
  objc_storeStrong((id *)&v21->_myShortHandle, a6);
  objc_storeStrong((id *)&v21->_otherShortHandle, a7);
  v21->_partNumber = a8;
  v21->_totalParts = a9;
  objc_storeStrong((id *)&v21->_payload, a10);
  v21 = v21;
  v22 = v21;
LABEL_20:

  return v22;
}

- (NSString)description
{
  v2 = self;
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  [v3 appendFormat:@", pendingTotalCount=%ld", objc_msgSend(v2, "pendingTotalCount")];
  [v3 appendFormat:@", pendingCount=%ld", objc_msgSend(v2, "pendingCount")];
  v4 = [v2 myShortHandle];
  [v3 appendFormat:@", myShortHandle=%@", v4];

  v5 = [v2 otherShortHandle];
  [v3 appendFormat:@", otherShortHandle=%@", v5];

  [v3 appendFormat:@", partNumber=%ld", objc_msgSend(v2, "partNumber")];
  [v3 appendFormat:@", totalParts=%ld", objc_msgSend(v2, "totalParts")];
  v6 = [v2 payload];
  if (v6)
  {
    v2 = [v2 payload];
    uint64_t v7 = [v2 length];
  }
  else
  {
    uint64_t v7 = 0;
  }
  [v3 appendFormat:@", payload size=%lu", v7];
  if (v6) {

  }
  [v3 appendString:@">"];

  return (NSString *)v3;
}

- (BOOL)isEqualToOther:(id)a3
{
  id v6 = a3;
  uint64_t v7 = [(CTStewieIMessageLiteMessageIncoming *)self timestamp];
  v8 = [v6 timestamp];
  if (v7 != v8)
  {
    v3 = [(CTStewieIMessageLiteMessageIncoming *)self timestamp];
    v4 = [v6 timestamp];
    if (![v3 isEqual:v4])
    {
      char v9 = 0;
LABEL_24:

      goto LABEL_25;
    }
  }
  int64_t v10 = [(CTStewieIMessageLiteMessageIncoming *)self pendingTotalCount];
  if (v10 != [v6 pendingTotalCount]
    || (int64_t v11 = [(CTStewieIMessageLiteMessageIncoming *)self pendingCount],
        v11 != [v6 pendingCount]))
  {
    char v9 = 0;
    goto LABEL_23;
  }
  uint64_t v27 = [(CTStewieIMessageLiteMessageIncoming *)self myShortHandle];
  v12 = [v6 myShortHandle];
  if ((void *)v27 != v12)
  {
    v26 = [(CTStewieIMessageLiteMessageIncoming *)self myShortHandle];
    v24 = [v6 myShortHandle];
    if (!objc_msgSend(v26, "isEqual:"))
    {
      char v9 = 0;
      v13 = (void *)v27;
LABEL_21:

      goto LABEL_22;
    }
  }
  v14 = [(CTStewieIMessageLiteMessageIncoming *)self otherShortHandle];
  v15 = [v6 otherShortHandle];
  if (v14 != v15)
  {
    v25 = [(CTStewieIMessageLiteMessageIncoming *)self otherShortHandle];
    v23 = [v6 otherShortHandle];
    if (!objc_msgSend(v25, "isEqual:"))
    {
      char v9 = 0;
LABEL_19:

      goto LABEL_20;
    }
  }
  int64_t v16 = [(CTStewieIMessageLiteMessageIncoming *)self partNumber];
  if (v16 == [v6 partNumber]
    && (int64_t v17 = [(CTStewieIMessageLiteMessageIncoming *)self totalParts],
        v17 == [v6 totalParts]))
  {
    v22 = [(CTStewieIMessageLiteMessageIncoming *)self payload];
    v21 = [v6 payload];
    if (v22 == v21)
    {

      char v9 = 1;
    }
    else
    {
      v20 = [(CTStewieIMessageLiteMessageIncoming *)self payload];
      v19 = [v6 payload];
      char v9 = [v20 isEqual:v19];
    }
  }
  else
  {
    char v9 = 0;
  }
  if (v14 != v15) {
    goto LABEL_19;
  }
LABEL_20:

  v13 = (void *)v27;
  if ((void *)v27 != v12) {
    goto LABEL_21;
  }
LABEL_22:

LABEL_23:
  if (v7 != v8) {
    goto LABEL_24;
  }
LABEL_25:

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CTStewieIMessageLiteMessageIncoming *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(CTStewieIMessageLiteMessageIncoming *)self isEqualToOther:v4];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(CTStewieIMessageLiteMessageIncoming *)self timestamp];
  uint64_t v7 = (void *)[v6 copyWithZone:a3];
  [v5 setTimestamp:v7];

  objc_msgSend(v5, "setPendingTotalCount:", -[CTStewieIMessageLiteMessageIncoming pendingTotalCount](self, "pendingTotalCount"));
  objc_msgSend(v5, "setPendingCount:", -[CTStewieIMessageLiteMessageIncoming pendingCount](self, "pendingCount"));
  v8 = [(CTStewieIMessageLiteMessageIncoming *)self myShortHandle];
  char v9 = (void *)[v8 copyWithZone:a3];
  [v5 setMyShortHandle:v9];

  int64_t v10 = [(CTStewieIMessageLiteMessageIncoming *)self otherShortHandle];
  int64_t v11 = (void *)[v10 copyWithZone:a3];
  [v5 setOtherShortHandle:v11];

  objc_msgSend(v5, "setPartNumber:", -[CTStewieIMessageLiteMessageIncoming partNumber](self, "partNumber"));
  objc_msgSend(v5, "setTotalParts:", -[CTStewieIMessageLiteMessageIncoming totalParts](self, "totalParts"));
  v12 = [(CTStewieIMessageLiteMessageIncoming *)self payload];
  v13 = (void *)[v12 copyWithZone:a3];
  [v5 setPayload:v13];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  v4 = [(CTStewieIMessageLiteMessageIncoming *)self timestamp];
  [v8 encodeObject:v4 forKey:@"timestamp"];

  objc_msgSend(v8, "encodeInteger:forKey:", -[CTStewieIMessageLiteMessageIncoming pendingTotalCount](self, "pendingTotalCount"), @"pendingTotalCount");
  objc_msgSend(v8, "encodeInteger:forKey:", -[CTStewieIMessageLiteMessageIncoming pendingCount](self, "pendingCount"), @"pendingCount");
  BOOL v5 = [(CTStewieIMessageLiteMessageIncoming *)self myShortHandle];
  [v8 encodeObject:v5 forKey:@"myShortHandle"];

  id v6 = [(CTStewieIMessageLiteMessageIncoming *)self otherShortHandle];
  [v8 encodeObject:v6 forKey:@"otherShortHandle"];

  objc_msgSend(v8, "encodeInteger:forKey:", -[CTStewieIMessageLiteMessageIncoming partNumber](self, "partNumber"), @"partNumber");
  objc_msgSend(v8, "encodeInteger:forKey:", -[CTStewieIMessageLiteMessageIncoming totalParts](self, "totalParts"), @"totalParts");
  uint64_t v7 = [(CTStewieIMessageLiteMessageIncoming *)self payload];
  [v8 encodeObject:v7 forKey:@"payload"];
}

- (CTStewieIMessageLiteMessageIncoming)initWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timestamp"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"pendingTotalCount"];
  uint64_t v7 = [v4 decodeIntegerForKey:@"pendingCount"];
  id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"myShortHandle"];
  char v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"otherShortHandle"];
  uint64_t v10 = [v4 decodeIntegerForKey:@"partNumber"];
  uint64_t v11 = [v4 decodeIntegerForKey:@"totalParts"];
  v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"payload"];
  v13 = [(CTStewieIMessageLiteMessageIncoming *)self initWithTimestamp:v5 pendingTotalCount:v6 pendingCount:v7 myShortHandle:v8 otherShortHandle:v9 partNumber:v10 totalParts:v11 payload:v12 error:0];

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (int64_t)pendingTotalCount
{
  return self->_pendingTotalCount;
}

- (void)setPendingTotalCount:(int64_t)a3
{
  self->_pendingTotalCount = a3;
}

- (int64_t)pendingCount
{
  return self->_pendingCount;
}

- (void)setPendingCount:(int64_t)a3
{
  self->_pendingCount = a3;
}

- (NSNumber)myShortHandle
{
  return self->_myShortHandle;
}

- (void)setMyShortHandle:(id)a3
{
}

- (NSNumber)otherShortHandle
{
  return self->_otherShortHandle;
}

- (void)setOtherShortHandle:(id)a3
{
}

- (int64_t)partNumber
{
  return self->_partNumber;
}

- (void)setPartNumber:(int64_t)a3
{
  self->_partNumber = a3;
}

- (int64_t)totalParts
{
  return self->_totalParts;
}

- (void)setTotalParts:(int64_t)a3
{
  self->_totalParts = a3;
}

- (NSData)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_otherShortHandle, 0);
  objc_storeStrong((id *)&self->_myShortHandle, 0);

  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end