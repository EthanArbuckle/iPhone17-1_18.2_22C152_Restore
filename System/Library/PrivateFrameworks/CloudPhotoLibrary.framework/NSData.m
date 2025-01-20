@interface NSData
@end

@implementation NSData

void __67__NSData_CPLSyncAnchorDescription__cplQueryCursorSimpleDescription__block_invoke(uint64_t a1)
{
  v2 = (void *)cplQueryCursorSimpleDescription_queryCursorDescriptions;
  if (!cplQueryCursorSimpleDescription_queryCursorDescriptions)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:100];
    v4 = (void *)cplQueryCursorSimpleDescription_queryCursorDescriptions;
    cplQueryCursorSimpleDescription_queryCursorDescriptions = v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:100];
    v6 = (void *)cplQueryCursorSimpleDescription_cachedQueryCursors;
    cplQueryCursorSimpleDescription_cachedQueryCursors = v5;

    v2 = (void *)cplQueryCursorSimpleDescription_queryCursorDescriptions;
  }
  uint64_t v7 = [v2 objectForKey:*(void *)(a1 + 32)];
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    ++cplQueryCursorSimpleDescription_syncAnchorIndex;
    if ([(id)cplQueryCursorSimpleDescription_cachedQueryCursors count] == 100)
    {
      v10 = [(id)cplQueryCursorSimpleDescription_cachedQueryCursors firstObject];
      [(id)cplQueryCursorSimpleDescription_cachedQueryCursors removeObjectAtIndex:0];
      [(id)cplQueryCursorSimpleDescription_queryCursorDescriptions removeObjectForKey:v10];
    }
    id v11 = [NSString alloc];
    uint64_t v12 = objc_msgSend(v11, "initWithFormat:", @"QueryCursor-%lu", cplQueryCursorSimpleDescription_syncAnchorIndex);
    uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
    v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    [(id)cplQueryCursorSimpleDescription_queryCursorDescriptions setObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) forKey:*(void *)(a1 + 32)];
    v15 = (void *)cplQueryCursorSimpleDescription_cachedQueryCursors;
    uint64_t v16 = *(void *)(a1 + 32);
    [v15 addObject:v16];
  }
}

void __66__NSData_CPLSyncAnchorDescription__cplSyncAnchorSimpleDescription__block_invoke(uint64_t a1)
{
  v2 = (void *)cplSyncAnchorSimpleDescription_syncAnchorDescriptions;
  if (!cplSyncAnchorSimpleDescription_syncAnchorDescriptions)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:100];
    v4 = (void *)cplSyncAnchorSimpleDescription_syncAnchorDescriptions;
    cplSyncAnchorSimpleDescription_syncAnchorDescriptions = v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:100];
    v6 = (void *)cplSyncAnchorSimpleDescription_cachedSyncAnchors;
    cplSyncAnchorSimpleDescription_cachedSyncAnchors = v5;

    v2 = (void *)cplSyncAnchorSimpleDescription_syncAnchorDescriptions;
  }
  uint64_t v7 = [v2 objectForKey:*(void *)(a1 + 32)];
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    ++cplSyncAnchorSimpleDescription_syncAnchorIndex;
    if ([(id)cplSyncAnchorSimpleDescription_cachedSyncAnchors count] == 100)
    {
      v10 = [(id)cplSyncAnchorSimpleDescription_cachedSyncAnchors firstObject];
      [(id)cplSyncAnchorSimpleDescription_cachedSyncAnchors removeObjectAtIndex:0];
      [(id)cplSyncAnchorSimpleDescription_syncAnchorDescriptions removeObjectForKey:v10];
    }
    id v11 = [NSString alloc];
    uint64_t v12 = objc_msgSend(v11, "initWithFormat:", @"SyncAnchor-%lu", cplSyncAnchorSimpleDescription_syncAnchorIndex);
    uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
    v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    [(id)cplSyncAnchorSimpleDescription_syncAnchorDescriptions setObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) forKey:*(void *)(a1 + 32)];
    v15 = (void *)cplSyncAnchorSimpleDescription_cachedSyncAnchors;
    uint64_t v16 = *(void *)(a1 + 32);
    [v15 addObject:v16];
  }
}

@end