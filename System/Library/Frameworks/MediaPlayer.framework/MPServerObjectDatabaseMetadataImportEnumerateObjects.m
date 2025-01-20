@interface MPServerObjectDatabaseMetadataImportEnumerateObjects
@end

@implementation MPServerObjectDatabaseMetadataImportEnumerateObjects

void ___MPServerObjectDatabaseMetadataImportEnumerateObjects_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([&unk_1EE6ED6A0 containsObject:v5])
  {
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
  }
  else
  {
    [*(id *)(a1 + 40) addObject:v5];
    int v7 = *(unsigned __int8 *)(a1 + 96);
    if (*(unsigned char *)(a1 + 96)) {
      v8 = &v12;
    }
    else {
      v8 = 0;
    }
    if (*(unsigned char *)(a1 + 96)) {
      id v12 = 0;
    }
    uint64_t v9 = *(void *)(a1 + 56);
    if (!v9) {
      uint64_t v9 = *(void *)(a1 + 64);
    }
    uint64_t v10 = *(void *)(a1 + 72);
    if (!v10) {
      uint64_t v10 = *(void *)(a1 + 80);
    }
    _MPServerObjectDatabaseMetadataImportEnumerateObjects(v6, v8, *(void *)(a1 + 48), *(void *)(a1 + 40), v9, v10, 0, *(void *)(a1 + 88));
    if (v7) {
      id v11 = v12;
    }
    else {
      id v11 = 0;
    }
    [*(id *)(a1 + 40) removeLastObject];
    [*(id *)(a1 + 32) setObject:v11 forKeyedSubscript:v5];
  }
}

@end