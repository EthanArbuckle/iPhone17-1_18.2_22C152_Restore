@interface ContactsLimitedAccessPromptViewController
- (_TtC23LimitedAccessPromptView41ContactsLimitedAccessPromptViewController)initWithCoder:(id)a3;
- (_TtC23LimitedAccessPromptView41ContactsLimitedAccessPromptViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4;
- (void)viewDidLoad;
@end

@implementation ContactsLimitedAccessPromptViewController

- (unint64_t)supportedInterfaceOrientations
{
  v3 = self;
  v4 = self;
  id v5 = [v3 currentDevice];
  id v6 = [v5 userInterfaceIdiom];

  if (v6 == (id)1) {
    return 30;
  }
  else {
    return 2;
  }
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100018F70();
}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  id v6 = _Block_copy(a4);
  if (v6)
  {
    *(void *)(swift_allocObject() + 16) = v6;
    id v6 = sub_10001BBA4;
  }
  id v7 = a3;
  v8 = self;
  sub_10001AA14(a3);
  sub_10000C6B0((uint64_t)v6);
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    id v6 = sub_10001BA40;
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v6;
  *(void *)(v8 + 24) = v7;
  aBlock[4] = sub_10001B9B0;
  aBlock[5] = v8;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000C0FC;
  aBlock[3] = &unk_100029B40;
  v9 = _Block_copy(aBlock);
  v10 = self;
  sub_10001B9F8((uint64_t)v6);
  swift_release();
  v11.receiver = v10;
  v11.super_class = (Class)type metadata accessor for ContactsLimitedAccessPromptViewController();
  [(ContactsLimitedAccessPromptViewController *)&v11 dismissViewControllerAnimated:v4 completion:v9];
  _Block_release(v9);
  sub_10000C6B0((uint64_t)v6);
}

- (_TtC23LimitedAccessPromptView41ContactsLimitedAccessPromptViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC23LimitedAccessPromptView41ContactsLimitedAccessPromptViewController *)sub_1000198B4(v5, v7, a4);
}

- (_TtC23LimitedAccessPromptView41ContactsLimitedAccessPromptViewController)initWithCoder:(id)a3
{
  return (_TtC23LimitedAccessPromptView41ContactsLimitedAccessPromptViewController *)sub_100019A00(a3);
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  v3 = *(void **)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC23LimitedAccessPromptView41ContactsLimitedAccessPromptViewController_contentView];
}

@end