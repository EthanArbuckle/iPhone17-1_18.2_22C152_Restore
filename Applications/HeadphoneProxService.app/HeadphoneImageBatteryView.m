@interface HeadphoneImageBatteryView
- (_TtC20HeadphoneProxService25HeadphoneImageBatteryView)initWithCoder:(id)a3;
- (_TtC20HeadphoneProxService25HeadphoneImageBatteryView)initWithFrame:(CGRect)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation HeadphoneImageBatteryView

- (_TtC20HeadphoneProxService25HeadphoneImageBatteryView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC20HeadphoneProxService25HeadphoneImageBatteryView_stackView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC20HeadphoneProxService25HeadphoneImageBatteryView_AXConstraints) = (Class)_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC20HeadphoneProxService25HeadphoneImageBatteryView_nonAXConstraints) = (Class)_swiftEmptyArrayStorage;
  id v4 = a3;

  result = (_TtC20HeadphoneProxService25HeadphoneImageBatteryView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_100024734(a3);
}

- (_TtC20HeadphoneProxService25HeadphoneImageBatteryView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20HeadphoneProxService25HeadphoneImageBatteryView_batteryView));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20HeadphoneProxService25HeadphoneImageBatteryView_stackView));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end