@interface ContextConfiguration
+ (id)desiredLanguageTags;
+ (id)sharedInstance;
+ (void)_triggerConfigurationUpdate;
+ (void)_updateConfiguration:(id)a3;
+ (void)initialize;
+ (void)registerUpdateHandler:(id)a3;
+ (void)reloadFromGlobalPlist:(id)a3 indexSpecificPlist:(id)a4 developerPlist:(id)a5 indexVersionId:(id)a6;
- (BOOL)coreNLPTaggingEnabled;
- (BOOL)debugDisableMetricsLogging;
- (BOOL)debugUIFeedback;
- (BOOL)debugUseMadvise;
- (BOOL)debugUseOldIndexInput;
- (BOOL)digitalHealthEnabled;
- (BOOL)extraQueryCompletionsEnabled;
- (BOOL)fallbackModeQuerySuggestionsEnabled;
- (BOOL)highLevelTopicsEnabled;
- (BOOL)internalGradingEnabled;
- (BOOL)luceneEnabled;
- (BOOL)luceneTermResultGivenSurnameEnabled;
- (BOOL)luceneUsePhraseQuery;
- (BOOL)portraitEnabled;
- (BOOL)rawTextEnabled;
- (BOOL)tagsEnabled;
- (ContextConfiguration)init;
- (NSArray)debugFakeResults;
- (NSArray)matchedABGroups;
- (NSOrderedSet)desiredLanguageTags;
- (NSSet)blacklistPortrait;
- (NSSet)blacklistTitles;
- (NSSet)luceneSupportedLanguages;
- (NSSet)structuredExtractionUIBlockList;
- (NSSet)structuredExtractionUIOffScreenIgnoreList;
- (NSString)allowedNGramSeparators;
- (NSString)debugForceLanguageTag;
- (NSString)indexVersionId;
- (NSString)luceneIndexPath;
- (NSString)nGramBreakingSeparators;
- (NSString)partialNGramCharacterSet;
- (NSString)quotedTokenCharacterSet;
- (OS_dispatch_semaphore)maxConcurrencySemaphore;
- (double)hideCompletionsTimeLimit;
- (double)minTitleUIFontSize;
- (float)coreNLPMinScore;
- (float)coreNLPRelevantScore;
- (float)debugDelaySecs;
- (float)findResultsSlowSecs;
- (float)findResultsTimeoutSecs;
- (float)luceneBlendAlpha;
- (float)luceneBlendBeta;
- (float)luceneBlendGamma;
- (float)luceneMinAbsoluteScore;
- (float)luceneMinRelativeScore;
- (float)luceneMinScoreTitleMatch;
- (float)luceneMinScoreTitlePrimary;
- (float)maxConcurrencySemaphoreTimeoutSecs;
- (float)minFontDeltaForTitle;
- (float)surroundingEntitiesDistanceScoreHorizontalSkew;
- (id)abGroupOfDictionary:(id)a3;
- (id)debugStatus;
- (int64_t)luceneTermResultFirstOccurrencePowerLawDecay;
- (int64_t)minPrefixAdditionalResults;
- (int64_t)minTokenCountToAugment;
- (int64_t)structuredExtractionDemotedResultMinPrefix;
- (int64_t)structuredExtractionMinPrefix;
- (int64_t)titleMinPrefix;
- (unint64_t)bigramMaxEnclosedStopwords;
- (unint64_t)bigramMaxOffsetDelta;
- (unint64_t)constellationMaxOverallTopics;
- (unint64_t)constellationMaxTopicDistance;
- (unint64_t)debugNSDataBufferSize;
- (unint64_t)extraQueryCompletionsTopKLanguages;
- (unint64_t)findResultsTimeoutWithNanosAlreadySpent:(float)a3;
- (unint64_t)horizontalGroupBuffer;
- (unint64_t)luceneForceSecondaryAfterPosition;
- (unint64_t)luceneGivenSurnameEarlyMentionLimit;
- (unint64_t)luceneGivenSurnameMinGivenCount;
- (unint64_t)luceneIgnoreAfterPosition;
- (unint64_t)luceneMaxTermAndBigramResults;
- (unint64_t)luceneMaxTermAndBigramResultsWithDocument;
- (unint64_t)luceneMaxTermResults;
- (unint64_t)luceneMaxTermResultsWithDocument;
- (unint64_t)luceneMaxUniqueNotSkippedTokens;
- (unint64_t)luceneMaxUniquePrimaryTokens;
- (unint64_t)luceneMaxUniqueTotalTokens;
- (unint64_t)luceneMinFileSizeForNSDataMMap;
- (unint64_t)luceneMinTitleMatchAllNamesOK;
- (unint64_t)luceneMinTitleMatchForScoreBoost;
- (unint64_t)luceneMinTitleMatchPrimaryAllNamesOK;
- (unint64_t)luceneQueryDefaultNumResults;
- (unint64_t)luceneQueryMaxNumResults;
- (unint64_t)luceneTermResultBigramScoreMultiplier;
- (unint64_t)luceneTermResultUnigramScoreMultiplier;
- (unint64_t)maxConcurrency;
- (unint64_t)maxConcurrencySemaphoreTimeout;
- (unint64_t)maxFingerprints;
- (unint64_t)maxUIContentCount;
- (unint64_t)maxUIContextLength;
- (unint64_t)minUIContextLength;
- (unint64_t)minUIPositionY;
- (unint64_t)mustPrefixMatchLength;
- (unint64_t)smallUIHeight;
- (unint64_t)surroundingEntitiesMaxDistanceScore;
- (unint64_t)surroundingEntitiesMaxLabelLength;
- (unint64_t)surroundingEntitiesSearchRange;
- (unint64_t)verticalGroupBuffer;
- (void)_performReinitWithIndexVersion:(id)a3;
- (void)_updateFromPlist:(id)a3;
- (void)setMaxConcurrencySemaphore:(id)a3;
@end

@implementation ContextConfiguration

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v3 = objc_alloc_init(ContextConfiguration);
    v4 = (void *)qword_100562FB8;
    qword_100562FB8 = (uint64_t)v3;

    os_log_t v5 = os_log_create("com.apple.siri.context.service", "configuration");
    v6 = (void *)qword_100562FC0;
    qword_100562FC0 = (uint64_t)v5;

    objc_opt_class();
    objc_opt_class();
    size_t v13 = 8;
    *(void *)out_token = 0;
    if (sysctlbyname("hw.memsize", out_token, &v13, 0, 0) == -1)
    {
      BOOL v8 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
      BOOL v7 = 0;
      if (v8)
      {
        *(_WORD *)v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Could not read system memsize, assuming it's enough", v12, 2u);
        BOOL v7 = 0;
      }
    }
    else
    {
      BOOL v7 = *(void *)out_token >> 23 < 0xE1uLL;
    }
    byte_100562FC8 = v7;
    [a1 registerUpdateHandler:&stru_10048B848];
    if (+[_PASDeviceInfo isInternalBuild])
    {
      v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v10 = dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_UTILITY, 0);
      v11 = dispatch_queue_create("ContextConfiguration-force-update", v10);

      out_token[0] = 0;
      notify_register_dispatch((const char *)[@"com.apple.contextkit.configurationChanged.force" UTF8String], out_token, v11, &stru_10048B888);
    }
  }
}

+ (id)sharedInstance
{
  v2 = objc_opt_class();
  objc_sync_enter(v2);
  id v3 = (id)qword_100562FB8;
  objc_sync_exit(v2);

  return v3;
}

- (ContextConfiguration)init
{
  v24.receiver = self;
  v24.super_class = (Class)ContextConfiguration;
  v2 = [(ContextConfiguration *)&v24 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    v4 = (void *)*((void *)v2 + 29);
    *((void *)v2 + 29) = v3;

    v2[144] = 1;
    uint64_t v5 = +[NSSet setWithArray:&off_1004B1C90];
    v6 = (void *)*((void *)v2 + 40);
    *((void *)v2 + 40) = v5;

    *((_OWORD *)v2 + 10) = xmmword_100320D50;
    *((_OWORD *)v2 + 17) = xmmword_100320D60;
    *((_OWORD *)v2 + 18) = xmmword_100320D70;
    *((_OWORD *)v2 + 15) = xmmword_100320D80;
    *((_OWORD *)v2 + 16) = xmmword_100320D90;
    *((void *)v2 + 22) = 0x3F8000003F333333;
    *((_DWORD *)v2 + 46) = 1065353216;
    *((void *)v2 + 38) = 0x4000;
    *(_OWORD *)(v2 + 8) = xmmword_100320DA0;
    *(_OWORD *)(v2 + 24) = xmmword_100320DB0;
    *(_OWORD *)(v2 + 40) = xmmword_100320DC0;
    *(_OWORD *)(v2 + 56) = xmmword_100320DD0;
    *(_OWORD *)(v2 + 72) = xmmword_100320DE0;
    *(int64x2_t *)(v2 + 88) = vdupq_n_s64(2uLL);
    *((void *)v2 + 41) = 0;
    *((_OWORD *)v2 + 21) = xmmword_100320DF0;
    *((int64x2_t *)v2 + 22) = vdupq_n_s64(0x32uLL);
    *((int64x2_t *)v2 + 23) = vdupq_n_s64(0x64uLL);
    *((_OWORD *)v2 + 24) = xmmword_100320E00;
    *(_OWORD *)(v2 + 104) = xmmword_100320E10;
    *((void *)v2 + 15) = 250;
    v2[128] = 1;
    BOOL v7 = (void *)*((void *)v2 + 50);
    *((void *)v2 + 50) = 0;

    BOOL v8 = (void *)*((void *)v2 + 51);
    *((void *)v2 + 51) = 0;

    v2[129] = 0;
    *(_OWORD *)(v2 + 188) = xmmword_100320E20;
    v9 = (void *)*((void *)v2 + 53);
    *((void *)v2 + 52) = 2;
    *((void *)v2 + 53) = 0;

    v10 = (void *)*((void *)v2 + 54);
    *((void *)v2 + 54) = 0;

    *((void *)v2 + 55) = 0;
    *(_DWORD *)(v2 + 146) = 0;
    v2[150] = byte_100562FC8 ^ 1;
    *((int64x2_t *)v2 + 28) = vdupq_n_s64(3uLL);
    v2[151] = 1;
    *((void *)v2 + 58) = 2;
    *(_DWORD *)(v2 + 153) = 16842753;
    *(_WORD *)(v2 + 157) = 0;
    *(void *)(v2 + 204) = 0x3F3333333F000000;
    v11 = (void *)*((void *)v2 + 17);
    *((void *)v2 + 17) = 0;

    *((void *)v2 + 59) = 0x408C200000000000;
    *((void *)v2 + 60) = 3;
    uint64_t v12 = +[ContextConfiguration desiredLanguageTags];
    size_t v13 = (void *)*((void *)v2 + 61);
    *((void *)v2 + 61) = v12;

    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"./,\n\t\u2028\u2029\n\v\f\r%C;",
    uint64_t v14 = 133);
    v15 = (void *)*((void *)v2 + 62);
    *((void *)v2 + 62) = v14;

    v16 = (void *)*((void *)v2 + 63);
    *((void *)v2 + 63) = @"- 's:/—";

    v17 = (void *)*((void *)v2 + 64);
    *((void *)v2 + 64) = @"\"‘’“”„“«»‹›";

    v18 = (void *)*((void *)v2 + 65);
    *((void *)v2 + 65) = @"-—";

    *((_OWORD *)v2 + 33) = xmmword_100320E30;
    *((_OWORD *)v2 + 34) = xmmword_100320E40;
    *((_OWORD *)v2 + 35) = xmmword_100320E50;
    *((_OWORD *)v2 + 36) = xmmword_100320E60;
    *((void *)v2 + 74) = 50;
    *((void *)v2 + 75) = 0x4031000000000000;
    *((_DWORD *)v2 + 53) = 1069547520;
    *((_OWORD *)v2 + 38) = xmmword_100320DF0;
    *((void *)v2 + 78) = 6;
    id v19 = [objc_alloc((Class)NSSet) initWithArray:&off_1004B1CA8];
    v20 = (void *)*((void *)v2 + 79);
    *((void *)v2 + 79) = v19;

    id v21 = [objc_alloc((Class)NSSet) initWithArray:&off_1004B1CC0];
    v22 = (void *)*((void *)v2 + 80);
    *((void *)v2 + 80) = v21;

    *((void *)v2 + 81) = 5;
    *((_DWORD *)v2 + 54) = 1045220557;
    *((_OWORD *)v2 + 41) = xmmword_100320E70;
    *((_OWORD *)v2 + 42) = xmmword_100320E80;
    *((void *)v2 + 86) = 15;
    [v2 _performReinitWithIndexVersion:@"not-initialized"];
  }
  return (ContextConfiguration *)v2;
}

+ (id)desiredLanguageTags
{
  id v2 = objc_alloc_init((Class)NSMutableOrderedSet);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v3 = +[NSLocale preferredLanguages];
  id v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [objc_alloc((Class)NSLocale) initWithLocaleIdentifier:*(void *)(*((void *)&v17 + 1) + 8 * i)];
        v9 = [v8 languageCode];
        v10 = [v8 scriptCode];
        id v11 = [v10 length];

        if (v11)
        {
          uint64_t v12 = [v8 languageCode];
          size_t v13 = [v8 scriptCode];
          uint64_t v14 = +[NSString stringWithFormat:@"%@-%@", v12, v13];

          v9 = (void *)v14;
        }
        [v2 addObject:v9];
      }
      id v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v5);
  }

  id v15 = [v2 copy];
  return v15;
}

- (void)_performReinitWithIndexVersion:(id)a3
{
  id v9 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  dispatch_semaphore_t v5 = dispatch_semaphore_create(v4->_maxConcurrency);
  [(ContextConfiguration *)v4 setMaxConcurrencySemaphore:v5];

  indexVersionIdSuffix = v4->_indexVersionIdSuffix;
  if (indexVersionIdSuffix)
  {
    BOOL v7 = +[NSString stringWithFormat:@"%@%@", v9, indexVersionIdSuffix];
  }
  else
  {
    BOOL v7 = (NSString *)v9;
  }
  indexVersionId = v4->_indexVersionId;
  v4->_indexVersionId = v7;

  objc_sync_exit(v4);
}

- (unint64_t)maxConcurrencySemaphoreTimeout
{
  return dispatch_time(0, (uint64_t)(float)(self->_maxConcurrencySemaphoreTimeoutSecs * 1000000000.0));
}

- (unint64_t)findResultsTimeoutWithNanosAlreadySpent:(float)a3
{
  return dispatch_time(0, (uint64_t)(float)-(float)(a3 - (float)(self->_findResultsTimeoutSecs * 1000000000.0)));
}

+ (void)reloadFromGlobalPlist:(id)a3 indexSpecificPlist:(id)a4 developerPlist:(id)a5 indexVersionId:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = qword_100562FC0;
  if (os_log_type_enabled((os_log_t)qword_100562FC0, OS_LOG_TYPE_DEBUG))
  {
    int v20 = 138412802;
    id v21 = v10;
    __int16 v22 = 2112;
    id v23 = v11;
    __int16 v24 = 2112;
    id v25 = v12;
    _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "reloadFromPlist, global plist:%@, index-specific plist:%@, developer:%@", (uint8_t *)&v20, 0x20u);
  }
  id v15 = objc_alloc_init(ContextConfiguration);
  v16 = v15;
  if (v10)
  {
    [(ContextConfiguration *)v15 _updateFromPlist:v10];
  }
  else
  {
    long long v17 = qword_100562FC0;
    if (os_log_type_enabled((os_log_t)qword_100562FC0, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[Warning] No global configuration found", (uint8_t *)&v20, 2u);
    }
  }
  if (!v11 || v11 == v10)
  {
    long long v18 = qword_100562FC0;
    if (os_log_type_enabled((os_log_t)qword_100562FC0, OS_LOG_TYPE_DEBUG)) {
      sub_1002A5F08(v18);
    }
  }
  else
  {
    [(ContextConfiguration *)v16 _updateFromPlist:v11];
  }
  if (v12 == v10 || !v12 || v12 == v11)
  {
    long long v19 = qword_100562FC0;
    if (os_log_type_enabled((os_log_t)qword_100562FC0, OS_LOG_TYPE_DEBUG)) {
      sub_1002A5EC4(v19);
    }
  }
  else
  {
    [(ContextConfiguration *)v16 _updateFromPlist:v12];
  }
  [(ContextConfiguration *)v16 _performReinitWithIndexVersion:v13];
  [a1 _updateConfiguration:v16];
}

+ (void)_updateConfiguration:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = objc_opt_class();
  objc_sync_enter(v5);
  uint64_t v6 = (void *)qword_100562FB8;
  qword_100562FB8 = (uint64_t)v4;

  objc_sync_exit(v5);
  [a1 _triggerConfigurationUpdate];
}

+ (void)_triggerConfigurationUpdate
{
  id v2 = +[NSNotificationCenter defaultCenter];
  [v2 postNotificationName:@"contextConfigurationDidChange" object:0];
}

- (id)abGroupOfDictionary:(id)a3
{
  v29 = self;
  id v3 = a3;
  if ([v3 count])
  {
    id v30 = (id)objc_opt_new();
    id v4 = [v3 objectForKeyedSubscript:@"Salt"];
    dispatch_semaphore_t v5 = sub_1002A3D00(v4);
    uint64_t v6 = (char *)[v5 unsignedIntegerValue];

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    BOOL v7 = [v3 allKeys];
    id v8 = [v7 sortedArrayUsingSelector:"compare:"];

    id v9 = [v8 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v9)
    {
      id v10 = v9;
      v31 = v6 + 1;
      v32 = v8;
      uint64_t v11 = *(void *)v36;
      id v33 = v3;
      uint64_t v34 = *(void *)v36;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v36 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v35 + 1) + 8 * i);
          uint64_t v14 = objc_msgSend(v3, "objectForKeyedSubscript:", v13, v29);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v15 = v14;
            if ([v15 count])
            {
              v16 = [v15 objectForKeyedSubscript:@"A/B Activation"];
              long long v17 = sub_1002A3D60(v16);

              if (v17)
              {
                long long v18 = [v17 objectForKeyedSubscript:@"Range"];
                long long v19 = objc_opt_class();
                int v20 = sub_1002A567C(v18, v19);

                id v21 = [v17 objectForKeyedSubscript:@"Modulo"];
                __int16 v22 = sub_1002A3D00(v21);

                if ([v20 length]) {
                  BOOL v23 = v22 == 0;
                }
                else {
                  BOOL v23 = 1;
                }
                if (!v23)
                {
                  unint64_t v24 = +[CTKABHelper index] * (void)v31;
                  NSUInteger v25 = v24 % (unint64_t)[v22 unsignedIntegerValue];
                  NSRange v26 = NSRangeFromString((NSString *)v20);
                  if (v25 >= v26.location && v25 - v26.location < v26.length)
                  {
                    [v30 addEntriesFromDictionary:v15];
                    [(NSArray *)v29->_matchedABGroups addObject:v13];
                  }
                }

                id v8 = v32;
                id v3 = v33;
              }

              uint64_t v11 = v34;
            }
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v10);
    }
  }
  else
  {
    id v30 = 0;
  }

  return v30;
}

- (void)_updateFromPlist:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_36;
  }
  v146 = v4;
  if (![v4 count]) {
    goto LABEL_36;
  }
  dispatch_semaphore_t v5 = [v146 objectForKeyedSubscript:@"LuceneContextEngine"];
  uint64_t v6 = sub_1002A3D60(v5);

  if (v6)
  {
    BOOL v7 = [v6 objectForKeyedSubscript:@"Enabled"];
    sub_1002A53A0(&self->_luceneEnabled, v7);

    id v8 = [v6 objectForKeyedSubscript:@"Languages"];
    sub_1002A53F8((void **)&self->_luceneSupportedLanguages, v8);

    id v9 = [v6 objectForKeyedSubscript:@"MinRelativeScore"];
    sub_1002A5494(&self->_luceneMinRelativeScore, v9);

    id v10 = [v6 objectForKeyedSubscript:@"MinAbsoluteScore"];
    sub_1002A5494(&self->_luceneMinAbsoluteScore, v10);

    uint64_t v11 = [v6 objectForKeyedSubscript:@"MinScoreTitlePrimary"];
    sub_1002A5494(&self->_luceneMinScoreTitlePrimary, v11);

    id v12 = [v6 objectForKeyedSubscript:@"MinScoreTitleMatch"];
    sub_1002A5494(&self->_luceneMinScoreTitleMatch, v12);

    uint64_t v13 = [v6 objectForKeyedSubscript:@"MinTitleMatchPrimaryAllNamesOK"];
    sub_1002A54EC(&self->_luceneMinTitleMatchPrimaryAllNamesOK, v13);

    uint64_t v14 = [v6 objectForKeyedSubscript:@"MinTitleMatchAllNamesOK"];
    sub_1002A54EC(&self->_luceneMinTitleMatchAllNamesOK, v14);

    id v15 = [v6 objectForKeyedSubscript:@"MinTitleMatchForScoreBoost"];
    sub_1002A54EC(&self->_luceneMinTitleMatchForScoreBoost, v15);

    v16 = [v6 objectForKeyedSubscript:@"MaxUniqueTotalTokens"];
    sub_1002A54EC(&self->_luceneMaxUniqueTotalTokens, v16);

    long long v17 = [v6 objectForKeyedSubscript:@"MaxUniqueNotSkippedTokens"];
    sub_1002A54EC(&self->_luceneMaxUniqueNotSkippedTokens, v17);

    long long v18 = [v6 objectForKeyedSubscript:@"MaxUniquePrimaryTokens"];
    sub_1002A54EC(&self->_luceneMaxUniquePrimaryTokens, v18);

    long long v19 = [v6 objectForKeyedSubscript:@"ForceSecondaryAfterPosition"];
    sub_1002A54EC(&self->_luceneForceSecondaryAfterPosition, v19);

    int v20 = [v6 objectForKeyedSubscript:@"IgnoreAfterPosition"];
    sub_1002A54EC(&self->_luceneIgnoreAfterPosition, v20);

    id v21 = [v6 objectForKeyedSubscript:@"MinTokenCountToAugment"];
    sub_1002A5544(&self->_minTokenCountToAugment, v21);

    __int16 v22 = [v6 objectForKeyedSubscript:@"MinPrefixAdditionalResults"];
    sub_1002A5544(&self->_minPrefixAdditionalResults, v22);

    BOOL v23 = [v6 objectForKeyedSubscript:@"QueryDefaultNumResults"];
    sub_1002A54EC(&self->_luceneQueryDefaultNumResults, v23);

    unint64_t v24 = [v6 objectForKeyedSubscript:@"QueryMaxNumResults"];
    sub_1002A54EC(&self->_luceneQueryMaxNumResults, v24);

    NSUInteger v25 = [v6 objectForKeyedSubscript:@"IndexPath"];
    sub_1002A559C((id *)&self->_luceneIndexPath, v25);

    NSRange v26 = [v6 objectForKeyedSubscript:@"MinFileSizeForNSDataMMap"];
    sub_1002A54EC(&self->_luceneMinFileSizeForNSDataMMap, v26);

    v27 = [v6 objectForKeyedSubscript:@"BlendAlpha"];
    sub_1002A5494(&self->_luceneBlendAlpha, v27);

    v28 = [v6 objectForKeyedSubscript:@"BlendBeta"];
    sub_1002A5494(&self->_luceneBlendBeta, v28);

    v29 = [v6 objectForKeyedSubscript:@"BlendGamma"];
    sub_1002A5494(&self->_luceneBlendGamma, v29);

    id v30 = [v6 objectForKeyedSubscript:@"TermResultMinCount"];
    sub_1002A54EC(&self->_luceneTermResultMinCount, v30);

    v31 = [v6 objectForKeyedSubscript:@"TermResultMinCountRegularKeyword"];
    sub_1002A54EC(&self->_luceneTermResultMinCountRegularKeyword, v31);

    v32 = [v6 objectForKeyedSubscript:@"TermResultMinCountNoPrefixRegularKeyword"];
    sub_1002A54EC(&self->_luceneTermResultMinCountNoPrefixRegularKeyword, v32);

    id v33 = [v6 objectForKeyedSubscript:@"TermResultMinCountNoPrefixTopic"];
    sub_1002A54EC(&self->_luceneTermResultMinCountNoPrefixTopic, v33);

    uint64_t v34 = [v6 objectForKeyedSubscript:@"TermResultMinCountNoPrefixName"];
    sub_1002A54EC(&self->_luceneTermResultMinCountNoPrefixName, v34);

    long long v35 = [v6 objectForKeyedSubscript:@"TermResultMinCountNoPrefixFirstLastName"];
    sub_1002A54EC(&self->_luceneTermResultMinCountNoPrefixFirstLastName, v35);

    long long v36 = [v6 objectForKeyedSubscript:@"TermResultMinCountNoPrefixIntermediate"];
    sub_1002A54EC(&self->_luceneTermResultMinCountNoPrefixIntermediate, v36);

    long long v37 = [v6 objectForKeyedSubscript:@"TermResultFirstOccurrencePowerLawDecay"];
    sub_1002A5544(&self->_luceneTermResultFirstOccurrencePowerLawDecay, v37);

    long long v38 = [v6 objectForKeyedSubscript:@"TermResultUnigramScoreMultiplier"];
    sub_1002A54EC(&self->_luceneTermResultUnigramScoreMultiplier, v38);

    v39 = [v6 objectForKeyedSubscript:@"TermResultBigramScoreMultiplier"];
    sub_1002A54EC(&self->_luceneTermResultBigramScoreMultiplier, v39);

    v40 = [v6 objectForKeyedSubscript:@"TermResultDefaultMinPrefixQuoted"];
    sub_1002A5544(&self->_luceneTermResultDefaultMinPrefixQuoted, v40);

    v41 = [v6 objectForKeyedSubscript:@"TermResultDefaultMinPrefixRegularKeyword"];
    sub_1002A5544(&self->_luceneTermResultDefaultMinPrefixRegularKeyword, v41);

    v42 = [v6 objectForKeyedSubscript:@"TermResultDefaultMinPrefixTopic"];
    sub_1002A5544(&self->_luceneTermResultDefaultMinPrefixTopic, v42);

    v43 = [v6 objectForKeyedSubscript:@"TermResultDefaultMinPrefixName"];
    sub_1002A5544(&self->_luceneTermResultDefaultMinPrefixName, v43);

    v44 = [v6 objectForKeyedSubscript:@"TermResultDefaultMinPrefixFirstLastName"];
    sub_1002A5544(&self->_luceneTermResultDefaultMinPrefixFirstLastName, v44);

    v45 = [v6 objectForKeyedSubscript:@"TermResultDefaultMinPrefixIntermediate"];
    sub_1002A5544(&self->_luceneTermResultDefaultMinPrefixIntermediate, v45);

    v46 = [v6 objectForKeyedSubscript:@"TermResultGivenSurnameEnabled"];
    sub_1002A53A0(&self->_luceneTermResultGivenSurnameEnabled, v46);

    v47 = [v6 objectForKeyedSubscript:@"GivenSurnameMinGivenCount"];
    sub_1002A54EC(&self->_luceneGivenSurnameMinGivenCount, v47);

    v48 = [v6 objectForKeyedSubscript:@"GivenSurnameEarlyMentionLimit"];
    sub_1002A54EC(&self->_luceneGivenSurnameEarlyMentionLimit, v48);

    v49 = [v6 objectForKeyedSubscript:@"MaxTermResults"];
    sub_1002A54EC(&self->_luceneMaxTermResults, v49);

    v50 = [v6 objectForKeyedSubscript:@"MaxTermResultsWithDocument"];
    sub_1002A54EC(&self->_luceneMaxTermResultsWithDocument, v50);

    v51 = [v6 objectForKeyedSubscript:@"MaxTermAndBigramResults"];
    sub_1002A54EC(&self->_luceneMaxTermAndBigramResults, v51);

    v52 = [v6 objectForKeyedSubscript:@"MaxTermAndBigramResultsWithDocument"];
    sub_1002A54EC(&self->_luceneMaxTermAndBigramResultsWithDocument, v52);

    v53 = [v6 objectForKeyedSubscript:@"IndexVersionIdSuffix"];
    sub_1002A559C((id *)&self->_indexVersionIdSuffix, v53);

    v54 = [v6 objectForKeyedSubscript:@"NGramBreakingSeparators"];
    sub_1002A559C((id *)&self->_nGramBreakingSeparators, v54);

    v55 = [v6 objectForKeyedSubscript:@"AllowedNGramSeparators"];
    sub_1002A559C((id *)&self->_allowedNGramSeparators, v55);

    v56 = [v6 objectForKeyedSubscript:@"QuotedTokenCharacterSet"];
    sub_1002A559C((id *)&self->_quotedTokenCharacterSet, v56);

    v57 = [v6 objectForKeyedSubscript:@"PartialNGramCharacterSet"];
    sub_1002A559C((id *)&self->_partialNGramCharacterSet, v57);

    v58 = [v6 objectForKeyedSubscript:@"BigramMaxEnclosedStopwords"];
    sub_1002A54EC(&self->_bigramMaxEnclosedStopwords, v58);

    v59 = [v6 objectForKeyedSubscript:@"BigramMaxOffsetDelta"];
    sub_1002A54EC(&self->_bigramMaxOffsetDelta, v59);

    v60 = [v6 objectForKeyedSubscript:@"MinUIContextLength"];
    sub_1002A54EC(&self->_minUIContextLength, v60);

    v61 = [v6 objectForKeyedSubscript:@"MaxUIContextLength"];
    sub_1002A54EC(&self->_maxUIContextLength, v61);

    v62 = [v6 objectForKeyedSubscript:@"MinUIPositionY"];
    sub_1002A54EC(&self->_minUIPositionY, v62);

    v63 = [v6 objectForKeyedSubscript:@"SmallUIHeight"];
    sub_1002A54EC(&self->_smallUIHeight, v63);

    v64 = [v6 objectForKeyedSubscript:@"VerticalGroupBuffer"];
    sub_1002A54EC(&self->_verticalGroupBuffer, v64);

    v65 = [v6 objectForKeyedSubscript:@"HorizontalGroupBuffer"];
    sub_1002A54EC(&self->_horizontalGroupBuffer, v65);

    v66 = [v6 objectForKeyedSubscript:@"MaxUIContentCount"];
    sub_1002A54EC(&self->_maxUIContentCount, v66);

    v67 = [v6 objectForKeyedSubscript:@"MinTitleUIFontSize"];
    sub_1002A5624(&self->_minTitleUIFontSize, v67);

    v68 = [v6 objectForKeyedSubscript:@"MinFontDeltaForTitle"];
    sub_1002A5494(&self->_minFontDeltaForTitle, v68);

    v69 = [v6 objectForKeyedSubscript:@"TitleMinPrefix"];
    sub_1002A5544(&self->_titleMinPrefix, v69);

    v70 = [v6 objectForKeyedSubscript:@"StructuredExtractionMinPrefix"];
    sub_1002A5544(&self->_structuredExtractionMinPrefix, v70);

    v71 = [v6 objectForKeyedSubscript:@"StructuredExtractionDemotedResultMinPrefix"];
    sub_1002A5544(&self->_structuredExtractionDemotedResultMinPrefix, v71);

    v72 = [v6 objectForKeyedSubscript:@"StructuredExtractionUIBlockList"];
    sub_1002A53F8((void **)&self->_structuredExtractionUIBlockList, v72);

    v73 = [v6 objectForKeyedSubscript:@"StructuredExtractionUIOffScreenIgnoreList"];
    sub_1002A53F8((void **)&self->_structuredExtractionUIOffScreenIgnoreList, v73);

    v74 = [v6 objectForKeyedSubscript:@"SurroundingEntitiesSearchRange"];
    sub_1002A54EC(&self->_surroundingEntitiesSearchRange, v74);

    v75 = [v6 objectForKeyedSubscript:@"SurroundingEntitiesMaxDistanceScore"];
    sub_1002A54EC(&self->_surroundingEntitiesMaxDistanceScore, v75);

    v76 = [v6 objectForKeyedSubscript:@"SurroundingEntitiesDistanceScoreHorizontalSkew"];
    sub_1002A5494(&self->_surroundingEntitiesDistanceScoreHorizontalSkew, v76);

    v77 = [v6 objectForKeyedSubscript:@"SurroundingEntitiesMaxLabelLength"];
    sub_1002A54EC(&self->_surroundingEntitiesMaxLabelLength, v77);

    v78 = [v6 objectForKeyedSubscript:@"ConstellationMaxTopicDistance"];
    sub_1002A54EC(&self->_constellationMaxTopicDistance, v78);

    v79 = [v6 objectForKeyedSubscript:@"ConstellationMaxOverallTopics"];
    sub_1002A54EC(&self->_constellationMaxOverallTopics, v79);
  }
  v80 = [v146 objectForKeyedSubscript:@"ContextService"];
  v81 = sub_1002A3D60(v80);

  if (v81)
  {
    v82 = [v81 objectForKeyedSubscript:@"MaxConcurrency"];
    sub_1002A54EC(&self->_maxConcurrency, v82);

    v83 = [v81 objectForKeyedSubscript:@"MaxConcurrencyTimeoutSecs"];
    sub_1002A5494(&self->_maxConcurrencySemaphoreTimeoutSecs, v83);

    v84 = [v81 objectForKeyedSubscript:@"FindResultsTimeoutSecs"];
    sub_1002A5494(&self->_findResultsTimeoutSecs, v84);

    v85 = [v81 objectForKeyedSubscript:@"FindResultsSlowSecs"];
    sub_1002A5494(&self->_findResultsSlowSecs, v85);

    v86 = [v81 objectForKeyedSubscript:@"PortraitEnabled"];
    sub_1002A53A0(&self->_portraitEnabled, v86);

    v87 = [v81 objectForKeyedSubscript:@"HighLevelTopicsEnabled"];
    sub_1002A53A0(&self->_highLevelTopicsEnabled, v87);

    v88 = [v81 objectForKeyedSubscript:@"InternalGradingEnabled"];
    sub_1002A53A0(&self->_internalGradingEnabled, v88);

    v89 = [v81 objectForKeyedSubscript:@"DigitalHealthEnabled"];
    sub_1002A53A0(&self->_digitalHealthEnabled, v89);

    v90 = [v81 objectForKeyedSubscript:@"FallbackModeQuerySuggestionsEnabled"];
    sub_1002A53A0(&self->_fallbackModeQuerySuggestionsEnabled, v90);

    v91 = [v81 objectForKeyedSubscript:@"ExtraQueryCompletionsEnabled"];
    sub_1002A53A0(&self->_extraQueryCompletionsEnabled, v91);

    v92 = [v81 objectForKeyedSubscript:@"ExtraQueryCompletionsTopKLanguages"];
    sub_1002A54EC(&self->_extraQueryCompletionsTopKLanguages, v92);

    v93 = [v81 objectForKeyedSubscript:@"TagsEnabled"];
    sub_1002A53A0(&self->_tagsEnabled, v93);

    v94 = [v81 objectForKeyedSubscript:@"CoreNLPTaggingEnabled"];
    sub_1002A53A0(&self->_coreNLPTaggingEnabled, v94);

    v95 = [v81 objectForKeyedSubscript:@"CoreNLPMinScore"];
    sub_1002A5494(&self->_coreNLPMinScore, v95);

    v96 = [v81 objectForKeyedSubscript:@"CoreNLPRelevantScore"];
    sub_1002A5494(&self->_coreNLPRelevantScore, v96);

    v97 = [v81 objectForKeyedSubscript:@"RawTextEnabled"];
    sub_1002A53A0(&self->_rawTextEnabled, v97);

    v98 = [v81 objectForKeyedSubscript:@"HideCompletionsTimeLimit"];
    sub_1002A5624(&self->_hideCompletionsTimeLimit, v98);

    v99 = [v81 objectForKeyedSubscript:@"MustPrefixMatchLength"];
    sub_1002A54EC(&self->_mustPrefixMatchLength, v99);

    v100 = [v81 objectForKeyedSubscript:@"MaxFingerprints"];
    sub_1002A54EC(&self->_maxFingerprints, v100);

    v101 = [v81 objectForKeyedSubscript:@"Debug"];
    v102 = sub_1002A3D60(v101);

    if (!v102)
    {
LABEL_18:

      goto LABEL_19;
    }
    v103 = [v102 objectForKeyedSubscript:@"DelaySecs"];
    sub_1002A5494(&self->_debugDelaySecs, v103);

    v104 = [v102 objectForKeyedSubscript:@"ForceLanguageTag"];
    sub_1002A559C((id *)&self->_debugForceLanguageTag, v104);

    v105 = [v102 objectForKeyedSubscript:@"DisableMetricsLogging"];
    sub_1002A53A0(&self->_debugDisableMetricsLogging, v105);

    v106 = [v102 objectForKeyedSubscript:@"UseMadvise"];
    sub_1002A53A0(&self->_debugUseMadvise, v106);

    v107 = [v102 objectForKeyedSubscript:@"UIFeedback"];
    sub_1002A53A0(&self->_debugUIFeedback, v107);

    v108 = [v102 objectForKeyedSubscript:@"UseOldIndexInput"];
    sub_1002A53A0(&self->_debugUseOldIndexInput, v108);

    v109 = [v102 objectForKeyedSubscript:@"NSDataBufferSize"];
    sub_1002A54EC(&self->_debugNSDataBufferSize, v109);

    v145 = v102;
    v110 = [v102 objectForKeyedSubscript:@"FakeResults"];
    v111 = objc_opt_class();
    uint64_t v112 = sub_1002A567C(v110, v111);
    if (v112)
    {
      v113 = (void *)v112;
      v114 = +[NSMutableArray arrayWithArray:v112];

      if (v114)
      {
        +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v114 count]);
        v115 = (NSArray *)objc_claimAutoreleasedReturnValue();
        v116 = (char *)[v114 count];
        if (v116)
        {
          v117 = v116;
          for (i = 0; i != v117; ++i)
          {
            v119 = [v114 objectAtIndexedSubscript:i];
            v120 = objc_opt_class();
            uint64_t v121 = sub_1002A567C(v119, v120);
            v122 = (void *)v121;
            v123 = @"Illegal value";
            if (v121) {
              v123 = (__CFString *)v121;
            }
            v124 = v123;

            id v125 = [objc_alloc((Class)CKContextResult) initWithTitle:v124 query:v124 url:0 category:@"fakeResult"];
            [(NSArray *)v115 setObject:v125 atIndexedSubscript:i];
          }
        }
        debugFakeResults = self->_debugFakeResults;
        self->_debugFakeResults = v115;

        goto LABEL_17;
      }
    }
    else
    {
    }
    v114 = self->_debugFakeResults;
    self->_debugFakeResults = 0;
LABEL_17:

    goto LABEL_18;
  }
LABEL_19:
  v127 = [v146 objectForKeyedSubscript:@"Blacklist"];
  v128 = sub_1002A3D60(v127);

  if (v128)
  {
    v129 = [v128 objectForKeyedSubscript:@"Title"];
    v130 = sub_1002A5774(v129);

    if ([v130 count])
    {
      blacklistTitles = self->_blacklistTitles;
      if (!blacklistTitles)
      {
        v132 = (NSSet *)objc_opt_new();
        v133 = self->_blacklistTitles;
        self->_blacklistTitles = v132;

        blacklistTitles = self->_blacklistTitles;
      }
      [(NSSet *)blacklistTitles addObjectsFromArray:v130];
    }
    v134 = [v128 objectForKeyedSubscript:@"Portrait"];
    v135 = sub_1002A5774(v134);

    if ([v135 count])
    {
      blacklistPortrait = self->_blacklistPortrait;
      if (!blacklistPortrait)
      {
        v137 = (NSSet *)objc_opt_new();
        v138 = self->_blacklistPortrait;
        self->_blacklistPortrait = v137;

        blacklistPortrait = self->_blacklistPortrait;
      }
      [(NSSet *)blacklistPortrait addObjectsFromArray:v135];
    }
    v139 = [v128 objectForKeyedSubscript:@"RemoveAllOnMatch"];
    sub_1002A53A0(&self->_blacklistRemoveAllOnMatch, v139);
  }
  v140 = [v146 objectForKeyedSubscript:@"A/B Groups"];
  v141 = sub_1002A3D60(v140);

  if ([v141 count])
  {
    v142 = [(ContextConfiguration *)self abGroupOfDictionary:v141];
    [(ContextConfiguration *)self _updateFromPlist:v142];
  }
  if (byte_100562FC8)
  {
    v143 = [v146 objectForKeyedSubscript:@"LowMemDevices"];
    v144 = sub_1002A3D60(v143);

    if ([v144 count]) {
      [(ContextConfiguration *)self _updateFromPlist:v144];
    }
  }
LABEL_36:
  _objc_release_x1();
}

+ (void)registerUpdateHandler:(id)a3
{
  id v3 = a3;
  id v4 = +[NSNotificationCenter defaultCenter];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002A5898;
  v7[3] = &unk_10048B8B0;
  id v8 = v3;
  id v5 = v3;
  id v6 = [v4 addObserverForName:@"contextConfigurationDidChange" object:0 queue:0 usingBlock:v7];
}

- (id)debugStatus
{
  id v3 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v4 = self;
  id v5 = (objc_class *)objc_opt_class();
  unsigned int outCount = 0;
  id v6 = class_copyPropertyList(v5, &outCount);
  BOOL v7 = +[NSMutableArray array];
  if (outCount)
  {
    for (unint64_t i = 0; i < outCount; ++i)
    {
      id v9 = +[NSString stringWithUTF8String:property_getName(v6[i])];
      [v7 addObject:v9];
    }
  }
  free(v6);
  [v7 sortUsingSelector:"compare:"];
  id obj = v7;
  id v10 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      for (j = 0; j != v11; j = (char *)j + 1)
      {
        uint64_t v14 = v3;
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v21 + 1) + 8 * (void)j);
        v16 = [(ContextConfiguration *)v4 valueForKey:v15];
        long long v17 = +[NSString stringWithFormat:@"%@", v16];

        uint64_t v19 = v15;
        id v3 = v14;
        [v14 appendFormat:@"%@: %@\n", v19, v17];
      }
      id v11 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v11);
  }

  objc_msgSend(v3, "appendFormat:", @"isLowMemDevice: %i", byte_100562FC8);
  return v3;
}

- (NSString)indexVersionId
{
  return self->_indexVersionId;
}

- (NSArray)matchedABGroups
{
  return self->_matchedABGroups;
}

- (BOOL)luceneEnabled
{
  return self->_luceneEnabled;
}

- (float)luceneMinRelativeScore
{
  return self->_luceneMinRelativeScore;
}

- (float)luceneMinAbsoluteScore
{
  return self->_luceneMinAbsoluteScore;
}

- (float)luceneMinScoreTitlePrimary
{
  return self->_luceneMinScoreTitlePrimary;
}

- (float)luceneMinScoreTitleMatch
{
  return self->_luceneMinScoreTitleMatch;
}

- (unint64_t)luceneMinTitleMatchPrimaryAllNamesOK
{
  return self->_luceneMinTitleMatchPrimaryAllNamesOK;
}

- (unint64_t)luceneMinTitleMatchAllNamesOK
{
  return self->_luceneMinTitleMatchAllNamesOK;
}

- (unint64_t)luceneMinTitleMatchForScoreBoost
{
  return self->_luceneMinTitleMatchForScoreBoost;
}

- (unint64_t)luceneMaxUniqueTotalTokens
{
  return self->_luceneMaxUniqueTotalTokens;
}

- (unint64_t)luceneMaxUniqueNotSkippedTokens
{
  return self->_luceneMaxUniqueNotSkippedTokens;
}

- (unint64_t)luceneMaxUniquePrimaryTokens
{
  return self->_luceneMaxUniquePrimaryTokens;
}

- (unint64_t)luceneForceSecondaryAfterPosition
{
  return self->_luceneForceSecondaryAfterPosition;
}

- (unint64_t)luceneIgnoreAfterPosition
{
  return self->_luceneIgnoreAfterPosition;
}

- (unint64_t)luceneMinFileSizeForNSDataMMap
{
  return self->_luceneMinFileSizeForNSDataMMap;
}

- (NSString)luceneIndexPath
{
  return self->_luceneIndexPath;
}

- (NSSet)luceneSupportedLanguages
{
  return self->_luceneSupportedLanguages;
}

- (BOOL)luceneUsePhraseQuery
{
  return self->_luceneUsePhraseQuery;
}

- (BOOL)luceneTermResultGivenSurnameEnabled
{
  return self->_luceneTermResultGivenSurnameEnabled;
}

- (unint64_t)luceneGivenSurnameMinGivenCount
{
  return self->_luceneGivenSurnameMinGivenCount;
}

- (unint64_t)luceneGivenSurnameEarlyMentionLimit
{
  return self->_luceneGivenSurnameEarlyMentionLimit;
}

- (int64_t)luceneTermResultFirstOccurrencePowerLawDecay
{
  return self->_luceneTermResultFirstOccurrencePowerLawDecay;
}

- (unint64_t)luceneTermResultUnigramScoreMultiplier
{
  return self->_luceneTermResultUnigramScoreMultiplier;
}

- (unint64_t)luceneTermResultBigramScoreMultiplier
{
  return self->_luceneTermResultBigramScoreMultiplier;
}

- (unint64_t)luceneMaxTermResults
{
  return self->_luceneMaxTermResults;
}

- (unint64_t)luceneMaxTermResultsWithDocument
{
  return self->_luceneMaxTermResultsWithDocument;
}

- (unint64_t)luceneMaxTermAndBigramResults
{
  return self->_luceneMaxTermAndBigramResults;
}

- (unint64_t)luceneMaxTermAndBigramResultsWithDocument
{
  return self->_luceneMaxTermAndBigramResultsWithDocument;
}

- (unint64_t)luceneQueryDefaultNumResults
{
  return self->_luceneQueryDefaultNumResults;
}

- (unint64_t)luceneQueryMaxNumResults
{
  return self->_luceneQueryMaxNumResults;
}

- (NSSet)blacklistTitles
{
  return self->_blacklistTitles;
}

- (NSSet)blacklistPortrait
{
  return self->_blacklistPortrait;
}

- (float)luceneBlendAlpha
{
  return self->_luceneBlendAlpha;
}

- (float)luceneBlendBeta
{
  return self->_luceneBlendBeta;
}

- (float)luceneBlendGamma
{
  return self->_luceneBlendGamma;
}

- (unint64_t)maxConcurrency
{
  return self->_maxConcurrency;
}

- (float)maxConcurrencySemaphoreTimeoutSecs
{
  return self->_maxConcurrencySemaphoreTimeoutSecs;
}

- (float)findResultsTimeoutSecs
{
  return self->_findResultsTimeoutSecs;
}

- (float)findResultsSlowSecs
{
  return self->_findResultsSlowSecs;
}

- (float)debugDelaySecs
{
  return self->_debugDelaySecs;
}

- (NSString)debugForceLanguageTag
{
  return self->_debugForceLanguageTag;
}

- (NSArray)debugFakeResults
{
  return self->_debugFakeResults;
}

- (BOOL)debugDisableMetricsLogging
{
  return self->_debugDisableMetricsLogging;
}

- (BOOL)debugUseMadvise
{
  return self->_debugUseMadvise;
}

- (BOOL)debugUseOldIndexInput
{
  return self->_debugUseOldIndexInput;
}

- (unint64_t)debugNSDataBufferSize
{
  return self->_debugNSDataBufferSize;
}

- (BOOL)debugUIFeedback
{
  return self->_debugUIFeedback;
}

- (BOOL)portraitEnabled
{
  return self->_portraitEnabled;
}

- (int64_t)minTokenCountToAugment
{
  return self->_minTokenCountToAugment;
}

- (int64_t)minPrefixAdditionalResults
{
  return self->_minPrefixAdditionalResults;
}

- (BOOL)highLevelTopicsEnabled
{
  return self->_highLevelTopicsEnabled;
}

- (BOOL)internalGradingEnabled
{
  return self->_internalGradingEnabled;
}

- (BOOL)digitalHealthEnabled
{
  return self->_digitalHealthEnabled;
}

- (BOOL)fallbackModeQuerySuggestionsEnabled
{
  return self->_fallbackModeQuerySuggestionsEnabled;
}

- (BOOL)extraQueryCompletionsEnabled
{
  return self->_extraQueryCompletionsEnabled;
}

- (unint64_t)extraQueryCompletionsTopKLanguages
{
  return self->_extraQueryCompletionsTopKLanguages;
}

- (BOOL)tagsEnabled
{
  return self->_tagsEnabled;
}

- (BOOL)coreNLPTaggingEnabled
{
  return self->_coreNLPTaggingEnabled;
}

- (float)coreNLPMinScore
{
  return self->_coreNLPMinScore;
}

- (float)coreNLPRelevantScore
{
  return self->_coreNLPRelevantScore;
}

- (BOOL)rawTextEnabled
{
  return self->_rawTextEnabled;
}

- (double)hideCompletionsTimeLimit
{
  return self->_hideCompletionsTimeLimit;
}

- (unint64_t)mustPrefixMatchLength
{
  return self->_mustPrefixMatchLength;
}

- (NSOrderedSet)desiredLanguageTags
{
  return self->_desiredLanguageTags;
}

- (NSString)nGramBreakingSeparators
{
  return self->_nGramBreakingSeparators;
}

- (NSString)allowedNGramSeparators
{
  return self->_allowedNGramSeparators;
}

- (NSString)quotedTokenCharacterSet
{
  return self->_quotedTokenCharacterSet;
}

- (NSString)partialNGramCharacterSet
{
  return self->_partialNGramCharacterSet;
}

- (unint64_t)bigramMaxEnclosedStopwords
{
  return self->_bigramMaxEnclosedStopwords;
}

- (unint64_t)bigramMaxOffsetDelta
{
  return self->_bigramMaxOffsetDelta;
}

- (unint64_t)minUIContextLength
{
  return self->_minUIContextLength;
}

- (unint64_t)maxUIContextLength
{
  return self->_maxUIContextLength;
}

- (unint64_t)minUIPositionY
{
  return self->_minUIPositionY;
}

- (unint64_t)smallUIHeight
{
  return self->_smallUIHeight;
}

- (unint64_t)verticalGroupBuffer
{
  return self->_verticalGroupBuffer;
}

- (unint64_t)horizontalGroupBuffer
{
  return self->_horizontalGroupBuffer;
}

- (unint64_t)maxUIContentCount
{
  return self->_maxUIContentCount;
}

- (double)minTitleUIFontSize
{
  return self->_minTitleUIFontSize;
}

- (float)minFontDeltaForTitle
{
  return self->_minFontDeltaForTitle;
}

- (int64_t)titleMinPrefix
{
  return self->_titleMinPrefix;
}

- (int64_t)structuredExtractionMinPrefix
{
  return self->_structuredExtractionMinPrefix;
}

- (int64_t)structuredExtractionDemotedResultMinPrefix
{
  return self->_structuredExtractionDemotedResultMinPrefix;
}

- (NSSet)structuredExtractionUIBlockList
{
  return self->_structuredExtractionUIBlockList;
}

- (NSSet)structuredExtractionUIOffScreenIgnoreList
{
  return self->_structuredExtractionUIOffScreenIgnoreList;
}

- (unint64_t)surroundingEntitiesSearchRange
{
  return self->_surroundingEntitiesSearchRange;
}

- (unint64_t)surroundingEntitiesMaxDistanceScore
{
  return self->_surroundingEntitiesMaxDistanceScore;
}

- (float)surroundingEntitiesDistanceScoreHorizontalSkew
{
  return self->_surroundingEntitiesDistanceScoreHorizontalSkew;
}

- (unint64_t)surroundingEntitiesMaxLabelLength
{
  return self->_surroundingEntitiesMaxLabelLength;
}

- (unint64_t)maxFingerprints
{
  return self->_maxFingerprints;
}

- (unint64_t)constellationMaxTopicDistance
{
  return self->_constellationMaxTopicDistance;
}

- (unint64_t)constellationMaxOverallTopics
{
  return self->_constellationMaxOverallTopics;
}

- (OS_dispatch_semaphore)maxConcurrencySemaphore
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 696, 1);
}

- (void)setMaxConcurrencySemaphore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxConcurrencySemaphore, 0);
  objc_storeStrong((id *)&self->_structuredExtractionUIOffScreenIgnoreList, 0);
  objc_storeStrong((id *)&self->_structuredExtractionUIBlockList, 0);
  objc_storeStrong((id *)&self->_partialNGramCharacterSet, 0);
  objc_storeStrong((id *)&self->_quotedTokenCharacterSet, 0);
  objc_storeStrong((id *)&self->_allowedNGramSeparators, 0);
  objc_storeStrong((id *)&self->_nGramBreakingSeparators, 0);
  objc_storeStrong((id *)&self->_desiredLanguageTags, 0);
  objc_storeStrong((id *)&self->_debugFakeResults, 0);
  objc_storeStrong((id *)&self->_debugForceLanguageTag, 0);
  objc_storeStrong((id *)&self->_blacklistPortrait, 0);
  objc_storeStrong((id *)&self->_blacklistTitles, 0);
  objc_storeStrong((id *)&self->_luceneSupportedLanguages, 0);
  objc_storeStrong((id *)&self->_luceneIndexPath, 0);
  objc_storeStrong((id *)&self->_matchedABGroups, 0);
  objc_storeStrong((id *)&self->_indexVersionId, 0);
  objc_storeStrong((id *)&self->_indexVersionIdSuffix, 0);
}

@end