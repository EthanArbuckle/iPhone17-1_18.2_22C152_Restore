@interface SelectAccountsViewController
- (_TtC16FinanceUIService28SelectAccountsViewController)initWithCoder:(id)a3;
- (_TtC16FinanceUIService28SelectAccountsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dealloc;
- (void)loadView;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SelectAccountsViewController

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_10000BC50(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SelectAccountsViewController();
  v4 = (char *)v5.receiver;
  [(SelectAccountsViewController *)&v5 viewWillDisappear:v3];
  if (*(void *)&v4[OBJC_IVAR____TtC16FinanceUIService28SelectAccountsViewController_daemonConnection])
  {
    swift_retain();
    ClientToServiceXPCConnection<>.cancelled()();

    swift_release();
  }
  else
  {
  }
}

- (void)loadView
{
  id v3 = objc_allocWithZone((Class)UIView);
  v4 = self;
  id v5 = [v3 init];
  [(SelectAccountsViewController *)v4 setView:v5];

  id v6 = [(SelectAccountsViewController *)v4 view];
  if (v6)
  {
    id v7 = v6;
    [v6 setHidden:1];
  }
  else
  {
    __break(1u);
  }
}

- (void)dealloc
{
  if (*(void *)&self->_anon_0[OBJC_IVAR____TtC16FinanceUIService28SelectAccountsViewController_daemonConnection])
  {
    uint64_t v6 = *(void *)&self->_anon_0[OBJC_IVAR____TtC16FinanceUIService28SelectAccountsViewController_daemonConnection];
    id v3 = self;
    sub_1000068C8(&qword_1000193E8);
    sub_100009530();
    FinanceXPCConnection.invalidate()();
  }
  else
  {
    v4 = self;
  }
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SelectAccountsViewController();
  [(SelectAccountsViewController *)&v5 dealloc];
}

- (void).cxx_destruct
{
  id v3 = &self->_anon_0[OBJC_IVAR____TtC16FinanceUIService28SelectAccountsViewController_log];
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(unsigned __int8 *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_10000B240(*(id *)&self->_anon_0[OBJC_IVAR____TtC16FinanceUIService28SelectAccountsViewController_controllerState]);

  swift_release();
}

- (_TtC16FinanceUIService28SelectAccountsViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC16FinanceUIService28SelectAccountsViewController *)sub_10000CE98(v5, v7, a4);
}

- (_TtC16FinanceUIService28SelectAccountsViewController)initWithCoder:(id)a3
{
  return (_TtC16FinanceUIService28SelectAccountsViewController *)sub_10000CFFC(a3);
}

@end