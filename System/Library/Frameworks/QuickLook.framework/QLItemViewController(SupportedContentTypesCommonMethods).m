@interface QLItemViewController(SupportedContentTypesCommonMethods)
+ (id)supportedAudiovisualContentTypes;
@end

@implementation QLItemViewController(SupportedContentTypesCommonMethods)

+ (id)supportedAudiovisualContentTypes
{
  if (supportedAudiovisualContentTypes_onceToken != -1) {
    dispatch_once(&supportedAudiovisualContentTypes_onceToken, &__block_literal_global_13);
  }
  v0 = (void *)supportedAudiovisualContentTypes_supportedContentTypes;

  return v0;
}

@end