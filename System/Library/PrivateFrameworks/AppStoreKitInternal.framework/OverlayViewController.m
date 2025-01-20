@interface OverlayViewController
- (_TtC19AppStoreKitInternal21OverlayViewController)initWithCoder:(id)a3;
- (_TtC19AppStoreKitInternal21OverlayViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)viewDidLoad;
@end

@implementation OverlayViewController

- (_TtC19AppStoreKitInternal21OverlayViewController)initWithCoder:(id)a3
{
  result = (_TtC19AppStoreKitInternal21OverlayViewController *)sub_1E1D5D108();
  __break(1u);
  return result;
}

- (void)encodeWithCoder:(id)a3
{
}

- (void)viewDidLoad
{
  v2 = self;
  OverlayViewController.viewDidLoad()();
}

- (_TtC19AppStoreKitInternal21OverlayViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC19AppStoreKitInternal21OverlayViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal21OverlayViewController_overlayView));
}

@end