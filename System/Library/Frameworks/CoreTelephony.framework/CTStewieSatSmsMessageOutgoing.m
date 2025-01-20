@interface CTStewieSatSmsMessageOutgoing
+ (BOOL)supportsSecureCoding;
+ (double)estimatedSendTimeForTextPayload:(id)a3;
+ (int64_t)maxLengthInBytesForText;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToOther:(id)a3;
- (BOOL)notifyDowngrade;
- (CTStewieSatSmsMessageOutgoing)initWithCoder:(id)a3;
- (CTStewieSatSmsMessageOutgoing)initWithContext:(id)a3 destinationPhoneNumber:(id)a4 codecID:(int64_t)a5 textPayload:(id)a6 error:(id *)a7;
- (CTStewieSatSmsMessageOutgoing)initWithContext:(id)a3 destinationPhoneNumber:(id)a4 codecID:(int64_t)a5 textPayload:(id)a6 notifyDowngrade:(BOOL)a7 error:(id *)p_isa;
- (CTXPCServiceSubscriptionContext)context;
- (NSData)textPayload;
- (NSString)description;
- (NSString)destinationPhoneNumber;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)codecID;
- (void)encodeWithCoder:(id)a3;
- (void)setCodecID:(int64_t)a3;
- (void)setContext:(id)a3;
- (void)setDestinationPhoneNumber:(id)a3;
- (void)setNotifyDowngrade:(BOOL)a3;
- (void)setTextPayload:(id)a3;
@end

@implementation CTStewieSatSmsMessageOutgoing

- (CTStewieSatSmsMessageOutgoing)initWithContext:(id)a3 destinationPhoneNumber:(id)a4 codecID:(int64_t)a5 textPayload:(id)a6 notifyDowngrade:(BOOL)a7 error:(id *)p_isa
{
  v44[1] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  v16 = (_anonymous_namespace_ *)a4;
  id v17 = a6;
  if (v15)
  {
    if (v16 && [(_anonymous_namespace_ *)v16 length])
    {
      {
        if ((unint64_t)a5 < 0x10)
        {
          if (v17 && [v17 length])
          {
            if ((unint64_t)[v17 length] < 0x8F)
            {
              v32.receiver = self;
              v32.super_class = (Class)CTStewieSatSmsMessageOutgoing;
              v31 = [(CTStewieSatSmsMessageOutgoing *)&v32 init];
              p_isa = (id *)&v31->super.isa;
              if (v31)
              {
                objc_storeStrong((id *)&v31->_context, a3);
                objc_storeStrong(p_isa + 3, a4);
                p_isa[4] = (id)a5;
                objc_storeStrong(p_isa + 5, a6);
                *((unsigned char *)p_isa + 8) = a7;
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
              v26 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v33 = *MEMORY[0x1E4F28568];
              v34 = @"textPayload is too big";
              v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
              *p_isa = [v26 errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v27];

              goto LABEL_21;
            }
          }
          else if (p_isa)
          {
            v28 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v35 = *MEMORY[0x1E4F28568];
            v36 = @"textPayload is missing";
            v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
            *p_isa = [v28 errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v29];

            goto LABEL_21;
          }
        }
        else if (p_isa)
        {
          v18 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v37 = *MEMORY[0x1E4F28568];
          v38 = @"Invalid codecID";
          v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
          *p_isa = [v18 errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v19];

LABEL_21:
          p_isa = 0;
        }
      }
      else if (p_isa)
      {
        v24 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v39 = *MEMORY[0x1E4F28568];
        v40 = @"destinationPhoneNumber is invalid";
        v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v40 forKeys:&v39 count:1];
        *p_isa = [v24 errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v25];

        goto LABEL_21;
      }
    }
    else if (p_isa)
    {
      v20 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v41 = *MEMORY[0x1E4F28568];
      v42 = @"destinationPhoneNumber is missing";
      v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
      *p_isa = [v20 errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v21];

      goto LABEL_21;
    }
  }
  else if (p_isa)
  {
    v22 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v43 = *MEMORY[0x1E4F28568];
    v44[0] = @"Context is missing";
    v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:&v43 count:1];
    *p_isa = [v22 errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v23];

    goto LABEL_21;
  }

  return (CTStewieSatSmsMessageOutgoing *)p_isa;
}

- (CTStewieSatSmsMessageOutgoing)initWithContext:(id)a3 destinationPhoneNumber:(id)a4 codecID:(int64_t)a5 textPayload:(id)a6 error:(id *)a7
{
  return [(CTStewieSatSmsMessageOutgoing *)self initWithContext:a3 destinationPhoneNumber:a4 codecID:a5 textPayload:a6 notifyDowngrade:0 error:a7];
}

+ (int64_t)maxLengthInBytesForText
{
  return 142;
}

+ (double)estimatedSendTimeForTextPayload:(id)a3
{
  id v3 = a3;
  v4 = v3;
  double EstimatedSendTimeOverStewieInSeconds = 0.0;
  if (v3)
  {
    uint64_t v6 = [v3 lengthOfBytesUsingEncoding:4];
    if (v6) {
      double EstimatedSendTimeOverStewieInSeconds = getEstimatedSendTimeOverStewieInSeconds(v6 + 22);
    }
  }

  return EstimatedSendTimeOverStewieInSeconds;
}

- (NSString)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTStewieSatSmsMessageOutgoing *)self context];
  [v3 appendFormat:@", context=%@", v4];

  v5 = [(CTStewieSatSmsMessageOutgoing *)self destinationPhoneNumber];
  [v3 appendFormat:@", destinationPhoneNumber=%@", v5];

  [v3 appendFormat:@", codecID=%ld", -[CTStewieSatSmsMessageOutgoing codecID](self, "codecID")];
  uint64_t v6 = [(CTStewieSatSmsMessageOutgoing *)self textPayload];
  [v3 appendFormat:@", textPayload size=%lu", objc_msgSend(v6, "length")];

  BOOL v7 = [(CTStewieSatSmsMessageOutgoing *)self notifyDowngrade];
  v8 = "no";
  if (v7) {
    v8 = "yes";
  }
  [v3 appendFormat:@", notifyDowngrade=%s", v8];
  [v3 appendString:@">"];

  return (NSString *)v3;
}

- (BOOL)isEqualToOther:(id)a3
{
  id v6 = a3;
  BOOL v7 = [(CTStewieSatSmsMessageOutgoing *)self context];
  v8 = [v6 context];
  if (v7 != v8)
  {
    v20 = [(CTStewieSatSmsMessageOutgoing *)self context];
    v18 = [v6 context];
    if (!objc_msgSend(v20, "isEqual:"))
    {
      LOBYTE(v9) = 0;
LABEL_19:

      goto LABEL_20;
    }
  }
  v10 = [(CTStewieSatSmsMessageOutgoing *)self destinationPhoneNumber];
  v11 = [v6 destinationPhoneNumber];
  if (v10 == v11
    || ([(CTStewieSatSmsMessageOutgoing *)self destinationPhoneNumber],
        v19 = objc_claimAutoreleasedReturnValue(),
        [v6 destinationPhoneNumber],
        v4 = objc_claimAutoreleasedReturnValue(),
        [v19 isEqual:v4]))
  {
    int64_t v12 = [(CTStewieSatSmsMessageOutgoing *)self codecID];
    if (v12 != [v6 codecID])
    {
      LOBYTE(v9) = 0;
      goto LABEL_16;
    }
    v13 = [(CTStewieSatSmsMessageOutgoing *)self textPayload];
    v14 = [v6 textPayload];
    if (v13 == v14
      || ([(CTStewieSatSmsMessageOutgoing *)self textPayload],
          id v17 = objc_claimAutoreleasedReturnValue(),
          [v6 textPayload],
          id v3 = objc_claimAutoreleasedReturnValue(),
          [v17 isEqual:v3]))
    {
      BOOL v15 = [(CTStewieSatSmsMessageOutgoing *)self notifyDowngrade];
      int v9 = v15 ^ [v6 notifyDowngrade] ^ 1;
      if (v13 == v14)
      {

        goto LABEL_15;
      }
    }
    else
    {
      LOBYTE(v9) = 0;
    }

LABEL_15:
LABEL_16:
    if (v10 == v11) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  LOBYTE(v9) = 0;
LABEL_17:

LABEL_18:
  if (v7 != v8) {
    goto LABEL_19;
  }
LABEL_20:

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CTStewieSatSmsMessageOutgoing *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(CTStewieSatSmsMessageOutgoing *)self isEqualToOther:v4];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(CTStewieSatSmsMessageOutgoing *)self context];
  BOOL v7 = (void *)[v6 copyWithZone:a3];
  [v5 setContext:v7];

  v8 = [(CTStewieSatSmsMessageOutgoing *)self destinationPhoneNumber];
  int v9 = (void *)[v8 copyWithZone:a3];
  [v5 setDestinationPhoneNumber:v9];

  objc_msgSend(v5, "setCodecID:", -[CTStewieSatSmsMessageOutgoing codecID](self, "codecID"));
  v10 = [(CTStewieSatSmsMessageOutgoing *)self textPayload];
  v11 = (void *)[v10 copyWithZone:a3];
  [v5 setTextPayload:v11];

  objc_msgSend(v5, "setNotifyDowngrade:", -[CTStewieSatSmsMessageOutgoing notifyDowngrade](self, "notifyDowngrade"));
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  v4 = [(CTStewieSatSmsMessageOutgoing *)self context];
  [v7 encodeObject:v4 forKey:@"context"];

  BOOL v5 = [(CTStewieSatSmsMessageOutgoing *)self destinationPhoneNumber];
  [v7 encodeObject:v5 forKey:@"phoneNumber"];

  objc_msgSend(v7, "encodeInteger:forKey:", -[CTStewieSatSmsMessageOutgoing codecID](self, "codecID"), @"codecID");
  id v6 = [(CTStewieSatSmsMessageOutgoing *)self textPayload];
  [v7 encodeObject:v6 forKey:@"textPayload"];

  objc_msgSend(v7, "encodeBool:forKey:", -[CTStewieSatSmsMessageOutgoing notifyDowngrade](self, "notifyDowngrade"), @"notifyDowngrade");
}

- (CTStewieSatSmsMessageOutgoing)initWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"context"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"phoneNumber"];
  uint64_t v7 = [v4 decodeIntegerForKey:@"codecID"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"textPayload"];
  int v9 = -[CTStewieSatSmsMessageOutgoing initWithContext:destinationPhoneNumber:codecID:textPayload:notifyDowngrade:error:](self, "initWithContext:destinationPhoneNumber:codecID:textPayload:notifyDowngrade:error:", v5, v6, v7, v8, [v4 decodeBoolForKey:@"notifyDowngrade"], 0);

  return v9;
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

- (NSString)destinationPhoneNumber
{
  return self->_destinationPhoneNumber;
}

- (void)setDestinationPhoneNumber:(id)a3
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

- (BOOL)notifyDowngrade
{
  return self->_notifyDowngrade;
}

- (void)setNotifyDowngrade:(BOOL)a3
{
  self->_notifyDowngrade = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textPayload, 0);
  objc_storeStrong((id *)&self->_destinationPhoneNumber, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

@end