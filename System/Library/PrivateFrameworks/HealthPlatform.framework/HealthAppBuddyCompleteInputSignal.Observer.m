@interface HealthAppBuddyCompleteInputSignal.Observer
- (_TtCC14HealthPlatform33HealthAppBuddyCompleteInputSignal8Observer)init;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation HealthAppBuddyCompleteInputSignal.Observer

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a3)
  {
    sub_1C277B850();
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
  sub_1C277C110();
  swift_unknownObjectRelease();
  if (a5)
  {
LABEL_4:
    type metadata accessor for NSKeyValueChangeKey(0);
    sub_1C2773300(&qword_1EA3041F0, type metadata accessor for NSKeyValueChangeKey);
    sub_1C277B760();
  }
LABEL_7:
  sub_1C2773158();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1C262F2E4((uint64_t)v13);
}

- (_TtCC14HealthPlatform33HealthAppBuddyCompleteInputSignal8Observer)init
{
  result = (_TtCC14HealthPlatform33HealthAppBuddyCompleteInputSignal8Observer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end