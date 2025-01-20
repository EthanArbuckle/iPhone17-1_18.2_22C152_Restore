@interface SiriTipUIView
- (BOOL)isPresented;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC17_AppIntents_UIKit13SiriTipUIView)initWithCoder:(id)a3;
- (_TtC17_AppIntents_UIKit13SiriTipUIView)initWithFrame:(CGRect)a3;
- (void)didMoveToWindow;
- (void)setIsPresented:(BOOL)a3;
@end

@implementation SiriTipUIView

- (BOOL)isPresented
{
  return SiriTipUIView.isPresented.getter() & 1;
}

- (void)setIsPresented:(BOOL)a3
{
  v4 = self;
  SiriTipUIView.isPresented.setter(a3);
}

- (_TtC17_AppIntents_UIKit13SiriTipUIView)initWithCoder:(id)a3
{
  return 0;
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  SiriTipUIView.intrinsicContentSize.getter();
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  double v5 = self;
  CGSize v6 = SiriTipUIView.sizeThatFits(_:)((CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width));

  double v7 = v6.width;
  double v8 = v6.height;
  result.CGFloat height = v8;
  result.CGFloat width = v7;
  return result;
}

- (void)didMoveToWindow
{
  v2 = self;
  SiriTipUIView.didMoveToWindow()();
}

- (_TtC17_AppIntents_UIKit13SiriTipUIView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  double v3 = (char *)self + OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_style;
  sub_22F3BD4E8();
  OUTLINED_FUNCTION_2_1();
  (*(void (**)(char *))(v4 + 8))(v3);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_hostingView));
  swift_bridgeObjectRelease();
  uint64_t v5 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_phraseFetchBlock);

  sub_22F3A272C(v5);
}

@end