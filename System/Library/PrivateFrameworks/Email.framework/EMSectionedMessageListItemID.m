@interface EMSectionedMessageListItemID
@end

@implementation EMSectionedMessageListItemID

void __56___EMSectionedMessageListItemID_EFCacheable__cachedSelf__block_invoke()
{
  cachedSelf_sTableLock_4 = 0;
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:5 capacity:0];
  v1 = (void *)cachedSelf_sUniqueObjectIDs_4;
  cachedSelf_sUniqueObjectIDs_4 = v0;
}

id __47___EMSectionedMessageListItemID_initWithCoder___block_invoke(uint64_t a1)
{
  v15.receiver = *(id *)(a1 + 32);
  v15.super_class = (Class)_EMSectionedMessageListItemID;
  id v2 = objc_msgSendSuper2(&v15, sel_init);
  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 40) decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_sectionID"];
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 8);
    *(void *)(v4 + 8) = v3;

    v6 = *(void **)(a1 + 40);
    v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v7, "setWithObjects:", v8, v9, objc_opt_class(), 0);
    uint64_t v11 = [v6 decodeObjectOfClasses:v10 forKey:@"EFPropertyKey_underlyingItemID"];
    uint64_t v12 = *(void *)(a1 + 32);
    v13 = *(void **)(v12 + 16);
    *(void *)(v12 + 16) = v11;
  }
  return v2;
}

void __49___EMSectionedMessageListItemID_encodeWithCoder___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) sectionID];
  objc_msgSend(v2, "encodeObject:forKey:");

  uint64_t v3 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) underlyingItemID];
  objc_msgSend(v3, "encodeObject:forKey:");
}

@end