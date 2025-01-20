@interface HMMTRCredentialUserTuple
- (MTRDoorLockClusterGetCredentialStatusResponseParams)credential;
- (MTRDoorLockClusterGetUserResponseParams)user;
- (NSNumber)currentFabricIndex;
- (void)setCredential:(id)a3;
- (void)setCurrentFabricIndex:(id)a3;
- (void)setUser:(id)a3;
@end

@implementation HMMTRCredentialUserTuple

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentFabricIndex, 0);
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_credential, 0);
}

- (void)setCurrentFabricIndex:(id)a3
{
}

- (NSNumber)currentFabricIndex
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUser:(id)a3
{
}

- (MTRDoorLockClusterGetUserResponseParams)user
{
  return (MTRDoorLockClusterGetUserResponseParams *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCredential:(id)a3
{
}

- (MTRDoorLockClusterGetCredentialStatusResponseParams)credential
{
  return (MTRDoorLockClusterGetCredentialStatusResponseParams *)objc_getProperty(self, a2, 8, 1);
}

@end