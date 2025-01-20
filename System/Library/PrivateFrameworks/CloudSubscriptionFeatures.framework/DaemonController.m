@interface DaemonController
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (DaemonController)init;
- (void)start;
@end

@implementation DaemonController

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  Swift::Bool v9 = DaemonController.listener(_:shouldAcceptNewConnection:)((NSXPCListener)v6, (NSXPCConnection)v7);

  return v9;
}

- (DaemonController)init
{
  id v2 = objc_msgSend(self, sel_sharedSessionWithNoUrlCache);
  id v3 = objc_msgSend(v2, sel_urlSession);

  id v4 = objc_allocWithZone((Class)type metadata accessor for DaemonController());
  v5 = (DaemonController *)DaemonController.init(session:)(v3);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v5;
}

- (void)start
{
  id v2 = self;
  sub_1A8D37C7C();
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
}

@end