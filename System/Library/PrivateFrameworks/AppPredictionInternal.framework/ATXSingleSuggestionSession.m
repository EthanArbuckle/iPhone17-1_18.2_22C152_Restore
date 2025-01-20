@interface ATXSingleSuggestionSession
+ (BOOL)supportsSecureCoding;
+ (id)stringForSuggestionSessionStatus:(unint64_t)a3;
- (ATXProactiveSuggestion)suggestion;
- (ATXSingleSuggestionSession)initWithCoder:(id)a3;
- (ATXSingleSuggestionSession)initWithTrackedProactiveSuggestion:(id)a3 clientModelCacheUUID:(id)a4 feedbackMetadata:(id)a5;
- (ATXSingleSuggestionSession)initWithTrackedProactiveSuggestion:(id)a3 feedbackMetadata:(id)a4 matchingSuggestionUUIDs:(id)a5 associatedBlendingCacheUUIDs:(id)a6 associatedClientModelCacheUUIDs:(id)a7 sessionContextStatuses:(id)a8 sessionExpirationDate:(id)a9 completed:(BOOL)a10;
- (BOOL)completed;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXSingleSuggestionSession:(id)a3;
- (BOOL)tryUpdateSessionStatus:(unint64_t)a3 consumerSubType:(unsigned __int8)a4;
- (NSData)feedbackMetadata;
- (NSDate)sessionExpirationDate;
- (NSMutableDictionary)sessionContextStatusByConsumerSubType;
- (NSMutableOrderedSet)associatedBlendingCacheUUIDs;
- (NSMutableOrderedSet)associatedClientModelCacheUUIDs;
- (NSMutableOrderedSet)matchingSuggestionUUIDs;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateShownAndEngagedSessionStatusesAndConsumerSubTypesWithBlock:(id)a3;
- (void)setAssociatedBlendingCacheUUIDs:(id)a3;
- (void)setAssociatedClientModelCacheUUIDs:(id)a3;
- (void)setCompleted:(BOOL)a3;
- (void)setFeedbackMetadata:(id)a3;
- (void)setMatchingSuggestionUUIDs:(id)a3;
- (void)setSessionContextStatusByConsumerSubType:(id)a3;
- (void)setSessionExpirationDate:(id)a3;
- (void)setSuggestion:(id)a3;
@end

@implementation ATXSingleSuggestionSession

- (ATXSingleSuggestionSession)initWithTrackedProactiveSuggestion:(id)a3 clientModelCacheUUID:(id)a4 feedbackMetadata:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = objc_opt_new();
  v12 = objc_opt_new();
  v13 = [v10 uuid];
  [v11 addObject:v13];

  [v12 addObject:v9];
  v14 = objc_opt_new();
  v15 = objc_opt_new();
  LOBYTE(v18) = 0;
  v16 = [(ATXSingleSuggestionSession *)self initWithTrackedProactiveSuggestion:v10 feedbackMetadata:v8 matchingSuggestionUUIDs:v11 associatedBlendingCacheUUIDs:v14 associatedClientModelCacheUUIDs:v12 sessionContextStatuses:v15 sessionExpirationDate:0 completed:v18];

  return v16;
}

- (ATXSingleSuggestionSession)initWithTrackedProactiveSuggestion:(id)a3 feedbackMetadata:(id)a4 matchingSuggestionUUIDs:(id)a5 associatedBlendingCacheUUIDs:(id)a6 associatedClientModelCacheUUIDs:(id)a7 sessionContextStatuses:(id)a8 sessionExpirationDate:(id)a9 completed:(BOOL)a10
{
  id v26 = a3;
  id v25 = a4;
  id v24 = a5;
  id v23 = a6;
  id v22 = a7;
  id v17 = a8;
  id v18 = a9;
  v27.receiver = self;
  v27.super_class = (Class)ATXSingleSuggestionSession;
  v19 = [(ATXSingleSuggestionSession *)&v27 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_suggestion, a3);
    objc_storeStrong((id *)&v20->_feedbackMetadata, a4);
    objc_storeStrong((id *)&v20->_matchingSuggestionUUIDs, a5);
    objc_storeStrong((id *)&v20->_associatedBlendingCacheUUIDs, a6);
    objc_storeStrong((id *)&v20->_associatedClientModelCacheUUIDs, a7);
    objc_storeStrong((id *)&v20->_sessionContextStatusByConsumerSubType, a8);
    objc_storeStrong((id *)&v20->_sessionExpirationDate, a9);
    v20->_completed = a10;
  }

  return v20;
}

- (BOOL)tryUpdateSessionStatus:(unint64_t)a3 consumerSubType:(unsigned __int8)a4
{
  v6 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:a4];
  v7 = [(NSMutableDictionary *)self->_sessionContextStatusByConsumerSubType objectForKey:v6];
  id v8 = v7;
  if (v7) {
    v7 = (void *)[v7 unsignedIntegerValue];
  }
  if (a3 && !v7 || (BOOL v9 = 0, a3 >= 2) && v7 == (void *)1)
  {
    sessionContextStatusByConsumerSubType = self->_sessionContextStatusByConsumerSubType;
    v11 = [NSNumber numberWithUnsignedInteger:a3];
    [(NSMutableDictionary *)sessionContextStatusByConsumerSubType setObject:v11 forKey:v6];

    BOOL v9 = 1;
  }

  return v9;
}

- (void)enumerateShownAndEngagedSessionStatusesAndConsumerSubTypesWithBlock:(id)a3
{
  id v4 = a3;
  sessionContextStatusByConsumerSubType = self->_sessionContextStatusByConsumerSubType;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __98__ATXSingleSuggestionSession_enumerateShownAndEngagedSessionStatusesAndConsumerSubTypesWithBlock___block_invoke;
  v7[3] = &unk_1E68AE3A8;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)sessionContextStatusByConsumerSubType enumerateKeysAndObjectsUsingBlock:v7];
}

void __98__ATXSingleSuggestionSession_enumerateShownAndEngagedSessionStatusesAndConsumerSubTypesWithBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if ([MEMORY[0x1E4F4B680] consumerSubtypeForString:a2 found:0])
  {
    [v5 unsignedIntegerValue];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

+ (id)stringForSuggestionSessionStatus:(unint64_t)a3
{
  switch(a3)
  {
    case 1uLL:
      id result = @"shown";
      break;
    case 2uLL:
      id result = @"engaged";
      break;
    case 3uLL:
      id result = @"dismissed";
      break;
    case 4uLL:
      id v4 = __atxlog_handle_feedback();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
        +[ATXSingleSuggestionSession stringForSuggestionSessionStatus:](v4);
      }

      id result = @"max";
      break;
    default:
      id result = @"not shown";
      break;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  suggestion = self->_suggestion;
  id v5 = a3;
  [v5 encodeObject:suggestion forKey:@"suggestion"];
  [v5 encodeObject:self->_feedbackMetadata forKey:@"feedbackMetadata"];
  [v5 encodeObject:self->_matchingSuggestionUUIDs forKey:@"matchingSuggestionUUIDs"];
  [v5 encodeObject:self->_associatedBlendingCacheUUIDs forKey:@"blendingUUIDs"];
  [v5 encodeObject:self->_associatedClientModelCacheUUIDs forKey:@"clientUUIDs"];
  [v5 encodeObject:self->_sessionContextStatusByConsumerSubType forKey:@"sessionStatuses"];
  [v5 encodeObject:self->_sessionExpirationDate forKey:@"expirationDate"];
  [v5 encodeBool:self->_completed forKey:@"completed"];
}

- (ATXSingleSuggestionSession)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v6 = objc_opt_class();
  v7 = __atxlog_handle_metrics();
  id v8 = [v5 robustDecodeObjectOfClass:v6 forKey:@"suggestion" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.ATXPushPullSessionContext" errorCode:-1 logHandle:v7];

  if (v8)
  {
    v50 = self;
    BOOL v9 = (void *)MEMORY[0x1E4F93B90];
    uint64_t v10 = objc_opt_class();
    v11 = __atxlog_handle_metrics();
    uint64_t v49 = [v9 robustDecodeObjectOfClass:v10 forKey:@"feedbackMetadata" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.ATXPushPullSessionContext" errorCode:-1 logHandle:v11];

    v12 = (void *)MEMORY[0x1E4F93B90];
    v13 = (void *)MEMORY[0x1D25F6CC0]();
    id v14 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v15 = objc_opt_class();
    v16 = objc_msgSend(v14, "initWithObjects:", v15, objc_opt_class(), 0);
    id v17 = __atxlog_handle_metrics();
    id v18 = [v12 robustDecodeObjectOfClasses:v16 forKey:@"matchingSuggestionUUIDs" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.ATXPushPullSessionContext" errorCode:-1 logHandle:v17];

    if (v18)
    {
      v19 = (void *)MEMORY[0x1E4F93B90];
      v20 = (void *)MEMORY[0x1D25F6CC0]();
      id v21 = objc_alloc(MEMORY[0x1E4F1CAD0]);
      uint64_t v22 = objc_opt_class();
      id v23 = objc_msgSend(v21, "initWithObjects:", v22, objc_opt_class(), 0);
      id v24 = __atxlog_handle_metrics();
      id v25 = [v19 robustDecodeObjectOfClasses:v23 forKey:@"blendingUUIDs" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.ATXPushPullSessionContext" errorCode:-1 logHandle:v24];

      if (v25)
      {
        id v26 = (void *)MEMORY[0x1E4F93B90];
        objc_super v27 = (void *)MEMORY[0x1D25F6CC0]();
        id v28 = objc_alloc(MEMORY[0x1E4F1CAD0]);
        uint64_t v29 = objc_opt_class();
        v30 = objc_msgSend(v28, "initWithObjects:", v29, objc_opt_class(), 0);
        v31 = __atxlog_handle_metrics();
        v32 = [v26 robustDecodeObjectOfClasses:v30 forKey:@"clientUUIDs" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.ATXPushPullSessionContext" errorCode:-1 logHandle:v31];

        if (v32)
        {
          v48 = (void *)MEMORY[0x1E4F93B90];
          v33 = (void *)MEMORY[0x1D25F6CC0]();
          id v34 = objc_alloc(MEMORY[0x1E4F1CAD0]);
          uint64_t v35 = objc_opt_class();
          uint64_t v36 = objc_opt_class();
          v37 = objc_msgSend(v34, "initWithObjects:", v35, v36, objc_opt_class(), 0);
          v38 = __atxlog_handle_metrics();
          v39 = [v48 robustDecodeObjectOfClasses:v37 forKey:@"sessionStatuses" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.ATXPushPullSessionContext" errorCode:-1 logHandle:v38];

          if (v39)
          {
            v40 = (void *)MEMORY[0x1E4F93B90];
            uint64_t v41 = objc_opt_class();
            v42 = __atxlog_handle_metrics();
            v43 = [v40 robustDecodeObjectOfClass:v41 forKey:@"expirationDate" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.ATXPushPullSessionContext" errorCode:-1 logHandle:v42];

            LOBYTE(v47) = [v4 decodeBoolForKey:@"completed"];
            v44 = (void *)v49;
            self = [(ATXSingleSuggestionSession *)v50 initWithTrackedProactiveSuggestion:v8 feedbackMetadata:v49 matchingSuggestionUUIDs:v18 associatedBlendingCacheUUIDs:v25 associatedClientModelCacheUUIDs:v32 sessionContextStatuses:v39 sessionExpirationDate:v43 completed:v47];

            v45 = self;
          }
          else
          {
            v45 = 0;
            v44 = (void *)v49;
            self = v50;
          }
        }
        else
        {
          v45 = 0;
          v44 = (void *)v49;
          self = v50;
        }
      }
      else
      {
        v45 = 0;
        v44 = (void *)v49;
      }
    }
    else
    {
      v45 = 0;
      v44 = (void *)v49;
    }
  }
  else
  {
    v45 = 0;
  }

  return v45;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXSingleSuggestionSession *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXSingleSuggestionSession *)self isEqualToATXSingleSuggestionSession:v5];

  return v6;
}

- (BOOL)isEqualToATXSingleSuggestionSession:(id)a3
{
  id v4 = (id *)a3;
  suggestion = self->_suggestion;
  BOOL v6 = (ATXProactiveSuggestion *)v4[2];
  if (suggestion == v6)
  {
  }
  else
  {
    v7 = v6;
    id v8 = suggestion;
    char v9 = [(ATXProactiveSuggestion *)v8 isEqual:v7];

    if ((v9 & 1) == 0) {
      goto LABEL_27;
    }
  }
  feedbackMetadata = self->_feedbackMetadata;
  v11 = (NSData *)v4[3];
  if (feedbackMetadata == v11)
  {
  }
  else
  {
    v12 = v11;
    v13 = feedbackMetadata;
    char v14 = [(NSData *)v13 isEqual:v12];

    if ((v14 & 1) == 0) {
      goto LABEL_27;
    }
  }
  matchingSuggestionUUIDs = self->_matchingSuggestionUUIDs;
  v16 = (NSMutableOrderedSet *)v4[4];
  if (matchingSuggestionUUIDs == v16)
  {
  }
  else
  {
    id v17 = v16;
    id v18 = matchingSuggestionUUIDs;
    char v19 = [(NSMutableOrderedSet *)v18 isEqual:v17];

    if ((v19 & 1) == 0) {
      goto LABEL_27;
    }
  }
  associatedBlendingCacheUUIDs = self->_associatedBlendingCacheUUIDs;
  id v21 = (NSMutableOrderedSet *)v4[6];
  if (associatedBlendingCacheUUIDs == v21)
  {
  }
  else
  {
    uint64_t v22 = v21;
    id v23 = associatedBlendingCacheUUIDs;
    char v24 = [(NSMutableOrderedSet *)v23 isEqual:v22];

    if ((v24 & 1) == 0) {
      goto LABEL_27;
    }
  }
  associatedClientModelCacheUUIDs = self->_associatedClientModelCacheUUIDs;
  id v26 = (NSMutableOrderedSet *)v4[5];
  if (associatedClientModelCacheUUIDs == v26)
  {
  }
  else
  {
    objc_super v27 = v26;
    id v28 = associatedClientModelCacheUUIDs;
    char v29 = [(NSMutableOrderedSet *)v28 isEqual:v27];

    if ((v29 & 1) == 0) {
      goto LABEL_27;
    }
  }
  sessionContextStatusByConsumerSubType = self->_sessionContextStatusByConsumerSubType;
  v31 = (NSMutableDictionary *)v4[7];
  if (sessionContextStatusByConsumerSubType == v31)
  {
  }
  else
  {
    v32 = v31;
    v33 = sessionContextStatusByConsumerSubType;
    char v34 = [(NSMutableDictionary *)v33 isEqual:v32];

    if ((v34 & 1) == 0) {
      goto LABEL_27;
    }
  }
  sessionExpirationDate = self->_sessionExpirationDate;
  uint64_t v36 = (NSDate *)v4[8];
  if (sessionExpirationDate == v36)
  {

    goto LABEL_30;
  }
  v37 = v36;
  v38 = sessionExpirationDate;
  char v39 = [(NSDate *)v38 isEqual:v37];

  if (v39)
  {
LABEL_30:
    BOOL v40 = self->_completed == *((unsigned __int8 *)v4 + 8);
    goto LABEL_28;
  }
LABEL_27:
  BOOL v40 = 0;
LABEL_28:

  return v40;
}

- (unint64_t)hash
{
  int64_t v2 = (char *)self->_feedbackMetadata - (char *)self->_suggestion + 32 * (uint64_t)self->_suggestion;
  v3 = (char *)&self->_matchingSuggestionUUIDs[4 * v2] - v2;
  int64_t v4 = (char *)self->_associatedBlendingCacheUUIDs - v3 + 32 * (void)v3;
  int64_t v5 = (char *)self->_sessionContextStatusByConsumerSubType
     - ((char *)&self->_associatedClientModelCacheUUIDs[4 * v4]
      - v4)
     + 32 * ((uint64_t)&self->_associatedClientModelCacheUUIDs[4 * v4] - v4);
  BOOL v6 = (char *)&self->_sessionExpirationDate[4 * v5] - v5;
  return self->_completed - (void)v6 + 32 * (void)v6;
}

- (id)description
{
  id v3 = [NSString alloc];
  int64_t v4 = [(ATXProactiveSuggestion *)self->_suggestion uuid];
  int64_t v5 = [(ATXProactiveSuggestion *)self->_suggestion clientModelSpecification];
  uint64_t v6 = [v5 clientModelId];
  v7 = (void *)v6;
  if (self->_completed) {
    id v8 = @"YES";
  }
  else {
    id v8 = @"NO";
  }
  char v9 = (void *)[v3 initWithFormat:@"uuid: %@ clientModelId: %@ expirationDate: %@ completed: %@ statuses: %@ suggestionUUIDs: %@ blendingUUIDs: %@ clientUUIDs: %@", v4, v6, self->_sessionExpirationDate, v8, self->_sessionContextStatusByConsumerSubType, self->_matchingSuggestionUUIDs, self->_associatedBlendingCacheUUIDs, self->_associatedClientModelCacheUUIDs];

  return v9;
}

- (ATXProactiveSuggestion)suggestion
{
  return self->_suggestion;
}

- (void)setSuggestion:(id)a3
{
}

- (NSData)feedbackMetadata
{
  return self->_feedbackMetadata;
}

- (void)setFeedbackMetadata:(id)a3
{
}

- (NSMutableOrderedSet)matchingSuggestionUUIDs
{
  return self->_matchingSuggestionUUIDs;
}

- (void)setMatchingSuggestionUUIDs:(id)a3
{
}

- (NSMutableOrderedSet)associatedClientModelCacheUUIDs
{
  return self->_associatedClientModelCacheUUIDs;
}

- (void)setAssociatedClientModelCacheUUIDs:(id)a3
{
}

- (NSMutableOrderedSet)associatedBlendingCacheUUIDs
{
  return self->_associatedBlendingCacheUUIDs;
}

- (void)setAssociatedBlendingCacheUUIDs:(id)a3
{
}

- (NSMutableDictionary)sessionContextStatusByConsumerSubType
{
  return self->_sessionContextStatusByConsumerSubType;
}

- (void)setSessionContextStatusByConsumerSubType:(id)a3
{
}

- (NSDate)sessionExpirationDate
{
  return self->_sessionExpirationDate;
}

- (void)setSessionExpirationDate:(id)a3
{
}

- (BOOL)completed
{
  return self->_completed;
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionExpirationDate, 0);
  objc_storeStrong((id *)&self->_sessionContextStatusByConsumerSubType, 0);
  objc_storeStrong((id *)&self->_associatedBlendingCacheUUIDs, 0);
  objc_storeStrong((id *)&self->_associatedClientModelCacheUUIDs, 0);
  objc_storeStrong((id *)&self->_matchingSuggestionUUIDs, 0);
  objc_storeStrong((id *)&self->_feedbackMetadata, 0);
  objc_storeStrong((id *)&self->_suggestion, 0);
}

+ (void)stringForSuggestionSessionStatus:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_FAULT, "Invalid value ATXSingleSuggestionSessionStatus_Max", v1, 2u);
}

@end