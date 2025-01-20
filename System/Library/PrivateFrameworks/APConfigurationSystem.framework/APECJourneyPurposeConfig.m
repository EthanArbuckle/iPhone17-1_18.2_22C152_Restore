@interface APECJourneyPurposeConfig
+ (NSString)path;
- (NSNumber)purpose;
@end

@implementation APECJourneyPurposeConfig

+ (NSString)path
{
  return (NSString *)@"EventCollection/Purposes/100";
}

- (NSNumber)purpose
{
  return (NSNumber *)&unk_26FB5B058;
}

@end