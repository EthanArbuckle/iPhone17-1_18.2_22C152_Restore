@interface FBKFormResponse
+ (id)entityName;
+ (id)keyPathsForValuesAffectingFollowupCount;
+ (id)keyPathsForValuesAffectingIssueType;
+ (id)keyPathsForValuesAffectingIssueTypeAnswer;
+ (id)keyPathsForValuesAffectingProblemDescription;
+ (id)keyPathsForValuesAffectingProblemDescriptionAnswer;
+ (id)keyPathsForValuesAffectingTitle;
+ (id)keyPathsForValuesAffectingTitleAnswer;
- (BOOL)collectsFiles;
- (BOOL)evaluateConditional:(id)a3;
- (BOOL)isAnswerExpectedForQuestion:(id)a3;
- (BOOL)isCompleted;
- (FBKAnswer)issueTypeAnswer;
- (FBKAnswer)problemDescriptionAnswer;
- (FBKAnswer)titleAnswer;
- (NSNumber)followupCount;
- (NSString)issueType;
- (NSString)platform;
- (NSString)problemDescription;
- (NSString)title;
- (id)answerForQuestion:(id)a3;
- (id)answerForQuestionID:(id)a3;
- (id)answersDictionary;
- (id)fileMatchers;
- (id)findAnswerForRole:(id)a3;
- (id)formPlatform;
- (id)matcherPredicates;
- (id)valueForQuestionID:(id)a3;
- (id)valuesForQuestionID:(id)a3;
- (int64_t)filerFormType;
- (void)prepareForDeletion;
- (void)setCompleted:(BOOL)a3;
- (void)setFilerFormType:(int64_t)a3;
- (void)setPropertiesFromJSONObject:(id)a3;
- (void)setValue:(id)a3 forQuestionID:(id)a4;
- (void)updateExtractedValuesFromAnswers;
@end

@implementation FBKFormResponse

+ (id)entityName
{
  return @"FormResponse";
}

- (void)setPropertiesFromJSONObject:(id)a3
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(FBKFormResponse *)self setRemote:1];
  v5 = [v4 objectForKeyedSubscript:@"created_at"];
  v6 = FBKNilIfNSNull(v5);

  if (v6)
  {
    v7 = FBKDateFromServerString(v6);
    [(FBKFormResponse *)self setCreatedAt:v7];
  }
  else
  {
    [(FBKFormResponse *)self setCreatedAt:0];
  }
  v8 = [v4 objectForKeyedSubscript:@"updated_at"];
  v9 = FBKNilIfNSNull(v8);

  if (v9)
  {
    v10 = FBKDateFromServerString(v9);
  }
  else
  {
    v10 = 0;
  }
  v11 = [v4 objectForKeyedSubscript:@"for_build"];
  uint64_t v12 = FBKNilIfNSNull(v11);

  if (v12) {
    [(FBKFormResponse *)self setBuildString:v12];
  }
  v75 = (void *)v12;
  v13 = [v4 objectForKeyedSubscript:@"form_id"];
  v14 = FBKNilIfNSNull(v13);
  [(FBKFormResponse *)self setFormID:v14];

  v15 = [v4 objectForKeyedSubscript:@"answers"];

  v71 = v10;
  if (!v15)
  {
    v32 = [(FBKFormResponse *)self updatedAt];
    v33 = v32;
    if (v32 && v10)
    {
      v34 = [(FBKFormResponse *)self answers];
      uint64_t v35 = [v34 count];

      if (v35)
      {
        v36 = [(FBKFormResponse *)self updatedAt];
        uint64_t v37 = [v10 compare:v36];
        unsigned int v38 = [(FBKFormResponse *)self isStub];
        if (v37 == 1) {
          uint64_t v39 = 1;
        }
        else {
          uint64_t v39 = v38;
        }
        [(FBKFormResponse *)self setIsStub:v39];

        goto LABEL_29;
      }
    }
    else
    {
    }
    [(FBKFormResponse *)self setIsStub:1];
    goto LABEL_29;
  }
  v16 = [v4 objectForKeyedSubscript:@"form_id"];

  if (v16)
  {
    v17 = NSNumber;
    v18 = [v4 objectForKeyedSubscript:@"form_id"];
    v19 = objc_msgSend(v17, "numberWithInteger:", objc_msgSend(v18, "integerValue"));

    v20 = [(FBKFormResponse *)self managedObjectContext];
    v16 = [v20 feedbackObjectWithEntityName:@"BugForm" remoteID:v19 creatingIfNeeded:0];
  }
  v21 = objc_msgSend(v4, "objectForKeyedSubscript:", @"answers", v9, v6);
  v22 = [(FBKFormResponse *)self managedObjectContext];
  v23 = +[FBKManagedFeedbackObject importFromJSONArray:v21 intoContext:v22];
  [(FBKFormResponse *)self setAnswers:v23];

  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  v24 = [(FBKFormResponse *)self answers];
  uint64_t v25 = [v24 countByEnumeratingWithState:&v77 objects:v81 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v78;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v78 != v27) {
          objc_enumerationMutation(v24);
        }
        v29 = *(void **)(*((void *)&v77 + 1) + 8 * i);
        v30 = [v29 questionID];
        v31 = [v16 questionForQuestionID:v30];
        [v29 setQuestion:v31];
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v77 objects:v81 count:16];
    }
    while (v26);
  }

  [(FBKFormResponse *)self setIsStub:0];
  v9 = v69;
  v6 = v70;
  v10 = v71;
LABEL_29:
  [(FBKFormResponse *)self setUpdatedAt:v10];
  v40 = [v4 objectForKeyedSubscript:@"short_description"];

  if (v40)
  {
    v41 = [v4 objectForKeyedSubscript:@"short_description"];
    v42 = [MEMORY[0x263EFF9D0] null];

    if (v41 == v42)
    {
      v43 = &stru_26DDF6A30;
    }
    else
    {
      v43 = [v4 objectForKeyedSubscript:@"short_description"];
    }
    [(FBKFormResponse *)self setExtractedProblemDescription:v43];
  }
  v44 = [v4 objectForKeyedSubscript:@"title"];
  uint64_t v45 = FBKNilIfNSNull(v44);

  if (v45) {
    [(FBKFormResponse *)self setExtractedTitle:v45];
  }
  v46 = [v4 objectForKeyedSubscript:@"feedback_ident"];
  uint64_t v47 = FBKNilIfNSNull(v46);

  if (v47) {
    [(FBKFormResponse *)self setFeedbackID:v47];
  }
  v48 = [v4 objectForKeyedSubscript:@"answers_complete"];
  v49 = FBKNilIfNSNull(v48);

  v76 = v49;
  if (v49 && [v49 BOOLValue]) {
    [(FBKFormResponse *)self setCompleted:1];
  }
  v74 = (void *)v45;
  v50 = [v4 objectForKeyedSubscript:@"area_type"];
  v51 = v50;
  if (v50)
  {
    v52 = FBKNilIfNSNull(v50);
    [(FBKFormResponse *)self setExtractedIssueType:v52];
  }
  v72 = v51;
  v53 = [v4 objectForKeyedSubscript:@"followup_count"];
  if (v53)
  {
    v54 = [MEMORY[0x263EFF9D0] null];

    if (v53 != v54)
    {
      uint64_t v55 = [(FBKFormResponse *)self extractedFollowupCount];
      if (!v55
        || (v56 = (void *)v55,
            [(FBKFormResponse *)self extractedFollowupCount],
            v57 = objc_claimAutoreleasedReturnValue(),
            uint64_t v58 = [v57 compare:v53],
            v57,
            v56,
            v58))
      {
        [(FBKFormResponse *)self setIsStub:1];
      }
      [(FBKFormResponse *)self setExtractedFollowupCount:v53];
    }
  }
  v59 = [v4 objectForKeyedSubscript:@"large_file_prefix"];
  v60 = FBKNilIfNSNull(v59);

  if (v60)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(FBKFormResponse *)self setLargeFilePrefix:v60];
    }
  }
  v73 = (void *)v47;
  v61 = [v4 objectForKeyedSubscript:@"is_complete"];
  v62 = FBKNilIfNSNull(v61);

  if (v62)
  {
    -[FBKFormResponse setServerSideIsComplete:](self, "setServerSideIsComplete:", [v62 BOOLValue]);
    -[FBKFormResponse setCompleted:](self, "setCompleted:", [v62 BOOLValue]);
  }
  v63 = [v4 objectForKeyedSubscript:@"file_promises"];
  v64 = FBKNilIfNSNull(v63);

  if (v64)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(FBKFormResponse *)self managedObjectContext];
      v65 = v9;
      v67 = v66 = v6;
      v68 = +[FBKManagedFeedbackObject importFromJSONArray:v64 intoContext:v67];
      [(FBKFormResponse *)self setFilePromises:v68];

      v6 = v66;
      v9 = v65;
      v10 = v71;
    }
  }
}

- (BOOL)isCompleted
{
  [(FBKFormResponse *)self willAccessValueForKey:@"completed"];
  v3 = [(FBKFormResponse *)self primitiveCompleted];
  char v4 = [v3 BOOLValue];

  [(FBKFormResponse *)self didAccessValueForKey:@"completed"];
  return v4;
}

- (void)setCompleted:(BOOL)a3
{
  BOOL v3 = a3;
  [(FBKFormResponse *)self willChangeValueForKey:@"completed"];
  v5 = [NSNumber numberWithBool:v3];
  [(FBKFormResponse *)self setPrimitiveCompleted:v5];

  [(FBKFormResponse *)self didChangeValueForKey:@"completed"];
}

- (id)answersDictionary
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  BOOL v3 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:10];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  char v4 = [(FBKFormResponse *)self bugForm];
  v5 = [v4 questionGroups];

  id obj = v5;
  uint64_t v23 = [v5 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v23)
  {
    uint64_t v22 = *(void *)v30;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v30 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = v6;
        v7 = *(void **)(*((void *)&v29 + 1) + 8 * v6);
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        v8 = [v7 questions];
        uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v26;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v26 != v11) {
                objc_enumerationMutation(v8);
              }
              v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
              id v14 = objc_alloc(MEMORY[0x263EFF8C0]);
              v15 = [(FBKFormResponse *)self answerForQuestion:v13];
              v16 = [v15 values];
              v17 = (void *)[v14 initWithArray:v16 copyItems:1];

              v18 = [v13 role];
              [v3 setObject:v17 forKey:v18];
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v33 count:16];
          }
          while (v10);
        }

        uint64_t v6 = v24 + 1;
      }
      while (v24 + 1 != v23);
      uint64_t v23 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v23);
  }

  v19 = (void *)[v3 copy];

  return v19;
}

- (id)answerForQuestion:(id)a3
{
  char v4 = [a3 answers];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __37__FBKFormResponse_answerForQuestion___block_invoke;
  v7[3] = &unk_264873E68;
  v7[4] = self;
  v5 = objc_msgSend(v4, "ded_findWithBlock:", v7);

  return v5;
}

uint64_t __37__FBKFormResponse_answerForQuestion___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 formResponse];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (id)answerForQuestionID:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [MEMORY[0x263F08A98] predicateWithFormat:@"questionID = %@", v4];
    uint64_t v6 = [(FBKFormResponse *)self answers];
    v7 = [v6 filteredSetUsingPredicate:v5];

    v8 = [v7 allObjects];
    uint64_t v9 = [v8 firstObject];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (void)updateExtractedValuesFromAnswers
{
  BOOL v3 = [(FBKFormResponse *)self bugForm];
  id v4 = [v3 questionWithRole:@":title"];
  v5 = [v4 ID];
  uint64_t v6 = [(FBKFormResponse *)self valueForQuestionID:v5];
  [(FBKFormResponse *)self setExtractedTitle:v6];

  v7 = [(FBKFormResponse *)self bugForm];
  v8 = [v7 questionWithRole:@":description"];
  uint64_t v9 = [v8 ID];
  uint64_t v10 = [(FBKFormResponse *)self valueForQuestionID:v9];
  [(FBKFormResponse *)self setExtractedProblemDescription:v10];

  id v14 = [(FBKFormResponse *)self bugForm];
  uint64_t v11 = [v14 questionWithRole:@":type"];
  uint64_t v12 = [v11 ID];
  v13 = [(FBKFormResponse *)self valueForQuestionID:v12];
  [(FBKFormResponse *)self setExtractedIssueType:v13];
}

- (id)valueForQuestionID:(id)a3
{
  id v4 = [MEMORY[0x263F08A98] predicateWithFormat:@"questionID = %@", a3];
  v5 = [(FBKFormResponse *)self answers];
  uint64_t v6 = [v5 filteredSetUsingPredicate:v4];

  v7 = [v6 allObjects];
  v8 = [v7 firstObject];
  uint64_t v9 = [v8 value];

  return v9;
}

- (id)valuesForQuestionID:(id)a3
{
  id v4 = [MEMORY[0x263F08A98] predicateWithFormat:@"questionID = %@", a3];
  v5 = [(FBKFormResponse *)self answers];
  uint64_t v6 = [v5 filteredSetUsingPredicate:v4];

  v7 = [v6 allObjects];
  v8 = [v7 firstObject];
  uint64_t v9 = [v8 values];

  return v9;
}

- (void)setValue:(id)a3 forQuestionID:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v8 = [(FBKFormResponse *)self answers];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v14 = [v13 questionID];
        int v15 = [v14 isEqual:v7];

        if (v15)
        {
          [v13 setValue:v6];
          goto LABEL_11;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

+ (id)keyPathsForValuesAffectingTitleAnswer
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:@"titleAnswers"];
}

- (FBKAnswer)titleAnswer
{
  v2 = [(FBKFormResponse *)self titleAnswers];
  BOOL v3 = [v2 lastObject];

  return (FBKAnswer *)v3;
}

+ (id)keyPathsForValuesAffectingTitle
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"titleAnswer.value", @"extractedTitle", 0);
}

- (NSString)title
{
  [(FBKFormResponse *)self willAccessValueForKey:@"title"];
  BOOL v3 = [(FBKFormResponse *)self titleAnswer];

  if (v3)
  {
    id v4 = [(FBKFormResponse *)self titleAnswer];
    v5 = [v4 value];
  }
  else
  {
    v5 = [(FBKFormResponse *)self extractedTitle];
  }
  [(FBKFormResponse *)self didAccessValueForKey:@"title"];

  return (NSString *)v5;
}

+ (id)keyPathsForValuesAffectingProblemDescriptionAnswer
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:@"problemDescriptionAnswers"];
}

- (FBKAnswer)problemDescriptionAnswer
{
  v2 = [(FBKFormResponse *)self problemDescriptionAnswers];
  BOOL v3 = [v2 lastObject];

  return (FBKAnswer *)v3;
}

+ (id)keyPathsForValuesAffectingProblemDescription
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"problemDescriptionAnswer.value", @"extractedProblemDescription", 0);
}

- (NSString)problemDescription
{
  [(FBKFormResponse *)self willAccessValueForKey:@"problemDescription"];
  BOOL v3 = [(FBKFormResponse *)self problemDescriptionAnswer];

  if (v3)
  {
    id v4 = [(FBKFormResponse *)self problemDescriptionAnswer];
    v5 = [v4 value];
  }
  else
  {
    v5 = [(FBKFormResponse *)self extractedProblemDescription];
  }
  [(FBKFormResponse *)self didAccessValueForKey:@"problemDescription"];

  return (NSString *)v5;
}

+ (id)keyPathsForValuesAffectingIssueTypeAnswer
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:@"issueTypeAnswers"];
}

- (FBKAnswer)issueTypeAnswer
{
  v2 = [(FBKFormResponse *)self issueTypeAnswers];
  BOOL v3 = [v2 lastObject];

  return (FBKAnswer *)v3;
}

+ (id)keyPathsForValuesAffectingIssueType
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"issueTypeAnswer.value", @"extractedIssueType", 0);
}

- (NSString)issueType
{
  [(FBKFormResponse *)self willAccessValueForKey:@"issueType"];
  BOOL v3 = [(FBKFormResponse *)self issueTypeAnswer];

  if (v3)
  {
    id v4 = [(FBKFormResponse *)self issueTypeAnswer];
    v5 = [v4 value];
  }
  else
  {
    v5 = [(FBKFormResponse *)self extractedIssueType];
  }
  [(FBKFormResponse *)self didAccessValueForKey:@"issueType"];

  return (NSString *)v5;
}

+ (id)keyPathsForValuesAffectingFollowupCount
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"feedback.feedbackFollowups.@count", @"extractedFollowupCount", 0);
}

- (NSNumber)followupCount
{
  [(FBKFormResponse *)self willAccessValueForKey:@"followupCount"];
  BOOL v3 = [(FBKFormResponse *)self feedback];
  id v4 = [v3 feedbackFollowups];

  if (v4)
  {
    v5 = NSNumber;
    id v6 = [(FBKFormResponse *)self feedback];
    id v7 = [v6 feedbackFollowups];
    v8 = objc_msgSend(v5, "numberWithInteger:", objc_msgSend(v7, "count"));
  }
  else
  {
    v8 = [(FBKFormResponse *)self extractedFollowupCount];
  }
  [(FBKFormResponse *)self didAccessValueForKey:@"followupCount"];

  return (NSNumber *)v8;
}

- (void)prepareForDeletion
{
  v6.receiver = self;
  v6.super_class = (Class)FBKFormResponse;
  [(FBKFormResponse *)&v6 prepareForDeletion];
  BOOL v3 = [(FBKFormResponse *)self filerFormID];

  if (v3)
  {
    id v4 = +[FBKFileManager draftDirectoryForFilerForm:self];
    v5 = [MEMORY[0x263F08850] defaultManager];
    [v5 removeItemAtURL:v4 error:0];
  }
}

- (int64_t)filerFormType
{
  return 0;
}

- (NSString)platform
{
  v2 = [(FBKFormResponse *)self bugForm];
  BOOL v3 = [v2 platform];

  return (NSString *)v3;
}

- (id)formPlatform
{
  v2 = [(FBKFormResponse *)self bugForm];
  BOOL v3 = [v2 platform];

  return v3;
}

- (BOOL)collectsFiles
{
  v2 = [(FBKFormResponse *)self bugForm];
  char v3 = [v2 collectsFiles];

  return v3;
}

- (id)findAnswerForRole:(id)a3
{
  id v4 = a3;
  v5 = [(FBKFormResponse *)self bugForm];
  objc_super v6 = [v5 questionWithRole:v4];

  id v7 = [(FBKFormResponse *)self answerForQuestion:v6];
  v8 = [v7 value];

  return v8;
}

- (BOOL)evaluateConditional:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 count];
  objc_super v6 = [v4 objectAtIndexedSubscript:0];
  if (v5 == 1)
  {
    LOBYTE(v7) = [(FBKFormResponse *)self evaluateConditional:v6];
    goto LABEL_25;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v9 = NSNumber;
    objc_super v6 = [v4 objectAtIndexedSubscript:0];
    uint64_t v10 = objc_msgSend(v9, "numberWithBool:", -[FBKFormResponse evaluateConditional:](self, "evaluateConditional:", v6));
  }
  else
  {
    uint64_t v11 = [v4 objectAtIndexedSubscript:0];
    objc_opt_class();
    char v12 = objc_opt_isKindOfClass();

    objc_super v6 = [v4 objectAtIndexedSubscript:0];
    if (v12) {
      goto LABEL_8;
    }
    uint64_t v10 = [(FBKFormResponse *)self findAnswerForRole:v6];
  }
  v13 = (void *)v10;

  objc_super v6 = v13;
LABEL_8:
  id v14 = [v4 objectAtIndexedSubscript:1];
  int v15 = [v4 objectAtIndexedSubscript:2];
  objc_opt_class();
  char v16 = objc_opt_isKindOfClass();

  if (v16)
  {
    long long v17 = NSNumber;
    long long v18 = [v4 objectAtIndexedSubscript:2];
    long long v19 = objc_msgSend(v17, "numberWithBool:", -[FBKFormResponse evaluateConditional:](self, "evaluateConditional:", v18));
  }
  else
  {
    long long v19 = [v4 objectAtIndexedSubscript:2];
  }
  if ([v14 isEqualToString:@":=="])
  {
    uint64_t v20 = [v6 isEqualToString:v19];
  }
  else
  {
    if ([v14 isEqualToString:@":!="])
    {
      uint64_t v7 = [v6 isEqualToString:v19] ^ 1;
      goto LABEL_22;
    }
    if ([v14 isEqualToString:@":and"])
    {
      if (![v6 BOOLValue])
      {
        uint64_t v7 = 0;
        goto LABEL_22;
      }
    }
    else if (![v14 isEqualToString:@":or"] {
           || ([v6 BOOLValue] & 1) != 0)
    }
    {
      uint64_t v7 = 1;
      goto LABEL_22;
    }
    uint64_t v20 = [v19 BOOLValue];
  }
  uint64_t v7 = v20;
LABEL_22:
  if ([v4 count] != 3)
  {
    uint64_t v21 = (void *)MEMORY[0x263EFF8C0];
    uint64_t v7 = [NSNumber numberWithBool:v7];
    uint64_t v22 = [v21 arrayWithObject:v7];
    uint64_t v23 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", 3, objc_msgSend(v4, "count") - 3);
    uint64_t v24 = [v4 objectsAtIndexes:v23];
    long long v25 = [v22 arrayByAddingObjectsFromArray:v24];

    LOBYTE(v7) = [(FBKFormResponse *)self evaluateConditional:v25];
  }

LABEL_25:
  return v7;
}

- (BOOL)isAnswerExpectedForQuestion:(id)a3
{
  id v4 = a3;
  if ([v4 isConditional])
  {
    uint64_t v5 = [v4 conditions];

    if (v5)
    {
      objc_super v6 = [v4 conditions];
      char v7 = [(FBKFormResponse *)self evaluateConditional:v6];
LABEL_10:

      goto LABEL_11;
    }
    v8 = [v4 conditionQuestionID];

    if (v8)
    {
      uint64_t v9 = [v4 conditionQuestionID];
      objc_super v6 = [(FBKFormResponse *)self valueForQuestionID:v9];

      uint64_t v10 = [v4 conditionValue];
      if (v6 == v10) {
        char v7 = 1;
      }
      else {
        char v7 = [v6 isEqual:v10];
      }

      goto LABEL_10;
    }
  }
  char v7 = 1;
LABEL_11:

  return v7;
}

- (id)matcherPredicates
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  char v3 = [MEMORY[0x263EFF9C0] set];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v4 = [(FBKFormResponse *)self bugForm];
  uint64_t v5 = [v4 filePredicates];

  id obj = v5;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v27;
    uint64_t v19 = *(void *)v27;
    do
    {
      uint64_t v9 = 0;
      uint64_t v20 = v7;
      do
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v26 + 1) + 8 * v9);
        if ([v10 satisfiedBy:self])
        {
          uint64_t v11 = self;
          long long v24 = 0u;
          long long v25 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          char v12 = [v10 matchers];
          uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v30 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v23;
            do
            {
              for (uint64_t i = 0; i != v14; ++i)
              {
                if (*(void *)v23 != v15) {
                  objc_enumerationMutation(v12);
                }
                long long v17 = [[FBKMatcherPredicate alloc] initWithFileMatcher:*(void *)(*((void *)&v22 + 1) + 8 * i) filePredicate:v10];
                [v3 addObject:v17];
              }
              uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v30 count:16];
            }
            while (v14);
          }

          self = v11;
          uint64_t v8 = v19;
          uint64_t v7 = v20;
        }
        ++v9;
      }
      while (v9 != v7);
      uint64_t v7 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v7);
  }

  return v3;
}

- (id)fileMatchers
{
  v2 = [(FBKFormResponse *)self matcherPredicates];
  char v3 = objc_msgSend(v2, "ded_flatMapWithBlock:", &__block_literal_global_1);

  return v3;
}

uint64_t __31__FBKFormResponse_fileMatchers__block_invoke(uint64_t a1, void *a2)
{
  return [a2 fileMatcher];
}

- (void)setFilerFormType:(int64_t)a3
{
  self->_filerFormType = a3;
}

@end