@interface AuthenticateAccountsFlowViewController
+ (BOOL)_isSecureForRemoteViewService;
- (_TtC18SharingViewService38AuthenticateAccountsFlowViewController)init;
- (_TtC18SharingViewService38AuthenticateAccountsFlowViewController)initWithCoder:(id)a3;
- (_TtC18SharingViewService38AuthenticateAccountsFlowViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)handleButtonActions:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation AuthenticateAccountsFlowViewController

- (_TtC18SharingViewService38AuthenticateAccountsFlowViewController)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (_TtC18SharingViewService26BaseProxFlowViewController *)((char *)&self->super
                                                              + OBJC_IVAR____TtC18SharingViewService38AuthenticateAccountsFlowViewController_presenter);
  _TtC18SharingViewService26BaseProxFlowViewController *v4 = 0;
  v4[1] = 0;
  v5 = (uint64_t (**)(uint64_t))((char *)&self->super
                                        + OBJC_IVAR____TtC18SharingViewService38AuthenticateAccountsFlowViewController_interactorGenerator);
  *v5 = sub_1000901D0;
  v5[1] = 0;
  v6 = (id (**)())((char *)&self->super
                 + OBJC_IVAR____TtC18SharingViewService38AuthenticateAccountsFlowViewController_routerGenerator);
  *v6 = sub_1000902E8;
  v6[1] = 0;
  v7 = (id (**)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)&self->super
                                                              + OBJC_IVAR____TtC18SharingViewService38AuthenticateAccountsFlowViewController_presenterGenerator);
  *v7 = sub_10009031C;
  v7[1] = 0;
  v9.receiver = self;
  v9.super_class = ObjectType;
  return [(BaseProxFlowViewController *)&v9 initWithNibName:0 bundle:0];
}

- (_TtC18SharingViewService38AuthenticateAccountsFlowViewController)initWithCoder:(id)a3
{
  v4 = (_TtC18SharingViewService26BaseProxFlowViewController *)((char *)&self->super
                                                              + OBJC_IVAR____TtC18SharingViewService38AuthenticateAccountsFlowViewController_presenter);
  _TtC18SharingViewService26BaseProxFlowViewController *v4 = 0;
  v4[1] = 0;
  id v5 = a3;

  result = (_TtC18SharingViewService38AuthenticateAccountsFlowViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  v6 = (void (*)(void))_Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    v6 = (void (*)(void))sub_100069EE0;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = a3;
  objc_super v9 = self;
  sub_1000904CC(a3, v6, v7);
  sub_100017C38((uint64_t)v6);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_100090944(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_100090B1C(a3);
}

- (void)handleButtonActions:(id)a3
{
  if (a3)
  {
    sub_100078988();
    sub_100069EE8();
    uint64_t v4 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v5 = v4;
    if (*(_TtC18SharingViewService26BaseProxFlowViewController *)((char *)&self->super
                                                                 + OBJC_IVAR____TtC18SharingViewService38AuthenticateAccountsFlowViewController_presenter))
    {
      if (v4)
      {
        v6 = self;
        swift_unknownObjectRetain();
        sub_1000F9218(v5);

        swift_bridgeObjectRelease();
        swift_unknownObjectRelease();
        return;
      }
LABEL_11:
      __break(1u);
      return;
    }
  }
  else if (*(_TtC18SharingViewService26BaseProxFlowViewController *)((char *)&self->super {
                                                                    + OBJC_IVAR____TtC18SharingViewService38AuthenticateAccountsFlowViewController_presenter))
  }
  {
    goto LABEL_11;
  }

  swift_bridgeObjectRelease();
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (_TtC18SharingViewService38AuthenticateAccountsFlowViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC18SharingViewService38AuthenticateAccountsFlowViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();

  swift_release();
}

@end