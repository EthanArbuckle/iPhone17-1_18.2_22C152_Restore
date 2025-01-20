@interface INRideOption
@end

@implementation INRideOption

void __64__INRideOption_WFRideOptionsLoader__wf_isAvailableForPartySize___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  unint64_t v7 = *(void *)(a1 + 40);
  id v12 = v6;
  if (v7 >= [v6 partySizeRange])
  {
    uint64_t v9 = *(void *)(a1 + 40);
    unint64_t v10 = v9 - [v12 partySizeRange];
    [v12 partySizeRange];
    BOOL v8 = v10 <= v11;
  }
  else
  {
    BOOL v8 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v8;
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

@end