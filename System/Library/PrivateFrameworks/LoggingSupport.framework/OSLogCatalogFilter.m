@interface OSLogCatalogFilter
@end

@implementation OSLogCatalogFilter

void __37___OSLogCatalogFilter_isKeptCatalog___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v3 = *(void **)(a1 + 32);
  v4 = [NSString stringWithUTF8String:a2];
  LODWORD(v3) = [v3 containsSubsystemSubstr:v4];

  if (v3) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

void __37___OSLogCatalogFilter_isKeptCatalog___block_invoke_3(uint64_t a1, uint64_t a2)
{
  v3 = *(void **)(a1 + 32);
  v4 = [MEMORY[0x1E4F28ED0] numberWithInt:*(unsigned int *)(a2 + 4)];
  LODWORD(v3) = [v3 containsProcessID:v4];

  if (v3) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

void __37___OSLogCatalogFilter_isKeptCatalog___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4 = *(void **)(a1 + 32);
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:a3];
  LODWORD(v4) = [v4 containsUUID:v5];

  if (v4) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

uint64_t __35___OSLogCatalogFilter_readDSCUUIDs__block_invoke(uint64_t a1, uint64_t a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __35___OSLogCatalogFilter_readDSCUUIDs__block_invoke_2;
  v3[3] = &unk_1E5A42938;
  v3[4] = *(void *)(a1 + 32);
  return _os_trace_uuiddb_dsc_foreach_uuid(a2, (uint64_t)v3);
}

uint64_t __35___OSLogCatalogFilter_readDSCUUIDs__block_invoke_2(uint64_t a1, uint64_t a2)
{
  v4 = *(void **)(a1 + 32);
  v5 = objc_msgSend(NSString, "stringWithUTF8String:");
  LODWORD(v4) = [v4 containsSenderLookupSubstr:v5];

  if (v4)
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 57) = 1;
    v6 = *(void **)(a1 + 32);
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:a2];
    [v6 addUUID:v7];
  }
  return 1;
}

@end