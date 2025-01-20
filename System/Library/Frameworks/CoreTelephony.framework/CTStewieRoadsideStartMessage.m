@interface CTStewieRoadsideStartMessage
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRoadsideStartMessage:(id)a3;
- (BOOL)isPayPerUse;
- (CTStewieRoadsideStartMessage)initWithCoder:(id)a3;
- (CTStewieRoadsideStartMessage)initWithDictionary:(id)a3 error:(id *)a4;
- (NSData)serializedQuestionnaireAnswers;
- (NSString)description;
- (NSString)phoneNumber;
- (double)estimatedSendTime;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)conversationID;
- (int64_t)providerId;
- (void)encodeWithCoder:(id)a3;
- (void)setConversationID:(int64_t)a3;
- (void)setIsPayPerUse:(BOOL)a3;
- (void)setPhoneNumber:(id)a3;
- (void)setProviderId:(int64_t)a3;
- (void)setSerializedQuestionnaireAnswers:(id)a3;
@end

@implementation CTStewieRoadsideStartMessage

- (CTStewieRoadsideStartMessage)initWithDictionary:(id)a3 error:(id *)a4
{
  v47[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = v6;
  if (v6)
  {
    v8 = [v6 valueForKey:@"conversationID"];
    v9 = v8;
    if (v8)
    {
      unint64_t v10 = [v8 integerValue];
      if (v10 < 0x100)
      {
        v11 = [v7 valueForKey:@"providerId"];
        v12 = v11;
        if (v11)
        {
          unint64_t v13 = [v11 integerValue];
          if (v13 < 0x8000)
          {
            v14 = [v7 valueForKey:@"isPayPerUse"];
            if (!v14)
            {
              if (!a4)
              {
                v20 = 0;
                goto LABEL_35;
              }
              v27 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v36 = *MEMORY[0x1E4F28568];
              v37 = @"isPayPerUseNum is missing";
              v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
              [v27 errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v16];
              v20 = 0;
              *a4 = (id)objc_claimAutoreleasedReturnValue();
              goto LABEL_34;
            }
            v15 = [v7 valueForKey:@"phoneNumber"];
            v16 = v15;
            if (v15)
            {
              if ([(_anonymous_namespace_ *)v15 length])
              {
                {
                  if (a4)
                  {
                    v17 = (void *)MEMORY[0x1E4F28C58];
                    uint64_t v34 = *MEMORY[0x1E4F28568];
                    v35 = @"phoneNumber is invalid. Phone number can only contain digits and must be of length <= 15";
                    v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
                    *a4 = [v17 errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v18];
                  }
                  goto LABEL_33;
                }
              }
              else
              {

                v16 = 0;
              }
            }
            v33.receiver = self;
            v33.super_class = (Class)CTStewieRoadsideStartMessage;
            v28 = [(CTStewieRoadsideStartMessage *)&v33 init];
            v29 = v28;
            if (v28)
            {
              v28->_conversationID = v10;
              v28->_providerId = v13;
              v28->_isPayPerUse = [v14 BOOLValue];
              uint64_t v30 = [v7 valueForKey:@"serializedQuestionnaireAnswers"];
              serializedQuestionnaireAnswers = v29->_serializedQuestionnaireAnswers;
              v29->_serializedQuestionnaireAnswers = (NSData *)v30;

              objc_storeStrong((id *)&v29->_phoneNumber, v16);
              self = v29;
              v20 = self;
LABEL_34:

              goto LABEL_35;
            }
            self = 0;
LABEL_33:
            v20 = 0;
            goto LABEL_34;
          }
          if (a4)
          {
            v26 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v38 = *MEMORY[0x1E4F28568];
            v39 = @"providerId is invalid";
            v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
            id v25 = [v26 errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v14];
            goto LABEL_25;
          }
        }
        else if (a4)
        {
          v24 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v40 = *MEMORY[0x1E4F28568];
          v41 = @"providerIdNum is missing";
          v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
          id v25 = [v24 errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v14];
LABEL_25:
          v20 = 0;
          *a4 = v25;
LABEL_35:

          goto LABEL_36;
        }
        v20 = 0;
LABEL_36:

        goto LABEL_37;
      }
      if (a4)
      {
        v23 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v42 = *MEMORY[0x1E4F28568];
        v43 = @"conversationID is invalid";
        v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
        id v22 = [v23 errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v12];
        goto LABEL_18;
      }
    }
    else if (a4)
    {
      v21 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v44 = *MEMORY[0x1E4F28568];
      v45 = @"conversationID is missing";
      v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
      id v22 = [v21 errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v12];
LABEL_18:
      v20 = 0;
      *a4 = v22;
      goto LABEL_36;
    }
    v20 = 0;
LABEL_37:

    goto LABEL_38;
  }
  if (a4)
  {
    v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v46 = *MEMORY[0x1E4F28568];
    v47[0] = @"Empty dictionary";
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:&v46 count:1];
    [v19 errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v9];
    v20 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_37;
  }
  v20 = 0;
LABEL_38:

  return v20;
}

- (NSString)description
{
  v4 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  [v4 appendFormat:@", conversationID=%ld", -[CTStewieRoadsideStartMessage conversationID](self, "conversationID")];
  [v4 appendFormat:@", providerId=%ld", -[CTStewieRoadsideStartMessage providerId](self, "providerId")];
  BOOL v5 = [(CTStewieRoadsideStartMessage *)self isPayPerUse];
  id v6 = "no";
  if (v5) {
    id v6 = "yes";
  }
  [v4 appendFormat:@", isPayPerUse=%s", v6];
  v7 = [(CTStewieRoadsideStartMessage *)self serializedQuestionnaireAnswers];
  if (v7)
  {
    v2 = [(CTStewieRoadsideStartMessage *)self serializedQuestionnaireAnswers];
    uint64_t v8 = [v2 length];
  }
  else
  {
    uint64_t v8 = 0;
  }
  [v4 appendFormat:@", serializedQuestionnaireAnswers length=%lu", v8];
  if (v7) {

  }
  v9 = [(CTStewieRoadsideStartMessage *)self phoneNumber];
  if (v9)
  {
    v2 = [(CTStewieRoadsideStartMessage *)self phoneNumber];
    uint64_t v10 = [v2 length];
  }
  else
  {
    uint64_t v10 = 0;
  }
  [v4 appendFormat:@", phoneNumber length=%lu", v10];
  if (v9) {

  }
  [v4 appendString:@">"];

  return (NSString *)v4;
}

- (BOOL)isEqualToRoadsideStartMessage:(id)a3
{
  id v6 = a3;
  int64_t v7 = [(CTStewieRoadsideStartMessage *)self conversationID];
  if (v7 == [v6 conversationID])
  {
    uint64_t v8 = [(CTStewieRoadsideStartMessage *)self serializedQuestionnaireAnswers];
    v9 = [v6 serializedQuestionnaireAnswers];
    if (v8 == v9
      || ([(CTStewieRoadsideStartMessage *)self serializedQuestionnaireAnswers],
          v3 = objc_claimAutoreleasedReturnValue(),
          [v6 serializedQuestionnaireAnswers],
          v4 = objc_claimAutoreleasedReturnValue(),
          [v3 isEqual:v4]))
    {
      int v11 = [(CTStewieRoadsideStartMessage *)self isPayPerUse];
      if (v11 == [v6 isPayPerUse]
        && (int64_t v12 = -[CTStewieRoadsideStartMessage providerId](self, "providerId"), v12 == [v6 providerId]))
      {
        unint64_t v13 = [(CTStewieRoadsideStartMessage *)self phoneNumber];
        v14 = [v6 phoneNumber];
        if (v13 == v14)
        {

          char v10 = 1;
        }
        else
        {
          v15 = [(CTStewieRoadsideStartMessage *)self phoneNumber];
          v16 = [v6 phoneNumber];
          char v10 = [v15 isEqualToString:v16];
        }
      }
      else
      {
        char v10 = 0;
      }
      if (v8 == v9) {
        goto LABEL_13;
      }
    }
    else
    {
      char v10 = 0;
    }

LABEL_13:
    goto LABEL_14;
  }
  char v10 = 0;
LABEL_14:

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CTStewieRoadsideStartMessage *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(CTStewieRoadsideStartMessage *)self isEqualToRoadsideStartMessage:v4];
  }

  return v5;
}

- (double)estimatedSendTime
{
  v3 = [(CTStewieRoadsideStartMessage *)self phoneNumber];
  v4 = [(CTStewieRoadsideStartMessage *)self serializedQuestionnaireAnswers];
  if (v4)
  {
    BOOL v5 = [(CTStewieRoadsideStartMessage *)self serializedQuestionnaireAnswers];
    uint64_t v6 = [v5 length];
  }
  else
  {
    uint64_t v6 = 0;
  }
  uint64_t v7 = 18;
  if (!v3) {
    uint64_t v7 = 12;
  }
  unint64_t v8 = v6 + v7;

  return getEstimatedSendTimeOverStewieInSeconds(v8);
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setConversationID:", -[CTStewieRoadsideStartMessage conversationID](self, "conversationID"));
  objc_msgSend(v5, "setProviderId:", -[CTStewieRoadsideStartMessage providerId](self, "providerId"));
  objc_msgSend(v5, "setIsPayPerUse:", -[CTStewieRoadsideStartMessage isPayPerUse](self, "isPayPerUse"));
  uint64_t v6 = [(CTStewieRoadsideStartMessage *)self serializedQuestionnaireAnswers];
  uint64_t v7 = (void *)[v6 copyWithZone:a3];
  [v5 setSerializedQuestionnaireAnswers:v7];

  unint64_t v8 = [(CTStewieRoadsideStartMessage *)self phoneNumber];
  v9 = (void *)[v8 copyWithZone:a3];
  [v5 setPhoneNumber:v9];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  objc_msgSend(v6, "encodeInteger:forKey:", -[CTStewieRoadsideStartMessage conversationID](self, "conversationID"), @"conversationID");
  objc_msgSend(v6, "encodeInteger:forKey:", -[CTStewieRoadsideStartMessage providerId](self, "providerId"), @"providerId");
  objc_msgSend(v6, "encodeBool:forKey:", -[CTStewieRoadsideStartMessage isPayPerUse](self, "isPayPerUse"), @"isPayPerUse");
  v4 = [(CTStewieRoadsideStartMessage *)self serializedQuestionnaireAnswers];
  [v6 encodeObject:v4 forKey:@"serializedQuestionnaireAnswers"];

  BOOL v5 = [(CTStewieRoadsideStartMessage *)self phoneNumber];
  [v6 encodeObject:v5 forKey:@"phoneNumber"];
}

- (CTStewieRoadsideStartMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CTStewieRoadsideStartMessage;
  BOOL v5 = [(CTStewieRoadsideStartMessage *)&v10 init];
  if (v5)
  {
    -[CTStewieRoadsideStartMessage setConversationID:](v5, "setConversationID:", [v4 decodeIntegerForKey:@"conversationID"]);
    -[CTStewieRoadsideStartMessage setProviderId:](v5, "setProviderId:", [v4 decodeIntegerForKey:@"providerId"]);
    -[CTStewieRoadsideStartMessage setIsPayPerUse:](v5, "setIsPayPerUse:", [v4 decodeBoolForKey:@"isPayPerUse"]);
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serializedQuestionnaireAnswers"];
    [(CTStewieRoadsideStartMessage *)v5 setSerializedQuestionnaireAnswers:v6];

    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"phoneNumber"];
    [(CTStewieRoadsideStartMessage *)v5 setPhoneNumber:v7];

    unint64_t v8 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)conversationID
{
  return self->_conversationID;
}

- (void)setConversationID:(int64_t)a3
{
  self->_conversationID = a3;
}

- (int64_t)providerId
{
  return self->_providerId;
}

- (void)setProviderId:(int64_t)a3
{
  self->_providerId = a3;
}

- (BOOL)isPayPerUse
{
  return self->_isPayPerUse;
}

- (void)setIsPayPerUse:(BOOL)a3
{
  self->_isPayPerUse = a3;
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
}

- (NSData)serializedQuestionnaireAnswers
{
  return self->_serializedQuestionnaireAnswers;
}

- (void)setSerializedQuestionnaireAnswers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializedQuestionnaireAnswers, 0);

  objc_storeStrong((id *)&self->_phoneNumber, 0);
}

@end