@interface APECReportsPurposeConfig
+ (NSString)path;
- (NSNumber)purpose;
@end

@implementation APECReportsPurposeConfig

+ (NSString)path
{
  return (NSString *)@"EventCollection/Purposes/103";
}

- (NSNumber)purpose
{
  return (NSNumber *)&unk_26FB5B028;
}

@end