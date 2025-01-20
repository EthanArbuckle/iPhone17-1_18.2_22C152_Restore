@interface ODRLaunchServicesListener
- (id)odrEntitlementName;
- (id)odrServiceName;
- (void)configureClientWithConnection:(id)a3;
@end

@implementation ODRLaunchServicesListener

- (void)configureClientWithConnection:(id)a3
{
  id v3 = a3;
  id v4 = sub_1003B6A5C([ODRLaunchServicesClient alloc], v3);
}

- (id)odrEntitlementName
{
  return @"com.apple.ondemandd.LaunchServices";
}

- (id)odrServiceName
{
  return @"Launch Services";
}

@end