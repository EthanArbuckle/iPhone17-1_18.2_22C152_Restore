@interface SADomainObjectCancel
- (BOOL)supportsADSADOCommand;
- (id)domainFromSADObject;
- (id)expectedResponseClassName;
@end

@implementation SADomainObjectCancel

- (BOOL)supportsADSADOCommand
{
  return 1;
}

- (id)expectedResponseClassName
{
  return SADomainObjectCancelCompletedClassIdentifier;
}

- (id)domainFromSADObject
{
  v2 = [(SADomainObjectCancel *)self identifier];
  v3 = [v2 groupIdentifier];

  return v3;
}

@end