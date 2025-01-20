@interface NSMapTable(BaseBoard)
- (id)bs_filter:()BaseBoard;
- (id)bs_safeObjectForKey:()BaseBoard ofType:;
- (id)bs_takeObjectForKey:()BaseBoard;
- (void)bs_each:()BaseBoard;
- (void)bs_setSafeObject:()BaseBoard forKey:;
@end

@implementation NSMapTable(BaseBoard)

- (void)bs_each:()BaseBoard
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v4 = a1;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v4);
          }
          uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * i);
          v9 = objc_msgSend(v4, "objectForKey:", v8, (void)v10);
          (*(void (**)(uint64_t, uint64_t, void *))(a3 + 16))(a3, v8, v9);
        }
        uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v5);
    }
  }
}

- (id)bs_safeObjectForKey:()BaseBoard ofType:
{
  v1 = objc_msgSend(a1, "objectForKey:");
  if (v1 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (id)bs_filter:()BaseBoard
{
  uint64_t v5 = (void *)[a1 copy];
  uint64_t v6 = v5;
  if (a3)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __35__NSMapTable_BaseBoard__bs_filter___block_invoke;
    v8[3] = &unk_1E5445538;
    uint64_t v10 = a3;
    id v9 = v5;
    objc_msgSend(a1, "bs_each:", v8);
  }
  return v6;
}

- (void)bs_setSafeObject:()BaseBoard forKey:
{
  if (a3)
  {
    if (a4) {
      return objc_msgSend(a1, "setObject:forKey:");
    }
  }
  return a1;
}

- (id)bs_takeObjectForKey:()BaseBoard
{
  uint64_t v5 = objc_msgSend(a1, "objectForKey:");
  if (v5)
  {
    [a1 removeObjectForKey:a3];
    id v6 = v5;
  }

  return v5;
}

@end