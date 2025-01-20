@interface HUBaseIconView
- (CGSize)intrinsicContentSize;
- (HUBaseIconView)initWithCoder:(id)a3;
- (HUBaseIconView)initWithFrame:(CGRect)a3;
- (HUBaseIconViewConfiguration)configuration;
- (HUBaseIconViewDelegate)delegate;
- (void)prepareForTransitionToTargetViewState:(int64_t)a3;
- (void)setConfiguration:(id)a3;
- (void)setDelegate:(id)a3;
- (void)startTransitionToTargetViewState:(int64_t)a3;
- (void)updateConstraints;
@end

@implementation HUBaseIconView

- (HUBaseIconViewConfiguration)configuration
{
  v2 = self;
  v3 = BaseIconView.__configuration.getter();

  return (HUBaseIconViewConfiguration *)v3;
}

- (void)setConfiguration:(id)a3
{
  id v5 = a3;
  v6 = self;
  BaseIconView.__configuration.setter((uint64_t)a3);
}

- (HUBaseIconViewDelegate)delegate
{
  v2 = (char *)self + OBJC_IVAR___HUBaseIconView_delegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x1C1898E00](v2);

  return (HUBaseIconViewDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  sub_1BE515D44();
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)updateConstraints
{
  v2 = self;
  sub_1BE516880();
}

- (HUBaseIconView)initWithFrame:(CGRect)a3
{
  return (HUBaseIconView *)BaseIconView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (HUBaseIconView)initWithCoder:(id)a3
{
  return (HUBaseIconView *)BaseIconView.init(coder:)(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  sub_1BE4983BC((uint64_t)self + OBJC_IVAR___HUBaseIconView_configuration, (uint64_t)v3);
  sub_1BE3E87B0(v3, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_1BE3B20A4);
  sub_1BE37E904((uint64_t)self + OBJC_IVAR___HUBaseIconView_delegate);
}

- (void)startTransitionToTargetViewState:(int64_t)a3
{
  double v4 = self;
  BaseIconView.startTransition(targetAppearance:)(a3);
}

- (void)prepareForTransitionToTargetViewState:(int64_t)a3
{
  double v4 = self;
  BaseIconView.prepareForTransition(targetAppearance:)(a3);
}

@end