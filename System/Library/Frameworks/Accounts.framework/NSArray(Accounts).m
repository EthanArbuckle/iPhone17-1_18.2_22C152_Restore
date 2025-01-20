@interface NSArray(Accounts)
- (id)ac_filter:()Accounts;
- (id)ac_firstObjectPassingTest:()Accounts;
- (id)ac_map:()Accounts;
- (id)ac_mapNullable:()Accounts;
@end

@implementation NSArray(Accounts)

- (id)ac_firstObjectPassingTest:()Accounts
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, a1, @"NSArray+Accounts.m", 35, @"Invalid parameter not satisfying: %@", @"predicate" object file lineNumber description];
  }
  uint64_t v6 = [a1 indexOfObjectPassingTest:v5];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = 0;
  }
  else
  {
    v7 = [a1 objectAtIndex:v6];
  }

  return v7;
}

- (id)ac_filter:()Accounts
{
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"NSArray+Accounts.m", 20, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __31__NSArray_Accounts__ac_filter___block_invoke;
  v12[3] = &unk_1E5BCE6C0;
  id v13 = v6;
  id v14 = v5;
  id v7 = v6;
  id v8 = v5;
  [a1 enumerateObjectsUsingBlock:v12];
  v9 = (void *)[v7 copy];

  return v9;
}

- (id)ac_map:()Accounts
{
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"NSArray+Accounts.m", 47, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __28__NSArray_Accounts__ac_map___block_invoke;
  v12[3] = &unk_1E5BCE6E8;
  id v13 = v6;
  id v14 = v5;
  id v7 = v5;
  id v8 = v6;
  [a1 enumerateObjectsUsingBlock:v12];
  v9 = (void *)[v8 copy];

  return v9;
}

- (id)ac_mapNullable:()Accounts
{
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"NSArray+Accounts.m", 59, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __36__NSArray_Accounts__ac_mapNullable___block_invoke;
  v12[3] = &unk_1E5BCE6C0;
  id v13 = v6;
  id v14 = v5;
  id v7 = v6;
  id v8 = v5;
  [a1 enumerateObjectsUsingBlock:v12];
  v9 = (void *)[v7 copy];

  return v9;
}

@end