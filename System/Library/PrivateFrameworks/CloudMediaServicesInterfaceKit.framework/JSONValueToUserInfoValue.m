@interface JSONValueToUserInfoValue
@end

@implementation JSONValueToUserInfoValue

void ___JSONValueToUserInfoValue_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v4 = *(void **)(a1 + 32);
  id v5 = a2;
  _JSONValueToUserInfoValue(a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setValue:v6 forKey:v5];
}

@end