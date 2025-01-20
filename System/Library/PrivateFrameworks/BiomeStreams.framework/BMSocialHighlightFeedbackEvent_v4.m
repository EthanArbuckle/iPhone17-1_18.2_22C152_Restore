@interface BMSocialHighlightFeedbackEvent_v4
- (BMSocialHighlightFeedbackEvent_v4)initWithProto:(id)a3;
@end

@implementation BMSocialHighlightFeedbackEvent_v4

- (BMSocialHighlightFeedbackEvent_v4)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    id v6 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    [v5 feedbackCreationSecondsSinceReferenceDate];
    v7 = objc_msgSend(v6, "initWithTimeIntervalSinceReferenceDate:");
    v8 = [BMRankableSocialHighlight alloc];
    v9 = [v5 highlight];
    v10 = [(BMRankableSocialHighlight *)v8 initWithProto:v9];

    v11 = [v5 clientIdentifier];
    uint64_t v12 = [v5 feedbackType];
    uint64_t v13 = v12;
    if (v12 >= 0xC)
    {
      v16 = __biome_log_for_category();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[BMSocialHighlightFeedbackEvent_v4 initWithProto:](v13);
      }

      uint64_t v14 = 11;
    }
    else
    {
      uint64_t v14 = qword_18EB370C8[(int)v12];
    }
    v17 = [(BMRankableSocialHighlight *)v10 clientVariant];
    self = [(BMSocialHighlightFeedbackEvent *)self initWithClientIdentifier:v11 feedbackType:v14 feedbackCreationDate:v7 highlight:v10 clientVariant:v17];

    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1)
{
  v1 = [NSNumber numberWithInt:a1];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_8(&dword_18E67D000, v2, v3, "BMSocialHighlightFeedbackEvent: unable to convert BMPBSocialHighlightUnifiedFeedbackType v4 enum value: %@", v4, v5, v6, v7, v8);
}

@end