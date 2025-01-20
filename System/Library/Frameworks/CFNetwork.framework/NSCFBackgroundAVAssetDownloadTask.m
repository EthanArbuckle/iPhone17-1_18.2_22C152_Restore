@interface NSCFBackgroundAVAssetDownloadTask
@end

@implementation NSCFBackgroundAVAssetDownloadTask

uint64_t __47____NSCFBackgroundAVAssetDownloadTask_progress__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

uint64_t __47____NSCFBackgroundAVAssetDownloadTask_progress__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) suspend];
}

uint64_t __47____NSCFBackgroundAVAssetDownloadTask_progress__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) resume];
}

@end