@interface OSLogEnumeratorCatalogSubchunk
@end

@implementation OSLogEnumeratorCatalogSubchunk

uint64_t __61___OSLogEnumeratorCatalogSubchunk_enumerateChunksUsingBlock___block_invoke(uint64_t a1, _DWORD *a2, uint64_t a3, uint64_t a4)
{
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61___OSLogEnumeratorCatalogSubchunk_enumerateChunksUsingBlock___block_invoke_2;
  v10[3] = &unk_1E5A42250;
  v7 = *(void **)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  uint64_t v12 = a3;
  uint64_t v13 = a4;
  uint64_t v8 = enumerateAndDecompressSubchunk(v7, a2, (uint64_t)a2, v10);

  return v8;
}

uint64_t __61___OSLogEnumeratorCatalogSubchunk_enumerateChunksUsingBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, uint64_t, void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2, *(void *)(a1 + 40), a3);
}

@end