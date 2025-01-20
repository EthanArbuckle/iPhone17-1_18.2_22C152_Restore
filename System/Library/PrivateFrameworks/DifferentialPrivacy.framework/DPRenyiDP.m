@interface DPRenyiDP
@end

@implementation DPRenyiDP

void __27___DPRenyiDP_defaultAlphas__block_invoke()
{
  id v4 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:49];
  for (uint64_t i = 2; i != 51; ++i)
  {
    v1 = [NSNumber numberWithUnsignedInteger:i];
    [v4 addObject:v1];
  }
  uint64_t v2 = [v4 copy];
  v3 = (void *)kDefaultAlphas;
  kDefaultAlphas = v2;
}

@end