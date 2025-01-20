@interface IKStyleMediaQuery
+ (id)mediaQueryListWithCSSMediaQuery:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNegated;
- (IKStyleMediaQuery)initWithMediaType:(id)a3 featureValues:(id)a4 isNegated:(BOOL)a5;
- (NSDictionary)featureValues;
- (NSString)identifier;
- (NSString)mediaType;
- (unint64_t)hash;
@end

@implementation IKStyleMediaQuery

+ (id)mediaQueryListWithCSSMediaQuery:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA48] array];
  v24 = v3;
  v23 = [v3 queryList];
  [v23 subQueryList];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v28 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v28)
  {
    uint64_t v26 = *(void *)v36;
    v27 = v4;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v36 != v26) {
          objc_enumerationMutation(obj);
        }
        v29 = *(void **)(*((void *)&v35 + 1) + 8 * v5);
        uint64_t v30 = v5;
        v6 = [v29 expressionList];
        v7 = [MEMORY[0x1E4F1CA60] dictionary];
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id v8 = v6;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v31 objects:v39 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v32;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v32 != v11) {
                objc_enumerationMutation(v8);
              }
              v13 = *(void **)(*((void *)&v31 + 1) + 8 * i);
              v14 = [MEMORY[0x1E4F1CA98] null];
              v15 = [v13 valueAsString];
              if (([v15 isEqualToString:&stru_1F3E09950] & 1) == 0)
              {
                id v16 = v15;

                v14 = v16;
              }
              v17 = [v13 key];
              [v7 setObject:v14 forKey:v17];
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v31 objects:v39 count:16];
          }
          while (v10);
        }

        v18 = [IKStyleMediaQuery alloc];
        v19 = [v29 type];
        v20 = -[IKStyleMediaQuery initWithMediaType:featureValues:isNegated:](v18, "initWithMediaType:featureValues:isNegated:", v19, v7, [v29 negated]);

        v4 = v27;
        [v27 addObject:v20];

        uint64_t v5 = v30 + 1;
      }
      while (v30 + 1 != v28);
      uint64_t v28 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v28);
  }
  if ([v4 count]) {
    id v21 = v4;
  }
  else {
    id v21 = 0;
  }

  return v21;
}

- (IKStyleMediaQuery)initWithMediaType:(id)a3 featureValues:(id)a4 isNegated:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)IKStyleMediaQuery;
  uint64_t v11 = [(IKStyleMediaQuery *)&v16 init];
  v12 = v11;
  if (v11)
  {
    v11->_isNegated = a5;
    objc_storeStrong((id *)&v11->_mediaType, a3);
    uint64_t v13 = [v10 copy];
    featureValues = v12->_featureValues;
    v12->_featureValues = (NSDictionary *)v13;
  }
  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(IKStyleMediaQuery *)self identifier];
    v6 = [v4 identifier];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(IKStyleMediaQuery *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)identifier
{
  identifier = self->_identifier;
  if (!identifier)
  {
    id v4 = [MEMORY[0x1E4F28E78] string];
    uint64_t v5 = v4;
    if (self->_isNegated) {
      [v4 appendString:@"not "];
    }
    [v5 appendString:self->_mediaType];
    featureValues = self->_featureValues;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __31__IKStyleMediaQuery_identifier__block_invoke;
    v11[3] = &unk_1E6DE4988;
    id v12 = v5;
    id v7 = v5;
    [(NSDictionary *)featureValues enumerateKeysAndObjectsUsingBlock:v11];
    id v8 = (NSString *)[v7 copy];
    id v9 = self->_identifier;
    self->_identifier = v8;

    identifier = self->_identifier;
  }
  return identifier;
}

void __31__IKStyleMediaQuery_identifier__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a3;
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a2;
  [v5 appendString:@" and "];
  objc_msgSend(*(id *)(a1 + 32), "appendString:", @"(");
  [*(id *)(a1 + 32) appendString:v6];

  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [*(id *)(a1 + 32) appendString:@": "];
      [*(id *)(a1 + 32) appendString:v7];
    }
  }
  [*(id *)(a1 + 32) appendString:@""]);
}

- (NSString)mediaType
{
  return self->_mediaType;
}

- (NSDictionary)featureValues
{
  return self->_featureValues;
}

- (BOOL)isNegated
{
  return self->_isNegated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureValues, 0);
  objc_storeStrong((id *)&self->_mediaType, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end