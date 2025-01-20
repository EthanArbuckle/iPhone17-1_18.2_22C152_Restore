@interface CTStewieEmergencyTextMessage
+ (BOOL)supportsSecureCoding;
+ (double)estimatedSendTimeForEmergencyText:(id)a3;
+ (int64_t)maxLengthInBytesForIncomingText;
+ (int64_t)maxLengthInBytesForOutgoingText;
+ (int64_t)maxSequenceNum;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToEmergencyTextMessage:(id)a3;
- (CTStewieEmergencyTextMessage)initWithCoder:(id)a3;
- (CTStewieEmergencyTextMessage)initWithConversationID:(int64_t)a3 sequenceNum:(int64_t)a4 emergencyText:(id)a5 error:(id *)a6;
- (CTStewieEmergencyTextMessage)initWithConversationIDInternal:(int64_t)a3 sequenceNum:(int64_t)a4 emergencyText:(id)a5 maxTextLength:(unint64_t)a6 error:(id *)p_isa;
- (NSString)description;
- (NSString)text;
- (double)estimatedSendTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initIncomingTextMessageWithConversationID:(int64_t)a3 sequenceNum:(int64_t)a4 emergencyText:(id)a5 notifyOption:(int64_t)a6 error:(id *)a7;
- (int64_t)conversationID;
- (int64_t)incomingTextNotifyOption;
- (int64_t)sequenceNum;
- (void)encodeWithCoder:(id)a3;
- (void)setConversationID:(int64_t)a3;
- (void)setIncomingTextNotifyOption:(int64_t)a3;
- (void)setSequenceNum:(int64_t)a3;
- (void)setText:(id)a3;
@end

@implementation CTStewieEmergencyTextMessage

- (CTStewieEmergencyTextMessage)initWithConversationIDInternal:(int64_t)a3 sequenceNum:(int64_t)a4 emergencyText:(id)a5 maxTextLength:(unint64_t)a6 error:(id *)p_isa
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v13 = a5;
  v14 = v13;
  if ((unint64_t)a3 >= 0x100)
  {
    if (!p_isa) {
      goto LABEL_16;
    }
    v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v32 = *MEMORY[0x1E4F28568];
    v33[0] = @"Invalid conversationID";
    v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:&v32 count:1];
    *p_isa = [v16 errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v17];

LABEL_15:
    p_isa = 0;
    goto LABEL_16;
  }
  if ((unint64_t)a4 >= 0x2000)
  {
    if (!p_isa) {
      goto LABEL_16;
    }
    v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v30 = *MEMORY[0x1E4F28568];
    v31 = @"Invalid sequenceNum";
    v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    *p_isa = [v18 errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v19];

    goto LABEL_15;
  }
  if (!v13)
  {
    if (!p_isa) {
      goto LABEL_16;
    }
    v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v28 = *MEMORY[0x1E4F28568];
    v29 = @"Text is missing";
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    *p_isa = [v20 errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v21];

    goto LABEL_15;
  }
  if ([v13 lengthOfBytesUsingEncoding:4] - 1 >= a6)
  {
    if (!p_isa) {
      goto LABEL_16;
    }
    v22 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v26 = *MEMORY[0x1E4F28568];
    v27 = @"Invalid text length";
    v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    *p_isa = [v22 errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v23];

    goto LABEL_15;
  }
  v25.receiver = self;
  v25.super_class = (Class)CTStewieEmergencyTextMessage;
  v15 = [(CTStewieEmergencyTextMessage *)&v25 init];
  p_isa = (id *)&v15->super.isa;
  if (v15)
  {
    v15->_conversationID = a3;
    v15->_sequenceNum = a4;
    objc_storeStrong((id *)&v15->_text, a5);
    p_isa[4] = 0;
    self = p_isa;
    p_isa = (id *)&self->super.isa;
  }
  else
  {
    self = 0;
  }
LABEL_16:

  return (CTStewieEmergencyTextMessage *)p_isa;
}

- (CTStewieEmergencyTextMessage)initWithConversationID:(int64_t)a3 sequenceNum:(int64_t)a4 emergencyText:(id)a5 error:(id *)a6
{
  return [(CTStewieEmergencyTextMessage *)self initWithConversationIDInternal:a3 sequenceNum:a4 emergencyText:a5 maxTextLength:160 error:a6];
}

- (id)initIncomingTextMessageWithConversationID:(int64_t)a3 sequenceNum:(int64_t)a4 emergencyText:(id)a5 notifyOption:(int64_t)a6 error:(id *)a7
{
  v8 = [(CTStewieEmergencyTextMessage *)self initWithConversationIDInternal:a3 sequenceNum:a4 emergencyText:a5 maxTextLength:1024 error:a7];
  v9 = v8;
  if (v8)
  {
    v8->_incomingTextNotifyOption = a6;
    v10 = v8;
  }

  return v9;
}

- (double)estimatedSendTime
{
  v2 = [(CTStewieEmergencyTextMessage *)self text];
  +[CTStewieEmergencyTextMessage estimatedSendTimeForEmergencyText:v2];
  double v4 = v3;

  return v4;
}

+ (int64_t)maxLengthInBytesForOutgoingText
{
  return 160;
}

+ (int64_t)maxLengthInBytesForIncomingText
{
  return 1024;
}

+ (int64_t)maxSequenceNum
{
  return 0x1FFFLL;
}

+ (double)estimatedSendTimeForEmergencyText:(id)a3
{
  id v3 = a3;
  double v4 = v3;
  double EstimatedSendTimeOverStewieInSeconds = 0.0;
  if (v3)
  {
    uint64_t v6 = [v3 lengthOfBytesUsingEncoding:4];
    if (v6) {
      double EstimatedSendTimeOverStewieInSeconds = getEstimatedSendTimeOverStewieInSeconds(v6 + 4);
    }
  }

  return EstimatedSendTimeOverStewieInSeconds;
}

- (NSString)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  [v3 appendFormat:@", conversationID=%ld", -[CTStewieEmergencyTextMessage conversationID](self, "conversationID")];
  [v3 appendFormat:@", sequenceNum=%ld", -[CTStewieEmergencyTextMessage sequenceNum](self, "sequenceNum")];
  double v4 = [(CTStewieEmergencyTextMessage *)self text];
  [v3 appendFormat:@", text=%{sensitive}@", v4];

  unint64_t v5 = [(CTStewieEmergencyTextMessage *)self incomingTextNotifyOption];
  if (v5 > 3) {
    uint64_t v6 = "???";
  }
  else {
    uint64_t v6 = off_1E5263F58[v5];
  }
  [v3 appendFormat:@", incomingTextNotifyOption=%s", v6];
  [v3 appendString:@">"];

  return (NSString *)v3;
}

- (BOOL)isEqualToEmergencyTextMessage:(id)a3
{
  id v6 = a3;
  int64_t v7 = [(CTStewieEmergencyTextMessage *)self conversationID];
  if (v7 == [v6 conversationID])
  {
    int64_t v8 = [(CTStewieEmergencyTextMessage *)self sequenceNum];
    if (v8 == [v6 sequenceNum])
    {
      v9 = [(CTStewieEmergencyTextMessage *)self text];
      v10 = [v6 text];
      if (v9 == v10
        || ([(CTStewieEmergencyTextMessage *)self text],
            id v3 = objc_claimAutoreleasedReturnValue(),
            [v6 text],
            double v4 = objc_claimAutoreleasedReturnValue(),
            [v3 isEqual:v4]))
      {
        int64_t v12 = [(CTStewieEmergencyTextMessage *)self incomingTextNotifyOption];
        BOOL v11 = v12 == [v6 incomingTextNotifyOption];
        if (v9 == v10)
        {
LABEL_9:

          goto LABEL_10;
        }
      }
      else
      {
        BOOL v11 = 0;
      }

      goto LABEL_9;
    }
  }
  BOOL v11 = 0;
LABEL_10:

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (CTStewieEmergencyTextMessage *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(CTStewieEmergencyTextMessage *)self isEqualToEmergencyTextMessage:v4];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setConversationID:", -[CTStewieEmergencyTextMessage conversationID](self, "conversationID"));
  objc_msgSend(v5, "setSequenceNum:", -[CTStewieEmergencyTextMessage sequenceNum](self, "sequenceNum"));
  id v6 = [(CTStewieEmergencyTextMessage *)self text];
  int64_t v7 = (void *)[v6 copyWithZone:a3];
  [v5 setText:v7];

  objc_msgSend(v5, "setIncomingTextNotifyOption:", -[CTStewieEmergencyTextMessage incomingTextNotifyOption](self, "incomingTextNotifyOption"));
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", -[CTStewieEmergencyTextMessage conversationID](self, "conversationID"), @"conversationID");
  objc_msgSend(v5, "encodeInteger:forKey:", -[CTStewieEmergencyTextMessage sequenceNum](self, "sequenceNum"), @"sequenceNum");
  double v4 = [(CTStewieEmergencyTextMessage *)self text];
  [v5 encodeObject:v4 forKey:@"text"];

  objc_msgSend(v5, "encodeInteger:forKey:", -[CTStewieEmergencyTextMessage incomingTextNotifyOption](self, "incomingTextNotifyOption"), @"notifyOption");
}

- (CTStewieEmergencyTextMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"conversationID"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"sequenceNum"];
  int64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"text"];
  int64_t v8 = [(CTStewieEmergencyTextMessage *)self initWithConversationIDInternal:v5 sequenceNum:v6 emergencyText:v7 maxTextLength:-1 error:0];

  if (v8)
  {
    v8->_incomingTextNotifyOption = [v4 decodeIntegerForKey:@"notifyOption"];
    v9 = v8;
  }

  return v8;
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

- (int64_t)sequenceNum
{
  return self->_sequenceNum;
}

- (void)setSequenceNum:(int64_t)a3
{
  self->_sequenceNum = a3;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (int64_t)incomingTextNotifyOption
{
  return self->_incomingTextNotifyOption;
}

- (void)setIncomingTextNotifyOption:(int64_t)a3
{
  self->_incomingTextNotifyOption = a3;
}

- (void).cxx_destruct
{
}

@end