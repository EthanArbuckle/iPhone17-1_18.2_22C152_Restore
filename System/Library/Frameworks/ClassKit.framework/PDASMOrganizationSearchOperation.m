@interface PDASMOrganizationSearchOperation
+ (id)defaultEndpointInfo;
- (BOOL)requiresValidUser;
- (id)endpointIdentifier;
@end

@implementation PDASMOrganizationSearchOperation

+ (id)defaultEndpointInfo
{
  v2 = objc_alloc_init(PDEndpointInfo);
  sub_10007C770((uint64_t)v2, @"apple_school_manager");
  sub_1000435F8((uint64_t)v2, @"ee.managedOrgDiscovery");
  sub_100043608((uint64_t)v2, @"https://ws.school.apple.com/maid/v1/organization/search");
  if (v2)
  {
    *(_WORD *)&v2->_requiresAuth = 256;
    v2->_payloadLimitBytes = 0;
    v2->_responseTTLSeconds = 0;
    v2->_payloadLimitItems = 0;
  }
  v5 = v2;
  v3 = +[NSArray arrayWithObjects:&v5 count:1];

  return v3;
}

- (id)endpointIdentifier
{
  return @"ee.managedOrgDiscovery";
}

- (BOOL)requiresValidUser
{
  return 0;
}

@end