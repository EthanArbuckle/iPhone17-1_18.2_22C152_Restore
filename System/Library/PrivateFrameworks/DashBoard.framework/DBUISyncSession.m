@interface DBUISyncSession
- (BOOL)metadataTransfer:(id)a3 error:(id *)a4;
- (BOOL)sendGiveFocusWithTokenID:(int64_t)a3 error:(id *)a4;
- (BOOL)sendLayoutChangeData:(id)a3 error:(id *)a4;
- (BOOL)sendLayoutChangeEnd:(id)a3 error:(id *)a4;
- (BOOL)sendPaletteChange:(id)a3 error:(id *)a4;
- (BOOL)sendTransitionEnd:(id)a3 error:(id *)a4;
- (BOOL)sendTransitionStart:(id)a3 description:(id)a4 error:(id *)a5;
- (_TtC9DashBoard15DBUISyncSession)init;
- (_TtC9DashBoard15DBUISyncSession)initWithChannel:(id)a3 vehicleID:(id)a4 displayID:(id)a5;
- (_TtP9DashBoard24DBUISyncSessionObserving_)observer;
- (void)clusterController:(id)a3 didReceivePayload:(id)a4;
- (void)dealloc;
- (void)didClose:(id)a3;
- (void)didOpen:(id)a3;
- (void)setObserver:(id)a3;
@end

@implementation DBUISyncSession

- (BOOL)metadataTransfer:(id)a3 error:(id *)a4
{
  return sub_22D80B6E0(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t))DBUISyncSession.metadataTransfer(_:));
}

- (BOOL)sendTransitionStart:(id)a3 description:(id)a4 error:(id *)a5
{
  uint64_t v8 = sub_22D85E458();
  if (a4)
  {
    a4 = (id)sub_22D85E4C8();
    v10 = v9;
  }
  else
  {
    v10 = 0;
  }
  v11 = self;
  v12.value._countAndFlagsBits = (uint64_t)a4;
  v12.value._object = v10;
  DBUISyncSession.sendTransitionStart(_:description:)((Swift::OpaquePointer)v8, v12);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  if (v13)
  {
    if (a5)
    {
      v14 = (void *)sub_22D85CC18();

      id v15 = v14;
      *a5 = v14;
    }
    else
    {
    }
  }
  return v13 == 0;
}

- (BOOL)sendTransitionEnd:(id)a3 error:(id *)a4
{
  return sub_22D80B6E0(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t))DBUISyncSession.sendTransitionEnd(_:));
}

- (BOOL)sendLayoutChangeData:(id)a3 error:(id *)a4
{
  return sub_22D80B6E0(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t))DBUISyncSession.sendLayoutChangeData(_:));
}

- (BOOL)sendLayoutChangeEnd:(id)a3 error:(id *)a4
{
  return sub_22D80B6E0(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t))DBUISyncSession.sendLayoutChangeEnd(_:));
}

- (BOOL)sendGiveFocusWithTokenID:(int64_t)a3 error:(id *)a4
{
  v6 = self;
  DBUISyncSession.sendGiveFocus(tokenID:)(a3);

  if (v7)
  {
    if (a4)
    {
      uint64_t v8 = (void *)sub_22D85CC18();

      id v9 = v8;
      *a4 = v8;
    }
    else
    {
    }
  }
  return v7 == 0;
}

- (BOOL)sendPaletteChange:(id)a3 error:(id *)a4
{
  return sub_22D80B6E0(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t))DBUISyncSession.sendPaletteChange(_:));
}

- (_TtP9DashBoard24DBUISyncSessionObserving_)observer
{
  v2 = (char *)self + OBJC_IVAR____TtC9DashBoard15DBUISyncSession_observer;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x230F8D710](v2);
  return (_TtP9DashBoard24DBUISyncSessionObserving_ *)v3;
}

- (void)setObserver:(id)a3
{
}

- (_TtC9DashBoard15DBUISyncSession)initWithChannel:(id)a3 vehicleID:(id)a4 displayID:(id)a5
{
  uint64_t v5 = sub_22D85E4C8();
  uint64_t v7 = v6;
  uint64_t v8 = sub_22D85E4C8();
  uint64_t v10 = v9;
  v11 = (void *)swift_unknownObjectRetain();
  return (_TtC9DashBoard15DBUISyncSession *)DBUISyncSession.init(channel:vehicleID:displayID:)(v11, v5, v7, v8, v10);
}

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9DashBoard15DBUISyncSession_channel);
  v3 = self;
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  v4 = (void *)sub_22D85E4B8();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_removeObserver_forDisplayID_, v3, v4);
  swift_unknownObjectRelease();

  v5.receiver = v3;
  v5.super_class = (Class)type metadata accessor for DBUISyncSession();
  [(DBUISyncSession *)&v5 dealloc];
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC9DashBoard15DBUISyncSession_observer;
  sub_22D7C465C((uint64_t)v3);
}

- (_TtC9DashBoard15DBUISyncSession)init
{
  result = (_TtC9DashBoard15DBUISyncSession *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)didOpen:(id)a3
{
}

- (void)clusterController:(id)a3 didReceivePayload:(id)a4
{
  swift_unknownObjectRetain();
  id v6 = a4;
  uint64_t v10 = self;
  uint64_t v7 = sub_22D85CCF8();
  unint64_t v9 = v8;

  sub_22D83F4A8();
  sub_22D7E8078(v7, v9);
  swift_unknownObjectRelease();
}

- (void)didClose:(id)a3
{
}

@end