@interface HostingScrollView.PlatformContainer
- (CGRect)bounds;
- (CGRect)frame;
- (UIEdgeInsets)safeAreaInsets;
- (_TtCC7SwiftUI17HostingScrollView17PlatformContainer)initWithCoder:(id)a3;
- (_TtCC7SwiftUI17HostingScrollView17PlatformContainer)initWithFrame:(CGRect)a3;
- (_UIGestureRecognizerContainer)_parentGestureRecognizerContainer;
- (void)_updateSafeAreaInsets;
- (void)setBounds:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
@end

@implementation HostingScrollView.PlatformContainer

- (CGRect)frame
{
  @objc HostingScrollView.PlatformContainer.frame.getter(self, (uint64_t)a2, (SEL *)&selRef_frame);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)bounds
{
  @objc HostingScrollView.PlatformContainer.frame.getter(self, (uint64_t)a2, (SEL *)&selRef_bounds);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (UIEdgeInsets)safeAreaInsets
{
  double v2 = self;
  HostingScrollView.PlatformContainer.safeAreaInsets.getter();
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (void)setBounds:(CGRect)a3
{
}

- (void)setFrame:(CGRect)a3
{
}

- (void)_updateSafeAreaInsets
{
  double v2 = self;
  HostingScrollView.PlatformContainer._updateSafeAreaInsets()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC7SwiftUI17HostingScrollView17PlatformContainer_scrollView));

  swift_release();
}

- (_TtCC7SwiftUI17HostingScrollView17PlatformContainer)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtCC7SwiftUI17HostingScrollView17PlatformContainer_safeAreaHelper;
  type metadata accessor for UIView.SafeAreaHelper();
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = 0u;
  *(_OWORD *)(v6 + 32) = 0u;
  *(unsigned char *)(v6 + 48) = 1;
  *(_OWORD *)(v6 + 56) = 0u;
  *(_OWORD *)(v6 + 72) = 0u;
  *(unsigned char *)(v6 + 88) = 1;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)v6;
  double v7 = (int64x2_t *)((char *)self + OBJC_IVAR____TtCC7SwiftUI17HostingScrollView17PlatformContainer__safeAreaInsets);
  int64x2_t v8 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  *double v7 = v8;
  v7[1] = v8;
  id v9 = a3;

  UIEdgeInsets result = (_TtCC7SwiftUI17HostingScrollView17PlatformContainer *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_UIGestureRecognizerContainer)_parentGestureRecognizerContainer
{
  double v2 = self;
  id v3 = HostingScrollView.PlatformContainer._parentContainer.getter();

  return (_UIGestureRecognizerContainer *)v3;
}

- (_TtCC7SwiftUI17HostingScrollView17PlatformContainer)initWithFrame:(CGRect)a3
{
  UIEdgeInsets result = (_TtCC7SwiftUI17HostingScrollView17PlatformContainer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end