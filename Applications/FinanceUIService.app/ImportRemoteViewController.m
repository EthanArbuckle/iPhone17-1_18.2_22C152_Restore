@interface ImportRemoteViewController
- (_TtC16FinanceUIService26ImportRemoteViewController)initWithCoder:(id)a3;
- (_TtC16FinanceUIService26ImportRemoteViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dealloc;
- (void)loadView;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation ImportRemoteViewController

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ImportRemoteViewController();
  id v4 = v5.receiver;
  [(ImportRemoteViewController *)&v5 viewWillAppear:v3];
  sub_100009690();
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ImportRemoteViewController();
  id v4 = (char *)v5.receiver;
  [(ImportRemoteViewController *)&v5 viewWillDisappear:v3];
  if (*(void *)&v4[OBJC_IVAR____TtC16FinanceUIService26ImportRemoteViewController_daemonConnection])
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
  id v4 = self;
  id v5 = [v3 init];
  [(ImportRemoteViewController *)v4 setView:v5];

  id v6 = [(ImportRemoteViewController *)v4 view];
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
  if (*(void *)&self->_anon_0[OBJC_IVAR____TtC16FinanceUIService26ImportRemoteViewController_daemonConnection])
  {
    uint64_t v6 = *(void *)&self->_anon_0[OBJC_IVAR____TtC16FinanceUIService26ImportRemoteViewController_daemonConnection];
    id v3 = self;
    sub_1000068C8(&qword_1000193A0);
    sub_100008138();
    FinanceXPCConnection.invalidate()();
  }
  else
  {
    id v4 = self;
  }
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ImportRemoteViewController();
  [(ImportRemoteViewController *)&v5 dealloc];
}

- (void).cxx_destruct
{
  id v3 = &self->_anon_0[OBJC_IVAR____TtC16FinanceUIService26ImportRemoteViewController_log];
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(unsigned __int8 *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_10000B240(*(id *)&self->_anon_0[OBJC_IVAR____TtC16FinanceUIService26ImportRemoteViewController_controllerState]);

  swift_release();
}

- (_TtC16FinanceUIService26ImportRemoteViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC16FinanceUIService26ImportRemoteViewController *)sub_10000AF3C(v5, v7, a4);
}

- (_TtC16FinanceUIService26ImportRemoteViewController)initWithCoder:(id)a3
{
  return (_TtC16FinanceUIService26ImportRemoteViewController *)sub_10000B0A0(a3);
}

@end