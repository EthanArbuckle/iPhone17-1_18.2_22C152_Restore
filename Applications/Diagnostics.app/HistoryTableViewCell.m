@interface HistoryTableViewCell
- (_TtC11Diagnostics20HistoryTableViewCell)initWithCoder:(id)a3;
- (_TtC11Diagnostics20HistoryTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation HistoryTableViewCell

- (_TtC11Diagnostics20HistoryTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC11Diagnostics20HistoryTableViewCell *)sub_1000C4254(a3, (uint64_t)a4, v6);
}

- (_TtC11Diagnostics20HistoryTableViewCell)initWithCoder:(id)a3
{
  return (_TtC11Diagnostics20HistoryTableViewCell *)sub_1000C43D0(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics20HistoryTableViewCell_suiteLabel));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC11Diagnostics20HistoryTableViewCell_dateLabel);
}

@end