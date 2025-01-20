@interface SFOpenFileProviderItemCommand(_CPCommandType)
- (uint64_t)_cpCommandType;
@end

@implementation SFOpenFileProviderItemCommand(_CPCommandType)

- (uint64_t)_cpCommandType
{
  return 5;
}

@end