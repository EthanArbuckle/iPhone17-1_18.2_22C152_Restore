@interface CTStewieIMessageLiteMessageOutgoing
+ (BOOL)supportsSecureCoding;
+ (double)estimatedSendTimeForPayload:(id)a3;
+ (int64_t)maxLengthInBytesForPayload;
+ (int64_t)maxNumberOfParts;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToOther:(id)a3;
- (CTStewieIMessageLiteMessageOutgoing)initWithCoder:(id)a3;
- (CTStewieIMessageLiteMessageOutgoing)initWithMyShortHandle:(id)a3 otherShortHandle:(id)a4 partNumber:(int64_t)a5 totalParts:(int64_t)a6 payload:(id)a7 error:(id *)p_isa;
- (NSData)payload;
- (NSNumber)myShortHandle;
- (NSNumber)otherShortHandle;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)partNumber;
- (int64_t)totalParts;
- (void)encodeWithCoder:(id)a3;
- (void)setMyShortHandle:(id)a3;
- (void)setOtherShortHandle:(id)a3;
- (void)setPartNumber:(int64_t)a3;
- (void)setPayload:(id)a3;
- (void)setTotalParts:(int64_t)a3;
@end

@implementation CTStewieIMessageLiteMessageOutgoing

+ (int64_t)maxLengthInBytesForPayload
{
  return 147;
}

- (CTStewieIMessageLiteMessageOutgoing)initWithMyShortHandle:(id)a3 otherShortHandle:(id)a4 partNumber:(int64_t)a5 totalParts:(int64_t)a6 payload:(id)a7 error:(id *)p_isa
{
  v46[1] = *MEMORY[0x1E4F143B8];
  v15 = (_anonymous_namespace_ *)a3;
  v16 = (_anonymous_namespace_ *)a4;
  id v17 = a7;
  {
    {
      if ((unint64_t)(a5 - 1) >= 4)
      {
        if (p_isa)
        {
          v26 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v41 = *MEMORY[0x1E4F28568];
          v42 = @"Invalid partNumber";
          v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
          *p_isa = [v26 errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v27];

          goto LABEL_19;
        }
      }
      else if ((unint64_t)(a6 - 1) >= 4)
      {
        if (p_isa)
        {
          v28 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v39 = *MEMORY[0x1E4F28568];
          v40 = @"Invalid totalParts";
          v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v40 forKeys:&v39 count:1];
          *p_isa = [v28 errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v29];

          goto LABEL_19;
        }
      }
      else if (v17)
      {
        if ((unint64_t)[v17 length] < 0x94)
        {
          v34.receiver = self;
          v34.super_class = (Class)CTStewieIMessageLiteMessageOutgoing;
          v33 = [(CTStewieIMessageLiteMessageOutgoing *)&v34 init];
          p_isa = (id *)&v33->super.isa;
          if (v33)
          {
            objc_storeStrong((id *)&v33->_myShortHandle, a3);
            objc_storeStrong(p_isa + 2, a4);
            p_isa[3] = (id)a5;
            p_isa[4] = (id)a6;
            objc_storeStrong(p_isa + 5, a7);
            self = p_isa;
            p_isa = (id *)&self->super.isa;
          }
          else
          {
            self = 0;
          }
        }
        else if (p_isa)
        {
          v20 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v35 = *MEMORY[0x1E4F28568];
          v36 = @"Payload is too big";
          v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
          *p_isa = [v20 errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v21];

LABEL_19:
          p_isa = 0;
        }
      }
      else if (p_isa)
      {
        v30 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v37 = *MEMORY[0x1E4F28568];
        v38 = @"Payload is missing";
        v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
        *p_isa = [v30 errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v31];

        goto LABEL_19;
      }
    }
    else if (p_isa)
    {
      v24 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v43 = *MEMORY[0x1E4F28568];
      v44 = @"Invalid otherShortHandle";
      v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
      *p_isa = [v24 errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v25];

      goto LABEL_19;
    }
  }
  else if (p_isa)
  {
    v22 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v45 = *MEMORY[0x1E4F28568];
    v46[0] = @"Invalid myShortHandle";
    v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:&v45 count:1];
    *p_isa = [v22 errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v23];

    goto LABEL_19;
  }

  return (CTStewieIMessageLiteMessageOutgoing *)p_isa;
}

+ (int64_t)maxNumberOfParts
{
  return 4;
}

+ (double)estimatedSendTimeForPayload:(id)a3
{
  id v3 = a3;
  v4 = v3;
  double EstimatedSendTimeOverStewieInSeconds = 0.0;
  if (v3 && [v3 length]) {
    double EstimatedSendTimeOverStewieInSeconds = getEstimatedSendTimeOverStewieInSeconds([v4 length] + 17);
  }

  return EstimatedSendTimeOverStewieInSeconds;
}

- (NSString)description
{
  v2 = self;
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
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
  uint64_t v7 = [(CTStewieIMessageLiteMessageOutgoing *)self myShortHandle];
  v8 = [v6 myShortHandle];
  if (v7 != v8)
  {
    v20 = [(CTStewieIMessageLiteMessageOutgoing *)self myShortHandle];
    v19 = [v6 myShortHandle];
    if (!objc_msgSend(v20, "isEqual:"))
    {
      char v9 = 0;
LABEL_15:

      goto LABEL_16;
    }
  }
  v10 = [(CTStewieIMessageLiteMessageOutgoing *)self otherShortHandle];
  v11 = [v6 otherShortHandle];
  if (v10 != v11)
  {
    id v3 = [(CTStewieIMessageLiteMessageOutgoing *)self otherShortHandle];
    v4 = [v6 otherShortHandle];
    if (![v3 isEqual:v4])
    {
      char v9 = 0;
LABEL_13:

      goto LABEL_14;
    }
  }
  int64_t v12 = [(CTStewieIMessageLiteMessageOutgoing *)self partNumber];
  if (v12 == [v6 partNumber]
    && (int64_t v13 = [(CTStewieIMessageLiteMessageOutgoing *)self totalParts],
        v13 == [v6 totalParts]))
  {
    v18 = [(CTStewieIMessageLiteMessageOutgoing *)self payload];
    id v17 = [v6 payload];
    if (v18 == v17)
    {

      char v9 = 1;
    }
    else
    {
      v16 = [(CTStewieIMessageLiteMessageOutgoing *)self payload];
      v14 = [v6 payload];
      char v9 = [v16 isEqual:v14];
    }
  }
  else
  {
    char v9 = 0;
  }
  if (v10 != v11) {
    goto LABEL_13;
  }
LABEL_14:

  if (v7 != v8) {
    goto LABEL_15;
  }
LABEL_16:

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CTStewieIMessageLiteMessageOutgoing *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(CTStewieIMessageLiteMessageOutgoing *)self isEqualToOther:v4];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(CTStewieIMessageLiteMessageOutgoing *)self myShortHandle];
  uint64_t v7 = (void *)[v6 copyWithZone:a3];
  [v5 setMyShortHandle:v7];

  v8 = [(CTStewieIMessageLiteMessageOutgoing *)self otherShortHandle];
  char v9 = (void *)[v8 copyWithZone:a3];
  [v5 setOtherShortHandle:v9];

  objc_msgSend(v5, "setPartNumber:", -[CTStewieIMessageLiteMessageOutgoing partNumber](self, "partNumber"));
  objc_msgSend(v5, "setTotalParts:", -[CTStewieIMessageLiteMessageOutgoing totalParts](self, "totalParts"));
  v10 = [(CTStewieIMessageLiteMessageOutgoing *)self payload];
  v11 = (void *)[v10 copyWithZone:a3];
  [v5 setPayload:v11];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  v4 = [(CTStewieIMessageLiteMessageOutgoing *)self myShortHandle];
  [v7 encodeObject:v4 forKey:@"myShortHandle"];

  BOOL v5 = [(CTStewieIMessageLiteMessageOutgoing *)self otherShortHandle];
  [v7 encodeObject:v5 forKey:@"otherShortHandle"];

  objc_msgSend(v7, "encodeInteger:forKey:", -[CTStewieIMessageLiteMessageOutgoing partNumber](self, "partNumber"), @"partNumber");
  objc_msgSend(v7, "encodeInteger:forKey:", -[CTStewieIMessageLiteMessageOutgoing totalParts](self, "totalParts"), @"totalParts");
  id v6 = [(CTStewieIMessageLiteMessageOutgoing *)self payload];
  [v7 encodeObject:v6 forKey:@"payload"];
}

- (CTStewieIMessageLiteMessageOutgoing)initWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"myShortHandle"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"otherShortHandle"];
  uint64_t v7 = [v4 decodeIntegerForKey:@"partNumber"];
  uint64_t v8 = [v4 decodeIntegerForKey:@"totalParts"];
  char v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"payload"];
  v10 = [(CTStewieIMessageLiteMessageOutgoing *)self initWithMyShortHandle:v5 otherShortHandle:v6 partNumber:v7 totalParts:v8 payload:v9 error:0];

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
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
}

@end