@interface CTStewieSatSmsMessageIncoming
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToOther:(id)a3;
- (CTStewieSatSmsMessageIncoming)initWithCoder:(id)a3;
- (CTStewieSatSmsMessageIncoming)initWithContext:(id)a3 timestamp:(id)a4 pendingTotalCount:(int64_t)a5 pendingCount:(int64_t)a6 sourcePhoneNumber:(id)a7 codecID:(int64_t)a8 textPayload:(id)a9 uniqueID:(id)a10 error:(id *)a11;
- (CTXPCServiceSubscriptionContext)context;
- (NSData)textPayload;
- (NSNumber)timestamp;
- (NSString)description;
- (NSString)sourcePhoneNumber;
- (NSString)uniqueID;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)codecID;
- (int64_t)pendingCount;
- (int64_t)pendingTotalCount;
- (void)encodeWithCoder:(id)a3;
- (void)setCodecID:(int64_t)a3;
- (void)setContext:(id)a3;
- (void)setPendingCount:(int64_t)a3;
- (void)setPendingTotalCount:(int64_t)a3;
- (void)setSourcePhoneNumber:(id)a3;
- (void)setTextPayload:(id)a3;
- (void)setTimestamp:(id)a3;
- (void)setUniqueID:(id)a3;
@end

@implementation CTStewieSatSmsMessageIncoming

- (CTStewieSatSmsMessageIncoming)initWithContext:(id)a3 timestamp:(id)a4 pendingTotalCount:(int64_t)a5 pendingCount:(int64_t)a6 sourcePhoneNumber:(id)a7 codecID:(int64_t)a8 textPayload:(id)a9 uniqueID:(id)a10 error:(id *)a11
{
  v67[1] = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v45 = a7;
  id v48 = a9;
  id v47 = a10;
  v43 = v16;
  v44 = v17;
  if (v16)
  {
    if (v17)
    {
      v18 = self;
      if (a6 < 0)
      {
        v19 = v45;
        if (a11)
        {
          v26 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v62 = *MEMORY[0x1E4F28568];
          v63 = @"Invalid pendingCount";
          v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v63 forKeys:&v62 count:1];
          *a11 = [v26 errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v27];
        }
        goto LABEL_36;
      }
      v19 = v45;
      if (a5 < 0)
      {
        if (a11)
        {
          v31 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v60 = *MEMORY[0x1E4F28568];
          v61 = @"Invalid pendingTotalCount";
          v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v61 forKeys:&v60 count:1];
          *a11 = [v31 errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v32];
        }
        goto LABEL_36;
      }
      if (!v45 || ![v45 length])
      {
        if (a11)
        {
          v29 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v58 = *MEMORY[0x1E4F28568];
          v59 = @"sourcePhoneNumber is missing";
          v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1];
          *a11 = [v29 errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v30];
        }
        goto LABEL_36;
      }
      {
        if (a11)
        {
          v33 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v56 = *MEMORY[0x1E4F28568];
          v57 = @"sourcePhoneNumber is invalid";
          v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v57 forKeys:&v56 count:1];
          *a11 = [v33 errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v34];
        }
        goto LABEL_36;
      }
      if ((unint64_t)a8 >= 0x10)
      {
        if (a11)
        {
          v20 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v54 = *MEMORY[0x1E4F28568];
          v55 = @"Invalid codecID";
          v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v55 forKeys:&v54 count:1];
          *a11 = [v20 errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v21];
        }
        goto LABEL_36;
      }
      if (!v48 || ![v48 length])
      {
        if (a11)
        {
          v37 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v52 = *MEMORY[0x1E4F28568];
          v53 = @"textPayload is missing";
          v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
          *a11 = [v37 errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v38];
        }
        goto LABEL_36;
      }
      if (!v47 || ![v47 length])
      {
        if (a11)
        {
          v39 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v50 = *MEMORY[0x1E4F28568];
          v51 = @"uniqueID is missing";
          v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
          *a11 = [v39 errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v40];
        }
        goto LABEL_36;
      }
      v49.receiver = self;
      v49.super_class = (Class)CTStewieSatSmsMessageIncoming;
      v35 = [(CTStewieSatSmsMessageIncoming *)&v49 init];
      v36 = v35;
      if (v35)
      {
        objc_storeStrong((id *)&v35->_context, a3);
        objc_storeStrong((id *)&v36->_timestamp, a4);
        v36->_pendingTotalCount = a5;
        v36->_pendingCount = a6;
        objc_storeStrong((id *)&v36->_sourcePhoneNumber, a7);
        v36->_codecID = a8;
        objc_storeStrong((id *)&v36->_textPayload, a9);
        objc_storeStrong((id *)&v36->_uniqueID, a10);
        v18 = v36;
        v28 = v18;
        goto LABEL_37;
      }
      v18 = 0;
LABEL_36:
      v28 = 0;
      goto LABEL_37;
    }
    v18 = self;
    if (a11)
    {
      v24 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v64 = *MEMORY[0x1E4F28568];
      v65 = @"timestamp is missing";
      v19 = v45;
      v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v65 forKeys:&v64 count:1];
      *a11 = [v24 errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v25];

      goto LABEL_36;
    }
    v28 = 0;
    v19 = v45;
  }
  else
  {
    if (a11)
    {
      v22 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v66 = *MEMORY[0x1E4F28568];
      v67[0] = @"Context is missing";
      v19 = v45;
      v18 = self;
      v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v67 forKeys:&v66 count:1];
      *a11 = [v22 errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v23];

      goto LABEL_36;
    }
    v28 = 0;
    v19 = v45;
    v18 = self;
  }
LABEL_37:

  return v28;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTStewieSatSmsMessageIncoming *)self context];
  [v3 appendFormat:@", context=%@", v4];

  v5 = [(CTStewieSatSmsMessageIncoming *)self timestamp];
  [v3 appendFormat:@", timestamp=%@", v5];

  [v3 appendFormat:@", pendingTotalCount=%ld", -[CTStewieSatSmsMessageIncoming pendingTotalCount](self, "pendingTotalCount")];
  [v3 appendFormat:@", pendingCount=%ld", -[CTStewieSatSmsMessageIncoming pendingCount](self, "pendingCount")];
  v6 = [(CTStewieSatSmsMessageIncoming *)self sourcePhoneNumber];
  [v3 appendFormat:@", sourcePhoneNumber=%@", v6];

  [v3 appendFormat:@", codecID=%ld", -[CTStewieSatSmsMessageIncoming codecID](self, "codecID")];
  v7 = [(CTStewieSatSmsMessageIncoming *)self textPayload];
  [v3 appendFormat:@", textPayload size=%lu", objc_msgSend(v7, "length")];

  v8 = [(CTStewieSatSmsMessageIncoming *)self uniqueID];
  [v3 appendFormat:@", uniqueID=%@", v8];

  [v3 appendString:@">"];

  return (NSString *)v3;
}

- (BOOL)isEqualToOther:(id)a3
{
  id v7 = a3;
  v8 = [(CTStewieSatSmsMessageIncoming *)self context];
  v9 = [v7 context];
  if (v8 != v9)
  {
    v3 = [(CTStewieSatSmsMessageIncoming *)self context];
    v4 = [v7 context];
    if (![v3 isEqual:v4])
    {
      char v10 = 0;
LABEL_15:

      goto LABEL_16;
    }
  }
  v11 = [(CTStewieSatSmsMessageIncoming *)self timestamp];
  v12 = [v7 timestamp];
  if (v11 != v12)
  {
    v33 = [(CTStewieSatSmsMessageIncoming *)self timestamp];
    v5 = [v7 timestamp];
    if (![v33 isEqual:v5])
    {
      char v10 = 0;
LABEL_13:

      goto LABEL_14;
    }
  }
  int64_t v13 = [(CTStewieSatSmsMessageIncoming *)self pendingTotalCount];
  if (v13 != [v7 pendingTotalCount]
    || (int64_t v14 = [(CTStewieSatSmsMessageIncoming *)self pendingCount],
        v14 != [v7 pendingCount]))
  {
    char v10 = 0;
    if (v11 == v12) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  uint64_t v32 = [(CTStewieSatSmsMessageIncoming *)self sourcePhoneNumber];
  [v7 sourcePhoneNumber];
  uint64_t v31 = v30 = v5;
  if (v32 == v31
    || ([(CTStewieSatSmsMessageIncoming *)self sourcePhoneNumber],
        v29 = objc_claimAutoreleasedReturnValue(),
        [v7 sourcePhoneNumber],
        v28 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v29, "isEqual:")))
  {
    int64_t v18 = [(CTStewieSatSmsMessageIncoming *)self codecID];
    if (v18 != [v7 codecID])
    {
      char v10 = 0;
      goto LABEL_28;
    }
    v19 = [(CTStewieSatSmsMessageIncoming *)self textPayload];
    uint64_t v27 = [v7 textPayload];
    if (v19 == (void *)v27
      || ([(CTStewieSatSmsMessageIncoming *)self textPayload],
          v26 = objc_claimAutoreleasedReturnValue(),
          [v7 textPayload],
          v24 = objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v26, "isEqual:")))
    {
      v25 = [(CTStewieSatSmsMessageIncoming *)self uniqueID];
      v23 = [v7 uniqueID];
      if (v25 == v23)
      {

        char v10 = 1;
      }
      else
      {
        v22 = [(CTStewieSatSmsMessageIncoming *)self uniqueID];
        v21 = [v7 uniqueID];
        char v10 = [v22 isEqual:v21];
      }
      v20 = (void *)v27;
      if (v19 == (void *)v27) {
        goto LABEL_27;
      }
    }
    else
    {
      char v10 = 0;
      v20 = (void *)v27;
    }

LABEL_27:
LABEL_28:
    id v16 = (void *)v31;
    v15 = (void *)v32;
    if (v32 == v31) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  char v10 = 0;
  id v16 = (void *)v31;
  v15 = (void *)v32;
LABEL_29:

LABEL_30:
  v5 = v30;
  if (v11 != v12) {
    goto LABEL_13;
  }
LABEL_14:

  if (v8 != v9) {
    goto LABEL_15;
  }
LABEL_16:

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CTStewieSatSmsMessageIncoming *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(CTStewieSatSmsMessageIncoming *)self isEqualToOther:v4];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = [(CTStewieSatSmsMessageIncoming *)self context];
  id v7 = (void *)[v6 copyWithZone:a3];
  [v5 setContext:v7];

  v8 = [(CTStewieSatSmsMessageIncoming *)self timestamp];
  v9 = (void *)[v8 copyWithZone:a3];
  [v5 setTimestamp:v9];

  objc_msgSend(v5, "setPendingTotalCount:", -[CTStewieSatSmsMessageIncoming pendingTotalCount](self, "pendingTotalCount"));
  objc_msgSend(v5, "setPendingCount:", -[CTStewieSatSmsMessageIncoming pendingCount](self, "pendingCount"));
  char v10 = [(CTStewieSatSmsMessageIncoming *)self sourcePhoneNumber];
  v11 = (void *)[v10 copyWithZone:a3];
  [v5 setSourcePhoneNumber:v11];

  objc_msgSend(v5, "setCodecID:", -[CTStewieSatSmsMessageIncoming codecID](self, "codecID"));
  v12 = [(CTStewieSatSmsMessageIncoming *)self textPayload];
  int64_t v13 = (void *)[v12 copyWithZone:a3];
  [v5 setTextPayload:v13];

  int64_t v14 = [(CTStewieSatSmsMessageIncoming *)self uniqueID];
  v15 = (void *)[v14 copyWithZone:a3];
  [v5 setUniqueID:v15];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  v4 = [(CTStewieSatSmsMessageIncoming *)self context];
  [v9 encodeObject:v4 forKey:@"context"];

  BOOL v5 = [(CTStewieSatSmsMessageIncoming *)self timestamp];
  [v9 encodeObject:v5 forKey:@"timestamp"];

  objc_msgSend(v9, "encodeInteger:forKey:", -[CTStewieSatSmsMessageIncoming pendingTotalCount](self, "pendingTotalCount"), @"pendingTotalCount");
  objc_msgSend(v9, "encodeInteger:forKey:", -[CTStewieSatSmsMessageIncoming pendingCount](self, "pendingCount"), @"pendingCount");
  v6 = [(CTStewieSatSmsMessageIncoming *)self sourcePhoneNumber];
  [v9 encodeObject:v6 forKey:@"phoneNumber"];

  objc_msgSend(v9, "encodeInteger:forKey:", -[CTStewieSatSmsMessageIncoming codecID](self, "codecID"), @"codecID");
  id v7 = [(CTStewieSatSmsMessageIncoming *)self textPayload];
  [v9 encodeObject:v7 forKey:@"textPayload"];

  v8 = [(CTStewieSatSmsMessageIncoming *)self uniqueID];
  [v9 encodeObject:v8 forKey:@"uniqueID"];
}

- (CTStewieSatSmsMessageIncoming)initWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"context"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timestamp"];
  uint64_t v7 = [v4 decodeIntegerForKey:@"pendingTotalCount"];
  uint64_t v8 = [v4 decodeIntegerForKey:@"pendingCount"];
  id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"phoneNumber"];
  uint64_t v10 = [v4 decodeIntegerForKey:@"codecID"];
  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"textPayload"];
  v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uniqueID"];
  int64_t v13 = [(CTStewieSatSmsMessageIncoming *)self initWithContext:v5 timestamp:v6 pendingTotalCount:v7 pendingCount:v8 sourcePhoneNumber:v9 codecID:v10 textPayload:v11 uniqueID:v12 error:0];

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTXPCServiceSubscriptionContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
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

- (NSString)sourcePhoneNumber
{
  return self->_sourcePhoneNumber;
}

- (void)setSourcePhoneNumber:(id)a3
{
}

- (int64_t)codecID
{
  return self->_codecID;
}

- (void)setCodecID:(int64_t)a3
{
  self->_codecID = a3;
}

- (NSData)textPayload
{
  return self->_textPayload;
}

- (void)setTextPayload:(id)a3
{
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (void)setUniqueID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_textPayload, 0);
  objc_storeStrong((id *)&self->_sourcePhoneNumber, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

@end