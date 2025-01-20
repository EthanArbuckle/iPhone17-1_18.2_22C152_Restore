@interface SFBeginMapsRoutingCommand(_CPCommandType)
- (uint64_t)_cpCommandType;
@end

@implementation SFBeginMapsRoutingCommand(_CPCommandType)

- (uint64_t)_cpCommandType
{
  return 24;
}

@end