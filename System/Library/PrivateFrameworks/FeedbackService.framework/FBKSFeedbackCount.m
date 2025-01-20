@interface FBKSFeedbackCount
+ (void)fetchCountsForFormWithIdentifier:(id)a3 completion:(id)a4;
- (FBKSCampaign)currentCampaign;
- (FBKSFeedbackCount)initWithCampaign:(id)a3 campaignErrors:(id)a4 feedbackSubmitted:(id)a5 declineCount:(int64_t)a6;
- (FBKSFeedbackCount)initWithSwiftObject:(id)a3;
- (FBKSFeedbackCount_FrameworkPrivateName)swiftObject;
- (NSArray)errors;
- (NSArray)feedbackFiled;
- (id)debugDescription;
- (id)description;
- (int64_t)declineCount;
- (void)setSwiftObject:(id)a3;
@end

@implementation FBKSFeedbackCount

- (FBKSFeedbackCount)initWithCampaign:(id)a3 campaignErrors:(id)a4 feedbackSubmitted:(id)a5 declineCount:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)FBKSFeedbackCount;
  v14 = [(FBKSFeedbackCount *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_currentCampaign, a3);
    objc_storeStrong((id *)&v15->_errors, a4);
    objc_storeStrong((id *)&v15->_feedbackFiled, a5);
    v15->_declineCount = a6;
  }

  return v15;
}

- (id)debugDescription
{
  v2 = [(FBKSFeedbackCount *)self swiftObject];
  v3 = [v2 debugDescription];

  return v3;
}

- (FBKSFeedbackCount)initWithSwiftObject:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [FBKSCampaign alloc];
  v5 = [v3 currentCampaign];
  v6 = [(FBKSCampaign *)v4 initWithSwiftObject:v5];

  id v7 = objc_alloc(MEMORY[0x263EFF980]);
  v8 = [v3 feedbackFiled];
  v9 = objc_msgSend(v7, "initWithCapacity:", objc_msgSend(v8, "count"));

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v10 = [v3 feedbackFiled];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v34;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = [[FBKSFeedback alloc] initWithSwiftObject:*(void *)(*((void *)&v33 + 1) + 8 * v14)];
        if (v15) {
          [v9 addObject:v15];
        }

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v12);
  }

  id v16 = objc_alloc(MEMORY[0x263EFF980]);
  objc_super v17 = [v3 errors];
  v18 = objc_msgSend(v16, "initWithCapacity:", objc_msgSend(v17, "count"));

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v19 = [v3 errors];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v30;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v30 != v22) {
          objc_enumerationMutation(v19);
        }
        v24 = [[FBKSCampaignError alloc] initWithSwiftObject:*(void *)(*((void *)&v29 + 1) + 8 * v23)];
        if (v24) {
          [v18 addObject:v24];
        }

        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = [v19 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v21);
  }

  v25 = -[FBKSFeedbackCount initWithCampaign:campaignErrors:feedbackSubmitted:declineCount:](self, "initWithCampaign:campaignErrors:feedbackSubmitted:declineCount:", v6, v18, v9, [v3 declineCount]);
  v26 = v25;
  if (v25) {
    [(FBKSFeedbackCount *)v25 setSwiftObject:v3];
  }

  return v26;
}

+ (void)fetchCountsForFormWithIdentifier:(id)a3 completion:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __65__FBKSFeedbackCount_fetchCountsForFormWithIdentifier_completion___block_invoke;
  v7[3] = &unk_265313190;
  id v8 = v5;
  id v6 = v5;
  +[FBKSFeedbackCount_FrameworkPrivateName fetchCountsForFormWithIdentifier:a3 completion:v7];
}

void __65__FBKSFeedbackCount_fetchCountsForFormWithIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if (v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    if (v9)
    {
      id v6 = [[FBKSFeedbackCount alloc] initWithSwiftObject:v9];
      id v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    }
    else
    {
      uint64_t v8 = *(void *)(a1 + 32);
      FBKSError(-200, @"Unexpected nil FBKSFeedbackCount");
      id v6 = (FBKSFeedbackCount *)objc_claimAutoreleasedReturnValue();
      id v7 = *(void (**)(void))(v8 + 16);
    }
    v7();
  }
}

- (id)description
{
  v2 = [(FBKSFeedbackCount *)self swiftObject];
  id v3 = [v2 description];

  return v3;
}

- (FBKSCampaign)currentCampaign
{
  return self->_currentCampaign;
}

- (NSArray)feedbackFiled
{
  return self->_feedbackFiled;
}

- (NSArray)errors
{
  return self->_errors;
}

- (int64_t)declineCount
{
  return self->_declineCount;
}

- (FBKSFeedbackCount_FrameworkPrivateName)swiftObject
{
  return self->_swiftObject;
}

- (void)setSwiftObject:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swiftObject, 0);
  objc_storeStrong((id *)&self->_errors, 0);
  objc_storeStrong((id *)&self->_feedbackFiled, 0);
  objc_storeStrong((id *)&self->_currentCampaign, 0);
}

@end