@interface NSPointerArray
- (unint64_t)dbg_indexOfObjectIdenticalTo:(id)a3;
- (void)dbg_removeObject:(id)a3;
@end

@implementation NSPointerArray

- (void)dbg_removeObject:(id)a3
{
  id v6 = a3;
  unint64_t v4 = -[NSPointerArray dbg_indexOfObjectIdenticalTo:](self, "dbg_indexOfObjectIdenticalTo:");
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    for (unint64_t i = v4;
          i != 0x7FFFFFFFFFFFFFFFLL;
          unint64_t i = [(NSPointerArray *)self dbg_indexOfObjectIdenticalTo:v6])
    {
      [(NSPointerArray *)self removePointerAtIndex:i];
    }
  }
}

- (unint64_t)dbg_indexOfObjectIdenticalTo:(id)a3
{
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v5 = self;
  id v6 = (char *)[(NSPointerArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      v10 = 0;
      v11 = &v7[(void)v8];
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v5);
        }
        if (*(id *)(*((void *)&v14 + 1) + 8 * (void)v10) == v4)
        {
          unint64_t v12 = (unint64_t)&v10[(void)v8];
          goto LABEL_11;
        }
        ++v10;
      }
      while (v7 != v10);
      v7 = (char *)[(NSPointerArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      v8 = v11;
      if (v7) {
        continue;
      }
      break;
    }
  }
  unint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_11:

  return v12;
}

@end