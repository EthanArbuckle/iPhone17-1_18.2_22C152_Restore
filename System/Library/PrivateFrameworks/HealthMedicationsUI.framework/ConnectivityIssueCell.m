@interface ConnectivityIssueCell
- (_TtC19HealthMedicationsUI21ConnectivityIssueCell)initWithCoder:(id)a3;
- (_TtC19HealthMedicationsUI21ConnectivityIssueCell)initWithFrame:(CGRect)a3;
@end

@implementation ConnectivityIssueCell

- (_TtC19HealthMedicationsUI21ConnectivityIssueCell)initWithFrame:(CGRect)a3
{
  return (_TtC19HealthMedicationsUI21ConnectivityIssueCell *)sub_1C206B3A8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC19HealthMedicationsUI21ConnectivityIssueCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C206C988();
}

- (void).cxx_destruct
{
  sub_1C206CA84((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI21ConnectivityIssueCell_item, (unint64_t *)&qword_1EBF0C300, (void (*)(uint64_t))sub_1C1F1CB5C);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI21ConnectivityIssueCell____lazy_storage___boltIconImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI21ConnectivityIssueCell____lazy_storage___labelView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI21ConnectivityIssueCell____lazy_storage___secondaryLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC19HealthMedicationsUI21ConnectivityIssueCell____lazy_storage___settingsButton);
}

@end