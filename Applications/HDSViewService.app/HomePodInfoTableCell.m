@interface HomePodInfoTableCell
- (_TtC14HDSViewService20HomePodInfoTableCell)initWithCoder:(id)a3;
- (_TtC14HDSViewService20HomePodInfoTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation HomePodInfoTableCell

- (_TtC14HDSViewService20HomePodInfoTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC14HDSViewService20HomePodInfoTableCell *)sub_1000951E4(a3, (uint64_t)a4, v6);
}

- (_TtC14HDSViewService20HomePodInfoTableCell)initWithCoder:(id)a3
{
  return (_TtC14HDSViewService20HomePodInfoTableCell *)sub_100095334(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14HDSViewService20HomePodInfoTableCell_titleLabel));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC14HDSViewService20HomePodInfoTableCell_valueLabel);
}

@end