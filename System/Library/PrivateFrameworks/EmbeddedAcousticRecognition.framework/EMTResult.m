@interface EMTResult
- (BOOL)isEqual:(id)a3;
- (BOOL)lowConfidence;
- (EMTResult)initWithLocale:(id)a3 tokens:(id)a4 confidence:(float)a5 lowConfidence:(BOOL)a6 metaInfo:(id)a7 romanization:(id)a8 alternativeSelectionSpans:(id)a9;
- (NSArray)alternativeSelectionSpans;
- (NSArray)tokens;
- (NSLocale)locale;
- (NSString)metaInfo;
- (NSString)romanization;
- (float)confidence;
- (id)description;
- (unint64_t)hash;
@end

@implementation EMTResult

- (EMTResult)initWithLocale:(id)a3 tokens:(id)a4 confidence:(float)a5 lowConfidence:(BOOL)a6 metaInfo:(id)a7 romanization:(id)a8 alternativeSelectionSpans:(id)a9
{
  id v28 = a3;
  id v17 = a4;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  v29.receiver = self;
  v29.super_class = (Class)EMTResult;
  v21 = [(EMTResult *)&v29 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_locale, a3);
    uint64_t v23 = [v17 copy];
    tokens = v22->_tokens;
    v22->_tokens = (NSArray *)v23;

    v22->_confidence = a5;
    v22->_lowConfidence = a6;
    objc_storeStrong((id *)&v22->_metaInfo, a7);
    objc_storeStrong((id *)&v22->_romanization, a8);
    uint64_t v25 = [v20 copy];
    alternativeSelectionSpans = v22->_alternativeSelectionSpans;
    v22->_alternativeSelectionSpans = (NSArray *)v25;
  }
  return v22;
}

- (id)description
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v4 = self->_tokens;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v15;
    char v7 = 1;
    while (1)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (v7) {
          goto LABEL_9;
        }
        if (objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "precededBySpace", (void)v14))
        {
          [v3 addObject:@" "];
LABEL_9:
          char v10 = 1;
          goto LABEL_11;
        }
        char v10 = 0;
LABEL_11:
        v11 = objc_msgSend(v9, "text", (void)v14);
        if ([v11 length])
        {
          [v3 addObject:v11];
        }
        else if (v10)
        {
          goto LABEL_16;
        }
        if ([v9 followedBySpace])
        {
          [v3 addObject:@" "];
LABEL_16:
          char v7 = 1;
          goto LABEL_18;
        }
        char v7 = 0;
LABEL_18:
      }
      uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (!v5)
      {

        if ((v7 & 1) == 0) {
          goto LABEL_25;
        }
        goto LABEL_23;
      }
    }
  }

LABEL_23:
  if (objc_msgSend(v3, "count", (void)v14)) {
    [v3 removeLastObject];
  }
LABEL_25:
  v12 = [v3 componentsJoinedByString:&stru_1F0A64AB0];

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    tokens = self->_tokens;
    char v7 = [v5 tokens];
    if ([(NSArray *)tokens isEqual:v7])
    {
      float confidence = self->_confidence;
      [v5 confidence];
      BOOL v10 = confidence == v9;
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  float confidence = self->_confidence;
  if (confidence == 0.0) {
    unint64_t v3 = 0;
  }
  else {
    unint64_t v3 = 31 * LODWORD(confidence);
  }
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = self->_tokens;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        unint64_t v3 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v7++), "hash", (void)v9) + 17 * v3;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  return v3;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (NSArray)tokens
{
  return self->_tokens;
}

- (float)confidence
{
  return self->_confidence;
}

- (BOOL)lowConfidence
{
  return self->_lowConfidence;
}

- (NSString)metaInfo
{
  return self->_metaInfo;
}

- (NSString)romanization
{
  return self->_romanization;
}

- (NSArray)alternativeSelectionSpans
{
  return self->_alternativeSelectionSpans;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternativeSelectionSpans, 0);
  objc_storeStrong((id *)&self->_romanization, 0);
  objc_storeStrong((id *)&self->_metaInfo, 0);
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

@end