@interface NSSet(Accounts)
- (id)ac_map:()Accounts;
- (id)ac_mapNullable:()Accounts;
@end

@implementation NSSet(Accounts)

- (id)ac_map:()Accounts
{
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"NSSet+Accounts.m", 20, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __26__NSSet_Accounts__ac_map___block_invoke;
  v12[3] = &unk_1E5BCED20;
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
    [v11 handleFailureInMethod:a2, a1, @"NSSet+Accounts.m", 32, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __34__NSSet_Accounts__ac_mapNullable___block_invoke;
  v12[3] = &unk_1E5BCED48;
  id v13 = v6;
  id v14 = v5;
  id v7 = v6;
  id v8 = v5;
  [a1 enumerateObjectsUsingBlock:v12];
  v9 = (void *)[v7 copy];

  return v9;
}

@end