@interface _ATXCoreAnalyticsDimensionSet
- (BOOL)isEqual:(id)a3;
- (id)_dictionaryKeys;
- (id)copyWithZone:(_NSZone *)a3;
- (id)coreAnalyticsDictionary;
- (id)powerset;
- (unint64_t)hash;
@end

@implementation _ATXCoreAnalyticsDimensionSet

- (id)coreAnalyticsDictionary
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (id)powerset
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = self;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

- (id)_dictionaryKeys
{
  v2 = [(_ATXCoreAnalyticsDimensionSet *)self coreAnalyticsDictionary];
  v3 = [v2 allKeys];
  v4 = [v3 sortedArrayUsingComparator:&__block_literal_global_120];

  return v4;
}

- (unint64_t)hash
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = [(_ATXCoreAnalyticsDimensionSet *)self _dictionaryKeys];
  v4 = [(_ATXCoreAnalyticsDimensionSet *)self coreAnalyticsDictionary];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    unint64_t v8 = 0;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v5);
        }
        v11 = objc_msgSend(v4, "objectForKeyedSubscript:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        unint64_t v8 = [v11 hash] - v8 + 32 * v8;
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_ATXCoreAnalyticsDimensionSet *)a3;
  id v5 = v4;
  if (self == v4)
  {
    char v9 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v6 = v5;
    uint64_t v7 = [(_ATXCoreAnalyticsDimensionSet *)self coreAnalyticsDictionary];
    unint64_t v8 = [(_ATXCoreAnalyticsDimensionSet *)v6 coreAnalyticsDictionary];

    char v9 = [v7 isEqualToDictionary:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v3 = +[_ATXCoreAnalyticsDimensionSet allocWithZone:a3];
  return [(_ATXCoreAnalyticsDimensionSet *)v3 init];
}

@end