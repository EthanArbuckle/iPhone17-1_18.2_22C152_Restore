@interface CDMProtoSpanMatcherHelper
+ (BOOL)isTrailingSpanAdjacent:(id)a3 secondSpan:(id)a4 tokenChain:(id)a5;
+ (id)ascendingStartIndexComparator;
+ (id)buildMatchingSpanProtoWithLabel:(id)a3 inputStringForDebug:(id)a4 startTokenIndex:(unsigned int)a5 endTokenIndex:(unsigned int)a6 spanMatcherName:(int)a7;
+ (id)buildMatchingSpanProtoWithLabel:(id)a3 inputStringForDebug:(id)a4 startTokenIndex:(unsigned int)a5 endTokenIndex:(unsigned int)a6 startCharIndex:(unsigned int)a7 endCharIndex:(unsigned int)a8 spanMatcherName:(int)a9;
+ (id)buildUsoEntitySpan:(id)a3 semantic:(id)a4 nodeIndex:(int)a5 startIndex:(unsigned int)a6 endIndex:(unsigned int)a7 tokenCount:(unsigned int)a8;
+ (id)buildUsoIdentifier:(id)a3 semantic:(id)a4 nodeIndex:(int)a5;
+ (id)buildUtteranceAlignments:(unsigned int)a3 endCharIndex:(unsigned int)a4 nodeIndex:(int)a5;
+ (id)descendingLengthComparator;
+ (id)voiceCommandSpanComparator;
+ (void)enumerateTokenChain:(id)a3 useNormalizedValues:(BOOL)a4 withCallback:(id)a5;
@end

@implementation CDMProtoSpanMatcherHelper

+ (BOOL)isTrailingSpanAdjacent:(id)a3 secondSpan:(id)a4 tokenChain:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  int v10 = [v7 endTokenIndex];
  if (v10 == [v8 startTokenIndex]) {
    goto LABEL_2;
  }
  unsigned int v12 = [v7 endTokenIndex];
  if (v12 > [v8 startTokenIndex]
    || (int v13 = [v7 endTokenIndex],
        [v9 tokens],
        v14 = objc_claimAutoreleasedReturnValue(),
        uint64_t v15 = [v14 count],
        v14,
        v15 == v13))
  {
LABEL_13:
    char v11 = 0;
    goto LABEL_14;
  }
  unsigned int v16 = [v7 endTokenIndex];
  v17 = [v9 tokens];
  if ([v17 count] < (unint64_t)v16)
  {

    goto LABEL_13;
  }
  unsigned int v18 = [v8 startTokenIndex];
  v19 = [v9 tokens];
  unint64_t v20 = [v19 count];

  if (v20 <= v18) {
    goto LABEL_13;
  }
  LODWORD(v21) = [v7 endTokenIndex];
  if (v21 >= [v8 startTokenIndex])
  {
LABEL_2:
    char v11 = 1;
    goto LABEL_14;
  }
  uint64_t v21 = (int)v21;
  do
  {
    v22 = [v9 tokens];
    v23 = [v22 objectAtIndexedSubscript:v21];
    int v24 = [v23 isSignificant];

    if (v24) {
      break;
    }
    ++v21;
  }
  while ([v8 startTokenIndex] > v21);
  char v11 = v24 ^ 1;
LABEL_14:

  return v11;
}

+ (id)buildUtteranceAlignments:(unsigned int)a3 endCharIndex:(unsigned int)a4 nodeIndex:(int)a5
{
  if (a5)
  {
    uint64_t v5 = *(void *)&a5;
    uint64_t v6 = *(void *)&a4;
    uint64_t v7 = *(void *)&a3;
    id v8 = objc_alloc_init(MEMORY[0x263F71DB8]);
    id v9 = objc_alloc_init(MEMORY[0x263F71DC0]);
    [v9 setStartIndex:v7];
    [v9 setEndIndex:v6];
    int v10 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v9, 0);
    [v8 setSpans:v10];

    [v8 setNodeIndex:v5];
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

+ (id)buildUsoEntitySpan:(id)a3 semantic:(id)a4 nodeIndex:(int)a5 startIndex:(unsigned int)a6 endIndex:(unsigned int)a7 tokenCount:(unsigned int)a8
{
  if (a5)
  {
    uint64_t v8 = *(void *)&a8;
    uint64_t v9 = *(void *)&a7;
    uint64_t v10 = *(void *)&a6;
    uint64_t v11 = *(void *)&a5;
    int v13 = (objc_class *)MEMORY[0x263F71DA0];
    id v14 = a4;
    id v15 = a3;
    id v16 = objc_alloc_init(v13);
    [v16 setNodeIndex:v11];
    id v17 = objc_alloc_init(MEMORY[0x263F71D58]);
    [v17 setKey:v15];

    id v18 = objc_alloc_init(MEMORY[0x263F71C88]);
    [v18 setValue:v14];

    [v17 setValueString:v18];
    [v16 addProperties:v17];
    [v16 setSourceComponent:2];
    id v19 = objc_alloc_init(MEMORY[0x263F71C88]);
    [v19 setValue:*MEMORY[0x263F737F0]];
    [v16 setOriginAppId:v19];
    id v20 = objc_alloc_init(MEMORY[0x263F71C90]);
    [v20 setValue:v10];
    [v16 setStartIndex:v20];
    id v21 = objc_alloc_init(MEMORY[0x263F71C90]);
    [v21 setValue:v9];
    [v16 setEndIndex:v21];
    id v22 = objc_alloc_init(MEMORY[0x263F71CE0]);
    id v23 = objc_alloc_init(MEMORY[0x263F71C90]);
    [v23 setValue:v8];
    [v22 setMatchedTokenCount:v23];
    [v16 setMatchInfo:v22];
  }
  else
  {
    id v16 = 0;
  }
  return v16;
}

+ (id)buildUsoIdentifier:(id)a3 semantic:(id)a4 nodeIndex:(int)a5
{
  if (a5)
  {
    uint64_t v5 = *(void *)&a5;
    uint64_t v7 = (objc_class *)MEMORY[0x263F71D98];
    id v8 = a4;
    id v9 = a3;
    id v10 = objc_alloc_init(v7);
    [v10 setValue:v8];

    id v11 = objc_alloc_init(MEMORY[0x263F71C88]);
    [v11 setValue:v9];

    [v10 setNamespaceA:v11];
    [v10 setSourceComponent:2];
    [v10 setBackingAppBundleId:*MEMORY[0x263F737F0]];
    [v10 setNodeIndex:v5];
  }
  else
  {
    id v10 = 0;
  }
  return v10;
}

+ (id)buildMatchingSpanProtoWithLabel:(id)a3 inputStringForDebug:(id)a4 startTokenIndex:(unsigned int)a5 endTokenIndex:(unsigned int)a6 spanMatcherName:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  uint64_t v8 = *(void *)&a6;
  uint64_t v9 = *(void *)&a5;
  id v11 = (objc_class *)MEMORY[0x263F71E58];
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_alloc_init(v11);
  [v14 setLabel:v13];

  [v14 setInput:v12];
  [v14 setStartTokenIndex:v9];
  [v14 setEndTokenIndex:v8];
  [v14 addMatcherNames:v7];
  return v14;
}

+ (id)buildMatchingSpanProtoWithLabel:(id)a3 inputStringForDebug:(id)a4 startTokenIndex:(unsigned int)a5 endTokenIndex:(unsigned int)a6 startCharIndex:(unsigned int)a7 endCharIndex:(unsigned int)a8 spanMatcherName:(int)a9
{
  uint64_t v9 = objc_msgSend(a1, "buildMatchingSpanProtoWithLabel:inputStringForDebug:startTokenIndex:endTokenIndex:spanMatcherName:", a3, a4, *(void *)&a5, *(void *)&a6, a9, *(void *)&a8);
  id v10 = objc_alloc_init(MEMORY[0x263F71DA8]);
  [v9 setUsoGraph:v10];

  return v9;
}

+ (void)enumerateTokenChain:(id)a3 useNormalizedValues:(BOOL)a4 withCallback:(id)a5
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v43 = (void (**)(id, void *, uint64_t, uint64_t, unint64_t, uint64_t, char *))a5;
  uint64_t v7 = [v6 tokens];
  if ([v7 count])
  {
    unint64_t v9 = 0;
    *(void *)&long long v8 = 136316162;
    long long v41 = v8;
    id v42 = v6;
    do
    {
      id v10 = objc_msgSend(v7, "objectAtIndexedSubscript:", v9, v41);
      int v11 = [v10 isSignificant];

      if (v11)
      {
        char v50 = 0;
        id v12 = [MEMORY[0x263F089D8] string];
        if ([v7 count] > v9 && !v50)
        {
          unint64_t v13 = v9;
          while (1)
          {
            id v14 = [v7 objectAtIndexedSubscript:v13];
            char v15 = [v14 isSignificant];

            if ((v15 & 1) == 0)
            {
              v26 = [v7 objectAtIndexedSubscript:v13];
              v27 = [v26 value];
              [v12 appendString:v27];
              goto LABEL_14;
            }
            id v16 = [v7 objectAtIndexedSubscript:v9];
            uint64_t v17 = [v16 begin];
            id v18 = [v7 objectAtIndexedSubscript:v13];
            uint64_t v19 = [v18 end];
            id v20 = [v7 objectAtIndexedSubscript:v9];
            uint64_t v21 = v19 - [v20 begin];

            uint64_t v45 = (int)v13 - (int)v9 + 1;
            if (a4) {
              break;
            }
            id v22 = [v7 objectAtIndexedSubscript:v13];
            int v23 = [v22 getHasCleanValues];

            if (!v23) {
              break;
            }
            int v24 = [v6 normalizedString];
            unint64_t v25 = [v24 length];

            if (v21 + v17 > v25)
            {
              v26 = CDMOSLoggerForCategory(0);
              if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
              {
                v27 = [v6 normalizedString];
                v28 = [v6 normalizedString];
                uint64_t v29 = [v28 length];
                *(_DWORD *)buf = v41;
                v53 = "+[CDMProtoSpanMatcherHelper enumerateTokenChain:useNormalizedValues:withCallback:]";
                __int16 v54 = 2048;
                uint64_t v55 = v17;
                __int16 v56 = 2048;
                uint64_t v57 = v21;
                __int16 v58 = 2112;
                v59 = v27;
                __int16 v60 = 2048;
                uint64_t v61 = v29;
                _os_log_impl(&dword_2263A0000, v26, OS_LOG_TYPE_INFO, "%s [WARN]: Skipping this callback as charRange.location=%lu + charRange.length=%lu would be out-of-bound for text=[%@] with length=%lu", buf, 0x34u);

                goto LABEL_14;
              }
              goto LABEL_15;
            }
            v39 = [v6 normalizedString];
            v40 = objc_msgSend(v39, "substringWithRange:", v17, v21);

            v43[2](v43, v40, v17, v21, v9, v45, &v50);
LABEL_28:
            if ([v7 count] <= ++v13 || v50) {
              goto LABEL_30;
            }
          }
          v30 = [v7 objectAtIndexedSubscript:v13];
          v31 = [v30 normalizedValues];
          uint64_t v32 = [v31 count];

          if (v32)
          {
            long long v48 = 0u;
            long long v49 = 0u;
            long long v46 = 0u;
            long long v47 = 0u;
            v33 = [v7 objectAtIndexedSubscript:v13];
            v34 = [v33 normalizedValues];

            uint64_t v35 = [v34 countByEnumeratingWithState:&v46 objects:v51 count:16];
            if (v35)
            {
              uint64_t v36 = v35;
              uint64_t v37 = *(void *)v47;
              do
              {
                for (uint64_t i = 0; i != v36; ++i)
                {
                  if (*(void *)v47 != v37) {
                    objc_enumerationMutation(v34);
                  }
                  [v12 appendString:*(void *)(*((void *)&v46 + 1) + 8 * i)];
                }
                uint64_t v36 = [v34 countByEnumeratingWithState:&v46 objects:v51 count:16];
              }
              while (v36);
            }

            v43[2](v43, v12, v17, v21, v9, v45, &v50);
            id v6 = v42;
            goto LABEL_28;
          }
          v26 = CDMOSLoggerForCategory(0);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            v27 = [v7 objectAtIndexedSubscript:v13];
            *(_DWORD *)buf = 136315394;
            v53 = "+[CDMProtoSpanMatcherHelper enumerateTokenChain:useNormalizedValues:withCallback:]";
            __int16 v54 = 2112;
            uint64_t v55 = (uint64_t)v27;
            _os_log_impl(&dword_2263A0000, v26, OS_LOG_TYPE_INFO, "%s [WARN]: A significant token: (%@) does not have normalized values. This won't break but should not happen", buf, 0x16u);
LABEL_14:
          }
LABEL_15:

          goto LABEL_28;
        }
LABEL_30:
      }
      ++v9;
    }
    while ([v7 count] > v9);
  }
}

+ (id)voiceCommandSpanComparator
{
  return &__block_literal_global_305;
}

uint64_t __55__CDMProtoSpanMatcherHelper_voiceCommandSpanComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = v4;
  id v7 = v5;
  LODWORD(v5) = [v6 endTokenIndex];
  int v8 = v5 - [v6 startTokenIndex];
  LODWORD(v5) = [v7 endTokenIndex];
  int v9 = v5 - [v7 startTokenIndex];
  if (v8 > v9) {
    goto LABEL_2;
  }
  if (v8 < v9)
  {
LABEL_4:
    uint64_t v10 = 1;
    goto LABEL_12;
  }
  if (![v6 matcherNames] || !objc_msgSend(v7, "matcherNames"))
  {
LABEL_11:
    uint64_t v10 = 0;
    goto LABEL_12;
  }
  if (*(_DWORD *)[v6 matcherNames] != 2 || *(_DWORD *)objc_msgSend(v7, "matcherNames") == 2)
  {
    if (*(_DWORD *)[v6 matcherNames] != 2 && *(_DWORD *)objc_msgSend(v7, "matcherNames") == 2) {
      goto LABEL_4;
    }
    goto LABEL_11;
  }
LABEL_2:
  uint64_t v10 = -1;
LABEL_12:

  return v10;
}

+ (id)descendingLengthComparator
{
  return &__block_literal_global_303;
}

uint64_t __55__CDMProtoSpanMatcherHelper_descendingLengthComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  int v6 = [v5 startTokenIndex];
  int v7 = [v5 endTokenIndex];

  int v8 = [v4 startTokenIndex];
  int v9 = [v4 endTokenIndex];

  if (v7 - v6 > v9 - v8) {
    return -1;
  }
  else {
    return v7 - v6 < v9 - v8;
  }
}

+ (id)ascendingStartIndexComparator
{
  return &__block_literal_global_9882;
}

uint64_t __58__CDMProtoSpanMatcherHelper_ascendingStartIndexComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  int v5 = [a2 startTokenIndex];
  int v6 = [v4 startTokenIndex];

  if (v5 < v6) {
    return -1;
  }
  else {
    return v5 > v6;
  }
}

@end