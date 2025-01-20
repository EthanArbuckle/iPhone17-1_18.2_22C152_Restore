@interface SADomainObjectUpdate
- (BOOL)supportsADSADOCommand;
- (id)domainFromSADObject;
- (id)expectedResponseClassName;
@end

@implementation SADomainObjectUpdate

- (BOOL)supportsADSADOCommand
{
  return 1;
}

- (id)expectedResponseClassName
{
  return SADomainObjectUpdateCompletedClassIdentifier;
}

- (id)domainFromSADObject
{
  v2 = [(SADomainObjectUpdate *)self identifier];
  v3 = [v2 groupIdentifier];

  return v3;
}

@end