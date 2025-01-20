@interface RCSOutgoingMessageController
- (_TtC3RCS28RCSOutgoingMessageController)init;
- (void)messageSendFailed:(id)a3 forMessageID:(id)a4 withError:(id)a5;
- (void)messageSendSuccess:(id)a3 withID:(id)a4;
@end

@implementation RCSOutgoingMessageController

- (void)messageSendFailed:(id)a3 forMessageID:(id)a4 withError:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = self;
  RCSOutgoingMessageController.messageSendFailed(_:for:withError:)(v11, v8, v9);
}

- (void)messageSendSuccess:(id)a3 withID:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  v7 = self;
  RCSOutgoingMessageController.messageSendSuccess(_:with:)(v8, v6);
}

- (_TtC3RCS28RCSOutgoingMessageController)init
{
  result = (_TtC3RCS28RCSOutgoingMessageController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectUnownedDestroy();
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC3RCS28RCSOutgoingMessageController_client);
}

@end