@interface HDOntologyDownloadTask
@end

@implementation HDOntologyDownloadTask

id __63___HDOntologyDownloadTask_downloadShardsForEntries_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[_HDOntologyShardDownloadTask alloc] initForEntry:v3 downloader:*(void *)(*(void *)(a1 + 32) + 8) session:*(void *)(*(void *)(a1 + 32) + 16) group:*(void *)(a1 + 40)];

  [v4 resume];

  return v4;
}

void __63___HDOntologyDownloadTask_downloadShardsForEntries_completion___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _taskError];
  (*(void (**)(void, BOOL))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v2 == 0);
}

BOOL __37___HDOntologyDownloadTask__taskError__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 error];
  BOOL v3 = v2 != 0;

  return v3;
}

@end