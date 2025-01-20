@interface UIDiffableDataSourceApplyDeleteUpdate
@end

@implementation UIDiffableDataSourceApplyDeleteUpdate

uint64_t ___UIDiffableDataSourceApplyDeleteUpdate_block_invoke(uint64_t a1, uint64_t a2)
{
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)
    && (unint64_t)[*(id *)(a1 + 32) count] >= 0xB
    && (CVCIs__NSOrderedSetI(*(void **)(a1 + 32)) & 1) == 0)
  {
    v4 = [*(id *)(a1 + 40) identifiers];
    unint64_t v5 = [v4 count];

    if (v5 >= 0xB)
    {
      uint64_t v6 = [objc_alloc(MEMORY[0x263EFF9D8]) initWithOrderedSet:*(void *)(a1 + 32)];
      uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
      v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;
    }
  }
  v9 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (!v9) {
    v9 = *(void **)(a1 + 32);
  }
  return [v9 indexOfObject:a2];
}

void ___UIDiffableDataSourceApplyDeleteUpdate_block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) rangeForSection:a2];
  if (v5) {
    objc_msgSend(*(id *)(a1 + 40), "removeObjectsInRange:", v4, v5);
  }
  [*(id *)(a1 + 32) _deleteSection:a2];
  if (*(unsigned char *)(a1 + 56))
  {
    id v7 = [MEMORY[0x263F088C8] indexPathForItem:0x7FFFFFFFFFFFFFFFLL inSection:a2];
    _CVCUpdateItemAlloc();
    uint64_t v6 = (void *)[(id)objc_claimAutoreleasedReturnValue() initWithInitialIndexPath:v7 finalIndexPath:0 updateAction:1];
    [*(id *)(a1 + 48) addObject:v6];
  }
}

uint64_t ___UIDiffableDataSourceApplyDeleteUpdate_block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)
    && (unint64_t)[*(id *)(a1 + 32) count] >= 0xB
    && (CVCIs__NSOrderedSetI(*(void **)(a1 + 32)) & 1) == 0)
  {
    uint64_t v4 = [*(id *)(a1 + 40) identifiers];
    unint64_t v5 = [v4 count];

    if (v5 >= 0xB)
    {
      uint64_t v6 = [objc_alloc(MEMORY[0x263EFF9D8]) initWithOrderedSet:*(void *)(a1 + 32)];
      uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
      v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;
    }
  }
  v9 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (!v9) {
    v9 = *(void **)(a1 + 32);
  }
  return [v9 indexOfObject:a2];
}

@end