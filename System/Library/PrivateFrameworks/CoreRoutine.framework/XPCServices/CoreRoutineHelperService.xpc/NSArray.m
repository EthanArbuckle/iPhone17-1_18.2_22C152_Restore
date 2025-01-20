@interface NSArray
- (id)flatten;
- (id)shuffle;
@end

@implementation NSArray

- (id)flatten
{
  v3 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = [(NSArray *)self copy];
  id v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v16 + 1) + 8 * (void)v8);
        v10 = objc_opt_class();
        if (objc_msgSend(v10, "isSubclassOfClass:", objc_opt_class(), (void)v16))
        {
          v11 = [v9 flatten];
          [v3 addObjectsFromArray:v11];
LABEL_13:

          goto LABEL_14;
        }
        if (objc_opt_respondsToSelector())
        {
          v12 = [v9 allObjects];
LABEL_12:
          v11 = v12;
          v13 = [v12 flatten];
          [v3 addObjectsFromArray:v13];

          goto LABEL_13;
        }
        if (objc_opt_respondsToSelector())
        {
          v12 = [v9 allValues];
          goto LABEL_12;
        }
        [v3 addObject:v9];
LABEL_14:
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v14 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
      id v6 = v14;
    }
    while (v14);
  }

  return v3;
}

- (id)shuffle
{
  v2 = +[NSMutableArray arrayWithArray:self];
  v3 = (char *)[v2 count];
  if ((unint64_t)v3 >= 2)
  {
    do
    {
      unint64_t v4 = (unint64_t)(v3 - 1);
      [v2 exchangeObjectAtIndex:v3 - 1 withObjectAtIndex:arc4random_uniform((uint32_t)v3)];
      v3 = (char *)v4;
    }
    while (v4 > 1);
  }
  return v2;
}

@end