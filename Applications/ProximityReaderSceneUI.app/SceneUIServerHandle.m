@interface SceneUIServerHandle
- (_TtC22ProximityReaderSceneUI19SceneUIServerHandle)init;
- (void)activateRemoteUI:(id)a3 internalEndpoint:(id)a4 reply:(id)a5;
- (void)deactivateRemoteUI:(id)a3;
- (void)dealloc;
- (void)invalidateRemoteUI:(id)a3;
@end

@implementation SceneUIServerHandle

- (void)dealloc
{
  v2 = self;
  sub_100004B4C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22ProximityReaderSceneUI19SceneUIServerHandle_connection));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22ProximityReaderSceneUI19SceneUIServerHandle_currentScene));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22ProximityReaderSceneUI19SceneUIServerHandle_readerServiceEndpoint));
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC22ProximityReaderSceneUI19SceneUIServerHandle____lazy_storage___interface);
}

- (void)activateRemoteUI:(id)a3 internalEndpoint:(id)a4 reply:(id)a5
{
  v7 = _Block_copy(a5);
  uint64_t v8 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v7;
  v10 = (char *)a4;
  v11 = self;
  sub_100004DD8(v8, v10, (uint64_t)sub_100007738, v9);

  swift_bridgeObjectRelease();

  swift_release();
}

- (void)invalidateRemoteUI:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  sub_100005C30((uint64_t)sub_100007658, v5);

  swift_release();
}

- (void)deactivateRemoteUI:(id)a3
{
  uint64_t v5 = sub_1000025B4(&qword_100019DE0);
  __chkstk_darwin(v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = qword_100019DD0;
  v10 = self;
  if (v9 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_1000025F8(v5, (uint64_t)qword_10001ABA0);
  sub_100002630(v11, (uint64_t)v7);
  uint64_t v12 = type metadata accessor for Logger();
  uint64_t v13 = *(void *)(v12 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v7, 1, v12) == 1)
  {
    sub_10000749C((uint64_t)v7, &qword_100019DE0);
  }
  else
  {
    sub_100007A88((uint64_t)v10, 0xD000000000000016, 0x8000000100012BB0, 0, 0xE000000000000000);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v7, v12);
  }
  _Block_release(v8);
}

- (_TtC22ProximityReaderSceneUI19SceneUIServerHandle)init
{
  result = (_TtC22ProximityReaderSceneUI19SceneUIServerHandle *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end