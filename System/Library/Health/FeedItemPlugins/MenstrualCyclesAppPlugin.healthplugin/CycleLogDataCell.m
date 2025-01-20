@interface CycleLogDataCell
- (_TtC24MenstrualCyclesAppPlugin16CycleLogDataCell)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin16CycleLogDataCell)initWithFrame:(CGRect)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
@end

@implementation CycleLogDataCell

- (_TtC24MenstrualCyclesAppPlugin16CycleLogDataCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin16CycleLogDataCell_item;
  *(_OWORD *)v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  *((void *)v7 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin16CycleLogDataCell____lazy_storage___accessoryImageView) = 0;
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for CycleLogDataCell();
  v8 = -[CycleLogDataCell initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  v12[3] = sub_24162F338();
  v12[4] = MEMORY[0x263F81F20];
  v9 = sub_2411B6C70(v12);
  v10 = v8;
  sub_2415CF730((uint64_t)v9);
  MEMORY[0x24561FB40](v12);

  return v10;
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = sub_24162F0E8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24162F0D8();
  v8 = self;
  sub_2415CFB24((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC24MenstrualCyclesAppPlugin16CycleLogDataCell)initWithCoder:(id)a3
{
  uint64_t v4 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin16CycleLogDataCell_item;
  *(_OWORD *)uint64_t v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin16CycleLogDataCell____lazy_storage___accessoryImageView) = 0;
  id v5 = a3;

  result = (_TtC24MenstrualCyclesAppPlugin16CycleLogDataCell *)sub_241633038();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_2415D0AE8((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin16CycleLogDataCell_item, (uint64_t)&qword_268CFFE30, (uint64_t)&qword_268CFF090, MEMORY[0x263F437A0], (uint64_t (*)(void))sub_2411BF934);
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin16CycleLogDataCell____lazy_storage___accessoryImageView);
}

@end