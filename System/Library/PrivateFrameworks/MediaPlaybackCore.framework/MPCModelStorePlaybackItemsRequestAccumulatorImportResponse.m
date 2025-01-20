@interface MPCModelStorePlaybackItemsRequestAccumulatorImportResponse
- (MPCModelStorePlaybackItemsRequestAccumulatorResult)accumulatorImportResult;
- (MPServerObjectDatabaseImportResult)serverObjectDatabaseImportResult;
- (id)initWitDatabaseImportResult:(id)a3 accumulatorImportResult:(MPCModelStorePlaybackItemsRequestAccumulatorResult)a4;
@end

@implementation MPCModelStorePlaybackItemsRequestAccumulatorImportResponse

- (void).cxx_destruct
{
}

- (MPCModelStorePlaybackItemsRequestAccumulatorResult)accumulatorImportResult
{
  return (MPCModelStorePlaybackItemsRequestAccumulatorResult)(*(unsigned __int16 *)&self->_accumulatorImportResult.didFinishEntireRequest | (self->_accumulatorImportResult.hasPrioritizedItemsToLoad << 16));
}

- (MPServerObjectDatabaseImportResult)serverObjectDatabaseImportResult
{
  return self->_serverObjectDatabaseImportResult;
}

- (id)initWitDatabaseImportResult:(id)a3 accumulatorImportResult:(MPCModelStorePlaybackItemsRequestAccumulatorResult)a4
{
  int v4 = *(_DWORD *)&a4.didFinishEntireRequest;
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MPCModelStorePlaybackItemsRequestAccumulatorImportResponse;
  v7 = [(MPCModelStorePlaybackItemsRequestAccumulatorImportResponse *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    serverObjectDatabaseImportResult = v7->_serverObjectDatabaseImportResult;
    v7->_serverObjectDatabaseImportResult = (MPServerObjectDatabaseImportResult *)v8;

    v7->_accumulatorImportResult.hasPrioritizedItemsToLoad = BYTE2(v4);
    *(_WORD *)&v7->_accumulatorImportResult.didFinishEntireRequest = v4;
  }

  return v7;
}

@end