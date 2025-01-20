@interface TTRIComplicationSwitcherTimelineModelSource
- (TTRComplicationTimelineModel)model;
- (TTRComplicationTimelineModelSourceDelegate)delegate;
- (_TtC25NanoRemindersComplication43TTRIComplicationSwitcherTimelineModelSource)init;
- (void)setDelegate:(id)a3;
- (void)setModel:(id)a3;
@end

@implementation TTRIComplicationSwitcherTimelineModelSource

- (_TtC25NanoRemindersComplication43TTRIComplicationSwitcherTimelineModelSource)init
{
  swift_unknownObjectWeakInit();
  id v3 = objc_allocWithZone((Class)type metadata accessor for TTRComplicationSwitcherTimelineModel());
  v4 = self;
  v5 = (objc_class *)[v3 init];
  *(Class *)((char *)&v4->super.isa
           + OBJC_IVAR____TtC25NanoRemindersComplication43TTRIComplicationSwitcherTimelineModelSource_model) = v5;

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for TTRIComplicationSwitcherTimelineModelSource();
  return [(TTRIComplicationSwitcherTimelineModelSource *)&v7 init];
}

- (TTRComplicationTimelineModel)model
{
  swift_beginAccess();
  v2 = (void *)swift_unknownObjectRetain();

  return (TTRComplicationTimelineModel *)v2;
}

- (void)setModel:(id)a3
{
  v4 = (id *)((char *)&self->super.isa
            + OBJC_IVAR____TtC25NanoRemindersComplication43TTRIComplicationSwitcherTimelineModelSource_model);
  swift_beginAccess();
  id *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (TTRComplicationTimelineModelSourceDelegate)delegate
{
  swift_beginAccess();
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (TTRComplicationTimelineModelSourceDelegate *)Strong;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  id v3 = (char *)self + OBJC_IVAR____TtC25NanoRemindersComplication43TTRIComplicationSwitcherTimelineModelSource_delegate;

  sub_A7FC((uint64_t)v3);
}

@end