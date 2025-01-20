@interface MedicationsSettingsTableCell
- (_TtC26MedicationsHealthAppPluginP33_680DB3B0CB4F1B86E2A1616F13EBC0FE28MedicationsSettingsTableCell)initWithCoder:(id)a3;
- (_TtC26MedicationsHealthAppPluginP33_680DB3B0CB4F1B86E2A1616F13EBC0FE28MedicationsSettingsTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation MedicationsSettingsTableCell

- (_TtC26MedicationsHealthAppPluginP33_680DB3B0CB4F1B86E2A1616F13EBC0FE28MedicationsSettingsTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    sub_241160730();
    v6 = (void *)sub_2411606F0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for MedicationsSettingsTableCell();
  v7 = [(MedicationsSettingsTableCell *)&v9 initWithStyle:a3 reuseIdentifier:v6];

  return v7;
}

- (_TtC26MedicationsHealthAppPluginP33_680DB3B0CB4F1B86E2A1616F13EBC0FE28MedicationsSettingsTableCell)initWithCoder:(id)a3
{
  return (_TtC26MedicationsHealthAppPluginP33_680DB3B0CB4F1B86E2A1616F13EBC0FE28MedicationsSettingsTableCell *)sub_241118A6C(self, (uint64_t)a2, (uint64_t)a3, 0, (uint64_t (*)(uint64_t))type metadata accessor for MedicationsSettingsTableCell);
}

@end