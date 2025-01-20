@interface NSDictionary
@end

@implementation NSDictionary

void __54__NSDictionary_BLTNSNullRemoval__objectWithNoNSNulls___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v10 = 0;
  v6 = [a3 objectWithNoNSNulls:&v10];
  id v7 = v10;
  if (!v6)
  {
    v8 = *(void **)(a1 + 40);
    id v9 = (id)MEMORY[0x263EFFA88];
    goto LABEL_5;
  }
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
  if ([v7 count])
  {
    v8 = *(void **)(a1 + 40);
    id v9 = v7;
LABEL_5:
    [v8 setObject:v9 forKeyedSubscript:v5];
  }
}

void __52__NSDictionary_BLTNSNullRemoval__objectWithNSNulls___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  v6 = [v5 objectSentinelNull];
  id v7 = *(void **)(a1 + 32);
  if (v6)
  {
    [v7 setObject:v6 forKeyedSubscript:v10];
  }
  else
  {
    v8 = [v7 objectForKeyedSubscript:v10];
    id v9 = [v8 objectWithNSNulls:v5];
    [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:v10];
  }
}

void __37__NSDictionary_BLTSizeOf__blt_sizeof__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += objc_msgSend(a2, "blt_sizeof");
  uint64_t v6 = objc_msgSend(v5, "blt_sizeof");

  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += v6;
}

@end