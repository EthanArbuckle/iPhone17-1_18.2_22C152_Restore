@interface NSArray(AppleAccount)
- (id)aa_arrayByRemovingObject:()AppleAccount;
- (id)aa_filter:()AppleAccount;
- (id)aa_firstObjectPassingTest:()AppleAccount;
- (id)aa_map:()AppleAccount;
- (id)aa_mapNullable:()AppleAccount;
- (uint64_t)aa_isSubsetOfArray:()AppleAccount;
@end

@implementation NSArray(AppleAccount)

- (id)aa_arrayByRemovingObject:()AppleAccount
{
  id v4 = a3;
  v5 = (void *)[a1 mutableCopy];
  [v5 removeObject:v4];

  v6 = (void *)[v5 copy];

  return v6;
}

- (id)aa_filter:()AppleAccount
{
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"NSArray+AppleAccount.m", 26, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __35__NSArray_AppleAccount__aa_filter___block_invoke;
  v12[3] = &unk_1E5A482B0;
  id v13 = v6;
  id v14 = v5;
  id v7 = v6;
  id v8 = v5;
  [a1 enumerateObjectsUsingBlock:v12];
  v9 = (void *)[v7 copy];

  return v9;
}

- (id)aa_firstObjectPassingTest:()AppleAccount
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, a1, @"NSArray+AppleAccount.m", 41, @"Invalid parameter not satisfying: %@", @"predicate" object file lineNumber description];
  }
  uint64_t v6 = [a1 indexOfObjectPassingTest:v5];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = 0;
  }
  else
  {
    id v7 = [a1 objectAtIndex:v6];
  }

  return v7;
}

- (id)aa_map:()AppleAccount
{
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"NSArray+AppleAccount.m", 53, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __32__NSArray_AppleAccount__aa_map___block_invoke;
  v12[3] = &unk_1E5A482D8;
  id v13 = v6;
  id v14 = v5;
  id v7 = v5;
  id v8 = v6;
  [a1 enumerateObjectsUsingBlock:v12];
  v9 = (void *)[v8 copy];

  return v9;
}

- (id)aa_mapNullable:()AppleAccount
{
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"NSArray+AppleAccount.m", 65, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __40__NSArray_AppleAccount__aa_mapNullable___block_invoke;
  v12[3] = &unk_1E5A482B0;
  id v13 = v6;
  id v14 = v5;
  id v7 = v6;
  id v8 = v5;
  [a1 enumerateObjectsUsingBlock:v12];
  v9 = (void *)[v7 copy];

  return v9;
}

- (uint64_t)aa_isSubsetOfArray:()AppleAccount
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = (void *)[[v4 alloc] initWithArray:a1];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v5];

  uint64_t v8 = [v6 isSubsetOfSet:v7];
  return v8;
}

@end