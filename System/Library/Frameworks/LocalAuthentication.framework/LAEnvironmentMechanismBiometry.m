@interface LAEnvironmentMechanismBiometry
- (BOOL)builtInSensorInaccessible;
- (BOOL)isEnrolled;
- (BOOL)isLockedOut;
- (LAEnvironmentMechanismBiometry)initWithCoreMechanism:(id)a3;
- (NSData)stateHash;
- (id)unsaltedStateHash;
- (int64_t)approvalState;
- (int64_t)biometryType;
- (void)setApprovalState:(int64_t)a3;
@end

@implementation LAEnvironmentMechanismBiometry

- (LAEnvironmentMechanismBiometry)initWithCoreMechanism:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)LAEnvironmentMechanismBiometry;
  return [(LAEnvironmentMechanism *)&v4 initWithCoreMechanism:a3];
}

- (int64_t)biometryType
{
  v2 = [(LAEnvironmentMechanism *)self coreMechanism];
  int64_t v3 = [v2 biometryType];

  return v3;
}

- (BOOL)isEnrolled
{
  v2 = [(LAEnvironmentMechanism *)self coreMechanism];
  char v3 = [v2 enrolled];

  return v3;
}

- (BOOL)isLockedOut
{
  v2 = [(LAEnvironmentMechanism *)self coreMechanism];
  char v3 = [v2 lockedOut];

  return v3;
}

- (NSData)stateHash
{
  v2 = (void *)MEMORY[0x1E4F72F50];
  char v3 = [(LAEnvironmentMechanismBiometry *)self unsaltedStateHash];
  objc_super v4 = [MEMORY[0x1E4F28B50] mainBundle];
  v5 = [v4 bundleIdentifier];
  v6 = [v2 saltHash:v3 withBundleID:v5];

  return (NSData *)v6;
}

- (id)unsaltedStateHash
{
  v2 = [(LAEnvironmentMechanism *)self coreMechanism];
  char v3 = [v2 stateHash];

  return v3;
}

- (BOOL)builtInSensorInaccessible
{
  v2 = [(LAEnvironmentMechanism *)self coreMechanism];
  char v3 = [v2 sensorInaccessible];

  return v3;
}

- (int64_t)approvalState
{
  v2 = [(LAEnvironmentMechanism *)self coreMechanism];
  int64_t v3 = [v2 approvalState];

  return v3;
}

- (void)setApprovalState:(int64_t)a3
{
  self->_approvalState = a3;
}

@end