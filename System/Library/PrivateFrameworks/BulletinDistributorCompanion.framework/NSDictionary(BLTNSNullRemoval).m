@interface NSDictionary(BLTNSNullRemoval)
- (id)objectWithNSNulls:()BLTNSNullRemoval;
- (id)objectWithNoNSNulls:()BLTNSNullRemoval;
- (uint64_t)objectSentinelNull;
@end

@implementation NSDictionary(BLTNSNullRemoval)

- (id)objectWithNoNSNulls:()BLTNSNullRemoval
{
  if (a3)
  {
    id v5 = [MEMORY[0x263EFF9A0] dictionary];
    *a3 = v5;
  }
  else
  {
    id v5 = 0;
  }
  v6 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  v15 = __54__NSDictionary_BLTNSNullRemoval__objectWithNoNSNulls___block_invoke;
  v16 = &unk_2646858D0;
  id v7 = v6;
  id v17 = v7;
  id v8 = v5;
  id v18 = v8;
  [a1 enumerateKeysAndObjectsUsingBlock:&v13];
  uint64_t v9 = objc_msgSend(v8, "count", v13, v14, v15, v16);
  if (a3 && !v9) {
    *a3 = 0;
  }
  v10 = v18;
  id v11 = v7;

  return v11;
}

- (id)objectWithNSNulls:()BLTNSNullRemoval
{
  id v4 = a3;
  id v5 = a1;
  if ([v4 count])
  {
    id v6 = (id)[v5 mutableCopy];

    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __52__NSDictionary_BLTNSNullRemoval__objectWithNSNulls___block_invoke;
    v8[3] = &unk_2646845E0;
    id v9 = v6;
    id v5 = v6;
    [v4 enumerateKeysAndObjectsUsingBlock:v8];
  }
  return v5;
}

- (uint64_t)objectSentinelNull
{
  return 0;
}

@end