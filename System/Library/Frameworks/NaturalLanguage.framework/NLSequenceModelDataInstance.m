@interface NLSequenceModelDataInstance
+ (id)readInstancesFromString:(id)a3 tokenizer:(__CFStringTokenizer *)a4;
- (NLSequenceModelDataInstance)initWithLine:(id)a3 tokenizer:(__CFStringTokenizer *)a4;
- (NLSequenceModelDataInstance)initWithTokens:(id)a3 labels:(id)a4;
- (__CFDictionary)instanceDictionary;
- (id)formattedLineWithLabelMap:(id)a3 vocabularyMap:(id)a4;
- (id)label;
- (id)labels;
- (id)locatorsWithIndex:(unint64_t)a3 parameters:(_NLConstraintParameters *)a4 tagger:(id)a5 tokenizer:(__CFStringTokenizer *)a6;
- (id)string;
- (id)subInstanceWithLocator:(id)a3 tokenizer:(__CFStringTokenizer *)a4;
- (id)tokens;
@end

@implementation NLSequenceModelDataInstance

- (NLSequenceModelDataInstance)initWithTokens:(id)a3 labels:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NLSequenceModelDataInstance;
  v8 = [(NLSequenceModelDataInstance *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    tokens = v8->_tokens;
    v8->_tokens = (NSArray *)v9;

    uint64_t v11 = [v7 copy];
    labels = v8->_labels;
    v8->_labels = (NSArray *)v11;
  }
  return v8;
}

- (NLSequenceModelDataInstance)initWithLine:(id)a3 tokenizer:(__CFStringTokenizer *)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA48];
  id v6 = a3;
  id v7 = [v5 array];
  v8 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __54__NLSequenceModelDataInstance_initWithLine_tokenizer___block_invoke;
  v16 = &unk_1E5C54770;
  id v17 = v8;
  id v18 = v7;
  id v9 = v7;
  id v10 = v8;
  [v6 enumerateLinesUsingBlock:&v13];

  uint64_t v11 = -[NLSequenceModelDataInstance initWithTokens:labels:](self, "initWithTokens:labels:", v9, v10, v13, v14, v15, v16);
  return v11;
}

void __54__NLSequenceModelDataInstance_initWithLine_tokenizer___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v9 = [a2 componentsSeparatedByString:@"\t"];
  if ([v9 count] == 2)
  {
    v5 = *(void **)(a1 + 32);
    id v6 = [v9 firstObject];
    [v5 addObject:v6];

    id v7 = *(void **)(a1 + 40);
    v8 = [v9 lastObject];
    [v7 addObject:v8];
  }
  else
  {
    *a3 = 1;
  }
}

- (id)string
{
  v2 = [(NLSequenceModelDataInstance *)self tokens];
  v3 = [v2 componentsJoinedByString:@" "];

  return v3;
}

- (id)tokens
{
  return self->_tokens;
}

- (id)label
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v2 = [(NLSequenceModelDataInstance *)self labels];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = v2;
  uint64_t v4 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    id v7 = 0;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v11 = [v3 objectForKey:v10];
        uint64_t v12 = [v11 unsignedIntegerValue];

        unint64_t v13 = v12 + 1;
        uint64_t v14 = [NSNumber numberWithUnsignedInteger:v12 + 1];
        [v3 setObject:v14 forKey:v10];

        if (v13 > v6)
        {
          id v15 = v10;

          unint64_t v6 = v13;
          id v7 = v15;
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v5);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)labels
{
  return self->_labels;
}

- (id)formattedLineWithLabelMap:(id)a3 vocabularyMap:(id)a4
{
  return 0;
}

- (__CFDictionary)instanceDictionary
{
  theDict = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D048], MEMORY[0x1E4F1D540]);
  NSUInteger v3 = [(NSArray *)self->_tokens count];
  NSUInteger v4 = [(NSArray *)self->_labels count];
  value = [MEMORY[0x1E4F1CA48] array];
  id v15 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v14 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v5 = [MEMORY[0x1E4F28E78] string];
  if (v3)
  {
    NSUInteger v6 = 0;
    do
    {
      id v7 = [(NSArray *)self->_tokens objectAtIndex:v6];
      if (v6 < v4)
      {
        uint64_t v8 = [(NSArray *)self->_labels objectAtIndex:v6];
        if (v8)
        {
          id v9 = (void *)v8;
          id v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "length"));
          [value addObject:v10];

          uint64_t v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "length"));
          [v15 addObject:v11];

          [v14 addObject:v9];
        }
      }
      [v5 appendString:v7];
      if (++v6 < v3) {
        [v5 appendString:@" "];
      }
    }
    while (v3 != v6);
  }
  CFDictionaryAddValue(theDict, (const void *)*MEMORY[0x1E4F5C820], v5);
  CFDictionaryAddValue(theDict, (const void *)*MEMORY[0x1E4F5C818], value);
  CFDictionaryAddValue(theDict, (const void *)*MEMORY[0x1E4F5C810], v15);
  CFDictionaryAddValue(theDict, (const void *)*MEMORY[0x1E4F5C7F8], v14);

  return theDict;
}

+ (id)readInstancesFromString:(id)a3 tokenizer:(__CFStringTokenizer *)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA48];
  id v6 = a3;
  id v7 = [v5 array];
  uint64_t v8 = [MEMORY[0x1E4F28E78] string];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __65__NLSequenceModelDataInstance_readInstancesFromString_tokenizer___block_invoke;
  v14[3] = &unk_1E5C54798;
  id v15 = v8;
  id v17 = a4;
  id v9 = v7;
  id v16 = v9;
  id v10 = v8;
  [v6 enumerateLinesUsingBlock:v14];

  uint64_t v11 = v16;
  id v12 = v9;

  return v12;
}

void __65__NLSequenceModelDataInstance_readInstancesFromString_tokenizer___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  NSUInteger v3 = [v5 componentsSeparatedByString:@"\t"];
  if ([v3 count] == 2)
  {
    [*(id *)(a1 + 32) appendString:v5];
    [*(id *)(a1 + 32) appendString:@"\n"];
  }
  else
  {
    NSUInteger v4 = [[NLSequenceModelDataInstance alloc] initWithLine:*(void *)(a1 + 32) tokenizer:*(void *)(a1 + 48)];
    if (v4) {
      [*(id *)(a1 + 40) addObject:v4];
    }
    objc_msgSend(*(id *)(a1 + 32), "deleteCharactersInRange:", 0, objc_msgSend(*(id *)(a1 + 32), "length"));
  }
}

- (id)locatorsWithIndex:(unint64_t)a3 parameters:(_NLConstraintParameters *)a4 tagger:(id)a5 tokenizer:(__CFStringTokenizer *)a6
{
  unint64_t v7 = a3;
  id v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", a3, a4, a5, a6);
  id v10 = a4;
  uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
  id v12 = [(NLSequenceModelDataInstance *)self tokens];
  uint64_t v13 = [v12 count];
  if (v13)
  {
    unint64_t v14 = v13;
    v63 = v10;
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    do
    {
      id v17 = [v12 objectAtIndex:v15];
      uint64_t v18 = [v17 length];

      long long v19 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v16, v18);
      [v11 addObject:v19];

      v16 += v18 + 1;
      ++v15;
    }
    while (v14 != v15);
    long long v20 = v10;
    if (v14 >= v10->minSplitTokens)
    {
      unint64_t v31 = 0;
      unint64_t v32 = 0;
      unint64_t v61 = v14;
      v62 = v12;
      v67 = v9;
      unint64_t v68 = v7;
      do
      {
        if (v31 >= v20->maxTokens) {
          break;
        }
        unint64_t v33 = v31;
        v34 = [v12 objectAtIndex:v31];
        v35 = v34;
        if (++v31 == v14
          || v31 == v20->maxTokens
          || v20->splitSentences && tokenIsSentenceTerminator(v34))
        {
          v64 = v35;
          v36 = v20;
          uint64_t v37 = v31 - v32;
          unint64_t maxSplitTokens = v36->maxSplitTokens;
          if (v31 - v32 <= maxSplitTokens)
          {
            v49 = [v11 objectAtIndex:v32];
            uint64_t v50 = [v49 rangeValue];

            v51 = [v11 objectAtIndex:v33];
            v52 = v9;
            unint64_t v53 = v7;
            unint64_t v54 = v31;
            uint64_t v55 = [v51 rangeValue];
            uint64_t v57 = v56;

            uint64_t v58 = v57 - v50 + v55;
            unint64_t v31 = v54;
            unint64_t v7 = v53;
            id v9 = v52;
            v59 = -[NLDataInstanceLocator initWithInstanceIndex:rangeOfCharacters:rangeOfTokens:]([NLDataInstanceLocator alloc], "initWithInstanceIndex:rangeOfCharacters:rangeOfTokens:", v7, v50, v58, v32, v37);
            [v52 addObject:v59];

            unint64_t v32 = v31;
          }
          else
          {
            unint64_t v65 = v33 - v32;
            unint64_t v66 = (v37 - 1) / ((v37 - 1) / maxSplitTokens + 1) + 1;
            uint64_t v38 = -1;
            do
            {
              if (v32 + v66 <= v31) {
                unint64_t v39 = v66;
              }
              else {
                unint64_t v39 = v31 - v32;
              }
              v40 = [v11 objectAtIndex:v32];
              uint64_t v41 = [v40 rangeValue];

              v42 = [v11 objectAtIndex:v39 + v32 - 1];
              unint64_t v43 = v31;
              uint64_t v44 = [v42 rangeValue];
              uint64_t v46 = v45;

              uint64_t v47 = v46 - v41 + v44;
              unint64_t v31 = v43;
              v48 = -[NLDataInstanceLocator initWithInstanceIndex:rangeOfCharacters:rangeOfTokens:]([NLDataInstanceLocator alloc], "initWithInstanceIndex:rangeOfCharacters:rangeOfTokens:", v68, v41, v47, v32, v39);
              [v67 addObject:v48];

              ++v38;
              v32 += v39;
            }
            while (v38 != v65 / maxSplitTokens);
            unint64_t v32 = v43;
            id v9 = v67;
            unint64_t v7 = v68;
          }
          unint64_t v14 = v61;
          id v12 = v62;
          long long v20 = v63;
          v35 = v64;
        }
      }
      while (v31 != v14);
    }
    else
    {
      [v11 objectAtIndex:0];
      v22 = unint64_t v21 = v14;
      uint64_t v23 = [v22 rangeValue];

      v24 = [v11 objectAtIndex:v21 - 1];
      uint64_t v25 = [v24 rangeValue];
      uint64_t v27 = v26;

      v28 = -[NLDataInstanceLocator initWithInstanceIndex:rangeOfCharacters:rangeOfTokens:]([NLDataInstanceLocator alloc], "initWithInstanceIndex:rangeOfCharacters:rangeOfTokens:", v7, v23, v27 - v23 + v25, 0, v21);
      v29 = v11;
      v30 = v28;
      [v9 addObject:v28];

      uint64_t v11 = v29;
    }
  }

  return v9;
}

- (id)subInstanceWithLocator:(id)a3 tokenizer:(__CFStringTokenizer *)a4
{
  id v5 = a3;
  id v6 = [NLSequenceModelDataInstance alloc];
  unint64_t v7 = [(NLSequenceModelDataInstance *)self tokens];
  uint64_t v8 = [v5 rangeOfTokens];
  id v10 = objc_msgSend(v7, "subarrayWithRange:", v8, v9);
  uint64_t v11 = [(NLSequenceModelDataInstance *)self labels];
  uint64_t v12 = [v5 rangeOfTokens];
  uint64_t v14 = v13;

  uint64_t v15 = objc_msgSend(v11, "subarrayWithRange:", v12, v14);
  uint64_t v16 = [(NLSequenceModelDataInstance *)v6 initWithTokens:v10 labels:v15];

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labels, 0);

  objc_storeStrong((id *)&self->_tokens, 0);
}

@end