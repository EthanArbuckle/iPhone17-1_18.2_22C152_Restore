@interface AFSpeechInterpretation
+ (BOOL)supportsSecureCoding;
- (AFSpeechInterpretation)initWithCoder:(id)a3;
- (AFSpeechInterpretation)initWithDictionary:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)tokens;
- (id)description;
- (id)dictionaryRepresentation;
- (id)text;
- (int64_t)averageConfidenceScore;
- (int64_t)confidenceScore;
- (int64_t)confidenceScoreAvg;
- (int64_t)confidenceScoreMax;
- (int64_t)confidenceScoreMin;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setTokens:(id)a3;
@end

@implementation AFSpeechInterpretation

- (int64_t)confidenceScoreAvg
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = [(AFSpeechInterpretation *)self tokens];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 += [*(id *)(*((void *)&v12 + 1) + 8 * i) confidenceScore];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  else
  {
    uint64_t v6 = 0;
  }

  v9 = [(AFSpeechInterpretation *)self tokens];
  uint64_t v10 = [v9 count];

  if (v10 < 1) {
    return 0;
  }
  else {
    return v6 / v10;
  }
}

- (int64_t)confidenceScoreMin
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(AFSpeechInterpretation *)self tokens];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    int64_t v6 = 1000;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = [*(id *)(*((void *)&v10 + 1) + 8 * i) confidenceScore];
        if (v8 < v6) {
          int64_t v6 = v8;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    int64_t v6 = 1000;
  }

  return v6;
}

- (int64_t)confidenceScoreMax
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(AFSpeechInterpretation *)self tokens];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    int64_t v6 = -1;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = [*(id *)(*((void *)&v10 + 1) + 8 * i) confidenceScore];
        if (v8 > v6) {
          int64_t v6 = v8;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    int64_t v6 = -1;
  }

  return v6;
}

- (int64_t)confidenceScore
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(AFSpeechInterpretation *)self tokens];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 += [*(id *)(*((void *)&v9 + 1) + 8 * i) confidenceScore];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (id)text
{
  v2 = [(AFSpeechInterpretation *)self tokens];
  uint64_t v3 = af_bestTokenInterpretation(v2);

  return v3;
}

- (void).cxx_destruct
{
}

- (void)setTokens:(id)a3
{
}

- (NSArray)tokens
{
  return self->_tokens;
}

- (id)dictionaryRepresentation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = self->_tokens;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "dictionaryRepresentation", (void)v12);
        [v3 addObject:v9];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v18 count:16];
    }
    while (v6);
  }

  v16 = @"tokens";
  id v17 = v3;
  long long v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];

  return v10;
}

- (AFSpeechInterpretation)initWithDictionary:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)AFSpeechInterpretation;
  uint64_t v5 = [(AFSpeechInterpretation *)&v26 init];
  if (!v5) {
    goto LABEL_10;
  }
  uint64_t v6 = [v4 objectForKey:@"tokens"];
  uint64_t v7 = [v4 objectForKey:@"tokens"];
  uint64_t v8 = (objc_class *)objc_opt_class();
  long long v9 = NSStringFromClass(v8);
  id v10 = v7;
  if (v10 && (NSClassFromString((NSString *)v9), (objc_opt_isKindOfClass() & 1) != 0))
  {

    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x2020000000;
    char v25 = 0;
    uint64_t v16 = 0;
    id v17 = &v16;
    uint64_t v18 = 0x3032000000;
    uint64_t v19 = __Block_byref_object_copy__8732;
    v20 = __Block_byref_object_dispose__8733;
    id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __45__AFSpeechInterpretation_initWithDictionary___block_invoke;
    v15[3] = &unk_1E5926638;
    v15[4] = &v22;
    v15[5] = &v16;
    [v6 enumerateObjectsUsingBlock:v15];
    if (!*((unsigned char *)v23 + 24) && [(id)v17[5] count])
    {
      uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithArray:v17[5]];
      tokens = v5->_tokens;
      v5->_tokens = (NSArray *)v12;

      _Block_object_dispose(&v16, 8);
      _Block_object_dispose(&v22, 8);

LABEL_10:
      long long v11 = v5;
      goto LABEL_11;
    }
    _Block_object_dispose(&v16, 8);

    _Block_object_dispose(&v22, 8);
  }
  else
  {
  }
  long long v11 = 0;
LABEL_11:

  return v11;
}

void __45__AFSpeechInterpretation_initWithDictionary___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  uint64_t v7 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v7);
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
  long long v11 = [[AFSpeechToken alloc] initWithDictionary:v12];
  if (!v11)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v11];
}

- (int64_t)averageConfidenceScore
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(NSArray *)self->_tokens count];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_tokens;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v4);
        }
        v7 += objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "confidenceScore", (void)v11);
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
  }

  if (v3) {
    return v7 / v3;
  }
  else {
    return 0;
  }
}

- (AFSpeechInterpretation)initWithCoder:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AFSpeechInterpretation;
  uint64_t v5 = [(AFSpeechInterpretation *)&v12 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
    uint64_t v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"tokens"];
    tokens = v5->_tokens;
    v5->_tokens = (NSArray *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)description
{
  uint64_t v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)AFSpeechInterpretation;
  id v4 = [(AFSpeechInterpretation *)&v7 description];
  uint64_t v5 = [v3 stringWithFormat:@"%@, tokens=%@", v4, self->_tokens];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = (NSArray *)v4[1];
    if (v5 == self->_tokens) {
      char v6 = 1;
    }
    else {
      char v6 = -[NSArray isEqualToArray:](v5, "isEqualToArray:");
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_tokens hash];
  id v4 = [(NSArray *)self->_tokens firstObject];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end