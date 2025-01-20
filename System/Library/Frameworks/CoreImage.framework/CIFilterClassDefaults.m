@interface CIFilterClassDefaults
+ (id)cache;
+ (id)classDefaultsForClass:(Class)a3;
+ (void)clearCache;
@end

@implementation CIFilterClassDefaults

+ (id)classDefaultsForClass:(Class)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v4 = (void *)[a1 cache];
  v5 = (objc_class *)objc_opt_class();
  if (![(objc_class *)a3 isSubclassOfClass:v5]) {
    return 0;
  }
  if (v5 == a3) {
    return (id)MEMORY[0x1E4F1CC08];
  }
  v6 = (void *)[v4 objectForKey:a3];
  if (!v6)
  {
    v20 = v4;
    CustomAttributes = (void *)getCustomAttributes(a3);
    Class v21 = a3;
    v8 = objc_msgSend(+[CIFilterClassInfo classInfoForClass:](CIFilterClassInfo, "classInfoForClass:", a3), "inputKeys");
    v6 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(NSString **)(*((void *)&v22 + 1) + 8 * i);
          v14 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
          uint64_t StdAttrsForKey = getStdAttrsForKey(v13);
          if (StdAttrsForKey) {
            [v14 addEntriesFromDictionary:StdAttrsForKey];
          }
          uint64_t v16 = [CustomAttributes valueForKey:v13];
          if (v16)
          {
            uint64_t v17 = v16;
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [v14 addEntriesFromDictionary:v17];
            }
          }
          uint64_t v18 = [v14 objectForKey:@"CIAttributeDefault"];
          if (!v18)
          {
            uint64_t v18 = [v14 objectForKey:@"CIAttributeIdentity"];
            if (!v18) {
              continue;
            }
          }
          [v6 setObject:v18 forKey:v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v10);
    }
    [v20 setObject:v6 forKey:v21];
  }
  return v6;
}

+ (id)cache
{
  if (+[CIFilterClassDefaults cache]::onceToken != -1) {
    dispatch_once(&+[CIFilterClassDefaults cache]::onceToken, &__block_literal_global_1023);
  }
  return (id)+[CIFilterClassDefaults cache]::cache;
}

uint64_t __30__CIFilterClassDefaults_cache__block_invoke()
{
  +[CIFilterClassDefaults cache]::cache = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1C998]);
  [(id)+[CIFilterClassDefaults cache]::cache setName:@"com.apple.coreimage.nscache.CIFilterClassDefaults"];
  [(id)+[CIFilterClassDefaults cache]::cache setCountLimit:256];
  v0 = (void *)+[CIFilterClassDefaults cache]::cache;

  return [v0 setEvictsObjectsWhenApplicationEntersBackground:1];
}

+ (void)clearCache
{
  v2 = (void *)[a1 cache];

  [v2 removeAllObjects];
}

@end