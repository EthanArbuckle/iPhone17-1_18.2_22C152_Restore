@interface FamilyMember
- (BOOL)isChildAccount;
- (BOOL)isGuardian;
- (BOOL)isOrganizer;
- (BOOL)isParent;
- (BOOL)isTeenAccount;
- (int64_t)type;
- (void)setIsChildAccount:(BOOL)a3;
- (void)setIsGuardian:(BOOL)a3;
- (void)setIsOrganizer:(BOOL)a3;
- (void)setIsParent:(BOOL)a3;
- (void)setIsTeenAccount:(BOOL)a3;
- (void)setType:(int64_t)a3;
@end

@implementation FamilyMember

- (BOOL)isGuardian
{
  return self->isGuardian;
}

- (void)setIsGuardian:(BOOL)a3
{
  self->isGuardian = a3;
}

- (BOOL)isOrganizer
{
  return self->isOrganizer;
}

- (void)setIsOrganizer:(BOOL)a3
{
  self->isOrganizer = a3;
}

- (BOOL)isParent
{
  return self->isParent;
}

- (void)setIsParent:(BOOL)a3
{
  self->isParent = a3;
}

- (BOOL)isChildAccount
{
  return self->isChildAccount;
}

- (void)setIsChildAccount:(BOOL)a3
{
  self->isChildAccount = a3;
}

- (BOOL)isTeenAccount
{
  return self->isTeenAccount;
}

- (void)setIsTeenAccount:(BOOL)a3
{
  self->isTeenAccount = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

@end