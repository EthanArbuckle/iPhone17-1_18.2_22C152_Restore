@interface LabelledBatteryView
- (_TtC20HeadphoneProxService19LabelledBatteryView)initWithCoder:(id)a3;
- (_TtC20HeadphoneProxService19LabelledBatteryView)initWithFrame:(CGRect)a3;
@end

@implementation LabelledBatteryView

- (_TtC20HeadphoneProxService19LabelledBatteryView)initWithCoder:(id)a3
{
  result = (_TtC20HeadphoneProxService19LabelledBatteryView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC20HeadphoneProxService19LabelledBatteryView)initWithFrame:(CGRect)a3
{
  result = (_TtC20HeadphoneProxService19LabelledBatteryView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20HeadphoneProxService19LabelledBatteryView_batteryPercentageLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20HeadphoneProxService19LabelledBatteryView_batteryView));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC20HeadphoneProxService19LabelledBatteryView_position);
  uint64_t v4 = *(void *)&self->batteryPercentageLabel[OBJC_IVAR____TtC20HeadphoneProxService19LabelledBatteryView_position];

  sub_100031F48(v3, v4);
}

@end