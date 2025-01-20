@interface NSProgress
- (BOOL)isDownloadingOperation;
- (BOOL)isUploadingOperation;
@end

@implementation NSProgress

- (BOOL)isDownloadingOperation
{
  return sub_100341518(self, (uint64_t)a2, (void **)&NSProgressFileOperationKindDownloading);
}

- (BOOL)isUploadingOperation
{
  return sub_100341518(self, (uint64_t)a2, (void **)&NSProgressFileOperationKindUploading);
}

@end