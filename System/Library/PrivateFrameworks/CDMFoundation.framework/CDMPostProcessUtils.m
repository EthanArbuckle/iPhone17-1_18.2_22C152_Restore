@interface CDMPostProcessUtils
+ (BOOL)alignmentSubsumesSpan:(id)a3 alignment:(id)a4;
+ (BOOL)hasEntityEdgeTo:(int)a3 inGraph:(id)a4;
+ (BOOL)hasTagNamespace:(id)a3;
+ (id)entityKeyFrom:(id)a3 at:(unint64_t)a4;
+ (id)filterAndConvertInternalMatchingSpan:(id)a3;
+ (id)filterAndConvertInternalMatchingSpans:(id)a3;
+ (id)getAlignedEntitySpanSpans:(id)a3;
+ (id)getAlignedIdentifierSpans:(id)a3;
+ (id)getCorrectionOutcomeFromUserParses:(id)a3 ccqrCorrectionOutcome:(id)a4;
+ (id)getCroppedUserParses:(id)a3;
+ (id)getFederatedParses:(id)a3 parsesNLv4:(id)a4 parsesCATI:(id)a5 parsesUaaP:(id)a6 parsesPSC:(id)a7 parsesAutoShortcuts:(id)a8 parsesAppendOverrides:(id)a9 parsesSSU:(id)a10 addDebugInfo:(id)a11;
+ (id)getGroupIndexDict:(id)a3;
+ (id)getPostProcessUserParses:(id)a3;
+ (id)getPostProcessUserParses:(id)a3 parsesNLv4:(id)a4 parsesCATI:(id)a5 addDebugInfo:(id)a6;
+ (id)getPostProcessUserParses:(id)a3 parsesNLv4:(id)a4 parsesCATI:(id)a5 parsesUaaP:(id)a6 addDebugInfo:(id)a7;
+ (id)getPostProcessUserParses:(id)a3 parsesNLv4:(id)a4 parsesCATI:(id)a5 parsesUaaP:(id)a6 parsesPSC:(id)a7 parsesAutoShortcuts:(id)a8 parsesAppendOverrides:(id)a9 parsesSSU:(id)a10 addDebugInfo:(id)a11;
+ (id)getSignificantTokenCountFrom:(unsigned int)a3 to:(unsigned int)a4 within:(id)a5;
+ (id)getUtteranceAlignmentForIndex:(id)a3 nodeIndex:(int)a4;
+ (id)normalizedPayloadsFrom:(int64_t)a3 to:(int64_t)a4 within:(id)a5;
+ (id)rewriteMessageFromMatchingSpans:(id)a3 mrRewrittenUtterance:(id)a4;
+ (id)runPostProcess:(id)a3 snlcRequest:(id)a4 snlcResponse:(id)a5 nLv4Request:(id)a6 nLv4Response:(id)a7 uaapNLProtoResponse:(id)a8 catiProtoResponse:(id)a9 pscRequest:(id)a10 pscResponse:(id)a11 lvcResponse:(id)a12 overridesProtoResponse:(id)a13 mdRequest:(id)a14 mdResponse:(id)a15 mrRequest:(id)a16 mrResponse:(id)a17 spanProtoResponse:(id)a18 rdResponse:(id)a19 tokenProtoResponse:(id)a20 ssuResponse:(id)a21 ccqrResponse:(id)a22 correctionOutcome:(id)a23 nluRequest:(id)a24 graphInput:(id)a25 debugText:(id)a26;
+ (id)selectParsesFromUserParsesUaaP:(id)a3 userParsesShortcut:(id)a4 userParsesReplaceOverrides:(id)a5 userParsesAppendOverrides:(id)a6 userParsesSNLC:(id)a7 userParsesNLv4:(id)a8 userParsesCATI:(id)a9 userParsesPSC:(id)a10 userParsesAutoShortcuts:(id)a11 userParsesSSU:(id)a12 addDebugInfo:(id)a13;
+ (id)significantTokenCountFrom:(unsigned int)a3 to:(unsigned int)a4 within:(id)a5;
+ (id)sortParses:(id)a3;
+ (id)spanIndexDict:(id)a3 tokenChain:(id)a4;
+ (id)supplementaryOutputFromMatchingSpans:(id)a3 rewriteMessage:(id)a4 correctionOutcome:(id)a5;
+ (id)usoGraphs:(id)a3;
+ (unsigned)isExternalMatchingSpan:(id)a3 fromMatcher:(int)a4;
+ (unsigned)isInternalMatchingSpan:(id)a3 fromMatcher:(int)a4;
+ (void)addNormalizedValuesTo:(id)a3 alignedWith:(id)a4 from:(id)a5;
+ (void)annotateDUDAWithMRRRewrittenUtterance:(id)a3 matchingSpans:(id)a4 userDialogAct:(id)a5;
+ (void)annotateDelegatedUDAParses:(id)a3 matchingSpans:(id)a4 mrRewrittenUtterance:(id)a5;
+ (void)annotateNLUResponse:(id)a3 nluRequest:(id)a4 matchingSpans:(id)a5 tokenChain:(id)a6;
+ (void)annotateParses:(id)a3 tokenChain:(id)a4 matchingSpans:(id)a5 asrHypothesis:(id)a6;
+ (void)annotateUserParses:(id)a3 correctionOutcome:(id)a4;
+ (void)copyASRTimingInfoToUtteranceSpan:(id)a3 startIndexTokenDict:(id)a4 endIndexTokenDict:(id)a5;
+ (void)copyAlignedSpanEntitySpanForSameType:(id)a3 spanIndexDict:(id)a4 utteranceAlignment:(id)a5 entityKey:(id)a6 tokenChain:(id)a7;
+ (void)copyAlignedSpanIdentifierForSameType:(id)a3 spanIndexDict:(id)a4 utteranceAlignment:(id)a5 entityKey:(id)a6 groupIndexDict:(id)a7 tokenChain:(id)a8;
+ (void)copyMentionResolverSpanEntitySpans:(id)a3 fromMatchingSpans:(id)a4 toParseGraph:(id)a5;
+ (void)copyMentionResolverSpanIdentifiers:(id)a3 fromMatchingSpans:(id)a4 toParseGraph:(id)a5;
+ (void)copySubsumedSpanEntitySpan:(id)a3 spans:(id)a4 parseEntityKey:(id)a5 utteranceAlignment:(id)a6 tokenChain:(id)a7;
+ (void)createIdentifierGroups:(id)a3 spans:(id)a4 parseEntityKey:(id)a5 parseAlignment:(id)a6 interpretationGroupCurrentMax:(id)a7;
+ (void)logParsesRanking:(id)a3 addDebugInfo:(id)a4;
+ (void)mapVocGenericBundleIdsToPlatformBundleIdsForGraph:(id)a3;
+ (void)mapVocGenericBundleIdsToPlatformBundleIdsForParse:(id)a3;
+ (void)populateComparableProbabilityForParsesNLv4:(id)a3 parsesSNLC:(id)a4;
+ (void)populateComparableProbabilityFromProbabilityParses:(id)a3;
+ (void)populateComparableProbabilityParses:(id)a3 threshold:(float)a4;
+ (void)populateComparableProbabilityParsesAutoShortcuts:(id)a3;
+ (void)populateComparableProbabilityParsesCATI:(id)a3;
+ (void)populateComparableProbabilityParsesPSC:(id)a3;
+ (void)populateComparableProbabilityParsesSNLC:(id)a3 deviceParses:(id)a4;
+ (void)populateComparableProbabilityParsesSSU:(id)a3;
+ (void)populateComparableProbabilityParsesUaaP:(id)a3;
+ (void)removeProbabilityFromUserParses:(id)a3;
+ (void)runFeatureStore:(id)a3 nluResponse:(id)a4 snlcRequest:(id)a5 snlcResponse:(id)a6 pscRequest:(id)a7 pscResponse:(id)a8 spanProtoResponse:(id)a9 tokenProtoResponse:(id)a10 mdRequest:(id)a11 mdResponse:(id)a12 mrRequest:(id)a13 mrResponse:(id)a14 nLv4Request:(id)a15 nLv4Response:(id)a16;
+ (void)splitParses:(id)a3 deviceParses:(id)a4 zeroParses:(id)a5;
+ (void)stripBugFixNamespaceSuffix:(id)a3;
+ (void)stripBugFixPropertyKeySuffix:(id)a3;
+ (void)updateIndexesForSignificantTokensFrom:(unsigned int *)a3 to:(unsigned int *)a4 tokenChain:(id)a5 entityKey:(id)a6;
@end

@implementation CDMPostProcessUtils

+ (void)mapVocGenericBundleIdsToPlatformBundleIdsForGraph:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v31 = a3;
  v3 = [v31 identifiers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v36 objects:v47 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v37 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        if ([v8 sourceComponent] == 2)
        {
          v9 = [v8 namespaceA];
          v10 = [v9 value];
          if ([v10 isEqualToString:@"appName"])
          {
            char v11 = [v8 hasValue];

            if ((v11 & 1) == 0) {
              continue;
            }
            v12 = [v8 value];
            v9 = +[CDMVocBundleMappingUtils mapVocGenericBundleIdToPlatformBundleId:v12];

            if (v9)
            {
              v13 = CDMOSLoggerForCategory(0);
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
              {
                v14 = [v8 value];
                *(_DWORD *)buf = 136315650;
                v42 = "+[CDMPostProcessUtils mapVocGenericBundleIdsToPlatformBundleIdsForGraph:]";
                __int16 v43 = 2112;
                v44 = v14;
                __int16 v45 = 2112;
                v46 = v9;
                _os_log_debug_impl(&dword_2263A0000, v13, OS_LOG_TYPE_DEBUG, "%s Mapping appName identifier generic bundle ID \"%@\" to platform bundle \"%@\".", buf, 0x20u);
              }
              [v8 setValue:v9];
            }
          }
          else
          {
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v36 objects:v47 count:16];
    }
    while (v5);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v15 = [v31 spans];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v33;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v33 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v32 + 1) + 8 * j);
        if ([v20 sourceComponent] == 2)
        {
          v21 = [v20 properties];
          v22 = [v21 firstObject];

          v23 = [v22 key];
          if (![v23 isEqualToString:@"appName"]) {
            goto LABEL_29;
          }
          int v24 = [v22 hasValueString];

          if (v24)
          {
            v25 = [v22 valueString];
            v26 = [v25 value];
            v23 = +[CDMVocBundleMappingUtils mapVocGenericBundleIdToPlatformBundleId:v26];

            if (v23)
            {
              v27 = CDMOSLoggerForCategory(0);
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
              {
                v29 = [v22 valueString];
                v30 = [v29 value];
                *(_DWORD *)buf = 136315650;
                v42 = "+[CDMPostProcessUtils mapVocGenericBundleIdsToPlatformBundleIdsForGraph:]";
                __int16 v43 = 2112;
                v44 = v30;
                __int16 v45 = 2112;
                v46 = v23;
                _os_log_debug_impl(&dword_2263A0000, v27, OS_LOG_TYPE_DEBUG, "%s Mapping appName entity generic bundle ID \"%@\" to platform bundle \"%@\".", buf, 0x20u);
              }
              v28 = [v22 valueString];
              [v28 setValue:v23];
            }
LABEL_29:
          }
          continue;
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v17);
  }
}

+ (void)mapVocGenericBundleIdsToPlatformBundleIdsForParse:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = objc_msgSend(a3, "userDialogActs", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v9 hasUserStatedTask])
        {
          v10 = [v9 userStatedTask];
          int v11 = [v10 hasTask];

          if (v11)
          {
            v12 = [v9 userStatedTask];
            v13 = [v12 task];
            [a1 mapVocGenericBundleIdsToPlatformBundleIdsForGraph:v13];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
}

+ (void)removeProbabilityFromUserParses:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) setProbability:0.0];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

+ (id)supplementaryOutputFromMatchingSpans:(id)a3 rewriteMessage:(id)a4 correctionOutcome:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  long long v10 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    long long v14 = [v7 rewrittenUtterance];
    int v15 = 136315650;
    long long v16 = "+[CDMPostProcessUtils supplementaryOutputFromMatchingSpans:rewriteMessage:correctionOutcome:]";
    __int16 v17 = 2112;
    uint64_t v18 = v14;
    __int16 v19 = 1024;
    int v20 = [v7 rewriteType];
    _os_log_debug_impl(&dword_2263A0000, v10, OS_LOG_TYPE_DEBUG, "%s Adding supplementary output with re-written utterance: %@, re-write type: %i", (uint8_t *)&v15, 0x1Cu);
  }
  long long v11 = objc_opt_new();
  [v11 setRewrite:v7];
  [v11 setCorrectionOutcome:v8];

  v12 = (void *)[v9 mutableCopy];
  [v11 setMatchingSpans:v12];

  return v11;
}

+ (id)rewriteMessageFromMatchingSpans:(id)a3 mrRewrittenUtterance:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (+[CDMFeatureFlags isMentionResolverRewriterEnabled](CDMFeatureFlags, "isMentionResolverRewriterEnabled")&& [v7 length])
  {
    id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          if (objc_msgSend(a1, "isExternalMatchingSpan:fromMatcher:", v14, 2, (void)v17)) {
            [v8 addObject:v14];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v11);
    }

    if ([v8 count])
    {
      int v15 = objc_opt_new();
      [v15 setRewrittenUtterance:v7];
      [v15 setRewriteType:3];
    }
    else
    {
      int v15 = 0;
    }
  }
  else
  {
    int v15 = 0;
  }

  return v15;
}

+ (void)annotateDelegatedUDAParses:(id)a3 matchingSpans:(id)a4 mrRewrittenUtterance:(id)a5
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v28 = a4;
  id v27 = a5;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  obuint64_t j = v7;
  uint64_t v24 = [v7 countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (v24)
  {
    uint64_t v23 = *(void *)v39;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v39 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v25 = v8;
        id v9 = *(void **)(*((void *)&v38 + 1) + 8 * v8);
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        id v29 = [v9 userDialogActs];
        uint64_t v10 = [v29 countByEnumeratingWithState:&v34 objects:v43 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v35;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v35 != v12) {
                objc_enumerationMutation(v29);
              }
              uint64_t v14 = *(void **)(*((void *)&v34 + 1) + 8 * i);
              if ([v14 hasDelegated])
              {
                long long v32 = 0u;
                long long v33 = 0u;
                long long v30 = 0u;
                long long v31 = 0u;
                id v15 = v28;
                uint64_t v16 = [v15 countByEnumeratingWithState:&v30 objects:v42 count:16];
                if (v16)
                {
                  uint64_t v17 = v16;
                  uint64_t v18 = *(void *)v31;
                  do
                  {
                    for (uint64_t j = 0; j != v17; ++j)
                    {
                      if (*(void *)v31 != v18) {
                        objc_enumerationMutation(v15);
                      }
                      uint64_t v20 = *(void *)(*((void *)&v30 + 1) + 8 * j);
                      uint64_t v21 = [v14 delegated];
                      [v21 addMatchingSpans:v20];
                    }
                    uint64_t v17 = [v15 countByEnumeratingWithState:&v30 objects:v42 count:16];
                  }
                  while (v17);
                }

                [a1 annotateDUDAWithMRRRewrittenUtterance:v27 matchingSpans:v15 userDialogAct:v14];
              }
            }
            uint64_t v11 = [v29 countByEnumeratingWithState:&v34 objects:v43 count:16];
          }
          while (v11);
        }

        uint64_t v8 = v25 + 1;
      }
      while (v25 + 1 != v24);
      uint64_t v24 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
    }
    while (v24);
  }
}

+ (void)annotateDUDAWithMRRRewrittenUtterance:(id)a3 matchingSpans:(id)a4 userDialogAct:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v15 = 136315394;
    uint64_t v16 = "+[CDMPostProcessUtils annotateDUDAWithMRRRewrittenUtterance:matchingSpans:userDialogAct:]";
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_debug_impl(&dword_2263A0000, v10, OS_LOG_TYPE_DEBUG, "%s annotate DUDA With mr re-written utterance - %@", (uint8_t *)&v15, 0x16u);
  }

  uint64_t v11 = [v9 delegated];
  uint64_t v12 = [v11 rewrite];

  if (!v12)
  {
    uint64_t v13 = [(id)objc_opt_class() rewriteMessageFromMatchingSpans:v8 mrRewrittenUtterance:v7];
    if (v13)
    {
      uint64_t v14 = [v9 delegated];
      [v14 setRewrite:v13];
    }
  }
}

+ (unsigned)isExternalMatchingSpan:(id)a3 fromMatcher:(int)a4
{
  id v5 = a3;
  if ([v5 matcherNamesCount])
  {
    uint64_t v6 = 0;
    while (1)
    {
      int v7 = [v5 matcherNamesAtIndex:v6];
      unsigned __int8 v8 = v7 == a4;
      if (v7 == a4) {
        break;
      }
      if ([v5 matcherNamesCount] <= (unint64_t)++v6) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    unsigned __int8 v8 = 0;
  }

  return v8;
}

+ (id)filterAndConvertInternalMatchingSpans:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(v11, "matcherNamesCount", (void)v14) == 1
           && [v11 matcherNamesAtIndex:0] == 2
           || [a1 isInternalMatchingSpan:v11 fromMatcher:7])
          && ![a1 isInternalMatchingSpan:v11 fromMatcher:4])
        {
          uint64_t v12 = [a1 filterAndConvertInternalMatchingSpan:v11];
          [v5 addObject:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

+ (unsigned)isInternalMatchingSpan:(id)a3 fromMatcher:(int)a4
{
  id v5 = a3;
  if ([v5 matcherNamesCount])
  {
    uint64_t v6 = 0;
    while (1)
    {
      int v7 = [v5 matcherNamesAtIndex:v6];
      unsigned __int8 v8 = v7 == a4;
      if (v7 == a4) {
        break;
      }
      if ([v5 matcherNamesCount] <= (unint64_t)++v6) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    unsigned __int8 v8 = 0;
  }

  return v8;
}

+ (id)filterAndConvertInternalMatchingSpan:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263F71D50]);
  id v5 = [v3 input];
  [v4 setInput:v5];

  uint64_t v6 = [v3 label];
  [v4 setLabel:v6];

  objc_msgSend(v4, "setStartTokenIndex:", objc_msgSend(v3, "startTokenIndex"));
  objc_msgSend(v4, "setEndTokenIndex:", objc_msgSend(v3, "endTokenIndex"));
  int v7 = [v3 usoGraph];
  [v4 setUsoGraph:v7];

  [v4 setScore:1.0];
  if ([v3 matcherNamesCount])
  {
    unint64_t v8 = 0;
    do
    {
      unsigned int v9 = [v3 matcherNamesAtIndex:v8] - 2;
      if (v9 > 5) {
        uint64_t v10 = 0;
      }
      else {
        uint64_t v10 = dword_226615B68[v9];
      }
      [v4 addMatcherNames:v10];
      ++v8;
    }
    while ([v3 matcherNamesCount] > v8);
  }

  return v4;
}

+ (id)getPostProcessUserParses:(id)a3 parsesNLv4:(id)a4 parsesCATI:(id)a5 parsesUaaP:(id)a6 parsesPSC:(id)a7 parsesAutoShortcuts:(id)a8 parsesAppendOverrides:(id)a9 parsesSSU:(id)a10 addDebugInfo:(id)a11
{
  uint64_t v11 = +[CDMPostProcessUtils getFederatedParses:a3 parsesNLv4:a4 parsesCATI:a5 parsesUaaP:a6 parsesPSC:a7 parsesAutoShortcuts:a8 parsesAppendOverrides:a9 parsesSSU:a10 addDebugInfo:a11];
  uint64_t v12 = +[CDMPostProcessUtils getCroppedUserParses:v11];

  return v12;
}

+ (id)getPostProcessUserParses:(id)a3 parsesNLv4:(id)a4 parsesCATI:(id)a5 parsesUaaP:(id)a6 addDebugInfo:(id)a7
{
  int v7 = +[CDMPostProcessUtils getFederatedParses:a3 parsesNLv4:a4 parsesCATI:a5 parsesUaaP:a6 parsesPSC:0 parsesAutoShortcuts:0 parsesAppendOverrides:0 parsesSSU:0 addDebugInfo:a7];
  unint64_t v8 = +[CDMPostProcessUtils getCroppedUserParses:v7];

  return v8;
}

+ (id)getPostProcessUserParses:(id)a3 parsesNLv4:(id)a4 parsesCATI:(id)a5 addDebugInfo:(id)a6
{
  uint64_t v6 = +[CDMPostProcessUtils getFederatedParses:a3 parsesNLv4:a4 parsesCATI:a5 parsesUaaP:0 parsesPSC:0 parsesAutoShortcuts:0 parsesAppendOverrides:0 parsesSSU:0 addDebugInfo:a6];
  int v7 = +[CDMPostProcessUtils getCroppedUserParses:v6];

  return v7;
}

+ (id)getPostProcessUserParses:(id)a3
{
  id v3 = a3;
  +[CDMPostProcessUtils populateComparableProbabilityFromProbabilityParses:v3];
  id v4 = +[CDMPostProcessUtils sortParses:v3];

  id v5 = +[CDMPostProcessUtils getCroppedUserParses:v4];

  return v5;
}

+ (id)getCroppedUserParses:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 count];
  if (v4 >= 0xA) {
    uint64_t v5 = 10;
  }
  else {
    uint64_t v5 = v4;
  }
  uint64_t v6 = objc_msgSend(v3, "subarrayWithRange:", 0, v5);

  return v6;
}

+ (id)getFederatedParses:(id)a3 parsesNLv4:(id)a4 parsesCATI:(id)a5 parsesUaaP:(id)a6 parsesPSC:(id)a7 parsesAutoShortcuts:(id)a8 parsesAppendOverrides:(id)a9 parsesSSU:(id)a10 addDebugInfo:(id)a11
{
  id v29 = a3;
  id v31 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = a9;
  id v19 = a10;
  id v30 = a11;
  uint64_t v20 = (objc_class *)MEMORY[0x263EFF980];
  id v21 = a5;
  id v22 = a4;
  id v23 = objc_alloc_init(v20);
  id v24 = objc_alloc_init(MEMORY[0x263EFF980]);
  +[CDMPostProcessUtils populateComparableProbabilityForParsesNLv4:v22 parsesSNLC:v29];
  +[CDMPostProcessUtils splitParses:v22 deviceParses:v23 zeroParses:v24];

  +[CDMPostProcessUtils populateComparableProbabilityParsesCATI:v21];
  +[CDMPostProcessUtils splitParses:v21 deviceParses:v23 zeroParses:v24];

  if (v31)
  {
    +[CDMPostProcessUtils populateComparableProbabilityParsesUaaP:v31];
    +[CDMPostProcessUtils splitParses:v31 deviceParses:v23 zeroParses:v24];
  }
  if (v16)
  {
    +[CDMPostProcessUtils populateComparableProbabilityParsesPSC:v16];
    +[CDMPostProcessUtils splitParses:v16 deviceParses:v23 zeroParses:v24];
  }
  if (v17)
  {
    +[CDMPostProcessUtils populateComparableProbabilityParsesAutoShortcuts:v17];
    +[CDMPostProcessUtils splitParses:v17 deviceParses:v23 zeroParses:v24];
  }
  if (v18)
  {
    +[CDMPostProcessUtils populateComparableProbabilityFromProbabilityParses:v18];
    +[CDMPostProcessUtils splitParses:v18 deviceParses:v23 zeroParses:v24];
  }
  if (v19)
  {
    +[CDMPostProcessUtils populateComparableProbabilityParsesSSU:v19];
    +[CDMPostProcessUtils splitParses:v19 deviceParses:v23 zeroParses:v24];
  }
  +[CDMPostProcessUtils populateComparableProbabilityParsesSNLC:v29 deviceParses:v23];
  uint64_t v25 = +[CDMPostProcessUtils sortParses:v23];
  v26 = (void *)[v25 mutableCopy];

  if (!+[CDMFeatureFlags isAmbiguityRefactorEnabled])
  {
    id v27 = +[CDMPostProcessUtils sortParses:v29];
    [v26 addObjectsFromArray:v27];

    [v26 addObjectsFromArray:v24];
  }
  if (+[CDMUserDefaultsUtils readNLv4MaxNumParses] != 1) {
    [v26 addObjectsFromArray:v24];
  }
  +[CDMPostProcessUtils logParsesRanking:v26 addDebugInfo:v30];

  return v26;
}

+ (void)logParsesRanking:(id)a3 addDebugInfo:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v24 = a4;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithString:@"\n\nFederation ranking order:"];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  obuint64_t j = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v26 objects:v36 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v27;
    uint64_t v10 = 1;
    unint64_t v11 = 0x263F08000uLL;
    uint64_t v12 = v6;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(obj);
        }
        long long v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        long long v15 = *(void **)(v11 + 2880);
        id v16 = [v14 parser];
        uint64_t v17 = [v16 parserId];
        if (v17 >= 0xA)
        {
          objc_msgSend(*(id *)(v11 + 2880), "stringWithFormat:", @"(unknown: %i)", v17);
          id v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v18 = off_2647A4E80[v17];
        }
        [v14 comparableProbability];
        uint64_t v20 = v19;
        [v14 probability];
        id v22 = [v15 stringWithFormat:@"\n%d: %@ probability: %f (%f before calibration)", v10 + i, v18, v20, v21];
        uint64_t v6 = v12;
        [v12 appendString:v22];

        unint64_t v11 = 0x263F08000;
      }
      uint64_t v10 = (v10 + i);
      uint64_t v8 = [obj countByEnumeratingWithState:&v26 objects:v36 count:16];
    }
    while (v8);
  }

  id v23 = CDMLogContext;
  if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v31 = "+[CDMPostProcessUtils logParsesRanking:addDebugInfo:]";
    __int16 v32 = 2112;
    long long v33 = @"summary";
    __int16 v34 = 2114;
    long long v35 = v6;
    _os_log_impl(&dword_2263A0000, v23, OS_LOG_TYPE_DEFAULT, "%s [insights-cdm-%@]:\n%{public}@\n", buf, 0x20u);
  }
  if (v24) {
    [v24 appendString:v6];
  }
}

+ (id)sortParses:(id)a3
{
  return (id)[a3 sortedArrayUsingComparator:&__block_literal_global_644];
}

BOOL __34__CDMPostProcessUtils_sortParses___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 comparableProbability];
  double v6 = v5;
  [v4 comparableProbability];
  double v8 = v7;

  return v6 < v8;
}

+ (void)splitParses:(id)a3 deviceParses:(id)a4 zeroParses:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v10 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v7);
        }
        long long v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        [v14 comparableProbability];
        if (v15 <= 0.0) {
          id v16 = v9;
        }
        else {
          id v16 = v8;
        }
        [v16 addObject:v14];
      }
      uint64_t v11 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }
}

+ (void)populateComparableProbabilityFromProbabilityParses:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        [v8 probability];
        objc_msgSend(v8, "setComparableProbability:");
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

+ (void)populateComparableProbabilityParsesSNLC:(id)a3 deviceParses:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ([a4 count])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "setComparableProbability:", 0.200000003, (void)v11);
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
  else
  {
    +[CDMPostProcessUtils populateComparableProbabilityFromProbabilityParses:v5];
  }
}

+ (void)populateComparableProbabilityParsesSSU:(id)a3
{
  LODWORD(v3) = 1058642330;
  +[CDMPostProcessUtils populateComparableProbabilityParses:a3 threshold:v3];
}

+ (void)populateComparableProbabilityParsesAutoShortcuts:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) setComparableProbability:0.600000024];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

+ (void)populateComparableProbabilityParsesPSC:(id)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v35 = objc_opt_new();
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v4 = v3;
  uint64_t v33 = [v4 countByEnumeratingWithState:&v41 objects:v51 count:16];
  if (!v33)
  {

    uint64_t v5 = 0;
    id v23 = 0;
    goto LABEL_28;
  }
  long long v36 = 0;
  uint64_t v5 = 0;
  obuint64_t j = v4;
  uint64_t v32 = *(void *)v42;
  do
  {
    uint64_t v6 = 0;
    do
    {
      if (*(void *)v42 != v32) {
        objc_enumerationMutation(obj);
      }
      uint64_t v34 = v6;
      uint64_t v7 = *(void **)(*((void *)&v41 + 1) + 8 * v6);
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v8 = objc_msgSend(v7, "userDialogActs", obj);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v37 objects:v50 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v38;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v38 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void **)(*((void *)&v37 + 1) + 8 * i);
            long long v14 = [v13 delegated];
            double v15 = [v14 externalParserId];
            int v16 = [v15 isEqualToString:@"com.apple.search"];

            if (v16)
            {
              id v17 = v7;

              uint64_t v5 = v17;
            }
            else
            {
              long long v18 = [v13 delegated];
              long long v19 = [v18 externalParserId];
              int v20 = [v19 isEqualToString:@"com.apple.search_phase_2"];

              if (v20)
              {
                id v21 = v7;

                long long v36 = v21;
              }
              else
              {
                [v35 addObject:v7];
              }
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v37 objects:v50 count:16];
        }
        while (v10);
      }

      uint64_t v6 = v34 + 1;
    }
    while (v34 + 1 != v33);
    uint64_t v33 = [obj countByEnumeratingWithState:&v41 objects:v51 count:16];
  }
  while (v33);

  if (!v5)
  {
    id v4 = obj;
    id v23 = v36;
    goto LABEL_28;
  }
  id v23 = v36;
  if (!v36
    || ([v5 probability], v22 >= 0.600000024)
    || ([v36 probability], v22 >= 0.600000024)
    || ([v5 probability], v25 = v24, objc_msgSend(v36, "probability"), double v22 = v25 + v26, v22 < 0.600000024))
  {
    id v4 = obj;
LABEL_28:
    LODWORD(v22) = 1058642330;
    +[CDMPostProcessUtils populateComparableProbabilityParses:v4 threshold:v22];
    goto LABEL_29;
  }
  long long v27 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v47 = "+[CDMPostProcessUtils populateComparableProbabilityParsesPSC:]";
    __int16 v48 = 2048;
    uint64_t v49 = 0x3FE3333340000000;
    _os_log_debug_impl(&dword_2263A0000, v27, OS_LOG_TYPE_DEBUG, "%s Combined PSC parses above threshold (%.2f). Populating comparableProbability.", buf, 0x16u);
  }

  v45[0] = v5;
  v45[1] = v36;
  long long v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v45 count:2];
  +[CDMPostProcessUtils populateComparableProbabilityParses:v28 threshold:0.0];

  long long v29 = [v35 allObjects];
  LODWORD(v30) = 1058642330;
  +[CDMPostProcessUtils populateComparableProbabilityParses:v29 threshold:v30];

  id v4 = obj;
LABEL_29:
}

+ (void)populateComparableProbabilityParsesUaaP:(id)a3
{
  LODWORD(v3) = 1058642330;
  +[CDMPostProcessUtils populateComparableProbabilityParses:a3 threshold:v3];
}

+ (void)populateComparableProbabilityParsesCATI:(id)a3
{
  LODWORD(v3) = 1058642330;
  +[CDMPostProcessUtils populateComparableProbabilityParses:a3 threshold:v3];
}

+ (void)populateComparableProbabilityParses:(id)a3 threshold:(float)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    double v9 = a4;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        [v11 probability];
        double v13 = v12;
        double v14 = 0.0;
        if (v13 > v9) {
          objc_msgSend(v11, "probability", 0.0);
        }
        float v15 = v14;
        [v11 setComparableProbability:v15];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }
}

+ (void)populateComparableProbabilityForParsesNLv4:(id)a3 parsesSNLC:(id)a4
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    uint64_t v7 = [v6 firstObject];
    uint64_t v8 = v7;
    if (v7)
    {
      [v7 probability];
      *(float *)&double v9 = 1.0 - v9;
      double v10 = *(float *)&v9;
    }
    else
    {
      uint64_t v11 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v45 = "+[CDMPostProcessUtils populateComparableProbabilityForParsesNLv4:parsesSNLC:]";
        _os_log_error_impl(&dword_2263A0000, v11, OS_LOG_TYPE_ERROR, "%s [ERR]: no SNLC response available in post process node", buf, 0xCu);
      }

      double v10 = 1.0;
    }
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v12 = v5;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v38 objects:v43 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v39;
      float v16 = 0.00000011921;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v39 != v15) {
            objc_enumerationMutation(v12);
          }
          long long v18 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          [v18 probability];
          if (v19 > v16)
          {
            [v18 probability];
            float v16 = v20;
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v38 objects:v43 count:16];
      }
      while (v14);
    }
    else
    {
      float v16 = 0.00000011921;
    }

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v21 = v12;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v34 objects:v42 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v35;
      double v25 = v16;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v35 != v24) {
            objc_enumerationMutation(v21);
          }
          long long v27 = *(void **)(*((void *)&v34 + 1) + 8 * j);
          objc_msgSend(v27, "probability", (void)v34);
          if (v28 != 1.0
            || ([v27 parser],
                long long v29 = objc_claimAutoreleasedReturnValue(),
                int v30 = [v29 algorithm],
                v29,
                double v31 = 1.0,
                v30 != 1))
          {
            [v27 probability];
            float v33 = v10 * (v32 / v25);
            if (v33 <= 0.5) {
              float v33 = 0.0;
            }
            double v31 = v33;
          }
          [v27 setComparableProbability:v31];
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v34 objects:v42 count:16];
      }
      while (v23);
    }
  }
}

+ (BOOL)alignmentSubsumesSpan:(id)a3 alignment:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = [a3 usoGraph];
  uint64_t v7 = [v6 alignments];

  if ([v7 count])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          if (!objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "subsumedBy:", v5, (void)v15))
          {
            BOOL v13 = 0;
            goto LABEL_12;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    BOOL v13 = 1;
LABEL_12:
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

+ (id)getUtteranceAlignmentForIndex:(id)a3 nodeIndex:(int)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = objc_msgSend(a3, "alignments", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v10 nodeIndex] == a4)
        {
          id v11 = v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v11 = 0;
LABEL_11:

  return v11;
}

+ (void)annotateNLUResponse:(id)a3 nluRequest:(id)a4 matchingSpans:(id)a5 tokenChain:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v16 = [v12 parses];
  long long v13 = [v11 currentTurnInput];

  long long v14 = [v13 asrOutputs];
  long long v15 = [v14 firstObject];
  +[CDMPostProcessUtils annotateParses:v16 tokenChain:v9 matchingSpans:v10 asrHypothesis:v15];

  [v12 setParses:v16];
}

+ (id)entityKeyFrom:(id)a3 at:(unint64_t)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v6 = objc_msgSend(v5, "edges", 0);
  id v7 = (id)[v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (!v7) {
    goto LABEL_18;
  }
  uint64_t v8 = *(void *)v21;
  while (2)
  {
    for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
    {
      if (*(void *)v21 != v8) {
        objc_enumerationMutation(v6);
      }
      id v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
      if ([v10 toIndex] == a4)
      {
        id v7 = v10;

        if (v7)
        {
          uint64_t v6 = [v5 nodes];
          if (![v6 count]) {
            goto LABEL_18;
          }
          id v11 = [v5 nodes];
          if ([v11 count] <= a4)
          {
            long long v17 = 0;
LABEL_21:

            goto LABEL_22;
          }
          unsigned int v12 = [v7 fromIndex];
          long long v13 = [v5 nodes];
          unint64_t v14 = [v13 count];

          if (v14 > v12)
          {
            long long v15 = [v5 nodes];
            uint64_t v6 = [v15 objectAtIndexedSubscript:a4];

            id v16 = [v5 nodes];
            id v11 = objc_msgSend(v16, "objectAtIndexedSubscript:", objc_msgSend(v7, "fromIndex"));

            long long v17 = 0;
            if (v6 && v11)
            {
              uint64_t v18 = [v7 label];
              if (v18) {
                long long v17 = -[EntityKey initWithElementId:edgeElementId:parentElementId:]([EntityKey alloc], "initWithElementId:edgeElementId:parentElementId:", [v6 usoElementId], objc_msgSend(v18, "usoElementId"), objc_msgSend(v11, "usoElementId"));
              }
              else {
                long long v17 = 0;
              }
            }
            goto LABEL_21;
          }
        }
        long long v17 = 0;
        goto LABEL_23;
      }
    }
    id v7 = (id)[v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v7) {
      continue;
    }
    break;
  }
LABEL_18:
  long long v17 = 0;
LABEL_22:

LABEL_23:
  return v17;
}

+ (void)annotateUserParses:(id)a3 correctionOutcome:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v10++) setCorrectionOutcome:v6];
      }
      while (v8 != v10);
      uint64_t v8 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

+ (id)getCorrectionOutcomeFromUserParses:(id)a3 ccqrCorrectionOutcome:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    int v9 = 0;
    uint64_t v10 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v5);
        }
        long long v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        [v12 comparableProbability];
        if (v13 > 0.0)
        {
          long long v23 = 0u;
          long long v24 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          long long v14 = objc_msgSend(v12, "userDialogActs", 0);
          uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v22;
            do
            {
              for (uint64_t j = 0; j != v16; ++j)
              {
                if (*(void *)v22 != v17) {
                  objc_enumerationMutation(v14);
                }
                v9 |= [*(id *)(*((void *)&v21 + 1) + 8 * j) hasRejected];
              }
              uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
            }
            while (v16);
          }
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v8);
  }
  else
  {
    LOBYTE(v9) = 0;
  }
  if [v6 type] == 1 || (v9)
  {
    double v19 = objc_opt_new();
    [v19 setType:1];
  }
  else
  {
    double v19 = 0;
  }

  return v19;
}

+ (void)annotateParses:(id)a3 tokenChain:(id)a4 matchingSpans:(id)a5 asrHypothesis:(id)a6
{
  uint64_t v107 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v74 = a4;
  id v63 = a5;
  id v11 = a6;
  long long v12 = [a1 usoGraphs:v10];
  if ([v12 count])
  {
    id v56 = v10;
    v57 = v12;
    id v13 = objc_alloc(MEMORY[0x263EFF9A0]);
    [v11 asrTokens];
    long long v14 = v58 = v11;
    uint64_t v15 = objc_msgSend(v13, "initWithCapacity:", objc_msgSend(v14, "count"));

    id v16 = objc_alloc(MEMORY[0x263EFF9A0]);
    uint64_t v17 = [v58 asrTokens];
    uint64_t v18 = objc_msgSend(v16, "initWithCapacity:", objc_msgSend(v17, "count"));

    if (v58)
    {
      long long v97 = 0u;
      long long v98 = 0u;
      long long v95 = 0u;
      long long v96 = 0u;
      double v19 = [v58 asrTokens];
      uint64_t v20 = [v19 countByEnumeratingWithState:&v95 objects:v106 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v96;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v96 != v22) {
              objc_enumerationMutation(v19);
            }
            long long v24 = *(void **)(*((void *)&v95 + 1) + 8 * i);
            long long v25 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v24, "beginIndex"));
            [v15 setObject:v24 forKeyedSubscript:v25];

            long long v26 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v24, "endIndex"));
            [v18 setObject:v24 forKeyedSubscript:v26];
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v95 objects:v106 count:16];
        }
        while (v21);
      }
      id v27 = v74;
    }
    else
    {
      double v19 = CDMOSLoggerForCategory(0);
      id v27 = v74;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v105 = "+[CDMPostProcessUtils annotateParses:tokenChain:matchingSpans:asrHypothesis:]";
        _os_log_debug_impl(&dword_2263A0000, v19, OS_LOG_TYPE_DEBUG, "%s Missing ASR Hypothesis, unable to add timing information to alignments", buf, 0xCu);
      }
    }

    v67 = [a1 spanIndexDict:v63 tokenChain:v27];
    long long v91 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    obuint64_t j = v57;
    uint64_t v61 = [obj countByEnumeratingWithState:&v91 objects:v103 count:16];
    if (!v61)
    {
      v69 = 0;
      v71 = 0;
      goto LABEL_75;
    }
    v69 = 0;
    v71 = 0;
    uint64_t v60 = *(void *)v92;
    while (1)
    {
      uint64_t v28 = 0;
      do
      {
        if (*(void *)v92 != v60) {
          objc_enumerationMutation(obj);
        }
        uint64_t v62 = v28;
        long long v29 = *(void **)(*((void *)&v91 + 1) + 8 * v28);
        v66 = [a1 getGroupIndexDict:v29];
        v64 = +[IdentifierGroupingUtils getInterpretationGroupMax:v29];
        v70 = [MEMORY[0x263EFF980] array];
        v65 = [MEMORY[0x263EFF980] array];
        long long v87 = 0u;
        long long v88 = 0u;
        long long v89 = 0u;
        long long v90 = 0u;
        id v68 = [v29 alignments];
        uint64_t v73 = [v68 countByEnumeratingWithState:&v87 objects:v102 count:16];
        if (v73)
        {
          uint64_t v72 = *(void *)v88;
          do
          {
            uint64_t v30 = 0;
            do
            {
              if (*(void *)v88 != v72) {
                objc_enumerationMutation(v68);
              }
              uint64_t v31 = *(void **)(*((void *)&v87 + 1) + 8 * v30);
              [a1 addNormalizedValuesTo:v29 alignedWith:v31 from:v27];
              long long v85 = 0u;
              long long v86 = 0u;
              long long v83 = 0u;
              long long v84 = 0u;
              double v32 = [v31 spans];
              uint64_t v33 = [v32 countByEnumeratingWithState:&v83 objects:v101 count:16];
              if (v33)
              {
                uint64_t v34 = v33;
                uint64_t v35 = *(void *)v84;
                do
                {
                  for (uint64_t j = 0; j != v34; ++j)
                  {
                    if (*(void *)v84 != v35) {
                      objc_enumerationMutation(v32);
                    }
                    [a1 copyASRTimingInfoToUtteranceSpan:*(void *)(*((void *)&v83 + 1) + 8 * j) startIndexTokenDict:v15 endIndexTokenDict:v18];
                  }
                  uint64_t v34 = [v32 countByEnumeratingWithState:&v83 objects:v101 count:16];
                }
                while (v34);
              }

              long long v37 = +[CDMPostProcessUtils entityKeyFrom:at:](CDMPostProcessUtils, "entityKeyFrom:at:", v29, [v31 nodeIndex]);
              if (!v37) {
                goto LABEL_43;
              }
              long long v38 = +[EntityKey userEntity];
              int v39 = [v38 isEqualToEntityKey:v37];

              if (v39)
              {
                if (!v71)
                {
                  v71 = [a1 getAlignedIdentifierSpans:v63];
                }
                if (!+[CDMFeatureFlags isUsoEntitySpanEnabled])
                {
                  [a1 createIdentifierGroups:v70 spans:v71 parseEntityKey:v37 parseAlignment:v31 interpretationGroupCurrentMax:v64];
LABEL_43:
                  id v27 = v74;
                  goto LABEL_44;
                }
                id v27 = v74;
                uint64_t v40 = (uint64_t)v69;
                if (!v69)
                {
                  uint64_t v40 = [a1 getAlignedEntitySpanSpans:v63];
                }
                v69 = (void *)v40;
                [a1 copySubsumedSpanEntitySpan:v65 spans:v40 parseEntityKey:v37 utteranceAlignment:v31 tokenChain:v74];
                if (+[CDMFeatureFlags isInterpretationGroupFilteringEnabled])
                {
                  [a1 copyAlignedSpanIdentifierForSameType:v70 spanIndexDict:v67 utteranceAlignment:v31 entityKey:v37 groupIndexDict:v66 tokenChain:v74];
                }
                else
                {
                  [a1 createIdentifierGroups:v70 spans:v71 parseEntityKey:v37 parseAlignment:v31 interpretationGroupCurrentMax:v64];
                }
              }
              else
              {
                id v27 = v74;
                [a1 copyAlignedSpanIdentifierForSameType:v70 spanIndexDict:v67 utteranceAlignment:v31 entityKey:v37 groupIndexDict:v66 tokenChain:v74];
                if (!+[CDMFeatureFlags isUsoEntitySpanEnabled]) {
                  goto LABEL_44;
                }
                long long v41 = +[EntityKey calendarEventName];
                if ([v41 isEqualToEntityKey:v37])
                {
                }
                else
                {
                  long long v42 = +[EntityKey personEntity];
                  int v43 = [v42 isEqualToEntityKey:v37];

                  id v27 = v74;
                  if (!v43)
                  {
                    [a1 copyAlignedSpanEntitySpanForSameType:v65 spanIndexDict:v67 utteranceAlignment:v31 entityKey:v37 tokenChain:v74];
                    goto LABEL_44;
                  }
                }
                uint64_t v44 = (uint64_t)v69;
                if (!v69)
                {
                  uint64_t v44 = [a1 getAlignedEntitySpanSpans:v63];
                }
                v69 = (void *)v44;
                [a1 copySubsumedSpanEntitySpan:v65 spans:v44 parseEntityKey:v37 utteranceAlignment:v31 tokenChain:v27];
              }
LABEL_44:

              ++v30;
            }
            while (v30 != v73);
            uint64_t v45 = [v68 countByEnumeratingWithState:&v87 objects:v102 count:16];
            uint64_t v73 = v45;
          }
          while (v45);
        }

        [a1 copyMentionResolverSpanIdentifiers:v70 fromMatchingSpans:v63 toParseGraph:v29];
        if (+[CDMFeatureFlags isUsoEntitySpanEnabled]) {
          [a1 copyMentionResolverSpanEntitySpans:v65 fromMatchingSpans:v63 toParseGraph:v29];
        }
        long long v81 = 0u;
        long long v82 = 0u;
        long long v79 = 0u;
        long long v80 = 0u;
        id v46 = v70;
        uint64_t v47 = [v46 countByEnumeratingWithState:&v79 objects:v100 count:16];
        if (v47)
        {
          uint64_t v48 = v47;
          uint64_t v49 = *(void *)v80;
          do
          {
            for (uint64_t k = 0; k != v48; ++k)
            {
              if (*(void *)v80 != v49) {
                objc_enumerationMutation(v46);
              }
              [v29 addIdentifiers:*(void *)(*((void *)&v79 + 1) + 8 * k)];
            }
            uint64_t v48 = [v46 countByEnumeratingWithState:&v79 objects:v100 count:16];
          }
          while (v48);
        }

        if (+[CDMFeatureFlags isUsoEntitySpanEnabled])
        {
          long long v77 = 0u;
          long long v78 = 0u;
          long long v75 = 0u;
          long long v76 = 0u;
          id v51 = v65;
          uint64_t v52 = [v51 countByEnumeratingWithState:&v75 objects:v99 count:16];
          if (v52)
          {
            uint64_t v53 = v52;
            uint64_t v54 = *(void *)v76;
            do
            {
              for (uint64_t m = 0; m != v53; ++m)
              {
                if (*(void *)v76 != v54) {
                  objc_enumerationMutation(v51);
                }
                [v29 addSpans:*(void *)(*((void *)&v75 + 1) + 8 * m)];
              }
              uint64_t v53 = [v51 countByEnumeratingWithState:&v75 objects:v99 count:16];
            }
            while (v53);
          }
        }
        uint64_t v28 = v62 + 1;
        id v27 = v74;
      }
      while (v62 + 1 != v61);
      uint64_t v61 = [obj countByEnumeratingWithState:&v91 objects:v103 count:16];
      if (!v61)
      {
LABEL_75:

        id v10 = v56;
        long long v12 = v57;
        id v11 = v58;
        break;
      }
    }
  }
}

+ (id)getAlignedEntitySpanSpans:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v10, "hasUsoGraph", (void)v15))
        {
          id v11 = [v10 usoGraph];
          if ([v11 alignmentsCount])
          {
            long long v12 = [v10 usoGraph];
            uint64_t v13 = [v12 spansCount];

            if (v13) {
              [v4 addObject:v10];
            }
          }
          else
          {
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)getAlignedIdentifierSpans:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v10, "hasUsoGraph", (void)v15))
        {
          id v11 = [v10 usoGraph];
          if ([v11 alignmentsCount])
          {
            long long v12 = [v10 usoGraph];
            uint64_t v13 = [v12 identifiersCount];

            if (v13) {
              [v4 addObject:v10];
            }
          }
          else
          {
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (void)createIdentifierGroups:(id)a3 spans:(id)a4 parseEntityKey:(id)a5 parseAlignment:(id)a6 interpretationGroupCurrentMax:(id)a7
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  long long v16 = [v14 spans];
  uint64_t v17 = [v16 count];

  if (v17)
  {
    id v30 = v15;
    id v32 = v11;
    uint64_t v34 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", 3 * objc_msgSend(v12, "count"));
    int v39 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", 3 * objc_msgSend(v12, "count"));
    long long v38 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", 3 * objc_msgSend(v12, "count"));
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v31 = v12;
    obuint64_t j = v12;
    uint64_t v36 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
    if (v36)
    {
      uint64_t v35 = *(void *)v46;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v46 != v35) {
            objc_enumerationMutation(obj);
          }
          uint64_t v37 = v18;
          double v19 = *(void **)(*((void *)&v45 + 1) + 8 * v18);
          long long v41 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          uint64_t v20 = [v19 usoGraph];
          uint64_t v21 = [v20 alignments];

          uint64_t v22 = [v21 countByEnumeratingWithState:&v41 objects:v49 count:16];
          if (v22)
          {
            uint64_t v23 = v22;
            uint64_t v24 = *(void *)v42;
            while (2)
            {
              for (uint64_t i = 0; i != v23; ++i)
              {
                if (*(void *)v42 != v24) {
                  objc_enumerationMutation(v21);
                }
                long long v26 = *(void **)(*((void *)&v41 + 1) + 8 * i);
                if ([v26 subsumedBy:v14])
                {
                  id v27 = [v19 usoGraph];
                  uint64_t v28 = +[CDMPostProcessUtils entityKeyFrom:at:](CDMPostProcessUtils, "entityKeyFrom:at:", v27, [v26 nodeIndex]);

                  if ([v28 isEqualToEntityKey:v13])
                  {
                    if ([a1 hasTagNamespace:v19])
                    {
                      [v34 addObject:v19];

                      goto LABEL_21;
                    }
                    [v39 addObject:v26];
                    long long v29 = [MEMORY[0x263F08D40] valueWithNonretainedObject:v26];
                    [v38 setObject:v19 forKeyedSubscript:v29];
                  }
                }
              }
              uint64_t v23 = [v21 countByEnumeratingWithState:&v41 objects:v49 count:16];
              if (v23) {
                continue;
              }
              break;
            }
          }
LABEL_21:

          uint64_t v18 = v37 + 1;
        }
        while (v37 + 1 != v36);
        uint64_t v36 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
      }
      while (v36);
    }

    id v11 = v32;
    id v15 = v30;
    +[IdentifierGroupingUtils createIdentifierGroups:alignmentSpanDict:identifiers:nodeIndex:interpretationGroupCurrentMax:tagSpans:](IdentifierGroupingUtils, "createIdentifierGroups:alignmentSpanDict:identifiers:nodeIndex:interpretationGroupCurrentMax:tagSpans:", v39, v38, v32, [v14 nodeIndex], v30, v34);

    id v12 = v31;
  }
}

+ (BOOL)hasTagNamespace:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v3 = [a3 usoGraph];
  id v4 = [v3 identifiers];

  obuint64_t j = v4;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    uint64_t v8 = *MEMORY[0x263F73838];
    uint64_t v9 = *MEMORY[0x263F73840];
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v12 = [v11 namespaceA];
        id v13 = [v12 value];
        if ([v13 isEqualToString:v8])
        {

LABEL_13:
          BOOL v17 = 1;
          goto LABEL_14;
        }
        id v14 = [v11 namespaceA];
        id v15 = [v14 value];
        char v16 = [v15 isEqualToString:v9];

        if (v16) {
          goto LABEL_13;
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      BOOL v17 = 0;
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v17 = 0;
  }
LABEL_14:

  return v17;
}

+ (void)addNormalizedValuesTo:(id)a3 alignedWith:(id)a4 from:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  id v10 = [a3 nodes];
  id v11 = objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v8, "nodeIndex"));

  if ([v11 hasStringPayload])
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v12 = objc_msgSend(v8, "spans", 0);
    uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          BOOL v17 = objc_msgSend(a1, "normalizedPayloadsFrom:to:within:", objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v16), "startIndex"), objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v16), "endIndex"), v9);
          uint64_t v18 = (void *)[v17 mutableCopy];
          [v11 setNormalizedStringPayloads:v18];

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v14);
    }
  }
}

+ (id)normalizedPayloadsFrom:(int64_t)a3 to:(int64_t)a4 within:(id)a5
{
  id v7 = a5;
  id v8 = objc_alloc(MEMORY[0x263EFF980]);
  id v9 = [v7 tokens];
  id v10 = objc_msgSend(v8, "initWithCapacity:", objc_msgSend(v9, "count"));

  id v11 = [v7 tokens];
  uint64_t v12 = [v11 count];

  if (v12)
  {
    unint64_t v13 = 0;
    char v14 = 0;
    do
    {
      uint64_t v15 = [v7 tokens];
      uint64_t v16 = [v15 objectAtIndexedSubscript:v13];

      v14 |= (int)[v16 begin] == a3;
      if (v14)
      {
        BOOL v17 = [v16 normalizedValues];
        [v10 addObjectsFromArray:v17];
      }
      int64_t v18 = (int)[v16 end];

      if (v18 >= a4) {
        break;
      }
      ++v13;
      long long v19 = [v7 tokens];
      unint64_t v20 = [v19 count];
    }
    while (v20 > v13);
  }

  return v10;
}

+ (void)updateIndexesForSignificantTokensFrom:(unsigned int *)a3 to:(unsigned int *)a4 tokenChain:(id)a5 entityKey:(id)a6
{
  id v24 = a5;
  id v9 = a6;
  id v10 = +[EntityKey currencyName];
  int v11 = [v10 isEqualToEntityKey:v9];
  if (a3 && v11)
  {

    if (!a4) {
      goto LABEL_25;
    }
    uint64_t v12 = [v24 tokens];
    unint64_t v13 = (void *)[v12 count];

    if (v13)
    {
      unint64_t v14 = 0;
      unint64_t v13 = 0;
      id v10 = 0;
      uint64_t v15 = v24;
      do
      {
        uint64_t v16 = [v15 tokens];
        BOOL v17 = [v16 objectAtIndexedSubscript:v14];

        if (!v10)
        {
          if ([v17 begin] >= *a3 && objc_msgSend(v17, "isSignificant")) {
            id v10 = v17;
          }
          else {
            id v10 = 0;
          }
        }
        unsigned int v18 = [v17 end];
        unsigned int v19 = *a4;
        BOOL v20 = v18 > *a4 || v10 == 0;
        if (!v20 && [v17 isSignificant])
        {
          id v21 = v17;

          unint64_t v13 = v21;
        }

        if (v18 > v19) {
          break;
        }
        ++v14;
        long long v22 = [v24 tokens];
        unint64_t v23 = [v22 count];

        uint64_t v15 = v24;
      }
      while (v14 < v23);
      if (v10 && v13)
      {
        *a3 = [v10 begin];
        *a4 = [v13 end];
      }
    }
    else
    {
      id v10 = 0;
    }
  }
LABEL_25:
}

+ (id)significantTokenCountFrom:(unsigned int)a3 to:(unsigned int)a4 within:(id)a5
{
  LODWORD(v6) = a3;
  id v7 = a5;
  id v8 = [v7 tokens];
  unint64_t v9 = [v8 count];

  if (v9 <= v6 || v6 >= a4)
  {
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = 0;
    unint64_t v6 = v6;
    uint64_t v11 = a4;
    do
    {
      uint64_t v12 = [v7 tokens];
      unint64_t v13 = [v12 count];

      if (v6 >= v13) {
        break;
      }
      unint64_t v14 = [v7 tokens];
      uint64_t v15 = [v14 objectAtIndexedSubscript:v6];
      int v16 = [v15 isSignificant];

      uint64_t v10 = (v10 + v16);
      ++v6;
    }
    while (v11 != v6);
  }
  id v17 = objc_alloc_init(MEMORY[0x263F71C80]);
  [v17 setValue:v10];

  return v17;
}

+ (id)getSignificantTokenCountFrom:(unsigned int)a3 to:(unsigned int)a4 within:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v6 = *(void *)&a3;
  id v8 = (objc_class *)MEMORY[0x263F71D58];
  id v9 = a5;
  id v10 = objc_alloc_init(v8);
  [v10 setKey:@"significantTokenCount"];
  uint64_t v11 = [a1 significantTokenCountFrom:v6 to:v5 within:v9];

  [v10 setValueInt:v11];
  return v10;
}

+ (void)copyASRTimingInfoToUtteranceSpan:(id)a3 startIndexTokenDict:(id)a4 endIndexTokenDict:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = NSNumber;
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = objc_msgSend(v8, "numberWithInt:", objc_msgSend(v7, "startIndex"));
  uint64_t v12 = [v10 objectForKeyedSubscript:v11];

  if (v12)
  {
    objc_msgSend(v7, "setStartMilliSeconds:", objc_msgSend(v12, "startMilliSeconds"));
  }
  else
  {
    unint64_t v13 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      int v18 = 136315394;
      unsigned int v19 = "+[CDMPostProcessUtils copyASRTimingInfoToUtteranceSpan:startIndexTokenDict:endIndexTokenDict:]";
      __int16 v20 = 1024;
      int v21 = [v7 startIndex];
      _os_log_debug_impl(&dword_2263A0000, v13, OS_LOG_TYPE_DEBUG, "%s Missing ASR Token for alignment with start index: %d", (uint8_t *)&v18, 0x12u);
    }
  }
  unint64_t v14 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v7, "endIndex"));
  uint64_t v15 = [v9 objectForKeyedSubscript:v14];

  if (v15)
  {
    objc_msgSend(v7, "setEndMilliSeconds:", objc_msgSend(v15, "endMilliSeconds"));
  }
  else
  {
    int v16 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      int v17 = [v7 endIndex];
      int v18 = 136315394;
      unsigned int v19 = "+[CDMPostProcessUtils copyASRTimingInfoToUtteranceSpan:startIndexTokenDict:endIndexTokenDict:]";
      __int16 v20 = 1024;
      int v21 = v17;
      _os_log_debug_impl(&dword_2263A0000, v16, OS_LOG_TYPE_DEBUG, "%s Missing ASR Token for alignment with end index: %d", (uint8_t *)&v18, 0x12u);
    }
  }
}

+ (void)copyMentionResolverSpanEntitySpans:(id)a3 fromMatchingSpans:(id)a4 toParseGraph:(id)a5
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  id v59 = a3;
  id v49 = a4;
  id v8 = a5;
  id v9 = [v8 nodes];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    unint64_t v60 = 0;
    id v50 = v8;
    do
    {
      uint64_t v11 = [v8 nodes];
      uint64_t v12 = [v11 objectAtIndexedSubscript:v60];

      uint64_t v51 = v12;
      int v13 = [v12 usoElementId];
      if (v13 > 1317)
      {
        if (v13 == 1318)
        {
          unint64_t v14 = CDMOSLoggerForCategory(0);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315138;
            uint64_t v72 = "+[CDMPostProcessUtils copyMentionResolverSpanEntitySpans:fromMatchingSpans:toParseGraph:]";
            uint64_t v15 = v14;
            int v16 = "%s Found node of type Common_ListPosition";
LABEL_60:
            _os_log_debug_impl(&dword_2263A0000, v15, OS_LOG_TYPE_DEBUG, v16, buf, 0xCu);
          }
LABEL_18:

          int v56 = 0;
          log = 0;
LABEL_19:
          long long v69 = 0u;
          long long v70 = 0u;
          long long v67 = 0u;
          long long v68 = 0u;
          id v19 = v49;
          uint64_t v20 = [v19 countByEnumeratingWithState:&v67 objects:v76 count:16];
          if (!v20) {
            goto LABEL_50;
          }
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v68;
          uint64_t v53 = *(void *)v68;
          id v54 = v19;
LABEL_21:
          uint64_t v23 = 0;
          uint64_t v55 = v21;
          while (1)
          {
            if (*(void *)v68 != v22) {
              objc_enumerationMutation(v19);
            }
            id v24 = *(void **)(*((void *)&v67 + 1) + 8 * v23);
            if ([a1 isInternalMatchingSpan:v24 fromMatcher:7])
            {
              if ([v24 hasUsoGraph]
                && (!v56 || [a1 alignmentSubsumesSpan:v24 alignment:log]))
              {
                break;
              }
            }
LABEL_48:
            if (++v23 == v21)
            {
              uint64_t v21 = [v19 countByEnumeratingWithState:&v67 objects:v76 count:16];
              if (!v21)
              {
LABEL_50:

                goto LABEL_51;
              }
              goto LABEL_21;
            }
          }
          uint64_t v57 = v23;
          long long v65 = 0u;
          long long v66 = 0u;
          long long v63 = 0u;
          long long v64 = 0u;
          uint64_t v25 = [v24 usoGraph];
          long long v26 = [v25 spans];

          uint64_t v27 = [v26 countByEnumeratingWithState:&v63 objects:v75 count:16];
          if (!v27) {
            goto LABEL_47;
          }
          uint64_t v28 = v27;
          long long v29 = v24;
          uint64_t v30 = *(void *)v64;
          uint64_t v61 = *(void *)v64;
          v58 = v26;
          while (2)
          {
            uint64_t v31 = 0;
            uint64_t v62 = v28;
LABEL_31:
            if (*(void *)v64 != v30) {
              objc_enumerationMutation(v26);
            }
            id v32 = *(void **)(*((void *)&v63 + 1) + 8 * v31);
            uint64_t v33 = [v32 nodeIndex];
            uint64_t v34 = [v29 usoGraph];
            LOBYTE(v33) = [a1 hasEntityEdgeTo:v33 inGraph:v34];

            if (v33)
            {
              uint64_t v35 = objc_alloc_init(MEMORY[0x263F71DA0]);
              [v32 copyTo:v35];
              [v35 setNodeIndex:v60];
              uint64_t v36 = [v29 internalSpanData];
              uint64_t v37 = v32;
              if ([v36 hasMentionResolverSpanData])
              {
                long long v38 = [v29 internalSpanData];
                int v39 = [v38 mentionResolverSpanData];
                int v40 = [v39 hasJointScore];

                long long v26 = v58;
                if (v40)
                {
                  long long v41 = objc_alloc_init(MEMORY[0x263F71C78]);
                  long long v42 = [v29 internalSpanData];
                  long long v43 = [v42 mentionResolverSpanData];
                  [v43 jointScore];
                  *(float *)&double v44 = v44;
                  [v41 setValue:v44];

                  id v45 = objc_alloc_init(MEMORY[0x263F71CE0]);
                  [v45 setMatchScore:v41];
                  [v35 setMatchInfo:v45];

                  goto LABEL_42;
                }
              }
              else
              {
              }
              long long v41 = CDMOSLoggerForCategory(0);
              if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315138;
                uint64_t v72 = "+[CDMPostProcessUtils copyMentionResolverSpanEntitySpans:fromMatchingSpans:toParseGraph:]";
                _os_log_impl(&dword_2263A0000, v41, OS_LOG_TYPE_INFO, "%s [WARN]: No joint model score found in mentionResolverSpanData, copying from identifier", buf, 0xCu);
              }
LABEL_42:
              uint64_t v30 = v61;
              uint64_t v28 = v62;

              [v35 setSourceComponent:3];
              long long v46 = CDMOSLoggerForCategory(0);
              if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136315394;
                uint64_t v72 = "+[CDMPostProcessUtils copyMentionResolverSpanEntitySpans:fromMatchingSpans:toParseGraph:]";
                __int16 v73 = 2112;
                id v74 = v37;
                _os_log_debug_impl(&dword_2263A0000, v46, OS_LOG_TYPE_DEBUG, "%s Found matching UsoEntitySpan from MRR_MATCHER span. Copying over UsoEntitySpan. UsoEntitySpan: %@", buf, 0x16u);
              }

              [v59 addObject:v35];
            }
            else
            {
              uint64_t v35 = CDMOSLoggerForCategory(0);
              if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136315394;
                uint64_t v72 = "+[CDMPostProcessUtils copyMentionResolverSpanEntitySpans:fromMatchingSpans:toParseGraph:]";
                __int16 v73 = 2112;
                id v74 = v32;
                _os_log_debug_impl(&dword_2263A0000, v35, OS_LOG_TYPE_DEBUG, "%s Skipping copy of UsoEntitySpan from MRR_MATCHER span. UsoEntitySpan is not attached to a node with a entity edge. UsoEntitySpan: %@", buf, 0x16u);
              }
            }

            if (v28 == ++v31)
            {
              uint64_t v28 = [v26 countByEnumeratingWithState:&v63 objects:v75 count:16];
              if (!v28)
              {
LABEL_47:

                uint64_t v22 = v53;
                id v19 = v54;
                uint64_t v21 = v55;
                uint64_t v23 = v57;
                goto LABEL_48;
              }
              continue;
            }
            goto LABEL_31;
          }
        }
        id v8 = v50;
        if (v13 == 2631)
        {
          unint64_t v14 = CDMOSLoggerForCategory(0);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315138;
            uint64_t v72 = "+[CDMPostProcessUtils copyMentionResolverSpanEntitySpans:fromMatchingSpans:toParseGraph:]";
            uint64_t v15 = v14;
            int v16 = "%s Found node of type Common_SpatialPosition";
            goto LABEL_60;
          }
          goto LABEL_18;
        }
      }
      else if (v13 == 1206)
      {
        BOOL v17 = +[CDMUserDefaultsUtils isAttachMDMRSpantoStringPayloadsEnabled];
        log = CDMOSLoggerForCategory(0);
        BOOL v18 = os_log_type_enabled(log, OS_LOG_TYPE_DEBUG);
        if (v17)
        {
          if (v18)
          {
            *(_DWORD *)buf = 136315138;
            uint64_t v72 = "+[CDMPostProcessUtils copyMentionResolverSpanEntitySpans:fromMatchingSpans:toParseGraph:]";
            _os_log_debug_impl(&dword_2263A0000, log, OS_LOG_TYPE_DEBUG, "%s Found node of type ENTITY_PRIMITIVE_STRING_ENTITY", buf, 0xCu);
          }

          id v8 = v50;
          log = [a1 getUtteranceAlignmentForIndex:v50 nodeIndex:v60];
          if (log)
          {
            int v56 = 1;
            goto LABEL_19;
          }
          log = CDMOSLoggerForCategory(0);
          if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315138;
            uint64_t v72 = "+[CDMPostProcessUtils copyMentionResolverSpanEntitySpans:fromMatchingSpans:toParseGraph:]";
            _os_log_debug_impl(&dword_2263A0000, log, OS_LOG_TYPE_DEBUG, "%s Parse alignment for string payload not found. Dont proceed", buf, 0xCu);
          }
        }
        else
        {
          if (v18)
          {
            *(_DWORD *)buf = 136315138;
            uint64_t v72 = "+[CDMPostProcessUtils copyMentionResolverSpanEntitySpans:fromMatchingSpans:toParseGraph:]";
            _os_log_debug_impl(&dword_2263A0000, log, OS_LOG_TYPE_DEBUG, "%s MDMR - Found node of type ENTITY_PRIMITIVE_STRING_ENTITY but user defaults off dont proceed", buf, 0xCu);
          }
LABEL_51:
          id v8 = v50;
        }
      }
      else
      {
        id v8 = v50;
        if (v13 == 1282)
        {
          unint64_t v14 = CDMOSLoggerForCategory(0);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315138;
            uint64_t v72 = "+[CDMPostProcessUtils copyMentionResolverSpanEntitySpans:fromMatchingSpans:toParseGraph:]";
            uint64_t v15 = v14;
            int v16 = "%s Found node of type Common_ReferenceType";
            goto LABEL_60;
          }
          goto LABEL_18;
        }
      }

      long long v47 = [v8 nodes];
      unint64_t v48 = [v47 count];

      ++v60;
    }
    while (v48 > v60);
  }
}

+ (void)copyMentionResolverSpanIdentifiers:(id)a3 fromMatchingSpans:(id)a4 toParseGraph:(id)a5
{
  uint64_t v86 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v57 = a4;
  id v9 = a5;
  uint64_t v10 = [v9 nodes];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    uint64_t v12 = 0;
    id v59 = v9;
    do
    {
      int v13 = [v9 nodes];
      uint64_t v66 = v12;
      unint64_t v14 = [v13 objectAtIndexedSubscript:v12];

      v58 = v14;
      int v15 = [v14 usoElementId];
      if (v15 > 1317)
      {
        if (v15 == 1318)
        {
          int v16 = CDMOSLoggerForCategory(0);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315138;
            long long v81 = "+[CDMPostProcessUtils copyMentionResolverSpanIdentifiers:fromMatchingSpans:toParseGraph:]";
            BOOL v17 = v16;
            BOOL v18 = "%s Found node of type Common_ListPosition";
LABEL_66:
            _os_log_debug_impl(&dword_2263A0000, v17, OS_LOG_TYPE_DEBUG, v18, buf, 0xCu);
          }
LABEL_18:

          int v21 = 0;
          log = 0;
LABEL_19:
          long long v78 = 0u;
          long long v79 = 0u;
          long long v76 = 0u;
          long long v77 = 0u;
          id v22 = v57;
          uint64_t v23 = [v22 countByEnumeratingWithState:&v76 objects:v85 count:16];
          if (!v23) {
            goto LABEL_56;
          }
          uint64_t v24 = v23;
          int v67 = 0;
          uint64_t v25 = *(void *)v77;
          int v62 = v21;
          uint64_t v60 = *(void *)v77;
          id v61 = v22;
LABEL_21:
          uint64_t v26 = 0;
          uint64_t v64 = v24;
          while (1)
          {
            if (*(void *)v77 != v25) {
              objc_enumerationMutation(v22);
            }
            uint64_t v65 = v26;
            uint64_t v27 = *(void **)(*((void *)&v76 + 1) + 8 * v26);
            if ([a1 isInternalMatchingSpan:v27 fromMatcher:7])
            {
              if ([v27 hasUsoGraph]
                && (!v21 || [a1 alignmentSubsumesSpan:v27 alignment:log]))
              {
                break;
              }
            }
LABEL_54:
            uint64_t v26 = v65 + 1;
            if (v65 + 1 == v24)
            {
              uint64_t v24 = [v22 countByEnumeratingWithState:&v76 objects:v85 count:16];
              if (!v24)
              {
LABEL_56:

                goto LABEL_57;
              }
              goto LABEL_21;
            }
          }
          long long v74 = 0u;
          long long v75 = 0u;
          long long v72 = 0u;
          long long v73 = 0u;
          uint64_t v28 = [v27 usoGraph];
          long long v29 = [v28 identifiers];

          uint64_t v71 = [v29 countByEnumeratingWithState:&v72 objects:v84 count:16];
          if (!v71)
          {

            goto LABEL_54;
          }
          unsigned int v70 = 0;
          char v30 = 0;
          long long v68 = v27;
          uint64_t v69 = *(void *)v73;
          uint64_t v31 = v66;
          id v32 = v29;
          while (2)
          {
            uint64_t v33 = 0;
LABEL_31:
            if (*(void *)v73 != v69) {
              objc_enumerationMutation(v32);
            }
            uint64_t v34 = *(void **)(*((void *)&v72 + 1) + 8 * v33);
            uint64_t v35 = [v34 nodeIndex];
            uint64_t v36 = [v27 usoGraph];
            LOBYTE(v35) = [a1 hasEntityEdgeTo:v35 inGraph:v36];

            if (v35)
            {
              uint64_t v37 = v27;
              long long v38 = v32;
              int v39 = objc_opt_new();
              [v34 copyTo:v39];
              [v39 setNodeIndex:v31];
              int v40 = [v37 internalSpanData];
              if ([v40 hasMentionResolverSpanData])
              {
                [v37 internalSpanData];
                id v41 = a1;
                long long v43 = v42 = v8;
                double v44 = [v43 mentionResolverSpanData];
                int v45 = [v44 hasJointScore];

                id v8 = v42;
                a1 = v41;
                uint64_t v31 = v66;

                if (v45)
                {
                  long long v46 = objc_alloc_init(MEMORY[0x263F71C70]);
                  long long v47 = [v68 internalSpanData];
                  unint64_t v48 = [v47 mentionResolverSpanData];
                  [v48 jointScore];
                  -[NSObject setValue:](v46, "setValue:");

                  [v39 setProbability:v46];
                  goto LABEL_42;
                }
              }
              else
              {
              }
              long long v46 = CDMOSLoggerForCategory(0);
              if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315138;
                long long v81 = "+[CDMPostProcessUtils copyMentionResolverSpanIdentifiers:fromMatchingSpans:toParseGraph:]";
                _os_log_impl(&dword_2263A0000, v46, OS_LOG_TYPE_INFO, "%s [WARN]: No joint model score found in mentionResolverSpanData, copying from identifier", buf, 0xCu);
              }
LABEL_42:
              id v32 = v38;
              unsigned int v49 = v70;

              [v39 setSourceComponent:3];
              -[NSObject setGroupIndex:](v39, "setGroupIndex:", [v34 groupIndex] + v67);
              unsigned int v50 = [v34 groupIndex];
              if (v70 <= v50) {
                unsigned int v49 = v50;
              }
              unsigned int v70 = v49;
              uint64_t v51 = CDMOSLoggerForCategory(0);
              if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136315394;
                long long v81 = "+[CDMPostProcessUtils copyMentionResolverSpanIdentifiers:fromMatchingSpans:toParseGraph:]";
                __int16 v82 = 2112;
                long long v83 = v34;
                _os_log_debug_impl(&dword_2263A0000, v51, OS_LOG_TYPE_DEBUG, "%s Found matching identifier from MRR_MATCHER span. Copying over identifier. Identifier: %@", buf, 0x16u);
              }

              [v8 addObject:v39];
              char v30 = 1;
              uint64_t v27 = v68;
            }
            else
            {
              int v39 = CDMOSLoggerForCategory(0);
              if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136315394;
                long long v81 = "+[CDMPostProcessUtils copyMentionResolverSpanIdentifiers:fromMatchingSpans:toParseGraph:]";
                __int16 v82 = 2112;
                long long v83 = v34;
                _os_log_debug_impl(&dword_2263A0000, v39, OS_LOG_TYPE_DEBUG, "%s Skipping copy of identifier from MRR_MATCHER span. Identifier is not attached to a node with a entity edge. Identifier: %@", buf, 0x16u);
              }
            }

            if (v71 == ++v33)
            {
              uint64_t v71 = [v32 countByEnumeratingWithState:&v72 objects:v84 count:16];
              if (!v71)
              {

                if (v30) {
                  unsigned int v52 = v70 + 1;
                }
                else {
                  unsigned int v52 = 0;
                }
                v67 += v52;
                id v9 = v59;
                uint64_t v25 = v60;
                int v21 = v62;
                id v22 = v61;
                uint64_t v24 = v64;
                goto LABEL_54;
              }
              continue;
            }
            goto LABEL_31;
          }
        }
        if (v15 == 2631)
        {
          int v16 = CDMOSLoggerForCategory(0);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315138;
            long long v81 = "+[CDMPostProcessUtils copyMentionResolverSpanIdentifiers:fromMatchingSpans:toParseGraph:]";
            BOOL v17 = v16;
            BOOL v18 = "%s Found node of type Common_SpatialPosition";
            goto LABEL_66;
          }
          goto LABEL_18;
        }
      }
      else
      {
        if (v15 == 1206)
        {
          BOOL v19 = +[CDMUserDefaultsUtils isAttachMDMRSpantoStringPayloadsEnabled];
          log = CDMOSLoggerForCategory(0);
          BOOL v20 = os_log_type_enabled(log, OS_LOG_TYPE_DEBUG);
          if (v19)
          {
            if (v20)
            {
              *(_DWORD *)buf = 136315138;
              long long v81 = "+[CDMPostProcessUtils copyMentionResolverSpanIdentifiers:fromMatchingSpans:toParseGraph:]";
              _os_log_debug_impl(&dword_2263A0000, log, OS_LOG_TYPE_DEBUG, "%s Found node of type ENTITY_PRIMITIVE_STRING_ENTITY", buf, 0xCu);
            }

            log = [a1 getUtteranceAlignmentForIndex:v9 nodeIndex:v12];
            if (log)
            {
              int v21 = 1;
              goto LABEL_19;
            }
            log = CDMOSLoggerForCategory(0);
            if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315138;
              long long v81 = "+[CDMPostProcessUtils copyMentionResolverSpanIdentifiers:fromMatchingSpans:toParseGraph:]";
              uint64_t v55 = log;
              int v56 = "%s Parse alignment for string payload not found. Dont proceed";
LABEL_64:
              _os_log_debug_impl(&dword_2263A0000, v55, OS_LOG_TYPE_DEBUG, v56, buf, 0xCu);
            }
          }
          else if (v20)
          {
            *(_DWORD *)buf = 136315138;
            long long v81 = "+[CDMPostProcessUtils copyMentionResolverSpanIdentifiers:fromMatchingSpans:toParseGraph:]";
            uint64_t v55 = log;
            int v56 = "%s MDMR - Found node of type ENTITY_PRIMITIVE_STRING_ENTITY but user defaults off dont proceed";
            goto LABEL_64;
          }
LABEL_57:

          goto LABEL_58;
        }
        if (v15 == 1282)
        {
          int v16 = CDMOSLoggerForCategory(0);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315138;
            long long v81 = "+[CDMPostProcessUtils copyMentionResolverSpanIdentifiers:fromMatchingSpans:toParseGraph:]";
            BOOL v17 = v16;
            BOOL v18 = "%s Found node of type Common_ReferenceType";
            goto LABEL_66;
          }
          goto LABEL_18;
        }
      }
LABEL_58:

      uint64_t v12 = v66 + 1;
      uint64_t v53 = [v9 nodes];
      unint64_t v54 = [v53 count];
    }
    while (v54 > v66 + 1);
  }
}

+ (BOOL)hasEntityEdgeTo:(int)a3 inGraph:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = objc_msgSend(a4, "edges", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v10 hasToIndex])
        {
          if ([v10 toIndex] == a3)
          {
            if ([v10 hasLabel])
            {
              uint64_t v11 = [v10 label];
              int v12 = [v11 usoElementId];

              if (v12 == 1271)
              {
                BOOL v13 = 1;
                goto LABEL_14;
              }
            }
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 0;
LABEL_14:

  return v13;
}

+ (void)copySubsumedSpanEntitySpan:(id)a3 spans:(id)a4 parseEntityKey:(id)a5 utteranceAlignment:(id)a6 tokenChain:(id)a7
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v51 = a3;
  id v11 = a4;
  id v52 = a5;
  id v12 = a6;
  id v48 = a7;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  obuint64_t j = v11;
  uint64_t v40 = [v11 countByEnumeratingWithState:&v62 objects:v68 count:16];
  if (v40)
  {
    uint64_t v39 = *(void *)v63;
    BOOL v13 = &off_2647A2000;
    do
    {
      for (uint64_t i = 0; i != v40; ++i)
      {
        if (*(void *)v63 != v39) {
          objc_enumerationMutation(obj);
        }
        unsigned int v49 = *(void **)(*((void *)&v62 + 1) + 8 * i);
        long long v15 = [v49 usoGraph];
        long long v16 = v15;
        if (v15)
        {
          uint64_t v41 = i;
          long long v60 = 0u;
          long long v61 = 0u;
          long long v58 = 0u;
          long long v59 = 0u;
          long long v17 = [v15 alignments];
          uint64_t v18 = [v17 countByEnumeratingWithState:&v58 objects:v67 count:16];
          if (v18)
          {
            uint64_t v19 = v18;
            uint64_t v20 = *(void *)v59;
            long long v43 = v17;
            double v44 = v16;
            uint64_t v42 = *(void *)v59;
            do
            {
              uint64_t v21 = 0;
              uint64_t v45 = v19;
              do
              {
                if (*(void *)v59 != v20) {
                  objc_enumerationMutation(v17);
                }
                id v22 = *(void **)(*((void *)&v58 + 1) + 8 * v21);
                if ([v22 subsumedBy:v12])
                {
                  uint64_t v47 = v21;
                  uint64_t v23 = v13[454];
                  uint64_t v24 = [v49 usoGraph];
                  uint64_t v25 = objc_msgSend(v23, "entityKeyFrom:at:", v24, objc_msgSend(v22, "nodeIndex"));

                  if ([v25 isEqualToEntityKey:v52])
                  {
                    long long v46 = v25;
                    long long v56 = 0u;
                    long long v57 = 0u;
                    long long v54 = 0u;
                    long long v55 = 0u;
                    uint64_t v26 = [v16 spans];
                    uint64_t v27 = [v26 countByEnumeratingWithState:&v54 objects:v66 count:16];
                    if (v27)
                    {
                      uint64_t v28 = v27;
                      uint64_t v29 = *(void *)v55;
                      do
                      {
                        for (uint64_t j = 0; j != v28; ++j)
                        {
                          if (*(void *)v55 != v29) {
                            objc_enumerationMutation(v26);
                          }
                          uint64_t v31 = *(void **)(*((void *)&v54 + 1) + 8 * j);
                          int v32 = [v31 nodeIndex];
                          if (v32 == [v22 nodeIndex])
                          {
                            id v33 = objc_alloc_init(MEMORY[0x263F71DA0]);
                            [v31 copyTo:v33];
                            objc_msgSend(v33, "setNodeIndex:", objc_msgSend(v12, "nodeIndex"));
                            id v34 = objc_alloc_init(MEMORY[0x263F71D08]);
                            objc_msgSend(v34, "setAttachmentType:", objc_msgSend(v22, "equalIndexes:", v12) ^ 1);
                            uint64_t v35 = +[EntityKey userEntity];
                            int v36 = [v35 isEqualToEntityKey:v52];

                            if (v36)
                            {
                              unsigned int v50 = [v33 properties];
                              uint64_t v37 = objc_msgSend(a1, "getSignificantTokenCountFrom:to:within:", objc_msgSend(v49, "startTokenIndex"), objc_msgSend(v49, "endTokenIndex"), v48);
                              [v50 addObject:v37];
                            }
                            [v33 setPayloadAttachmentInfo:v34];
                            [a1 stripBugFixPropertyKeySuffix:v33];
                            [v51 addObject:v33];
                          }
                        }
                        uint64_t v28 = [v26 countByEnumeratingWithState:&v54 objects:v66 count:16];
                      }
                      while (v28);
                    }

                    BOOL v13 = &off_2647A2000;
                    long long v17 = v43;
                    long long v16 = v44;
                    uint64_t v20 = v42;
                    uint64_t v19 = v45;
                    uint64_t v25 = v46;
                  }

                  uint64_t v21 = v47;
                }
                ++v21;
              }
              while (v21 != v19);
              uint64_t v19 = [v17 countByEnumeratingWithState:&v58 objects:v67 count:16];
            }
            while (v19);
          }

          uint64_t i = v41;
        }
      }
      uint64_t v40 = [obj countByEnumeratingWithState:&v62 objects:v68 count:16];
    }
    while (v40);
  }
}

+ (void)copyAlignedSpanEntitySpanForSameType:(id)a3 spanIndexDict:(id)a4 utteranceAlignment:(id)a5 entityKey:(id)a6 tokenChain:(id)a7
{
  uint64_t v84 = *MEMORY[0x263EF8340];
  id v58 = a3;
  id v45 = a4;
  id v12 = a5;
  id v57 = a6;
  id v13 = a7;
  id v14 = objc_alloc(MEMORY[0x263EFF980]);
  long long v15 = [v12 spans];
  unsigned int v50 = objc_msgSend(v14, "initWithCapacity:", 2 * objc_msgSend(v15, "count"));

  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v16 = [v12 spans];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v72 objects:v83 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v73;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v73 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void **)(*((void *)&v72 + 1) + 8 * i);
        *(_DWORD *)buf = 0;
        *(_DWORD *)buf = [v21 startIndex];
        unsigned int v71 = 0;
        unsigned int v71 = [v21 endIndex];
        [a1 updateIndexesForSignificantTokensFrom:buf to:&v71 tokenChain:v13 entityKey:v57];
        id v22 = [NSNumber numberWithInt:*(unsigned int *)buf];
        [v50 addObject:v22];

        uint64_t v23 = [NSNumber numberWithInt:v71];
        [v50 addObject:v23];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v72 objects:v83 count:16];
    }
    while (v18);
  }

  if (![v50 count])
  {
    double v44 = CDMOSLoggerForCategory(0);
    uint64_t v24 = v45;
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      long long v80 = "+[CDMPostProcessUtils copyAlignedSpanEntitySpanForSameType:spanIndexDict:utteranceAlignment:entityKey:tokenChain:]";
      __int16 v81 = 2112;
      id v82 = v12;
      _os_log_debug_impl(&dword_2263A0000, v44, OS_LOG_TYPE_DEBUG, "%s Found an alignment without indexes, ignoring: %@", buf, 0x16u);
    }
    goto LABEL_42;
  }
  [v50 sortUsingSelector:sel_compare_];
  uint64_t v24 = v45;
  uint64_t v25 = [v45 objectForKeyedSubscript:v50];
  if (!v25)
  {
    double v44 = 0;
LABEL_42:
    long long v43 = v50;
    goto LABEL_43;
  }
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  obuint64_t j = v25;
  uint64_t v48 = [v25 countByEnumeratingWithState:&v67 objects:v78 count:16];
  if (v48)
  {
    uint64_t v47 = *(void *)v68;
    do
    {
      for (uint64_t j = 0; j != v48; ++j)
      {
        if (*(void *)v68 != v47) {
          objc_enumerationMutation(obj);
        }
        uint64_t v27 = [*(id *)(*((void *)&v67 + 1) + 8 * j) usoGraph];
        uint64_t v28 = v27;
        if (v27)
        {
          uint64_t v49 = j;
          long long v65 = 0u;
          long long v66 = 0u;
          long long v63 = 0u;
          long long v64 = 0u;
          id v54 = [v27 alignments];
          uint64_t v29 = [v54 countByEnumeratingWithState:&v63 objects:v77 count:16];
          if (v29)
          {
            uint64_t v30 = v29;
            uint64_t v31 = *(void *)v64;
            uint64_t v51 = *(void *)v64;
            id v52 = v28;
            do
            {
              uint64_t v32 = 0;
              uint64_t v53 = v30;
              do
              {
                if (*(void *)v64 != v31) {
                  objc_enumerationMutation(v54);
                }
                id v33 = *(void **)(*((void *)&v63 + 1) + 8 * v32);
                id v34 = objc_msgSend(a1, "entityKeyFrom:at:", v28, objc_msgSend(v33, "nodeIndex"));
                if ([v34 isEqualToEntityKey:v57])
                {
                  long long v55 = v34;
                  uint64_t v56 = v32;
                  long long v61 = 0u;
                  long long v62 = 0u;
                  long long v59 = 0u;
                  long long v60 = 0u;
                  uint64_t v35 = [v28 spans];
                  uint64_t v36 = [v35 countByEnumeratingWithState:&v59 objects:v76 count:16];
                  if (v36)
                  {
                    uint64_t v37 = v36;
                    uint64_t v38 = *(void *)v60;
                    do
                    {
                      for (uint64_t k = 0; k != v37; ++k)
                      {
                        if (*(void *)v60 != v38) {
                          objc_enumerationMutation(v35);
                        }
                        uint64_t v40 = *(void **)(*((void *)&v59 + 1) + 8 * k);
                        int v41 = [v40 nodeIndex];
                        if (v41 == [v33 nodeIndex])
                        {
                          id v42 = objc_alloc_init(MEMORY[0x263F71DA0]);
                          [v40 copyTo:v42];
                          objc_msgSend(v42, "setNodeIndex:", objc_msgSend(v12, "nodeIndex"));
                          [a1 stripBugFixPropertyKeySuffix:v42];
                          [v58 addObject:v42];
                        }
                      }
                      uint64_t v37 = [v35 countByEnumeratingWithState:&v59 objects:v76 count:16];
                    }
                    while (v37);
                  }

                  uint64_t v31 = v51;
                  uint64_t v28 = v52;
                  uint64_t v30 = v53;
                  id v34 = v55;
                  uint64_t v32 = v56;
                }

                ++v32;
              }
              while (v32 != v30);
              uint64_t v30 = [v54 countByEnumeratingWithState:&v63 objects:v77 count:16];
            }
            while (v30);
          }

          uint64_t j = v49;
        }
      }
      uint64_t v48 = [obj countByEnumeratingWithState:&v67 objects:v78 count:16];
    }
    while (v48);
    uint64_t v24 = v45;
  }
  long long v43 = v50;
  double v44 = obj;
LABEL_43:
}

+ (void)copyAlignedSpanIdentifierForSameType:(id)a3 spanIndexDict:(id)a4 utteranceAlignment:(id)a5 entityKey:(id)a6 groupIndexDict:(id)a7 tokenChain:(id)a8
{
  uint64_t v102 = *MEMORY[0x263EF8340];
  id v75 = a3;
  id v60 = a4;
  id v13 = a5;
  id v14 = a6;
  id v59 = a7;
  id v15 = a8;
  id v16 = objc_alloc(MEMORY[0x263EFF980]);
  uint64_t v17 = [v13 spans];
  uint64_t v18 = objc_msgSend(v16, "initWithCapacity:", 2 * objc_msgSend(v17, "count"));

  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  long long v74 = v13;
  uint64_t v19 = [v13 spans];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v90 objects:v101 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v91;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v91 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void **)(*((void *)&v90 + 1) + 8 * i);
        *(_DWORD *)buf = 0;
        *(_DWORD *)buf = [v24 startIndex];
        unsigned int v89 = 0;
        unsigned int v89 = [v24 endIndex];
        [a1 updateIndexesForSignificantTokensFrom:buf to:&v89 tokenChain:v15 entityKey:v14];
        uint64_t v25 = [NSNumber numberWithInt:*(unsigned int *)buf];
        [v18 addObject:v25];

        uint64_t v26 = [NSNumber numberWithInt:v89];
        [v18 addObject:v26];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v90 objects:v101 count:16];
    }
    while (v21);
  }

  if ([v18 count])
  {
    [v18 sortUsingSelector:sel_compare_];
    uint64_t v27 = [v60 objectForKeyedSubscript:v18];
    if (v27)
    {
      uint64_t v28 = (void *)v27;
      id v58 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", objc_msgSend(v13, "nodeIndex"));
      uint64_t v29 = objc_msgSend(v59, "objectForKeyedSubscript:");
      id v57 = v29;
      if (v29) {
        int v30 = objc_msgSend(v29, "unsignedIntValue", v29) + 1;
      }
      else {
        int v30 = 0;
      }
      long long v87 = 0u;
      long long v88 = 0u;
      long long v85 = 0u;
      long long v86 = 0u;
      uint64_t v31 = v28;
      uint64_t v32 = [v31 countByEnumeratingWithState:&v85 objects:v96 count:16];
      if (v32)
      {
        uint64_t v33 = v32;
        uint64_t v34 = *(void *)v86;
        id v67 = v14;
        long long v63 = v18;
        id v64 = v15;
        uint64_t v61 = *(void *)v86;
        long long v62 = v31;
        do
        {
          uint64_t v35 = 0;
          uint64_t v65 = v33;
          do
          {
            if (*(void *)v86 != v34) {
              objc_enumerationMutation(v31);
            }
            uint64_t v36 = objc_msgSend(*(id *)(*((void *)&v85 + 1) + 8 * v35), "usoGraph", v57);
            long long v70 = v36;
            if (v36)
            {
              long long v83 = 0u;
              long long v84 = 0u;
              long long v81 = 0u;
              long long v82 = 0u;
              uint64_t v37 = [v36 alignments];
              uint64_t v38 = [v37 countByEnumeratingWithState:&v81 objects:v95 count:16];
              if (v38)
              {
                uint64_t v66 = v35;
                char v39 = 0;
                unsigned int v40 = 0;
                uint64_t v41 = *(void *)v82;
                id v42 = v70;
                long long v43 = v37;
                uint64_t v44 = v38;
                uint64_t v68 = *(void *)v82;
                long long v69 = v37;
                do
                {
                  uint64_t v45 = 0;
                  uint64_t v71 = v44;
                  do
                  {
                    if (*(void *)v82 != v41) {
                      objc_enumerationMutation(v43);
                    }
                    uint64_t v73 = v45;
                    long long v46 = *(void **)(*((void *)&v81 + 1) + 8 * v45);
                    long long v72 = objc_msgSend(a1, "entityKeyFrom:at:", v42, objc_msgSend(v46, "nodeIndex"));
                    if ([v72 isEqualToEntityKey:v14])
                    {
                      long long v79 = 0u;
                      long long v80 = 0u;
                      long long v77 = 0u;
                      long long v78 = 0u;
                      uint64_t v47 = [v42 identifiers];
                      uint64_t v48 = [v47 countByEnumeratingWithState:&v77 objects:v94 count:16];
                      if (v48)
                      {
                        uint64_t v49 = v48;
                        uint64_t v50 = *(void *)v78;
                        do
                        {
                          for (uint64_t j = 0; j != v49; ++j)
                          {
                            if (*(void *)v78 != v50) {
                              objc_enumerationMutation(v47);
                            }
                            id v52 = *(void **)(*((void *)&v77 + 1) + 8 * j);
                            int v53 = [v52 nodeIndex];
                            if (v53 == [v46 nodeIndex])
                            {
                              id v54 = objc_opt_new();
                              [v52 copyTo:v54];
                              objc_msgSend(v54, "setNodeIndex:", objc_msgSend(v74, "nodeIndex"));
                              objc_msgSend(v54, "setGroupIndex:", objc_msgSend(v52, "groupIndex") + v30);
                              [a1 stripBugFixNamespaceSuffix:v52];
                              unsigned int v55 = [v52 groupIndex];
                              if (v40 <= v55) {
                                unsigned int v40 = v55;
                              }
                              [v75 addObject:v54];

                              char v39 = 1;
                            }
                          }
                          uint64_t v49 = [v47 countByEnumeratingWithState:&v77 objects:v94 count:16];
                        }
                        while (v49);
                      }

                      id v14 = v67;
                      uint64_t v41 = v68;
                      long long v43 = v69;
                      id v42 = v70;
                      uint64_t v44 = v71;
                    }

                    uint64_t v45 = v73 + 1;
                  }
                  while (v73 + 1 != v44);
                  uint64_t v44 = [v43 countByEnumeratingWithState:&v81 objects:v95 count:16];
                }
                while (v44);

                if (v39) {
                  unsigned int v56 = v40 + 1;
                }
                else {
                  unsigned int v56 = 0;
                }
                v30 += v56;
                uint64_t v18 = v63;
                id v15 = v64;
                uint64_t v34 = v61;
                uint64_t v31 = v62;
                uint64_t v33 = v65;
                uint64_t v35 = v66;
              }
              else
              {
              }
            }

            ++v35;
          }
          while (v35 != v33);
          uint64_t v33 = [v31 countByEnumeratingWithState:&v85 objects:v96 count:16];
        }
        while (v33);
      }
    }
    else
    {
      uint64_t v31 = 0;
    }
  }
  else
  {
    uint64_t v31 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      long long v98 = "+[CDMPostProcessUtils copyAlignedSpanIdentifierForSameType:spanIndexDict:utteranceAlignment:entityKey:groupI"
            "ndexDict:tokenChain:]";
      __int16 v99 = 2112;
      v100 = v74;
      _os_log_debug_impl(&dword_2263A0000, v31, OS_LOG_TYPE_DEBUG, "%s Found an alignment without indexes, ignoring: %@", buf, 0x16u);
    }
  }
}

+ (void)stripBugFixPropertyKeySuffix:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 properties];

  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v17 = v3;
    uint64_t v6 = [v3 properties];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          id v12 = [v11 key];
          int v13 = [v12 hasSuffix:@"BugFix"];

          if (v13)
          {
            id v14 = [v11 key];
            id v15 = [v11 key];
            id v16 = [v14 substringToIndex:objc_msgSend(v15, "length") - objc_msgSend(@"BugFix", "length")];
            [v11 setKey:v16];
          }
          [v5 addObject:v11];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v8);
    }

    id v3 = v17;
    [v17 setProperties:v5];
  }
}

+ (void)stripBugFixNamespaceSuffix:(id)a3
{
  id v12 = a3;
  id v3 = [v12 namespaceA];
  id v4 = [v3 value];
  int v5 = [v4 hasSuffix:@"BugFix"];

  if (v5)
  {
    uint64_t v6 = [v12 namespaceA];
    uint64_t v7 = [v6 value];
    uint64_t v8 = [v12 namespaceA];
    uint64_t v9 = [v8 value];
    uint64_t v10 = [v7 substringToIndex:objc_msgSend(v9, "length") - objc_msgSend(@"BugFix", "length")];
    id v11 = [v12 namespaceA];
    [v11 setValue:v10];
  }
}

+ (id)spanIndexDict:(id)a3 tokenChain:(id)a4
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v36 = [MEMORY[0x263EFF9A0] dictionary];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  obuint64_t j = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v56 objects:v66 count:16];
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v57;
    *(void *)&long long v9 = 136315394;
    long long v35 = v9;
    uint64_t v37 = *(void *)v57;
    do
    {
      uint64_t v12 = 0;
      uint64_t v38 = v10;
      do
      {
        if (*(void *)v57 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v41 = *(void **)(*((void *)&v56 + 1) + 8 * v12);
        int v13 = objc_msgSend(v41, "usoGraph", v35);
        id v14 = v13;
        if (v13)
        {
          id v15 = [v13 identifiers];
          uint64_t v16 = [v15 count];

          if (v16)
          {
            uint64_t v40 = v12;
            id v17 = objc_alloc(MEMORY[0x263EFF980]);
            long long v18 = [v14 alignments];
            uint64_t v19 = objc_msgSend(v17, "initWithCapacity:", 2 * objc_msgSend(v18, "count"));
            long long v20 = v14;
            long long v21 = (void *)v19;

            long long v54 = 0u;
            long long v55 = 0u;
            long long v52 = 0u;
            long long v53 = 0u;
            uint64_t v44 = v20;
            id v42 = [v20 alignments];
            uint64_t v45 = [v42 countByEnumeratingWithState:&v52 objects:v65 count:16];
            if (v45)
            {
              uint64_t v43 = *(void *)v53;
              do
              {
                uint64_t v22 = 0;
                do
                {
                  if (*(void *)v53 != v43) {
                    objc_enumerationMutation(v42);
                  }
                  uint64_t v46 = v22;
                  uint64_t v23 = *(void **)(*((void *)&v52 + 1) + 8 * v22);
                  uint64_t v24 = objc_msgSend(a1, "entityKeyFrom:at:", v44, objc_msgSend(v23, "nodeIndex"));
                  long long v48 = 0u;
                  long long v49 = 0u;
                  long long v50 = 0u;
                  long long v51 = 0u;
                  uint64_t v25 = [v23 spans];
                  uint64_t v26 = [v25 countByEnumeratingWithState:&v48 objects:v64 count:16];
                  if (v26)
                  {
                    uint64_t v27 = v26;
                    uint64_t v28 = *(void *)v49;
                    do
                    {
                      for (uint64_t i = 0; i != v27; ++i)
                      {
                        if (*(void *)v49 != v28) {
                          objc_enumerationMutation(v25);
                        }
                        int v30 = *(void **)(*((void *)&v48 + 1) + 8 * i);
                        *(_DWORD *)buf = 0;
                        *(_DWORD *)buf = [v30 startIndex];
                        unsigned int v47 = 0;
                        unsigned int v47 = [v30 endIndex];
                        [a1 updateIndexesForSignificantTokensFrom:buf to:&v47 tokenChain:v7 entityKey:v24];
                        uint64_t v31 = [NSNumber numberWithInt:*(unsigned int *)buf];
                        [v21 addObject:v31];

                        uint64_t v32 = [NSNumber numberWithInt:v47];
                        [v21 addObject:v32];
                      }
                      uint64_t v27 = [v25 countByEnumeratingWithState:&v48 objects:v64 count:16];
                    }
                    while (v27);
                  }

                  uint64_t v22 = v46 + 1;
                }
                while (v46 + 1 != v45);
                uint64_t v45 = [v42 countByEnumeratingWithState:&v52 objects:v65 count:16];
              }
              while (v45);
            }

            if ([v21 count])
            {
              [v21 sortUsingSelector:sel_compare_];
              uint64_t v33 = [v36 objectForKeyedSubscript:v21];
              uint64_t v11 = v37;
              uint64_t v10 = v38;
              uint64_t v12 = v40;
              if (!v33)
              {
                uint64_t v33 = [MEMORY[0x263EFF980] array];
                [v36 setObject:v33 forKeyedSubscript:v21];
              }
              [v33 addObject:v41];
            }
            else
            {
              uint64_t v33 = CDMOSLoggerForCategory(0);
              uint64_t v11 = v37;
              uint64_t v10 = v38;
              uint64_t v12 = v40;
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = v35;
                uint64_t v61 = "+[CDMPostProcessUtils spanIndexDict:tokenChain:]";
                __int16 v62 = 2112;
                long long v63 = v41;
                _os_log_debug_impl(&dword_2263A0000, v33, OS_LOG_TYPE_DEBUG, "%s Found a MatchingSpan without an utterance span alignment: %@", buf, 0x16u);
              }
            }

            id v14 = v44;
          }
        }

        ++v12;
      }
      while (v12 != v10);
      uint64_t v10 = [obj countByEnumeratingWithState:&v56 objects:v66 count:16];
    }
    while (v10);
  }

  return v36;
}

+ (id)getGroupIndexDict:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v16 = v3;
  int v5 = [v3 identifiers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (([v10 hasGroupIndex] & 1) == 0) {
          [v10 setGroupIndex:0];
        }
        uint64_t v11 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", objc_msgSend(v10, "nodeIndex"));
        uint64_t v12 = [v4 objectForKeyedSubscript:v11];
        if (!v12 || (unsigned int v13 = [v10 groupIndex], v13 > objc_msgSend(v12, "unsignedIntValue")))
        {
          id v14 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", objc_msgSend(v10, "groupIndex"));
          [v4 setObject:v14 forKeyedSubscript:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)usoGraphs:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obuint64_t j = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v22 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v28 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v9 = [v8 userDialogActs];
        uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (!v10)
        {
          uint64_t v12 = 0;
          goto LABEL_35;
        }
        uint64_t v11 = v10;
        uint64_t v12 = 0;
        uint64_t v13 = *(void *)v24;
        do
        {
          for (uint64_t j = 0; j != v11; ++j)
          {
            if (*(void *)v24 != v13) {
              objc_enumerationMutation(v9);
            }
            id v15 = *(void **)(*((void *)&v23 + 1) + 8 * j);
            if ([v15 hasUserStatedTask])
            {
              uint64_t v16 = [v15 userStatedTask];
              uint64_t v17 = [v16 task];
            }
            else
            {
              if ([v15 hasAccepted])
              {
                long long v18 = [v15 accepted];
              }
              else if ([v15 hasRejected])
              {
                long long v18 = [v15 rejected];
              }
              else if ([v15 hasAcknowledged])
              {
                long long v18 = [v15 acknowledged];
              }
              else if ([v15 hasCancelled])
              {
                long long v18 = [v15 cancelled];
              }
              else if ([v15 hasWantedToPause])
              {
                long long v18 = [v15 wantedToPause];
              }
              else if ([v15 hasWantedToProceed])
              {
                long long v18 = [v15 wantedToProceed];
              }
              else
              {
                if (![v15 hasWantedToRepeat]) {
                  goto LABEL_29;
                }
                long long v18 = [v15 wantedToRepeat];
              }
              uint64_t v16 = v18;
              uint64_t v17 = [v18 reference];
            }
            long long v19 = (void *)v17;

            uint64_t v12 = v19;
LABEL_29:
            if (v12) {
              [v4 addObject:v12];
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v31 count:16];
        }
        while (v11);
LABEL_35:
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v6);
  }

  return v4;
}

+ (void)runFeatureStore:(id)a3 nluResponse:(id)a4 snlcRequest:(id)a5 snlcResponse:(id)a6 pscRequest:(id)a7 pscResponse:(id)a8 spanProtoResponse:(id)a9 tokenProtoResponse:(id)a10 mdRequest:(id)a11 mdResponse:(id)a12 mrRequest:(id)a13 mrResponse:(id)a14 nLv4Request:(id)a15 nLv4Response:(id)a16
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v72 = a16;
  id v71 = a15;
  id v70 = a14;
  id v69 = a13;
  id v68 = a12;
  id v67 = a11;
  id v66 = a10;
  id v19 = a9;
  id v20 = a8;
  id v21 = a7;
  id v22 = a6;
  id v23 = a5;
  id v24 = a4;
  id v25 = a3;
  long long v26 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    long long v74 = "+[CDMPostProcessUtils runFeatureStore:nluResponse:snlcRequest:snlcResponse:pscRequest:pscResponse:spanProtoRes"
          "ponse:tokenProtoResponse:mdRequest:mdResponse:mrRequest:mrResponse:nLv4Request:nLv4Response:]";
    _os_log_debug_impl(&dword_2263A0000, v26, OS_LOG_TYPE_DEBUG, "%s FeatureStore Insertion", buf, 0xCu);
  }

  +[CDMFeatureStoreUtils insertRequestToFeatureStoreAsJson:v25];
  +[CDMFeatureStoreUtils insertResponseToFeatureStoreAsJson:v24];

  long long v27 = [v23 parserRequest];

  long long v28 = [v25 requestId];
  long long v29 = [v28 idA];
  +[CDMFeatureStoreUtils insertSNLCRequestToFeatureStore:v27 interactionId:v29];

  long long v30 = [v22 snlcResponse];

  uint64_t v31 = [v25 requestId];
  uint64_t v32 = [v31 idA];
  +[CDMFeatureStoreUtils insertSNLCResponseToFeatureStore:v30 interactionId:v32];

  uint64_t v33 = [v21 parserRequest];

  uint64_t v34 = [v25 requestId];
  long long v35 = [v34 idA];
  +[CDMFeatureStoreUtils insertPSCRequestToFeatureStore:v33 interactionId:v35];

  id v36 = [v20 pscResponse];

  uint64_t v37 = [v25 requestId];
  uint64_t v38 = [v37 idA];
  +[CDMFeatureStoreUtils insertPSCResponseToFeatureStore:v36 interactionId:v38];

  char v39 = [v19 spanMatchResponse];

  uint64_t v40 = [v25 requestId];
  uint64_t v41 = [v40 idA];
  +[CDMFeatureStoreUtils insertSpanMatchResponseToFeatureStore:v39 interactionId:v41];

  id v42 = [v66 response];

  uint64_t v43 = [v25 requestId];
  uint64_t v44 = [v43 idA];
  +[CDMFeatureStoreUtils insertTokenizerResponseToFeatureStore:v42 interactionId:v44];

  uint64_t v45 = [v67 mdRequest];

  uint64_t v46 = [v25 requestId];
  unsigned int v47 = [v46 idA];
  +[CDMFeatureStoreUtils insertMDRequestToFeatureStore:v45 interactionId:v47];

  long long v48 = [v68 response];

  long long v49 = [v25 requestId];
  long long v50 = [v49 idA];
  +[CDMFeatureStoreUtils insertMDResponseToFeatureStore:v48 interactionId:v50];

  long long v51 = [v69 mrRequest];

  long long v52 = [v25 requestId];
  long long v53 = [v52 idA];
  +[CDMFeatureStoreUtils insertMRRequestToFeatureStore:v51 interactionId:v53];

  long long v54 = [v70 response];

  long long v55 = [v25 requestId];
  long long v56 = [v55 idA];
  +[CDMFeatureStoreUtils insertMRResponseToFeatureStore:v54 interactionId:v56];

  long long v57 = [v71 parserRequest];

  long long v58 = [v25 requestId];
  long long v59 = [v58 idA];
  +[CDMFeatureStoreUtils insertNLv4ParserRequestToFeatureStore:v57 interactionId:v59];

  id v60 = [v72 parserResponse];

  uint64_t v61 = [v25 requestId];

  __int16 v62 = [v61 idA];
  +[CDMFeatureStoreUtils insertNLv4ParserResponseToFeatureStore:v60 interactionId:v62];
}

+ (id)selectParsesFromUserParsesUaaP:(id)a3 userParsesShortcut:(id)a4 userParsesReplaceOverrides:(id)a5 userParsesAppendOverrides:(id)a6 userParsesSNLC:(id)a7 userParsesNLv4:(id)a8 userParsesCATI:(id)a9 userParsesPSC:(id)a10 userParsesAutoShortcuts:(id)a11 userParsesSSU:(id)a12 addDebugInfo:(id)a13
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v35 = a3;
  id v18 = a4;
  id v19 = a5;
  id v34 = a6;
  id v20 = a7;
  id v33 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  id v24 = a12;
  id v25 = a13;
  if (+[CDMFeatureFlags isUaaPEnabled]
    && +[CDMFeatureFlags isUaaPPreferred]
    && [v35 count])
  {
    long long v26 = v20;
    long long v27 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v37 = "+[CDMPostProcessUtils selectParsesFromUserParsesUaaP:userParsesShortcut:userParsesReplaceOverrides:userParse"
            "sAppendOverrides:userParsesSNLC:userParsesNLv4:userParsesCATI:userParsesPSC:userParsesAutoShortcuts:userPars"
            "esSSU:addDebugInfo:]";
      _os_log_debug_impl(&dword_2263A0000, v27, OS_LOG_TYPE_DEBUG, "%s UaaP parses preferred, all other parses will be ignored", buf, 0xCu);
    }

    long long v28 = v35;
    id v29 = v35;
  }
  else
  {
    if ([v18 count])
    {
      long long v26 = v20;
      long long v30 = +[CDMPostProcessUtils getPostProcessUserParses:v18];
      long long v28 = v35;
      goto LABEL_14;
    }
    long long v28 = v35;
    if (![v19 count])
    {
      long long v26 = v20;
      uint64_t v31 = +[CDMPostProcessUtils getPostProcessUserParses:v20 parsesNLv4:v33 parsesCATI:v21 parsesUaaP:v35 parsesPSC:v22 parsesAutoShortcuts:v23 parsesAppendOverrides:v34 parsesSSU:v24 addDebugInfo:v25];
      goto LABEL_13;
    }
    long long v26 = v20;
    id v29 = v19;
  }
  uint64_t v31 = +[CDMPostProcessUtils getPostProcessUserParses:v29];
LABEL_13:
  long long v30 = (void *)v31;
LABEL_14:

  return v30;
}

+ (id)runPostProcess:(id)a3 snlcRequest:(id)a4 snlcResponse:(id)a5 nLv4Request:(id)a6 nLv4Response:(id)a7 uaapNLProtoResponse:(id)a8 catiProtoResponse:(id)a9 pscRequest:(id)a10 pscResponse:(id)a11 lvcResponse:(id)a12 overridesProtoResponse:(id)a13 mdRequest:(id)a14 mdResponse:(id)a15 mrRequest:(id)a16 mrResponse:(id)a17 spanProtoResponse:(id)a18 rdResponse:(id)a19 tokenProtoResponse:(id)a20 ssuResponse:(id)a21 ccqrResponse:(id)a22 correctionOutcome:(id)a23 nluRequest:(id)a24 graphInput:(id)a25 debugText:(id)a26
{
  uint64_t v153 = *MEMORY[0x263EF8340];
  id v132 = a3;
  id v30 = a5;
  id v31 = a7;
  id v131 = a8;
  id v32 = a9;
  id v33 = a11;
  id v130 = a12;
  id v34 = a13;
  id v35 = a17;
  id v134 = a18;
  id v129 = a19;
  id v128 = a20;
  id v36 = a21;
  id v127 = a22;
  id v126 = a23;
  id v136 = a24;
  v133 = (__CFString *)a26;
  uint64_t v37 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v148 = "+[CDMPostProcessUtils runPostProcess:snlcRequest:snlcResponse:nLv4Request:nLv4Response:uaapNLProtoResponse:ca"
           "tiProtoResponse:pscRequest:pscResponse:lvcResponse:overridesProtoResponse:mdRequest:mdResponse:mrRequest:mrRe"
           "sponse:spanProtoResponse:rdResponse:tokenProtoResponse:ssuResponse:ccqrResponse:correctionOutcome:nluRequest:"
           "graphInput:debugText:]";
    _os_log_debug_impl(&dword_2263A0000, v37, OS_LOG_TYPE_DEBUG, "%s Final post process step", buf, 0xCu);
  }

  v116 = v31;
  v117 = v30;
  if (+[CDMLogging debugEnabled])
  {
    uint64_t v38 = [v136 data];
    char v39 = [v38 base64EncodedDataWithOptions:1];

    uint64_t v40 = (void *)[[NSString alloc] initWithData:v39 encoding:4];
    uint64_t v41 = CDMLogContext;
    if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v148 = "+[CDMPostProcessUtils runPostProcess:snlcRequest:snlcResponse:nLv4Request:nLv4Response:uaapNLProtoResponse:"
             "catiProtoResponse:pscRequest:pscResponse:lvcResponse:overridesProtoResponse:mdRequest:mdResponse:mrRequest:"
             "mrResponse:spanProtoResponse:rdResponse:tokenProtoResponse:ssuResponse:ccqrResponse:correctionOutcome:nluRe"
             "quest:graphInput:debugText:]";
      __int16 v149 = 2112;
      v150 = @"cdmio";
      __int16 v151 = 2112;
      v152 = v40;
      _os_log_debug_impl(&dword_2263A0000, v41, OS_LOG_TYPE_DEBUG, "%s [insights-cdm-%@]:\nSIRINLUEXTERNALCDMNluRequest base64:\n%@", buf, 0x20u);
    }

    id v31 = v116;
    id v30 = v117;
  }
  if (v132)
  {
    v125 = [v132 voiceCommandsUserParses];
    v124 = [v132 autoShortcutParses];
    if (v30) {
      goto LABEL_9;
    }
LABEL_12:
    uint64_t v42 = MEMORY[0x263EFFA68];
    if (v31) {
      goto LABEL_10;
    }
    goto LABEL_13;
  }
  v124 = (void *)MEMORY[0x263EFFA68];
  v125 = (void *)MEMORY[0x263EFFA68];
  if (!v30) {
    goto LABEL_12;
  }
LABEL_9:
  uint64_t v42 = [v30 snlcParses];
  if (v31)
  {
LABEL_10:
    uint64_t v43 = [v31 nluResponse];
    uint64_t v44 = [v43 parses];

    goto LABEL_14;
  }
LABEL_13:
  uint64_t v44 = MEMORY[0x263EFFA68];
LABEL_14:
  if (v131)
  {
    uint64_t v45 = [v131 nluResponse];
    v123 = [v45 parses];

    if (v32) {
      goto LABEL_16;
    }
  }
  else
  {
    v123 = (void *)MEMORY[0x263EFFA68];
    if (v32)
    {
LABEL_16:
      uint64_t v46 = [v32 response];
      v122 = [v46 hypotheses];

      if (v33) {
        goto LABEL_17;
      }
LABEL_21:
      v121 = (void *)MEMORY[0x263EFFA68];
      if (v34) {
        goto LABEL_18;
      }
      goto LABEL_22;
    }
  }
  v122 = (void *)MEMORY[0x263EFFA68];
  if (!v33) {
    goto LABEL_21;
  }
LABEL_17:
  v121 = [v33 pscParses];
  if (v34)
  {
LABEL_18:
    v120 = [v34 parsesForReplacement];
    v119 = [v34 parsesForAppending];
    goto LABEL_23;
  }
LABEL_22:
  v119 = (void *)MEMORY[0x263EFFA68];
  v120 = (void *)MEMORY[0x263EFFA68];
LABEL_23:
  v112 = v36;
  if (v36)
  {
    unsigned int v47 = [v36 ssuResponse];
    uint64_t v48 = [v47 hypotheses];
  }
  else
  {
    uint64_t v48 = MEMORY[0x263EFFA68];
  }
  v115 = v32;
  v109 = (void *)v48;
  v110 = (void *)v44;
  v111 = (void *)v42;
  uint64_t v49 = +[CDMPostProcessUtils selectParsesFromUserParsesUaaP:v123 userParsesShortcut:v125 userParsesReplaceOverrides:v120 userParsesAppendOverrides:v119 userParsesSNLC:v42 userParsesNLv4:v44 userParsesCATI:v122 userParsesPSC:v121 userParsesAutoShortcuts:v124 userParsesSSU:v48 addDebugInfo:v133];
  long long v50 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v148 = "+[CDMPostProcessUtils runPostProcess:snlcRequest:snlcResponse:nLv4Request:nLv4Response:uaapNLProtoResponse:ca"
           "tiProtoResponse:pscRequest:pscResponse:lvcResponse:overridesProtoResponse:mdRequest:mdResponse:mrRequest:mrRe"
           "sponse:spanProtoResponse:rdResponse:tokenProtoResponse:ssuResponse:ccqrResponse:correctionOutcome:nluRequest:"
           "graphInput:debugText:]";
    _os_log_debug_impl(&dword_2263A0000, v50, OS_LOG_TYPE_DEBUG, "%s Convert SiriNLUTypes internal spans to external spans", buf, 0xCu);
  }

  id v51 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v52 = [v35 response];
  long long v53 = [v52 mentions];
  long long v54 = +[CDMPostProcessUtils filterAndConvertInternalMatchingSpans:v53];
  [v51 addObjectsFromArray:v54];

  long long v55 = [v134 matchingSpansForNL];
  long long v56 = +[CDMPostProcessUtils filterAndConvertInternalMatchingSpans:v55];
  [v51 addObjectsFromArray:v56];

  long long v57 = [v134 matchingSpansForExternalParsers];
  long long v58 = +[CDMPostProcessUtils filterAndConvertInternalMatchingSpans:v57];
  [v51 addObjectsFromArray:v58];

  long long v59 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v148 = "+[CDMPostProcessUtils runPostProcess:snlcRequest:snlcResponse:nLv4Request:nLv4Response:uaapNLProtoResponse:ca"
           "tiProtoResponse:pscRequest:pscResponse:lvcResponse:overridesProtoResponse:mdRequest:mdResponse:mrRequest:mrRe"
           "sponse:spanProtoResponse:rdResponse:tokenProtoResponse:ssuResponse:ccqrResponse:correctionOutcome:nluRequest:"
           "graphInput:debugText:]";
    _os_log_debug_impl(&dword_2263A0000, v59, OS_LOG_TYPE_DEBUG, "%s Annotate DelegatedUserDialogActs with external spans", buf, 0xCu);
  }

  id v60 = [v35 response];
  uint64_t v61 = [v60 rewrittenUtterance];
  +[CDMPostProcessUtils annotateDelegatedUDAParses:v49 matchingSpans:v51 mrRewrittenUtterance:v61];

  __int16 v62 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v148 = "+[CDMPostProcessUtils runPostProcess:snlcRequest:snlcResponse:nLv4Request:nLv4Response:uaapNLProtoResponse:ca"
           "tiProtoResponse:pscRequest:pscResponse:lvcResponse:overridesProtoResponse:mdRequest:mdResponse:mrRequest:mrRe"
           "sponse:spanProtoResponse:rdResponse:tokenProtoResponse:ssuResponse:ccqrResponse:correctionOutcome:nluRequest:"
           "graphInput:debugText:]";
    _os_log_debug_impl(&dword_2263A0000, v62, OS_LOG_TYPE_DEBUG, "%s Annotate all UserParse with correction outcome", buf, 0xCu);
  }

  uint64_t v63 = +[CDMPostProcessUtils getCorrectionOutcomeFromUserParses:v49 ccqrCorrectionOutcome:v126];
  +[CDMPostProcessUtils annotateUserParses:v49 correctionOutcome:v63];
  if (+[CDMFeatureFlags isAmbiguityRefactorEnabled])
  {
    id v64 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v148 = "+[CDMPostProcessUtils runPostProcess:snlcRequest:snlcResponse:nLv4Request:nLv4Response:uaapNLProtoResponse:"
             "catiProtoResponse:pscRequest:pscResponse:lvcResponse:overridesProtoResponse:mdRequest:mdResponse:mrRequest:"
             "mrResponse:spanProtoResponse:rdResponse:tokenProtoResponse:ssuResponse:ccqrResponse:correctionOutcome:nluRe"
             "quest:graphInput:debugText:]";
      _os_log_debug_impl(&dword_2263A0000, v64, OS_LOG_TYPE_DEBUG, "%s Remove the probability from each parse", buf, 0xCu);
    }

    +[CDMPostProcessUtils removeProbabilityFromUserParses:v49];
  }
  v118 = (void *)v49;
  uint64_t v65 = (void *)v63;
  v135 = v35;
  v113 = v34;
  v114 = v33;
  id v66 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v148 = "+[CDMPostProcessUtils runPostProcess:snlcRequest:snlcResponse:nLv4Request:nLv4Response:uaapNLProtoResponse:ca"
           "tiProtoResponse:pscRequest:pscResponse:lvcResponse:overridesProtoResponse:mdRequest:mdResponse:mrRequest:mrRe"
           "sponse:spanProtoResponse:rdResponse:tokenProtoResponse:ssuResponse:ccqrResponse:correctionOutcome:nluRequest:"
           "graphInput:debugText:]";
    _os_log_debug_impl(&dword_2263A0000, v66, OS_LOG_TYPE_DEBUG, "%s Create NLU Response", buf, 0xCu);
  }

  id v67 = objc_alloc_init(MEMORY[0x263F71CB0]);
  id v68 = [v136 requestId];
  [v67 setRequestId:v68];

  id v69 = (void *)[v118 mutableCopy];
  [v67 setParses:v69];

  id v70 = +[CDMServiceGraphUtil buildRepetitionResult:v129];
  long long v141 = 0u;
  long long v142 = 0u;
  long long v143 = 0u;
  long long v144 = 0u;
  id v71 = [v67 parses];
  uint64_t v72 = [v71 countByEnumeratingWithState:&v141 objects:v146 count:16];
  if (v72)
  {
    uint64_t v73 = v72;
    uint64_t v74 = *(void *)v142;
    do
    {
      for (uint64_t i = 0; i != v73; ++i)
      {
        if (*(void *)v142 != v74) {
          objc_enumerationMutation(v71);
        }
        [*(id *)(*((void *)&v141 + 1) + 8 * i) setRepetitionResult:v70];
      }
      uint64_t v73 = [v71 countByEnumeratingWithState:&v141 objects:v146 count:16];
    }
    while (v73);
  }

  long long v76 = [MEMORY[0x263EFF980] arrayWithObject:v70];
  [v67 setRepetitionResults:v76];

  if (+[CDMServiceGraphUtil debugInfoEnabled:v136])
  {
    [(__CFString *)v133 appendString:@"\n\n*** ✅ FOR DEBUGGING (end) ***"];
    [v67 setDebugText:v133];
    long long v77 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v148 = "+[CDMPostProcessUtils runPostProcess:snlcRequest:snlcResponse:nLv4Request:nLv4Response:uaapNLProtoResponse:"
             "catiProtoResponse:pscRequest:pscResponse:lvcResponse:overridesProtoResponse:mdRequest:mdResponse:mrRequest:"
             "mrResponse:spanProtoResponse:rdResponse:tokenProtoResponse:ssuResponse:ccqrResponse:correctionOutcome:nluRe"
             "quest:graphInput:debugText:]";
      __int16 v149 = 2112;
      v150 = v133;
      _os_log_debug_impl(&dword_2263A0000, v77, OS_LOG_TYPE_DEBUG, "%s Debug info %@", buf, 0x16u);
    }
  }
  long long v78 = [v134 matchingSpansForNL];
  long long v79 = (void *)[v78 mutableCopy];

  long long v80 = [v135 response];
  long long v81 = [v80 mentions];
  uint64_t v82 = [v81 count];

  if (v82)
  {
    long long v83 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG))
    {
      v108 = [v135 response];
      *(_DWORD *)buf = 136315394;
      v148 = "+[CDMPostProcessUtils runPostProcess:snlcRequest:snlcResponse:nLv4Request:nLv4Response:uaapNLProtoResponse:"
             "catiProtoResponse:pscRequest:pscResponse:lvcResponse:overridesProtoResponse:mdRequest:mdResponse:mrRequest:"
             "mrResponse:spanProtoResponse:rdResponse:tokenProtoResponse:ssuResponse:ccqrResponse:correctionOutcome:nluRe"
             "quest:graphInput:debugText:]";
      __int16 v149 = 2112;
      v150 = v108;
      _os_log_debug_impl(&dword_2263A0000, v83, OS_LOG_TYPE_DEBUG, "%s Found mention resolver spans, MR response: %@", buf, 0x16u);
    }
    long long v84 = [v135 response];
    long long v85 = [v84 mentions];
    [v79 addObjectsFromArray:v85];
  }
  long long v86 = [v128 response];
  long long v87 = [v86 tokenChain];
  +[CDMPostProcessUtils annotateNLUResponse:v67 nluRequest:v136 matchingSpans:v79 tokenChain:v87];

  long long v88 = [v130 languageVariantResult];
  [v67 setLanguageVariantResult:v88];

  long long v139 = 0u;
  long long v140 = 0u;
  long long v137 = 0u;
  long long v138 = 0u;
  unsigned int v89 = [v67 parses];
  uint64_t v90 = [v89 countByEnumeratingWithState:&v137 objects:v145 count:16];
  if (v90)
  {
    uint64_t v91 = v90;
    uint64_t v92 = *(void *)v138;
    do
    {
      for (uint64_t j = 0; j != v91; ++j)
      {
        if (*(void *)v138 != v92) {
          objc_enumerationMutation(v89);
        }
        [a1 mapVocGenericBundleIdsToPlatformBundleIdsForParse:*(void *)(*((void *)&v137 + 1) + 8 * j)];
      }
      uint64_t v91 = [v89 countByEnumeratingWithState:&v137 objects:v145 count:16];
    }
    while (v91);
  }

  long long v94 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v94, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v148 = "+[CDMPostProcessUtils runPostProcess:snlcRequest:snlcResponse:nLv4Request:nLv4Response:uaapNLProtoResponse:ca"
           "tiProtoResponse:pscRequest:pscResponse:lvcResponse:overridesProtoResponse:mdRequest:mdResponse:mrRequest:mrRe"
           "sponse:spanProtoResponse:rdResponse:tokenProtoResponse:ssuResponse:ccqrResponse:correctionOutcome:nluRequest:"
           "graphInput:debugText:]";
    _os_log_debug_impl(&dword_2263A0000, v94, OS_LOG_TYPE_DEBUG, "%s Annotate NLUResponse with external spans and rewrite message", buf, 0xCu);
  }

  long long v95 = [v127 rewriteMsg];
  if (!v95)
  {
    long long v96 = objc_opt_class();
    long long v97 = [v135 response];
    long long v98 = [v97 rewrittenUtterance];
    long long v95 = [v96 rewriteMessageFromMatchingSpans:v51 mrRewrittenUtterance:v98];
  }
  __int16 v99 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v99, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v148 = "+[CDMPostProcessUtils runPostProcess:snlcRequest:snlcResponse:nLv4Request:nLv4Response:uaapNLProtoResponse:ca"
           "tiProtoResponse:pscRequest:pscResponse:lvcResponse:overridesProtoResponse:mdRequest:mdResponse:mrRequest:mrRe"
           "sponse:spanProtoResponse:rdResponse:tokenProtoResponse:ssuResponse:ccqrResponse:correctionOutcome:nluRequest:"
           "graphInput:debugText:]";
    __int16 v149 = 2112;
    v150 = v95;
    _os_log_debug_impl(&dword_2263A0000, v99, OS_LOG_TYPE_DEBUG, "%s Rewrite message: %@", buf, 0x16u);
  }

  v100 = +[CDMPostProcessUtils supplementaryOutputFromMatchingSpans:v51 rewriteMessage:v95 correctionOutcome:v65];
  [v67 setSupplementaryOutput:v100];

  v101 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v101, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v107 = [v67 supplementaryOutput];
    *(_DWORD *)buf = 136315394;
    v148 = "+[CDMPostProcessUtils runPostProcess:snlcRequest:snlcResponse:nLv4Request:nLv4Response:uaapNLProtoResponse:ca"
           "tiProtoResponse:pscRequest:pscResponse:lvcResponse:overridesProtoResponse:mdRequest:mdResponse:mrRequest:mrRe"
           "sponse:spanProtoResponse:rdResponse:tokenProtoResponse:ssuResponse:ccqrResponse:correctionOutcome:nluRequest:"
           "graphInput:debugText:]";
    __int16 v149 = 2112;
    v150 = v107;
    _os_log_debug_impl(&dword_2263A0000, v101, OS_LOG_TYPE_DEBUG, "%s NLUResponse supplementaryOutput: %@", buf, 0x16u);
  }
  uint64_t v102 = [CDMAssistantNLUResponse alloc];
  v103 = [v67 requestId];
  v104 = [v103 idA];
  v105 = [(CDMAssistantNLUResponse *)v102 initWithNLUResponse:v67 requestId:v104];

  return v105;
}

@end