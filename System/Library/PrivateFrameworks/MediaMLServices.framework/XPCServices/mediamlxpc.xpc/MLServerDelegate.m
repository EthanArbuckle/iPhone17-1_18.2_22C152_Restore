@interface MLServerDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC10mediamlxpc16MLServerDelegate)init;
@end

@implementation MLServerDelegate

- (_TtC10mediamlxpc16MLServerDelegate)init
{
  return (_TtC10mediamlxpc16MLServerDelegate *)MLServerDelegate.init()();
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = self;
  MLServerDelegate.listener(_:shouldAcceptNewConnection:)((NSXPCListener)a3, (NSXPCConnection)a4);

  return _convertBoolToObjCBool(_:)() & 1;
}

- (void).cxx_destruct
{
}

@end