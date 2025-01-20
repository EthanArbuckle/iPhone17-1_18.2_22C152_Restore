@interface ATXScreenLogUnlockSession
+ (BOOL)supportsSecureCoding;
- (ATXScreenLogUnlockSession)initWithCoder:(id)a3;
- (ATXScreenLogUnlockSession)initWithSessionStartDate:(id)a3;
- (BOOL)_widgetBundleIdIsSuggestionsWidget:(id)a3;
- (BOOL)appLibraryEnabled;
- (BOOL)complete;
- (BOOL)hasAppPredictionPanel;
- (BOOL)hasAppPredictionPanelInTodayPage;
- (BOOL)hasSuggestionsWidget;
- (BOOL)hasSuggestionsWidgetInTodayPage;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXScreenLogUnlockSession:(id)a3;
- (BOOL)spotlightEnabled;
- (NSDate)sessionEndDate;
- (NSDate)sessionStartDate;
- (unint64_t)hash;
- (unint64_t)numEngagementsInAppLibrary;
- (unint64_t)numEngagementsInAppPredictionPanel;
- (unint64_t)numEngagementsInAppPredictionPanelTodayPage;
- (unint64_t)numEngagementsInSpotlightActions;
- (unint64_t)numEngagementsInSpotlightApps;
- (unint64_t)numEngagementsInSuggestionsWidget;
- (unint64_t)numEngagementsInSuggestionsWidgetTodayPage;
- (unint64_t)numViewsInAppLibrary;
- (unint64_t)numViewsInAppPredictionPanel;
- (unint64_t)numViewsInAppPredictionPanelTodayPage;
- (unint64_t)numViewsInSpotlightActions;
- (unint64_t)numViewsInSpotlightApps;
- (unint64_t)numViewsInSuggestionsWidget;
- (unint64_t)numViewsInSuggestionsWidgetTodayPage;
- (void)_updateWithAppDirectoryEvent:(id)a3;
- (void)_updateWithHomeScreenEvent:(id)a3;
- (void)_updateWithSpotlightEvent:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)finalizeWithSessionEndDate:(id)a3;
- (void)setAppLibraryEnabled:(BOOL)a3;
- (void)setHasAppPredictionPanel:(BOOL)a3;
- (void)setHasAppPredictionPanelInTodayPage:(BOOL)a3;
- (void)setHasSuggestionsWidget:(BOOL)a3;
- (void)setHasSuggestionsWidgetInTodayPage:(BOOL)a3;
- (void)setNumEngagementsInAppLibrary:(unint64_t)a3;
- (void)setNumEngagementsInAppPredictionPanel:(unint64_t)a3;
- (void)setNumEngagementsInAppPredictionPanelTodayPage:(unint64_t)a3;
- (void)setNumEngagementsInSpotlightActions:(unint64_t)a3;
- (void)setNumEngagementsInSpotlightApps:(unint64_t)a3;
- (void)setNumEngagementsInSuggestionsWidget:(unint64_t)a3;
- (void)setNumEngagementsInSuggestionsWidgetTodayPage:(unint64_t)a3;
- (void)setNumViewsInAppLibrary:(unint64_t)a3;
- (void)setNumViewsInAppPredictionPanel:(unint64_t)a3;
- (void)setNumViewsInAppPredictionPanelTodayPage:(unint64_t)a3;
- (void)setNumViewsInSpotlightActions:(unint64_t)a3;
- (void)setNumViewsInSpotlightApps:(unint64_t)a3;
- (void)setNumViewsInSuggestionsWidget:(unint64_t)a3;
- (void)setNumViewsInSuggestionsWidgetTodayPage:(unint64_t)a3;
- (void)setSessionEndDate:(id)a3;
- (void)setSessionStartDate:(id)a3;
- (void)setSpotlightEnabled:(BOOL)a3;
- (void)updateWithUIEventIfPossible:(id)a3;
@end

@implementation ATXScreenLogUnlockSession

- (ATXScreenLogUnlockSession)initWithSessionStartDate:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXScreenLogUnlockSession;
  v6 = [(ATXScreenLogUnlockSession *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_sessionStartDate, a3);
  }

  return v7;
}

- (void)updateWithUIEventIfPossible:(id)a3
{
  id v7 = a3;
  v4 = [v7 homeScreenEvent];
  if (v4)
  {
    [(ATXScreenLogUnlockSession *)self _updateWithHomeScreenEvent:v4];
  }
  else
  {
    id v5 = [v7 spotlightEvent];
    if (v5)
    {
      [(ATXScreenLogUnlockSession *)self _updateWithSpotlightEvent:v5];
    }
    else
    {
      v6 = [v7 appDirectoryEvent];
      if (v6) {
        [(ATXScreenLogUnlockSession *)self _updateWithAppDirectoryEvent:v6];
      }
    }
  }
}

- (void)_updateWithSpotlightEvent:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v13 = v4;
    if ([v4 eventType] == 4)
    {
      id v5 = [v13 appSuggestionIds];
      self->_numEngagementsInSpotlightApps += [v5 count];

      v6 = [v13 actionSuggestionIds];
      uint64_t v7 = [v6 count];
      uint64_t v8 = 40;
LABEL_9:
      *(Class *)((char *)&self->super.isa + v8) = (Class)(*(char **)((char *)&self->super.isa + v8) + v7);

      id v4 = v13;
      goto LABEL_10;
    }
    BOOL v9 = [v13 eventType] == 3;
    id v4 = v13;
    if (v9)
    {
      v10 = [v13 appSuggestionIds];
      uint64_t v11 = [v10 count];
      unint64_t numViewsInSpotlightApps = self->_numViewsInSpotlightApps;
      if (v11) {
        ++numViewsInSpotlightApps;
      }
      self->_unint64_t numViewsInSpotlightApps = numViewsInSpotlightApps;

      v6 = [v13 actionSuggestionIds];
      uint64_t v7 = [v6 count] != 0;
      uint64_t v8 = 96;
      goto LABEL_9;
    }
  }
LABEL_10:
}

- (BOOL)_widgetBundleIdIsSuggestionsWidget:(id)a3
{
  id v4 = a3;
  char v5 = [v4 isEqualToString:*MEMORY[0x1E4F4B5F8]];
  if ((v5 & 1) == 0 && ([v4 isEqualToString:*MEMORY[0x1E4F4AD48]] & 1) == 0)
  {
    v6 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      [(ATXScreenLogUnlockSession *)(uint64_t)self _widgetBundleIdIsSuggestionsWidget:v6];
    }
  }
  return v5;
}

- (void)_updateWithHomeScreenEvent:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v19 = v4;
    char v5 = [v4 widgetBundleId];
    if (v5)
    {
      [v19 stackLocation];
      int IsTodayPage = ATXStackLocationIsTodayPage();
      uint64_t v7 = [v19 eventTypeString];
      int v8 = [v7 isEqualToString:@"Tapped"];

      if (v8)
      {
        BOOL v9 = [(ATXScreenLogUnlockSession *)self _widgetBundleIdIsSuggestionsWidget:v5];
        v10 = [v19 suggestionIds];
        uint64_t v11 = [v10 count];
        uint64_t v12 = 64;
        if (v9) {
          uint64_t v12 = 48;
        }
        BOOL v13 = !v9;
        uint64_t v14 = 72;
        uint64_t v15 = 56;
LABEL_11:
        if (!v13) {
          uint64_t v14 = v15;
        }
        if (IsTodayPage) {
          uint64_t v12 = v14;
        }
        *(Class *)((char *)&self->super.isa + v12) = (Class)(*(char **)((char *)&self->super.isa + v12) + v11);

        goto LABEL_16;
      }
      v16 = [v19 eventTypeString];
      int v17 = [v16 isEqualToString:@"SuggestionsAppeared"];

      if (v17)
      {
        BOOL v18 = [(ATXScreenLogUnlockSession *)self _widgetBundleIdIsSuggestionsWidget:v5];
        v10 = [v19 suggestionIds];
        uint64_t v11 = [v10 count] != 0;
        uint64_t v12 = 120;
        if (v18) {
          uint64_t v12 = 104;
        }
        BOOL v13 = !v18;
        uint64_t v14 = 128;
        uint64_t v15 = 112;
        goto LABEL_11;
      }
    }
LABEL_16:

    id v4 = v19;
  }
}

- (void)_updateWithAppDirectoryEvent:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v13 = v4;
    uint64_t v5 = [v4 eventType];
    uint64_t v6 = [v13 eventType];
    uint64_t v7 = [v13 categoryID];
    if (v7)
    {
      int v8 = [v13 categoryID];
      char v9 = [v8 isEqualToNumber:&unk_1F27F1A70];

      char v10 = v9 ^ 1;
    }
    else
    {
      char v10 = 1;
    }

    if (v5)
    {
      if (v6 == 4) {
        char v11 = v10;
      }
      else {
        char v11 = 1;
      }
      id v4 = v13;
      if (v11) {
        goto LABEL_13;
      }
      uint64_t v12 = 80;
    }
    else
    {
      uint64_t v12 = 136;
      id v4 = v13;
    }
    ++*(Class *)((char *)&self->super.isa + v12);
  }
LABEL_13:
}

- (void)finalizeWithSessionEndDate:(id)a3
{
}

- (BOOL)complete
{
  return self->_sessionStartDate && self->_sessionEndDate != 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  sessionStartDate = self->_sessionStartDate;
  id v19 = a3;
  [v19 encodeObject:sessionStartDate forKey:@"sessionStartDate"];
  [v19 encodeObject:self->_sessionEndDate forKey:@"sessionEndDate"];
  uint64_t v5 = [NSNumber numberWithUnsignedInteger:self->_numEngagementsInSpotlightApps];
  [v19 encodeObject:v5 forKey:@"engagementsSpotlightApps"];

  uint64_t v6 = [NSNumber numberWithUnsignedInteger:self->_numEngagementsInSpotlightActions];
  [v19 encodeObject:v6 forKey:@"engagementsSpotlightActions"];

  uint64_t v7 = [NSNumber numberWithUnsignedInteger:self->_numEngagementsInSuggestionsWidget];
  [v19 encodeObject:v7 forKey:@"engagementsSuggestionsWidget"];

  int v8 = [NSNumber numberWithUnsignedInteger:self->_numEngagementsInSuggestionsWidgetTodayPage];
  [v19 encodeObject:v8 forKey:@"engagementsSuggestionsWidgetToday"];

  char v9 = [NSNumber numberWithUnsignedInteger:self->_numEngagementsInAppPredictionPanel];
  [v19 encodeObject:v9 forKey:@"engagementsAppPanel"];

  char v10 = [NSNumber numberWithUnsignedInteger:self->_numEngagementsInAppPredictionPanelTodayPage];
  [v19 encodeObject:v10 forKey:@"engagementsAppPanelToday"];

  char v11 = [NSNumber numberWithUnsignedInteger:self->_numEngagementsInAppLibrary];
  [v19 encodeObject:v11 forKey:@"engagementsAppLibrary"];

  uint64_t v12 = [NSNumber numberWithUnsignedInteger:self->_numViewsInSpotlightApps];
  [v19 encodeObject:v12 forKey:@"viewsSpotlightApps"];

  id v13 = [NSNumber numberWithUnsignedInteger:self->_numViewsInSpotlightActions];
  [v19 encodeObject:v13 forKey:@"viewsSpotlightActions"];

  uint64_t v14 = [NSNumber numberWithUnsignedInteger:self->_numViewsInSuggestionsWidget];
  [v19 encodeObject:v14 forKey:@"viewsSuggestionsWidget"];

  uint64_t v15 = [NSNumber numberWithUnsignedInteger:self->_numViewsInSuggestionsWidgetTodayPage];
  [v19 encodeObject:v15 forKey:@"viewsSuggestionsWidgetToday"];

  v16 = [NSNumber numberWithUnsignedInteger:self->_numViewsInAppPredictionPanel];
  [v19 encodeObject:v16 forKey:@"viewsAppPanel"];

  int v17 = [NSNumber numberWithUnsignedInteger:self->_numViewsInAppPredictionPanelTodayPage];
  [v19 encodeObject:v17 forKey:@"viewsAppPanelToday"];

  BOOL v18 = [NSNumber numberWithUnsignedInteger:self->_numViewsInAppLibrary];
  [v19 encodeObject:v18 forKey:@"viewsAppLibrary"];

  [v19 encodeBool:self->_spotlightEnabled forKey:@"spotlightEnabled"];
  [v19 encodeBool:self->_hasSuggestionsWidget forKey:@"hasSuggestionsWidget"];
  [v19 encodeBool:self->_hasSuggestionsWidgetInTodayPage forKey:@"hasSuggestionsWidgetToday"];
  [v19 encodeBool:self->_hasAppPredictionPanel forKey:@"hasAppPredictionPanel"];
  [v19 encodeBool:self->_hasAppPredictionPanelInTodayPage forKey:@"hasAppPredictionPanelToday"];
  [v19 encodeBool:self->_appLibraryEnabled forKey:@"appLibraryEnabled"];
}

- (ATXScreenLogUnlockSession)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = __atxlog_handle_metrics();
  int v8 = [v5 robustDecodeObjectOfClass:v6 forKey:@"sessionStartDate" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.duetexpertd.ATXScreenLogUnlockSession" errorCode:-1 logHandle:v7];

  if (v8)
  {
    char v9 = (void *)MEMORY[0x1E4F93B90];
    uint64_t v10 = objc_opt_class();
    char v11 = __atxlog_handle_metrics();
    uint64_t v12 = [v9 robustDecodeObjectOfClass:v10 forKey:@"sessionEndDate" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.duetexpertd.ATXScreenLogUnlockSession" errorCode:-1 logHandle:v11];

    id v13 = (void *)MEMORY[0x1E4F93B90];
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = __atxlog_handle_metrics();
    v16 = [v13 robustDecodeObjectOfClass:v14 forKey:@"engagementsSpotlightApps" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.duetexpertd.ATXScreenLogUnlockSession" errorCode:-1 logHandle:v15];

    if (v16)
    {
      int v17 = (void *)MEMORY[0x1E4F93B90];
      uint64_t v18 = objc_opt_class();
      id v19 = __atxlog_handle_metrics();
      v20 = [v17 robustDecodeObjectOfClass:v18 forKey:@"engagementsSpotlightActions" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.duetexpertd.ATXScreenLogUnlockSession" errorCode:-1 logHandle:v19];

      if (v20)
      {
        v84 = v12;
        v21 = (void *)MEMORY[0x1E4F93B90];
        uint64_t v22 = objc_opt_class();
        v23 = __atxlog_handle_metrics();
        v24 = [v21 robustDecodeObjectOfClass:v22 forKey:@"engagementsSuggestionsWidget" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.duetexpertd.ATXScreenLogUnlockSession" errorCode:-1 logHandle:v23];

        if (v24)
        {
          v83 = self;
          v25 = (void *)MEMORY[0x1E4F93B90];
          uint64_t v26 = objc_opt_class();
          v27 = __atxlog_handle_metrics();
          v28 = [v25 robustDecodeObjectOfClass:v26 forKey:@"engagementsSuggestionsWidgetToday" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.duetexpertd.ATXScreenLogUnlockSession" errorCode:-1 logHandle:v27];

          v82 = v28;
          if (v28)
          {
            v29 = (void *)MEMORY[0x1E4F93B90];
            uint64_t v30 = objc_opt_class();
            v31 = __atxlog_handle_metrics();
            v28 = [v29 robustDecodeObjectOfClass:v30 forKey:@"engagementsAppPanel" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.duetexpertd.ATXScreenLogUnlockSession" errorCode:-1 logHandle:v31];

            v81 = v28;
            if (v28)
            {
              v32 = (void *)MEMORY[0x1E4F93B90];
              uint64_t v33 = objc_opt_class();
              v34 = __atxlog_handle_metrics();
              v28 = [v32 robustDecodeObjectOfClass:v33 forKey:@"engagementsAppPanelToday" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.duetexpertd.ATXScreenLogUnlockSession" errorCode:-1 logHandle:v34];

              v80 = v28;
              if (v28)
              {
                v35 = (void *)MEMORY[0x1E4F93B90];
                uint64_t v36 = objc_opt_class();
                v37 = __atxlog_handle_metrics();
                v28 = [v35 robustDecodeObjectOfClass:v36 forKey:@"engagementsAppLibrary" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.duetexpertd.ATXScreenLogUnlockSession" errorCode:-1 logHandle:v37];

                v79 = v28;
                if (v28)
                {
                  v38 = (void *)MEMORY[0x1E4F93B90];
                  uint64_t v39 = objc_opt_class();
                  v40 = __atxlog_handle_metrics();
                  v28 = [v38 robustDecodeObjectOfClass:v39 forKey:@"viewsSpotlightApps" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.duetexpertd.ATXScreenLogUnlockSession" errorCode:-1 logHandle:v40];

                  v78 = v28;
                  if (v28)
                  {
                    v41 = (void *)MEMORY[0x1E4F93B90];
                    uint64_t v42 = objc_opt_class();
                    v43 = __atxlog_handle_metrics();
                    v28 = [v41 robustDecodeObjectOfClass:v42 forKey:@"viewsSpotlightActions" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.duetexpertd.ATXScreenLogUnlockSession" errorCode:-1 logHandle:v43];

                    v77 = v28;
                    if (v28)
                    {
                      v44 = (void *)MEMORY[0x1E4F93B90];
                      uint64_t v45 = objc_opt_class();
                      v46 = __atxlog_handle_metrics();
                      v28 = [v44 robustDecodeObjectOfClass:v45 forKey:@"viewsSuggestionsWidget" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.duetexpertd.ATXScreenLogUnlockSession" errorCode:-1 logHandle:v46];

                      v76 = v28;
                      if (v28)
                      {
                        v47 = (void *)MEMORY[0x1E4F93B90];
                        uint64_t v48 = objc_opt_class();
                        v49 = __atxlog_handle_metrics();
                        v28 = [v47 robustDecodeObjectOfClass:v48 forKey:@"viewsSuggestionsWidgetToday" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.duetexpertd.ATXScreenLogUnlockSession" errorCode:-1 logHandle:v49];

                        v75 = v28;
                        if (v28)
                        {
                          v50 = (void *)MEMORY[0x1E4F93B90];
                          uint64_t v51 = objc_opt_class();
                          v52 = __atxlog_handle_metrics();
                          v28 = [v50 robustDecodeObjectOfClass:v51 forKey:@"viewsAppPanel" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.duetexpertd.ATXScreenLogUnlockSession" errorCode:-1 logHandle:v52];

                          v74 = v28;
                          if (v28)
                          {
                            v53 = (void *)MEMORY[0x1E4F93B90];
                            uint64_t v54 = objc_opt_class();
                            v55 = __atxlog_handle_metrics();
                            v28 = [v53 robustDecodeObjectOfClass:v54 forKey:@"viewsAppPanelToday" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.duetexpertd.ATXScreenLogUnlockSession" errorCode:-1 logHandle:v55];

                            v73 = v28;
                            if (v28)
                            {
                              v56 = (void *)MEMORY[0x1E4F93B90];
                              uint64_t v57 = objc_opt_class();
                              v58 = __atxlog_handle_metrics();
                              v59 = [v56 robustDecodeObjectOfClass:v57 forKey:@"viewsAppLibrary" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.duetexpertd.ATXScreenLogUnlockSession" errorCode:-1 logHandle:v58];

                              if (v59)
                              {
                                unsigned int v72 = [v4 decodeBoolForKey:@"spotlightEnabled"];
                                v60 = v59;
                                unsigned int v71 = [v4 decodeBoolForKey:@"hasSuggestionsWidget"];
                                unsigned int v70 = [v4 decodeBoolForKey:@"hasSuggestionsWidget"];
                                uint64_t v61 = [v4 decodeBoolForKey:@"hasAppPredictionPanel"];
                                uint64_t v62 = [v4 decodeBoolForKey:@"hasAppPredictionPanel"];
                                uint64_t v63 = [v4 decodeBoolForKey:@"appLibraryEnabled"];
                                v64 = [(ATXScreenLogUnlockSession *)v83 initWithSessionStartDate:v8];
                                [(ATXScreenLogUnlockSession *)v64 setSessionEndDate:v84];
                                [(ATXScreenLogUnlockSession *)v64 setSpotlightEnabled:v72];
                                [(ATXScreenLogUnlockSession *)v64 setHasSuggestionsWidget:v71];
                                [(ATXScreenLogUnlockSession *)v64 setHasSuggestionsWidgetInTodayPage:v70];
                                uint64_t v65 = v61;
                                self = v64;
                                [(ATXScreenLogUnlockSession *)v64 setHasAppPredictionPanel:v65];
                                [(ATXScreenLogUnlockSession *)v64 setHasAppPredictionPanelInTodayPage:v62];
                                uint64_t v66 = v63;
                                v59 = v60;
                                [(ATXScreenLogUnlockSession *)v64 setAppLibraryEnabled:v66];
                                -[ATXScreenLogUnlockSession setNumEngagementsInSpotlightApps:](v64, "setNumEngagementsInSpotlightApps:", [v16 unsignedIntegerValue]);
                                -[ATXScreenLogUnlockSession setNumEngagementsInSpotlightActions:](v64, "setNumEngagementsInSpotlightActions:", [v20 unsignedIntegerValue]);
                                -[ATXScreenLogUnlockSession setNumEngagementsInSuggestionsWidget:](v64, "setNumEngagementsInSuggestionsWidget:", [v24 unsignedIntegerValue]);
                                v67 = v82;
                                [(ATXScreenLogUnlockSession *)self setNumEngagementsInSuggestionsWidgetTodayPage:[(ATXScreenLogUnlockSession *)v82 unsignedIntegerValue]];
                                v68 = v81;
                                [(ATXScreenLogUnlockSession *)self setNumEngagementsInAppPredictionPanel:[(ATXScreenLogUnlockSession *)v81 unsignedIntegerValue]];
                                [(ATXScreenLogUnlockSession *)self setNumEngagementsInAppPredictionPanelTodayPage:[(ATXScreenLogUnlockSession *)v80 unsignedIntegerValue]];
                                [(ATXScreenLogUnlockSession *)self setNumEngagementsInAppLibrary:[(ATXScreenLogUnlockSession *)v79 unsignedIntegerValue]];
                                [(ATXScreenLogUnlockSession *)self setNumViewsInSpotlightApps:[(ATXScreenLogUnlockSession *)v78 unsignedIntegerValue]];
                                [(ATXScreenLogUnlockSession *)self setNumViewsInSpotlightActions:[(ATXScreenLogUnlockSession *)v77 unsignedIntegerValue]];
                                [(ATXScreenLogUnlockSession *)self setNumViewsInSuggestionsWidget:[(ATXScreenLogUnlockSession *)v76 unsignedIntegerValue]];
                                [(ATXScreenLogUnlockSession *)self setNumViewsInSuggestionsWidgetTodayPage:[(ATXScreenLogUnlockSession *)v75 unsignedIntegerValue]];
                                [(ATXScreenLogUnlockSession *)self setNumViewsInAppPredictionPanel:[(ATXScreenLogUnlockSession *)v74 unsignedIntegerValue]];
                                [(ATXScreenLogUnlockSession *)self setNumViewsInAppPredictionPanelTodayPage:[(ATXScreenLogUnlockSession *)v73 unsignedIntegerValue]];
                                -[ATXScreenLogUnlockSession setNumViewsInAppLibrary:](self, "setNumViewsInAppLibrary:", [v59 unsignedIntegerValue]);
                                v28 = self;
                              }
                              else
                              {
                                v28 = 0;
                                self = v83;
                                v68 = v81;
                                v67 = v82;
                              }

                              uint64_t v12 = v84;
                            }
                            else
                            {
                              self = v83;
                              uint64_t v12 = v84;
                              v68 = v81;
                              v67 = v82;
                            }
                          }
                          else
                          {
                            self = v83;
                            uint64_t v12 = v84;
                            v68 = v81;
                            v67 = v82;
                          }
                        }
                        else
                        {
                          self = v83;
                          uint64_t v12 = v84;
                          v68 = v81;
                          v67 = v82;
                        }
                      }
                      else
                      {
                        self = v83;
                        uint64_t v12 = v84;
                        v68 = v81;
                        v67 = v82;
                      }
                    }
                    else
                    {
                      self = v83;
                      uint64_t v12 = v84;
                      v68 = v81;
                      v67 = v82;
                    }
                  }
                  else
                  {
                    self = v83;
                    uint64_t v12 = v84;
                    v68 = v81;
                    v67 = v82;
                  }
                }
                else
                {
                  self = v83;
                  uint64_t v12 = v84;
                  v68 = v81;
                  v67 = v82;
                }
              }
              else
              {
                self = v83;
                uint64_t v12 = v84;
                v68 = v81;
                v67 = v82;
              }
            }
            else
            {
              self = v83;
              uint64_t v12 = v84;
              v68 = 0;
              v67 = v82;
            }
          }
          else
          {
            self = v83;
            uint64_t v12 = v84;
            v67 = 0;
          }
        }
        else
        {
          v28 = 0;
          uint64_t v12 = v84;
        }
      }
      else
      {
        v28 = 0;
      }
    }
    else
    {
      v28 = 0;
    }
  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSDate *)self->_sessionStartDate hash];
  uint64_t v4 = [(NSDate *)self->_sessionEndDate hash];
  unint64_t v5 = self->_numEngagementsInSpotlightApps - (v4 - v3 + 32 * v3) + 32 * (v4 - v3 + 32 * v3);
  unint64_t v6 = self->_numEngagementsInSpotlightActions - v5 + 32 * v5;
  unint64_t v7 = self->_numEngagementsInSuggestionsWidget - v6 + 32 * v6;
  unint64_t v8 = self->_numEngagementsInSuggestionsWidgetTodayPage - v7 + 32 * v7;
  unint64_t v9 = self->_numEngagementsInAppPredictionPanel - v8 + 32 * v8;
  unint64_t v10 = self->_numEngagementsInAppPredictionPanelTodayPage - v9 + 32 * v9;
  unint64_t v11 = self->_numEngagementsInAppLibrary - v10 + 32 * v10;
  unint64_t v12 = self->_numViewsInSpotlightApps - v11 + 32 * v11;
  unint64_t v13 = self->_numViewsInSpotlightActions - v12 + 32 * v12;
  unint64_t v14 = self->_numViewsInSuggestionsWidget - v13 + 32 * v13;
  unint64_t v15 = self->_numViewsInSuggestionsWidgetTodayPage - v14 + 32 * v14;
  unint64_t v16 = self->_numViewsInAppPredictionPanel - v15 + 32 * v15;
  unint64_t v17 = self->_numViewsInAppPredictionPanelTodayPage - v16 + 32 * v16;
  unint64_t v18 = self->_spotlightEnabled
      - (self->_numViewsInAppLibrary
       - v17
       + 32 * v17)
      + 32 * (self->_numViewsInAppLibrary - v17 + 32 * v17);
  uint64_t v19 = self->_hasSuggestionsWidget - v18 + 32 * v18;
  uint64_t v20 = self->_hasSuggestionsWidgetInTodayPage - v19 + 32 * v19;
  uint64_t v21 = self->_hasAppPredictionPanel - v20 + 32 * v20;
  uint64_t v22 = self->_hasAppPredictionPanelInTodayPage - v21 + 32 * v21;
  return self->_appLibraryEnabled - v22 + 32 * v22;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (ATXScreenLogUnlockSession *)a3;
  unint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXScreenLogUnlockSession *)self isEqualToATXScreenLogUnlockSession:v5];

  return v6;
}

- (BOOL)isEqualToATXScreenLogUnlockSession:(id)a3
{
  uint64_t v4 = (id *)a3;
  sessionStartDate = self->_sessionStartDate;
  BOOL v6 = (NSDate *)v4[2];
  if (sessionStartDate == v6)
  {
  }
  else
  {
    unint64_t v7 = v6;
    unint64_t v8 = sessionStartDate;
    char v9 = [(NSDate *)v8 isEqual:v7];

    if ((v9 & 1) == 0)
    {
LABEL_29:
      BOOL v15 = 0;
      goto LABEL_30;
    }
  }
  sessionEndDate = self->_sessionEndDate;
  unint64_t v11 = (NSDate *)v4[3];
  if (sessionEndDate == v11)
  {
  }
  else
  {
    unint64_t v12 = v11;
    unint64_t v13 = sessionEndDate;
    char v14 = [(NSDate *)v13 isEqual:v12];

    if ((v14 & 1) == 0) {
      goto LABEL_29;
    }
  }
  if (self->_numEngagementsInSpotlightApps != v4[4]
    || self->_numEngagementsInSpotlightActions != v4[5]
    || self->_numEngagementsInSuggestionsWidget != v4[6]
    || self->_numEngagementsInSuggestionsWidgetTodayPage != v4[7]
    || self->_numEngagementsInAppPredictionPanel != v4[8]
    || self->_numEngagementsInAppPredictionPanelTodayPage != v4[9]
    || self->_numEngagementsInAppLibrary != v4[10]
    || self->_numViewsInSpotlightApps != v4[11]
    || self->_numViewsInSpotlightActions != v4[12]
    || self->_numViewsInSuggestionsWidget != v4[13]
    || self->_numViewsInSuggestionsWidgetTodayPage != v4[14]
    || self->_numViewsInAppPredictionPanel != v4[15]
    || self->_numViewsInAppPredictionPanelTodayPage != v4[16]
    || self->_numViewsInAppLibrary != v4[17]
    || self->_spotlightEnabled != *((unsigned __int8 *)v4 + 8)
    || self->_hasSuggestionsWidget != *((unsigned __int8 *)v4 + 9)
    || self->_hasSuggestionsWidgetInTodayPage != *((unsigned __int8 *)v4 + 10)
    || self->_hasAppPredictionPanel != *((unsigned __int8 *)v4 + 11)
    || self->_hasAppPredictionPanelInTodayPage != *((unsigned __int8 *)v4 + 12))
  {
    goto LABEL_29;
  }
  BOOL v15 = self->_appLibraryEnabled == *((unsigned __int8 *)v4 + 13);
LABEL_30:

  return v15;
}

- (NSDate)sessionStartDate
{
  return self->_sessionStartDate;
}

- (void)setSessionStartDate:(id)a3
{
}

- (NSDate)sessionEndDate
{
  return self->_sessionEndDate;
}

- (void)setSessionEndDate:(id)a3
{
}

- (unint64_t)numEngagementsInSpotlightApps
{
  return self->_numEngagementsInSpotlightApps;
}

- (void)setNumEngagementsInSpotlightApps:(unint64_t)a3
{
  self->_numEngagementsInSpotlightApps = a3;
}

- (unint64_t)numEngagementsInSpotlightActions
{
  return self->_numEngagementsInSpotlightActions;
}

- (void)setNumEngagementsInSpotlightActions:(unint64_t)a3
{
  self->_numEngagementsInSpotlightActions = a3;
}

- (unint64_t)numEngagementsInSuggestionsWidget
{
  return self->_numEngagementsInSuggestionsWidget;
}

- (void)setNumEngagementsInSuggestionsWidget:(unint64_t)a3
{
  self->_numEngagementsInSuggestionsWidget = a3;
}

- (unint64_t)numEngagementsInSuggestionsWidgetTodayPage
{
  return self->_numEngagementsInSuggestionsWidgetTodayPage;
}

- (void)setNumEngagementsInSuggestionsWidgetTodayPage:(unint64_t)a3
{
  self->_numEngagementsInSuggestionsWidgetTodayPage = a3;
}

- (unint64_t)numEngagementsInAppPredictionPanel
{
  return self->_numEngagementsInAppPredictionPanel;
}

- (void)setNumEngagementsInAppPredictionPanel:(unint64_t)a3
{
  self->_numEngagementsInAppPredictionPanel = a3;
}

- (unint64_t)numEngagementsInAppPredictionPanelTodayPage
{
  return self->_numEngagementsInAppPredictionPanelTodayPage;
}

- (void)setNumEngagementsInAppPredictionPanelTodayPage:(unint64_t)a3
{
  self->_numEngagementsInAppPredictionPanelTodayPage = a3;
}

- (unint64_t)numEngagementsInAppLibrary
{
  return self->_numEngagementsInAppLibrary;
}

- (void)setNumEngagementsInAppLibrary:(unint64_t)a3
{
  self->_numEngagementsInAppLibrary = a3;
}

- (unint64_t)numViewsInSpotlightApps
{
  return self->_numViewsInSpotlightApps;
}

- (void)setNumViewsInSpotlightApps:(unint64_t)a3
{
  self->_unint64_t numViewsInSpotlightApps = a3;
}

- (unint64_t)numViewsInSpotlightActions
{
  return self->_numViewsInSpotlightActions;
}

- (void)setNumViewsInSpotlightActions:(unint64_t)a3
{
  self->_numViewsInSpotlightActions = a3;
}

- (unint64_t)numViewsInSuggestionsWidget
{
  return self->_numViewsInSuggestionsWidget;
}

- (void)setNumViewsInSuggestionsWidget:(unint64_t)a3
{
  self->_numViewsInSuggestionsWidget = a3;
}

- (unint64_t)numViewsInSuggestionsWidgetTodayPage
{
  return self->_numViewsInSuggestionsWidgetTodayPage;
}

- (void)setNumViewsInSuggestionsWidgetTodayPage:(unint64_t)a3
{
  self->_numViewsInSuggestionsWidgetTodayPage = a3;
}

- (unint64_t)numViewsInAppPredictionPanel
{
  return self->_numViewsInAppPredictionPanel;
}

- (void)setNumViewsInAppPredictionPanel:(unint64_t)a3
{
  self->_numViewsInAppPredictionPanel = a3;
}

- (unint64_t)numViewsInAppPredictionPanelTodayPage
{
  return self->_numViewsInAppPredictionPanelTodayPage;
}

- (void)setNumViewsInAppPredictionPanelTodayPage:(unint64_t)a3
{
  self->_numViewsInAppPredictionPanelTodayPage = a3;
}

- (unint64_t)numViewsInAppLibrary
{
  return self->_numViewsInAppLibrary;
}

- (void)setNumViewsInAppLibrary:(unint64_t)a3
{
  self->_numViewsInAppLibrary = a3;
}

- (BOOL)spotlightEnabled
{
  return self->_spotlightEnabled;
}

- (void)setSpotlightEnabled:(BOOL)a3
{
  self->_spotlightEnabled = a3;
}

- (BOOL)hasSuggestionsWidget
{
  return self->_hasSuggestionsWidget;
}

- (void)setHasSuggestionsWidget:(BOOL)a3
{
  self->_hasSuggestionsWidget = a3;
}

- (BOOL)hasSuggestionsWidgetInTodayPage
{
  return self->_hasSuggestionsWidgetInTodayPage;
}

- (void)setHasSuggestionsWidgetInTodayPage:(BOOL)a3
{
  self->_hasSuggestionsWidgetInTodayPage = a3;
}

- (BOOL)hasAppPredictionPanel
{
  return self->_hasAppPredictionPanel;
}

- (void)setHasAppPredictionPanel:(BOOL)a3
{
  self->_hasAppPredictionPanel = a3;
}

- (BOOL)hasAppPredictionPanelInTodayPage
{
  return self->_hasAppPredictionPanelInTodayPage;
}

- (void)setHasAppPredictionPanelInTodayPage:(BOOL)a3
{
  self->_hasAppPredictionPanelInTodayPage = a3;
}

- (BOOL)appLibraryEnabled
{
  return self->_appLibraryEnabled;
}

- (void)setAppLibraryEnabled:(BOOL)a3
{
  self->_appLibraryEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionEndDate, 0);
  objc_storeStrong((id *)&self->_sessionStartDate, 0);
}

- (void)_widgetBundleIdIsSuggestionsWidget:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = (objc_class *)objc_opt_class();
  BOOL v6 = NSStringFromClass(v5);
  int v7 = 138412546;
  unint64_t v8 = v6;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_fault_impl(&dword_1D0FA3000, a3, OS_LOG_TYPE_FAULT, "%@ - received non-proactive widgetBundleId of %@", (uint8_t *)&v7, 0x16u);
}

@end