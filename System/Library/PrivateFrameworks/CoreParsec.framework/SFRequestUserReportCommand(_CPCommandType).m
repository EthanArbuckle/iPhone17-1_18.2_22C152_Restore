@interface SFRequestUserReportCommand(_CPCommandType)
- (uint64_t)_cpCommandType;
@end

@implementation SFRequestUserReportCommand(_CPCommandType)

- (uint64_t)_cpCommandType
{
  return 9;
}

@end