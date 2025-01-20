@interface TTRComplicationSwitcherTimelineModel
- (Class)entriesAfterDate:limit:;
- (TTRComplicationTimelineModelEntry)currentEntry;
- (_TtC25NanoRemindersComplicationP33_223A9DD7C06B514C3D1F54AF27D67BC936TTRComplicationSwitcherTimelineModel)init;
@end

@implementation TTRComplicationSwitcherTimelineModel

- (TTRComplicationTimelineModelEntry)currentEntry
{
  v2 = (void *)sub_9DEC();

  return (TTRComplicationTimelineModelEntry *)v2;
}

- (Class)entriesAfterDate:limit:
{
  uint64_t v0 = sub_B2B0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_B290();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_9DAC();
  v4.super.isa = sub_B3D0().super.isa;

  return v4.super.isa;
}

- (_TtC25NanoRemindersComplicationP33_223A9DD7C06B514C3D1F54AF27D67BC936TTRComplicationSwitcherTimelineModel)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TTRComplicationSwitcherTimelineModel();
  return [(TTRComplicationSwitcherTimelineModel *)&v3 init];
}

@end