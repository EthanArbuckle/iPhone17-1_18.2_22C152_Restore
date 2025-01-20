@interface ATXDefaultHomeScreenItemProducer
+ (CHSWidgetDescriptor)appPredictionsWidgetDescriptor;
- (ATXDefaultHomeScreenItemProducer)initWithDescriptors:(id)a3 descriptorInstallDates:(id)a4 homeScreenConfig:(id)a5 isDayZeroExperience:(BOOL)a6 isiPad:(BOOL)a7 spotlightAppLaunchHistogram:(id)a8 adblDrainClassification:(unint64_t)a9 appLaunchCounts:(id)a10;
- (ATXDefaultHomeScreenItemProducer)initWithDescriptors:(id)a3 descriptorInstallDates:(id)a4 homeScreenConfig:(id)a5 isDayZeroExperience:(BOOL)a6 isiPad:(BOOL)a7 spotlightAppLaunchHistogram:(id)a8 appLaunchCounts:(id)a9;
- (ATXDefaultHomeScreenItemUpdate)update;
- (BOOL)_isNewlyInstalledWidget:(id)a3;
- (BOOL)_isStackConfiguredOnHomeScreen;
- (BOOL)isDayZeroExperience;
- (BOOL)isiPad;
- (NSArray)candidateDescriptors;
- (NSArray)homeScreenConfig;
- (NSDictionary)descriptorInstallDates;
- (NSDictionary)personalityToDescriptorDictionary;
- (NSSet)descriptors;
- (NSSet)widgetsOnHomeScreen;
- (id)_appPredictionsWidgetDescriptor;
- (id)_dayZeroOnboardingStacks;
- (id)_dayZeroUpdate;
- (id)_firstInstalledWidgetDate;
- (id)_personalizedGalleryWidgetsForSize:(unint64_t)a3;
- (id)_personalizedStack;
- (id)_personalizedStackForRankerPlistType:(int)a3;
- (id)_personalizedStackFromCandidates:(id)a3 rankerPlistType:(int)a4 size:(unint64_t)a5;
- (id)_personalizedTodayStack;
- (id)_personalizedUpdate;
- (id)_stackFromDefaultStackPersonalities:(id)a3;
- (id)_stackableCandidates;
- (id)ambientOnboardingStacks;
- (id)onboardingStacks;
- (id)personalizedOnboardingStacksWithRankingAlgorithm:(int)a3;
- (int64_t)_rankTypeGivenWidgetIsNewlyInstalled:(BOOL)a3 isAlreadyAdded:(BOOL)a4;
- (unint64_t)adblDrainClassification;
- (void)_appPredictionsWidgetDescriptor;
- (void)_initializeCachedWidgetPersonalityToAppScoreCache;
- (void)setAdblDrainClassification:(unint64_t)a3;
- (void)setCandidateDescriptors:(id)a3;
- (void)setIsDayZeroExperience:(BOOL)a3;
- (void)setIsiPad:(BOOL)a3;
- (void)setPersonalityToDescriptorDictionary:(id)a3;
- (void)setWidgetsOnHomeScreen:(id)a3;
@end

@implementation ATXDefaultHomeScreenItemProducer

- (ATXDefaultHomeScreenItemProducer)initWithDescriptors:(id)a3 descriptorInstallDates:(id)a4 homeScreenConfig:(id)a5 isDayZeroExperience:(BOOL)a6 isiPad:(BOOL)a7 spotlightAppLaunchHistogram:(id)a8 appLaunchCounts:(id)a9
{
  BOOL v10 = a7;
  BOOL v11 = a6;
  id v16 = a9;
  id v17 = a8;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  v21 = +[ATXBatteryDrainBehavior sharedInstance];
  v22 = -[ATXDefaultHomeScreenItemProducer initWithDescriptors:descriptorInstallDates:homeScreenConfig:isDayZeroExperience:isiPad:spotlightAppLaunchHistogram:adblDrainClassification:appLaunchCounts:](self, "initWithDescriptors:descriptorInstallDates:homeScreenConfig:isDayZeroExperience:isiPad:spotlightAppLaunchHistogram:adblDrainClassification:appLaunchCounts:", v20, v19, v18, v11, v10, v17, [v21 fetchADBLDrainClassification], v16);

  return v22;
}

- (ATXDefaultHomeScreenItemProducer)initWithDescriptors:(id)a3 descriptorInstallDates:(id)a4 homeScreenConfig:(id)a5 isDayZeroExperience:(BOOL)a6 isiPad:(BOOL)a7 spotlightAppLaunchHistogram:(id)a8 adblDrainClassification:(unint64_t)a9 appLaunchCounts:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v24 = a8;
  id v23 = a10;
  v25.receiver = self;
  v25.super_class = (Class)ATXDefaultHomeScreenItemProducer;
  id v19 = [(ATXDefaultHomeScreenItemProducer *)&v25 init];
  id v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_descriptors, a3);
    objc_storeStrong((id *)&v20->_descriptorInstallDates, a4);
    objc_storeStrong((id *)&v20->_homeScreenConfig, a5);
    v20->_isDayZeroExperience = a6;
    v20->_isiPad = a7;
    objc_storeStrong((id *)&v20->_spotlightAppLaunchHistogram, a8);
    v20->_adblDrainClassification = a9;
    objc_storeStrong((id *)&v20->_appLaunchCounts, a10);
    [(ATXDefaultHomeScreenItemProducer *)v20 _initializeCachedWidgetPersonalityToAppScoreCache];
  }

  return v20;
}

- (void)_initializeCachedWidgetPersonalityToAppScoreCache
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1AD0D3C30](self, a2);
  v4 = (NSMutableDictionary *)objc_opt_new();
  cachedWidgetPersonalityToAppScore = self->_cachedWidgetPersonalityToAppScore;
  self->_cachedWidgetPersonalityToAppScore = v4;

  if (!self->_isDayZeroExperience)
  {
    v29 = v3;
    v32 = objc_opt_new();
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    v6 = [(ATXDefaultHomeScreenItemProducer *)self candidateDescriptors];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v38 objects:v43 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v39;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v39 != v9) {
            objc_enumerationMutation(v6);
          }
          BOOL v11 = *(void **)(*((void *)&v38 + 1) + 8 * v10);
          v12 = (void *)MEMORY[0x1AD0D3C30]();
          v13 = [v11 appBundleId];

          if (v13)
          {
            v14 = [v11 appBundleId];
            [v32 addObject:v14];

            v15 = [v11 appBundleId];
            LODWORD(v14) = [v15 isEqualToString:@"com.apple.mobileslideshow"];

            if (v14) {
              [v32 addObject:@"com.apple.camera"];
            }
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v38 objects:v43 count:16];
      }
      while (v8);
    }

    id v16 = objc_opt_new();
    id v17 = [v16 rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysForApps:v32];

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id obj = [(ATXDefaultHomeScreenItemProducer *)self candidateDescriptors];
    uint64_t v18 = [obj countByEnumeratingWithState:&v34 objects:v42 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v35;
      v21 = off_1E5D04000;
      v30 = v17;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v35 != v20) {
            objc_enumerationMutation(obj);
          }
          id v23 = *(void **)(*((void *)&v34 + 1) + 8 * v22);
          context = (void *)MEMORY[0x1AD0D3C30]();
          id v24 = [(__objc2_class *)v21[192] stringRepresentationForATXHomeScreenWidgetDescriptor:v23];
          objc_super v25 = [[ATXDefaultHomeScreenItemAppLaunchScorer alloc] initWithWidget:v23 appLaunchHistogram:self->_spotlightAppLaunchHistogram];
          if ([(ATXDefaultHomeScreenItemAppLaunchScorer *)v25 isWidgetSpecialCase])
          {
            v26 = [(ATXDefaultHomeScreenItemAppLaunchScorer *)v25 scoreWithCachedAppLaunchData:v17];
            [(NSMutableDictionary *)self->_cachedWidgetPersonalityToAppScore setObject:v26 forKeyedSubscript:v24];
          }
          else
          {
            v26 = [v23 appBundleId];
            if (v26)
            {
              [v17 objectForKeyedSubscript:v26];
              v28 = v27 = v21;
              [(NSMutableDictionary *)self->_cachedWidgetPersonalityToAppScore setObject:v28 forKeyedSubscript:v24];

              v21 = v27;
              id v17 = v30;
            }
          }

          ++v22;
        }
        while (v19 != v22);
        uint64_t v19 = [obj countByEnumeratingWithState:&v34 objects:v42 count:16];
      }
      while (v19);
    }

    v3 = v29;
  }
}

- (ATXDefaultHomeScreenItemUpdate)update
{
  if ([(ATXDefaultHomeScreenItemProducer *)self isDayZeroExperience]) {
    [(ATXDefaultHomeScreenItemProducer *)self _dayZeroUpdate];
  }
  else {
  v3 = [(ATXDefaultHomeScreenItemProducer *)self _personalizedUpdate];
  }

  return (ATXDefaultHomeScreenItemUpdate *)v3;
}

- (id)_dayZeroUpdate
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  v3 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v45 = "-[ATXDefaultHomeScreenItemProducer _dayZeroUpdate]";
    _os_log_impl(&dword_1A790D000, v3, OS_LOG_TYPE_DEFAULT, "%s: updating with day zero defaults", buf, 0xCu);
  }

  long long v38 = +[ATXDefaultHomeScreenItemProducerUtilities personalitiesFromAssetsWithKey:@"dayZeroDefaultStack"];
  long long v41 = -[ATXDefaultHomeScreenItemProducer _stackFromDefaultStackPersonalities:](self, "_stackFromDefaultStackPersonalities:");
  v4 = +[ATXDefaultHomeScreenItemProducerUtilities personalitiesFromAssetsWithKey:@"dayZeroTodayPageDefaultStack"];
  uint64_t v5 = [(ATXDefaultHomeScreenItemProducer *)self _stackFromDefaultStackPersonalities:v4];
  long long v40 = [(ATXDefaultHomeScreenItemProducer *)self _dayZeroOnboardingStacks];
  if (self->_isiPad) {
    v6 = @"dayZeroDefaultWidgetsiPad";
  }
  else {
    v6 = @"dayZeroDefaultWidgetsiPhone";
  }
  uint64_t v7 = +[ATXDefaultHomeScreenItemProducerUtilities personalitiesFromAssetsWithKey:v6];
  uint64_t v8 = [(ATXDefaultHomeScreenItemProducer *)self personalityToDescriptorDictionary];
  uint64_t v39 = +[ATXDefaultHomeScreenItemProducerUtilities widgetsFromPersonalities:v7 size:0 personalityToDescriptorDictionary:v8];

  uint64_t v9 = [(ATXDefaultHomeScreenItemProducer *)self personalityToDescriptorDictionary];
  uint64_t v10 = +[ATXDefaultHomeScreenItemProducerUtilities widgetsFromPersonalities:v7 size:1 personalityToDescriptorDictionary:v9];

  BOOL v11 = [(ATXDefaultHomeScreenItemProducer *)self personalityToDescriptorDictionary];
  uint64_t v12 = +[ATXDefaultHomeScreenItemProducerUtilities widgetsFromPersonalities:v7 size:2 personalityToDescriptorDictionary:v11];

  if (self->_isiPad)
  {
    v13 = [(ATXDefaultHomeScreenItemProducer *)self personalityToDescriptorDictionary];
    uint64_t v14 = +[ATXDefaultHomeScreenItemProducerUtilities widgetsFromPersonalities:v7 size:4 personalityToDescriptorDictionary:v13];
  }
  else
  {
    uint64_t v14 = objc_opt_new();
  }
  long long v36 = (void *)v14;
  long long v37 = (void *)v5;
  v15 = (void *)v39;
  long long v34 = (void *)v12;
  long long v35 = (void *)v10;
  if (self->_isiPad)
  {
    uint64_t v16 = v10;
    id v17 = [ATXDefaultHomeScreenItemUpdate alloc];
    uint64_t v18 = [v40 stack1];
    v43[0] = v18;
    uint64_t v19 = [v40 stack2];
    v43[1] = v19;
    uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:2];
    LOBYTE(v30) = 0;
    v21 = v36;
    uint64_t v22 = v17;
    id v23 = v37;
    id v24 = [(ATXDefaultHomeScreenItemUpdate *)v22 initWithStack:v41 todayStack:v37 onboardingStacks:v20 smallWidgets:v39 mediumWidgets:v16 largeWidgets:v12 extraLargeWidgets:v36 shouldSuggestStackInGallery:v30];
  }
  else
  {
    uint64_t v18 = [[ATXDefaultHomeScreenItemRanker alloc] initWithCachedWidgetPersonalityToAppScore:self->_cachedWidgetPersonalityToAppScore spotlightAppLaunchHistogram:self->_spotlightAppLaunchHistogram appLaunchCounts:self->_appLaunchCounts];
    uint64_t v19 = [(ATXDefaultHomeScreenItemRanker *)v18 widgetsBySortingWidgetsUsingDayZeroGalleryAlgorithm:v39];
    uint64_t v20 = [(ATXDefaultHomeScreenItemRanker *)v18 widgetsBySortingWidgetsUsingDayZeroGalleryAlgorithm:v10];
    [(ATXDefaultHomeScreenItemRanker *)v18 widgetsBySortingWidgetsUsingDayZeroGalleryAlgorithm:v12];
    objc_super v25 = v32 = v7;
    v26 = [ATXDefaultHomeScreenItemUpdate alloc];
    [v40 stack1];
    v31 = v33 = v4;
    v42[0] = v31;
    v27 = [v40 stack2];
    v42[1] = v27;
    v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:2];
    LOBYTE(v30) = ![(ATXDefaultHomeScreenItemProducer *)self _isStackConfiguredOnHomeScreen];
    v21 = v36;
    id v24 = [(ATXDefaultHomeScreenItemUpdate *)v26 initWithStack:v41 todayStack:v37 onboardingStacks:v28 smallWidgets:v19 mediumWidgets:v20 largeWidgets:v25 extraLargeWidgets:v36 shouldSuggestStackInGallery:v30];

    v15 = (void *)v39;
    id v23 = v37;

    v4 = v33;
    uint64_t v7 = v32;
  }

  return v24;
}

- (id)onboardingStacks
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v4 = [(ATXDefaultHomeScreenItemProducer *)self isDayZeroExperience];
    uint64_t v5 = [(ATXDefaultHomeScreenItemProducer *)self descriptors];
    uint64_t v6 = [v5 count];
    uint64_t v7 = [(ATXDefaultHomeScreenItemProducer *)self descriptorInstallDates];
    *(_DWORD *)buf = 136315906;
    uint64_t v18 = "-[ATXDefaultHomeScreenItemProducer onboardingStacks]";
    __int16 v19 = 1024;
    BOOL v20 = v4;
    __int16 v21 = 2048;
    uint64_t v22 = v6;
    __int16 v23 = 2048;
    uint64_t v24 = [v7 count];
    _os_log_impl(&dword_1A790D000, v3, OS_LOG_TYPE_DEFAULT, "%s: generating onboarding stacks. dayZero:%d, numDescriptors:%lu, descriptorCacheSize:%lu", buf, 0x26u);
  }
  uint64_t v8 = [ATXDefaultHomeScreenItemOnboardingStacksProducer alloc];
  uint64_t v9 = [(ATXDefaultHomeScreenItemProducer *)self _stackableCandidates];
  cachedWidgetPersonalityToAppScore = self->_cachedWidgetPersonalityToAppScore;
  BOOL v11 = [(ATXDefaultHomeScreenItemProducer *)self personalityToDescriptorDictionary];
  LOBYTE(v16) = 0;
  LOBYTE(v15) = 1;
  uint64_t v12 = [(ATXDefaultHomeScreenItemOnboardingStacksProducer *)v8 initWithCandidateWidgets:v9 cachedWidgetPersonalityToAppScore:cachedWidgetPersonalityToAppScore personalityToDescriptorDictionary:v11 adblDrainClassification:self->_adblDrainClassification isiPad:self->_isiPad isDayZeroExperience:self->_isDayZeroExperience shouldIncludeContactsWidget:v15 cachedHasiCloudFamily:0 appLaunchCounts:self->_appLaunchCounts isAmbient:v16];

  v13 = [(ATXDefaultHomeScreenItemOnboardingStacksProducer *)v12 onboardingStacks];

  return v13;
}

- (id)ambientOnboardingStacks
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v4 = [(ATXDefaultHomeScreenItemProducer *)self isDayZeroExperience];
    uint64_t v5 = [(ATXDefaultHomeScreenItemProducer *)self descriptors];
    uint64_t v6 = [v5 count];
    uint64_t v7 = [(ATXDefaultHomeScreenItemProducer *)self descriptorInstallDates];
    *(_DWORD *)buf = 136315906;
    uint64_t v18 = "-[ATXDefaultHomeScreenItemProducer ambientOnboardingStacks]";
    __int16 v19 = 1024;
    BOOL v20 = v4;
    __int16 v21 = 2048;
    uint64_t v22 = v6;
    __int16 v23 = 2048;
    uint64_t v24 = [v7 count];
    _os_log_impl(&dword_1A790D000, v3, OS_LOG_TYPE_DEFAULT, "%s: generating onboarding stacks. dayZero:%d, numDescriptors:%lu, descriptorCacheSize:%lu", buf, 0x26u);
  }
  uint64_t v8 = [ATXDefaultHomeScreenItemOnboardingStacksProducer alloc];
  uint64_t v9 = [(ATXDefaultHomeScreenItemProducer *)self _stackableCandidates];
  cachedWidgetPersonalityToAppScore = self->_cachedWidgetPersonalityToAppScore;
  BOOL v11 = [(ATXDefaultHomeScreenItemProducer *)self personalityToDescriptorDictionary];
  LOBYTE(v16) = 1;
  LOBYTE(v15) = 1;
  uint64_t v12 = [(ATXDefaultHomeScreenItemOnboardingStacksProducer *)v8 initWithCandidateWidgets:v9 cachedWidgetPersonalityToAppScore:cachedWidgetPersonalityToAppScore personalityToDescriptorDictionary:v11 adblDrainClassification:self->_adblDrainClassification isiPad:self->_isiPad isDayZeroExperience:self->_isDayZeroExperience shouldIncludeContactsWidget:v15 cachedHasiCloudFamily:0 appLaunchCounts:self->_appLaunchCounts isAmbient:v16];

  v13 = [(ATXDefaultHomeScreenItemOnboardingStacksProducer *)v12 onboardingStacks];

  return v13;
}

- (id)_dayZeroOnboardingStacks
{
  v3 = [ATXDefaultHomeScreenItemOnboardingStacksProducer alloc];
  BOOL v4 = [(ATXDefaultHomeScreenItemProducer *)self _stackableCandidates];
  cachedWidgetPersonalityToAppScore = self->_cachedWidgetPersonalityToAppScore;
  uint64_t v6 = [(ATXDefaultHomeScreenItemProducer *)self personalityToDescriptorDictionary];
  LOBYTE(v11) = 0;
  LOBYTE(v10) = 1;
  uint64_t v7 = [(ATXDefaultHomeScreenItemOnboardingStacksProducer *)v3 initWithCandidateWidgets:v4 cachedWidgetPersonalityToAppScore:cachedWidgetPersonalityToAppScore personalityToDescriptorDictionary:v6 adblDrainClassification:self->_adblDrainClassification isiPad:self->_isiPad isDayZeroExperience:1 shouldIncludeContactsWidget:v10 cachedHasiCloudFamily:0 appLaunchCounts:self->_appLaunchCounts isAmbient:v11];

  uint64_t v8 = [(ATXDefaultHomeScreenItemOnboardingStacksProducer *)v7 onboardingStacks];

  return v8;
}

- (id)_personalizedUpdate
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v25 = "-[ATXDefaultHomeScreenItemProducer _personalizedUpdate]";
    _os_log_impl(&dword_1A790D000, v3, OS_LOG_TYPE_DEFAULT, "%s: updating personalized defaults", buf, 0xCu);
  }

  BOOL v4 = [(ATXDefaultHomeScreenItemProducer *)self _personalizedStack];
  uint64_t v5 = [v4 smallDefaultStack];
  if ((unint64_t)[v5 count] < 2) {
    goto LABEL_6;
  }
  uint64_t v6 = [v4 mediumDefaultStack];
  if ((unint64_t)[v6 count] <= 1)
  {

LABEL_6:
    goto LABEL_7;
  }
  uint64_t v9 = [v4 largeDefaultStack];
  unint64_t v10 = [v9 count];

  if (v10 >= 2)
  {
    uint64_t v11 = [(ATXDefaultHomeScreenItemProducer *)self _personalizedTodayStack];
    uint64_t v12 = [(ATXDefaultHomeScreenItemProducer *)self personalizedOnboardingStacksWithRankingAlgorithm:3];
    v13 = [v12 stack1];
    v23[0] = v13;
    uint64_t v14 = [v12 stack2];
    v23[1] = v14;
    uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];

    uint64_t v16 = [(ATXDefaultHomeScreenItemProducer *)self _personalizedGalleryWidgetsForSize:0];
    id v17 = [(ATXDefaultHomeScreenItemProducer *)self _personalizedGalleryWidgetsForSize:1];
    uint64_t v18 = [(ATXDefaultHomeScreenItemProducer *)self _personalizedGalleryWidgetsForSize:2];
    if (self->_isiPad)
    {
      uint64_t v19 = [(ATXDefaultHomeScreenItemProducer *)self _personalizedGalleryWidgetsForSize:4];
    }
    else
    {
      uint64_t v19 = objc_opt_new();
    }
    BOOL v20 = (void *)v19;
    __int16 v21 = [ATXDefaultHomeScreenItemUpdate alloc];
    LOBYTE(v22) = ![(ATXDefaultHomeScreenItemProducer *)self _isStackConfiguredOnHomeScreen];
    uint64_t v7 = [(ATXDefaultHomeScreenItemUpdate *)v21 initWithStack:v4 todayStack:v11 onboardingStacks:v15 smallWidgets:v16 mediumWidgets:v17 largeWidgets:v18 extraLargeWidgets:v20 shouldSuggestStackInGallery:v22];

    goto LABEL_8;
  }
LABEL_7:
  uint64_t v7 = [(ATXDefaultHomeScreenItemProducer *)self _dayZeroUpdate];
LABEL_8:

  return v7;
}

- (id)_stackFromDefaultStackPersonalities:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ATXDefaultHomeScreenItemProducer *)self personalityToDescriptorDictionary];
  uint64_t v6 = +[ATXDefaultHomeScreenItemProducerUtilities stackFromDefaultStackPersonalities:v4 suggestedSize:1 maxWidgetsPerStack:7 personalityToDescriptorDictionary:v5 isiPad:self->_isiPad];

  return v6;
}

- (NSDictionary)personalityToDescriptorDictionary
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  personalityToDescriptorDictionary = self->_personalityToDescriptorDictionary;
  if (!personalityToDescriptorDictionary)
  {
    id v4 = (NSDictionary *)objc_opt_new();
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v18 = self;
    id obj = [(ATXDefaultHomeScreenItemProducer *)self candidateDescriptors];
    uint64_t v5 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v21;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v21 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void **)(*((void *)&v20 + 1) + 8 * v8);
          unint64_t v10 = (void *)MEMORY[0x1AD0D3C30]();
          uint64_t v11 = [v9 avocadoDescriptor];
          if (v11)
          {
            uint64_t v12 = [ATXWidgetPersonality alloc];
            v13 = [v11 extensionBundleIdentifier];
            uint64_t v14 = [v11 kind];
            uint64_t v15 = [(ATXWidgetPersonality *)v12 initWithExtensionBundleId:v13 kind:v14];

            [(NSDictionary *)v4 setObject:v9 forKeyedSubscript:v15];
          }

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v6);
    }

    uint64_t v16 = v18->_personalityToDescriptorDictionary;
    v18->_personalityToDescriptorDictionary = v4;

    personalityToDescriptorDictionary = v18->_personalityToDescriptorDictionary;
  }

  return personalityToDescriptorDictionary;
}

- (NSArray)candidateDescriptors
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  candidateDescriptors = self->_candidateDescriptors;
  if (!candidateDescriptors)
  {
    id v4 = (NSArray *)objc_opt_new();
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id obj = [(ATXDefaultHomeScreenItemProducer *)self descriptors];
    uint64_t v27 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v27)
    {
      uint64_t v26 = *(void *)v30;
      do
      {
        uint64_t v5 = 0;
        do
        {
          if (*(void *)v30 != v26) {
            objc_enumerationMutation(obj);
          }
          uint64_t v6 = *(void **)(*((void *)&v29 + 1) + 8 * v5);
          uint64_t v7 = (void *)MEMORY[0x1AD0D3C30]();
          uint64_t v8 = [ATXWidgetPersonality alloc];
          uint64_t v9 = [v6 extensionBundleIdentifier];
          unint64_t v10 = [v6 kind];
          uint64_t v11 = [(ATXWidgetPersonality *)v8 initWithExtensionBundleId:v9 kind:v10];

          uint64_t v12 = [(ATXDefaultHomeScreenItemProducer *)self descriptorInstallDates];
          v13 = [v12 objectForKeyedSubscript:v11];

          if (v13)
          {
            BOOL v14 = [(ATXDefaultHomeScreenItemProducer *)self _isNewlyInstalledWidget:v6];
            [(ATXDefaultHomeScreenItemProducer *)self widgetsOnHomeScreen];
            v28 = v7;
            uint64_t v16 = v15 = v4;
            int64_t v17 = -[ATXDefaultHomeScreenItemProducer _rankTypeGivenWidgetIsNewlyInstalled:isAlreadyAdded:](self, "_rankTypeGivenWidgetIsNewlyInstalled:isAlreadyAdded:", v14, [v16 containsObject:v11]);

            uint64_t v18 = [v6 extensionIdentity];
            uint64_t v19 = [v18 containerBundleIdentifier];
            id v4 = v15;
            uint64_t v7 = v28;
            long long v20 = +[ATXDefaultHomeScreenItemProducerUtilities widgetDescriptorFromChronoDescriptor:v6 appBundleId:v19 rankType:v17];
            [(NSArray *)v4 addObject:v20];
          }
          ++v5;
        }
        while (v27 != v5);
        uint64_t v27 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v27);
    }

    long long v21 = [(ATXDefaultHomeScreenItemProducer *)self _appPredictionsWidgetDescriptor];
    if (v21) {
      [(NSArray *)v4 addObject:v21];
    }
    long long v22 = self->_candidateDescriptors;
    self->_candidateDescriptors = v4;

    candidateDescriptors = self->_candidateDescriptors;
  }
  long long v23 = (void *)[(NSArray *)candidateDescriptors copy];

  return (NSArray *)v23;
}

- (id)_personalizedStack
{
  return [(ATXDefaultHomeScreenItemProducer *)self _personalizedStackForRankerPlistType:4];
}

- (id)_personalizedTodayStack
{
  return [(ATXDefaultHomeScreenItemProducer *)self _personalizedStackForRankerPlistType:5];
}

- (id)personalizedOnboardingStacksWithRankingAlgorithm:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = [ATXDefaultHomeScreenItemOnboardingStacksProducer alloc];
  uint64_t v6 = [(ATXDefaultHomeScreenItemProducer *)self _stackableCandidates];
  cachedWidgetPersonalityToAppScore = self->_cachedWidgetPersonalityToAppScore;
  uint64_t v8 = [(ATXDefaultHomeScreenItemProducer *)self personalityToDescriptorDictionary];
  LOBYTE(v13) = 0;
  LOBYTE(v12) = 1;
  uint64_t v9 = [(ATXDefaultHomeScreenItemOnboardingStacksProducer *)v5 initWithCandidateWidgets:v6 cachedWidgetPersonalityToAppScore:cachedWidgetPersonalityToAppScore personalityToDescriptorDictionary:v8 adblDrainClassification:self->_adblDrainClassification isiPad:self->_isiPad isDayZeroExperience:0 shouldIncludeContactsWidget:v12 cachedHasiCloudFamily:0 appLaunchCounts:self->_appLaunchCounts isAmbient:v13];

  unint64_t v10 = [(ATXDefaultHomeScreenItemOnboardingStacksProducer *)v9 personalizedOnboardingStacksWithRankingAlgorithm:v3];

  return v10;
}

- (id)_personalizedStackForRankerPlistType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = [(ATXDefaultHomeScreenItemProducer *)self _stackableCandidates];
  uint64_t v6 = [(ATXDefaultHomeScreenItemProducer *)self _personalizedStackFromCandidates:v5 rankerPlistType:v3 size:0];
  uint64_t v7 = [(ATXDefaultHomeScreenItemProducer *)self _personalizedStackFromCandidates:v5 rankerPlistType:v3 size:1];
  uint64_t v8 = [(ATXDefaultHomeScreenItemProducer *)self _personalizedStackFromCandidates:v5 rankerPlistType:v3 size:2];
  if (self->_isiPad)
  {
    uint64_t v9 = [(ATXDefaultHomeScreenItemProducer *)self _personalizedStackFromCandidates:v5 rankerPlistType:v3 size:4];
  }
  else
  {
    uint64_t v9 = 0;
  }
  LOBYTE(v12) = self->_isiPad;
  unint64_t v10 = +[ATXDefaultHomeScreenItemProducerUtilities defaultWidgetStackFromSmallStack:v6 mediumStack:v7 largeStack:v8 extraLargeStack:v9 suggestedSize:1 maxWidgetsPerStack:7 isiPad:v12];

  return v10;
}

- (id)_stackableCandidates
{
  uint64_t v3 = [(id)objc_opt_class() appPredictionsWidgetDescriptor];
  id v4 = [(ATXDefaultHomeScreenItemProducer *)self candidateDescriptors];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__ATXDefaultHomeScreenItemProducer__stackableCandidates__block_invoke;
  v8[3] = &unk_1E5D06F10;
  id v9 = v3;
  id v5 = v3;
  uint64_t v6 = objc_msgSend(v4, "_pas_filteredArrayWithTest:", v8);

  return v6;
}

uint64_t __56__ATXDefaultHomeScreenItemProducer__stackableCandidates__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 avocadoDescriptor];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)] ^ 1;

  return v4;
}

- (id)_personalizedStackFromCandidates:(id)a3 rankerPlistType:(int)a4 size:(unint64_t)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v7 = +[ATXDefaultHomeScreenItemProducerUtilities widgets:a3 filteredForSize:a5];
  uint64_t v8 = [[ATXDefaultHomeScreenItemRanker alloc] initWithCachedWidgetPersonalityToAppScore:self->_cachedWidgetPersonalityToAppScore spotlightAppLaunchHistogram:self->_spotlightAppLaunchHistogram appLaunchCounts:self->_appLaunchCounts];
  id v9 = [(ATXDefaultHomeScreenItemRanker *)v8 widgetsBySortingAndFilteringWidgetsUsingPersonalizedTodayandAddSheetStackAlgorithm:v7 rankerPlistType:v5 regularlyUsedThreshold:7.0];
  unint64_t v10 = (void *)[v9 mutableCopy];

  return v10;
}

- (id)_personalizedGalleryWidgetsForSize:(unint64_t)a3
{
  uint64_t v5 = [(ATXDefaultHomeScreenItemProducer *)self candidateDescriptors];
  uint64_t v6 = +[ATXDefaultHomeScreenItemProducerUtilities widgets:v5 filteredForSize:a3];

  switch(a3)
  {
    case 1uLL:
      uint64_t v7 = 1;
      goto LABEL_9;
    case 2uLL:
      uint64_t v7 = 2;
      goto LABEL_9;
    case 3uLL:
      uint64_t v8 = __atxlog_handle_home_screen();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        -[ATXDefaultHomeScreenItemProducer _personalizedGalleryWidgetsForSize:](v8);
      }

      id v9 = 0;
      goto LABEL_10;
    case 4uLL:
      uint64_t v7 = 3;
      goto LABEL_9;
    default:
      uint64_t v7 = 0;
LABEL_9:
      unint64_t v10 = [[ATXDefaultHomeScreenItemRanker alloc] initWithCachedWidgetPersonalityToAppScore:self->_cachedWidgetPersonalityToAppScore spotlightAppLaunchHistogram:self->_spotlightAppLaunchHistogram appLaunchCounts:self->_appLaunchCounts];
      id v9 = [(ATXDefaultHomeScreenItemRanker *)v10 widgetsBySortingAndFilteringWidgetsUsingPersonalizedGalleryAlgorithm:v6 rankerPlistType:v7 regularlyUsedThreshold:7.0];

LABEL_10:
      return v9;
  }
}

- (id)_appPredictionsWidgetDescriptor
{
  uint64_t v3 = [(id)objc_opt_class() appPredictionsWidgetDescriptor];
  if (v3)
  {
    uint64_t v4 = [[ATXWidgetPersonality alloc] initWithExtensionBundleId:@"com.apple.proactive.appprediction.panel" kind:@"com.apple.proactive.appprediction.panel"];
    uint64_t v5 = [(ATXDefaultHomeScreenItemProducer *)self widgetsOnHomeScreen];
    int64_t v6 = -[ATXDefaultHomeScreenItemProducer _rankTypeGivenWidgetIsNewlyInstalled:isAlreadyAdded:](self, "_rankTypeGivenWidgetIsNewlyInstalled:isAlreadyAdded:", 0, [v5 containsObject:v4]);

    uint64_t v7 = +[ATXDefaultHomeScreenItemProducerUtilities widgetDescriptorFromChronoDescriptor:v3 appBundleId:0 rankType:v6];
  }
  else
  {
    uint64_t v8 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[ATXDefaultHomeScreenItemProducer _appPredictionsWidgetDescriptor](v8);
    }

    uint64_t v7 = 0;
  }

  return v7;
}

+ (CHSWidgetDescriptor)appPredictionsWidgetDescriptor
{
  id v2 = objc_alloc(MEMORY[0x1E4F58DF8]);
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F58CC0]) initWithExtensionBundleIdentifier:&stru_1EFD9B408 containerBundleIdentifier:0 deviceIdentifier:0];
  uint64_t v4 = (void *)[v2 initWithExtensionIdentity:v3 kind:@"SBHSpecialAvocadoDescriptorKindAppPredictions" supportedFamilies:4 intentType:0];

  return (CHSWidgetDescriptor *)v4;
}

- (NSSet)widgetsOnHomeScreen
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  widgetsOnHomeScreen = self->_widgetsOnHomeScreen;
  if (!widgetsOnHomeScreen)
  {
    uint64_t v4 = (NSSet *)objc_opt_new();
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    uint64_t v24 = self;
    id obj = [(ATXDefaultHomeScreenItemProducer *)self homeScreenConfig];
    uint64_t v27 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
    if (v27)
    {
      uint64_t v26 = *(void *)v42;
      do
      {
        uint64_t v5 = 0;
        do
        {
          if (*(void *)v42 != v26) {
            objc_enumerationMutation(obj);
          }
          uint64_t v29 = v5;
          int64_t v6 = *(void **)(*((void *)&v41 + 1) + 8 * v5);
          context = (void *)MEMORY[0x1AD0D3C30]();
          long long v37 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          uint64_t v7 = [v6 stacks];
          uint64_t v8 = [v6 panels];
          id v9 = [v7 arrayByAddingObjectsFromArray:v8];

          id v30 = v9;
          uint64_t v32 = [v9 countByEnumeratingWithState:&v37 objects:v46 count:16];
          if (v32)
          {
            uint64_t v31 = *(void *)v38;
            do
            {
              uint64_t v10 = 0;
              do
              {
                if (*(void *)v38 != v31) {
                  objc_enumerationMutation(v30);
                }
                uint64_t v11 = *(void **)(*((void *)&v37 + 1) + 8 * v10);
                long long v33 = 0u;
                long long v34 = 0u;
                long long v35 = 0u;
                long long v36 = 0u;
                uint64_t v12 = [v11 widgets];
                uint64_t v13 = [v12 countByEnumeratingWithState:&v33 objects:v45 count:16];
                if (v13)
                {
                  uint64_t v14 = v13;
                  uint64_t v15 = *(void *)v34;
                  do
                  {
                    uint64_t v16 = 0;
                    do
                    {
                      if (*(void *)v34 != v15) {
                        objc_enumerationMutation(v12);
                      }
                      int64_t v17 = *(void **)(*((void *)&v33 + 1) + 8 * v16);
                      uint64_t v18 = [ATXWidgetPersonality alloc];
                      uint64_t v19 = [v17 extensionBundleId];
                      long long v20 = [v17 widgetKind];
                      long long v21 = [(ATXWidgetPersonality *)v18 initWithExtensionBundleId:v19 kind:v20];

                      [(NSSet *)v4 addObject:v21];
                      ++v16;
                    }
                    while (v14 != v16);
                    uint64_t v14 = [v12 countByEnumeratingWithState:&v33 objects:v45 count:16];
                  }
                  while (v14);
                }

                ++v10;
              }
              while (v10 != v32);
              uint64_t v32 = [v30 countByEnumeratingWithState:&v37 objects:v46 count:16];
            }
            while (v32);
          }

          uint64_t v5 = v29 + 1;
        }
        while (v29 + 1 != v27);
        uint64_t v27 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
      }
      while (v27);
    }

    long long v22 = v24->_widgetsOnHomeScreen;
    v24->_widgetsOnHomeScreen = v4;

    widgetsOnHomeScreen = v24->_widgetsOnHomeScreen;
  }

  return widgetsOnHomeScreen;
}

- (BOOL)_isStackConfiguredOnHomeScreen
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v2 = [(ATXDefaultHomeScreenItemProducer *)self homeScreenConfig];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v22 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        uint64_t v8 = objc_msgSend(v7, "stacks", 0);
        uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v18;
          while (2)
          {
            for (uint64_t j = 0; j != v10; ++j)
            {
              if (*(void *)v18 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = [*(id *)(*((void *)&v17 + 1) + 8 * j) widgets];
              unint64_t v14 = [v13 count];

              if (v14 > 1)
              {

                BOOL v15 = 1;
                goto LABEL_19;
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v25 count:16];
            if (v10) {
              continue;
            }
            break;
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v21 objects:v26 count:16];
      BOOL v15 = 0;
    }
    while (v4);
  }
  else
  {
    BOOL v15 = 0;
  }
LABEL_19:

  return v15;
}

- (BOOL)_isNewlyInstalledWidget:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ATXDefaultHomeScreenItemProducer *)self _firstInstalledWidgetDate];
  int64_t v6 = [[ATXWidgetPersonality alloc] initWithDescriptor:v4];

  uint64_t v7 = [(ATXDefaultHomeScreenItemProducer *)self descriptorInstallDates];
  uint64_t v8 = [v7 objectForKeyedSubscript:v6];

  if (v8)
  {
    uint64_t v9 = [v8 installDate];
    uint64_t v10 = (void *)v9;
    BOOL v11 = 0;
    if (v5 && v9)
    {
      uint64_t v12 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      uint64_t v13 = [v12 dateByAddingUnit:16 value:1 toDate:v5 options:0];

      uint64_t v14 = [v10 compare:v13];
      BOOL v11 = v14 == 1;
      if (v14 == 1)
      {
        BOOL v15 = [MEMORY[0x1E4F1C9A8] currentCalendar];
        uint64_t v16 = [MEMORY[0x1E4F1C9C8] now];
        long long v17 = [v15 dateByAddingUnit:16 value:-2 toDate:v16 options:0];

        BOOL v11 = [v17 compare:v10] == -1;
      }
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (id)_firstInstalledWidgetDate
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CB18]);
  uint64_t v3 = (void *)[v2 initWithSuiteName:*MEMORY[0x1E4F4B688]];
  id v4 = [v3 objectForKey:@"dateOfFirstInstalledAvocado"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (int64_t)_rankTypeGivenWidgetIsNewlyInstalled:(BOOL)a3 isAlreadyAdded:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  BOOL v6 = [(ATXDefaultHomeScreenItemProducer *)self isDayZeroExperience];
  int64_t v7 = 1;
  if (v5) {
    int64_t v7 = 2;
  }
  int64_t v8 = 5;
  if (v4)
  {
    int64_t v8 = 6;
    int64_t v7 = 4;
  }
  if (v6) {
    return v8;
  }
  else {
    return v7;
  }
}

- (NSSet)descriptors
{
  return self->_descriptors;
}

- (NSDictionary)descriptorInstallDates
{
  return self->_descriptorInstallDates;
}

- (NSArray)homeScreenConfig
{
  return self->_homeScreenConfig;
}

- (BOOL)isDayZeroExperience
{
  return self->_isDayZeroExperience;
}

- (void)setIsDayZeroExperience:(BOOL)a3
{
  self->_isDayZeroExperience = a3;
}

- (BOOL)isiPad
{
  return self->_isiPad;
}

- (void)setIsiPad:(BOOL)a3
{
  self->_isiPad = a3;
}

- (unint64_t)adblDrainClassification
{
  return self->_adblDrainClassification;
}

- (void)setAdblDrainClassification:(unint64_t)a3
{
  self->_adblDrainClassification = a3;
}

- (void)setPersonalityToDescriptorDictionary:(id)a3
{
}

- (void)setCandidateDescriptors:(id)a3
{
}

- (void)setWidgetsOnHomeScreen:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetsOnHomeScreen, 0);
  objc_storeStrong((id *)&self->_candidateDescriptors, 0);
  objc_storeStrong((id *)&self->_personalityToDescriptorDictionary, 0);
  objc_storeStrong((id *)&self->_homeScreenConfig, 0);
  objc_storeStrong((id *)&self->_descriptorInstallDates, 0);
  objc_storeStrong((id *)&self->_descriptors, 0);
  objc_storeStrong((id *)&self->_appLaunchCounts, 0);
  objc_storeStrong((id *)&self->_spotlightAppLaunchHistogram, 0);

  objc_storeStrong((id *)&self->_cachedWidgetPersonalityToAppScore, 0);
}

- (void)_personalizedGalleryWidgetsForSize:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1A790D000, log, OS_LOG_TYPE_FAULT, "ATXDefaultHomeScreenItemProducer: we should not be ranking any widgets that are 6x4 size", v1, 2u);
}

- (void)_appPredictionsWidgetDescriptor
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A790D000, log, OS_LOG_TYPE_ERROR, "ATXDefaultHomeScreenItemProducer: could not add app predictions widget to default stack due to issue initializing the special CHSWidgetDescriptor", v1, 2u);
}

@end