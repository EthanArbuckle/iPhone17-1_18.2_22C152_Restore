@interface StoreRootViewController
- (StoreRootViewControllerDelegate)delegate;
- (_TtC18ASMessagesProvider23StoreRootViewController)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider23StoreRootViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)openApp:(id)a3;
- (void)openURL:(id)a3 sourceApplication:(id)a4;
- (void)purchaseComplete:(id)a3;
- (void)setDelegate:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation StoreRootViewController

- (_TtC18ASMessagesProvider23StoreRootViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_77D670();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC18ASMessagesProvider23StoreRootViewController *)sub_746D84(v5, v7, a4);
}

- (_TtC18ASMessagesProvider23StoreRootViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_74C258();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_747288();
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for StoreRootViewController();
  v4 = v5.receiver;
  [(StoreRootViewController *)&v5 viewWillDisappear:v3];
  v4[OBJC_IVAR____TtC18ASMessagesProvider23StoreRootViewController_startedDisappearTransition] = 1;
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for StoreRootViewController();
  v4 = v6.receiver;
  [(StoreRootViewController *)&v6 viewDidDisappear:v3];
  uint64_t v5 = OBJC_IVAR____TtC18ASMessagesProvider23StoreRootViewController_startedDisappearTransition;
  if (v4[OBJC_IVAR____TtC18ASMessagesProvider23StoreRootViewController_startedDisappearTransition] == 1)
  {
    sub_74A0F8();
    v4[v5] = 0;
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for StoreRootViewController();
  id v4 = v5.receiver;
  [(StoreRootViewController *)&v5 viewDidAppear:v3];
  sub_749804();
}

- (StoreRootViewControllerDelegate)delegate
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (StoreRootViewControllerDelegate *)Strong;
}

- (void)setDelegate:(id)a3
{
}

- (void)purchaseComplete:(id)a3
{
}

- (void)openApp:(id)a3
{
}

- (void)openURL:(id)a3 sourceApplication:(id)a4
{
  uint64_t v6 = sub_76BC30();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_76BBF0();
  if (a4) {
    sub_77D670();
  }
  v10 = self;
  sub_74BD6C((uint64_t)v9);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider23StoreRootViewController_messagesAudioSessionCategory));
  sub_174B8((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider23StoreRootViewController_delegate);
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider23StoreRootViewController_rootViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider23StoreRootViewController_storeNavigationController));
  sub_14C88((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider23StoreRootViewController_storeTab, (uint64_t *)&unk_9606C0);

  swift_release();
}

@end