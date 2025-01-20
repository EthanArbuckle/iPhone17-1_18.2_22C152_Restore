@interface APECDiagnosticPurposeConfig
+ (NSString)path;
- (NSNumber)purpose;
@end

@implementation APECDiagnosticPurposeConfig

+ (NSString)path
{
  return (NSString *)@"EventCollection/Purposes/101";
}

- (NSNumber)purpose
{
  return (NSNumber *)&unk_26FB5B040;
}

@end