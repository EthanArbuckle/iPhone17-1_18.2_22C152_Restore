@interface FloatingTabBarContentView
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (_TtC13FitnessCoreUI25FloatingTabBarContentView)initWithCoder:(id)a3;
- (_TtC13FitnessCoreUI25FloatingTabBarContentView)initWithFrame:(CGRect)a3;
- (void)handleSelectionGesture:(id)a3;
- (void)layoutSubviews;
@end

@implementation FloatingTabBarContentView

- (_TtC13FitnessCoreUI25FloatingTabBarContentView)initWithCoder:(id)a3
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v4 = a3;
  v5 = (_TtC13FitnessCoreUI25FloatingTabBarContentView *)sub_24EEB5018();
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
  sub_24EEA9D3C();
  swift_release();
}

- (void)handleSelectionGesture:(id)a3
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v5 = a3;
  v6 = self;
  sub_24EEB08DC(v5);
  swift_release();
}

- (_TtC13FitnessCoreUI25FloatingTabBarContentView)initWithFrame:(CGRect)a3
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  result = (_TtC13FitnessCoreUI25FloatingTabBarContentView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_24EE96F54((uint64_t)self + OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_delegate);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_collectionView));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_layoutProvider);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_selectionGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_selectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13FitnessCoreUI25FloatingTabBarContentView_dataSource));
  swift_bridgeObjectRelease();
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v5 = a3;
  v6 = self;
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }

  swift_release();
  swift_release();

  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }

  swift_release();
  swift_release();

  return 0;
}

@end