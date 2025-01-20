@interface NSError(ARAdditions)
- (id)encodeToDictionary;
- (id)initWithDictionary:()ARAdditions;
@end

@implementation NSError(ARAdditions)

- (id)initWithDictionary:()ARAdditions
{
  if (a3)
  {
    id v4 = a3;
    v5 = [v4 objectForKeyedSubscript:@"userInfo"];
    v6 = (void *)[v5 mutableCopy];

    uint64_t v7 = *MEMORY[0x1E4F28A50];
    v8 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];
    uint64_t v9 = *MEMORY[0x1E4F28750];
    v10 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F28750]];
    v11 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDictionary:v8];
    [v6 setObject:v11 forKeyedSubscript:v7];

    v12 = objc_msgSend(v10, "ar_map:", &__block_literal_global_71);
    [v6 setObject:v12 forKeyedSubscript:v9];

    v13 = [v4 objectForKeyedSubscript:@"domain"];
    v14 = [v4 objectForKeyedSubscript:@"code"];

    a1 = (id)objc_msgSend(a1, "initWithDomain:code:userInfo:", v13, objc_msgSend(v14, "integerValue"), v6);
    id v15 = a1;
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (id)encodeToDictionary
{
  v2 = objc_opt_new();
  v3 = objc_opt_new();
  id v4 = [a1 userInfo];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __42__NSError_ARAdditions__encodeToDictionary__block_invoke;
  v10[3] = &unk_1E61874E8;
  id v11 = v3;
  id v5 = v3;
  [v4 enumerateKeysAndObjectsUsingBlock:v10];

  v6 = [a1 domain];
  [v2 setObject:v6 forKeyedSubscript:@"domain"];

  uint64_t v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "code"));
  [v2 setObject:v7 forKeyedSubscript:@"code"];

  v8 = (void *)[v5 copy];
  [v2 setObject:v8 forKeyedSubscript:@"userInfo"];

  return v2;
}

@end