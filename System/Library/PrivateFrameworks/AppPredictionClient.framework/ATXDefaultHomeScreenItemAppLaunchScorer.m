@interface ATXDefaultHomeScreenItemAppLaunchScorer
- (ATXDefaultHomeScreenItemAppLaunchScorer)initWithWidget:(id)a3 appLaunchHistogram:(id)a4;
- (BOOL)_isAppPredictionsWidget;
- (BOOL)_isContactsWidget;
- (BOOL)_isSleepWidget;
- (BOOL)isWidgetSpecialCase;
- (double)_contactsWidgetiCloudFamilyScore;
- (id)_appLaunchScoreForContactsWidget;
- (id)_appLaunchScoreForSleepWidget;
- (id)_dateOfSleepOnboardingCompletion;
- (id)_rawLaunchCountAndNumberOfUniqueDaysParentAppWasLaunchedWithCachedAppLaunchData:(id)a3;
- (id)scoreWithCachedAppLaunchData:(id)a3;
- (void)_appLaunchScoreForSleepWidget;
@end

@implementation ATXDefaultHomeScreenItemAppLaunchScorer

- (ATXDefaultHomeScreenItemAppLaunchScorer)initWithWidget:(id)a3 appLaunchHistogram:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXDefaultHomeScreenItemAppLaunchScorer;
  v9 = [(ATXDefaultHomeScreenItemAppLaunchScorer *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_widget, a3);
    objc_storeStrong((id *)&v10->_spotlightLaunchesHistogram, a4);
  }

  return v10;
}

- (id)_dateOfSleepOnboardingCompletion
{
  v2 = (void *)MEMORY[0x1AD0D3C30](self, a2);
  v3 = objc_msgSend(MEMORY[0x1E4F1CB18], "hksp_sleepdUserDefaults");
  if ([v3 integerForKey:*MEMORY[0x1E4FA5388]] < 1)
  {
    id v6 = 0;
  }
  else
  {
    v4 = [v3 objectForKey:*MEMORY[0x1E4FA5390]];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    id v6 = v5;
  }

  return v6;
}

- (id)_appLaunchScoreForSleepWidget
{
  v4 = [(ATXHomeScreenWidgetDescriptor *)self->_widget avocadoDescriptor];
  v5 = [v4 extensionBundleIdentifier];
  char v6 = [v5 isEqualToString:@"com.apple.Health.Sleep.SleepWidgetExtension"];

  if ((v6 & 1) == 0)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"ATXDefaultHomeScreenItemAppLaunchScorer.m", 71, @"Widget extension bundle id must belong to that of the sleep widget: %@", @"com.apple.Health.Sleep.SleepWidgetExtension" object file lineNumber description];
  }
  id v7 = [(ATXHomeScreenWidgetDescriptor *)self->_widget avocadoDescriptor];
  id v8 = [v7 kind];
  char v9 = [v8 isEqualToString:@"com.apple.health.SleepWidget"];

  if ((v9 & 1) == 0)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"ATXDefaultHomeScreenItemAppLaunchScorer.m", 72, @"Widget kind must belong to that of the sleep widget: %@", @"com.apple.health.SleepWidget" object file lineNumber description];
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__ATXDefaultHomeScreenItemAppLaunchScorer__appLaunchScoreForSleepWidget__block_invoke;
  block[3] = &unk_1E5D05300;
  block[4] = self;
  if (_appLaunchScoreForSleepWidget_onceToken != -1) {
    dispatch_once(&_appLaunchScoreForSleepWidget_onceToken, block);
  }
  v10 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[ATXDefaultHomeScreenItemAppLaunchScorer _appLaunchScoreForSleepWidget](v10);
  }

  uint64_t v11 = _appLaunchScoreForSleepWidget_dateOfSleepOnboardingCompletion;
  objc_super v12 = [ATXAggregatedAppLaunchData alloc];
  if (v11)
  {
    v13 = [(ATXAggregatedAppLaunchData *)v12 initWithRawLaunchCount:5 uniqueDaysLaunched:5];
    v14 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v15 = [MEMORY[0x1E4F1C9C8] now];
    v16 = [v14 dateByAddingUnit:16 value:-7 toDate:v15 options:0];

    if ([v16 compare:_appLaunchScoreForSleepWidget_dateOfSleepOnboardingCompletion] == -1) {
      v17 = [[ATXAggregatedAppLaunchData alloc] initWithRawLaunchCount:2 * [(ATXAggregatedAppLaunchData *)v13 rawLaunchCount] uniqueDaysLaunched:2 * [(ATXAggregatedAppLaunchData *)v13 uniqueDaysLaunched]];
    }
    else {
      v17 = v13;
    }
    v18 = v17;
  }
  else
  {
    v18 = [(ATXAggregatedAppLaunchData *)v12 initWithRawLaunchCount:0 uniqueDaysLaunched:0];
  }

  return v18;
}

uint64_t __72__ATXDefaultHomeScreenItemAppLaunchScorer__appLaunchScoreForSleepWidget__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) _dateOfSleepOnboardingCompletion];
  uint64_t v2 = _appLaunchScoreForSleepWidget_dateOfSleepOnboardingCompletion;
  _appLaunchScoreForSleepWidget_dateOfSleepOnboardingCompletion = v1;

  return MEMORY[0x1F41817F8](v1, v2);
}

- (id)_appLaunchScoreForContactsWidget
{
  v4 = [(ATXHomeScreenWidgetDescriptor *)self->_widget avocadoDescriptor];
  v5 = [v4 extensionBundleIdentifier];
  char v6 = [v5 isEqualToString:@"com.apple.PeopleViewService.PeopleWidget-iOS"];

  if ((v6 & 1) == 0)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"ATXDefaultHomeScreenItemAppLaunchScorer.m", 101, @"Widget extension bundle id must belong to that of the contacts widget: %@", @"com.apple.PeopleViewService.PeopleWidget-iOS" object file lineNumber description];
  }
  id v7 = [(ATXHomeScreenWidgetDescriptor *)self->_widget avocadoDescriptor];
  id v8 = [v7 kind];
  if ([v8 isEqualToString:@"SingleContactWidget_iOS"])
  {
  }
  else
  {
    char v9 = [(ATXHomeScreenWidgetDescriptor *)self->_widget avocadoDescriptor];
    v10 = [v9 kind];
    char v11 = [v10 isEqualToString:@"MultipleContactWidget_iOS"];

    if (v11) {
      goto LABEL_8;
    }
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"ATXDefaultHomeScreenItemAppLaunchScorer.m", 102, @"Widget kind must belong to that of the contacts widget: %@ or %@", @"SingleContactWidget_iOS", @"MultipleContactWidget_iOS" object file lineNumber description];
  }

LABEL_8:
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__ATXDefaultHomeScreenItemAppLaunchScorer__appLaunchScoreForContactsWidget__block_invoke;
  block[3] = &unk_1E5D05300;
  block[4] = self;
  if (_appLaunchScoreForContactsWidget_onceToken != -1) {
    dispatch_once(&_appLaunchScoreForContactsWidget_onceToken, block);
  }
  objc_super v12 = [ATXAggregatedAppLaunchData alloc];
  v13 = [(ATXAggregatedAppLaunchData *)v12 initWithRawLaunchCount:(unint64_t)*(double *)&_appLaunchScoreForContactsWidget_iCloudScore uniqueDaysLaunched:(unint64_t)*(double *)&_appLaunchScoreForContactsWidget_iCloudScore];

  return v13;
}

uint64_t __75__ATXDefaultHomeScreenItemAppLaunchScorer__appLaunchScoreForContactsWidget__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _contactsWidgetiCloudFamilyScore];
  _appLaunchScoreForContactsWidget_iCloudScore = v2;
  return result;
}

- (double)_contactsWidgetiCloudFamilyScore
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1AD0D3C30](self, a2);
  v3 = objc_opt_new();
  v4 = [v3 fetchFamilyCircle];
  v5 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    double v21 = *(double *)&v4;
    _os_log_impl(&dword_1A790D000, v5, OS_LOG_TYPE_DEFAULT, "Fetched family circle during scoring: %@", buf, 0xCu);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  char v6 = objc_msgSend(v4, "members", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    double v10 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_super v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (([v12 isMe] & 1) == 0)
        {
          double v10 = v10 + 5.0;
          if ([v12 isChildAccount]) {
            double v10 = v10 + 5.0;
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
  else
  {
    double v10 = 0.0;
  }

  v13 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v21 = v10;
    _os_log_impl(&dword_1A790D000, v13, OS_LOG_TYPE_DEFAULT, "Scored family circle: %f", buf, 0xCu);
  }

  return v10;
}

- (id)_rawLaunchCountAndNumberOfUniqueDaysParentAppWasLaunchedWithCachedAppLaunchData:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(ATXHomeScreenWidgetDescriptor *)self->_widget appBundleId];

  if (v5)
  {
    char v6 = objc_opt_new();
    uint64_t v7 = [(ATXHomeScreenWidgetDescriptor *)self->_widget appBundleId];
    [v6 addObject:v7];

    uint64_t v8 = [(ATXHomeScreenWidgetDescriptor *)self->_widget appBundleId];
    LODWORD(v7) = [v8 isEqualToString:@"com.apple.mobileslideshow"];

    if (v7) {
      [v6 addObject:@"com.apple.camera"];
    }
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v30 count:16];
    if (v10)
    {
      uint64_t v12 = v10;
      uint64_t v13 = *(void *)v25;
      double v14 = 0.0;
      *(void *)&long long v11 = 138412290;
      long long v23 = v11;
      double v15 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v25 != v13) {
            objc_enumerationMutation(v9);
          }
          uint64_t v17 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          long long v18 = objc_msgSend(v4, "objectForKeyedSubscript:", v17, v23, (void)v24);
          v19 = v18;
          if (v18)
          {
            double v15 = v15 + (double)(unint64_t)[v18 rawLaunchCount];
            double v14 = v14 + (double)(unint64_t)[v19 uniqueDaysLaunched];
          }
          else
          {
            v20 = __atxlog_handle_home_screen();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v23;
              uint64_t v29 = v17;
              _os_log_impl(&dword_1A790D000, v20, OS_LOG_TYPE_DEFAULT, "ATXDefaultHomeScreenItemAppLaunchScorer: No launch info for key: %@", buf, 0xCu);
            }
          }
        }
        uint64_t v12 = [v9 countByEnumeratingWithState:&v24 objects:v30 count:16];
      }
      while (v12);
    }
    else
    {
      double v14 = 0.0;
      double v15 = 0.0;
    }
  }
  else
  {
    double v14 = 0.0;
    double v15 = 0.0;
  }
  double v21 = [[ATXAggregatedAppLaunchData alloc] initWithRawLaunchCount:(unint64_t)v15 uniqueDaysLaunched:(unint64_t)v14];

  return v21;
}

- (BOOL)_isAppPredictionsWidget
{
  v3 = [(ATXHomeScreenWidgetDescriptor *)self->_widget avocadoDescriptor];
  if (v3)
  {
    id v4 = [(ATXHomeScreenWidgetDescriptor *)self->_widget avocadoDescriptor];
    v5 = +[ATXDefaultHomeScreenItemProducer appPredictionsWidgetDescriptor];
    char v6 = [v4 isEqual:v5];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)_isSleepWidget
{
  v3 = [(ATXHomeScreenWidgetDescriptor *)self->_widget avocadoDescriptor];
  id v4 = [v3 extensionBundleIdentifier];
  if ([v4 isEqualToString:@"com.apple.Health.Sleep.SleepWidgetExtension"])
  {
    v5 = [(ATXHomeScreenWidgetDescriptor *)self->_widget avocadoDescriptor];
    char v6 = [v5 kind];
    char v7 = [v6 isEqualToString:@"com.apple.health.SleepWidget"];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)_isContactsWidget
{
  v3 = [(ATXHomeScreenWidgetDescriptor *)self->_widget avocadoDescriptor];
  id v4 = [v3 extensionBundleIdentifier];
  int v5 = [v4 isEqualToString:@"com.apple.PeopleViewService.PeopleWidget-iOS"];

  if (!v5) {
    return 0;
  }
  char v6 = [(ATXHomeScreenWidgetDescriptor *)self->_widget avocadoDescriptor];
  char v7 = [v6 kind];
  if ([v7 isEqualToString:@"SingleContactWidget_iOS"])
  {
    char v8 = 1;
  }
  else
  {
    id v9 = [(ATXHomeScreenWidgetDescriptor *)self->_widget avocadoDescriptor];
    uint64_t v10 = [v9 kind];
    char v8 = [v10 isEqualToString:@"MultipleContactWidget_iOS"];
  }
  return v8;
}

- (id)scoreWithCachedAppLaunchData:(id)a3
{
  id v4 = a3;
  if ([(ATXDefaultHomeScreenItemAppLaunchScorer *)self _isAppPredictionsWidget])
  {
    spotlightLaunchesHistogram = self->_spotlightLaunchesHistogram;
    if (spotlightLaunchesHistogram)
    {
      [(ATXCategoricalHistogramProtocol *)spotlightLaunchesHistogram totalLaunches];
      double v7 = v6;
      char v8 = [ATXAggregatedAppLaunchData alloc];
      unint64_t v9 = (unint64_t)v7;
      unint64_t v10 = (unint64_t)(v7 * 0.2);
    }
    else
    {
      uint64_t v12 = [MEMORY[0x1E4F28F80] processInfo];
      uint64_t v13 = [v12 processName];
      int v14 = [v13 isEqualToString:@"duetexpertd"];

      if (v14)
      {
        double v15 = __atxlog_handle_home_screen();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
          -[ATXDefaultHomeScreenItemAppLaunchScorer scoreWithCachedAppLaunchData:](v15);
        }
      }
      char v8 = [ATXAggregatedAppLaunchData alloc];
      unint64_t v9 = 0;
      unint64_t v10 = 0;
    }
    uint64_t v11 = [(ATXAggregatedAppLaunchData *)v8 initWithRawLaunchCount:v9 uniqueDaysLaunched:v10];
  }
  else if ([(ATXDefaultHomeScreenItemAppLaunchScorer *)self _isSleepWidget])
  {
    uint64_t v11 = [(ATXDefaultHomeScreenItemAppLaunchScorer *)self _appLaunchScoreForSleepWidget];
  }
  else
  {
    if ([(ATXDefaultHomeScreenItemAppLaunchScorer *)self _isContactsWidget]) {
      [(ATXDefaultHomeScreenItemAppLaunchScorer *)self _appLaunchScoreForContactsWidget];
    }
    else {
    uint64_t v11 = [(ATXDefaultHomeScreenItemAppLaunchScorer *)self _rawLaunchCountAndNumberOfUniqueDaysParentAppWasLaunchedWithCachedAppLaunchData:v4];
    }
  }
  long long v16 = (void *)v11;

  return v16;
}

- (BOOL)isWidgetSpecialCase
{
  if ([(ATXDefaultHomeScreenItemAppLaunchScorer *)self _isAppPredictionsWidget]
    || [(ATXDefaultHomeScreenItemAppLaunchScorer *)self _isSleepWidget]
    || [(ATXDefaultHomeScreenItemAppLaunchScorer *)self _isContactsWidget])
  {
    return 1;
  }
  id v4 = [(ATXHomeScreenWidgetDescriptor *)self->_widget appBundleId];
  char v5 = [v4 isEqualToString:@"com.apple.mobileslideshow"];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spotlightLaunchesHistogram, 0);

  objc_storeStrong((id *)&self->_widget, 0);
}

- (void)_appLaunchScoreForSleepWidget
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 67109120;
  v1[1] = _appLaunchScoreForSleepWidget_dateOfSleepOnboardingCompletion != 0;
  _os_log_debug_impl(&dword_1A790D000, log, OS_LOG_TYPE_DEBUG, "ATXDefaultHomeScreenItemAppLaunchScorer: is sleep set up: %{BOOL}d", (uint8_t *)v1, 8u);
}

- (void)scoreWithCachedAppLaunchData:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_1A790D000, log, OS_LOG_TYPE_FAULT, "ATXDefaultHomeScreenItemAppLaunchScorer: _spotlightLaunchesHistogram is nil", v1, 2u);
}

@end