@interface ScheduledDetailItemCell
- (_TtC19HealthMedicationsUI23ScheduledDetailItemCell)initWithCoder:(id)a3;
- (_TtC19HealthMedicationsUI23ScheduledDetailItemCell)initWithFrame:(CGRect)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)medicationDetailDidUpdate:(id)a3 for:(id)a4;
@end

@implementation ScheduledDetailItemCell

- (_TtC19HealthMedicationsUI23ScheduledDetailItemCell)initWithFrame:(CGRect)a3
{
  return (_TtC19HealthMedicationsUI23ScheduledDetailItemCell *)sub_1C20DCDA0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = sub_1C2149970();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2149960();
  v8 = self;
  sub_1C20DD638();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC19HealthMedicationsUI23ScheduledDetailItemCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI23ScheduledDetailItemCell____lazy_storage___medicationView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI23ScheduledDetailItemCell____lazy_storage___timeLabel) = 0;
  uint64_t v5 = OBJC_IVAR____TtC19HealthMedicationsUI23ScheduledDetailItemCell_detailProvider;
  sub_1C2149130();
  id v6 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + v5) = (Class)sub_1C2149120();
  v7 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI23ScheduledDetailItemCell_item;
  *((void *)v7 + 4) = 0;
  *(_OWORD *)v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;

  result = (_TtC19HealthMedicationsUI23ScheduledDetailItemCell *)sub_1C214B910();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI23ScheduledDetailItemCell____lazy_storage___medicationView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI23ScheduledDetailItemCell____lazy_storage___timeLabel));
  swift_release();
  sub_1C20DE7D8((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI23ScheduledDetailItemCell_item, (unint64_t *)&qword_1EBF0C300, (uint64_t (*)(uint64_t))sub_1C1F1CB5C);
}

- (void)medicationDetailDidUpdate:(id)a3 for:(id)a4
{
  uint64_t v6 = sub_1C214A5F0();
  uint64_t v8 = v7;
  id v9 = a3;
  v10 = self;
  sub_1C20DDD14(v9, v6, v8);

  swift_bridgeObjectRelease();
}

@end