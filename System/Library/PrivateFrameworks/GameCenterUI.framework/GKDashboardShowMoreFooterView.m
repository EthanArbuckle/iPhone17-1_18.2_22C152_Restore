@interface GKDashboardShowMoreFooterView
- (BOOL)canBecomeFocused;
- (NSString)showMoreText;
- (_TtC12GameCenterUI29GKDashboardShowMoreFooterView)initWithCoder:(id)a3;
- (_TtC12GameCenterUI29GKDashboardShowMoreFooterView)initWithFrame:(CGRect)a3;
- (id)actionHandler;
- (void)didTap:(id)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)setActionHandler:(id)a3;
- (void)setShowMoreText:(id)a3;
@end

@implementation GKDashboardShowMoreFooterView

- (_TtC12GameCenterUI29GKDashboardShowMoreFooterView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI29GKDashboardShowMoreFooterView *)sub_1AF476CBC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI29GKDashboardShowMoreFooterView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF477378();
}

- (id)actionHandler
{
  uint64_t v2 = GKDashboardShowMoreFooterView.actionHandler.getter();
  if (v2)
  {
    v6[4] = v2;
    v6[5] = v3;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 1107296256;
    v6[2] = sub_1AF3F8B2C;
    v6[3] = &block_descriptor_8;
    v4 = _Block_copy(v6);
    swift_release();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setActionHandler:(id)a3
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
  GKDashboardShowMoreFooterView.actionHandler.setter((uint64_t)v4, v5);
}

- (NSString)showMoreText
{
  GKDashboardShowMoreFooterView.showMoreText.getter();
  if (v2)
  {
    uint64_t v3 = (void *)sub_1AF7AE0A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = 0;
  }

  return (NSString *)v3;
}

- (void)setShowMoreText:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1AF7AE0E0();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v7 = self;
  GKDashboardShowMoreFooterView.showMoreText.setter(v4, v6);
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  GKDashboardShowMoreFooterView.didUpdateFocus(in:with:)((UIFocusUpdateContext)v6, (UIFocusAnimationCoordinator)v7);
}

- (void)layoutSubviews
{
  uint64_t v2 = self;
  GKDashboardShowMoreFooterView.layoutSubviews()();
}

- (void)didTap:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1AF478144();
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  sub_1AF36A648(0, &qword_1E9AC6CD8);
  sub_1AF478308();
  uint64_t v6 = sub_1AF7AE4E0();
  id v7 = a4;
  v8 = self;
  GKDashboardShowMoreFooterView.pressesEnded(_:with:)(v6, (uint64_t)a4);

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI29GKDashboardShowMoreFooterView_label));
  sub_1AF368930(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC12GameCenterUI29GKDashboardShowMoreFooterView_actionHandler));

  swift_bridgeObjectRelease();
}

@end