@interface ContactsSettingsPlacardCell
- (_TtC16ContactsSettings27ContactsSettingsPlacardCell)initWithCoder:(id)a3;
- (_TtC16ContactsSettings27ContactsSettingsPlacardCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (_TtC16ContactsSettings27ContactsSettingsPlacardCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation ContactsSettingsPlacardCell

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_84D4(a3);
}

- (_TtC16ContactsSettings27ContactsSettingsPlacardCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  if (a4)
  {
    uint64_t v7 = sub_A510();
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v9 = 0;
  }
  id v10 = a5;
  return (_TtC16ContactsSettings27ContactsSettingsPlacardCell *)sub_92B8(a3, v7, v9, a5);
}

- (_TtC16ContactsSettings27ContactsSettingsPlacardCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a4)
  {
    sub_A510();
    a4 = sub_A4E0();
    swift_bridgeObjectRelease();
  }
  v10.receiver = self;
  v10.super_class = ObjectType;
  uint64_t v8 = [(ContactsSettingsPlacardCell *)&v10 initWithStyle:a3 reuseIdentifier:a4];

  return v8;
}

- (_TtC16ContactsSettings27ContactsSettingsPlacardCell)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(ContactsSettingsPlacardCell *)&v5 initWithCoder:a3];
}

@end