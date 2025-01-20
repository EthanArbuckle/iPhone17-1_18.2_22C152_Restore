@interface SongPreviewPlaybackController
- (_TtC16MusicRecognition29SongPreviewPlaybackController)init;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)playerDidFinishPlaying;
@end

@implementation SongPreviewPlaybackController

- (_TtC16MusicRecognition29SongPreviewPlaybackController)init
{
  return (_TtC16MusicRecognition29SongPreviewPlaybackController *)sub_10008E270();
}

- (void)playerDidFinishPlaying
{
  v2 = self;
  sub_10008EDF8();
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a3)
  {
    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v12 = v11;
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    memset(v18, 0, sizeof(v18));
    id v16 = a5;
    v17 = self;
    if (a5) {
      goto LABEL_4;
    }
LABEL_7:
    v15 = 0;
    goto LABEL_8;
  }
  uint64_t v10 = 0;
  v12 = 0;
  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  swift_unknownObjectRetain();
  id v13 = a5;
  v14 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  if (!a5) {
    goto LABEL_7;
  }
LABEL_4:
  type metadata accessor for NSKeyValueChangeKey(0);
  sub_10009049C(&qword_100156718, type metadata accessor for NSKeyValueChangeKey);
  v15 = (objc_class *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

LABEL_8:
  sub_10008F3E4(v10, v12, (uint64_t)v18, v15, (char *)a6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1000063D0((uint64_t)v18, &qword_10015A520);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MusicRecognition29SongPreviewPlaybackController_previewPlayer));
  v3 = (char *)self + OBJC_IVAR____TtC16MusicRecognition29SongPreviewPlaybackController__statusController;
  uint64_t v4 = sub_1000060EC(&qword_10015A528);
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end