@interface GKAddFriendsLockupView
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC12GameCenterUI22GKAddFriendsLockupView)initWithCoder:(id)a3;
- (_TtC12GameCenterUI22GKAddFriendsLockupView)initWithFrame:(CGRect)a3;
- (_TtC12GameCenterUI22GKAddFriendsLockupView)initWithFrame:(CGRect)a3 friendState:(int64_t)a4 metricsPageId:(id)a5 metricsPageType:(id)a6;
- (id)addFriendsHandler;
- (void)didTapButton:(id)a3;
- (void)layoutSubviews;
- (void)setAddFriendsHandler:(id)a3;
@end

@implementation GKAddFriendsLockupView

- (_TtC12GameCenterUI22GKAddFriendsLockupView)initWithFrame:(CGRect)a3 friendState:(int64_t)a4 metricsPageId:(id)a5 metricsPageType:(id)a6
{
  uint64_t v7 = sub_1AF7AE0E0();
  uint64_t v9 = v8;
  uint64_t v10 = sub_1AF7AE0E0();
  return (_TtC12GameCenterUI22GKAddFriendsLockupView *)GKAddFriendsLockupView.init(frame:friendState:metricsPageId:metricsPageType:)(a4, v7, v9, v10, v11);
}

- (_TtC12GameCenterUI22GKAddFriendsLockupView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF38744C();
}

- (id)addFriendsHandler
{
  uint64_t v2 = GKAddFriendsLockupView.addFriendsHandler.getter();
  if (v2)
  {
    v6[4] = v2;
    v6[5] = v3;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 1107296256;
    v6[2] = sub_1AF3F8B2C;
    v6[3] = &block_descriptor_13;
    v4 = _Block_copy(v6);
    swift_release();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setAddFriendsHandler:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_1AF388384;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = self;
  GKAddFriendsLockupView.addFriendsHandler.setter((uint64_t)v4, v5);
}

- (void)layoutSubviews
{
  uint64_t v2 = self;
  GKAddFriendsLockupView.layoutSubviews()();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double width = a3.width;
  swift_unknownObjectRetain();
  v6 = self;
  double v7 = GKAddFriendsLockupView.measurements(fitting:in:)(width);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  swift_unknownObjectRelease();

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.var3 = v17;
  result.var2 = v16;
  result.var1 = v15;
  result.var0 = v14;
  return result;
}

- (void)didTapButton:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1AF7AEB60();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    uint64_t v5 = self;
  }
  sub_1AF387D84();

  sub_1AF36A4F0((uint64_t)v6);
}

- (_TtC12GameCenterUI22GKAddFriendsLockupView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI22GKAddFriendsLockupView_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI22GKAddFriendsLockupView_textLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI22GKAddFriendsLockupView_button));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC12GameCenterUI22GKAddFriendsLockupView_addFriendsHandler);

  sub_1AF368930(v3);
}

@end