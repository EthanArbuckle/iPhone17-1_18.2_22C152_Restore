@interface CNUIDataCollectorSGLogger
+ (id)loggerWithSGSuggestionsServiceProvider:(id)a3 schedulerProvider:(id)a4;
@end

@implementation CNUIDataCollectorSGLogger

uint64_t __82___CNUIDataCollectorSGLogger_logSearchResultsIncludedPureSuggestionsWithBundleID___block_invoke(uint64_t a1, void *a2)
{
  return [a2 logMetricSearchResultsIncludedPureSuggestionWithBundleId:*(void *)(a1 + 32)];
}

uint64_t __75___CNUIDataCollectorSGLogger_logContactCreated_contactIdentifier_bundleID___block_invoke(void *a1, void *a2)
{
  return [a2 logMetricContactCreated:a1[4] contactIdentifier:a1[5] bundleId:a1[6]];
}

uint64_t __87___CNUIDataCollectorSGLogger_logSuggestedContactDetailUsed_contactIdentifier_bundleID___block_invoke(void *a1, void *a2)
{
  return [a2 logMetricSuggestedContactDetailUsed:a1[4] contactIdentifier:a1[5] bundleId:a1[6]];
}

uint64_t __88___CNUIDataCollectorSGLogger_logSuggestedContactDetailShown_contactIdentifier_bundleID___block_invoke(void *a1, void *a2)
{
  return [a2 logMetricSuggestedContactDetailShown:a1[4] contactIdentifier:a1[5] bundleId:a1[6]];
}

uint64_t __88___CNUIDataCollectorSGLogger_logContactSearchResultSelected_contactIdentifier_bundleID___block_invoke(uint64_t a1, void *a2)
{
  if (*(void *)(a1 + 40)) {
    uint64_t v2 = (8 * (*(void *)(a1 + 32) != 0)) | 4u;
  }
  else {
    uint64_t v2 = 8 * (*(void *)(a1 + 32) != 0);
  }
  return objc_msgSend(a2, "logMetricContactSearchResult:recordId:contactIdentifier:bundleId:", v2);
}

void __54___CNUIDataCollectorSGLogger_performBlockWithService___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (id)loggerWithSGSuggestionsServiceProvider:(id)a3 schedulerProvider:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[_CNUIDataCollectorSGLogger alloc] initWithSuggestionsServiceProvider:v6 schedulerProvider:v5];

  return v7;
}

@end