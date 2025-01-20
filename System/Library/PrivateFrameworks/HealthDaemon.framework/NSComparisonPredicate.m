@interface NSComparisonPredicate
@end

@implementation NSComparisonPredicate

void __71__NSComparisonPredicate_SQLitePredicate___checkTypeForValue_inKeyPath___block_invoke()
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v1 = (void *)_MergedGlobals_211;
  _MergedGlobals_211 = (uint64_t)v0;

  v2 = +[HDDatabase allCurrentAndFutureEntityClasses];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        HDSQLiteEntityEnumerateColumns();
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

void __71__NSComparisonPredicate_SQLitePredicate___checkTypeForValue_inKeyPath___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v8 = [v2 name];
  uint64_t v3 = NSNumber;
  uint64_t v4 = [v2 keyPathType];

  uint64_t v5 = [v3 numberWithUnsignedChar:v4];
  uint64_t v6 = [(id)_MergedGlobals_211 objectForKeyedSubscript:v8];

  if (v6)
  {
    long long v7 = [(id)_MergedGlobals_211 objectForKeyedSubscript:v8];
    [v7 addObject:v5];
  }
  else
  {
    long long v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v5, 0);
    [(id)_MergedGlobals_211 setObject:v7 forKeyedSubscript:v8];
  }
}

@end