@interface JEMetricsDataPredicate
+ (id)predicateWithConfiguration:(id)a3;
+ (id)predicateWithType:(id)a3 argument:(id)a4;
- (BOOL)evaluateWithMetricsData:(id)a3;
- (JEMetricsDataPredicate)initWithConfigDictionary:(id)a3;
- (JEMetricsDataPredicate)initWithFormat:(id)a3;
@end

@implementation JEMetricsDataPredicate

- (void).cxx_destruct
{
}

uint64_t __51__JEMetricsDataPredicate_initWithConfigDictionary___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = +[JEMetricsDataPredicate predicateWithType:a2 argument:a3];
  if (v4) {
    [*(id *)(a1 + 32) addObject:v4];
  }
  return MEMORY[0x1F41817F8]();
}

+ (id)predicateWithType:(id)a3 argument:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isEqualToString:@"valueMatches"])
  {
    id v7 = v6;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }

    if (v8)
    {
      v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self in %@", v8];
    }
    else
    {
      v10 = 0;
    }
  }
  else if ([v5 isEqualToString:@"nonEmpty"] {
         && (objc_opt_respondsToSelector() & 1) != 0)
  }
  {
    if ([v6 BOOLValue]) {
      v9 = @"self != nil && self != ''";
    }
    else {
      v9 = @"self == nil || self == ''";
    }
    v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:v9];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __50__JEMetricsDataPredicate_evaluateWithMetricsData___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = *(id *)(a1 + 32);
  if (([v7 isEqualToString:@"_"] & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
      *a4 = 1;
      goto LABEL_16;
    }
    uint64_t v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];

    id v9 = (id)v10;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        if ((objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "evaluateWithObject:", v9, (void)v16) & 1) == 0)
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
          *a4 = 1;
          goto LABEL_14;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
LABEL_14:

LABEL_16:
}

- (BOOL)evaluateWithMetricsData:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 1;
  if (self) {
    fieldPredicates = self->_fieldPredicates;
  }
  else {
    fieldPredicates = 0;
  }
  id v6 = fieldPredicates;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__JEMetricsDataPredicate_evaluateWithMetricsData___block_invoke;
  v9[3] = &unk_1E59B5010;
  id v7 = v4;
  id v10 = v7;
  id v11 = &v12;
  [(NSDictionary *)v6 enumerateKeysAndObjectsUsingBlock:v9];

  LOBYTE(v6) = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  return (char)v6;
}

- (JEMetricsDataPredicate)initWithConfigDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)JEMetricsDataPredicate;
  id v5 = [(JEMetricsDataPredicate *)&v13 init];
  if (v5)
  {
    id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __51__JEMetricsDataPredicate_initWithConfigDictionary___block_invoke;
    v11[3] = &unk_1E59B4FE8;
    id v12 = v6;
    id v7 = v6;
    [v4 enumerateKeysAndObjectsUsingBlock:v11];
    uint64_t v8 = [v7 copy];
    fieldPredicates = v5->_fieldPredicates;
    v5->_fieldPredicates = (NSDictionary *)v8;
  }
  return v5;
}

void __51__JEMetricsDataPredicate_initWithConfigDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v8 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  if (v9)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __51__JEMetricsDataPredicate_initWithConfigDictionary___block_invoke_2;
    v14[3] = &unk_1E59B4FE8;
    id v15 = v7;
    [v9 enumerateKeysAndObjectsUsingBlock:v14];
  }
  id v10 = v8;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  if (v11)
  {
    id v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:v11];
    [v7 addObject:v12];
  }
  if ([v7 count])
  {
    objc_super v13 = (void *)[v7 copy];
    [*(id *)(a1 + 32) setObject:v13 forKeyedSubscript:v5];
  }
}

+ (id)predicateWithConfiguration:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [[JEMetricsDataPredicate alloc] initWithConfigDictionary:v3];
LABEL_5:
    id v5 = v4;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [[JEMetricsDataPredicate alloc] initWithFormat:v3];
    goto LABEL_5;
  }
  id v5 = 0;
LABEL_7:

  return v5;
}

- (JEMetricsDataPredicate)initWithFormat:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)JEMetricsDataPredicate;
  id v5 = [(JEMetricsDataPredicate *)&v11 init];
  if (v5)
  {
    objc_super v13 = @"_";
    id v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:v4];
    id v12 = v6;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
    v14[0] = v7;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    fieldPredicates = v5->_fieldPredicates;
    v5->_fieldPredicates = (NSDictionary *)v8;
  }
  return v5;
}

@end