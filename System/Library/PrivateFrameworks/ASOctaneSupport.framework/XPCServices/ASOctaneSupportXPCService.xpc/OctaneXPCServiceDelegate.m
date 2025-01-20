@interface OctaneXPCServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC25ASOctaneSupportXPCService24OctaneXPCServiceDelegate)init;
@end

@implementation OctaneXPCServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1000805FC((uint64_t)v8, v7);

  return 1;
}

- (_TtC25ASOctaneSupportXPCService24OctaneXPCServiceDelegate)init
{
  return (_TtC25ASOctaneSupportXPCService24OctaneXPCServiceDelegate *)sub_100080724();
}

@end