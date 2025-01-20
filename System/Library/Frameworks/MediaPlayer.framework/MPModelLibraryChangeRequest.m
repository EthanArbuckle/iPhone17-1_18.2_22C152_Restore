@interface MPModelLibraryChangeRequest
+ (NSOperationQueue)sharedOperationQueue;
@end

@implementation MPModelLibraryChangeRequest

+ (NSOperationQueue)sharedOperationQueue
{
  if (sharedOperationQueue_onceToken != -1) {
    dispatch_once(&sharedOperationQueue_onceToken, &__block_literal_global_10206);
  }
  v2 = (void *)sharedOperationQueue___sharedQueue;

  return (NSOperationQueue *)v2;
}

uint64_t __51__MPModelLibraryChangeRequest_sharedOperationQueue__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  v1 = (void *)sharedOperationQueue___sharedQueue;
  sharedOperationQueue___sharedQueue = (uint64_t)v0;

  [(id)sharedOperationQueue___sharedQueue setMaxConcurrentOperationCount:10];
  [(id)sharedOperationQueue___sharedQueue setName:@"com.apple.MediaPlayer.MPModelLibraryChangeRequest.sharedOperationQueue"];
  v2 = (void *)sharedOperationQueue___sharedQueue;

  return [v2 setQualityOfService:25];
}

@end