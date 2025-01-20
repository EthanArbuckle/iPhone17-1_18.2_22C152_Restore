@interface SGStringLabelingTransformer
+ (id)convertLabelsToMapping:(id)a3;
+ (id)withLabelStrings:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToStringLabelingTransformer:(id)a3;
- (SGStringLabelingTransformer)initWithLabelMapping:(id)a3;
- (SGStringLabelingTransformer)initWithLabelStrings:(id)a3;
- (SGStringLabelingTransformer)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5;
- (id)toPlistWithChunks:(id)a3;
- (id)transform:(id)a3;
- (unint64_t)hash;
@end

@implementation SGStringLabelingTransformer

- (void).cxx_destruct
{
}

- (unint64_t)hash
{
  return [(NSDictionary *)self->_labelMapping hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SGStringLabelingTransformer *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SGStringLabelingTransformer *)self isEqualToStringLabelingTransformer:v5];

  return v6;
}

- (BOOL)isEqualToStringLabelingTransformer:(id)a3
{
  v4 = a3;
  if (v4)
  {
    v5 = self->_labelMapping;
    BOOL v6 = v5;
    if (v5 == (NSDictionary *)v4[1]) {
      char v7 = 1;
    }
    else {
      char v7 = -[NSDictionary isEqual:](v5, "isEqual:");
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (SGStringLabelingTransformer)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5
{
  BOOL v6 = objc_msgSend(a3, "objectForKeyedSubscript:", @"LABEL_MAPPING", a4, a5);
  char v7 = [(SGStringLabelingTransformer *)self initWithLabelMapping:v6];

  return v7;
}

- (id)toPlistWithChunks:(id)a3
{
  v7[1] = *MEMORY[0x263EF8340];
  labelMapping = self->_labelMapping;
  BOOL v6 = @"LABEL_MAPPING";
  v7[0] = labelMapping;
  v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  return v4;
}

- (id)transform:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    __assert_rtn("-[SGStringLabelingTransformer transform:]", "SGStringLabelingTransformer.m", 58, "[input isKindOfClass:[NSString class]]");
  }
  uint64_t v5 = [(NSDictionary *)self->_labelMapping objectForKeyedSubscript:v4];
  BOOL v6 = (void *)v5;
  char v7 = &unk_26DB01600;
  if (v5) {
    char v7 = (void *)v5;
  }
  id v8 = v7;

  return v8;
}

- (SGStringLabelingTransformer)initWithLabelMapping:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SGStringLabelingTransformer.m", 49, @"Invalid parameter not satisfying: %@", @"mapping" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)SGStringLabelingTransformer;
  char v7 = [(SGStringLabelingTransformer *)&v11 init];
  id v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_labelMapping, a3);
  }

  return v8;
}

- (SGStringLabelingTransformer)initWithLabelStrings:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"SGStringLabelingTransformer.m", 43, @"Invalid parameter not satisfying: %@", @"labels" object file lineNumber description];
  }
  id v6 = +[SGStringLabelingTransformer convertLabelsToMapping:v5];
  char v7 = [(SGStringLabelingTransformer *)self initWithLabelMapping:v6];

  return v7;
}

+ (id)convertLabelsToMapping:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (!v3)
  {
    v20 = [MEMORY[0x263F08690] currentHandler];
    [v20 handleFailureInMethod:a2, a1, @"SGStringLabelingTransformer.m", 28, @"Invalid parameter not satisfying: %@", @"labels" object file lineNumber description];
  }
  id v4 = objc_opt_new();
  if ([v3 count])
  {
    unint64_t v5 = 0;
    v21 = v3;
    do
    {
      context = (void *)MEMORY[0x22A66BDC0]();
      id v6 = [v3 objectAtIndex:v5];
      unint64_t v23 = v5 + 1;
      char v7 = [NSNumber numberWithUnsignedInteger:v5 + 1];
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v8 = v6;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v27;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v27 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void *)(*((void *)&v26 + 1) + 8 * i);
            uint64_t v14 = [v4 objectForKeyedSubscript:v13];
            if (v14)
            {
              v15 = (void *)v14;
              v16 = [v4 objectForKeyedSubscript:v13];
              char v17 = [v16 isEqualToNumber:v7];

              if ((v17 & 1) == 0)
              {
                v18 = [MEMORY[0x263F08690] currentHandler];
                [v18 handleFailureInMethod:a2, a1, @"SGStringLabelingTransformer.m", 34, @"duplicate label %@", v13 object file lineNumber description];
              }
            }
            [v4 setObject:v7 forKey:v13];
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
        }
        while (v10);
      }

      id v3 = v21;
      unint64_t v5 = v23;
    }
    while (v23 < [v21 count]);
  }

  return v4;
}

+ (id)withLabelStrings:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (void *)[objc_alloc((Class)a1) initWithLabelStrings:v4];

  return v5;
}

@end