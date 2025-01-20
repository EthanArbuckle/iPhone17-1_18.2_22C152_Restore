@interface SidecarDisplaySession
- (_TtC17ContinuityDisplay21SidecarDisplaySession)init;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)sidecarRequest:(id)a3 receivedItems:(id)a4;
@end

@implementation SidecarDisplaySession

- (void)sidecarRequest:(id)a3 receivedItems:(id)a4
{
  sub_100007F60(0, &qword_1000843F8);
  uint64_t v6 = sub_10005EAC0();
  id v7 = a3;
  v8 = self;
  SidecarDisplaySession.sidecarRequest(_:receivedItems:)((uint64_t)v8, v6);

  swift_bridgeObjectRelease();
}

- (void)dealloc
{
  v2 = self;
  SidecarDisplaySession.__deallocating_deinit();
}

- (void).cxx_destruct
{
  sub_10001A3E0((uint64_t)self + OBJC_IVAR____TtC17ContinuityDisplay21SidecarDisplaySession_delegate);
  sub_10005E750();
  sub_10001A7D4();
  sub_10001A738();
  v3();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17ContinuityDisplay21SidecarDisplaySession_audioStreamNegotiator));
  sub_10005E6D0();
  sub_10001A7D4();
  sub_10001A738();
  v4();

  swift_release();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17ContinuityDisplay21SidecarDisplaySession_hidSidecarStream));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17ContinuityDisplay21SidecarDisplaySession_videoSidecarStream));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17ContinuityDisplay21SidecarDisplaySession_audioSidecarStream));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17ContinuityDisplay21SidecarDisplaySession_videoClientDelegate));

  swift_unknownObjectRelease();
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a3)
  {
    sub_10005E920();
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    memset(v13, 0, sizeof(v13));
    id v11 = a5;
    v12 = self;
    if (!a5) {
      goto LABEL_7;
    }
    goto LABEL_4;
  }
  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  swift_unknownObjectRetain();
  id v9 = a5;
  v10 = self;
  sub_10005EEC0();
  swift_unknownObjectRelease();
  if (a5)
  {
LABEL_4:
    type metadata accessor for NSKeyValueChangeKey(0);
    sub_10001A4D0(&qword_100083C68, type metadata accessor for NSKeyValueChangeKey);
    sub_10005E880();
  }
LABEL_7:
  SidecarDisplaySession.observeValue(forKeyPath:of:change:context:)();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10001A2E0((uint64_t)v13, (uint64_t *)&unk_100084130);
}

- (_TtC17ContinuityDisplay21SidecarDisplaySession)init
{
}

@end