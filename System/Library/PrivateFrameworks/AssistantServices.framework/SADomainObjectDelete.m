@interface SADomainObjectDelete
- (BOOL)supportsADSADOCommand;
- (id)domainFromSADObject;
- (id)expectedResponseClassName;
@end

@implementation SADomainObjectDelete

- (BOOL)supportsADSADOCommand
{
  return 1;
}

- (id)expectedResponseClassName
{
  return SADomainObjectDeleteCompletedClassIdentifier;
}

- (id)domainFromSADObject
{
  v2 = [(SADomainObjectDelete *)self identifier];
  v3 = [v2 groupIdentifier];

  return v3;
}

@end