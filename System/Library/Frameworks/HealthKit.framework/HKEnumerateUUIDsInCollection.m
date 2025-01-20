@interface HKEnumerateUUIDsInCollection
@end

@implementation HKEnumerateUUIDsInCollection

uint64_t ___HKEnumerateUUIDsInCollection_block_invoke(uint64_t a1)
{
  v2 = objc_msgSend(*(id *)(a1 + 32), "hk_UUID");
  if (v2) {
    uint64_t v3 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    uint64_t v3 = 1;
  }

  return v3;
}

@end