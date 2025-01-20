@interface CNUIDataCollector
+ (BOOL)isEnabled;
+ (id)sharedCollector;
- (CNMetricsUIReporter)metricsReporter;
- (CNUIDataCollector)init;
- (CNUIDataCollector)initWithEnvironment:(id)a3;
- (CNUIDataCollectorSGLogger)sgLogger;
- (NSString)appIdentifier;
- (void)logContactActionType:(id)a3 attributes:(id)a4;
- (void)logContactCreated:(id)a3 originalContact:(id)a4;
- (void)logContactShown:(id)a3;
- (void)logPresentation;
- (void)logSearchResultSelected:(id)a3;
- (void)logSearchResultsFetchedSuggested:(BOOL)a3;
- (void)logSearchUsage;
@end

@implementation CNUIDataCollector

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sgLogger, 0);
  objc_storeStrong((id *)&self->_appIdentifier, 0);

  objc_storeStrong((id *)&self->_metricsReporter, 0);
}

- (CNUIDataCollectorSGLogger)sgLogger
{
  return self->_sgLogger;
}

- (NSString)appIdentifier
{
  return self->_appIdentifier;
}

- (CNMetricsUIReporter)metricsReporter
{
  return self->_metricsReporter;
}

- (void)logContactCreated:(id)a3 originalContact:(id)a4
{
  id v11 = a4;
  id v6 = a3;
  if ([v11 isSuggested])
  {
    v7 = [v11 suggestionRecordId];
  }
  else
  {
    v7 = 0;
  }
  v8 = [(CNUIDataCollector *)self sgLogger];
  v9 = [v6 identifier];

  v10 = [(CNUIDataCollector *)self appIdentifier];
  [v8 logContactCreated:v7 contactIdentifier:v9 bundleID:v10];
}

- (void)logContactShown:(id)a3
{
  id v9 = a3;
  _suggestedContact(v9);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (v4 == v9)
    {
      v5 = 0;
    }
    else
    {
      v5 = [v9 identifier];
    }
    id v6 = [(CNUIDataCollector *)self sgLogger];
    v7 = [v4 suggestionRecordId];
    v8 = [(CNUIDataCollector *)self appIdentifier];
    [v6 logSuggestedContactDetailShown:v7 contactIdentifier:v5 bundleID:v8];
  }
}

- (void)logSearchResultSelected:(id)a3
{
  id v11 = a3;
  if (+[CNUIDataCollector isEnabled])
  {
    _suggestedContact(v11);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    if (v4 == v11)
    {
      v5 = 0;
    }
    else
    {
      v5 = [v11 identifier];
    }
    id v6 = [(CNUIDataCollector *)self sgLogger];
    v7 = [v4 suggestionRecordId];
    v8 = [(CNUIDataCollector *)self appIdentifier];
    [v6 logContactSearchResultSelected:v7 contactIdentifier:v5 bundleID:v8];

    id v9 = [(CNUIDataCollector *)self metricsReporter];
    v10 = [(CNUIDataCollector *)self appIdentifier];
    objc_msgSend(v9, "logSearchResultsSelectedforApplication:fromSuggestions:", v10, objc_msgSend(v11, "isSuggested"));
  }
}

- (void)logSearchResultsFetchedSuggested:(BOOL)a3
{
  BOOL v3 = a3;
  if (+[CNUIDataCollector isEnabled])
  {
    if (v3)
    {
      v5 = [(CNUIDataCollector *)self sgLogger];
      id v6 = [(CNUIDataCollector *)self appIdentifier];
      [v5 logSearchResultsIncludedPureSuggestionsWithBundleID:v6];
    }
    id v8 = [(CNUIDataCollector *)self metricsReporter];
    v7 = [(CNUIDataCollector *)self appIdentifier];
    [v8 logSearchResultsFetchedforApplication:v7 fromSuggestions:v3];
  }
}

- (void)logSearchUsage
{
  if (+[CNUIDataCollector isEnabled])
  {
    id v4 = [(CNUIDataCollector *)self metricsReporter];
    BOOL v3 = [(CNUIDataCollector *)self appIdentifier];
    [v4 logSearchUsageforApplication:v3];
  }
}

- (void)logPresentation
{
  if (+[CNUIDataCollector isEnabled])
  {
    id v4 = [(CNUIDataCollector *)self metricsReporter];
    BOOL v3 = [(CNUIDataCollector *)self appIdentifier];
    [v4 logContactShownforApplication:v3];
  }
}

- (void)logContactActionType:(id)a3 attributes:(id)a4
{
  id v27 = a3;
  id v6 = a4;
  if (!+[CNUIDataCollector isEnabled]) {
    goto LABEL_23;
  }
  v7 = [(CNUIDataCollector *)self metricsReporter];
  id v8 = [(CNUIDataCollector *)self appIdentifier];
  id v9 = [v7 emptyDictionaryForAction:v27 andApplication:v8];

  uint64_t v10 = *MEMORY[0x1E4F5A298];
  id v11 = [v6 objectForKeyedSubscript:CNUIContactActionDestinationType];
  LOBYTE(v10) = (*(uint64_t (**)(uint64_t, void *))(v10 + 16))(v10, v11);

  if ((v10 & 1) == 0)
  {
    v12 = [v6 objectForKeyedSubscript:CNUIContactActionDestinationType];
    [v9 setValue:v12 forKey:*MEMORY[0x1E4F5A570]];
  }
  if ([v27 isEqualToString:CNUIContactActionTypeShare])
  {
    v13 = [v6 objectForKeyedSubscript:CNUIContactActionShareActivityType];
    if (!v13) {
      goto LABEL_14;
    }
    v14 = v13;
    if ([v13 hasPrefix:@"com.apple.UIKit.activity."])
    {
      uint64_t v15 = [v14 substringFromIndex:objc_msgSend(@"com.apple.UIKit.activity.", "length")];

      v16 = (void *)MEMORY[0x1E4F5A588];
      v14 = (void *)v15;
    }
    else
    {
      v16 = (void *)MEMORY[0x1E4F5A588];
    }
  }
  else if ([v27 isEqualToString:CNUIContactActionTypeTapProperty])
  {
    v14 = [v6 objectForKeyedSubscript:CNUIContactActionTapPropertyIdentifier];
    v16 = (void *)MEMORY[0x1E4F5A580];
  }
  else
  {
    if (![v27 isEqualToString:CNUIContactActionTypeFaceTime]) {
      goto LABEL_14;
    }
    v14 = [v6 objectForKeyedSubscript:CNUIContactActionFaceTimeMediaType];
    v16 = (void *)MEMORY[0x1E4F5A578];
  }
  [v9 setValue:v14 forKey:*v16];

LABEL_14:
  v17 = [(CNUIDataCollector *)self metricsReporter];
  [v17 logActionDictionary:v9];

  v18 = [v6 objectForKeyedSubscript:CNUIDataCollectorActionTypeAttributeLabeledValue];
  v19 = v18;
  if (v18 && [v18 isSuggested])
  {
    v20 = [v6 objectForKeyedSubscript:CNUIDataCollectorActionTypeAttributeContact];
    v21 = v20;
    if (v20)
    {
      v22 = _suggestedContact(v20);
      if (v21 == v22)
      {
        v23 = 0;
      }
      else
      {
        v23 = [v21 identifier];
      }
      v24 = [(CNUIDataCollector *)self sgLogger];
      v25 = [v22 suggestionRecordId];
      v26 = [(CNUIDataCollector *)self appIdentifier];
      [v24 logSuggestedContactDetailUsed:v25 contactIdentifier:v23 bundleID:v26];
    }
  }

LABEL_23:
}

- (CNUIDataCollector)initWithEnvironment:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CNUIDataCollector;
  v5 = [(CNUIDataCollector *)&v16 init];
  if (v5)
  {
    id v6 = (CNMetricsUIReporter *)objc_alloc_init(MEMORY[0x1E4F5A598]);
    metricsReporter = v5->_metricsReporter;
    v5->_metricsReporter = v6;

    id v8 = [v4 defaultSchedulerProvider];
    uint64_t v9 = +[CNUIDataCollectorSGLogger loggerWithSGSuggestionsServiceProvider:&__block_literal_global_62_40106 schedulerProvider:v8];
    sgLogger = v5->_sgLogger;
    v5->_sgLogger = (CNUIDataCollectorSGLogger *)v9;

    id v11 = [MEMORY[0x1E4F28B50] mainBundle];
    v12 = [v11 bundleIdentifier];
    uint64_t v13 = [v12 stringByReplacingOccurrencesOfString:@"." withString:@"-"];
    appIdentifier = v5->_appIdentifier;
    v5->_appIdentifier = (NSString *)v13;
  }
  return v5;
}

id __41__CNUIDataCollector_initWithEnvironment___block_invoke()
{
  return +[CNUIContactsEnvironmentServicesProvider suggestionsService];
}

- (CNUIDataCollector)init
{
  BOOL v3 = +[CNUIContactsEnvironment currentEnvironment];
  id v4 = [(CNUIDataCollector *)self initWithEnvironment:v3];

  return v4;
}

+ (id)sharedCollector
{
  if (sharedCollector_onceToken != -1) {
    dispatch_once(&sharedCollector_onceToken, &__block_literal_global_40121);
  }
  v2 = (void *)sharedCollector_sharedCollector;

  return v2;
}

void __36__CNUIDataCollector_sharedCollector__block_invoke()
{
  v0 = objc_alloc_init(CNUIDataCollector);
  v1 = (void *)sharedCollector_sharedCollector;
  sharedCollector_sharedCollector = (uint64_t)v0;
}

+ (BOOL)isEnabled
{
  return [MEMORY[0x1E4F5A560] isEnabled];
}

@end