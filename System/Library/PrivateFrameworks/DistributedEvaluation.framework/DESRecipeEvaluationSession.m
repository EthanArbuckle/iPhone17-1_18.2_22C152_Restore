@interface DESRecipeEvaluationSession
- (BOOL)requestedToStop;
- (BOOL)taskIsDeferred;
- (DESRecipe)recipe;
- (DESRecipeEvaluationSession)initWithResumptionURL:(id)a3 error:(id *)a4;
- (DESRecordSet)matchingRecordSet;
- (NSArray)testingRecipeAttachments;
- (NSData)binaryResult;
- (NSDictionary)JSONResult;
- (NSError)error;
- (NSString)testingRecipePath;
- (OS_xpc_object)activity;
- (id)_initWithDodMLTask:(id)a3;
- (id)_initWithResumptionURL:(id)a3 recordSet:(id)a4 protocolClass:(Class)a5 error:(id *)a6;
- (id)deferWithDeadline:(id)a3 error:(id *)a4;
- (id)deferralURL;
- (id)testingCompletionHandler;
- (int64_t)evaluationResult;
- (void)completeWithError:(id)a3 completionHandler:(id)a4;
- (void)completeWithJSONResult:(id)a3 binaryResult:(id)a4 completionHandler:(id)a5;
- (void)downloadAttachmentsWithConfiguration:(id)a3 completion:(id)a4;
- (void)setActivity:(id)a3;
- (void)setRequestedToStop:(BOOL)a3;
- (void)setTestingCompletionHandler:(id)a3;
- (void)setTestingRecipeAttachments:(id)a3;
- (void)setTestingRecipePath:(id)a3;
@end

@implementation DESRecipeEvaluationSession

- (id)_initWithDodMLTask:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)DESRecipeEvaluationSession;
  v5 = [(DESRecipeEvaluationSession *)&v24 init];
  if (v5)
  {
    uint64_t v6 = [v4 recipe];
    recipe = v5->_recipe;
    v5->_recipe = (DESRecipe *)v6;

    uint64_t v8 = [v4 matchingRecordSet];
    matchingRecordSet = v5->_matchingRecordSet;
    v5->_matchingRecordSet = (DESRecordSet *)v8;

    v10 = [v4 baseURL];
    uint64_t v11 = [v10 copy];
    baseURL = v5->_baseURL;
    v5->_baseURL = (NSURL *)v11;

    v13 = [v4 localeIdentifier];
    uint64_t v14 = [v13 copy];
    localeIdentifier = v5->_localeIdentifier;
    v5->_localeIdentifier = (NSString *)v14;

    v16 = [v4 testingRecipePath];
    uint64_t v17 = [v16 copy];
    testingRecipePath = v5->_testingRecipePath;
    v5->_testingRecipePath = (NSString *)v17;

    v19 = [v4 recipe];
    v20 = [v19 attachments];
    uint64_t v21 = [v20 copy];
    testingRecipeAttachments = v5->_testingRecipeAttachments;
    v5->_testingRecipeAttachments = (NSArray *)v21;
  }
  return v5;
}

- (DESRecipeEvaluationSession)initWithResumptionURL:(id)a3 error:(id *)a4
{
  return (DESRecipeEvaluationSession *)[(DESRecipeEvaluationSession *)self _initWithResumptionURL:a3 recordSet:0 protocolClass:0 error:a4];
}

- (id)_initWithResumptionURL:(id)a3 recordSet:(id)a4 protocolClass:(Class)a5 error:(id *)a6
{
  return 0;
}

- (void)downloadAttachmentsWithConfiguration:(id)a3 completion:(id)a4
{
  id v5 = a4;
  DESLogAndReturnSunsetError();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v5, v6);
}

- (void)completeWithJSONResult:(id)a3 binaryResult:(id)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v5 = DESLogAndReturnSunsetError();
  id v6 = v7;
  if (v7)
  {
    (*((void (**)(id))v7 + 2))(v7);
    id v6 = v7;
  }
}

- (void)completeWithError:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v4 = DESLogAndReturnSunsetError();
  id v5 = v6;
  if (v6)
  {
    (*((void (**)(id))v6 + 2))(v6);
    id v5 = v6;
  }
}

- (id)deferWithDeadline:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)deferralURL
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendString:@"dodml://evaluation_session/resume?"];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = (void *)MEMORY[0x1E4F290C8];
  id v6 = NSString;
  id v7 = [MEMORY[0x1E4F1C9C8] date];
  [v7 timeIntervalSinceReferenceDate];
  v9 = objc_msgSend(v6, "stringWithFormat:", @"%.0f", v8);
  v10 = [v5 queryItemWithName:@"deferralDate" value:v9];
  [v4 addObject:v10];

  uint64_t v11 = (void *)MEMORY[0x1E4F290C8];
  v12 = NSString;
  [(NSDate *)self->_deadline timeIntervalSinceReferenceDate];
  uint64_t v14 = objc_msgSend(v12, "stringWithFormat:", @"%.0f", v13);
  v15 = [v11 queryItemWithName:@"deadline" value:v14];
  [v4 addObject:v15];

  v16 = (void *)MEMORY[0x1E4F290C8];
  uint64_t v17 = [(DESRecipe *)self->_recipe recipeID];
  v18 = [v16 queryItemWithName:@"recipeId" value:v17];
  [v4 addObject:v18];

  v19 = (void *)MEMORY[0x1E4F290C8];
  v20 = [(DESRecipe *)self->_recipe bundleIdentifier];
  uint64_t v21 = [v19 queryItemWithName:@"recipeType" value:v20];
  [v4 addObject:v21];

  v22 = [MEMORY[0x1E4F290C8] queryItemWithName:@"localeIdentifier" value:self->_localeIdentifier];
  [v4 addObject:v22];

  baseURL = self->_baseURL;
  if (baseURL)
  {
    objc_super v24 = (void *)MEMORY[0x1E4F290C8];
    v25 = [(NSURL *)baseURL absoluteString];
    v26 = [MEMORY[0x1E4F28B88] URLPathAllowedCharacterSet];
    v27 = [v25 stringByAddingPercentEncodingWithAllowedCharacters:v26];
    v28 = [v24 queryItemWithName:@"baseURL" value:v27];
    [v4 addObject:v28];
  }
  if (self->_testingRecipePath)
  {
    v29 = objc_msgSend(MEMORY[0x1E4F290C8], "queryItemWithName:value:", @"recipePath");
    [v4 addObject:v29];
  }
  testingRecipeAttachments = self->_testingRecipeAttachments;
  if (testingRecipeAttachments)
  {
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __41__DESRecipeEvaluationSession_deferralURL__block_invoke;
    v38[3] = &unk_1E63C1A50;
    id v39 = v4;
    [(NSArray *)testingRecipeAttachments enumerateObjectsUsingBlock:v38];
  }
  v31 = [(DESRecordSet *)self->_matchingRecordSet nativeRecords];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __41__DESRecipeEvaluationSession_deferralURL__block_invoke_2;
  v36[3] = &unk_1E63C1A78;
  id v37 = v4;
  id v32 = v4;
  [v31 enumerateKeysAndObjectsUsingBlock:v36];

  id v33 = objc_alloc_init(MEMORY[0x1E4F29088]);
  [v33 setScheme:@"dodml"];
  [v33 setHost:@"evaluation_session"];
  [v33 setPath:@"/resume"];
  [v33 setQueryItems:v32];
  v34 = [v33 URL];

  return v34;
}

void __41__DESRecipeEvaluationSession_deferralURL__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = NSString;
  uint64_t v5 = a3 + 1;
  id v6 = a2;
  id v12 = [v4 stringWithFormat:@"%@_%lu", @"attachment", v5];
  int v7 = [v6 isFileURL];
  uint64_t v8 = *(void **)(a1 + 32);
  v9 = (void *)MEMORY[0x1E4F290C8];
  if (v7) {
    [v6 path];
  }
  else {
  v10 = [v6 absoluteString];
  }

  uint64_t v11 = [v9 queryItemWithName:v12 value:v10];
  [v8 addObject:v11];
}

void __41__DESRecipeEvaluationSession_deferralURL__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([v6 count])
  {
    uint64_t v18 = a1;
    id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
      char v12 = 1;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v14 = *(void **)(*((void *)&v19 + 1) + 8 * v13);
          if ((v12 & 1) == 0) {
            [v7 appendString:@"+"];
          }
          v15 = [v14 UUIDString];
          [v7 appendString:v15];

          char v12 = 0;
          ++v13;
        }
        while (v10 != v13);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
        char v12 = 0;
      }
      while (v10);
    }

    v16 = *(void **)(v18 + 32);
    uint64_t v17 = [MEMORY[0x1E4F290C8] queryItemWithName:v5 value:v7];
    [v16 addObject:v17];
  }
}

- (BOOL)taskIsDeferred
{
  return self->_requestedToStop;
}

- (DESRecipe)recipe
{
  return self->_recipe;
}

- (DESRecordSet)matchingRecordSet
{
  return self->_matchingRecordSet;
}

- (OS_xpc_object)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
}

- (BOOL)requestedToStop
{
  return self->_requestedToStop;
}

- (void)setRequestedToStop:(BOOL)a3
{
  self->_requestedToStop = a3;
}

- (int64_t)evaluationResult
{
  return self->_evaluationResult;
}

- (NSDictionary)JSONResult
{
  return self->_JSONResult;
}

- (NSData)binaryResult
{
  return self->_binaryResult;
}

- (NSError)error
{
  return self->_error;
}

- (NSString)testingRecipePath
{
  return self->_testingRecipePath;
}

- (void)setTestingRecipePath:(id)a3
{
}

- (NSArray)testingRecipeAttachments
{
  return self->_testingRecipeAttachments;
}

- (void)setTestingRecipeAttachments:(id)a3
{
}

- (id)testingCompletionHandler
{
  return self->_testingCompletionHandler;
}

- (void)setTestingCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_testingCompletionHandler, 0);
  objc_storeStrong((id *)&self->_testingRecipeAttachments, 0);
  objc_storeStrong((id *)&self->_testingRecipePath, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_binaryResult, 0);
  objc_storeStrong((id *)&self->_JSONResult, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_matchingRecordSet, 0);
  objc_storeStrong((id *)&self->_recipe, 0);
  objc_storeStrong((id *)&self->_deferralDate, 0);
  objc_storeStrong((id *)&self->_deadline, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);

  objc_storeStrong((id *)&self->_startDate, 0);
}

@end