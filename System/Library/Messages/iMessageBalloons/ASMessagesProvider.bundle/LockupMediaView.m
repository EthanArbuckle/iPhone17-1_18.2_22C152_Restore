@interface LockupMediaView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC18ASMessagesProvider15LockupMediaView)init;
- (_TtC18ASMessagesProvider15LockupMediaView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider15LockupMediaView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation LockupMediaView

- (_TtC18ASMessagesProvider15LockupMediaView)init
{
  return (_TtC18ASMessagesProvider15LockupMediaView *)sub_5651C0();
}

- (_TtC18ASMessagesProvider15LockupMediaView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_568444();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_5656F8();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  double v4 = sub_565AC4();
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (_TtC18ASMessagesProvider15LockupMediaView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC18ASMessagesProvider15LockupMediaView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  id v3 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider15LockupMediaView_imageViewReusePool;
  uint64_t v4 = sub_FD50(&qword_96E5C8);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectWeakDestroy();
  double v5 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider15LockupMediaView_metrics;
  uint64_t v6 = sub_771870();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  objc_release(*(id *)&self->screenshotsDisplayConfiguration[OBJC_IVAR____TtC18ASMessagesProvider15LockupMediaView_screenshotsDisplayConfiguration
                                                           + 24]);
  swift_release();
  double v7 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider15LockupMediaView_screenshotsDisplayStyle;
  uint64_t v8 = sub_7754D0();
  v9 = *(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8);

  v9(v7, v8);
}

@end