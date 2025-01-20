@interface NSDictionary(Accounts)
- (id)ac_mapValues:()Accounts;
- (id)ac_mapValuesNullable:()Accounts;
@end

@implementation NSDictionary(Accounts)

- (id)ac_mapValues:()Accounts
{
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"NSDictionary+Accounts.m", 21, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __39__NSDictionary_Accounts__ac_mapValues___block_invoke;
  v12[3] = &unk_1E5BCE710;
  id v13 = v6;
  id v14 = v5;
  id v7 = v5;
  id v8 = v6;
  [a1 enumerateKeysAndObjectsUsingBlock:v12];
  v9 = (void *)[v8 copy];

  return v9;
}

- (id)ac_mapValuesNullable:()Accounts
{
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"NSDictionary+Accounts.m", 33, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __47__NSDictionary_Accounts__ac_mapValuesNullable___block_invoke;
  v12[3] = &unk_1E5BCE738;
  id v13 = v6;
  id v14 = v5;
  id v7 = v6;
  id v8 = v5;
  [a1 enumerateKeysAndObjectsUsingBlock:v12];
  v9 = (void *)[v7 copy];

  return v9;
}

@end