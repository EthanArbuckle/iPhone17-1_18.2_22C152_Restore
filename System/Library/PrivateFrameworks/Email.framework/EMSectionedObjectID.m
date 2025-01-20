@interface EMSectionedObjectID
@end

@implementation EMSectionedObjectID

void __47___EMSectionedObjectID_EFCacheable__cachedSelf__block_invoke()
{
  cachedSelf_sTableLock_42 = 0;
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:5 capacity:0];
  v1 = (void *)cachedSelf_sUniqueObjectIDs_43;
  cachedSelf_sUniqueObjectIDs_43 = v0;
}

id __38___EMSectionedObjectID_initWithCoder___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 32);
  v17.receiver = v2;
  v17.super_class = (Class)_EMSectionedObjectID;
  id v4 = objc_msgSendSuper2(&v17, sel_initWithCoder_, v3);
  if (v4)
  {
    uint64_t v5 = [*(id *)(a1 + 32) decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_sectionID"];
    uint64_t v6 = *(void *)(a1 + 40);
    v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    v8 = *(void **)(a1 + 32);
    v9 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v9, "setWithObjects:", v10, v11, objc_opt_class(), 0);
    uint64_t v13 = [v8 decodeObjectOfClasses:v12 forKey:@"EFPropertyKey_underlyingObjectID"];
    uint64_t v14 = *(void *)(a1 + 40);
    v15 = *(void **)(v14 + 48);
    *(void *)(v14 + 48) = v13;
  }
  return v4;
}

void __40___EMSectionedObjectID_encodeWithCoder___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) sectionID];
  objc_msgSend(v2, "encodeObject:forKey:");

  uint64_t v3 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) underlyingObjectID];
  objc_msgSend(v3, "encodeObject:forKey:");
}

@end