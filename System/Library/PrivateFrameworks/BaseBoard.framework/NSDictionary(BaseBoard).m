@interface NSDictionary(BaseBoard)
- (id)bs_dictionaryByAddingEntriesFromDictionary:()BaseBoard;
- (id)bs_filter:()BaseBoard;
- (id)bs_safeObjectForKey:()BaseBoard ofType:;
- (uint64_t)bs_BOOLForKey:()BaseBoard;
- (uint64_t)bs_safeArrayForKey:()BaseBoard;
- (uint64_t)bs_safeDictionaryForKey:()BaseBoard;
- (uint64_t)bs_safeNumberForKey:()BaseBoard;
- (uint64_t)bs_safeStringForKey:()BaseBoard;
- (uint64_t)bs_safeURLForKey:()BaseBoard;
- (void)bs_each:()BaseBoard;
@end

@implementation NSDictionary(BaseBoard)

- (id)bs_safeObjectForKey:()BaseBoard ofType:
{
  v1 = objc_msgSend(a1, "objectForKey:");
  v2 = v1;
  if (v1)
  {
    if (objc_opt_isKindOfClass()) {
      v1 = v2;
    }
    else {
      v1 = 0;
    }
  }
  id v3 = v1;

  return v3;
}

- (uint64_t)bs_safeStringForKey:()BaseBoard
{
  uint64_t v5 = objc_opt_class();
  return objc_msgSend(a1, "bs_safeObjectForKey:ofType:", a3, v5);
}

- (uint64_t)bs_safeNumberForKey:()BaseBoard
{
  uint64_t v5 = objc_opt_class();
  return objc_msgSend(a1, "bs_safeObjectForKey:ofType:", a3, v5);
}

- (id)bs_dictionaryByAddingEntriesFromDictionary:()BaseBoard
{
  if ([a3 count] || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v5 = (void *)[a1 mutableCopy];
    id v6 = v5;
    if (a3) {
      [v5 addEntriesFromDictionary:a3];
    }
  }
  else
  {
    id v6 = a1;
  }
  return v6;
}

- (uint64_t)bs_BOOLForKey:()BaseBoard
{
  v1 = objc_msgSend(a1, "objectForKey:");
  if (v1 && (objc_opt_respondsToSelector() & 1) != 0) {
    uint64_t v2 = [v1 BOOLValue];
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

- (uint64_t)bs_safeArrayForKey:()BaseBoard
{
  uint64_t v5 = objc_opt_class();
  return objc_msgSend(a1, "bs_safeObjectForKey:ofType:", a3, v5);
}

- (uint64_t)bs_safeDictionaryForKey:()BaseBoard
{
  uint64_t v5 = objc_opt_class();
  return objc_msgSend(a1, "bs_safeObjectForKey:ofType:", a3, v5);
}

- (id)bs_filter:()BaseBoard
{
  uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(a1, "count"));
  id v6 = v5;
  if (a3)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __37__NSDictionary_BaseBoard__bs_filter___block_invoke;
    v8[3] = &unk_1E5445538;
    uint64_t v10 = a3;
    id v9 = v5;
    objc_msgSend(a1, "bs_each:", v8);
  }
  else
  {
    [v5 addEntriesFromDictionary:a1];
  }
  return v6;
}

- (void)bs_each:()BaseBoard
{
  if (a3)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __35__NSDictionary_BaseBoard__bs_each___block_invoke;
    v3[3] = &unk_1E5445C40;
    v3[4] = a3;
    return (void *)[result enumerateKeysAndObjectsUsingBlock:v3];
  }
  return result;
}

- (uint64_t)bs_safeURLForKey:()BaseBoard
{
  uint64_t v5 = objc_opt_class();
  return objc_msgSend(a1, "bs_safeObjectForKey:ofType:", a3, v5);
}

@end