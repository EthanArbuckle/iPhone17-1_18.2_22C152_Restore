@interface LockupMediaView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC22SubscribePageExtension15LockupMediaView)init;
- (_TtC22SubscribePageExtension15LockupMediaView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension15LockupMediaView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation LockupMediaView

- (_TtC22SubscribePageExtension15LockupMediaView)init
{
  return (_TtC22SubscribePageExtension15LockupMediaView *)sub_100654D34();
}

- (_TtC22SubscribePageExtension15LockupMediaView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100659144();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10065526C();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  double v4 = sub_100655658();
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (_TtC22SubscribePageExtension15LockupMediaView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC22SubscribePageExtension15LockupMediaView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  id v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension15LockupMediaView_imageViewReusePool;
  uint64_t v4 = sub_10000FB44(&qword_100955450);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectWeakDestroy();
  double v5 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension15LockupMediaView_metrics;
  uint64_t v6 = sub_10075B870();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  objc_release(*(id *)&self->screenshotsDisplayConfiguration[OBJC_IVAR____TtC22SubscribePageExtension15LockupMediaView_screenshotsDisplayConfiguration
                                                           + 24]);
  swift_release();
  double v7 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension15LockupMediaView_screenshotsDisplayStyle;
  uint64_t v8 = sub_10075F490();
  v9 = *(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8);

  v9(v7, v8);
}

@end