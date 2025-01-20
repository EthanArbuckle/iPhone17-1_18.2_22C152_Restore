@interface ATXDefaultHomeScreenItemOnboardingStacksProducer
- (ATXDefaultHomeScreenItemOnboardingStacksProducer)initWithCandidateWidgets:(id)a3 cachedWidgetPersonalityToAppScore:(id)a4 personalityToDescriptorDictionary:(id)a5 adblDrainClassification:(unint64_t)a6 isiPad:(BOOL)a7 isDayZeroExperience:(BOOL)a8 shouldIncludeContactsWidget:(BOOL)a9 cachedHasiCloudFamily:(id)a10 appLaunchCounts:(id)a11 isAmbient:(BOOL)a12;
- (ATXDefaultHomeScreenItemOnboardingStacksProducer)initWithOnboardingStackWidgetCache:(id)a3 adblDrainClassification:(unint64_t)a4 isiPad:(BOOL)a5 shouldIncludeContactsWidget:(BOOL)a6 appLaunchCounts:(id)a7;
- (BOOL)_shouldAddWidget:(id)a3 andFilterFromApps:(id)a4;
- (BOOL)isAmbient;
- (BOOL)isDayZeroExperience;
- (BOOL)isiPad;
- (BOOL)shouldIncludeContactsWidget;
- (NSArray)stackableCandidates;
- (NSDictionary)personalityToDescriptorDictionary;
- (NSMutableDictionary)cachedWidgetPersonalityToAppScore;
- (NSNumber)cachedHasiCloudFamily;
- (id)_ambientOnboardingStacks;
- (id)_dayZeroOnboardingStacks;
- (id)_firstUnusedWidgetFromList:(id)a3 fallbackWidgets:(id)a4 usedPersonalities:(id)a5 size:(unint64_t)a6;
- (id)_firstWidgetThatIsntUsedYet:(id)a3 usedPersonalities:(id)a4;
- (id)_personalizedAmbientOnboardingStacksForSize:(unint64_t)a3 stack1RequiredWidgetPersonalities:(id)a4 stack2RequiredWidgetPersonalities:(id)a5 rankedWidgets:(id)a6 usedWidgetPersonalities:(id)a7;
- (id)_personalizedOnboardingStackForSize:(unint64_t)a3 requiredWidgetPersonalities:(id)a4 conditionalWidgetPersonalities:(id)a5 fallbackWidgetPersonalities:(id)a6 rankedThirdPartyWidgets:(id)a7 usedWidgetPersonalities:(id)a8 shouldAdd3PWidgetToStack:(BOOL)a9;
- (id)_personalizedOnboardingStacksForSize:(unint64_t)a3 requiredWidgetPersonalitiesForStack1:(id)a4 requiredWidgetPersonalitiesForStack2:(id)a5 conditionalWidgetPersonalitiesForStack1:(id)a6 conditionalWidgetPersonalitiesForStack2:(id)a7 fallbackWidgetPersonalitiesForStack1:(id)a8 fallbackWidgetPersonalitiesForStack2:(id)a9 rankedThirdPartyWidgets:(id)a10 blockedWidgetPersonalities:(id)a11;
- (id)onboardingStacks;
- (id)personalizedOnboardingStacksWithRankingAlgorithm:(int)a3;
- (unint64_t)adblDrainClassification;
- (void)_addWidget:(id)a3 toStack:(id)a4 andMarkAsUsed:(id)a5;
- (void)setCachedWidgetPersonalityToAppScore:(id)a3;
- (void)setPersonalityToDescriptorDictionary:(id)a3;
@end

@implementation ATXDefaultHomeScreenItemOnboardingStacksProducer

- (ATXDefaultHomeScreenItemOnboardingStacksProducer)initWithOnboardingStackWidgetCache:(id)a3 adblDrainClassification:(unint64_t)a4 isiPad:(BOOL)a5 shouldIncludeContactsWidget:(BOOL)a6 appLaunchCounts:(id)a7
{
  BOOL v8 = a5;
  id v12 = a7;
  id v13 = a3;
  v14 = objc_opt_new();
  v15 = objc_opt_new();
  v16 = objc_opt_new();
  v17 = [v13 descriptorToAppLaunchData];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __162__ATXDefaultHomeScreenItemOnboardingStacksProducer_initWithOnboardingStackWidgetCache_adblDrainClassification_isiPad_shouldIncludeContactsWidget_appLaunchCounts___block_invoke;
  v26[3] = &unk_1E5D060F0;
  id v27 = v14;
  id v28 = v15;
  id v29 = v16;
  id v18 = v16;
  id v19 = v15;
  id v20 = v14;
  [v17 enumerateKeysAndObjectsUsingBlock:v26];

  v21 = [v13 hasiCloudFamily];

  LOBYTE(v25) = 0;
  LOBYTE(v24) = a6;
  v22 = [(ATXDefaultHomeScreenItemOnboardingStacksProducer *)self initWithCandidateWidgets:v20 cachedWidgetPersonalityToAppScore:v19 personalityToDescriptorDictionary:v18 adblDrainClassification:a4 isiPad:v8 isDayZeroExperience:0 shouldIncludeContactsWidget:v24 cachedHasiCloudFamily:v21 appLaunchCounts:v12 isAmbient:v25];

  return v22;
}

void __162__ATXDefaultHomeScreenItemOnboardingStacksProducer_initWithOnboardingStackWidgetCache_adblDrainClassification_isiPad_shouldIncludeContactsWidget_appLaunchCounts___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  v7 = [v6 extensionIdentity];
  BOOL v8 = [v7 containerBundleIdentifier];
  id v15 = +[ATXDefaultHomeScreenItemProducerUtilities widgetDescriptorFromChronoDescriptor:v6 appBundleId:v8 rankType:1];

  v9 = [ATXWidgetPersonality alloc];
  v10 = [v6 extensionBundleIdentifier];
  v11 = [v6 kind];

  id v12 = [(ATXWidgetPersonality *)v9 initWithExtensionBundleId:v10 kind:v11];
  [*(id *)(a1 + 32) addObject:v15];
  id v13 = *(void **)(a1 + 40);
  v14 = [(ATXWidgetPersonality *)v12 stringRepresentation];
  [v13 setObject:v5 forKeyedSubscript:v14];

  [*(id *)(a1 + 48) setObject:v15 forKeyedSubscript:v12];
}

- (ATXDefaultHomeScreenItemOnboardingStacksProducer)initWithCandidateWidgets:(id)a3 cachedWidgetPersonalityToAppScore:(id)a4 personalityToDescriptorDictionary:(id)a5 adblDrainClassification:(unint64_t)a6 isiPad:(BOOL)a7 isDayZeroExperience:(BOOL)a8 shouldIncludeContactsWidget:(BOOL)a9 cachedHasiCloudFamily:(id)a10 appLaunchCounts:(id)a11 isAmbient:(BOOL)a12
{
  id v16 = a3;
  id v17 = a4;
  id v26 = a5;
  id v18 = a10;
  id v19 = a11;
  v27.receiver = self;
  v27.super_class = (Class)ATXDefaultHomeScreenItemOnboardingStacksProducer;
  id v20 = [(ATXDefaultHomeScreenItemOnboardingStacksProducer *)&v27 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_stackableCandidates, a3);
    objc_storeStrong((id *)&v21->_cachedWidgetPersonalityToAppScore, a4);
    objc_storeStrong((id *)&v21->_personalityToDescriptorDictionary, a5);
    v21->_adblDrainClassification = a6;
    v21->_isiPad = a7;
    v21->_isDayZeroExperience = a8;
    v21->_shouldIncludeContactsWidget = a9;
    objc_storeStrong((id *)&v21->_cachedHasiCloudFamily, a10);
    objc_storeStrong((id *)&v21->_appLaunchCounts, a11);
    v21->_isAmbient = a12;
  }

  return v21;
}

- (id)onboardingStacks
{
  if ([(ATXDefaultHomeScreenItemOnboardingStacksProducer *)self isAmbient])
  {
    v3 = [(ATXDefaultHomeScreenItemOnboardingStacksProducer *)self _ambientOnboardingStacks];
  }
  else
  {
    if ([(ATXDefaultHomeScreenItemOnboardingStacksProducer *)self isDayZeroExperience]) {
      [(ATXDefaultHomeScreenItemOnboardingStacksProducer *)self _dayZeroOnboardingStacks];
    }
    else {
    v3 = [(ATXDefaultHomeScreenItemOnboardingStacksProducer *)self personalizedOnboardingStacksWithRankingAlgorithm:3];
    }
  }

  return v3;
}

- (id)_ambientOnboardingStacks
{
  v3 = +[ATXDefaultHomeScreenItemProducerUtilities personalitiesFromAssetsWithKey:@"ambientOnboardingDefaultStack1RequiredWidgets"];
  v4 = +[ATXDefaultHomeScreenItemProducerUtilities personalitiesFromAssetsWithKey:@"ambientOnboardingDefaultStack2RequiredWidgets"];
  if ([(ATXDefaultHomeScreenItemOnboardingStacksProducer *)self isDayZeroExperience])
  {
    id v5 = +[ATXDefaultHomeScreenItemProducerUtilities stackFromDefaultStackPersonalities:v3 suggestedSize:0 maxWidgetsPerStack:6 personalityToDescriptorDictionary:self->_personalityToDescriptorDictionary isiPad:self->_isiPad];
    id v6 = +[ATXDefaultHomeScreenItemProducerUtilities stackFromDefaultStackPersonalities:v4 suggestedSize:0 maxWidgetsPerStack:6 personalityToDescriptorDictionary:self->_personalityToDescriptorDictionary isiPad:self->_isiPad];
    v7 = [ATXDefaultHomeScreenItemOnboardingStacks alloc];
    BOOL v8 = [(ATXDefaultHomeScreenItemOnboardingStacks *)v7 initWithOnboardingStack1:v5 stack2:v6 sortedThirdPartyWidgets:MEMORY[0x1E4F1CBF0]];
  }
  else
  {
    id v5 = [[ATXDefaultHomeScreenItemRanker alloc] initWithCachedWidgetPersonalityToAppScore:self->_cachedWidgetPersonalityToAppScore spotlightAppLaunchHistogram:0 appLaunchCounts:self->_appLaunchCounts];
    v9 = [(ATXDefaultHomeScreenItemRanker *)v5 widgetsBySortingAndFilteringWidgetsUsingOnboardingStacksAlgorithm:self->_stackableCandidates algorithm:2 regularlyUsedThreshold:(double)7uLL];
    id v6 = (void *)[v9 mutableCopy];

    +[ATXDefaultHomeScreenItemRanker filterOutDuplicateWidgetsFromSameAppBundleId:v6];
    v10 = [(ATXDefaultHomeScreenItemOnboardingStacksProducer *)self _blockedWidgetPersonalities];
    v11 = [(ATXDefaultHomeScreenItemOnboardingStacksProducer *)self _personalizedAmbientOnboardingStacksForSize:0 stack1RequiredWidgetPersonalities:v3 stack2RequiredWidgetPersonalities:v4 rankedWidgets:v6 usedWidgetPersonalities:v10];
    id v20 = v3;
    id v12 = [v11 first];
    LOBYTE(v18) = self->_isiPad;
    uint64_t v13 = MEMORY[0x1E4F1CBF0];
    v14 = +[ATXDefaultHomeScreenItemProducerUtilities defaultWidgetStackFromSmallStack:v12 mediumStack:MEMORY[0x1E4F1CBF0] largeStack:MEMORY[0x1E4F1CBF0] extraLargeStack:MEMORY[0x1E4F1CBF0] suggestedSize:0 maxWidgetsPerStack:6 isiPad:v18];

    id v15 = [v11 second];
    LOBYTE(v19) = self->_isiPad;
    id v16 = +[ATXDefaultHomeScreenItemProducerUtilities defaultWidgetStackFromSmallStack:v15 mediumStack:v13 largeStack:v13 extraLargeStack:v13 suggestedSize:0 maxWidgetsPerStack:6 isiPad:v19];

    BOOL v8 = [[ATXDefaultHomeScreenItemOnboardingStacks alloc] initWithOnboardingStack1:v14 stack2:v16 sortedThirdPartyWidgets:v13];
    v3 = v20;
  }

  return v8;
}

- (id)_dayZeroOnboardingStacks
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (self->_isiPad) {
    v3 = @"dayZeroOnboardingDefaultStack1iPad";
  }
  else {
    v3 = @"dayZeroOnboardingDefaultStack1iPhone";
  }
  v4 = +[ATXDefaultHomeScreenItemProducerUtilities personalitiesFromAssetsWithKey:v3];
  if (self->_isiPad) {
    id v5 = @"dayZeroOnboardingDefaultStack2iPad";
  }
  else {
    id v5 = @"dayZeroOnboardingDefaultStack2iPhone";
  }
  id v6 = +[ATXDefaultHomeScreenItemProducerUtilities personalitiesFromAssetsWithKey:v5];
  v7 = objc_opt_new();
  BOOL v8 = [MEMORY[0x1E4F1CA20] currentLocale];
  int v9 = [v7 isTodayWidgetPermittedForLocale:v8];

  v10 = __atxlog_handle_home_screen();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      int v18 = 136315138;
      uint64_t v19 = "-[ATXDefaultHomeScreenItemOnboardingStacksProducer _dayZeroOnboardingStacks]";
      _os_log_impl(&dword_1A790D000, v10, OS_LOG_TYPE_DEFAULT, "%s: allowing news widget", (uint8_t *)&v18, 0xCu);
    }
  }
  else
  {
    if (v11)
    {
      int v18 = 136315138;
      uint64_t v19 = "-[ATXDefaultHomeScreenItemOnboardingStacksProducer _dayZeroOnboardingStacks]";
      _os_log_impl(&dword_1A790D000, v10, OS_LOG_TYPE_DEFAULT, "%s: not allowing news widget", (uint8_t *)&v18, 0xCu);
    }

    uint64_t v12 = objc_msgSend(v4, "_pas_filteredArrayWithTest:", &__block_literal_global_16);

    [v6 _pas_filteredArrayWithTest:&__block_literal_global_83];
    id v6 = v10 = v6;
    v4 = (void *)v12;
  }

  uint64_t v13 = +[ATXDefaultHomeScreenItemProducerUtilities stackFromDefaultStackPersonalities:v4 suggestedSize:0 maxWidgetsPerStack:4 personalityToDescriptorDictionary:self->_personalityToDescriptorDictionary isiPad:self->_isiPad];
  v14 = +[ATXDefaultHomeScreenItemProducerUtilities stackFromDefaultStackPersonalities:v6 suggestedSize:0 maxWidgetsPerStack:4 personalityToDescriptorDictionary:self->_personalityToDescriptorDictionary isiPad:self->_isiPad];
  id v15 = [ATXDefaultHomeScreenItemOnboardingStacks alloc];
  id v16 = [(ATXDefaultHomeScreenItemOnboardingStacks *)v15 initWithOnboardingStack1:v13 stack2:v14 sortedThirdPartyWidgets:MEMORY[0x1E4F1CBF0]];

  return v16;
}

uint64_t __76__ATXDefaultHomeScreenItemOnboardingStacksProducer__dayZeroOnboardingStacks__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 stringRepresentation];
  if ([v3 isEqualToString:@"com.apple.news.widget:today"])
  {
    uint64_t v4 = 0;
  }
  else
  {
    id v5 = [v2 stringRepresentation];
    uint64_t v4 = [v5 isEqualToString:@"com.apple.news.widget:topic"] ^ 1;
  }
  return v4;
}

uint64_t __76__ATXDefaultHomeScreenItemOnboardingStacksProducer__dayZeroOnboardingStacks__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 stringRepresentation];
  if ([v3 isEqualToString:@"com.apple.news.widget:today"])
  {
    uint64_t v4 = 0;
  }
  else
  {
    id v5 = [v2 stringRepresentation];
    uint64_t v4 = [v5 isEqualToString:@"com.apple.news.widget:topic"] ^ 1;
  }
  return v4;
}

- (id)personalizedOnboardingStacksWithRankingAlgorithm:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v5 = [[ATXDefaultHomeScreenItemRanker alloc] initWithCachedWidgetPersonalityToAppScore:self->_cachedWidgetPersonalityToAppScore spotlightAppLaunchHistogram:0 appLaunchCounts:self->_appLaunchCounts];
  v51 = +[ATXDefaultHomeScreenItemProducerUtilities splitDescriptorsIntoFirstPartyAndThirdParty:self->_stackableCandidates];
  id v6 = [v51 second];
  v52 = v5;
  v7 = [(ATXDefaultHomeScreenItemRanker *)v5 widgetsBySortingAndFilteringWidgetsUsingOnboardingStacksAlgorithm:v6 algorithm:v3 regularlyUsedThreshold:(double)7uLL];

  BOOL v8 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v57 = "-[ATXDefaultHomeScreenItemOnboardingStacksProducer personalizedOnboardingStacksWithRankingAlgorithm:]";
    __int16 v58 = 2048;
    uint64_t v59 = [v7 count];
    _os_log_impl(&dword_1A790D000, v8, OS_LOG_TYPE_DEFAULT, "%s: %lu available 3P widgets to add to stack (all sizes)", buf, 0x16u);
  }

  if (self->_isiPad) {
    int v9 = @"personalizedOnboardingDefaultStack1RequiredWidgetsiPad";
  }
  else {
    int v9 = @"personalizedOnboardingDefaultStack1RequiredWidgetsiPhone";
  }
  uint64_t v10 = +[ATXDefaultHomeScreenItemProducerUtilities personalitiesFromAssetsWithKey:v9];
  if (self->_isiPad) {
    BOOL v11 = @"personalizedOnboardingDefaultStack2RequiredWidgetsiPad";
  }
  else {
    BOOL v11 = @"personalizedOnboardingDefaultStack2RequiredWidgetsiPhone";
  }
  uint64_t v12 = +[ATXDefaultHomeScreenItemProducerUtilities personalitiesFromAssetsWithKey:v11];
  if (self->_isiPad) {
    uint64_t v13 = @"personalizedOnboardingDefaultStack1ConditionalWidgetsiPad";
  }
  else {
    uint64_t v13 = @"personalizedOnboardingDefaultStack1ConditionalWidgetsiPhone";
  }
  uint64_t v14 = +[ATXDefaultHomeScreenItemProducerUtilities personalitiesFromAssetsWithKey:v13];
  if (self->_isiPad) {
    id v15 = @"personalizedOnboardingDefaultStack2ConditionalWidgetsiPad";
  }
  else {
    id v15 = @"personalizedOnboardingDefaultStack2ConditionalWidgetsiPhone";
  }
  uint64_t v16 = +[ATXDefaultHomeScreenItemProducerUtilities personalitiesFromAssetsWithKey:v15];
  if (self->_isiPad) {
    id v17 = @"personalizedOnboardingDefaultStack1FallbackWidgetsiPad";
  }
  else {
    id v17 = @"personalizedOnboardingDefaultStack1FallbackWidgetsiPhone";
  }
  uint64_t v18 = +[ATXDefaultHomeScreenItemProducerUtilities personalitiesFromAssetsWithKey:v17];
  if (self->_isiPad) {
    uint64_t v19 = @"personalizedOnboardingDefaultStack2FallbackWidgetsiPad";
  }
  else {
    uint64_t v19 = @"personalizedOnboardingDefaultStack2FallbackWidgetsiPhone";
  }
  uint64_t v20 = +[ATXDefaultHomeScreenItemProducerUtilities personalitiesFromAssetsWithKey:v19];
  v21 = [(ATXDefaultHomeScreenItemOnboardingStacksProducer *)self _blockedWidgetPersonalities];
  v55 = [(ATXDefaultHomeScreenItemOnboardingStacksProducer *)self _personalizedOnboardingStacksForSize:0 requiredWidgetPersonalitiesForStack1:v10 requiredWidgetPersonalitiesForStack2:v12 conditionalWidgetPersonalitiesForStack1:v14 conditionalWidgetPersonalitiesForStack2:v16 fallbackWidgetPersonalitiesForStack1:v18 fallbackWidgetPersonalitiesForStack2:v20 rankedThirdPartyWidgets:v7 blockedWidgetPersonalities:v21];
  v54 = [(ATXDefaultHomeScreenItemOnboardingStacksProducer *)self _personalizedOnboardingStacksForSize:1 requiredWidgetPersonalitiesForStack1:v10 requiredWidgetPersonalitiesForStack2:v12 conditionalWidgetPersonalitiesForStack1:v14 conditionalWidgetPersonalitiesForStack2:v16 fallbackWidgetPersonalitiesForStack1:v18 fallbackWidgetPersonalitiesForStack2:v20 rankedThirdPartyWidgets:v7 blockedWidgetPersonalities:v21];
  v53 = [(ATXDefaultHomeScreenItemOnboardingStacksProducer *)self _personalizedOnboardingStacksForSize:2 requiredWidgetPersonalitiesForStack1:v10 requiredWidgetPersonalitiesForStack2:v12 conditionalWidgetPersonalitiesForStack1:v14 conditionalWidgetPersonalitiesForStack2:v16 fallbackWidgetPersonalitiesForStack1:v18 fallbackWidgetPersonalitiesForStack2:v20 rankedThirdPartyWidgets:v7 blockedWidgetPersonalities:v21];
  v49 = (void *)v10;
  v50 = v7;
  v47 = (void *)v14;
  v48 = (void *)v12;
  v45 = (void *)v18;
  v46 = (void *)v16;
  if (self->_isiPad)
  {
    uint64_t v22 = -[ATXDefaultHomeScreenItemOnboardingStacksProducer _personalizedOnboardingStacksForSize:requiredWidgetPersonalitiesForStack1:requiredWidgetPersonalitiesForStack2:conditionalWidgetPersonalitiesForStack1:conditionalWidgetPersonalitiesForStack2:fallbackWidgetPersonalitiesForStack1:fallbackWidgetPersonalitiesForStack2:rankedThirdPartyWidgets:blockedWidgetPersonalities:](self, "_personalizedOnboardingStacksForSize:requiredWidgetPersonalitiesForStack1:requiredWidgetPersonalitiesForStack2:conditionalWidgetPersonalitiesForStack1:conditionalWidgetPersonalitiesForStack2:fallbackWidgetPersonalitiesForStack1:fallbackWidgetPersonalitiesForStack2:rankedThirdPartyWidgets:blockedWidgetPersonalities:", 4, v10, v12, v14, v16, v18, v20, v7, v21, v18, v16, v14, v12, v10);
  }
  else
  {
    id v23 = objc_alloc(MEMORY[0x1E4F93BB8]);
    uint64_t v22 = [v23 initWithFirst:MEMORY[0x1E4F1CBF0] second:MEMORY[0x1E4F1CBF0]];
  }
  uint64_t v24 = (void *)v22;
  uint64_t v25 = [v55 first];
  id v26 = [v54 first];
  objc_super v27 = [v53 first];
  id v28 = [v24 first];
  LOBYTE(v43) = self->_isiPad;
  id v29 = +[ATXDefaultHomeScreenItemProducerUtilities defaultWidgetStackFromSmallStack:mediumStack:largeStack:extraLargeStack:suggestedSize:maxWidgetsPerStack:isiPad:](ATXDefaultHomeScreenItemProducerUtilities, "defaultWidgetStackFromSmallStack:mediumStack:largeStack:extraLargeStack:suggestedSize:maxWidgetsPerStack:isiPad:", v25, v26, v27, v28, v43);

  v30 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    v31 = [v29 compactDescription];
    unint64_t adblDrainClassification = self->_adblDrainClassification;
    *(_DWORD *)buf = 138543618;
    v57 = v31;
    __int16 v58 = 2048;
    uint64_t v59 = adblDrainClassification;
    _os_log_impl(&dword_1A790D000, v30, OS_LOG_TYPE_DEFAULT, "ATXDefaultHomeScreenItemProducer: generated personalized onboarding stack 1:%{public}@, battery drain: %lu", buf, 0x16u);
  }
  v33 = [v55 second];
  v34 = [v54 second];
  v35 = [v53 second];
  v36 = [v24 second];
  LOBYTE(v44) = self->_isiPad;
  v37 = +[ATXDefaultHomeScreenItemProducerUtilities defaultWidgetStackFromSmallStack:mediumStack:largeStack:extraLargeStack:suggestedSize:maxWidgetsPerStack:isiPad:](ATXDefaultHomeScreenItemProducerUtilities, "defaultWidgetStackFromSmallStack:mediumStack:largeStack:extraLargeStack:suggestedSize:maxWidgetsPerStack:isiPad:", v33, v34, v35, v36, v44);

  v38 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    v39 = [v29 compactDescription];
    unint64_t v40 = self->_adblDrainClassification;
    *(_DWORD *)buf = 138543618;
    v57 = v39;
    __int16 v58 = 2048;
    uint64_t v59 = v40;
    _os_log_impl(&dword_1A790D000, v38, OS_LOG_TYPE_DEFAULT, "ATXDefaultHomeScreenItemProducer: generated personalized onboarding stack 2:%{public}@, battery drain: %lu", buf, 0x16u);
  }
  v41 = [[ATXDefaultHomeScreenItemOnboardingStacks alloc] initWithOnboardingStack1:v29 stack2:v37 sortedThirdPartyWidgets:v50];

  return v41;
}

- (id)_personalizedAmbientOnboardingStacksForSize:(unint64_t)a3 stack1RequiredWidgetPersonalities:(id)a4 stack2RequiredWidgetPersonalities:(id)a5 rankedWidgets:(id)a6 usedWidgetPersonalities:(id)a7
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v45 = a5;
  id v41 = a6;
  id v13 = a7;
  v46 = objc_opt_new();
  uint64_t v14 = objc_opt_new();
  uint64_t v43 = self;
  unint64_t v44 = a3;
  id v15 = +[ATXDefaultHomeScreenItemProducerUtilities widgetsFromPersonalities:v12 size:a3 personalityToDescriptorDictionary:self->_personalityToDescriptorDictionary];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v51 objects:v58 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v52 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v51 + 1) + 8 * i);
        v21 = +[ATXWidgetPersonality stringRepresentationForATXHomeScreenWidgetDescriptor:v20];
        if ([v13 containsObject:v21])
        {
          uint64_t v22 = __atxlog_handle_home_screen();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v57 = v21;
            _os_log_impl(&dword_1A790D000, v22, OS_LOG_TYPE_DEFAULT, "ATXDefaultHomeScreenItemProducer: not adding required widget %{public}@ to first ambient onboarding stack because it is already used (or on deny list)", buf, 0xCu);
          }
        }
        else
        {
          [v46 addObject:v20];
          [v13 addObject:v21];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v51 objects:v58 count:16];
    }
    while (v17);
  }
  v42 = v12;
  id v23 = objc_msgSend(v12, "_pas_mappedArrayWithTransform:", &__block_literal_global_87);
  [v13 addObjectsFromArray:v23];

  uint64_t v24 = +[ATXDefaultHomeScreenItemProducerUtilities widgetsFromPersonalities:v45 size:v44 personalityToDescriptorDictionary:v43->_personalityToDescriptorDictionary];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v47 objects:v55 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v48;
    do
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v48 != v27) {
          objc_enumerationMutation(v24);
        }
        uint64_t v29 = *(void *)(*((void *)&v47 + 1) + 8 * j);
        v30 = +[ATXWidgetPersonality stringRepresentationForATXHomeScreenWidgetDescriptor:v29];
        if ([v13 containsObject:v30])
        {
          v31 = __atxlog_handle_home_screen();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v57 = v30;
            _os_log_impl(&dword_1A790D000, v31, OS_LOG_TYPE_DEFAULT, "ATXDefaultHomeScreenItemProducer: not adding required widget %{public}@ to second ambient onboarding stack because it is already used (or on deny list)", buf, 0xCu);
          }
        }
        else
        {
          [v14 addObject:v29];
          [v13 addObject:v30];
        }
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v47 objects:v55 count:16];
    }
    while (v26);
  }
  v32 = objc_msgSend(v45, "_pas_mappedArrayWithTransform:", &__block_literal_global_90);
  [v13 addObjectsFromArray:v32];

  if ((unint64_t)[v46 count] <= 5)
  {
    uint64_t v33 = MEMORY[0x1E4F1CBF0];
    do
    {
      uint64_t v34 = [(ATXDefaultHomeScreenItemOnboardingStacksProducer *)v43 _firstUnusedWidgetFromList:v41 fallbackWidgets:v33 usedPersonalities:v13 size:v44];
      if (!v34) {
        break;
      }
      v35 = (void *)v34;
      [(ATXDefaultHomeScreenItemOnboardingStacksProducer *)v43 _addWidget:v34 toStack:v46 andMarkAsUsed:v13];
    }
    while ((unint64_t)[v46 count] < 6);
  }
  if ((unint64_t)[v14 count] <= 5)
  {
    uint64_t v36 = MEMORY[0x1E4F1CBF0];
    do
    {
      uint64_t v37 = [(ATXDefaultHomeScreenItemOnboardingStacksProducer *)v43 _firstUnusedWidgetFromList:v41 fallbackWidgets:v36 usedPersonalities:v13 size:v44];
      if (!v37) {
        break;
      }
      v38 = (void *)v37;
      [(ATXDefaultHomeScreenItemOnboardingStacksProducer *)v43 _addWidget:v37 toStack:v14 andMarkAsUsed:v13];
    }
    while ((unint64_t)[v14 count] < 6);
  }
  v39 = (void *)[objc_alloc(MEMORY[0x1E4F93BB8]) initWithFirst:v46 second:v14];

  return v39;
}

uint64_t __202__ATXDefaultHomeScreenItemOnboardingStacksProducer__personalizedAmbientOnboardingStacksForSize_stack1RequiredWidgetPersonalities_stack2RequiredWidgetPersonalities_rankedWidgets_usedWidgetPersonalities___block_invoke(uint64_t a1, void *a2)
{
  return [a2 stringRepresentation];
}

uint64_t __202__ATXDefaultHomeScreenItemOnboardingStacksProducer__personalizedAmbientOnboardingStacksForSize_stack1RequiredWidgetPersonalities_stack2RequiredWidgetPersonalities_rankedWidgets_usedWidgetPersonalities___block_invoke_88(uint64_t a1, void *a2)
{
  return [a2 stringRepresentation];
}

- (id)_personalizedOnboardingStacksForSize:(unint64_t)a3 requiredWidgetPersonalitiesForStack1:(id)a4 requiredWidgetPersonalitiesForStack2:(id)a5 conditionalWidgetPersonalitiesForStack1:(id)a6 conditionalWidgetPersonalitiesForStack2:(id)a7 fallbackWidgetPersonalitiesForStack1:(id)a8 fallbackWidgetPersonalitiesForStack2:(id)a9 rankedThirdPartyWidgets:(id)a10 blockedWidgetPersonalities:(id)a11
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v31 = a11;
  id v34 = a9;
  id v32 = a8;
  id v33 = a7;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  v21 = +[ATXDefaultHomeScreenItemProducerUtilities widgets:a10 filteredForSize:a3];
  uint64_t v22 = (void *)[v21 mutableCopy];

  +[ATXDefaultHomeScreenItemRanker filterOutDuplicateWidgetsFromSameAppBundleId:v22];
  id v23 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v36 = "-[ATXDefaultHomeScreenItemOnboardingStacksProducer _personalizedOnboardingStacksForSize:requiredWidgetPersonal"
          "itiesForStack1:requiredWidgetPersonalitiesForStack2:conditionalWidgetPersonalitiesForStack1:conditionalWidgetP"
          "ersonalitiesForStack2:fallbackWidgetPersonalitiesForStack1:fallbackWidgetPersonalitiesForStack2:rankedThirdPar"
          "tyWidgets:blockedWidgetPersonalities:]";
    __int16 v37 = 2048;
    uint64_t v38 = [v22 count];
    __int16 v39 = 2048;
    unint64_t v40 = a3;
    _os_log_impl(&dword_1A790D000, v23, OS_LOG_TYPE_DEFAULT, "%s: %lu available 3P widgets for onboarding stack of size:%lu)", buf, 0x20u);
  }

  uint64_t v24 = (void *)[v31 mutableCopy];
  LOBYTE(v29) = 1;
  uint64_t v25 = [(ATXDefaultHomeScreenItemOnboardingStacksProducer *)self _personalizedOnboardingStackForSize:a3 requiredWidgetPersonalities:v20 conditionalWidgetPersonalities:v18 fallbackWidgetPersonalities:v32 rankedThirdPartyWidgets:v22 usedWidgetPersonalities:v24 shouldAdd3PWidgetToStack:v29];

  LOBYTE(v30) = self->_adblDrainClassification != 3;
  uint64_t v26 = [(ATXDefaultHomeScreenItemOnboardingStacksProducer *)self _personalizedOnboardingStackForSize:a3 requiredWidgetPersonalities:v19 conditionalWidgetPersonalities:v33 fallbackWidgetPersonalities:v34 rankedThirdPartyWidgets:v22 usedWidgetPersonalities:v24 shouldAdd3PWidgetToStack:v30];

  uint64_t v27 = (void *)[objc_alloc(MEMORY[0x1E4F93BB8]) initWithFirst:v25 second:v26];

  return v27;
}

uint64_t __79__ATXDefaultHomeScreenItemOnboardingStacksProducer__blockedWidgetPersonalities__block_invoke(uint64_t a1, void *a2)
{
  return [a2 stringRepresentation];
}

- (id)_personalizedOnboardingStackForSize:(unint64_t)a3 requiredWidgetPersonalities:(id)a4 conditionalWidgetPersonalities:(id)a5 fallbackWidgetPersonalities:(id)a6 rankedThirdPartyWidgets:(id)a7 usedWidgetPersonalities:(id)a8 shouldAdd3PWidgetToStack:(BOOL)a9
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v15 = a4;
  id v61 = a5;
  id v60 = a6;
  id v59 = a7;
  id v16 = a8;
  unint64_t v64 = a3;
  id v65 = (id)objc_opt_new();
  v62 = v15;
  v63 = self;
  uint64_t v17 = +[ATXDefaultHomeScreenItemProducerUtilities widgetsFromPersonalities:v15 size:a3 personalityToDescriptorDictionary:self->_personalityToDescriptorDictionary];
  id v18 = (void *)[v17 mutableCopy];

  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  obuint64_t j = v18;
  uint64_t v19 = [obj countByEnumeratingWithState:&v68 objects:v75 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v69;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v69 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = *(void *)(*((void *)&v68 + 1) + 8 * i);
        uint64_t v24 = +[ATXWidgetPersonality stringRepresentationForATXHomeScreenWidgetDescriptor:v23];
        if ([v16 containsObject:v24])
        {
          uint64_t v25 = __atxlog_handle_home_screen();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            *(void *)v73 = v24;
            *(_WORD *)&v73[8] = 2048;
            unint64_t v74 = v64;
            _os_log_impl(&dword_1A790D000, v25, OS_LOG_TYPE_DEFAULT, "ATXDefaultHomeScreenItemProducer: not adding required widget %{public}@ to onboarding stack of size: %lu because it is already used (or on deny list)", buf, 0x16u);
          }
        }
        else
        {
          [v65 addObject:v23];
          [v16 addObject:v24];
        }
      }
      uint64_t v20 = [obj countByEnumeratingWithState:&v68 objects:v75 count:16];
    }
    while (v20);
  }

  uint64_t v26 = objc_msgSend(v15, "_pas_mappedArrayWithTransform:", &__block_literal_global_96);
  [v16 addObjectsFromArray:v26];

  id v27 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  id v28 = (void *)CFPreferencesCopyAppValue(@"SBSearchDisabledShortcuts", @"com.apple.spotlightui");
  uint64_t v29 = v28;
  if (v28) {
    id v30 = v28;
  }
  else {
    id v30 = (id)objc_opt_new();
  }
  id v31 = v30;

  id v32 = (void *)[v27 initWithArray:v31];
  if ([(ATXDefaultHomeScreenItemOnboardingStacksProducer *)v63 isiPad]
    && [(ATXDefaultHomeScreenItemOnboardingStacksProducer *)v63 shouldIncludeContactsWidget])
  {
    id v33 = __atxlog_handle_home_screen();
    id v34 = v61;
    v35 = v59;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A790D000, v33, OS_LOG_TYPE_DEFAULT, "Considering Contacts widget... is iPad: YES, should include: YES", buf, 2u);
    }

    v67[0] = MEMORY[0x1E4F143A8];
    v67[1] = 3221225472;
    v67[2] = __248__ATXDefaultHomeScreenItemOnboardingStacksProducer__personalizedOnboardingStackForSize_requiredWidgetPersonalities_conditionalWidgetPersonalities_fallbackWidgetPersonalities_rankedThirdPartyWidgets_usedWidgetPersonalities_shouldAdd3PWidgetToStack___block_invoke_98;
    v67[3] = &unk_1E5D06158;
    v67[4] = v63;
    uint64_t v36 = (unsigned int (**)(void))MEMORY[0x1AD0D3E40](v67);
    if (v36[2]())
    {
      __int16 v37 = [[ATXWidgetPersonality alloc] initWithExtensionBundleId:@"com.apple.PeopleViewService.PeopleWidget-iOS" kind:@"MultipleContactWidget_iOS"];
      uint64_t v38 = [(ATXWidgetPersonality *)v37 stringRepresentation];
      char v39 = [v16 containsObject:v38];

      if (v39)
      {
        unint64_t v40 = __atxlog_handle_home_screen();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A790D000, v40, OS_LOG_TYPE_DEFAULT, "Contacts widget already exists in used personalities list, not adding", buf, 2u);
        }
      }
      else
      {
        id v45 = objc_alloc(MEMORY[0x1E4F58D48]);
        v46 = (void *)[objc_alloc(MEMORY[0x1E4F58CC0]) initWithExtensionBundleIdentifier:@"com.apple.PeopleViewService.PeopleWidget-iOS" containerBundleIdentifier:@"com.apple.PeopleViewService" deviceIdentifier:0];
        unint64_t v40 = [v45 initWithExtensionIdentity:v46 kind:@"MultipleContactWidget_iOS" supportedFamilies:28 intentType:@"SelectPeopleIntent"];

        long long v47 = objc_opt_new();
        [v47 setAvocadoDescriptor:v40];
        [v47 setSuggestedSize:1];
        if ([(ATXDefaultHomeScreenItemOnboardingStacksProducer *)v63 _shouldAddWidget:v47 andFilterFromApps:v32])
        {
          [(ATXDefaultHomeScreenItemOnboardingStacksProducer *)v63 _addWidget:v47 toStack:v65 andMarkAsUsed:v16];
        }
        long long v48 = __atxlog_handle_home_screen();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v73 = v47;
          _os_log_impl(&dword_1A790D000, v48, OS_LOG_TYPE_DEFAULT, "Added contacts widget to stack: %@", buf, 0xCu);
        }
      }
    }
    else
    {
      __atxlog_handle_home_screen();
      __int16 v37 = (ATXWidgetPersonality *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v37->super, OS_LOG_TYPE_DEFAULT))
      {
        cachedHasiCloudFamily = v63->_cachedHasiCloudFamily;
        *(_DWORD *)buf = 138412290;
        *(void *)v73 = cachedHasiCloudFamily;
        _os_log_impl(&dword_1A790D000, &v37->super, OS_LOG_TYPE_DEFAULT, "Not considering Contacts widget... no iCloud family (cached bit: %@)", buf, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v41 = __atxlog_handle_home_screen();
    id v34 = v61;
    v35 = v59;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v42 = [(ATXDefaultHomeScreenItemOnboardingStacksProducer *)v63 isiPad];
      BOOL v43 = [(ATXDefaultHomeScreenItemOnboardingStacksProducer *)v63 shouldIncludeContactsWidget];
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v73 = v42;
      *(_WORD *)&v73[4] = 1024;
      *(_DWORD *)&v73[6] = v43;
      _os_log_impl(&dword_1A790D000, v41, OS_LOG_TYPE_DEFAULT, "Not considering Contacts widget... is iPad: %{BOOL}d, should include: %{BOOL}d", buf, 0xEu);
    }
  }
  uint64_t v49 = +[ATXDefaultHomeScreenItemProducerUtilities widgetsFromPersonalities:v34 size:v64 personalityToDescriptorDictionary:v63->_personalityToDescriptorDictionary];
  long long v50 = [[ATXDefaultHomeScreenItemRanker alloc] initWithCachedWidgetPersonalityToAppScore:v63->_cachedWidgetPersonalityToAppScore spotlightAppLaunchHistogram:0 appLaunchCounts:v63->_appLaunchCounts];
  long long v51 = (void *)v49;
  long long v52 = [(ATXDefaultHomeScreenItemRanker *)v50 widgetsBySortingAndFilteringWidgetsUsingOnboardingStacksAlgorithm:v49 algorithm:3 regularlyUsedThreshold:(double)7uLL];
  long long v53 = +[ATXDefaultHomeScreenItemProducerUtilities widgetsFromPersonalities:v60 size:v64 personalityToDescriptorDictionary:v63->_personalityToDescriptorDictionary];
  long long v54 = [(ATXDefaultHomeScreenItemOnboardingStacksProducer *)v63 _firstUnusedWidgetFromList:v52 fallbackWidgets:v53 usedPersonalities:v16 size:v64];
  [(ATXDefaultHomeScreenItemOnboardingStacksProducer *)v63 _addWidget:v54 toStack:v65 andMarkAsUsed:v16];
  if ((unint64_t)[v65 count] <= 2)
  {
    v55 = [(ATXDefaultHomeScreenItemOnboardingStacksProducer *)v63 _firstUnusedWidgetFromList:v52 fallbackWidgets:v53 usedPersonalities:v16 size:v64];
    [(ATXDefaultHomeScreenItemOnboardingStacksProducer *)v63 _addWidget:v55 toStack:v65 andMarkAsUsed:v16];
  }
  if (a9)
  {
    v56 = [(ATXDefaultHomeScreenItemOnboardingStacksProducer *)v63 _firstWidgetThatIsntUsedYet:v35 usedPersonalities:v16];
    [(ATXDefaultHomeScreenItemOnboardingStacksProducer *)v63 _addWidget:v56 toStack:v65 andMarkAsUsed:v16];
  }
  else
  {
    v56 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t adblDrainClassification = v63->_adblDrainClassification;
      *(_DWORD *)buf = 134218240;
      *(void *)v73 = v64;
      *(_WORD *)&v73[8] = 2048;
      unint64_t v74 = adblDrainClassification;
      _os_log_impl(&dword_1A790D000, v56, OS_LOG_TYPE_DEFAULT, "ATXDefaultHomeScreenItemProducer: not adding 3P widget to onboarding stack of size: %lu because of drain: %lu", buf, 0x16u);
    }
  }

  return v65;
}

uint64_t __248__ATXDefaultHomeScreenItemOnboardingStacksProducer__personalizedOnboardingStackForSize_requiredWidgetPersonalities_conditionalWidgetPersonalities_fallbackWidgetPersonalities_rankedThirdPartyWidgets_usedWidgetPersonalities_shouldAdd3PWidgetToStack___block_invoke(uint64_t a1, void *a2)
{
  return [a2 stringRepresentation];
}

uint64_t __248__ATXDefaultHomeScreenItemOnboardingStacksProducer__personalizedOnboardingStackForSize_requiredWidgetPersonalities_conditionalWidgetPersonalities_fallbackWidgetPersonalities_rankedThirdPartyWidgets_usedWidgetPersonalities_shouldAdd3PWidgetToStack___block_invoke_98(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(a1 + 32) + 48) BOOLValue])
  {
    v1 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v5[0]) = 0;
      _os_log_impl(&dword_1A790D000, v1, OS_LOG_TYPE_DEFAULT, "Considering Contacts widget... has cached iCloud family", (uint8_t *)v5, 2u);
    }
    uint64_t v2 = 1;
  }
  else
  {
    uint64_t v3 = objc_opt_new();
    uint64_t v2 = [v3 hasiCloudFamily];

    v1 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      v5[0] = 67109120;
      v5[1] = v2;
      _os_log_impl(&dword_1A790D000, v1, OS_LOG_TYPE_DEFAULT, "Considering Contacts widget... scorer response: %{BOOL}d", (uint8_t *)v5, 8u);
    }
  }

  return v2;
}

- (void)_addWidget:(id)a3 toStack:(id)a4 andMarkAsUsed:(id)a5
{
  if (a3)
  {
    id v7 = a5;
    id v8 = a3;
    [a4 addObject:v8];
    id v9 = +[ATXWidgetPersonality stringRepresentationForATXHomeScreenWidgetDescriptor:v8];

    [v7 addObject:v9];
  }
}

- (BOOL)_shouldAddWidget:(id)a3 andFilterFromApps:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 appBundleId];
  BOOL v8 = v7 == 0;

  if (!v7)
  {
    BOOL v11 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 136315394;
      uint64_t v19 = "-[ATXDefaultHomeScreenItemOnboardingStacksProducer _shouldAddWidget:andFilterFromApps:]";
      __int16 v20 = 2112;
      id v21 = v5;
      _os_log_impl(&dword_1A790D000, v11, OS_LOG_TYPE_DEFAULT, "%s: No parent bundleId for Widget descriptor: %@", (uint8_t *)&v18, 0x16u);
    }
    goto LABEL_11;
  }
  id v9 = [v5 appBundleId];
  int v10 = [v6 containsObject:v9];

  if (v10)
  {
    BOOL v11 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [v5 appBundleId];
      int v18 = 138412290;
      uint64_t v19 = v12;
      id v13 = "ATXDefaultHomeScreenItemProducer: Show on Homescreen is turned off for app with bundleId: %@. Hence not adding its widget";
LABEL_10:
      _os_log_impl(&dword_1A790D000, v11, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v18, 0xCu);
    }
  }
  else
  {
    uint64_t v14 = objc_opt_new();
    id v15 = [v5 appBundleId];
    int v16 = [v14 bundleIdIsLockedOrHiddenByUserPreference:v15];

    if (!v16)
    {
      BOOL v8 = 1;
      goto LABEL_12;
    }
    BOOL v11 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [v5 appBundleId];
      int v18 = 138412290;
      uint64_t v19 = v12;
      id v13 = "ATXDefaultHomeScreenItemProducer: App: %@ is locked or hidden by user preference. Hence not adding its widget";
      goto LABEL_10;
    }
  }
LABEL_11:

LABEL_12:
  return v8;
}

- (id)_firstUnusedWidgetFromList:(id)a3 fallbackWidgets:(id)a4 usedPersonalities:(id)a5 size:(unint64_t)a6
{
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = [(ATXDefaultHomeScreenItemOnboardingStacksProducer *)self _firstWidgetThatIsntUsedYet:a3 usedPersonalities:v10];
  id v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    id v13 = [(ATXDefaultHomeScreenItemOnboardingStacksProducer *)self _firstWidgetThatIsntUsedYet:v9 usedPersonalities:v10];
  }
  uint64_t v14 = v13;

  return v14;
}

- (id)_firstWidgetThatIsntUsedYet:(id)a3 usedPersonalities:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v24 = a4;
  id v7 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  BOOL v8 = (void *)CFPreferencesCopyAppValue(@"SBSearchDisabledShortcuts", @"com.apple.spotlightui");
  id v9 = v8;
  if (v8) {
    id v10 = v8;
  }
  else {
    id v10 = (id)objc_opt_new();
  }
  BOOL v11 = v10;

  id v12 = (void *)[v7 initWithArray:v11];
  id v13 = objc_opt_new();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v14 = v6;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v26;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        __int16 v20 = +[ATXWidgetPersonality stringRepresentationForATXHomeScreenWidgetDescriptor:v19];
        if (!-[ATXDefaultHomeScreenItemOnboardingStacksProducer _shouldAddWidget:andFilterFromApps:](self, "_shouldAddWidget:andFilterFromApps:", v19, v12)|| ([v13 addObject:v20], !objc_msgSend(v24, "containsObject:", v20)))
        {
          id v22 = v19;

          id v21 = v14;
          goto LABEL_17;
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }

  id v21 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
    -[ATXDefaultHomeScreenItemOnboardingStacksProducer _firstWidgetThatIsntUsedYet:usedPersonalities:]((uint64_t)v24, (uint64_t)v13, v21);
  }
  id v22 = 0;
LABEL_17:

  return v22;
}

- (NSArray)stackableCandidates
{
  return self->_stackableCandidates;
}

- (NSMutableDictionary)cachedWidgetPersonalityToAppScore
{
  return self->_cachedWidgetPersonalityToAppScore;
}

- (void)setCachedWidgetPersonalityToAppScore:(id)a3
{
}

- (NSDictionary)personalityToDescriptorDictionary
{
  return self->_personalityToDescriptorDictionary;
}

- (void)setPersonalityToDescriptorDictionary:(id)a3
{
}

- (BOOL)isDayZeroExperience
{
  return self->_isDayZeroExperience;
}

- (BOOL)isiPad
{
  return self->_isiPad;
}

- (NSNumber)cachedHasiCloudFamily
{
  return self->_cachedHasiCloudFamily;
}

- (BOOL)shouldIncludeContactsWidget
{
  return self->_shouldIncludeContactsWidget;
}

- (unint64_t)adblDrainClassification
{
  return self->_adblDrainClassification;
}

- (BOOL)isAmbient
{
  return self->_isAmbient;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedHasiCloudFamily, 0);
  objc_storeStrong((id *)&self->_personalityToDescriptorDictionary, 0);
  objc_storeStrong((id *)&self->_cachedWidgetPersonalityToAppScore, 0);
  objc_storeStrong((id *)&self->_stackableCandidates, 0);

  objc_storeStrong((id *)&self->_appLaunchCounts, 0);
}

- (void)_firstWidgetThatIsntUsedYet:(os_log_t)log usedPersonalities:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v3 = 136315650;
  uint64_t v4 = "-[ATXDefaultHomeScreenItemOnboardingStacksProducer _firstWidgetThatIsntUsedYet:usedPersonalities:]";
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_1A790D000, log, OS_LOG_TYPE_ERROR, "%s: could not find widget that wasn't already used, used personalities: %@, available widgets: %@", (uint8_t *)&v3, 0x20u);
}

@end