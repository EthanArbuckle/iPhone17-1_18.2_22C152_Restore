@interface HostingScrollView
+ (BOOL)_isFromSwiftUI;
- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild;
- (BOOL)_shouldScrollToContentBeginningInRightToLeft;
- (CGRect)bounds;
- (CGRect)frame;
- (_TtC7SwiftUI17HostingScrollView)initWithCoder:(id)a3;
- (_TtC7SwiftUI17HostingScrollView)initWithFrame:(CGRect)a3;
- (id)_focusScrollBoundaryMetricsForItem:(id)a3;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setBounds:(CGRect)a3;
- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4;
- (void)setFrame:(CGRect)a3;
@end

@implementation HostingScrollView

- (CGRect)bounds
{
  @objc HostingScrollView.PlatformContainer.frame.getter(self, (uint64_t)a2, (SEL *)&selRef_bounds);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)frame
{
  @objc HostingScrollView.PlatformContainer.frame.getter(self, (uint64_t)a2, (SEL *)&selRef_frame);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v28.receiver = self;
  v28.super_class = ObjectType;
  v9 = self;
  [(HostingScrollView *)&v28 frame];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  v27.receiver = v9;
  v27.super_class = ObjectType;
  -[HostingScrollView setFrame:](&v27, sel_setFrame_, x, y, width, height);
  v26.receiver = v9;
  v26.super_class = ObjectType;
  [(HostingScrollView *)&v26 bounds];
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  v25.receiver = v9;
  v25.super_class = ObjectType;
  [(HostingScrollView *)&v25 bounds];
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  v24.receiver = v9;
  v24.super_class = ObjectType;
  [(HostingScrollView *)&v24 frame];
  v30.size.double width = v22;
  v30.size.double height = v23;
  v29.origin.double x = v15;
  v29.origin.double y = v17;
  v29.size.double width = v11;
  v29.size.double height = v13;
  v30.origin.double x = v19;
  v30.origin.double y = v21;
  ScrollViewHelper.boundsDidChange(oldBounds:newBounds:)(v29, v30);
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  double v2 = (char *)v6.receiver;
  [(HostingScrollView *)&v6 layoutSubviews];
  uint64_t v3 = *(void *)&v2[OBJC_IVAR____TtC7SwiftUI17HostingScrollView_helper]
     + OBJC_IVAR____TtC7SwiftUI16ScrollViewHelper_lastTargetOffsetState;
  __int16 v4 = *(_WORD *)(v3 + 32);
  if (v4 != 2)
  {
    long long v5 = *(_OWORD *)(v3 + 16);
    v7[0] = *(_OWORD *)v3;
    v7[1] = v5;
    __int16 v8 = v4 & 0x101;
    ScrollViewHelper.retargetContentOffsetIfNeeded(state:)((uint64_t)v7);
    *(_OWORD *)uint64_t v3 = 0u;
    *(_OWORD *)(v3 + 16) = 0u;
    *(_WORD *)(v3 + 32) = 2;
  }
}

- (void)didMoveToWindow
{
  double v2 = self;
  HostingScrollView.didMoveToWindow()();
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v11.receiver = self;
  v11.super_class = ObjectType;
  v9 = self;
  [(HostingScrollView *)&v11 bounds];
  v10.receiver = v9;
  v10.super_class = ObjectType;
  -[HostingScrollView setBounds:](&v10, sel_setBounds_, x, y, width, height);
  HostingScrollView.bounds.didset();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7SwiftUI17HostingScrollView_host));
  swift_weakDestroy();
  outlined consume of (@escaping @callee_guaranteed (@guaranteed NSFileWrapper?) -> (@owned NSFileWrapper, @error @owned Error))?(*(uint64_t *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC7SwiftUI17HostingScrollView_onScrollToTopGesture));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7SwiftUI17HostingScrollView_helper));
  outlined consume of HostingScrollViewUpdateContext?(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC7SwiftUI17HostingScrollView_pendingContext), *(void *)((char *)&self->super.super.super.super._responderFlags+ OBJC_IVAR____TtC7SwiftUI17HostingScrollView_pendingContext), *(uint64_t *)((char *)&self->super.super.super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC7SwiftUI17HostingScrollView_pendingContext), *(uint64_t *)((char *)&self->super.super.super._constraintsExceptingSubviewAutoresizingConstraints+ OBJC_IVAR____TtC7SwiftUI17HostingScrollView_pendingContext), *(uint64_t *)((char *)&self->super.super.super._cachedTraitCollection+ OBJC_IVAR____TtC7SwiftUI17HostingScrollView_pendingContext), *(uint64_t *)((char *)&self->super.super.super._swiftAnimationInfo+ OBJC_IVAR____TtC7SwiftUI17HostingScrollView_pendingContext), *(uint64_t *)((char *)&self->super.super.super._traitChangeRegistry+ OBJC_IVAR____TtC7SwiftUI17HostingScrollView_pendingContext), *(uint64_t *)((char *)&self->super.super.super._layerRetained+ OBJC_IVAR____TtC7SwiftUI17HostingScrollView_pendingContext), *(unint64_t *)((char *)&self->super.super.super._subviewCache+ OBJC_IVAR____TtC7SwiftUI17HostingScrollView_pendingContext));
  outlined consume of (@escaping @callee_guaranteed (@guaranteed NSFileWrapper?) -> (@owned NSFileWrapper, @error @owned Error))?(*(uint64_t *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC7SwiftUI17HostingScrollView_animationTarget));
  swift_unknownObjectRelease();
  swift_weakDestroy();
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC7SwiftUI17HostingScrollView_configuration;

  outlined destroy of ScrollViewConfiguration((uint64_t)v3);
}

+ (BOOL)_isFromSwiftUI
{
  return 1;
}

- (_TtC7SwiftUI17HostingScrollView)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized HostingScrollView.init(coder:)();
}

- (BOOL)_shouldScrollToContentBeginningInRightToLeft
{
  double v2 = self;
  char shouldScrollToContentBeginningInRightTo = HostingScrollView._shouldScrollToContentBeginningInRightToLeft.getter();

  return shouldScrollToContentBeginningInRightTo & 1;
}

- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType();
  v7 = (char *)v9.receiver;
  -[HostingScrollView setContentOffset:animated:](&v9, sel_setContentOffset_animated_, v4, x, y);
  if (v4)
  {
    *(unsigned char *)(*(void *)&v7[OBJC_IVAR____TtC7SwiftUI17HostingScrollView_helper]
             + OBJC_IVAR____TtC7SwiftUI16ScrollViewHelper_lastPhase) = 4;
    ScrollViewHelper.updateGraphState(isPreferred:)(0);
  }
  __int16 v8 = (double *)&v7[OBJC_IVAR____TtC7SwiftUI17HostingScrollView_animationOffset];
  *__int16 v8 = x;
  v8[1] = y;
}

- (id)_focusScrollBoundaryMetricsForItem:(id)a3
{
  id v5 = objc_allocWithZone(MEMORY[0x1E4FB2128]);
  swift_unknownObjectRetain();
  objc_super v6 = self;
  id v7 = objc_msgSend(v5, sel_initWithFocusItem_scrollView_, a3, v6);
  if ((objc_msgSend(v7, sel_hasDisprovedAllRelevantAssumptions) & 1) == 0) {
    HostingScrollView.PlatformGroupContainer.updateFocusScrollBoundaryMetrics(_:for:)(v7, a3);
  }
  swift_unknownObjectRelease();

  return v7;
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return 1;
}

- (_TtC7SwiftUI17HostingScrollView)initWithFrame:(CGRect)a3
{
  CGRect result = (_TtC7SwiftUI17HostingScrollView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end