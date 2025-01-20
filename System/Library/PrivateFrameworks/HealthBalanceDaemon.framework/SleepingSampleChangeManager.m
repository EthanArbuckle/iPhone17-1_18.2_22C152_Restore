@interface SleepingSampleChangeManager
- (_TtC19HealthBalanceDaemon27SleepingSampleChangeManager)init;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)profileDidBecomeReady:(id)a3;
- (void)samplesAdded:(id)a3 anchor:(id)a4;
- (void)samplesOfTypesWereRemoved:(id)a3 anchor:(id)a4;
@end

@implementation SleepingSampleChangeManager

- (void)dealloc
{
  v2 = self;
  sub_250EB2F84();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19HealthBalanceDaemon27SleepingSampleChangeManager_dataManager));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19HealthBalanceDaemon27SleepingSampleChangeManager_debounceQueue_removalOperation));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19HealthBalanceDaemon27SleepingSampleChangeManager_debounceQueue));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC19HealthBalanceDaemon27SleepingSampleChangeManager_unitTest_didBeginObservingSleepingSampleDataTypes);
  sub_250EAB9CC(v3);
}

- (void)profileDidBecomeReady:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_250EB5668();
}

- (void)samplesAdded:(id)a3 anchor:(id)a4
{
}

- (void)samplesOfTypesWereRemoved:(id)a3 anchor:(id)a4
{
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a3)
  {
    uint64_t v10 = sub_250F0CF80();
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
    uint64_t v15 = 0;
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
  sub_250F0D340();
  swift_unknownObjectRelease();
  if (!a5) {
    goto LABEL_7;
  }
LABEL_4:
  type metadata accessor for NSKeyValueChangeKey(0);
  sub_250EB6364((unint64_t *)&unk_269B10D80, type metadata accessor for NSKeyValueChangeKey);
  uint64_t v15 = sub_250F0CE90();

LABEL_8:
  sub_250EB4304(v10, v12, (uint64_t)v18, v15, (uint64_t)a6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_250EA8EB8((uint64_t)v18);
}

- (_TtC19HealthBalanceDaemon27SleepingSampleChangeManager)init
{
  result = (_TtC19HealthBalanceDaemon27SleepingSampleChangeManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end