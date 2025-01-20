@interface QLItemViewController
@end

@implementation QLItemViewController

void __92__QLItemViewController_SupportedContentTypesCommonMethods__supportedAudiovisualContentTypes__block_invoke()
{
  v0 = (void *)MEMORY[0x263EFFA08];
  id v3 = [MEMORY[0x263EFA8D0] audiovisualTypes];
  uint64_t v1 = [v0 setWithArray:v3];
  v2 = (void *)supportedAudiovisualContentTypes_supportedContentTypes;
  supportedAudiovisualContentTypes_supportedContentTypes = v1;
}

@end