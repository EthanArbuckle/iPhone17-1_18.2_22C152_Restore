@interface AFSpeechUtterance
+ (BOOL)supportsSecureCoding;
- (AFSpeechInterpretation)interpretation;
- (AFSpeechUtterance)initWithCoder:(id)a3;
- (AFSpeechUtterance)initWithDictionary:(id)a3;
- (AFSpeechUtterance)initWithInterpretationIndices:(id)a3 confidenceScore:(int64_t)a4;
- (AFSpeechUtterance)initWithInterpretationIndices:(id)a3 confidenceScore:(int64_t)a4 interpretation:(id)a5;
- (BOOL)isEqual:(id)a3;
- (NSArray)interpretationIndices;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)confidenceScore;
- (int64_t)source;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setConfidenceScore:(int64_t)a3;
- (void)setInterpretationIndices:(id)a3;
- (void)setSource:(int64_t)a3;
@end

@implementation AFSpeechUtterance

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interpretation, 0);
  objc_storeStrong((id *)&self->_interpretationIndices, 0);
}

- (AFSpeechInterpretation)interpretation
{
  return self->_interpretation;
}

- (void)setSource:(int64_t)a3
{
  self->_source = a3;
}

- (int64_t)source
{
  return self->_source;
}

- (void)setConfidenceScore:(int64_t)a3
{
  self->_confidenceScore = a3;
}

- (int64_t)confidenceScore
{
  return self->_confidenceScore;
}

- (void)setInterpretationIndices:(id)a3
{
}

- (NSArray)interpretationIndices
{
  return self->_interpretationIndices;
}

- (id)dictionaryRepresentation
{
  v11[4] = *MEMORY[0x1E4F143B8];
  int64_t confidenceScore = self->_confidenceScore;
  v11[0] = self->_interpretationIndices;
  v10[0] = @"interpretationIndices";
  v10[1] = @"confidenceScore";
  v4 = [MEMORY[0x1E4F28ED0] numberWithInteger:confidenceScore];
  v11[1] = v4;
  v10[2] = @"source";
  v5 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_source];
  v11[2] = v5;
  v10[3] = @"interpretation";
  interpretation = self->_interpretation;
  if (interpretation) {
    [(AFSpeechInterpretation *)interpretation dictionaryRepresentation];
  }
  else {
  v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v11[3] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:4];

  return v8;
}

- (AFSpeechUtterance)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKey:@"interpretationIndices"];
  v6 = [v4 objectForKey:@"interpretationIndices"];
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  id v9 = v6;
  if (v9)
  {
    NSClassFromString(v8);
    if (objc_opt_isKindOfClass())
    {

      uint64_t v25 = 0;
      v26 = &v25;
      uint64_t v27 = 0x2020000000;
      char v28 = 0;
      uint64_t v19 = 0;
      v20 = &v19;
      uint64_t v21 = 0x3032000000;
      v22 = __Block_byref_object_copy__8732;
      v23 = __Block_byref_object_dispose__8733;
      id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __40__AFSpeechUtterance_initWithDictionary___block_invoke;
      v18[3] = &unk_1E5926638;
      v18[4] = &v25;
      v18[5] = &v19;
      [v5 enumerateObjectsUsingBlock:v18];
      if (*((unsigned char *)v26 + 24) || ![(id)v20[5] count])
      {
        v10 = 0;
LABEL_15:
        _Block_object_dispose(&v19, 8);

        _Block_object_dispose(&v25, 8);
        goto LABEL_16;
      }
      v11 = [v4 objectForKey:@"confidenceScore"];
      v12 = (objc_class *)objc_opt_class();
      v13 = NSStringFromClass(v12);
      id v14 = v11;
      v15 = v13;
      v16 = v15;
      if (v14 && (NSClassFromString(v15), (objc_opt_isKindOfClass() & 1) != 0))
      {

        if (([v14 intValue] & 0x80000000) == 0 && (int)objc_msgSend(v14, "intValue") <= 1000)
        {
          self = -[AFSpeechUtterance initWithInterpretationIndices:confidenceScore:](self, "initWithInterpretationIndices:confidenceScore:", v20[5], (int)[v14 intValue]);
          v10 = self;
LABEL_14:

          goto LABEL_15;
        }
      }
      else
      {
      }
      v10 = 0;
      goto LABEL_14;
    }
  }

  v10 = 0;
LABEL_16:

  return v10;
}

void __40__AFSpeechUtterance_initWithDictionary___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  id v9 = v6;
  id v11 = v9;
  if (v9
    && (NSClassFromString((NSString *)v8), isKindOfClass = objc_opt_isKindOfClass(), id v9 = v11, (isKindOfClass & 1) != 0))
  {
  }
  else
  {

    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  if (([v11 intValue] & 0x80000000) != 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v11];
}

- (AFSpeechUtterance)initWithInterpretationIndices:(id)a3 confidenceScore:(int64_t)a4 interpretation:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)AFSpeechUtterance;
  v10 = [(AFSpeechUtterance *)&v14 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    interpretationIndices = v10->_interpretationIndices;
    v10->_interpretationIndices = (NSArray *)v11;

    v10->_int64_t confidenceScore = a4;
    objc_storeStrong((id *)&v10->_interpretation, a5);
  }

  return v10;
}

- (AFSpeechUtterance)initWithInterpretationIndices:(id)a3 confidenceScore:(int64_t)a4
{
  return [(AFSpeechUtterance *)self initWithInterpretationIndices:a3 confidenceScore:a4 interpretation:0];
}

- (AFSpeechUtterance)initWithCoder:(id)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AFSpeechUtterance;
  v5 = [(AFSpeechUtterance *)&v14 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
    id v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"_interpretationIndices"];
    interpretationIndices = v5->_interpretationIndices;
    v5->_interpretationIndices = (NSArray *)v9;

    v5->_int64_t confidenceScore = [v4 decodeIntegerForKey:@"_confidenceScore"];
    v5->_source = [v4 decodeIntegerForKey:@"_source"];
    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_interpretation"];
    interpretation = v5->_interpretation;
    v5->_interpretation = (AFSpeechInterpretation *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  interpretationIndices = self->_interpretationIndices;
  id v5 = a3;
  [v5 encodeObject:interpretationIndices forKey:@"_interpretationIndices"];
  [v5 encodeInteger:self->_confidenceScore forKey:@"_confidenceScore"];
  [v5 encodeInteger:self->_source forKey:@"_source"];
  [v5 encodeObject:self->_interpretation forKey:@"_interpretation"];
}

- (id)description
{
  v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)AFSpeechUtterance;
  id v4 = [(AFSpeechUtterance *)&v10 description];
  interpretationIndices = self->_interpretationIndices;
  id v6 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_confidenceScore];
  v7 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_source];
  id v8 = [v3 stringWithFormat:@"%@, interpretationIndices=%@, confidenceScore=%@, source=%@, interpretation=%@", v4, interpretationIndices, v6, v7, self->_interpretation];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ((id v5 = (NSArray *)v4[1], v5 == self->_interpretationIndices) || -[NSArray isEqualToArray:](v5, "isEqualToArray:"))
    && v4[2] == self->_confidenceScore
    && v4[3] == self->_source)
  {
    id v6 = (AFSpeechInterpretation *)v4[4];
    if (v6 == self->_interpretation) {
      char v7 = 1;
    }
    else {
      char v7 = -[AFSpeechInterpretation isEqual:](v6, "isEqual:");
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_interpretationIndices hash];
  id v4 = [(NSArray *)self->_interpretationIndices firstObject];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end