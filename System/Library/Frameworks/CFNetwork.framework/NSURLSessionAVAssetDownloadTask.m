@interface NSURLSessionAVAssetDownloadTask
- (NSURL)URL;
- (NSURL)destinationURL;
- (unint64_t)AVAssetDownloadToken;
@end

@implementation NSURLSessionAVAssetDownloadTask

- (unint64_t)AVAssetDownloadToken
{
  return self->_AVAssetDownloadToken;
}

- (NSURL)destinationURL
{
  return 0;
}

- (NSURL)URL
{
  return 0;
}

@end