@interface TimePickerCell
- (NSString)accessibilityIdentifier;
- (NSString)accessibilityLabel;
- (NSString)accessibilityValue;
- (UILabel)detailTextLabel;
- (UILabel)textLabel;
- (_TtC15JournalSettings14TimePickerCell)initWithCoder:(id)a3;
- (_TtC15JournalSettings14TimePickerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (_TtC15JournalSettings14TimePickerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (id)controlValue;
- (id)newControl;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)setAccessibilityIdentifier:(id)a3;
- (void)setAccessibilityLabel:(id)a3;
- (void)setAccessibilityValue:(id)a3;
- (void)setValue:(id)a3;
- (void)willResignActive:(id)a3;
@end

@implementation TimePickerCell

- (_TtC15JournalSettings14TimePickerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  if (a4)
  {
    uint64_t v7 = sub_145BC0();
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v9 = 0;
  }
  id v10 = a5;
  sub_12A3B8(a3, v7, v9, a5);
  return result;
}

- (_TtC15JournalSettings14TimePickerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)sub_145BC0();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtC15JournalSettings14TimePickerCell *)sub_12A994(a3, (uint64_t)a4, v6);
}

- (_TtC15JournalSettings14TimePickerCell)initWithCoder:(id)a3
{
  return 0;
}

- (id)newControl
{
  id v3 = objc_allocWithZone((Class)UIDatePicker);
  v4 = self;
  id v5 = [v3 init];
  [v5 setDatePickerMode:0];
  [v5 setPreferredDatePickerStyle:2];

  return v5;
}

- (id)controlValue
{
  v2 = self;
  id result = [(TimePickerCell *)v2 control];
  if (result)
  {
    id v4 = result;
    self;
    id v5 = [(id)swift_dynamicCastObjCClassUnconditional() date];

    uint64_t v13 = sub_145230();
    sub_484D0(v12);
    sub_1451E0();

    uint64_t v6 = v13;
    if (v13)
    {
      uint64_t v7 = sub_2F114(v12, v13);
      uint64_t v8 = *(void *)(v6 - 8);
      __chkstk_darwin(v7);
      id v10 = (char *)v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v8 + 16))(v10);
      v11 = (void *)sub_146B80();
      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v6);
      sub_C7FC((uint64_t)v12);
    }
    else
    {
      v11 = 0;
    }
    return v11;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)setValue:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_1466A0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    id v5 = self;
  }
  sub_12AEB4((uint64_t)v6);

  sub_1248C((uint64_t)v6, &qword_19B1E0);
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for TimePickerCell();
  id v4 = a3;
  id v5 = v6.receiver;
  [(TimePickerCell *)&v6 refreshCellContentsWithSpecifier:v4];
  objc_msgSend(v5, "setNeedsUpdateConfiguration", v6.receiver, v6.super_class);
}

- (UILabel)textLabel
{
  return (UILabel *)0;
}

- (UILabel)detailTextLabel
{
  return (UILabel *)0;
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = sub_1457B0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1457A0();
  uint64_t v8 = self;
  sub_12B108((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (NSString)accessibilityIdentifier
{
  return (NSString *)sub_12BB78(self, (uint64_t)a2, (void (*)(void))sub_12B9B0);
}

- (void)setAccessibilityIdentifier:(id)a3
{
}

- (NSString)accessibilityLabel
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for TimePickerCell();
  v2 = (char *)v6.receiver;
  id v3 = [(TimePickerCell *)&v6 accessibilityLabel];
  if (v3
    || (id v3 = (NSString *)objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC15JournalSettings14TimePickerCell_listContentView], "accessibilityLabel", v6.receiver, v6.super_class)) != 0)
  {
    sub_145BC0();

    NSString v4 = sub_145B80();
    swift_bridgeObjectRelease();
  }
  else
  {

    NSString v4 = 0;
  }

  return (NSString *)v4;
}

- (void)setAccessibilityLabel:(id)a3
{
}

- (NSString)accessibilityValue
{
  return (NSString *)sub_12BB78(self, (uint64_t)a2, (void (*)(void))sub_12BBF8);
}

- (void)setAccessibilityValue:(id)a3
{
}

- (void)willResignActive:(id)a3
{
  uint64_t v4 = sub_144AF0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_144AC0();
  uint64_t v8 = self;
  id v9 = [(TimePickerCell *)v8 control];
  if (v9)
  {
    id v10 = v9;
    self;
    [(id)swift_dynamicCastObjCClassUnconditional() setDatePickerMode:1];

    id v11 = [(TimePickerCell *)v8 control];
    if (v11)
    {
      v12 = v11;
      self;
      [(id)swift_dynamicCastObjCClassUnconditional() setDatePickerMode:0];

      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

- (void).cxx_destruct
{
  id v3 = *(void **)&self->PSControlTableCell_opaque[OBJC_IVAR____TtC15JournalSettings14TimePickerCell_listContentView];
}

@end