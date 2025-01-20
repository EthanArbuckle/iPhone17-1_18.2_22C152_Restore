@interface ActivityGoalDayCell
- (_TtC19ActivityBridgeSetup19ActivityGoalDayCell)initWithCoder:(id)a3;
- (_TtC19ActivityBridgeSetup19ActivityGoalDayCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)setupGoalViewValueChanged:(id)a3 value:(id)a4;
@end

@implementation ActivityGoalDayCell

- (_TtC19ActivityBridgeSetup19ActivityGoalDayCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)sub_253E0();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtC19ActivityBridgeSetup19ActivityGoalDayCell *)sub_176B0(a3, (uint64_t)a4, v6);
}

- (_TtC19ActivityBridgeSetup19ActivityGoalDayCell)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC19ActivityBridgeSetup19ActivityGoalDayCell_dayLabel;
  id v6 = objc_allocWithZone((Class)UILabel);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC19ActivityBridgeSetup19ActivityGoalDayCell_goalView) = 0;
  *(void *)&self->dayLabel[OBJC_IVAR____TtC19ActivityBridgeSetup19ActivityGoalDayCell_delegate] = 0;
  swift_unknownObjectWeakInit();

  result = (_TtC19ActivityBridgeSetup19ActivityGoalDayCell *)sub_254E0();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC19ActivityBridgeSetup19ActivityGoalDayCell_dayLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC19ActivityBridgeSetup19ActivityGoalDayCell_goalView));
  v3 = (char *)self + OBJC_IVAR____TtC19ActivityBridgeSetup19ActivityGoalDayCell_delegate;

  sub_17CB8((uint64_t)v3);
}

- (void)setupGoalViewValueChanged:(id)a3 value:(id)a4
{
  id v7 = (char *)self + OBJC_IVAR____TtC19ActivityBridgeSetup19ActivityGoalDayCell_delegate;
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v8 = *((void *)v7 + 1);
    swift_getObjectType();
    v9 = *(void (**)(void))(v8 + 8);
    id v10 = a3;
    id v11 = a4;
    v12 = self;
    v9();

    swift_unknownObjectRelease();
  }
}

@end