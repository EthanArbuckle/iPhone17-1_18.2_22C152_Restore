@interface NSUserDefaults._DefaultsStore
- (_TtCE17MeasureFoundationCSo14NSUserDefaults14_DefaultsStore)init;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation NSUserDefaults._DefaultsStore

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a3)
  {
    uint64_t v9 = sub_22F223AC8();
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
  sub_22F224268();
  swift_unknownObjectRelease();
  if (!a5) {
    goto LABEL_7;
  }
LABEL_4:
  type metadata accessor for NSKeyValueChangeKey(0);
  sub_22F1A3134(&qword_2686947A0, type metadata accessor for NSKeyValueChangeKey);
  uint64_t v14 = sub_22F223968();

LABEL_8:
  _sSo14NSUserDefaultsC17MeasureFoundationE01_B5StoreC12observeValue10forKeyPath2of6change7contextySSSg_ypSgSDySo05NSKeyg6ChangeI0aypGSgSvSgtF_0(v9, v11, (uint64_t)v17, v14);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_22F1A2FE4((uint64_t)v17);
}

- (_TtCE17MeasureFoundationCSo14NSUserDefaults14_DefaultsStore)init
{
  result = (_TtCE17MeasureFoundationCSo14NSUserDefaults14_DefaultsStore *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end