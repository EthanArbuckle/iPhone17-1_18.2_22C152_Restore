@interface SADomainObjectPunchOut
- (BOOL)supportsADSADOCommand;
- (id)domainFromSADObject;
- (id)expectedResponseClassName;
@end

@implementation SADomainObjectPunchOut

- (BOOL)supportsADSADOCommand
{
  return 1;
}

- (id)expectedResponseClassName
{
  return SACommandSucceededClassIdentifier;
}

- (id)domainFromSADObject
{
  v2 = [(SADomainObjectPunchOut *)self domainItem];
  v3 = [v2 groupIdentifier];

  return v3;
}

@end