@interface IDSDevice(AnnounceAdditions)
- (uint64_t)isHomePod;
@end

@implementation IDSDevice(AnnounceAdditions)

- (uint64_t)isHomePod
{
  v1 = [a1 modelIdentifier];
  uint64_t v2 = [v1 containsString:@"AudioAccessory"];

  return v2;
}

@end