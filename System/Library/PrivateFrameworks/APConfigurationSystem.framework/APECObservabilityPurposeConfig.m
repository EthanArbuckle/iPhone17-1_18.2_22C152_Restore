@interface APECObservabilityPurposeConfig
+ (NSString)path;
- (NSNumber)purpose;
@end

@implementation APECObservabilityPurposeConfig

+ (NSString)path
{
  return (NSString *)@"EventCollection/Purposes/8501";
}

- (NSNumber)purpose
{
  return (NSNumber *)&unk_26FB5B070;
}

@end