@interface HKCBCentralManagerLoader
@end

@implementation HKCBCentralManagerLoader

void __61___HKCBCentralManagerLoader_getCentralManagerWithCompletion___block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 8) state] == 5)
  {
    v2 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v2();
  }
  else
  {
    v3 = *(void **)(a1 + 40);
    v4 = *(void **)(*(void *)(a1 + 32) + 24);
    id v6 = (id)[v3 copy];
    v5 = _Block_copy(v6);
    [v4 addObject:v5];
  }
}

@end