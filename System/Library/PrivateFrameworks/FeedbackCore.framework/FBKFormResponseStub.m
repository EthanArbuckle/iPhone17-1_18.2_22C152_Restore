@interface FBKFormResponseStub
+ (id)entityName;
+ (id)fetchRequest;
- (BOOL)isSubmitted;
- (FBKFeedback)feedback;
- (NSNumber)followupCount;
- (id)visibleFilePromises;
- (void)feedback;
- (void)setPropertiesFromJSONObject:(id)a3;
@end

@implementation FBKFormResponseStub

+ (id)entityName
{
  return @"FormResponseStub";
}

- (void)setPropertiesFromJSONObject:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v37 = 0;
  v5 = FBKQuestionAnswerPairAssignObjectForKey(v4, @"form_id", &v37);
  v6 = v37;

  if (v5) {
    [(FBKFormResponseStub *)self setFormID:v6];
  }
  v36 = 0;
  v7 = FBKQuestionAnswerPairAssignObjectForKey(v4, @"submitted_at", &v36);
  v8 = v36;

  if (v7)
  {
    v9 = FBKDateFromServerString(v8);
    [(FBKFormResponseStub *)self setSubmittedAt:v9];
  }
  v35 = 0;
  v10 = FBKQuestionAnswerPairAssignObjectForKey(v4, @"question_groups", &v35);
  v11 = v35;

  if (v10)
  {
    v27 = v8;
    v28 = v6;
    v29 = self;
    v12 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v11, "count"));
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v26 = v11;
    id v13 = v11;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v40 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v32;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v32 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v31 + 1) + 8 * v17);
          v19 = [[FBKQuestionGroupStub alloc] initWithJSONObject:v18];
          if (v19)
          {
            [v12 addObject:v19];
          }
          else
          {
            v20 = +[FBKLog model];
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v39 = v18;
              _os_log_error_impl(&dword_22A36D000, v20, OS_LOG_TYPE_ERROR, "Failed to add question group stub. %{public}@", buf, 0xCu);
            }
          }
          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v31 objects:v40 count:16];
      }
      while (v15);
    }

    self = v29;
    [(FBKFormResponseStub *)v29 setQuestionGroupStubs:v12];

    v8 = v27;
    v6 = v28;
    v11 = v26;
  }
  v30 = 0;
  v21 = FBKQuestionAnswerPairAssignObjectForKey(v4, @"file_promises", &v30);
  v22 = v30;

  if (v21)
  {
    v23 = [(FBKFormResponseStub *)self managedObjectContext];
    v24 = +[FBKManagedFeedbackObject importFromJSONArray:v22 intoContext:v23];
    [(FBKFormResponseStub *)self setFilePromiseStubs:v24];
  }
  v25 = [MEMORY[0x263EFF910] date];
  [(FBKFormResponseStub *)self setUpdatedAt:v25];
}

- (id)visibleFilePromises
{
  v2 = [(FBKFormResponseStub *)self filePromiseStubs];
  v3 = [v2 allObjects];
  id v4 = FBKDownloadableFilePromisesSelectVisible(v3);

  return v4;
}

- (FBKFeedback)feedback
{
  v3 = [(FBKFormResponseStub *)self contentItem];

  if (!v3)
  {
    id v4 = +[FBKLog model];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[FBKFormResponseStub feedback](v4);
    }
  }
  v5 = [(FBKFormResponseStub *)self contentItem];
  v6 = [v5 feedback];

  return (FBKFeedback *)v6;
}

- (BOOL)isSubmitted
{
  v3 = [(FBKFormResponseStub *)self contentItem];
  if ([v3 itemType] == 4)
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = [(FBKFormResponseStub *)self contentItem];
    BOOL v4 = [v5 itemType] == 5;
  }
  return v4;
}

- (NSNumber)followupCount
{
  v3 = [(FBKFormResponseStub *)self feedback];
  if (v3)
  {
    BOOL v4 = NSNumber;
    v5 = [(FBKFormResponseStub *)self feedback];
    v6 = [v5 feedbackFollowupIDs];
    v7 = objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
  }
  else
  {
    v7 = &unk_26DE1E918;
  }

  return (NSNumber *)v7;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"FormResponseStub"];
}

- (void)feedback
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22A36D000, log, OS_LOG_TYPE_ERROR, "FormResponseStub cannot fetch feedback, content item is nil", v1, 2u);
}

@end