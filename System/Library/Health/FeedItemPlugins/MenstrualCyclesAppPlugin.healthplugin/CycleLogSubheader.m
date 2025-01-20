@interface CycleLogSubheader
- (_TtC24MenstrualCyclesAppPlugin17CycleLogSubheader)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin17CycleLogSubheader)initWithFrame:(CGRect)a3;
@end

@implementation CycleLogSubheader

- (_TtC24MenstrualCyclesAppPlugin17CycleLogSubheader)initWithFrame:(CGRect)a3
{
  return (_TtC24MenstrualCyclesAppPlugin17CycleLogSubheader *)sub_2411F9C60(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC24MenstrualCyclesAppPlugin17CycleLogSubheader)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin17CycleLogSubheader_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  id v5 = a3;

  result = (_TtC24MenstrualCyclesAppPlugin17CycleLogSubheader *)sub_241633038();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_2411FA33C((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin17CycleLogSubheader_item, (uint64_t (*)(void))sub_2411FA2D4);
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin17CycleLogSubheader_contentView);
}

@end