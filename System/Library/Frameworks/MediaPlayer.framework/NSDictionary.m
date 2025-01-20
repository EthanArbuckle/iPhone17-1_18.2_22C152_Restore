@interface NSDictionary
@end

@implementation NSDictionary

void __46__NSDictionary_MPSOD_Additions__mp_deepMerge___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v8];
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && _NSIsNSDictionary())
  {
    v7 = objc_msgSend(v6, "mp_deepMerge:", v5);
    [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v8];
  }
  else
  {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v8];
  }
}

@end