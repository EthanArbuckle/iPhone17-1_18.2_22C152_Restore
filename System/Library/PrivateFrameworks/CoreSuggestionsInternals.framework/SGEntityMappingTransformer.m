@interface SGEntityMappingTransformer
+ (id)withEmailMapping:(id)a3 linkMapping:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToEntityMappingTransformer:(id)a3;
- (NSDataDetector)dataDetector;
- (NSString)emailMapping;
- (NSString)linkMapping;
- (SGEntityMappingTransformer)initWithEmailMapping:(id)a3 linkMapping:(id)a4;
- (SGEntityMappingTransformer)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5;
- (id)toPlistWithChunks:(id)a3;
- (id)transform:(id)a3;
- (unint64_t)hash;
- (void)setDataDetector:(id)a3;
- (void)setEmailMapping:(id)a3;
- (void)setLinkMapping:(id)a3;
@end

@implementation SGEntityMappingTransformer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkMapping, 0);
  objc_storeStrong((id *)&self->_emailMapping, 0);
  objc_storeStrong((id *)&self->_dataDetector, 0);
}

- (void)setLinkMapping:(id)a3
{
}

- (NSString)linkMapping
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setEmailMapping:(id)a3
{
}

- (NSString)emailMapping
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDataDetector:(id)a3
{
}

- (NSDataDetector)dataDetector
{
  return (NSDataDetector *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)hash
{
  v3 = [(SGEntityMappingTransformer *)self emailMapping];
  uint64_t v4 = [v3 hash];

  v5 = [(SGEntityMappingTransformer *)self linkMapping];
  unint64_t v6 = [v5 hash] - v4 + 32 * v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (SGEntityMappingTransformer *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SGEntityMappingTransformer *)self isEqualToEntityMappingTransformer:v5];

  return v6;
}

- (BOOL)isEqualToEntityMappingTransformer:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    v7 = [(SGEntityMappingTransformer *)self emailMapping];
    v8 = [v6 emailMapping];
    if (v7 == v8
      || ([(SGEntityMappingTransformer *)self emailMapping],
          v3 = objc_claimAutoreleasedReturnValue(),
          [v6 emailMapping],
          uint64_t v4 = objc_claimAutoreleasedReturnValue(),
          [v3 isEqual:v4]))
    {
      v10 = [(SGEntityMappingTransformer *)self linkMapping];
      uint64_t v11 = [v6 linkMapping];
      if (v10 == (void *)v11)
      {

        char v9 = 1;
      }
      else
      {
        v12 = (void *)v11;
        v13 = [(SGEntityMappingTransformer *)self linkMapping];
        v14 = [v6 linkMapping];
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

- (SGEntityMappingTransformer)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5
{
  id v6 = a3;
  v7 = [v6 objectForKeyedSubscript:@"EMAIL_MAPPING"];
  v8 = [v6 objectForKeyedSubscript:@"LINK_MAPPING"];

  char v9 = [(SGEntityMappingTransformer *)self initWithEmailMapping:v7 linkMapping:v8];
  return v9;
}

- (id)toPlistWithChunks:(id)a3
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v8[0] = @"EMAIL_MAPPING";
  uint64_t v4 = [(SGEntityMappingTransformer *)self emailMapping];
  v8[1] = @"LINK_MAPPING";
  v9[0] = v4;
  v5 = [(SGEntityMappingTransformer *)self linkMapping];
  v9[1] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];

  return v6;
}

- (id)transform:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    __assert_rtn("-[SGEntityMappingTransformer transform:]", "SGEntityMappingTransformer.m", 54, "[input isKindOfClass:[NSString class]]");
  }
  v5 = objc_opt_new();
  if (getEntityMappingDispatchQueue__pasOnceToken2 != -1) {
    dispatch_once(&getEntityMappingDispatchQueue__pasOnceToken2, &__block_literal_global_4261);
  }
  id v6 = getEntityMappingDispatchQueue__pasExprOnceResult;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__SGEntityMappingTransformer_transform___block_invoke;
  block[3] = &unk_1E65C0688;
  id v13 = v4;
  v14 = self;
  id v7 = v5;
  id v15 = v7;
  id v8 = v4;
  dispatch_sync(v6, block);
  char v9 = v15;
  id v10 = v7;

  return v10;
}

void __40__SGEntityMappingTransformer_transform___block_invoke(id *a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v2 = a1[4];
  unint64_t v3 = [v2 length];
  id v4 = (void *)MEMORY[0x1CB79B230]();
  v5 = [a1[5] dataDetector];
  v30 = v2;
  id v6 = objc_msgSend(v5, "matchesInString:options:range:", v2, 0, 0, objc_msgSend(v2, "length"));

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v6;
  uint64_t v33 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v33)
  {
    unint64_t v28 = v3;
    v29 = v4;
    unint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v32 = *(void *)v35;
    do
    {
      uint64_t v9 = 0;
      unint64_t v10 = v7;
      uint64_t v11 = v8;
      do
      {
        if (*(void *)v35 != v32) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v34 + 1) + 8 * v9);
        id v13 = (void *)MEMORY[0x1CB79B230]();
        unint64_t v7 = [v12 range];
        uint64_t v8 = v14;
        if ([v12 resultType] == 32)
        {
          id v15 = [v12 URL];
          v16 = [v15 scheme];
          int v17 = [v16 isEqualToString:@"mailto"];

          id v18 = a1[5];
          if (v17) {
            [v18 emailMapping];
          }
          else {
          v19 = [v18 linkMapping];
          }
        }
        else
        {
          v19 = 0;
        }
        uint64_t v20 = v10 + v11;
        unint64_t v21 = v7 - (v10 + v11);
        if (v7 > v10 + v11)
        {
          v22 = (void *)MEMORY[0x1CB79B230]();
          id v23 = a1[6];
          v24 = objc_msgSend(v30, "substringWithRange:", v20, v21);
          [v23 appendString:v24];
        }
        objc_msgSend(a1[6], "appendString:", v19, v28, v29);

        ++v9;
        unint64_t v10 = v7;
        uint64_t v11 = v8;
      }
      while (v33 != v9);
      uint64_t v33 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v33);
    unint64_t v3 = v28;
    id v4 = v29;
  }
  else
  {
    uint64_t v8 = 0;
    unint64_t v7 = 0;
  }

  if (v3 > v7 + v8)
  {
    v25 = (void *)MEMORY[0x1CB79B230]();
    id v26 = a1[6];
    v27 = objc_msgSend(v30, "substringWithRange:", v7 + v8, v3 - (v7 + v8));
    [v26 appendString:v27];
  }
}

- (SGEntityMappingTransformer)initWithEmailMapping:(id)a3 linkMapping:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SGEntityMappingTransformer;
  uint64_t v8 = [(SGEntityMappingTransformer *)&v15 init];
  if (v8)
  {
    id v14 = 0;
    uint64_t v9 = [MEMORY[0x1E4F28BE8] dataDetectorWithTypes:32 error:&v14];
    id v10 = v14;
    [(SGEntityMappingTransformer *)v8 setDataDetector:v9];

    if (v10)
    {
      uint64_t v11 = sgLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        id v13 = [v10 localizedDescription];
        *(_DWORD *)buf = 138412290;
        int v17 = v13;
        _os_log_error_impl(&dword_1CA650000, v11, OS_LOG_TYPE_ERROR, "Error constructing data detector for featurizing: %@", buf, 0xCu);
      }
    }
    [(SGEntityMappingTransformer *)v8 setEmailMapping:v6];
    [(SGEntityMappingTransformer *)v8 setLinkMapping:v7];
  }
  return v8;
}

+ (id)withEmailMapping:(id)a3 linkMapping:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[SGEntityMappingTransformer alloc] initWithEmailMapping:v6 linkMapping:v5];

  return v7;
}

@end