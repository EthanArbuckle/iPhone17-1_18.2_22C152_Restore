@interface TickerCell
- (_TtC13FTMInternal_410TickerCell)initWithCoder:(id)a3;
- (_TtC13FTMInternal_410TickerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation TickerCell

- (_TtC13FTMInternal_410TickerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC13FTMInternal_410TickerCell *)sub_10017B610(a3, (uint64_t)a4, v6);
}

- (_TtC13FTMInternal_410TickerCell)initWithCoder:(id)a3
{
  uint64_t v5 = (Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC13FTMInternal_410TickerCell_digit);
  *uint64_t v5 = 48;
  v5[1] = 0xE100000000000000;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC13FTMInternal_410TickerCell_fontSize) = (Class)0x4044000000000000;
  uint64_t v6 = OBJC_IVAR____TtC13FTMInternal_410TickerCell_numberLabel;
  id v7 = objc_allocWithZone((Class)UILabel);
  id v8 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v6) = (Class)[v7 init];

  result = (_TtC13FTMInternal_410TickerCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC13FTMInternal_410TickerCell_numberLabel);
}

@end