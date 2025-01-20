@interface SGSymbolicMappingTransformer
+ (id)withNumericMapping:(id)a3 andSymbolicMapping:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSymbolicMappingTransformer:(id)a3;
- (NSCharacterSet)characterSet;
- (NSString)characterMapping;
- (NSString)numericMapping;
- (SGSymbolicMappingTransformer)initWithNumericMapping:(id)a3 andSymbolicMapping:(id)a4;
- (SGSymbolicMappingTransformer)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5;
- (id)toPlistWithChunks:(id)a3;
- (id)transform:(id)a3;
- (unint64_t)hash;
- (void)setCharacterMapping:(id)a3;
- (void)setCharacterSet:(id)a3;
- (void)setNumericMapping:(id)a3;
@end

@implementation SGSymbolicMappingTransformer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characterSet, 0);
  objc_storeStrong((id *)&self->_characterMapping, 0);
  objc_storeStrong((id *)&self->_numericMapping, 0);
}

- (void)setCharacterSet:(id)a3
{
}

- (NSCharacterSet)characterSet
{
  return (NSCharacterSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCharacterMapping:(id)a3
{
}

- (NSString)characterMapping
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setNumericMapping:(id)a3
{
}

- (NSString)numericMapping
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)hash
{
  v3 = [(SGSymbolicMappingTransformer *)self numericMapping];
  uint64_t v4 = [v3 hash];

  v5 = [(SGSymbolicMappingTransformer *)self characterMapping];
  unint64_t v6 = [v5 hash] - v4 + 32 * v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (SGSymbolicMappingTransformer *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SGSymbolicMappingTransformer *)self isEqualToSymbolicMappingTransformer:v5];

  return v6;
}

- (BOOL)isEqualToSymbolicMappingTransformer:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    v7 = [(SGSymbolicMappingTransformer *)self numericMapping];
    v8 = [v6 numericMapping];
    if (v7 == v8
      || ([(SGSymbolicMappingTransformer *)self numericMapping],
          v3 = objc_claimAutoreleasedReturnValue(),
          [v6 numericMapping],
          uint64_t v4 = objc_claimAutoreleasedReturnValue(),
          [v3 isEqual:v4]))
    {
      v10 = [(SGSymbolicMappingTransformer *)self characterMapping];
      uint64_t v11 = [v6 characterMapping];
      if (v10 == (void *)v11)
      {

        char v9 = 1;
      }
      else
      {
        v12 = (void *)v11;
        v13 = [(SGSymbolicMappingTransformer *)self characterMapping];
        v14 = [v6 characterMapping];
        char v9 = [v13 isEqual:v14];
      }
      if (v7 == v8) {
        goto LABEL_11;
      }
    }
    else
    {
      char v9 = 0;
    }

LABEL_11:
    goto LABEL_12;
  }
  char v9 = 0;
LABEL_12:

  return v9;
}

- (SGSymbolicMappingTransformer)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5
{
  id v6 = a3;
  v7 = [v6 objectForKeyedSubscript:@"NUMERIC_MAPPING"];
  v8 = [v6 objectForKeyedSubscript:@"CHARACTER_MAPPING"];

  char v9 = [(SGSymbolicMappingTransformer *)self initWithNumericMapping:v7 andSymbolicMapping:v8];
  return v9;
}

- (id)toPlistWithChunks:(id)a3
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v8[0] = @"NUMERIC_MAPPING";
  uint64_t v4 = [(SGSymbolicMappingTransformer *)self numericMapping];
  v8[1] = @"CHARACTER_MAPPING";
  v9[0] = v4;
  v5 = [(SGSymbolicMappingTransformer *)self characterMapping];
  v9[1] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];

  return v6;
}

- (id)transform:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    __assert_rtn("-[SGSymbolicMappingTransformer transform:]", "SGSymbolicMappingTransformer.m", 65, "[input isKindOfClass:[NSArray class]]");
  }
  v5 = objc_opt_new();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42__SGSymbolicMappingTransformer_transform___block_invoke;
  void v9[3] = &unk_1E65B9728;
  id v6 = v5;
  id v10 = v6;
  uint64_t v11 = self;
  [v4 enumerateObjectsUsingBlock:v9];
  id v7 = v6;

  return v7;
}

void __42__SGSymbolicMappingTransformer_transform___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  if (_PASLooksLikeNumber())
  {
    v3 = *(void **)(a1 + 32);
    id v4 = [*(id *)(a1 + 40) numericMapping];
LABEL_3:
    v5 = v4;
    id v6 = numberedString(v4, [v9 length]);
    [v3 addObject:v6];

    goto LABEL_8;
  }
  id v7 = [*(id *)(a1 + 40) characterSet];
  if ([v9 rangeOfCharacterFromSet:v7] == 0x7FFFFFFFFFFFFFFFLL
    || ([v9 hasPrefix:@"SG_FEATURE"] & 1) != 0)
  {
  }
  else
  {
    char v8 = [v9 hasPrefix:@"SG_TARGET"];

    if ((v8 & 1) == 0)
    {
      v3 = *(void **)(a1 + 32);
      id v4 = [*(id *)(a1 + 40) characterMapping];
      goto LABEL_3;
    }
  }
  [*(id *)(a1 + 32) addObject:v9];
LABEL_8:
}

- (SGSymbolicMappingTransformer)initWithNumericMapping:(id)a3 andSymbolicMapping:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SGSymbolicMappingTransformer;
  char v8 = [(SGSymbolicMappingTransformer *)&v13 init];
  id v9 = v8;
  if (v8)
  {
    [(SGSymbolicMappingTransformer *)v8 setNumericMapping:v6];
    [(SGSymbolicMappingTransformer *)v9 setCharacterMapping:v7];
    id v10 = [MEMORY[0x1E4F28B88] letterCharacterSet];
    uint64_t v11 = [v10 invertedSet];
    [(SGSymbolicMappingTransformer *)v9 setCharacterSet:v11];
  }
  return v9;
}

+ (id)withNumericMapping:(id)a3 andSymbolicMapping:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[SGSymbolicMappingTransformer alloc] initWithNumericMapping:v6 andSymbolicMapping:v5];

  return v7;
}

@end