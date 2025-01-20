@interface MusicPreviewPlayer
- (_TtC15ShazamEventsApp18MusicPreviewPlayer)init;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)playerDidFinishPlaying;
@end

@implementation MusicPreviewPlayer

- (_TtC15ShazamEventsApp18MusicPreviewPlayer)init
{
  return (_TtC15ShazamEventsApp18MusicPreviewPlayer *)sub_10004B284();
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  sub_10004BA48();
  v5.receiver = v4;
  v5.super_class = ObjectType;
  [(MusicPreviewPlayer *)&v5 dealloc];
}

- (void).cxx_destruct
{
  sub_1000067DC((uint64_t)self + OBJC_IVAR____TtC15ShazamEventsApp18MusicPreviewPlayer__playerTimeObserver, (uint64_t *)&unk_10019D3D0);

  sub_1000067DC((uint64_t)self + OBJC_IVAR____TtC15ShazamEventsApp18MusicPreviewPlayer__currentSong, &qword_1001997B8);
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC15ShazamEventsApp18MusicPreviewPlayer___observationRegistrar;
  uint64_t v4 = type metadata accessor for ObservationRegistrar();
  objc_super v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a3)
  {
    uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v11 = v10;
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    memset(v17, 0, sizeof(v17));
    id v15 = a5;
    v16 = self;
    if (a5) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v14 = 0;
    goto LABEL_8;
  }
  uint64_t v9 = 0;
  uint64_t v11 = 0;
  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  swift_unknownObjectRetain();
  id v12 = a5;
  v13 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  if (!a5) {
    goto LABEL_7;
  }
LABEL_4:
  type metadata accessor for NSKeyValueChangeKey(0);
  sub_10004E13C(&qword_1001981F8, type metadata accessor for NSKeyValueChangeKey);
  uint64_t v14 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

LABEL_8:
  sub_10004E238(v9, v11, (uint64_t)v17, v14);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1000067DC((uint64_t)v17, (uint64_t *)&unk_10019D3D0);
}

- (void)playerDidFinishPlaying
{
  v2 = self;
  sub_10004CDE8();
}

@end