@interface DBMulticastLabel
- (CGSize)intrinsicContentSize;
- (_TtC9DashBoard16DBMulticastLabel)initWithCoder:(id)a3;
- (_TtC9DashBoard16DBMulticastLabel)initWithFrame:(CGRect)a3;
- (_TtC9DashBoard16DBMulticastLabel)initWithMulticast:(id)a3;
@end

@implementation DBMulticastLabel

- (_TtC9DashBoard16DBMulticastLabel)initWithMulticast:(id)a3
{
  return (_TtC9DashBoard16DBMulticastLabel *)DBMulticastLabel.init(multicast:)();
}

- (_TtC9DashBoard16DBMulticastLabel)initWithCoder:(id)a3
{
  result = (_TtC9DashBoard16DBMulticastLabel *)sub_22D85EA28();
  __break(1u);
  return result;
}

- (CGSize)intrinsicContentSize
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9DashBoard16DBMulticastLabel_label), sel_intrinsicContentSize);
  result.height = v3;
  result.width = v2;
  return result;
}

- (_TtC9DashBoard16DBMulticastLabel)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC9DashBoard16DBMulticastLabel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end