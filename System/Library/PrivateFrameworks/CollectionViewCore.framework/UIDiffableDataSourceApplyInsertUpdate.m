@interface UIDiffableDataSourceApplyInsertUpdate
@end

@implementation UIDiffableDataSourceApplyInsertUpdate

uint64_t ___UIDiffableDataSourceApplyInsertUpdate_block_invoke(uint64_t a1, uint64_t a2)
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

uint64_t ___UIDiffableDataSourceApplyInsertUpdate_block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) destinationIdentifier];
  if ([*(id *)(a1 + 32) destinationIdentifierIsSectionIdentifier]) {
    BOOL v3 = v2 == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3)
  {
    uint64_t v4 = [*(id *)(a1 + 40) indexOfObject:v2];
LABEL_8:
    uint64_t v5 = v4;
    goto LABEL_9;
  }
  if (v2)
  {
    uint64_t v4 = [*(id *)(a1 + 48) sectionForGlobalIndex:(*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))()];
    goto LABEL_8;
  }
  uint64_t v5 = [*(id *)(a1 + 40) count] - 1;
LABEL_9:
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v2) {
      goto LABEL_11;
    }
LABEL_18:
    unint64_t v8 = [*(id *)(a1 + 56) count];
    goto LABEL_19;
  }
  v9 = [MEMORY[0x263F08690] currentHandler];
  v10 = objc_msgSend(NSString, "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyInsertUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)_block_invoke_2");
  [v9 handleFailureInFunction:v10, @"_UIDiffableDataSourceUpdate.m", 298, @"Invalid parameter not satisfying: %@", @"section != NSNotFound" file lineNumber description];

  if (!v2) {
    goto LABEL_18;
  }
LABEL_11:
  if ([*(id *)(a1 + 32) destinationIdentifierIsSectionIdentifier])
  {
    uint64_t v6 = [*(id *)(a1 + 48) rangeForSection:v5];
    unint64_t v8 = v6 + v7;
  }
  else
  {
    unint64_t v8 = (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();
    if ([*(id *)(a1 + 32) relativePosition] == 1) {
      ++v8;
    }
  }
LABEL_19:
  if (v5 >= [*(id *)(a1 + 48) numberOfSections])
  {
    v18 = [MEMORY[0x263F08690] currentHandler];
    v19 = objc_msgSend(NSString, "stringWithUTF8String:", "NSArray<id<_CVCCollectionUpdateItem>> * _Nonnull _UIDiffableDataSourceApplyInsertUpdate(_UIDiffableDataSourceUpdate *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, NSMutableOrderedSet *__strong _Nonnull, _UIDataSourceSnapshotter *__strong _Nonnull, BOOL)_block_invoke_2");
    [v18 handleFailureInFunction:v19 file:@"_UIDiffableDataSourceUpdate.m" lineNumber:318 description:@"Invalid section. Did you forget to create one?"];
  }
  uint64_t v11 = [*(id *)(a1 + 56) count];
  v12 = *(void **)(a1 + 56);
  v13 = [*(id *)(a1 + 32) identifiers];
  _UIDiffableDataSourceInsertIdentifiersAtIndex(v12, v13, v8, 1);

  uint64_t v14 = *(void *)(*(void *)(a1 + 72) + 8);
  v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = 0;

  uint64_t v16 = [*(id *)(a1 + 56) count] - v11;
  [*(id *)(a1 + 48) _incrementSectionCount:v5 byCount:v16];

  return v16;
}

@end