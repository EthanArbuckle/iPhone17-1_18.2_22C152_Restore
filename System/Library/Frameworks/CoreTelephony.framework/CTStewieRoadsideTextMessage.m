@interface CTStewieRoadsideTextMessage
+ (BOOL)supportsSecureCoding;
+ (double)estimatedSendTimeForRoadsideText:(id)a3;
+ (int64_t)maxLengthInBytesForIncomingText;
+ (int64_t)maxLengthInBytesForOutgoingText;
+ (int64_t)maxSequenceNum;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRoadsideTextMessage:(id)a3;
- (CTStewieRoadsideTextMessage)initWithCoder:(id)a3;
- (CTStewieRoadsideTextMessage)initWithConversationID:(int64_t)a3 providerId:(int64_t)a4 sequenceNum:(int64_t)a5 text:(id)a6 error:(id *)a7;
- (CTStewieRoadsideTextMessage)initWithConversationIDInternal:(int64_t)a3 providerId:(int64_t)a4 sequenceNum:(int64_t)a5 text:(id)a6 maxTextLength:(unint64_t)a7 error:(id *)p_isa;
- (NSString)description;
- (NSString)text;
- (double)estimatedSendTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initIncomingTextMessageWithConversationID:(int64_t)a3 providerId:(int64_t)a4 sequenceNum:(int64_t)a5 text:(id)a6 error:(id *)a7;
- (int64_t)conversationID;
- (int64_t)providerId;
- (int64_t)sequenceNum;
- (void)encodeWithCoder:(id)a3;
- (void)setConversationID:(int64_t)a3;
- (void)setProviderId:(int64_t)a3;
- (void)setSequenceNum:(int64_t)a3;
- (void)setText:(id)a3;
@end

@implementation CTStewieRoadsideTextMessage

- (CTStewieRoadsideTextMessage)initWithConversationIDInternal:(int64_t)a3 providerId:(int64_t)a4 sequenceNum:(int64_t)a5 text:(id)a6 maxTextLength:(unint64_t)a7 error:(id *)p_isa
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v15 = a6;
  v16 = v15;
  if ((unint64_t)a3 >= 0x100)
  {
    if (!p_isa) {
      goto LABEL_19;
    }
    v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v38 = *MEMORY[0x1E4F28568];
    v39[0] = @"Invalid conversationID";
    v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:&v38 count:1];
    *p_isa = [v18 errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v19];

LABEL_18:
    p_isa = 0;
    goto LABEL_19;
  }
  if ((unint64_t)a5 >= 0x2000)
  {
    if (!p_isa) {
      goto LABEL_19;
    }
    v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v36 = *MEMORY[0x1E4F28568];
    v37 = @"Invalid sequenceNum";
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
    *p_isa = [v20 errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v21];

    goto LABEL_18;
  }
  if (!v15)
  {
    if (!p_isa) {
      goto LABEL_19;
    }
    v22 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v34 = *MEMORY[0x1E4F28568];
    v35 = @"Text is missing";
    v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
    *p_isa = [v22 errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v23];

    goto LABEL_18;
  }
  if ((unint64_t)a4 >= 0x8000)
  {
    if (!p_isa) {
      goto LABEL_19;
    }
    v24 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v32 = *MEMORY[0x1E4F28568];
    v33 = @"providerId is invalid";
    v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
    *p_isa = [v24 errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v25];

    goto LABEL_18;
  }
  if ([v15 lengthOfBytesUsingEncoding:4] - 1 >= a7)
  {
    if (!p_isa) {
      goto LABEL_19;
    }
    v26 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v30 = *MEMORY[0x1E4F28568];
    v31 = @"Invalid text length";
    v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    *p_isa = [v26 errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v27];

    goto LABEL_18;
  }
  v29.receiver = self;
  v29.super_class = (Class)CTStewieRoadsideTextMessage;
  v17 = [(CTStewieRoadsideTextMessage *)&v29 init];
  p_isa = (id *)&v17->super.isa;
  if (v17)
  {
    v17->_conversationID = a3;
    v17->_providerId = a4;
    v17->_sequenceNum = a5;
    objc_storeStrong((id *)&v17->_text, a6);
    self = p_isa;
    p_isa = (id *)&self->super.isa;
  }
  else
  {
    self = 0;
  }
LABEL_19:

  return (CTStewieRoadsideTextMessage *)p_isa;
}

- (CTStewieRoadsideTextMessage)initWithConversationID:(int64_t)a3 providerId:(int64_t)a4 sequenceNum:(int64_t)a5 text:(id)a6 error:(id *)a7
{
  return [(CTStewieRoadsideTextMessage *)self initWithConversationIDInternal:a3 providerId:a4 sequenceNum:a5 text:a6 maxTextLength:160 error:a7];
}

- (id)initIncomingTextMessageWithConversationID:(int64_t)a3 providerId:(int64_t)a4 sequenceNum:(int64_t)a5 text:(id)a6 error:(id *)a7
{
  return [(CTStewieRoadsideTextMessage *)self initWithConversationIDInternal:a3 providerId:a4 sequenceNum:a5 text:a6 maxTextLength:1024 error:a7];
}

- (double)estimatedSendTime
{
  v2 = [(CTStewieRoadsideTextMessage *)self text];
  +[CTStewieRoadsideTextMessage estimatedSendTimeForRoadsideText:v2];
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

+ (double)estimatedSendTimeForRoadsideText:(id)a3
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
  [v3 appendFormat:@", conversationID=%ld", -[CTStewieRoadsideTextMessage conversationID](self, "conversationID")];
  [v3 appendFormat:@", providerId=%ld", -[CTStewieRoadsideTextMessage providerId](self, "providerId")];
  [v3 appendFormat:@", sequenceNum=%ld", -[CTStewieRoadsideTextMessage sequenceNum](self, "sequenceNum")];
  double v4 = [(CTStewieRoadsideTextMessage *)self text];
  [v3 appendFormat:@", text=%{sensitive}@", v4];

  [v3 appendString:@">"];

  return (NSString *)v3;
}

- (BOOL)isEqualToRoadsideTextMessage:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CTStewieRoadsideTextMessage *)self conversationID];
  if (v5 == [v4 conversationID]
    && (int64_t v6 = -[CTStewieRoadsideTextMessage providerId](self, "providerId"), v6 == [v4 providerId])
    && (int64_t v7 = -[CTStewieRoadsideTextMessage sequenceNum](self, "sequenceNum"), v7 == [v4 sequenceNum]))
  {
    v8 = [(CTStewieRoadsideTextMessage *)self text];
    v9 = [v4 text];
    if (v8 == v9)
    {
      char v12 = 1;
    }
    else
    {
      v10 = [(CTStewieRoadsideTextMessage *)self text];
      v11 = [v4 text];
      char v12 = [v10 isEqual:v11];
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTStewieRoadsideTextMessage *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(CTStewieRoadsideTextMessage *)self isEqualToRoadsideTextMessage:v4];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setConversationID:", -[CTStewieRoadsideTextMessage conversationID](self, "conversationID"));
  objc_msgSend(v5, "setProviderId:", -[CTStewieRoadsideTextMessage providerId](self, "providerId"));
  objc_msgSend(v5, "setSequenceNum:", -[CTStewieRoadsideTextMessage sequenceNum](self, "sequenceNum"));
  int64_t v6 = [(CTStewieRoadsideTextMessage *)self text];
  int64_t v7 = (void *)[v6 copyWithZone:a3];
  [v5 setText:v7];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", -[CTStewieRoadsideTextMessage conversationID](self, "conversationID"), @"conversationID");
  objc_msgSend(v5, "encodeInteger:forKey:", -[CTStewieRoadsideTextMessage providerId](self, "providerId"), @"providerId");
  objc_msgSend(v5, "encodeInteger:forKey:", -[CTStewieRoadsideTextMessage sequenceNum](self, "sequenceNum"), @"sequenceNum");
  id v4 = [(CTStewieRoadsideTextMessage *)self text];
  [v5 encodeObject:v4 forKey:@"text"];
}

- (CTStewieRoadsideTextMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"conversationID"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"providerId"];
  uint64_t v7 = [v4 decodeIntegerForKey:@"sequenceNum"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"text"];
  v9 = [(CTStewieRoadsideTextMessage *)self initWithConversationIDInternal:v5 providerId:v6 sequenceNum:v7 text:v8 maxTextLength:-1 error:0];

  return v9;
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

- (void).cxx_destruct
{
}

@end