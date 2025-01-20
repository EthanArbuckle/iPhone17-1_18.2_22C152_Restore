@interface PARNewsVisibility
+ (id)setOfActiveRestrictionUUIDs;
@end

@implementation PARNewsVisibility

+ (id)setOfActiveRestrictionUUIDs
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"com.apple.siri.parsec.news"];
}

@end