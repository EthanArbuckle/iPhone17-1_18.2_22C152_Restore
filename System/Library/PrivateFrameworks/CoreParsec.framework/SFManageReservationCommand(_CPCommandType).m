@interface SFManageReservationCommand(_CPCommandType)
- (uint64_t)_cpCommandType;
@end

@implementation SFManageReservationCommand(_CPCommandType)

- (uint64_t)_cpCommandType
{
  return 47;
}

@end