@interface SADomainObjectRetrieve
- (BOOL)supportsADSADOCommand;
- (id)domainFromSADObject;
- (id)expectedResponseClassName;
@end

@implementation SADomainObjectRetrieve

- (BOOL)supportsADSADOCommand
{
  return 1;
}

- (id)expectedResponseClassName
{
  return SADomainObjectRetrieveCompletedClassIdentifier;
}

- (id)domainFromSADObject
{
  v2 = [(SADomainObjectRetrieve *)self identifiers];
  v3 = [v2 lastObject];
  v4 = [v3 groupIdentifier];

  return v4;
}

@end