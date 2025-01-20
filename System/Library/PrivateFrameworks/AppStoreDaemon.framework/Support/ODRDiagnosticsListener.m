@interface ODRDiagnosticsListener
- (id)odrEntitlementName;
- (id)odrServiceName;
- (void)configureClientWithConnection:(id)a3;
@end

@implementation ODRDiagnosticsListener

- (void)configureClientWithConnection:(id)a3
{
  id v3 = a3;
  id v4 = sub_10039CB94([ODRDiagnosticsClient alloc], v3);
}

- (id)odrEntitlementName
{
  return @"com.apple.odr.diagnostics";
}

- (id)odrServiceName
{
  return @"Diagnostics";
}

@end