@interface HNDZoomViewController
- (HNDZoomViewController)initWithCoder:(id)a3;
- (HNDZoomViewController)initWithDelegate:(id)a3;
- (HNDZoomViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)zoomInAt:(CGPoint)a3 screenBounds:(CGRect)a4;
- (void)zoomOutAt:(CGPoint)a3 screenBounds:(CGRect)a4;
@end

@implementation HNDZoomViewController

- (HNDZoomViewController)initWithDelegate:(id)a3
{
  return (HNDZoomViewController *)sub_1000FD080();
}

- (HNDZoomViewController)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___HNDZoomViewController____lazy_storage___zoomView) = 0;
  id v5 = a3;

  result = (HNDZoomViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)zoomInAt:(CGPoint)a3 screenBounds:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double v8 = a3.y;
  double v9 = a3.x;
  v10 = self;
  id v11 = sub_1000FCEB0();
  swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  sub_100111790((void (*)(void))sub_1000FD598, v9, v8, x, y, width, height);

  swift_release_n();
}

- (void)zoomOutAt:(CGPoint)a3 screenBounds:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double v8 = a3.y;
  double v9 = a3.x;
  v10 = self;
  id v11 = sub_1000FCEB0();
  sub_1001122C0(v9, v8, x, y, width, height);

  swift_beginAccess();
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    [Strong didZoomOut];

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (HNDZoomViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (HNDZoomViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000FD54C((uint64_t)self + OBJC_IVAR___HNDZoomViewController_delegate);
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___HNDZoomViewController____lazy_storage___zoomView);
}

@end