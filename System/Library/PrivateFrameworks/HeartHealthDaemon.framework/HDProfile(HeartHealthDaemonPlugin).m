@interface HDProfile(HeartHealthDaemonPlugin)
- (uint64_t)heartHealthProfileExtension;
@end

@implementation HDProfile(HeartHealthDaemonPlugin)

- (uint64_t)heartHealthProfileExtension
{
  return [a1 profileExtensionWithIdentifier:*MEMORY[0x1E4F67D70]];
}

@end