@interface DeferredPageViewController
- (UINavigationItem)navigationItem;
- (_TtC27AppleMediaServicesUIDynamic26DeferredPageViewController)init;
- (_TtC27AppleMediaServicesUIDynamic26DeferredPageViewController)initWithCoder:(id)a3;
- (_TtC27AppleMediaServicesUIDynamic26DeferredPageViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)cancelButtonAction;
- (void)loadView;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation DeferredPageViewController

- (_TtC27AppleMediaServicesUIDynamic26DeferredPageViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1BF3F344C();
}

- (UINavigationItem)navigationItem
{
  v2 = self;
  id v3 = sub_1BF3F3518();

  return (UINavigationItem *)v3;
}

- (void)loadView
{
  v2 = self;
  sub_1BF3F35E8();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1BF3F36CC();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1BF3F3750();
}

- (void)cancelButtonAction
{
  v2 = self;
  sub_1BF3F4B58();
}

- (_TtC27AppleMediaServicesUIDynamic26DeferredPageViewController)init
{
}

- (_TtC27AppleMediaServicesUIDynamic26DeferredPageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1BF465FA8();
  }
  id v5 = a4;
  sub_1BF3F5044();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic26DeferredPageViewController_child));
  sub_1BF3F53B8((uint64_t)self + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic26DeferredPageViewController_destination, (void (*)(void))type metadata accessor for DeferredPageDestination);

  swift_release();
}

@end