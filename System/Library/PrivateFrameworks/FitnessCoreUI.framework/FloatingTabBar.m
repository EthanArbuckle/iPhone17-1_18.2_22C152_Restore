@interface FloatingTabBar
- (CGSize)intrinsicContentSize;
- (_TtC13FitnessCoreUI14FloatingTabBar)initWithCoder:(id)a3;
- (_TtC13FitnessCoreUI14FloatingTabBar)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation FloatingTabBar

- (CGSize)intrinsicContentSize
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v3 = self;
  double v4 = sub_24EE8F738();
  double v6 = v5;
  swift_release();

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (_TtC13FitnessCoreUI14FloatingTabBar)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  FloatingTabBar.init(frame:)(x, y, width, height);
  double v8 = v7;
  swift_release();
  return v8;
}

- (_TtC13FitnessCoreUI14FloatingTabBar)initWithCoder:(id)a3
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v4 = a3;
  double v5 = (_TtC13FitnessCoreUI14FloatingTabBar *)_s13FitnessCoreUI14FloatingTabBarC5coderACSgSo7NSCoderC_tcfc_0();
  swift_release();
  return v5;
}

- (void)layoutSubviews
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v3 = self;
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for FloatingTabBar();
  [(FloatingTabBar *)&v4 layoutSubviews];
  sub_24EE91410(0);
  swift_release();

  swift_release();
}

- (void).cxx_destruct
{
  sub_24EE96F54((uint64_t)self + OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_animationAnchor));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_backgroundVisuallEffectView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_accessibleContentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_contentGestureRecognizer));

  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC13FitnessCoreUI14FloatingTabBar_standardContentView);
}

@end