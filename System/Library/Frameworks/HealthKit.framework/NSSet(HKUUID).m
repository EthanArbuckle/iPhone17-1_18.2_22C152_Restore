@interface NSSet(HKUUID)
- (id)hk_dataForAllUUIDs;
- (uint64_t)hk_enumerateUUIDsWithError:()HKUUID block:;
@end

@implementation NSSet(HKUUID)

- (uint64_t)hk_enumerateUUIDsWithError:()HKUUID block:
{
  return _HKEnumerateUUIDsInCollection(a1, a3, a4);
}

- (id)hk_dataForAllUUIDs
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__NSSet_HKUUID__hk_dataForAllUUIDs__block_invoke;
  v5[3] = &unk_1E58BF100;
  id v3 = v2;
  id v6 = v3;
  objc_msgSend(a1, "hk_enumerateUUIDsWithError:block:", 0, v5);

  return v3;
}

@end