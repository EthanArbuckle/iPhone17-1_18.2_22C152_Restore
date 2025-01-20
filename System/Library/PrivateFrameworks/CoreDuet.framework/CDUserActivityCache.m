@interface CDUserActivityCache
@end

@implementation CDUserActivityCache

uint64_t __29___CDUserActivityCache_count__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 24);
  return result;
}

void __61___CDUserActivityCache_hashArrayForSourceID_bundleID_itemID___block_invoke(void *a1, void *a2)
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 computeHashesForString:a1[4] reuse:*(void *)(*(void *)(a1[7] + 8) + 40)];
  uint64_t v5 = *(void *)(a1[7] + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  uint64_t v7 = a1[5];
  v21[0] = a1[4];
  v21[1] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  v9 = [v8 componentsJoinedByString:@":"];
  uint64_t v10 = [v3 computeHashesForString:v9 reuse:*(void *)(*(void *)(a1[7] + 8) + 40)];
  uint64_t v11 = *(void *)(a1[7] + 8);
  v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  uint64_t v13 = a1[6];
  if (v13)
  {
    uint64_t v14 = a1[5];
    v20[0] = a1[4];
    v20[1] = v14;
    v20[2] = v13;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:3];
    v16 = [v15 componentsJoinedByString:@":"];
    uint64_t v17 = [v3 computeHashesForString:v16 reuse:*(void *)(*(void *)(a1[7] + 8) + 40)];
    uint64_t v18 = *(void *)(a1[7] + 8);
    v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v17;
  }
}

uint64_t __52___CDUserActivityCache_addSourceID_bundleID_itemID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 setWithHashes:*(void *)(a1 + 32)];
  ++*(_DWORD *)(*(void *)(a1 + 40) + 24);
  return result;
}

uint64_t __66___CDUserActivityCache_containsObjectForSourceID_bundleID_itemID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 getWithHashes:*(void *)(a1 + 32)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __58___CDUserActivityCache__populateAppLocationActivityStream__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v9 = [v3 source];
  uint64_t v4 = [v9 sourceID];
  uint64_t v5 = [v3 source];
  v6 = [v5 bundleID];
  uint64_t v7 = [v3 source];

  v8 = [v7 itemID];
  [v2 addSourceID:v4 bundleID:v6 itemID:v8];
}

@end