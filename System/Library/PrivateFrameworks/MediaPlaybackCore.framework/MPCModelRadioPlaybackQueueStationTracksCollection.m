@interface MPCModelRadioPlaybackQueueStationTracksCollection
@end

@implementation MPCModelRadioPlaybackQueueStationTracksCollection

uint64_t __73___MPCModelRadioPlaybackQueueStationTracksCollection_removeExplicitItems__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a2;
  [v5 appendSection:v6];
  [*(id *)(a1 + 40) appendSection:v6];

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  long long v8 = *(_OWORD *)(a1 + 32);
  long long v7 = *(_OWORD *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 48);
  v12[2] = __73___MPCModelRadioPlaybackQueueStationTracksCollection_removeExplicitItems__block_invoke_2;
  v12[3] = &unk_2643C5748;
  v10 = *(void **)(v9 + 48);
  uint64_t v15 = *(void *)(a1 + 64);
  uint64_t v16 = a3;
  long long v13 = v7;
  long long v14 = v8;
  return [v10 enumerateItemsInSectionAtIndex:a3 usingBlock:v12];
}

void __73___MPCModelRadioPlaybackQueueStationTracksCollection_removeExplicitItems__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  if ([*(id *)(a1 + 32) isExplicitItemAtIndex:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)])
  {
    [*(id *)(a1 + 40) addIndex:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
  }
  else
  {
    v5 = [MEMORY[0x263F088C8] indexPathForItem:a3 inSection:*(void *)(a1 + 72)];
    [*(id *)(a1 + 48) appendItem:v8];
    id v6 = *(void **)(a1 + 56);
    long long v7 = [*(id *)(*(void *)(a1 + 32) + 56) itemAtIndexPath:v5];
    [v6 appendItem:v7];
  }
  ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
}

uint64_t __76___MPCModelRadioPlaybackQueueStationTracksCollection_isExplicitItemAtIndex___block_invoke(uint64_t result, uint64_t a2, void *a3, unsigned char *a4)
{
  if (*(void *)(result + 32) == a2)
  {
    uint64_t v5 = result;
    result = [a3 item];
    *(void *)(*(void *)(*(void *)(v5 + 40) + 8) + 24) = result;
    *a4 = 1;
  }
  return result;
}

uint64_t __68___MPCModelRadioPlaybackQueueStationTracksCollection_AVItemAtIndex___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  if (!v2)
  {
    uint64_t v3 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = v3;

    v2 = *(void **)(*(void *)(a1 + 32) + 16);
  }
  uint64_t v6 = *(void *)(a1 + 40);

  return [v2 addObject:v6];
}

void __85___MPCModelRadioPlaybackQueueStationTracksCollection_updateWithPersonalizedResponse___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

@end