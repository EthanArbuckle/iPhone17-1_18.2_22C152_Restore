@interface ATXHomeScreenLogUnlockSessionManager
+ (BOOL)supportsSecureCoding;
+ (id)_currentSettings;
+ (id)currentSettings;
- (ATXHomeScreenLogUnlockSessionManager)init;
- (ATXHomeScreenLogUnlockSessionManager)initWithCoder:(id)a3;
- (ATXHomeScreenLogUnlockSessionManager)initWithIsInSession:(BOOL)a3 currentSession:(id)a4 completedSessions:(id)a5;
- (ATXScreenLogUnlockSession)currentSession;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXHomeScreenLogUnlockSessionManager:(id)a3;
- (BOOL)isInSession;
- (NSMutableArray)completedSessions;
- (id)removeCompletedSessions;
- (id)summarizeCompletedSessions;
- (int64_t)_eventStatusWithUIEvent:(id)a3;
- (int64_t)updateSessionStateWithUIEvent:(id)a3;
- (void)_updateCurrentSessionWithUIEvent:(id)a3 eventStatus:(int64_t)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setCompletedSessions:(id)a3;
- (void)setCurrentSession:(id)a3;
- (void)setIsInSession:(BOOL)a3;
@end

@implementation ATXHomeScreenLogUnlockSessionManager

- (ATXHomeScreenLogUnlockSessionManager)init
{
  v3 = objc_opt_new();
  v4 = [(ATXHomeScreenLogUnlockSessionManager *)self initWithIsInSession:0 currentSession:0 completedSessions:v3];

  return v4;
}

- (ATXHomeScreenLogUnlockSessionManager)initWithIsInSession:(BOOL)a3 currentSession:(id)a4 completedSessions:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)ATXHomeScreenLogUnlockSessionManager;
  v11 = [(ATXHomeScreenLogUnlockSessionManager *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_isInSession = a3;
    objc_storeStrong((id *)&v11->_currentSession, a4);
    objc_storeStrong((id *)&v12->_completedSessions, a5);
  }

  return v12;
}

- (int64_t)_eventStatusWithUIEvent:(id)a3
{
  v4 = [a3 homeScreenEvent];
  id v5 = [v4 eventTypeString];
  if (([v5 isEqualToString:@"Unknown"] & 1) == 0
    && ([v5 isEqualToString:@"HomeScreenPageShown"] & 1) == 0
    && ([v5 isEqualToString:@"HomeScreenDisappeared"] & 1) == 0
    && ([v5 isEqualToString:@"StackChanged"] & 1) == 0
    && ([v5 isEqualToString:@"WidgetTapped"] & 1) == 0
    && ([v5 isEqualToString:@"WidgetLongLook"] & 1) == 0
    && ([v5 isEqualToString:@"WidgetUserFeedback"] & 1) == 0
    && ([v5 isEqualToString:@"UserStackConfigChanged"] & 1) == 0)
  {
    if ([v5 isEqualToString:@"DeviceLocked"])
    {

      self->_isInSession = 0;
      int64_t v6 = 2;
      goto LABEL_12;
    }
    if ([v5 isEqualToString:@"DeviceUnlocked"])
    {

      int64_t v6 = 1;
      self->_isInSession = 1;
      goto LABEL_12;
    }
    if (([v5 isEqualToString:@"PinnedWidgetAdded"] & 1) == 0
      && ([v5 isEqualToString:@"PinnedWidgetDeleted"] & 1) == 0
      && ([v5 isEqualToString:@"SpecialPageAppeared"] & 1) == 0
      && ([v5 isEqualToString:@"SpecialPageDisappeared"] & 1) == 0
      && ([v5 isEqualToString:@"StackShown"] & 1) == 0
      && ([v5 isEqualToString:@"StackDisappeared"] & 1) == 0
      && ([v5 isEqualToString:@"StackCreated"] & 1) == 0
      && ([v5 isEqualToString:@"StackDeleted"] & 1) == 0
      && ([v5 isEqualToString:@"WidgetAddedToStack"] & 1) == 0
      && ([v5 isEqualToString:@"WidgetRemovedFromStack"] & 1) == 0
      && ([v5 isEqualToString:@"StackVisibilityChanged"] & 1) == 0
      && ([v5 isEqualToString:@"AppAdded"] & 1) == 0)
    {
      [v5 isEqualToString:@"AppRemoved"];
    }
  }

  if (self->_isInSession) {
    int64_t v6 = 3;
  }
  else {
    int64_t v6 = 4;
  }
LABEL_12:

  return v6;
}

- (void)_updateCurrentSessionWithUIEvent:(id)a3 eventStatus:(int64_t)a4
{
  id v15 = a3;
  int64_t v6 = [v15 homeScreenEvent];
  v7 = [(id)objc_opt_class() currentSettings];
  switch(a4)
  {
    case 0:
    case 4:
      goto LABEL_5;
    case 1:
      v8 = [ATXScreenLogUnlockSession alloc];
      id v9 = [v6 date];
      id v10 = [(ATXScreenLogUnlockSession *)v8 initWithSessionStartDate:v9];
      currentSession = self->_currentSession;
      self->_currentSession = v10;

      -[ATXScreenLogUnlockSession setSpotlightEnabled:](self->_currentSession, "setSpotlightEnabled:", [v7 spotlightEnabled]);
      -[ATXScreenLogUnlockSession setHasSuggestionsWidget:](self->_currentSession, "setHasSuggestionsWidget:", [v7 hasSuggestionsWidget]);
      -[ATXScreenLogUnlockSession setHasSuggestionsWidgetInTodayPage:](self->_currentSession, "setHasSuggestionsWidgetInTodayPage:", [v7 hasSuggestionsWidgetToday]);
      -[ATXScreenLogUnlockSession setHasAppPredictionPanel:](self->_currentSession, "setHasAppPredictionPanel:", [v7 hasAppPredictionPanel]);
      -[ATXScreenLogUnlockSession setHasAppPredictionPanelInTodayPage:](self->_currentSession, "setHasAppPredictionPanelInTodayPage:", [v7 hasAppPredictionPanelToday]);
      -[ATXScreenLogUnlockSession setAppLibraryEnabled:](self->_currentSession, "setAppLibraryEnabled:", [v7 appLibraryEnabled]);
      break;
    case 2:
      v12 = self->_currentSession;
      if (v12)
      {
        v13 = [v6 date];
        [(ATXScreenLogUnlockSession *)v12 finalizeWithSessionEndDate:v13];

        [(NSMutableArray *)self->_completedSessions addObject:self->_currentSession];
LABEL_5:
        objc_super v14 = self->_currentSession;
        self->_currentSession = 0;
      }
      break;
    case 3:
      [(ATXScreenLogUnlockSession *)self->_currentSession updateWithUIEventIfPossible:v15];
      break;
    default:
      break;
  }
}

- (int64_t)updateSessionStateWithUIEvent:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(ATXHomeScreenLogUnlockSessionManager *)self _eventStatusWithUIEvent:v4];
  [(ATXHomeScreenLogUnlockSessionManager *)self _updateCurrentSessionWithUIEvent:v4 eventStatus:v5];

  return v5;
}

- (id)removeCompletedSessions
{
  v3 = self->_completedSessions;
  id v4 = (NSMutableArray *)objc_opt_new();
  completedSessions = self->_completedSessions;
  self->_completedSessions = v4;

  int64_t v6 = (void *)[(NSMutableArray *)v3 copy];
  return v6;
}

- (id)summarizeCompletedSessions
{
  v2 = self;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  obj = self->_completedSessions;
  uint64_t v3 = [(NSMutableArray *)obj countByEnumeratingWithState:&v29 objects:v35 count:16];
  double v4 = 0.0;
  if (v3)
  {
    uint64_t v5 = v3;
    v26 = v2;
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    unint64_t v10 = 0;
    uint64_t v28 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v30 != v28) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        v13 = [v12 sessionEndDate];
        objc_super v14 = [v12 sessionStartDate];
        [v13 timeIntervalSinceDate:v14];
        unint64_t v10 = (unint64_t)(v15 + (double)v10);

        if ([v12 numEngagementsInAppLibrary]) {
          ++v6;
        }
        if ([v12 numEngagementsInAppPredictionPanel]) {
          ++v7;
        }
        if ([v12 numEngagementsInAppPredictionPanelTodayPage]) {
          ++v7;
        }
        if ([v12 numEngagementsInSpotlightApps]) {
          ++v9;
        }
        if ([v12 numEngagementsInSpotlightActions]) {
          ++v8;
        }
        [v12 numEngagementsInSuggestionsWidget];
        [v12 numEngagementsInSuggestionsWidgetTodayPage];
      }
      uint64_t v5 = [(NSMutableArray *)obj countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v5);
    double v16 = (double)v10;
    v2 = v26;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    double v16 = 0.0;
  }

  if ([(NSMutableArray *)v2->_completedSessions count]) {
    double v4 = v16 / (double)(unint64_t)[(NSMutableArray *)v2->_completedSessions count];
  }
  v33[0] = @"NumberOfLockUnlockSessions";
  v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSMutableArray count](v2->_completedSessions, "count"));
  v34[0] = v17;
  v33[1] = @"AverageSessionLength";
  v18 = [NSNumber numberWithDouble:v4];
  v34[1] = v18;
  v33[2] = @"NumSessionsWithAppLibraryPredictionEngagement";
  v19 = [NSNumber numberWithUnsignedInteger:v6];
  v34[2] = v19;
  v33[3] = @"NumSessionsWithAppPanelEngagement";
  v20 = [NSNumber numberWithUnsignedInteger:v7];
  v34[3] = v20;
  v33[4] = @"NumSessionsWithSpotlightActionEngagement";
  v21 = [NSNumber numberWithUnsignedInteger:v8];
  v34[4] = v21;
  v33[5] = @"NumSessionsWithSpotlightAppEngagement";
  v22 = [NSNumber numberWithUnsignedInteger:v9];
  v34[5] = v22;
  v33[6] = @"NumSessionsWithSuggestionWidgetEngagement";
  v23 = [NSNumber numberWithUnsignedInteger:v9];
  v34[6] = v23;
  v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:7];

  return v24;
}

+ (id)_currentSettings
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_new();
  uint64_t v3 = (void *)CFPreferencesCopyValue(@"SBSearchDisabledDomains", @"com.apple.spotlightui", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  uint64_t v4 = [v3 containsObject:@"DOMAIN_ZKWS"] ^ 1;

  [v2 setSpotlightEnabled:v4];
  uint64_t v5 = (void *)CFPreferencesCopyAppValue(@"SuggestionsAppLibraryEnabled", @"com.apple.suggestions");
  uint64_t v6 = v5;
  if (v5) {
    uint64_t v7 = [v5 BOOLValue];
  }
  else {
    uint64_t v7 = 1;
  }

  [v2 setAppLibraryEnabled:v7];
  uint64_t v8 = objc_opt_new();
  uint64_t v9 = [v8 loadHomeScreenAndTodayPageConfigurationsWithError:0];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    uint64_t v13 = *MEMORY[0x1E4F4B540];
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        double v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v16 = [v15 pageIndex];
        int v17 = [MEMORY[0x1E4F4B078] appPredictionPanelExistsInPage:v15];
        if (v16 == v13)
        {
          if (v17) {
            [v2 setHasAppPredictionPanelToday:1];
          }
          if ([MEMORY[0x1E4F4B078] suggestionsWidgetExistsInPage:v15]) {
            [v2 setHasSuggestionsWidgetToday:1];
          }
        }
        else
        {
          if (v17) {
            [v2 setHasAppPredictionPanel:1];
          }
          if ([MEMORY[0x1E4F4B078] suggestionsWidgetExistsInPage:v15]) {
            [v2 setHasSuggestionsWidget:1];
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }

  return v2;
}

+ (id)currentSettings
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__ATXHomeScreenLogUnlockSessionManager_currentSettings__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (currentSettings__pasOnceToken6 != -1) {
    dispatch_once(&currentSettings__pasOnceToken6, block);
  }
  v2 = (void *)currentSettings__pasExprOnceResult;
  return v2;
}

void __55__ATXHomeScreenLogUnlockSessionManager_currentSettings__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v3 = [*(id *)(a1 + 32) _currentSettings];
  uint64_t v4 = (void *)currentSettings__pasExprOnceResult;
  currentSettings__pasExprOnceResult = v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL isInSession = self->_isInSession;
  id v5 = a3;
  [v5 encodeBool:isInSession forKey:@"isInSession"];
  [v5 encodeObject:self->_currentSession forKey:@"currentSession"];
  [v5 encodeObject:self->_completedSessions forKey:@"completedSessions"];
}

- (ATXHomeScreenLogUnlockSessionManager)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeBoolForKey:@"isInSession"];
  uint64_t v6 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = __atxlog_handle_metrics();
  uint64_t v9 = [v6 robustDecodeObjectOfClass:v7 forKey:@"currentSession" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.duetexpertd.ATXHomeScreenLogUnlockSessionManager" errorCode:-1 logHandle:v8];

  uint64_t v10 = (void *)MEMORY[0x1D25F6CC0]();
  id v11 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_msgSend(v11, "initWithObjects:", v12, objc_opt_class(), 0);
  objc_super v14 = (void *)MEMORY[0x1E4F93B90];
  double v15 = __atxlog_handle_metrics();
  uint64_t v16 = [v14 robustDecodeObjectOfClasses:v13 forKey:@"completedSessions" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.duetexpertd.ATXHomeScreenLogUnlockSessionManager" errorCode:-1 logHandle:v15];

  if (v16)
  {
    self = [(ATXHomeScreenLogUnlockSessionManager *)self initWithIsInSession:v5 currentSession:v9 completedSessions:v16];
    int v17 = self;
  }
  else
  {
    int v17 = 0;
  }

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXHomeScreenLogUnlockSessionManager *)a3;
  uint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXHomeScreenLogUnlockSessionManager *)self isEqualToATXHomeScreenLogUnlockSessionManager:v5];

  return v6;
}

- (BOOL)isEqualToATXHomeScreenLogUnlockSessionManager:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  uint64_t v5 = v4;
  if (self->_isInSession != v4[8]) {
    goto LABEL_4;
  }
  currentSession = self->_currentSession;
  uint64_t v7 = (ATXScreenLogUnlockSession *)*((id *)v4 + 2);
  if (currentSession == v7)
  {
  }
  else
  {
    uint64_t v8 = v7;
    uint64_t v9 = currentSession;
    BOOL v10 = [(ATXScreenLogUnlockSession *)v9 isEqual:v8];

    if (!v10)
    {
LABEL_4:
      char v11 = 0;
      goto LABEL_10;
    }
  }
  uint64_t v12 = self->_completedSessions;
  uint64_t v13 = v12;
  if (v12 == (NSMutableArray *)v5[3]) {
    char v11 = 1;
  }
  else {
    char v11 = -[NSMutableArray isEqual:](v12, "isEqual:");
  }

LABEL_10:
  return v11;
}

- (BOOL)isInSession
{
  return self->_isInSession;
}

- (void)setIsInSession:(BOOL)a3
{
  self->_BOOL isInSession = a3;
}

- (ATXScreenLogUnlockSession)currentSession
{
  return self->_currentSession;
}

- (void)setCurrentSession:(id)a3
{
}

- (NSMutableArray)completedSessions
{
  return self->_completedSessions;
}

- (void)setCompletedSessions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completedSessions, 0);
  objc_storeStrong((id *)&self->_currentSession, 0);
}

@end