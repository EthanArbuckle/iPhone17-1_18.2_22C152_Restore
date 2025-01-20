@interface UTType
@end

@implementation UTType

void __55__UTType_DOCAdditions__doc_identifiersForContentTypes___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 identifier];
  [v2 addObject:v3];
}

uint64_t __39__UTType_DOCNode__doc_conformsToFolder__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFF8E0]);
  uint64_t v1 = doc_conformsToFolder__folderUTICache;
  doc_conformsToFolder__folderUTICache = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t __55__UTType_DOCAdditions__doc_contentTypesForIdentifiers___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) objectForKey:a2];
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v6 = v3;
    uint64_t v3 = [*(id *)(a1 + 40) addObject:v3];
    uint64_t v4 = v6;
  }
  return MEMORY[0x270F9A758](v3, v4);
}

@end