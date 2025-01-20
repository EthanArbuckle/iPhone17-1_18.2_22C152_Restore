@interface RecentCallsViewController
+ (NSString)defaultPNGName;
- (BOOL)shouldSnapshot;
- (_TtC11MobilePhone25RecentCallsViewController)init;
- (_TtC11MobilePhone25RecentCallsViewController)initWithCoder:(id)a3;
- (_TtC11MobilePhone25RecentCallsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC11MobilePhone25RecentCallsViewController)initWithRecentsController:(id)a3;
- (void)dealloc;
- (void)recentsController:(id)a3 didChangeUnreadCallCount:(unint64_t)a4;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation RecentCallsViewController

- (_TtC11MobilePhone25RecentCallsViewController)initWithRecentsController:(id)a3
{
  return (_TtC11MobilePhone25RecentCallsViewController *)RecentCallsViewController.init(recentsController:)(a3);
}

- (_TtC11MobilePhone25RecentCallsViewController)init
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11MobilePhone25RecentCallsViewController_observers) = (Class)_swiftEmptyArrayStorage;

  result = (_TtC11MobilePhone25RecentCallsViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC11MobilePhone25RecentCallsViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11MobilePhone25RecentCallsViewController_observers) = (Class)_swiftEmptyArrayStorage;
  id v4 = a3;

  result = (_TtC11MobilePhone25RecentCallsViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)dealloc
{
  v2 = self;
  RecentCallsViewController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MobilePhone25RecentCallsViewController_observableRecentsController));

  swift_bridgeObjectRelease();
}

- (void)recentsController:(id)a3 didChangeUnreadCallCount:(unint64_t)a4
{
  id v6 = a3;
  v7 = self;
  RecentCallsViewController.updateTabBarItemBadge(count:)(a4);
}

- (void)viewDidLoad
{
  v2 = self;
  RecentCallsViewController.viewDidLoad()();
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = (char *)v5.receiver;
  [(RecentCallsViewController *)&v5 viewWillDisappear:v3];
  [*(id *)(*(void *)&v4[OBJC_IVAR____TtC11MobilePhone25RecentCallsViewController_observableRecentsController]+ OBJC_IVAR____TtC11MobilePhone27ObservableRecentsController_recentsController) markRecentCallsAsRead:v5.receiver, v5.super_class];
}

- (_TtC11MobilePhone25RecentCallsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC11MobilePhone25RecentCallsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

+ (NSString)defaultPNGName
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
}

- (BOOL)shouldSnapshot
{
  return 0;
}

@end