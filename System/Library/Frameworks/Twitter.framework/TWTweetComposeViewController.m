@interface TWTweetComposeViewController
+ (BOOL)canSendTweet;
- (BOOL)addImage:(UIImage *)image;
- (BOOL)addURL:(NSURL *)url;
- (BOOL)removeAllImages;
- (BOOL)removeAllURLs;
- (BOOL)setInitialText:(NSString *)text;
- (TWTweetComposeViewController)init;
- (TWTweetComposeViewControllerCompletionHandler)completionHandler;
- (id)addDownSampledImageDataByProxyWithPreviewImage:(id)a3;
- (id)addURLWithProxyPreviewImage:(id)a3;
@end

@implementation TWTweetComposeViewController

+ (BOOL)canSendTweet
{
  return [MEMORY[0x263F17820] isAvailableForServiceType:*MEMORY[0x263F178C0]];
}

- (TWTweetComposeViewController)init
{
  v3 = [MEMORY[0x263F17820] composeViewControllerForServiceType:*MEMORY[0x263F178C0]];

  return v3;
}

- (BOOL)setInitialText:(NSString *)text
{
  return 0;
}

- (BOOL)addImage:(UIImage *)image
{
  return 0;
}

- (BOOL)addURL:(NSURL *)url
{
  return 0;
}

- (BOOL)removeAllImages
{
  return 0;
}

- (BOOL)removeAllURLs
{
  return 0;
}

- (TWTweetComposeViewControllerCompletionHandler)completionHandler
{
  return 0;
}

- (id)addURLWithProxyPreviewImage:(id)a3
{
  return 0;
}

- (id)addDownSampledImageDataByProxyWithPreviewImage:(id)a3
{
  return 0;
}

@end