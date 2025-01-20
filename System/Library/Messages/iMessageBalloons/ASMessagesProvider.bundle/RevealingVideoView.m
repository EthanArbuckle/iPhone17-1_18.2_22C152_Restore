@interface RevealingVideoView
- (_TtC18ASMessagesProvider18RevealingVideoView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider18RevealingVideoView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)willMoveToWindow:(id)a3;
@end

@implementation RevealingVideoView

- (_TtC18ASMessagesProvider18RevealingVideoView)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider18RevealingVideoView *)sub_24F4F4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider18RevealingVideoView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_2513E0();
}

- (void)willMoveToWindow:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_24FA88((uint64_t)a3);
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RevealingVideoView();
  id v2 = v3.receiver;
  [(RevealingVideoView *)&v3 layoutSubviews];
  sub_24FF5C();
  sub_250470();
  sub_2505C8();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_6A000((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider18RevealingVideoView_pageGrid);
  sub_174B8((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider18RevealingVideoView_mirrorDelegate);
  swift_unknownObjectWeakDestroy();

  swift_unknownObjectWeakDestroy();
}

@end