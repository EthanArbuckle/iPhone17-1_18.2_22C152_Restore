@interface AccountUpgradeCell
- (UICellConfigurationState)_bridgedConfigurationState;
- (_TtC15HealthRecordsUI18AccountUpgradeCell)initWithCoder:(id)a3;
- (_TtC15HealthRecordsUI18AccountUpgradeCell)initWithFrame:(CGRect)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
@end

@implementation AccountUpgradeCell

- (UICellConfigurationState)_bridgedConfigurationState
{
  uint64_t v3 = sub_1C254E690();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  sub_1C2348638();

  v8 = (void *)sub_1C254E670();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (UICellConfigurationState *)v8;
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = sub_1C254E690();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C254E680();
  v8 = self;
  sub_1C23487D4();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC15HealthRecordsUI18AccountUpgradeCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = (char *)self + OBJC_IVAR____TtC15HealthRecordsUI18AccountUpgradeCell_item;
  *(_OWORD *)v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  *((void *)v7 + 4) = 0;
  *((unsigned char *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC15HealthRecordsUI18AccountUpgradeCell_disableAction) = 1;
  *((unsigned char *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC15HealthRecordsUI18AccountUpgradeCell_hideDismiss) = 1;
  *((unsigned char *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC15HealthRecordsUI18AccountUpgradeCell_hasSetUpViews) = 0;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for AccountUpgradeCell();
  return -[AccountUpgradeCell initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
}

- (_TtC15HealthRecordsUI18AccountUpgradeCell)initWithCoder:(id)a3
{
  uint64_t v4 = (char *)self + OBJC_IVAR____TtC15HealthRecordsUI18AccountUpgradeCell_item;
  *(_OWORD *)uint64_t v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  *((unsigned char *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC15HealthRecordsUI18AccountUpgradeCell_disableAction) = 1;
  *((unsigned char *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC15HealthRecordsUI18AccountUpgradeCell_hideDismiss) = 1;
  *((unsigned char *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC15HealthRecordsUI18AccountUpgradeCell_hasSetUpViews) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AccountUpgradeCell();
  return [(AccountUpgradeCell *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end