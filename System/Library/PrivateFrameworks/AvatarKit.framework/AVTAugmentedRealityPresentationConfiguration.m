@interface AVTAugmentedRealityPresentationConfiguration
- (AVTAugmentedRealityPresentationConfiguration)init;
@end

@implementation AVTAugmentedRealityPresentationConfiguration

- (AVTAugmentedRealityPresentationConfiguration)init
{
  return (AVTAugmentedRealityPresentationConfiguration *)[(AVTPresentationConfiguration *)self _initWithStyle:2];
}

@end