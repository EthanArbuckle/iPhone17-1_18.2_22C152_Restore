@interface WKWebViewConfiguration(IAMShared)
+ (id)sharedMessagesConfiguration;
@end

@implementation WKWebViewConfiguration(IAMShared)

+ (id)sharedMessagesConfiguration
{
  if (sharedMessagesConfiguration_onceToken != -1) {
    dispatch_once(&sharedMessagesConfiguration_onceToken, &__block_literal_global);
  }
  v0 = (void *)sharedMessagesConfiguration_sharedConfiguration;

  return v0;
}

@end