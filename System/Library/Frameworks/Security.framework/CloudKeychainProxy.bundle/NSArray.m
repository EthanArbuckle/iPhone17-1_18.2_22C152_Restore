@interface NSArray
- (id)concatenateWithSeparator:(id)a3;
@end

@implementation NSArray

- (id)concatenateWithSeparator:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableString string];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v6 = self;
  id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    v10 = &stru_100019290;
    do
    {
      v11 = 0;
      v12 = v10;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        v13 = *(void **)(*((void *)&v16 + 1) + 8 * (void)v11);
        objc_msgSend(v5, "appendString:", v12, (void)v16);
        v14 = [v13 description];
        [v5 appendString:v14];

        v10 = (__CFString *)v4;
        v11 = (char *)v11 + 1;
        v12 = v10;
      }
      while (v8 != v11);
      id v8 = [(NSArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
  else
  {
    v10 = &stru_100019290;
  }

  return v5;
}

@end