@interface EMSpecialMailboxScope
@end

@implementation EMSpecialMailboxScope

void __42___EMSpecialMailboxScope_encodeWithCoder___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v5.receiver = *(id *)(a1 + 40);
  v5.super_class = (Class)_EMSpecialMailboxScope;
  objc_msgSendSuper2(&v5, sel_encodeWithCoder_, v2);
  v3 = *(void **)(a1 + 32);
  v4 = [*(id *)(a1 + 40) identifier];
  [v3 encodeObject:v4 forKey:@"EFPropertyKey_identifier"];
}

void __49___EMSpecialMailboxScope_EFCacheable__cachedSelf__block_invoke()
{
  cachedSelf_sTableLock_52 = 0;
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:5 capacity:0];
  v1 = (void *)cachedSelf_sUniqueObjectIDs_53;
  cachedSelf_sUniqueObjectIDs_53 = v0;
}

id __40___EMSpecialMailboxScope_initWithCoder___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 32);
  v9.receiver = v2;
  v9.super_class = (Class)_EMSpecialMailboxScope;
  id v4 = objc_msgSendSuper2(&v9, sel_initWithCoder_, v3);
  if (v4)
  {
    uint64_t v5 = [*(id *)(a1 + 32) decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_identifier"];
    uint64_t v6 = *(void *)(a1 + 40);
    v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  return v4;
}

@end