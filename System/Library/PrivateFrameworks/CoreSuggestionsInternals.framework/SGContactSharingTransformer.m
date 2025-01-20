@interface SGContactSharingTransformer
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToContactSharingTransformer:(id)a3;
- (NSString)language;
- (SGContactSharingTransformer)initWithLanguage:(id)a3 windowLength:(int64_t)a4;
- (SGContactSharingTransformer)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5;
- (id)toPlistWithChunks:(id)a3;
- (id)transform:(id)a3;
- (int64_t)windowLength;
- (unint64_t)hash;
- (void)setLanguage:(id)a3;
- (void)setWindowLength:(int64_t)a3;
@end

@implementation SGContactSharingTransformer

- (void).cxx_destruct
{
}

- (void)setWindowLength:(int64_t)a3
{
  self->_windowLength = a3;
}

- (int64_t)windowLength
{
  return self->_windowLength;
}

- (void)setLanguage:(id)a3
{
}

- (NSString)language
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (unint64_t)hash
{
  v3 = [(SGContactSharingTransformer *)self language];
  uint64_t v4 = [v3 hash];

  v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[SGContactSharingTransformer windowLength](self, "windowLength"));
  unint64_t v6 = [v5 hash] - v4 + 32 * v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (SGContactSharingTransformer *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SGContactSharingTransformer *)self isEqualToContactSharingTransformer:v5];

  return v6;
}

- (BOOL)isEqualToContactSharingTransformer:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    v7 = [(SGContactSharingTransformer *)self language];
    v8 = [v6 language];
    if (v7 == v8
      || ([(SGContactSharingTransformer *)self language],
          v3 = objc_claimAutoreleasedReturnValue(),
          [v6 language],
          uint64_t v4 = objc_claimAutoreleasedReturnValue(),
          [v3 isEqual:v4]))
    {
      int64_t v10 = [(SGContactSharingTransformer *)self windowLength];
      BOOL v9 = v10 == [v6 windowLength];
      if (v7 == v8)
      {
LABEL_8:

        goto LABEL_9;
      }
    }
    else
    {
      BOOL v9 = 0;
    }

    goto LABEL_8;
  }
  BOOL v9 = 0;
LABEL_9:

  return v9;
}

- (SGContactSharingTransformer)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5
{
  id v6 = a3;
  v7 = [v6 objectForKeyedSubscript:@"LANGUAGE"];
  v8 = [v6 objectForKeyedSubscript:@"WINDOWLENGTH"];

  BOOL v9 = -[SGContactSharingTransformer initWithLanguage:windowLength:](self, "initWithLanguage:windowLength:", v7, [v8 integerValue]);
  return v9;
}

- (id)toPlistWithChunks:(id)a3
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v8[0] = @"LANGUAGE";
  uint64_t v4 = [(SGContactSharingTransformer *)self language];
  v8[1] = @"WINDOWLENGTH";
  v9[0] = v4;
  v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[SGContactSharingTransformer windowLength](self, "windowLength"));
  v9[1] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];

  return v6;
}

- (id)transform:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([v5 objectForKeyedSubscript:@"INPUT_TEXT"],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        !v6))
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    v8 = (objc_class *)objc_opt_class();
    BOOL v9 = NSStringFromClass(v8);
    [v7 handleFailureInMethod:a2, self, @"SGContactSharingTransformer.m", 59, @"Unexpected input: %@. %@ requires dictionary with SG_MODEL_INPUT_TEXT key.", v5, v9 object file lineNumber description];
  }
  int64_t v10 = (void *)_tokenizer;
  v11 = [v5 objectForKeyedSubscript:@"INPUT_TEXT"];
  v12 = [v10 transform:v11];

  v13 = [v5 objectForKeyedSubscript:@"NEGATIVE_SAMPLE_CHOPLESS"];
  if (v13)
  {
  }
  else
  {
    v22 = [v5 objectForKeyedSubscript:@"NEGATIVE_SAMPLE_CHOPPABLE_START"];

    if (v22)
    {
      unint64_t v23 = [v12 count];
      v24 = [v5 objectForKeyedSubscript:@"NEGATIVE_SAMPLE_CHOPPABLE_START"];
      uint64_t v25 = [v24 integerValue];

      long long v41 = 0u;
      long long v42 = 0u;
      if (v25 >= 0) {
        uint64_t v26 = v25;
      }
      else {
        uint64_t v26 = (v25 + v23) & ~((uint64_t)(v25 + v23) >> 63);
      }
      long long v39 = 0uLL;
      long long v40 = 0uLL;
      id v27 = v12;
      uint64_t v28 = [v27 countByEnumeratingWithState:&v39 objects:v43 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v40;
        do
        {
          for (uint64_t i = 0; i != v29; ++i)
          {
            if (*(void *)v40 != v30) {
              objc_enumerationMutation(v27);
            }
            unint64_t v23 = (__PAIR128__(v23, [*(id *)(*((void *)&v39 + 1) + 8 * i) range])
                 - (unint64_t)v26) >> 64;
          }
          uint64_t v29 = [v27 countByEnumeratingWithState:&v39 objects:v43 count:16];
        }
        while (v29);
      }

      if (v23)
      {
        v32 = (void *)MEMORY[0x1CB79B230]();
        if (v23 < 3)
        {
          unint64_t v37 = 1;
        }
        else
        {
          unint64_t v33 = self->_rng.s[0];
          unint64_t v34 = self->_rng.s[1];
          unint64_t v35 = v34 + v33;
          unint64_t v36 = v34 ^ v33;
          self->_rng.s[0] = __ROR8__(v33, 9) ^ (v36 << 14) ^ v36;
          self->_rng.s[1] = __ROR8__(v36, 28);
          unint64_t v37 = v35 % (v23 - 1) + 1;
        }
        v38 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", objc_msgSend(v27, "count") - v37, v37);
        [v27 removeObjectsAtIndexes:v38];
      }
    }
  }
  uint64_t v14 = [v12 count];
  int64_t v15 = [(SGContactSharingTransformer *)self windowLength];
  uint64_t v16 = (v14 - v15) & ~((v14 - v15) >> 63);
  unint64_t v17 = [(SGContactSharingTransformer *)self windowLength];
  uint64_t v18 = [v12 count];
  if (v17 >= v18 - v16) {
    unint64_t v19 = v18 - v16;
  }
  else {
    unint64_t v19 = v17;
  }
  v20 = objc_msgSend(v12, "subarrayWithRange:", v16, v19);

  return v20;
}

- (SGContactSharingTransformer)initWithLanguage:(id)a3 windowLength:(int64_t)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SGContactSharingTransformer;
  v7 = [(SGContactSharingTransformer *)&v13 init];
  v8 = v7;
  if (v7)
  {
    [(SGContactSharingTransformer *)v7 setLanguage:v6];
    [(SGContactSharingTransformer *)v8 setWindowLength:a4];
    BOOL v9 = [(SGContactSharingTransformer *)v8 language];
    uint64_t v10 = +[SGTokenizerMappingTransformer forLocale:v9 withPersonalNameMapping:@"SG_FEATURE_FULLNAME"];
    v11 = (void *)_tokenizer;
    _tokenizer = v10;

    arc4random_buf(&v8->_rng, 0x10uLL);
  }

  return v8;
}

@end