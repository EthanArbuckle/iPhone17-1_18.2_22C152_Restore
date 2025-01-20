@interface CDMShortcutService
+ (BOOL)isAssetRequired;
+ (id)getCDMServiceAssetConfig;
+ (id)voiceCommandPredicate;
- (BOOL)hasAutoShortcutIdentifier:(id)a3;
- (BOOL)isPhrase:(id)a3 inDenyList:(id)a4;
- (BOOL)shouldSpanComboProduceParse:(id)a3 prefixSpans:(id)a4 suffixSpans:(id)a5 tokenChain:(id)a6;
- (NSArray)denyList;
- (id)buildEmptyShortcutUserParse;
- (id)buildParseWithDelegatedUserDialogAct;
- (id)extractShortcutDataFromSpan:(id)a3;
- (id)filterExactMatchVoiceCommandSpans:(id)a3;
- (id)filterVoiceCommandPrefixMatchingSpans:(id)a3 voiceCommandSpan:(id)a4;
- (id)filterVoiceCommandSuffixMatchingSpans:(id)a3 voiceCommandSpan:(id)a4;
- (id)handle:(id)a3;
- (id)handleRequestCommandTypeNames;
- (id)handleVoiceCommandFollowUp:(id)a3;
- (id)loadDenyListFromBundle:(id)a3 languageCode:(id)a4;
- (id)setup:(id)a3;
- (id)validateDenyListArray:(id)a3;
- (void)setDenyList:(id)a3;
@end

@implementation CDMShortcutService

- (id)handleRequestCommandTypeNames
{
  v7[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v3 = +[CDMBaseCommand commandName];
  v7[0] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  v5 = [v2 setWithArray:v4];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_denyList, 0);
  objc_storeStrong((id *)&self->_nlAsset, 0);
}

- (void)setDenyList:(id)a3
{
}

- (NSArray)denyList
{
  return self->_denyList;
}

- (BOOL)hasAutoShortcutIdentifier:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v3 = [a3 usoGraph];
  v4 = [v3 identifiers];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    uint64_t v8 = *MEMORY[0x263F738A0];
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v10, "hasValue", (void)v14))
        {
          v11 = [v10 value];
          char v12 = [v11 hasPrefix:v8];

          if (v12)
          {
            LOBYTE(v6) = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v6;
}

- (BOOL)isPhrase:(id)a3 inDenyList:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 semanticValue];
  if ([v6 containsObject:v7])
  {
    char v8 = 1;
  }
  else
  {
    v9 = [v5 baseTemplateString];
    if (v9)
    {
      v10 = [v5 baseTemplateString];
      char v8 = [v6 containsObject:v10];
    }
    else
    {
      char v8 = 0;
    }
  }
  return v8;
}

- (id)validateDenyListArray:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v19 = "-[CDMShortcutService validateDenyListArray:]";
    __int16 v20 = 2112;
    id v21 = v3;
    _os_log_debug_impl(&dword_2263A0000, v4, OS_LOG_TYPE_DEBUG, "%s AutoShortcut deny list content: %@", buf, 0x16u);
  }

  if (v3)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v5);
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v10 = CDMOSLoggerForCategory(0);
            if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315138;
              uint64_t v19 = "-[CDMShortcutService validateDenyListArray:]";
              _os_log_error_impl(&dword_2263A0000, v10, OS_LOG_TYPE_ERROR, "%s [ERR]: AutoShortcut deny list has invalid content, returning empty list", buf, 0xCu);
            }

            goto LABEL_19;
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

    id v9 = v5;
  }
  else
  {
    v11 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v19 = "-[CDMShortcutService validateDenyListArray:]";
      _os_log_error_impl(&dword_2263A0000, v11, OS_LOG_TYPE_ERROR, "%s [ERR]: AutoShortcut deny list is nil, returning empty list", buf, 0xCu);
    }

LABEL_19:
    id v9 = (id)MEMORY[0x263EFFA68];
  }

  return v9;
}

- (id)loadDenyListFromBundle:(id)a3 languageCode:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  char v8 = v7;
  if (!v6)
  {
    id v9 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v20 = "-[CDMShortcutService loadDenyListFromBundle:languageCode:]";
      long long v16 = "%s Didn't receive a deny list bundle, will default to empty deny list";
LABEL_9:
      _os_log_impl(&dword_2263A0000, v9, OS_LOG_TYPE_INFO, v16, buf, 0xCu);
    }
LABEL_10:
    long long v15 = (void *)MEMORY[0x263EFFA68];
    goto LABEL_15;
  }
  if (!v7)
  {
    id v9 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v20 = "-[CDMShortcutService loadDenyListFromBundle:languageCode:]";
      long long v16 = "%s languageCode is nil, will default to empty deny list";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  id v9 = [NSString stringWithFormat:@"deny_list/deny_list_%@.plist", v7];
  v10 = [v6 resourcePath];
  v11 = [v10 stringByAppendingPathComponent:v9];

  char v12 = [MEMORY[0x263F08850] defaultManager];
  char v13 = [v12 fileExistsAtPath:v11];

  if (v13)
  {
    long long v14 = [MEMORY[0x263EFF8C0] arrayWithContentsOfFile:v11];
    long long v15 = [(CDMShortcutService *)self validateDenyListArray:v14];
  }
  else
  {
    long long v17 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v20 = "-[CDMShortcutService loadDenyListFromBundle:languageCode:]";
      __int16 v21 = 2112;
      uint64_t v22 = v11;
      _os_log_impl(&dword_2263A0000, v17, OS_LOG_TYPE_INFO, "%s Did not find deny list on disk at path %@, returning empty list", buf, 0x16u);
    }

    long long v15 = (void *)MEMORY[0x263EFFA68];
  }

LABEL_15:
  return v15;
}

- (id)extractShortcutDataFromSpan:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v3 = [a3 usoGraph];
  v4 = v3;
  if (v3
    && ([v3 nodes],
        id v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 count],
        v5,
        v6))
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v7 = [v4 nodes];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v31;
LABEL_5:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = *(void **)(*((void *)&v30 + 1) + 8 * v10);
        char v12 = [v11 stringPayload];
        BOOL v13 = v12 == 0;

        if (!v13) {
          break;
        }
        if (v8 == ++v10)
        {
          uint64_t v8 = [v7 countByEnumeratingWithState:&v30 objects:v35 count:16];
          if (v8) {
            goto LABEL_5;
          }
          goto LABEL_11;
        }
      }
      long long v15 = [v11 stringPayload];
      uint64_t v25 = [v15 value];

      if (!v25) {
        goto LABEL_22;
      }
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v16 = [v4 identifiers];
      long long v17 = (void *)[v16 countByEnumeratingWithState:&v26 objects:v34 count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v27;
        while (2)
        {
          for (uint64_t i = 0; i != v17; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v27 != v18) {
              objc_enumerationMutation(v16);
            }
            __int16 v20 = *(void **)(*((void *)&v26 + 1) + 8 * i);
            __int16 v21 = [v20 namespaceA];
            uint64_t v22 = [v21 value];
            int v23 = [v22 isEqualToString:@"autoShortcutBaseTemplate"];

            if (v23)
            {
              long long v17 = [v20 value];
              goto LABEL_24;
            }
          }
          long long v17 = (void *)[v16 countByEnumeratingWithState:&v26 objects:v34 count:16];
          if (v17) {
            continue;
          }
          break;
        }
      }
LABEL_24:

      long long v14 = [[CDMShortcutPhrase alloc] initWithSemanticValue:v25 baseTemplateString:v17];
      id v7 = (void *)v25;
    }
    else
    {
LABEL_11:
      long long v14 = 0;
    }
  }
  else
  {
LABEL_22:
    long long v14 = 0;
  }

  return v14;
}

- (id)handle:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:1];
  id v37 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v36 = [[CDMShortcutResponseCommand alloc] initWithVoiceCommandUserParses:v5 autoShortcutParses:v37];
  uint64_t v6 = [v4 currentTurnContext];
  id v7 = [(CDMShortcutService *)self handleVoiceCommandFollowUp:v6];

  if (v7)
  {
    uint64_t v8 = [v7 userDialogActs];
    if ([v8 count])
    {
      uint64_t v9 = [v7 userDialogActs];
      uint64_t v10 = [v9 objectAtIndexedSubscript:0];
      int v11 = [v10 hasDelegated];

      if (v11)
      {
        char v12 = CDMLogContext;
        if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_DEBUG))
        {
          int __p = 136315394;
          __p_4 = "-[CDMShortcutService handle:]";
          __int16 v40 = 2112;
          v41 = @"shortcut";
          _os_log_debug_impl(&dword_2263A0000, v12, OS_LOG_TYPE_DEBUG, "%s [insights-cdm-%@]:\nShortcut follow up request, routing to server", (uint8_t *)&__p, 0x16u);
        }
        [v5 addObject:v7];
        BOOL v13 = v36;
        goto LABEL_25;
      }
    }
    else
    {
    }
    long long v15 = [v4 matchingSpans];
    long long v16 = [(CDMShortcutService *)self filterExactMatchVoiceCommandSpans:v15];

    long long v17 = [v4 matchingSpans];
    v35 = [(CDMShortcutService *)self filterVoiceCommandPrefixMatchingSpans:v17 voiceCommandSpan:v16];

    uint64_t v18 = [v4 matchingSpans];
    v34 = [(CDMShortcutService *)self filterVoiceCommandSuffixMatchingSpans:v18 voiceCommandSpan:v16];

    uint64_t v19 = [v4 tokenChain];
    BOOL v20 = [(CDMShortcutService *)self shouldSpanComboProduceParse:v16 prefixSpans:v35 suffixSpans:v34 tokenChain:v19];

    if (v20)
    {
      uint64_t v21 = [(CDMShortcutService *)self extractShortcutDataFromSpan:v16];
      uint64_t v22 = CDMLogContext;
      long long v33 = (void *)v21;
      if (v21)
      {
        int v23 = (id)CDMLogContext;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          long long v30 = [v33 semanticValue];
          long long v31 = [v4 tokenChain];
          long long v32 = [v31 stringValue];
          int __p = 136315906;
          __p_4 = "-[CDMShortcutService handle:]";
          __int16 v40 = 2112;
          v41 = @"shortcut";
          __int16 v42 = 2112;
          v43 = v30;
          __int16 v44 = 2112;
          v45 = v32;
          _os_log_debug_impl(&dword_2263A0000, v23, OS_LOG_TYPE_DEBUG, "%s [insights-cdm-%@]:\nFound exact match Voice Command:%@, to utterance:%@ ", (uint8_t *)&__p, 0x2Au);
        }
        uint64_t v25 = *(void *)(siri::ontology::getSharedUsoVocabManager(v24) + 8);
        if (v25) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(v25 + 8), 1uLL, memory_order_relaxed);
        }
        operator new();
      }
      if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_DEBUG))
      {
        int __p = 136315394;
        __p_4 = "-[CDMShortcutService handle:]";
        __int16 v40 = 2112;
        v41 = @"shortcut";
        _os_log_debug_impl(&dword_2263A0000, v22, OS_LOG_TYPE_DEBUG, "%s [insights-cdm-%@]:\nMatching a top level shortcut, sending it to server", (uint8_t *)&__p, 0x16u);
      }
      long long v27 = [(CDMShortcutService *)self buildParseWithDelegatedUserDialogAct];
      [v5 addObject:v27];

      long long v28 = v36;
      BOOL v13 = v36;
    }
    else
    {
      long long v26 = CDMLogContext;
      if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_DEBUG))
      {
        int __p = 136315394;
        __p_4 = "-[CDMShortcutService handle:]";
        __int16 v40 = 2112;
        v41 = @"shortcut";
        _os_log_debug_impl(&dword_2263A0000, v26, OS_LOG_TYPE_DEBUG, "%s [insights-cdm-%@]:\nNo exact match Voice Command Found", (uint8_t *)&__p, 0x16u);
      }
      BOOL v13 = 0;
    }
  }
  else
  {
    long long v14 = CDMLogContext;
    if (os_log_type_enabled((os_log_t)CDMLogContext, OS_LOG_TYPE_DEBUG))
    {
      int __p = 136315394;
      __p_4 = "-[CDMShortcutService handle:]";
      __int16 v40 = 2112;
      v41 = @"shortcut";
      _os_log_debug_impl(&dword_2263A0000, v14, OS_LOG_TYPE_DEBUG, "%s [insights-cdm-%@]:\nFollow up turn with prompts/sdas, should not trigger voice commands", (uint8_t *)&__p, 0x16u);
    }
    BOOL v13 = 0;
  }
LABEL_25:

  return v13;
}

- (BOOL)shouldSpanComboProduceParse:(id)a3 prefixSpans:(id)a4 suffixSpans:(id)a5 tokenChain:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v45 = a5;
  id v11 = a6;
  char v12 = v11;
  if (!v9) {
    goto LABEL_25;
  }
  id v46 = v9;
  BOOL v13 = [v11 tokens];
  long long v14 = [v13 objectAtIndexedSubscript:0];
  int v15 = [v14 tokenIndex];

  long long v16 = [v12 tokens];
  long long v17 = [v16 lastObject];
  LODWORD(v13) = [v17 tokenIndex];

  int v18 = [v9 startTokenIndex];
  int v19 = [v9 endTokenIndex];
  int v20 = v13 + 1;
  if (v18 == v15 && v19 == v20) {
    goto LABEL_4;
  }
  int v44 = v19;
  if (![v10 count])
  {
    char v21 = v18 == v15;
    if (v18 != v15 || v44 == v20) {
      goto LABEL_26;
    }
LABEL_17:
    if ([v45 count])
    {
      v35 = [v45 lastObject];
      int v36 = [v35 endTokenIndex];

      if (v36 == v20)
      {
        id v37 = [v45 objectAtIndexedSubscript:0];
        BOOL v38 = +[CDMProtoSpanMatcherHelper isTrailingSpanAdjacent:v9 secondSpan:v37 tokenChain:v12];

        unint64_t v39 = 1;
        while ([v45 count] > v39 && v38)
        {
          unint64_t v40 = v39 - 1;
          v41 = [v45 objectAtIndexedSubscript:v40];
          __int16 v42 = [v45 objectAtIndexedSubscript:v40 + 1];
          BOOL v38 = +[CDMProtoSpanMatcherHelper isTrailingSpanAdjacent:v41 secondSpan:v42 tokenChain:v12];

          unint64_t v39 = v40 + 2;
          id v9 = v46;
        }
        if (v38)
        {
LABEL_4:
          char v21 = 1;
          goto LABEL_26;
        }
      }
    }
LABEL_25:
    char v21 = 0;
    goto LABEL_26;
  }
  uint64_t v22 = [v10 objectAtIndexedSubscript:0];
  BOOL v23 = +[CDMProtoSpanMatcherHelper isTrailingSpanAdjacent:v22 secondSpan:v9 tokenChain:v12];

  v24 = [v10 objectAtIndexedSubscript:0];
  BOOL v25 = [v24 startTokenIndex] == v15;

  for (unint64_t i = 1; [v10 count] > i && v25 && !v23; ++i)
  {
    long long v27 = [v10 objectAtIndexedSubscript:i - 1];
    long long v28 = [v27 label];
    if ([v28 isEqualToString:@"voiceTrigger"])
    {
    }
    else
    {
      long long v29 = [v10 objectAtIndexedSubscript:i];
      long long v30 = [v29 label];
      char v31 = [v30 isEqualToString:@"voiceTrigger"];

      if (v31)
      {
        char v21 = 0;
        goto LABEL_23;
      }
    }
    long long v32 = [v10 objectAtIndexedSubscript:i - 1];
    long long v33 = [v10 objectAtIndexedSubscript:i];
    BOOL v25 = +[CDMProtoSpanMatcherHelper isTrailingSpanAdjacent:v32 secondSpan:v33 tokenChain:v12];

    v34 = [v10 objectAtIndexedSubscript:i];
    BOOL v23 = +[CDMProtoSpanMatcherHelper isTrailingSpanAdjacent:v34 secondSpan:v46 tokenChain:v12];
  }
  char v21 = v25 && v23;
  if (!v25 || !v23)
  {
LABEL_23:
    id v9 = v46;
    goto LABEL_26;
  }
  id v9 = v46;
  if (v44 != v20) {
    goto LABEL_17;
  }
LABEL_26:

  return v21 & 1;
}

- (id)filterVoiceCommandSuffixMatchingSpans:(id)a3 voiceCommandSpan:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x263F08A98] predicateWithFormat:@"(SELF.label == %@) AND SELF.startTokenIndex >= %d", @"voiceCommandNameSuffix", objc_msgSend(v6, "endTokenIndex")];
  uint64_t v8 = [v5 filteredArrayUsingPredicate:v7];
  id v9 = +[CDMProtoSpanMatcherHelper ascendingStartIndexComparator];
  id v10 = [v8 sortedArrayUsingComparator:v9];

  return v10;
}

- (id)filterVoiceCommandPrefixMatchingSpans:(id)a3 voiceCommandSpan:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x263F08A98] predicateWithFormat:@"(SELF.label == %@ OR SELF.label== %@) AND SELF.endTokenIndex <= %d", @"voiceTrigger", @"voiceCommandNamePrefix", objc_msgSend(v6, "startTokenIndex")];
  uint64_t v8 = [v5 filteredArrayUsingPredicate:v7];
  id v9 = +[CDMProtoSpanMatcherHelper ascendingStartIndexComparator];
  id v10 = [v8 sortedArrayUsingComparator:v9];

  return v10;
}

- (id)filterExactMatchVoiceCommandSpans:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = +[CDMShortcutService voiceCommandPredicate];
  id v5 = [v3 filteredArrayUsingPredicate:v4];

  if ([v5 count])
  {
    id v6 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v11 = 136315138;
      char v12 = "-[CDMShortcutService filterExactMatchVoiceCommandSpans:]";
      _os_log_debug_impl(&dword_2263A0000, v6, OS_LOG_TYPE_DEBUG, "%s Have overlapping voiceCommandName spans, taking the longest one. When tie, prioritizes SiriVocab span", (uint8_t *)&v11, 0xCu);
    }

    id v7 = +[CDMProtoSpanMatcherHelper voiceCommandSpanComparator];
    uint64_t v8 = [v5 sortedArrayUsingComparator:v7];

    id v9 = [v8 objectAtIndexedSubscript:0];
    id v5 = v8;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)handleVoiceCommandFollowUp:(id)a3
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v45 = a3;
  if (![v45 hasLegacyNlContext]) {
    goto LABEL_9;
  }
  id v4 = [v45 legacyNlContext];
  if (![v4 strictPrompt])
  {
    id v5 = [v45 legacyNlContext];
    int v6 = [v5 dictationPrompt];

    if (v6) {
      goto LABEL_5;
    }
LABEL_9:
    if ([v45 hasNlContext])
    {
      char v12 = [v45 nlContext];
      uint64_t v13 = [v12 systemDialogActs];

      __int16 v42 = self;
      if (v13)
      {
        v41 = v13;
        if ([v13 count])
        {
          long long v52 = 0u;
          long long v53 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          id obj = v13;
          uint64_t v14 = [obj countByEnumeratingWithState:&v50 objects:v55 count:16];
          if (!v14) {
            goto LABEL_22;
          }
          uint64_t v15 = *(void *)v51;
LABEL_14:
          uint64_t v16 = 0;
          while (1)
          {
            if (*(void *)v51 != v15) {
              objc_enumerationMutation(obj);
            }
            id v17 = *(id *)(*((void *)&v50 + 1) + 8 * v16);
            if (([v17 hasGaveOptions] & 1) != 0
              || ([v17 hasOffered] & 1) != 0
              || [v17 hasPrompted])
            {
              break;
            }

            if (v14 == ++v16)
            {
              uint64_t v14 = [obj countByEnumeratingWithState:&v50 objects:v55 count:16];
              if (!v14)
              {
LABEL_22:

                uint64_t v13 = v41;
                goto LABEL_23;
              }
              goto LABEL_14;
            }
          }
          if (+[SiriNLUTypesUtils isSdaAskRepeat:v17])
          {
            int v18 = [(CDMShortcutService *)self buildEmptyShortcutUserParse];
LABEL_64:

            goto LABEL_28;
          }
          int v20 = [v45 nlContext];
          unint64_t v40 = [v20 activeTasks];

          BOOL v21 = +[CDMFeatureFlags isShortcutsNLv4FollowupEnabled];
          if (v40) {
            char v22 = v21;
          }
          else {
            char v22 = 1;
          }
          if ((v22 & 1) != 0 || ![v40 count])
          {
            int v18 = 0;
          }
          else
          {
            long long v48 = 0u;
            long long v49 = 0u;
            long long v46 = 0u;
            long long v47 = 0u;
            id v44 = v40;
            uint64_t v23 = [v44 countByEnumeratingWithState:&v46 objects:v54 count:16];
            if (v23)
            {
              uint64_t v24 = *(void *)v47;
              do
              {
                for (uint64_t i = 0; i != v23; ++i)
                {
                  if (*(void *)v47 != v24) {
                    objc_enumerationMutation(v44);
                  }
                  long long v26 = *(void **)(*((void *)&v46 + 1) + 8 * i);
                  if (v26)
                  {
                    long long v27 = [*(id *)(*((void *)&v46 + 1) + 8 * i) task];
                    BOOL v28 = v27 == 0;

                    if (!v28)
                    {
                      long long v29 = [v26 task];
                      long long v30 = [v29 nodes];
                      if (v30)
                      {
                        char v31 = [v29 edges];
                        if (!v31) {
                          goto LABEL_56;
                        }
                        long long v32 = [v29 nodes];
                        if ([v32 count] != 2) {
                          goto LABEL_54;
                        }
                        long long v33 = [v29 edges];
                        BOOL v34 = [v33 count] == 1;

                        if (v34)
                        {
                          long long v30 = [v29 nodes];
                          char v31 = [v30 objectAtIndexedSubscript:0];
                          if ([v31 usoElementId] == 1)
                          {
                            long long v32 = [v29 nodes];
                            v35 = [v32 objectAtIndexedSubscript:1];
                            if ([v35 usoElementId] == 1808)
                            {
                              unint64_t v39 = [v29 edges];
                              BOOL v38 = [v39 objectAtIndexedSubscript:0];
                              int v36 = [v38 label];
                              BOOL v37 = [v36 usoElementId] == 861;

                              if (v37)
                              {
                                int v18 = [(CDMShortcutService *)v42 buildParseWithDelegatedUserDialogAct];

                                goto LABEL_61;
                              }
                              goto LABEL_57;
                            }

LABEL_54:
                          }

LABEL_56:
                        }
                      }
LABEL_57:

                      continue;
                    }
                  }
                }
                uint64_t v23 = [v44 countByEnumeratingWithState:&v46 objects:v54 count:16];
              }
              while (v23);
            }
            int v18 = 0;
LABEL_61:
          }
          goto LABEL_64;
        }
      }
LABEL_23:
    }
    uint64_t v11 = [(CDMShortcutService *)self buildEmptyShortcutUserParse];
    goto LABEL_25;
  }

LABEL_5:
  if (!+[CDMFeatureFlags isShortcutsNLv4FollowupEnabled])
  {
    id v7 = [v45 legacyNlContext];
    if ([v7 hasPreviousDomainName])
    {
      uint64_t v8 = [v45 legacyNlContext];
      id v9 = [v8 previousDomainName];
      int v10 = [v9 isEqualToString:@"voiceCommands"];

      if (v10)
      {
        uint64_t v11 = [(CDMShortcutService *)self buildParseWithDelegatedUserDialogAct];
LABEL_25:
        int v18 = (void *)v11;
        goto LABEL_28;
      }
    }
    else
    {
    }
  }
  int v18 = 0;
LABEL_28:

  return v18;
}

- (id)buildParseWithDelegatedUserDialogAct
{
  id v3 = objc_alloc_init(MEMORY[0x263F71CD0]);
  [v3 setAsrHypothesisIndex:0];
  [v3 setExternalParserId:@"com.apple.siri.nlv3"];
  id v4 = objc_alloc_init(MEMORY[0x263F71D80]);
  [v4 setDelegated:v3];
  id v5 = [MEMORY[0x263EFF980] array];
  [v5 addObject:v4];
  int v6 = [(CDMShortcutService *)self buildEmptyShortcutUserParse];
  [v6 setUserDialogActs:v5];

  return v6;
}

- (id)buildEmptyShortcutUserParse
{
  id v2 = objc_alloc_init(MEMORY[0x263F71D88]);
  id v3 = (void *)MEMORY[0x263F71F48];
  id v4 = objc_alloc_init(MEMORY[0x263F08C38]);
  id v5 = [v3 convertFromUUID:v4];
  [v2 setIdA:v5];

  [v2 setProbability:1.0];
  id v6 = objc_alloc_init(MEMORY[0x263F71D10]);
  [v2 setRepetitionResult:v6];

  id v7 = objc_alloc_init(MEMORY[0x263F71D00]);
  [v7 setAlgorithm:1];
  [v7 setParserId:5];
  [v2 setParser:v7];

  return v2;
}

- (id)setup:(id)a3
{
  id v4 = a3;
  self->super.super._serviceState = 2;
  id v5 = [v4 dynamicConfig];
  id v6 = [v5 getAssetForFactorName:@"com.apple.siri.nl.autoshortcuts"];
  nlAsset = self->_nlAsset;
  self->_nlAsset = v6;

  uint64_t v8 = [v4 dynamicConfig];
  id v9 = [v8 getAssetBundlePathForFactorName:@"com.apple.siri.nl.autoshortcuts"];

  int v10 = [v4 dynamicConfig];
  uint64_t v11 = [v10 languageCode];
  char v12 = [(CDMShortcutService *)self loadDenyListFromBundle:v9 languageCode:v11];
  denyList = self->_denyList;
  self->_denyList = v12;

  uint64_t v14 = [(CDMBaseService *)self createSetupResponseCommand];

  return v14;
}

+ (BOOL)isAssetRequired
{
  return 0;
}

+ (id)getCDMServiceAssetConfig
{
  v6[1] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(CDMServiceAssetConfig);
  id v5 = @"com.apple.siri.nl.autoshortcuts";
  v6[0] = &unk_26DA3E610;
  id v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];
  [(CDMServiceAssetConfig *)v2 addCDMFactorToFoldersMapping:v3 forAssetSet:0];

  [(CDMServiceAssetConfig *)v2 setIsAssetRequiredForSetup:0];
  return v2;
}

+ (id)voiceCommandPredicate
{
  if (+[CDMShortcutService voiceCommandPredicate]::onceToken != -1) {
    dispatch_once(&+[CDMShortcutService voiceCommandPredicate]::onceToken, &__block_literal_global_10195);
  }
  id v2 = (void *)+[CDMShortcutService voiceCommandPredicate]::value;
  return v2;
}

uint64_t __43__CDMShortcutService_voiceCommandPredicate__block_invoke()
{
  +[CDMShortcutService voiceCommandPredicate]::value = [MEMORY[0x263F08A98] predicateWithFormat:@"SELF.label == %@", @"voiceCommandName"];
  return MEMORY[0x270F9A758]();
}

@end