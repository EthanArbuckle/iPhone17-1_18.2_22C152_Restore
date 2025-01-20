@interface ProductionEnvironment
- (_TtC21contactsdonationagent21ProductionEnvironment)init;
@end

@implementation ProductionEnvironment

- (_TtC21contactsdonationagent21ProductionEnvironment)init
{
  return (_TtC21contactsdonationagent21ProductionEnvironment *)sub_100019D3C();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21contactsdonationagent21ProductionEnvironment____lazy_storage___dataProxy));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21contactsdonationagent21ProductionEnvironment____lazy_storage___distributedNotificationCenter));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC21contactsdonationagent21ProductionEnvironment____lazy_storage___feedbackStore);
}

@end