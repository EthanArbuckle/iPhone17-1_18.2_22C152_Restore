@interface IPMessageUnit
- (IPMessage)originalMessage;
- (IPMessageUnit)initWithText:(id)a3 originalMessage:(id)a4 index:(int64_t)a5;
- (IPMessageUnit)previous;
- (NSArray)dataFeatures;
- (NSArray)features;
- (NSArray)followups;
- (NSArray)keywordFeatures;
- (NSArray)sentenceFeatures;
- (NSString)lowercaseTextTruncated;
- (NSString)text;
- (_NSRange)interactedDateRange;
- (id)bestLanguageID;
- (id)description;
- (id)neutralRanges;
- (id)proposalAndAcceptationRanges;
- (id)rejectionRanges;
- (int64_t)indexInOriginalMessage;
- (void)addFollowup:(id)a3;
- (void)setDataFeatures:(id)a3;
- (void)setFeatures:(id)a3;
- (void)setInteractedDateRange:(_NSRange)a3;
- (void)setKeywordFeatures:(id)a3;
- (void)setSentenceFeatures:(id)a3;
@end

@implementation IPMessageUnit

- (NSString)text
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (IPMessageUnit)initWithText:(id)a3 originalMessage:(id)a4 index:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)IPMessageUnit;
  v11 = [(IPMessageUnit *)&v17 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_text, a3);
    v12->_indexInOriginalMessage = a5;
    objc_storeWeak((id *)&v12->_originalMessage, v10);
    v12->_interactedDateRange = (_NSRange)xmmword_2256AEE60;
    dataFeatures = v12->_dataFeatures;
    v12->_dataFeatures = 0;

    sentenceFeatures = v12->_sentenceFeatures;
    v12->_sentenceFeatures = 0;

    keywordFeatures = v12->_keywordFeatures;
    v12->_keywordFeatures = 0;
  }
  return v12;
}

- (void)addFollowup:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    followups = self->_followups;
    if (followups)
    {
      [(NSMutableArray *)followups addObject:v4];
    }
    else
    {
      v6 = [MEMORY[0x263EFF980] arrayWithObject:v4];
      v7 = self->_followups;
      self->_followups = v6;
    }
  }
  MEMORY[0x270F9A758]();
}

- (NSArray)followups
{
  return (NSArray *)self->_followups;
}

- (void)setFeatures:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = [v4 copy];
  features = v5->_features;
  v5->_features = (NSArray *)v6;

  v8 = objc_opt_new();
  id v9 = objc_opt_new();
  v15 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v10 = v5->_features;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v10);
        }
        v14 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v9 addObject:v14];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v8 addObject:v14];
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              continue;
            }
            [v15 addObject:v14];
          }
        }
      }
      uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  [(IPMessageUnit *)v5 setDataFeatures:v8];
  [(IPMessageUnit *)v5 setKeywordFeatures:v15];
  [(IPMessageUnit *)v5 setSentenceFeatures:v9];

  objc_sync_exit(v5);
}

- (void)setSentenceFeatures:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v7 copy];
  sentenceFeatures = v4->_sentenceFeatures;
  v4->_sentenceFeatures = (NSArray *)v5;

  objc_sync_exit(v4);
}

- (void)setDataFeatures:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v7 copy];
  dataFeatures = v4->_dataFeatures;
  v4->_dataFeatures = (NSArray *)v5;

  objc_sync_exit(v4);
}

- (void)setKeywordFeatures:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v7 copy];
  keywordFeatures = v4->_keywordFeatures;
  v4->_keywordFeatures = (NSArray *)v5;

  objc_sync_exit(v4);
}

- (NSString)lowercaseTextTruncated
{
  v2 = self;
  objc_sync_enter(v2);
  WeakRetained = objc_loadWeakRetained((id *)&v2->_lowercaseTextTruncated);
  if (!WeakRetained)
  {
    id v4 = [(IPMessageUnit *)v2 text];
    if ((unint64_t)[v4 length] >= 0x2711)
    {
      uint64_t v5 = (void *)MEMORY[0x22A632550]();
      uint64_t v6 = [v4 substringToIndex:10000];

      id v4 = (void *)v6;
    }
    id v7 = (void *)MEMORY[0x22A632550]();
    WeakRetained = [v4 lowercaseString];
    objc_storeWeak((id *)&v2->_lowercaseTextTruncated, WeakRetained);
  }
  objc_sync_exit(v2);

  return (NSString *)WeakRetained;
}

- (NSArray)features
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_features)
  {
    text = v2->_text;
    if (text)
    {
      uint64_t v4 = +[IPFeatureManager featuresForTextString:text inMessageUnit:v2];
      features = v2->_features;
      v2->_features = (NSArray *)v4;
    }
  }
  if (v2->_text && (!v2->_dataFeatures || !v2->_keywordFeatures || !v2->_sentenceFeatures))
  {
    uint64_t v6 = objc_opt_new();
    id v7 = objc_opt_new();
    v15 = objc_opt_new();
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v8 = v2->_features;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (!v9) {
      goto LABEL_22;
    }
    uint64_t v10 = *(void *)v17;
    while (1)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v7 addObject:v12];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v6 addObject:v12];
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              continue;
            }
            [v15 addObject:v12];
          }
        }
      }
      uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (!v9)
      {
LABEL_22:

        [(IPMessageUnit *)v2 setDataFeatures:v6];
        [(IPMessageUnit *)v2 setKeywordFeatures:v15];
        [(IPMessageUnit *)v2 setSentenceFeatures:v7];

        break;
      }
    }
  }
  v13 = v2->_features;
  objc_sync_exit(v2);

  return v13;
}

- (id)rejectionRanges
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  rejectionRanges = v2->_rejectionRanges;
  if (!rejectionRanges)
  {
    rejectionRanges = (NSIndexSet *)v2->_text;
    if (rejectionRanges)
    {
      uint64_t v21 = v2;
      uint64_t v6 = objc_opt_new();
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v7 = [(IPMessageUnit *)v2 sentenceFeatures];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v33 count:16];
      if (v8)
      {
        obuint64_t j = v7;
        uint64_t v23 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v29 != v23) {
              objc_enumerationMutation(obj);
            }
            uint64_t v10 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            uint64_t v11 = [v10 matchRange];
            long long v26 = 0u;
            long long v27 = 0u;
            long long v24 = 0u;
            long long v25 = 0u;
            uint64_t v12 = [v10 fragments];
            uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
            if (v13)
            {
              uint64_t v14 = *(void *)v25;
              do
              {
                for (uint64_t j = 0; j != v13; ++j)
                {
                  if (*(void *)v25 != v14) {
                    objc_enumerationMutation(v12);
                  }
                  long long v16 = *(void **)(*((void *)&v24 + 1) + 8 * j);
                  if ([v16 mainPolarity] == 4)
                  {
                    uint64_t v17 = [v16 range];
                    [v16 range];
                    objc_msgSend(v6, "addIndexesInRange:", v17 + v11, v18);
                  }
                }
                uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
              }
              while (v13);
            }
          }
          id v7 = obj;
          uint64_t v8 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
        }
        while (v8);
      }

      uint64_t v19 = [v6 copy];
      v20 = v21->_rejectionRanges;
      v21->_rejectionRanges = (NSIndexSet *)v19;

      rejectionRanges = v21->_rejectionRanges;
      v2 = v21;
    }
  }
  uint64_t v4 = rejectionRanges;
  objc_sync_exit(v2);

  return v4;
}

- (id)neutralRanges
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  neutralRanges = v2->_neutralRanges;
  if (!neutralRanges)
  {
    neutralRanges = (NSIndexSet *)v2->_text;
    if (neutralRanges)
    {
      uint64_t v21 = v2;
      uint64_t v6 = objc_opt_new();
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v7 = [(IPMessageUnit *)v2 sentenceFeatures];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v33 count:16];
      if (v8)
      {
        obuint64_t j = v7;
        uint64_t v23 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v29 != v23) {
              objc_enumerationMutation(obj);
            }
            uint64_t v10 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            uint64_t v11 = [v10 matchRange];
            long long v26 = 0u;
            long long v27 = 0u;
            long long v24 = 0u;
            long long v25 = 0u;
            uint64_t v12 = [v10 fragments];
            uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
            if (v13)
            {
              uint64_t v14 = *(void *)v25;
              do
              {
                for (uint64_t j = 0; j != v13; ++j)
                {
                  if (*(void *)v25 != v14) {
                    objc_enumerationMutation(v12);
                  }
                  long long v16 = *(void **)(*((void *)&v24 + 1) + 8 * j);
                  if ((unint64_t)([v16 mainPolarity] - 5) <= 0xFFFFFFFFFFFFFFFCLL)
                  {
                    uint64_t v17 = [v16 range];
                    [v16 range];
                    objc_msgSend(v6, "addIndexesInRange:", v17 + v11, v18);
                  }
                }
                uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
              }
              while (v13);
            }
          }
          id v7 = obj;
          uint64_t v8 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
        }
        while (v8);
      }

      uint64_t v19 = [v6 copy];
      v20 = v21->_neutralRanges;
      v21->_neutralRanges = (NSIndexSet *)v19;

      neutralRanges = v21->_neutralRanges;
      v2 = v21;
    }
  }
  uint64_t v4 = neutralRanges;
  objc_sync_exit(v2);

  return v4;
}

- (id)proposalAndAcceptationRanges
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  proposalAndAcceptationRanges = v2->_proposalAndAcceptationRanges;
  if (!proposalAndAcceptationRanges)
  {
    proposalAndAcceptationRanges = (NSIndexSet *)v2->_text;
    if (proposalAndAcceptationRanges)
    {
      uint64_t v21 = v2;
      uint64_t v6 = objc_opt_new();
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v7 = [(IPMessageUnit *)v2 sentenceFeatures];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v33 count:16];
      if (v8)
      {
        obuint64_t j = v7;
        uint64_t v23 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v29 != v23) {
              objc_enumerationMutation(obj);
            }
            uint64_t v10 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            uint64_t v11 = [v10 matchRange];
            long long v26 = 0u;
            long long v27 = 0u;
            long long v24 = 0u;
            long long v25 = 0u;
            uint64_t v12 = [v10 fragments];
            uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
            if (v13)
            {
              uint64_t v14 = *(void *)v25;
              do
              {
                for (uint64_t j = 0; j != v13; ++j)
                {
                  if (*(void *)v25 != v14) {
                    objc_enumerationMutation(v12);
                  }
                  long long v16 = *(void **)(*((void *)&v24 + 1) + 8 * j);
                  if (([v16 mainPolarity] & 0xFFFFFFFFFFFFFFFELL) == 2)
                  {
                    uint64_t v17 = [v16 range];
                    [v16 range];
                    objc_msgSend(v6, "addIndexesInRange:", v17 + v11, v18);
                  }
                }
                uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
              }
              while (v13);
            }
          }
          id v7 = obj;
          uint64_t v8 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
        }
        while (v8);
      }

      uint64_t v19 = [v6 copy];
      v20 = v21->_proposalAndAcceptationRanges;
      v21->_proposalAndAcceptationRanges = (NSIndexSet *)v19;

      proposalAndAcceptationRanges = v21->_proposalAndAcceptationRanges;
      v2 = v21;
    }
  }
  uint64_t v4 = proposalAndAcceptationRanges;
  objc_sync_exit(v2);

  return v4;
}

- (id)bestLanguageID
{
  if (!self->_bestLanguage && [(NSString *)self->_text length])
  {
    v3 = [(IPMessageUnit *)self originalMessage];
    uint64_t v4 = [v3 subject];

    if (![v4 length])
    {
      uint64_t v5 = [(IPMessageUnit *)self text];
      uint64_t v11 = 0;
LABEL_16:
      long long v16 = +[IPFeatureSentence bestLanguageIDFromText:v5 linesElided:v11];
      bestLanguage = self->_bestLanguage;
      self->_bestLanguage = v16;

      goto LABEL_17;
    }
    uint64_t v5 = (void *)[v4 mutableCopy];
    [v5 appendString:@"\n"];
    uint64_t v6 = [(IPMessageUnit *)self text];
    if ((unint64_t)[v5 length] <= 0x1FF && objc_msgSend(v6, "length"))
    {
      unint64_t v7 = 512 - [v5 length];
      if (v7 < [v6 length])
      {
        context = (void *)MEMORY[0x22A632550]();
        uint64_t v8 = objc_msgSend(v6, "lineRangeForRange:", 0, 512 - objc_msgSend(v5, "length"));
        uint64_t v10 = v9;
        uint64_t v11 = 0;
        unint64_t v12 = v9 + v8 + 1;
        do
        {
          if (v12 >= [v6 length]) {
            break;
          }
          uint64_t v13 = objc_msgSend(v6, "rangeOfString:options:range:", @"\n", 2, v12, objc_msgSend(v6, "length") - v12);
          if (v13 == 0x7FFFFFFFFFFFFFFFLL) {
            break;
          }
          unint64_t v12 = v13 + v14;
          ++v11;
        }
        while (v11 != 5);
        v15 = objc_msgSend(v6, "substringWithRange:", v8, v10);
        [v5 appendString:v15];

        goto LABEL_15;
      }
      [v5 appendString:v6];
    }
    uint64_t v11 = 0;
LABEL_15:

    goto LABEL_16;
  }
LABEL_17:
  uint64_t v18 = self->_bestLanguage;
  return v18;
}

- (id)description
{
  v3 = (void *)MEMORY[0x22A632550](self, a2);
  uint64_t v4 = NSString;
  uint64_t v5 = [(IPMessageUnit *)self text];
  uint64_t v6 = [v4 stringWithFormat:@"<IPMessageUnit: %@>", v5];

  return v6;
}

- (IPMessageUnit)previous
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_previous);
  return (IPMessageUnit *)WeakRetained;
}

- (NSArray)sentenceFeatures
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (NSArray)dataFeatures
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (NSArray)keywordFeatures
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (IPMessage)originalMessage
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_originalMessage);
  return (IPMessage *)WeakRetained;
}

- (int64_t)indexInOriginalMessage
{
  return self->_indexInOriginalMessage;
}

- (_NSRange)interactedDateRange
{
  objc_copyStruct(v4, &self->_interactedDateRange, 16, 1, 0);
  NSUInteger v2 = v4[0];
  NSUInteger v3 = v4[1];
  result.length = v3;
  result.location = v2;
  return result;
}

- (void)setInteractedDateRange:(_NSRange)a3
{
  _NSRange v3 = a3;
  objc_copyStruct(&self->_interactedDateRange, &v3, 16, 1, 0);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_originalMessage);
  objc_destroyWeak((id *)&self->_previous);
  objc_storeStrong((id *)&self->_text, 0);
  objc_destroyWeak((id *)&self->_lowercaseTextTruncated);
  objc_storeStrong((id *)&self->_bestLanguage, 0);
  objc_storeStrong((id *)&self->_neutralRanges, 0);
  objc_storeStrong((id *)&self->_proposalAndAcceptationRanges, 0);
  objc_storeStrong((id *)&self->_rejectionRanges, 0);
  objc_storeStrong((id *)&self->_keywordFeatures, 0);
  objc_storeStrong((id *)&self->_dataFeatures, 0);
  objc_storeStrong((id *)&self->_sentenceFeatures, 0);
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_flatMessageThread, 0);
  objc_storeStrong((id *)&self->_followups, 0);
}

@end