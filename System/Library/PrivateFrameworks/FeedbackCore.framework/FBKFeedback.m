@interface FBKFeedback
+ (id)entityName;
- (BOOL)allowUnsolicitedFollowup;
- (BOOL)hasEqualMetadata:(id)a3;
- (BOOL)hasVisibleFollowupContent;
- (FBKFormResponseStub)formResponseStub;
- (NSArray)feedbackFollowups;
- (id)validFeedbackFollowups;
- (unint64_t)type;
- (void)addFollowup:(id)a3;
- (void)deleteFollowup:(id)a3;
- (void)formResponseStub;
- (void)setFeedbackFollowups:(id)a3;
- (void)setPropertiesFromJSONObject:(id)a3;
@end

@implementation FBKFeedback

+ (id)entityName
{
  return @"Feedback";
}

- (void)setPropertiesFromJSONObject:(id)a3
{
  id v14 = a3;
  v4 = [v14 objectForKeyedSubscript:@"for_build"];
  v5 = FBKNilIfNSNull(v4);

  if (v5) {
    [(FBKFeedback *)self setBuild:v5];
  }
  v6 = [v14 objectForKeyedSubscript:@"form_response_id"];
  v7 = FBKNilIfNSNull(v6);

  if (v7) {
    [(FBKFeedback *)self setFormResponseID:v7];
  }
  v8 = [v14 objectForKeyedSubscript:@"feedback_followup_ids"];
  v9 = FBKNilIfNSNull(v8);

  if (v9) {
    [(FBKFeedback *)self setFeedbackFollowupIDs:v9];
  }
  v10 = [v14 objectForKeyedSubscript:@"type"];
  v11 = FBKNilIfNSNull(v10);

  if (v11)
  {
    v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "isEqualToString:", 0));
    [(FBKFeedback *)self setRawType:v12];
  }
  v13 = [MEMORY[0x263EFF910] date];
  [(FBKFeedback *)self setUpdatedAt:v13];
}

- (BOOL)hasVisibleFollowupContent
{
  v3 = [(FBKFeedback *)self validFeedbackFollowups];
  if ([v3 count])
  {
    char v4 = 1;
  }
  else
  {
    v5 = [(FBKFeedback *)self contentItem];
    char v4 = [v5 hasFollowupPending];
  }
  return v4;
}

- (FBKFormResponseStub)formResponseStub
{
  v3 = [(FBKFeedback *)self contentItem];

  if (!v3)
  {
    char v4 = +[FBKLog model];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[FBKFeedback formResponseStub](v4);
    }
  }
  v5 = [(FBKFeedback *)self contentItem];
  v6 = [v5 formResponseStub];

  return (FBKFormResponseStub *)v6;
}

- (NSArray)feedbackFollowups
{
  [(FBKFeedback *)self willAccessValueForKey:@"feedbackFollowups"];
  v3 = [(FBKFeedback *)self primitiveFeedbackFollowups];
  char v4 = [v3 array];

  [(FBKFeedback *)self didAccessValueForKey:@"feedbackFollowups"];

  return (NSArray *)v4;
}

- (void)setFeedbackFollowups:(id)a3
{
  id v4 = a3;
  [(FBKFeedback *)self willChangeValueForKey:@"feedbackFollowups"];
  v5 = [MEMORY[0x263EFF9D8] orderedSetWithArray:v4];

  [(FBKFeedback *)self setPrimitiveFeedbackFollowups:v5];

  [(FBKFeedback *)self didChangeValueForKey:@"feedbackFollowups"];
}

- (void)addFollowup:(id)a3
{
  id v4 = a3;
  v5 = [(FBKFeedback *)self feedbackFollowups];
  v6 = [v5 arrayByAddingObject:v4];
  [(FBKFeedback *)self setFeedbackFollowups:v6];

  id v9 = [(FBKFeedback *)self feedbackFollowupIDs];
  v7 = [v4 ID];

  v8 = [v9 arrayByAddingObject:v7];
  [(FBKFeedback *)self setFeedbackFollowupIDs:v8];
}

- (void)deleteFollowup:(id)a3
{
  id v4 = a3;
  v5 = [(FBKFeedback *)self feedbackFollowupIDs];
  v6 = [v4 ID];
  int v7 = [v5 containsObject:v6];

  if (v7)
  {
    v8 = [(FBKFeedback *)self feedbackFollowupIDs];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __30__FBKFeedback_deleteFollowup___block_invoke;
    v22[3] = &unk_264874110;
    v23 = v4;
    id v9 = objc_msgSend(v8, "ded_rejectItemsPassingTest:", v22);
    [(FBKFeedback *)self setFeedbackFollowupIDs:v9];

    v10 = v23;
  }
  else
  {
    v10 = +[FBKLog model];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[FBKFeedback deleteFollowup:](v4);
    }
  }

  v11 = [(FBKFeedback *)self feedbackFollowups];
  int v12 = [v11 containsObject:v4];

  if (v12)
  {
    v13 = [(FBKFeedback *)self managedObjectContext];
    [v13 deleteObject:v4];

    id v14 = [(FBKFeedback *)self feedbackFollowups];
    uint64_t v17 = MEMORY[0x263EF8330];
    uint64_t v18 = 3221225472;
    v19 = __30__FBKFeedback_deleteFollowup___block_invoke_20;
    v20 = &unk_264874138;
    v21 = v4;
    v15 = objc_msgSend(v14, "ded_rejectItemsPassingTest:", &v17);
    -[FBKFeedback setFeedbackFollowups:](self, "setFeedbackFollowups:", v15, v17, v18, v19, v20);

    v16 = v21;
  }
  else
  {
    v16 = +[FBKLog model];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[FBKFeedback deleteFollowup:](v4);
    }
  }
}

uint64_t __30__FBKFeedback_deleteFollowup___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 ID];
  uint64_t v5 = [v3 isEqualToNumber:v4];

  return v5;
}

uint64_t __30__FBKFeedback_deleteFollowup___block_invoke_20(uint64_t a1, void *a2)
{
  id v3 = [a2 ID];
  id v4 = [*(id *)(a1 + 32) ID];
  uint64_t v5 = [v3 isEqualToNumber:v4];

  return v5;
}

- (id)validFeedbackFollowups
{
  v2 = [(FBKFeedback *)self feedbackFollowups];
  id v3 = objc_msgSend(v2, "ded_rejectItemsPassingTest:", &__block_literal_global_6);

  return v3;
}

uint64_t __37__FBKFeedback_validFeedbackFollowups__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = a2;
  if ([v2 type]
    || ([v2 feedbackFollowupResponses],
        id v3 = objc_claimAutoreleasedReturnValue(),
        uint64_t v4 = [v3 count],
        v3,
        v4))
  {
    uint64_t v5 = 0;
  }
  else
  {
    int v7 = +[FBKLog ffu];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = [v2 ID];
      v9[0] = 67109120;
      v9[1] = [v8 intValue];
      _os_log_impl(&dword_22A36D000, v7, OS_LOG_TYPE_DEFAULT, "will not display unsolicited ffu without response: [%i]", (uint8_t *)v9, 8u);
    }
    uint64_t v5 = 1;
  }

  return v5;
}

- (BOOL)hasEqualMetadata:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_5;
  }
  uint64_t v5 = [(FBKFeedback *)self formResponseID];
  v6 = [v4 formResponseID];
  int v7 = [v5 isEqualToNumber:v6];

  if (!v7) {
    goto LABEL_5;
  }
  v8 = [(FBKManagedFeedbackObject *)self ID];
  id v9 = [v4 ID];
  int v10 = [v8 isEqualToNumber:v9];

  if (v10)
  {
    v11 = [(FBKFeedback *)self feedbackFollowupIDs];
    int v12 = [v4 feedbackFollowupIDs];
    char v13 = [v11 isEqualToArray:v12];
  }
  else
  {
LABEL_5:
    char v13 = 0;
  }

  return v13;
}

- (unint64_t)type
{
  id v2 = [(FBKFeedback *)self rawType];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (BOOL)allowUnsolicitedFollowup
{
  id v2 = [(FBKFeedback *)self contentItem];
  char v3 = [v2 allowUnsolicitedFollowup];

  return v3;
}

- (void)formResponseStub
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22A36D000, log, OS_LOG_TYPE_ERROR, "Cannot reach FormReponse Stub. Content item is nil", v1, 2u);
}

- (void)deleteFollowup:(void *)a1 .cold.1(void *a1)
{
  id v2 = [a1 ID];
  [v2 intValue];
  char v3 = [a1 feedback];
  id v4 = [v3 ID];
  [v4 intValue];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_22A36D000, v5, v6, "FFU [%i] not in Feedback [%i], cannot remove FFU", v7, v8, v9, v10, v11);
}

- (void)deleteFollowup:(void *)a1 .cold.2(void *a1)
{
  id v2 = [a1 ID];
  [v2 intValue];
  char v3 = [a1 feedback];
  id v4 = [v3 ID];
  [v4 intValue];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_22A36D000, v5, v6, "FFU ID [%i] not in Feedback [%i], cannot remove ID", v7, v8, v9, v10, v11);
}

@end