@interface HomeUserSlotResults
- (MTRDoorLockClusterGetUserResponseParams)user;
- (NSArray)availableSlots;
- (void)setAvailableSlots:(id)a3;
- (void)setUser:(id)a3;
@end

@implementation HomeUserSlotResults

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availableSlots, 0);
  objc_storeStrong((id *)&self->_user, 0);
}

- (void)setAvailableSlots:(id)a3
{
}

- (NSArray)availableSlots
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setUser:(id)a3
{
}

- (MTRDoorLockClusterGetUserResponseParams)user
{
  return (MTRDoorLockClusterGetUserResponseParams *)objc_getProperty(self, a2, 8, 1);
}

@end