@interface SFIndexedUserActivityCommand(_CPCommandType)
- (uint64_t)_cpCommandType;
@end

@implementation SFIndexedUserActivityCommand(_CPCommandType)

- (uint64_t)_cpCommandType
{
  return 12;
}

@end