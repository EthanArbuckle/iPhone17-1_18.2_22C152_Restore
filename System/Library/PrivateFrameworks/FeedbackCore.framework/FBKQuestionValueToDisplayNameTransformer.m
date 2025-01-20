@interface FBKQuestionValueToDisplayNameTransformer
+ (Class)transformedValueClass;
- (FBKQuestionValueToDisplayNameTransformer)initWithDictionary:(id)a3;
- (NSDictionary)dictionary;
- (id)transformedValue:(id)a3;
- (void)setDictionary:(id)a3;
@end

@implementation FBKQuestionValueToDisplayNameTransformer

- (FBKQuestionValueToDisplayNameTransformer)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FBKQuestionValueToDisplayNameTransformer;
  v5 = [(FBKQuestionValueToDisplayNameTransformer *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    dictionary = v5->_dictionary;
    v5->_dictionary = (NSDictionary *)v6;
  }
  return v5;
}

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

- (id)transformedValue:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!v4)
    {
      id v4 = [MEMORY[0x263EFF9D0] null];
    }
    v12 = [(FBKQuestionValueToDisplayNameTransformer *)self dictionary];
    v5 = [v12 objectForKeyedSubscript:v4];

    if (v5)
    {
      v11 = v5;
    }
    else
    {
      v11 = (__CFString *)v4;
      if (!v11)
      {
LABEL_16:

        v11 = &stru_26DDF6A30;
        goto LABEL_17;
      }
    }
    v13 = [MEMORY[0x263EFF9D0] null];

    if (v11 != v13) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  v5 = [MEMORY[0x263EFF980] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = v4;
  uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v4);
        }
        v10 = -[FBKQuestionValueToDisplayNameTransformer transformedValue:](self, "transformedValue:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
        [v5 addObject:v10];
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  v11 = [v5 componentsJoinedByString:@", "];
LABEL_17:

  return v11;
}

- (NSDictionary)dictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end