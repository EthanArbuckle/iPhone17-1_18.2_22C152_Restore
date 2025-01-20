@interface DriverApprovalState
- (BOOL)driverIsApproved;
- (BOOL)updatePending;
- (DriverApprovalState)initWithSwiftDriverApprovalState:(id)a3;
- (id)bundleIdentifier;
- (id)displayName;
- (id)usageText;
@end

@implementation DriverApprovalState

- (DriverApprovalState)initWithSwiftDriverApprovalState:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DriverApprovalState;
  v6 = [(DriverApprovalState *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_swiftDriverApprovalState, a3);
  }

  return v7;
}

- (id)displayName
{
  return [(_SwiftDriverApprovalState *)self->_swiftDriverApprovalState displayName];
}

- (id)usageText
{
  return [(_SwiftDriverApprovalState *)self->_swiftDriverApprovalState usageText];
}

- (BOOL)updatePending
{
  return [(_SwiftDriverApprovalState *)self->_swiftDriverApprovalState updatePending];
}

- (BOOL)driverIsApproved
{
  return [(_SwiftDriverApprovalState *)self->_swiftDriverApprovalState driverIsApproved];
}

- (id)bundleIdentifier
{
  return [(_SwiftDriverApprovalState *)self->_swiftDriverApprovalState bundleIdentifier];
}

- (void).cxx_destruct
{
}

@end