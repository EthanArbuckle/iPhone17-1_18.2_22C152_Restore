@interface LiveCallDurationView
- (BOOL)isHidden;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)accessibilityLabel;
- (_TtC15ConversationKit20LiveCallDurationView)initWithCoder:(id)a3;
- (_TtC15ConversationKit20LiveCallDurationView)initWithFrame:(CGRect)a3;
- (double)alpha;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setAccessibilityLabel:(id)a3;
- (void)setAlpha:(double)a3;
- (void)setHidden:(BOOL)a3;
@end

@implementation LiveCallDurationView

- (void)dealloc
{
  v2 = self;
  LiveCallDurationView.__deallocating_deinit();
}

- (void).cxx_destruct
{
}

- (_TtC15ConversationKit20LiveCallDurationView)initWithFrame:(CGRect)a3
{
}

- (_TtC15ConversationKit20LiveCallDurationView)initWithCoder:(id)a3
{
}

- (NSString)accessibilityLabel
{
  v2 = self;
  uint64_t v3 = LiveCallDurationView.accessibilityLabel.getter();
  uint64_t v5 = v4;

  if (v5)
  {
    v6 = (void *)MEMORY[0x1C87730B0](v3, v5);
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  return (NSString *)v6;
}

- (void)setAccessibilityLabel:(id)a3
{
  if (a3)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v7 = self;
  LiveCallDurationView.accessibilityLabel.setter(v4, v6);
}

- (double)alpha
{
  v2 = self;
  LiveCallDurationView.alpha.getter();
  double v4 = v3;

  return v4;
}

- (void)setAlpha:(double)a3
{
  double v4 = self;
  LiveCallDurationView.alpha.setter(a3);
}

- (BOOL)isHidden
{
  v2 = self;
  unsigned __int8 v3 = LiveCallDurationView.isHidden.getter();

  return v3 & 1;
}

- (void)setHidden:(BOOL)a3
{
  double v4 = self;
  LiveCallDurationView.isHidden.setter(a3);
}

- (void)didMoveToWindow
{
  v2 = self;
  LiveCallDurationView.didMoveToWindow()();
}

- (void)layoutSubviews
{
  v2 = self;
  LiveCallDurationView.layoutSubviews()();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  uint64_t v5 = self;
  CGSize v6 = LiveCallDurationView.sizeThatFits(_:)((CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width));

  double v7 = v6.width;
  double v8 = v6.height;
  result.CGFloat height = v8;
  result.CGFloat width = v7;
  return result;
}

@end