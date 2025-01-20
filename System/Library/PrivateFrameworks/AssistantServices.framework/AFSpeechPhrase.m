@interface AFSpeechPhrase
+ (BOOL)supportsSecureCoding;
- (AFSpeechPhrase)initWithCoder:(id)a3;
- (AFSpeechPhrase)initWithDictionary:(id)a3;
- (AFSpeechPhrase)initWithInterpretations:(id)a3 isLowConfidence:(BOOL)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLowConfidence;
- (NSArray)interpretations;
- (id)allInterpretationStringsAndScores;
- (id)bestInterpretation;
- (id)description;
- (id)dictionaryRepresentation;
- (id)firstInterpretation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setInterpretations:(id)a3;
- (void)setIsLowConfidence:(BOOL)a3;
@end

@implementation AFSpeechPhrase

- (id)allInterpretationStringsAndScores
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v23 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [(AFSpeechPhrase *)self interpretations];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v24 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v26 != v24) {
          objc_enumerationMutation(obj);
        }
        v6 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v7 = [v6 confidenceScoreAvg];
        uint64_t v8 = [v6 confidenceScoreMax];
        uint64_t v9 = [v6 confidenceScoreMin];
        uint64_t v10 = [v6 confidenceScore];
        v11 = [v6 tokens];
        uint64_t v12 = [v11 count];

        v13 = [v6 text];

        if (v13)
        {
          v29[0] = @"avg";
          v14 = [MEMORY[0x1E4F28ED0] numberWithInteger:v7];
          v30[0] = v14;
          v29[1] = @"max";
          v15 = [MEMORY[0x1E4F28ED0] numberWithInteger:v8];
          v30[1] = v15;
          v29[2] = @"min";
          v16 = [MEMORY[0x1E4F28ED0] numberWithInteger:v9];
          v30[2] = v16;
          v29[3] = @"sum";
          v17 = [MEMORY[0x1E4F28ED0] numberWithInteger:v10];
          v30[3] = v17;
          v29[4] = @"count";
          v18 = [MEMORY[0x1E4F28ED0] numberWithInteger:v12];
          v30[4] = v18;
          v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:5];
          v20 = [v6 text];
          [v23 setObject:v19 forKey:v20];
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v4);
  }

  return v23;
}

- (id)bestInterpretation
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [(AFSpeechPhrase *)self interpretations];
  if ([v2 count] == 1)
  {
    uint64_t v3 = [v2 objectAtIndex:0];
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = v2;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v3 = 0;
      uint64_t v7 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if (v3)
          {
            uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "confidenceScore", (void)v13);
            if (v10 <= [v3 confidenceScore]) {
              continue;
            }
          }
          id v11 = v9;

          uint64_t v3 = v11;
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v6);
    }
    else
    {
      uint64_t v3 = 0;
    }
  }
  return v3;
}

- (id)firstInterpretation
{
  v2 = [(AFSpeechPhrase *)self interpretations];
  uint64_t v3 = [v2 firstObject];

  return v3;
}

- (void).cxx_destruct
{
}

- (void)setIsLowConfidence:(BOOL)a3
{
  self->_isLowConfidence = a3;
}

- (BOOL)isLowConfidence
{
  return self->_isLowConfidence;
}

- (void)setInterpretations:(id)a3
{
}

- (NSArray)interpretations
{
  return self->_interpretations;
}

- (id)dictionaryRepresentation
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = self->_interpretations;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "dictionaryRepresentation", (void)v13);
        [v3 addObject:v9];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v6);
  }

  v17[1] = @"isLowConfidence";
  v18[0] = v3;
  v17[0] = @"interpretations";
  uint64_t v10 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isLowConfidence];
  v18[1] = v10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];

  return v11;
}

- (AFSpeechPhrase)initWithDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKey:@"interpretations"];
  uint64_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  id v8 = v5;
  if (v8 && (NSClassFromString((NSString *)v7), (objc_opt_isKindOfClass() & 1) != 0))
  {

    uint64_t v24 = 0;
    long long v25 = &v24;
    uint64_t v26 = 0x2020000000;
    char v27 = 0;
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__8732;
    v22 = __Block_byref_object_dispose__8733;
    id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    void v17[2] = __37__AFSpeechPhrase_initWithDictionary___block_invoke;
    v17[3] = &unk_1E5926638;
    v17[4] = &v24;
    v17[5] = &v18;
    [v8 enumerateObjectsUsingBlock:v17];
    if (*((unsigned char *)v25 + 24) || ![(id)v19[5] count])
    {
      uint64_t v9 = 0;
    }
    else
    {
      uint64_t v10 = [v4 objectForKey:@"isLowConfidence"];
      id v11 = (objc_class *)objc_opt_class();
      uint64_t v12 = NSStringFromClass(v11);
      id v13 = v10;
      long long v14 = v12;
      long long v15 = v14;
      if (v13 && (NSClassFromString(v14), (objc_opt_isKindOfClass() & 1) != 0))
      {

        self = -[AFSpeechPhrase initWithInterpretations:isLowConfidence:](self, "initWithInterpretations:isLowConfidence:", v19[5], [v13 BOOLValue]);
        uint64_t v9 = self;
      }
      else
      {

        uint64_t v9 = 0;
      }
    }
    _Block_object_dispose(&v18, 8);

    _Block_object_dispose(&v24, 8);
  }
  else
  {

    uint64_t v9 = 0;
  }

  return v9;
}

void __37__AFSpeechPhrase_initWithDictionary___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  uint64_t v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  id v9 = v6;
  id v12 = v9;
  if (v9
    && (NSClassFromString((NSString *)v8), isKindOfClass = objc_opt_isKindOfClass(), id v9 = v12, (isKindOfClass & 1) != 0))
  {
  }
  else
  {

    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  id v11 = [[AFSpeechInterpretation alloc] initWithDictionary:v12];
  if (!v11)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v11];
}

- (AFSpeechPhrase)initWithInterpretations:(id)a3 isLowConfidence:(BOOL)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AFSpeechPhrase;
  uint64_t v7 = [(AFSpeechPhrase *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    interpretations = v7->_interpretations;
    v7->_interpretations = (NSArray *)v8;

    v7->_isLowConfidence = a4;
  }

  return v7;
}

- (AFSpeechPhrase)initWithCoder:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AFSpeechPhrase;
  uint64_t v5 = [(AFSpeechPhrase *)&v12 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
    uint64_t v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"interpretations"];
    interpretations = v5->_interpretations;
    v5->_interpretations = (NSArray *)v9;

    v5->_isLowConfidence = [v4 decodeBoolForKey:@"isLowConfidence"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  interpretations = self->_interpretations;
  id v5 = a3;
  [v5 encodeObject:interpretations forKey:@"interpretations"];
  [v5 encodeBool:self->_isLowConfidence forKey:@"isLowConfidence"];
}

- (id)description
{
  id v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)AFSpeechPhrase;
  id v4 = [(AFSpeechPhrase *)&v9 description];
  interpretations = self->_interpretations;
  id v6 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isLowConfidence];
  uint64_t v7 = [v3 stringWithFormat:@"%@, interpretations=%@, isLowConfidence=%@", v4, interpretations, v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  objc_opt_class();
  BOOL v6 = (objc_opt_isKindOfClass() & 1) != 0
    && ((id v5 = (NSArray *)*((void *)v4 + 2), v5 == self->_interpretations)
     || -[NSArray isEqualToArray:](v5, "isEqualToArray:"))
    && v4[8] == self->_isLowConfidence;

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_interpretations hash];
  id v4 = [(NSArray *)self->_interpretations firstObject];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end