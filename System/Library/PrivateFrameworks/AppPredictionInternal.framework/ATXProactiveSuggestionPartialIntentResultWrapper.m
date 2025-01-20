@interface ATXProactiveSuggestionPartialIntentResultWrapper
+ (BOOL)supportsSecureCoding;
- (ATXAction)matchingIntentDonatedAction;
- (ATXAction)partiallyExecutedAction;
- (ATXProactiveSuggestionPartialIntentResultWrapper)initWithCoder:(id)a3;
- (ATXProactiveSuggestionPartialIntentResultWrapper)initWithUIFeedbackResult:(id)a3;
- (ATXProactiveSuggestionPartialIntentResultWrapper)initWithUIFeedbackResult:(id)a3 partiallyExecutedUUID:(id)a4 partiallyExecutedAction:(id)a5 partiallyExecutedActionStartDate:(id)a6 matchingIntentDonatedAction:(id)a7 matchingIntentDonationDate:(id)a8 partialEngagementWasCompleteMatch:(id)a9;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXProactiveSuggestionPartialIntentResultWrapper:(id)a3;
- (NSDate)matchingIntentDonationDate;
- (NSDate)partiallyExecutedActionStartDate;
- (NSNumber)partialEngagementWasCompleteMatch;
- (NSUUID)partiallyExecutedUUID;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)markPartiallyExecutedSuggestionAsAbandoned;
- (void)markPartiallyExecutedSuggestionAsCompleteMatchWithDonatedAction:(id)a3 donationDate:(id)a4;
- (void)markPartiallyExecutedSuggestionAsPartialMatchWithDonatedAction:(id)a3 donationDate:(id)a4;
- (void)updatePartiallyExecutedActionWithProactiveSuggestion:(id)a3;
@end

@implementation ATXProactiveSuggestionPartialIntentResultWrapper

- (ATXProactiveSuggestionPartialIntentResultWrapper)initWithUIFeedbackResult:(id)a3
{
  return [(ATXProactiveSuggestionPartialIntentResultWrapper *)self initWithUIFeedbackResult:a3 partiallyExecutedUUID:0 partiallyExecutedAction:0 partiallyExecutedActionStartDate:0 matchingIntentDonatedAction:0 matchingIntentDonationDate:0 partialEngagementWasCompleteMatch:0];
}

- (ATXProactiveSuggestionPartialIntentResultWrapper)initWithUIFeedbackResult:(id)a3 partiallyExecutedUUID:(id)a4 partiallyExecutedAction:(id)a5 partiallyExecutedActionStartDate:(id)a6 matchingIntentDonatedAction:(id)a7 matchingIntentDonationDate:(id)a8 partialEngagementWasCompleteMatch:(id)a9
{
  id v36 = a4;
  id v27 = a5;
  id v35 = a5;
  id v28 = a6;
  id v34 = a6;
  id v29 = a7;
  id v33 = a7;
  id v30 = a8;
  id v32 = a8;
  id v31 = a9;
  id v15 = a3;
  v16 = [v15 shownSuggestions];
  v17 = [v15 engagedSuggestions];
  v18 = [v15 rejectedSuggestions];
  v19 = [v15 session];
  uint64_t v20 = [v15 consumerSubType];
  v21 = [v15 clientCacheUpdate];
  v22 = [v15 uiCacheUpdate];
  v23 = [v15 context];

  v37.receiver = self;
  v37.super_class = (Class)ATXProactiveSuggestionPartialIntentResultWrapper;
  v24 = [(ATXProactiveSuggestionUIFeedbackResult *)&v37 initWithShownSuggestions:v16 engagedSuggestions:v17 rejectedSuggestions:v18 session:v19 consumerSubType:v20 clientCacheUpdate:v21 uiCacheUpdate:v22 context:v23];

  if (v24)
  {
    objc_storeStrong((id *)&v24->_partiallyExecutedUUID, a4);
    objc_storeStrong((id *)&v24->_partiallyExecutedAction, v27);
    objc_storeStrong((id *)&v24->_partiallyExecutedActionStartDate, v28);
    objc_storeStrong((id *)&v24->_matchingIntentDonatedAction, v29);
    objc_storeStrong((id *)&v24->_matchingIntentDonationDate, v30);
    objc_storeStrong((id *)&v24->_partialEngagementWasCompleteMatch, a9);
  }

  return v24;
}

- (void)updatePartiallyExecutedActionWithProactiveSuggestion:(id)a3
{
  id v10 = a3;
  v4 = [v10 atxActionExecutableObject];
  if (v4)
  {
    v5 = [v10 uuid];
    partiallyExecutedUUID = self->_partiallyExecutedUUID;
    self->_partiallyExecutedUUID = v5;

    objc_storeStrong((id *)&self->_partiallyExecutedAction, v4);
    v7 = [(ATXProactiveSuggestionUIFeedbackResult *)self session];
    v8 = [v7 sessionEndDate];
    partiallyExecutedActionStartDate = self->_partiallyExecutedActionStartDate;
    self->_partiallyExecutedActionStartDate = v8;
  }
}

- (void)markPartiallyExecutedSuggestionAsAbandoned
{
  if (self->_partiallyExecutedAction)
  {
    matchingIntentDonatedAction = self->_matchingIntentDonatedAction;
    self->_matchingIntentDonatedAction = 0;

    matchingIntentDonationDate = self->_matchingIntentDonationDate;
    self->_matchingIntentDonationDate = 0;

    partialEngagementWasCompleteMatch = self->_partialEngagementWasCompleteMatch;
    self->_partialEngagementWasCompleteMatch = 0;
  }
}

- (void)markPartiallyExecutedSuggestionAsCompleteMatchWithDonatedAction:(id)a3 donationDate:(id)a4
{
  id v9 = a3;
  id v7 = a4;
  if (self->_partiallyExecutedAction)
  {
    objc_storeStrong((id *)&self->_matchingIntentDonatedAction, a3);
    objc_storeStrong((id *)&self->_matchingIntentDonationDate, a4);
    partialEngagementWasCompleteMatch = self->_partialEngagementWasCompleteMatch;
    self->_partialEngagementWasCompleteMatch = (NSNumber *)MEMORY[0x1E4F1CC38];
  }
}

- (void)markPartiallyExecutedSuggestionAsPartialMatchWithDonatedAction:(id)a3 donationDate:(id)a4
{
  id v9 = a3;
  id v7 = a4;
  if (self->_partiallyExecutedAction)
  {
    objc_storeStrong((id *)&self->_matchingIntentDonatedAction, a3);
    objc_storeStrong((id *)&self->_matchingIntentDonationDate, a4);
    partialEngagementWasCompleteMatch = self->_partialEngagementWasCompleteMatch;
    self->_partialEngagementWasCompleteMatch = (NSNumber *)MEMORY[0x1E4F1CC28];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ATXProactiveSuggestionPartialIntentResultWrapper;
  id v4 = a3;
  [(ATXProactiveSuggestionUIFeedbackResult *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_partiallyExecutedUUID, @"partialUUID", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_partiallyExecutedAction forKey:@"partialAction"];
  [v4 encodeObject:self->_partiallyExecutedActionStartDate forKey:@"partialActionDate"];
  [v4 encodeObject:self->_matchingIntentDonatedAction forKey:@"matchingAction"];
  [v4 encodeObject:self->_matchingIntentDonationDate forKey:@"matchingActionDate"];
  [v4 encodeObject:self->_partialEngagementWasCompleteMatch forKey:@"partialEngagement"];
}

- (ATXProactiveSuggestionPartialIntentResultWrapper)initWithCoder:(id)a3
{
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)ATXProactiveSuggestionPartialIntentResultWrapper;
  objc_super v5 = [(ATXProactiveSuggestionUIFeedbackResult *)&v41 initWithCoder:v4];
  v6 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v7 = objc_opt_class();
  v8 = __atxlog_handle_blending_ecosystem();
  id v9 = [v6 robustDecodeObjectOfClass:v7 forKey:@"partialUUID" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.proactive.ATXProactiveSuggestionPartialIntentResultWrapper" errorCode:-1 logHandle:v8];

  id v10 = [v4 error];

  if (v10)
  {
    v11 = 0;
    v12 = v5;
  }
  else
  {
    v13 = (void *)MEMORY[0x1E4F93B90];
    uint64_t v14 = objc_opt_class();
    id v15 = __atxlog_handle_blending_ecosystem();
    v16 = [v13 robustDecodeObjectOfClass:v14 forKey:@"partialAction" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.proactive.ATXProactiveSuggestionPartialIntentResultWrapper" errorCode:-1 logHandle:v15];

    v17 = [v4 error];

    if (v17)
    {
      v11 = 0;
      v12 = v5;
    }
    else
    {
      v18 = (void *)MEMORY[0x1E4F93B90];
      uint64_t v19 = objc_opt_class();
      uint64_t v20 = __atxlog_handle_blending_ecosystem();
      v21 = [v18 robustDecodeObjectOfClass:v19 forKey:@"partialActionDate" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.proactive.ATXProactiveSuggestionPartialIntentResultWrapper" errorCode:-1 logHandle:v20];

      v22 = [v4 error];

      if (v22)
      {
        v11 = 0;
        v12 = v5;
      }
      else
      {
        v23 = (void *)MEMORY[0x1E4F93B90];
        uint64_t v24 = objc_opt_class();
        v25 = __atxlog_handle_blending_ecosystem();
        v26 = [v23 robustDecodeObjectOfClass:v24 forKey:@"matchingAction" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.proactive.ATXProactiveSuggestionPartialIntentResultWrapper" errorCode:-1 logHandle:v25];

        id v27 = [v4 error];

        if (v27)
        {
          v11 = 0;
          v12 = v5;
        }
        else
        {
          id v28 = (void *)MEMORY[0x1E4F93B90];
          uint64_t v29 = objc_opt_class();
          id v30 = __atxlog_handle_blending_ecosystem();
          id v31 = [v28 robustDecodeObjectOfClass:v29 forKey:@"matchingActionDate" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.proactive.ATXProactiveSuggestionPartialIntentResultWrapper" errorCode:-1 logHandle:v30];

          id v32 = [v4 error];

          if (v32)
          {
            v11 = 0;
            v12 = v5;
          }
          else
          {
            id v33 = (void *)MEMORY[0x1E4F93B90];
            uint64_t v34 = objc_opt_class();
            id v35 = __atxlog_handle_blending_ecosystem();
            uint64_t v36 = [v33 robustDecodeObjectOfClass:v34 forKey:@"partialEngagement" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.proactive.ATXProactiveSuggestionPartialIntentResultWrapper" errorCode:-1 logHandle:v35];

            objc_super v37 = [v4 error];

            if (v37)
            {
              v11 = 0;
              v38 = (void *)v36;
              v12 = v5;
            }
            else
            {
              v39 = [(ATXProactiveSuggestionPartialIntentResultWrapper *)v5 initWithUIFeedbackResult:v5 partiallyExecutedUUID:v9 partiallyExecutedAction:v16 partiallyExecutedActionStartDate:v21 matchingIntentDonatedAction:v26 matchingIntentDonationDate:v31 partialEngagementWasCompleteMatch:v36];
              v38 = (void *)v36;
              v12 = v39;
              v11 = v39;
            }
          }
        }
      }
    }
  }
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXProactiveSuggestionPartialIntentResultWrapper *)a3;
  objc_super v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXProactiveSuggestionPartialIntentResultWrapper *)self isEqualToATXProactiveSuggestionPartialIntentResultWrapper:v5];

  return v6;
}

- (BOOL)isEqualToATXProactiveSuggestionPartialIntentResultWrapper:(id)a3
{
  id v4 = (id *)a3;
  v34.receiver = self;
  v34.super_class = (Class)ATXProactiveSuggestionPartialIntentResultWrapper;
  if (![(ATXProactiveSuggestionUIFeedbackResult *)&v34 isEqual:v4]) {
    goto LABEL_20;
  }
  partiallyExecutedUUID = self->_partiallyExecutedUUID;
  BOOL v6 = (NSUUID *)v4[11];
  if (partiallyExecutedUUID == v6)
  {
  }
  else
  {
    uint64_t v7 = v6;
    v8 = partiallyExecutedUUID;
    char v9 = [(NSUUID *)v8 isEqual:v7];

    if ((v9 & 1) == 0) {
      goto LABEL_20;
    }
  }
  partiallyExecutedAction = self->_partiallyExecutedAction;
  v11 = (ATXAction *)v4[12];
  if (partiallyExecutedAction == v11)
  {
  }
  else
  {
    v12 = v11;
    v13 = partiallyExecutedAction;
    char v14 = [(ATXAction *)v13 isEqual:v12];

    if ((v14 & 1) == 0) {
      goto LABEL_20;
    }
  }
  partiallyExecutedActionStartDate = self->_partiallyExecutedActionStartDate;
  v16 = (NSDate *)v4[13];
  if (partiallyExecutedActionStartDate == v16)
  {
  }
  else
  {
    v17 = v16;
    v18 = partiallyExecutedActionStartDate;
    char v19 = [(NSDate *)v18 isEqual:v17];

    if ((v19 & 1) == 0) {
      goto LABEL_20;
    }
  }
  matchingIntentDonatedAction = self->_matchingIntentDonatedAction;
  v21 = (ATXAction *)v4[14];
  if (matchingIntentDonatedAction == v21)
  {
  }
  else
  {
    v22 = v21;
    v23 = matchingIntentDonatedAction;
    char v24 = [(ATXAction *)v23 isEqual:v22];

    if ((v24 & 1) == 0) {
      goto LABEL_20;
    }
  }
  matchingIntentDonationDate = self->_matchingIntentDonationDate;
  v26 = (NSDate *)v4[15];
  if (matchingIntentDonationDate == v26)
  {
  }
  else
  {
    id v27 = v26;
    id v28 = matchingIntentDonationDate;
    char v29 = [(NSDate *)v28 isEqual:v27];

    if ((v29 & 1) == 0)
    {
LABEL_20:
      char v30 = 0;
      goto LABEL_21;
    }
  }
  id v32 = self->_partialEngagementWasCompleteMatch;
  id v33 = v32;
  if (v32 == v4[16]) {
    char v30 = 1;
  }
  else {
    char v30 = -[NSNumber isEqual:](v32, "isEqual:");
  }

LABEL_21:
  return v30;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSUUID *)self->_partiallyExecutedUUID hash];
  uint64_t v4 = [(ATXAction *)self->_partiallyExecutedAction hash] - v3 + 32 * v3;
  uint64_t v5 = [(NSDate *)self->_partiallyExecutedActionStartDate hash] - v4 + 32 * v4;
  uint64_t v6 = [(ATXAction *)self->_matchingIntentDonatedAction hash] - v5 + 32 * v5;
  uint64_t v7 = [(NSDate *)self->_matchingIntentDonationDate hash] - v6 + 32 * v6;
  return [(NSNumber *)self->_partialEngagementWasCompleteMatch hash] - v7 + 32 * v7;
}

- (NSUUID)partiallyExecutedUUID
{
  return self->_partiallyExecutedUUID;
}

- (ATXAction)partiallyExecutedAction
{
  return self->_partiallyExecutedAction;
}

- (NSDate)partiallyExecutedActionStartDate
{
  return self->_partiallyExecutedActionStartDate;
}

- (ATXAction)matchingIntentDonatedAction
{
  return self->_matchingIntentDonatedAction;
}

- (NSDate)matchingIntentDonationDate
{
  return self->_matchingIntentDonationDate;
}

- (NSNumber)partialEngagementWasCompleteMatch
{
  return self->_partialEngagementWasCompleteMatch;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_partialEngagementWasCompleteMatch, 0);
  objc_storeStrong((id *)&self->_matchingIntentDonationDate, 0);
  objc_storeStrong((id *)&self->_matchingIntentDonatedAction, 0);
  objc_storeStrong((id *)&self->_partiallyExecutedActionStartDate, 0);
  objc_storeStrong((id *)&self->_partiallyExecutedAction, 0);
  objc_storeStrong((id *)&self->_partiallyExecutedUUID, 0);
}

@end