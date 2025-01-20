@interface LocalPreferences.UserDefaultsObserver
- (_TtCC9JetEngine16LocalPreferences20UserDefaultsObserver)init;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation LocalPreferences.UserDefaultsObserver

- (_TtCC9JetEngine16LocalPreferences20UserDefaultsObserver)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  swift_weakInit();
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(LocalPreferences.UserDefaultsObserver *)&v5 init];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a3)
  {
    uint64_t v9 = sub_19F1DBD7C();
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
  sub_19F1DCBEC();
  swift_unknownObjectRelease();
  if (!a5) {
    goto LABEL_7;
  }
LABEL_4:
  type metadata accessor for NSKeyValueChangeKey(0);
  sub_19EF4E6C4();
  uint64_t v14 = sub_19F1DBB3C();

LABEL_8:
  sub_19EF4E58C(v9, v11, (uint64_t)v17, v14);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_19EEBCB4C((uint64_t)v17);
}

- (void).cxx_destruct
{
}

@end