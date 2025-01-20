@interface AXWatchRemoteScreenServiceAXUIService
- (_TtC27AXWatchRemoteScreenServices37AXWatchRemoteScreenServiceAXUIService)init;
- (void)connectionWithServiceWasInterruptedForUserInterfaceClient:(id)a3;
@end

@implementation AXWatchRemoteScreenServiceAXUIService

- (_TtC27AXWatchRemoteScreenServices37AXWatchRemoteScreenServiceAXUIService)init
{
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC27AXWatchRemoteScreenServices37AXWatchRemoteScreenServiceAXUIService__client) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AXWatchRemoteScreenServiceAXUIService();
  return [(AXWatchRemoteScreenServiceAXUIService *)&v3 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC27AXWatchRemoteScreenServices37AXWatchRemoteScreenServiceAXUIService__client));
}

- (void)connectionWithServiceWasInterruptedForUserInterfaceClient:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_22A60130C(a3);
}

@end