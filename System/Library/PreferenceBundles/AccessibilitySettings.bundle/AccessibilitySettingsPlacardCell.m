@interface AccessibilitySettingsPlacardCell
- (_TtC21AccessibilitySettings32AccessibilitySettingsPlacardCell)initWithCoder:(id)a3;
- (_TtC21AccessibilitySettings32AccessibilitySettingsPlacardCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (_TtC21AccessibilitySettings32AccessibilitySettingsPlacardCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation AccessibilitySettingsPlacardCell

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_137898();
}

- (_TtC21AccessibilitySettings32AccessibilitySettingsPlacardCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  if (a4)
  {
    uint64_t v7 = sub_169880();
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v9 = 0;
  }
  id v10 = a5;
  return (_TtC21AccessibilitySettings32AccessibilitySettingsPlacardCell *)sub_13763C(a3, v7, v9, a5);
}

- (_TtC21AccessibilitySettings32AccessibilitySettingsPlacardCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a4)
  {
    sub_169880();
    a4 = sub_169850();
    swift_bridgeObjectRelease();
  }
  v10.receiver = self;
  v10.super_class = ObjectType;
  uint64_t v8 = [(AccessibilitySettingsPlacardCell *)&v10 initWithStyle:a3 reuseIdentifier:a4];

  return v8;
}

- (_TtC21AccessibilitySettings32AccessibilitySettingsPlacardCell)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(AccessibilitySettingsPlacardCell *)&v5 initWithCoder:a3];
}

@end