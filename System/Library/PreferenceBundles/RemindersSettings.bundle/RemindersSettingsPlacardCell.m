@interface RemindersSettingsPlacardCell
- (_TtC17RemindersSettings28RemindersSettingsPlacardCell)initWithCoder:(id)a3;
- (_TtC17RemindersSettings28RemindersSettingsPlacardCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (_TtC17RemindersSettings28RemindersSettingsPlacardCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation RemindersSettingsPlacardCell

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  uint64_t v5 = sub_D808(&qword_21F00);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  id v9 = a3;
  v10 = self;
  [(RemindersSettingsPlacardCell *)v10 setSelectionStyle:0];
  v12 = v10;
  sub_D808(&qword_21F08);
  sub_11BEC(&qword_21F10, &qword_21F08);
  sub_14070();
  sub_14080();
  v13[3] = v5;
  v13[4] = sub_11BEC(&qword_21F18, &qword_21F00);
  sub_130A4(v13);
  sub_14060();
  (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
  sub_14350();
}

- (_TtC17RemindersSettings28RemindersSettingsPlacardCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  if (a4)
  {
    uint64_t v7 = sub_14230();
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v9 = 0;
  }
  id v10 = a5;
  return (_TtC17RemindersSettings28RemindersSettingsPlacardCell *)sub_11D48(a3, v7, v9, a5);
}

- (_TtC17RemindersSettings28RemindersSettingsPlacardCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a4)
  {
    sub_14230();
    a4 = sub_14200();
    swift_bridgeObjectRelease();
  }
  v10.receiver = self;
  v10.super_class = ObjectType;
  uint64_t v8 = [(RemindersSettingsPlacardCell *)&v10 initWithStyle:a3 reuseIdentifier:a4];

  return v8;
}

- (_TtC17RemindersSettings28RemindersSettingsPlacardCell)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(RemindersSettingsPlacardCell *)&v5 initWithCoder:a3];
}

@end