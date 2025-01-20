@interface CLSPerson(CRKReverseConformance)
- (BOOL)isAccountATOLocked;
- (BOOL)isAccountFailedPasswordLocked;
@end

@implementation CLSPerson(CRKReverseConformance)

- (BOOL)isAccountFailedPasswordLocked
{
  return [a1 axmAccountStatus] == 4;
}

- (BOOL)isAccountATOLocked
{
  return [a1 axmAccountStatus] == 3;
}

@end