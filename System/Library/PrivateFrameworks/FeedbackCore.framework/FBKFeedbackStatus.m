@interface FBKFeedbackStatus
+ (id)entityName;
+ (id)fetchRequest;
- (BOOL)isEmpty;
- (FBKQuestionGroupStub)questionGroupStubRepresentation;
- (NSAttributedString)attributedStringRepresentation;
- (void)setPropertiesFromJSONObject:(id)a3;
@end

@implementation FBKFeedbackStatus

+ (id)entityName
{
  return @"FeedbackStatus";
}

- (void)setPropertiesFromJSONObject:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263EFF9A0] dictionary];
  v6 = [MEMORY[0x263EFF980] array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = [v4 objectForKeyedSubscript:@"status"];
  uint64_t v7 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    v18 = self;
    id v19 = v4;
    v9 = 0;
    uint64_t v10 = *(void *)v22;
    do
    {
      uint64_t v11 = 0;
      v12 = v9;
      do
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v21 + 1) + 8 * v11);
        v9 = [v13 objectForKeyedSubscript:@"key"];

        v14 = [v13 objectForKeyedSubscript:@"value"];
        [v5 setObject:v14 forKeyedSubscript:v9];

        [v6 addObject:v9];
        ++v11;
        v12 = v9;
      }
      while (v8 != v11);
      uint64_t v8 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);

    self = v18;
    id v4 = v19;
  }

  v15 = (void *)[v6 copy];
  [(FBKFeedbackStatus *)self setOrderedKeys:v15];

  v16 = (void *)[v5 copy];
  [(FBKFeedbackStatus *)self setStatusPairs:v16];

  v17 = [MEMORY[0x263EFF910] date];
  [(FBKFeedbackStatus *)self setUpdatedAt:v17];
}

- (FBKQuestionGroupStub)questionGroupStubRepresentation
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263EFF980];
  id v4 = [(FBKFeedbackStatus *)self orderedKeys];
  v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = [(FBKFeedbackStatus *)self orderedKeys];
  uint64_t v6 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v23;
    do
    {
      uint64_t v10 = 0;
      uint64_t v11 = v8;
      do
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v22 + 1) + 8 * v10);
        v13 = [FBKQuestionAnswerPair alloc];
        v14 = [(FBKFeedbackStatus *)self statusPairs];
        v15 = [v14 objectForKeyedSubscript:v12];
        uint64_t v8 = [(FBKQuestionAnswerPair *)v13 initWithQuestionText:v12 andAnswerText:v15];

        [v5 addObject:v8];
        ++v10;
        uint64_t v11 = v8;
      }
      while (v7 != v10);
      uint64_t v7 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v7);
  }
  v16 = [FBKQuestionGroupStub alloc];
  v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v18 = [v17 localizedStringForKey:@"STATUS_SECTION_TITLE" value:&stru_26DDF6A30 table:@"CommonStrings"];
  id v19 = [(FBKQuestionGroupStub *)v16 initWithTitle:v18 questions:v5];

  return v19;
}

- (BOOL)isEmpty
{
  if (FBKIsInternalInstall(self, a2))
  {
    v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
    char v4 = [v3 BOOLForKey:@"HideFeedbackStatus"];

    if (v4) {
      return 1;
    }
  }
  uint64_t v6 = [(FBKFeedbackStatus *)self orderedKeys];
  BOOL v5 = [v6 count] == 0;

  return v5;
}

- (NSAttributedString)attributedStringRepresentation
{
  v45[2] = *MEMORY[0x263EF8340];
  if (FBKIsInternalInstall(self, a2)
    && ([MEMORY[0x263EFFA40] standardUserDefaults],
        v3 = objc_claimAutoreleasedReturnValue(),
        int v4 = [v3 BOOLForKey:@"HideFeedbackStatus"],
        v3,
        v4))
  {
    BOOL v5 = +[FBKLog appHandle];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22A36D000, v5, OS_LOG_TYPE_INFO, "DEV: hidding status", buf, 2u);
    }

    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:&stru_26DDF6A30 attributes:0];
  }
  else
  {
    id v7 = objc_alloc_init(MEMORY[0x263F089B8]);
    unint64_t v8 = 0x263F08000uLL;
    if (![(FBKFeedbackStatus *)self isEmpty])
    {
      uint64_t v9 = [MEMORY[0x263F825C8] labelColor];
      uint64_t v10 = *MEMORY[0x263F83570];
      uint64_t v11 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
      uint64_t v12 = [MEMORY[0x263F825C8] secondaryLabelColor];
      uint64_t v13 = [MEMORY[0x263F81708] preferredFontForTextStyle:v10];
      uint64_t v15 = *MEMORY[0x263F814F0];
      v44[0] = *MEMORY[0x263F81500];
      uint64_t v14 = v44[0];
      v44[1] = v15;
      v37 = (void *)v11;
      v38 = (void *)v9;
      v45[0] = v9;
      v45[1] = v11;
      v40 = [NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:2];
      v42[0] = v14;
      v42[1] = v15;
      v35 = (void *)v13;
      v36 = (void *)v12;
      v43[0] = v12;
      v43[1] = v13;
      v39 = [NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:2];
      v16 = [(FBKFeedbackStatus *)self orderedKeys];
      uint64_t v17 = [v16 count];

      if (v17)
      {
        unint64_t v18 = 0;
        do
        {
          id v19 = [(FBKFeedbackStatus *)self orderedKeys];
          v20 = [v19 objectAtIndexedSubscript:v18];

          long long v21 = [(FBKFeedbackStatus *)self statusPairs];
          long long v22 = [v21 objectForKeyedSubscript:v20];

          unint64_t v23 = v8;
          id v24 = objc_alloc(*(Class *)(v8 + 1696));
          long long v25 = [NSString stringWithFormat:@"%@:", v20];
          uint64_t v26 = (void *)[v24 initWithString:v25 attributes:v40];

          [v7 appendAttributedString:v26];
          uint64_t v27 = [NSString stringWithFormat:@" %@", v22];
          v28 = [(FBKFeedbackStatus *)self orderedKeys];
          unint64_t v29 = [v28 count] - 1;

          if (v29 > v18)
          {
            uint64_t v30 = [v27 stringByAppendingString:@"\n"];

            uint64_t v27 = (void *)v30;
          }
          unint64_t v8 = v23;
          v31 = (void *)[objc_alloc(*(Class *)(v23 + 1696)) initWithString:v27 attributes:v39];
          [v7 appendAttributedString:v31];

          ++v18;
          v32 = [(FBKFeedbackStatus *)self orderedKeys];
          unint64_t v33 = [v32 count];
        }
        while (v33 > v18);
      }
    }
    uint64_t v6 = (void *)[objc_alloc(*(Class *)(v8 + 1696)) initWithAttributedString:v7];
  }

  return (NSAttributedString *)v6;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"FeedbackStatus"];
}

@end