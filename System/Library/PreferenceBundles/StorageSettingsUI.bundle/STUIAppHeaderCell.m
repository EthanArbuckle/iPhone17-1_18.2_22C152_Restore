@interface STUIAppHeaderCell
- (_TtC17StorageSettingsUI17STUIAppHeaderCell)initWithCoder:(id)a3;
- (_TtC17StorageSettingsUI17STUIAppHeaderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (_TtC17StorageSettingsUI17STUIAppHeaderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation STUIAppHeaderCell

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v7[3] = sub_14F50(&qword_A4A78);
  v7[4] = sub_1508C(&qword_A4A80, &qword_A4A78);
  sub_73BA8(v7);
  id v5 = a3;
  v6 = self;
  sub_14F50(&qword_A4A88);
  sub_73C0C();
  sub_765D0();
  sub_76DE0();
}

- (_TtC17StorageSettingsUI17STUIAppHeaderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  if (a4)
  {
    uint64_t v7 = sub_76C10();
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v9 = 0;
  }
  id v10 = a5;
  return (_TtC17StorageSettingsUI17STUIAppHeaderCell *)STUIAppHeaderCell.init(style:reuseIdentifier:specifier:)(a3, v7, v9, a5);
}

- (_TtC17StorageSettingsUI17STUIAppHeaderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    sub_76C10();
    NSString v6 = sub_76BE0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for STUIAppHeaderCell();
  uint64_t v7 = [(STUIAppHeaderCell *)&v9 initWithStyle:a3 reuseIdentifier:v6];

  return v7;
}

- (_TtC17StorageSettingsUI17STUIAppHeaderCell)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for STUIAppHeaderCell();
  return [(STUIAppHeaderCell *)&v5 initWithCoder:a3];
}

@end