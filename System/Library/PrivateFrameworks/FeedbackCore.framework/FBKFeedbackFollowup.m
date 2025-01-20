@interface FBKFeedbackFollowup
+ (id)entityName;
+ (unint64_t)followupTypeFromString:(id)a3;
- (BOOL)canRespond;
- (BOOL)collectsFiles;
- (BOOL)hasVisibleFiles;
- (BOOL)hasVisibleFilesIncludingFileResponses;
- (BOOL)isComplete;
- (BOOL)isInformationalFollowup;
- (BOOL)isUploadingFiles;
- (BOOL)isVisible;
- (BOOL)needsRefresh;
- (BOOL)requiresComments;
- (BOOL)requiresValidationResponse;
- (FBKFilePredicate)stubFilePredicate;
- (NSArray)feedbackFollowupResponses;
- (NSString)choiceText;
- (NSString)description;
- (NSString)negativeChoice;
- (NSString)noChoiceText;
- (NSString)platform;
- (NSString)positiveChoice;
- (id)_textResponsesPredicate;
- (id)allFileMatchers;
- (id)bugSessionsFromOriginalFeedback;
- (id)filerFormID;
- (id)matcherPredicates;
- (id)respondedToAt;
- (id)targetPlatform;
- (id)textResponsesSummary;
- (id)validationResponse;
- (id)visibleFilePromises;
- (id)visibleResponses;
- (id)visibleSortedFilePromises;
- (int64_t)filerFormType;
- (int64_t)textResponsesCount;
- (unint64_t)type;
- (void)prepareForDeletion;
- (void)setComplete:(BOOL)a3;
- (void)setFeedbackFollowupResponses:(id)a3;
- (void)setFilerFormType:(int64_t)a3;
- (void)setPropertiesFromJSONObject:(id)a3;
- (void)setStubFilePredicate:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation FBKFeedbackFollowup

+ (id)entityName
{
  return @"FeedbackFollowup";
}

- (void)setPropertiesFromJSONObject:(id)a3
{
  v48[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"is_complete"];
  uint64_t v6 = [v5 BOOLValue];

  [(FBKFeedbackFollowup *)self setServerSideIsComplete:v6];
  v7 = [v4 objectForKeyedSubscript:@"answers_complete"];
  if (v7) {
    int v8 = 1;
  }
  else {
    int v8 = v6;
  }
  if (v7 && (v6 & 1) == 0) {
    int v8 = [v7 BOOLValue];
  }
  unsigned int v43 = v8;
  v46 = v7;
  v9 = [v4 objectForKeyedSubscript:@"display_text"];
  v47 = FBKNilIfNSNull(v9);

  v10 = [v4 objectForKeyedSubscript:@"feedback_followup_responses"];
  uint64_t v11 = FBKNilIfNSNull(v10);

  v45 = (void *)v11;
  if (v11)
  {
    v12 = [(FBKFeedbackFollowup *)self managedObjectContext];
    v13 = +[FBKManagedFeedbackObject importFromJSONArray:v11 intoContext:v12];

    v14 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"type" ascending:0];
    v48[0] = v14;
    v15 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"role" ascending:1 comparator:&__block_literal_global_38];
    v48[1] = v15;
    v16 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"createdAt" ascending:1 selector:sel_compare_];
    v48[2] = v16;
    v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v48 count:3];
    v44 = [v13 sortedArrayUsingDescriptors:v17];
  }
  else
  {
    v44 = (void *)MEMORY[0x263EFFA68];
  }
  v18 = [v4 objectForKeyedSubscript:@"file_matchers"];
  v19 = FBKNilIfNSNull(v18);

  if (v19)
  {
    v20 = [(FBKFeedbackFollowup *)self managedObjectContext];
    v21 = +[FBKManagedFeedbackObject importFromJSONArray:v19 intoContext:v20];

    v22 = [v19 valueForKeyPath:@"id"];
    v23 = [v22 componentsJoinedByString:@","];
    [(FBKFeedbackFollowup *)self setFileMatcherIds:v23];
  }
  else
  {
    v21 = [MEMORY[0x263EFFA08] set];
  }
  v24 = [v4 objectForKeyedSubscript:@"ff_type"];
  unint64_t v25 = +[FBKFeedbackFollowup followupTypeFromString:v24];

  v26 = [v4 objectForKeyedSubscript:@"created_at"];
  v27 = FBKDateFromServerString(v26);

  v28 = [v4 objectForKeyedSubscript:@"file_promises"];
  v29 = FBKNilIfNSNull(v28);

  if (v29)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v30 = [(FBKFeedbackFollowup *)self managedObjectContext];
      v31 = +[FBKManagedFeedbackObject importFromJSONArray:v29 intoContext:v30];
      [(FBKFeedbackFollowup *)self setFilePromises:v31];
    }
  }
  v32 = [v4 objectForKeyedSubscript:@"participant"];
  v33 = FBKNilIfNSNull(v32);

  if (v33)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v34 = [(FBKFeedbackFollowup *)self managedObjectContext];
      v35 = +[FBKManagedFeedbackObject importFromJSONObject:v33 intoContext:v34];
      [(FBKFeedbackFollowup *)self setOriginator:v35];
    }
  }
  [(FBKFeedbackFollowup *)self setType:v25];
  [(FBKFeedbackFollowup *)self setComplete:v43];
  [(FBKFeedbackFollowup *)self setDisplayText:v47];
  if (v25 == 7)
  {
    uint64_t v36 = [(FBKFeedbackFollowup *)self displayText];
    if (!v36
      || (v37 = (void *)v36,
          [(FBKFeedbackFollowup *)self displayText],
          v38 = objc_claimAutoreleasedReturnValue(),
          uint64_t v39 = [v38 length],
          v38,
          v37,
          !v39))
    {
      v40 = [MEMORY[0x263F086E0] FeedbackCore];
      v41 = [v40 localizedStringForKey:@"EL_FFU_PROMPT" value:@"Fill out this response to complete the Enhanced Logging session on this Feedback." table:0];
      [(FBKFeedbackFollowup *)self setDisplayText:v41];
    }
  }
  [(FBKFeedbackFollowup *)self setFeedbackFollowupResponses:v44];
  [(FBKFeedbackFollowup *)self setFileMatchers:v21];
  [(FBKFeedbackFollowup *)self setCreatedAt:v27];
  v42 = [MEMORY[0x263EFF910] date];
  [(FBKFeedbackFollowup *)self setUpdatedAt:v42];
}

uint64_t __51__FBKFeedbackFollowup_setPropertiesFromJSONObject___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  int64_t v5 = +[FBKFeedbackFollowupResponse sortValueOfFollowupResponseRole:a2];
  int64_t v6 = +[FBKFeedbackFollowupResponse sortValueOfFollowupResponseRole:v4];

  uint64_t v7 = -1;
  if (v5 >= v6) {
    uint64_t v7 = 1;
  }
  if (v5 == v6) {
    return 0;
  }
  else {
    return v7;
  }
}

- (id)_textResponsesPredicate
{
  v6[3] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263F08A98];
  v6[0] = @":request_info";
  v6[1] = @":additional_info";
  v6[2] = @":comments";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:3];
  id v4 = [v2 predicateWithFormat:@"role IN[n] (%@) AND text.length > 0", v3];

  return v4;
}

- (int64_t)textResponsesCount
{
  v3 = [(FBKFeedbackFollowup *)self feedbackFollowupResponses];
  id v4 = [(FBKFeedbackFollowup *)self _textResponsesPredicate];
  int64_t v5 = [v3 filteredArrayUsingPredicate:v4];
  int64_t v6 = [v5 count];

  return v6;
}

- (id)textResponsesSummary
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v3 = [(FBKFeedbackFollowup *)self _textResponsesPredicate];
  id v4 = [(FBKFeedbackFollowup *)self feedbackFollowupResponses];
  int64_t v5 = [v4 filteredArrayUsingPredicate:v3];

  if ([v5 count])
  {
    int64_t v6 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "text", (void)v15);
          [v6 addObject:v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }

    v13 = [v6 componentsJoinedByString:@"\n"];
  }
  else
  {
    v13 = &stru_26DDF6A30;
  }

  return v13;
}

- (id)validationResponse
{
  v2 = [(FBKFeedbackFollowup *)self feedbackFollowupResponses];
  v3 = objc_msgSend(v2, "ded_findWithBlock:", &__block_literal_global_103);

  return v3;
}

uint64_t __41__FBKFeedbackFollowup_validationResponse__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 role];
  uint64_t v3 = [v2 isEqualToString:@":is_validated"];

  return v3;
}

- (id)targetPlatform
{
  v2 = [(FBKFeedbackFollowup *)self fileMatchers];
  uint64_t v3 = objc_msgSend(v2, "ded_flatMapWithBlock:", &__block_literal_global_106_0);
  id v4 = [v3 anyObject];

  int64_t v5 = (void *)*MEMORY[0x263F3A118];
  if (v4) {
    int64_t v5 = v4;
  }
  id v6 = v5;

  return v6;
}

uint64_t __37__FBKFeedbackFollowup_targetPlatform__block_invoke(uint64_t a1, void *a2)
{
  return [a2 platform];
}

- (BOOL)isUploadingFiles
{
  v2 = [(FBKFeedbackFollowup *)self uploadTask];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)visibleSortedFilePromises
{
  v8[1] = *MEMORY[0x263EF8340];
  BOOL v3 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"name" ascending:1];
  id v4 = [(FBKFeedbackFollowup *)self visibleFilePromises];
  v8[0] = v3;
  int64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  id v6 = [v4 sortedArrayUsingDescriptors:v5];

  return v6;
}

- (BOOL)hasVisibleFilesIncludingFileResponses
{
  v2 = [(FBKFeedbackFollowup *)self visibleFilePromises];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)hasVisibleFiles
{
  v2 = [(FBKFeedbackFollowup *)self visibleFilePromises];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (id)visibleFilePromises
{
  v2 = [(FBKFeedbackFollowup *)self filePromises];
  BOOL v3 = [v2 allObjects];
  id v4 = FBKDownloadableFilePromisesSelectVisible(v3);

  return v4;
}

- (id)visibleResponses
{
  v2 = [(FBKFeedbackFollowup *)self feedbackFollowupResponses];
  BOOL v3 = objc_msgSend(v2, "ded_selectItemsPassingTest:", &__block_literal_global_111);

  return v3;
}

BOOL __39__FBKFeedbackFollowup_visibleResponses__block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] == 1;
}

+ (unint64_t)followupTypeFromString:(id)a3
{
  id v3 = a3;
  if (followupTypeFromString__onceToken != -1) {
    dispatch_once(&followupTypeFromString__onceToken, &__block_literal_global_114);
  }
  id v4 = [(id)followupTypeFromString__mapping objectForKeyedSubscript:v3];
  int64_t v5 = v4;
  if (v4) {
    unint64_t v6 = [v4 unsignedIntegerValue];
  }
  else {
    unint64_t v6 = -1;
  }

  return v6;
}

void __46__FBKFeedbackFollowup_followupTypeFromString___block_invoke()
{
  v11[8] = *MEMORY[0x263EF8340];
  v10[0] = @"unsolicited";
  v0 = [NSNumber numberWithUnsignedInteger:0];
  v11[0] = v0;
  v10[1] = @"ping";
  v1 = [NSNumber numberWithUnsignedInteger:1];
  v11[1] = v1;
  v10[2] = @"required_files";
  v2 = [NSNumber numberWithUnsignedInteger:2];
  v11[2] = v2;
  v10[3] = @"info";
  id v3 = [NSNumber numberWithUnsignedInteger:3];
  v11[3] = v3;
  v10[4] = @"validate";
  id v4 = [NSNumber numberWithUnsignedInteger:4];
  v11[4] = v4;
  v10[5] = @"enhanced_logging";
  int64_t v5 = [NSNumber numberWithUnsignedInteger:7];
  v11[5] = v5;
  v10[6] = @"FYI";
  unint64_t v6 = [NSNumber numberWithUnsignedInteger:5];
  v11[6] = v6;
  v10[7] = @"aside";
  id v7 = [NSNumber numberWithUnsignedInteger:6];
  v11[7] = v7;
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:8];
  uint64_t v9 = (void *)followupTypeFromString__mapping;
  followupTypeFromString__mapping = v8;
}

- (NSString)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  int64_t v5 = NSStringFromClass(v4);
  unint64_t v6 = [(FBKManagedFeedbackObject *)self ID];
  id v7 = [v3 stringWithFormat:@"<%@:%p ID:%@>", v5, self, v6];

  return (NSString *)v7;
}

- (id)respondedToAt
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(FBKFeedbackFollowup *)self feedbackFollowupResponses];
  id v3 = (void *)[v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        unint64_t v6 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        id v7 = [v6 createdAt];

        if (v7)
        {
          id v3 = [v6 createdAt];
          goto LABEL_11;
        }
      }
      id v3 = (void *)[v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)bugSessionsFromOriginalFeedback
{
  v2 = [(FBKFeedbackFollowup *)self feedback];
  id v3 = [v2 contentItem];
  uint64_t v4 = [v3 formResponse];
  int64_t v5 = [v4 uploadTask];
  unint64_t v6 = [v5 bugSessions];

  return v6;
}

- (unint64_t)type
{
  [(FBKFeedbackFollowup *)self willAccessValueForKey:@"type"];
  id v3 = [(FBKFeedbackFollowup *)self primitiveType];
  unint64_t v4 = [v3 integerValue];

  [(FBKFeedbackFollowup *)self didAccessValueForKey:@"type"];
  return v4;
}

- (void)setType:(unint64_t)a3
{
  [(FBKFeedbackFollowup *)self willChangeValueForKey:@"type"];
  int64_t v5 = [NSNumber numberWithInteger:a3];
  [(FBKFeedbackFollowup *)self setPrimitiveType:v5];

  [(FBKFeedbackFollowup *)self didChangeValueForKey:@"type"];
}

- (BOOL)isComplete
{
  [(FBKFeedbackFollowup *)self willAccessValueForKey:@"complete"];
  id v3 = [(FBKFeedbackFollowup *)self primitiveComplete];
  char v4 = [v3 BOOLValue];

  [(FBKFeedbackFollowup *)self didAccessValueForKey:@"complete"];
  return v4;
}

- (void)setComplete:(BOOL)a3
{
  BOOL v3 = a3;
  [(FBKFeedbackFollowup *)self willChangeValueForKey:@"complete"];
  int64_t v5 = [NSNumber numberWithBool:v3];
  [(FBKFeedbackFollowup *)self setPrimitiveComplete:v5];

  [(FBKFeedbackFollowup *)self didChangeValueForKey:@"complete"];
}

- (NSArray)feedbackFollowupResponses
{
  [(FBKFeedbackFollowup *)self willAccessValueForKey:@"feedbackFollowupResponses"];
  BOOL v3 = [(FBKFeedbackFollowup *)self primitiveFeedbackFollowupResponses];
  char v4 = [v3 array];

  [(FBKFeedbackFollowup *)self didAccessValueForKey:@"feedbackFollowupResponses"];

  return (NSArray *)v4;
}

- (void)setFeedbackFollowupResponses:(id)a3
{
  id v4 = a3;
  [(FBKFeedbackFollowup *)self willChangeValueForKey:@"feedbackFollowupResponses"];
  int64_t v5 = [MEMORY[0x263EFF9D8] orderedSetWithArray:v4];

  [(FBKFeedbackFollowup *)self setPrimitiveFeedbackFollowupResponses:v5];

  [(FBKFeedbackFollowup *)self didChangeValueForKey:@"feedbackFollowupResponses"];
}

- (BOOL)isVisible
{
  if ([(FBKFeedbackFollowup *)self type] == 1) {
    return 0;
  }
  if (![(FBKFeedbackFollowup *)self type])
  {
    id v4 = [(FBKFeedbackFollowup *)self uploadTask];

    if (!v4)
    {
      int64_t v5 = [(FBKFeedbackFollowup *)self feedbackFollowupResponses];
      if ([v5 count])
      {
        BOOL v6 = [(FBKFeedbackFollowup *)self isComplete];

        if (v6) {
          return 1;
        }
      }
      else
      {
      }
      return 0;
    }
  }
  return 1;
}

- (BOOL)canRespond
{
  v2 = [(FBKFeedbackFollowup *)self feedback];
  BOOL v3 = [v2 contentItem];
  char v4 = [v3 canRespondToFollowup];

  return v4;
}

- (NSString)positiveChoice
{
  if ([(FBKFeedbackFollowup *)self type] == 7)
  {
    BOOL v3 = [MEMORY[0x263F086E0] FeedbackCore];
    char v4 = v3;
    int64_t v5 = @"ENHANCED_LOGGING_POSITIVE_CHOICE";
    BOOL v6 = @"Yes";
LABEL_5:
    id v7 = [v3 localizedStringForKey:v5 value:v6 table:0];

    goto LABEL_7;
  }
  if ([(FBKFeedbackFollowup *)self type] == 4)
  {
    BOOL v3 = [MEMORY[0x263F086E0] FeedbackCore];
    char v4 = v3;
    int64_t v5 = @"VALIDATION_POSITIVE_CHOICE";
    BOOL v6 = @"Yes, it‘s resolved";
    goto LABEL_5;
  }
  id v7 = &stru_26DDF6A30;
LABEL_7:

  return (NSString *)v7;
}

- (NSString)negativeChoice
{
  if ([(FBKFeedbackFollowup *)self type] == 7)
  {
    BOOL v3 = [MEMORY[0x263F086E0] FeedbackCore];
    char v4 = v3;
    int64_t v5 = @"ENHANCED_LOGGING_NEGATIVE_CHOICE";
    BOOL v6 = @"No";
LABEL_5:
    id v7 = [v3 localizedStringForKey:v5 value:v6 table:0];

    goto LABEL_7;
  }
  if ([(FBKFeedbackFollowup *)self type] == 4)
  {
    BOOL v3 = [MEMORY[0x263F086E0] FeedbackCore];
    char v4 = v3;
    int64_t v5 = @"VALIDATION_NEGATIVE_CHOICE";
    BOOL v6 = @"No, it‘s not resolved";
    goto LABEL_5;
  }
  id v7 = &stru_26DDF6A30;
LABEL_7:

  return (NSString *)v7;
}

- (NSString)noChoiceText
{
  v2 = [MEMORY[0x263F086E0] FeedbackCore];
  BOOL v3 = [v2 localizedStringForKey:@"VALIDATION_NO_CHOICE" value:@"Choose…" table:0];

  return (NSString *)v3;
}

- (NSString)choiceText
{
  if ([(FBKFeedbackFollowup *)self type] == 7)
  {
    BOOL v3 = [MEMORY[0x263F086E0] FeedbackCore];
    char v4 = v3;
    int64_t v5 = @"ENHANCED_LOGGING_FFU_QUESTION";
    BOOL v6 = @"Did issue happen again?";
LABEL_5:
    id v7 = [v3 localizedStringForKey:v5 value:v6 table:0];

    goto LABEL_7;
  }
  if ([(FBKFeedbackFollowup *)self type] == 4)
  {
    BOOL v3 = [MEMORY[0x263F086E0] FeedbackCore];
    char v4 = v3;
    int64_t v5 = @"VALIDATION_FFU_QUESTION";
    BOOL v6 = @"Has this issue been resolved?";
    goto LABEL_5;
  }
  id v7 = &stru_26DDF6A30;
LABEL_7:

  return (NSString *)v7;
}

- (int64_t)filerFormType
{
  return 1;
}

- (NSString)platform
{
  return 0;
}

- (id)allFileMatchers
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  BOOL v3 = [(FBKFeedbackFollowup *)self fileMatchers];
  char v4 = [(FBKFeedbackFollowup *)self feedback];
  int64_t v5 = [v4 formResponse];
  id v6 = [v5 formPlatform];

  if (!v6)
  {
    id v7 = +[FBKLog ffu];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22A36D000, v7, OS_LOG_TYPE_DEFAULT, "could not get ffu platform from FR", buf, 2u);
    }

    id v6 = (id)*MEMORY[0x263F3A118];
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v3;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ((objc_msgSend(v13, "hasPlatform", (void)v17) & 1) == 0) {
          [v13 setPlatform:v6];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v10);
  }

  if (v8) {
    id v14 = v8;
  }
  else {
    id v14 = (id)objc_opt_new();
  }
  long long v15 = v14;

  return v15;
}

- (BOOL)needsRefresh
{
  if (![(FBKFeedbackFollowup *)self isComplete]) {
    return 0;
  }
  BOOL v3 = [(FBKFeedbackFollowup *)self filePromises];
  if (v3)
  {
    char v4 = [(FBKFeedbackFollowup *)self filePromises];
    BOOL v5 = [v4 count] == 0;
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (id)filerFormID
{
  v2 = [(FBKManagedFeedbackObject *)self ID];
  BOOL v3 = v2;
  if (v2) {
    id v4 = v2;
  }
  else {
    id v4 = (id)objc_opt_new();
  }
  BOOL v5 = v4;

  return v5;
}

- (BOOL)collectsFiles
{
  v2 = [(FBKFeedbackFollowup *)self fileMatchers];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (id)matcherPredicates
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  BOOL v3 = [MEMORY[0x263EFF9C0] set];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = [(FBKFeedbackFollowup *)self fileMatchers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v10 = [FBKMatcherPredicate alloc];
        uint64_t v11 = [(FBKFeedbackFollowup *)self stubFilePredicate];
        long long v12 = [(FBKMatcherPredicate *)v10 initWithFileMatcher:v9 filePredicate:v11];

        [v3 addObject:v12];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  return v3;
}

- (FBKFilePredicate)stubFilePredicate
{
  stubFilePredicate = self->_stubFilePredicate;
  if (!stubFilePredicate)
  {
    id v4 = +[FBKFileMatcherHelper stubFilePredicateWithRequiresRemote:0];
    uint64_t v5 = self->_stubFilePredicate;
    self->_stubFilePredicate = v4;

    unint64_t v6 = [(FBKFeedbackFollowup *)self type];
    stubFilePredicate = self->_stubFilePredicate;
    if (v6 != 7)
    {
      [(FBKFilePredicate *)stubFilePredicate setAlwaysRequired:1];
      stubFilePredicate = self->_stubFilePredicate;
    }
  }

  return stubFilePredicate;
}

- (BOOL)isInformationalFollowup
{
  return [(FBKFeedbackFollowup *)self type] == 5 || [(FBKFeedbackFollowup *)self type] == 6;
}

- (void)prepareForDeletion
{
  v6.receiver = self;
  v6.super_class = (Class)FBKFeedbackFollowup;
  [(FBKFeedbackFollowup *)&v6 prepareForDeletion];
  BOOL v3 = [(FBKFeedbackFollowup *)self filerFormID];

  if (v3)
  {
    id v4 = +[FBKFileManager draftDirectoryForFilerForm:self];
    uint64_t v5 = [MEMORY[0x263F08850] defaultManager];
    [v5 removeItemAtURL:v4 error:0];
  }
}

- (BOOL)requiresComments
{
  unint64_t v2 = [(FBKFeedbackFollowup *)self type];
  return (v2 > 7) | (0x6Bu >> v2) & 1;
}

- (BOOL)requiresValidationResponse
{
  unint64_t v2 = [(FBKFeedbackFollowup *)self type];
  return v2 + 1 > 7 || (v2 + 1) == 5;
}

- (void)setStubFilePredicate:(id)a3
{
}

- (void)setFilerFormType:(int64_t)a3
{
  self->_filerFormType = a3;
}

- (void).cxx_destruct
{
}

@end