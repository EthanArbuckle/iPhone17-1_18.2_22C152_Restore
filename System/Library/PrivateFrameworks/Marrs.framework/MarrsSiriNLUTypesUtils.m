@interface MarrsSiriNLUTypesUtils
+ (BOOL)isRequestEmpty:(id)a3;
+ (BOOL)isResponseEmpty:(id)a3;
+ (id)QRTokenFromTokenValue:(id)a3;
+ (id)emptyResponse;
+ (id)firstRewriteHypothesisOfResponse:(id)a3;
+ (id)firstRewrittenUtteranceOfResponse:(id)a3;
+ (id)firstRewrittenUtteranceOfResponse:(id)a3 WithDefaultValue:(id)a4;
+ (id)firstUtteranceOfRequest:(id)a3;
+ (id)firstUtteranceOfRequest:(id)a3 WithDefaultValue:(id)a4;
+ (id)interactionFromTokenValues:(id)a3 responseTokenValues:(id)a4 utteranceString:(id)a5 locale:(id)a6;
+ (id)internalTokenFromTokenValue:(id)a3 cleanValue:(id)a4 normalizedValues:(id)a5 isSignificant:(BOOL)a6 isWhitespace:(BOOL)a7;
+ (id)requestFromMdfDictionary:(id)a3 turnsKey:(id)a4 tokensKey:(id)a5 utteranceKey:(id)a6 valueKey:(id)a7 siriResponseKey:(id)a8 locale:(id)a9;
+ (id)utteranceFromTokenValues:(id)a3 utteranceString:(id)a4;
@end

@implementation MarrsSiriNLUTypesUtils

+ (id)interactionFromTokenValues:(id)a3 responseTokenValues:(id)a4 utteranceString:(id)a5 locale:(id)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  id v9 = a4;
  id v21 = a5;
  id v22 = a6;
  id v10 = objc_alloc_init(MEMORY[0x1E4FA2A50]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        v16 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObjects:", v15, 0);
        v17 = +[MarrsSiriNLUTypesUtils internalTokenFromTokenValue:v15 cleanValue:v15 normalizedValues:v16 isSignificant:1 isWhitespace:0];
        [v10 addSiriResponse:v17];
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v12);
  }

  v18 = +[MarrsSiriNLUTypesUtils utteranceFromTokenValues:v20 utteranceString:v21];
  [v10 addOriginalUtterances:v18];

  [v10 setLocale:v22];
  [v10 setTap2edit:0];

  return v10;
}

+ (id)utteranceFromTokenValues:(id)a3 utteranceString:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v5 = objc_alloc_init(MEMORY[0x1E4FA2A60]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v16;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        id v11 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObjects:", v10, 0);
        uint64_t v12 = +[MarrsSiriNLUTypesUtils internalTokenFromTokenValue:v10 cleanValue:v10 normalizedValues:v11 isSignificant:1 isWhitespace:0];
        [v5 addNluInternalTokens:v12];

        uint64_t v13 = +[MarrsSiriNLUTypesUtils QRTokenFromTokenValue:v10];
        [v5 addAsrUtteranceTokens:v13];
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  [v5 setUtterance:v17];
  [v5 setConfidence:1.0];
  id v14 = objc_alloc_init(MEMORY[0x1E4FA29C8]);
  [v5 setAsrId:v14];

  return v5;
}

+ (id)internalTokenFromTokenValue:(id)a3 cleanValue:(id)a4 normalizedValues:(id)a5 isSignificant:(BOOL)a6 isWhitespace:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  id v10 = a3;
  id v11 = a5;
  id v12 = objc_alloc_init(MEMORY[0x1E4FA2AC0]);
  [v12 setValue:v10];
  [v12 setCleanValue:v10];
  [v12 setNormalizedValues:v11];
  [v12 setIsSignificant:v8];
  [v12 setIsWhitespace:v7];
  [v12 setBegin:0];
  [v12 setEnd:0];

  return v12;
}

+ (id)QRTokenFromTokenValue:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4FA2A58]);
  [v4 setValue:v3];
  [v4 setAsrConfidence:1000.0];
  [v4 setStartIndex:0];
  [v4 setEndIndex:0];
  [v4 setPhoneSequence:&stru_1F23C7F28];
  [v4 setRemoveSpaceAfter:0];

  return v4;
}

+ (id)requestFromMdfDictionary:(id)a3 turnsKey:(id)a4 tokensKey:(id)a5 utteranceKey:(id)a6 valueKey:(id)a7 siriResponseKey:(id)a8 locale:(id)a9
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v45 = a5;
  id v42 = a6;
  id v16 = a7;
  id v43 = a8;
  id v41 = a9;
  v37 = v14;
  v38 = v15;
  id v44 = objc_alloc_init(MEMORY[0x1E4FA2A38]);
  [v14 objectForKeyedSubscript:v15];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = [obj countByEnumeratingWithState:&v56 objects:v62 count:16];
  if (v17)
  {
    uint64_t v40 = *(void *)v57;
    do
    {
      uint64_t v46 = v17;
      for (uint64_t i = 0; i != v46; ++i)
      {
        if (*(void *)v57 != v40) {
          objc_enumerationMutation(obj);
        }
        long long v19 = *(void **)(*((void *)&v56 + 1) + 8 * i);
        long long v20 = [v19 objectForKeyedSubscript:v45];
        long long v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v20, "count"));
        long long v54 = 0u;
        long long v55 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        id v22 = v20;
        uint64_t v23 = [v22 countByEnumeratingWithState:&v52 objects:v61 count:16];
        if (v23)
        {
          uint64_t v24 = *(void *)v53;
          do
          {
            for (uint64_t j = 0; j != v23; ++j)
            {
              if (*(void *)v53 != v24) {
                objc_enumerationMutation(v22);
              }
              long long v26 = [*(id *)(*((void *)&v52 + 1) + 8 * j) objectForKeyedSubscript:v16];
              [v21 addObject:v26];
            }
            uint64_t v23 = [v22 countByEnumeratingWithState:&v52 objects:v61 count:16];
          }
          while (v23);
        }

        v47 = [v19 objectForKeyedSubscript:v42];
        v27 = [v19 objectForKeyedSubscript:v43];
        uint64_t v28 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v27, "count"));
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        id v29 = v27;
        uint64_t v30 = [v29 countByEnumeratingWithState:&v48 objects:v60 count:16];
        if (v30)
        {
          uint64_t v31 = *(void *)v49;
          do
          {
            for (uint64_t k = 0; k != v30; ++k)
            {
              if (*(void *)v49 != v31) {
                objc_enumerationMutation(v29);
              }
              v33 = [*(id *)(*((void *)&v48 + 1) + 8 * k) objectForKeyedSubscript:v16];
              [v28 addObject:v33];
            }
            uint64_t v30 = [v29 countByEnumeratingWithState:&v48 objects:v60 count:16];
          }
          while (v30);
        }

        v34 = +[MarrsSiriNLUTypesUtils interactionFromTokenValues:v21 responseTokenValues:v28 utteranceString:v47 locale:v41];
        [v44 addOriginalInteractions:v34];
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v56 objects:v62 count:16];
    }
    while (v17);
  }

  id v35 = objc_alloc_init(MEMORY[0x1E4FA29C8]);
  [v44 setRequestId:v35];

  return v44;
}

+ (id)firstRewriteHypothesisOfResponse:(id)a3
{
  id v3 = a3;
  if (+[MarrsSiriNLUTypesUtils isResponseEmpty:v3])
  {
    id v4 = 0;
  }
  else
  {
    id v5 = [v3 rewriteHypotheses];
    id v4 = [v5 objectAtIndexedSubscript:0];
  }
  return v4;
}

+ (id)firstUtteranceOfRequest:(id)a3
{
  id v3 = [a1 firstUtteranceOfRequest:a3 WithDefaultValue:&stru_1F23C7F28];
  return v3;
}

+ (id)firstUtteranceOfRequest:(id)a3 WithDefaultValue:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (+[MarrsSiriNLUTypesUtils isRequestEmpty:v5])
  {
    id v7 = v6;
  }
  else
  {
    BOOL v8 = [v5 originalInteractions];
    id v9 = [v8 objectAtIndexedSubscript:0];
    id v10 = [v9 originalUtterances];
    id v11 = [v10 objectAtIndexedSubscript:0];
    id v7 = [v11 utterance];
  }
  return v7;
}

+ (BOOL)isRequestEmpty:(id)a3
{
  id v3 = a3;
  id v4 = [v3 originalInteractions];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    id v6 = [v3 originalInteractions];
    id v7 = [v6 objectAtIndexedSubscript:0];
    BOOL v8 = [v7 originalUtterances];
    BOOL v9 = [v8 count] == 0;
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

+ (id)emptyResponse
{
  id v2 = objc_alloc_init(MEMORY[0x1E4FA2A40]);
  id v3 = (void *)[MEMORY[0x1E4F1CBF0] copy];
  [v2 setRewriteHypotheses:v3];

  [v2 setRepetitionType:0];
  return v2;
}

+ (id)firstRewrittenUtteranceOfResponse:(id)a3
{
  id v3 = +[MarrsSiriNLUTypesUtils firstRewrittenUtteranceOfResponse:a3 WithDefaultValue:&stru_1F23C7F28];
  return v3;
}

+ (id)firstRewrittenUtteranceOfResponse:(id)a3 WithDefaultValue:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (+[MarrsSiriNLUTypesUtils isResponseEmpty:v5])
  {
    id v7 = v6;
  }
  else
  {
    BOOL v8 = [v5 rewriteHypotheses];
    BOOL v9 = [v8 objectAtIndexedSubscript:0];
    id v7 = [v9 utterance];
  }
  return v7;
}

+ (BOOL)isResponseEmpty:(id)a3
{
  id v3 = [a3 rewriteHypotheses];
  BOOL v4 = [v3 count] == 0;

  return v4;
}

@end