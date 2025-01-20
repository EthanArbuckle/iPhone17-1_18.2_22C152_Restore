@interface ATXActionResponse
+ (BOOL)supportsSecureCoding;
- (ATXAction)engagedAction;
- (ATXAction)matchingIntentDonatedAction;
- (ATXActionResponse)initWithCoder:(id)a3;
- (ATXActionResponse)initWithProactiveSuggestions:(id)a3 blendingModelUICacheUpdateUUID:(id)a4 consumerSubType:(unsigned __int8)a5 error:(id)a6;
- (ATXActionResponse)initWithScoredActions:(id)a3 cacheFileData:(id)a4 consumerSubType:(unsigned __int8)a5 error:(id)a6;
- (ATXActionResponse)initWithScoredActions:(id)a3 cacheFileData:(id)a4 proactiveSuggestions:(id)a5 blendingModelUICacheUpdateUUID:(id)a6 consumerSubType:(unsigned __int8)a7 predictionDate:(id)a8 error:(id)a9;
- (BOOL)containsExternalRoute;
- (BOOL)indexWasShown:(unint64_t)a3;
- (BOOL)isActionSpotlightCaptureRateAppEngagementType;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToActionResponse:(id)a3;
- (BOOL)matchingIntentWasCompleteMatch;
- (NSArray)actions;
- (NSArray)explicitlyDismissedActions;
- (NSArray)proactiveSuggestions;
- (NSArray)scoredActions;
- (NSArray)shownActions;
- (NSData)cacheFileData;
- (NSDate)donatedIntentDate;
- (NSDate)predictionDate;
- (NSDate)uiFeedbackDate;
- (NSError)error;
- (NSString)engagedAppString;
- (NSUUID)blendingModelUICacheUpdateUUID;
- (NSUUID)uuid;
- (id)json;
- (id)jsonData;
- (id)jsonDescription;
- (id)routeDestinationTypeString;
- (unint64_t)feedbackStage;
- (unint64_t)hash;
- (unint64_t)searchedActionType;
- (unsigned)consumerSubType;
- (void)encodeWithCoder:(id)a3;
- (void)jsonData;
- (void)setContainsExternalRoute:(BOOL)a3;
- (void)updateConsumerSubType:(unsigned __int8)a3 engagedAction:(id)a4 shownActions:(id)a5 feedbackStage:(unint64_t)a6 explicitlyDismissedActions:(id)a7 searchedActionType:(unint64_t)a8 engagedAppString:(id)a9 uiFeedbackDate:(id)a10;
- (void)updateWithMatchingIntentDonatedAction:(id)a3 intentDonationDate:(id)a4 matchingIntentWasCompleteMatch:(BOOL)a5;
@end

@implementation ATXActionResponse

- (ATXActionResponse)initWithScoredActions:(id)a3 cacheFileData:(id)a4 consumerSubType:(unsigned __int8)a5 error:(id)a6
{
  uint64_t v6 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  v13 = objc_opt_new();
  v14 = [(ATXActionResponse *)self initWithScoredActions:v12 cacheFileData:v11 proactiveSuggestions:0 blendingModelUICacheUpdateUUID:0 consumerSubType:v6 predictionDate:v13 error:v10];

  return v14;
}

- (ATXActionResponse)initWithProactiveSuggestions:(id)a3 blendingModelUICacheUpdateUUID:(id)a4 consumerSubType:(unsigned __int8)a5 error:(id)a6
{
  uint64_t v6 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  v13 = objc_opt_new();
  v14 = [(ATXActionResponse *)self initWithScoredActions:0 cacheFileData:0 proactiveSuggestions:v12 blendingModelUICacheUpdateUUID:v11 consumerSubType:v6 predictionDate:v13 error:v10];

  return v14;
}

- (ATXActionResponse)initWithScoredActions:(id)a3 cacheFileData:(id)a4 proactiveSuggestions:(id)a5 blendingModelUICacheUpdateUUID:(id)a6 consumerSubType:(unsigned __int8)a7 predictionDate:(id)a8 error:(id)a9
{
  id v29 = a3;
  id v28 = a4;
  id v27 = a5;
  id v26 = a6;
  id v16 = a8;
  id v17 = a9;
  v30.receiver = self;
  v30.super_class = (Class)ATXActionResponse;
  v18 = [(ATXActionResponse *)&v30 init];
  if (v18)
  {
    uint64_t v19 = objc_opt_new();
    uuid = v18->_uuid;
    v18->_uuid = (NSUUID *)v19;

    objc_storeStrong((id *)&v18->_scoredActions, a3);
    objc_storeStrong((id *)&v18->_cacheFileData, a4);
    objc_storeStrong((id *)&v18->_proactiveSuggestions, a5);
    objc_storeStrong((id *)&v18->_blendingModelUICacheUpdateUUID, a6);
    v18->_consumerSubType = a7;
    v18->_feedbackStage = 1;
    objc_storeStrong((id *)&v18->_error, a9);
    uint64_t v21 = objc_opt_new();
    shownActionIndices = v18->_shownActionIndices;
    v18->_shownActionIndices = (NSIndexSet *)v21;

    uint64_t v23 = objc_opt_new();
    explicitlyDismissedActionIndices = v18->_explicitlyDismissedActionIndices;
    v18->_explicitlyDismissedActionIndices = (NSIndexSet *)v23;

    objc_storeStrong((id *)&v18->_predictionDate, a8);
    v18->_searchedActionType = 4;
  }

  return v18;
}

- (void)updateConsumerSubType:(unsigned __int8)a3 engagedAction:(id)a4 shownActions:(id)a5 feedbackStage:(unint64_t)a6 explicitlyDismissedActions:(id)a7 searchedActionType:(unint64_t)a8 engagedAppString:(id)a9 uiFeedbackDate:(id)a10
{
  id v16 = (ATXAction *)a4;
  id v17 = (NSString *)a9;
  v18 = (NSDate *)a10;
  self->_consumerSubType = a3;
  id v19 = a7;
  id v20 = a5;
  id v31 = [(ATXActionResponse *)self actions];
  actionsToIndexSet(v20, v31);
  uint64_t v21 = (NSIndexSet *)objc_claimAutoreleasedReturnValue();

  shownActionIndices = self->_shownActionIndices;
  self->_shownActionIndices = v21;

  engagedAction = self->_engagedAction;
  self->_engagedAction = v16;
  v24 = v16;

  actionsToIndexSet(v19, v31);
  v25 = (NSIndexSet *)objc_claimAutoreleasedReturnValue();

  explicitlyDismissedActionIndices = self->_explicitlyDismissedActionIndices;
  self->_explicitlyDismissedActionIndices = v25;

  matchingIntentDonatedAction = self->_matchingIntentDonatedAction;
  self->_matchingIntentDonatedAction = 0;

  uiFeedbackDate = self->_uiFeedbackDate;
  self->_feedbackStage = a6;
  self->_uiFeedbackDate = v18;
  id v29 = v18;

  engagedAppString = self->_engagedAppString;
  self->_searchedActionType = a8;
  self->_engagedAppString = v17;
}

- (void)updateWithMatchingIntentDonatedAction:(id)a3 intentDonationDate:(id)a4 matchingIntentWasCompleteMatch:(BOOL)a5
{
  v8 = (ATXAction *)a3;
  v9 = (NSDate *)a4;
  matchingIntentDonatedAction = self->_matchingIntentDonatedAction;
  self->_matchingIntentDonatedAction = v8;
  id v11 = v8;

  donatedIntentDate = self->_donatedIntentDate;
  self->_donatedIntentDate = v9;

  self->_feedbackStage = 3;
  self->_matchingIntentWasCompleteMatch = a5;
}

- (NSArray)actions
{
  return (NSArray *)+[ATXScoredPrediction predictionsFrom:self->_scoredActions];
}

- (BOOL)indexWasShown:(unint64_t)a3
{
  return [(NSIndexSet *)self->_shownActionIndices containsIndex:a3];
}

- (NSArray)shownActions
{
  shownActionsCache = self->_shownActionsCache;
  if (!shownActionsCache)
  {
    v4 = objc_opt_new();
    shownActionIndices = self->_shownActionIndices;
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    id v12 = __33__ATXActionResponse_shownActions__block_invoke;
    v13 = &unk_1E5D05888;
    id v14 = v4;
    v15 = self;
    id v6 = v4;
    [(NSIndexSet *)shownActionIndices enumerateIndexesUsingBlock:&v10];
    v7 = (NSArray *)objc_msgSend(v6, "copy", v10, v11, v12, v13);
    v8 = self->_shownActionsCache;
    self->_shownActionsCache = v7;

    shownActionsCache = self->_shownActionsCache;
  }

  return shownActionsCache;
}

void __33__ATXActionResponse_shownActions__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v4 = [*(id *)(*(void *)(a1 + 40) + 48) objectAtIndexedSubscript:a2];
  v3 = [v4 predictedItem];
  [v2 addObject:v3];
}

- (NSArray)explicitlyDismissedActions
{
  v3 = objc_opt_new();
  explicitlyDismissedActionIndices = self->_explicitlyDismissedActionIndices;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __47__ATXActionResponse_explicitlyDismissedActions__block_invoke;
  uint64_t v11 = &unk_1E5D05888;
  id v12 = v3;
  v13 = self;
  id v5 = v3;
  [(NSIndexSet *)explicitlyDismissedActionIndices enumerateIndexesUsingBlock:&v8];
  id v6 = objc_msgSend(v5, "copy", v8, v9, v10, v11);

  return (NSArray *)v6;
}

void __47__ATXActionResponse_explicitlyDismissedActions__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v4 = [*(id *)(*(void *)(a1 + 40) + 48) objectAtIndexedSubscript:a2];
  v3 = [v4 predictedItem];
  [v2 addObject:v3];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXActionResponse *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXActionResponse *)self isEqualToActionResponse:v5];

  return v6;
}

- (BOOL)isEqualToActionResponse:(id)a3
{
  id v4 = (id *)a3;
  uuid = self->_uuid;
  BOOL v6 = (NSUUID *)v4[5];
  if (uuid == v6)
  {
  }
  else
  {
    v7 = v6;
    uint64_t v8 = uuid;
    char v9 = [(NSUUID *)v8 isEqual:v7];

    if ((v9 & 1) == 0) {
      goto LABEL_55;
    }
  }
  scoredActions = self->_scoredActions;
  uint64_t v11 = (NSArray *)v4[6];
  if (scoredActions == v11)
  {
  }
  else
  {
    id v12 = v11;
    v13 = scoredActions;
    char v14 = [(NSArray *)v13 isEqual:v12];

    if ((v14 & 1) == 0) {
      goto LABEL_55;
    }
  }
  cacheFileData = self->_cacheFileData;
  id v16 = (NSData *)v4[17];
  if (cacheFileData == v16)
  {
  }
  else
  {
    id v17 = v16;
    v18 = cacheFileData;
    char v19 = [(NSData *)v18 isEqual:v17];

    if ((v19 & 1) == 0) {
      goto LABEL_55;
    }
  }
  proactiveSuggestions = self->_proactiveSuggestions;
  uint64_t v21 = (NSArray *)v4[8];
  if (proactiveSuggestions == v21)
  {
  }
  else
  {
    v22 = v21;
    uint64_t v23 = proactiveSuggestions;
    char v24 = [(NSArray *)v23 isEqual:v22];

    if ((v24 & 1) == 0) {
      goto LABEL_55;
    }
  }
  blendingModelUICacheUpdateUUID = self->_blendingModelUICacheUpdateUUID;
  id v26 = (NSUUID *)v4[7];
  if (blendingModelUICacheUpdateUUID == v26)
  {
  }
  else
  {
    id v27 = v26;
    id v28 = blendingModelUICacheUpdateUUID;
    char v29 = [(NSUUID *)v28 isEqual:v27];

    if ((v29 & 1) == 0) {
      goto LABEL_55;
    }
  }
  if (self->_consumerSubType == *((unsigned __int8 *)v4 + 33))
  {
    engagedAction = self->_engagedAction;
    id v31 = (ATXAction *)v4[10];
    if (engagedAction == v31)
    {
    }
    else
    {
      v32 = v31;
      v33 = engagedAction;
      BOOL v34 = [(ATXAction *)v33 isEqual:v32];

      if (!v34) {
        goto LABEL_55;
      }
    }
    explicitlyDismissedActionIndices = self->_explicitlyDismissedActionIndices;
    v36 = (NSIndexSet *)v4[2];
    if (explicitlyDismissedActionIndices == v36)
    {
    }
    else
    {
      v37 = v36;
      v38 = explicitlyDismissedActionIndices;
      char v39 = [(NSIndexSet *)v38 isEqual:v37];

      if ((v39 & 1) == 0) {
        goto LABEL_55;
      }
    }
    matchingIntentDonatedAction = self->_matchingIntentDonatedAction;
    v41 = (ATXAction *)v4[13];
    if (matchingIntentDonatedAction == v41)
    {
    }
    else
    {
      v42 = v41;
      v43 = matchingIntentDonatedAction;
      BOOL v44 = [(ATXAction *)v43 isEqual:v42];

      if (!v44) {
        goto LABEL_55;
      }
    }
    if (self->_matchingIntentWasCompleteMatch == *((unsigned __int8 *)v4 + 34))
    {
      shownActionIndices = self->_shownActionIndices;
      v46 = (NSIndexSet *)v4[1];
      if (shownActionIndices == v46)
      {
      }
      else
      {
        v47 = v46;
        v48 = shownActionIndices;
        char v49 = [(NSIndexSet *)v48 isEqual:v47];

        if ((v49 & 1) == 0) {
          goto LABEL_55;
        }
      }
      predictionDate = self->_predictionDate;
      v51 = (NSDate *)v4[9];
      if (predictionDate == v51)
      {
      }
      else
      {
        v52 = v51;
        v53 = predictionDate;
        char v54 = [(NSDate *)v53 isEqual:v52];

        if ((v54 & 1) == 0) {
          goto LABEL_55;
        }
      }
      uiFeedbackDate = self->_uiFeedbackDate;
      v56 = (NSDate *)v4[12];
      if (uiFeedbackDate == v56)
      {
      }
      else
      {
        v57 = v56;
        v58 = uiFeedbackDate;
        char v59 = [(NSDate *)v58 isEqual:v57];

        if ((v59 & 1) == 0) {
          goto LABEL_55;
        }
      }
      donatedIntentDate = self->_donatedIntentDate;
      v61 = (NSDate *)v4[14];
      if (donatedIntentDate == v61)
      {
      }
      else
      {
        v62 = v61;
        v63 = donatedIntentDate;
        char v64 = [(NSDate *)v63 isEqual:v62];

        if ((v64 & 1) == 0) {
          goto LABEL_55;
        }
      }
      if (self->_feedbackStage != v4[11] || self->_searchedActionType != v4[15]) {
        goto LABEL_55;
      }
      engagedAppString = self->_engagedAppString;
      v66 = (NSString *)v4[16];
      if (engagedAppString == v66)
      {
      }
      else
      {
        v67 = v66;
        v68 = engagedAppString;
        char v69 = [(NSString *)v68 isEqual:v67];

        if ((v69 & 1) == 0) {
          goto LABEL_55;
        }
      }
      BOOL v70 = self->_containsRouteInternal == *((unsigned __int8 *)v4 + 32);
      goto LABEL_56;
    }
  }
LABEL_55:
  BOOL v70 = 0;
LABEL_56:

  return v70;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSUUID *)self->_uuid hash];
  uint64_t v4 = [(NSArray *)self->_scoredActions hash] - v3 + 32 * v3;
  uint64_t v5 = [(NSData *)self->_cacheFileData hash] - v4 + 32 * v4;
  uint64_t v6 = [(NSUUID *)self->_blendingModelUICacheUpdateUUID hash];
  uint64_t v7 = self->_consumerSubType - (v6 - v5 + 32 * v5) + 32 * (v6 - v5 + 32 * v5);
  unint64_t v8 = [(ATXAction *)self->_engagedAction hash] - v7 + 32 * v7;
  uint64_t v9 = [(NSIndexSet *)self->_explicitlyDismissedActionIndices hash] - v8 + 32 * v8;
  unint64_t v10 = [(ATXAction *)self->_matchingIntentDonatedAction hash];
  uint64_t v11 = self->_matchingIntentWasCompleteMatch - (v10 - v9 + 32 * v9) + 32 * (v10 - v9 + 32 * v9);
  uint64_t v12 = [(NSIndexSet *)self->_shownActionIndices hash] - v11 + 32 * v11;
  uint64_t v13 = [(NSDate *)self->_predictionDate hash] - v12 + 32 * v12;
  uint64_t v14 = [(NSDate *)self->_uiFeedbackDate hash] - v13 + 32 * v13;
  uint64_t v15 = [(NSDate *)self->_donatedIntentDate hash];
  unint64_t v16 = self->_feedbackStage - (v15 - v14 + 32 * v14) + 32 * (v15 - v14 + 32 * v14);
  unint64_t v17 = self->_searchedActionType - v16 + 32 * v16;
  NSUInteger v18 = [(NSString *)self->_engagedAppString hash];
  return self->_containsRouteInternal - (v18 - v17 + 32 * v17) + 32 * (v18 - v17 + 32 * v17);
}

- (id)json
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  v47[0] = @"uuid";
  uint64_t v3 = [(NSUUID *)self->_uuid description];
  uint64_t v4 = @"NO_UUID";
  v42 = (void *)v3;
  if (v3) {
    uint64_t v4 = (__CFString *)v3;
  }
  v48[0] = v4;
  v47[1] = @"blendingUICacheUpdateUUID";
  uint64_t v5 = [(NSUUID *)self->_blendingModelUICacheUpdateUUID description];
  uint64_t v6 = @"NO_BLENDING_UI_CACHE_UPDATE_UUID";
  v41 = (void *)v5;
  if (v5) {
    uint64_t v6 = (__CFString *)v5;
  }
  v48[1] = v6;
  v47[2] = @"consumerSubType";
  uint64_t v7 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:self->_consumerSubType];
  engagedAction = self->_engagedAction;
  if (!engagedAction) {
    engagedAction = (ATXAction *)@"NONE";
  }
  v40 = (void *)v7;
  v48[2] = v7;
  v48[3] = engagedAction;
  v47[3] = @"engagedActionKey";
  v47[4] = @"explicitlyDismissedActionIndices";
  uint64_t v9 = [(NSIndexSet *)self->_explicitlyDismissedActionIndices atx_asArray];
  matchingIntentDonatedAction = self->_matchingIntentDonatedAction;
  if (!matchingIntentDonatedAction) {
    matchingIntentDonatedAction = (ATXAction *)@"NONE";
  }
  char v39 = (void *)v9;
  v48[4] = v9;
  v48[5] = matchingIntentDonatedAction;
  v47[5] = @"matchingDonatedIntentActionKey";
  v47[6] = @"matchingDonatedIntentWasCompleteMatch";
  if (self->_matchingIntentWasCompleteMatch) {
    uint64_t v11 = @"YES";
  }
  else {
    uint64_t v11 = @"NO";
  }
  v48[6] = v11;
  v47[7] = @"scoredActions";
  uint64_t v12 = self->_scoredActions;
  uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](v12, "count"));
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v14 = v12;
  uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v44 != v17) {
          objc_enumerationMutation(v14);
        }
        char v19 = [*(id *)(*((void *)&v43 + 1) + 8 * i) predictedItem];
        id v20 = [v19 json];
        [v13 addObject:v20];
      }
      uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v43 objects:v49 count:16];
    }
    while (v16);
  }

  v48[7] = v13;
  v47[8] = @"shownActionIndices";
  v38 = [(NSIndexSet *)self->_shownActionIndices atx_asArray];
  v48[8] = v38;
  v47[9] = @"predictionDate";
  uint64_t v21 = [(NSDate *)self->_predictionDate description];
  v22 = (void *)v21;
  if (v21) {
    uint64_t v23 = (__CFString *)v21;
  }
  else {
    uint64_t v23 = @"NONE";
  }
  v48[9] = v23;
  v47[10] = @"uiFeedbackDate";
  uint64_t v24 = [(NSDate *)self->_uiFeedbackDate description];
  v25 = (void *)v24;
  if (v24) {
    id v26 = (__CFString *)v24;
  }
  else {
    id v26 = @"NONE";
  }
  v48[10] = v26;
  v47[11] = @"donatedIntentDate";
  uint64_t v27 = [(NSDate *)self->_donatedIntentDate description];
  id v28 = (void *)v27;
  if (v27) {
    char v29 = (__CFString *)v27;
  }
  else {
    char v29 = @"NONE";
  }
  v48[11] = v29;
  v47[12] = @"feedbackStage";
  objc_super v30 = +[ATXActionPredictionTypes actionFeedbackStageToString:self->_feedbackStage];
  v48[12] = v30;
  v47[13] = @"routeDestinationType";
  id v31 = [(ATXActionResponse *)self routeDestinationTypeString];
  v48[13] = v31;
  v47[14] = @"cacheFileDataSize";
  v32 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lu", 8);
  v48[14] = v32;
  v47[15] = @"searchedActionType";
  uint64_t v33 = +[ATXActionPredictionTypes actionTypeToString:self->_searchedActionType];
  BOOL v34 = (void *)v33;
  v47[16] = @"engagedAppString";
  engagedAppString = (__CFString *)self->_engagedAppString;
  if (!engagedAppString) {
    engagedAppString = @"NONE";
  }
  v48[15] = v33;
  v48[16] = engagedAppString;
  v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:v47 count:17];

  return v36;
}

- (id)jsonData
{
  v2 = (void *)MEMORY[0x1E4F28D90];
  uint64_t v3 = [(ATXActionResponse *)self json];
  id v8 = 0;
  uint64_t v4 = [v2 dataWithJSONObject:v3 options:1 error:&v8];
  id v5 = v8;

  if (!v4)
  {
    uint64_t v6 = __atxlog_handle_default();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(ATXActionResponse *)(uint64_t)v5 jsonData];
    }
  }

  return v4;
}

- (id)jsonDescription
{
  v2 = [(ATXActionResponse *)self jsonData];
  if (v2) {
    uint64_t v3 = (void *)[[NSString alloc] initWithData:v2 encoding:4];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (BOOL)isActionSpotlightCaptureRateAppEngagementType
{
  if (!objc_msgSend(MEMORY[0x1E4F4B680], "isActionSpotlightConsumerSubType:", -[ATXActionResponse consumerSubType](self, "consumerSubType")))return 0; {
  uint64_t v3 = [(ATXActionResponse *)self engagedAction];
  }
  if (v3)
  {
    BOOL v4 = 0;
  }
  else
  {
    id v5 = [(ATXActionResponse *)self engagedAppString];
    if ([v5 length]) {
      BOOL v4 = [(ATXActionResponse *)self searchedActionType] == 4;
    }
    else {
      BOOL v4 = 0;
    }
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXActionResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)ATXActionResponse;
  id v5 = [(ATXActionResponse *)&v39 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    id v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"scoredActions"];
    scoredActions = v5->_scoredActions;
    v5->_scoredActions = (NSArray *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cacheFileData"];
    cacheFileData = v5->_cacheFileData;
    v5->_cacheFileData = (NSData *)v11;

    uint64_t v13 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"proactiveSuggestions"];
    proactiveSuggestions = v5->_proactiveSuggestions;
    v5->_proactiveSuggestions = (NSArray *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"blendingUICacheUpdateUUID"];
    blendingModelUICacheUpdateUUID = v5->_blendingModelUICacheUpdateUUID;
    v5->_blendingModelUICacheUpdateUUID = (NSUUID *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v20;

    v5->_consumerSubType = [v4 decodeIntegerForKey:@"consumerSubType"];
    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"engagedActionKey"];
    engagedAction = v5->_engagedAction;
    v5->_engagedAction = (ATXAction *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"explicitlyDismissedActionIndices"];
    explicitlyDismissedActionIndices = v5->_explicitlyDismissedActionIndices;
    v5->_explicitlyDismissedActionIndices = (NSIndexSet *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"matchingDonatedIntentActionKey"];
    matchingIntentDonatedAction = v5->_matchingIntentDonatedAction;
    v5->_matchingIntentDonatedAction = (ATXAction *)v26;

    v5->_matchingIntentWasCompleteMatch = [v4 decodeBoolForKey:@"matchingDonatedIntentWasCompleteMatch"];
    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shownActionIndices"];
    shownActionIndices = v5->_shownActionIndices;
    v5->_shownActionIndices = (NSIndexSet *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"predictionDate"];
    predictionDate = v5->_predictionDate;
    v5->_predictionDate = (NSDate *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uiFeedbackDate"];
    uiFeedbackDate = v5->_uiFeedbackDate;
    v5->_uiFeedbackDate = (NSDate *)v32;

    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"donatedIntentDate"];
    donatedIntentDate = v5->_donatedIntentDate;
    v5->_donatedIntentDate = (NSDate *)v34;

    v5->_feedbackStage = [v4 decodeIntegerForKey:@"feedbackStage"];
    v5->_searchedActionType = [v4 decodeIntegerForKey:@"searchedActionType"];
    uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"engagedAppString"];
    engagedAppString = v5->_engagedAppString;
    v5->_engagedAppString = (NSString *)v36;

    v5->_containsRouteInternal = [v4 decodeBoolForKey:@"containsRouteInternal"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  scoredActions = self->_scoredActions;
  id v5 = a3;
  [v5 encodeObject:scoredActions forKey:@"scoredActions"];
  [v5 encodeObject:self->_cacheFileData forKey:@"cacheFileData"];
  [v5 encodeObject:self->_proactiveSuggestions forKey:@"proactiveSuggestions"];
  [v5 encodeObject:self->_blendingModelUICacheUpdateUUID forKey:@"blendingUICacheUpdateUUID"];
  [v5 encodeObject:self->_uuid forKey:@"uuid"];
  [v5 encodeInteger:self->_consumerSubType forKey:@"consumerSubType"];
  [v5 encodeObject:self->_engagedAction forKey:@"engagedActionKey"];
  [v5 encodeObject:self->_explicitlyDismissedActionIndices forKey:@"explicitlyDismissedActionIndices"];
  [v5 encodeObject:self->_matchingIntentDonatedAction forKey:@"matchingDonatedIntentActionKey"];
  [v5 encodeBool:self->_matchingIntentWasCompleteMatch forKey:@"matchingDonatedIntentWasCompleteMatch"];
  [v5 encodeObject:self->_shownActionIndices forKey:@"shownActionIndices"];
  [v5 encodeObject:self->_predictionDate forKey:@"predictionDate"];
  [v5 encodeObject:self->_uiFeedbackDate forKey:@"uiFeedbackDate"];
  [v5 encodeObject:self->_donatedIntentDate forKey:@"donatedIntentDate"];
  [v5 encodeInteger:self->_feedbackStage forKey:@"feedbackStage"];
  [v5 encodeInteger:self->_searchedActionType forKey:@"searchedActionType"];
  [v5 encodeObject:self->_engagedAppString forKey:@"engagedAppString"];
  [v5 encodeBool:self->_containsRouteInternal forKey:@"containsRouteInternal"];
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSArray)scoredActions
{
  return self->_scoredActions;
}

- (NSUUID)blendingModelUICacheUpdateUUID
{
  return self->_blendingModelUICacheUpdateUUID;
}

- (NSArray)proactiveSuggestions
{
  return self->_proactiveSuggestions;
}

- (NSDate)predictionDate
{
  return self->_predictionDate;
}

- (unsigned)consumerSubType
{
  return self->_consumerSubType;
}

- (ATXAction)engagedAction
{
  return self->_engagedAction;
}

- (unint64_t)feedbackStage
{
  return self->_feedbackStage;
}

- (NSDate)uiFeedbackDate
{
  return self->_uiFeedbackDate;
}

- (ATXAction)matchingIntentDonatedAction
{
  return self->_matchingIntentDonatedAction;
}

- (BOOL)matchingIntentWasCompleteMatch
{
  return self->_matchingIntentWasCompleteMatch;
}

- (NSDate)donatedIntentDate
{
  return self->_donatedIntentDate;
}

- (unint64_t)searchedActionType
{
  return self->_searchedActionType;
}

- (NSString)engagedAppString
{
  return self->_engagedAppString;
}

- (NSData)cacheFileData
{
  return self->_cacheFileData;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_cacheFileData, 0);
  objc_storeStrong((id *)&self->_engagedAppString, 0);
  objc_storeStrong((id *)&self->_donatedIntentDate, 0);
  objc_storeStrong((id *)&self->_matchingIntentDonatedAction, 0);
  objc_storeStrong((id *)&self->_uiFeedbackDate, 0);
  objc_storeStrong((id *)&self->_engagedAction, 0);
  objc_storeStrong((id *)&self->_predictionDate, 0);
  objc_storeStrong((id *)&self->_proactiveSuggestions, 0);
  objc_storeStrong((id *)&self->_blendingModelUICacheUpdateUUID, 0);
  objc_storeStrong((id *)&self->_scoredActions, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_shownActionsCache, 0);
  objc_storeStrong((id *)&self->_explicitlyDismissedActionIndices, 0);

  objc_storeStrong((id *)&self->_shownActionIndices, 0);
}

- (void)setContainsExternalRoute:(BOOL)a3
{
  self->_containsRouteInternal = a3;
}

- (id)routeDestinationTypeString
{
  if (self->_containsRouteInternal) {
    return @"airplay";
  }
  else {
    return @"local";
  }
}

- (BOOL)containsExternalRoute
{
  return self->_containsRouteInternal;
}

- (void)jsonData
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A790D000, a2, OS_LOG_TYPE_ERROR, "Unable to serialize ATXActionResponse. Error: %@", (uint8_t *)&v2, 0xCu);
}

@end