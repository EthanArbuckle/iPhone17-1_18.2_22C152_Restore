@interface NSString
@end

@implementation NSString

void __63__NSString_HealthKit__hk_firstWordCapitalizedStringWithLocale___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  *(void *)(v8 + 32) = a3;
  *(void *)(v8 + 40) = a4;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  *a7 = 1;
}

@end