@interface IMDIncomingClientConnectionListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (IMDIncomingClientConnectionListener)init;
@end

@implementation IMDIncomingClientConnectionListener

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  swift_retain();
  char v7 = sub_1D96811B0(v6);

  swift_release();
  return v7 & 1;
}

- (IMDIncomingClientConnectionListener)init
{
  swift_defaultActor_initialize();
  result = (IMDIncomingClientConnectionListener *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end