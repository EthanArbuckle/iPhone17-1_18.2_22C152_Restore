@interface MPModelLibraryDownloadQueueDataSource
@end

@implementation MPModelLibraryDownloadQueueDataSource

void __72___MPModelLibraryDownloadQueueDataSource_identifiersForItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(*(void *)(a1 + 32) + 24) mediaLibrary];
  v5 = [v4 uniqueIdentifier];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __72___MPModelLibraryDownloadQueueDataSource_identifiersForItemAtIndexPath___block_invoke_2;
  v6[3] = &__block_descriptor_40_e44_v16__0___MPMutableLocalLibraryIdentifiers__8l;
  v6[4] = *(void *)(a1 + 40);
  [v3 setLibraryIdentifiersWithDatabaseID:v5 block:v6];
}

uint64_t __72___MPModelLibraryDownloadQueueDataSource_identifiersForItemAtIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setPersistentID:*(void *)(a1 + 32)];
}

@end