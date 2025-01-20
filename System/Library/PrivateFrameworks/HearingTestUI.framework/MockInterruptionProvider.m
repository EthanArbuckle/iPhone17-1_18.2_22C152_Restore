@interface MockInterruptionProvider
- (_TtC13HearingTestUI24MockInterruptionProvider)init;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation MockInterruptionProvider

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a3)
  {
    uint64_t v10 = sub_251444C20();
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
  sub_251445230();
  swift_unknownObjectRelease();
  if (!a5) {
    goto LABEL_7;
  }
LABEL_4:
  type metadata accessor for NSKeyValueChangeKey(0);
  sub_25142BE38(&qword_269B36528, type metadata accessor for NSKeyValueChangeKey);
  v15 = (void *)sub_251444B50();

LABEL_8:
  sub_25142B4BC(v10, v12, (uint64_t)v18, v15, (uint64_t)a6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2513BAF04((uint64_t)v18);
}

- (_TtC13HearingTestUI24MockInterruptionProvider)init
{
  sub_25142B990();
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13HearingTestUI24MockInterruptionProvider_hearingTestUserDefaults));
  sub_25142BC58((uint64_t)self + OBJC_IVAR____TtC13HearingTestUI24MockInterruptionProvider_observer);
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13HearingTestUI24MockInterruptionProvider_observerQueue);
}

@end