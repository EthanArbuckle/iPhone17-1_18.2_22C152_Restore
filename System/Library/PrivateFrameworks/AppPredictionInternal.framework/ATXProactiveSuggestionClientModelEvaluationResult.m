@interface ATXProactiveSuggestionClientModelEvaluationResult
+ (int64_t)rankOfEngagedSuggestion:(id)a3 inSuggestions:(id)a4;
- (ATXProactiveSuggestionClientModelEvaluationResult)initWithSessionType:(unint64_t)a3 executableType:(int64_t)a4 removeDockedApps:(BOOL)a5;
- (BOOL)removeDockedApps;
- (NSMutableDictionary)engagedInTop4PerCandidate;
- (NSMutableDictionary)engagedInTop8PerCandidate;
- (NSMutableDictionary)engagedPerCandidate;
- (NSMutableDictionary)shownInTop8PerCandidate;
- (float)reciprocalRank;
- (id)description;
- (id)filteredSuggestions:(id)a3 removeDockedApps:(BOOL)a4;
- (int64_t)executableType;
- (unint64_t)engagedInTop1;
- (unint64_t)engagedInTop2;
- (unint64_t)engagedInTop4;
- (unint64_t)engagedInTop8;
- (unint64_t)numberOfSessions;
- (unint64_t)numberOfSessionsWithPredictions;
- (unint64_t)sessionType;
- (void)setEngagedInTop1:(unint64_t)a3;
- (void)setEngagedInTop2:(unint64_t)a3;
- (void)setEngagedInTop4:(unint64_t)a3;
- (void)setEngagedInTop4PerCandidate:(id)a3;
- (void)setEngagedInTop8:(unint64_t)a3;
- (void)setEngagedInTop8PerCandidate:(id)a3;
- (void)setEngagedPerCandidate:(id)a3;
- (void)setNumberOfSessions:(unint64_t)a3;
- (void)setNumberOfSessionsWithPredictions:(unint64_t)a3;
- (void)setReciprocalRank:(float)a3;
- (void)setShownInTop8PerCandidate:(id)a3;
- (void)updateCountsForSessionsWithShownSuggestions:(id)a3 engagedSuggestions:(id)a4 rejectedSuggestions:(id)a5;
@end

@implementation ATXProactiveSuggestionClientModelEvaluationResult

- (ATXProactiveSuggestionClientModelEvaluationResult)initWithSessionType:(unint64_t)a3 executableType:(int64_t)a4 removeDockedApps:(BOOL)a5
{
  v22.receiver = self;
  v22.super_class = (Class)ATXProactiveSuggestionClientModelEvaluationResult;
  v8 = [(ATXProactiveSuggestionClientModelEvaluationResult *)&v22 init];
  v9 = v8;
  if (v8)
  {
    v8->_sessionType = a3;
    v8->_executableType = a4;
    v8->_removeDockedApps = a5;
    v10 = +[_ATXAppIconState sharedInstance];
    uint64_t v11 = [v10 allDockedApps];
    dockedApps = v9->_dockedApps;
    v9->_dockedApps = (NSSet *)v11;

    uint64_t v13 = objc_opt_new();
    engagedInTop4PerCandidate = v9->_engagedInTop4PerCandidate;
    v9->_engagedInTop4PerCandidate = (NSMutableDictionary *)v13;

    uint64_t v15 = objc_opt_new();
    engagedInTop8PerCandidate = v9->_engagedInTop8PerCandidate;
    v9->_engagedInTop8PerCandidate = (NSMutableDictionary *)v15;

    uint64_t v17 = objc_opt_new();
    shownInTop8PerCandidate = v9->_shownInTop8PerCandidate;
    v9->_shownInTop8PerCandidate = (NSMutableDictionary *)v17;

    uint64_t v19 = objc_opt_new();
    engagedPerCandidate = v9->_engagedPerCandidate;
    v9->_engagedPerCandidate = (NSMutableDictionary *)v19;
  }
  return v9;
}

- (void)updateCountsForSessionsWithShownSuggestions:(id)a3 engagedSuggestions:(id)a4 rejectedSuggestions:(id)a5
{
  id v50 = a3;
  id v7 = a4;
  if ([v7 count])
  {
    v8 = [v7 objectAtIndexedSubscript:0];
    if ([v8 executableType] != self->_executableType
      || self->_removeDockedApps
      && (dockedApps = self->_dockedApps,
          [v8 executableIdentifier],
          v10 = objc_claimAutoreleasedReturnValue(),
          LOBYTE(dockedApps) = [(NSSet *)dockedApps containsObject:v10],
          v10,
          (dockedApps & 1) != 0))
    {
LABEL_35:

      goto LABEL_36;
    }
    BOOL v11 = objc_msgSend(MEMORY[0x1E4F4B680], "consumerTypeForSubType:", objc_msgSend(v8, "consumerSubType")) == 14
       && self->_executableType == 1;
    uint64_t v12 = self->_removeDockedApps || v11;
    uint64_t v13 = [(ATXProactiveSuggestionClientModelEvaluationResult *)self filteredSuggestions:v50 removeDockedApps:v12];
    uint64_t v14 = [(id)objc_opt_class() rankOfEngagedSuggestion:v8 inSuggestions:v13];
    if (v14 != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t engagedInTop1 = self->_engagedInTop1;
      unint64_t engagedInTop2 = self->_engagedInTop2;
      if (!v14) {
        ++engagedInTop1;
      }
      if (v14 < 2) {
        ++engagedInTop2;
      }
      self->_unint64_t engagedInTop1 = engagedInTop1;
      self->_unint64_t engagedInTop2 = engagedInTop2;
      unint64_t engagedInTop4 = self->_engagedInTop4;
      unint64_t engagedInTop8 = self->_engagedInTop8;
      if (v14 < 4) {
        ++engagedInTop4;
      }
      if (v14 < 8) {
        ++engagedInTop8;
      }
      self->_unint64_t engagedInTop4 = engagedInTop4;
      self->_unint64_t engagedInTop8 = engagedInTop8;
      self->_reciprocalRank = (float)(1.0 / (float)(v14 + 1)) + self->_reciprocalRank;
      if (v14 <= 3)
      {
        uint64_t v19 = NSNumber;
        engagedInTop4PerCandidate = self->_engagedInTop4PerCandidate;
        v21 = [v8 executableIdentifier];
        objc_super v22 = [(NSMutableDictionary *)engagedInTop4PerCandidate objectForKeyedSubscript:v21];
        v23 = objc_msgSend(v19, "numberWithInt:", objc_msgSend(v22, "intValue") + 1);
        v24 = self->_engagedInTop4PerCandidate;
        v25 = [v8 executableIdentifier];
        [(NSMutableDictionary *)v24 setObject:v23 forKeyedSubscript:v25];

LABEL_23:
        v26 = NSNumber;
        engagedInTop8PerCandidate = self->_engagedInTop8PerCandidate;
        v28 = [v8 executableIdentifier];
        v29 = [(NSMutableDictionary *)engagedInTop8PerCandidate objectForKeyedSubscript:v28];
        v30 = objc_msgSend(v26, "numberWithInt:", objc_msgSend(v29, "intValue") + 1);
        v31 = self->_engagedInTop8PerCandidate;
        v32 = [v8 executableIdentifier];
        [(NSMutableDictionary *)v31 setObject:v30 forKeyedSubscript:v32];

        goto LABEL_24;
      }
      if (v14 <= 7) {
        goto LABEL_23;
      }
    }
LABEL_24:
    v33 = NSNumber;
    engagedPerCandidate = self->_engagedPerCandidate;
    v35 = [v8 executableIdentifier];
    v36 = [(NSMutableDictionary *)engagedPerCandidate objectForKeyedSubscript:v35];
    v37 = objc_msgSend(v33, "numberWithInt:", objc_msgSend(v36, "intValue") + 1);
    v38 = self->_engagedPerCandidate;
    v39 = [v8 executableIdentifier];
    [(NSMutableDictionary *)v38 setObject:v37 forKeyedSubscript:v39];

    unint64_t v40 = [v13 count];
    uint64_t v41 = 8;
    if (v40 < 8) {
      uint64_t v41 = v40;
    }
    if (v41)
    {
      for (unint64_t i = 0; i < v49; ++i)
      {
        v43 = [v13 objectAtIndexedSubscript:i];
        v44 = [v43 executableIdentifier];

        v45 = NSNumber;
        v46 = [(NSMutableDictionary *)self->_shownInTop8PerCandidate objectForKeyedSubscript:v44];
        v47 = objc_msgSend(v45, "numberWithInt:", objc_msgSend(v46, "intValue") + 1);
        [(NSMutableDictionary *)self->_shownInTop8PerCandidate setObject:v47 forKeyedSubscript:v44];

        unint64_t v48 = [v13 count];
        if (v48 >= 8) {
          unint64_t v49 = 8;
        }
        else {
          unint64_t v49 = v48;
        }
      }
    }
    if ([v13 count]) {
      ++self->_numberOfSessionsWithPredictions;
    }
    ++self->_numberOfSessions;

    goto LABEL_35;
  }
LABEL_36:
}

+ (int64_t)rankOfEngagedSuggestion:(id)a3 inSuggestions:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (![v6 count])
  {
LABEL_8:
    int64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_9;
  }
  int64_t v7 = 0;
  while (1)
  {
    v8 = [v6 objectAtIndexedSubscript:v7];
    v9 = [v8 executableIdentifier];
    v10 = [v5 executableIdentifier];
    if (![v9 isEqualToString:v10])
    {

      goto LABEL_7;
    }
    uint64_t v11 = [v5 executableType];
    uint64_t v12 = [v8 executableType];

    if (v11 == v12) {
      break;
    }
LABEL_7:

    if (++v7 >= (unint64_t)[v6 count]) {
      goto LABEL_8;
    }
  }

LABEL_9:
  return v7;
}

- (id)filteredSuggestions:(id)a3 removeDockedApps:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int64_t v7 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (v4)
        {
          dockedApps = self->_dockedApps;
          uint64_t v15 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "executableIdentifier", (void)v18);
          BOOL v16 = [(NSSet *)dockedApps containsObject:v15];
        }
        else
        {
          BOOL v16 = 0;
        }
        if (objc_msgSend(v13, "executableType", (void)v18) == self->_executableType && !v16) {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  return v7;
}

- (id)description
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  v3 = [(NSMutableDictionary *)self->_shownInTop8PerCandidate keysSortedByValueUsingComparator:&__block_literal_global_76];
  unint64_t v4 = [(NSMutableDictionary *)self->_shownInTop8PerCandidate count];
  if (v4 >= 0x14) {
    uint64_t v5 = 20;
  }
  else {
    uint64_t v5 = v4;
  }
  id v6 = objc_msgSend(v3, "subarrayWithRange:", 0, v5);

  int64_t v7 = objc_opt_new();
  unint64_t sessionType = self->_sessionType;
  if (sessionType)
  {
    if (sessionType == 1)
    {
      uint64_t v9 = @"UI";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %lu)", self->_sessionType);
      uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    uint64_t v9 = @"Shadow";
  }
  [v7 appendFormat:@"Session Type: %@\n", v9];

  unint64_t executableType = self->_executableType;
  if (executableType >= 0xC)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %li)", self->_executableType);
    uint64_t v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v11 = off_1E68AF988[executableType];
  }
  [v7 appendFormat:@"Suggestion Type: %@\n", v11];

  if (self->_executableType == 1)
  {
    if (self->_removeDockedApps) {
      dockedApps = self->_dockedApps;
    }
    else {
      dockedApps = (NSSet *)@"None";
    }
    [v7 appendFormat:@"Docked Apps Removed: %@\n", dockedApps];
  }
  objc_msgSend(v7, "appendFormat:", @"Success@1: %.02f\n", (float)((float)self->_engagedInTop1 / (float)self->_numberOfSessionsWithPredictions));
  objc_msgSend(v7, "appendFormat:", @"Success@2: %.02f\n", (float)((float)self->_engagedInTop2 / (float)self->_numberOfSessionsWithPredictions));
  objc_msgSend(v7, "appendFormat:", @"Success@4: %.02f\n", (float)((float)self->_engagedInTop4 / (float)self->_numberOfSessionsWithPredictions));
  objc_msgSend(v7, "appendFormat:", @"Success@8: %.02f\n", (float)((float)self->_engagedInTop8 / (float)self->_numberOfSessionsWithPredictions));
  objc_msgSend(v7, "appendFormat:", @"Mean Reciprocal Rank (MRR): %.02f\n", (float)(self->_reciprocalRank / (float)self->_numberOfSessionsWithPredictions));
  objc_msgSend(v7, "appendFormat:", @"# Sessions w predictions: %lu\n", self->_numberOfSessionsWithPredictions);
  objc_msgSend(v7, "appendFormat:", @"# Sessions: %lu\n", self->_numberOfSessions);
  [v7 appendFormat:@"Top predicted candidates:\n"];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v13 = v6;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v40;
    float v17 = 0.0;
    float v18 = 0.0;
    float v19 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v40 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v21 = *(void *)(*((void *)&v39 + 1) + 8 * i);
        objc_super v22 = [(NSMutableDictionary *)self->_engagedInTop8PerCandidate objectForKeyedSubscript:v21];
        [v22 floatValue];
        double v24 = v23;
        v25 = [(NSMutableDictionary *)self->_engagedPerCandidate objectForKeyedSubscript:v21];
        [v25 floatValue];
        *(float *)&double v24 = v24 / (v26 + 0.000001);

        v27 = [(NSMutableDictionary *)self->_engagedInTop8PerCandidate objectForKeyedSubscript:v21];
        [v27 floatValue];
        double v29 = v28;
        v30 = [(NSMutableDictionary *)self->_shownInTop8PerCandidate objectForKeyedSubscript:v21];
        [v30 floatValue];
        *(float *)&double v29 = v29 / (v31 + 0.000001);

        float v32 = (float)(*(float *)&v24 * *(float *)&v29) / ((float)(*(float *)&v24 + *(float *)&v29) + 0.000001)
            + (float)(*(float *)&v24 * *(float *)&v29) / ((float)(*(float *)&v24 + *(float *)&v29) + 0.000001);
        v33 = [(NSMutableDictionary *)self->_engagedPerCandidate objectForKeyedSubscript:v21];
        [v33 floatValue];
        float v35 = v34 / (float)self->_numberOfSessions;

        float v19 = v19 + v32;
        float v18 = v18 + (float)(v32 * v35);
        float v17 = v17 + v35;
        v36 = [(NSMutableDictionary *)self->_shownInTop8PerCandidate objectForKeyedSubscript:v21];
        [v36 floatValue];
        objc_msgSend(v7, "appendFormat:", @"\t launched: %.02f; shown %.02f; precision %.02f; recall %.02f; f1 %.02f; candidate: %@\n",
          v35,
          (float)(v37 / (float)self->_numberOfSessions),
          *(float *)&v29,
          *(float *)&v24,
          v32,
          v21,
          (void)v39);
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v15);
  }
  else
  {
    float v17 = 0.0;
    float v18 = 0.0;
    float v19 = 0.0;
  }

  objc_msgSend(v7, "appendFormat:", @"\tAverage F1 Score in top predicted candidates: %.02f\n", (float)(v19 / (float)(unint64_t)objc_msgSend(v13, "count")));
  objc_msgSend(v7, "appendFormat:", @"\tLaunch-weighted Average F1 Score for top predicted candidates: %.02f\n", (float)(v18 / v17));

  return v7;
}

uint64_t __64__ATXProactiveSuggestionClientModelEvaluationResult_description__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

- (unint64_t)sessionType
{
  return self->_sessionType;
}

- (int64_t)executableType
{
  return self->_executableType;
}

- (BOOL)removeDockedApps
{
  return self->_removeDockedApps;
}

- (unint64_t)engagedInTop1
{
  return self->_engagedInTop1;
}

- (void)setEngagedInTop1:(unint64_t)a3
{
  self->_unint64_t engagedInTop1 = a3;
}

- (unint64_t)engagedInTop2
{
  return self->_engagedInTop2;
}

- (void)setEngagedInTop2:(unint64_t)a3
{
  self->_unint64_t engagedInTop2 = a3;
}

- (unint64_t)engagedInTop4
{
  return self->_engagedInTop4;
}

- (void)setEngagedInTop4:(unint64_t)a3
{
  self->_unint64_t engagedInTop4 = a3;
}

- (unint64_t)engagedInTop8
{
  return self->_engagedInTop8;
}

- (void)setEngagedInTop8:(unint64_t)a3
{
  self->_unint64_t engagedInTop8 = a3;
}

- (unint64_t)numberOfSessionsWithPredictions
{
  return self->_numberOfSessionsWithPredictions;
}

- (void)setNumberOfSessionsWithPredictions:(unint64_t)a3
{
  self->_numberOfSessionsWithPredictions = a3;
}

- (unint64_t)numberOfSessions
{
  return self->_numberOfSessions;
}

- (void)setNumberOfSessions:(unint64_t)a3
{
  self->_numberOfSessions = a3;
}

- (NSMutableDictionary)engagedInTop4PerCandidate
{
  return self->_engagedInTop4PerCandidate;
}

- (void)setEngagedInTop4PerCandidate:(id)a3
{
}

- (NSMutableDictionary)engagedInTop8PerCandidate
{
  return self->_engagedInTop8PerCandidate;
}

- (void)setEngagedInTop8PerCandidate:(id)a3
{
}

- (NSMutableDictionary)shownInTop8PerCandidate
{
  return self->_shownInTop8PerCandidate;
}

- (void)setShownInTop8PerCandidate:(id)a3
{
}

- (NSMutableDictionary)engagedPerCandidate
{
  return self->_engagedPerCandidate;
}

- (void)setEngagedPerCandidate:(id)a3
{
}

- (float)reciprocalRank
{
  return self->_reciprocalRank;
}

- (void)setReciprocalRank:(float)a3
{
  self->_reciprocalRank = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_engagedPerCandidate, 0);
  objc_storeStrong((id *)&self->_shownInTop8PerCandidate, 0);
  objc_storeStrong((id *)&self->_engagedInTop8PerCandidate, 0);
  objc_storeStrong((id *)&self->_engagedInTop4PerCandidate, 0);
  objc_storeStrong((id *)&self->_dockedApps, 0);
}

@end