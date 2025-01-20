@interface HMMediaPlaybackAction(HFAdditions)
- (uint64_t)hf_affectedCharacteristic;
@end

@implementation HMMediaPlaybackAction(HFAdditions)

- (uint64_t)hf_affectedCharacteristic
{
  return 0;
}

@end