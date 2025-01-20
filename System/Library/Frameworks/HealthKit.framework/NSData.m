@interface NSData
@end

@implementation NSData

void __46__NSData_HKUUID__hk_enumerateUUIDsUsingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = (id)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:a2];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __51__NSData_HKUUID__hk_enumerateUUIDsWithError_block___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v11 = *(id *)(v5 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__NSData_HKUUID__hk_enumerateUUIDsWithError_block___block_invoke_2;
  v7[3] = &unk_1E58BF0B0;
  uint64_t v9 = a2;
  id v8 = *(id *)(a1 + 32);
  v10 = a3;
  char v6 = HKWithAutoreleasePool(&v11, v7);
  objc_storeStrong((id *)(v5 + 40), v11);
  if ((v6 & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    *a3 = 1;
  }
}

uint64_t __51__NSData_HKUUID__hk_enumerateUUIDsWithError_block___block_invoke_2(uint64_t a1)
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:*(void *)(a1 + 40)];
  uint64_t v3 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();

  return v3;
}

@end