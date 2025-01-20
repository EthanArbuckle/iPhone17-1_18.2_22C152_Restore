@interface ATXStackRotationSession
+ (BOOL)supportsSecureCoding;
- (ATXHomeScreenEvent)endingStackChangeEvent;
- (ATXHomeScreenEvent)startingStackChangeEvent;
- (ATXStackRotationSession)initWithCoder:(id)a3;
- (ATXStackRotationSession)initWithStartingStackChangeEvent:(id)a3;
- (ATXStackRotationSession)initWithStartingStackChangeEvent:(id)a3 endingStackChangeEvent:(id)a4 engagementStatus:(unint64_t)a5 engagementStatusHistory:(id)a6 systemSuggestSuggestionLayout:(id)a7 dwellStartDate:(id)a8 longestDwell:(double)a9 isNPlusOneRotation:(BOOL)a10 isFirstNPlusOneRotation:(BOOL)a11 completed:(BOOL)a12;
- (ATXSuggestionLayout)systemSuggestSuggestionLayout;
- (BOOL)completed;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXStackRotationSession:(id)a3;
- (BOOL)isFirstNPlusOneRotation;
- (BOOL)isNPlusOneRotation;
- (NSDate)dwellStartDate;
- (NSDate)sessionEndDate;
- (NSDate)sessionStartDate;
- (NSMutableArray)engagementStatusHistory;
- (NSString)blendingCacheId;
- (NSString)rotationReason;
- (NSString)widgetBundleId;
- (NSString)widgetKind;
- (NSString)widgetUniqueId;
- (double)longestDwell;
- (id)description;
- (int)stackLocation;
- (unint64_t)engagementStatus;
- (void)blendingCacheId;
- (void)encodeWithCoder:(id)a3;
- (void)finalizeWithEndingStackChangeEvent:(id)a3;
- (void)markAddedToStack;
- (void)markRejectedRotationDismissOnce;
- (void)markRejectedRotationNeverShowAgain;
- (void)markStackHiddenAtDate:(id)a3;
- (void)markStackShownAtDate:(id)a3;
- (void)markStackTapped;
- (void)setCompleted:(BOOL)a3;
- (void)setDwellStartDate:(id)a3;
- (void)setEngagementStatus:(unint64_t)a3;
- (void)setIsFirstNPlusOneRotation:(BOOL)a3;
- (void)setIsNPlusOneRotation:(BOOL)a3;
- (void)setLongestDwell:(double)a3;
- (void)tryUpdateStackRotationEngagementStatus:(unint64_t)a3;
- (void)updateIsNPlusOneRotation:(BOOL)a3 isFirstNPlusOneRotation:(BOOL)a4;
- (void)updateWithSystemSuggestSuggestionLayout:(id)a3;
- (void)widgetBundleId;
- (void)widgetKind;
- (void)widgetUniqueId;
@end

@implementation ATXStackRotationSession

- (ATXStackRotationSession)initWithStartingStackChangeEvent:(id)a3
{
  id v4 = a3;
  v5 = [v4 widgetUniqueId];
  v6 = [v4 widgetBundleId];
  v7 = [v4 blendingCacheId];
  v8 = [v4 widgetKind];
  uint64_t v9 = [v4 reason];
  v10 = (void *)v9;
  if (v5 && v7 && v6 && v8 && v9)
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", &unk_1F27F0690, 0);
    BYTE2(v15) = 0;
    LOWORD(v15) = 0;
    self = -[ATXStackRotationSession initWithStartingStackChangeEvent:endingStackChangeEvent:engagementStatus:engagementStatusHistory:systemSuggestSuggestionLayout:dwellStartDate:longestDwell:isNPlusOneRotation:isFirstNPlusOneRotation:completed:](self, "initWithStartingStackChangeEvent:endingStackChangeEvent:engagementStatus:engagementStatusHistory:systemSuggestSuggestionLayout:dwellStartDate:longestDwell:isNPlusOneRotation:isFirstNPlusOneRotation:completed:", v4, 0, 0, v11, 0, 0, 0.0, v15);

    v12 = self;
  }
  else
  {
    v13 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      [(ATXStackRotationSession *)(uint64_t)self initWithStartingStackChangeEvent:v13];
    }

    v12 = 0;
  }

  return v12;
}

- (ATXStackRotationSession)initWithStartingStackChangeEvent:(id)a3 endingStackChangeEvent:(id)a4 engagementStatus:(unint64_t)a5 engagementStatusHistory:(id)a6 systemSuggestSuggestionLayout:(id)a7 dwellStartDate:(id)a8 longestDwell:(double)a9 isNPlusOneRotation:(BOOL)a10 isFirstNPlusOneRotation:(BOOL)a11 completed:(BOOL)a12
{
  id v19 = a3;
  id v20 = a4;
  id v21 = a6;
  id v27 = a7;
  id v22 = a8;
  v28.receiver = self;
  v28.super_class = (Class)ATXStackRotationSession;
  v23 = [(ATXStackRotationSession *)&v28 init];
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_startingStackChangeEvent, a3);
    objc_storeStrong((id *)&v24->_endingStackChangeEvent, a4);
    v24->_engagementStatus = a5;
    objc_storeStrong((id *)&v24->_engagementStatusHistory, a6);
    objc_storeStrong((id *)&v24->_systemSuggestSuggestionLayout, a7);
    objc_storeStrong((id *)&v24->_dwellStartDate, a8);
    v24->_longestDwell = a9;
    v24->_isNPlusOneRotation = a10;
    v24->_isFirstNPlusOneRotation = a11;
    v24->_completed = a12;
  }

  return v24;
}

- (void)updateIsNPlusOneRotation:(BOOL)a3 isFirstNPlusOneRotation:(BOOL)a4
{
  self->_isNPlusOneRotation = a3;
  self->_isFirstNPlusOneRotation = a4;
}

- (void)updateWithSystemSuggestSuggestionLayout:(id)a3
{
}

- (void)markStackShownAtDate:(id)a3
{
  objc_storeStrong((id *)&self->_dwellStartDate, a3);
  [(ATXStackRotationSession *)self tryUpdateStackRotationEngagementStatus:1];
}

- (void)markStackHiddenAtDate:(id)a3
{
  id v4 = a3;
  dwellStartDate = self->_dwellStartDate;
  id v8 = v4;
  if (v4 && dwellStartDate)
  {
    objc_msgSend(v4, "timeIntervalSinceDate:");
    double v7 = v6;
    if (v6 >= *(double *)&kATXMinTimeIntervalToBeConsideredDwell) {
      [(ATXStackRotationSession *)self tryUpdateStackRotationEngagementStatus:3];
    }
    if (v7 > self->_longestDwell) {
      self->_longestDwell = v7;
    }
    dwellStartDate = self->_dwellStartDate;
  }
  self->_dwellStartDate = 0;
}

- (void)markStackTapped
{
}

- (void)markAddedToStack
{
}

- (void)markRejectedRotationDismissOnce
{
}

- (void)markRejectedRotationNeverShowAgain
{
}

- (void)finalizeWithEndingStackChangeEvent:(id)a3
{
  id v9 = a3;
  objc_storeStrong((id *)&self->_endingStackChangeEvent, a3);
  v5 = [v9 date];
  [(ATXStackRotationSession *)self markStackHiddenAtDate:v5];

  double v6 = [v9 reason];
  double v7 = NSStringForATXHomeScreenStackChangeReason();
  int v8 = [v6 isEqualToString:v7];

  if (v8) {
    [(ATXStackRotationSession *)self tryUpdateStackRotationEngagementStatus:2];
  }
  self->_completed = 1;
}

- (void)tryUpdateStackRotationEngagementStatus:(unint64_t)a3
{
  engagementStatusHistory = self->_engagementStatusHistory;
  double v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  [(NSMutableArray *)engagementStatusHistory addObject:v6];

  if (self->_engagementStatus < a3) {
    self->_engagementStatus = a3;
  }
}

- (NSString)widgetUniqueId
{
  v2 = [(ATXHomeScreenEvent *)self->_startingStackChangeEvent widgetUniqueId];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    v5 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[ATXStackRotationSession widgetUniqueId]();
    }

    id v4 = &stru_1F2740B58;
  }

  return (NSString *)v4;
}

- (NSString)widgetBundleId
{
  v2 = [(ATXHomeScreenEvent *)self->_startingStackChangeEvent widgetBundleId];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    v5 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[ATXStackRotationSession widgetBundleId]();
    }

    id v4 = &stru_1F2740B58;
  }

  return (NSString *)v4;
}

- (NSString)widgetKind
{
  v2 = [(ATXHomeScreenEvent *)self->_startingStackChangeEvent widgetKind];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    v5 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[ATXStackRotationSession widgetKind]();
    }

    id v4 = &stru_1F2740B58;
  }

  return (NSString *)v4;
}

- (int)stackLocation
{
  uint64_t v2 = [(ATXHomeScreenEvent *)self->_startingStackChangeEvent stackLocation];
  return MEMORY[0x1F4108E68](v2);
}

- (NSString)blendingCacheId
{
  uint64_t v2 = [(ATXHomeScreenEvent *)self->_startingStackChangeEvent blendingCacheId];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    v5 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[ATXStackRotationSession blendingCacheId]();
    }

    id v4 = &stru_1F2740B58;
  }

  return (NSString *)v4;
}

- (NSDate)sessionStartDate
{
  return (NSDate *)[(ATXHomeScreenEvent *)self->_startingStackChangeEvent date];
}

- (NSDate)sessionEndDate
{
  return (NSDate *)[(ATXHomeScreenEvent *)self->_endingStackChangeEvent date];
}

- (NSString)rotationReason
{
  return (NSString *)[(ATXHomeScreenEvent *)self->_startingStackChangeEvent reason];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXStackRotationSession *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXStackRotationSession *)self isEqualToATXStackRotationSession:v5];

  return v6;
}

- (BOOL)isEqualToATXStackRotationSession:(id)a3
{
  id v4 = (id *)a3;
  startingStackChangeEvent = self->_startingStackChangeEvent;
  BOOL v6 = (ATXHomeScreenEvent *)v4[2];
  if (startingStackChangeEvent == v6)
  {
  }
  else
  {
    double v7 = v6;
    int v8 = startingStackChangeEvent;
    char v9 = [(ATXHomeScreenEvent *)v8 isEqual:v7];

    if ((v9 & 1) == 0) {
      goto LABEL_26;
    }
  }
  endingStackChangeEvent = self->_endingStackChangeEvent;
  v11 = (ATXHomeScreenEvent *)v4[3];
  if (endingStackChangeEvent == v11)
  {
  }
  else
  {
    v12 = v11;
    v13 = endingStackChangeEvent;
    char v14 = [(ATXHomeScreenEvent *)v13 isEqual:v12];

    if ((v14 & 1) == 0) {
      goto LABEL_26;
    }
  }
  if (self->_engagementStatus != v4[4])
  {
LABEL_26:
    BOOL v30 = 0;
    goto LABEL_27;
  }
  engagementStatusHistory = self->_engagementStatusHistory;
  v16 = (NSMutableArray *)v4[5];
  if (engagementStatusHistory == v16)
  {
  }
  else
  {
    v17 = v16;
    v18 = engagementStatusHistory;
    char v19 = [(NSMutableArray *)v18 isEqual:v17];

    if ((v19 & 1) == 0) {
      goto LABEL_26;
    }
  }
  systemSuggestSuggestionLayout = self->_systemSuggestSuggestionLayout;
  id v21 = (ATXSuggestionLayout *)v4[6];
  if (systemSuggestSuggestionLayout == v21)
  {
  }
  else
  {
    id v22 = v21;
    v23 = systemSuggestSuggestionLayout;
    char v24 = [(ATXSuggestionLayout *)v23 isEqual:v22];

    if ((v24 & 1) == 0) {
      goto LABEL_26;
    }
  }
  dwellStartDate = self->_dwellStartDate;
  v26 = (NSDate *)v4[7];
  if (dwellStartDate == v26)
  {
  }
  else
  {
    id v27 = v26;
    objc_super v28 = dwellStartDate;
    char v29 = [(NSDate *)v28 isEqual:v27];

    if ((v29 & 1) == 0) {
      goto LABEL_26;
    }
  }
  if (self->_longestDwell != *((double *)v4 + 8)
    || self->_isNPlusOneRotation != *((unsigned __int8 *)v4 + 8)
    || self->_isFirstNPlusOneRotation != *((unsigned __int8 *)v4 + 9))
  {
    goto LABEL_26;
  }
  BOOL v30 = self->_completed == *((unsigned __int8 *)v4 + 10);
LABEL_27:

  return v30;
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  BOOL v6 = [(ATXStackRotationSession *)self rotationReason];
  double v7 = [(ATXStackRotationSession *)self widgetUniqueId];
  int v8 = [(ATXStackRotationSession *)self widgetBundleId];
  char v9 = [(ATXStackRotationSession *)self blendingCacheId];
  v10 = [(ATXStackRotationSession *)self sessionStartDate];
  uint64_t v11 = [(ATXStackRotationSession *)self sessionEndDate];
  v12 = (void *)v11;
  v13 = @"YES";
  if (self->_completed) {
    char v14 = @"YES";
  }
  else {
    char v14 = @"NO";
  }
  if (self->_isNPlusOneRotation) {
    uint64_t v15 = @"YES";
  }
  else {
    uint64_t v15 = @"NO";
  }
  if (!self->_isFirstNPlusOneRotation) {
    v13 = @"NO";
  }
  v16 = (void *)[v3 initWithFormat:@"%@ - rotationReason: %@, widgetId: %@, widgetBundleId: %@, blendingId: %@, startDate: %@, endDate: %@, dwellStart: %@, dwellSession: %f, engagementStatus: %lu, completed: %@, isNPlusOne: %@, isFirstNPlusOne: %@", v5, v6, v7, v8, v9, v10, v11, self->_dwellStartDate, *(void *)&self->_longestDwell, self->_engagementStatus, v14, v15, v13];

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  startingStackChangeEvent = self->_startingStackChangeEvent;
  id v5 = a3;
  [v5 encodeObject:startingStackChangeEvent forKey:@"codingKeyForStartingStackChangeEvent"];
  [v5 encodeObject:self->_endingStackChangeEvent forKey:@"codingKeyForEndingStackChangeEvent"];
  [v5 encodeInteger:self->_engagementStatus forKey:@"codingKeyForEngagementStatus"];
  [v5 encodeObject:self->_engagementStatusHistory forKey:@"codingKeyForEngagementStatusHistory"];
  [v5 encodeObject:self->_systemSuggestSuggestionLayout forKey:@"codingKeyForSystemSuggestSuggestionLayout"];
  [v5 encodeObject:self->_dwellStartDate forKey:@"codingKeyForDwellStartDate"];
  [v5 encodeDouble:@"codingKeyForLongestDwell" forKey:self->_longestDwell];
  [v5 encodeBool:self->_isNPlusOneRotation forKey:@"codingKeyForNPlusOneRotation"];
  [v5 encodeBool:self->_isFirstNPlusOneRotation forKey:@"codingKeyForFirstNPlusOneRotation"];
  [v5 encodeBool:self->_completed forKey:@"codingKeyForCompleted"];
}

- (ATXStackRotationSession)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v6 = objc_opt_class();
  double v7 = __atxlog_handle_metrics();
  int v8 = [v5 robustDecodeObjectOfClass:v6 forKey:@"codingKeyForStartingStackChangeEvent" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.StackRotationStatus" errorCode:-1 logHandle:v7];

  if (v8 && ([v4 error], char v9 = objc_claimAutoreleasedReturnValue(), v9, !v9))
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F93B90];
    uint64_t v12 = objc_opt_class();
    v13 = __atxlog_handle_metrics();
    char v14 = [v11 robustDecodeObjectOfClass:v12 forKey:@"codingKeyForEndingStackChangeEvent" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.proactive.StackRotationStatus" errorCode:-1 logHandle:v13];

    uint64_t v15 = [v4 error];

    if (v15
      || (uint64_t v16 = [v4 decodeIntegerForKey:@"codingKeyForEngagementStatus"],
          [v4 error],
          v17 = objc_claimAutoreleasedReturnValue(),
          v17,
          v17))
    {
      v10 = 0;
    }
    else
    {
      char v19 = (void *)MEMORY[0x1E4F93B90];
      id v20 = (void *)MEMORY[0x1D25F6CC0]();
      id v21 = objc_alloc(MEMORY[0x1E4F1CAD0]);
      uint64_t v22 = objc_opt_class();
      v23 = objc_msgSend(v21, "initWithObjects:", v22, objc_opt_class(), 0);
      char v24 = __atxlog_handle_metrics();
      v25 = [v19 robustDecodeObjectOfClasses:v23 forKey:@"codingKeyForEngagementStatusHistory" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.StackRotationStatus" errorCode:-1 logHandle:v24];

      if (v25
        && ([v4 error], v26 = objc_claimAutoreleasedReturnValue(), v26, !v26))
      {
        id v27 = (void *)MEMORY[0x1E4F93B90];
        uint64_t v28 = objc_opt_class();
        char v29 = __atxlog_handle_metrics();
        BOOL v30 = [v27 robustDecodeObjectOfClass:v28 forKey:@"codingKeyForSystemSuggestSuggestionLayout" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.proactive.StackRotationStatus" errorCode:-1 logHandle:v29];

        v31 = [v4 error];

        if (v31)
        {
          v10 = 0;
        }
        else
        {
          v32 = (void *)MEMORY[0x1E4F93B90];
          uint64_t v33 = objc_opt_class();
          v34 = __atxlog_handle_metrics();
          v35 = [v32 robustDecodeObjectOfClass:v33 forKey:@"codingKeyForDwellStartDate" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.proactive.StackRotationStatus" errorCode:-1 logHandle:v34];

          v36 = [v4 error];

          if (v36) {
            goto LABEL_19;
          }
          [v4 decodeDoubleForKey:@"codingKeyForLongestDwell"];
          double v38 = v37;
          v39 = [v4 error];

          if (v39) {
            goto LABEL_19;
          }
          uint64_t v40 = [v4 decodeBoolForKey:@"codingKeyForNPlusOneRotation"];
          v41 = [v4 error];

          if (v41) {
            goto LABEL_19;
          }
          char v46 = [v4 decodeBoolForKey:@"codingKeyForFirstNPlusOneRotation"];
          v42 = [v4 error];

          if (v42
            || (char v45 = [v4 decodeBoolForKey:@"codingKeyForCompleted"],
                [v4 error],
                v43 = objc_claimAutoreleasedReturnValue(),
                v43,
                v43))
          {
LABEL_19:
            v10 = 0;
          }
          else
          {
            BYTE2(v44) = v45;
            BYTE1(v44) = v46;
            LOBYTE(v44) = v40;
            self = -[ATXStackRotationSession initWithStartingStackChangeEvent:endingStackChangeEvent:engagementStatus:engagementStatusHistory:systemSuggestSuggestionLayout:dwellStartDate:longestDwell:isNPlusOneRotation:isFirstNPlusOneRotation:completed:](self, "initWithStartingStackChangeEvent:endingStackChangeEvent:engagementStatus:engagementStatusHistory:systemSuggestSuggestionLayout:dwellStartDate:longestDwell:isNPlusOneRotation:isFirstNPlusOneRotation:completed:", v8, v14, v16, v25, v30, v35, v38, v44);
            v10 = self;
          }
        }
      }
      else
      {
        v10 = 0;
      }
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (ATXHomeScreenEvent)startingStackChangeEvent
{
  return self->_startingStackChangeEvent;
}

- (ATXHomeScreenEvent)endingStackChangeEvent
{
  return self->_endingStackChangeEvent;
}

- (unint64_t)engagementStatus
{
  return self->_engagementStatus;
}

- (void)setEngagementStatus:(unint64_t)a3
{
  self->_engagementStatus = a3;
}

- (NSMutableArray)engagementStatusHistory
{
  return self->_engagementStatusHistory;
}

- (ATXSuggestionLayout)systemSuggestSuggestionLayout
{
  return self->_systemSuggestSuggestionLayout;
}

- (NSDate)dwellStartDate
{
  return self->_dwellStartDate;
}

- (void)setDwellStartDate:(id)a3
{
}

- (double)longestDwell
{
  return self->_longestDwell;
}

- (void)setLongestDwell:(double)a3
{
  self->_longestDwell = a3;
}

- (BOOL)isNPlusOneRotation
{
  return self->_isNPlusOneRotation;
}

- (void)setIsNPlusOneRotation:(BOOL)a3
{
  self->_isNPlusOneRotation = a3;
}

- (BOOL)isFirstNPlusOneRotation
{
  return self->_isFirstNPlusOneRotation;
}

- (void)setIsFirstNPlusOneRotation:(BOOL)a3
{
  self->_isFirstNPlusOneRotation = a3;
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
  objc_storeStrong((id *)&self->_dwellStartDate, 0);
  objc_storeStrong((id *)&self->_systemSuggestSuggestionLayout, 0);
  objc_storeStrong((id *)&self->_engagementStatusHistory, 0);
  objc_storeStrong((id *)&self->_endingStackChangeEvent, 0);
  objc_storeStrong((id *)&self->_startingStackChangeEvent, 0);
}

- (void)initWithStartingStackChangeEvent:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_1();
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_1D0FA3000, a3, OS_LOG_TYPE_ERROR, "%@ - could not create new session from homescreen event: %@", v7, 0x16u);
}

- (void)widgetUniqueId
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0FA3000, v2, v3, "%@ - could not find widgetUniqueId", v4, v5, v6, v7, v8);
}

- (void)widgetBundleId
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0FA3000, v2, v3, "%@ - could not find widgetBundleId", v4, v5, v6, v7, v8);
}

- (void)widgetKind
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0FA3000, v2, v3, "%@ - could not find widgetKind", v4, v5, v6, v7, v8);
}

- (void)blendingCacheId
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0FA3000, v2, v3, "%@ - could not find blendingCacheId", v4, v5, v6, v7, v8);
}

@end