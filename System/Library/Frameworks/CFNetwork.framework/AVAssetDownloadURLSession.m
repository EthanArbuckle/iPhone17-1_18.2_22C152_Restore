@interface AVAssetDownloadURLSession
+ (AVAssetDownloadURLSession)sessionWithConfiguration:(NSURLSessionConfiguration *)configuration assetDownloadDelegate:(id)delegate delegateQueue:(NSOperationQueue *)delegateQueue;
- (AVAggregateAssetDownloadTask)aggregateAssetDownloadTaskWithURLAsset:(AVURLAsset *)URLAsset mediaSelections:(NSArray *)mediaSelections assetTitle:(NSString *)title assetArtworkData:(NSData *)artworkData options:(NSDictionary *)options;
- (AVAssetDownloadTask)assetDownloadTaskWithConfiguration:(AVAssetDownloadConfiguration *)downloadConfiguration;
- (AVAssetDownloadTask)assetDownloadTaskWithURLAsset:(AVURLAsset *)URLAsset assetTitle:(NSString *)title assetArtworkData:(NSData *)artworkData options:(NSDictionary *)options;
- (AVAssetDownloadTask)assetDownloadTaskWithURLAsset:(AVURLAsset *)URLAsset destinationURL:(NSURL *)destinationURL options:(NSDictionary *)options;
@end

@implementation AVAssetDownloadURLSession

+ (AVAssetDownloadURLSession)sessionWithConfiguration:(NSURLSessionConfiguration *)configuration assetDownloadDelegate:(id)delegate delegateQueue:(NSOperationQueue *)delegateQueue
{
  if (!configuration
    || !CFEqual([(NSURLSessionConfiguration *)configuration disposition], &unk_1EC0A58A8))
  {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Can only create an AVAssetDownloadURLSession from a background configuration" userInfo:0]);
  }
  v8 = (NSURLSessionConfiguration *)(id)[(NSURLSessionConfiguration *)configuration copy];
  [(NSURLSessionConfiguration *)v8 set_supportsAVAssetDownloads:1];

  return (AVAssetDownloadURLSession *)+[NSURLSession _sessionWithConfiguration:delegate:delegateQueue:delegateDispatchQueue:]((uint64_t)NSURLSession, v8, (uint64_t)delegate, (uint64_t)delegateQueue, 0);
}

- (AVAssetDownloadTask)assetDownloadTaskWithConfiguration:(AVAssetDownloadConfiguration *)downloadConfiguration
{
  return 0;
}

- (AVAggregateAssetDownloadTask)aggregateAssetDownloadTaskWithURLAsset:(AVURLAsset *)URLAsset mediaSelections:(NSArray *)mediaSelections assetTitle:(NSString *)title assetArtworkData:(NSData *)artworkData options:(NSDictionary *)options
{
  return 0;
}

- (AVAssetDownloadTask)assetDownloadTaskWithURLAsset:(AVURLAsset *)URLAsset assetTitle:(NSString *)title assetArtworkData:(NSData *)artworkData options:(NSDictionary *)options
{
  return 0;
}

- (AVAssetDownloadTask)assetDownloadTaskWithURLAsset:(AVURLAsset *)URLAsset destinationURL:(NSURL *)destinationURL options:(NSDictionary *)options
{
  return 0;
}

@end