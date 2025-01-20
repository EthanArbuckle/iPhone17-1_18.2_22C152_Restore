@interface HMAccessory(HFSymptomFixableObject)
- (uint64_t)accessories;
@end

@implementation HMAccessory(HFSymptomFixableObject)

- (uint64_t)accessories
{
  return [MEMORY[0x263EFFA08] setWithObject:a1];
}

@end