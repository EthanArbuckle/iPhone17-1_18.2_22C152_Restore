@interface JUContentUnavailableViewController
- (_TtC5JetUI34JUContentUnavailableViewController)initWithCoder:(id)a3;
- (_TtC5JetUI34JUContentUnavailableViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)viewDidLoad;
@end

@implementation JUContentUnavailableViewController

- (_TtC5JetUI34JUContentUnavailableViewController)initWithCoder:(id)a3
{
  result = (_TtC5JetUI34JUContentUnavailableViewController *)sub_1B086A6C8();
  __break(1u);
  return result;
}

- (void)encodeWithCoder:(id)a3
{
}

- (void)viewDidLoad
{
  v2 = self;
  JUContentUnavailableViewController.viewDidLoad()();
}

- (_TtC5JetUI34JUContentUnavailableViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC5JetUI34JUContentUnavailableViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5JetUI34JUContentUnavailableViewController_error));
  sub_1B0840328((uint64_t)self + OBJC_IVAR____TtC5JetUI34JUContentUnavailableViewController_presentationContext);
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC5JetUI34JUContentUnavailableViewController_retry);

  sub_1B07BDB64(v3);
}

@end