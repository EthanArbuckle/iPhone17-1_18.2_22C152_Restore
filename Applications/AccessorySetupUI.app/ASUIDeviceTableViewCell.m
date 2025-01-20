@interface ASUIDeviceTableViewCell
- (_TtC16AccessorySetupUI23ASUIDeviceTableViewCell)initWithCoder:(id)a3;
- (_TtC16AccessorySetupUI23ASUIDeviceTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)awakeFromNib;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation ASUIDeviceTableViewCell

- (void)awakeFromNib
{
  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for ASUIDeviceTableViewCell();
  [(ASUIDeviceTableViewCell *)&v2 awakeFromNib];
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ASUIDeviceTableViewCell();
  [(ASUIDeviceTableViewCell *)&v6 setSelected:v5 animated:v4];
}

- (_TtC16AccessorySetupUI23ASUIDeviceTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC16AccessorySetupUI23ASUIDeviceTableViewCell_device) = 0;
    NSString v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC16AccessorySetupUI23ASUIDeviceTableViewCell_device) = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for ASUIDeviceTableViewCell();
  v7 = [(ASUIDeviceTableViewCell *)&v9 initWithStyle:a3 reuseIdentifier:v6];

  return v7;
}

- (_TtC16AccessorySetupUI23ASUIDeviceTableViewCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC16AccessorySetupUI23ASUIDeviceTableViewCell_device) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ASUIDeviceTableViewCell();
  return [(ASUIDeviceTableViewCell *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16AccessorySetupUI23ASUIDeviceTableViewCell_device));
}

@end