@interface RootViewController
- (_TtC22SubscribePageExtension18RootViewController)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension18RootViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation RootViewController

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v4 = (char *)v6.receiver;
  [(RootViewController *)&v6 viewWillAppear:v3];
  if (*(void *)&v4[OBJC_IVAR____TtC22SubscribePageExtension18RootViewController_childViewController])
  {
    self;
    v5 = (void *)swift_dynamicCastObjCClass();
    if (v5) {
      objc_msgSend(v5, "setNavigationBarHidden:", 1, v6.receiver, v6.super_class);
    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = sub_100759A70();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13.receiver = self;
  v13.super_class = ObjectType;
  v11 = self;
  [(RootViewController *)&v13 viewDidAppear:v3];
  *(void *)(swift_allocObject() + 16) = v11;
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v10, enum case for BootstrapPhase.initialBootstrap(_:), v6);
  v12 = v11;
  sub_100761E50();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);

  swift_release();
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v5 = [objc_allocWithZone((Class)type metadata accessor for SubscribePagePresentationController()) initWithPresentedViewController:a3 presentingViewController:a4];

  return v5;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v9 = objc_allocWithZone((Class)type metadata accessor for FadeInPresentationAnimator());
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  objc_super v13 = self;
  id v14 = [v9 init];

  return v14;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v5 = objc_allocWithZone((Class)type metadata accessor for FadeOutDismissalAnimator());
  id v6 = a3;
  uint64_t v7 = self;
  id v8 = [v5 init];

  return v8;
}

- (_TtC22SubscribePageExtension18RootViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_1007675F0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC22SubscribePageExtension18RootViewController *)sub_1005D8704(v5, v7, a4);
}

- (_TtC22SubscribePageExtension18RootViewController)initWithCoder:(id)a3
{
  return (_TtC22SubscribePageExtension18RootViewController *)sub_1005D8868(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension18RootViewController_childViewController));
  swift_release();
  swift_release();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC22SubscribePageExtension18RootViewController_dismissalCompletionHandler);

  sub_10001A4D0(v3);
}

@end