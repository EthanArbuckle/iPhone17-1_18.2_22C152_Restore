@interface CADPredicate
+ (id)conciseCalendarList:(id)a3;
+ (void)setValidator:(Class)a3;
- (BOOL)evaluateWithObject:(id)a3;
- (NSArray)defaultPropertiesToLoad;
- (NSDictionary)relatedObjectPropertiesToLoad;
- (NSFastEnumeration)databasesToQuery;
- (id)copyMatchingItemsWithDatabase:(CalDatabase *)a3;
- (void)beginSignpostWithHandle:(id)a3 signpostID:(unint64_t)a4;
@end

@implementation CADPredicate

+ (id)conciseCalendarList:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    v4 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithCapacity:", (4 * objc_msgSend(v3, "count")) | 2);
    -[__CFString appendString:](v4, "appendString:", @"(");
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v17 = v3;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      char v8 = 0;
      uint64_t v9 = *(void *)v19;
      int v10 = *MEMORY[0x1E4F574B8];
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v5);
          }
          v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if (v8) {
            [(__CFString *)v4 appendString:@","];
          }
          uint64_t v13 = [v12 databaseID];
          uint64_t v14 = [v12 entityID];
          if (v13 == v10) {
            [(__CFString *)v4 appendFormat:@"%i", v14, v16];
          }
          else {
            [(__CFString *)v4 appendFormat:@"%i/%i", v13, v14];
          }
          char v8 = 1;
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v7);
    }

    [(__CFString *)v4 appendString:@""]);
    id v3 = v17;
  }
  else
  {
    v4 = @"(null)";
  }

  return v4;
}

- (void)beginSignpostWithHandle:(id)a3 signpostID:(unint64_t)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = a3;
  uint64_t v7 = v6;
  if (a4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    char v8 = objc_opt_class();
    id v9 = v8;
    int v10 = [(CADPredicate *)self predicateFormat];
    int v11 = 138412546;
    v12 = v8;
    __int16 v13 = 2112;
    uint64_t v14 = v10;
    _os_signpost_emit_with_name_impl(&dword_1BBC88000, v7, OS_SIGNPOST_INTERVAL_BEGIN, a4, "EKPredicateSearch", "predicateClass=%@; predicateFormat=%@",
      (uint8_t *)&v11,
      0x16u);
  }
}

+ (void)setValidator:(Class)a3
{
  objc_opt_class();
  id obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  __CADPredicateValidator = (uint64_t)a3;
  objc_sync_exit(obj);
}

- (NSDictionary)relatedObjectPropertiesToLoad
{
  return 0;
}

- (BOOL)evaluateWithObject:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  objc_sync_enter(v5);
  if (__CADPredicateValidator) {
    char v6 = [(id)__CADPredicateValidator evaluatePredicate:self withObject:v4];
  }
  else {
    char v6 = 0;
  }
  objc_sync_exit(v5);

  return v6;
}

- (NSArray)defaultPropertiesToLoad
{
  return 0;
}

- (NSFastEnumeration)databasesToQuery
{
  return 0;
}

- (id)copyMatchingItemsWithDatabase:(CalDatabase *)a3
{
  return 0;
}

@end