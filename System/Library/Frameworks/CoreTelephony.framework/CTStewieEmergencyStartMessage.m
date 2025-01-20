@interface CTStewieEmergencyStartMessage
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToEmergencyStartMessage:(id)a3;
- (BOOL)shareEED;
- (CTStewieEmergencyStartMessage)initWithCoder:(id)a3;
- (CTStewieEmergencyStartMessage)initWithDictionary:(id)a3 error:(id *)a4;
- (NSData)serializedQuestionnaireAnswers;
- (NSString)description;
- (double)estimatedSendTime;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)conversationID;
- (int64_t)notifyOption;
- (void)encodeWithCoder:(id)a3;
- (void)setConversationID:(int64_t)a3;
- (void)setNotifyOption:(int64_t)a3;
- (void)setSerializedQuestionnaireAnswers:(id)a3;
- (void)setShareEED:(BOOL)a3;
@end

@implementation CTStewieEmergencyStartMessage

- (CTStewieEmergencyStartMessage)initWithDictionary:(id)a3 error:(id *)a4
{
  v36[1] = *MEMORY[0x1E4F143B8];
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
        v11 = [v7 valueForKey:@"notifyOption"];
        if (!v11)
        {
          if (!a4)
          {
            v17 = 0;
            goto LABEL_24;
          }
          v22 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v29 = *MEMORY[0x1E4F28568];
          v30 = @"notifyOption is missing";
          v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
          [v22 errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v12];
          v17 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_23;
        }
        v12 = [v7 valueForKey:@"shareEED"];
        if (v12)
        {
          v26.receiver = self;
          v26.super_class = (Class)CTStewieEmergencyStartMessage;
          v13 = [(CTStewieEmergencyStartMessage *)&v26 init];
          v14 = v13;
          if (v13)
          {
            v13->_conversationID = v10;
            uint64_t v15 = [v7 valueForKey:@"serializedQuestionnaireAnswers"];
            serializedQuestionnaireAnswers = v14->_serializedQuestionnaireAnswers;
            v14->_serializedQuestionnaireAnswers = (NSData *)v15;

            v14->_notifyOption = [v11 integerValue];
            v14->_shareEED = [v12 BOOLValue];
            self = v14;
            v17 = self;
LABEL_23:

            goto LABEL_24;
          }
          self = 0;
        }
        else if (a4)
        {
          v23 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v27 = *MEMORY[0x1E4F28568];
          v28 = @"shareEED is missing";
          v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
          *a4 = [v23 errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v24];
        }
        v17 = 0;
        goto LABEL_23;
      }
      if (a4)
      {
        v21 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v31 = *MEMORY[0x1E4F28568];
        v32 = @"conversationID is invalid";
        v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
        id v20 = [v21 errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v11];
        goto LABEL_14;
      }
    }
    else if (a4)
    {
      v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v33 = *MEMORY[0x1E4F28568];
      v34 = @"conversationID is missing";
      v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
      id v20 = [v19 errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v11];
LABEL_14:
      v17 = 0;
      *a4 = v20;
LABEL_24:

      goto LABEL_25;
    }
    v17 = 0;
LABEL_25:

    goto LABEL_26;
  }
  if (a4)
  {
    v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v35 = *MEMORY[0x1E4F28568];
    v36[0] = @"Empty dictionary";
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:&v35 count:1];
    [v18 errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v9];
    v17 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_25;
  }
  v17 = 0;
LABEL_26:

  return v17;
}

- (NSString)description
{
  v4 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  [v4 appendFormat:@", conversationID=%ld", -[CTStewieEmergencyStartMessage conversationID](self, "conversationID")];
  v5 = [(CTStewieEmergencyStartMessage *)self serializedQuestionnaireAnswers];
  if (v5)
  {
    v2 = [(CTStewieEmergencyStartMessage *)self serializedQuestionnaireAnswers];
    uint64_t v6 = [v2 length];
  }
  else
  {
    uint64_t v6 = 0;
  }
  [v4 appendFormat:@", serializedQuestionnaireAnswers length=%lu", v6];
  if (v5) {

  }
  unint64_t v7 = [(CTStewieEmergencyStartMessage *)self notifyOption];
  if (v7 > 3) {
    v8 = "???";
  }
  else {
    v8 = off_1E5263F58[v7];
  }
  [v4 appendFormat:@", notifyOption=%s", v8];
  BOOL v9 = [(CTStewieEmergencyStartMessage *)self shareEED];
  unint64_t v10 = "no";
  if (v9) {
    unint64_t v10 = "yes";
  }
  [v4 appendFormat:@", shareEED=%s", v10];
  [v4 appendString:@">"];

  return (NSString *)v4;
}

- (BOOL)isEqualToEmergencyStartMessage:(id)a3
{
  id v6 = a3;
  int64_t v7 = [(CTStewieEmergencyStartMessage *)self conversationID];
  if (v7 == [v6 conversationID])
  {
    v8 = [(CTStewieEmergencyStartMessage *)self serializedQuestionnaireAnswers];
    BOOL v9 = [v6 serializedQuestionnaireAnswers];
    if (v8 == v9
      || ([(CTStewieEmergencyStartMessage *)self serializedQuestionnaireAnswers],
          v3 = objc_claimAutoreleasedReturnValue(),
          [v6 serializedQuestionnaireAnswers],
          v4 = objc_claimAutoreleasedReturnValue(),
          [v3 isEqual:v4]))
    {
      int64_t v11 = [(CTStewieEmergencyStartMessage *)self notifyOption];
      if (v11 == [v6 notifyOption])
      {
        BOOL v12 = [(CTStewieEmergencyStartMessage *)self shareEED];
        int v10 = v12 ^ [v6 shareEED] ^ 1;
      }
      else
      {
        LOBYTE(v10) = 0;
      }
      if (v8 == v9) {
        goto LABEL_11;
      }
    }
    else
    {
      LOBYTE(v10) = 0;
    }

LABEL_11:
    goto LABEL_12;
  }
  LOBYTE(v10) = 0;
LABEL_12:

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CTStewieEmergencyStartMessage *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(CTStewieEmergencyStartMessage *)self isEqualToEmergencyStartMessage:v4];
  }

  return v5;
}

- (double)estimatedSendTime
{
  v4 = [(CTStewieEmergencyStartMessage *)self serializedQuestionnaireAnswers];
  if (v4)
  {
    v2 = [(CTStewieEmergencyStartMessage *)self serializedQuestionnaireAnswers];
    uint64_t v5 = [v2 length];
  }
  else
  {
    uint64_t v5 = 0;
  }
  BOOL v6 = [(CTStewieEmergencyStartMessage *)self shareEED];
  if (v4) {

  }
  uint64_t v7 = 16;
  if (!v6) {
    uint64_t v7 = 0;
  }
  unint64_t v8 = v5 + v7 + 12;

  return getEstimatedSendTimeOverStewieInSeconds(v8);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setConversationID:", -[CTStewieEmergencyStartMessage conversationID](self, "conversationID"));
  BOOL v6 = [(CTStewieEmergencyStartMessage *)self serializedQuestionnaireAnswers];
  uint64_t v7 = (void *)[v6 copyWithZone:a3];
  [v5 setSerializedQuestionnaireAnswers:v7];

  objc_msgSend(v5, "setNotifyOption:", -[CTStewieEmergencyStartMessage notifyOption](self, "notifyOption"));
  objc_msgSend(v5, "setShareEED:", -[CTStewieEmergencyStartMessage shareEED](self, "shareEED"));
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", -[CTStewieEmergencyStartMessage conversationID](self, "conversationID"), @"conversationID");
  v4 = [(CTStewieEmergencyStartMessage *)self serializedQuestionnaireAnswers];
  [v5 encodeObject:v4 forKey:@"serializedQuestionnaireAnswers"];

  objc_msgSend(v5, "encodeInteger:forKey:", -[CTStewieEmergencyStartMessage notifyOption](self, "notifyOption"), @"notifyOption");
  objc_msgSend(v5, "encodeBool:forKey:", -[CTStewieEmergencyStartMessage shareEED](self, "shareEED"), @"shareEED");
}

- (CTStewieEmergencyStartMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTStewieEmergencyStartMessage;
  id v5 = [(CTStewieEmergencyStartMessage *)&v9 init];
  if (v5)
  {
    -[CTStewieEmergencyStartMessage setConversationID:](v5, "setConversationID:", [v4 decodeIntegerForKey:@"conversationID"]);
    BOOL v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serializedQuestionnaireAnswers"];
    [(CTStewieEmergencyStartMessage *)v5 setSerializedQuestionnaireAnswers:v6];

    -[CTStewieEmergencyStartMessage setNotifyOption:](v5, "setNotifyOption:", [v4 decodeIntegerForKey:@"notifyOption"]);
    -[CTStewieEmergencyStartMessage setShareEED:](v5, "setShareEED:", [v4 decodeBoolForKey:@"shareEED"]);
    uint64_t v7 = v5;
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

- (NSData)serializedQuestionnaireAnswers
{
  return self->_serializedQuestionnaireAnswers;
}

- (void)setSerializedQuestionnaireAnswers:(id)a3
{
}

- (int64_t)notifyOption
{
  return self->_notifyOption;
}

- (void)setNotifyOption:(int64_t)a3
{
  self->_notifyOption = a3;
}

- (BOOL)shareEED
{
  return self->_shareEED;
}

- (void)setShareEED:(BOOL)a3
{
  self->_shareEED = a3;
}

- (void).cxx_destruct
{
}

@end