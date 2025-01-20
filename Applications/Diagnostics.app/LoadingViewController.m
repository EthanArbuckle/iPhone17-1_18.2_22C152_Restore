@interface LoadingViewController
- (_TtC11Diagnostics21LoadingViewController)initWithCoder:(id)a3;
- (_TtC11Diagnostics21LoadingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation LoadingViewController

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for LoadingViewController();
  [(BaseViewController *)&v2 viewDidLoad];
}

- (_TtC11Diagnostics21LoadingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC11Diagnostics21LoadingViewController *)sub_1000616FC(v5, v7, a4);
}

- (_TtC11Diagnostics21LoadingViewController)initWithCoder:(id)a3
{
  return (_TtC11Diagnostics21LoadingViewController *)sub_1000618C8(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics21LoadingViewController_loadingIndicator));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC11Diagnostics21LoadingViewController_loadingLabel);
}

@end