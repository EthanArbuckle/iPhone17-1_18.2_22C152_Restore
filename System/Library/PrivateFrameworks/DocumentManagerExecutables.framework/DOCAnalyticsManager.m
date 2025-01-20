@interface DOCAnalyticsManager
- (_TtC26DocumentManagerExecutables19DOCAnalyticsManager)init;
- (void)tagsDidChangeWithNotification:(id)a3;
@end

@implementation DOCAnalyticsManager

- (_TtC26DocumentManagerExecutables19DOCAnalyticsManager)init
{
  return (_TtC26DocumentManagerExecutables19DOCAnalyticsManager *)sub_22BDCDEB4();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC26DocumentManagerExecutables19DOCAnalyticsManager_eventsQueue);
}

- (void)tagsDidChangeWithNotification:(id)a3
{
  v7[0] = 0xD00000000000002ELL;
  v7[1] = 0x800000022BEA1C20;
  v7[2] = 0;
  v7[3] = 0;
  char v8 = 2;
  uint64_t v4 = qword_26AEFFB30;
  id v5 = a3;
  v6 = self;
  if (v4 != -1) {
    swift_once();
  }
  sub_22BE14BA4((uint64_t)v7, (void *)qword_26AEFFA50);
}

@end