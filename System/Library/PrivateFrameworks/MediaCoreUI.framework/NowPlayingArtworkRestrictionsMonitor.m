@interface NowPlayingArtworkRestrictionsMonitor
- (_TtC11MediaCoreUI36NowPlayingArtworkRestrictionsMonitor)init;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation NowPlayingArtworkRestrictionsMonitor

- (_TtC11MediaCoreUI36NowPlayingArtworkRestrictionsMonitor)init
{
  return (_TtC11MediaCoreUI36NowPlayingArtworkRestrictionsMonitor *)sub_255C09208();
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a3)
  {
    uint64_t v10 = sub_255C80628();
    uint64_t v12 = v11;
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
  uint64_t v12 = 0;
  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  swift_unknownObjectRetain();
  id v13 = a5;
  v14 = self;
  sub_255C80F58();
  swift_unknownObjectRelease();
  if (!a5) {
    goto LABEL_7;
  }
LABEL_4:
  type metadata accessor for NSKeyValueChangeKey(0);
  sub_255C0A868(&qword_269F20770, type metadata accessor for NSKeyValueChangeKey);
  v15 = (void *)sub_255C80458();

LABEL_8:
  sub_255C097B4(v10, v12, (uint64_t)v18, v15, (uint64_t)a6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_255A095A4((uint64_t)v18, &qword_26B297D00);
}

- (void)dealloc
{
  v3 = self;
  v4 = self;
  id v5 = objc_msgSend(v3, sel_standardUserDefaults);
  v6 = (void *)sub_255C805F8();
  objc_msgSend(v5, sel_removeObserver_forKeyPath_, v4, v6);

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for NowPlayingArtworkRestrictionsMonitor();
  [(NowPlayingArtworkRestrictionsMonitor *)&v7 dealloc];
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC11MediaCoreUI36NowPlayingArtworkRestrictionsMonitor__isMotionDisabled;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B29F098);
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);

  swift_release();
}

@end