@interface _NSXPCStorePredicateRemapper
+ (id)defaultInstance;
+ (void)initialize;
- (_NSXPCStorePredicateRemapper)init;
- (id)createPredicateForFetchFromPredicate:(id)a3;
- (void)dealloc;
- (void)visitPredicateExpression:(id)a3;
@end

@implementation _NSXPCStorePredicateRemapper

- (void)visitPredicateExpression:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = (void *)[a3 constantValue];
    if (v4)
    {
      v5 = v4;
      if (([v4 isNSArray] & 1) != 0 || objc_msgSend(v5, "isNSSet"))
      {
        if ([v5 count])
        {
          objc_opt_class();
          long long v11 = 0u;
          long long v12 = 0u;
          long long v13 = 0u;
          long long v14 = 0u;
          uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
          if (v6)
          {
            uint64_t v7 = v6;
            uint64_t v8 = *(void *)v12;
LABEL_8:
            uint64_t v9 = 0;
            while (1)
            {
              if (*(void *)v12 != v8) {
                objc_enumerationMutation(v5);
              }
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                break;
              }
              if (v7 == ++v9)
              {
                uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
                if (v7) {
                  goto LABEL_8;
                }
                goto LABEL_14;
              }
            }
          }
          else
          {
LABEL_14:
            v10 = (objc_class *)objc_opt_class();
            object_setClass(a3, v10);
          }
        }
      }
    }
  }
}

- (id)createPredicateForFetchFromPredicate:(id)a3
{
  v4 = (void *)[a3 copy];
  [v4 acceptVisitor:self flags:1];
  return v4;
}

+ (id)defaultInstance
{
  id result = (id)defaultInstance_di_91;
  if (!defaultInstance_di_91)
  {
    id result = objc_alloc_init(_NSXPCStorePredicateRemapper);
    defaultInstance_di_91 = (uint64_t)result;
  }
  return result;
}

- (_NSXPCStorePredicateRemapper)init
{
  v3.receiver = self;
  v3.super_class = (Class)_NSXPCStorePredicateRemapper;
  return [(_NSXPCStorePredicateRemapper *)&v3 init];
}

+ (void)initialize
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS____NSXPCStorePredicateRemapper;
  objc_msgSendSuper2(&v2, sel_initialize);
  objc_opt_class();
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)_NSXPCStorePredicateRemapper;
  [(_NSXPCStorePredicateRemapper *)&v2 dealloc];
}

@end