@interface NSEnumerator
- (NSArray)allObjects;
- (id)nextObject;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
@end

@implementation NSEnumerator

- (NSArray)allObjects
{
  uint64_t v14 = *(void *)off_1ECE0A5B0;
  v3 = +[NSArray array];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  unint64_t v4 = [(NSEnumerator *)self countByEnumeratingWithState:&v10 objects:v9 count:16];
  if (v4)
  {
    unint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(self);
        }
        [(NSArray *)v3 addObject:*(void *)(*((void *)&v10 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      unint64_t v5 = [(NSEnumerator *)self countByEnumeratingWithState:&v10 objects:v9 count:16];
    }
    while (v5);
  }
  return v3;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  if (a3->var0 == -1) {
    return 0;
  }
  if (!a3->var0) {
    a3->var2 = (unint64_t *)&countByEnumeratingWithState_objects_count__const_mu_5;
  }
  unint64_t result = [(NSEnumerator *)self nextObject];
  if (result)
  {
    a3->var1 = a4;
    *a4 = (id)result;
    unint64_t v8 = a3->var0 + 1;
    unint64_t result = 1;
  }
  else
  {
    unint64_t v8 = -1;
  }
  a3->var0 = v8;
  return result;
}

- (id)nextObject
{
  unint64_t v4 = __CFLookUpClass("NSEnumerator");
  __CFRequireConcreteImplementation(v4, (objc_class *)self, a2);
}

@end