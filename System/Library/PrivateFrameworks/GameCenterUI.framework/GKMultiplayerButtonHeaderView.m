@interface GKMultiplayerButtonHeaderView
- (CGSize)sizeThatFits:(CGSize)a3;
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC12GameCenterUI29GKMultiplayerButtonHeaderView)initWithCancelButtonHandler:(id)a3;
- (_TtC12GameCenterUI29GKMultiplayerButtonHeaderView)initWithCoder:(id)a3;
- (_TtC12GameCenterUI29GKMultiplayerButtonHeaderView)initWithFrame:(CGRect)a3;
- (_TtC12GameCenterUI29GKMultiplayerButtonHeaderView)initWithMinimumValue:(int64_t)a3 maximumValue:(int64_t)a4 initialValue:(int64_t)a5 cancelButtonHandler:(id)a6;
- (void)applyGame:(id)a3;
- (void)cancelPressed:(id)a3;
- (void)layoutSubviews;
- (void)updateCountWithMinPlayers:(int64_t)a3 maxPlayers:(int64_t)a4;
- (void)wantsMaterialBackgroundWithScrollOffset:(double)a3;
@end

@implementation GKMultiplayerButtonHeaderView

- (_TtC12GameCenterUI29GKMultiplayerButtonHeaderView)initWithCancelButtonHandler:(id)a3
{
  v3 = _Block_copy(a3);
  if (v3)
  {
    v4 = v3;
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v3 = sub_1AF3FA888;
  }
  else
  {
    uint64_t v5 = 0;
  }
  return (_TtC12GameCenterUI29GKMultiplayerButtonHeaderView *)GKMultiplayerButtonHeaderView.init(cancelButtonHandler:)((uint64_t)v3, v5);
}

- (_TtC12GameCenterUI29GKMultiplayerButtonHeaderView)initWithMinimumValue:(int64_t)a3 maximumValue:(int64_t)a4 initialValue:(int64_t)a5 cancelButtonHandler:(id)a6
{
  v8 = _Block_copy(a6);
  if (v8)
  {
    v10 = v8;
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = v10;
    v12 = sub_1AF388384;
  }
  else
  {
    v12 = 0;
    uint64_t v11 = 0;
  }
  return (_TtC12GameCenterUI29GKMultiplayerButtonHeaderView *)GKMultiplayerButtonHeaderView.init(minimumValue:maximumValue:initialValue:cancelButtonHandler:)(a3, a4, v9, (uint64_t)v12, v11);
}

- (_TtC12GameCenterUI29GKMultiplayerButtonHeaderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF3F95B8();
}

- (void)wantsMaterialBackgroundWithScrollOffset:(double)a3
{
  v4 = self;
  GKMultiplayerButtonHeaderView.wantsMaterialBackground(scrollOffset:)(a3);
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double width = a3.width;
  swift_getObjectType();
  swift_unknownObjectRetain();
  v7 = self;
  double v8 = sub_1AF3FA480((uint64_t)a4, (char *)v7, width);
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  swift_unknownObjectRelease();

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.var3 = v18;
  result.var2 = v17;
  result.var1 = v16;
  result.var0 = v15;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  uint64_t v5 = self;
  CGSize v6 = GKMultiplayerButtonHeaderView.sizeThatFits(_:)((CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width));

  double v7 = v6.width;
  double v8 = v6.height;
  result.CGFloat height = v8;
  result.CGFloat width = v7;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  GKMultiplayerButtonHeaderView.layoutSubviews()();
}

- (void)applyGame:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  GKMultiplayerButtonHeaderView.apply(game:)(v4);
}

- (void)updateCountWithMinPlayers:(int64_t)a3 maxPlayers:(int64_t)a4
{
  CGSize v6 = self;
  GKMultiplayerButtonHeaderView.updateCount(minPlayers:maxPlayers:)(a3, a4);
}

- (void)cancelPressed:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_1AF7AEB60();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    uint64_t v5 = self;
  }
  sub_1AF3FA258();

  sub_1AF36A4F0((uint64_t)v6);
}

- (_TtC12GameCenterUI29GKMultiplayerButtonHeaderView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI29GKMultiplayerButtonHeaderView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI29GKMultiplayerButtonHeaderView_playerCountLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI29GKMultiplayerButtonHeaderView_iconView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI29GKMultiplayerButtonHeaderView_cancelButton));
  sub_1AF368930(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC12GameCenterUI29GKMultiplayerButtonHeaderView_cancelButtonHandler));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI29GKMultiplayerButtonHeaderView_backgroundView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12GameCenterUI29GKMultiplayerButtonHeaderView_bottomSeparator);
}

@end