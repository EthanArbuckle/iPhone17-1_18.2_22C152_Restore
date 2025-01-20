@interface DeviceSelectorCell
- (_TtC11Diagnostics18DeviceSelectorCell)initWithCoder:(id)a3;
- (_TtC11Diagnostics18DeviceSelectorCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)layoutSubviews;
@end

@implementation DeviceSelectorCell

- (void)layoutSubviews
{
  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for DeviceSelectorCell();
  [(CardViewCell *)&v2 layoutSubviews];
}

- (_TtC11Diagnostics18DeviceSelectorCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtC11Diagnostics18DeviceSelectorCell *)sub_1000C3494(a3, (uint64_t)a4, v6);
}

- (_TtC11Diagnostics18DeviceSelectorCell)initWithCoder:(id)a3
{
  return (_TtC11Diagnostics18DeviceSelectorCell *)sub_1000C35CC(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics18DeviceSelectorCell_deviceViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics18DeviceSelectorCell_dedDevice));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC11Diagnostics18DeviceSelectorCell_deviceInformationView);
}

@end