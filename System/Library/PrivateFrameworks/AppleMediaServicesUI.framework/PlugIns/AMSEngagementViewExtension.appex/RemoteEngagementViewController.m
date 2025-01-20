@interface RemoteEngagementViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (_TtC26AMSEngagementViewExtension30RemoteEngagementViewController)init;
- (_TtC26AMSEngagementViewExtension30RemoteEngagementViewController)initWithCoder:(id)a3;
- (_TtC26AMSEngagementViewExtension30RemoteEngagementViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)presentEngagementRequest:(id)a3 bagData:(id)a4 clientInfo:(id)a5 completion:(id)a6;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation RemoteEngagementViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_1000070A0();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1000073CC(a3, (SEL *)&selRef_viewWillAppear_, (uint64_t (*)(uint64_t, unint64_t))&ViewControllerPresenter.viewWillAppear());
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_1000071C0(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_100007284(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_1000073CC(a3, (SEL *)&selRef_viewDidDisappear_, (uint64_t (*)(uint64_t, unint64_t))&ViewControllerPresenter.viewDidDisappear());
}

+ (id)_exportedInterface
{
  id v2 = sub_1000074E8(&protocolRef_AMSUIEngagementTaskRemoteInterface);
  return v2;
}

+ (id)_remoteViewControllerInterface
{
  id v2 = sub_1000074E8(&protocolRef_AMSUIEngagementTaskHostInterface);
  return v2;
}

- (_TtC26AMSEngagementViewExtension30RemoteEngagementViewController)init
{
  return (_TtC26AMSEngagementViewExtension30RemoteEngagementViewController *)sub_100008B08();
}

- (_TtC26AMSEngagementViewExtension30RemoteEngagementViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_100009B78();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC26AMSEngagementViewExtension30RemoteEngagementViewController *)sub_100008BA0(v5, v7, a4);
}

- (_TtC26AMSEngagementViewExtension30RemoteEngagementViewController)initWithCoder:(id)a3
{
  return (_TtC26AMSEngagementViewExtension30RemoteEngagementViewController *)sub_100008CCC(a3);
}

- (void).cxx_destruct
{
}

- (void)presentEngagementRequest:(id)a3 bagData:(id)a4 clientInfo:(id)a5 completion:(id)a6
{
  v9 = _Block_copy(a6);
  id v10 = a3;
  id v11 = a5;
  v12 = self;
  if (a4)
  {
    id v13 = a4;
    a4 = (id)sub_1000099A8();
    unint64_t v15 = v14;
  }
  else
  {
    unint64_t v15 = 0xF000000000000000;
  }
  _Block_copy(v9);
  sub_100008DEC(a3, (uint64_t)a4, v15, a5, self, (void (**)(void, void))v9);
  _Block_release(v9);
  sub_1000093B4((uint64_t)a4, v15);
}

@end