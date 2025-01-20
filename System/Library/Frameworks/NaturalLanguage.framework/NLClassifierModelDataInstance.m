@interface NLClassifierModelDataInstance
+ (id)readInstancesFromString:(id)a3 tokenizer:(__CFStringTokenizer *)a4;
- (NLClassifierModelDataInstance)initWithLine:(id)a3 tokenizer:(__CFStringTokenizer *)a4;
- (NLClassifierModelDataInstance)initWithString:(id)a3 label:(id)a4;
- (NLClassifierModelDataInstance)initWithString:(id)a3 label:(id)a4 tokenizer:(__CFStringTokenizer *)a5;
- (__CFDictionary)instanceDictionary;
- (id)formattedLineWithLabelMap:(id)a3 vocabularyMap:(id)a4;
- (id)label;
- (id)labels;
- (id)locatorsWithIndex:(unint64_t)a3 parameters:(_NLConstraintParameters *)a4 tagger:(id)a5 tokenizer:(__CFStringTokenizer *)a6;
- (id)string;
- (id)subInstanceWithLocator:(id)a3 tokenizer:(__CFStringTokenizer *)a4;
- (id)tokens;
@end

@implementation NLClassifierModelDataInstance

- (NLClassifierModelDataInstance)initWithString:(id)a3 label:(id)a4 tokenizer:(__CFStringTokenizer *)a5
{
  id v8 = a3;
  id v9 = a4;
  v18.receiver = self;
  v18.super_class = (Class)NLClassifierModelDataInstance;
  v10 = [(NLClassifierModelDataInstance *)&v18 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    string = v10->_string;
    v10->_string = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    label = v10->_label;
    v10->_label = (NSString *)v13;

    uint64_t v15 = inputSequenceFromSentence(v8, a5);
    tokens = v10->_tokens;
    v10->_tokens = (NSArray *)v15;
  }
  return v10;
}

- (NLClassifierModelDataInstance)initWithString:(id)a3 label:(id)a4
{
  return [(NLClassifierModelDataInstance *)self initWithString:a3 label:a4 tokenizer:0];
}

- (NLClassifierModelDataInstance)initWithLine:(id)a3 tokenizer:(__CFStringTokenizer *)a4
{
  v6 = [a3 componentsSeparatedByString:@"\t"];
  if ([v6 count] == 2)
  {
    v7 = [v6 objectAtIndex:0];
    id v8 = [v6 objectAtIndex:1];
    self = [(NLClassifierModelDataInstance *)self initWithString:v7 label:v8 tokenizer:a4];

    id v9 = self;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)string
{
  return self->_string;
}

- (id)tokens
{
  return self->_tokens;
}

- (id)label
{
  return self->_label;
}

- (id)labels
{
  v3 = [(NLClassifierModelDataInstance *)self tokens];
  v4 = [(NLClassifierModelDataInstance *)self label];
  uint64_t v5 = [v3 count];
  for (i = [MEMORY[0x1E4F1CA48] array];
    [i addObject:v4];

  return i;
}

- (id)formattedLineWithLabelMap:(id)a3 vocabularyMap:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F28E78];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 string];
  v10 = formattedOutputFromSentence(self->_string, 0, v7);

  uint64_t v11 = [v8 objectForKey:self->_label];

  [v9 appendString:v10];
  [v9 appendString:@"\t"];
  v12 = labelFromFormattedOutput(v10, v11);
  [v9 appendString:v12];

  return v9;
}

- (__CFDictionary)instanceDictionary
{
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D048], MEMORY[0x1E4F1D540]);
  v4 = [(NLClassifierModelDataInstance *)self string];
  uint64_t v5 = [(NLClassifierModelDataInstance *)self label];
  v6 = [MEMORY[0x1E4F1CA48] array];
  id v7 = [MEMORY[0x1E4F1CA48] array];
  id v8 = [MEMORY[0x1E4F1CA48] array];
  id v9 = [MEMORY[0x1E4F1CA48] array];
  generateTokenSequence(v4, 0, v6, v8, v9);
  uint64_t v10 = [v6 count];
  if (v10)
  {
    uint64_t v11 = v10;
    do
    {
      [v7 addObject:v5];
      --v11;
    }
    while (v11);
  }
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F5C820], v4);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F5C818], v8);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F5C810], v9);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F5C7F8], v7);

  return Mutable;
}

+ (id)readInstancesFromString:(id)a3 tokenizer:(__CFStringTokenizer *)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA48];
  id v6 = a3;
  id v7 = [v5 array];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__NLClassifierModelDataInstance_readInstancesFromString_tokenizer___block_invoke;
  v10[3] = &unk_1E5C547C0;
  v12 = a4;
  id v8 = v7;
  id v11 = v8;
  [v6 enumerateLinesUsingBlock:v10];

  return v8;
}

void __67__NLClassifierModelDataInstance_readInstancesFromString_tokenizer___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = [[NLClassifierModelDataInstance alloc] initWithLine:v3 tokenizer:*(void *)(a1 + 40)];

  v4 = v5;
  if (v5)
  {
    [*(id *)(a1 + 32) addObject:v5];
    v4 = v5;
  }
}

- (id)locatorsWithIndex:(unint64_t)a3 parameters:(_NLConstraintParameters *)a4 tagger:(id)a5 tokenizer:(__CFStringTokenizer *)a6
{
  id v9 = a5;
  uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
  id v11 = [(NLClassifierModelDataInstance *)self string];
  uint64_t v12 = [v11 length];
  uint64_t v13 = [(NLClassifierModelDataInstance *)self tokens];
  unint64_t v14 = [v13 count];

  if (v14 >= a4->minSplitTokens)
  {
    [v9 setString:v11];
    if (v12)
    {
      v49 = v9;
      unint64_t v50 = v12;
      uint64_t v16 = 0;
      v17 = 0;
      unint64_t v18 = 0;
      v51 = a4;
      v52 = v11;
      while (v18 < a4->maxTokens)
      {
        v56 = [MEMORY[0x1E4F1CA48] array];
        v59 = [MEMORY[0x1E4F1CA48] array];
        v19 = [MEMORY[0x1E4F1CA48] array];
        uint64_t v20 = 0;
        uint64_t v21 = v12;
        if (a4->splitSentences) {
          uint64_t v20 = objc_msgSend(v49, "sentenceRangeForRange:", v16, 0);
        }
        uint64_t v22 = v20;
        uint64_t v55 = v21;
        v23 = objc_msgSend(v11, "substringWithRange:", v20, v21, v49);

        v54 = v23;
        v24 = v59;
        generateTokenSequence(v23, a6, v56, v59, v19);
        uint64_t v25 = [v56 count];
        unint64_t maxSplitTokens = a4->maxSplitTokens;
        unint64_t maxTokens = a4->maxTokens;
        if (v25 + v18 <= maxTokens) {
          unint64_t v28 = v25;
        }
        else {
          unint64_t v28 = maxTokens - v18;
        }
        unint64_t v62 = v28;
        uint64_t v60 = v22;
        unint64_t v61 = v18;
        v58 = v19;
        if (v28 <= maxSplitTokens)
        {
          if (v28)
          {
            v46 = -[NLDataInstanceLocator initWithInstanceIndex:rangeOfCharacters:rangeOfTokens:]([NLDataInstanceLocator alloc], "initWithInstanceIndex:rangeOfCharacters:rangeOfTokens:", a3, v22, v55, v18, v28);
            [v10 addObject:v46];
          }
        }
        else
        {
          uint64_t v29 = 0;
          unint64_t v30 = (v28 - 1) / maxSplitTokens + 1;
          unint64_t v57 = (v28 - 1) / v30 + 1;
          do
          {
            if (v29 + v57 <= v62) {
              unint64_t v31 = v57;
            }
            else {
              unint64_t v31 = v62 - v29;
            }
            [v24 objectAtIndex:v29];
            v33 = unint64_t v32 = a3;
            uint64_t v34 = [v33 unsignedIntegerValue];

            [v24 objectAtIndex:v31 + v29 - 1];
            v36 = v35 = v10;
            uint64_t v37 = [v36 unsignedIntegerValue];

            v38 = [v58 objectAtIndex:v31 + v29 - 1];
            uint64_t v39 = [v38 unsignedIntegerValue];

            uint64_t v40 = v34 + v60;
            uint64_t v41 = v37 - v34;
            v24 = v59;
            uint64_t v42 = v41 + v39;
            a3 = v32;
            v43 = [NLDataInstanceLocator alloc];
            uint64_t v44 = v40;
            uint64_t v10 = v35;
            v45 = -[NLDataInstanceLocator initWithInstanceIndex:rangeOfCharacters:rangeOfTokens:](v43, "initWithInstanceIndex:rangeOfCharacters:rangeOfTokens:", v32, v44, v42, v29 + v61, v31);
            [v35 addObject:v45];

            v29 += v31;
            --v30;
          }
          while (v30);
        }
        unint64_t v18 = v62 + v61;

        uint64_t v16 = v60 + v55;
        v47 = v54;
        v17 = v54;
        uint64_t v12 = v50;
        a4 = v51;
        id v11 = v52;
        if (v60 + v55 >= v50) {
          goto LABEL_23;
        }
      }
      v47 = v17;
LABEL_23:

      id v9 = v49;
    }
    objc_msgSend(v9, "setString:", 0, v49);
  }
  else
  {
    uint64_t v15 = -[NLDataInstanceLocator initWithInstanceIndex:rangeOfCharacters:rangeOfTokens:]([NLDataInstanceLocator alloc], "initWithInstanceIndex:rangeOfCharacters:rangeOfTokens:", a3, 0, v12, 0, v14);
    [v10 addObject:v15];
  }

  return v10;
}

- (id)subInstanceWithLocator:(id)a3 tokenizer:(__CFStringTokenizer *)a4
{
  id v6 = a3;
  id v7 = [NLClassifierModelDataInstance alloc];
  id v8 = [(NLClassifierModelDataInstance *)self string];
  uint64_t v9 = [v6 rangeOfCharacters];
  uint64_t v11 = v10;

  uint64_t v12 = objc_msgSend(v8, "substringWithRange:", v9, v11);
  uint64_t v13 = [(NLClassifierModelDataInstance *)self label];
  unint64_t v14 = [(NLClassifierModelDataInstance *)v7 initWithString:v12 label:v13 tokenizer:a4];

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_string, 0);
}

@end