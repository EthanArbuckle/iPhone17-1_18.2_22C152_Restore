@interface NearbySharingInteractionCoordinator
- (_TtC9AirDropUI35NearbySharingInteractionCoordinator)init;
- (void)collaborationMessageListener:(id)a3 receivedMessage:(id)a4 inChat:(id)a5 style:(unsigned __int8)a6 accountID:(id)a7;
- (void)conversationsChangedForConversationManager:(id)a3;
- (void)dealloc;
@end

@implementation NearbySharingInteractionCoordinator

- (_TtC9AirDropUI35NearbySharingInteractionCoordinator)init
{
  return (_TtC9AirDropUI35NearbySharingInteractionCoordinator *)sub_1000A5A18();
}

- (void)dealloc
{
  v2 = self;
  sub_1000A5E50();
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9AirDropUI35NearbySharingInteractionCoordinator_conversationManager));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  v3 = (char *)self
     + OBJC_IVAR____TtC9AirDropUI35NearbySharingInteractionCoordinator__airDropNearbySharingInteractionViewModelsByID;
  uint64_t v4 = sub_10000AA4C(&qword_100183F50);
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self+ OBJC_IVAR____TtC9AirDropUI35NearbySharingInteractionCoordinator__proximityHandoffNearbySharingInteractionViewModelsByID, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  v6 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC9AirDropUI35NearbySharingInteractionCoordinator____lazy_storage___collaborationMessageListener);
}

- (void)collaborationMessageListener:(id)a3 receivedMessage:(id)a4 inChat:(id)a5 style:(unsigned __int8)a6 accountID:(id)a7
{
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  sub_1000BC56C(v10);
}

- (void)conversationsChangedForConversationManager:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = [v4 activeConversations];
  sub_10001FB40(0, (unint64_t *)&unk_1001859D0);
  sub_1000B5220((unint64_t *)&unk_100183CD0, (unint64_t *)&unk_1001859D0);
  uint64_t v7 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

  v8 = v5;
  sub_1000BA830(v7);
  unint64_t v10 = v9;

  sub_1000B3D90(v10);

  swift_bridgeObjectRelease();
}

@end