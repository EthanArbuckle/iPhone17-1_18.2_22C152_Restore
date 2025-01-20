@interface UserDefaultsObserver
- (_TtC16HealthExperience20UserDefaultsObserver)init;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation UserDefaultsObserver

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16HealthExperience20UserDefaultsObserver_userDefaults);
  v3 = self;
  id v4 = v2;
  swift_bridgeObjectRetain();
  v5 = (void *)sub_1C28CD6F0();
  swift_bridgeObjectRelease();
  objc_msgSend(v4, sel_removeObserver_forKeyPath_, v3, v5);

  v6.receiver = v3;
  v6.super_class = (Class)type metadata accessor for UserDefaultsObserver();
  [(UserDefaultsObserver *)&v6 dealloc];
}

- (void).cxx_destruct
{
  swift_release();

  swift_bridgeObjectRelease();
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a3)
  {
    uint64_t v10 = sub_1C28CD730();
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
  sub_1C28CE000();
  swift_unknownObjectRelease();
  if (!a5) {
    goto LABEL_7;
  }
LABEL_4:
  type metadata accessor for NSKeyValueChangeKey(0);
  sub_1C27DE670();
  v15 = (void *)sub_1C28CD610();

LABEL_8:
  sub_1C286F1A0(v10, v12, (uint64_t)v18, v15, (uint64_t)a6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1C27B9E38((uint64_t)v18);
}

- (_TtC16HealthExperience20UserDefaultsObserver)init
{
  result = (_TtC16HealthExperience20UserDefaultsObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end