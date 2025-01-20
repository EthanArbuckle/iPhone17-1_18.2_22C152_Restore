@interface MedicationSearchOptionsFieldCell
- (_TtC19HealthMedicationsUI32MedicationSearchOptionsFieldCell)initWithCoder:(id)a3;
- (_TtC19HealthMedicationsUI32MedicationSearchOptionsFieldCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)onScan;
- (void)onSearch;
@end

@implementation MedicationSearchOptionsFieldCell

- (_TtC19HealthMedicationsUI32MedicationSearchOptionsFieldCell)initWithFrame:(CGRect)a3
{
  return (_TtC19HealthMedicationsUI32MedicationSearchOptionsFieldCell *)sub_1C1FB05FC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC19HealthMedicationsUI32MedicationSearchOptionsFieldCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C1FB1EE0();
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MedicationSearchOptionsFieldCell();
  id v2 = v5.receiver;
  [(MedicationSearchOptionsFieldCell *)&v5 layoutSubviews];
  id v3 = sub_1C1FAF8E8();
  objc_msgSend(v2, sel_bounds, v5.receiver, v5.super_class);
  double Width = CGRectGetWidth(v6);
  objc_msgSend(v2, sel_bounds);
  objc_msgSend(v3, sel_setFrame_, 0.0, 0.0, Width, CGRectGetHeight(v7) + -10.0);
}

- (void)onSearch
{
  id v2 = self;
  sub_1C1FB09A0();
}

- (void)onScan
{
  id v2 = self;
  sub_1C1FB0F5C();
}

- (void).cxx_destruct
{
  sub_1C1FB1E84((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI32MedicationSearchOptionsFieldCell_item, (unint64_t *)&qword_1EBF0C300, (void (*)(uint64_t))sub_1C1F1CB5C);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI32MedicationSearchOptionsFieldCell____lazy_storage___stackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI32MedicationSearchOptionsFieldCell____lazy_storage___searchButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI32MedicationSearchOptionsFieldCell____lazy_storage___scanButton));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC19HealthMedicationsUI32MedicationSearchOptionsFieldCell____lazy_storage___fixedSpace);
}

@end