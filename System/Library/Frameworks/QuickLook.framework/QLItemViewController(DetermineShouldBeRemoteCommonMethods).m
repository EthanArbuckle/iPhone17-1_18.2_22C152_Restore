@interface QLItemViewController(DetermineShouldBeRemoteCommonMethods)
+ (uint64_t)shouldBeRemoteForMediaContentType:()DetermineShouldBeRemoteCommonMethods;
@end

@implementation QLItemViewController(DetermineShouldBeRemoteCommonMethods)

+ (uint64_t)shouldBeRemoteForMediaContentType:()DetermineShouldBeRemoteCommonMethods
{
  id v3 = a3;
  if ([MEMORY[0x263F086E0] mainBundleSupportsBackgroundAudio]
    && ([v3 isEqualToString:@"public.3gpp"] & 1) == 0)
  {
    uint64_t v4 = [v3 isEqualToString:@"org.3gpp.adaptive-multi-rate-audio"];
  }
  else
  {
    uint64_t v4 = 1;
  }

  return v4;
}

@end