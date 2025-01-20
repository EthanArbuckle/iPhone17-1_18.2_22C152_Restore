@interface CAFUIDevicePickerDetailTableCell
- (_TtC5CAFUI32CAFUIDevicePickerDetailTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)prepareForReuse;
@end

@implementation CAFUIDevicePickerDetailTableCell

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CAFUIDevicePickerDetailTableCell();
  v2 = v3.receiver;
  [(CAFUITableCell *)&v3 prepareForReuse];
  v2[OBJC_IVAR____TtC5CAFUI32CAFUIDevicePickerDetailTableCell_isEnabled] = 1;
}

- (_TtC5CAFUI32CAFUIDevicePickerDetailTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    *((unsigned char *)&self->super.super.super.super.super.isa
    + OBJC_IVAR____TtC5CAFUI32CAFUIDevicePickerDetailTableCell_isEnabled) = 1;
    v7 = (void *)MEMORY[0x24C59F610](v6);
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = 0;
    *((unsigned char *)&self->super.super.super.super.super.isa
    + OBJC_IVAR____TtC5CAFUI32CAFUIDevicePickerDetailTableCell_isEnabled) = 1;
  }
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for CAFUIDevicePickerDetailTableCell();
  v8 = [(CAFUITableCell *)&v10 initWithStyle:a3 reuseIdentifier:v7];

  return v8;
}

@end