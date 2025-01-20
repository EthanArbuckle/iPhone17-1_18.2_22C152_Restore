@interface SelfServiceSessionHistoryCell
- (_TtC11Diagnostics29SelfServiceSessionHistoryCell)initWithCoder:(id)a3;
- (_TtC11Diagnostics29SelfServiceSessionHistoryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation SelfServiceSessionHistoryCell

- (_TtC11Diagnostics29SelfServiceSessionHistoryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtC11Diagnostics29SelfServiceSessionHistoryCell *)sub_1000651F4(a3, (uint64_t)a4, v6);
}

- (_TtC11Diagnostics29SelfServiceSessionHistoryCell)initWithCoder:(id)a3
{
  return (_TtC11Diagnostics29SelfServiceSessionHistoryCell *)sub_10006544C(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics29SelfServiceSessionHistoryCell_rootStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics29SelfServiceSessionHistoryCell_suiteNameLabel));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics29SelfServiceSessionHistoryCell_dateLabel));
  v3 = (char *)self + OBJC_IVAR____TtC11Diagnostics29SelfServiceSessionHistoryCell_date;

  sub_10004B5C8((uint64_t)v3);
}

@end