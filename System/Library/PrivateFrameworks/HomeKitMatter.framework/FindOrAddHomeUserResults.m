@interface FindOrAddHomeUserResults
- (MTRDoorLockClusterGetUserResponseParams)existingUser;
- (int64_t)newUserSlot;
- (void)setExistingUser:(id)a3;
- (void)setNewUserSlot:(int64_t)a3;
@end

@implementation FindOrAddHomeUserResults

- (void).cxx_destruct
{
}

- (void)setNewUserSlot:(int64_t)a3
{
  self->_newUserSlot = a3;
}

- (int64_t)newUserSlot
{
  return self->_newUserSlot;
}

- (void)setExistingUser:(id)a3
{
}

- (MTRDoorLockClusterGetUserResponseParams)existingUser
{
  return (MTRDoorLockClusterGetUserResponseParams *)objc_getProperty(self, a2, 8, 1);
}

@end