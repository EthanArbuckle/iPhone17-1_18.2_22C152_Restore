@interface PARHashtagImagesVisibility
+ (id)setOfActiveRestrictionUUIDs;
@end

@implementation PARHashtagImagesVisibility

+ (id)setOfActiveRestrictionUUIDs
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"com.apple.siri.parsec.HashtagImagesApp"];
}

@end