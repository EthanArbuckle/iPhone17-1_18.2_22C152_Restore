@interface CNAutocompleteCoreAnalyticsUsageMonitorProbe
- (CNAutocompleteCoreAnalyticsUsageMonitorProbe)init;
- (NSMutableDictionary)coreAnalyticsDictionary;
- (NSNumber)lengthOfSearchString;
- (NSNumber)selectedIndex;
- (NSNumber)selectedPredictionIndex;
- (NSNumber)sourceType;
- (id)bundleIdentifierOfCurrentProcess;
- (id)makeBundleIdentifierOfCurrentProcess;
- (id)sourceKeysForSourceType:(unint64_t)a3;
- (void)recordDuetReturnedResults:(BOOL)a3;
- (void)recordUserIgnoredPredictionAfterDelay:(double)a3;
- (void)recordUserIgnoredPrefixedResultAfterDelay:(double)a3 batch:(unint64_t)a4;
- (void)recordUserSawResultsConsideredSuggestion:(unint64_t)a3;
- (void)recordUserSelectedIndex:(unint64_t)a3;
- (void)recordUserSelectedPredictionAtIndex:(unint64_t)a3;
- (void)recordUserSelectedResultWithSourceType:(unint64_t)a3;
- (void)recordUserTypedInNumberOfCharacters:(unint64_t)a3;
- (void)sendData;
- (void)setCoreAnalyticsDictionary:(id)a3;
- (void)setLengthOfSearchString:(id)a3;
- (void)setSelectedIndex:(id)a3;
- (void)setSelectedPredictionIndex:(id)a3;
- (void)setSourceType:(id)a3;
@end

@implementation CNAutocompleteCoreAnalyticsUsageMonitorProbe

- (CNAutocompleteCoreAnalyticsUsageMonitorProbe)init
{
  v6.receiver = self;
  v6.super_class = (Class)CNAutocompleteCoreAnalyticsUsageMonitorProbe;
  v2 = [(CNAutocompleteCoreAnalyticsUsageMonitorProbe *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    coreAnalyticsDictionary = v2->_coreAnalyticsDictionary;
    v2->_coreAnalyticsDictionary = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (id)sourceKeysForSourceType:(unint64_t)a3
{
  v4 = [MEMORY[0x1E4F1CA80] set];
  v5 = v4;
  if ((a3 & 0x40) != 0)
  {
    [v4 addObject:@"calendarServer"];
    if ((a3 & 2) == 0)
    {
LABEL_3:
      if ((a3 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((a3 & 2) == 0)
  {
    goto LABEL_3;
  }
  [v5 addObject:@"contacts"];
  if ((a3 & 8) == 0)
  {
LABEL_4:
    if ((a3 & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_10:
  [v5 addObject:@"directoryServer"];
  if (a3) {
LABEL_5:
  }
    [v5 addObject:@"recents"];
LABEL_6:
  if (+[CNAutocompleteResult isSourceTypeConsideredSuggestion:a3])
  {
    objc_super v6 = CNAutocompleteProbeSourceTypeKeyPureSuggestion;
  }
  else
  {
    if ((a3 & 4) == 0)
    {
      if ((a3 & 0x20) != 0) {
        goto LABEL_22;
      }
LABEL_14:
      if ((a3 & 0x10) != 0) {
        goto LABEL_23;
      }
LABEL_15:
      if ((a3 & 0x200) == 0) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
    objc_super v6 = CNAutocompleteProbeSourceTypeKeySuggestion;
  }
  [v5 addObject:*v6];
  if ((a3 & 0x20) == 0) {
    goto LABEL_14;
  }
LABEL_22:
  [v5 addObject:@"supplemental"];
  if ((a3 & 0x10) == 0) {
    goto LABEL_15;
  }
LABEL_23:
  [v5 addObject:@"duetPromoted"];
  if ((a3 & 0x200) != 0) {
LABEL_16:
  }
    [v5 addObject:@"stewie"];
LABEL_17:
  v7 = (void *)[v5 copy];

  return v7;
}

- (void)recordUserSawResultsConsideredSuggestion:(unint64_t)a3
{
  id v5 = [MEMORY[0x1E4F28ED0] numberWithDouble:(double)a3];
  v4 = [(CNAutocompleteCoreAnalyticsUsageMonitorProbe *)self coreAnalyticsDictionary];
  [v4 setObject:v5 forKeyedSubscript:@"prefixedPureSuggestionResultCount"];
}

- (void)recordUserSelectedIndex:(unint64_t)a3
{
  if (a3 > 0x7FFFFFFFFFFFFFFELL) {
    int64_t v4 = -1;
  }
  else {
    int64_t v4 = a3;
  }
  id v5 = [MEMORY[0x1E4F28ED0] numberWithDouble:(double)v4];
  [(CNAutocompleteCoreAnalyticsUsageMonitorProbe *)self setSelectedIndex:v5];
}

- (void)recordDuetReturnedResults:(BOOL)a3
{
  id v5 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  int64_t v4 = [(CNAutocompleteCoreAnalyticsUsageMonitorProbe *)self coreAnalyticsDictionary];
  [v4 setObject:v5 forKeyedSubscript:@"duetReturnedResults"];
}

- (void)recordUserTypedInNumberOfCharacters:(unint64_t)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithDouble:(double)a3];
  [(CNAutocompleteCoreAnalyticsUsageMonitorProbe *)self setLengthOfSearchString:v4];
}

- (void)recordUserSelectedPredictionAtIndex:(unint64_t)a3
{
  if (a3 > 0x7FFFFFFFFFFFFFFELL) {
    int64_t v4 = -1;
  }
  else {
    int64_t v4 = a3;
  }
  id v5 = [MEMORY[0x1E4F28ED0] numberWithDouble:(double)v4];
  [(CNAutocompleteCoreAnalyticsUsageMonitorProbe *)self setSelectedPredictionIndex:v5];
}

- (void)recordUserSelectedResultWithSourceType:(unint64_t)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
  [(CNAutocompleteCoreAnalyticsUsageMonitorProbe *)self setSourceType:v4];
}

- (void)recordUserIgnoredPredictionAfterDelay:(double)a3
{
  id v5 = [MEMORY[0x1E4F28ED0] numberWithDouble:a3];
  id v4 = [(CNAutocompleteCoreAnalyticsUsageMonitorProbe *)self coreAnalyticsDictionary];
  [v4 setObject:v5 forKeyedSubscript:@"predictionUserIgnoreDelay"];
}

- (void)recordUserIgnoredPrefixedResultAfterDelay:(double)a3 batch:(unint64_t)a4
{
  objc_super v6 = [MEMORY[0x1E4F28ED0] numberWithDouble:a3];
  v7 = [(CNAutocompleteCoreAnalyticsUsageMonitorProbe *)self coreAnalyticsDictionary];
  [v7 setObject:v6 forKeyedSubscript:@"prefixedUserIgnoreDelay"];

  id v9 = [MEMORY[0x1E4F28ED0] numberWithDouble:(double)a4];
  v8 = [(CNAutocompleteCoreAnalyticsUsageMonitorProbe *)self coreAnalyticsDictionary];
  [v8 setObject:v9 forKeyedSubscript:@"prefixedUserIgnoreDelayBatch"];
}

- (void)sendData
{
  v2 = self;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(CNAutocompleteCoreAnalyticsUsageMonitorProbe *)self selectedIndex];
  if (v3)
  {
    id v4 = (void *)v3;
    uint64_t v5 = [(CNAutocompleteCoreAnalyticsUsageMonitorProbe *)v2 sourceType];
    if (v5)
    {
      objc_super v6 = (void *)v5;
      v7 = [(CNAutocompleteCoreAnalyticsUsageMonitorProbe *)v2 lengthOfSearchString];

      if (v7)
      {
        v8 = [(CNAutocompleteCoreAnalyticsUsageMonitorProbe *)v2 sourceType];
        uint64_t v9 = [v8 unsignedIntegerValue];

        if (v9)
        {
          v10 = [(CNAutocompleteCoreAnalyticsUsageMonitorProbe *)v2 selectedIndex];
          v11 = [(CNAutocompleteCoreAnalyticsUsageMonitorProbe *)v2 coreAnalyticsDictionary];
          [v11 setObject:v10 forKeyedSubscript:@"selectedIndex"];
        }
        else
        {
          v10 = [(CNAutocompleteCoreAnalyticsUsageMonitorProbe *)v2 coreAnalyticsDictionary];
          [v10 setObject:&unk_1F1A3BF08 forKeyedSubscript:@"selectedIndex"];
        }

        v18 = [(CNAutocompleteCoreAnalyticsUsageMonitorProbe *)v2 lengthOfSearchString];
        v19 = [(CNAutocompleteCoreAnalyticsUsageMonitorProbe *)v2 coreAnalyticsDictionary];
        [v19 setObject:v18 forKeyedSubscript:@"stringLength"];

        v20 = [(CNAutocompleteCoreAnalyticsUsageMonitorProbe *)v2 sourceType];
        v21 = -[CNAutocompleteCoreAnalyticsUsageMonitorProbe sourceKeysForSourceType:](v2, "sourceKeysForSourceType:", [v20 unsignedIntegerValue]);

        v22 = v2;
        if (![v21 count])
        {
          uint64_t v23 = [MEMORY[0x1E4F1CAD0] setWithObject:@"unknown"];

          v21 = (void *)v23;
        }
        long long v39 = 0u;
        long long v40 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        id obj = v21;
        uint64_t v24 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = *(void *)v38;
          do
          {
            for (uint64_t i = 0; i != v25; ++i)
            {
              if (*(void *)v38 != v26) {
                objc_enumerationMutation(obj);
              }
              int v28 = [*(id *)(*((void *)&v37 + 1) + 8 * i) isEqual:@"duetPromoted"];
              v29 = [(CNAutocompleteCoreAnalyticsUsageMonitorProbe *)v22 coreAnalyticsDictionary];
              v30 = v29;
              if (v28) {
                v31 = &unk_1F1A3BF20;
              }
              else {
                v31 = &unk_1F1A3BF38;
              }
              [v29 setObject:v31 forKeyedSubscript:@"promotedByDuet"];
            }
            uint64_t v25 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
          }
          while (v25);
        }

        v2 = v22;
        v32 = [(CNAutocompleteCoreAnalyticsUsageMonitorProbe *)v22 bundleIdentifierOfCurrentProcess];
        v33 = [(CNAutocompleteCoreAnalyticsUsageMonitorProbe *)v22 coreAnalyticsDictionary];
        [v33 setObject:v32 forKeyedSubscript:@"bundleId"];

        goto LABEL_23;
      }
    }
    else
    {
    }
  }
  v12 = [(CNAutocompleteCoreAnalyticsUsageMonitorProbe *)v2 selectedPredictionIndex];

  if (v12)
  {
    v13 = [(CNAutocompleteCoreAnalyticsUsageMonitorProbe *)v2 selectedPredictionIndex];
    v14 = [(CNAutocompleteCoreAnalyticsUsageMonitorProbe *)v2 coreAnalyticsDictionary];
    [v14 setObject:v13 forKeyedSubscript:@"selectedPredictionIndex"];

    v15 = [(CNAutocompleteCoreAnalyticsUsageMonitorProbe *)v2 coreAnalyticsDictionary];
    [v15 setObject:&unk_1F1A3BF20 forKeyedSubscript:@"promotedByDuet"];

    v16 = [(CNAutocompleteCoreAnalyticsUsageMonitorProbe *)v2 bundleIdentifierOfCurrentProcess];
    v17 = [(CNAutocompleteCoreAnalyticsUsageMonitorProbe *)v2 coreAnalyticsDictionary];
    [v17 setObject:v16 forKeyedSubscript:@"bundleId"];
  }
LABEL_23:
  v34 = [(CNAutocompleteCoreAnalyticsUsageMonitorProbe *)v2 coreAnalyticsDictionary];
  uint64_t v35 = [v34 count];

  if (v35) {
    AnalyticsSendEventLazy();
  }
}

uint64_t __56__CNAutocompleteCoreAnalyticsUsageMonitorProbe_sendData__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) coreAnalyticsDictionary];
}

- (id)bundleIdentifierOfCurrentProcess
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__CNAutocompleteCoreAnalyticsUsageMonitorProbe_bundleIdentifierOfCurrentProcess__block_invoke;
  block[3] = &unk_1E63DD9C0;
  block[4] = self;
  if (bundleIdentifierOfCurrentProcess_cn_once_token_0 != -1) {
    dispatch_once(&bundleIdentifierOfCurrentProcess_cn_once_token_0, block);
  }
  return (id)bundleIdentifierOfCurrentProcess_cn_once_object_0;
}

void __80__CNAutocompleteCoreAnalyticsUsageMonitorProbe_bundleIdentifierOfCurrentProcess__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) makeBundleIdentifierOfCurrentProcess];
  uint64_t v1 = [v3 copy];
  v2 = (void *)bundleIdentifierOfCurrentProcess_cn_once_object_0;
  bundleIdentifierOfCurrentProcess_cn_once_object_0 = v1;
}

- (id)makeBundleIdentifierOfCurrentProcess
{
  v2 = [MEMORY[0x1E4F223F0] bundleProxyForCurrentProcess];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v2 bundleIdentifier];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (NSMutableDictionary)coreAnalyticsDictionary
{
  return self->_coreAnalyticsDictionary;
}

- (void)setCoreAnalyticsDictionary:(id)a3
{
}

- (NSNumber)selectedIndex
{
  return self->_selectedIndex;
}

- (void)setSelectedIndex:(id)a3
{
}

- (NSNumber)selectedPredictionIndex
{
  return self->_selectedPredictionIndex;
}

- (void)setSelectedPredictionIndex:(id)a3
{
}

- (NSNumber)lengthOfSearchString
{
  return self->_lengthOfSearchString;
}

- (void)setLengthOfSearchString:(id)a3
{
}

- (NSNumber)sourceType
{
  return self->_sourceType;
}

- (void)setSourceType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceType, 0);
  objc_storeStrong((id *)&self->_lengthOfSearchString, 0);
  objc_storeStrong((id *)&self->_selectedPredictionIndex, 0);
  objc_storeStrong((id *)&self->_selectedIndex, 0);
  objc_storeStrong((id *)&self->_coreAnalyticsDictionary, 0);
}

@end