@interface InteractionCriticalAlertCell
- (_TtC19HealthMedicationsUI28InteractionCriticalAlertCell)initWithCoder:(id)a3;
- (_TtC19HealthMedicationsUI28InteractionCriticalAlertCell)initWithFrame:(CGRect)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)awakeFromNib;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation InteractionCriticalAlertCell

- (_TtC19HealthMedicationsUI28InteractionCriticalAlertCell)initWithFrame:(CGRect)a3
{
  return (_TtC19HealthMedicationsUI28InteractionCriticalAlertCell *)sub_1C201698C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC19HealthMedicationsUI28InteractionCriticalAlertCell)initWithCoder:(id)a3
{
  return (_TtC19HealthMedicationsUI28InteractionCriticalAlertCell *)sub_1C2016B84(a3);
}

- (void)awakeFromNib
{
  v2 = self;
  sub_1C2016C70();
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = sub_1C2149970();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2149960();
  v8 = self;
  sub_1C2016E3C();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  sub_1C1F12718(0, &qword_1EA2C4618);
  sub_1C1FB6160();
  uint64_t v6 = sub_1C214AA60();
  v7 = self;
  id v8 = a4;
  uint64_t v9 = sub_1C1FB2B10(v6);
  if (v9
    && (v10 = (void *)v9,
        id v11 = sub_1C2017220(),
        char v12 = MEMORY[0x1C8753270](v10, v11, 36.0, 36.0),
        v11,
        v10,
        (v12 & 1) != 0))
  {

    swift_bridgeObjectRelease();
  }
  else
  {
    v13 = (void *)sub_1C214AA50();
    v14.receiver = v7;
    v14.super_class = (Class)type metadata accessor for InteractionCriticalAlertCell();
    [(InteractionCriticalAlertCell *)&v14 touchesBegan:v13 withEvent:v8];

    swift_bridgeObjectRelease();
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  sub_1C1F12718(0, &qword_1EA2C4618);
  sub_1C1FB6160();
  uint64_t v6 = sub_1C214AA60();
  id v7 = a4;
  id v8 = self;
  sub_1C2018BE4(v6, (uint64_t)a4);

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  sub_1C2019334((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI28InteractionCriticalAlertCell_item, (unint64_t *)&qword_1EBF0C300, (unint64_t *)&qword_1EBF0C2F0, MEMORY[0x1E4F66028]);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI28InteractionCriticalAlertCell____lazy_storage___interactionStackedMedmojiView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI28InteractionCriticalAlertCell____lazy_storage___dismissLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI28InteractionCriticalAlertCell____lazy_storage___titleButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI28InteractionCriticalAlertCell____lazy_storage___subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI28InteractionCriticalAlertCell____lazy_storage___separatorView));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC19HealthMedicationsUI28InteractionCriticalAlertCell____lazy_storage___learnMoreLabel);
}

@end