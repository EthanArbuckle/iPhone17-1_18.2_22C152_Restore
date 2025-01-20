@interface AVTClassicPresentationConfiguration
+ (id)sharedConfiguration;
- (AVTClassicPresentationConfiguration)init;
@end

@implementation AVTClassicPresentationConfiguration

- (AVTClassicPresentationConfiguration)init
{
  +[AVTClassicPresentationConfiguration sharedConfiguration];
  return (AVTClassicPresentationConfiguration *)objc_claimAutoreleasedReturnValue();
}

+ (id)sharedConfiguration
{
  if (sharedConfiguration_onceToken != -1) {
    dispatch_once(&sharedConfiguration_onceToken, &__block_literal_global_23);
  }
  v2 = (void *)sharedConfiguration_sharedConfiguration;
  return v2;
}

uint64_t __58__AVTClassicPresentationConfiguration_sharedConfiguration__block_invoke()
{
  id v0 = [(AVTPresentationConfiguration *)[AVTClassicPresentationConfiguration alloc] _initWithStyle:0];
  uint64_t v1 = sharedConfiguration_sharedConfiguration;
  sharedConfiguration_sharedConfiguration = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

@end