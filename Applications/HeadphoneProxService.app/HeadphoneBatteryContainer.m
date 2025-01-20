@interface HeadphoneBatteryContainer
- (_TtC20HeadphoneProxService25HeadphoneBatteryContainer)initWithCoder:(id)a3;
- (_TtC20HeadphoneProxService25HeadphoneBatteryContainer)initWithFrame:(CGRect)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateConstraints;
@end

@implementation HeadphoneBatteryContainer

- (void)updateConstraints
{
  v2 = self;
  sub_1000849F8();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1000858F8((uint64_t)a3);
}

- (_TtC20HeadphoneProxService25HeadphoneBatteryContainer)initWithFrame:(CGRect)a3
{
  return (_TtC20HeadphoneProxService25HeadphoneBatteryContainer *)sub_100085AB4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20HeadphoneProxService25HeadphoneBatteryContainer)initWithCoder:(id)a3
{
  return (_TtC20HeadphoneProxService25HeadphoneBatteryContainer *)sub_100085C10(a3);
}

- (void).cxx_destruct
{
  sub_100023048((uint64_t)self + OBJC_IVAR____TtC20HeadphoneProxService25HeadphoneBatteryContainer_layoutMetrics, (uint64_t)v2);
  sub_1000230C8(v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end