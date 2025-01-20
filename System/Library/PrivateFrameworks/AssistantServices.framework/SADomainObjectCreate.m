@interface SADomainObjectCreate
- (BOOL)supportsADSADOCommand;
- (id)domainFromSADObject;
- (id)expectedResponseClassName;
@end

@implementation SADomainObjectCreate

- (BOOL)supportsADSADOCommand
{
  return 1;
}

- (id)expectedResponseClassName
{
  return SADomainObjectCreateCompletedClassIdentifier;
}

- (id)domainFromSADObject
{
  v2 = [(SADomainObjectCreate *)self object];
  v3 = [v2 groupIdentifier];

  return v3;
}

@end