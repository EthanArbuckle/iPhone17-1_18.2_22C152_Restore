@interface BMSocialHighlightFeedbackEvent
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMRankableSocialHighlight)highlight;
- (BMSocialHighlightFeedbackEvent)initWithClientIdentifier:(id)a3 feedbackType:(unint64_t)a4 feedbackCreationDate:(id)a5 highlight:(id)a6;
- (BMSocialHighlightFeedbackEvent)initWithClientIdentifier:(id)a3 feedbackType:(unint64_t)a4 feedbackCreationDate:(id)a5 highlight:(id)a6 clientVariant:(id)a7;
- (BMSocialHighlightFeedbackEvent)initWithProto:(id)a3;
- (BMSocialHighlightFeedbackEvent)initWithProtoData:(id)a3;
- (NSDate)feedbackCreationDate;
- (NSString)clientIdentifier;
- (NSString)clientVariant;
- (id)encodeAsProto;
- (id)proto;
- (int)_protoFeedbackType;
- (unint64_t)_feedbackTypeForProtoType:(int)a3;
- (unint64_t)feedbackType;
- (unsigned)dataVersion;
- (void)_protoFeedbackType;
@end

@implementation BMSocialHighlightFeedbackEvent

- (int)_protoFeedbackType
{
  unint64_t v3 = [(BMSocialHighlightFeedbackEvent *)self feedbackType];
  if (v3 >= 0xB)
  {
    v4 = __biome_log_for_category();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[BMSocialHighlightFeedbackEvent _protoFeedbackType](self);
    }

    LODWORD(v3) = -1;
  }
  return v3;
}

- (unint64_t)_feedbackTypeForProtoType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 < 0xB) {
    return a3;
  }
  v5 = __biome_log_for_category();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[BMSocialHighlightFeedbackEvent _feedbackTypeForProtoType:](v3);
  }

  return 11;
}

- (unsigned)dataVersion
{
  return 3;
}

- (BMSocialHighlightFeedbackEvent)initWithClientIdentifier:(id)a3 feedbackType:(unint64_t)a4 feedbackCreationDate:(id)a5 highlight:(id)a6 clientVariant:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)BMSocialHighlightFeedbackEvent;
  v17 = [(BMEventBase *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_clientIdentifier, a3);
    v18->_feedbackType = a4;
    objc_storeStrong((id *)&v18->_feedbackCreationDate, a5);
    objc_storeStrong((id *)&v18->_highlight, a6);
    objc_storeStrong((id *)&v18->_clientVariant, a7);
  }

  return v18;
}

- (BMSocialHighlightFeedbackEvent)initWithClientIdentifier:(id)a3 feedbackType:(unint64_t)a4 feedbackCreationDate:(id)a5 highlight:(id)a6
{
  return [(BMSocialHighlightFeedbackEvent *)self initWithClientIdentifier:a3 feedbackType:a4 feedbackCreationDate:a5 highlight:a6 clientVariant:&stru_1EDD7E578];
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5 = a3;
  if (a4 == 4)
  {
    v6 = off_1E55D6448;
    goto LABEL_5;
  }
  if (a4 == 3)
  {
    v6 = off_1E55D6440;
LABEL_5:
    v7 = (void *)[objc_alloc(*v6) initWithProtoData:v5];
    goto LABEL_7;
  }
  v7 = 0;
LABEL_7:

  return v7;
}

- (id)encodeAsProto
{
  v2 = [(BMSocialHighlightFeedbackEvent *)self proto];
  uint64_t v3 = [v2 data];

  return v3;
}

- (BMSocialHighlightFeedbackEvent)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = (objc_class *)MEMORY[0x1E4F1C9C8];
    id v6 = v4;
    id v7 = [v5 alloc];
    [v6 feedbackCreationSecondsSinceReferenceDate];
    v8 = objc_msgSend(v7, "initWithTimeIntervalSinceReferenceDate:");
    v9 = [BMRankableSocialHighlight alloc];
    v10 = [v6 highlight];
    v11 = [(BMRankableSocialHighlight *)v9 initWithProto:v10];

    v12 = [v6 clientIdentifier];
    uint64_t v13 = [v6 feedbackType];

    unint64_t v14 = [(BMSocialHighlightFeedbackEvent *)self _feedbackTypeForProtoType:v13];
    id v15 = [(BMRankableSocialHighlight *)v11 clientVariant];
    self = [(BMSocialHighlightFeedbackEvent *)self initWithClientIdentifier:v12 feedbackType:v14 feedbackCreationDate:v8 highlight:v11 clientVariant:v15];

    id v16 = self;
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (BMSocialHighlightFeedbackEvent)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[BMPBSocialHighlightFeedbackEvent alloc] initWithData:v4];

    self = [(BMSocialHighlightFeedbackEvent *)self initWithProto:v5];
    id v6 = self;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)proto
{
  uint64_t v3 = objc_opt_new();
  id v4 = [(BMSocialHighlightFeedbackEvent *)self clientIdentifier];
  [v3 setClientIdentifier:v4];

  objc_msgSend(v3, "setFeedbackType:", -[BMSocialHighlightFeedbackEvent _protoFeedbackType](self, "_protoFeedbackType"));
  id v5 = [(BMSocialHighlightFeedbackEvent *)self feedbackCreationDate];
  [v5 timeIntervalSinceReferenceDate];
  objc_msgSend(v3, "setFeedbackCreationSecondsSinceReferenceDate:");

  id v6 = [(BMSocialHighlightFeedbackEvent *)self highlight];
  id v7 = [v6 proto];
  [v3 setHighlight:v7];

  v8 = [(BMSocialHighlightFeedbackEvent *)self clientVariant];
  [v3 setClientVariant:v8];

  return v3;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (unint64_t)feedbackType
{
  return self->_feedbackType;
}

- (NSDate)feedbackCreationDate
{
  return self->_feedbackCreationDate;
}

- (BMRankableSocialHighlight)highlight
{
  return self->_highlight;
}

- (NSString)clientVariant
{
  return self->_clientVariant;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientVariant, 0);
  objc_storeStrong((id *)&self->_highlight, 0);
  objc_storeStrong((id *)&self->_feedbackCreationDate, 0);

  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

- (void)_protoFeedbackType
{
  v1 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "feedbackType"));
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_8(&dword_18E67D000, v2, v3, "BMSocialHighlightFeedbackEvent: unable to convert BMSocialHighlightUnifiedFeedbackType enum value: %@", v4, v5, v6, v7, v8);
}

- (void)_feedbackTypeForProtoType:(uint64_t)a1 .cold.1(uint64_t a1)
{
  v1 = [NSNumber numberWithInt:a1];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_8(&dword_18E67D000, v2, v3, "BMSocialHighlightFeedbackEvent: unable to convert BMPBSocialHighlightUnifiedFeedbackType enum value: %@", v4, v5, v6, v7, v8);
}

@end