@interface CDMVocTrieProtoSpanMatcher
+ (id)getCDMServiceAssetConfig;
+ (id)spanIdentifierCountComparator;
- (BOOL)utteranceStartsWithVoiceTriggerSpan:(id)a3;
- (CDMVocTrieProtoSpanMatcher)initWithVocTriePath:(id)a3 useNormalizedValues:(BOOL)a4;
- (id)matchSpansForTokenChain:(id)a3 asrHypothesis:(id)a4;
@end

@implementation CDMVocTrieProtoSpanMatcher

- (void).cxx_destruct
{
}

- (id)matchSpansForTokenChain:(id)a3 asrHypothesis:(id)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x263EFF980] array];
  os_signpost_id_t v9 = os_signpost_id_generate((os_log_t)CDMLogContext);
  v10 = (id)CDMLogContext;
  v11 = v10;
  unint64_t v12 = v9 - 1;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v14;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "SpanMatcher", "%{public}@", (uint8_t *)&buf, 0xCu);
  }
  if (self->trie)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v41 = 0x2020000000;
    char v42 = 0;
    uint64_t v34 = 0;
    v35 = &v34;
    uint64_t v36 = 0x2020000000;
    int v37 = 0;
    v15 = self;
    BOOL useNormalizedValues = self->useNormalizedValues;
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __68__CDMVocTrieProtoSpanMatcher_matchSpansForTokenChain_asrHypothesis___block_invoke;
    v29[3] = &unk_2647A5260;
    v29[4] = v15;
    id v30 = v6;
    p_long long buf = &buf;
    v33 = &v34;
    id v17 = v8;
    id v31 = v17;
    +[CDMProtoSpanMatcherHelper enumerateTokenChain:v30 useNormalizedValues:useNormalizedValues withCallback:v29];
    os_signpost_id_t v18 = v9;
    if (*(unsigned char *)(*((void *)&buf + 1) + 24) && *((_DWORD *)v35 + 6))
    {
      v19 = [MEMORY[0x263F08A98] predicateWithFormat:@"NOT(SELF.startTokenIndex >= %d AND SELF.endTokenIndex <= %d AND SELF.label !=%@)", 0, *((unsigned int *)v35 + 6), @"voiceTrigger"];
      v20 = (id)CDMLogContext;
      v21 = v20;
      if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
      {
        *(_WORD *)v38 = 0;
        _os_signpost_emit_with_name_impl(&dword_2263A0000, v21, OS_SIGNPOST_INTERVAL_END, v18, "SpanMatcher", "", v38, 2u);
      }

      id v22 = [v17 filteredArrayUsingPredicate:v19];
    }
    else
    {
      v23 = (id)CDMLogContext;
      v24 = v23;
      if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
      {
        *(_WORD *)v38 = 0;
        _os_signpost_emit_with_name_impl(&dword_2263A0000, v24, OS_SIGNPOST_INTERVAL_END, v9, "SpanMatcher", "", v38, 2u);
      }

      if ((unint64_t)[v17 count] < 0x65)
      {
        id v22 = v17;
      }
      else
      {
        v25 = CDMOSLoggerForCategory(0);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v38 = 136315138;
          v39 = "-[CDMVocTrieProtoSpanMatcher matchSpansForTokenChain:asrHypothesis:]";
          _os_log_debug_impl(&dword_2263A0000, v25, OS_LOG_TYPE_DEBUG, "%s VOC spans exceeding 100, sort based on identifer count to promote important spans", v38, 0xCu);
        }

        v26 = [(id)objc_opt_class() spanIdentifierCountComparator];
        id v22 = [v17 sortedArrayUsingComparator:v26];
      }
    }

    _Block_object_dispose(&v34, 8);
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    v27 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[CDMVocTrieProtoSpanMatcher matchSpansForTokenChain:asrHypothesis:]";
      _os_log_impl(&dword_2263A0000, v27, OS_LOG_TYPE_INFO, "%s VocTrie Invalid", (uint8_t *)&buf, 0xCu);
    }

    id v22 = v8;
  }

  return v22;
}

void __68__CDMVocTrieProtoSpanMatcher_matchSpansForTokenChain_asrHypothesis___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v9 = a2;
  v10 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 136315394;
    v70 = "-[CDMVocTrieProtoSpanMatcher matchSpansForTokenChain:asrHypothesis:]_block_invoke";
    __int16 v71 = 2112;
    id v72 = v9;
    _os_log_debug_impl(&dword_2263A0000, v10, OS_LOG_TYPE_DEBUG, "%s Voc matcher Matching search chunk: %@", buf, 0x16u);
  }

  v51 = v9;
  [*(id *)(*(void *)(a1 + 32) + 8) entriesForText:v9];
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v61 = [obj countByEnumeratingWithState:&v64 objects:v68 count:16];
  if (v61)
  {
    unsigned int v59 = a5 + a6;
    uint64_t v58 = a5 + a6;
    unsigned int v56 = a3 + a4;
    uint64_t v57 = *(void *)v65;
    uint64_t v52 = a5;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v65 != v57) {
          objc_enumerationMutation(obj);
        }
        unint64_t v12 = *(void **)(*((void *)&v64 + 1) + 8 * v11);
        uint64_t v13 = MEMORY[0x22A656D00]();
        v14 = [*(id *)(a1 + 40) string];
        v15 = objc_msgSend(v14, "substringWithRange:", a3, a4);

        v16 = [v12 label];
        id v17 = +[CDMProtoSpanMatcherHelper buildMatchingSpanProtoWithLabel:v16 inputStringForDebug:v15 startTokenIndex:a5 endTokenIndex:v59 spanMatcherName:3];

        if ([*(id *)(a1 + 32) utteranceStartsWithVoiceTriggerSpan:v17])
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
          *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v17 endTokenIndex];
        }
        uint64_t v18 = [*(id *)(a1 + 40) nonWhiteSpaceCountFromToken:a5 toToken:v58];
        v19 = [v12 semantic];
        [v17 setSemanticValue:v19];

        v20 = [v12 usoGraph];

        v63 = (void *)v13;
        if (v20)
        {
          v21 = CDMOSLoggerForCategory(0);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)long long buf = 136315138;
            v70 = "-[CDMVocTrieProtoSpanMatcher matchSpansForTokenChain:asrHypothesis:]_block_invoke";
            _os_log_debug_impl(&dword_2263A0000, v21, OS_LOG_TYPE_DEBUG, "%s Voc matcher got UsoGraph from asset", buf, 0xCu);
          }

          id v22 = [v12 usoGraph];
          [v17 setUsoGraph:v22];

          v23 = [v12 usoGraph];
          uint64_t v24 = [v23 nodesCount];

          if (v24 == 1)
          {
            v25 = CDMOSLoggerForCategory(0);
            if (!os_log_type_enabled(v25, OS_LOG_TYPE_INFO)) {
              goto LABEL_33;
            }
            *(_DWORD *)long long buf = 136315138;
            v70 = "-[CDMVocTrieProtoSpanMatcher matchSpansForTokenChain:asrHypothesis:]_block_invoke";
            v26 = v25;
            v27 = "%s [WARN]: VOC span UsoGraph only has 1 root node, not going to attach alignments or identifiers";
LABEL_32:
            _os_log_impl(&dword_2263A0000, v26, OS_LOG_TYPE_INFO, v27, buf, 0xCu);
            goto LABEL_33;
          }
          unsigned int v54 = v18;
          id v31 = [v12 usoGraph];
          unint64_t v32 = [v31 nodesCount];
          int v33 = [v12 nodeIndex];

          if (v32 <= v33)
          {
            v25 = CDMOSLoggerForCategory(0);
            if (!os_log_type_enabled(v25, OS_LOG_TYPE_INFO)) {
              goto LABEL_33;
            }
            *(_DWORD *)long long buf = 136315138;
            v70 = "-[CDMVocTrieProtoSpanMatcher matchSpansForTokenChain:asrHypothesis:]_block_invoke";
            v26 = v25;
            v27 = "%s [WARN]: VOC span UsoGraph node index invalid";
            goto LABEL_32;
          }
          v25 = +[CDMProtoSpanMatcherHelper buildUtteranceAlignments:endCharIndex:nodeIndex:](CDMProtoSpanMatcherHelper, "buildUtteranceAlignments:endCharIndex:nodeIndex:", a3, v56, [v12 nodeIndex]);
          if (v25)
          {
            uint64_t v34 = [v17 usoGraph];
            [v34 addAlignments:v25];
          }
          v35 = [v17 usoGraph];
          uint64_t v36 = [v35 nodes];
          int v37 = objc_msgSend(v36, "objectAtIndexedSubscript:", (int)objc_msgSend(v12, "nodeIndex"));

          if ([v37 usoElementId] == 1206)
          {
            id v38 = objc_alloc_init(MEMORY[0x263F71C88]);
            [v38 setValue:v15];
            [v37 setStringPayload:v38];
          }
          v53 = v37;
          v39 = [v12 label];
          v40 = [v12 semantic];
          uint64_t v41 = +[CDMProtoSpanMatcherHelper buildUsoIdentifier:semantic:nodeIndex:](CDMProtoSpanMatcherHelper, "buildUsoIdentifier:semantic:nodeIndex:", v39, v40, [v12 nodeIndex]);

          if (v41)
          {
            char v42 = [v17 usoGraph];
            [v42 addIdentifiers:v41];
          }
          a5 = v52;
          if (+[CDMFeatureFlags isUsoEntitySpanEnabled])
          {
            uint64_t v43 = [v12 label];
            v44 = [v12 semantic];
            v45 = +[CDMProtoSpanMatcherHelper buildUsoEntitySpan:semantic:nodeIndex:startIndex:endIndex:tokenCount:](CDMProtoSpanMatcherHelper, "buildUsoEntitySpan:semantic:nodeIndex:startIndex:endIndex:tokenCount:", v43, v44, [v12 nodeIndex], a3, v56, v54);

            if (v45)
            {
              v46 = [v17 usoGraph];
              [v46 addSpans:v45];
            }
            a5 = v52;
          }
        }
        else
        {
          v28 = [v12 label];
          v29 = [v12 semantic];
          id v30 = +[CDMVocUsoGraphMapper buildVocUSOGraphWithVocLabel:v28 withSemantic:v29 withInput:v15 withStartCharIndex:a3 withEndCharIndex:v56 withTokenCount:v18];
          [v17 setUsoGraph:v30];

          v25 = CDMOSLoggerForCategory(0);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)long long buf = 136315138;
            v70 = "-[CDMVocTrieProtoSpanMatcher matchSpansForTokenChain:asrHypothesis:]_block_invoke";
            _os_log_debug_impl(&dword_2263A0000, v25, OS_LOG_TYPE_DEBUG, "%s Voc matcher got (potentially empty) UsoGraph from mapper code", buf, 0xCu);
          }
        }
LABEL_33:

        v47 = [v17 label];
        if ([v47 isEqualToString:@"language"])
        {

          v48 = v63;
LABEL_36:
          [*(id *)(a1 + 48) insertObject:v17 atIndex:0];
          goto LABEL_38;
        }
        v49 = [v17 label];
        int v50 = [v49 isEqualToString:@"mediaLanguage"];

        v48 = v63;
        if (v50) {
          goto LABEL_36;
        }
        [*(id *)(a1 + 48) addObject:v17];
LABEL_38:

        ++v11;
      }
      while (v61 != v11);
      uint64_t v61 = [obj countByEnumeratingWithState:&v64 objects:v68 count:16];
    }
    while (v61);
  }
}

- (BOOL)utteranceStartsWithVoiceTriggerSpan:(id)a3
{
  id v3 = a3;
  if ([v3 startTokenIndex])
  {
    char v4 = 0;
  }
  else
  {
    v5 = [v3 label];
    char v4 = [v5 isEqualToString:@"voiceTrigger"];
  }
  return v4;
}

- (CDMVocTrieProtoSpanMatcher)initWithVocTriePath:(id)a3 useNormalizedValues:(BOOL)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CDMVocTrieProtoSpanMatcher;
  id v7 = [(CDMVocTrieProtoSpanMatcher *)&v11 init];
  if (v7)
  {
    v8 = [[CDMVocTrie alloc] initWithTriePath:v6];
    trie = v7->trie;
    v7->trie = v8;

    v7->BOOL useNormalizedValues = a4;
  }

  return v7;
}

+ (id)spanIdentifierCountComparator
{
  return &__block_literal_global_7364;
}

uint64_t __59__CDMVocTrieProtoSpanMatcher_spanIdentifierCountComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if (([v4 hasUsoGraph] & 1) == 0 && !objc_msgSend(v5, "hasUsoGraph"))
  {
    uint64_t v10 = 0;
    goto LABEL_10;
  }
  if (![v4 hasUsoGraph]) {
    goto LABEL_9;
  }
  if ([v5 hasUsoGraph])
  {
    id v6 = [v4 usoGraph];
    unint64_t v7 = [v6 spansCount];
    v8 = [v5 usoGraph];
    unint64_t v9 = [v8 spansCount];

    if (v7 <= v9)
    {
      objc_super v11 = [v4 usoGraph];
      unint64_t v12 = [v11 spansCount];
      uint64_t v13 = [v5 usoGraph];
      unint64_t v14 = [v13 spansCount];

      if (v12 >= v14)
      {
        v16 = [v4 usoGraph];
        unint64_t v17 = [v16 identifiersCount];
        uint64_t v18 = [v5 usoGraph];
        unint64_t v19 = [v18 identifiersCount];

        if (v17 <= v19)
        {
          v20 = [v4 usoGraph];
          unint64_t v21 = [v20 identifiersCount];
          id v22 = [v5 usoGraph];
          uint64_t v10 = v21 < [v22 identifiersCount];

          goto LABEL_10;
        }
        goto LABEL_6;
      }
LABEL_9:
      uint64_t v10 = 1;
      goto LABEL_10;
    }
  }
LABEL_6:
  uint64_t v10 = -1;
LABEL_10:

  return v10;
}

+ (id)getCDMServiceAssetConfig
{
  v8[1] = *MEMORY[0x263EF8340];
  v2 = objc_alloc_init(CDMServiceAssetConfig);
  id v6 = @"vocTrie";
  unint64_t v7 = @"com.apple.siri.nl.voc";
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v6 count:1];
  v8[0] = v3;
  id v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [(CDMServiceAssetConfig *)v2 addCDMFactorToFoldersMapping:v4 forAssetSet:0];

  return v2;
}

@end