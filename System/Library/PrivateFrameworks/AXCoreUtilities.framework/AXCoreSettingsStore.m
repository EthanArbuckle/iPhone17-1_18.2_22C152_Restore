@interface AXCoreSettingsStore
- (_TtC15AXCoreUtilities19AXCoreSettingsStore)init;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation AXCoreSettingsStore

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a3)
  {
    sub_18FD02150();
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    memset(v15, 0, sizeof(v15));
    id v13 = a5;
    v14 = self;
    if (a5) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v12 = 0;
    goto LABEL_8;
  }
  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  swift_unknownObjectRetain();
  id v10 = a5;
  v11 = self;
  sub_18FD02660();
  swift_unknownObjectRelease();
  if (!a5) {
    goto LABEL_7;
  }
LABEL_4:
  type metadata accessor for NSKeyValueChangeKey(0);
  sub_18FCDF168();
  uint64_t v12 = sub_18FD02090();

LABEL_8:
  sub_18FCDED84((uint64_t)v15, v12, (uint64_t)a6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_18FCA2480((uint64_t)v15);
}

- (_TtC15AXCoreUtilities19AXCoreSettingsStore)init
{
  return (_TtC15AXCoreUtilities19AXCoreSettingsStore *)AXCoreSettingsStore.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
}

@end