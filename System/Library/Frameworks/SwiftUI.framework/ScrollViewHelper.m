@interface ScrollViewHelper
- (BOOL)scrollViewShouldScrollToTop:(id)a3;
- (_TtC7SwiftUI16ScrollViewHelper)init;
- (void)_updateCycleIdleUntil:(unint64_t)a3;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
@end

@implementation ScrollViewHelper

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  outlined destroy of ScrollEnvironmentProperties((uint64_t)self + OBJC_IVAR____TtC7SwiftUI16ScrollViewHelper_properties);
  swift_release();
  outlined destroy of weak FallbackResponderProvider?((uint64_t)self + OBJC_IVAR____TtC7SwiftUI16ScrollViewHelper_delegate);

  swift_unknownObjectWeakDestroy();
}

- (_TtC7SwiftUI16ScrollViewHelper)init
{
  result = (_TtC7SwiftUI16ScrollViewHelper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = a3;
  v5 = self;
  ScrollViewHelper.willStartPanning()();
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  CGPoint targetOffset = *a5;
  id v9 = a3;
  v10 = self;
  ScrollViewHelper.mayEndPanning(velocity:targetOffset:)((CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x), &targetOffset);
  *a5 = targetOffset;
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  ScrollViewHelper.didEndPanning(willDecelerate:)(a4);
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC7SwiftUI16ScrollViewHelper_lastPhase) = 0;
  id v4 = a3;
  v7 = self;
  ScrollViewHelper.updateGraphState(isPreferred:)(0);
  v5 = (Class *)((char *)&v7->super.isa + OBJC_IVAR____TtC7SwiftUI16ScrollViewHelper_decelerationBias);
  void *v5 = 0;
  v5[1] = 0;
  id v6 = (char *)v7 + OBJC_IVAR____TtC7SwiftUI16ScrollViewHelper_lastTargetOffsetState;
  *(_OWORD *)id v6 = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  *((_WORD *)v6 + 16) = 2;
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC7SwiftUI16ScrollViewHelper_isAnimationCheckPending) = 1;
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC7SwiftUI16ScrollViewHelper_lastPhase) = 0;
  id v4 = a3;
  v5 = self;
  ScrollViewHelper.updateGraphState(isPreferred:)(0);
}

- (BOOL)scrollViewShouldScrollToTop:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC7SwiftUI16ScrollViewHelper_delegate;
  if (!MEMORY[0x18C119DF0]((char *)self + OBJC_IVAR____TtC7SwiftUI16ScrollViewHelper_delegate, a2)) {
    return 1;
  }
  uint64_t v6 = *((void *)v5 + 1);
  uint64_t ObjectType = swift_getObjectType();
  v8 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 24);
  id v9 = a3;
  v10 = self;
  LOBYTE(v6) = v8(ObjectType, v6);

  swift_unknownObjectRelease();
  return (v6 & 1) == 0;
}

- (void)_updateCycleIdleUntil:(unint64_t)a3
{
  id v4 = self;
  ScrollViewHelper._updateCycleIdle(until:)(a3);
}

@end