@interface CNAutocompleteUsageMonitor
+ (void)userIgnoredResultsForRequest:(id)a3 afterDelay:(double)a4;
+ (void)userSelectedResult:(id)a3 atSortedIndex:(unint64_t)a4 forRequest:(id)a5 gotResultsFromDuet:(BOOL)a6;
- (CNAutocompleteProbeProvider)probeProvider;
- (CNAutocompleteUsageMonitor)init;
- (CNAutocompleteUsageMonitor)initWithProbeProvider:(id)a3;
- (void)userIgnoredResultsOfBatch:(unint64_t)a3 forRequest:(id)a4 afterDelay:(double)a5;
- (void)userSawNumberOfResults:(unint64_t)a3 forBatch:(unint64_t)a4 includingNumberOfSuggestions:(unint64_t)a5 forRequest:(id)a6;
- (void)userSelectedResult:(id)a3 atSortedIndex:(unint64_t)a4 forRequest:(id)a5 gotResultsFromDuet:(BOOL)a6;
@end

@implementation CNAutocompleteUsageMonitor

+ (void)userSelectedResult:(id)a3 atSortedIndex:(unint64_t)a4 forRequest:(id)a5 gotResultsFromDuet:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  id v11 = a3;
  id v12 = objc_alloc_init((Class)a1);
  [v12 userSelectedResult:v11 atSortedIndex:a4 forRequest:v10 gotResultsFromDuet:v6];
}

+ (void)userIgnoredResultsForRequest:(id)a3 afterDelay:(double)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init((Class)a1);
  [v7 userIgnoredResultsOfBatch:0 forRequest:v6 afterDelay:a4];
}

- (CNAutocompleteUsageMonitor)init
{
  v3 = +[CNAutocompleteProbeProviderFactory defaultProbeProvider];
  v4 = [(CNAutocompleteUsageMonitor *)self initWithProbeProvider:v3];

  return v4;
}

- (CNAutocompleteUsageMonitor)initWithProbeProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNAutocompleteUsageMonitor;
  id v6 = [(CNAutocompleteUsageMonitor *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_probeProvider, a3);
  }

  return v7;
}

- (void)userSelectedResult:(id)a3 atSortedIndex:(unint64_t)a4 forRequest:(id)a5 gotResultsFromDuet:(BOOL)a6
{
  BOOL v6 = a6;
  id v18 = a3;
  id v10 = a5;
  if (v10)
  {
    id v11 = [(CNAutocompleteUsageMonitor *)self probeProvider];
    id v12 = [v11 usageMonitorProbe];

    [v12 recordDuetReturnedResults:v6];
    uint64_t v13 = *MEMORY[0x1E4F5A298];
    v14 = [v10 searchString];
    LODWORD(v13) = (*(uint64_t (**)(uint64_t, void *))(v13 + 16))(v13, v14);

    if (v13)
    {
      [v12 recordUserSelectedPredictionAtIndex:a4];
    }
    else
    {
      [v12 recordUserSelectedIndex:a4];
      v15 = [v10 searchString];
      objc_msgSend(v12, "recordUserTypedInNumberOfCharacters:", objc_msgSend(v15, "length"));

      objc_msgSend(v12, "recordUserSelectedResultWithSourceType:", objc_msgSend(v18, "sourceType"));
      if (v18)
      {
        v16 = [(CNAutocompleteUsageMonitor *)self probeProvider];
        v17 = [v16 suggestionsProbe];

        [v17 recordUserSelectedAutocompleteResult:v18];
        [v17 sendData];
      }
    }
    [v12 sendData];
  }
}

- (void)userIgnoredResultsOfBatch:(unint64_t)a3 forRequest:(id)a4 afterDelay:(double)a5
{
  id v8 = a4;
  objc_super v9 = [(CNAutocompleteUsageMonitor *)self probeProvider];
  id v12 = [v9 usageMonitorProbe];

  uint64_t v10 = *MEMORY[0x1E4F5A298];
  id v11 = [v8 searchString];

  LODWORD(v10) = (*(uint64_t (**)(uint64_t, void *))(v10 + 16))(v10, v11);
  if (v10) {
    [v12 recordUserIgnoredPredictionAfterDelay:a5];
  }
  else {
    [v12 recordUserIgnoredPrefixedResultAfterDelay:a3 batch:a5];
  }
  [v12 sendData];
}

- (void)userSawNumberOfResults:(unint64_t)a3 forBatch:(unint64_t)a4 includingNumberOfSuggestions:(unint64_t)a5 forRequest:(id)a6
{
  id v9 = a6;
  uint64_t v10 = [(CNAutocompleteUsageMonitor *)self probeProvider];
  id v14 = [v10 usageMonitorProbe];

  uint64_t v11 = *MEMORY[0x1E4F5A298];
  id v12 = [v9 searchString];

  LODWORD(v11) = (*(uint64_t (**)(uint64_t, void *))(v11 + 16))(v11, v12);
  if (v11) {
    [v14 recordUserSawPredictions];
  }
  if (a5) {
    [v14 recordUserSawResultsConsideredSuggestion:a5];
  }
  unint64_t v13 = a3 - a5;
  if (a3 != a5) {
    [v14 recordUserSawCuratedResults:v13];
  }
  objc_msgSend(v14, "sendData", v13);
}

- (CNAutocompleteProbeProvider)probeProvider
{
  return self->_probeProvider;
}

- (void).cxx_destruct
{
}

@end